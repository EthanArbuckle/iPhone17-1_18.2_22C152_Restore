@interface AVContentKeySession
+ (AVContentKeySession)contentKeySessionWithKeySystem:(AVContentKeySystem)keySystem;
+ (AVContentKeySession)contentKeySessionWithKeySystem:(AVContentKeySystem)keySystem storageDirectoryAtURL:(NSURL *)storageURL;
+ (AVContentKeySession)contentKeySessionWithLegacyWebKitCompatibilityModeAndKeySystem:(id)a3 storageDirectoryAtURL:(id)a4;
+ (NSArray)pendingExpiredSessionReportsWithAppIdentifier:(NSData *)appIdentifier storageDirectoryAtURL:(NSURL *)storageURL;
+ (OpaqueFigSecureStopManager)copyDefaultSecureStopManagerForAppIdentifier:(id)a3 storageDirectoryAtURL:(id)a4;
+ (id)_uniqueIDForCyptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4;
+ (void)initialize;
+ (void)removePendingExpiredSessionReports:(NSArray *)expiredSessionReports withAppIdentifier:(NSData *)appIdentifier storageDirectoryAtURL:(NSURL *)storageURL;
- (AVContentKeyReportGroup)defaultContentKeyGroup;
- (AVContentKeySession)init;
- (AVContentKeySession)initWithKeySystem:(id)a3 storageDirectoryAtURL:(id)a4 internal:(BOOL)a5;
- (AVContentKeySession)initWithKeySystem:(id)a3 storageDirectoryAtURL:(id)a4 legacyWebKitCompatibilityMode:(BOOL)a5;
- (AVContentKeySession)initWithStorageDirectoryAtURL:(id)a3;
- (AVContentKeySystem)keySystem;
- (BOOL)_makeContentKeyGroupWithIDOut:(unint64_t *)a3 error:(id *)a4;
- (BOOL)_renewKeyWithIdentifier:(id)a3 encryptionMethod:(int)a4 initializationData:(id)a5 contentIdentifier:(id)a6 keyIDFromInitializationData:(id)a7 options:(id)a8 error:(id *)a9;
- (BOOL)clientCanReceivePersistableContentKeyRequest;
- (BOOL)copyCryptorForFormatDescription:(opaqueCMFormatDescription *)a3 cryptorOut:(const OpaqueFigCPECryptor *)a4 errorOut:(id *)a5;
- (BOOL)hasProtector;
- (BOOL)isDefunct;
- (BOOL)isInternal;
- (NSArray)contentKeyRecipients;
- (NSData)contentProtectionSessionIdentifier;
- (NSString)description;
- (NSURL)storageURL;
- (OpaqueFigCPECryptor)copyCryptorForCryptKeyAttributes:(id)a3;
- (OpaqueFigCPECryptor)copyCryptorForInitializationData:(id)a3;
- (OpaqueFigCPECryptor)createCryptorIfNecessaryForInitializationData:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 error:(id *)a5;
- (dispatch_queue_t)delegateQueue;
- (id)_contentKeyGroups;
- (id)_contentKeyRequestForCryptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4;
- (id)_internalQueue;
- (id)_weakReference;
- (id)delegate;
- (id)issueContentKeyRequestForInitializationData:(id)a3;
- (id)keyRequestByID:(unint64_t)a3;
- (id)makeContentKeyGroup;
- (int)createAndInstallCustomURLHandlerForAsset:(id)a3 outHandler:(const OpaqueFigCustomURLHandler *)a4;
- (int)setAppIdentifier:(id)a3;
- (unint64_t)_processContentKeyRequestWithIdentifier:(id)a3 encryptionMethod:(int)a4 supportedProtocolVersions:(id)a5 options:(id)a6 groupID:(unint64_t)a7 error:(id *)a8;
- (unint64_t)defaultGroupID;
- (void)_handleContentProtectionSessionIdentifierDidChange:(id)a3;
- (void)_handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier:(id)a3;
- (void)_handleKeyResponseError:(id)a3 forCryptorUUID:(id)a4 andCryptorKeyRequestID:(unint64_t)a5;
- (void)_handleKeyResponseSuccessfullyProcessedForCryptorUUID:(id)a3 andCryptorKeyRequestID:(unint64_t)a4;
- (void)_handleRequest:(__CFDictionary *)a3 withRequestID:(unint64_t)a4 fromHandler:(OpaqueFigCustomURLHandler *)a5 willHandleRequest:(BOOL *)a6;
- (void)_handleSecureStopDidFinalizeRecordCallback;
- (void)_handleUpdateToPersistentKey:(id)a3 forKeyIdentifier:(id)a4;
- (void)_invokeDelegateCallbackWithBlock:(id)a3 synchronouslyWhenDelegateQueueIsNULL:(BOOL)a4;
- (void)_processContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 options:(id)a5 groupID:(unint64_t)a6;
- (void)_removeContentKeyRequestForCryptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4;
- (void)_sendFinishLoadingForPreloadedKeyRequest:(__CFDictionary *)a3 withRequestID:(unint64_t)a4 fromHandler:(OpaqueFigCustomURLHandler *)a5 error:(id)a6;
- (void)_setContentKeyRequest:(id)a3 forCryptorUUID:(id)a4 cryptorKeyRequestID:(unint64_t)a5;
- (void)_setWeakReferenceForContentKeyRequest:(id)a3 withCryptorUUID:(id)a4;
- (void)_willDeallocOrFinalize;
- (void)addContentKeyRecipient:(id)recipient;
- (void)contentKeyRequestDidProduceContentKey:(id)a3;
- (void)contentKeyRequestDidSucceedWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4 requestID:(unint64_t)a5 cryptor:(OpaqueFigCPECryptor *)a6;
- (void)dealloc;
- (void)didProvideKeyRequestWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4 requestID:(unint64_t)a5 renewalRequest:(BOOL)a6 supportsOfflineKey:(BOOL)a7;
- (void)expire;
- (void)externalProtectionStateChangedCallbackWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4;
- (void)invalidateAllPersistableContentKeysForApp:(NSData *)appIdentifier options:(NSDictionary *)options completionHandler:(void *)handler;
- (void)invalidatePersistableContentKey:(NSData *)persistableContentKeyData options:(NSDictionary *)options completionHandler:(void *)handler;
- (void)issueContentKeyRequest:(id)a3;
- (void)issueContentKeyRequest:(id)a3 toDelegateWithCallbackSelector:(SEL)a4;
- (void)issueContentKeyRequestWithCustomURLHandler:(OpaqueFigCustomURLHandler *)a3 identifier:(id)a4 requestInfo:(__CFDictionary *)a5 requestID:(unint64_t)a6 providesPersistableKey:(BOOL)a7;
- (void)issueContentKeyRequestWithPreloadingRequestOptions:(id)a3 identifier:(id)a4 initializationData:(id)a5 providesPersistableKey:(BOOL)a6;
- (void)issueContentKeyRequests:(id)a3 forInitializationData:(id)a4;
- (void)issuePersistableContentKeyRequest:(id)a3;
- (void)issuePersistableContentKeyRequestForKeySpecifier:(OpaqueFigContentKeySpecifier *)a3 initializationData:(id)a4 keyIDFromInitializationData:(id)a5 contentIdentifier:(id)a6 requestID:(unint64_t)a7 preloadingRequestOptions:(id)a8 identifier:(id)a9;
- (void)issueRenewableContentKeyRequest:(id)a3;
- (void)makeSecureTokenForExpirationDateOfPersistableContentKey:(NSData *)persistableContentKeyData completionHandler:(void *)handler;
- (void)processContentKeyRequestForPSSHEntries:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6;
- (void)processContentKeyRequestForSinf:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6;
- (void)processContentKeyRequestForTransportStreamWithCodecType:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6;
- (void)processContentKeyRequestWithIdentifier:(id)identifier initializationData:(NSData *)initializationData options:(NSDictionary *)options;
- (void)removeContentKeyRecipient:(id)recipient;
- (void)removeResourcesForID:(unint64_t)a3;
- (void)renewExpiringResponseDataForContentKeyRequest:(AVContentKeyRequest *)contentKeyRequest;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue;
- (void)trackRequest:(id)a3 byRequestID:(unint64_t)a4;
@end

@implementation AVContentKeySession

- (void)dealloc
{
  [(AVContentKeySession *)self _willDeallocOrFinalize];
  session = self->_session;
  if (session)
  {

    v4 = self->_session;
    delegateReadWriteQueue = v4->_delegateReadWriteQueue;
    if (delegateReadWriteQueue)
    {
      dispatch_release(delegateReadWriteQueue);
      v4 = self->_session;
    }
    delegateQueue = v4->_delegateQueue;
    if (delegateQueue)
    {
      dispatch_release(delegateQueue);
      v4 = self->_session;
    }
    contentKeyBoss = v4->_contentKeyBoss;
    if (contentKeyBoss)
    {
      CFRelease(contentKeyBoss);
      v4 = self->_session;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)AVContentKeySession;
  [(AVContentKeySession *)&v8 dealloc];
}

- (void)_willDeallocOrFinalize
{
  session = (dispatch_object_t *)self->_session;
  if (session)
  {
    if (session[7])
    {
      dispatch_release(session[7]);
      session = (dispatch_object_t *)self->_session;
    }
    CFRelease(session);
  }
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p expired:%d>", NSStringFromClass(v4), self, self->_session->_isExpired];
}

+ (AVContentKeySession)contentKeySessionWithKeySystem:(AVContentKeySystem)keySystem
{
  v3 = [[AVContentKeySession alloc] initWithKeySystem:keySystem storageDirectoryAtURL:0 legacyWebKitCompatibilityMode:0];
  return v3;
}

- (AVContentKeySession)initWithKeySystem:(id)a3 storageDirectoryAtURL:(id)a4 legacyWebKitCompatibilityMode:(BOOL)a5
{
  BOOL v5 = a5;
  v48[30] = *MEMORY[0x1E4F143B8];
  v48[0] = 1;
  v48[1] = avcks_didProvideKeyRequest;
  v48[2] = avcks_didProvideRenewalKeyRequest;
  v48[3] = avcks_didUpdatePersistableKey;
  v48[4] = avcks_contentKeyRequestDidSucceed;
  v48[5] = avcks_contentKeyRequestDidFail;
  v48[6] = avcks_externalProtectionStateChangedCallback;
  if (([a3 isEqualToString:@"FairPlayStreaming"] & 1) == 0
    && ([a3 isEqualToString:@"ClearKeySystem"] & 1) == 0
    && ([a3 isEqualToString:@"AuthorizationTokenSystem"] & 1) == 0)
  {
    v38 = self;
    v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    uint64_t v35 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"input keySystem is not supported", v41, v42, v43, v44, v45, v46);
    v36 = v39;
    uint64_t v37 = v40;
LABEL_27:
    objc_exception_throw((id)[v36 exceptionWithName:v37 reason:v35 userInfo:0]);
  }
  char v10 = [a3 isEqualToString:@"FairPlayStreaming"];
  if (a4 && (v10 & 1) == 0)
  {
    v27 = self;
    v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    uint64_t v35 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@ does not support storage URL", v30, v31, v32, v33, v34, (uint64_t)a3);
    v36 = v28;
    uint64_t v37 = v29;
    goto LABEL_27;
  }
  v47.receiver = self;
  v47.super_class = (Class)AVContentKeySession;
  v11 = [(AVContentKeySession *)&v47 init];
  if (!v11) {
    goto LABEL_21;
  }
  v12 = objc_alloc_init(AVContentKeySessionInternal);
  v11->_session = v12;
  if (!v12) {
    goto LABEL_23;
  }
  CFRetain(v12);
  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11->_session->_threadSafetyQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVContentKeySession._threadSafetyQ", v13);
  v11->_session->_weakReference = [[AVWeakReference alloc] initWithReferencedObject:v11];
  v11->_session->_delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
  v14 = NSString;
  v15 = (objc_class *)objc_opt_class();
  v16 = (const char *)[(id)objc_msgSend(v14 stringWithFormat:@"<%@: %p> contentkeysession delegate serialization queue", NSStringFromClass(v15), v11), "UTF8String"];
  v11->_session->_delegateReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v16);
  v11->_session->keyRequestsByRequestID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11->_session->_storageURL = (NSURL *)[a4 copy];
  v11->_session->_keySystem = (NSString *)a3;
  v11->_session->_contentKeyGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11->_session->cryptorUUIDToContentKeyRequestMap = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v11->_session->keyRequestParamsByRequestID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11->_session->keyRequestTrackerByRequestID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11->_session->cryptorsByIdentifer = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11->_session->contentKeyRequestByKeySpecifierMap = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v11->_session->contentKeyByKeySpecifierMap = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v11->_session->_useContentKeyBoss = PKDIsContentKeyBossEnabled() != 0;
  if (v5) {
    v11->_session->_useContentKeyBoss = 0;
  }
  if (v11->_session->_useContentKeyBoss)
  {
    if (FigContentKeyBossCreateRemote()) {
      goto LABEL_23;
    }
    session = v11->_session;
    contentKeyBoss = session->_contentKeyBoss;
    threadSafetyQ = session->_threadSafetyQ;
    uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v21 = v20 ? v20 : 0;
    v23 = *(unsigned int (**)(OpaqueFigContentKeyBoss *, void *, AVContentKeySession *, OS_dispatch_queue *))(v21 + 56);
    if (!v23 || v23(contentKeyBoss, v48, v11, threadSafetyQ)) {
      goto LABEL_23;
    }
    uint64_t v22 = [(AVContentKeySession *)v11 defaultGroupID];
  }
  else
  {
    uint64_t v22 = 0;
  }
  v11->_session->_defaultContentKeyGroup = [[AVContentKeyReportGroup alloc] initWithKeySystem:a3 keySession:v11 contentKeyBoss:v11->_session->_contentKeyBoss useContentKeyBoss:v11->_session->_useContentKeyBoss groupID:v22 storageDirectoryAtURL:a4];
  v24 = v11->_session;
  if (!v24->_defaultContentKeyGroup)
  {
LABEL_23:

    return 0;
  }
  -[NSMutableArray addObject:](v24->_contentKeyGroups, "addObject:");
LABEL_21:
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v11;
}

- (unint64_t)defaultGroupID
{
  v2 = [(AVContentKeySession *)self keySystem];
  if ([(NSString *)v2 isEqualToString:@"FairPlayStreaming"]) {
    return 1;
  }
  if ([(NSString *)v2 isEqualToString:@"ClearKeySystem"]) {
    return 2;
  }
  if ([(NSString *)v2 isEqualToString:@"AuthorizationTokenSystem"]) {
    return 3;
  }
  return 0;
}

- (AVContentKeySystem)keySystem
{
  return self->_session->_keySystem;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  if (delegate && !delegateQueue)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"valid delegateQueue is required", 0, v4, v5, v6, v7, v13[0]), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  delegateReadWriteQueue = self->_session->_delegateReadWriteQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = (uint64_t)__41__AVContentKeySession_setDelegate_queue___block_invoke;
  v13[3] = (uint64_t)&unk_1E57B2098;
  v13[4] = (uint64_t)delegateQueue;
  v13[5] = (uint64_t)self;
  av_readwrite_dispatch_queue_write_async(delegateReadWriteQueue, v13);
  [(AVWeakReferencingDelegateStorage *)self->_session->_delegateStorage setDelegate:delegate queue:delegateQueue];
}

void __41__AVContentKeySession_setDelegate_queue___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 160);
  if (v2 != v3)
  {
    if (v3)
    {
      dispatch_release(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 160));
      v2 = *(NSObject **)(a1 + 32);
    }
    if (v2)
    {
      dispatch_retain(v2);
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v4 = 0;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 160) = v4;
  }
}

+ (OpaqueFigSecureStopManager)copyDefaultSecureStopManagerForAppIdentifier:(id)a3 storageDirectoryAtURL:(id)a4
{
  if (!FigSecureStopManagerRemoteCopyDefaultRuntimeInstance())
  {
    uint64_t v6 = copyDefaultSecureStopManagerForAppIdentifier_storageDirectoryAtURL__manager;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = *(void (**)(uint64_t, id, id))(v8 + 8);
    if (v9) {
      v9(v6, a3, a4);
    }
  }
  return (OpaqueFigSecureStopManager *)copyDefaultSecureStopManagerForAppIdentifier_storageDirectoryAtURL__manager;
}

- (AVContentKeySession)init
{
  uint64_t v4 = self;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = NSStringFromSelector(sel_contentKeySessionWithKeySystem_);
  v13 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v8, v9, v10, v11, v12, (uint64_t)v7), 0 reason userInfo];
  objc_exception_throw(v13);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVContentKeySession)initWithStorageDirectoryAtURL:(id)a3
{
  return [(AVContentKeySession *)self initWithKeySystem:@"FairPlayStreaming" storageDirectoryAtURL:a3 legacyWebKitCompatibilityMode:1];
}

- (void)didProvideKeyRequestWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4 requestID:(unint64_t)a5 renewalRequest:(BOOL)a6 supportsOfflineKey:(BOOL)a7
{
  BOOL v29 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "objectForKeyedSubscript:", [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a5]);
  uint64_t v12 = [v11 initializationData];
  uint64_t v13 = [v11 contentIdentifier];
  uint64_t v14 = [v11 keyIDFromInitializationData];
  uint64_t v15 = [v11 options];
  if ([v11 identifier]) {
    uint64_t Identifier = [v11 identifier];
  }
  else {
    uint64_t Identifier = FigContentKeySpecifierGetIdentifier();
  }
  LOBYTE(v27) = a7;
  LOBYTE(v26) = 0;
  LOBYTE(v25) = v29;
  v17 = [[AVContentKeyRequest alloc] initWithContentKeySession:self contentKeyBoss:a3 useContentKeyBoss:self->_session->_useContentKeyBoss keySpecifier:a4 initializationData:v12 keyIDFromInitializationData:v14 contentIdentifier:v13 isRenewalRequest:v25 requestID:a5 providesPersistableKey:v26 preloadingRequestOptions:v15 identifier:Identifier supportsOfflineKey:v27];
  uint64_t v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_session->keyRequestTrackerByRequestID, "objectForKeyedSubscript:", [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a5]);
  if (v17)
  {
    v19 = (void *)v18;
    [(AVContentKeySession *)self trackRequest:v17 byRequestID:a5];
    if (v19)
    {
      [v19 addRequest:v17];
      if ([v19 haveAllRequestsBeenReceived])
      {
        uint64_t v20 = (void *)[v19 requests];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v31 != v23) {
                objc_enumerationMutation(v20);
              }
              -[NSMutableDictionary removeObjectForKey:](self->_session->keyRequestTrackerByRequestID, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "_requestID")));
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v22);
        }
        [(AVContentKeySession *)self issueContentKeyRequests:v20 forInitializationData:v12];
      }
    }
    else if (v29)
    {
      [(AVContentKeySession *)self issueRenewableContentKeyRequest:v17];
    }
    else
    {
      [(AVContentKeySession *)self issueContentKeyRequest:v17];
    }
  }
}

- (void)removeResourcesForID:(unint64_t)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_session->keyRequestsByRequestID, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:"));
  keyRequestParamsByRequestID = self->_session->keyRequestParamsByRequestID;
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)keyRequestParamsByRequestID removeObjectForKey:v6];
}

- (void)contentKeyRequestDidSucceedWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4 requestID:(unint64_t)a5 cryptor:(OpaqueFigCPECryptor *)a6
{
  id v10 = [(AVContentKeySession *)self keyRequestByID:a5];
  if (v10)
  {
    id v11 = v10;
    [v10 _handleKeyResponseSuccessWithCryptor:a6];
    uint64_t v12 = (__CFString *)CFCopyDescription(a4);
    [(NSMapTable *)self->_session->contentKeyRequestByKeySpecifierMap setObject:v11 forKey:v12];
  }
  if (a6)
  {
    cryptorsByIdentifer = self->_session->cryptorsByIdentifer;
    uint64_t Identifier = (const void *)FigContentKeySpecifierGetIdentifier();
    CFDictionarySetValue((CFMutableDictionaryRef)cryptorsByIdentifer, Identifier, a6);
  }
  [(AVContentKeySession *)self removeResourcesForID:a5];
}

- (void)externalProtectionStateChangedCallbackWithBoss:(OpaqueFigContentKeyBoss *)a3 keySpecifier:(OpaqueFigContentKeySpecifier *)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__AVContentKeySession_externalProtectionStateChangedCallbackWithBoss_keySpecifier___block_invoke;
  v5[3] = &unk_1E57B7810;
  v5[4] = self;
  v5[5] = a4;
  if (a4) {
    CFRetain(a4);
  }
  [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v5 synchronouslyWhenDelegateQueueIsNULL:1];
}

void __83__AVContentKeySession_externalProtectionStateChangedCallbackWithBoss_keySpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(a1 + 40));
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 128) objectForKey:v4];
  if (a2)
  {
    uint64_t v6 = v5;
    if (v5)
    {
      if (objc_opt_respondsToSelector()) {
        [a2 contentKeySession:*(void *)(a1 + 32) externalProtectionStatusDidChangeForContentKeyRequest:v6];
      }
    }
  }
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) objectForKey:v4];
  if (a2)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      if (objc_opt_respondsToSelector()) {
        [a2 contentKeySession:*(void *)(a1 + 32) externalProtectionStatusDidChangeForContentKey:v8];
      }
    }
  }

  uint64_t v9 = *(const void **)(a1 + 40);
  if (v9)
  {
    CFRelease(v9);
  }
}

+ (AVContentKeySession)contentKeySessionWithLegacyWebKitCompatibilityModeAndKeySystem:(id)a3 storageDirectoryAtURL:(id)a4
{
  uint64_t v4 = [[AVContentKeySession alloc] initWithKeySystem:a3 storageDirectoryAtURL:a4 legacyWebKitCompatibilityMode:1];
  return v4;
}

+ (AVContentKeySession)contentKeySessionWithKeySystem:(AVContentKeySystem)keySystem storageDirectoryAtURL:(NSURL *)storageURL
{
  uint64_t v4 = [[AVContentKeySession alloc] initWithKeySystem:keySystem storageDirectoryAtURL:storageURL legacyWebKitCompatibilityMode:0];
  return v4;
}

- (id)delegate
{
  return [(AVWeakReferencingDelegateStorage *)self->_session->_delegateStorage delegate];
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)[(AVWeakReferencingDelegateStorage *)self->_session->_delegateStorage delegateQueue];
}

- (NSURL)storageURL
{
  return self->_session->_storageURL;
}

- (BOOL)isInternal
{
  return self->_session->_internal;
}

- (void)addContentKeyRecipient:(id)recipient
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  if (([recipient mayRequireContentKeysForMediaDataProcessing] & 1) == 0)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot add this object as an AVContentKeyRecipient", v6, v7, v8, v9, v10, v22);
    uint64_t v20 = (void *)MEMORY[0x1E4F1C3B8];
    goto LABEL_13;
  }
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVContentKeySession_addContentKeyRecipient___block_invoke;
  block[3] = &unk_1E57B7838;
  block[4] = self;
  block[5] = recipient;
  block[6] = &v36;
  block[7] = &v32;
  block[8] = &v24;
  block[9] = &v28;
  dispatch_sync(threadSafetyQ, block);
  if (*((unsigned char *)v37 + 24))
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Content key session is already expired or failed", v12, v13, v14, v15, v16, v22);
LABEL_12:
    uint64_t v19 = v21;
    uint64_t v20 = (void *)MEMORY[0x1E4F1C3C8];
LABEL_13:
    objc_exception_throw((id)[v18 exceptionWithName:*v20 reason:v19 userInfo:0]);
  }
  if (*((unsigned char *)v33 + 24))
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Can't add object as an AVContentKeyRecipient after it has established its own content protection", v12, v13, v14, v15, v16, v22);
    goto LABEL_12;
  }
  if (*((unsigned char *)v29 + 24))
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Content key recipient cannot be associated with more than one instance of AVContentKeySession", v12, v13, v14, v15, v16, v22);
    goto LABEL_12;
  }
  if (*((_DWORD *)v25 + 6))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
}

uint64_t __46__AVContentKeySession_addContentKeyRecipient___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
  if (!v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) = (id)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
  }
  uint64_t result = [v2 containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v4 = *(void *)(a1 + 48);
LABEL_6:
      *(unsigned char *)(*(void *)(v4 + 8) + 24) = 1;
      return result;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t result = [*(id *)(a1 + 40) _attachedToExternalContentKeySession];
      if (result)
      {
        uint64_t v4 = *(void *)(a1 + 56);
        goto LABEL_6;
      }
    }
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t result = objc_msgSend(*(id *)(a1 + 40), "_attachToContentKeySession:contentKeyBoss:failedSinceAlreadyAttachedToAnotherSession:");
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
    }
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) addObject:*(void *)(a1 + 40)];
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        return fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  return result;
}

- (void)removeContentKeyRecipient:(id)recipient
{
  threadSafetyQ = self->_session->_threadSafetyQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__AVContentKeySession_removeContentKeyRecipient___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = recipient;
  v4[5] = self;
  dispatch_sync(threadSafetyQ, v4);
}

uint64_t __49__AVContentKeySession_removeContentKeyRecipient___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) _attachToContentKeySession:0 contentKeyBoss:0 failedSinceAlreadyAttachedToAnotherSession:0];
  }
  if (*(void *)(a1 + 32)) {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 64), "removeObject:");
  }
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (NSArray)contentKeyRecipients
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__45;
  uint64_t v10 = __Block_byref_object_dispose__45;
  uint64_t v11 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVContentKeySession_contentKeyRecipients__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVContentKeySession_contentKeyRecipients__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)expire
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3052000000;
  char v35 = __Block_byref_object_copy__45;
  uint64_t v36 = __Block_byref_object_dispose__45;
  uint64_t v37 = 0;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x3052000000;
  BOOL v29 = __Block_byref_object_copy__45;
  uint64_t v30 = __Block_byref_object_dispose__45;
  uint64_t v31 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__AVContentKeySession_expire__block_invoke;
  block[3] = &unk_1E57B3BB8;
  block[4] = self;
  block[5] = &v32;
  block[6] = &v26;
  dispatch_sync(threadSafetyQ, block);
  uint64_t v4 = (void *)v27[5];
  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) expire];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v39 count:16];
      }
      while (v5);
    }
  }
  if (v33[5])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = (void *)v33[5];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * j);
          if (dword_1E9356A90)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(v12, "expire", v15, v16);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v38 count:16];
      }
      while (v9);
    }
  }
  if (dword_1E9356A90)
  {
    uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

uint64_t __29__AVContentKeySession_expire__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 40) = 1;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = [*(id *)(*(void *)(*(void *)(result + 32)+ 8)+ 64) allObjects];
    [*(id *)(*(void *)(*(void *)(v2 + 32) + 8) + 80) removeAllObjects];
    *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) = [*(id *)(*(void *)(*(void *)(v2 + 32) + 8)+ 88) copy];
    v3 = *(void **)(*(void *)(*(void *)(v2 + 32) + 8) + 88);
    return [v3 removeAllObjects];
  }
  return result;
}

- (NSData)contentProtectionSessionIdentifier
{
  session = self->_session;
  if (session->_contentKeyBoss)
  {
    threadSafetyQ = session->_threadSafetyQ;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AVContentKeySession_contentProtectionSessionIdentifier__block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_sync(threadSafetyQ, block);
    return self->_session->_protectorSessionIdentifier;
  }
  else
  {
    defaultContentKeyGroup = session->_defaultContentKeyGroup;
    return [(AVContentKeyReportGroup *)defaultContentKeyGroup contentProtectionSessionIdentifier];
  }
}

void *__57__AVContentKeySession_contentProtectionSessionIdentifier__block_invoke(void *result)
{
  v2[2] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(result[4] + 8) + 144))
  {
    uint64_t v1 = result;
    v2[0] = 0;
    v2[1] = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "getUUIDBytes:", v2);
    uint64_t result = (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v2 length:16];
    *(void *)(*(void *)(v1[4] + 8) + 144) = result;
  }
  return result;
}

- (void)processContentKeyRequestForSinf:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6
{
  uint64_t v16 = 0;
  long long v17 = 0;
  PKDCopyDefaultKeyIDFromSinfArray();
  uint64_t v10 = [0 base64EncodedStringWithOptions:0];
  if (PKDCopyDecryptFormatTypeFromSinfArray()
    || ((id v11 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", [a6 objectForKeyedSubscript:@"ProtocolVersionsKey"]), !FigCFEqual())? (v12 = 1): (v12 = 2), (v13 = -[AVContentKeySession _processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:](self, "_processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:", v10, v12, v11, a6, a5, 0, 0, 0)) == 0))
  {
    uint64_t v15 = 0;
  }
  else
  {
    unint64_t v14 = v13;
    uint64_t v15 = [[AVContentKeyRequestParams alloc] initWithInitializationData:a4 contentIdentifier:v16 keyIDFromInitializationData:v16 options:a6 identifier:v10];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v15, [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v14]);
  }
}

- (void)processContentKeyRequestForPSSHEntries:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v33 = 0;
  id v34 = 0;
  if (FigPKDParsePSSHAndCopyContentKeyInfo())
  {
  }
  else
  {
    if (FigCFEqual()) {
      int v8 = 2;
    }
    else {
      int v8 = 1;
    }
    unsigned int v26 = v8;
    uint64_t v28 = -[AVContentKeyPSSHRequestTracker initWithRequestCount:]([AVContentKeyPSSHRequestTracker alloc], "initWithRequestCount:", [v33 count]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v33;
    uint64_t v9 = [v33 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v24 = *(void *)v30;
      uint64_t v23 = *MEMORY[0x1E4F33238];
      uint64_t v22 = *MEMORY[0x1E4F33230];
      uint64_t v21 = *MEMORY[0x1E4F33228];
LABEL_7:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        id v13 = +[AVContentKeyRequest _ensureProtocolVersionList:](AVContentKeyRequest, "_ensureProtocolVersionList:", [v12 objectForKeyedSubscript:v23]);
        unint64_t v14 = (void *)[v12 objectForKeyedSubscript:v22];
        uint64_t v15 = [v12 objectForKeyedSubscript:v21];
        uint64_t v16 = [v14 base64EncodedStringWithOptions:0];
        unint64_t v17 = [(AVContentKeySession *)self _processContentKeyRequestWithIdentifier:v16 encryptionMethod:v26 supportedProtocolVersions:v13 options:a6 groupID:a5 error:0];
        if (!v17) {
          break;
        }
        unint64_t v18 = v17;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestTrackerByRequestID, "setObject:forKeyedSubscript:", v28, [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v17]);
        long long v19 = [[AVContentKeyRequestParams alloc] initWithInitializationData:a4 contentIdentifier:v15 keyIDFromInitializationData:v14 options:a6 identifier:v16];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v19, [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v18]);

        if (v10 == ++v11)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v10) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }
}

- (void)processContentKeyRequestForTransportStreamWithCodecType:(id)a3 initializationData:(id)a4 groupID:(unint64_t)a5 options:(id)a6
{
  [a3 integerValue];
  if (PKDCopyDecryptFormatTypeFromCodecType()
    || (!FigCFEqual() ? (uint64_t v10 = 1) : (uint64_t v10 = 2),
        (unint64_t v11 = [(AVContentKeySession *)self _processContentKeyRequestWithIdentifier:PKDGetIdentifierForTransportStream() encryptionMethod:v10 supportedProtocolVersions:+[AVContentKeyRequest _ensureProtocolVersionList:0] options:a6 groupID:a5 error:0]) == 0))
  {
    id v13 = 0;
  }
  else
  {
    unint64_t v12 = v11;
    id v13 = [[AVContentKeyRequestParams alloc] initWithInitializationData:a4 contentIdentifier:0 keyIDFromInitializationData:0 options:a6 identifier:PKDGetIdentifierForTransportStream()];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v13, [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v12]);
  }
}

- (void)_processContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 options:(id)a5 groupID:(unint64_t)a6
{
  session = self->_session;
  if (session->_contentKeyBoss)
  {
    threadSafetyQ = session->_threadSafetyQ;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__AVContentKeySession__processContentKeyRequestWithIdentifier_initializationData_options_groupID___block_invoke;
    block[3] = &unk_1E57B7860;
    block[4] = self;
    void block[5] = a3;
    void block[7] = a5;
    block[8] = a6;
    block[6] = a4;
    dispatch_async(threadSafetyQ, block);
  }
  else
  {
    defaultContentKeyGroup = session->_defaultContentKeyGroup;
    -[AVContentKeyReportGroup processContentKeyRequestWithIdentifier:initializationData:options:](defaultContentKeyGroup, "processContentKeyRequestWithIdentifier:initializationData:options:", a3, a4, a5, a6);
  }
}

uint64_t __98__AVContentKeySession__processContentKeyRequestWithIdentifier_initializationData_options_groupID___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v12 = 0;
  id v13 = 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v16 = *MEMORY[0x1E4F1D138];
    v17[0] = @"An expired content key session cannot process content key request";
    LOBYTE(v11) = 0;
    return -[AVContentKeyRequest _setError:](-[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:]([AVContentKeyRequest alloc], "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", *(void *)(a1 + 32), 0, *(void *)(a1 + 40), 0, 0, *(void *)(a1 + 48), 0, v11), "_setError:", AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1]));
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t result = avcks_decodeInitializationDataAndCopyInformation(v3, &v14, &v12, 0, (uint64_t *)&v13, &v15);
      if (!result)
      {
        if (v15)
        {
          return [*(id *)(a1 + 32) processContentKeyRequestForPSSHEntries:v15 initializationData:*(void *)(a1 + 48) groupID:*(void *)(a1 + 64) options:*(void *)(a1 + 56)];
        }
        else if (v14)
        {
          return [*(id *)(a1 + 32) processContentKeyRequestForSinf:v14 initializationData:*(void *)(a1 + 48) groupID:*(void *)(a1 + 64) options:*(void *)(a1 + 56)];
        }
        else
        {
          uint64_t result = [v13 isEqual:@"mpts"];
          if (result) {
            return [*(id *)(a1 + 32) processContentKeyRequestForTransportStreamWithCodecType:v12 initializationData:*(void *)(a1 + 48) groupID:*(void *)(a1 + 64) options:*(void *)(a1 + 56)];
          }
        }
      }
    }
    else
    {
      uint64_t v4 = (void *)[*(id *)(a1 + 56) objectForKeyedSubscript:@"HLSMethodKey"];
      +[AVContentKeyRequest _validateHLSEncryptionMethod:v4];
      id v5 = (id)[*(id *)(a1 + 56) objectForKeyedSubscript:@"ProtocolVersionsKey"];
      uint64_t v6 = *(void **)(a1 + 32);
      if (*(__CFString **)(v6[1] + 72) == @"FairPlayStreaming")
      {
        if ([v4 isEqual:@"ISO_23001_7"]) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = 1;
        }
        id v5 = +[AVContentKeyRequest _ensureProtocolVersionList:v5];
        uint64_t v6 = *(void **)(a1 + 32);
      }
      else
      {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 64);
      return [v6 _processContentKeyRequestWithIdentifier:v8 encryptionMethod:v7 supportedProtocolVersions:v5 options:v9 groupID:v10 error:0];
    }
  }
  return result;
}

- (void)processContentKeyRequestWithIdentifier:(id)identifier initializationData:(NSData *)initializationData options:(NSDictionary *)options
{
  unint64_t v9 = [(AVContentKeySession *)self defaultGroupID];
  [(AVContentKeySession *)self _processContentKeyRequestWithIdentifier:identifier initializationData:initializationData options:options groupID:v9];
}

- (void)renewExpiringResponseDataForContentKeyRequest:(AVContentKeyRequest *)contentKeyRequest
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  if (!contentKeyRequest)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    unint64_t v17 = @"valid contentKeyRequest is required";
    goto LABEL_25;
  }
  if (![(NSString *)[(AVContentKeySession *)self keySystem] isEqualToString:@"FairPlayStreaming"])
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    long long v19 = [(AVContentKeySession *)self keySystem];
    unint64_t v17 = @"%@ does not support key renewal";
LABEL_25:
    unint64_t v18 = objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, v3, v4, v5, v6, v7, (uint64_t)v19), 0);
    objc_exception_throw(v18);
  }
  if (![(AVContentKeySession *)self delegate])
  {
    uint64_t v28 = *MEMORY[0x1E4F1D138];
    v29[0] = @"Cannot renew content key request since there's no delegate set on the content key session";
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = (__CFString **)v29;
    id v13 = &v28;
    goto LABEL_13;
  }
  if (self->_session->_isExpired)
  {
    uint64_t v26 = *MEMORY[0x1E4F1D138];
    int v27 = @"Cannot renew content key request using an expired content key session";
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = &v27;
    id v13 = &v26;
    goto LABEL_13;
  }
  if ([(AVContentKeyRequest *)contentKeyRequest status] >= AVContentKeyRequestStatusCancelled)
  {
    uint64_t v24 = *MEMORY[0x1E4F1D138];
    uint64_t v25 = @"Cannot renew content key request that was previously cancelled or failed";
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = &v25;
    id v13 = &v24;
    goto LABEL_13;
  }
  if ([(AVContentKeyRequest *)contentKeyRequest status] == AVContentKeyRequestStatusRequestingResponse)
  {
    uint64_t v22 = *MEMORY[0x1E4F1D138];
    uint64_t v23 = @"Cannot renew while content key request is waiting for a response";
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = &v23;
    id v13 = &v22;
LABEL_13:
    uint64_t v21 = AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[v11 dictionaryWithObjects:v12 forKeys:v13 count:1]);
    if (!v21) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (self->_session->_contentKeyBoss)
  {
    [(AVContentKeySession *)self _renewKeyWithIdentifier:[(AVContentKeyRequest *)contentKeyRequest identifierString] encryptionMethod:[(AVContentKeyRequest *)contentKeyRequest _encryptionMethod] initializationData:[(AVContentKeyRequest *)contentKeyRequest initializationData] contentIdentifier:[(AVContentKeyRequest *)contentKeyRequest contentIdentifier] keyIDFromInitializationData:[(AVContentKeyRequest *)contentKeyRequest keyIDFromInitializationData] options:[(AVContentKeyRequest *)contentKeyRequest options] error:&v21];
  }
  else
  {
    if (![(AVContentKeyRequest *)contentKeyRequest _prepareForKeyRenewalReturningError:&v21])goto LABEL_21; {
    v20[0] = MEMORY[0x1E4F143A8];
    }
    v20[1] = 3221225472;
    v20[2] = __69__AVContentKeySession_renewExpiringResponseDataForContentKeyRequest___block_invoke;
    v20[3] = &unk_1E57B7798;
    v20[4] = self;
    v20[5] = contentKeyRequest;
    [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v20 synchronouslyWhenDelegateQueueIsNULL:1];
  }
  [(AVContentKeyRequest *)contentKeyRequest _setStatus:2];
LABEL_21:
  if (v21) {
LABEL_14:
  }
    -[AVContentKeyRequest _setError:](contentKeyRequest, "_setError:");
LABEL_15:
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __69__AVContentKeySession_renewExpiringResponseDataForContentKeyRequest___block_invoke(uint64_t result, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:didProvideRenewingContentKeyRequest:", *(void *)(v3 + 32), *(void *)(v3 + 40), v5, v6);
    }
  }
  return result;
}

- (void)makeSecureTokenForExpirationDateOfPersistableContentKey:(NSData *)persistableContentKeyData completionHandler:(void *)handler
{
  v32[24] = *MEMORY[0x1E4F143B8];
  if (!handler)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    uint64_t v24 = @"valid completion handler is required";
    goto LABEL_24;
  }
  if (!persistableContentKeyData)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    uint64_t v24 = @"valid persistableContentKeyData is required";
    goto LABEL_24;
  }
  if (![(NSString *)self->_session->_keySystem isEqualToString:@"FairPlayStreaming"])
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    keySystem = self->_session->_keySystem;
    uint64_t v24 = @"%@ does not support this operation";
LABEL_24:
    uint64_t v25 = objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v24, (uint64_t)handler, v4, v5, v6, v7, (uint64_t)keySystem), 0);
    objc_exception_throw(v25);
  }
  if (!self->_session->_contentKeyBoss)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke_2;
    v27[3] = &unk_1E57B32E8;
    v27[4] = persistableContentKeyData;
    v27[5] = self;
    v27[6] = handler;
    unint64_t v17 = v27;
    goto LABEL_20;
  }
  CFTypeRef cf = 0;
  v32[0] = 0;
  signed int v12 = FigContentKeySecureTokenRequestParamsCreate();
  if (!v12)
  {
    contentKeyBoss = self->_session->_contentKeyBoss;
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    unint64_t v18 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, void *))(v15 + 96);
    if (!v18)
    {
      signed int v19 = -12782;
      goto LABEL_14;
    }
    signed int v12 = v18(contentKeyBoss, cf, v32);
  }
  signed int v19 = v12;
LABEL_14:
  if (v19) {
    uint64_t v20 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v19, 0, 0, 1);
  }
  else {
    uint64_t v20 = 0;
  }
  if (dword_1E9356A90)
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke;
  block[3] = &unk_1E57B3CA8;
  void block[5] = v20;
  block[6] = handler;
  block[4] = v32[0];
  unint64_t v17 = block;
LABEL_20:
  dispatch_async(global_queue, v17);
}

void __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __97__AVContentKeySession_makeSecureTokenForExpirationDateOfPersistableContentKey_completionHandler___block_invoke_2(void *a1)
{
  v13[24] = *(void **)MEMORY[0x1E4F143B8];
  id v12 = 0;
  v13[0] = 0;
  char v11 = 0;
  uint64_t v10 = 0;
  signed int v2 = PKDPersistentKeyIsForCTRModeDecryption();
  if (v2)
  {
    uint64_t v4 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 48), "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), 0, 0, 0, v13);
  uint64_t v4 = (const void *)v3;
  if (v13[0]) {
    goto LABEL_14;
  }
  if (!v3)
  {
    signed int v2 = -12158;
    goto LABEL_13;
  }
  if (!+[AVContentKeyRequest _prepareCryptor:v3 forRenewal:0 andReturnKeyRequestID:&v10 isInchargeOfKeyRequest:0 error:v13])goto LABEL_14; {
  id v5 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:0 persistentKey:a1[4] serverChallenge:0 cryptorKeyRequestID:v10 purpose:1];
  }
  uint64_t v6 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (*v7 < 4uLL || (uint64_t v8 = (uint64_t (*)(const void *, id, void, id *))v7[11]) == 0)
  {
    signed int v2 = -12782;
    goto LABEL_13;
  }
  signed int v2 = v8(v4, v5, *MEMORY[0x1E4F1CF80], &v12);
  if (v2) {
LABEL_13:
  }
    v13[0] = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v2, 0, v13[0], 1);
LABEL_14:
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(void, id))(a1[6] + 16))(a1[6], v12);
  if (v4) {
    CFRelease(v4);
  }
}

- (void)invalidatePersistableContentKey:(NSData *)persistableContentKeyData options:(NSDictionary *)options completionHandler:(void *)handler
{
  v37[24] = *MEMORY[0x1E4F143B8];
  id v9 = [(NSDictionary *)options objectForKeyedSubscript:@"ServerChallenge"];
  if (!handler)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    uint64_t v28 = @"valid completion handler is required";
    goto LABEL_25;
  }
  if (!persistableContentKeyData)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    uint64_t v28 = @"valid persistableContentKeyData is required";
    goto LABEL_25;
  }
  id v15 = v9;
  if (![(NSString *)self->_session->_keySystem isEqualToString:@"FairPlayStreaming"])
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    keySystem = self->_session->_keySystem;
    uint64_t v28 = @"%@ does not support this operation";
LABEL_25:
    long long v29 = objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v28, v10, v11, v12, v13, v14, (uint64_t)keySystem), 0);
    objc_exception_throw(v29);
  }
  +[AVContentKeyRequest _validateServerChallenge:v15];
  if (!self->_session->_contentKeyBoss)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke_2;
    v31[3] = &unk_1E57B5F80;
    v31[4] = persistableContentKeyData;
    v31[5] = self;
    v31[6] = v15;
    v31[7] = handler;
    uint64_t v21 = v31;
    goto LABEL_21;
  }
  CFTypeRef cf = 0;
  v37[0] = 0;
  char v35 = 0;
  signed int v16 = PKDPersistentKeyIsForCTRModeDecryption();
  if (!v16)
  {
    signed int v16 = FigContentKeySecureTokenRequestParamsCreate();
    if (!v16)
    {
      contentKeyBoss = self->_session->_contentKeyBoss;
      uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v22 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, void *))(v19 + 96);
      if (!v22)
      {
        signed int v23 = -12782;
        goto LABEL_15;
      }
      signed int v16 = v22(contentKeyBoss, cf, v37);
    }
  }
  signed int v23 = v16;
LABEL_15:
  if (v23) {
    uint64_t v24 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v23, 0, 0, 1);
  }
  else {
    uint64_t v24 = 0;
  }
  if (dword_1E9356A90)
  {
    int v34 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke;
  block[3] = &unk_1E57B3CA8;
  void block[5] = v24;
  block[6] = handler;
  block[4] = v37[0];
  uint64_t v21 = block;
LABEL_21:
  dispatch_async(global_queue, v21);
}

void __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  signed int v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __81__AVContentKeySession_invalidatePersistableContentKey_options_completionHandler___block_invoke_2(void *a1)
{
  v13[24] = *(void **)MEMORY[0x1E4F143B8];
  id v12 = 0;
  v13[0] = 0;
  char v11 = 0;
  uint64_t v10 = 0;
  signed int v2 = PKDPersistentKeyIsForCTRModeDecryption();
  if (v2)
  {
    uint64_t v4 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 48), "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), 0, 0, 0, v13);
  uint64_t v4 = (const void *)v3;
  if (v13[0]) {
    goto LABEL_14;
  }
  if (!v3)
  {
    signed int v2 = -12158;
    goto LABEL_13;
  }
  if (!+[AVContentKeyRequest _prepareCryptor:v3 forRenewal:0 andReturnKeyRequestID:&v10 isInchargeOfKeyRequest:0 error:v13])goto LABEL_14; {
  id v5 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:0 persistentKey:a1[4] serverChallenge:a1[6] cryptorKeyRequestID:v10 purpose:2];
  }
  uint64_t v6 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (*v7 < 4uLL || (uint64_t v8 = (uint64_t (*)(const void *, id, void, id *))v7[11]) == 0)
  {
    signed int v2 = -12782;
    goto LABEL_13;
  }
  signed int v2 = v8(v4, v5, *MEMORY[0x1E4F1CF80], &v12);
  if (v2) {
LABEL_13:
  }
    v13[0] = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v2, 0, v13[0], 1);
LABEL_14:
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(void, id))(a1[7] + 16))(a1[7], v12);
  if (v4) {
    CFRelease(v4);
  }
}

- (void)invalidateAllPersistableContentKeysForApp:(NSData *)appIdentifier options:(NSDictionary *)options completionHandler:(void *)handler
{
  v39[24] = *MEMORY[0x1E4F143B8];
  id v10 = [(NSDictionary *)options objectForKeyedSubscript:@"ProtocolVersionsKey"];
  id v11 = [(NSDictionary *)options objectForKeyedSubscript:@"HLSMethodKey"];
  id v12 = [(NSDictionary *)options objectForKeyedSubscript:@"ServerChallenge"];
  if (!handler)
  {
    long long v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    long long v31 = @"valid completion handler is required";
    goto LABEL_24;
  }
  if (!appIdentifier)
  {
    long long v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    long long v31 = @"valid application certificate is required";
    goto LABEL_24;
  }
  id v18 = v12;
  if (![(NSString *)self->_session->_keySystem isEqualToString:@"FairPlayStreaming"])
  {
    long long v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    keySystem = self->_session->_keySystem;
    long long v31 = @"%@ does not support this operation";
LABEL_24:
    long long v32 = objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v31, v13, v14, v15, v16, v17, (uint64_t)keySystem), 0);
    objc_exception_throw(v32);
  }
  +[AVContentKeyRequest _validateProtocolVersionList:v10];
  +[AVContentKeyRequest _validateHLSEncryptionMethod:v11];
  +[AVContentKeyRequest _validateServerChallenge:v18];
  if (!self->_session->_contentKeyBoss)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke_2;
    v34[3] = &unk_1E57B7888;
    v34[4] = self;
    v34[5] = v11;
    v34[6] = v10;
    v34[7] = appIdentifier;
    v34[8] = v18;
    v34[9] = handler;
    uint64_t v24 = v34;
    goto LABEL_20;
  }
  CFTypeRef cf = 0;
  v39[0] = 0;
  signed int v19 = FigContentKeySecureTokenRequestParamsCreate();
  if (!v19)
  {
    contentKeyBoss = self->_session->_contentKeyBoss;
    uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v25 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, void *))(v22 + 96);
    if (!v25)
    {
      signed int v26 = -12782;
      goto LABEL_14;
    }
    signed int v19 = v25(contentKeyBoss, cf, v39);
  }
  signed int v26 = v19;
LABEL_14:
  if (v26) {
    uint64_t v27 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v26, 0, 0, 1);
  }
  else {
    uint64_t v27 = 0;
  }
  if (dword_1E9356A90)
  {
    int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke;
  block[3] = &unk_1E57B3CA8;
  void block[5] = v27;
  block[6] = handler;
  block[4] = v39[0];
  uint64_t v24 = block;
LABEL_20:
  dispatch_async(global_queue, v24);
}

void __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  signed int v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __91__AVContentKeySession_invalidateAllPersistableContentKeysForApp_options_completionHandler___block_invoke_2(void *a1)
{
  v16[24] = *(void **)MEMORY[0x1E4F143B8];
  id v15 = 0;
  v16[0] = 0;
  uint64_t v14 = 0;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 48), "createCryptorIfNecessaryForIdentifier:initializationData:formatDescription:hlsMethod:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), 0, 0, a1[5], v16);
  uint64_t v3 = (const void *)v2;
  if (!v16[0])
  {
    if (!v2)
    {
      signed int v8 = -12158;
      goto LABEL_17;
    }
    id v4 = +[AVContentKeyRequest _ensureProtocolVersionList:a1[6]];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(const void *, void, id))(v6 + 56);
    if (v7)
    {
      signed int v8 = v7(v3, *MEMORY[0x1E4F1FDE8], v4);
      if (v8) {
        goto LABEL_17;
      }
      if (!+[AVContentKeyRequest _prepareCryptor:v3 forRenewal:0 andReturnKeyRequestID:&v14 isInchargeOfKeyRequest:0 error:v16])goto LABEL_18; {
      id v9 = +[AVContentKeyRequest _createKeyRequestDictionaryForApp:a1[7] persistentKey:0 serverChallenge:a1[8] cryptorKeyRequestID:v14 purpose:3];
      }
      id v10 = *(void **)(CMBaseObjectGetVTable() + 16);
      if (v10) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
      if (*v11 >= 4uLL)
      {
        id v12 = (uint64_t (*)(const void *, id, void, id *))v11[11];
        if (v12)
        {
          signed int v8 = v12(v3, v9, *MEMORY[0x1E4F1CF80], &v15);
          if (!v8) {
            goto LABEL_18;
          }
LABEL_17:
          v16[0] = (void *)AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v8, 0, v16[0], 1);
          goto LABEL_18;
        }
      }
    }
    signed int v8 = -12782;
    goto LABEL_17;
  }
LABEL_18:
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(void, id))(a1[9] + 16))(a1[9], v15);
  if (v3) {
    CFRelease(v3);
  }
}

+ (NSArray)pendingExpiredSessionReportsWithAppIdentifier:(NSData *)appIdentifier storageDirectoryAtURL:(NSURL *)storageURL
{
  cf[25] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  if (!appIdentifier)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"valid appIdentifier is required";
    goto LABEL_22;
  }
  if (!storageURL)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"valid storageURL is required";
LABEL_22:
    id v18 = objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v17, (uint64_t)storageURL, v4, v5, v6, v7, v19), 0);
    objc_exception_throw(v18);
  }
  signed int v8 = +[AVContentKeySession copyDefaultSecureStopManagerForAppIdentifier:storageDirectoryAtURL:](AVContentKeySession, "copyDefaultSecureStopManagerForAppIdentifier:storageDirectoryAtURL:");
  if (!v8)
  {
    FigSignalErrorAt();
LABEL_12:
    id v12 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = *(unsigned int (**)(OpaqueFigSecureStopManager *, CFTypeRef *))(v10 + 16);
  if (!v11 || v11(v8, cf)) {
    goto LABEL_12;
  }
  id v12 = (NSArray *)[(id)cf[0] allValues];
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_13:
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (!v12) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  return v12;
}

+ (void)removePendingExpiredSessionReports:(NSArray *)expiredSessionReports withAppIdentifier:(NSData *)appIdentifier storageDirectoryAtURL:(NSURL *)storageURL
{
  v22[29] = *MEMORY[0x1E4F143B8];
  if (!appIdentifier)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = @"valid appIdentifier is required";
    goto LABEL_19;
  }
  if (!storageURL)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = @"valid storageURL is required";
LABEL_19:
    uint64_t v20 = objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v19, (uint64_t)appIdentifier, (uint64_t)storageURL, v5, v6, v7, v21), 0);
    objc_exception_throw(v20);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __147__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports__removePendingExpiredSessionReports_withAppIdentifier_storageDirectoryAtURL___block_invoke;
  v22[3] = &unk_1E57B78B0;
  v22[4] = a1;
  v22[5] = a2;
  [(NSArray *)expiredSessionReports enumerateObjectsUsingBlock:v22];
  if (![(NSArray *)expiredSessionReports count])
  {
    if (!dword_1E9356A90) {
      return;
    }
    id v12 = 0;
LABEL_13:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!v12) {
      return;
    }
    goto LABEL_14;
  }
  id v11 = +[AVContentKeySession copyDefaultSecureStopManagerForAppIdentifier:appIdentifier storageDirectoryAtURL:storageURL];
  if (!v11)
  {
    FigSignalErrorAt();
    return;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = *(unsigned int (**)(OpaqueFigSecureStopManager *, NSArray *))(v14 + 24);
  if (v15 && !v15(v12, expiredSessionReports) && dword_1E9356A90) {
    goto LABEL_13;
  }
LABEL_14:
  CFRelease(v12);
}

uint64_t __147__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports__removePendingExpiredSessionReports_withAppIdentifier_storageDirectoryAtURL___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    signed int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 32), *(const char **)(a1 + 40), @"expiredSessionReports should be an array of NSData objects", v3, v4, v5, v6, v7, v9), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  return result;
}

- (void)_handleSecureStopDidFinalizeRecordCallback
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __114__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleSecureStopDidFinalizeRecordCallback__block_invoke;
  void v2[3] = &unk_1E57B78D8;
  v2[4] = self;
  [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v2 synchronouslyWhenDelegateQueueIsNULL:0];
}

uint64_t __114__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleSecureStopDidFinalizeRecordCallback__block_invoke(uint64_t result, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySessionDidGenerateExpiredSessionReport:", *(void *)(v3 + 32), v5, v6);
    }
  }
  return result;
}

- (void)_handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __139__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier___block_invoke;
  v3[3] = &unk_1E57B7798;
  v3[4] = self;
  v3[5] = a3;
  [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v3 synchronouslyWhenDelegateQueueIsNULL:1];
}

uint64_t __139__AVContentKeySession_AVContentKeySessionPendingExpiredSessionReports___handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 96) objectForKey:*(void *)(a1 + 40)];
  if (a2)
  {
    uint64_t v5 = result;
    if (result)
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        return [a2 contentKeySession:v6 externalProtectionStatusDidChangeForContentKeyRequest:v5];
      }
    }
  }
  return result;
}

- (id)_internalQueue
{
  return self->_session->_threadSafetyQ;
}

+ (id)_uniqueIDForCyptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4
{
  return (id)[NSString stringWithFormat:@"%@_%llu", a3, a4];
}

- (void)_setContentKeyRequest:(id)a3 forCryptorUUID:(id)a4 cryptorKeyRequestID:(unint64_t)a5
{
  threadSafetyQ = self->_session->_threadSafetyQ;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __117__AVContentKeySession_AVContentKeySessionPrivateUtilities___setContentKeyRequest_forCryptorUUID_cryptorKeyRequestID___block_invoke;
  v6[3] = &unk_1E57B3AF8;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(threadSafetyQ, v6);
}

void *__117__AVContentKeySession_AVContentKeySessionPrivateUtilities___setContentKeyRequest_forCryptorUUID_cryptorKeyRequestID___block_invoke(void *result)
{
  if (result[4])
  {
    uint64_t v1 = result;
    uint64_t v2 = result[5];
    if (v2)
    {
      id v3 = +[AVContentKeySession _uniqueIDForCyptorUUID:v2 cryptorKeyRequestID:result[7]];
      uint64_t v4 = *(void **)(*(void *)(v1[6] + 8) + 80);
      uint64_t v5 = v1[4];
      return (void *)[v4 setObject:v5 forKey:v3];
    }
  }
  return result;
}

- (id)_contentKeyRequestForCryptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy__45;
  id v12 = __Block_byref_object_dispose__45;
  uint64_t v13 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__AVContentKeySession_AVContentKeySessionPrivateUtilities___contentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke;
  v7[3] = &unk_1E57B6FE0;
  v7[6] = &v8;
  v7[7] = a4;
  v7[4] = a3;
  v7[5] = self;
  dispatch_sync(threadSafetyQ, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void *__113__AVContentKeySession_AVContentKeySessionPrivateUtilities___contentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = (id)objc_msgSend(*(id *)(*(void *)(result[5] + 8) + 80), "objectForKey:", +[AVContentKeySession _uniqueIDForCyptorUUID:cryptorKeyRequestID:](AVContentKeySession, "_uniqueIDForCyptorUUID:cryptorKeyRequestID:", v1, result[7]));
    *(void *)(*(void *)(v2[6] + 8) + 40) = result;
  }
  return result;
}

- (void)_removeContentKeyRequestForCryptorUUID:(id)a3 cryptorKeyRequestID:(unint64_t)a4
{
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__AVContentKeySession_AVContentKeySessionPrivateUtilities___removeContentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke;
  block[3] = &unk_1E57B2270;
  void block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(threadSafetyQ, block);
}

uint64_t __119__AVContentKeySession_AVContentKeySessionPrivateUtilities___removeContentKeyRequestForCryptorUUID_cryptorKeyRequestID___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = result;
    id v3 = +[AVContentKeySession _uniqueIDForCyptorUUID:v1 cryptorKeyRequestID:*(void *)(result + 48)];
    uint64_t v4 = *(void **)(*(void *)(*(void *)(v2 + 40) + 8) + 80);
    return [v4 removeObjectForKey:v3];
  }
  return result;
}

- (void)_setWeakReferenceForContentKeyRequest:(id)a3 withCryptorUUID:(id)a4
{
}

- (void)_invokeDelegateCallbackWithBlock:(id)a3 synchronouslyWhenDelegateQueueIsNULL:(BOOL)a4
{
  BOOL v4 = a4;
  session = self->_session;
  delegateStorage = session->_delegateStorage;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__45;
  uint64_t v18 = __Block_byref_object_dispose__45;
  uint64_t v19 = 0;
  delegateReadWriteQueue = session->_delegateReadWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v14;
  av_readwrite_dispatch_queue_read(delegateReadWriteQueue, block);
  global_queue = v15[5];
  if (!v4)
  {
    if (!global_queue)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_2;
      v12[3] = &unk_1E57B3748;
      v12[4] = delegateStorage;
      v12[5] = a3;
      uint64_t v10 = v12;
      goto LABEL_7;
    }
LABEL_5:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_3;
    v11[3] = &unk_1E57B2D78;
    v11[4] = delegateStorage;
    v11[5] = a3;
    v11[6] = &v14;
    uint64_t v10 = v11;
LABEL_7:
    dispatch_async(global_queue, v10);
    goto LABEL_8;
  }
  if (global_queue) {
    goto LABEL_5;
  }
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:a3 synchronouslyIfDelegateQueueIsQueue:0];
LABEL_8:
  _Block_object_dispose(&v14, 8);
}

void __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 160);
  uint64_t v1 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v1) {
    dispatch_retain(v1);
  }
}

uint64_t __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeDelegateCallbackWithBlock:*(void *)(a1 + 40) synchronouslyIfDelegateQueueIsQueue:0];
}

void __130__AVContentKeySession_AVContentKeySessionPrivateUtilities___invokeDelegateCallbackWithBlock_synchronouslyWhenDelegateQueueIsNULL___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) invokeDelegateCallbackWithBlock:*(void *)(a1 + 40) synchronouslyIfDelegateQueueIsQueue:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  dispatch_release(v2);
}

- (void)_handleKeyResponseError:(id)a3 forCryptorUUID:(id)a4 andCryptorKeyRequestID:(unint64_t)a5
{
  objc_msgSend(-[AVContentKeySession _contentKeyRequestForCryptorUUID:cryptorKeyRequestID:](self, "_contentKeyRequestForCryptorUUID:cryptorKeyRequestID:", a4, a5), "_handleKeyResponseError:", a3);
  [(AVContentKeySession *)self _removeContentKeyRequestForCryptorUUID:a4 cryptorKeyRequestID:a5];
}

- (void)_handleKeyResponseSuccessfullyProcessedForCryptorUUID:(id)a3 andCryptorKeyRequestID:(unint64_t)a4
{
  objc_msgSend(-[AVContentKeySession _contentKeyRequestForCryptorUUID:cryptorKeyRequestID:](self, "_contentKeyRequestForCryptorUUID:cryptorKeyRequestID:"), "_handleKeyResponseSuccessWithCryptor:", 0);
  [(AVContentKeySession *)self _removeContentKeyRequestForCryptorUUID:a3 cryptorKeyRequestID:a4];
}

- (void)_handleUpdateToPersistentKey:(id)a3 forKeyIdentifier:(id)a4
{
  if (a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __106__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleUpdateToPersistentKey_forKeyIdentifier___block_invoke;
    v4[3] = &unk_1E57B77C0;
    v4[4] = self;
    v4[5] = a3;
    void v4[6] = a4;
    [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v4 synchronouslyWhenDelegateQueueIsNULL:0];
  }
}

uint64_t __106__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleUpdateToPersistentKey_forKeyIdentifier___block_invoke(uint64_t result, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = (void *)result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:didUpdatePersistableContentKey:forContentKeyIdentifier:", v3[4], v3[5], v3[6], v5, v6);
    }
  }
  return result;
}

- (void)_handleContentProtectionSessionIdentifierDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __111__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleContentProtectionSessionIdentifierDidChange___block_invoke;
  v3[3] = &unk_1E57B7798;
  v3[4] = self;
  v3[5] = a3;
  [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v3 synchronouslyWhenDelegateQueueIsNULL:1];
}

uint64_t __111__AVContentKeySession_AVContentKeySessionPrivateUtilities___handleContentProtectionSessionIdentifierDidChange___block_invoke(uint64_t result, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    if (objc_opt_respondsToSelector())
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:contentProtectionSessionIdentifierDidChangeForReportGroup:", *(void *)(v3 + 32), *(void *)(v3 + 40), v6, v7);
    }
    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        if (dword_1E9356A90)
        {
          uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return objc_msgSend(a2, "contentKeySessionContentProtectionSessionIdentifierDidChange:", *(void *)(v3 + 32), v6, v7);
      }
    }
  }
  return result;
}

- (int)setAppIdentifier:(id)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (!a3)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"valid appIdentifier is required", v3, v4, v5, v6, v7, v19);
    goto LABEL_6;
  }
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AVContentKeySession_AVContentKeyRequestSupport__setAppIdentifier___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v21;
  dispatch_sync(threadSafetyQ, block);
  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"appIdentifier can't change once set", v11, v12, v13, v14, v15, v19);
LABEL_6:
    objc_exception_throw((id)[v17 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
  }
  _Block_object_dispose(&v21, 8);
  return 0;
}

uint64_t __68__AVContentKeySession_AVContentKeyRequestSupport__setAppIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = *(void **)(*(void *)(a1[4] + 8) + 32);
  if (v3)
  {
    uint64_t result = [v3 isEqual:v2];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result ^ 1;
  }
  else
  {
    uint64_t result = [v2 copy];
    *(void *)(*(void *)(a1[4] + 8) + 32) = result;
  }
  return result;
}

- (BOOL)clientCanReceivePersistableContentKeyRequest
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)issueContentKeyRequests:(id)a3 forInitializationData:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__45;
  uint64_t v20 = __Block_byref_object_dispose__45;
  uint64_t v21 = 0;
  if (a3)
  {
    if ([(AVContentKeySession *)self delegate])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __97__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequests_forInitializationData___block_invoke;
      v11[3] = &unk_1E57B7900;
      v11[4] = self;
      v11[5] = a3;
      v11[6] = a4;
      void v11[7] = &v16;
      [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v11 synchronouslyWhenDelegateQueueIsNULL:1];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(a3);
            }
            uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            v17[5] = (uint64_t)v10;
            objc_msgSend(v10, "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
          }
          uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v22 count:16];
        }
        while (v7);
      }
      v17[5] = 0;
    }
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __97__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequests_forInitializationData___block_invoke(uint64_t result, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (void *)result;
    if (objc_opt_respondsToSelector())
    {
      if (dword_1E9356A90)
      {
        unsigned int v29 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(a2, "contentKeySession:didProvideContentKeyRequests:forInitializationData:", v3[4], v3[5], v3[6], v18, v19);
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        long long v26 = 0uLL;
        long long v27 = 0uLL;
        long long v24 = 0uLL;
        long long v25 = 0uLL;
        uint64_t v5 = (void *)v3[5];
        uint64_t result = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
        if (result)
        {
          uint64_t v6 = result;
          uint64_t v7 = *(void *)v25;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v25 != v7) {
                objc_enumerationMutation(v5);
              }
              *(void *)(*(void *)(v3[7] + 8) + 40) = *(void *)(*((void *)&v24 + 1) + 8 * v8);
              if (dword_1E9356A90)
              {
                unsigned int v29 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v10 = v29;
                if (os_log_type_enabled(v9, type)) {
                  unsigned int v11 = v10;
                }
                else {
                  unsigned int v11 = v10 & 0xFFFFFFFE;
                }
                if (v11)
                {
                  uint64_t v12 = v3[4];
                  uint64_t v13 = *(void *)(*(void *)(v3[7] + 8) + 40);
                  int v32 = 136315650;
                  id v33 = "-[AVContentKeySession(AVContentKeyRequestSupport) issueContentKeyRequests:forInitializationData:]_block_invoke";
                  __int16 v34 = 2048;
                  uint64_t v35 = v12;
                  __int16 v36 = 2048;
                  uint64_t v37 = v13;
                  LODWORD(v19) = 32;
                  uint64_t v18 = &v32;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(a2, "contentKeySession:didProvideContentKeyRequest:", v3[4], *(void *)(*(void *)(v3[7] + 8) + 40), v18, v19);
              ++v8;
            }
            while (v6 != v8);
            uint64_t result = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
            uint64_t v6 = result;
          }
          while (result);
        }
      }
      else
      {
        long long v22 = 0uLL;
        long long v23 = 0uLL;
        long long v20 = 0uLL;
        long long v21 = 0uLL;
        long long v14 = (void *)v3[5];
        uint64_t result = [v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (result)
        {
          uint64_t v15 = result;
          uint64_t v16 = *(void *)v21;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v14);
              }
              *(void *)(*(void *)(v3[7] + 8) + 40) = *(void *)(*((void *)&v20 + 1) + 8 * v17);
              objc_msgSend(*(id *)(*(void *)(v3[7] + 8) + 40), "_setError:", AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0));
              ++v17;
            }
            while (v15 != v17);
            uint64_t result = [v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
            uint64_t v15 = result;
          }
          while (result);
        }
      }
      *(void *)(*(void *)(v3[7] + 8) + 40) = 0;
    }
  }
  return result;
}

- (void)issueContentKeyRequest:(id)a3 toDelegateWithCallbackSelector:(SEL)a4
{
  if (a3)
  {
    if ([(AVContentKeySession *)self delegate])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __105__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequest_toDelegateWithCallbackSelector___block_invoke;
      v8[3] = &unk_1E57B7928;
      v8[5] = a3;
      v8[6] = a4;
      v8[4] = self;
      [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v8 synchronouslyWhenDelegateQueueIsNULL:1];
    }
    else
    {
      uint64_t v7 = AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0);
      [a3 _setError:v7];
    }
  }
}

uint64_t __105__AVContentKeySession_AVContentKeyRequestSupport__issueContentKeyRequest_toDelegateWithCallbackSelector___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    if (objc_opt_respondsToSelector())
    {
      if (sel_isEqual(*(SEL *)(v3 + 48), sel_contentKeySession_didProvidePersistableContentKeyRequest_))
      {
        uint64_t v4 = *(void *)(v3 + 32);
        uint64_t v5 = *(void *)(v3 + 40);
        return [a2 contentKeySession:v4 didProvidePersistableContentKeyRequest:v5];
      }
      else
      {
        uint64_t result = sel_isEqual(*(SEL *)(v3 + 48), sel_contentKeySession_didProvideRenewingContentKeyRequest_);
        if (result)
        {
          uint64_t v8 = *(void *)(v3 + 32);
          uint64_t v9 = *(void *)(v3 + 40);
          return [a2 contentKeySession:v8 didProvideRenewingContentKeyRequest:v9];
        }
      }
    }
    else
    {
      uint64_t v6 = *(void **)(v3 + 40);
      uint64_t v7 = AVLocalizedErrorWithUnderlyingOSStatus(-11835, 0);
      return [v6 _setError:v7];
    }
  }
  return result;
}

- (void)issueContentKeyRequest:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  -[AVContentKeySession issueContentKeyRequests:forInitializationData:](self, "issueContentKeyRequests:forInitializationData:", [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1], 0);
}

- (void)issuePersistableContentKeyRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVContentKeySession issueContentKeyRequest:toDelegateWithCallbackSelector:](self, "issueContentKeyRequest:toDelegateWithCallbackSelector:", a3, sel_contentKeySession_didProvidePersistableContentKeyRequest_, v6, v7);
}

- (void)issueRenewableContentKeyRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVContentKeySession issueContentKeyRequest:toDelegateWithCallbackSelector:](self, "issueContentKeyRequest:toDelegateWithCallbackSelector:", a3, sel_contentKeySession_didProvideRenewingContentKeyRequest_, v6, v7);
}

- (void)issueContentKeyRequestWithCustomURLHandler:(OpaqueFigCustomURLHandler *)a3 identifier:(id)a4 requestInfo:(__CFDictionary *)a5 requestID:(unint64_t)a6 providesPersistableKey:(BOOL)a7
{
  BOOL v7 = a7;
  FigCustomURLRequestInfoGetIsRenewalRequest();
  if (v7)
  {
    LOWORD(v14) = 1;
    -[AVContentKeySession issuePersistableContentKeyRequest:](self, "issuePersistableContentKeyRequest:", -[AVContentKeyRequest initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:]([AVPersistableContentKeyRequest alloc], "initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:", self, self->_session->_defaultContentKeyGroup, a3, a4, a5, a6, v14));
  }
  else
  {
    LOWORD(v14) = 0;
    uint64_t v13 = -[AVContentKeyRequest initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:]([AVContentKeyRequest alloc], "initWithContentKeySession:reportGroup:customURLHandler:identifier:requestInfo:requestID:providesPersistableKey:isRenewalRequest:", self, self->_session->_defaultContentKeyGroup, a3, a4, a5, a6, v14);
    if (v13) {
      [(AVContentKeySession *)self issueContentKeyRequest:v13];
    }
  }
}

- (void)issueContentKeyRequestWithPreloadingRequestOptions:(id)a3 identifier:(id)a4 initializationData:(id)a5 providesPersistableKey:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v15 = 0;
  id v16 = 0;
  if (a5)
  {
    avcks_decodeInitializationDataAndCopyInformation((uint64_t)a5, &v15, 0, 0, 0, 0);
    if (v15)
    {
      if (PKDCopyDefaultKeyIDFromSinfArray())
      {
        unsigned int v11 = 0;
        goto LABEL_8;
      }
      unsigned int v11 = (void *)[v16 copy];
      if (!v6) {
        goto LABEL_5;
      }
LABEL_7:
      uint64_t v13 = [AVPersistableContentKeyRequest alloc];
      LOBYTE(v14) = 1;
      [(AVContentKeySession *)self issuePersistableContentKeyRequest:[(AVContentKeyRequest *)v13 initWithContentKeySession:self reportGroup:self->_session->_defaultContentKeyGroup identifier:a4 contentIdentifier:v11 keyIDFromInitializationData:v16 initializationData:a5 preloadingRequestOptions:a3 providesPersistableKey:v14]];
      goto LABEL_8;
    }
  }
  unsigned int v11 = 0;
  if (v6) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v12 = [AVContentKeyRequest alloc];
  LOBYTE(v14) = 0;
  [(AVContentKeySession *)self issueContentKeyRequest:[(AVContentKeyRequest *)v12 initWithContentKeySession:self reportGroup:self->_session->_defaultContentKeyGroup identifier:a4 contentIdentifier:v11 keyIDFromInitializationData:v16 initializationData:a5 preloadingRequestOptions:a3 providesPersistableKey:v14]];
LABEL_8:
}

- (void)contentKeyRequestDidProduceContentKey:(id)a3
{
  threadSafetyQ = self->_session->_threadSafetyQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(threadSafetyQ, v4);
}

uint64_t __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (__CFString *)CFCopyDescription((CFTypeRef)[*(id *)(a1 + 32) _internalContentKeySpecifier]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 136) setObject:*(void *)(a1 + 32) forKey:v2];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 64);
  uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke_2;
        block[3] = &unk_1E57B2138;
        uint64_t v10 = *(void *)(a1 + 32);
        block[4] = *(void *)(a1 + 40);
        void block[5] = v8;
        void block[6] = v10;
        dispatch_async(global_queue, block);
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __89__AVContentKeySession_AVContentKeyRequestSupport__contentKeyRequestDidProduceContentKey___block_invoke_2(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    uint64_t v1 = result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(*(id *)(v1 + 40), "contentKeySession:didProvideContentKey:", *(void *)(v1 + 32), *(void *)(v1 + 48), v3, v4);
    }
  }
  return result;
}

- (void)issuePersistableContentKeyRequestForKeySpecifier:(OpaqueFigContentKeySpecifier *)a3 initializationData:(id)a4 keyIDFromInitializationData:(id)a5 contentIdentifier:(id)a6 requestID:(unint64_t)a7 preloadingRequestOptions:(id)a8 identifier:(id)a9
{
  LOBYTE(v15) = 1;
  LOBYTE(v14) = 1;
  LOBYTE(v13) = 0;
  uint64_t v10 = [(AVContentKeyRequest *)[AVPersistableContentKeyRequest alloc] initWithContentKeySession:self contentKeyBoss:self->_session->_contentKeyBoss useContentKeyBoss:self->_session->_useContentKeyBoss keySpecifier:a3 initializationData:a4 keyIDFromInitializationData:a5 contentIdentifier:a6 isRenewalRequest:v13 requestID:a7 providesPersistableKey:v14 preloadingRequestOptions:a8 identifier:a9 supportsOfflineKey:v15];
  if (v10)
  {
    unsigned int v11 = v10;
    threadSafetyQ = self->_session->_threadSafetyQ;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __211__AVContentKeySession_AVContentKeyRequestSupport__issuePersistableContentKeyRequestForKeySpecifier_initializationData_keyIDFromInitializationData_contentIdentifier_requestID_preloadingRequestOptions_identifier___block_invoke;
    block[3] = &unk_1E57B2098;
    block[4] = self;
    void block[5] = v11;
    dispatch_sync(threadSafetyQ, block);
    [(AVContentKeySession *)self issuePersistableContentKeyRequest:v11];
  }
}

uint64_t __211__AVContentKeySession_AVContentKeyRequestSupport__issuePersistableContentKeyRequestForKeySpecifier_initializationData_keyIDFromInitializationData_contentIdentifier_requestID_preloadingRequestOptions_identifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 _requestID];
  return [v1 trackRequest:v2 byRequestID:v3];
}

- (id)keyRequestByID:(unint64_t)a3
{
  keyRequestsByRequestID = self->_session->keyRequestsByRequestID;
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
  return (id)[(NSMutableDictionary *)keyRequestsByRequestID objectForKeyedSubscript:v4];
}

- (void)trackRequest:(id)a3 byRequestID:(unint64_t)a4
{
  keyRequestsByRequestID = self->_session->keyRequestsByRequestID;
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)keyRequestsByRequestID setObject:a3 forKeyedSubscript:v6];
}

- (AVContentKeySession)initWithKeySystem:(id)a3 storageDirectoryAtURL:(id)a4 internal:(BOOL)a5
{
  uint64_t result = [(AVContentKeySession *)self initWithKeySystem:a3 storageDirectoryAtURL:a4 legacyWebKitCompatibilityMode:0];
  if (result) {
    result->_session->_internal = a5;
  }
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasProtector
{
  return [(AVContentKeyReportGroup *)self->_session->_defaultContentKeyGroup hasProtector];
}

- (id)issueContentKeyRequestForInitializationData:(id)a3
{
  uint64_t v20 = 0;
  id v21 = 0;
  if (![(AVContentKeySession *)self delegate])
  {
    id v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"valid delegate is required to deliver a key request", v6, v7, v8, v9, v10, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if (a3 && (avcks_decodeInitializationDataAndCopyInformation((uint64_t)a3, &v20, 0, 0, 0, 0), v20))
  {
    if (PKDCopyDefaultKeyIDFromSinfArray())
    {
      unsigned int v11 = 0;
      uint64_t v14 = 0;
      goto LABEL_9;
    }
    unsigned int v11 = (void *)[v21 copy];
  }
  else
  {
    unsigned int v11 = 0;
  }
  long long v12 = [AVContentKeyRequest alloc];
  LOBYTE(v18) = 0;
  uint64_t v13 = [(AVContentKeyRequest *)v12 initWithContentKeySession:self reportGroup:self->_session->_defaultContentKeyGroup identifier:0 contentIdentifier:v11 keyIDFromInitializationData:v21 initializationData:a3 preloadingRequestOptions:0 providesPersistableKey:v18];
  uint64_t v14 = (void *)v13;
  if (v13)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __97__AVContentKeySession_AVContentKeySession_Internal__issueContentKeyRequestForInitializationData___block_invoke;
    v19[3] = &unk_1E57B7798;
    v19[4] = self;
    v19[5] = v13;
    [(AVContentKeySession *)self _invokeDelegateCallbackWithBlock:v19 synchronouslyWhenDelegateQueueIsNULL:1];
  }
LABEL_9:

  return v14;
}

uint64_t __97__AVContentKeySession_AVContentKeySession_Internal__issueContentKeyRequestForInitializationData___block_invoke(uint64_t result, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    if (dword_1E9356A90)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "contentKeySession:didProvideContentKeyRequest:", *(void *)(v3 + 32), *(void *)(v3 + 40), v5, v6);
  }
  return result;
}

- (id)_weakReference
{
  return self->_session->_weakReference;
}

- (id)_contentKeyGroups
{
  return self->_session->_contentKeyGroups;
}

- (void)_sendFinishLoadingForPreloadedKeyRequest:(__CFDictionary *)a3 withRequestID:(unint64_t)a4 fromHandler:(OpaqueFigCustomURLHandler *)a5 error:(id)a6
{
  if (!FigCustomURLResponseInfoCreateMutable()
    && (!objc_msgSend((id)objc_msgSend(a6, "domain"), "isEqual:", @"CoreMediaErrorDomain")
     || [a6 code] != -17297 && objc_msgSend(a6, "code") != -17296
     || !FigCustomURLResponseInfoSetSuppressErrorLogging()))
  {
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    unsigned int v11 = *(unsigned int (**)(OpaqueFigCustomURLHandler *, unint64_t, void))(v10 + 8);
    if (v11 && !v11(a5, a4, 0))
    {
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v14 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, id, void))(v13 + 24);
      if (v14) {
        v14(a5, a4, a6, 0);
      }
    }
  }
}

- (OpaqueFigCPECryptor)copyCryptorForInitializationData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__45;
  uint64_t v20 = __Block_byref_object_dispose__45;
  uint64_t v21 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForInitializationData___block_invoke;
  block[3] = &unk_1E57B2160;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(threadSafetyQ, block);
  uint64_t v5 = (void *)v17[5];
  if (v5
    && (long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        (uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16]) != 0))
  {
    uint64_t v7 = *(void *)v12;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = (OpaqueFigCPECryptor *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) copyCryptorForIdentifier:0 initializationData:a3];
      if (v9) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
        uint64_t v9 = 0;
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForInitializationData___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(v1 + 88) copy];
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)copyCryptorForFormatDescription:(opaqueCMFormatDescription *)a3 cryptorOut:(const OpaqueFigCPECryptor *)a4 errorOut:(id *)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  signed int v7 = PKDCopyIdentifierForFormatDescription();
  if (v7) {
    signed int v8 = v7;
  }
  else {
    signed int v8 = 0;
  }
  if (a5 && v8) {
    *a5 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v8, 0);
  }
  if (a4) {
    *a4 = 0;
  }
  return v8 == 0;
}

- (OpaqueFigCPECryptor)createCryptorIfNecessaryForInitializationData:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 error:(id *)a5
{
  uint64_t result = -[AVContentKeySession copyCryptorForInitializationData:](self, "copyCryptorForInitializationData:");
  if (!result)
  {
    defaultContentKeyGroup = self->_session->_defaultContentKeyGroup;
    return [(AVContentKeyReportGroup *)defaultContentKeyGroup createCryptorIfNecessaryForIdentifier:0 initializationData:a3 formatDescription:a4 hlsMethod:0 error:a5];
  }
  return result;
}

- (OpaqueFigCPECryptor)copyCryptorForCryptKeyAttributes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__45;
  uint64_t v20 = __Block_byref_object_dispose__45;
  uint64_t v21 = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForCryptKeyAttributes___block_invoke;
  block[3] = &unk_1E57B2160;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(threadSafetyQ, block);
  uint64_t v5 = (void *)v17[5];
  if (v5
    && (long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        (uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16]) != 0))
  {
    uint64_t v7 = *(void *)v12;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = (OpaqueFigCPECryptor *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) copyCryptorForCryptKeyAttributes:a3];
      if (v9) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
        uint64_t v9 = 0;
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __86__AVContentKeySession_AVContentKeySession_Internal__copyCryptorForCryptKeyAttributes___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(v1 + 88) copy];
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 40) = result;
  }
  return result;
}

- (void)_handleRequest:(__CFDictionary *)a3 withRequestID:(unint64_t)a4 fromHandler:(OpaqueFigCustomURLHandler *)a5 willHandleRequest:(BOOL *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  CFTypeRef v32 = 0;
  id v29 = 0;
  CFTypeRef cf = 0;
  unint64_t v28 = 0;
  *a6 = 0;
  if (self->_session->_isExpired) {
    goto LABEL_10;
  }
  unint64_t v11 = [(AVContentKeySession *)self defaultGroupID];
  BOOL useContentKeyBoss = self->_session->_useContentKeyBoss;
  int v13 = FigCustomURLRequestInfoCopyCryptor();
  if (useContentKeyBoss)
  {
    FigCustomURLRequestInfoCopyCryptKeyAttributes();
    if ((unint64_t)v32 | v28 && !FigCustomURLRequestInfoCopyURL())
    {
      FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers();
      char v14 = [v29 containsObject:@"com.apple.streamingkeydelivery.persistentcontentkey"];
      int v15 = [v29 containsObject:@"com.apple.streamingkeydelivery.contentkey"];
      if (v28)
      {
        uint64_t v17 = (void *)[(id)v28 objectForKeyedSubscript:*MEMORY[0x1E4F32738]];
        id v18 = +[AVContentKeyRequest _ensureProtocolVersionList:0];
        if ([v17 isEqual:*MEMORY[0x1E4F32728]]) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 1;
        }
        unint64_t v20 = -[AVContentKeySession _processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:](self, "_processContentKeyRequestWithIdentifier:encryptionMethod:supportedProtocolVersions:options:groupID:error:", [v31 absoluteString], v19, v18, 0, v11, 0);
        *a6 = 1;
        [(AVContentKeySession *)self _sendFinishLoadingForPreloadedKeyRequest:a3 withRequestID:v20 fromHandler:a5 error:0];
        goto LABEL_10;
      }
      if ((v14 & 1) != 0 || (BOOL v16 = v32 != 0, (_os_feature_enabled_impl() ^ 1 | v16 & ~v15) != 1)) {
        -[AVContentKeySession _sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:](self, "_sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:", a3, a4, a5, [MEMORY[0x1E4F28C58] errorWithDomain:@"CoreMediaErrorDomain" code:-17297 userInfo:0]);
      }
      else {
        -[AVContentKeySession issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:](self, "issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:", a5, [v31 absoluteString], a3, a4, 0);
      }
      uint64_t v21 = 0;
      goto LABEL_31;
    }
LABEL_10:
    uint64_t v21 = 0;
    goto LABEL_32;
  }
  if (v13) {
    goto LABEL_10;
  }
  uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  long long v24 = *(void (**)(CFTypeRef, void, void, unint64_t *))(v23 + 48);
  if (v24) {
    v24(v32, *MEMORY[0x1E4F1FD90], *MEMORY[0x1E4F1CF80], &v28);
  }
  if (FigCustomURLRequestInfoCopyCryptor()) {
    goto LABEL_10;
  }
  if (v28)
  {
    uint64_t v21 = -[AVContentKeySession copyCryptorForCryptKeyAttributes:](self, "copyCryptorForCryptKeyAttributes:");
    if (v21 && !FigCFEqual())
    {
      if (dword_1E9356A90)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[AVContentKeySession _sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:](self, "_sendFinishLoadingForPreloadedKeyRequest:withRequestID:fromHandler:error:", a3, a4, a5, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreMediaErrorDomain", -17296, 0, v26, v27));
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  if (FigCustomURLRequestInfoCopyURL()) {
    goto LABEL_32;
  }
  -[AVContentKeySession issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:](self, "issueContentKeyRequestWithCustomURLHandler:identifier:requestInfo:requestID:providesPersistableKey:", a5, [v31 absoluteString], a3, a4, 0);
LABEL_31:
  *a6 = 1;
LABEL_32:
  if (cf) {
    CFRelease(cf);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (v21) {
    CFRelease(v21);
  }
}

- (int)createAndInstallCustomURLHandlerForAsset:(id)a3 outHandler:(const OpaqueFigCustomURLHandler *)a4
{
  CFTypeRef v20 = 0;
  CFTypeRef cf = 0;
  if (![a3 _figAsset])
  {
    int v10 = FigSignalErrorAt();
    goto LABEL_24;
  }
  uint64_t CMBaseObject = FigAssetGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v8 + 48);
  if (!v9)
  {
    long long v12 = 0;
LABEL_10:
    int v16 = -12782;
    goto LABEL_11;
  }
  int v10 = v9(CMBaseObject, *MEMORY[0x1E4F32208], *MEMORY[0x1E4F1CF80], &cf);
  if (v10)
  {
LABEL_24:
    int v16 = v10;
    long long v12 = 0;
    goto LABEL_11;
  }
  unint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  long long v12 = dispatch_queue_create("com.apple.avfoundation.avcontentkeysession.handler", v11);
  CFTypeRef v13 = cf;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v18 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVContentKeySession *, NSObject *, void *, void, CFTypeRef *))(v15 + 16);
  if (!v18) {
    goto LABEL_10;
  }
  int v19 = v18(v13, 400, "AVContentKeySession", self, v12, &createAndInstallCustomURLHandlerForAsset_outHandler__sHandlerCallbacks, 0, &v20);
  int v16 = v19;
  if (a4 && !v19)
  {
    *a4 = (const OpaqueFigCustomURLHandler *)v20;
    CFTypeRef v20 = 0;
  }
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v12) {
    dispatch_release(v12);
  }
  return v16;
}

- (AVContentKeyReportGroup)defaultContentKeyGroup
{
  return self->_session->_defaultContentKeyGroup;
}

- (id)makeContentKeyGroup
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = __Block_byref_object_copy__45;
  CFTypeRef v13 = __Block_byref_object_dispose__45;
  uint64_t v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = __Block_byref_object_copy__45;
  v8[4] = __Block_byref_object_dispose__45;
  v8[5] = 0;
  threadSafetyQ = self->_session->_threadSafetyQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVContentKeySession_AVContentKeyGroup_Support__makeContentKeyGroup__block_invoke;
  block[3] = &unk_1E57B3BB8;
  block[4] = self;
  void block[5] = v8;
  void block[6] = &v9;
  dispatch_sync(threadSafetyQ, block);
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

AVContentKeyReportGroup *__69__AVContentKeySession_AVContentKeyGroup_Support__makeContentKeyGroup__block_invoke(void *a1)
{
  uint64_t result = (AVContentKeyReportGroup *)a1[4];
  contentKeySessionWeakReference = result->_contentKeySessionWeakReference;
  if (!LOBYTE(contentKeySessionWeakReference[5].super.isa))
  {
    uint64_t v4 = 0;
    if (!contentKeySessionWeakReference[21].super.isa
      || (uint64_t result = (AVContentKeyReportGroup *)[(AVContentKeyReportGroup *)result _makeContentKeyGroupWithIDOut:&v4 error:*(void *)(a1[5] + 8) + 40], result))
    {
      uint64_t result = -[AVContentKeyReportGroup initWithKeySystem:keySession:contentKeyBoss:useContentKeyBoss:groupID:storageDirectoryAtURL:]([AVContentKeyReportGroup alloc], "initWithKeySystem:keySession:contentKeyBoss:useContentKeyBoss:groupID:storageDirectoryAtURL:", *(void *)(*(void *)(a1[4] + 8) + 72));
      *(void *)(*(void *)(a1[6] + 8) + 40) = result;
      if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
        return (AVContentKeyReportGroup *)objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 88), "addObject:");
      }
    }
  }
  return result;
}

- (unint64_t)_processContentKeyRequestWithIdentifier:(id)a3 encryptionMethod:(int)a4 supportedProtocolVersions:(id)a5 options:(id)a6 groupID:(unint64_t)a7 error:(id *)a8
{
  v29[1] = *MEMORY[0x1E4F143B8];
  unint64_t v26 = 0;
  CFTypeRef cf = 0;
  CFTypeRef v25 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a8) {
        return 0;
      }
      uint64_t v28 = *MEMORY[0x1E4F1D138];
      v29[0] = @"identifier is not string or url";
      CFTypeRef v13 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1]);
      unint64_t result = 0;
      *a8 = v13;
      return result;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a3 absoluteString];
  }
  signed int v15 = FigContentKeySpecifierCreate();
  if (v15) {
    goto LABEL_29;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable)
  {
    signed int v15 = FigSignalErrorAt();
LABEL_29:
    signed int v23 = v15;
    goto LABEL_19;
  }
  CFMutableDictionaryRef v17 = Mutable;
  FigCFDictionarySetBoolean();
  signed int v18 = FigContentKeyRequestParamsCreate();
  if (v18)
  {
    signed int v23 = v18;
    goto LABEL_31;
  }
  contentKeyBoss = self->_session->_contentKeyBoss;
  uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, unint64_t, void, void, void, void, void, void, unint64_t *, CFMutableDictionaryRef, CFTypeRef *))(v21 + 8);
  if (!v22)
  {
    long long v24 = 0;
    signed int v23 = -12782;
    goto LABEL_18;
  }
  signed int v23 = v22(contentKeyBoss, v25, a7, 0, 0, 0, 0, 0, 0, &v26, v17, &v25);
  if (v23)
  {
LABEL_31:
    long long v24 = 0;
    goto LABEL_18;
  }
  long long v24 = [[AVContentKeyRequestParams alloc] initWithInitializationData:0 contentIdentifier:0 keyIDFromInitializationData:0 options:a6 identifier:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_session->keyRequestParamsByRequestID, "setObject:forKeyedSubscript:", v24, [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v26]);
LABEL_18:

  CFRelease(v17);
LABEL_19:
  if (cf) {
    CFRelease(cf);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (a8)
  {
    if (v23) {
      *a8 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v23, 0);
    }
  }
  return v26;
}

- (BOOL)_renewKeyWithIdentifier:(id)a3 encryptionMethod:(int)a4 initializationData:(id)a5 contentIdentifier:(id)a6 keyIDFromInitializationData:(id)a7 options:(id)a8 error:(id *)a9
{
  v38[1] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  id v35 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a9) {
        return 0;
      }
      uint64_t v37 = *MEMORY[0x1E4F1D138];
      v38[0] = @"identifier is not string or url";
      uint64_t v28 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1]);
      BOOL v27 = 0;
      goto LABEL_27;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a3 absoluteString];
  }
  signed int v15 = FigContentKeySpecifierCreate();
  if (v15) {
    goto LABEL_30;
  }
  contentKeyBoss = self->_session->_contentKeyBoss;
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  int v19 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, CFTypeRef, void, void, void, id *))(v18 + 48);
  if (!v19)
  {
    BOOL v27 = 0;
    uint64_t v20 = 0;
    signed int v26 = -12782;
    goto LABEL_20;
  }
  signed int v15 = v19(contentKeyBoss, cf, 0, 0, 0, &v35);
  if (v15)
  {
LABEL_30:
    signed int v26 = v15;
    BOOL v27 = 0;
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = [[AVContentKeyRequestParams alloc] initWithInitializationData:a5 contentIdentifier:a6 keyIDFromInitializationData:a7 options:a8 identifier:a3];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v35;
    uint64_t v22 = [v35 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          [(NSMutableDictionary *)self->_session->keyRequestParamsByRequestID setObject:v20 forKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v23);
    }
    signed int v26 = 0;
    BOOL v27 = 1;
  }
LABEL_20:

  if (cf) {
    CFRelease(cf);
  }
  if (a9 && v26)
  {
    uint64_t v28 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v26, 0);
LABEL_27:
    *a9 = v28;
  }
  return v27;
}

- (BOOL)_makeContentKeyGroupWithIDOut:(unint64_t *)a3 error:(id *)a4
{
  contentKeyBoss = self->_session->_contentKeyBoss;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t *))(v8 + 64);
  if (v9)
  {
    signed int v10 = v9(contentKeyBoss, a3);
    if (!a4) {
      return v10 == 0;
    }
  }
  else
  {
    signed int v10 = -12782;
    if (!a4) {
      return v10 == 0;
    }
  }
  if (v10) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v10, 0);
  }
  return v10 == 0;
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  contentKeyBoss = self->_session->_contentKeyBoss;
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    id v5 = (unsigned int (*)(OpaqueFigContentKeyBoss *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(contentKeyBoss, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

@end