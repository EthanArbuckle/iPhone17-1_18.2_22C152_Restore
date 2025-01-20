@interface IDSGroupEncryptionController2Shim
+ (id)sharedInstance;
- (BOOL)_isUsingAccount:(id)a3;
- (BOOL)_isValidPushToken:(id)a3;
- (BOOL)_shouldEnforceRemoteTimeout;
- (BOOL)fakeMKMWrapping;
- (BOOL)isTestRunning;
- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9;
- (IDSDSessionController)sessionController;
- (IDSGroupEncryptionController2Shim)init;
- (IDSRealTimeEncryptionIdentity)identityForDevice;
- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice;
- (_TtC17identityservicesd29IDSGroupEncryptionController2)internal;
- (__SecKey)fullIdentityKey;
- (__SecKey)localPrivatePreKey;
- (__SecKey)localPublicPreKey;
- (__SecKey)previousFullIdentityKey;
- (__SecKey)previousLocalPrivatePreKey;
- (__SecKey)previousLocalPublicPreKey;
- (__SecKey)publicKeyForPushToken:(id)a3;
- (double)_multiwayFTMessageSendTimeout;
- (id)_compactKeyMaterialMessage:(id)a3 isOutgoing:(BOOL)a4 groupID:(id)a5;
- (id)_generateMKMBlobForQRFromMessage:(id)a3 account:(id)a4 destination:(id)a5 fromURI:(id)a6;
- (id)_localDevicePushToken;
- (id)activeParticipantsForGroup:(id)a3;
- (id)addPreKeyChangeHandler:(id)a3;
- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4;
- (id)getLightweightStatusDictForGroup:(id)a3;
- (id)getMembersForGroup:(id)a3;
- (id)getParticipantPushTokensForGroup:(id)a3;
- (id)getParticipantPushTokensForGroup:(id)a3 ofType:(int64_t)a4;
- (id)getParticipantsForGroup:(id)a3;
- (id)keyMaterialCacheToGroup:(id)a3;
- (id)localPushToken;
- (id)masterKeyMaterialForGroup:(id)a3;
- (id)p2pNegotiatorProvider;
- (id)publicKeys;
- (id)realTimeEncryptionPublicKeyData;
- (id)realTimeEncryptionPublicKeyForDevice:(id)a3;
- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12;
- (id)remotePushTokensForGroup:(id)a3;
- (id)stableKeyMaterialForGroup:(id)a3;
- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (id)stablekeyMaterialCacheToGroup:(id)a3;
- (int64_t)realTimeEncryptionPublicKeyWrappingMode;
- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5;
- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3;
- (unint64_t)localParticipantIDForGroupID:(id)a3;
- (unint64_t)participantIDForPushToken:(id)a3 inGroup:(id)a4;
- (void)_sendMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 command:(int64_t)a7 timeout:(double)a8 shouldExpire:(BOOL)a9 useQR:(BOOL)a10 completion:(id)a11 completionBlock:(id)a12;
- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3;
- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4;
- (void)cleanUpSessionForID:(id)a3 groupID:(id)a4;
- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4;
- (void)didReceiveEndpointsUpdate:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8;
- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)ensureSessionForID:(id)a3 groupID:(id)a4;
- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10;
- (void)processIncomingPrekeyAckForGroup:(id)a3;
- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9;
- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)removeAccountForGroup:(id)a3;
- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4;
- (void)removeLocalActiveParticipantForGroup:(id)a3;
- (void)reportPrekeyAckStatus:(id)a3;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)resetDevicePrekey;
- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3;
- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4;
- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4;
- (void)resetMKMLocalSentStatus:(id)a3;
- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4;
- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 completion:(id)a7;
- (void)sendKeyMaterialRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5;
- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)sendPreKeyMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)sendPreKeyRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5;
- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5;
- (void)setFakeMKMWrapping:(BOOL)a3;
- (void)setIsTestRunning:(BOOL)a3;
- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6;
- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4;
- (void)unsubscribeEndpointsForGroup:(id)a3;
- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7;
- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
@end

@implementation IDSGroupEncryptionController2Shim

+ (id)sharedInstance
{
  if (qword_100A4C9C0 != -1) {
    dispatch_once(&qword_100A4C9C0, &stru_10098C7E8);
  }
  v2 = (void *)qword_100A4C9C8;

  return v2;
}

- (IDSGroupEncryptionController2Shim)init
{
  v29.receiver = self;
  v29.super_class = (Class)IDSGroupEncryptionController2Shim;
  v2 = [(IDSGroupEncryptionController2Shim *)&v29 init];
  if (v2)
  {
    v3 = +[IMLockdownManager sharedInstance];
    v2->_isInternal = [v3 isInternalInstall];

    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    prekeyAckCountForGroup = v2->_prekeyAckCountForGroup;
    v2->_prekeyAckCountForGroup = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastKnownGroupIDToPushTokens = v2->_lastKnownGroupIDToPushTokens;
    v2->_lastKnownGroupIDToPushTokens = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastKnownAccountIDToPushTokens = v2->_lastKnownAccountIDToPushTokens;
    v2->_lastKnownAccountIDToPushTokens = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accountIDs = v2->_accountIDs;
    v2->_accountIDs = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fromURIs = v2->_fromURIs;
    v2->_fromURIs = v12;

    v2->_lock._os_unfair_lock_opaque = 0;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ids.realtimeencryptioncontroller", v14);
    realtimeEncryptionQueue = v2->_realtimeEncryptionQueue;
    v2->_realtimeEncryptionQueue = (OS_dispatch_queue *)v15;

    v17 = [_TtC17identityservicesd31IDSGroupEncryptionConfiguration alloc];
    v18 = +[IDSServerBag sharedInstance];
    v19 = [(IDSGroupEncryptionConfiguration *)v17 initWithBag:v18];

    v20 = [[_TtC17identityservicesd36IDSGroupEncryptionIdentityController alloc] initWithConfig:v19];
    v21 = [_TtC17identityservicesd29IDSGroupEncryptionController2 alloc];
    v22 = [(IDSGroupEncryptionController2Shim *)v2 sessionController];
    v23 = [(IDSGroupEncryptionController2 *)v21 initWithDelegate:v2 config:v19 sessionProvider:v22 identityController:v20 pushHandler:v2];
    internal = v2->_internal;
    v2->_internal = v23;

    int v25 = IMGetDomainBoolForKeyWithDefaultValue();
    if ((_os_feature_enabled_impl() & 1) != 0 || v25)
    {
      v26 = [[_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController alloc] initWithIdentityProvider:v2 groupMetadataProvider:v2];
      p2pNegotiatorProvider = v2->_p2pNegotiatorProvider;
      v2->_p2pNegotiatorProvider = (IDSGlobalLinkP2PKeyNegotiatorProvider *)v26;
    }
  }
  return v2;
}

- (IDSDSessionController)sessionController
{
  id sessionController = self->_sessionController;
  if (sessionController)
  {
    id v3 = sessionController;
  }
  else
  {
    id v3 = +[IDSDSessionController sharedInstance];
  }

  return (IDSDSessionController *)v3;
}

- (id)_localDevicePushToken
{
  v2 = +[IDSPushHandler sharedInstance];
  id v3 = [v2 pushToken];
  v4 = +[IDSPushToken pushTokenWithData:v3];

  return v4;
}

- (__SecKey)localPublicPreKey
{
  v2 = [(IDSGroupEncryptionController2Shim *)self identityForDevice];
  id v3 = (__SecKey *)[v2 publicIdentity];

  return v3;
}

- (__SecKey)localPrivatePreKey
{
  v2 = [(IDSGroupEncryptionController2Shim *)self identityForDevice];
  id v3 = (__SecKey *)[v2 fullIdentity];

  return v3;
}

- (__SecKey)previousLocalPublicPreKey
{
  v2 = [(IDSGroupEncryptionController2Shim *)self previousIdentityForDevice];
  id v3 = (__SecKey *)[v2 publicIdentity];

  return v3;
}

- (__SecKey)previousLocalPrivatePreKey
{
  v2 = [(IDSGroupEncryptionController2Shim *)self previousIdentityForDevice];
  id v3 = (__SecKey *)[v2 fullIdentity];

  return v3;
}

- (__SecKey)publicKeyForPushToken:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal objcPublicIdentityForPushToken:a3];
  v4 = (__SecKey *)[v3 publicIdentity];

  return v4;
}

- (id)addPreKeyChangeHandler:(id)a3
{
  return &stru_10098C808;
}

- (id)remotePushTokensForGroup:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  v4 = [v3 participantPushTokens];
  v5 = [v4 allObjects];

  return v5;
}

- (id)localPushToken
{
  return [(IDSGroupEncryptionController2 *)self->_internal pushToken];
}

- (BOOL)_isUsingAccount:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(NSMutableDictionary *)self->_accountIDs allValues];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003F34C8;
  v8[3] = &unk_100984818;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    id v11 = a4;
    os_unfair_lock_lock(&self->_lock);
    if (![(IDSGroupEncryptionController2Shim *)self _isUsingAccount:v8])
    {
      v12 = im_primary_queue();
      char v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      v16 = sub_1003F36C0;
      v17 = &unk_10097E440;
      id v18 = v8;
      v19 = self;
      dispatch_async(v12, &v14);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountIDs, "setObject:forKeyedSubscript:", v8, v10, v14, v15, v16, v17);
    [(NSMutableDictionary *)self->_fromURIs setObject:v11 forKeyedSubscript:v10];

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v13 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setAccount: added the accountID %@ for group %@", buf, 0x16u);
    }
  }
}

- (void)removeAccountForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_accountIDs setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_fromURIs setObject:0 forKeyedSubscript:v4];
    if (v5 && ![(IDSGroupEncryptionController2Shim *)self _isUsingAccount:v5])
    {
      id v6 = im_primary_queue();
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1003F3A84;
      v8[3] = &unk_10097E440;
      id v9 = v5;
      v10 = self;
      dispatch_async(v6, v8);
    }
    os_unfair_lock_unlock(&self->_lock);
    v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removeAccountForGroup: removed the account for group %@", buf, 0xCu);
    }
  }
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
  -[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4, a5, a6, a7);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 updateDesiredMaterials];
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  -[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 updateDesiredMaterials];
}

- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  -[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 updateDesiredMaterials];
}

- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  internal = self->_internal;
  id v8 = a3;
  id v9 = [(IDSGroupEncryptionController2 *)internal identityController];
  v10 = [v9 ensurePublicIdentityForDevice:v8];

  id v11 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003F3D68;
  block[3] = &unk_10097E7F0;
  id v16 = v6;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v11, v13);

  return v10;
}

- (int64_t)realTimeEncryptionPublicKeyWrappingMode
{
  return [(IDSGroupEncryptionController2 *)self->_internal publicIdentityWrapMode];
}

- (id)realTimeEncryptionPublicKeyData
{
  return [(IDSGroupEncryptionController2 *)self->_internal publicIdentityData];
}

- (IDSRealTimeEncryptionIdentity)identityForDevice
{
  return [(IDSGroupEncryptionController2 *)self->_internal objcPublicIdentity];
}

- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice
{
  return [(IDSGroupEncryptionController2 *)self->_internal objcPreviousPublicIdentity];
}

- (void)processIncomingPrekeyAckForGroup:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKeyedSubscript:v4];
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 intValue] + 1);
  [(NSMutableDictionary *)self->_prekeyAckCountForGroup setObject:v6 forKeyedSubscript:v4];

  id v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKeyedSubscript:v4];
    int v9 = 138412546;
    v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current ACK'd number of prekey: %@ for group: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)reportPrekeyAckStatus:(id)a3
{
  id v4 = a3;
  v5 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKeyedSubscript:v4];
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Report the prekey ACK'd (final count: %@) result for group: %@", (uint8_t *)&v7, 0x16u);
  }
  [(NSMutableDictionary *)self->_prekeyAckCountForGroup removeObjectForKey:v4];
}

- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4
{
  id v4 = [(IDSGroupEncryptionController2Shim *)self stableKeyMaterialForGroup:a3 sessionID:a4];
}

- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4
{
}

- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  [v3 cancelKMCacheReset];
}

- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4
{
  id v6 = a4;
  int v7 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v6];
  id v8 = [v7 encryptionSequenceNumber];
  __int16 v9 = +[IDSFoundationLog RealTimeEncryptionController];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v8 >= a3)
  {
    if (v10)
    {
      int v11 = 134218498;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ignoring encryption sequence number %llu (old: %llu) for groupID %@ (Client -> *IDSD)", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 134218498;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "storing encryption sequence number %llu (old: %llu) for groupID %@ (Client -> *IDSD)", (uint8_t *)&v11, 0x20u);
    }

    [v7 setEncryptionSequenceNumber:a3];
  }
}

- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3
{
  id v4 = a3;
  v5 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v4];
  id v6 = [v5 encryptionSequenceNumber];
  int v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "returning stored encryption sequence number %llu for groupID %@ (Client <- *IDSD)", (uint8_t *)&v9, 0x16u);
  }

  return (unint64_t)v6;
}

- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9
{
  return 1;
}

- (id)realTimeEncryptionPublicKeyForDevice:(id)a3
{
  return [(IDSGroupEncryptionController2 *)self->_internal objcPublicIdentityForPushToken:a3];
}

- (id)publicKeys
{
  v2 = [(IDSGroupEncryptionController2 *)self->_internal publicKeys];
  id v3 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "publicKeys: %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5
{
  if (!a3) {
    return 0;
  }
  internal = self->_internal;
  id v8 = a4;
  int v9 = [(IDSGroupEncryptionController2 *)internal groupForID:v8];
  id v10 = [v9 localParticipantID];

  __int16 v11 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v8];

  [v11 setLocalParticipantID:a3];
  if (v10) {
    return 2 * (v10 != (id)a3);
  }
  else {
    return 1;
  }
}

- (unint64_t)localParticipantIDForGroupID:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  id v4 = [v3 localParticipantID];

  return (unint64_t)v4;
}

- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = [(IDSGroupEncryptionController2Shim *)self sessionController];
  id v10 = [v9 sessionWithGroupID:v8];

  if (v10)
  {
    id v19 = v8;
    __int16 v11 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v8];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = [v11 participants];
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v16);
          id v18 = [v10 uniqueID];
          [v17 recoverKeyMaterialForSessionID:v18 mkm:v6 skm:v5];

          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    id v8 = v19;
  }
  else
  {
    __int16 v11 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToGroup: no session", buf, 2u);
    }
  }
}

- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
  BOOL v25 = a7;
  BOOL v7 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v27;
    *(void *)&long long v16 = 138412290;
    long long v24 = v16;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v14);
        }
        long long v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v21 = objc_msgSend(v13, "participantForID:", objc_msgSend(v20, "unsignedLongLongValue", v24));
        long long v22 = v21;
        if (v21)
        {
          [v21 recoverKeyMaterialForSessionID:v12 mkm:v7 skm:v25];
        }
        else
        {
          long long v23 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v31 = v20;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToParticipants: participant not found for ID %@", buf, 0xCu);
          }
        }
      }
      id v17 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)sendKeyMaterialRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v14 = a3;
  [(IDSGroupEncryptionController2Shim *)self _multiwayFTMessageSendTimeout];
  LOBYTE(v13) = 0;
  -[IDSGroupEncryptionController2Shim _sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:](self, "_sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:", v14, v12, v11, v10, 211, 1, v13, 0, 0);
}

- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  long long v22 = [(IDSGroupEncryptionController2Shim *)self sessionController];
  long long v23 = [v22 sessionWithUniqueID:v20];

  v65 = self;
  long long v24 = [(IDSGroupEncryptionController2Shim *)self sessionController];
  BOOL v25 = [v24 sessionWithGroupID:v19];

  uint64_t v67 = [v18 URIByAddingOptionalPushToken:v17];
  if (objc_msgSend(v23, "destinationsContainFromURI:")
    && ([v25 destinationsContainFromURI:v67] & 1) != 0)
  {
    v58 = v25;
    id v59 = v20;
    v63 = v23;
    id v64 = v21;
    id v60 = v19;
    v61 = v16;
    v62 = [(IDSGroupEncryptionController2 *)v65->_internal groupForID:v19];
    [v62 participants];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v26 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v70;
      while (2)
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v70 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v31 = [v30 pushToken];
          unsigned int v32 = [v31 isEqual:v17];

          if (v32)
          {
            id v33 = objc_alloc((Class)IDSURI);
            v34 = [v30 allocatedURI];
            id v35 = [v33 initWithPrefixedURI:v34];
            unsigned __int8 v36 = [v18 isEqual:v35];

            if (v36)
            {
              id v45 = v30;

              id v16 = v61;
              v57 = [v61 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionPublicKey];
              v56 = [v61 _numberForKey:IDSDSessionMessageRealTimeEncryptionWrapModeKey];
              v46 = +[IDSFoundationLog RealTimeEncryptionController];
              id v20 = v59;
              id v19 = v60;
              id v21 = v64;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413571;
                id v74 = v60;
                __int16 v75 = 2112;
                uint64_t v76 = (uint64_t)v59;
                __int16 v77 = 2112;
                id v78 = v64;
                __int16 v79 = 2112;
                id v80 = v17;
                __int16 v81 = 2112;
                id v82 = v18;
                __int16 v83 = 2113;
                v84 = v61;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest for group %@, session %@, serverDate %@, pushToken: %@, fromID: %@, message %{private}@", buf, 0x3Eu);
              }

              v47 = +[IDSFoundationLog RealTimeEncryptionController];
              long long v23 = v63;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                ids_monotonic_time();
                *(_DWORD *)buf = 134217984;
                id v74 = v48;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Receiving Key Material (Push, KeyMaterialsRecovery) [PreKey] -- %f", buf, 0xCu);
              }

              -[IDSGroupEncryptionController2Shim setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:](v65, "setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:", v57, v17, v18, v60, v59, v64, [v56 integerValue]);
              if (v63)
              {
                v49 = [v18 prefixedURI];
                v50 = [v17 rawToken];
                uint64_t v66 = +[IDSDestination destinationWithAlias:v49 pushToken:v50];

                long long v23 = v63;
                v51 = [(IDSGroupEncryptionController2 *)v65->_internal groupForID:v60];
                v52 = [v51 ensureSessionForID:v59];
                [v52 setKeyMaterialIsNeededForParticipant:v45 forMKM:a9 forSKM:a10];

                id v21 = v64;
                [(IDSGroupEncryptionController2Shim *)v65 sendPublicKeyToDestination:v66 group:v60 sessionID:v59];
                v53 = [v17 rawToken];
                [v63 reportPreKeyReceivedOverPushFromToken:v53];

                v54 = (void *)v66;
                v43 = v58;
              }
              else
              {
                v55 = +[IDSFoundationLog RealTimeEncryptionController];
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v74 = v60;
                  __int16 v75 = 2112;
                  uint64_t v76 = (uint64_t)v59;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest - there is no group session for group %@, session %@. We won't send any MKM/SKM.", buf, 0x16u);
                }
                v43 = v58;
                v54 = v55;
              }
              v42 = (void *)v67;

              goto LABEL_31;
            }
            v37 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              id v38 = objc_alloc((Class)IDSURI);
              v39 = [v30 allocatedURI];
              id v40 = [v38 initWithPrefixedURI:v39];
              *(_DWORD *)buf = 138412546;
              id v74 = v18;
              __int16 v75 = 2112;
              uint64_t v76 = (uint64_t)v40;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest: found a participant with different URI %@ vs %@.", buf, 0x16u);
            }
          }
        }
        id v27 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }

    v41 = +[IDSFoundationLog RealTimeEncryptionController];
    id v19 = v60;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v74 = v60;
      __int16 v75 = 2112;
      uint64_t v76 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest: We'll drop this key recovery request for group [%@] since deviceToken [%@] is not in the active participant list!", buf, 0x16u);
    }

    long long v23 = v63;
    v42 = (void *)v67;
    [v63 rejectedKeyRecoveryRequestFromURI:v67 reason:2];
    id v16 = v61;
    v43 = v58;
    id v20 = v59;
    id v21 = v64;
LABEL_31:
  }
  else
  {
    v43 = v25;
    v44 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v74 = v19;
      __int16 v75 = 2112;
      uint64_t v76 = v67;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest: We'll drop this prekey recovery request for group %@ since %@ is not in this group!", buf, 0x16u);
    }

    v42 = (void *)v67;
    [v23 rejectedKeyRecoveryRequestFromURI:v67 reason:1];
  }
}

- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  if (v18)
  {
    long long v24 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v22];
    BOOL v25 = [v24 receiveMKMWithKeyMaterialDictionary:v18 fromPushToken:v20 fromURI:v21 sessionID:v23 isFromSender:a9];

    if (v25)
    {
      Mutable = [v25 keyIndex];

      if (Mutable)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        [Mutable setObject:v25 forKeyedSubscript:@"ids-rtencryption-master-key-material-key"];
      }
    }
    else
    {
      Mutable = 0;
    }

    if (v19) {
      goto LABEL_9;
    }
  }
  else
  {
    Mutable = 0;
    if (v19)
    {
LABEL_9:
      id v27 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v22];
      id v28 = [v27 receiveSKMWithKeyMaterialDictionary:v19 fromPushToken:v20 fromURI:v21 sessionID:v23 isFromSender:a9];
    }
  }

  return Mutable;
}

- (id)masterKeyMaterialForGroup:(id)a3
{
  return 0;
}

- (id)stableKeyMaterialForGroup:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  id v4 = [v3 stableKeyMaterial];

  return v4;
}

- (void)resetMKMLocalSentStatus:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  [v3 resetKeysSentToClient];
}

- (double)_multiwayFTMessageSendTimeout
{
  v2 = +[IDSServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"ids-multiway-ftmessage-send-timeout"];

  double v4 = 605.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      if (v5 > 0.0)
      {
        double v6 = v5;
        BOOL v7 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          double v10 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a send timeout of %f ", (uint8_t *)&v9, 0xCu);
        }

        double v4 = v6;
      }
    }
  }

  return v4;
}

- (BOOL)_shouldEnforceRemoteTimeout
{
  v2 = +[IDSServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"ids-multiway-ftmessage-enforce-remote-timeout"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v4 = [v3 BOOLValue];
    double v5 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with should enforce remote timeout %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)resetDevicePrekey
{
  id v3 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset the device prekey", v6, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v5 = [(IDSGroupEncryptionController2 *)self->_internal identityController];
  [v5 resetPreKey];

  os_unfair_lock_unlock(p_lock);
}

- (id)activeParticipantsForGroup:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    CFStringRef v6 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v5];

    BOOL v7 = [v6 participantPushTokens];
    int v8 = [v7 allObjects];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)removeLocalActiveParticipantForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSGroupEncryptionController2Shim *)self _localDevicePushToken];
  [(IDSGroupEncryptionController2Shim *)self removeActiveParticipant:v5 forGroup:v4];
}

- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4
{
  if (a3 && a4)
  {
    p_lock = &self->_lock;
    id v7 = a4;
    id v8 = a3;
    os_unfair_lock_lock(p_lock);
    id v9 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v7];

    [v9 removeParticipantForToken:v8];
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v8 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v6];
    id v9 = v8;
    if (v4)
    {
      [v8 removeAllParticipants];
      [v9 resetKeysToPropagate];
      [v9 resetKeysSentToClient];
      [v9 hardRoll];
    }
    else
    {
      [v8 resetKeysToPropagate];
      [v9 resetKeysSentToClient];
    }
    double v10 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"NO";
      if (v4) {
        CFStringRef v11 = @"YES";
      }
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      CFStringRef v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "resetKeysForGroup: %@, shouldRemoveCurrentParticipants: %@", (uint8_t *)&v12, 0x16u);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)unsubscribeEndpointsForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v4];
    [v6 removeAllMembers];
    [v6 removeAllParticipants];
    [(NSMutableDictionary *)self->_lastKnownGroupIDToPushTokens setObject:0 forKeyedSubscript:v4];
    id v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "unsubscribeEndpointsForGroup: %@", (uint8_t *)&v8, 0xCu);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (__SecKey)fullIdentityKey
{
  return [(IDSGroupEncryptionController2 *)self->_internal fullIdentityKey];
}

- (__SecKey)previousFullIdentityKey
{
  return [(IDSGroupEncryptionController2 *)self->_internal previousFullIdentityKey];
}

- (unint64_t)participantIDForPushToken:(id)a3 inGroup:(id)a4
{
  internal = self->_internal;
  id v6 = a3;
  id v7 = [(IDSGroupEncryptionController2 *)internal groupForID:a4];
  int v8 = [v7 participantForToken:v6];

  id v9 = [v8 participantID];
  return (unint64_t)v9;
}

- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  internal = self->_internal;
  id v6 = a4;
  id v7 = [(IDSGroupEncryptionController2 *)internal groupForID:a3];
  int v8 = [v7 ensureSessionForID:v6];

  id v9 = [v8 skmController];
  [v9 ensureKey];

  double v10 = [v8 skmController];
  CFStringRef v11 = [v10 currentObjcMaterial];

  return v11;
}

- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [(IDSGroupEncryptionController2Shim *)self _multiwayFTMessageSendTimeout];
  double v18 = v17;
  BOOL shouldSendMKMOverQR = self->_shouldSendMKMOverQR;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1003F5B7C;
  v22[3] = &unk_10098C870;
  id v23 = v12;
  id v20 = v12;
  LOBYTE(v21) = shouldSendMKMOverQR;
  [(IDSGroupEncryptionController2Shim *)self _sendMessage:v16 toDestination:v15 forGroup:v14 sessionID:v13 command:211 timeout:1 shouldExpire:v18 useQR:v21 completion:&stru_10098C848 completionBlock:v22];
}

- (void)_sendMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 command:(int64_t)a7 timeout:(double)a8 shouldExpire:(BOOL)a9 useQR:(BOOL)a10 completion:(id)a11 completionBlock:(id)a12
{
  BOOL v12 = a9;
  id v56 = a3;
  id v19 = a4;
  id v20 = a5;
  id v55 = a6;
  id v53 = a11;
  id v54 = a12;
  uint64_t v21 = +[IDSDAccountController sharedInstance];
  id v22 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v20];
  id v23 = [v21 accountWithUniqueID:v22];

  uint64_t v24 = [(NSMutableDictionary *)self->_fromURIs objectForKeyedSubscript:v20];
  BOOL v25 = (void *)v24;
  if (v23 && v24)
  {
    *(void *)id v82 = 0;
    *(void *)&v82[8] = v82;
    *(void *)&v82[16] = 0x2020000000;
    LOBYTE(v83) = 0;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    char v75 = 0;
    int v26 = IMGetDomainBoolForKey() ^ 1;
    if (a7 != 211) {
      LOBYTE(v26) = 1;
    }
    if (v26)
    {
      long long v29 = [(IDSGroupEncryptionController2Shim *)self sessionController];
      id v27 = [v29 sessionWithUniqueID:v55];

      if (a7 == 211 && a10)
      {
        v30 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "sendMessage: calling _generateMKMBlobForQRFromMessage", buf, 2u);
        }

        v31 = [(IDSGroupEncryptionController2Shim *)self _generateMKMBlobForQRFromMessage:v56 account:v23 destination:v19 fromURI:v25];
        if (v31)
        {
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_1003F649C;
          v67[3] = &unk_100984AE8;
          long long v72 = v82;
          v73 = v74;
          v68 = v20;
          id v69 = v55;
          id v70 = v53;
          id v71 = v54;
          [v27 sendKeyMaterialMessageDataOverQR:v31 toDestination:v19 completionBlock:v67];

          unsigned int v32 = v68;
        }
        else
        {
          unsigned int v32 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v77 = v27;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to generate a blob to send via QR, only using push {session: %@}", buf, 0xCu);
          }
        }
      }
      v52 = +[NSString stringGUID];
      id v33 = objc_alloc_init((Class)IDSSendParameters);
      v34 = [v25 unprefixedURI];
      [v33 setFromID:v34];

      [v33 setMessage:v56];
      [v33 setEncryptPayload:1];
      [v33 setPriority:300];
      [v33 setDestinations:v19];
      id v35 = +[NSNumber numberWithInteger:a7];
      [v33 setCommand:v35];

      [v33 setIdentifier:v52];
      [v33 setAlwaysSkipSelf:1];
      unsigned __int8 v36 = IDSGetUUIDData();
      [v33 setMessageUUID:v36];

      [v33 setTimeout:a8];
      [v33 setIgnoreMaxRetryCount:1];
      [v33 setWantsResponse:1];
      if (v12) {
        objc_msgSend(v33, "setEnforceRemoteTimeouts:", -[IDSGroupEncryptionController2Shim _shouldEnforceRemoteTimeout](self, "_shouldEnforceRemoteTimeout"));
      }
      v37 = [v27 requiredLackOfCapabilities];
      id v38 = [v37 count];

      if (v38)
      {
        v39 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [v27 requiredLackOfCapabilities];
          *(_DWORD *)buf = 138412290;
          __int16 v77 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Group session encryption message requires lack of properties {requiredLackOfCapabilities: %@}", buf, 0xCu);
        }
        v41 = [v27 requiredLackOfCapabilities];
        [v33 setRequireLackOfRegistrationProperties:v41];
      }
      v42 = [v27 requiredCapabilities];
      id v43 = [v42 count];

      if (v43)
      {
        v44 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = [v27 requiredCapabilities];
          *(_DWORD *)buf = 138412290;
          __int16 v77 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Group session encryption message requires properties {requiredCapabilities: %@}", buf, 0xCu);
        }
        v46 = [v27 requiredCapabilities];
        [v33 setRequireAllRegistrationProperties:v46];
      }
      v47 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        [v33 timeout];
        *(_DWORD *)buf = 138412802;
        __int16 v77 = v52;
        __int16 v78 = 2048;
        int64_t v79 = a7;
        __int16 v80 = 2048;
        uint64_t v81 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Sending group session encryption message { GUID: %@, command: %ld, timeout: %f }", buf, 0x20u);
      }

      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1003F6618;
      v58[3] = &unk_100984B10;
      v49 = v52;
      id v59 = v49;
      id v64 = v82;
      v65 = v74;
      int64_t v66 = a7;
      id v60 = v20;
      id v61 = v55;
      id v62 = v53;
      id v63 = v54;
      [v23 sendMessageWithSendParameters:v33 willSendBlock:0 completionBlock:v58];
      v50 = +[NSNumber numberWithInteger:a7];
      v51 = +[NSString stringWithFormat:@"sendMessage: Sent messageID %@ to the destination %@ command %@ (message: %@)", v49, v19, v50, v56];

      id v57 = v51;
      cut_dispatch_log_queue();
    }
    else
    {
      id v27 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "sendMessage: do not send MKM over push, return", buf, 2u);
      }
    }

    _Block_object_dispose(v74, 8);
    _Block_object_dispose(v82, 8);
  }
  else
  {
    id v28 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v82 = 138412802;
      *(void *)&v82[4] = v23;
      *(_WORD *)&v82[12] = 2112;
      *(void *)&v82[14] = v25;
      *(_WORD *)&v82[22] = 2112;
      id v83 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "sendMessage: account: %@ fromID: %@ - failed to get the account forGroup: %@", v82, 0x20u);
    }
  }
}

- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5
{
}

- (void)sendPreKeyMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003F6A9C;
  block[3] = &unk_1009812A0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)sendPreKeyRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003F6C2C;
  block[3] = &unk_1009812A0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9
{
  id v63 = a3;
  id v60 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v61 = a9;
  id v18 = +[NSMutableSet set];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v72;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (v24 && ([*(id *)(*((void *)&v71 + 1) + 8 * i) isNull] & 1) == 0)
        {
          BOOL v25 = objc_msgSend(v24, "__imHexString");
          [v18 addObject:v25];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v21);
  }

  int v26 = +[IDSPeerIDManager sharedInstance];
  id v80 = v15;
  id v27 = +[NSArray arrayWithObjects:&v80 count:1];
  id v59 = v14;
  id v28 = [v14 service];
  long long v29 = [v28 identifier];
  v30 = [v26 endpointsForURIs:v27 service:v29 fromURI:v16];

  v31 = [v30 objectForKey:v15];
  id v57 = v16;
  id v58 = v15;
  id v56 = v30;
  if ([v19 count])
  {
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1003F7298;
    v69[3] = &unk_100984B88;
    id v70 = v18;
    uint64_t v32 = [v31 sortedArrayUsingComparator:v69];

    v31 = (void *)v32;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v31;
  id v33 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v66;
    while (2)
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v66 != v35) {
          objc_enumerationMutation(obj);
        }
        v37 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
        id v38 = +[IDSEncryptionController sharedInstance];
        id v64 = 0;
        v39 = [v38 publicKeyDecryptData:v63 fromEndpoint:v37 pkType:1 priority:300 error:&v64];
        id v40 = v64;

        if (v40)
        {
          v41 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v76 = v40;
            __int16 v77 = 2112;
            __int16 v78 = v37;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Failed to process QRMKM payload {error: %@, endpoint: %@}", buf, 0x16u);
          }
        }
        else if (v39)
        {
          id v49 = v37;

          v50 = JWDecodeDictionary();
          v44 = v60;
          v51 = [(IDSGroupEncryptionController2Shim *)self _compactKeyMaterialMessage:v50 isOutgoing:0 groupID:v60];
          v52 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v50;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Decoded QR MKM Payload {decodedPayload: %@}", buf, 0xCu);
          }

          id v53 = +[IDSFoundationLog RealTimeEncryptionController];
          v46 = v57;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v51;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Expanded QR MKM Payload {expandedPayload: %@}", buf, 0xCu);
          }

          v47 = v61;
          if (v61)
          {
            id v54 = [v49 pushToken];
            (*((void (**)(id, void *, void *))v61 + 2))(v61, v51, v54);

            v47 = v61;
          }

          id v45 = v58;
          id v43 = v59;
          uint64_t v48 = v56;
          goto LABEL_37;
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }

  v42 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Unable to decrypt the incoming MKM QR blob -- returning nil", buf, 2u);
  }

  id v43 = v59;
  v44 = v60;
  v46 = v57;
  id v45 = v58;
  v47 = v61;
  uint64_t v48 = v56;
  if (v61) {
    (*((void (**)(id, void, void))v61 + 2))(v61, 0, 0);
  }
  id v49 = 0;
  v39 = 0;
LABEL_37:
}

- (id)_generateMKMBlobForQRFromMessage:(id)a3 account:(id)a4 destination:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 destinationURIs];
  id v15 = [v14 count];

  if ((unint64_t)v15 < 2)
  {
    id v18 = [v12 destinationURIs];
    id v16 = [v18 anyObject];

    id v55 = 0;
    id v19 = [v16 _stripPotentialTokenURIWithToken:&v55];
    id v20 = v55;
    if (v20)
    {
      v44 = self;
      uint64_t v48 = v16;
      id v49 = v12;
      id v52 = v10;
      id v21 = +[IDSPeerIDManager sharedInstance];
      uint64_t v22 = [v11 service];
      [v22 identifier];
      v24 = id v23 = v19;
      id v46 = v20;
      BOOL v25 = +[IDSPushToken pushTokenWithData:v20 withServiceLoggingHint:v24];
      int v26 = [v11 service];
      id v27 = [v26 identifier];
      v47 = v23;
      id v28 = +[IDSURI URIWithPrefixedURI:v23 withServiceLoggingHint:v27];
      id v51 = v11;
      long long v29 = [v11 service];
      v30 = [v29 identifier];
      id v50 = v13;
      uint64_t v31 = [v21 endpointForPushToken:v25 URI:v28 service:v30 fromURI:v13];

      uint64_t v32 = v31;
      if (v31)
      {
        id v10 = v52;
        id v33 = [(IDSGroupEncryptionController2Shim *)v44 _compactKeyMaterialMessage:v52 isOutgoing:1 groupID:0];
        uint64_t v34 = JWEncodeDictionary();
        unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v35 = +[IDSEncryptionController sharedInstance];
        id v53 = 0;
        id v45 = (void *)v34;
        unsigned __int8 v36 = [v35 publicKeyEncryptData:v34 encryptionContext:0 forceSizeOptimizations:0 resetState:0 withEncryptedAttributes:0 toEndpoint:v32 usedEncryptionType:&v54 priority:300 metadata:0 error:&v53];
        v37 = v53;

        id v43 = v37;
        if (v36)
        {
          unint64_t v38 = v54;
          v39 = +[IDSFoundationLog RealTimeEncryptionController];
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          id v16 = v48;
          id v12 = v49;
          id v20 = v46;
          if (v38 == 4)
          {
            id v13 = v50;
            if (v40)
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v33;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Encoded QR MKM Payload {compactPayload: %@}", buf, 0xCu);
            }

            id v17 = v36;
          }
          else
          {
            id v13 = v50;
            if (v40)
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v32;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "QR MKM payload used legacy encryption -- returning nil {endpointToTarget: %@}", buf, 0xCu);
            }

            id v17 = 0;
          }
        }
        else
        {
          v41 = +[IDSFoundationLog RealTimeEncryptionController];
          id v16 = v48;
          id v12 = v49;
          id v20 = v46;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v37;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "QR MKM payload failed to encrypt -- returning nil {error: %@}", buf, 0xCu);
          }

          id v17 = 0;
          id v13 = v50;
        }

        id v19 = v47;
      }
      else
      {
        id v33 = +[IDSFoundationLog RealTimeEncryptionController];
        id v10 = v52;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v20 = v46;
          id v19 = v47;
          id v57 = v47;
          __int16 v58 = 2112;
          id v59 = v46;
          __int16 v60 = 2112;
          id v13 = v50;
          id v61 = v50;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No endpoint found to target, not triggering a query -- returning nil {destinationURIString: %@, tokenFromURL: %@, fromURI: %@}", buf, 0x20u);
          id v17 = 0;
          id v16 = v48;
          id v12 = v49;
        }
        else
        {
          id v17 = 0;
          id v12 = v49;
          id v13 = v50;
          id v19 = v47;
          id v16 = v48;
          id v20 = v46;
        }
      }

      id v11 = v51;
    }
    else
    {
      uint64_t v32 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v16;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Unable to generate a QR MKM payload to a non-specific URI -- returning nil {fullDestinationURIString: %@}", buf, 0xCu);
      }
      id v17 = 0;
    }
  }
  else
  {
    id v16 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to generate a QR MKM payload to more than 1 destination -- returning nil {destination: %@}", buf, 0xCu);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)_compactKeyMaterialMessage:(id)a3 isOutgoing:(BOOL)a4 groupID:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v6) {
    id v10 = &off_1009D2D88;
  }
  else {
    id v10 = &off_1009D2DA0;
  }
  if (v6) {
    id v11 = &off_1009D2DA0;
  }
  else {
    id v11 = &off_1009D2D88;
  }
  id v12 = [v7 mutableCopy];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsKey];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsURIsKey];
  [v12 removeObjectForKey:IDSFanoutMessageGroupIDKey];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionStableKeyMaterialKey];
  if (v8)
  {
    id v13 = [v11 objectAtIndexedSubscript:0];
    [v12 setObject:v8 forKeyedSubscript:v13];
  }
  id v14 = [v10 objectAtIndexedSubscript:1];
  id v15 = [v12 _arrayForKey:v14];

  if (v15)
  {
    id v16 = [v10 objectAtIndexedSubscript:1];
    [v12 removeObjectForKey:v16];

    id v17 = [v11 objectAtIndexedSubscript:1];
    [v12 setObject:v15 forKeyedSubscript:v17];
  }
  id v18 = [v10 objectAtIndexedSubscript:2];
  id v19 = [v12 _dictionaryForKey:v18];
  id v20 = [v19 mutableCopy];

  if (v20)
  {
    BOOL v40 = v9;
    id v41 = v8;
    id v21 = [v10 objectAtIndexedSubscript:4];
    uint64_t v22 = [v20 _numberForKey:v21];

    if (v22)
    {
      id v23 = [v10 objectAtIndexedSubscript:4];
      [v20 removeObjectForKey:v23];

      uint64_t v24 = [v11 objectAtIndexedSubscript:4];
      [v20 setObject:v22 forKeyedSubscript:v24];
    }
    BOOL v25 = [v10 objectAtIndexedSubscript:5];
    int v26 = [v20 _dataForKey:v25];

    if (v26)
    {
      id v27 = [v10 objectAtIndexedSubscript:5];
      [v20 removeObjectForKey:v27];

      id v28 = [v11 objectAtIndexedSubscript:5];
      [v20 setObject:v26 forKeyedSubscript:v28];
    }
    id v42 = v7;
    long long v29 = [v10 objectAtIndexedSubscript:6];
    v30 = [v20 _dataForKey:v29];

    if (v30)
    {
      uint64_t v31 = [v10 objectAtIndexedSubscript:6];
      [v20 removeObjectForKey:v31];

      uint64_t v32 = [v11 objectAtIndexedSubscript:6];
      [v20 setObject:v30 forKeyedSubscript:v32];
    }
    id v33 = [v10 objectAtIndexedSubscript:7];
    uint64_t v34 = [v20 _dataForKey:v33];

    if (v34)
    {
      uint64_t v35 = [v10 objectAtIndexedSubscript:7];
      [v20 removeObjectForKey:v35];

      unsigned __int8 v36 = [v11 objectAtIndexedSubscript:7];
      [v20 setObject:v34 forKeyedSubscript:v36];
    }
    v37 = [v10 objectAtIndexedSubscript:2];
    [v12 removeObjectForKey:v37];

    unint64_t v38 = [v11 objectAtIndexedSubscript:2];
    [v12 setObject:v20 forKeyedSubscript:v38];

    id v8 = v41;
    id v7 = v42;
    id v9 = v40;
  }

  return v12;
}

- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4
{
  -[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 updateDesiredMaterials];
}

- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v5;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "rollNewKeysAfterResettingPrekeysForGroups: %@ reason: %ld", buf, 0x16u);
  }

  id v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v5;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rollNewKeysAfterResettingPrekeysForGroups: %@ reason: %ld", buf, 0x16u);
  }

  id v8 = [(IDSGroupEncryptionController2Shim *)self identityForDevice];
  id v9 = [v8 pushToken];
  id v10 = [v9 copy];

  [(IDSGroupEncryptionController2Shim *)self resetDevicePrekey];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v15);
        id v17 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1003F8098;
        block[3] = &unk_10097E418;
        void block[4] = self;
        void block[5] = v16;
        id v20 = v10;
        dispatch_async(v17, block);

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)didReceiveEndpointsUpdate:(id)a3 forGroup:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSMutableSet set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)v16) pushTokenObject];
        [v11 addObject:v17];

        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v14);
  }

  os_unfair_lock_lock(&self->_lock);
  id v18 = [(NSMutableDictionary *)self->_lastKnownGroupIDToPushTokens objectForKeyedSubscript:v9];
  id v20 = [v18 mutableCopy];
  [v20 intersectsSet:v11];
  +[NSString stringWithFormat:@"newPushTokensForGroup: %@, previousPushTokensForGroup: %@, intersection: %@", v11, v18, v20];
  uint64_t v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472;
  v37 = sub_1003F88F4;
  unint64_t v38 = &unk_10097E4D0;
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v39;
  cut_dispatch_log_queue();

  [(NSMutableDictionary *)self->_lastKnownGroupIDToPushTokens setObject:v11 forKeyedSubscript:v9];
  os_unfair_lock_unlock(&self->_lock);
  if ([v18 isEqualToSet:v11])
  {
    long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v45 = v12;
      __int16 v46 = 2112;
      id v47 = v9;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "didReceiveEndpointsUpdate: %@ forGroup: %@ - nothing changed.(previous %@)", buf, 0x20u);
    }
  }
  else
  {
    endpointUpdateTimer = self->_endpointUpdateTimer;
    if (endpointUpdateTimer)
    {
      [(IMDispatchTimer *)endpointUpdateTimer invalidate];
      long long v24 = self->_endpointUpdateTimer;
      self->_endpointUpdateTimer = 0;

      BOOL v25 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v45 = v12;
        __int16 v46 = 2112;
        id v47 = v9;
        __int16 v48 = 2048;
        uint64_t v49 = 0x4000000000000000;
        __int16 v50 = 2112;
        id v51 = v18;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "didReceiveEndpointsUpdate: %@ forGroup: %@ - invalidated the previous key rolling timer. Wait %f seconds more again to get more endpoint updates... (previous %@)", buf, 0x2Au);
      }
    }
    id v26 = objc_alloc((Class)IMDispatchTimer);
    id v27 = im_primary_queue();
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1003F89C8;
    v30[3] = &unk_100984BD8;
    uint64_t v31 = v12;
    id v32 = v9;
    id v33 = v18;
    uint64_t v34 = self;
    __int16 v28 = (IMDispatchTimer *)[v26 initWithQueue:v27 interval:2 repeats:0 handlerBlock:v30];
    int64_t v29 = self->_endpointUpdateTimer;
    self->_endpointUpdateTimer = v28;

    long long v22 = v31;
  }
}

- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v15 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v13];
  uint64_t v16 = &IDSRegistrationPropertySupportsAVLess_ptr;
  if (a5)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v17 = v11;
    id v18 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v18)
    {
      id v19 = v18;
      id v39 = p_lock;
      id v41 = v13;
      id v37 = v12;
      id v38 = v11;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          long long v23 = objc_msgSend(v17, "objectForKeyedSubscript:", v22, v37, v38);
          id v24 = [v23 BOOLValue];
          BOOL v25 = +[IDSURI URIWithPrefixedURI:v22];
          id v26 = [v15 memberForURI:v25];
          [v26 setIsLightweight:v24];
        }
        id v19 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v19);
      id v12 = v37;
      id v11 = v38;
      p_lock = v39;
      id v13 = v41;
      uint64_t v16 = &IDSRegistrationPropertySupportsAVLess_ptr;
    }
  }
  else
  {
    long long v40 = p_lock;
    id v42 = v13;
    id v17 = +[NSMutableSet set];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v27 = v12;
    id v28 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v48;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v48 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = +[IDSURI URIWithPrefixedURI:*(void *)(*((void *)&v47 + 1) + 8 * (void)j)];
          [v17 addObject:v32];
        }
        id v29 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v29);
    }

    [v15 updateMembersWithURIs:v17 lightweightStatusDict:v11];
    uint64_t v16 = &IDSRegistrationPropertySupportsAVLess_ptr;
    id v33 = +[IDSFoundationLog RealTimeEncryptionController];
    id v13 = v42;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v15 memberURIs];
      *(_DWORD *)buf = 138412546;
      id v53 = v34;
      __int16 v54 = 2112;
      id v55 = v42;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "updateLightweightMemberTypes: membersForGroup: %@ for group: %@", buf, 0x16u);
    }
    p_lock = v40;
  }

  uint64_t v35 = [v16[288] RealTimeEncryptionController];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = [v15 allMembers];
    *(_DWORD *)buf = 138412546;
    id v53 = v36;
    __int16 v54 = 2112;
    id v55 = v13;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "updateLightweightMemberTypes: members: %@ for group: %@", buf, 0x16u);
  }
  [v15 updateDesiredMaterials];
  os_unfair_lock_unlock(p_lock);
}

- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6
{
  id v10 = a3;
  id v11 = (IDSEndpointSubscription *)a4;
  id v35 = a5;
  id v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v13 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:v11];
  id v14 = +[NSSet setWithArray:v10];
  uint64_t v34 = v12;
  [v13 updateMembersWithURIs:v14 lightweightStatusDict:v12];

  uint64_t v15 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100723324(v13, (uint64_t)v11, v15);
  }

  uint64_t v16 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v17 = v10;
  id v18 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        [v16 addObject:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v19);
  }

  uint64_t v22 = +[IDSDAccountController sharedInstance];
  long long v23 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v11];
  id v24 = [v22 accountWithUniqueID:v23];

  BOOL v25 = [(NSMutableDictionary *)self->_fromURIs objectForKeyedSubscript:v11];
  id v26 = [IDSEndpointSubscription alloc];
  id v27 = [v24 service];
  id v28 = [v27 identifier];
  id v29 = [(IDSEndpointSubscription *)v26 initWithServiceIdentifier:v28 localURI:v25 subscribedURIs:v16 queue:self->_realtimeEncryptionQueue];

  [v13 setEndpointSubscription:v29];
  uint64_t v30 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v46 = v29;
    __int16 v47 = 2112;
    long long v48 = v11;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "setMembers: endpointSubscription %p forGroup: %@", buf, 0x16u);
  }

  if (self->_isInternal)
  {
    uint64_t v31 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKey:v11];

    if (!v31)
    {
      [(NSMutableDictionary *)self->_prekeyAckCountForGroup setObject:&off_1009D23D0 forKeyedSubscript:v11];
      id v32 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v46 = v11;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "ACK'd prekey count is reset to 0 forGroup: %@", buf, 0xCu);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (![(IDSGroupEncryptionController2Shim *)self isTestRunning])
  {
    realtimeEncryptionQueue = self->_realtimeEncryptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003F92C8;
    block[3] = &unk_10097E5A8;
    id v37 = v29;
    id v38 = self;
    id v39 = v11;
    id v40 = v35;
    dispatch_async(realtimeEncryptionQueue, block);
  }
}

- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  internal = self->_internal;
  id v16 = a6;
  id v17 = a3;
  id v18 = [(IDSGroupEncryptionController2 *)internal groupForID:v13];
  id v19 = +[NSSet setWithArray:v17];

  [v18 updateMembersWithURIs:v19 lightweightStatusDict:v16];
  uint64_t v20 = +[IDSFoundationLog RealTimeEncryptionController];
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (a7)
  {
    if (v21)
    {
      uint64_t v22 = [v18 allMembers];
      int v23 = 138412546;
      id v24 = v22;
      __int16 v25 = 2112;
      CFStringRef v26 = @"YES";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "didUpdateMembers to %@, didChangeStandardMembers: %@", (uint8_t *)&v23, 0x16u);
    }
    [(IDSGroupEncryptionController2Shim *)self _updateRelevantEncryptedDataBlobForSession:v14];
    [(IDSGroupEncryptionController2Shim *)self updateServerDesiredKeyMaterialsForGroup:v13 sessionID:v14];
  }
  else
  {
    if (v21)
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "didUpdateMembers doesn't do anything because hasChangedStandardMembers=NO.", (uint8_t *)&v23, 2u);
    }
  }
}

- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSGroupEncryptionController2Shim *)self sessionController];
  BOOL v6 = [v5 sessionWithUniqueID:v4];

  if (v6)
  {
    [v6 updateRelevantEncryptedDataBlob];
  }
  else
  {
    id v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1007233D4((uint64_t)v4, v7);
    }
  }
}

- (BOOL)_isValidPushToken:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6
{
  internal = self->_internal;
  id v9 = a3;
  id v10 = [(IDSGroupEncryptionController2 *)internal groupForID:a5];
  [v10 updateParticipants:v9 lightweight:a4 == 1];
}

- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v33 = self;
  id v8 = [(IDSGroupEncryptionController2Shim *)self sessionController];
  id v32 = [v8 groupSessionGroupIDs];

  if (([v6 isRegistered] & 1) == 0)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v9 = v32;
    id v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v15 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1003F9D18;
          block[3] = &unk_10097E440;
          void block[4] = v33;
          void block[5] = v14;
          dispatch_async(v15, block);
        }
        id v11 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v11);
    }
  }
  lastKnownAccountIDToPushTokens = v33->_lastKnownAccountIDToPushTokens;
  id v17 = [v6 uniqueID];
  uint64_t v31 = [(NSMutableDictionary *)lastKnownAccountIDToPushTokens objectForKeyedSubscript:v17];

  id v18 = objc_alloc_init((Class)NSMutableSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v7;
  id v19 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        int v23 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)j), "pushToken", v31);
        id v24 = [v6 service];
        __int16 v25 = [v24 identifier];
        CFStringRef v26 = +[IDSPushToken pushTokenWithData:v23 withServiceLoggingHint:v25];
        [v18 addObject:v26];
      }
      id v20 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v20);
  }

  os_unfair_lock_lock(&v33->_lock);
  id v27 = v33->_lastKnownAccountIDToPushTokens;
  id v28 = [v6 uniqueID];
  [(NSMutableDictionary *)v27 setObject:v18 forKeyedSubscript:v28];

  os_unfair_lock_unlock(&v33->_lock);
  id v29 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v6 uniqueID];
    *(_DWORD *)buf = 138412546;
    id v45 = obj;
    __int16 v46 = 2112;
    __int16 v47 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "didUpdateRegisteredDevices: %@ for account: %@", buf, 0x16u);
  }
  if (([v18 isEqualToSet:v31] & 1) == 0) {
    [(IDSGroupEncryptionController2Shim *)v33 rollNewKeysAfterResettingPrekeysForGroups:v32 withReason:1];
  }
}

- (void)ensureSessionForID:(id)a3 groupID:(id)a4
{
  id v8 = a3;
  id v6 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a4];
  id v7 = [v6 ensureSessionForID:v8];
}

- (void)cleanUpSessionForID:(id)a3 groupID:(id)a4
{
  internal = self->_internal;
  id v6 = a3;
  id v7 = [(IDSGroupEncryptionController2 *)internal groupForID:a4];
  [v7 cleanUpSessionForID:v6];
}

- (id)p2pNegotiatorProvider
{
  return self->_p2pNegotiatorProvider;
}

- (id)keyMaterialCacheToGroup:(id)a3
{
  return 0;
}

- (id)stablekeyMaterialCacheToGroup:(id)a3
{
  return 0;
}

- (id)getParticipantPushTokensForGroup:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  id v4 = [v3 participantPushTokens];
  id v5 = [v4 allObjects];

  return v5;
}

- (id)getParticipantPushTokensForGroup:(id)a3 ofType:(int64_t)a4
{
  id v5 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  id v6 = v5;
  if (a4) {
    [v5 lightweightParticipantPushTokens];
  }
  else {
  id v7 = [v5 standardParticipantPushTokens];
  }
  id v8 = [v7 allObjects];

  return v8;
}

- (id)getParticipantsForGroup:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  id v4 = [v3 participants];
  id v5 = [v4 allObjects];

  return v5;
}

- (id)getMembersForGroup:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  id v4 = [v3 memberURIs];
  id v5 = [v4 allObjects];

  return v5;
}

- (id)getLightweightStatusDictForGroup:(id)a3
{
  id v3 = [(IDSGroupEncryptionController2 *)self->_internal groupForID:a3];
  id v4 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v3, "allMembers", 0);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isLightweight]);
        uint64_t v12 = [v10 uri];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (_TtC17identityservicesd29IDSGroupEncryptionController2)internal
{
  return self->_internal;
}

- (BOOL)isTestRunning
{
  return self->_isTestRunning;
}

- (void)setIsTestRunning:(BOOL)a3
{
  self->_isTestRunning = a3;
}

- (BOOL)fakeMKMWrapping
{
  return self->_fakeMKMWrapping;
}

- (void)setFakeMKMWrapping:(BOOL)a3
{
  self->_fakeMKMWrapping = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_p2pNegotiatorProvider, 0);
  objc_storeStrong((id *)&self->_endpointUpdateTimer, 0);
  objc_storeStrong((id *)&self->_lastKnownAccountIDToPushTokens, 0);
  objc_storeStrong((id *)&self->_lastKnownGroupIDToPushTokens, 0);
  objc_storeStrong((id *)&self->_prekeyAckCountForGroup, 0);
  objc_storeStrong((id *)&self->_fromURIs, 0);
  objc_storeStrong((id *)&self->_accountIDs, 0);
  objc_storeStrong((id *)&self->_realtimeEncryptionQueue, 0);
  objc_storeStrong(&self->_sessionController, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end