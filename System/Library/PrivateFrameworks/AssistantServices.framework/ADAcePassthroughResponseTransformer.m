@interface ADAcePassthroughResponseTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
@end

@implementation ADAcePassthroughResponseTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      objc_msgSend(v9, "ad_aceResponseCommandRepresentationWithErrorCode:reason:", objc_msgSend(v8, "code"), 0);
    }
    else {
    uint64_t v10 = [v7 replyCommand];
    }
  }
  else
  {
    v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[ADAcePassthroughResponseTransformer aceCommandForSiriResponse:responseError:forRequestCommand:]";
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Unexpected response %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v10 = objc_msgSend(v9, "ad_aceResponseCommandGenericErrorRepresentation");
  }
  v12 = (void *)v10;

  return v12;
}

@end