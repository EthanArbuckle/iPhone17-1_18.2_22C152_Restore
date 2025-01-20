@interface QueryRewriter
- (NSString)locale;
- (QueryRewriter)initWithLocale:(id)a3 filesPath:(id)a4 predictorType:(int)a5 status:(id *)a6;
- (id).cxx_construct;
- (id)predictWithInput:(id)a3 status:(id *)a4;
- (void)setLocale:(id)a3;
@end

@implementation QueryRewriter

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_predictorName, 0);
  value = self->_plugin.__ptr_.__value_;
  self->_plugin.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void (**)(void))(*(void *)value + 16);
    v4();
  }
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (id)predictWithInput:(id)a3 status:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[MarrsSiriNLUTypesUtils emptyResponse];
  v7 = (void *)MEMORY[0x1E4FA2AF0];
  v8 = [v5 cdmRequestId];
  v9 = [v7 extractRequestLinkData:v8];

  if (v9)
  {
    v10 = [v5 nluRequestId];
    v26 = v9;
    v11 = [v9 trpId];
    v12 = [v9 targetUUID];
    v13 = [v5 resultCandidateId];
    v14 = [v5 cdmRequestId];
    v15 = +[QRSELFLoggingUtils createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](QRSELFLoggingUtils, "createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", v10, v11, v12, v13, [v14 requester]);

    v9 = v26;
  }
  else
  {
    v16 = QRLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[QueryRewriter predictWithInput:status:]";
      _os_log_error_impl(&dword_1C9555000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to generate metadata as RequestLinkData is nil", buf, 0xCu);
    }

    v15 = 0;
  }
  +[QRSELFLoggingUtils emitQueryRewriteStartedEventWithMetadata:v15 byPredictorType:self->_predictorType];
  v17 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    predictorName = self->_predictorName;
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[QueryRewriter predictWithInput:status:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = predictorName;
    _os_log_debug_impl(&dword_1C9555000, v17, OS_LOG_TYPE_DEBUG, "%s Self logging emitted started event for predictor type %@", buf, 0x16u);
  }

  value = self->_plugin.__ptr_.__value_;
  +[MarrsSiriNLUTypesConverter toPluginRequestObj:v5];
  (**(void (***)(unsigned char *__return_ptr, QRPredictor *, unsigned char *))value)(buf, value, v33);
  v32 = (void **)&v33[8];
  std::vector<marrs::qr::orchestration::QRInteraction>::__destroy_vector::operator()[abi:ne180100](&v32);
  v19 = +[MarrsSiriNLUTypesConverter fromPluginResponseObj:buf];

  memset(v28, 0, sizeof(v28));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v28, *(long long **)buf, *(long long **)&buf[8], 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3));
  long long v29 = v37;
  long long v30 = v38;
  int v31 = v39;
  +[QRSELFLoggingUtils emitQueryRewriteEvaluatedEventWithResponse:v28 andNLXMetadata:v15 byPredictorType:self->_predictorType];
  *(void *)v33 = v28;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100]((void ***)v33);
  v20 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v25 = self->_predictorName;
    *(_DWORD *)v33 = 136315394;
    *(void *)&v33[4] = "-[QueryRewriter predictWithInput:status:]";
    __int16 v34 = 2112;
    v35 = v25;
    _os_log_debug_impl(&dword_1C9555000, v20, OS_LOG_TYPE_DEBUG, "%s Self logging emitted evaluated event for predictor type %@", v33, 0x16u);
  }

  if (v39)
  {
    v21 = QRLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v33 = 136315138;
      *(void *)&v33[4] = "-[QueryRewriter predictWithInput:status:]";
      _os_log_debug_impl(&dword_1C9555000, v21, OS_LOG_TYPE_DEBUG, "%s Removing rewriteHypotheses as rewrite is not needed", v33, 0xCu);
    }

    v22 = [v19 rewriteHypotheses];
    [v22 removeAllObjects];
  }
  *(void *)v33 = buf;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100]((void ***)v33);
  +[PredictorUtils reportPredictStatusWithPredictorName:self->_predictorName domain:@"com.apple.siri.marrs.QueryRewrite" code:0 locale:self->_locale];
  if (a4)
  {
    *a4 = +[PredictorUtils getPredictStatusWithPredictorName:self->_predictorName domain:@"com.apple.siri.marrs.QueryRewrite" code:0];
  }

  return v19;
}

- (QueryRewriter)initWithLocale:(id)a3 filesPath:(id)a4 predictorType:(int)a5 status:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v15 = a4;
  v18.receiver = self;
  v18.super_class = (Class)QueryRewriter;
  v17 = [(QueryRewriter *)&v18 init];
  v17->_predictorType = a5;
  v9 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int buf = 136315394;
    buf_4 = "-[QueryRewriter initWithLocale:filesPath:predictorType:status:]";
    __int16 v21 = 1024;
    LODWORD(v22) = a5;
    _os_log_debug_impl(&dword_1C9555000, v9, OS_LOG_TYPE_DEBUG, "%s Marrs Predictor Initializing: Setting up type %d predictor", (uint8_t *)&buf, 0x12u);
  }

  v10 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int buf = 136315650;
    buf_4 = "-[QueryRewriter initWithLocale:filesPath:predictorType:status:]";
    __int16 v21 = 2112;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_debug_impl(&dword_1C9555000, v10, OS_LOG_TYPE_DEBUG, "%s Path: %@, locale: %@", (uint8_t *)&buf, 0x20u);
  }

  switch(a5)
  {
    case 0:
      +[MarrsSiriNLUTypesConverter NSString2StdString:v15];
      +[MarrsSiriNLUTypesConverter NSString2StdString:v16];
      operator new();
    case 1:
      +[MarrsSiriNLUTypesConverter NSString2StdString:v15];
      +[MarrsSiriNLUTypesConverter NSString2StdString:v16];
      operator new();
    case 2:
      +[MarrsSiriNLUTypesConverter NSString2StdString:v15];
      +[MarrsSiriNLUTypesConverter NSString2StdString:v16];
      operator new();
    case 3:
      +[MarrsSiriNLUTypesConverter NSString2StdString:v15];
      +[MarrsSiriNLUTypesConverter NSString2StdString:v16];
      operator new();
    case 4:
      +[MarrsSiriNLUTypesConverter NSString2StdString:v15];
      +[MarrsSiriNLUTypesConverter NSString2StdString:v16];
      operator new();
    default:
      [(QueryRewriter *)v17 setLocale:v16];
      v11 = QRLoggerForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int __p = 136315394;
        __p_4 = "-[QueryRewriter initWithLocale:filesPath:predictorType:status:]";
        __int16 __sz_4 = 1024;
        int __sz_6 = a5;
        _os_log_debug_impl(&dword_1C9555000, v11, OS_LOG_TYPE_DEBUG, "%s Marrs Predictor Initializing: %d predictor setup complete", (uint8_t *)&__p, 0x12u);
      }

      +[PredictorUtils reportInitStatusWithPredictorName:v17->_predictorName domain:@"com.apple.siri.marrs.QueryRewrite" code:0 locale:v16];
      if (a6)
      {
        *a6 = +[PredictorUtils getInitStatusWithPredictorName:v17->_predictorName domain:@"com.apple.siri.marrs.QueryRewrite" code:0];
      }
      v12 = v17;

      return v12;
  }
}

@end