@interface IDSDeliveryController
+ (id)sharedInstance;
+ (id)tokenURINegativeCacheItemForTokenURI:(id)a3 service:(id)a4;
- (BOOL)_forceAttachmentForMessage:(id)a3;
- (BOOL)_sendAsAttachmentForMessage:(id)a3 payloadData:(id)a4;
- (BOOL)isSupportedEngramVersionNumber:(int64_t)a3;
- (BOOL)shouldMinimizeBagCacheTime;
- (IDSDeliveryController)init;
- (id)_constructDeliveryPipeline;
- (id)_constructOfflineDeliveryPipeline;
- (id)_keyForURIs:(id)a3 service:(id)a4;
- (id)_tokenURIForToken:(id)a3 uri:(id)a4;
- (id)awdLogger;
- (id)encryptionController;
- (id)keyTransparencyVerifier;
- (id)peerIDManager;
- (id)pinnedIdentityController;
- (int64_t)_maxPayloadSizeForMessage:(id)a3;
- (int64_t)effectiveMaxPayloadSizeIfCanUseLargePayload:(BOOL)a3;
- (int64_t)groupCryptoMinVersionNumber;
- (unint64_t)_destinationCountForURIsAndTokens:(id)a3;
- (void)_checkFastDormancy;
- (void)_discardMessage:(id)a3 forURIs:(id)a4 service:(id)a5;
- (void)_emptyMessagesForURIs:(id)a3 service:(id)a4;
- (void)_handleAccessoryMessageForID:(id)a3 msg:(id)a4 service:(id)a5 fromID:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8;
- (void)_handleMessagesForURIs:(id)a3 originalURIs:(id)a4 service:(id)a5 fromID:(id)a6 fromCoalesceQueue:(BOOL)a7 withQueryCompletion:(id)a8;
- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5;
- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5 withCompletion:(id)a6;
- (void)_pipelinesHandleMessagesToCoalesce:(id)a3 forService:(id)a4 sendMode:(id)a5;
- (void)_processMessageResponse:(id)a3 error:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9;
- (void)_queueMessage:(id)a3 service:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 originallyToURIs:(id)a12 ktURIVerificationMap:(id)a13 canUseLargePayload:(BOOL)a14 sendOnePerToken:(BOOL)a15 registrationProperties:(id)a16 fakeMessage:(BOOL)a17 alwaysSkipSelf:(BOOL)a18 alwaysIncludeSelf:(BOOL)a19 forceQuery:(int64_t)a20 disallowRefresh:(BOOL)a21 prioritizedTokenList:(id)a22 wantsFirewallDonation:(BOOL)a23 destinationObject:(id)a24 willSendBlock:(id)a25 completionBlock:(id)a26 fromCoalesceQueue:(BOOL)a27;
- (void)_sendAttachmentWithGuid:(id)a3 service:(id)a4 topic:(id)a5 originalCommand:(id)a6 additionalDictionary:(id)a7 encryptedData:(id)a8 toToken:(id)a9 toID:(id)a10 fromID:(id)a11 fromIdentity:(id)a12 canUseLargePayload:(BOOL)a13 expirationDate:(id)a14 destinationObject:(id)a15 ackBlock:(id)a16 completionBlock:(id)a17;
- (void)_sendErrorDictionary:(id)a3 onService:(id)a4 fromID:(id)a5 fromIdentity:(id)a6 toID:(id)a7 toToken:(id)a8 topic:(id)a9 sendCompletionBlock:(id)a10;
- (void)_sendFTFanoutMessage:(id)a3 service:(id)a4 fromID:(id)a5 toURIs:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8;
- (void)_sendFTMessage:(id)a3 service:(id)a4 fromID:(id)a5 toID:(id)a6 toToken:(id)a7 toSessionToken:(id)a8 toURIs:(id)a9 fromIdentity:(id)a10 completionBlock:(id)a11;
- (void)_sendMessage:(id)a3 dataToEncrypt:(id)a4 withEncryptedAttributes:(id)a5 onService:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 canUseLargePayload:(BOOL)a12 sendOnePerToken:(BOOL)a13 allowPartialSendsToSucceed:(BOOL)a14 registrationProperties:(id)a15 fakeMessage:(BOOL)a16 alwaysSkipSelf:(BOOL)a17 alwaysIncludeSelf:(BOOL)a18 forceQuery:(int64_t)a19 disallowRefresh:(BOOL)a20 prioritizedTokenList:(id)a21 wantsFirewallDonation:(BOOL)a22 destinationObject:(id)a23 willSendBlock:(id)a24 completionBlock:(id)a25 firstAttemptDate:(id)a26 ktURIVerificationMap:(id)a27 fromCoalesceQueue:(BOOL)a28 withQueryCompletion:(id)a29;
- (void)_sendMessageDictionary:(id)a3 lastRetryInterval:(double)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 canUseLargePayload:(BOOL)a9 sendOnePerToken:(BOOL)a10 allowPartialSendsToSucceed:(BOOL)a11 highPriority:(BOOL)a12 fireAndForget:(BOOL)a13 expirationDate:(id)a14 enforceRemoteTimeouts:(BOOL)a15 messageID:(id)a16 fromID:(id)a17 fromShortHandle:(id)a18 fromIdentity:(id)a19 toID:(id)a20 toURIs:(id)a21 accessToken:(id)a22 topic:(id)a23 registrationProperties:(id)a24 fakeMessage:(BOOL)a25 alwaysSkipSelf:(BOOL)a26 alwaysIncludeSelf:(BOOL)a27 forceQuery:(int64_t)a28 pushPriority:(id)a29 ignoreMaxRetryCount:(BOOL)a30 disallowRefresh:(BOOL)a31 originalTimestamp:(id)a32 prioritizedTokenList:(id)a33 wantsFirewallDonation:(BOOL)a34 destinationObject:(id)a35 deliveryMinimumTimeDelay:(id)a36 deliveryMinimumTime:(id)a37 sendMode:(id)a38 KTURIVerificationMap:(id)a39 ackBlock:(id)a40 willSendBlock:(id)a41 sendCompletionBlock:(id)a42;
- (void)addTokenURINegativeCacheClearBlock;
- (void)dealloc;
- (void)handler:(id)a3 isConnectedChanged:(BOOL)a4;
- (void)queueManager:(id)a3 receivedMessagesToSend:(id)a4 forTopic:(id)a5 sendMode:(id)a6;
- (void)sendIDSMessage:(id)a3 service:(id)a4 topic:(id)a5 completionBlock:(id)a6;
- (void)sendMessageDictionary:(id)a3 messageID:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 expirationDate:(id)a9 enforceRemoteTimeouts:(BOOL)a10 canUseLargePayload:(BOOL)a11 sendOnePerToken:(BOOL)a12 allowPartialSendsToSucceed:(BOOL)a13 priority:(int64_t)a14 fireAndForget:(BOOL)a15 fromID:(id)a16 fromShortHandle:(id)a17 fromIdentity:(id)a18 toURIs:(id)a19 accessToken:(id)a20 topic:(id)a21 registrationProperties:(id)a22 fakeMessage:(BOOL)a23 alwaysSkipSelf:(BOOL)a24 alwaysIncludeSelf:(BOOL)a25 forceQuery:(int64_t)a26 pushPriority:(id)a27 ignoreMaxRetryCount:(BOOL)a28 disallowRefresh:(BOOL)a29 originalTimestamp:(id)a30 prioritizedTokenList:(id)a31 wantsFirewallDonation:(BOOL)a32 destinationObject:(id)a33 deliveryMinimumTimeDelay:(id)a34 deliveryMinimumTime:(id)a35 sendMode:(id)a36 KTURIVerificationMap:(id)a37 ackBlock:(id)a38 willSendBlock:(id)a39 sendCompletionBlock:(id)a40;
- (void)sendRTCMetricWithStartDate:(id)a3 endDate:(id)a4 endpointCount:(int64_t)a5 usedPipeline:(BOOL)a6 usedMMCS:(BOOL)a7 responseCode:(int64_t)a8;
- (void)setSenderKeyDistributionManager:(id)a3;
@end

@implementation IDSDeliveryController

- (int64_t)effectiveMaxPayloadSizeIfCanUseLargePayload:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (uint64_t)[(FTMessageDelivery *)self->_messageDelivery maxLargeMessageSize];
  unint64_t v6 = v5 & ~(v5 >> 63);
  uint64_t v7 = (uint64_t)[(FTMessageDelivery *)self->_messageDelivery maxMessageSize];
  unint64_t v8 = v7 & ~(v7 >> 63);
  int v9 = _os_feature_enabled_impl();
  int v10 = v9;
  if (v6 <= v8) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v6;
  }
  if (!v3) {
    uint64_t v11 = v8;
  }
  double v12 = 0.6;
  if (v3) {
    double v12 = 0.9;
  }
  uint64_t v13 = (uint64_t)(v12 * (double)v11);
  if ((v3 & v9) != 0) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.8;
  }
  uint64_t v15 = v11 - 1000;
  if (v15 >= v13) {
    uint64_t v15 = v13;
  }
  int64_t v16 = (uint64_t)(v14 * (double)v15);
  v17 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"NO";
    int v21 = 134219010;
    int64_t v22 = v16;
    if (v3) {
      CFStringRef v19 = @"YES";
    }
    else {
      CFStringRef v19 = @"NO";
    }
    __int16 v23 = 2112;
    CFStringRef v24 = v19;
    if (v10) {
      CFStringRef v18 = @"YES";
    }
    __int16 v25 = 2112;
    CFStringRef v26 = v18;
    __int16 v27 = 2048;
    unint64_t v28 = v6;
    __int16 v29 = 2048;
    unint64_t v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "-effectiveMaxPayloadSizeIfCanUseLargePayload: {effectiveSizeToReturn: %ld, canUseLargePayload: %@, ReducedLargePayloadSizeOverhead: %@, courierAllowedLargeSize: %ld, courierAllowedNormalSize: %ld}", (uint8_t *)&v21, 0x34u);
  }

  return v16;
}

+ (id)sharedInstance
{
  if (qword_100A4AA28 != -1) {
    dispatch_once(&qword_100A4AA28, &stru_100985650);
  }
  v2 = (void *)qword_100A4AA30;

  return v2;
}

- (IDSDeliveryController)init
{
  v17.receiver = self;
  v17.super_class = (Class)IDSDeliveryController;
  v2 = [(IDSDeliveryController *)&v17 init];
  if (v2)
  {
    uint64_t v3 = sub_1001BBA80();
    messageDelivery = v2->_messageDelivery;
    v2->_messageDelivery = (FTMessageDelivery *)v3;

    uint64_t v5 = (IDSRateLimiter *)[objc_alloc((Class)IDSRateLimiter) initWithLimit:10 timeLimit:1800.0];
    tokenURINegativeCache = v2->_tokenURINegativeCache;
    v2->_tokenURINegativeCache = v5;

    uint64_t v7 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    unint64_t v8 = im_primary_queue();
    [v7 addListener:v2 topics:0 commands:0 queue:v8];

    int v9 = [IDSCoalesceMessageQueueManager alloc];
    int v10 = +[IDSServerBag sharedInstance];
    uint64_t v11 = [(IDSCoalesceMessageQueueManager *)v9 initWithBag:v10];
    coalesceMessageQueueManager = v2->_coalesceMessageQueueManager;
    v2->_coalesceMessageQueueManager = v11;

    [(IDSCoalesceMessageQueueManager *)v2->_coalesceMessageQueueManager setDelegate:v2];
    [(FTMessageDelivery *)v2->_messageDelivery setDisallowRetry:0];
    if ([(IDSDeliveryController *)v2 shouldMinimizeBagCacheTime])
    {
      uint64_t v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Forcing a bag fetch to refresh EN versioning", v16, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      double v14 = +[IDSServerBag sharedInstance];
      [v14 forceBagLoad];
    }
    [(IDSDeliveryController *)v2 addTokenURINegativeCacheClearBlock];
  }
  return v2;
}

- (void)setSenderKeyDistributionManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_senderKeyDistributionManager, a3);
    id v5 = v6;
  }
}

- (void)dealloc
{
  uint64_t v3 = +[IMMobileNetworkManager sharedInstance];
  [v3 removeFastDormancyDisableToken:@"IDSDeliveryManager"];

  v4 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  [v4 removeListener:self];

  v5.receiver = self;
  v5.super_class = (Class)IDSDeliveryController;
  [(IDSDeliveryController *)&v5 dealloc];
}

- (id)awdLogger
{
  return +[IDSAWDLogging sharedInstance];
}

- (BOOL)shouldMinimizeBagCacheTime
{
  return 0;
}

- (int64_t)groupCryptoMinVersionNumber
{
  if ([(IDSDeliveryController *)self shouldMinimizeBagCacheTime])
  {
    v2 = +[IDSServerBag sharedInstance];
    [v2 startBagLoad];
  }
  uint64_t v3 = +[IDSServerBag sharedInstance];
  v4 = [v3 objectForKey:@"gc-min-version"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v5 = (int)[v4 intValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isSupportedEngramVersionNumber:(int64_t)a3
{
  return [(IDSDeliveryController *)self groupCryptoMinVersionNumber] <= a3;
}

- (void)addTokenURINegativeCacheClearBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v3 = [(IDSDeliveryController *)self peerIDManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001CFA7C;
  v4[3] = &unk_100985678;
  objc_copyWeak(&v5, &location);
  [v3 addClientDataUpdateBlock:v4 forToken:@"ratelimiter-clear-on-success"];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)tokenURINegativeCacheItemForTokenURI:(id)a3 service:(id)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    uint64_t v7 = [a3 prefixedURI];
    v4 = +[NSString stringWithFormat:@"%@-%@", v7, v6];
  }

  return v4;
}

- (void)handler:(id)a3 isConnectedChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && [(NSMutableArray *)self->_pendingOfflineMessages count])
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NSMutableArray *)self->_pendingOfflineMessages count];
      *(_DWORD *)buf = 134218240;
      id v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = 0x4024000000000000;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSDelivery has %lu pending offline messages and sees that push is now connected - scheduling a send attempt in %f seconds.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [(NSMutableArray *)self->_pendingOfflineMessages count];
      _IDSLogV();
    }
    int v9 = self->_pendingOfflineMessages;
    pendingOfflineMessages = self->_pendingOfflineMessages;
    self->_pendingOfflineMessages = 0;

    uint64_t v11 = v9;
    im_dispatch_after_primary_queue();
  }
}

- (void)_processMessageResponse:(id)a3 error:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9
{
  id v15 = a3;
  id v45 = a4;
  id v46 = a6;
  id v47 = a7;
  id v16 = a8;
  id v17 = a9;
  if (a5 == 7000)
  {
    v40 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v47;
      __int16 v50 = 2112;
      id v51 = v46;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Message was rate limited from the server, failing message (%@ -> %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  else if (a5 == 5032)
  {
    id v43 = v17;
    v44 = self;
    CFStringRef v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Bad signature for message: %@    blowing peer tokens", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v41 = v15;
      _IDSLogV();
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v15 targetPeerID];
        *(_DWORD *)buf = 138412290;
        id v49 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " targetPeerID: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v41 = [v15 targetPeerID];
        _IDSLogV();
      }
      int v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v22 = [v15 sourcePeerID];
        *(_DWORD *)buf = 138412290;
        id v49 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, " sourcePeerID: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v41 = [v15 sourcePeerID];
        _IDSLogV();
      }
      __int16 v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v24 = [v15 targetToken];
        *(_DWORD *)buf = 138412290;
        id v49 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "  targetToken: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v41 = [v15 targetToken];
        _IDSLogV();
      }
      __int16 v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v26 = [v15 targetSessionToken];
        *(_DWORD *)buf = 138412290;
        id v49 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " sessionToken: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v41 = [v15 targetSessionToken];
        _IDSLogV();
      }
      __int16 v27 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v16;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "      service: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v41 = v16;
        _IDSLogV();
      }
      unint64_t v28 = [(IDSDeliveryController *)self peerIDManager];
      __int16 v29 = [v15 targetPeerID];
      unint64_t v30 = +[IDSURI URIWithPrefixedURI:v29 withServiceLoggingHint:v16];
      v31 = [v15 targetToken];
      v32 = +[IDSPushToken pushTokenWithData:v31 withServiceLoggingHint:v16];
      v33 = [v15 sourcePeerID];
      v34 = +[IDSURI URIWithPrefixedURI:v33 withServiceLoggingHint:v16];
      LOBYTE(v42) = 0;
      v35 = [v28 sessionTokenForURI:v30 pushToken:v32 fromURI:v34 service:v16 expirationDate:0 refreshDate:0 fromIdentity:v43 includeSelfDevice:v42];

      v36 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v35;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, " current sessionToken: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v41 = v35;
        _IDSLogV();
      }
    }
    v37 = [(IDSDeliveryController *)v44 peerIDManager];
    v38 = +[IDSURI URIWithPrefixedURI:v46 withServiceLoggingHint:v16];
    v39 = +[IDSURI URIWithPrefixedURI:v47 withServiceLoggingHint:v16];
    [v37 forgetPeerTokensForURI:v38 fromURI:v39 service:v16];

    id v17 = v43;
  }
}

- (id)_keyForURIs:(id)a3 service:(id)a4
{
  id v5 = a4;
  id v6 = +[NSMutableSet setWithArray:a3];
  [v6 addObject:v5];

  return v6;
}

- (void)_checkFastDormancy
{
  id v2 = [(NSMutableDictionary *)self->_messageQueue count];
  uint64_t v3 = +[IMMobileNetworkManager sharedInstance];
  id v4 = v3;
  if (v2) {
    [v3 addFastDormancyDisableToken:@"IDSDeliveryManager"];
  }
  else {
    [v3 removeFastDormancyDisableToken:@"IDSDeliveryManager"];
  }
}

- (void)_handleAccessoryMessageForID:(id)a3 msg:(id)a4 service:(id)a5 fromID:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v30 = a5;
  id v31 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = [v13 firstObject];
  CFStringRef v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Message is destined for an accessory with uri %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unint64_t v28 = v17;
    _IDSLogV();
  }
  CFStringRef v19 = objc_msgSend(v14, "accessToken", v28);

  if (v19)
  {
    v20 = [v17 prefixedURI];
    unsigned int v21 = [v20 hasPrefix:@"accessory:"];

    if (v21)
    {
      id v22 = [v17 unprefixedURI];
    }
    else
    {
      __int16 v23 = [v17 prefixedURI];
      id v22 = [v23 copy];
    }
    [v14 setTargetPeerID:v22];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001D0F8C;
    v32[3] = &unk_1009856A0;
    id v24 = v14;
    id v33 = v24;
    id v25 = v17;
    id v34 = v25;
    id v35 = v16;
    CFStringRef v26 = objc_retainBlock(v32);
    __int16 v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending To %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    [(IDSDeliveryController *)self _sendFTMessage:v24 service:v30 fromID:v31 toID:v22 toToken:0 toSessionToken:0 toURIs:0 fromIdentity:v15 completionBlock:v26];
  }
}

- (void)_handleMessagesForURIs:(id)a3 originalURIs:(id)a4 service:(id)a5 fromID:(id)a6 fromCoalesceQueue:(BOOL)a7 withQueryCompletion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v37 = a4;
  id v40 = a5;
  id v15 = a6;
  v36 = (void (**)(id, id))a8;
  value = v14;
  if ([v14 count])
  {
    v41 = self;
    id v35 = [(IDSDeliveryController *)self _keyForURIs:v37 service:v40];
    id v16 = [(NSMutableDictionary *)self->_messageQueue objectForKey:v35];
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v14;
      __int16 v51 = 2112;
      id v52 = v37;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Handling message queue With Fanout for display IDs: %@  (originalURIs: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v33 = v14;
      id v34 = v37;
      _IDSLogV();
    }
    CFStringRef v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = [(NSMutableDictionary *)self->_messageQueue allKeys];
      *(_DWORD *)buf = 138412290;
      id v50 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "   Queue: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v33 = [(NSMutableDictionary *)self->_messageQueue allKeys];
      _IDSLogV();
    }
    id v39 = objc_alloc_init((Class)NSMutableArray);
    id v38 = objc_alloc_init((Class)NSMutableArray);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v16;
    id v20 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v45;
      uint64_t v22 = IDSDeliveryFromIDKey;
      __int16 v23 = (const void *)IDSDeliveryFinalURIsKey;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (v15
            && ([*(id *)(*((void *)&v44 + 1) + 8 * i) objectForKeyedSubscript:v22],
                CFStringRef v26 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v27 = [v15 isEqualToString:v26],
                v26,
                (v27 & 1) == 0))
          {
            [v38 addObject:v25];
          }
          else if (v9)
          {
            unint64_t v28 = (__CFDictionary *)objc_msgSend(v25, "mutableCopy", v33, v34);
            __int16 v29 = v28;
            if (value) {
              CFDictionarySetValue(v28, v23, value);
            }
            [v39 addObject:v29];
          }
          else
          {
            [(IDSDeliveryController *)v41 _pipelineHandleMessage:v25 forURIs:value service:v40];
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v20);
    }

    v36[2](v36, v39);
    if (obj)
    {
      if ([v38 count])
      {
        id v30 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v50 = v15;
          __int16 v51 = 2112;
          id v52 = v38;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, " FromID didn't match some messages, keeping some messages in queue {fromID: %@, toKeep: %@}", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v33 = v15;
          id v34 = v38;
          _IDSLogV();
        }
        -[NSMutableDictionary setObject:forKey:](v41->_messageQueue, "setObject:forKey:", v38, v35, v33, v34);
      }
      else
      {
        id v31 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " Flushing message queue", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        -[NSMutableDictionary removeObjectForKey:](v41->_messageQueue, "removeObjectForKey:", v35, v33);
        if (![(NSMutableDictionary *)v41->_messageQueue count])
        {
          messageQueue = v41->_messageQueue;
          v41->_messageQueue = 0;
        }
      }
    }
    [(IDSDeliveryController *)v41 _checkFastDormancy];
  }
}

- (BOOL)_sendAsAttachmentForMessage:(id)a3 payloadData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:IDSDeliveryMessageKey];
  BOOL v9 = [v8 messageBody];
  int v10 = [v9 objectForKey:IDSCommandKey];
  unint64_t v11 = [(IDSDeliveryController *)self _maxPayloadSizeForMessage:v6];
  double v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Checking the estimated payload size for message not requesting encryption... %d B", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v19 = [v9 count];
    _IDSLogV();
  }
  BOOL v13 = -[IDSDeliveryController _forceAttachmentForMessage:](self, "_forceAttachmentForMessage:", v6, v19);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v14 = [v7 length];
    if ((unint64_t)v14 >= v11) {
      BOOL v13 = 1;
    }
  }
  else
  {
    id v14 = 0;
  }
  if ([v10 integerValue] == (id)104)
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attachment commands must not be forced to send as attachments", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    BOOL v13 = 0;
  }
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    if (v13) {
      CFStringRef v17 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v21 = v17;
    __int16 v22 = 2048;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, " sendAsAttachment? %@ The payload is %lu bytes.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }

  return v13;
}

- (BOOL)_forceAttachmentForMessage:(id)a3
{
  int v3 = IMGetCachedDomainBoolForKey();
  if (v3) {
    _IMWarn();
  }
  return v3;
}

- (int64_t)_maxPayloadSizeForMessage:(id)a3
{
  id v4 = [a3 objectForKey:IDSDeliveryCanUseLargePayloadKey];
  id v5 = [v4 BOOLValue];

  return [(IDSDeliveryController *)self effectiveMaxPayloadSizeIfCanUseLargePayload:v5];
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance];
}

- (id)keyTransparencyVerifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance];
}

- (id)encryptionController
{
  return +[IDSEncryptionController sharedInstance];
}

- (id)pinnedIdentityController
{
  return +[IDSPinnedIdentityController sharedInstance];
}

- (unint64_t)_destinationCountForURIsAndTokens:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [v3 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)v7)];
        BOOL v9 = [v8 objectForKey:@"push-tokens"];
        id v10 = [v9 count];

        v4 += (unint64_t)v10;
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  unint64_t v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = +[NSNumber numberWithUnsignedInteger:v4];
    *(_DWORD *)buf = 138412290;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We will send %@ individual messages", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v14 = +[NSNumber numberWithUnsignedInteger:v4];
    _IDSLogV();
  }
  return v4;
}

- (void)_emptyMessagesForURIs:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    messageQueue = self->_messageQueue;
    BOOL v9 = [(IDSDeliveryController *)self _keyForURIs:v6 service:v7];
    id v10 = [(NSMutableDictionary *)messageQueue objectForKey:v9];

    if (v10)
    {
      unint64_t v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Emptying message queue for URIs: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v16 = v6;
        _IDSLogV();
      }
      double v12 = self->_messageQueue;
      BOOL v13 = -[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:", v6, v7, v16);
      [(NSMutableDictionary *)v12 removeObjectForKey:v13];

      if (![(NSMutableDictionary *)self->_messageQueue count])
      {
        id v14 = self->_messageQueue;
        self->_messageQueue = 0;
      }
    }
    else
    {
      long long v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No queued items to remove for URIs: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v16 = v6;
        _IDSLogV();
      }
    }
    [(IDSDeliveryController *)self _checkFastDormancy];
  }
}

- (void)_discardMessage:(id)a3 forURIs:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    messageQueue = self->_messageQueue;
    double v12 = [(IDSDeliveryController *)self _keyForURIs:v9 service:v10];
    BOOL v13 = [(NSMutableDictionary *)messageQueue objectForKey:v12];

    if (v13 && (id v14 = [v13 indexOfObjectIdenticalTo:v8], v14 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      id v16 = v14;
      long long v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing message from queue for URIs: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v21 = v9;
        _IDSLogV();
      }
      objc_msgSend(v13, "removeObjectAtIndex:", v16, v21);
      if (![v13 count])
      {
        id v18 = self->_messageQueue;
        id v19 = [(IDSDeliveryController *)self _keyForURIs:v9 service:v10];
        [(NSMutableDictionary *)v18 removeObjectForKey:v19];

        if (![(NSMutableDictionary *)self->_messageQueue count])
        {
          id v20 = self->_messageQueue;
          self->_messageQueue = 0;
        }
      }
    }
    else
    {
      long long v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No queued message matched for removal for URIs: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v21 = v9;
        _IDSLogV();
      }
    }
    [(IDSDeliveryController *)self _checkFastDormancy];
  }
}

- (void)_queueMessage:(id)a3 service:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 originallyToURIs:(id)a12 ktURIVerificationMap:(id)a13 canUseLargePayload:(BOOL)a14 sendOnePerToken:(BOOL)a15 registrationProperties:(id)a16 fakeMessage:(BOOL)a17 alwaysSkipSelf:(BOOL)a18 alwaysIncludeSelf:(BOOL)a19 forceQuery:(int64_t)a20 disallowRefresh:(BOOL)a21 prioritizedTokenList:(id)a22 wantsFirewallDonation:(BOOL)a23 destinationObject:(id)a24 willSendBlock:(id)a25 completionBlock:(id)a26 fromCoalesceQueue:(BOOL)a27
{
  id v32 = a3;
  id v33 = a4;
  id value = a5;
  id v82 = a6;
  id v77 = a7;
  id v78 = a8;
  id v34 = v33;
  id v79 = a9;
  id v80 = a10;
  id v35 = a11;
  id v36 = a12;
  id v73 = a13;
  id v76 = a16;
  id v75 = a22;
  id v74 = a24;
  id v72 = a25;
  id v37 = a26;
  id v38 = [v35 count];
  if (v32 && v38)
  {
    id v39 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v84 = v32;
      __int16 v85 = 2112;
      id v86 = v35;
      __int16 v87 = 2112;
      v88 = v34;
      __int16 v89 = 2112;
      id v90 = v36;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Enqueuing message: %@  to people: %@ service: %@ (original: %@)", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v67 = v34;
      id v68 = v36;
      id v65 = v32;
      id v66 = v35;
      _IDSLogV();
    }
    if (objc_msgSend(v36, "count", v65, v66, v67, v68)) {
      id v40 = v36;
    }
    else {
      id v40 = v35;
    }
    id v41 = v40;
    messageQueue = self->_messageQueue;
    id v69 = v41;
    id v43 = -[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:");
    id v44 = [(NSMutableDictionary *)messageQueue objectForKey:v43];

    if (!v44)
    {
      id v44 = objc_alloc_init((Class)NSMutableArray);
      long long v45 = self;
      long long v46 = self->_messageQueue;
      if (!v46)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v48 = self->_messageQueue;
        self->_messageQueue = Mutable;

        long long v46 = self->_messageQueue;
        long long v45 = self;
      }
      id v49 = [(IDSDeliveryController *)v45 _keyForURIs:v69 service:v34];
      [(NSMutableDictionary *)v46 setObject:v44 forKey:v49];
    }
    if (v37)
    {
      id v50 = [v37 copy];
      id v51 = objc_retainBlock(v50);
    }
    else
    {
      id v51 = 0;
    }
    if (v72)
    {
      id v52 = [v72 copy];
      id v70 = objc_retainBlock(v52);
    }
    else
    {
      id v70 = 0;
    }
    v53 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFDictionarySetValue(v53, IDSDeliveryMessageKey, v32);
    if (value) {
      CFDictionarySetValue(v53, IDSDeliveryDataToEncryptKey, value);
    }
    if (v82) {
      CFDictionarySetValue(v53, IDSDeliveryEncryptionAttributesKey, v82);
    }
    id v54 = objc_retainBlock(v51);
    if (v54) {
      CFDictionarySetValue(v53, IDSDeliveryCompletionBlockKey, v54);
    }

    id v55 = objc_retainBlock(v70);
    if (v55) {
      CFDictionarySetValue(v53, IDSDeliveryWillSendBlockKey, v55);
    }

    if (v77) {
      CFDictionarySetValue(v53, IDSDeliveryFromIDKey, v77);
    }
    if (v78) {
      CFDictionarySetValue(v53, IDSDeliveryFromShortHandle, v78);
    }
    if (v79) {
      CFDictionarySetValue(v53, IDSDeliveryFromIdentityKey, v79);
    }
    if (v80) {
      CFDictionarySetValue(v53, IDSDeliveryToIDKey, v80);
    }
    if (v36) {
      CFDictionarySetValue(v53, IDSDeliveryOriginalURIsKey, v36);
    }
    if (v34) {
      CFDictionarySetValue(v53, IDSDeliveryServiceKey, v34);
    }
    v56 = +[NSNumber numberWithBool:a14];
    if (v56) {
      CFDictionarySetValue(v53, IDSDeliveryCanUseLargePayloadKey, v56);
    }

    v57 = +[NSNumber numberWithBool:a15];
    if (v57) {
      CFDictionarySetValue(v53, IDSDeliverySendOnePerTokenKey, v57);
    }

    if (v76) {
      CFDictionarySetValue(v53, IDSDeliveryRegistrationPropertiesKey, v76);
    }
    v58 = +[NSNumber numberWithBool:a17];
    if (v58) {
      CFDictionarySetValue(v53, IDSDeliveryFakeMessageKey, v58);
    }

    v59 = +[NSNumber numberWithBool:a18];
    if (v59) {
      CFDictionarySetValue(v53, IDSDeliveryAlwaysSkipSelfKey, v59);
    }

    v60 = +[NSNumber numberWithBool:a19];
    if (v60) {
      CFDictionarySetValue(v53, IDSDeliveryAlwaysIncludeSelfKey, v60);
    }

    v61 = +[NSNumber numberWithInteger:a20];
    if (v61) {
      CFDictionarySetValue(v53, IDSDeliveryForceQueryKey, v61);
    }

    v62 = +[NSNumber numberWithBool:a21];
    if (v62) {
      CFDictionarySetValue(v53, IDSDeliveryDisallowQueryRefreshKey, v62);
    }

    if (v75) {
      CFDictionarySetValue(v53, IDSDeliveryPrioritizedTokenListKey, v75);
    }
    v63 = +[NSNumber numberWithBool:a23];
    if (v63) {
      CFDictionarySetValue(v53, IDSDeliveryWantsFirewallDonation, v63);
    }

    if (v74) {
      CFDictionarySetValue(v53, IDSDeliveryIDSDestinationKey, v74);
    }
    if (v73) {
      CFDictionarySetValue(v53, IDSDeliveryKeyTransparencyURIVerificationMapKey, v73);
    }
    v64 = +[NSNumber numberWithBool:a27];
    if (v64) {
      CFDictionarySetValue(v53, IDSDeliveryFromCoalesceQueueKey, v64);
    }

    [v44 addObject:v53];
    [(IDSDeliveryController *)self _checkFastDormancy];
  }
}

- (void)_sendFTMessage:(id)a3 service:(id)a4 fromID:(id)a5 toID:(id)a6 toToken:(id)a7 toSessionToken:(id)a8 toURIs:(id)a9 fromIdentity:(id)a10 completionBlock:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v60 = a7;
  id v57 = a8;
  id v58 = a9;
  id v56 = a10;
  id v54 = a11;
  unsigned int v55 = [v18 isEqualToString:v19];
  id v20 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v17;
    if (v55) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    id v23 = [v16 wantsDeliveryStatus];
    unsigned int v24 = [v23 intValue];
    unsigned int v25 = [v16 wantsCertifiedDelivery];
    *(_DWORD *)buf = 138414082;
    if (v24) {
      CFStringRef v26 = @"YES";
    }
    else {
      CFStringRef v26 = @"NO";
    }
    id v70 = v16;
    if (v25) {
      CFStringRef v27 = @"YES";
    }
    else {
      CFStringRef v27 = @"NO";
    }
    __int16 v71 = 2112;
    id v72 = v18;
    __int16 v73 = 2112;
    id v74 = v19;
    __int16 v75 = 2112;
    id v76 = v60;
    __int16 v77 = 2112;
    id v78 = v58;
    __int16 v79 = 2112;
    CFStringRef v80 = v22;
    __int16 v81 = 2112;
    CFStringRef v82 = v26;
    __int16 v83 = 2112;
    CFStringRef v84 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "send FTMessage: %@   fromID: %@   toID: %@  toToken: %@  toURIs: %@  toMe: %@  delivery status: %@ certified delivery: %@", buf, 0x52u);

    id v17 = v21;
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if (v55) {
      CFStringRef v28 = @"YES";
    }
    else {
      CFStringRef v28 = @"NO";
    }
    __int16 v29 = [v16 wantsDeliveryStatus];
    if ([v29 intValue]) {
      CFStringRef v30 = @"YES";
    }
    else {
      CFStringRef v30 = @"NO";
    }
    if ([v16 wantsCertifiedDelivery]) {
      CFStringRef v31 = @"YES";
    }
    else {
      CFStringRef v31 = @"NO";
    }
    CFStringRef v52 = v30;
    CFStringRef v53 = v31;
    id v50 = v58;
    CFStringRef v51 = v28;
    id v48 = v19;
    id v49 = v60;
    id v46 = v16;
    id v47 = v18;
    _IDSLogV();
  }
  if (v60)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v57)
      {
        id v32 = [(IDSDeliveryController *)self peerIDManager];
        id v33 = +[IDSURI URIWithPrefixedURI:v19 withServiceLoggingHint:v17];
        id v34 = +[IDSPushToken pushTokenWithData:v60 withServiceLoggingHint:v17];
        id v35 = +[IDSURI URIWithPrefixedURI:v18 withServiceLoggingHint:v17];
        LOBYTE(v47) = 0;
        id v57 = [v32 sessionTokenForURI:v33 pushToken:v34 fromURI:v35 service:v17 expirationDate:0 refreshDate:0 fromIdentity:v56 includeSelfDevice:v47];
      }
      objc_msgSend(v16, "setTargetToken:", v60, v46, v47, v48, v49, v50, v51, v52, v53);
      [v16 setSourcePeerID:v18];
      [v16 setTargetSessionToken:v57];
      [v16 setTargetPeerID:v19];
      if (v55)
      {
        id v36 = [v16 wantsDeliveryStatus];
        BOOL v37 = [v36 intValue] == 0;

        if (!v37)
        {
          id v38 = +[NSNumber numberWithBool:0];
          [v16 setWantsDeliveryStatus:v38];
        }
      }
    }
  }
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1001D3068;
  v61[3] = &unk_1009856C8;
  id v62 = v19;
  id v63 = v18;
  v64 = self;
  id v65 = v17;
  id v66 = v56;
  id v67 = v58;
  id v68 = v54;
  id v39 = v58;
  id v40 = v17;
  id v41 = v54;
  id v42 = v56;
  id v43 = v40;
  id v44 = v18;
  id v45 = v19;
  [v16 setCompletionBlock:v61];
  [(FTMessageDelivery *)self->_messageDelivery sendMessage:v16];
  [(IDSDeliveryController *)self _checkFastDormancy];
}

- (void)_sendFTFanoutMessage:(id)a3 service:(id)a4 fromID:(id)a5 toURIs:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8
{
  id v60 = a3;
  id v54 = a4;
  id v58 = a5;
  id v57 = a6;
  id v55 = a7;
  id v56 = a8;
  BOOL v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v60 messageID];
    a4 = [v60 groupPayload];
    if (a4) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    id v16 = [v60 chunkNumber];
    if ([v60 isFinalMessage]) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    *(_DWORD *)buf = 138413314;
    id v82 = v60;
    __int16 v83 = 2112;
    id v84 = v14;
    __int16 v85 = 2112;
    CFStringRef v86 = v15;
    __int16 v87 = 2112;
    id v88 = v16;
    __int16 v89 = 2112;
    CFStringRef v90 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "    Told to send Fanout Message: %@ GUID: %@ isEngram? %@ Chunk: %@ isFinal?: %@ ", buf, 0x34u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = [v60 messageID];
    id v19 = [v60 groupPayload];
    if (v19) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    a4 = [v60 chunkNumber];
    if ([v60 isFinalMessage]) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    id v52 = a4;
    CFStringRef v53 = v21;
    id v50 = v18;
    CFStringRef v51 = v20;
    id v49 = v60;
    _IDSLogV();
  }
  id v63 = (__CFString *)objc_alloc_init((Class)NSMutableDictionary);
  id v62 = objc_alloc_init((Class)NSMutableSet);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = [v60 individualPeerMessages];
  id v22 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (!v22)
  {

LABEL_37:
    objc_msgSend(v60, "setWantsCertifiedDelivery:", 1, v49, v50, v51);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v32 = [v60 individualPeerMessages];
    id v33 = [v32 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v72;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v72 != v34) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * i) setWantsCertifiedDelivery:0];
        }
        id v33 = [v32 countByEnumeratingWithState:&v71 objects:v79 count:16];
      }
      while (v33);
    }

    goto LABEL_45;
  }
  uint64_t v23 = *(void *)v76;
  unsigned __int8 v24 = 1;
  do
  {
    for (j = 0; j != v22; j = (char *)j + 1)
    {
      if (*(void *)v76 != v23) {
        objc_enumerationMutation(obj);
      }
      CFStringRef v26 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
      CFStringRef v27 = objc_msgSend(v26, "dictionaryRepresentation", v49, v50, v51, v52, v53);
      [v62 addObject:v27];

      CFStringRef v28 = [v26 encryptionType];
      CFStringRef v29 = v28;
      if (!v28)
      {
        CFStringRef v30 = [v60 encryptionType];
        a4 = v30;
        if (v30) {
          CFStringRef v29 = v30;
        }
        else {
          CFStringRef v29 = @"none";
        }
      }
      CFStringRef v31 = [v26 targetToken];
      [(__CFString *)v63 setObject:v29 forKey:v31];

      if (!v28) {
      if (v24)
      }
        unsigned __int8 v24 = [v26 wantsCertifiedDelivery];
      else {
        unsigned __int8 v24 = 0;
      }
    }
    id v22 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
  }
  while (v22);

  if (v24) {
    goto LABEL_37;
  }
LABEL_45:
  id v36 = [v60 encryptionType];
  if (v36)
  {
    BOOL v37 = [v60 encryptionType];
    unsigned __int8 v38 = [v37 isEqualToString:@"none"];

    if ((v38 & 1) == 0)
    {
      id v39 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [v60 messageID];
        id v41 = [v60 encryptionType];
        *(_DWORD *)buf = 138412802;
        id v82 = v40;
        __int16 v83 = 2112;
        id v84 = v41;
        __int16 v85 = 2112;
        CFStringRef v86 = v63;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Sending %@ with top-level encryption type \"%@\" and dtls: %@", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v42 = [v60 messageID];
        id v50 = [v60 encryptionType];
        CFStringRef v51 = v63;
        id v49 = v42;
        _IDSLogV();
      }
    }
  }
  if (objc_msgSend(v60, "isFinalMessage", v49, v50, v51))
  {
    id v43 = [v60 individualPeerMessages];
    BOOL v44 = [v43 count] == (id)1;
  }
  else
  {
    BOOL v44 = 0;
  }
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1001D43C0;
  v64[3] = &unk_1009856F0;
  id v65 = v62;
  id v66 = v58;
  BOOL v70 = v44;
  id v67 = v57;
  id v68 = self;
  id v69 = v56;
  id v45 = v57;
  id v46 = v56;
  id v47 = v58;
  id v48 = v62;
  [v60 setCompletionBlock:v64];
  [(FTMessageDelivery *)self->_messageDelivery sendMessage:v60];
  [(IDSDeliveryController *)self _checkFastDormancy];
}

- (void)_sendAttachmentWithGuid:(id)a3 service:(id)a4 topic:(id)a5 originalCommand:(id)a6 additionalDictionary:(id)a7 encryptedData:(id)a8 toToken:(id)a9 toID:(id)a10 fromID:(id)a11 fromIdentity:(id)a12 canUseLargePayload:(BOOL)a13 expirationDate:(id)a14 destinationObject:(id)a15 ackBlock:(id)a16 completionBlock:(id)a17
{
  CFStringRef v53 = (__CFString *)a3;
  id v22 = a4;
  id v54 = a5;
  id v46 = a6;
  id v47 = a7;
  id v52 = a8;
  id v55 = a9;
  id v23 = a10;
  id v56 = a11;
  id v48 = a12;
  id v49 = a14;
  id v50 = a15;
  id v51 = a16;
  id v24 = a17;
  unsigned int v25 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    CFStringRef v75 = v53;
    __int16 v76 = 2112;
    id v77 = v54;
    __int16 v78 = 2112;
    id v79 = v55;
    __int16 v80 = 2112;
    id v81 = v23;
    __int16 v82 = 2112;
    id v83 = v56;
    __int16 v84 = 2112;
    id v85 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Asked to sendAttachmentWithGUID %@  topic %@ toToken %@ toID %@ fromID %@ service: %@", buf, 0x3Eu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v43 = v56;
    id v44 = v22;
    id v41 = v55;
    id v42 = v23;
    unsigned __int8 v38 = v53;
    id v40 = v54;
    _IDSLogV();
  }
  CFStringRef v26 = +[NSFileManager defaultManager];
  CFStringRef v27 = [v26 _randomTemporaryPathWithSuffix:0];

  if (v27 && [v52 writeToFile:v27 atomically:1])
  {
    CFStringRef v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v75 = @"YES";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "    Wrote data to path: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v39 = @"YES";
      _IDSLogV();
    }
    id v29 = objc_msgSend(v24, "copy", v39);

    id v30 = [objc_alloc((Class)IDSServiceProperties) initWithServiceIdentifier:v22];
    id v31 = [v30 dataUsageBundleID];
    id v32 = -[IDSDaemon _IMTransferServiceController]_0();
    id v33 = [v27 stringByResolvingAndStandardizingPath];
    uint64_t v34 = +[NSString stringGUIDForObject:v27];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1001D5680;
    v57[3] = &unk_100985780;
    id v58 = v47;
    id v59 = v46;
    id v60 = v53;
    id v71 = v29;
    id v61 = v27;
    id v62 = self;
    id v63 = v22;
    BOOL v73 = a13;
    id v64 = v49;
    id v65 = v56;
    id v66 = v48;
    id v67 = v23;
    id v68 = v55;
    id v69 = v54;
    id v70 = v50;
    id v72 = v51;
    id v35 = (void (**)(id, id))v29;
    [v32 sendFilePath:v33 topic:v69 userInfo:0 transferID:v34 sourceAppID:v31 encryptFile:0 progressBlock:&stru_100985730 completionBlock:v57];

    id v36 = v58;
    goto LABEL_16;
  }
  _IMWarn();
  id v35 = (void (**)(id, id))[v24 copy];

  if (v35)
  {
    id v30 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"Failed uploading attachment file transfer", NSLocalizedDescriptionKey, 0);
    id v37 = objc_alloc((Class)NSError);
    id v31 = [v37 initWithDomain:IDSSendErrorDomain code:4 userInfo:v30];
    id v36 = objc_msgSend(objc_alloc((Class)IDSDeliveryContext), "initWithResponseCode:error:lastCall:", objc_msgSend(v31, "code"), v31, 1);
    v35[2](v35, v36);
LABEL_16:
  }
}

- (id)_tokenURIForToken:(id)a3 uri:(id)a4
{
  unint64_t v4 = (void *)_IDSCopyIDForTokenWithURI();
  id v5 = +[IDSURI URIWithPrefixedURI:v4];

  return v5;
}

- (void)_sendMessage:(id)a3 dataToEncrypt:(id)a4 withEncryptedAttributes:(id)a5 onService:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 canUseLargePayload:(BOOL)a12 sendOnePerToken:(BOOL)a13 allowPartialSendsToSucceed:(BOOL)a14 registrationProperties:(id)a15 fakeMessage:(BOOL)a16 alwaysSkipSelf:(BOOL)a17 alwaysIncludeSelf:(BOOL)a18 forceQuery:(int64_t)a19 disallowRefresh:(BOOL)a20 prioritizedTokenList:(id)a21 wantsFirewallDonation:(BOOL)a22 destinationObject:(id)a23 willSendBlock:(id)a24 completionBlock:(id)a25 firstAttemptDate:(id)a26 ktURIVerificationMap:(id)a27 fromCoalesceQueue:(BOOL)a28 withQueryCompletion:(id)a29
{
  id v34 = a3;
  id v35 = a4;
  id v151 = a5;
  id v36 = a6;
  id v37 = a7;
  id v38 = a8;
  id v144 = a9;
  id v39 = a10;
  id v40 = a11;
  id v41 = a15;
  id v133 = a21;
  id v131 = a23;
  id v148 = a24;
  id v149 = a25;
  id v42 = a26;
  id v141 = a27;
  v150 = (void (**)(id, void *))a29;
  v205 = _os_activity_create((void *)&_mh_execute_header, "IDSDeliveryController sendMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v205, &state);
  v142 = v42;
  if (!v42)
  {
    v142 = +[NSDate date];
  }
  id v43 = [v34 sendMode];
  v143 = v43;
  if (v43) {
    BOOL v159 = [v43 integerValue] != 0;
  }
  else {
    BOOL v159 = 0;
  }
  unsigned int obj = [(IDSCoalesceMessageQueueManager *)self->_coalesceMessageQueueManager coalesceQueueExistsForTopic:v36];
  if (v149)
  {
    id v44 = [v149 copy];
    id v145 = objc_retainBlock(v44);
  }
  else
  {
    id v145 = 0;
  }
  if (v148)
  {
    id v45 = [v148 copy];
    id v146 = objc_retainBlock(v45);
  }
  else
  {
    id v146 = 0;
  }
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v46 = v34;
  if (v46) {
    CFDictionarySetValue(theDict, IDSDeliveryMessageKey, v46);
  }
  v147 = v46;

  id v47 = v35;
  if (v47) {
    CFDictionarySetValue(theDict, IDSDeliveryDataToEncryptKey, v47);
  }
  v140 = v47;

  id v48 = v151;
  if (v48) {
    CFDictionarySetValue(theDict, IDSDeliveryEncryptionAttributesKey, v48);
  }
  v139 = v48;

  id v49 = v36;
  if (v49) {
    CFDictionarySetValue(theDict, IDSDeliveryServiceKey, v49);
  }
  v162 = v49;

  id v50 = v37;
  if (v50) {
    CFDictionarySetValue(theDict, IDSDeliveryFromIDKey, v50);
  }
  v154 = v50;

  id v51 = v38;
  if (v51) {
    CFDictionarySetValue(theDict, IDSDeliveryFromShortHandle, v51);
  }
  v138 = v51;

  id v52 = v144;
  if (v52) {
    CFDictionarySetValue(theDict, IDSDeliveryFromIdentityKey, v52);
  }
  v137 = v52;

  id v53 = v39;
  if (v53) {
    CFDictionarySetValue(theDict, IDSDeliveryToIDKey, v53);
  }
  v136 = v53;

  id v54 = v40;
  id v152 = v54;
  if (v54)
  {
    CFDictionarySetValue(theDict, IDSDeliveryOriginalURIsKey, v54);
    id v54 = v152;
  }

  id v55 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  if (v55) {
    CFDictionarySetValue(theDict, IDSDeliveryCanUseLargePayloadKey, v55);
  }

  id v56 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  if (v56) {
    CFDictionarySetValue(theDict, IDSDeliverySendOnePerTokenKey, v56);
  }

  id v57 = v41;
  if (v57) {
    CFDictionarySetValue(theDict, IDSDeliveryRegistrationPropertiesKey, v57);
  }
  v135 = v57;

  id v58 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  if (v58) {
    CFDictionarySetValue(theDict, IDSDeliveryFakeMessageKey, v58);
  }

  id v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  if (v59) {
    CFDictionarySetValue(theDict, IDSDeliveryAlwaysSkipSelfKey, v59);
  }

  id v60 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  if (v60) {
    CFDictionarySetValue(theDict, IDSDeliveryAlwaysIncludeSelfKey, v60);
  }

  id v61 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  if (v61) {
    CFDictionarySetValue(theDict, IDSDeliveryForceQueryKey, v61);
  }

  id v62 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  if (v62) {
    CFDictionarySetValue(theDict, IDSDeliveryDisallowQueryRefreshKey, v62);
  }

  id v63 = v133;
  if (v63) {
    CFDictionarySetValue(theDict, IDSDeliveryPrioritizedTokenListKey, v63);
  }
  v134 = v63;

  id v64 = v131;
  if (v64) {
    CFDictionarySetValue(theDict, IDSDeliveryIDSDestinationKey, v64);
  }
  v132 = v64;

  id v65 = objc_retainBlock(v146);
  if (v65) {
    CFDictionarySetValue(theDict, IDSDeliveryWillSendBlockKey, v65);
  }

  id v66 = objc_retainBlock(v145);
  if (v66) {
    CFDictionarySetValue(theDict, IDSDeliveryCompletionBlockKey, v66);
  }

  id v67 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  if (v67) {
    CFDictionarySetValue(theDict, IDSDeliveryFromCoalesceQueueKey, v67);
  }

  if (v159 && !a28)
  {
    [(IDSCoalesceMessageQueueManager *)self->_coalesceMessageQueueManager handleMessageToCoalesce:theDict forTopic:v49 sendMode:v143];
    id v68 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      id v69 = [(IDSCoalesceMessageQueueManager *)self->_coalesceMessageQueueManager loggableOverviewForTopic:v49];
      *(_DWORD *)buf = 138412290;
      id v207 = v69;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "  Coalesce queue view : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v117 = [(IDSCoalesceMessageQueueManager *)self->_coalesceMessageQueueManager loggableOverviewForTopic:v49];
      _IDSLogV();
    }
LABEL_71:
    if (v150) {
      v150[2](v150, &__NSArray0__struct);
    }
    goto LABEL_133;
  }
  id v70 = v49;
  if (obj && !a28)
  {
    id v71 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Incoming urgent message for a topic with coalesce messages in queue", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    [(IDSCoalesceMessageQueueManager *)self->_coalesceMessageQueueManager enqueueMessage:theDict forTopic:v49 sendMode:&off_1009D1848];
    [(IDSCoalesceMessageQueueManager *)self->_coalesceMessageQueueManager flushCoalesceQueueForTopic:v49];
    goto LABEL_71;
  }
  LOBYTE(v128) = a28;
  HIDWORD(v128) = a22;
  LOBYTE(v126) = a22;
  LOBYTE(v124) = a20;
  BYTE2(v122) = a18;
  LOWORD(v122) = __PAIR16__(a17, a16);
  LOWORD(v120) = __PAIR16__(a13, a12);
  -[IDSDeliveryController _queueMessage:service:dataToEncrypt:withEncryptedAttributes:fromID:fromShortHandle:fromIdentity:toID:toURIs:originallyToURIs:ktURIVerificationMap:canUseLargePayload:sendOnePerToken:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:fromCoalesceQueue:](self, "_queueMessage:service:dataToEncrypt:withEncryptedAttributes:fromID:fromShortHandle:fromIdentity:toID:toURIs:originallyToURIs:ktURIVerificationMap:canUseLargePayload:sendOnePerToken:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:fromCoalesceQueue:", v147, v49, v140, v139, v154, v138, v137, v136, v152, v152, v141, v120, v135, v122,
    a19,
    v124,
    v134,
    v126,
    v132,
    v148,
    v149,
    v128);
  id v160 = objc_alloc_init((Class)NSMutableSet);
  id v155 = objc_alloc_init((Class)NSMutableSet);
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id obja = v152;
  id v72 = [obja countByEnumeratingWithState:&v200 objects:v210 count:16];
  if (!v72) {
    goto LABEL_93;
  }
  uint64_t v73 = *(void *)v201;
  do
  {
    for (i = 0; i != v72; i = (char *)i + 1)
    {
      if (*(void *)v201 != v73) {
        objc_enumerationMutation(obja);
      }
      CFStringRef v75 = *(void **)(*((void *)&v200 + 1) + 8 * i);
      __int16 v76 = [v75 pushToken];
      uint64_t v77 = +[IDSDeliveryController tokenURINegativeCacheItemForTokenURI:v75 service:v70];
      __int16 v78 = (void *)v77;
      if (v76) {
        BOOL v79 = v77 == 0;
      }
      else {
        BOOL v79 = 1;
      }
      int v80 = !v79;
      if (!v79)
      {
        unsigned __int8 v81 = [(IDSRateLimiter *)self->_tokenURINegativeCache underLimitForItem:v77];
        __int16 v82 = v155;
        if ((v81 & 1) == 0) {
          goto LABEL_90;
        }
      }
      if (a19 == 1
        || ([(IDSDeliveryController *)self peerIDManager],
            id v83 = objc_claimAutoreleasedReturnValue(),
            +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:](IDSURI, "URIWithPrefixedURI:withServiceLoggingHint:", v154, v162), __int16 v84 = objc_claimAutoreleasedReturnValue(), v85 = [v83 hasPeerTokensForURI:v75 fromURI:v84 service:v162], v84, v83, (v85 & 1) == 0))
      {
        __int16 v82 = v160;
        if (v80)
        {
          [(IDSRateLimiter *)self->_tokenURINegativeCache noteItem:v78];
          __int16 v82 = v160;
        }
LABEL_90:
        [v82 addObject:v75];
      }

      id v70 = v162;
    }
    id v72 = [obja countByEnumeratingWithState:&v200 objects:v210 count:16];
  }
  while (v72);
LABEL_93:

  unint64_t v86 = (unint64_t)[v160 count];
  unint64_t v87 = (unint64_t)[v155 count];
  id v88 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
    id v89 = [obja count];
    *(_DWORD *)buf = 138412546;
    id v207 = v147;
    __int16 v208 = 2048;
    id v209 = v89;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Preparing to send message: %@ looking up %lu people", buf, 0x16u);
  }

  CFStringRef v90 = [v147 description];
  v91 = [obja description];
  v92 = [v160 description];
  v192 = _NSConcreteStackBlock;
  uint64_t v193 = 3221225472;
  v194 = sub_1001D78C4;
  v195 = &unk_1009814A8;
  id v93 = v90;
  id v196 = v93;
  id v130 = v91;
  id v197 = v130;
  BOOL v199 = v86 == 0;
  id v94 = v92;
  id v198 = v94;
  cut_dispatch_log_queue();
  if (v86 | v87)
  {
    if (v87) {
      BOOL v95 = v86 != 0;
    }
    else {
      BOOL v95 = 1;
    }
    if (v95 || !a14)
    {
      if (v87) {
        BOOL v101 = a14;
      }
      else {
        BOOL v101 = 1;
      }
      if (v86 != 0 && v101)
      {
        v163[0] = _NSConcreteStackBlock;
        v163[1] = 3221225472;
        v163[2] = sub_1001D79B0;
        v163[3] = &unk_100985810;
        id v164 = obja;
        BOOL v183 = a14;
        id v165 = v147;
        v179 = v150;
        v166 = self;
        id v102 = v162;
        id v167 = v102;
        id v180 = v149;
        id v168 = v142;
        id v169 = v140;
        id v170 = v139;
        id v103 = v154;
        id v171 = v103;
        id v172 = v138;
        id objb = v137;
        id v173 = objb;
        id v174 = v136;
        BOOL v184 = a12;
        BOOL v185 = a13;
        BOOL v186 = a16;
        BOOL v187 = a17;
        BOOL v188 = a18;
        id v175 = v135;
        int64_t v182 = a19;
        BOOL v189 = a20;
        id v176 = v134;
        char v190 = BYTE4(v129);
        id v177 = v132;
        id v181 = v148;
        id v178 = v141;
        BOOL v191 = a28;
        v104 = objc_retainBlock(v163);
        v105 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          id v106 = [v160 allObjects];
          *(_DWORD *)buf = 138412546;
          id v207 = v106;
          __int16 v208 = 2112;
          id v209 = v103;
          _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "Issuing query for: %@   from: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v118 = [v160 allObjects];
          id v119 = v103;
          _IDSLogV();
        }
        v107 = -[IDSPeerIDQueryContext initWithSending:refresh:messaging:resultExpected:preventNewQuery:]([IDSPeerIDQueryContext alloc], "initWithSending:refresh:messaging:resultExpected:preventNewQuery:", 1, a19 == 1, 1, 1, 0, v118, v119);
        v108 = [(IDSDeliveryController *)self peerIDManager];
        v109 = [v160 allObjects];
        v110 = +[IDSURI URIWithPrefixedURI:v103 withServiceLoggingHint:v102];
        [v108 startQueryForURIs:v109 fromIdentity:objb fromURI:v110 fromService:v102 context:v107 reason:@"MessageSend" completionBlock:v104];

        id v96 = v164;
      }
      else
      {
        v111 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v207 = v147;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Tokens are being ignored, failing message {msg: %@}", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        id v112 = objc_alloc((Class)NSError);
        id v96 = [v112 initWithDomain:IDSSendErrorDomain code:1 userInfo:0];
        if (v150) {
          v150[2](v150, &__NSArray0__struct);
        }
        if (v149)
        {
          id v113 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:1 error:v96 lastCall:1];
          [v113 setDisplayURIs:obja];
          (*((void (**)(id, id))v149 + 2))(v149, v113);
        }
      }
    }
    else
    {
      id v96 = [objc_alloc((Class)NSMutableSet) initWithArray:obja];
      [v96 minusSet:v155];
      v97 = [v96 allObjects];
      v98 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v207 = v96;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Found messagable people: %@", buf, 0xCu);
      }

      v99 = v147;
      v100 = v162;
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v118 = v96;
        _IDSLogV();
      }
      if ((unint64_t)objc_msgSend(v96, "count", v118) > 1) {
        goto LABEL_108;
      }
      if ([v96 count] == (id)1)
      {
        v114 = [v96 anyObject];
        v115 = [v114 prefixedURI];
        unsigned __int8 v116 = [v115 isEqualToString:v154];

        v99 = v147;
        v100 = v162;
        if ((v116 & 1) == 0)
        {
LABEL_108:
          [(IDSDeliveryController *)self _emptyMessagesForURIs:obja service:v100];
          LOBYTE(v129) = a28;
          LOBYTE(v127) = BYTE4(v129);
          LOBYTE(v125) = a20;
          BYTE2(v123) = a18;
          BYTE1(v123) = a17;
          LOBYTE(v123) = a16;
          BYTE1(v121) = a13;
          LOBYTE(v121) = a12;
          -[IDSDeliveryController _queueMessage:service:dataToEncrypt:withEncryptedAttributes:fromID:fromShortHandle:fromIdentity:toID:toURIs:originallyToURIs:ktURIVerificationMap:canUseLargePayload:sendOnePerToken:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:fromCoalesceQueue:](self, "_queueMessage:service:dataToEncrypt:withEncryptedAttributes:fromID:fromShortHandle:fromIdentity:toID:toURIs:originallyToURIs:ktURIVerificationMap:canUseLargePayload:sendOnePerToken:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:fromCoalesceQueue:", v99, v100, v140, v139, v154, v138, v137, v136, v97, obja, v141, v121, v135, v123,
            a19,
            v125,
            v134,
            v127,
            v132,
            v148,
            v149,
            v129,
            v130);
        }
      }
      [(IDSDeliveryController *)self _handleMessagesForURIs:v97 originalURIs:obja service:v100 fromID:v154 fromCoalesceQueue:a28 withQueryCompletion:v150];
    }
  }
  else
  {
    [(IDSDeliveryController *)self _handleMessagesForURIs:obja originalURIs:obja service:v162 fromID:v154 fromCoalesceQueue:a28 withQueryCompletion:v150];
  }

LABEL_133:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)sendIDSMessage:(id)a3 service:(id)a4 topic:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  im_assert_primary_base_queue();
  if (v10)
  {
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending IDSMessage: %@  topic: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v16 = v10;
      id v17 = v12;
      _IDSLogEventV();
    }
    objc_msgSend(v10, "setTopic:", v12, v16, v17);
    [(IDSDeliveryController *)self _sendFTMessage:v10 service:v11 fromID:0 toID:0 toToken:0 toSessionToken:0 toURIs:0 fromIdentity:0 completionBlock:v13];
  }
  else
  {
    CFStringRef v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sendIDSMessage called with nil message -- returning", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled()) {
      _IDSLogEventV();
    }
  }
}

- (void)_sendMessageDictionary:(id)a3 lastRetryInterval:(double)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 canUseLargePayload:(BOOL)a9 sendOnePerToken:(BOOL)a10 allowPartialSendsToSucceed:(BOOL)a11 highPriority:(BOOL)a12 fireAndForget:(BOOL)a13 expirationDate:(id)a14 enforceRemoteTimeouts:(BOOL)a15 messageID:(id)a16 fromID:(id)a17 fromShortHandle:(id)a18 fromIdentity:(id)a19 toID:(id)a20 toURIs:(id)a21 accessToken:(id)a22 topic:(id)a23 registrationProperties:(id)a24 fakeMessage:(BOOL)a25 alwaysSkipSelf:(BOOL)a26 alwaysIncludeSelf:(BOOL)a27 forceQuery:(int64_t)a28 pushPriority:(id)a29 ignoreMaxRetryCount:(BOOL)a30 disallowRefresh:(BOOL)a31 originalTimestamp:(id)a32 prioritizedTokenList:(id)a33 wantsFirewallDonation:(BOOL)a34 destinationObject:(id)a35 deliveryMinimumTimeDelay:(id)a36 deliveryMinimumTime:(id)a37 sendMode:(id)a38 KTURIVerificationMap:(id)a39 ackBlock:(id)a40 willSendBlock:(id)a41 sendCompletionBlock:(id)a42
{
  BOOL v102 = a8;
  id v86 = a3;
  id v87 = a5;
  id v88 = a6;
  id v103 = (IDSPeerAccessoryMessage *)a7;
  id v107 = a14;
  id v96 = a16;
  id v108 = a17;
  id v104 = a18;
  id v95 = a19;
  id v45 = a20;
  id v46 = a21;
  id v47 = a22;
  id v106 = a23;
  id v89 = a24;
  id v94 = a29;
  id v98 = a32;
  id v90 = a33;
  id v91 = a35;
  id v99 = a36;
  id v100 = a37;
  id v101 = a38;
  id v92 = a39;
  id v105 = a40;
  id v93 = a41;
  id v97 = a42;
  unsigned __int8 v85 = v47;
  if (v47)
  {
    id v48 = [(IDSPeerMessage *)[IDSPeerAccessoryMessage alloc] initWithHighPriority:a12];
    [(IDSPeerAccessoryMessage *)v48 setAccessToken:v47];
    BOOL v49 = a12;
  }
  else
  {
    BOOL v49 = a12;
    id v48 = [[IDSPeerMessage alloc] initWithHighPriority:a12];
  }
  id v50 = [v86 mutableCopy];
  uint64_t v51 = IDSWantsDeliveryStatusKey;
  id v52 = [v50 objectForKey:IDSWantsDeliveryStatusKey];
  [(IDSPeerAccessoryMessage *)v48 setWantsDeliveryStatus:v52];

  [v50 removeObjectForKey:v51];
  uint64_t v53 = IDSCertifiedDeliveryVersionKey;
  id v54 = [v50 objectForKey:IDSCertifiedDeliveryVersionKey];
  uint64_t v55 = (uint64_t)[v54 integerValue];

  if (v55 >= 1)
  {
    [(IDSPeerAccessoryMessage *)v48 setWantsCertifiedDelivery:1];
    [v50 removeObjectForKey:v53];
  }
  if (v49)
  {
    id v56 = v45;
    if (v94)
    {
      [v94 integerValue];
      if (_IDSIsValidPushPriority()) {
        [(IDSPeerMessage *)v48 setPriority:v94];
      }
    }
  }
  else
  {
    id v57 = +[NSNumber numberWithInt:5];
    [(IDSPeerMessage *)v48 setPriority:v57];

    id v56 = v45;
  }
  [(IDSPeerMessage *)v48 setAdditionalDictionary:v50];
  [(IDSPeerMessage *)v48 setSourcePeerID:v108];
  [(IDSPeerMessage *)v48 setSourceShortHandle:v104];
  [(IDSPeerMessage *)v48 setTargetPeerID:v56];
  if (v96)
  {
    -[IDSPeerMessage setMessageID:](v48, "setMessageID:");
  }
  else
  {
    id v58 = +[NSString stringGUID];
    [(IDSPeerMessage *)v48 setMessageID:v58];

    id v56 = v45;
  }
  [(IDSPeerMessage *)v48 setFireAndForget:a13];
  [(IDSPeerAccessoryMessage *)v48 setIgnoreMaxRetryCount:a30];
  [(IDSPeerAccessoryMessage *)v48 setOriginalTimestamp:v98];
  [(IDSPeerMessage *)v48 setDeliveryMinimumTimeDelay:v99];
  [(IDSPeerMessage *)v48 setDeliveryMinimumTime:v100];
  [(IDSPeerMessage *)v48 setSendMode:v101];
  if (v56)
  {
    uint64_t v59 = [v56 _stripPotentialTokenURIWithToken:0];
    id v60 = (void *)v59;
    LODWORD(v56) = 0;
    if (v108 && v59) {
      LODWORD(v56) = [v108 isEqualToIgnoringCase:v59];
    }
  }
  else
  {
    id v60 = 0;
  }
  if ((unint64_t)[v46 count] <= 1)
  {
    id v61 = [v46 lastObject];
    id v62 = [v61 tokenFreeURI];
    id v63 = [v62 prefixedURI];
    LODWORD(v56) = v56 | [v63 isEqualToIgnoringCase:v108];
  }
  [(IDSPeerAccessoryMessage *)v48 setWantsResponse:v102];
  [(IDSPeerAccessoryMessage *)v48 setTopic:v106];
  if (v105)
  {
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_1001D93C0;
    v109[3] = &unk_100985838;
    id v110 = v105;
    [(IDSPeerAccessoryMessage *)v48 setDeliveryAcknowledgementBlock:v109];
  }
  if (v107)
  {
    [v107 timeIntervalSinceNow];
    double v65 = v64;
    if (v64 > 2.22044605e-16)
    {
      [(IDSPeerAccessoryMessage *)v48 setTimeout:v64];
      id v66 = +[NSString stringWithFormat:@"service-max-timeout-%@", v103];
      if (v66)
      {
        id v67 = +[IDSServerBag sharedInstanceForBagType:1];
        id v68 = [v67 objectForKey:v66];
      }
      else
      {
        id v68 = 0;
      }
      if ([(__CFString *)v68 unsignedIntegerValue])
      {
        id v69 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v112 = v103;
          __int16 v113 = 2112;
          CFStringRef v114 = v68;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Server has overridden service maximum timeout: %@, capping message timeout with %@.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          __int16 v76 = v103;
          uint64_t v77 = v68;
          _IDSLogV();
        }
        double v70 = (double)(unint64_t)[(__CFString *)v68 unsignedIntegerValue];
        if (v65 < v70) {
          double v70 = v65;
        }
        [(IDSPeerAccessoryMessage *)v48 setTimeout:v70];
      }
    }
    if (v65 < IDSMaxMessageTimeout + -60.0 && a15) {
      [(IDSPeerMessage *)v48 setExpirationDate:v107];
    }
  }
  if (!v46)
  {
    id v71 = +[IDSURI URIWithPrefixedURI:v45];
    IMSingleObjectArray();
    id v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v72 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v73 = @"NO";
    *(_DWORD *)buf = 138414082;
    id v112 = v48;
    if (v102) {
      CFStringRef v74 = @"YES";
    }
    else {
      CFStringRef v74 = @"NO";
    }
    CFStringRef v114 = v74;
    __int16 v113 = 2112;
    if (v56) {
      CFStringRef v73 = @"YES";
    }
    __int16 v115 = 2112;
    id v116 = v107;
    __int16 v117 = 2112;
    id v118 = v108;
    __int16 v119 = 2112;
    id v120 = v45;
    __int16 v121 = 2112;
    id v122 = v46;
    __int16 v123 = 2112;
    id v124 = v106;
    __int16 v125 = 2112;
    CFStringRef v126 = v73;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Sending messageDictionary: {suppressed} peerMessage %@  wantsResponse %@ timeout %@ fromID: %@ toID %@ toPeople %@ topic %@ toMyself: %@", buf, 0x52u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (v56) {
      CFStringRef v75 = @"YES";
    }
    else {
      CFStringRef v75 = @"NO";
    }
    CFStringRef v80 = v75;
    id v79 = v46;
    id v78 = v108;
    _IDSLogEventV();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(IDSDeliveryController *)self _handleAccessoryMessageForID:v46 msg:v48 service:v103 fromID:v108 fromIdentity:v95 completionBlock:v97];
  }
  else
  {
    LOBYTE(v82) = 0;
    LOBYTE(v81) = a34;
    LOBYTE(v80) = a31;
    *(_WORD *)((char *)&v79 + 1) = __PAIR16__(a27, a26);
    LOBYTE(v79) = a25;
    *(_WORD *)((char *)&v78 + 1) = __PAIR16__(a11, a10);
    LOBYTE(v78) = a9;
    -[IDSDeliveryController _sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:](self, "_sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:", v48, v87, v88, v103, v108, v104, v95, v45, v46, v78, v89, v79, a28, v80,
      v90,
      v81,
      v91,
      v93,
      v97,
      0,
      v92,
      v82,
      &stru_100985858);
  }
}

- (void)_sendErrorDictionary:(id)a3 onService:(id)a4 fromID:(id)a5 fromIdentity:(id)a6 toID:(id)a7 toToken:(id)a8 topic:(id)a9 sendCompletionBlock:(id)a10
{
  id v38 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    id v40 = v38;
    __int16 v41 = 2112;
    id v42 = v16;
    __int16 v43 = 2112;
    id v44 = v17;
    __int16 v45 = 2112;
    id v46 = v18;
    __int16 v47 = 2112;
    id v48 = v19;
    __int16 v49 = 2112;
    id v50 = v20;
    __int16 v51 = 2112;
    id v52 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "_sendErrorMessage %@ onService %@ fromID %@ fromIdentity %@ toID %@ toToken %@ topic %@", buf, 0x48u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v33 = v20;
    id v34 = v21;
    id v31 = v18;
    id v32 = v19;
    id v28 = v16;
    id v29 = v17;
    id v26 = v38;
    _IDSLogV();
  }
  id v24 = -[IDSDeliveryController _tokenURIForToken:uri:](self, "_tokenURIForToken:uri:", v20, v19, v26, v28, v29, v31, v32, v33, v34);
  unsigned int v25 = IMSingleObjectArray();
  LOBYTE(v37) = 0;
  LOWORD(v36) = 0;
  BYTE2(v35) = 0;
  LOWORD(v35) = 0;
  LOBYTE(v30) = 0;
  LODWORD(v27) = 0x10000;
  -[IDSDeliveryController _sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:messageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:](self, "_sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:messageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:", v38, 0, 0, v16, 1, 0, 0.0, v27, 0, v30, 0, v17,
    0,
    v18,
    v19,
    v25,
    0,
    v21,
    0,
    v35,
    0,
    0,
    v36,
    0,
    0,
    v37,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    v22);
}

- (void)sendMessageDictionary:(id)a3 messageID:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 expirationDate:(id)a9 enforceRemoteTimeouts:(BOOL)a10 canUseLargePayload:(BOOL)a11 sendOnePerToken:(BOOL)a12 allowPartialSendsToSucceed:(BOOL)a13 priority:(int64_t)a14 fireAndForget:(BOOL)a15 fromID:(id)a16 fromShortHandle:(id)a17 fromIdentity:(id)a18 toURIs:(id)a19 accessToken:(id)a20 topic:(id)a21 registrationProperties:(id)a22 fakeMessage:(BOOL)a23 alwaysSkipSelf:(BOOL)a24 alwaysIncludeSelf:(BOOL)a25 forceQuery:(int64_t)a26 pushPriority:(id)a27 ignoreMaxRetryCount:(BOOL)a28 disallowRefresh:(BOOL)a29 originalTimestamp:(id)a30 prioritizedTokenList:(id)a31 wantsFirewallDonation:(BOOL)a32 destinationObject:(id)a33 deliveryMinimumTimeDelay:(id)a34 deliveryMinimumTime:(id)a35 sendMode:(id)a36 KTURIVerificationMap:(id)a37 ackBlock:(id)a38 willSendBlock:(id)a39 sendCompletionBlock:(id)a40
{
  BOOL v59 = a8;
  id v53 = a40;
  id v40 = a39;
  id v41 = a38;
  id v42 = a37;
  id v57 = a36;
  id v43 = a35;
  id v44 = a34;
  id v55 = a33;
  id v54 = a31;
  id v52 = a30;
  id v50 = a27;
  id v51 = a22;
  id v76 = a21;
  id v75 = a20;
  id v74 = a19;
  id v73 = a18;
  id v72 = a17;
  id v71 = a16;
  id v70 = a9;
  id v69 = a7;
  id v67 = a6;
  id v65 = a5;
  id v63 = a4;
  id v61 = a3;
  im_assert_primary_base_queue();
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1001D9AA4;
  v77[3] = &unk_1009828A0;
  id v78 = v53;
  id v56 = v53;
  LOBYTE(v49) = a32;
  LOWORD(v48) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v47 + 1) = __PAIR16__(a25, a24);
  LOBYTE(v47) = a23;
  LOBYTE(v46) = a10;
  BYTE3(v45) = a15;
  BYTE2(v45) = a14 == 300;
  LOWORD(v45) = __PAIR16__(a13, a12);
  -[IDSDeliveryController _sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:messageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:](self, "_sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:messageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:", v61, v65, v67, v69, v59, a11, 0.0, v45, v70, v46, v63, v71,
    v72,
    v73,
    0,
    v74,
    v75,
    v76,
    v51,
    v47,
    a26,
    v50,
    v48,
    v52,
    v54,
    v49,
    v55,
    v44,
    v43,
    v57,
    v42,
    v41,
    v40,
    v77);
}

- (void)_pipelinesHandleMessagesToCoalesce:(id)a3 forService:(id)a4 sendMode:(id)a5
{
  id v7 = a3;
  id v41 = a4;
  id v32 = a5;
  id v42 = objc_alloc_init((Class)NSMutableArray);
  id v39 = objc_alloc_init((Class)NSMutableDictionary);
  os_activity_t v31 = _os_activity_create((void *)&_mh_execute_header, "All sends complete", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  id v38 = objc_alloc_init((Class)NSMutableDictionary);
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v36 = *(void *)v55;
    uint64_t v10 = IDSDeliveryMessageKey;
    uint64_t v35 = IDSDeliveryCompletionBlockKey;
    uint64_t v34 = IDSDeliveryFinalURIsKey;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v55 != v36) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v11);
        id v13 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
        id v14 = [v12 objectForKey:v10];
        CFStringRef v15 = [v14 messageID];

        id v16 = [v12 objectForKey:v10];
        id v17 = [v16 deliveryAcknowledgementBlock];

        id v18 = [v12 objectForKey:v35];
        id v19 = objc_retainBlock(v17);
        [v38 setObject:v19 forKey:v15];

        id v20 = objc_retainBlock(v18);
        [v37 setObject:v20 forKey:v15];

        id v21 = [v12 objectForKey:v34];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1001D9EF0;
        v51[3] = &unk_100985880;
        id v52 = v39;
        id v53 = v13;
        id v22 = v13;
        [(IDSDeliveryController *)self _pipelineHandleMessage:v12 forURIs:v21 service:v41 withCompletion:v51];

        id v23 = [v22 promise];
        [v42 addObject:v23];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v9);
  }

  id v24 = +[CUTUnsafePromise all:v42];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001DA018;
  v43[3] = &unk_1009858A8;
  id v44 = v41;
  uint64_t v45 = self;
  os_activity_t v46 = v31;
  id v47 = v39;
  id v48 = v38;
  id v49 = v37;
  id v50 = v32;
  id v25 = v32;
  id v26 = v37;
  id v27 = v38;
  id v28 = v39;
  id v29 = v31;
  id v30 = v41;
  [v24 registerResultBlock:v43];
}

- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001DA228;
  v10[3] = &unk_1009858D0;
  id v11 = a3;
  id v12 = a5;
  id v13 = self;
  id v8 = v12;
  id v9 = v11;
  [(IDSDeliveryController *)self _pipelineHandleMessage:v9 forURIs:a4 service:v8 withCompletion:v10];
}

- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5 withCompletion:(id)a6
{
  id v39 = a3;
  id v10 = a4;
  id v11 = a5;
  id v36 = a6;
  uint64_t v35 = +[NSDate date];
  id v12 = [v39 objectForKey:IDSDeliveryCanUseLargePayloadKey];
  int64_t v13 = -[IDSDeliveryController effectiveMaxPayloadSizeIfCanUseLargePayload:](self, "effectiveMaxPayloadSizeIfCanUseLargePayload:", [v12 BOOLValue]);

  id v14 = [[IDSDeliveryPipelineParameter alloc] initWithInfo:v39 uris:v10 service:v11 maxSize:v13];
  CFStringRef v15 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(IDSDeliveryPipelineParameter *)v14 guid];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending guid %@ through delivery pipeline", (uint8_t *)&buf, 0xCu);
  }
  id v17 = [(IDSDeliveryPipelineParameter *)v14 guid];
  id v18 = [v17 copy];

  id v19 = [(IDSDeliveryPipelineParameter *)v14 description];
  id v49 = _NSConcreteStackBlock;
  uint64_t v50 = 3221225472;
  id v51 = sub_1001DAD30;
  id v52 = &unk_10097E440;
  id v20 = v18;
  id v53 = v20;
  id v33 = v19;
  id v54 = v33;
  cut_dispatch_log_queue();
  uint64_t v21 = objc_opt_class();
  id v22 = [(IDSDeliveryPipelineParameter *)v14 messageToSend];
  id v23 = [v22 messageBody];
  id v24 = sub_1001DA568(v21, v23, IDSCommandKey);

  LODWORD(v22) = [v24 integerValue] != (id)133;
  id v38 = [objc_alloc((Class)IDSServiceProperties) initWithServiceIdentifier:v11];
  if (([v38 supportsOfflineDelivery] & v22) == 1) {
    [(IDSDeliveryController *)self _constructOfflineDeliveryPipeline];
  }
  else {
  id v37 = [(IDSDeliveryController *)self _constructDeliveryPipeline];
  }
  if (_os_feature_enabled_impl() && IDSCommandIsGroupSessionCommand())
  {
    [v24 integerValue];
    kdebug_trace();
  }
  id v25 = [v39 objectForKey:IDSDeliveryCompletionBlockKey];
  id v26 = [v37 runWithInput:v14];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  long long v57 = sub_1001DADEC;
  id v58 = sub_1001DADFC;
  id v59 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001DAE04;
  v40[3] = &unk_1009858F8;
  id v27 = v24;
  id v41 = v27;
  id v42 = self;
  id v28 = v11;
  id v43 = v28;
  id v29 = v10;
  id v44 = v29;
  id v30 = v25;
  id v46 = v30;
  p_long long buf = &buf;
  id v31 = v35;
  id v45 = v31;
  id v32 = v36;
  id v47 = v32;
  [v26 registerResultBlock:v40];

  _Block_object_dispose(&buf, 8);
}

- (id)_constructDeliveryPipeline
{
  id v3 = [IDSMMCSUploader alloc];
  unint64_t v4 = [(IDSDeliveryController *)self encryptionController];
  id v5 = objc_alloc_init(IDSTransferServicesController);
  id v6 = [(IDSMMCSUploader *)v3 initWithEncryptionController:v4 transferServicesController:v5];

  id v7 = [IDSEndpointResolverComponent alloc];
  id v8 = [(IDSDeliveryController *)self peerIDManager];
  id v9 = [(IDSEndpointResolverComponent *)v7 initWithQueryCache:v8];

  id v10 = objc_alloc_init(IDSMadridEndpointFilterComponent);
  id v11 = [IDSEncryptionComponent alloc];
  id v12 = [(IDSDeliveryController *)self encryptionController];
  int64_t v13 = [(IDSDeliveryController *)self pinnedIdentityController];
  id v14 = [(IDSEncryptionComponent *)v11 initWithEncryptionController:v12 pinnedIdentityController:v13];

  CFStringRef v15 = [[IDSMessageFactoryComponent alloc] initWithMMCSUploader:v6];
  id v16 = objc_alloc_init(IDSFanoutFactoryComponent);
  if ((_os_feature_enabled_impl() & 1) != 0
    || +[IMUserDefaults isFirewallEnabled])
  {
    id v17 = [IDSFirewallEndpointDonationComponent alloc];
    id v18 = +[IDSDServiceController sharedInstance];
    id v19 = +[IDSFirewallStore sharedInstance];
    id v20 = [(IDSFirewallEndpointDonationComponent *)v17 initWithServiceController:v18 firewallStore:v19];

    v25[0] = v9;
    v25[1] = v10;
    v25[2] = v20;
    v25[3] = v14;
    v25[4] = v15;
    v25[5] = v16;
    uint64_t v21 = +[NSArray arrayWithObjects:v25 count:6];
  }
  else
  {
    v24[0] = v9;
    v24[1] = v10;
    v24[2] = v14;
    v24[3] = v15;
    v24[4] = v16;
    uint64_t v21 = +[NSArray arrayWithObjects:v24 count:5];
  }
  id v22 = +[IDSPipelineComponent pipelineFromComponents:v21];

  return v22;
}

- (id)_constructOfflineDeliveryPipeline
{
  id v3 = [IDSEndpointResolverComponent alloc];
  unint64_t v4 = [(IDSDeliveryController *)self peerIDManager];
  id v5 = [(IDSEndpointResolverComponent *)v3 initWithQueryCache:v4];

  id v6 = objc_alloc_init(IDSMadridEndpointFilterComponent);
  id v7 = [IDSIMLEncryptionComponent alloc];
  id v8 = [(IDSDeliveryController *)self encryptionController];
  id v9 = [(IDSIMLEncryptionComponent *)v7 initWithEncryptionController:v8];

  id v10 = objc_alloc_init(IDSIMLMessageFactoryComponent);
  id v11 = objc_alloc_init(IDSIMLFanoutFactoryComponent);
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v9;
  v15[3] = v10;
  v15[4] = v11;
  id v12 = +[NSArray arrayWithObjects:v15 count:5];
  int64_t v13 = +[IDSPipelineComponent pipelineFromComponents:v12];

  return v13;
}

- (void)sendRTCMetricWithStartDate:(id)a3 endDate:(id)a4 endpointCount:(int64_t)a5 usedPipeline:(BOOL)a6 usedMMCS:(BOOL)a7 responseCode:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [objc_alloc((Class)IDSDeliveryControllerTimeMetric) initWithStartDate:v14 endDate:v13 endpointCount:a5 usedPipeline:v10 usedMMCS:v9 responseCode:a8];

  id v16 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [v15 timeToSend];
    uint64_t v18 = v17;
    id v19 = [v15 endpointCount];
    if ([v15 usedPipeline]) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    int v23 = 134219010;
    if ([v15 usedMMCS]) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    uint64_t v24 = v18;
    __int16 v25 = 2048;
    id v26 = v19;
    __int16 v27 = 2112;
    CFStringRef v28 = v20;
    __int16 v29 = 2112;
    CFStringRef v30 = v21;
    __int16 v31 = 2048;
    int64_t v32 = a8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Submitting metric { sendTime: %.4f, endpointCount: %ld, pipeline: %@, mmcs: %@ responseCode: %ld }", (uint8_t *)&v23, 0x34u);
  }

  id v22 = +[IDSRTCLogger loggerWithCategory:2000];
  [v22 logMetric:v15];
}

- (void)queueManager:(id)a3 receivedMessagesToSend:(id)a4 forTopic:(id)a5 sendMode:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v30 = a6;
  BOOL v10 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v96 = v9;
    __int16 v97 = 2048;
    id v98 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IDSDeliveryController received messages to coalesce for topic %@ count %lu", buf, 0x16u);
  }

  id v55 = objc_alloc_init((Class)NSMutableArray);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id obj = v8;
  id v57 = [obj countByEnumeratingWithState:&v90 objects:v94 count:16];
  if (v57)
  {
    uint64_t v54 = *(void *)v91;
    uint64_t v53 = IDSDeliveryMessageKey;
    uint64_t v52 = IDSDeliveryDataToEncryptKey;
    uint64_t v51 = IDSDeliveryEncryptionAttributesKey;
    uint64_t v50 = IDSDeliveryServiceKey;
    uint64_t v49 = IDSDeliveryFromIDKey;
    uint64_t v48 = IDSDeliveryFromShortHandle;
    uint64_t v47 = IDSDeliveryFromIdentityKey;
    uint64_t v46 = IDSDeliveryToIDKey;
    uint64_t v45 = IDSDeliveryOriginalURIsKey;
    uint64_t v44 = IDSDeliveryCanUseLargePayloadKey;
    uint64_t v43 = IDSDeliverySendOnePerTokenKey;
    uint64_t v42 = IDSDeliveryRegistrationPropertiesKey;
    uint64_t v41 = IDSDeliveryFakeMessageKey;
    uint64_t v40 = IDSDeliveryAlwaysSkipSelfKey;
    uint64_t v39 = IDSDeliveryAlwaysIncludeSelfKey;
    uint64_t v38 = IDSDeliveryForceQueryKey;
    uint64_t v37 = IDSDeliveryDisallowQueryRefreshKey;
    uint64_t v36 = IDSDeliveryPrioritizedTokenListKey;
    uint64_t v35 = IDSDeliveryIDSDestinationKey;
    uint64_t v34 = IDSDeliveryWillSendBlockKey;
    uint64_t v33 = IDSDeliveryCompletionBlockKey;
    uint64_t v32 = IDSDeliveryFromCoalesceQueueKey;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v91 != v54) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v90 + 1) + 8 * v11);
        id v72 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
        __int16 v84 = [v12 objectForKey:v53];
        id v83 = [v12 objectForKey:v52];
        uint64_t v82 = [v12 objectForKey:v51];
        uint64_t v77 = [v12 objectForKey:v50];
        id v76 = [v12 objectForKey:v49];
        id v74 = [v12 objectForKey:v48];
        uint64_t v81 = [v12 objectForKey:v47];
        id v71 = [v12 objectForKey:v46];
        id v58 = [v12 objectForKey:v45];
        uint64_t v80 = v11;
        id v79 = [v12 objectForKey:v44];
        unsigned __int8 v69 = [v79 BOOLValue];
        id v78 = [v12 objectForKey:v43];
        unsigned __int8 v67 = [v78 BOOLValue];
        id v75 = [v12 objectForKey:v44];
        unsigned __int8 v65 = [v75 BOOLValue];
        id v63 = [v12 objectForKey:v42];
        id v70 = [v12 objectForKey:v41];
        unsigned __int8 v62 = [v70 BOOLValue];
        id v68 = [v12 objectForKey:v40];
        unsigned __int8 v60 = [v68 BOOLValue];
        id v66 = [v12 objectForKey:v39];
        unsigned __int8 v59 = [v66 BOOLValue];
        double v64 = [v12 objectForKey:v38];
        id v13 = [v64 integerValue];
        id v61 = [v12 objectForKey:v37];
        unsigned __int8 v14 = [v61 BOOLValue];
        id v15 = [v12 objectForKey:v36];
        id v16 = [v12 objectForKey:v35];
        uint64_t v17 = [v12 objectForKey:v34];
        uint64_t v18 = [v12 objectForKey:v33];
        id v19 = [v12 objectForKey:v32];
        unsigned __int8 v20 = [v19 BOOLValue];
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_1001DC150;
        v88[3] = &unk_100985920;
        id v89 = v72;
        id v73 = v72;
        LOBYTE(v29) = v20;
        LOBYTE(v28) = 0;
        LOBYTE(v27) = v14;
        BYTE2(v26) = v59;
        BYTE1(v26) = v60;
        LOBYTE(v26) = v62;
        BYTE2(v25) = v65;
        BYTE1(v25) = v67;
        LOBYTE(v25) = v69;
        -[IDSDeliveryController _sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:](self, "_sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:", v84, v83, v82, v77, v76, v74, v81, v71, v58, v25, v63, v26, v13, v27,
          v15,
          v28,
          v16,
          v17,
          v18,
          0,
          0,
          v29,
          v88);

        CFStringRef v21 = [v73 promise];
        [v55 addObject:v21];

        uint64_t v11 = v80 + 1;
      }
      while (v57 != (id)(v80 + 1));
      id v57 = [obj countByEnumeratingWithState:&v90 objects:v94 count:16];
    }
    while (v57);
  }

  id v22 = +[CUTUnsafePromise all:v55];
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1001DC15C;
  v85[3] = &unk_1009841D8;
  v85[4] = self;
  id v86 = v9;
  id v87 = v30;
  id v23 = v30;
  id v24 = v9;
  [v22 registerResultBlock:v85];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderKeyDistributionManager, 0);
  objc_storeStrong((id *)&self->_coalesceMessageQueueManager, 0);
  objc_storeStrong((id *)&self->_tokenURINegativeCache, 0);
  objc_storeStrong((id *)&self->_pendingOfflineMessages, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_storeStrong((id *)&self->_messageDelivery, 0);
}

@end