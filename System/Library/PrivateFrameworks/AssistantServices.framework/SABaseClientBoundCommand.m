@interface SABaseClientBoundCommand
- (BOOL)ad_hasCallbacks;
- (BOOL)ad_requiresResponse;
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (id)_ad_alarmResponseForResponse:(id)a3;
- (id)_ad_preheatableDomain;
- (id)_ad_replyCommandValue;
- (id)_ad_settingsRequestRepresentation;
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
- (id)_ad_transformedHealthSuccessResponse;
- (id)_ad_transformedMailSuccessResponse;
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
- (id)_ad_transformedSendEmailRequest;
- (id)_ad_transformedShowActivityRequest;
- (id)_ad_transformedWorkoutRequest;
- (id)_ad_transformedWorkoutSuccessResponse;
- (id)ad_OTTRequestRepresentation;
- (id)ad_aceResponseCommandGenericErrorRepresentation;
- (id)ad_aceResponseCommandRepresentationWithErrorCode:(int64_t)a3 reason:(id)a4;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3;
- (void)_ad_getOTTRepresentationWithCompletionHandler:(id)a3;
- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4;
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SABaseClientBoundCommand

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = objc_alloc_init((Class)SACommandFailed);
  return v3;
}

- (id)_ad_timerRequestRepresentation
{
  return 0;
}

- (id)_ad_transformedHealthSuccessResponse
{
  return 0;
}

- (id)_ad_transformedShowActivityRequest
{
  return 0;
}

- (id)_ad_transformedMailSuccessResponse
{
  return 0;
}

- (id)_ad_transformedSendEmailRequest
{
  return 0;
}

- (id)_ad_transformedMapsSuccessResponse
{
  return 0;
}

- (id)_ad_transformedMapsRequest
{
  return 0;
}

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  if (a4)
  {
    uint64_t v5 = kAFAssistantErrorDomain;
    id v6 = a4;
    id v7 = +[NSError errorWithDomain:v5 code:700 userInfo:0];
    (*((void (**)(id, void, void, id))a4 + 2))(v6, 0, 0, v7);
  }
}

- (id)_ad_replyCommandValue
{
  return 0;
}

- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (id)_ad_transformedWorkoutSuccessResponse
{
  return 0;
}

- (id)_ad_transformedWorkoutRequest
{
  return 0;
}

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  return 0;
}

- (id)_ad_settingsRequestRepresentation
{
  id v3 = objc_alloc((Class)NSException);
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to generate settings request representation for %@", self];
  id v5 = [v3 initWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)ad_hasCallbacks
{
  return [(SABaseClientBoundCommand *)self hasArrayForPropertyForKey:SABaseClientBoundCommandCallbacksPListKey];
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  return 0;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
}

- (id)ad_aceResponseCommandGenericErrorRepresentation
{
  return [(SABaseClientBoundCommand *)self ad_aceResponseCommandRepresentationWithErrorCode:SAGenericErrorErrorCode reason:0];
}

- (id)ad_aceResponseCommandRepresentationWithErrorCode:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)SACommandFailed);
  v8 = [(SABaseClientBoundCommand *)self aceId];
  [v7 setRefId:v8];

  [v7 setErrorCode:a3];
  [v7 setReason:v6];

  return v7;
}

- (id)_ad_preheatableDomain
{
  return 0;
}

- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315394;
    v11 = "-[SABaseClientBoundCommand(ADAceDomainSignalRequestHandler) _ad_handleAceDomainSignalRequest:completionHandler:]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s ACE domain signal request handler asked to handle request %@, but didn't know how", (uint8_t *)&v10, 0x16u);
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v7)
  {
LABEL_3:
    v9 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:700 userInfo:0];
    v7[2](v7, 0, v9);
  }
LABEL_4:
}

- (void)_ad_getOTTRepresentationWithCompletionHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(SABaseClientBoundCommand *)self ad_OTTRequestRepresentation];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)ad_OTTRequestRepresentation
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SABaseClientBoundCommand(ADMessageTransformer) ad_OTTRequestRepresentation]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s No OTT-request representation for %@", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (BOOL)ad_requiresResponse
{
  return [(SABaseClientBoundCommand *)self requiresResponse];
}

@end