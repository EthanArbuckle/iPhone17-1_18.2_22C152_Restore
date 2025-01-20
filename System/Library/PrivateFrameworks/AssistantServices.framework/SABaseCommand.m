@interface SABaseCommand
+ (BOOL)ad_shouldClassLogToMetrics;
- (BOOL)_adui_presentsUIResponseInTranscript;
- (BOOL)_adui_shouldBeHandledByAssistantd;
- (BOOL)ad_hasCallbacks;
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (BOOL)ad_requiresResponse;
- (BOOL)ad_sendReplyEvenIfCallbacksExist;
- (BOOL)ad_shouldBeHandledByClientAsResponseToCommand:(id)a3 fromPeer:(id)a4;
- (BOOL)ad_shouldIgnoreCallbacksOnReply;
- (BOOL)ad_shouldLogToMetrics;
- (BOOL)ad_willHaveReply;
- (SABaseCommand)ad_parentRequest;
- (id)ad_callbacks;
- (id)ad_deferredMetricsContext;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
- (int64_t)ad_getNetworkActivityTracingLabel;
- (int64_t)resultCallbackCode;
- (void)_adui_handleWithCompletion:(id)a3;
- (void)ad_setParentRequest:(id)a3;
@end

@implementation SABaseCommand

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  return 0;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  return 0;
}

- (BOOL)ad_requiresDeviceContext
{
  return 0;
}

- (int64_t)resultCallbackCode
{
  return -1;
}

- (id)ad_callbacks
{
  return 0;
}

- (BOOL)ad_shouldBeHandledByClientAsResponseToCommand:(id)a3 fromPeer:(id)a4
{
  return 0;
}

- (BOOL)ad_shouldIgnoreCallbacksOnReply
{
  return 0;
}

- (BOOL)ad_sendReplyEvenIfCallbacksExist
{
  return 0;
}

- (BOOL)ad_hasCallbacks
{
  return 0;
}

- (BOOL)_adui_presentsUIResponseInTranscript
{
  return 1;
}

- (void)_adui_handleWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, void *))a3;
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    v7 = "-[SABaseCommand(ADUIService) _adui_handleWithCompletion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s This command is not supposed to be handled by assistantd", (uint8_t *)&v6, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    v5 = +[AFError errorWithCode:100];
    v3[2](v3, 0, v5);
  }
LABEL_4:
}

- (BOOL)_adui_shouldBeHandledByAssistantd
{
  return 0;
}

- (int64_t)ad_getNetworkActivityTracingLabel
{
  return 0;
}

- (BOOL)ad_requiresResponse
{
  return 0;
}

- (id)ad_deferredMetricsContext
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(SABaseCommand *)self groupIdentifier];
  if (v4) {
    [v3 setObject:v4 forKey:@"groupIdentifier"];
  }

  v5 = [(SABaseCommand *)self encodedClassName];
  if (v5) {
    [v3 setObject:v5 forKey:@"classIdentifier"];
  }

  return v3;
}

- (BOOL)ad_shouldLogToMetrics
{
  v2 = objc_opt_class();
  return _objc_msgSend(v2, "ad_shouldClassLogToMetrics");
}

- (BOOL)ad_willHaveReply
{
  return 0;
}

- (void)ad_setParentRequest:(id)a3
{
}

- (SABaseCommand)ad_parentRequest
{
  return (SABaseCommand *)objc_getAssociatedObject(self, &unk_100586470);
}

+ (BOOL)ad_shouldClassLogToMetrics
{
  return 1;
}

@end