@interface QRSELFLoggingUtils
+ (BOOL)emitCCQREvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4;
+ (BOOL)emitCCQRFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4;
+ (BOOL)emitCCQRStartedEventWithMetadata:(id)a3;
+ (BOOL)emitQueryRewriteEvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4 byPredictorType:(int)a5;
+ (BOOL)emitQueryRewriteFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4 byPredictorType:(int)a5;
+ (BOOL)emitQueryRewriteStartedEventWithMetadata:(id)a3 byPredictorType:(int)a4;
+ (BOOL)emitRDEvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4;
+ (BOOL)emitRDFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4;
+ (BOOL)emitRDStartedEventWithMetadata:(id)a3;
+ (id)convertUUID:(id)a3;
+ (id)createCCQRContextEvaluatedEvent:(QRResponse *)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
+ (id)createCCQRContextEvaluatedTier1Event:(QRResponse *)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
+ (id)createCCQRContextEventWrapper:(id)a3 withMetaData:(id)a4;
+ (id)createEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithResultCandidateId:(id)a6 andWithRequester:(int)a7;
+ (id)createRDContextEvaluatedEvent:(QRResponse *)a3 withNLXMetadata:(id)a4;
+ (id)createRDContextEventWrapper:(id)a3 withMetaData:(id)a4;
+ (int)convertMarrsErrorCode:(int64_t)a3;
+ (int)convertRepetitionType:(int)a3;
+ (int)convertRewriteType:(int)a3;
+ (void)emitEvent:(id)a3;
@end

@implementation QRSELFLoggingUtils

+ (id)convertUUID:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8[1] = objc_msgSend(v3, "highInt", objc_msgSend(v3, "lowInt"));
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v8];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int)convertRewriteType:(int)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

+ (int)convertRepetitionType:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)convertMarrsErrorCode:(int64_t)a3
{
  if (a3 == 129) {
    return 1;
  }
  else {
    return 2 * (a3 == 137);
  }
}

+ (BOOL)emitRDFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0C20]);
  objc_msgSend(v7, "setReason:", objc_msgSend(a1, "convertMarrsErrorCode:", a4));
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0C10]);
  [v8 setFailed:v7];
  v9 = [a1 createRDContextEventWrapper:v8 withMetaData:v6];
  [a1 emitEvent:v9];

  return 1;
}

+ (BOOL)emitCCQRFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0BF8]);
  objc_msgSend(v7, "setReason:", objc_msgSend(a1, "convertMarrsErrorCode:", a4));
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0BE0]);
  [v8 setFailed:v7];
  v9 = [a1 createCCQRContextEventWrapper:v8 withMetaData:v6];
  [a1 emitEvent:v9];

  return 1;
}

+ (BOOL)emitQueryRewriteFailedEventWithMetadata:(id)a3 andErrorCode:(int64_t)a4 byPredictorType:(int)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    char v9 = [a1 emitRDFailedEventWithMetadata:v8 andErrorCode:a4];
    goto LABEL_5;
  }
  if (a5 == 4)
  {
    char v9 = [a1 emitCCQRFailedEventWithMetadata:v8 andErrorCode:a4];
LABEL_5:
    BOOL v10 = v9;
    goto LABEL_9;
  }
  v11 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    v14 = "+[QRSELFLoggingUtils emitQueryRewriteFailedEventWithMetadata:andErrorCode:byPredictorType:]";
    _os_log_debug_impl(&dword_1C9555000, v11, OS_LOG_TYPE_DEBUG, "%s Query rewrite SELF logging event with NoLogging type.", (uint8_t *)&v13, 0xCu);
  }

  BOOL v10 = 1;
LABEL_9:

  return v10;
}

+ (BOOL)emitRDEvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4
{
  id v6 = a4;
  memset(v10, 0, sizeof(v10));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v10, (long long *)a3->var0.var0, (long long *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  long long v7 = *(_OWORD *)&a3->var3;
  long long v11 = *(_OWORD *)&a3->var1;
  long long v12 = v7;
  int var5 = a3->var5;
  id v8 = [a1 createRDContextEvaluatedEvent:v10 withNLXMetadata:v6];
  v14 = (void **)v10;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100](&v14);
  [a1 emitEvent:v8];

  return 1;
}

+ (BOOL)emitCCQREvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4FA1378]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F29128]);
  char v9 = (void *)[v7 initWithNSUUID:v8];

  memset(v19, 0, sizeof(v19));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v19, (long long *)a3->var0.var0, (long long *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  long long v10 = *(_OWORD *)&a3->var3;
  long long v20 = *(_OWORD *)&a3->var1;
  long long v21 = v10;
  int var5 = a3->var5;
  long long v11 = [a1 createCCQRContextEvaluatedEvent:v19 withNLXMetadata:v6 andLinkId:v9];
  v23 = (void **)v19;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100](&v23);
  memset(v15, 0, sizeof(v15));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v15, (long long *)a3->var0.var0, (long long *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  long long v12 = *(_OWORD *)&a3->var3;
  long long v16 = *(_OWORD *)&a3->var1;
  long long v17 = v12;
  int v18 = a3->var5;
  int v13 = [a1 createCCQRContextEvaluatedTier1Event:v15 withNLXMetadata:v6 andLinkId:v9];
  v23 = (void **)v15;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100](&v23);
  [a1 emitEvent:v11];
  [a1 emitEvent:v13];

  return 1;
}

+ (BOOL)emitQueryRewriteEvaluatedEventWithResponse:(QRResponse *)a3 andNLXMetadata:(id)a4 byPredictorType:(int)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!a5)
  {
    memset(v14, 0, sizeof(v14));
    std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v14, (long long *)a3->var0.var0, (long long *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
    long long v15 = *(_OWORD *)&a3->var1;
    long long v16 = *(_OWORD *)&a3->var3;
    int var5 = a3->var5;
    char v9 = v14;
    char v10 = [a1 emitRDEvaluatedEventWithResponse:v14 andNLXMetadata:v8];
    goto LABEL_5;
  }
  if (a5 == 4)
  {
    memset(v18, 0, sizeof(v18));
    std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v18, (long long *)a3->var0.var0, (long long *)a3->var0.var1, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
    long long v19 = *(_OWORD *)&a3->var1;
    long long v20 = *(_OWORD *)&a3->var3;
    int v21 = a3->var5;
    char v9 = v18;
    char v10 = [a1 emitCCQREvaluatedEventWithResponse:v18 andNLXMetadata:v8];
LABEL_5:
    BOOL v11 = v10;
    *(void *)buf = v9;
    std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    goto LABEL_9;
  }
  long long v12 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "+[QRSELFLoggingUtils emitQueryRewriteEvaluatedEventWithResponse:andNLXMetadata:byPredictorType:]";
    _os_log_debug_impl(&dword_1C9555000, v12, OS_LOG_TYPE_DEBUG, "%s Query rewrite SELF logging event with NoLogging type.", buf, 0xCu);
  }

  BOOL v11 = 1;
LABEL_9:

  return v11;
}

+ (BOOL)emitRDStartedEventWithMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0C28]);
  [v5 setExists:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C10]);
  [v6 setStartedOrChanged:v5];
  id v7 = [a1 createRDContextEventWrapper:v6 withMetaData:v4];
  [a1 emitEvent:v7];

  return 1;
}

+ (BOOL)emitCCQRStartedEventWithMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0C08]);
  [v5 setExists:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0BE0]);
  [v6 setStartedOrChanged:v5];
  id v7 = [a1 createCCQRContextEventWrapper:v6 withMetaData:v4];
  [a1 emitEvent:v7];

  return 1;
}

+ (BOOL)emitQueryRewriteStartedEventWithMetadata:(id)a3 byPredictorType:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    char v7 = [a1 emitRDStartedEventWithMetadata:v6];
    goto LABEL_5;
  }
  if (a4 == 4)
  {
    char v7 = [a1 emitCCQRStartedEventWithMetadata:v6];
LABEL_5:
    BOOL v8 = v7;
    goto LABEL_9;
  }
  char v9 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    long long v12 = "+[QRSELFLoggingUtils emitQueryRewriteStartedEventWithMetadata:byPredictorType:]";
    _os_log_debug_impl(&dword_1C9555000, v9, OS_LOG_TYPE_DEBUG, "%s Query rewrite SELF logging event with NoLogging type.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v8 = 1;
LABEL_9:

  return v8;
}

+ (id)createCCQRContextEvaluatedTier1Event:(QRResponse *)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  var0 = a3->var0.var0;
  if (a3->var0.var1 != a3->var0.var0)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = (char *)var0 + v11;
      uint64_t v14 = (uint64_t)&var0->var1 + v11;
      if (v13[39] < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v14, *((void *)v13 + 3));
      }
      else
      {
        long long v15 = *(_OWORD *)v14;
        __p.__r_.__value_.__r.__words[2] = *(void *)(v14 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v15;
      }
      long long v16 = +[MarrsSiriNLUTypesConverter stdString2NSString:&__p];
      [v9 addObject:v16];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      ++v12;
      var0 = a3->var0.var0;
      v11 += 56;
    }
    while (v12 < 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4FA0BF0]);
  [v17 setRewrittenUserUtterances:v9];
  [v17 setLinkId:v8];
  id v18 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v18 setEventMetadata:v7];
  [v18 setMarrsQueryRewriteEvaluatedTier1:v17];

  return v18;
}

+ (id)createRDContextEvaluatedEvent:(QRResponse *)a3 withNLXMetadata:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0C18]);
  objc_msgSend(v7, "setRepetitionType:", objc_msgSend(a1, "convertRepetitionType:", a3->var1));
  double var2 = a3->var2;
  *(float *)&double var2 = var2;
  [v7 setFullRepetitionConfidence:var2];
  double var3 = a3->var3;
  *(float *)&double var3 = var3;
  [v7 setPartialRepetitionConfidence:var3];
  double var4 = a3->var4;
  *(float *)&double var4 = var4;
  [v7 setNoRepetitionConfidence:var4];
  id v11 = objc_alloc_init(MEMORY[0x1E4FA0C10]);
  [v11 setEnded:v7];
  unint64_t v12 = [a1 createRDContextEventWrapper:v11 withMetaData:v6];

  return v12;
}

+ (id)createCCQRContextEvaluatedEvent:(QRResponse *)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3->var0.var1 != a3->var0.var0)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4FA0C00]);
      [v13 setConfidence:*(double *)&a3->var0.var0->var1.var0.var1.var0[v11]];
      objc_msgSend(v13, "setRewriteType:", objc_msgSend(a1, "convertRewriteType:", LODWORD(a3->var0.var0->var1.var0.var1.var0[v11 + 1])));
      [v10 addObject:v13];

      ++v12;
      v11 += 7;
    }
    while (v12 < 0x6DB6DB6DB6DB6DB7 * (((char *)a3->var0.var1 - (char *)a3->var0.var0) >> 3));
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4FA0BE8]);
  [v14 setQueryRewriteHypotheses:v10];
  [v14 setLinkId:v9];
  id v15 = objc_alloc_init(MEMORY[0x1E4FA0BE0]);
  [v15 setEnded:v14];
  long long v16 = [a1 createCCQRContextEventWrapper:v15 withMetaData:v8];

  return v16;
}

+ (id)createRDContextEventWrapper:(id)a3 withMetaData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v7 setMarrsRepetitionDetectionContext:v5];
  [v7 setEventMetadata:v6];

  return v7;
}

+ (id)createCCQRContextEventWrapper:(id)a3 withMetaData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v7 setMarrsQueryRewriteContext:v5];
  [v7 setEventMetadata:v6];

  return v7;
}

+ (id)createEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithResultCandidateId:(id)a6 andWithRequester:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = QRLoggerForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315394;
    long long v19 = "+[QRSELFLoggingUtils createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:]";
    __int16 v20 = 1024;
    int v21 = v7;
    _os_log_debug_impl(&dword_1C9555000, v15, OS_LOG_TYPE_DEBUG, "%s Emitted event with requester type: %d", (uint8_t *)&v18, 0x12u);
  }

  long long v16 = +[NLXMetadataGenerator createEventMetadataWithNlId:v11 andWithTrpId:v12 andWithRequestId:v13 andWithResultCandidateId:v14 andWithRequester:v7];

  return v16;
}

+ (void)emitEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasEventMetadata]
    && ([v3 eventMetadata],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 hasNlId],
        v4,
        (v5 & 1) != 0))
  {
    id v6 = [MEMORY[0x1E4F9F9B0] sharedStream];
    [v6 emitMessage:v3];

    uint64_t v7 = QRLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v3 eventMetadata];
      id v9 = [v8 nlId];
      id v10 = [v9 toNSUUID];
      id v11 = [v10 UUIDString];
      int v12 = 136315394;
      id v13 = "+[QRSELFLoggingUtils emitEvent:]";
      __int16 v14 = 2080;
      uint64_t v15 = [v11 UTF8String];
      _os_log_debug_impl(&dword_1C9555000, v7, OS_LOG_TYPE_DEBUG, "%s Emitted event with NL ID: %s", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = QRLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      id v13 = "+[QRSELFLoggingUtils emitEvent:]";
      _os_log_debug_impl(&dword_1C9555000, v7, OS_LOG_TYPE_DEBUG, "%s Due to NL ID being Nil, this event won't be emitted.", (uint8_t *)&v12, 0xCu);
    }
  }
}

@end