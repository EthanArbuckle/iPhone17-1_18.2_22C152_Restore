@interface IDSGroupEncryptionController
+ (IDSGroupEncryptionController)sharedInstance;
- (BOOL)fakeMKMWrapping;
- (BOOL)isTestRunning;
- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9;
- (BOOL)shouldUseGecko;
- (IDSGroupEncryptionController)init;
- (IDSRealTimeEncryptionIdentity)identityForDevice;
- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice;
- (__SecKey)fullIdentityKey;
- (__SecKey)previousFullIdentityKey;
- (id)activeParticipantsForGroup:(id)a3;
- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4;
- (id)getLightweightStatusDictForGroup:(id)a3;
- (id)getMembersForGroup:(id)a3;
- (id)getParticipantsForGroup:(id)a3;
- (id)getParticipantsForGroup:(id)a3 ofType:(int64_t)a4;
- (id)getParticipantsInfoForGroup:(id)a3;
- (id)getParticipantsWaitingForInitialKeyMaterials:(id)a3;
- (id)getParticipantsWaitingForKeyMaterials:(id)a3;
- (id)getParticipantsWaitingForStableKeyMaterials:(id)a3;
- (id)p2pNegotiatorProvider;
- (id)publicKeys;
- (id)realTimeEncryptionPublicKeyData;
- (id)realTimeEncryptionPublicKeyDataForDevice:(id)a3;
- (id)realTimeEncryptionPublicKeyForDevice:(id)a3;
- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12;
- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (int64_t)realTimeEncryptionPublicKeyWrappingMode;
- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5;
- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3;
- (unint64_t)localParticipantIDForGroupID:(id)a3;
- (unint64_t)participantIDForPushToken:(id)a3;
- (void)_sendingKeysToMembers:(id)a3;
- (void)cleanUpSessionForID:(id)a3 groupID:(id)a4;
- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4;
- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8;
- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)ensureSessionForID:(id)a3 groupID:(id)a4;
- (void)noteReceivedGroupMasterKeyMaterials:(id)a3 URIs:(id)a4 sessionID:(id)a5;
- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10;
- (void)processIncomingPrekeyAckForGroup:(id)a3;
- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9;
- (void)receivedGroupStableKeyMaterial:(id)a3 fromPushToken:(id)a4 sessionID:(id)a5 groupID:(id)a6;
- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)removeAccountForGroup:(id)a3;
- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4;
- (void)removeLocalActiveParticipantForGroup:(id)a3;
- (void)reportPrekeyAckStatus:(id)a3;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 shouldGenerateMKM:(BOOL)a5;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)requestPendingKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3;
- (void)resetKeyMaterialLocalSentStatus:(id)a3;
- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4;
- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4;
- (void)resetMKMLocalSentStatus:(id)a3;
- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5;
- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5;
- (void)sendPublicKeyToGroup:(id)a3 sessionID:(id)a4;
- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5;
- (void)setFakeMKMWrapping:(BOOL)a3;
- (void)setIsTestRunning:(BOOL)a3;
- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6;
- (void)setShouldUseGecko:(BOOL)a3;
- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4;
- (void)unsubscribeEndpointsForGroup:(id)a3;
- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7;
- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
@end

@implementation IDSGroupEncryptionController

+ (IDSGroupEncryptionController)sharedInstance
{
  if (qword_100A4C748 != -1) {
    dispatch_once(&qword_100A4C748, &stru_100988CC0);
  }
  v2 = (void *)qword_100A4C750;

  return (IDSGroupEncryptionController *)v2;
}

- (IDSGroupEncryptionController)init
{
  v10.receiver = self;
  v10.super_class = (Class)IDSGroupEncryptionController;
  v2 = [(IDSGroupEncryptionController *)&v10 init];
  if (v2)
  {
    v2->_shouldUseGecko = _os_feature_enabled_impl();
    v3 = +[IDSServerBag sharedInstance];
    v4 = [v3 objectForKey:@"ids-gecko2-sample-rate"];

    if (v4) {
      uint32_t v5 = [v4 intValue];
    }
    else {
      uint32_t v5 = 100;
    }
    if (v2->_shouldUseGecko)
    {
      if (arc4random_uniform(0x64u) >= v5)
      {
        v2->_shouldUseGecko = 0;
      }
      else if (v2->_shouldUseGecko)
      {
        v6 = IDSGroupEncryptionController2Shim;
LABEL_11:
        uint64_t v7 = [(__objc2_class *)v6 sharedInstance];
        id internal = v2->_internal;
        v2->_id internal = (id)v7;

        return v2;
      }
    }
    v6 = IDSGroupEncryptionController1;
    goto LABEL_11;
  }
  return v2;
}

- (IDSRealTimeEncryptionIdentity)identityForDevice
{
  return (IDSRealTimeEncryptionIdentity *)[self->_internal identityForDevice];
}

- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice
{
  return (IDSRealTimeEncryptionIdentity *)[self->_internal previousIdentityForDevice];
}

- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5
{
}

- (void)removeAccountForGroup:(id)a3
{
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 shouldGenerateMKM:(BOOL)a5
{
}

- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
}

- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4
{
  return [self->_internal createRealTimeEncryptionFullIdentityForDevice:a3 completionBlock:a4];
}

- (int64_t)realTimeEncryptionPublicKeyWrappingMode
{
  return (int64_t)[self->_internal realTimeEncryptionPublicKeyWrappingMode];
}

- (id)realTimeEncryptionPublicKeyData
{
  return [self->_internal realTimeEncryptionPublicKeyData];
}

- (void)processIncomingPrekeyAckForGroup:(id)a3
{
}

- (void)reportPrekeyAckStatus:(id)a3
{
}

- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4
{
}

- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4
{
}

- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3
{
}

- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4
{
}

- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3
{
  return (unint64_t)[self->_internal encryptionSequenceNumberForGroupID:a3];
}

- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9
{
  return objc_msgSend(self->_internal, "setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:", a3, a4, a5, a6, a7, a8);
}

- (id)realTimeEncryptionPublicKeyForDevice:(id)a3
{
  return [self->_internal realTimeEncryptionPublicKeyForDevice:a3];
}

- (id)realTimeEncryptionPublicKeyDataForDevice:(id)a3
{
  return _[self->_internal realTimeEncryptionPublicKeyDataForDevice:a3];
}

- (id)publicKeys
{
  return [self->_internal publicKeys];
}

- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5
{
  return (int64_t)[self->_internal setLocalParticipantID:a3 forGroupID:a4 sessionID:a5];
}

- (unint64_t)localParticipantIDForGroupID:(id)a3
{
  return (unint64_t)[self->_internal localParticipantIDForGroupID:a3];
}

- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5
{
}

- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
}

- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10
{
}

- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12
{
  return objc_msgSend(self->_internal, "receivedAndSetKeyMaterial:stableKeyMaterial:forDevice:fromURI:groupID:sessionID:fromSender:error:forMKM:forSKM:", a3, a4, a5, a6, a7, a8);
}

- (void)requestPendingKeyMaterialsForGroup:(id)a3 sessionID:(id)a4
{
}

- (void)noteReceivedGroupMasterKeyMaterials:(id)a3 URIs:(id)a4 sessionID:(id)a5
{
}

- (void)receivedGroupStableKeyMaterial:(id)a3 fromPushToken:(id)a4 sessionID:(id)a5 groupID:(id)a6
{
}

- (void)resetMKMLocalSentStatus:(id)a3
{
}

- (void)resetKeyMaterialLocalSentStatus:(id)a3
{
}

- (id)activeParticipantsForGroup:(id)a3
{
  return _[self->_internal activeParticipantsForGroup:a3];
}

- (void)removeLocalActiveParticipantForGroup:(id)a3
{
}

- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4
{
}

- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4
{
}

- (void)unsubscribeEndpointsForGroup:(id)a3
{
}

- (__SecKey)fullIdentityKey
{
  return (__SecKey *)_[self->_internal fullIdentityKey];
}

- (__SecKey)previousFullIdentityKey
{
  return (__SecKey *)_[self->_internal previousFullIdentityKey];
}

- (unint64_t)participantIDForPushToken:(id)a3
{
  return (unint64_t)_[self->_internal participantIDForPushToken:a3];
}

- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  return [self->_internal stableKeyMaterialForGroup:a3 sessionID:a4];
}

- (void)ensureSessionForID:(id)a3 groupID:(id)a4
{
}

- (void)cleanUpSessionForID:(id)a3 groupID:(id)a4
{
}

- (id)p2pNegotiatorProvider
{
  return [self->_internal p2pNegotiatorProvider];
}

- (void)sendPublicKeyToGroup:(id)a3 sessionID:(id)a4
{
}

- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5
{
}

- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9
{
}

- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4
{
}

- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7
{
}

- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6
{
}

- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8
{
}

- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6
{
}

- (id)getParticipantsWaitingForKeyMaterials:(id)a3
{
  return _[self->_internal getParticipantsWaitingForKeyMaterials:a3];
}

- (id)getParticipantsWaitingForStableKeyMaterials:(id)a3
{
  return _[self->_internal getParticipantsWaitingForStableKeyMaterials:a3];
}

- (id)getParticipantsWaitingForInitialKeyMaterials:(id)a3
{
  return _[self->_internal getParticipantsWaitingForInitialKeyMaterials:a3];
}

- (id)getParticipantsForGroup:(id)a3
{
  return _[self->_internal getParticipantsForGroup:a3];
}

- (id)getParticipantsForGroup:(id)a3 ofType:(int64_t)a4
{
  return _[self->_internal getParticipantsForGroup:a3 ofType:a4];
}

- (id)getParticipantsInfoForGroup:(id)a3
{
  return [self->_internal getParticipantsInfoForGroup:a3];
}

- (id)getMembersForGroup:(id)a3
{
  return _[self->_internal getMembersForGroup:a3];
}

- (id)getLightweightStatusDictForGroup:(id)a3
{
  return _[self->_internal getLightweightStatusDictForGroup:a3];
}

- (void)_sendingKeysToMembers:(id)a3
{
}

- (BOOL)shouldUseGecko
{
  return self->_shouldUseGecko;
}

- (void)setShouldUseGecko:(BOOL)a3
{
  self->_shouldUseGecko = a3;
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
}

@end