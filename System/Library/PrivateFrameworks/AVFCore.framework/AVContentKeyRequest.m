@interface AVContentKeyRequest
+ (BOOL)_prepareCryptor:(OpaqueFigCPECryptor *)a3 forRenewal:(BOOL)a4 andReturnKeyRequestID:(unint64_t *)a5 isInchargeOfKeyRequest:(BOOL *)a6 error:(id *)a7;
+ (id)_createKeyRequestDictionaryForApp:(id)a3 persistentKey:(id)a4 serverChallenge:(id)a5 cryptorKeyRequestID:(unint64_t)a6 purpose:(int)a7;
+ (id)_ensureProtocolVersionList:(id)a3;
+ (id)_mergePreloadingRequestOptions:(id)a3 withCreateKeyRequestOptions:(id)a4;
+ (void)_validateHLSEncryptionMethod:(id)a3;
+ (void)_validateProtocolVersionList:(id)a3;
+ (void)_validateServerChallenge:(id)a3;
- (AVContentKey)contentKey;
- (AVContentKeyRequest)initWithContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 useContentKeyBoss:(BOOL)a5 keySpecifier:(OpaqueFigContentKeySpecifier *)a6 initializationData:(id)a7 keyIDFromInitializationData:(id)a8 contentIdentifier:(id)a9 isRenewalRequest:(BOOL)a10 requestID:(unint64_t)a11 providesPersistableKey:(BOOL)a12 preloadingRequestOptions:(id)a13 identifier:(id)a14 supportsOfflineKey:(BOOL)a15;
- (AVContentKeyRequest)initWithContentKeySession:(id)a3 reportGroup:(id)a4 customURLHandler:(OpaqueFigCustomURLHandler *)a5 identifier:(id)a6 requestInfo:(__CFDictionary *)a7 requestID:(unint64_t)a8 providesPersistableKey:(BOOL)a9 isRenewalRequest:(BOOL)a10;
- (AVContentKeyRequest)initWithContentKeySession:(id)a3 reportGroup:(id)a4 identifier:(id)a5 contentIdentifier:(id)a6 keyIDFromInitializationData:(id)a7 initializationData:(id)a8 preloadingRequestOptions:(id)a9 providesPersistableKey:(BOOL)a10;
- (AVContentKeyRequestStatus)status;
- (AVContentKeySpecifier)contentKeySpecifier;
- (BOOL)_canRespondByRequestingPersistableContentKeyRequest;
- (BOOL)_prepareForKeyRenewalReturningError:(id *)a3;
- (BOOL)_processContentKeyResponse:(id)a3 renewalDate:(id)a4 initializationVector:(id)a5 error:(id *)a6;
- (BOOL)canProvidePersistableContentKey;
- (BOOL)ensureCryptorWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4;
- (BOOL)processContentKeyResponseData:(id)a3 renewalDate:(id)a4 error:(id *)a5;
- (BOOL)renewsExpiringResponseData;
- (BOOL)respondByRequestingPersistableContentKeyRequestAndReturnError:(NSError *)outError;
- (BOOL)setReportGroup:(id)a3;
- (BOOL)willOutputBeObscuredDueToInsufficientExternalProtectionForDisplays:(id)a3;
- (NSData)initializationData;
- (NSDictionary)options;
- (NSError)error;
- (OpaqueFigCPECryptor)figCryptor;
- (OpaqueFigContentKeyBoss)_copyContentKeyBoss;
- (id)_getRetryReasonForError:(int)a3;
- (id)_keySystem;
- (id)_makeStreamingContentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 error:(id *)a6;
- (id)contentIdentifier;
- (id)contentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 error:(id *)a6;
- (id)description;
- (id)identifier;
- (id)identifierString;
- (id)keyIDFromInitializationData;
- (id)session;
- (int)_encryptionMethod;
- (int64_t)externalContentProtectionStatus;
- (unint64_t)_requestID;
- (void)_clearContext;
- (void)_copyAndStoreCryptorUUID;
- (void)_finishLoadingCustomURLRequestWithError:(id)a3;
- (void)_finishLoadingCustomURLRequestWithResponseData:(id)a3 renewalDate:(id)a4;
- (void)_handleKeyResponseError:(id)a3;
- (void)_handleKeyResponseSuccessWithCryptor:(OpaqueFigCPECryptor *)a3;
- (void)_processContentKeyResponseError:(id)a3;
- (void)_sendResponseInfoToCustomURLHandlerWithRenewalDate:(id)a3;
- (void)_setError:(id)a3;
- (void)_setStatus:(int64_t)a3;
- (void)dealloc;
- (void)makeStreamingContentKeyRequestDataForApp:(NSData *)appIdentifier contentIdentifier:(NSData *)contentIdentifier options:(NSDictionary *)options completionHandler:(void *)handler;
- (void)processContentKeyResponse:(AVContentKeyResponse *)keyResponse;
- (void)processContentKeyResponseData:(id)a3;
- (void)processContentKeyResponseError:(NSError *)error;
- (void)renewExpiringContentKeyResponseData;
- (void)respondByRequestingPersistableContentKeyRequest;
@end

@implementation AVContentKeyRequest

- (AVContentKeyRequest)initWithContentKeySession:(id)a3 reportGroup:(id)a4 identifier:(id)a5 contentIdentifier:(id)a6 keyIDFromInitializationData:(id)a7 initializationData:(id)a8 preloadingRequestOptions:(id)a9 providesPersistableKey:(BOOL)a10
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)AVContentKeyRequest;
  v17 = [(AVContentKeyRequest *)&v31 init];
  if (!v17) {
    goto LABEL_18;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "keySystem"), "isEqual:", @"FairPlayStreaming") & 1) == 0 && a10)
  {
    v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    uint64_t v24 = [a3 keySystem];
    v30 = (void *)[v22 exceptionWithName:v23, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v17, a2, @"%@ does not support key persistence", v25, v26, v27, v28, v29, v24), 0 reason userInfo];
    objc_exception_throw(v30);
  }
  id v18 = a9;
  +[AVContentKeyRequest _validateProtocolVersionList:](AVContentKeyRequest, "_validateProtocolVersionList:", [a9 objectForKeyedSubscript:@"ProtocolVersionsKey"]);
  +[AVContentKeyRequest _validateHLSEncryptionMethod:](AVContentKeyRequest, "_validateHLSEncryptionMethod:", [a9 objectForKeyedSubscript:@"HLSMethodKey"]);
  v19 = objc_alloc_init(AVContentKeyRequestInternal);
  v17->_contentKeyRequest = v19;
  if (v19)
  {
    v19->status = 0;
    objc_storeWeak((id *)&v17->_contentKeyRequest->weakSession, a3);
    v17->_contentKeyRequest->reportGroup = (AVContentKeyReportGroup *)a4;
    v17->_contentKeyRequest->identifier = (id)[a5 copy];
    v17->_contentKeyRequest->initializationData = (NSData *)[a8 copy];
    v17->_contentKeyRequest->providesPersistableKey = a10;
    v17->_contentKeyRequest->preloadingRequestOptions = (NSDictionary *)[a9 copy];
    v17->_contentKeyRequest->isRenewalRequest = 0;
    v17->_contentKeyRequest->stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (!a9) {
      id v18 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
    }
    if (a5) {
      v17->_contentKeyRequest->contentKeySpecifier = (AVContentKeySpecifier *)-[AVContentKeySpecifier initForKeySystem:identifier:initializationData:options:]([AVContentKeySpecifier alloc], "initForKeySystem:identifier:initializationData:options:", [a3 keySystem], a5, a8, v18);
    }
    v17->_contentKeyRequest->contentKey = 0;
    v17->_contentKeyRequest->contentIdentifier = (NSData *)[a6 copy];
    v17->_contentKeyRequest->keyIDFromInitializationData = (NSData *)[a7 copy];
    if (dword_1E9356A90)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
LABEL_18:
    if (FigSignalErrorAt())
    {

      return 0;
    }
  }
  return v17;
}

+ (BOOL)_prepareCryptor:(OpaqueFigCPECryptor *)a3 forRenewal:(BOOL)a4 andReturnKeyRequestID:(unint64_t *)a5 isInchargeOfKeyRequest:(BOOL *)a6 error:(id *)a7
{
  if (!a3)
  {
    signed int v15 = 0;
    return v15 == 0;
  }
  if (a4) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 1;
  }
  v12 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  if (*v13 >= 6uLL
    && (v14 = (uint64_t (*)(OpaqueFigCPECryptor *, uint64_t, uint64_t, BOOL *, unint64_t *))v13[20]) != 0)
  {
    signed int v15 = v14(a3, v11, 2, a6, a5);
    if (!a7) {
      return v15 == 0;
    }
  }
  else
  {
    signed int v15 = -12782;
    if (!a7) {
      return v15 == 0;
    }
  }
  if (v15)
  {
    *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v15, 0);
    signed int v15 = 1;
  }
  return v15 == 0;
}

- (void)_copyAndStoreCryptorUUID
{
  if (objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", @"FairPlayStreaming"))
  {

    self->_contentKeyRequest->cryptorUUID = 0;
    contentKeyRequest = self->_contentKeyRequest;
    figCryptor = contentKeyRequest->figCryptor;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    v7 = *(unsigned int (**)(OpaqueFigCPECryptor *, void, void, NSString **))(v6 + 48);
    if (v7)
    {
      if (!v7(figCryptor, *MEMORY[0x1E4F1FE10], *MEMORY[0x1E4F1CF80], &contentKeyRequest->cryptorUUID))
      {
        id v8 = [(AVContentKeyRequest *)self session];
        cryptorUUID = self->_contentKeyRequest->cryptorUUID;
        [v8 _setWeakReferenceForContentKeyRequest:self withCryptorUUID:cryptorUUID];
      }
    }
  }
}

- (AVContentKeyRequest)initWithContentKeySession:(id)a3 reportGroup:(id)a4 customURLHandler:(OpaqueFigCustomURLHandler *)a5 identifier:(id)a6 requestInfo:(__CFDictionary *)a7 requestID:(unint64_t)a8 providesPersistableKey:(BOOL)a9 isRenewalRequest:(BOOL)a10
{
  LOBYTE(v19) = a9;
  v13 = [(AVContentKeyRequest *)self initWithContentKeySession:a3 reportGroup:a4 identifier:a6 contentIdentifier:0 keyIDFromInitializationData:0 initializationData:0 preloadingRequestOptions:0 providesPersistableKey:v19];
  if (!v13)
  {
    if (!FigSignalErrorAt()) {
      return 0;
    }
LABEL_5:

    return 0;
  }
  if (a5) {
    v14 = (OpaqueFigCustomURLHandler *)CFRetain(a5);
  }
  else {
    v14 = 0;
  }
  v13->_contentKeyRequest->customURLHandler = v14;
  if (a7) {
    signed int v15 = (__CFDictionary *)CFRetain(a7);
  }
  else {
    signed int v15 = 0;
  }
  v13->_contentKeyRequest->requestInfo = v15;
  v13->_contentKeyRequest->customURLRequestID = a8;
  v13->_contentKeyRequest->responseParamsSent = 0;
  v13->_contentKeyRequest->isRenewalRequest = a10;
  if (FigCustomURLRequestInfoCopyCryptor())
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_5;
  }
  [(AVContentKeyRequest *)v13 _copyAndStoreCryptorUUID];
  FigCustomURLRequestInfoGetCryptorKeyRequestID();
  if (dword_1E9356A90)
  {
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v13;
}

- (AVContentKeyRequest)initWithContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 useContentKeyBoss:(BOOL)a5 keySpecifier:(OpaqueFigContentKeySpecifier *)a6 initializationData:(id)a7 keyIDFromInitializationData:(id)a8 contentIdentifier:(id)a9 isRenewalRequest:(BOOL)a10 requestID:(unint64_t)a11 providesPersistableKey:(BOOL)a12 preloadingRequestOptions:(id)a13 identifier:(id)a14 supportsOfflineKey:(BOOL)a15
{
  LOBYTE(v22) = a12;
  v17 = [(AVContentKeyRequest *)self initWithContentKeySession:a3 reportGroup:0 identifier:a14 contentIdentifier:a9 keyIDFromInitializationData:a8 initializationData:a7 preloadingRequestOptions:a13 providesPersistableKey:v22];
  id v18 = v17;
  if (v17)
  {
    v17->_contentKeyRequest->requestID = a11;
    v17->_contentKeyRequest->isRenewalRequest = a10;
    if (a6) {
      uint64_t v19 = (OpaqueFigContentKeySpecifier *)CFRetain(a6);
    }
    else {
      uint64_t v19 = 0;
    }
    v18->_contentKeyRequest->keySpecifier = v19;
    v18->_contentKeyRequest->weakContentKeyBoss = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v18->_contentKeyRequest->useContentKeyBoss = a5;
    v18->_contentKeyRequest->supportsOfflineKey = a15;
    if (dword_1E9356A90)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  return v18;
}

- (void)dealloc
{
  contentKeyRequest = self->_contentKeyRequest;
  figCryptor = contentKeyRequest->figCryptor;
  if (figCryptor)
  {
    CFRelease(figCryptor);
    contentKeyRequest = self->_contentKeyRequest;
  }
  customURLHandler = contentKeyRequest->customURLHandler;
  if (customURLHandler)
  {
    CFRelease(customURLHandler);
    contentKeyRequest = self->_contentKeyRequest;
  }
  requestInfo = contentKeyRequest->requestInfo;
  if (requestInfo)
  {
    CFRelease(requestInfo);
    contentKeyRequest = self->_contentKeyRequest;
  }
  weakContentKeyBoss = contentKeyRequest->weakContentKeyBoss;
  if (weakContentKeyBoss)
  {
    CFRelease(weakContentKeyBoss);
    contentKeyRequest = self->_contentKeyRequest;
  }
  keySpecifier = contentKeyRequest->keySpecifier;
  if (keySpecifier) {
    CFRelease(keySpecifier);
  }
  FigSimpleMutexDestroy();

  v9.receiver = self;
  v9.super_class = (Class)AVContentKeyRequest;
  [(AVContentKeyRequest *)&v9 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p status:%d>", NSStringFromClass(v4), self, self->_contentKeyRequest->status];
}

- (id)_keySystem
{
  id v2 = [(AVContentKeyRequest *)self session];
  return (id)[v2 keySystem];
}

- (unint64_t)_requestID
{
  MEMORY[0x199715030](self->_contentKeyRequest->stateMutex, a2);
  contentKeyRequest = self->_contentKeyRequest;
  unint64_t requestID = contentKeyRequest->requestID;
  MEMORY[0x199715040](contentKeyRequest->stateMutex);
  return requestID;
}

- (OpaqueFigContentKeyBoss)_copyContentKeyBoss
{
  result = (OpaqueFigContentKeyBoss *)self->_contentKeyRequest->weakContentKeyBoss;
  if (result) {
    return (OpaqueFigContentKeyBoss *)MEMORY[0x1F40DCCA0](result, a2);
  }
  return result;
}

- (id)identifier
{
  contentKeyRequest = self->_contentKeyRequest;
  id result = contentKeyRequest->keyIDFromInitializationData;
  if (!result) {
    return contentKeyRequest->identifier;
  }
  return result;
}

- (id)identifierString
{
  return self->_contentKeyRequest->identifier;
}

- (NSData)initializationData
{
  return self->_contentKeyRequest->initializationData;
}

- (AVContentKeyRequestStatus)status
{
  return self->_contentKeyRequest->status;
}

- (NSDictionary)options
{
  id result = self->_contentKeyRequest->preloadingRequestOptions;
  if (!result) {
    return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionary];
  }
  return result;
}

- (int)_encryptionMethod
{
  return MEMORY[0x1F40ED488](self->_contentKeyRequest->keySpecifier, a2);
}

- (void)_setStatus:(int64_t)a3
{
  uint64_t v5 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  MEMORY[0x199715030](self->_contentKeyRequest->stateMutex);
  contentKeyRequest = self->_contentKeyRequest;
  int64_t status = contentKeyRequest->status;
  if (status <= 3 && status != a3)
  {
    if (status <= a3) {
      int64_t status = a3;
    }
    contentKeyRequest->int64_t status = status;
    contentKeyRequest = self->_contentKeyRequest;
    if (contentKeyRequest->status == 1)
    {
      if ([(AVContentKeyRequest *)self figCryptor])
      {
        objc_super v9 = [(AVContentKeyRequest *)self contentKeySpecifier];
        contentKeyRequest = self->_contentKeyRequest;
        if (v9 && !contentKeyRequest->contentKey)
        {
          self->_contentKeyRequest->contentKey = [[AVContentKey alloc] initWithSpecifier:[(AVContentKeyRequest *)self contentKeySpecifier] cryptor:[(AVContentKeyRequest *)self figCryptor] contentKeyBoss:v5 contentKeySpecifier:self->_contentKeyRequest->keySpecifier];
          MEMORY[0x199715040](self->_contentKeyRequest->stateMutex);
          if (v5) {
            CFRelease(v5);
          }
          id v10 = [(AVContentKeyRequest *)self session];
          contentKey = self->_contentKeyRequest->contentKey;
          [v10 contentKeyRequestDidProduceContentKey:contentKey];
          return;
        }
      }
      else
      {
        contentKeyRequest = self->_contentKeyRequest;
      }
    }
  }
  MEMORY[0x199715040](contentKeyRequest->stateMutex);
  if (v5)
  {
    CFRelease(v5);
  }
}

- (void)_clearContext
{
  contentKeyRequest = self->_contentKeyRequest;
  customURLHandler = contentKeyRequest->customURLHandler;
  if (customURLHandler)
  {
    CFRelease(customURLHandler);
    self->_contentKeyRequest->customURLHandler = 0;
    contentKeyRequest = self->_contentKeyRequest;
  }
  requestInfo = contentKeyRequest->requestInfo;
  if (requestInfo)
  {
    CFRelease(requestInfo);
    self->_contentKeyRequest->requestInfo = 0;
    contentKeyRequest = self->_contentKeyRequest;
  }
  contentKeyRequest->customURLRequestID = 0;
}

- (BOOL)_prepareForKeyRenewalReturningError:(id *)a3
{
  [(AVContentKeyRequest *)self _clearContext];
  self->_contentKeyRequest->isRenewalRequest = 1;
  contentKeyRequest = self->_contentKeyRequest;
  figCryptor = contentKeyRequest->figCryptor;
  return +[AVContentKeyRequest _prepareCryptor:figCryptor forRenewal:1 andReturnKeyRequestID:&contentKeyRequest->cryptorKeyRequestID isInchargeOfKeyRequest:&contentKeyRequest->isInchargeOfKeyRequest error:a3];
}

- (BOOL)renewsExpiringResponseData
{
  return self->_contentKeyRequest->isRenewalRequest;
}

- (NSError)error
{
  return self->_contentKeyRequest->error;
}

- (void)_setError:(id)a3
{
  [(AVContentKeyRequest *)self _setStatus:5];
  MEMORY[0x199715030](self->_contentKeyRequest->stateMutex);
  if (self->_contentKeyRequest->error)
  {
    JUMPOUT(0x199715040);
  }
  self->_contentKeyRequest->error = (NSError *)[a3 copy];
  MEMORY[0x199715040](self->_contentKeyRequest->stateMutex);
  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->customURLHandler)
  {
    [(AVContentKeyRequest *)self _finishLoadingCustomURLRequestWithError:contentKeyRequest->error];
  }
  else
  {
    figCryptor = contentKeyRequest->figCryptor;
    if (figCryptor && contentKeyRequest->isInchargeOfKeyRequest)
    {
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v9 = v8 ? v8 : 0;
      id v10 = *(void (**)(OpaqueFigCPECryptor *, void, id))(v9 + 56);
      if (v10) {
        v10(figCryptor, *MEMORY[0x1E4F1FDC0], a3);
      }
    }
  }
  id v6 = [(AVContentKeyRequest *)self session];
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__AVContentKeyRequest__setError___block_invoke;
    v11[3] = &unk_1E57B7798;
    v11[4] = v6;
    v11[5] = self;
    [v6 _invokeDelegateCallbackWithBlock:v11 synchronouslyWhenDelegateQueueIsNULL:0];
  }
}

uint64_t __33__AVContentKeyRequest__setError___block_invoke(uint64_t result, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    id result = objc_opt_respondsToSelector();
    if (result)
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return [a2 contentKeySession:*(void *)(v3 + 32) contentKeyRequest:v5 didFailWithError:v6];
    }
  }
  return result;
}

- (BOOL)canProvidePersistableContentKey
{
  return self->_contentKeyRequest->providesPersistableKey;
}

- (AVContentKeySpecifier)contentKeySpecifier
{
  return self->_contentKeyRequest->contentKeySpecifier;
}

- (AVContentKey)contentKey
{
  return self->_contentKeyRequest->contentKey;
}

- (OpaqueFigCPECryptor)figCryptor
{
  return self->_contentKeyRequest->figCryptor;
}

- (id)session
{
  return objc_loadWeak((id *)&self->_contentKeyRequest->weakSession);
}

- (id)keyIDFromInitializationData
{
  return self->_contentKeyRequest->keyIDFromInitializationData;
}

- (id)contentIdentifier
{
  return self->_contentKeyRequest->contentIdentifier;
}

- (id)_getRetryReasonForError:(int)a3
{
  if (a3 <= -42670)
  {
    if (a3 != -42800)
    {
      if (a3 == -42799) {
        return @"ReceivedObsoleteKeyResponse";
      }
      else {
        return 0;
      }
    }
    return @"ReceivedKeyResponseWithExpiredLease";
  }
  if (a3 == -42668) {
    return @"ReceivedKeyResponseWithExpiredLease";
  }
  if (a3 == -42669) {
    return @"ReceivedKeyResponseAfterSPCTimedOut";
  }
  else {
    return 0;
  }
}

- (void)_handleKeyResponseError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 code])
  {
    id v5 = -[AVContentKeyRequest _getRetryReasonForError:](self, "_getRetryReasonForError:");
    if (v5)
    {
      id v6 = v5;
      if (dword_1E9356A90)
      {
        int v13 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v8 = [(AVContentKeyRequest *)self session];
      if (v8)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __47__AVContentKeyRequest__handleKeyResponseError___block_invoke;
        v11[3] = &unk_1E57B77C0;
        v11[4] = v8;
        v11[5] = self;
        void v11[6] = v6;
        [v8 _invokeDelegateCallbackWithBlock:v11 synchronouslyWhenDelegateQueueIsNULL:0];
      }
    }
    else
    {
      [(AVContentKeyRequest *)self _setError:a3];
    }
  }
}

uint64_t __47__AVContentKeyRequest__handleKeyResponseError___block_invoke(uint64_t a1, void *a2)
{
  if (a2
    && (objc_opt_respondsToSelector() & 1) != 0
    && [a2 contentKeySession:*(void *)(a1 + 32) shouldRetryContentKeyRequest:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)])
  {
    v4 = *(void **)(a1 + 40);
    return [v4 _setStatus:3];
  }
  else
  {
    if (dword_1E9356A90)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(*(id *)(a1 + 40), "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
  }
}

- (void)_handleKeyResponseSuccessWithCryptor:(OpaqueFigCPECryptor *)a3
{
  id v5 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  MEMORY[0x199715030](self->_contentKeyRequest->stateMutex);
  self->_contentKeyRequest->hasAnyKeyRequestSucceeded = 1;
  id v6 = [(AVContentKeyRequest *)self session];
  uint64_t v7 = v6;
  int v8 = 0;
  contentKeyRequest = self->_contentKeyRequest;
  if (a3 && v6)
  {
    figCryptor = contentKeyRequest->figCryptor;
    contentKeyRequest->figCryptor = a3;
    CFRetain(a3);
    if (figCryptor) {
      CFRelease(figCryptor);
    }
    contentKeyRequest = self->_contentKeyRequest;
    if (contentKeyRequest->contentKey)
    {
      int v8 = 0;
    }
    else
    {
      self->_contentKeyRequest->contentKey = [[AVContentKey alloc] initWithSpecifier:[(AVContentKeyRequest *)self contentKeySpecifier] cryptor:[(AVContentKeyRequest *)self figCryptor] contentKeyBoss:v5 contentKeySpecifier:self->_contentKeyRequest->keySpecifier];
      contentKeyRequest = self->_contentKeyRequest;
      int v8 = 1;
    }
  }
  MEMORY[0x199715040](contentKeyRequest->stateMutex);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__AVContentKeyRequest__handleKeyResponseSuccessWithCryptor___block_invoke;
  v11[3] = &unk_1E57B7798;
  v11[4] = v7;
  v11[5] = self;
  [v7 _invokeDelegateCallbackWithBlock:v11 synchronouslyWhenDelegateQueueIsNULL:0];
  if (v8) {
    [v7 contentKeyRequestDidProduceContentKey:self->_contentKeyRequest->contentKey];
  }
  if (v5) {
    CFRelease(v5);
  }
}

uint64_t __60__AVContentKeyRequest__handleKeyResponseSuccessWithCryptor___block_invoke(uint64_t result, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    id result = objc_opt_respondsToSelector();
    if (result)
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:contentKeyRequestDidSucceed:", *(void *)(v3 + 32), *(void *)(v3 + 40), v5, v6);
    }
  }
  return result;
}

- (BOOL)ensureCryptorWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4
{
  v19[26] = *(void **)MEMORY[0x1E4F143B8];
  v19[0] = 0;
  id v7 = [(NSDictionary *)self->_contentKeyRequest->preloadingRequestOptions objectForKeyedSubscript:@"ProtocolVersionsKey"];
  id v8 = [(NSDictionary *)self->_contentKeyRequest->preloadingRequestOptions objectForKeyedSubscript:@"HLSMethodKey"];
  MEMORY[0x199715030](self->_contentKeyRequest->stateMutex);
  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->figCryptor) {
    goto LABEL_6;
  }
  self->_contentKeyRequest->figCryptor = [(AVContentKeyReportGroup *)contentKeyRequest->reportGroup createCryptorIfNecessaryForIdentifier:contentKeyRequest->identifier initializationData:contentKeyRequest->initializationData formatDescription:a3 hlsMethod:v8 error:v19];
  if (!self->_contentKeyRequest->figCryptor)
  {
LABEL_11:
    signed int v14 = FigSignalErrorAt();
    goto LABEL_13;
  }
  if (!objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", @"FairPlayStreaming"))
  {
LABEL_6:
    signed int v14 = 0;
    goto LABEL_13;
  }
  id v10 = +[AVContentKeyRequest _ensureProtocolVersionList:v7];
  figCryptor = self->_contentKeyRequest->figCryptor;
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  signed int v15 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, id))(v13 + 56);
  if (v15)
  {
    signed int v14 = v15(figCryptor, *MEMORY[0x1E4F1FDE8], v10);
    if (!v14)
    {
      [(AVContentKeyRequest *)self _copyAndStoreCryptorUUID];
      if (!+[AVContentKeyRequest _prepareCryptor:self->_contentKeyRequest->figCryptor forRenewal:0 andReturnKeyRequestID:&self->_contentKeyRequest->cryptorKeyRequestID isInchargeOfKeyRequest:&self->_contentKeyRequest->isInchargeOfKeyRequest error:v19])goto LABEL_11; {
    }
      }
  }
  else
  {
    signed int v14 = -12782;
  }
LABEL_13:
  MEMORY[0x199715040](self->_contentKeyRequest->stateMutex);
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4 && v14)
  {
    if (v19[0]) {
      v17 = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v14, 0, v19[0], 1);
    }
    else {
      v17 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
    }
    *a4 = v17;
  }
  return v14 == 0;
}

+ (id)_mergePreloadingRequestOptions:(id)a3 withCreateKeyRequestOptions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v6 = (id)[a3 mutableCopy];
  }
  else {
    id v6 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = objc_msgSend(a4, "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (![a3 objectForKeyedSubscript:v13]) {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", v13), v13);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
}

+ (void)_validateProtocolVersionList:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_12:
      long long v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"value against AVContentKeyRequestProtocolVersionsKey should be an array of NSNumber objects", v6, v7, v8, v9, v10, v16), 0 reason userInfo];
      objc_exception_throw(v15);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(a3);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_12;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

+ (void)_validateHLSEncryptionMethod:(id)a3
{
  if (a3
    && ([a3 isEqualToString:@"ISO_23001_7"] & 1) == 0
    && ([a3 isEqualToString:@"SAMPLE-AES"] & 1) == 0)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"value against AVContentKeyRequestHLSMethodKey is not recognized", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
}

+ (void)_validateServerChallenge:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a3 length] == 8) {
        return;
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      uint64_t v13 = @"Server challenge should be 8 bytes in length";
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      uint64_t v13 = @"value against AVContentKeySessionServerPlaybackContextOptionServerChallenge should be a NSData instance";
    }
    uint64_t v14 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
}

+ (id)_ensureProtocolVersionList:(id)a3
{
  uint64_t v3 = &unk_1EE5E1C08;
  if (a3 && [a3 count]) {
    return a3;
  }
  return v3;
}

+ (id)_createKeyRequestDictionaryForApp:(id)a3 persistentKey:(id)a4 serverChallenge:(id)a5 cryptorKeyRequestID:(unint64_t)a6 purpose:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = v12;
  if (a3) {
    [v12 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F218F0]];
  }
  if (a4) {
    [v13 setObject:a4 forKeyedSubscript:*MEMORY[0x1E4F21918]];
  }
  if (a5) {
    [v13 setObject:a5 forKeyedSubscript:*MEMORY[0x1E4F21948]];
  }
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a6];
  [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F21910]];
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v7];
  [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F21930]];
  return v13;
}

- (id)contentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  id v48 = 0;
  v49 = 0;
  int v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"StreamingContentKeyIsForAirPlayKey"), "BOOLValue");
  uint64_t v12 = [a5 objectForKey:@"CSKRO_RemoteContext"];
  uint64_t v45 = *MEMORY[0x1E4F218E0];
  uint64_t v13 = objc_msgSend(a5, "objectForKey:");
  uint64_t v14 = [a5 objectForKeyedSubscript:@"ServerChallenge"];
  +[AVContentKeyRequest _validateServerChallenge:v14];
  signed int v15 = objc_msgSend(-[AVContentKeyRequest session](self, "session"), "setAppIdentifier:", a3);
  if (v15
    || (signed int v15 = [(AVContentKeyReportGroup *)self->_contentKeyRequest->reportGroup configureAppIdentifier:a3]) != 0)
  {
LABEL_38:
    v41 = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v15, 0, v49, 1);
    v49 = v41;
    if (!v41) {
      return v48;
    }
    goto LABEL_39;
  }
  uint64_t v47 = v12;
  id v16 = a4;
  id v17 = +[AVContentKeyRequest _mergePreloadingRequestOptions:self->_contentKeyRequest->preloadingRequestOptions withCreateKeyRequestOptions:a5];

  self->_contentKeyRequest->preloadingRequestOptions = (NSDictionary *)v17;
  if (!-[AVContentKeyRequest ensureCryptorWithFormatDescription:error:](self, "ensureCryptorWithFormatDescription:error:", [a5 objectForKey:@"CreateDecryptorUsingFormatDescription"], &v49))goto LABEL_35; {
  int v46 = v11;
  }
  uint64_t v18 = v13;
  uint64_t v19 = [a5 objectForKey:@"RequiresValidationDataInSecureTokenKey"];
  if (v19 || (uint64_t v19 = [a5 objectForKey:@"RequiresExtendedValidationDataInSecureTokenKey"]) != 0)
  {
    uint64_t v20 = a6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v43 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"AVContentKeyRequestRequiresExtendedValidationDataInSecureTokenKey value should be an object of NSData class", v21, v22, v23, v24, v25, (uint64_t)a2), 0 reason userInfo];
      objc_exception_throw(v43);
    }
    unsigned int v26 = 4;
  }
  else
  {
    uint64_t v20 = a6;
    unsigned int v26 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"SupportsAirPlayDecryptionKey"), "BOOLValue"))uint64_t v27 = 5; {
  else
  }
    uint64_t v27 = v26;
  id v28 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:a3 persistentKey:v19 serverChallenge:v14 cryptorKeyRequestID:self->_contentKeyRequest->cryptorKeyRequestID purpose:v27];
  uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_contentKeyRequest->customURLRequestID];
  [v28 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F21900]];
  if (v16) {
    [v28 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F218F8]];
  }
  a6 = v20;
  if (v47) {
    [v28 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F21938]];
  }
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"StreamingContentKeyRequiresiTunesProvisioningKey"), "BOOLValue"))
  {
    uint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v28 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F21940]];
  }
  if (v46)
  {
    uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v28 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F21908]];
  }
  if (v18) {
    [v28 setObject:v18 forKeyedSubscript:v45];
  }
  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->providesPersistableKey)
  {
    figCryptor = contentKeyRequest->figCryptor;
    uint64_t v34 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v34) {
      uint64_t v35 = v34;
    }
    else {
      uint64_t v35 = 0;
    }
    v36 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, void))(v35 + 56);
    if (!v36) {
      goto LABEL_37;
    }
    signed int v15 = v36(figCryptor, *MEMORY[0x1E4F1FE18], *MEMORY[0x1E4F1CFD0]);
    if (v15) {
      goto LABEL_38;
    }
    contentKeyRequest = self->_contentKeyRequest;
  }
  v37 = contentKeyRequest->figCryptor;
  v38 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v38) {
    v39 = v38;
  }
  else {
    v39 = 0;
  }
  if (*v39 < 4uLL || (v40 = (uint64_t (*)(OpaqueFigCPECryptor *, id, void, id *))v39[11]) == 0)
  {
LABEL_37:
    signed int v15 = -12782;
    goto LABEL_38;
  }
  signed int v15 = v40(v37, v28, *MEMORY[0x1E4F1CF80], &v48);
  if (v15) {
    goto LABEL_38;
  }
  [(AVContentKeyReportGroup *)self->_contentKeyRequest->reportGroup createProtectorSessionIdentifierIfNecessary];
LABEL_35:
  v41 = v49;
  if (!v49) {
    return v48;
  }
LABEL_39:
  if (a6) {
    *a6 = v41;
  }

  return 0;
}

- (id)_makeStreamingContentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  CFTypeRef v19 = 0;
  CFTypeRef cf = 0;
  uint64_t v9 = (void *)[a5 objectForKeyedSubscript:@"HLSMethodKey"];
  +[AVContentKeyRequest _validateHLSEncryptionMethod:v9];
  uint64_t v10 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  if (v10)
  {
    [a5 objectForKeyedSubscript:@"ProtocolVersionsKey"];
    if (![a5 objectForKey:@"RequiresValidationDataInSecureTokenKey"]) {
      [a5 objectForKey:@"RequiresExtendedValidationDataInSecureTokenKey"];
    }
    [a5 objectForKey:@"CSKRO_RemoteContext"];
    objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"SupportsAirPlayDecryptionKey"), "BOOLValue");
    if (v9) {
      [v9 isEqual:@"ISO_23001_7"];
    }
    signed int v11 = FigContentKeyRequestDataParamsCreate();
    if (v11) {
      goto LABEL_12;
    }
    unint64_t requestID = self->_contentKeyRequest->requestID;
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    signed int v15 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, CFTypeRef, CFTypeRef *))(v14 + 16);
    if (v15)
    {
      signed int v11 = v15(v10, requestID, cf, &v19);
LABEL_12:
      signed int v16 = v11;
      id v17 = 0;
      goto LABEL_14;
    }
    id v17 = 0;
    signed int v16 = -12782;
  }
  else
  {
    id v17 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11862, 0);
    signed int v16 = 0;
  }
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v16) {
    id v17 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v16, 0);
  }
  if (!v17) {
    return (id)(id)v19;
  }
  if (a6) {
    *a6 = v17;
  }
  id result = (id)v19;
  if (v19)
  {
    CFRelease(v19);
    return 0;
  }
  return result;
}

- (void)makeStreamingContentKeyRequestDataForApp:(NSData *)appIdentifier contentIdentifier:(NSData *)contentIdentifier options:(NSDictionary *)options completionHandler:(void *)handler
{
  if (!handler)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = @"valid completionHandler is required";
    goto LABEL_11;
  }
  if (!appIdentifier)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = @"valid appIdentifier is required";
LABEL_11:
    uint64_t v21 = objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v20, (uint64_t)contentIdentifier, (uint64_t)options, (uint64_t)handler, v6, v7, v22[0]), 0);
    objc_exception_throw(v21);
  }
  +[AVContentKeyRequest _validateProtocolVersionList:[(NSDictionary *)options objectForKeyedSubscript:@"ProtocolVersionsKey"]];
  +[AVContentKeyRequest _validateHLSEncryptionMethod:[(NSDictionary *)options objectForKeyedSubscript:@"HLSMethodKey"]];
  MEMORY[0x199715030](self->_contentKeyRequest->stateMutex);
  if (contentIdentifier)
  {
    uint64_t v13 = (NSData *)[(NSData *)contentIdentifier copy];

    self->_contentKeyRequest->contentIdentifier = v13;
  }
  if (self->_contentKeyRequest->requestID)
  {
    uint64_t v14 = v23;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    signed int v15 = __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke;
  }
  else
  {
    uint64_t v14 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    signed int v15 = __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke_156;
  }
  signed int v16 = v15;
  global_queue = dispatch_get_global_queue(0, 0);
  v14[2] = (uint64_t)v16;
  v14[3] = (uint64_t)&unk_1E57B77E8;
  v14[4] = (uint64_t)self;
  v14[5] = (uint64_t)appIdentifier;
  v14[6] = (uint64_t)options;
  v14[7] = (uint64_t)contentIdentifier;
  v14[8] = (uint64_t)handler;
  dispatch_async(global_queue, v14);
  MEMORY[0x199715040](self->_contentKeyRequest->stateMutex);
}

uint64_t __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  v5[26] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _makeStreamingContentKeyRequestDataForApp:*(void *)(a1 + 40) contentIdentifier:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) options:*(void *)(a1 + 48) error:v5];
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v2);
}

uint64_t __108__AVContentKeyRequest_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler___block_invoke_156(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  if ([*(id *)(a1 + 32) status] >= 4)
  {
    uint64_t v7 = *MEMORY[0x1E4F1D138];
    v8[0] = @"content key request cancelled or already failed";
    uint64_t v5 = AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1]);
LABEL_8:
    uint64_t v2 = 0;
    uint64_t v6 = v5;
    return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v2);
  }
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_keySystem"), "isEqualToString:", @"FairPlayStreaming") & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AVFoundationErrorDomain" code:-11862 userInfo:0];
    goto LABEL_8;
  }
  uint64_t v2 = [*(id *)(a1 + 32) contentKeyRequestDataForApp:*(void *)(a1 + 40) contentIdentifier:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) options:*(void *)(a1 + 48) error:&v6];
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v2);
}

- (void)processContentKeyResponseData:(id)a3
{
}

- (BOOL)processContentKeyResponseData:(id)a3 renewalDate:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [(AVContentKeyRequest *)self figCryptor];
  if (!a3)
  {
    v33 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"valid responseData is required", v11, v12, v13, v14, v15, v34), 0 reason userInfo];
    objc_exception_throw(v33);
  }
  signed int v16 = v10;
  if ([(AVContentKeyRequest *)self status] < AVContentKeyRequestStatusCancelled)
  {
    if (dword_1E9356A90)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(-[AVContentKeyRequest session](self, "session", v34, v35), "_setContentKeyRequest:forCryptorUUID:cryptorKeyRequestID:", self, self->_contentKeyRequest->cryptorUUID, self->_contentKeyRequest->cryptorKeyRequestID);
    if (self->_contentKeyRequest->customURLHandler)
    {
      [(AVContentKeyRequest *)self _finishLoadingCustomURLRequestWithResponseData:a3 renewalDate:a4];
LABEL_10:
      signed int v20 = 0;
      return v20 == 0;
    }
    signed int v20 = objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", @"FairPlayStreaming");
    if (!v20) {
      return v20 == 0;
    }
    v38[0] = 0;
    if (a4)
    {
      uint64_t v36 = *MEMORY[0x1E4F21950];
      id v37 = a4;
      a4 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    }
    if (self->_contentKeyRequest->providesPersistableKey)
    {
      uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v21) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0;
      }
      uint64_t v25 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, void))(v22 + 56);
      if (v25)
      {
        signed int v20 = v25(v16, *MEMORY[0x1E4F1FE18], *MEMORY[0x1E4F1CFD0]);
        if (v20) {
          goto LABEL_35;
        }
        uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v27 = v26 ? v26 : 0;
        uint64_t v29 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, id))(v27 + 56);
        if (v29)
        {
          signed int v20 = v29(v16, *MEMORY[0x1E4F1FDD0], a3);
          if (!v20) {
            goto LABEL_32;
          }
          goto LABEL_35;
        }
      }
    }
    else
    {
      uint64_t v23 = *(void **)(CMBaseObjectGetVTable() + 16);
      if (v23) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = 0;
      }
      if (*v24 >= 4uLL)
      {
        id v28 = (uint64_t (*)(OpaqueFigCPECryptor *, id, id))v24[12];
        if (v28)
        {
          signed int v20 = v28(v16, a3, a4);
          if (!v20)
          {
LABEL_32:
            uint64_t v30 = *(void **)(CMBaseObjectGetVTable() + 16);
            if (v30) {
              uint64_t v31 = v30;
            }
            else {
              uint64_t v31 = 0;
            }
            if (*v31 >= 6uLL)
            {
              uint64_t v32 = (unsigned int (*)(OpaqueFigCPECryptor *, uint64_t, uint64_t, unsigned char *, void))v31[20];
              if (v32)
              {
                if (!v32(v16, 2, 3, v38, 0) && v38[0]) {
                  goto LABEL_10;
                }
              }
            }
            signed int v20 = FigSignalErrorAt();
            if (!a5) {
              return v20 == 0;
            }
LABEL_36:
            if (v20)
            {
              *a5 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v20, 0);
              signed int v20 = 1;
            }
            return v20 == 0;
          }
LABEL_35:
          if (!a5) {
            return v20 == 0;
          }
          goto LABEL_36;
        }
      }
    }
    signed int v20 = -12782;
    goto LABEL_35;
  }
  if (!a5) {
    return 0;
  }
  uint64_t v39 = *MEMORY[0x1E4F1D138];
  v40[0] = @"content key request cancelled or already failed";
  id v17 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1]);
  BOOL result = 0;
  *a5 = v17;
  return result;
}

- (BOOL)_processContentKeyResponse:(id)a3 renewalDate:(id)a4 initializationVector:(id)a5 error:(id *)a6
{
  uint64_t v8 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  if (v8)
  {
    uint64_t v9 = v8;
    signed int v10 = FigContentKeyResponseParamsCreate();
    if (!v10)
    {
      unint64_t v11 = [(AVContentKeyRequest *)self _requestID];
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v14 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, void))(v13 + 32);
      if (!v14)
      {
        signed int v15 = -12782;
LABEL_10:
        CFRelease(v9);
        if (!a6) {
          return v15 == 0;
        }
        goto LABEL_11;
      }
      signed int v10 = v14(v9, v11, 0);
    }
    signed int v15 = v10;
    goto LABEL_10;
  }
  signed int v15 = FigSignalErrorAt();
  if (!a6) {
    return v15 == 0;
  }
LABEL_11:
  if (v15) {
    *a6 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v15, 0);
  }
  return v15 == 0;
}

- (void)processContentKeyResponse:(AVContentKeyResponse *)keyResponse
{
  v52[1] = *MEMORY[0x1E4F143B8];
  v50 = 0;
  id v6 = [(AVContentKeyRequest *)self _keySystem];
  if (!keyResponse)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    v41 = @"valid keyResponse is required";
    goto LABEL_67;
  }
  uint64_t v12 = v6;
  if (![(AVContentKeyRequest *)self session])
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    uint64_t v42 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Bug in client of AVContentKeySession: this AVContentKeyRequest (%p) can no longer process key responses, as its managing AVContentKeySession was released", v13, v14, v15, v16, v17, (uint64_t)self);
LABEL_68:
    uint64_t v45 = v42;
    int v46 = v39;
    uint64_t v47 = v40;
LABEL_69:
    objc_exception_throw((id)[v46 exceptionWithName:v47 reason:v45 userInfo:0]);
  }
  if ((objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", v12) & 1) == 0)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    v41 = @"AVContentKeySession's keySystem is not same as that of keyResponse";
    goto LABEL_67;
  }
  if (([v12 isEqualToString:@"FairPlayStreaming"] & 1) == 0
    && ([v12 isEqualToString:@"ClearKeySystem"] & 1) == 0
    && ([v12 isEqualToString:@"AuthorizationTokenSystem"] & 1) == 0)
  {
    v43 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v44 = *MEMORY[0x1E4F1C3B8];
    uint64_t v45 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@ does not support this operation", v18, v19, v20, v21, v22, (uint64_t)v12);
    int v46 = v43;
    uint64_t v47 = v44;
    goto LABEL_69;
  }
  if ([(AVContentKeyRequest *)self status] >= AVContentKeyRequestStatusCancelled)
  {
    uint64_t v51 = *MEMORY[0x1E4F1D138];
    v52[0] = @"content key request cancelled or already failed";
    uint64_t v23 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1]);
LABEL_36:
    -[AVContentKeyRequest _handleKeyResponseError:](self, "_handleKeyResponseError:", v23, v48);
    return;
  }
  if (objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", @"FairPlayStreaming"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (keyResponse[1].super.isa)
      {
        if ([(AVContentKeyRequest *)self _requestID])
        {
          if (dword_1E9356A90)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          uint64_t v25 = self;
LABEL_33:
          if (!-[AVContentKeyRequest _processContentKeyResponse:renewalDate:initializationVector:error:](v25, "_processContentKeyResponse:renewalDate:initializationVector:error:", v48, v49))goto LABEL_35; {
          goto LABEL_34;
          }
        }
        if (![(AVContentKeyRequest *)self ensureCryptorWithFormatDescription:0 error:&v50])goto LABEL_35; {
        [(AVContentKeyRequest *)self processContentKeyResponseData:keyResponse[1].super.isa renewalDate:keyResponse[1]._keyResponse error:0];
        }
        goto LABEL_34;
      }
      uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v40 = *MEMORY[0x1E4F1C3C8];
      v41 = @"valid FPS key response data is required";
    }
    else
    {
      uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v40 = *MEMORY[0x1E4F1C3C8];
      v41 = @"keyResponse should be an object of AVContentKeyResponseFairPlayStreaming class";
    }
    goto LABEL_67;
  }
  if (!objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", @"ClearKeySystem"))
  {
    if (!objc_msgSend(-[AVContentKeyResponse keySystem](keyResponse, "keySystem"), "isEqualToString:", @"AuthorizationTokenSystem"))goto LABEL_34; {
    objc_opt_class();
    }
    if (objc_opt_isKindOfClass())
    {
      if (self->_contentKeyRequest->identifier && keyResponse[1].super.isa)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (dword_1E9356A90)
          {
            uint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          contentKeyRequest = self->_contentKeyRequest;
          if (contentKeyRequest->requestID)
          {
            uint64_t v25 = self;
            goto LABEL_33;
          }
          if ([(AVContentKeyReportGroup *)contentKeyRequest->reportGroup _setAuthorizationToken:keyResponse[1].super.isa forIdentifier:contentKeyRequest->identifier error:&v50])
          {
LABEL_34:
            -[AVContentKeyRequest _setStatus:](self, "_setStatus:", 1, v48);
          }
LABEL_35:
          uint64_t v23 = v50;
          if (!v50) {
            return;
          }
          goto LABEL_36;
        }
        uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v40 = *MEMORY[0x1E4F1C3C8];
        v41 = @"identifier should be an object of NSString class";
      }
      else
      {
        uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v40 = *MEMORY[0x1E4F1C3C8];
        v41 = @"identifier and authorizationTokenData must be valid";
      }
    }
    else
    {
      uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v40 = *MEMORY[0x1E4F1C3C8];
      v41 = @"keyResponse should be an object of AVContentKeyResponseAuthorizationToken class";
    }
LABEL_67:
    uint64_t v42 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v41, v7, v8, v9, v10, v11, v48);
    goto LABEL_68;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    v41 = @"keyResponse should be an object of AVContentKeyResponseClearKey class";
    goto LABEL_67;
  }
  if (!keyResponse[1].super.isa)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    v41 = @"valid ClearKey key data is required";
    goto LABEL_67;
  }
  if (self->_contentKeyRequest->requestID)
  {
    uint64_t v25 = self;
    goto LABEL_33;
  }
  if (![(AVContentKeyRequest *)self ensureCryptorWithFormatDescription:0 error:&v50])goto LABEL_35; {
  figCryptor = self->_contentKeyRequest->figCryptor;
  }
  Class isa = keyResponse[1].super.isa;
  uint64_t v29 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v29) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, Class))(v30 + 56);
  if (!v31) {
    goto LABEL_53;
  }
  signed int v32 = v31(figCryptor, *MEMORY[0x1E4F1FDB8], isa);
  if (v32) {
    goto LABEL_54;
  }
  v33 = keyResponse[1]._keyResponse;
  if (!v33) {
    goto LABEL_51;
  }
  uint64_t v34 = self->_contentKeyRequest->figCryptor;
  uint64_t v35 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v36 = v35 ? v35 : 0;
  v38 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, AVContentKeyResponseInternal *))(v36 + 56);
  if (v38)
  {
    signed int v32 = v38(v34, *MEMORY[0x1E4F1FDA8], v33);
    if (!v32)
    {
LABEL_51:
      if ([(AVContentKeyRequest *)self processContentKeyResponseData:keyResponse[1].super.isa renewalDate:0 error:&v50])
      {
        goto LABEL_34;
      }
      goto LABEL_35;
    }
  }
  else
  {
LABEL_53:
    signed int v32 = -12782;
  }
LABEL_54:
  uint64_t v23 = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v32, 0, v50, 1);
  v50 = v23;
  if (v23) {
    goto LABEL_36;
  }
}

- (void)_processContentKeyResponseError:(id)a3
{
  uint64_t v5 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  if (v5)
  {
    id v6 = v5;
    unint64_t requestID = self->_contentKeyRequest->requestID;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(OpaqueFigContentKeyBoss *, unint64_t, id))(v9 + 40);
    if (v10) {
      v10(v6, requestID, a3);
    }
    CFRelease(v6);
  }
  else
  {
    FigSignalErrorAt();
  }
}

- (void)processContentKeyResponseError:(NSError *)error
{
  uint64_t v3 = (uint64_t)error;
  if (!error) {
    uint64_t v3 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
  }
  if (self->_contentKeyRequest->requestID) {
    [(AVContentKeyRequest *)self _processContentKeyResponseError:v3];
  }
  [(AVContentKeyRequest *)self _setError:v3];
}

- (void)renewExpiringContentKeyResponseData
{
  if ((objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", @"FairPlayStreaming") & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    id v7 = [(AVContentKeyRequest *)self _keySystem];
    uint64_t v13 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@ does not support key renewal", v8, v9, v10, v11, v12, (uint64_t)v7), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  id v4 = [(AVContentKeyRequest *)self session];
  [v4 renewExpiringResponseDataForContentKeyRequest:self];
}

- (BOOL)_canRespondByRequestingPersistableContentKeyRequest
{
  contentKeyRequest = self->_contentKeyRequest;
  if (contentKeyRequest->requestInfo)
  {
    FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers();
    char v3 = [0 containsObject:@"com.apple.streamingkeydelivery.persistentcontentkey"];
  }
  else
  {
    char v3 = !contentKeyRequest->useContentKeyBoss || contentKeyRequest->supportsOfflineKey;
  }

  return v3;
}

- (BOOL)respondByRequestingPersistableContentKeyRequestAndReturnError:(NSError *)outError
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(-[AVContentKeyRequest _keySystem](self, "_keySystem"), "isEqualToString:", @"FairPlayStreaming") & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    id v28 = [(AVContentKeyRequest *)self _keySystem];
    uint64_t v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@ does not support key persistence", v21, v22, v23, v24, v25, (uint64_t)v28);
    goto LABEL_19;
  }
  id v6 = [(AVContentKeyRequest *)self session];
  if (!v6) {
    return 1;
  }
  id v7 = v6;
  if (([v6 clientCanReceivePersistableContentKeyRequest] & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    uint64_t v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"client's delegate should respond to contentKeySession:didProvidePersistableContentKeyRequest: method in order to be able to request persistable content key request", v8, v9, v10, v11, v12, v27);
LABEL_19:
    objc_exception_throw((id)[v19 exceptionWithName:v20 reason:v26 userInfo:0]);
  }
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ([(AVContentKeyRequest *)self _canRespondByRequestingPersistableContentKeyRequest])
  {
    [(AVContentKeyRequest *)self _setStatus:4];
    contentKeyRequest = self->_contentKeyRequest;
    unint64_t requestID = contentKeyRequest->requestID;
    if (requestID)
    {
      [v7 issuePersistableContentKeyRequestForKeySpecifier:contentKeyRequest->keySpecifier initializationData:contentKeyRequest->initializationData keyIDFromInitializationData:contentKeyRequest->keyIDFromInitializationData contentIdentifier:contentKeyRequest->contentIdentifier requestID:requestID preloadingRequestOptions:contentKeyRequest->preloadingRequestOptions identifier:contentKeyRequest->identifier];
      return 1;
    }
    customURLHandler = contentKeyRequest->customURLHandler;
    BOOL v16 = 1;
    if (customURLHandler) {
      [v7 issueContentKeyRequestWithCustomURLHandler:customURLHandler identifier:contentKeyRequest->identifier requestInfo:contentKeyRequest->requestInfo requestID:contentKeyRequest->customURLRequestID providesPersistableKey:1];
    }
    else {
      [v7 issueContentKeyRequestWithPreloadingRequestOptions:contentKeyRequest->preloadingRequestOptions identifier:contentKeyRequest->identifier initializationData:contentKeyRequest->initializationData providesPersistableKey:1];
    }
  }
  else
  {
    BOOL v16 = 0;
    if (outError) {
      *outError = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"AVFoundationErrorDomain" code:-11862 userInfo:0];
    }
  }
  return v16;
}

- (void)respondByRequestingPersistableContentKeyRequest
{
}

- (void)_sendResponseInfoToCustomURLHandlerWithRenewalDate:(id)a3
{
  if (!FigCustomURLResponseInfoCreateMutable()
    && !FigCustomURLResponseInfoSetUniversalTypeIdentifier()
    && !FigCustomURLResponseInfoSetContentRenewalDate())
  {
    contentKeyRequest = self->_contentKeyRequest;
    unint64_t customURLRequestID = contentKeyRequest->customURLRequestID;
    customURLHandler = contentKeyRequest->customURLHandler;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, void))(v8 + 8);
    if (v9) {
      v9(customURLHandler, customURLRequestID, 0);
    }
  }
}

- (void)_finishLoadingCustomURLRequestWithResponseData:(id)a3 renewalDate:(id)a4
{
  [(AVContentKeyRequest *)self _sendResponseInfoToCustomURLHandlerWithRenewalDate:a4];
  if (!FigCreateBlockBufferWithCFDataNoCopy())
  {
    contentKeyRequest = self->_contentKeyRequest;
    unint64_t customURLRequestID = contentKeyRequest->customURLRequestID;
    customURLHandler = contentKeyRequest->customURLHandler;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v9 = v8 ? v8 : 0;
    uint64_t v10 = *(unsigned int (**)(OpaqueFigCustomURLHandler *, unint64_t, void))(v9 + 16);
    if (v10)
    {
      if (!v10(customURLHandler, customURLRequestID, 0))
      {
        uint64_t v11 = self->_contentKeyRequest;
        unint64_t v13 = v11->customURLRequestID;
        uint64_t v12 = v11->customURLHandler;
        uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        BOOL v16 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, void, void))(v15 + 24);
        if (v16) {
          v16(v12, v13, 0, 0);
        }
      }
    }
  }
}

- (void)_finishLoadingCustomURLRequestWithError:(id)a3
{
  [(AVContentKeyRequest *)self _sendResponseInfoToCustomURLHandlerWithRenewalDate:0];
  contentKeyRequest = self->_contentKeyRequest;
  unint64_t customURLRequestID = contentKeyRequest->customURLRequestID;
  customURLHandler = contentKeyRequest->customURLHandler;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, id, void))(v9 + 24);
  if (v10)
  {
    v10(customURLHandler, customURLRequestID, a3, 0);
  }
}

- (BOOL)willOutputBeObscuredDueToInsufficientExternalProtectionForDisplays:(id)a3
{
  int v22 = 1;
  if (!a3)
  {
    uint64_t v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"displays is nil", v3, v4, v5, v6, v7, v21), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  contentKeyRequest = self->_contentKeyRequest;
  if (!contentKeyRequest->hasAnyKeyRequestSucceeded) {
    goto LABEL_15;
  }
  if (!contentKeyRequest->useContentKeyBoss)
  {
    figCryptor = contentKeyRequest->figCryptor;
    if (figCryptor)
    {
      int v17 = [(AVContentKeyReportGroup *)contentKeyRequest->reportGroup externalProtectionStatusForCryptor:figCryptor withDisplays:a3];
      return v17 != 2;
    }
LABEL_15:
    FigSignalErrorAt();
    int v17 = 1;
    return v17 != 2;
  }
  uint64_t v10 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  keySpecifier = self->_contentKeyRequest->keySpecifier;
  unint64_t v13 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v18 = (void (*)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *))v14[14];
  if (v18 && *v14 >= 3uLL) {
    v18(v11, keySpecifier, &v22);
  }
  CFRelease(v11);
  int v17 = v22;
  return v17 != 2;
}

- (int64_t)externalContentProtectionStatus
{
  int v14 = 1;
  contentKeyRequest = self->_contentKeyRequest;
  if (!contentKeyRequest->hasAnyKeyRequestSucceeded) {
    goto LABEL_20;
  }
  if (!contentKeyRequest->useContentKeyBoss)
  {
    figCryptor = contentKeyRequest->figCryptor;
    if (figCryptor)
    {
      int v10 = [(AVContentKeyReportGroup *)contentKeyRequest->reportGroup externalProtectionStatusForCryptor:figCryptor withDisplays:MEMORY[0x1E4F1CBF0]];
      if (v10 == 2) {
        return 1;
      }
      else {
        return 2 * (v10 == 3);
      }
    }
LABEL_20:
    FigSignalErrorAt();
    return 0;
  }
  uint64_t v4 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  if (!v4) {
    goto LABEL_20;
  }
  uint64_t v5 = v4;
  keySpecifier = self->_contentKeyRequest->keySpecifier;
  uint64_t v7 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v12 = (unsigned int (*)(OpaqueFigContentKeyBoss *, OpaqueFigContentKeySpecifier *, int *))v8[14];
  if (!v12 || *v8 < 3uLL || v12(v5, keySpecifier, &v14))
  {
    int64_t v11 = 0;
  }
  else if (v14 == 2)
  {
    int64_t v11 = 1;
  }
  else
  {
    int64_t v11 = 2 * (v14 == 3);
  }
  CFRelease(v5);
  return v11;
}

- (BOOL)setReportGroup:(id)a3
{
  MEMORY[0x199715030](self->_contentKeyRequest->stateMutex, a2);
  contentKeyRequest = self->_contentKeyRequest;
  figCryptor = contentKeyRequest->figCryptor;
  if (!figCryptor)
  {

    self->_contentKeyRequest->reportGroup = (AVContentKeyReportGroup *)a3;
  }
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x199715040](self->_contentKeyRequest->stateMutex);
  return figCryptor == 0;
}

@end