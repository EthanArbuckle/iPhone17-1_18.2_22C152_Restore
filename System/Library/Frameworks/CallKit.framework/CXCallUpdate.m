@interface CXCallUpdate
+ (BOOL)supportsSecureCoding;
+ (CXCallUpdate)callUpdateWithDefaultValuesSet;
- (BOOL)accessoryButtonEventsEnabled;
- (BOOL)blocked;
- (BOOL)conversation;
- (BOOL)emergency;
- (BOOL)failureExpected;
- (BOOL)hasBeenRedirected;
- (BOOL)hasVideo;
- (BOOL)ignoresBluetoothDeviceUID;
- (BOOL)isBlocked;
- (BOOL)isConversation;
- (BOOL)isEmergency;
- (BOOL)isFailureExpected;
- (BOOL)isKnownCaller;
- (BOOL)isMutuallyExclusiveCall;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isReRing;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSendingVideo;
- (BOOL)isSharingScreen;
- (BOOL)isUnderlyingLinksConnected;
- (BOOL)isUsingBaseband;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)mediaPlaybackOnExternalDevice;
- (BOOL)mixesVoiceWithMedia;
- (BOOL)mutuallyExclusiveCall;
- (BOOL)oneToOneModeEnabled;
- (BOOL)prefersExclusiveAccessToCellularNetwork;
- (BOOL)prefersToPlayDuringWombat;
- (BOOL)remoteUplinkMuted;
- (BOOL)requiresAuthentication;
- (BOOL)requiresInCallSounds;
- (BOOL)sendingVideo;
- (BOOL)sharingScreen;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)supportsAddCall;
- (BOOL)supportsDTMF;
- (BOOL)supportsDTMFUpdates;
- (BOOL)supportsEmergencyFallback;
- (BOOL)supportsGrouping;
- (BOOL)supportsHolding;
- (BOOL)supportsRecording;
- (BOOL)supportsScreening;
- (BOOL)supportsSendingToVoicemail;
- (BOOL)supportsTTYWithVoice;
- (BOOL)supportsUnambiguousMultiPartyState;
- (BOOL)supportsUngrouping;
- (BOOL)suppressRingtone;
- (BOOL)usingBaseband;
- (CXAccount)account;
- (CXCallTokens)callTokens;
- (CXCallUpdate)init;
- (CXCallUpdate)initWithCoder:(id)a3;
- (CXCallUpdate)updateWithUpdate:(id)a3;
- (CXCallUpdateHasSet)hasSet;
- (CXHandle)initiator;
- (CXHandle)remoteHandle;
- (CXHandoffContext)handoffContext;
- (CXParticipant)activeRemoteParticipant;
- (CXSandboxExtendedURL)localizedCallerImageURL;
- (CXScreenShareAttributes)screenShareAttributes;
- (NSDictionary)context;
- (NSMutableDictionary)silencingUserInfo;
- (NSSet)activeRemoteParticipantHandles;
- (NSSet)otherInvitedHandles;
- (NSSet)remoteParticipantHandles;
- (NSString)ISOCountryCode;
- (NSString)announceProviderIdentifier;
- (NSString)audioCategory;
- (NSString)audioMode;
- (NSString)crossDeviceIdentifier;
- (NSString)description;
- (NSString)localMemberHandleValue;
- (NSString)localSenderSubscriptionIdentifier;
- (NSString)localizedCallerName;
- (NSUUID)UUID;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (NSUUID)participantGroupUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (int)filteredOutReason;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProvider;
- (int64_t)bluetoothAudioFormat;
- (int64_t)callSubType;
- (int64_t)identificationCategory;
- (int64_t)inCallSoundRegion;
- (int64_t)junkConfidence;
- (int64_t)priority;
- (int64_t)screenSharingIntention;
- (int64_t)screenSharingType;
- (int64_t)serviceStatus;
- (int64_t)transmissionMode;
- (int64_t)ttyType;
- (int64_t)verificationStatus;
- (int64_t)videoStreamToken;
- (os_unfair_lock_s)accessorLock;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryButtonEventsEnabled:(BOOL)a3;
- (void)setAccount:(id)a3;
- (void)setActiveRemoteParticipant:(id)a3;
- (void)setActiveRemoteParticipantHandles:(id)a3;
- (void)setAnnounceProviderIdentifier:(id)a3;
- (void)setAudioCategory:(id)a3;
- (void)setAudioInterruptionOperationMode:(int64_t)a3;
- (void)setAudioInterruptionProvider:(int64_t)a3;
- (void)setAudioMode:(id)a3;
- (void)setBlocked:(BOOL)a3;
- (void)setBluetoothAudioFormat:(int64_t)a3;
- (void)setCallSubType:(int64_t)a3;
- (void)setCallTokens:(id)a3;
- (void)setContext:(id)a3;
- (void)setConversation:(BOOL)a3;
- (void)setCrossDeviceIdentifier:(id)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setFilteredOutReason:(int)a3;
- (void)setHandoffContext:(id)a3;
- (void)setHasBeenRedirected:(BOOL)a3;
- (void)setHasSet:(CXCallUpdateHasSet)a3;
- (void)setHasVideo:(BOOL)hasVideo;
- (void)setISOCountryCode:(id)a3;
- (void)setIdentificationCategory:(int64_t)a3;
- (void)setIgnoresBluetoothDeviceUID:(BOOL)a3;
- (void)setInCallSoundRegion:(int64_t)a3;
- (void)setInitiator:(id)a3;
- (void)setIsKnownCaller:(BOOL)a3;
- (void)setIsReRing:(BOOL)a3;
- (void)setIsUnderlyingLinksConnected:(BOOL)a3;
- (void)setJunkConfidence:(int64_t)a3;
- (void)setLocalMemberHandleValue:(id)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocalSenderSubscriptionIdentifier:(id)a3;
- (void)setLocalizedCallerImageURL:(id)a3;
- (void)setLocalizedCallerName:(NSString *)localizedCallerName;
- (void)setMayRequireBreakBeforeMake:(BOOL)a3;
- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3;
- (void)setMixesVoiceWithMedia:(BOOL)a3;
- (void)setMutuallyExclusiveCall:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setParticipantGroupUUID:(id)a3;
- (void)setPrefersExclusiveAccessToCellularNetwork:(BOOL)a3;
- (void)setPrefersToPlayDuringWombat:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRemoteHandle:(CXHandle *)remoteHandle;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setRequiresInCallSounds:(BOOL)a3;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreenSharingIntention:(int64_t)a3;
- (void)setScreenSharingType:(int64_t)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setServiceStatus:(int64_t)a3;
- (void)setSharingScreen:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setSilencingUserInfo:(id)a3;
- (void)setSupportsAddCall:(BOOL)a3;
- (void)setSupportsDTMF:(BOOL)supportsDTMF;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsGrouping:(BOOL)supportsGrouping;
- (void)setSupportsHolding:(BOOL)supportsHolding;
- (void)setSupportsRecording:(BOOL)a3;
- (void)setSupportsScreening:(BOOL)a3;
- (void)setSupportsSendingToVoicemail:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3;
- (void)setSupportsUngrouping:(BOOL)supportsUngrouping;
- (void)setSuppressRingtone:(BOOL)a3;
- (void)setTTYType:(int64_t)a3;
- (void)setTransmissionMode:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUsingBaseband:(BOOL)a3;
- (void)setVerificationStatus:(int64_t)a3;
- (void)setVideoStreamToken:(int64_t)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXCallUpdate

- (CXCallUpdate)init
{
  v7.receiver = self;
  v7.super_class = (Class)CXCallUpdate;
  v2 = [(CXCallUpdate *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    UUID = v3->_UUID;
    v3->_UUID = (NSUUID *)v4;

    *((_WORD *)&v3->_hasSet + 4) = 0;
    *(void *)&v3->_hasSet = 0;
  }
  return v3;
}

+ (CXCallUpdate)callUpdateWithDefaultValuesSet
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setSupportsHolding:1];
  [v2 setSupportsGrouping:1];
  [v2 setSupportsUngrouping:1];
  [v2 setSupportsDTMF:1];
  [v2 setSupportsUnambiguousMultiPartyState:1];
  [v2 setSupportsAddCall:1];
  [v2 setSupportsRecording:1];
  [v2 setIsUnderlyingLinksConnected:1];
  [v2 setSupportsScreening:1];

  return (CXCallUpdate *)v2;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  uint64_t v4 = [(CXCallUpdate *)self UUID];
  v5 = [v4 UUIDString];
  [v3 appendFormat:@" UUID=%@", v5];

  if ([(CXCallUpdate *)self hasSet])
  {
    v6 = [(CXCallUpdate *)self account];
    [v3 appendFormat:@" account=%@", v6];
  }
  if (([(CXCallUpdate *)self hasSet] & 2) != 0)
  {
    objc_super v7 = [(CXCallUpdate *)self activeRemoteParticipant];
    [v3 appendFormat:@" activeRemoteParticipant=%@", v7];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200) != 0) {
    objc_msgSend(v3, "appendFormat:", @" blocked=%d", -[CXCallUpdate isBlocked](self, "isBlocked"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20) != 0) {
    objc_msgSend(v3, "appendFormat:", @" emergency=%d", -[CXCallUpdate isEmergency](self, "isEmergency"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40) != 0) {
    objc_msgSend(v3, "appendFormat:", @" failureExpected=%d", -[CXCallUpdate isFailureExpected](self, "isFailureExpected"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsEmergencyFallback=%d", -[CXCallUpdate supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100) != 0) {
    objc_msgSend(v3, "appendFormat:", @" usingBaseband=%d", -[CXCallUpdate isUsingBaseband](self, "isUsingBaseband"));
  }
  if (([(CXCallUpdate *)self hasSet] & 4) != 0)
  {
    v8 = [(CXCallUpdate *)self remoteHandle];
    [v3 appendFormat:@" remoteHandle=%@", v8];
  }
  if (([(CXCallUpdate *)self hasSet] & 8) != 0)
  {
    v9 = [(CXCallUpdate *)self localizedCallerName];
    [v3 appendFormat:@" localizedCallerName=%@", v9];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10) != 0)
  {
    v10 = [(CXCallUpdate *)self localizedCallerImageURL];
    [v3 appendFormat:@" localizedCallerImageURL=%@", v10];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400) != 0) {
    objc_msgSend(v3, "appendFormat:", @" ttyType=%ld", -[CXCallUpdate ttyType](self, "ttyType"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" mayRequireBreakBeforeMake=%d", -[CXCallUpdate mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" hasVideo=%d", -[CXCallUpdate hasVideo](self, "hasVideo"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000) != 0)
  {
    v11 = [(CXCallUpdate *)self audioCategory];
    [v3 appendFormat:@" audioCategory=%@", v11];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000) != 0)
  {
    v12 = [(CXCallUpdate *)self audioMode];
    [v3 appendFormat:@" audioMode=%@", v12];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" audioInterruptionProvider=%ld", -[CXCallUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" audioInterruptionOperationMode=%ld", -[CXCallUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" verificationStatus=%ld", -[CXCallUpdate verificationStatus](self, "verificationStatus"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" priority=%ld", -[CXCallUpdate priority](self, "priority"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" requiresInCallSounds=%d", -[CXCallUpdate requiresInCallSounds](self, "requiresInCallSounds"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" inCallSoundRegion=%ld", -[CXCallUpdate inCallSoundRegion](self, "inCallSoundRegion"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsHolding=%d", -[CXCallUpdate supportsHolding](self, "supportsHolding"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsGrouping=%d", -[CXCallUpdate supportsGrouping](self, "supportsGrouping"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsUngrouping=%d", -[CXCallUpdate supportsUngrouping](self, "supportsUngrouping"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsDTMF=%d", -[CXCallUpdate supportsDTMF](self, "supportsDTMF"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsDTMFUpdates=%d", -[CXCallUpdate supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsUnambiguousMultiPartyState=%d", -[CXCallUpdate supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsAddCall=%d", -[CXCallUpdate supportsAddCall](self, "supportsAddCall"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsSendingToVoicemail=%d", -[CXCallUpdate supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsRecording=%d", -[CXCallUpdate supportsRecording](self, "supportsRecording"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" isUnderlyingLinksConnected=%d", -[CXCallUpdate isUnderlyingLinksConnected](self, "isUnderlyingLinksConnected"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v13 & 0x800) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsScreening=%d", -[CXCallUpdate supportsScreening](self, "supportsScreening"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" videoStreamToken=%ld", -[CXCallUpdate videoStreamToken](self, "videoStreamToken"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000) != 0)
  {
    v14 = [(CXCallUpdate *)self callTokens];
    [v3 appendFormat:@" callTokens=%@", v14];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000) != 0)
  {
    v15 = [(CXCallUpdate *)self announceProviderIdentifier];
    [v3 appendFormat:@" aPI=%@", v15];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000) != 0)
  {
    v16 = [(CXCallUpdate *)self initiator];
    [v3 appendFormat:@" initiatorValue=%@", v16];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000) != 0)
  {
    v17 = [(CXCallUpdate *)self crossDeviceIdentifier];
    [v3 appendFormat:@" crossDeviceIdentifier=%@", v17];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000) != 0)
  {
    v18 = [(CXCallUpdate *)self ISOCountryCode];
    [v3 appendFormat:@" ISOCountryCode=%@", v18];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000) != 0)
  {
    v19 = [(CXCallUpdate *)self localSenderIdentityUUID];
    [v3 appendFormat:@" localSenderIdentityUUID=%@", v19];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000000) != 0)
  {
    v20 = [(CXCallUpdate *)self localSenderIdentityAccountUUID];
    [v3 appendFormat:@" localSenderIdentityAccountUUID=%@", v20];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000000) != 0)
  {
    v21 = [(CXCallUpdate *)self localMemberHandleValue];
    [v3 appendFormat:@" localMemberHandleValue=%@", v21];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000000) != 0)
  {
    v22 = [(CXCallUpdate *)self localSenderSubscriptionIdentifier];
    [v3 appendFormat:@" localSenderSubscriptionIdentifier=%@", v22];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000000) != 0)
  {
    v23 = [(CXCallUpdate *)self participantGroupUUID];
    [v3 appendFormat:@" participantGroupUUID=%@", v23];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000000) != 0)
  {
    v24 = [(CXCallUpdate *)self remoteParticipantHandles];
    [v3 appendFormat:@" remoteParticipantHandles=%@", v24];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000000) != 0)
  {
    v25 = [(CXCallUpdate *)self otherInvitedHandles];
    [v3 appendFormat:@" otherInvitedHandles=%@", v25];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000000) != 0)
  {
    v26 = [(CXCallUpdate *)self activeRemoteParticipantHandles];
    [v3 appendFormat:@" activeRemoteParticipantHandles=%@", v26];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000000) != 0)
  {
    v27 = [(CXCallUpdate *)self handoffContext];
    [v3 appendFormat:@" handoffContext=%@", v27];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000000) != 0)
  {
    v28 = [(CXCallUpdate *)self screenShareAttributes];
    [v3 appendFormat:@" screenShareAttributes=%@", v28];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000000) != 0)
  {
    v29 = [(CXCallUpdate *)self context];
    [v3 appendFormat:@" context=%@", v29];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" prefersExclusiveAccessToCellularNetwork=%d", -[CXCallUpdate prefersExclusiveAccessToCellularNetwork](self, "prefersExclusiveAccessToCellularNetwork"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800) != 0) {
    objc_msgSend(v3, "appendFormat:", @" supportsTTYWithVoice=%d", -[CXCallUpdate supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" remoteUplinkMuted=%d", -[CXCallUpdate isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" shouldSuppressInCallUI=%d", -[CXCallUpdate shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" requiresAuthentication=%d", -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" mutuallyExclusiveCall=%d", -[CXCallUpdate isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" junkConfidence=%ld", -[CXCallUpdate junkConfidence](self, "junkConfidence"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" identifcationCategory=%ld", -[CXCallUpdate identificationCategory](self, "identificationCategory"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" conversation=%d", -[CXCallUpdate isConversation](self, "isConversation"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" mixesVoiceWithMedia=%d", -[CXCallUpdate mixesVoiceWithMedia](self, "mixesVoiceWithMedia"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" prefersToPlayDuringWombat=%d", -[CXCallUpdate prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" mediaPlaybackOnExternalDevice=%d", -[CXCallUpdate mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice"));
  }
  if ([(CXCallUpdate *)self hasSet] < 0) {
    objc_msgSend(v3, "appendFormat:", @" ignoresBluetoothDeviceUID=%d", -[CXCallUpdate ignoresBluetoothDeviceUID](self, "ignoresBluetoothDeviceUID"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" oneToOneModeEnabled=%d", -[CXCallUpdate isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" sharingScreen=%d", -[CXCallUpdate isSharingScreen](self, "isSharingScreen"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000000000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" bluetoothAudioFormat=%ld", -[CXCallUpdate bluetoothAudioFormat](self, "bluetoothAudioFormat"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v30 & 0x1000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" screenSharingIntention=%ld", -[CXCallUpdate screenSharingIntention](self, "screenSharingIntention"));
  }
  [(CXCallUpdate *)self hasSet];
  if (v31) {
    objc_msgSend(v3, "appendFormat:", @" serviceStatus=%ld", -[CXCallUpdate serviceStatus](self, "serviceStatus"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v32 & 2) != 0) {
    objc_msgSend(v3, "appendFormat:", @" transmissionMode=%ld", -[CXCallUpdate transmissionMode](self, "transmissionMode"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v33 & 4) != 0) {
    objc_msgSend(v3, "appendFormat:", @" accessoryButtonEventsEnabled=%d", -[CXCallUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v34 & 8) != 0) {
    objc_msgSend(v3, "appendFormat:", @" sendingVideo=%d", -[CXCallUpdate isSendingVideo](self, "isSendingVideo"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v35 & 0x10) != 0) {
    objc_msgSend(v3, "appendFormat:", @" hasBeenRedirected=%d", -[CXCallUpdate hasBeenRedirected](self, "hasBeenRedirected"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v36 & 0x20) != 0) {
    objc_msgSend(v3, "appendFormat:", @" isKnownCaller=%d", -[CXCallUpdate isKnownCaller](self, "isKnownCaller"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v37 & 0x40) != 0) {
    objc_msgSend(v3, "appendFormat:", @" filteredOutReason=%d", -[CXCallUpdate filteredOutReason](self, "filteredOutReason"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v38 & 0x100) != 0) {
    objc_msgSend(v3, "appendFormat:", @" isReRing=%d", -[CXCallUpdate isReRing](self, "isReRing"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v39 & 0x200) != 0) {
    objc_msgSend(v3, "appendFormat:", @" suppressRingtone=%d", -[CXCallUpdate suppressRingtone](self, "suppressRingtone"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v40 & 0x400) != 0) {
    objc_msgSend(v3, "appendFormat:", @" callSubType=%ld", -[CXCallUpdate callSubType](self, "callSubType"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v41 & 0x2000) != 0) {
    objc_msgSend(v3, "appendFormat:", @" screenSharingType=%ld", -[CXCallUpdate screenSharingType](self, "screenSharingType"));
  }
  [v3 appendString:@">"];
  id v42 = v3;

  return (NSString *)v42;
}

- (CXSandboxExtendedURL)localizedCallerImageURL
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_localizedCallerImageURL;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setLocalizedCallerImageURL:(id)a3
{
  v10 = (CXSandboxExtendedURL *)a3;
  if (v10)
  {
    v5 = [(CXSandboxExtendedURL *)v10 URL];
    char v6 = [v5 isFileURL];

    if ((v6 & 1) == 0)
    {
      objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3C8];
      v9 = NSStringFromSelector(sel_localizedCallerImageURL);
      [v7 raise:v8, @"%s: parameter '%@' must be a file URL", "-[CXCallUpdate setLocalizedCallerImageURL:]", v9 format];
    }
  }
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_localizedCallerImageURL != v10)
  {
    *(void *)&self->_hasSet |= 0x10uLL;
    objc_storeStrong((id *)&self->_localizedCallerImageURL, a3);
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (NSMutableDictionary)silencingUserInfo
{
  silencingUserInfo = self->_silencingUserInfo;
  if (!silencingUserInfo)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = self->_silencingUserInfo;
    self->_silencingUserInfo = v4;

    silencingUserInfo = self->_silencingUserInfo;
  }

  return silencingUserInfo;
}

- (CXAccount)account
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_account;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setAccount:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 1uLL;
  char v6 = (CXAccount *)[v5 copy];

  account = self->_account;
  self->_account = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (CXParticipant)activeRemoteParticipant
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_activeRemoteParticipant;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setActiveRemoteParticipant:(id)a3
{
  uint64_t v4 = (CXParticipant *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 2uLL;
  activeRemoteParticipant = self->_activeRemoteParticipant;
  self->_activeRemoteParticipant = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (CXHandle)remoteHandle
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_remoteHandle;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setRemoteHandle:(CXHandle *)remoteHandle
{
  uint64_t v4 = remoteHandle;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 4uLL;
  id v5 = self->_remoteHandle;
  self->_remoteHandle = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (NSString)localizedCallerName
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_localizedCallerName;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setLocalizedCallerName:(NSString *)localizedCallerName
{
  p_accessorLock = &self->_accessorLock;
  id v5 = localizedCallerName;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 8uLL;
  char v6 = (NSString *)[(NSString *)v5 copy];

  objc_super v7 = self->_localizedCallerName;
  self->_localizedCallerName = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)emergency
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_emergency;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setEmergency:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x20uLL;
  self->_emergency = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)failureExpected
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_failureExpected;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setFailureExpected:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x40uLL;
  self->_failureExpected = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsEmergencyFallback
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsEmergencyFallback;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x80uLL;
  self->_supportsEmergencyFallback = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)usingBaseband
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_usingBaseband;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setUsingBaseband:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x100uLL;
  self->_usingBaseband = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)blocked
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_blocked;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setBlocked:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x200uLL;
  self->_blocked = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)ttyType
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t ttyType = self->_ttyType;
  os_unfair_lock_unlock(p_accessorLock);
  return ttyType;
}

- (void)setTTYType:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x400uLL;
  self->_int64_t ttyType = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)bluetoothAudioFormat
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t bluetoothAudioFormat = self->_bluetoothAudioFormat;
  os_unfair_lock_unlock(p_accessorLock);
  return bluetoothAudioFormat;
}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x4000000000000000uLL;
  self->_int64_t bluetoothAudioFormat = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mayRequireBreakBeforeMake
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mayRequireBreakBeforeMake;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMayRequireBreakBeforeMake:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x1000uLL;
  self->_mayRequireBreakBeforeMake = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)hasVideo
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_hasVideo;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setHasVideo:(BOOL)hasVideo
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x2000uLL;
  self->_hasVideo = hasVideo;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)audioCategory
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_audioCategory;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setAudioCategory:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x4000uLL;
  char v6 = (NSString *)[v5 copy];

  audioCategory = self->_audioCategory;
  self->_audioCategory = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)audioMode
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_audioMode;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setAudioMode:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x8000uLL;
  char v6 = (NSString *)[v5 copy];

  audioMode = self->_audioMode;
  self->_audioMode = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)audioInterruptionProvider
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t audioInterruptionProvider = self->_audioInterruptionProvider;
  os_unfair_lock_unlock(p_accessorLock);
  return audioInterruptionProvider;
}

- (void)setAudioInterruptionProvider:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x10000uLL;
  self->_int64_t audioInterruptionProvider = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)audioInterruptionOperationMode
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t audioInterruptionOperationMode = self->_audioInterruptionOperationMode;
  os_unfair_lock_unlock(p_accessorLock);
  return audioInterruptionOperationMode;
}

- (void)setAudioInterruptionOperationMode:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x20000uLL;
  self->_int64_t audioInterruptionOperationMode = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)verificationStatus
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t verificationStatus = self->_verificationStatus;
  os_unfair_lock_unlock(p_accessorLock);
  return verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x40000uLL;
  self->_int64_t verificationStatus = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)priority
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t priority = self->_priority;
  os_unfair_lock_unlock(p_accessorLock);
  return priority;
}

- (void)setPriority:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x80000uLL;
  self->_int64_t priority = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)requiresInCallSounds
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_requiresInCallSounds;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setRequiresInCallSounds:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x100000uLL;
  self->_requiresInCallSounds = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)inCallSoundRegion
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t inCallSoundRegion = self->_inCallSoundRegion;
  os_unfair_lock_unlock(p_accessorLock);
  return inCallSoundRegion;
}

- (void)setInCallSoundRegion:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x200000uLL;
  self->_int64_t inCallSoundRegion = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsHolding
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsHolding;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsHolding:(BOOL)supportsHolding
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x400000uLL;
  self->_supportsHolding = supportsHolding;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsGrouping
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsGrouping;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsGrouping:(BOOL)supportsGrouping
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x800000uLL;
  self->_supportsGrouping = supportsGrouping;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsUngrouping
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsUngrouping;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsUngrouping:(BOOL)supportsUngrouping
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x1000000uLL;
  self->_supportsUngrouping = supportsUngrouping;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsDTMF
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsDTMF;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsDTMF:(BOOL)supportsDTMF
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x2000000uLL;
  self->_supportsDTMF = supportsDTMF;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsDTMFUpdates
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsDTMFUpdates;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x4000000uLL;
  self->_supportsDTMFUpdates = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsUnambiguousMultiPartyState
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsUnambiguousMultiPartyState;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x8000000uLL;
  self->_supportsUnambiguousMultiPartyState = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsAddCall
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsAddCall;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsAddCall:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x10000000uLL;
  self->_supportsAddCall = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsSendingToVoicemail
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsSendingToVoicemail;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsSendingToVoicemail:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x20000000uLL;
  self->_supportsSendingToVoicemail = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsRecording
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsRecording;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsRecording:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x40000000uLL;
  self->_supportsRecording = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)isUnderlyingLinksConnected
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_isUnderlyingLinksConnected;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setIsUnderlyingLinksConnected:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x80000000uLL;
  self->_isUnderlyingLinksConnected = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsScreening
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsScreening;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsScreening:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x800u;
  self->_supportsScreening = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)videoStreamToken
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t videoStreamToken = self->_videoStreamToken;
  os_unfair_lock_unlock(p_accessorLock);
  return videoStreamToken;
}

- (void)setVideoStreamToken:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x100000000uLL;
  self->_int64_t videoStreamToken = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (CXCallTokens)callTokens
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_callTokens;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setCallTokens:(id)a3
{
  uint64_t v4 = (CXCallTokens *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x200000000uLL;
  callTokens = self->_callTokens;
  self->_callTokens = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (NSString)announceProviderIdentifier
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_announceProviderIdentifier;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setAnnounceProviderIdentifier:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x400000000uLL;
  char v6 = (NSString *)[v5 copy];

  announceProviderIdentifier = self->_announceProviderIdentifier;
  self->_announceProviderIdentifier = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (CXHandle)initiator
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_initiator;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setInitiator:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x800000000uLL;
  char v6 = (CXHandle *)[v5 copy];

  initiator = self->_initiator;
  self->_initiator = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)crossDeviceIdentifier
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_crossDeviceIdentifier;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setCrossDeviceIdentifier:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x1000000000uLL;
  char v6 = (NSString *)[v5 copy];

  crossDeviceIdentifier = self->_crossDeviceIdentifier;
  self->_crossDeviceIdentifier = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)ISOCountryCode
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_ISOCountryCode;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setISOCountryCode:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x2000000000uLL;
  char v6 = (NSString *)[v5 copy];

  ISOCountryCode = self->_ISOCountryCode;
  self->_ISOCountryCode = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSUUID)localSenderIdentityUUID
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_localSenderIdentityUUID;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x4000000000uLL;
  char v6 = (NSUUID *)[v5 copy];

  localSenderIdentityUUID = self->_localSenderIdentityUUID;
  self->_localSenderIdentityUUID = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSUUID)localSenderIdentityAccountUUID
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_localSenderIdentityAccountUUID;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x8000000000uLL;
  char v6 = (NSUUID *)[v5 copy];

  localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
  self->_localSenderIdentityAccountUUID = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)localMemberHandleValue
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_localMemberHandleValue;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setLocalMemberHandleValue:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x10000000000uLL;
  char v6 = (NSString *)[v5 copy];

  localMemberHandleValue = self->_localMemberHandleValue;
  self->_localMemberHandleValue = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)localSenderSubscriptionIdentifier
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_localSenderSubscriptionIdentifier;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setLocalSenderSubscriptionIdentifier:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x20000000000uLL;
  char v6 = (NSString *)[v5 copy];

  localSenderSubscriptionIdentifier = self->_localSenderSubscriptionIdentifier;
  self->_localSenderSubscriptionIdentifier = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSUUID)participantGroupUUID
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_participantGroupUUID;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setParticipantGroupUUID:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x40000000000uLL;
  char v6 = (NSUUID *)[v5 copy];

  participantGroupUUID = self->_participantGroupUUID;
  self->_participantGroupUUID = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSSet)remoteParticipantHandles
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_remoteParticipantHandles;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setRemoteParticipantHandles:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x80000000000uLL;
  char v6 = (NSSet *)[v5 copy];

  remoteParticipantHandles = self->_remoteParticipantHandles;
  self->_remoteParticipantHandles = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSSet)otherInvitedHandles
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_otherInvitedHandles;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setOtherInvitedHandles:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x100000000000uLL;
  char v6 = (NSSet *)[v5 copy];

  otherInvitedHandles = self->_otherInvitedHandles;
  self->_otherInvitedHandles = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSSet)activeRemoteParticipantHandles
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_activeRemoteParticipantHandles;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setActiveRemoteParticipantHandles:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x200000000000uLL;
  char v6 = (NSSet *)[v5 copy];

  activeRemoteParticipantHandles = self->_activeRemoteParticipantHandles;
  self->_activeRemoteParticipantHandles = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (CXHandoffContext)handoffContext
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_handoffContext;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setHandoffContext:(id)a3
{
  uint64_t v4 = (CXHandoffContext *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x400000000000uLL;
  handoffContext = self->_handoffContext;
  self->_handoffContext = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (CXScreenShareAttributes)screenShareAttributes
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_screenShareAttributes;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setScreenShareAttributes:(id)a3
{
  uint64_t v4 = (CXScreenShareAttributes *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x800000000000uLL;
  screenShareAttributes = self->_screenShareAttributes;
  self->_screenShareAttributes = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (int64_t)screenSharingIntention
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t screenSharingIntention = self->_screenSharingIntention;
  os_unfair_lock_unlock(p_accessorLock);
  return screenSharingIntention;
}

- (void)setScreenSharingIntention:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x1000u;
  self->_int64_t screenSharingIntention = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSDictionary)context
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_context;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setContext:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(void *)&self->_hasSet |= 0x1000000000000uLL;
  char v6 = (NSDictionary *)[v5 copy];

  context = self->_context;
  self->_context = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_prefersExclusiveAccessToCellularNetwork;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setPrefersExclusiveAccessToCellularNetwork:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x2000000000000uLL;
  self->_prefersExclusiveAccessToCellularNetwork = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsTTYWithVoice
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsTTYWithVoice;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x800uLL;
  self->_supportsTTYWithVoice = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)remoteUplinkMuted
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_remoteUplinkMuted;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x4000000000000uLL;
  self->_remoteUplinkMuted = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)shouldSuppressInCallUI
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_shouldSuppressInCallUI;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x8000000000000uLL;
  self->_shouldSuppressInCallUI = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)requiresAuthentication
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_requiresAuthentication;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x10000000000000uLL;
  self->_requiresAuthentication = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mutuallyExclusiveCall
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mutuallyExclusiveCall;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMutuallyExclusiveCall:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x20000000000000uLL;
  self->_mutuallyExclusiveCall = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)junkConfidence
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t junkConfidence = self->_junkConfidence;
  os_unfair_lock_unlock(p_accessorLock);
  return junkConfidence;
}

- (void)setJunkConfidence:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x40000000000000uLL;
  self->_int64_t junkConfidence = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)callSubType
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t callSubType = self->_callSubType;
  os_unfair_lock_unlock(p_accessorLock);
  return callSubType;
}

- (void)setCallSubType:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x400u;
  self->_int64_t callSubType = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)identificationCategory
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t identificationCategory = self->_identificationCategory;
  os_unfair_lock_unlock(p_accessorLock);
  return identificationCategory;
}

- (void)setIdentificationCategory:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x80000000000000uLL;
  self->_int64_t identificationCategory = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)conversation
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_conversation;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setConversation:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x100000000000000uLL;
  self->_conversation = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mixesVoiceWithMedia
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mixesVoiceWithMedia;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x200000000000000uLL;
  self->_mixesVoiceWithMedia = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)prefersToPlayDuringWombat
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_prefersToPlayDuringWombat;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x400000000000000uLL;
  self->_prefersToPlayDuringWombat = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mediaPlaybackOnExternalDevice;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x800000000000000uLL;
  self->_mediaPlaybackOnExternalDevice = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)oneToOneModeEnabled
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_oneToOneModeEnabled;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x1000000000000000uLL;
  self->_oneToOneModeEnabled = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)sharingScreen
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_sharingScreen;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSharingScreen:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x2000000000000000uLL;
  self->_sharingScreen = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)ignoresBluetoothDeviceUID
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_ignoresBluetoothDeviceUID;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setIgnoresBluetoothDeviceUID:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(void *)&self->_hasSet |= 0x8000000000000000;
  self->_ignoresBluetoothDeviceUID = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)serviceStatus
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t serviceStatus = self->_serviceStatus;
  os_unfair_lock_unlock(p_accessorLock);
  return serviceStatus;
}

- (void)setServiceStatus:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 1u;
  self->_int64_t serviceStatus = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)transmissionMode
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t transmissionMode = self->_transmissionMode;
  os_unfair_lock_unlock(p_accessorLock);
  return transmissionMode;
}

- (void)setTransmissionMode:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 2u;
  self->_int64_t transmissionMode = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)accessoryButtonEventsEnabled
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_accessoryButtonEventsEnabled;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 4u;
  self->_accessoryButtonEventsEnabled = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)sendingVideo
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_sendingVideo;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSendingVideo:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 8u;
  self->_sendingVideo = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)isReRing
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_isReRing;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setIsReRing:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x100u;
  self->_isReRing = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)suppressRingtone
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_suppressRingtone;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSuppressRingtone:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x200u;
  self->_suppressRingtone = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)hasBeenRedirected
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_hasBeenRedirected;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setHasBeenRedirected:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x10u;
  self->_hasBeenRedirected = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)isKnownCaller
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_isKnownCaller;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setIsKnownCaller:(BOOL)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x20u;
  self->_isKnownCaller = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int)filteredOutReason
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LODWORD(v2) = v2->_filteredOutReason;
  os_unfair_lock_unlock(p_accessorLock);
  return (int)v2;
}

- (void)setFilteredOutReason:(int)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x40u;
  self->_filteredOutReason = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)screenSharingType
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int64_t screenSharingType = self->_screenSharingType;
  os_unfair_lock_unlock(p_accessorLock);
  return screenSharingType;
}

- (void)setScreenSharingType:(int64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x2000u;
  self->_int64_t screenSharingType = a3;

  os_unfair_lock_unlock(p_accessorLock);
}

- (CXCallUpdate)updateWithUpdate:(id)a3
{
  id v43 = a3;
  if ([v43 hasSet])
  {
    uint64_t v4 = [v43 account];
    [(CXCallUpdate *)self setAccount:v4];
  }
  if (([v43 hasSet] & 2) != 0)
  {
    id v5 = [v43 activeRemoteParticipant];
    [(CXCallUpdate *)self setActiveRemoteParticipant:v5];
  }
  if (([v43 hasSet] & 4) != 0)
  {
    char v6 = [v43 remoteHandle];
    [(CXCallUpdate *)self setRemoteHandle:v6];
  }
  if (([v43 hasSet] & 8) != 0)
  {
    objc_super v7 = [v43 localizedCallerName];
    [(CXCallUpdate *)self setLocalizedCallerName:v7];
  }
  if (([v43 hasSet] & 0x10) != 0)
  {
    uint64_t v8 = [v43 localizedCallerImageURL];
    [(CXCallUpdate *)self setLocalizedCallerImageURL:v8];
  }
  if (([v43 hasSet] & 0x20) != 0) {
    -[CXCallUpdate setEmergency:](self, "setEmergency:", [v43 isEmergency]);
  }
  if (([v43 hasSet] & 0x40) != 0) {
    -[CXCallUpdate setFailureExpected:](self, "setFailureExpected:", [v43 isFailureExpected]);
  }
  if (([v43 hasSet] & 0x80) != 0) {
    -[CXCallUpdate setSupportsEmergencyFallback:](self, "setSupportsEmergencyFallback:", [v43 supportsEmergencyFallback]);
  }
  if (([v43 hasSet] & 0x100) != 0) {
    -[CXCallUpdate setUsingBaseband:](self, "setUsingBaseband:", [v43 isUsingBaseband]);
  }
  if (([v43 hasSet] & 0x200) != 0) {
    -[CXCallUpdate setBlocked:](self, "setBlocked:", [v43 isBlocked]);
  }
  if (([v43 hasSet] & 0x400) != 0) {
    -[CXCallUpdate setTTYType:](self, "setTTYType:", [v43 ttyType]);
  }
  if (([v43 hasSet] & 0x4000000000000000) != 0) {
    -[CXCallUpdate setBluetoothAudioFormat:](self, "setBluetoothAudioFormat:", [v43 bluetoothAudioFormat]);
  }
  if (([v43 hasSet] & 0x1000) != 0) {
    -[CXCallUpdate setMayRequireBreakBeforeMake:](self, "setMayRequireBreakBeforeMake:", [v43 mayRequireBreakBeforeMake]);
  }
  if (([v43 hasSet] & 0x2000) != 0) {
    -[CXCallUpdate setHasVideo:](self, "setHasVideo:", [v43 hasVideo]);
  }
  if (([v43 hasSet] & 0x4000) != 0)
  {
    v9 = [v43 audioCategory];
    [(CXCallUpdate *)self setAudioCategory:v9];
  }
  if (([v43 hasSet] & 0x8000) != 0)
  {
    v10 = [v43 audioMode];
    [(CXCallUpdate *)self setAudioMode:v10];
  }
  if (([v43 hasSet] & 0x10000) != 0) {
    -[CXCallUpdate setAudioInterruptionProvider:](self, "setAudioInterruptionProvider:", [v43 audioInterruptionProvider]);
  }
  if (([v43 hasSet] & 0x20000) != 0) {
    -[CXCallUpdate setAudioInterruptionOperationMode:](self, "setAudioInterruptionOperationMode:", [v43 audioInterruptionOperationMode]);
  }
  if (([v43 hasSet] & 0x40000) != 0) {
    -[CXCallUpdate setVerificationStatus:](self, "setVerificationStatus:", [v43 verificationStatus]);
  }
  if (([v43 hasSet] & 0x80000) != 0) {
    -[CXCallUpdate setPriority:](self, "setPriority:", [v43 priority]);
  }
  if (([v43 hasSet] & 0x100000) != 0) {
    -[CXCallUpdate setRequiresInCallSounds:](self, "setRequiresInCallSounds:", [v43 requiresInCallSounds]);
  }
  if (([v43 hasSet] & 0x200000) != 0) {
    -[CXCallUpdate setInCallSoundRegion:](self, "setInCallSoundRegion:", [v43 inCallSoundRegion]);
  }
  if (([v43 hasSet] & 0x400000) != 0) {
    -[CXCallUpdate setSupportsHolding:](self, "setSupportsHolding:", [v43 supportsHolding]);
  }
  if (([v43 hasSet] & 0x800000) != 0) {
    -[CXCallUpdate setSupportsGrouping:](self, "setSupportsGrouping:", [v43 supportsGrouping]);
  }
  if (([v43 hasSet] & 0x1000000) != 0) {
    -[CXCallUpdate setSupportsUngrouping:](self, "setSupportsUngrouping:", [v43 supportsUngrouping]);
  }
  if (([v43 hasSet] & 0x2000000) != 0) {
    -[CXCallUpdate setSupportsDTMF:](self, "setSupportsDTMF:", [v43 supportsDTMF]);
  }
  if (([v43 hasSet] & 0x4000000) != 0) {
    -[CXCallUpdate setSupportsDTMFUpdates:](self, "setSupportsDTMFUpdates:", [v43 supportsDTMFUpdates]);
  }
  if (([v43 hasSet] & 0x8000000) != 0) {
    -[CXCallUpdate setSupportsUnambiguousMultiPartyState:](self, "setSupportsUnambiguousMultiPartyState:", [v43 supportsUnambiguousMultiPartyState]);
  }
  if (([v43 hasSet] & 0x10000000) != 0) {
    -[CXCallUpdate setSupportsAddCall:](self, "setSupportsAddCall:", [v43 supportsAddCall]);
  }
  if (([v43 hasSet] & 0x20000000) != 0) {
    -[CXCallUpdate setSupportsSendingToVoicemail:](self, "setSupportsSendingToVoicemail:", [v43 supportsSendingToVoicemail]);
  }
  [v43 hasSet];
  if ((v11 & 0x1000) != 0) {
    -[CXCallUpdate setScreenSharingIntention:](self, "setScreenSharingIntention:", [v43 screenSharingIntention]);
  }
  if (([v43 hasSet] & 0x40000000) != 0) {
    -[CXCallUpdate setSupportsRecording:](self, "setSupportsRecording:", [v43 supportsRecording]);
  }
  if (([v43 hasSet] & 0x80000000) != 0) {
    -[CXCallUpdate setIsUnderlyingLinksConnected:](self, "setIsUnderlyingLinksConnected:", [v43 isUnderlyingLinksConnected]);
  }
  [v43 hasSet];
  if ((v12 & 0x800) != 0) {
    -[CXCallUpdate setSupportsScreening:](self, "setSupportsScreening:", [v43 supportsScreening]);
  }
  if (([v43 hasSet] & 0x100000000) != 0) {
    -[CXCallUpdate setVideoStreamToken:](self, "setVideoStreamToken:", [v43 videoStreamToken]);
  }
  if (([v43 hasSet] & 0x200000000) != 0)
  {
    __int16 v13 = [v43 callTokens];
    [(CXCallUpdate *)self setCallTokens:v13];
  }
  if (([v43 hasSet] & 0x400000000) != 0)
  {
    v14 = [v43 announceProviderIdentifier];
    [(CXCallUpdate *)self setAnnounceProviderIdentifier:v14];
  }
  if (([v43 hasSet] & 0x800000000) != 0)
  {
    v15 = [v43 initiator];
    [(CXCallUpdate *)self setInitiator:v15];
  }
  if (([v43 hasSet] & 0x1000000000) != 0)
  {
    v16 = [v43 crossDeviceIdentifier];
    [(CXCallUpdate *)self setCrossDeviceIdentifier:v16];
  }
  if (([v43 hasSet] & 0x2000000000) != 0)
  {
    v17 = [v43 ISOCountryCode];
    [(CXCallUpdate *)self setISOCountryCode:v17];
  }
  if (([v43 hasSet] & 0x4000000000) != 0)
  {
    v18 = [v43 localSenderIdentityUUID];
    [(CXCallUpdate *)self setLocalSenderIdentityUUID:v18];
  }
  if (([v43 hasSet] & 0x8000000000) != 0)
  {
    v19 = [v43 localSenderIdentityAccountUUID];
    [(CXCallUpdate *)self setLocalSenderIdentityAccountUUID:v19];
  }
  if (([v43 hasSet] & 0x10000000000) != 0)
  {
    v20 = [v43 localMemberHandleValue];
    [(CXCallUpdate *)self setLocalMemberHandleValue:v20];
  }
  if (([v43 hasSet] & 0x20000000000) != 0)
  {
    v21 = [v43 localSenderSubscriptionIdentifier];
    [(CXCallUpdate *)self setLocalSenderSubscriptionIdentifier:v21];
  }
  if (([v43 hasSet] & 0x40000000000) != 0)
  {
    v22 = [v43 participantGroupUUID];
    [(CXCallUpdate *)self setParticipantGroupUUID:v22];
  }
  if (([v43 hasSet] & 0x80000000000) != 0)
  {
    v23 = [v43 remoteParticipantHandles];
    [(CXCallUpdate *)self setRemoteParticipantHandles:v23];
  }
  if (([v43 hasSet] & 0x100000000000) != 0)
  {
    v24 = [v43 otherInvitedHandles];
    [(CXCallUpdate *)self setOtherInvitedHandles:v24];
  }
  if (([v43 hasSet] & 0x200000000000) != 0)
  {
    v25 = [v43 activeRemoteParticipantHandles];
    [(CXCallUpdate *)self setActiveRemoteParticipantHandles:v25];
  }
  if (([v43 hasSet] & 0x400000000000) != 0)
  {
    v26 = [v43 handoffContext];
    [(CXCallUpdate *)self setHandoffContext:v26];
  }
  if (([v43 hasSet] & 0x800000000000) != 0)
  {
    v27 = [v43 screenShareAttributes];
    [(CXCallUpdate *)self setScreenShareAttributes:v27];
  }
  if (([v43 hasSet] & 0x1000000000000) != 0)
  {
    v28 = [v43 context];
    [(CXCallUpdate *)self setContext:v28];
  }
  if (([v43 hasSet] & 0x2000000000000) != 0) {
    -[CXCallUpdate setPrefersExclusiveAccessToCellularNetwork:](self, "setPrefersExclusiveAccessToCellularNetwork:", [v43 prefersExclusiveAccessToCellularNetwork]);
  }
  if (([v43 hasSet] & 0x800) != 0) {
    -[CXCallUpdate setSupportsTTYWithVoice:](self, "setSupportsTTYWithVoice:", [v43 supportsTTYWithVoice]);
  }
  if (([v43 hasSet] & 0x4000000000000) != 0) {
    -[CXCallUpdate setRemoteUplinkMuted:](self, "setRemoteUplinkMuted:", [v43 isRemoteUplinkMuted]);
  }
  if (([v43 hasSet] & 0x8000000000000) != 0) {
    -[CXCallUpdate setShouldSuppressInCallUI:](self, "setShouldSuppressInCallUI:", [v43 shouldSuppressInCallUI]);
  }
  if (([v43 hasSet] & 0x10000000000000) != 0) {
    -[CXCallUpdate setRequiresAuthentication:](self, "setRequiresAuthentication:", [v43 requiresAuthentication]);
  }
  if (([v43 hasSet] & 0x20000000000000) != 0) {
    -[CXCallUpdate setMutuallyExclusiveCall:](self, "setMutuallyExclusiveCall:", [v43 isMutuallyExclusiveCall]);
  }
  if (([v43 hasSet] & 0x40000000000000) != 0) {
    -[CXCallUpdate setJunkConfidence:](self, "setJunkConfidence:", [v43 junkConfidence]);
  }
  [v43 hasSet];
  if ((v29 & 0x400) != 0) {
    -[CXCallUpdate setCallSubType:](self, "setCallSubType:", [v43 callSubType]);
  }
  if (([v43 hasSet] & 0x80000000000000) != 0) {
    -[CXCallUpdate setIdentificationCategory:](self, "setIdentificationCategory:", [v43 identificationCategory]);
  }
  if (([v43 hasSet] & 0x100000000000000) != 0) {
    -[CXCallUpdate setConversation:](self, "setConversation:", [v43 isConversation]);
  }
  if (([v43 hasSet] & 0x200000000000000) != 0) {
    -[CXCallUpdate setMixesVoiceWithMedia:](self, "setMixesVoiceWithMedia:", [v43 mixesVoiceWithMedia]);
  }
  if (([v43 hasSet] & 0x400000000000000) != 0) {
    -[CXCallUpdate setPrefersToPlayDuringWombat:](self, "setPrefersToPlayDuringWombat:", [v43 prefersToPlayDuringWombat]);
  }
  if (([v43 hasSet] & 0x800000000000000) != 0) {
    -[CXCallUpdate setMediaPlaybackOnExternalDevice:](self, "setMediaPlaybackOnExternalDevice:", [v43 mediaPlaybackOnExternalDevice]);
  }
  if ([v43 hasSet] < 0) {
    -[CXCallUpdate setIgnoresBluetoothDeviceUID:](self, "setIgnoresBluetoothDeviceUID:", [v43 ignoresBluetoothDeviceUID]);
  }
  if (([v43 hasSet] & 0x2000000000000000) != 0) {
    -[CXCallUpdate setSharingScreen:](self, "setSharingScreen:", [v43 isSharingScreen]);
  }
  if (([v43 hasSet] & 0x1000000000000000) != 0) {
    -[CXCallUpdate setOneToOneModeEnabled:](self, "setOneToOneModeEnabled:", [v43 isOneToOneModeEnabled]);
  }
  [v43 hasSet];
  if (v30) {
    -[CXCallUpdate setServiceStatus:](self, "setServiceStatus:", [v43 serviceStatus]);
  }
  [v43 hasSet];
  if ((v31 & 2) != 0) {
    -[CXCallUpdate setTransmissionMode:](self, "setTransmissionMode:", [v43 transmissionMode]);
  }
  [v43 hasSet];
  if ((v32 & 4) != 0) {
    -[CXCallUpdate setAccessoryButtonEventsEnabled:](self, "setAccessoryButtonEventsEnabled:", [v43 accessoryButtonEventsEnabled]);
  }
  [v43 hasSet];
  if ((v33 & 8) != 0) {
    -[CXCallUpdate setSendingVideo:](self, "setSendingVideo:", [v43 isSendingVideo]);
  }
  [v43 hasSet];
  if ((v34 & 0x100) != 0) {
    -[CXCallUpdate setIsReRing:](self, "setIsReRing:", [v43 isReRing]);
  }
  [v43 hasSet];
  if ((v35 & 0x200) != 0) {
    -[CXCallUpdate setSuppressRingtone:](self, "setSuppressRingtone:", [v43 suppressRingtone]);
  }
  [v43 hasSet];
  if ((v36 & 0x10) != 0) {
    -[CXCallUpdate setHasBeenRedirected:](self, "setHasBeenRedirected:", [v43 hasBeenRedirected]);
  }
  [v43 hasSet];
  if ((v37 & 0x20) != 0) {
    -[CXCallUpdate setIsKnownCaller:](self, "setIsKnownCaller:", [v43 isKnownCaller]);
  }
  [v43 hasSet];
  if ((v38 & 0x40) != 0) {
    -[CXCallUpdate setFilteredOutReason:](self, "setFilteredOutReason:", [v43 filteredOutReason]);
  }
  [v43 hasSet];
  if (v39 < 0)
  {
    __int16 v40 = [v43 silencingUserInfo];
    [(CXCallUpdate *)self setSilencingUserInfo:v40];
  }
  [v43 hasSet];
  if ((v41 & 0x2000) != 0) {
    -[CXCallUpdate setScreenSharingType:](self, "setScreenSharingType:", [v43 screenSharingType]);
  }

  return result;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v14 = a3;
  char v6 = [(CXCallUpdate *)self UUID];
  objc_super v7 = (void *)[v6 copyWithZone:a4];
  [v14 setUUID:v7];

  if (([(CXCallUpdate *)self hasSet] & 4) != 0)
  {
    v14[47] |= 4uLL;
    uint64_t v8 = [(CXCallUpdate *)self remoteHandle];
    v9 = (void *)[v8 copyWithZone:a4];
    [v14 setRemoteHandle:v9];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000000) != 0)
  {
    v14[47] |= 0x80000000000uLL;
    v10 = [(CXCallUpdate *)self remoteParticipantHandles];
    __int16 v11 = (void *)[v10 copyWithZone:a4];
    [v14 setRemoteParticipantHandles:v11];
  }
  if (([(CXCallUpdate *)self hasSet] & 8) != 0)
  {
    v14[47] |= 8uLL;
    __int16 v12 = [(CXCallUpdate *)self localizedCallerName];
    __int16 v13 = (void *)[v12 copyWithZone:a4];
    [v14 setLocalizedCallerName:v13];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000) != 0)
  {
    v14[47] |= 0x400000uLL;
    objc_msgSend(v14, "setSupportsHolding:", -[CXCallUpdate supportsHolding](self, "supportsHolding"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000) != 0)
  {
    v14[47] |= 0x800000uLL;
    objc_msgSend(v14, "setSupportsGrouping:", -[CXCallUpdate supportsGrouping](self, "supportsGrouping"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000) != 0)
  {
    v14[47] |= 0x1000000uLL;
    objc_msgSend(v14, "setSupportsUngrouping:", -[CXCallUpdate supportsUngrouping](self, "supportsUngrouping"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000) != 0)
  {
    v14[47] |= 0x2000000uLL;
    objc_msgSend(v14, "setSupportsDTMF:", -[CXCallUpdate supportsDTMF](self, "supportsDTMF"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000) != 0)
  {
    v14[47] |= 0x4000000uLL;
    objc_msgSend(v14, "setSupportsDTMFUpdates:", -[CXCallUpdate supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000) != 0)
  {
    v14[47] |= 0x2000uLL;
    objc_msgSend(v14, "setHasVideo:", -[CXCallUpdate hasVideo](self, "hasVideo"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000000000) != 0)
  {
    v14[47] |= 0x10000000000000uLL;
    objc_msgSend(v14, "setRequiresAuthentication:", -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"));
  }
}

- (id)sanitizedCopy
{
  return [(CXCallUpdate *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXCallUpdate *)self updateSanitizedCopy:v5 withZone:a3];

  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v58 = a3;
  -[CXCallUpdate updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:");
  if ([(CXCallUpdate *)self hasSet])
  {
    v58[47] |= 1uLL;
    char v6 = [(CXCallUpdate *)self account];
    [v58 setAccount:v6];
  }
  if (([(CXCallUpdate *)self hasSet] & 2) != 0)
  {
    v58[47] |= 2uLL;
    objc_super v7 = [(CXCallUpdate *)self activeRemoteParticipant];
    [v58 setActiveRemoteParticipant:v7];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20) != 0)
  {
    v58[47] |= 0x20uLL;
    objc_msgSend(v58, "setEmergency:", -[CXCallUpdate isEmergency](self, "isEmergency"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40) != 0)
  {
    v58[47] |= 0x40uLL;
    objc_msgSend(v58, "setFailureExpected:", -[CXCallUpdate isFailureExpected](self, "isFailureExpected"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80) != 0)
  {
    v58[47] |= 0x80uLL;
    objc_msgSend(v58, "setSupportsEmergencyFallback:", -[CXCallUpdate supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100) != 0)
  {
    v58[47] |= 0x100uLL;
    objc_msgSend(v58, "setUsingBaseband:", -[CXCallUpdate isUsingBaseband](self, "isUsingBaseband"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200) != 0)
  {
    v58[47] |= 0x200uLL;
    objc_msgSend(v58, "setBlocked:", -[CXCallUpdate isBlocked](self, "isBlocked"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400) != 0)
  {
    v58[47] |= 0x400uLL;
    objc_msgSend(v58, "setTTYType:", -[CXCallUpdate ttyType](self, "ttyType"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000000000) != 0)
  {
    v58[47] |= 0x4000000000000000uLL;
    objc_msgSend(v58, "setBluetoothAudioFormat:", -[CXCallUpdate bluetoothAudioFormat](self, "bluetoothAudioFormat"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000) != 0)
  {
    v58[47] |= 0x1000uLL;
    objc_msgSend(v58, "setMayRequireBreakBeforeMake:", -[CXCallUpdate mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000) != 0)
  {
    v58[47] |= 0x4000uLL;
    uint64_t v8 = [(CXCallUpdate *)self audioCategory];
    v9 = (void *)[v8 copyWithZone:a4];
    [v58 setAudioCategory:v9];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000) != 0)
  {
    v58[47] |= 0x8000uLL;
    v10 = [(CXCallUpdate *)self audioMode];
    __int16 v11 = (void *)[v10 copyWithZone:a4];
    [v58 setAudioMode:v11];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000) != 0)
  {
    v58[47] |= 0x10000uLL;
    objc_msgSend(v58, "setAudioInterruptionProvider:", -[CXCallUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000) != 0)
  {
    v58[47] |= 0x20000uLL;
    objc_msgSend(v58, "setAudioInterruptionOperationMode:", -[CXCallUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000) != 0)
  {
    v58[47] |= 0x40000uLL;
    objc_msgSend(v58, "setVerificationStatus:", -[CXCallUpdate verificationStatus](self, "verificationStatus"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000) != 0)
  {
    v58[47] |= 0x80000uLL;
    objc_msgSend(v58, "setPriority:", -[CXCallUpdate priority](self, "priority"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000) != 0)
  {
    v58[47] |= 0x100000uLL;
    objc_msgSend(v58, "setRequiresInCallSounds:", -[CXCallUpdate requiresInCallSounds](self, "requiresInCallSounds"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000) != 0)
  {
    v58[47] |= 0x200000uLL;
    objc_msgSend(v58, "setInCallSoundRegion:", -[CXCallUpdate inCallSoundRegion](self, "inCallSoundRegion"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000) != 0)
  {
    v58[47] |= 0x8000000uLL;
    objc_msgSend(v58, "setSupportsUnambiguousMultiPartyState:", -[CXCallUpdate supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000) != 0)
  {
    v58[47] |= 0x10000000uLL;
    objc_msgSend(v58, "setSupportsAddCall:", -[CXCallUpdate supportsAddCall](self, "supportsAddCall"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000) != 0)
  {
    v58[47] |= 0x20000000uLL;
    objc_msgSend(v58, "setSupportsSendingToVoicemail:", -[CXCallUpdate supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000) != 0)
  {
    v58[47] |= 0x40000000uLL;
    objc_msgSend(v58, "setSupportsRecording:", -[CXCallUpdate supportsRecording](self, "supportsRecording"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000) != 0)
  {
    v58[47] |= 0x80000000uLL;
    objc_msgSend(v58, "setIsUnderlyingLinksConnected:", -[CXCallUpdate isUnderlyingLinksConnected](self, "isUnderlyingLinksConnected"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v12 & 0x800) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x800u;
    objc_msgSend(v58, "setSupportsScreening:", -[CXCallUpdate supportsScreening](self, "supportsScreening"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000) != 0)
  {
    v58[47] |= 0x100000000uLL;
    objc_msgSend(v58, "setVideoStreamToken:", -[CXCallUpdate videoStreamToken](self, "videoStreamToken"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000) != 0)
  {
    v58[47] |= 0x200000000uLL;
    __int16 v13 = [(CXCallUpdate *)self callTokens];
    [v58 setCallTokens:v13];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000) != 0)
  {
    v58[47] |= 0x400000000uLL;
    v14 = [(CXCallUpdate *)self announceProviderIdentifier];
    v15 = (void *)[v14 copyWithZone:a4];
    [v58 setAnnounceProviderIdentifier:v15];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000) != 0)
  {
    v58[47] |= 0x800000000uLL;
    v16 = [(CXCallUpdate *)self initiator];
    v17 = (void *)[v16 copyWithZone:a4];
    [v58 setInitiator:v17];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000) != 0)
  {
    v58[47] |= 0x1000000000uLL;
    v18 = [(CXCallUpdate *)self crossDeviceIdentifier];
    v19 = (void *)[v18 copyWithZone:a4];
    [v58 setCrossDeviceIdentifier:v19];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000) != 0)
  {
    v58[47] |= 0x2000000000uLL;
    v20 = [(CXCallUpdate *)self ISOCountryCode];
    v21 = (void *)[v20 copyWithZone:a4];
    [v58 setISOCountryCode:v21];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10) != 0)
  {
    v58[47] |= 0x10uLL;
    v22 = [(CXCallUpdate *)self localizedCallerImageURL];
    v23 = (void *)[v22 copyWithZone:a4];
    [v58 setLocalizedCallerImageURL:v23];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000) != 0)
  {
    v58[47] |= 0x4000000000uLL;
    v24 = [(CXCallUpdate *)self localSenderIdentityUUID];
    v25 = (void *)[v24 copyWithZone:a4];
    [v58 setLocalSenderIdentityUUID:v25];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000000) != 0)
  {
    v58[47] |= 0x8000000000uLL;
    v26 = [(CXCallUpdate *)self localSenderIdentityAccountUUID];
    v27 = (void *)[v26 copyWithZone:a4];
    [v58 setLocalSenderIdentityAccountUUID:v27];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000000) != 0)
  {
    v58[47] |= 0x10000000000uLL;
    v28 = [(CXCallUpdate *)self localMemberHandleValue];
    __int16 v29 = (void *)[v28 copyWithZone:a4];
    [v58 setLocalMemberHandleValue:v29];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000000) != 0)
  {
    v58[47] |= 0x20000000000uLL;
    char v30 = [(CXCallUpdate *)self localSenderSubscriptionIdentifier];
    char v31 = (void *)[v30 copyWithZone:a4];
    [v58 setLocalSenderSubscriptionIdentifier:v31];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000000) != 0)
  {
    v58[47] |= 0x40000000000uLL;
    char v32 = [(CXCallUpdate *)self participantGroupUUID];
    char v33 = (void *)[v32 copyWithZone:a4];
    [v58 setParticipantGroupUUID:v33];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000000) != 0)
  {
    v58[47] |= 0x80000000000uLL;
    __int16 v34 = [(CXCallUpdate *)self remoteParticipantHandles];
    __int16 v35 = (void *)[v34 copyWithZone:a4];
    [v58 setRemoteParticipantHandles:v35];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000000) != 0)
  {
    v58[47] |= 0x100000000000uLL;
    char v36 = [(CXCallUpdate *)self otherInvitedHandles];
    char v37 = (void *)[v36 copyWithZone:a4];
    [v58 setOtherInvitedHandles:v37];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000000) != 0)
  {
    v58[47] |= 0x200000000000uLL;
    char v38 = [(CXCallUpdate *)self activeRemoteParticipantHandles];
    char v39 = (void *)[v38 copyWithZone:a4];
    [v58 setActiveRemoteParticipantHandles:v39];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000000) != 0)
  {
    v58[47] |= 0x400000000000uLL;
    __int16 v40 = [(CXCallUpdate *)self handoffContext];
    [v58 setHandoffContext:v40];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000000) != 0)
  {
    v58[47] |= 0x800000000000uLL;
    __int16 v41 = [(CXCallUpdate *)self screenShareAttributes];
    [v58 setScreenShareAttributes:v41];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000000) != 0)
  {
    v58[47] |= 0x1000000000000uLL;
    id v42 = [(CXCallUpdate *)self context];
    id v43 = (void *)[v42 copyWithZone:a4];
    [v58 setContext:v43];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000000) != 0)
  {
    v58[47] |= 0x2000000000000uLL;
    objc_msgSend(v58, "setPrefersExclusiveAccessToCellularNetwork:", -[CXCallUpdate prefersExclusiveAccessToCellularNetwork](self, "prefersExclusiveAccessToCellularNetwork"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800) != 0)
  {
    v58[47] |= 0x800uLL;
    objc_msgSend(v58, "setSupportsTTYWithVoice:", -[CXCallUpdate supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000000) != 0)
  {
    v58[47] |= 0x4000000000000uLL;
    objc_msgSend(v58, "setRemoteUplinkMuted:", -[CXCallUpdate isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000000000) != 0)
  {
    v58[47] |= 0x8000000000000uLL;
    objc_msgSend(v58, "setShouldSuppressInCallUI:", -[CXCallUpdate shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000000000) != 0)
  {
    v58[47] |= 0x10000000000000uLL;
    objc_msgSend(v58, "setRequiresAuthentication:", -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000000000) != 0)
  {
    v58[47] |= 0x20000000000000uLL;
    objc_msgSend(v58, "setMutuallyExclusiveCall:", -[CXCallUpdate isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000000000) != 0)
  {
    v58[47] |= 0x40000000000000uLL;
    objc_msgSend(v58, "setJunkConfidence:", -[CXCallUpdate junkConfidence](self, "junkConfidence"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v44 & 0x400) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x400u;
    objc_msgSend(v58, "setCallSubType:", -[CXCallUpdate callSubType](self, "callSubType"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000000000) != 0)
  {
    v58[47] |= 0x80000000000000uLL;
    objc_msgSend(v58, "setIdentificationCategory:", -[CXCallUpdate identificationCategory](self, "identificationCategory"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000000000) != 0)
  {
    v58[47] |= 0x100000000000000uLL;
    objc_msgSend(v58, "setConversation:", -[CXCallUpdate isConversation](self, "isConversation"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000000000) != 0)
  {
    v58[47] |= 0x200000000000000uLL;
    objc_msgSend(v58, "setMixesVoiceWithMedia:", -[CXCallUpdate mixesVoiceWithMedia](self, "mixesVoiceWithMedia"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000000000) != 0)
  {
    v58[47] |= 0x400000000000000uLL;
    objc_msgSend(v58, "setPrefersToPlayDuringWombat:", -[CXCallUpdate prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000000000) != 0)
  {
    v58[47] |= 0x800000000000000uLL;
    objc_msgSend(v58, "setMediaPlaybackOnExternalDevice:", -[CXCallUpdate mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice"));
  }
  if ([(CXCallUpdate *)self hasSet] < 0)
  {
    v58[47] |= 0x8000000000000000;
    objc_msgSend(v58, "setIgnoresBluetoothDeviceUID:", -[CXCallUpdate ignoresBluetoothDeviceUID](self, "ignoresBluetoothDeviceUID"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000000000) != 0)
  {
    v58[47] |= 0x2000000000000000uLL;
    objc_msgSend(v58, "setSharingScreen:", -[CXCallUpdate isSharingScreen](self, "isSharingScreen"));
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000000000) != 0)
  {
    v58[47] |= 0x1000000000000000uLL;
    objc_msgSend(v58, "setOneToOneModeEnabled:", -[CXCallUpdate isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  }
  [(CXCallUpdate *)self hasSet];
  if (v45)
  {
    *((_WORD *)v58 + 192) |= 1u;
    objc_msgSend(v58, "setServiceStatus:", -[CXCallUpdate serviceStatus](self, "serviceStatus"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v46 & 2) != 0)
  {
    *((_WORD *)v58 + 192) |= 2u;
    objc_msgSend(v58, "setTransmissionMode:", -[CXCallUpdate transmissionMode](self, "transmissionMode"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v47 & 4) != 0)
  {
    *((_WORD *)v58 + 192) |= 4u;
    objc_msgSend(v58, "setAccessoryButtonEventsEnabled:", -[CXCallUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v48 & 8) != 0)
  {
    *((_WORD *)v58 + 192) |= 8u;
    objc_msgSend(v58, "setSendingVideo:", -[CXCallUpdate isSendingVideo](self, "isSendingVideo"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v49 & 0x100) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x100u;
    objc_msgSend(v58, "setIsReRing:", -[CXCallUpdate isReRing](self, "isReRing"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v50 & 0x200) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x200u;
    objc_msgSend(v58, "setSuppressRingtone:", -[CXCallUpdate suppressRingtone](self, "suppressRingtone"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v51 & 0x10) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x10u;
    objc_msgSend(v58, "setHasBeenRedirected:", -[CXCallUpdate hasBeenRedirected](self, "hasBeenRedirected"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v52 & 0x20) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x20u;
    objc_msgSend(v58, "setIsKnownCaller:", -[CXCallUpdate isKnownCaller](self, "isKnownCaller"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v53 & 0x40) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x40u;
    objc_msgSend(v58, "setFilteredOutReason:", -[CXCallUpdate filteredOutReason](self, "filteredOutReason"));
  }
  [(CXCallUpdate *)self hasSet];
  if (v54 < 0)
  {
    *((_WORD *)v58 + 192) |= 0x80u;
    v55 = [(CXCallUpdate *)self silencingUserInfo];
    [v58 setSilencingUserInfo:v55];
  }
  [(CXCallUpdate *)self hasSet];
  if ((v56 & 0x1000) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x1000u;
    objc_msgSend(v58, "setScreenSharingIntention:", -[CXCallUpdate screenSharingIntention](self, "screenSharingIntention"));
  }
  [(CXCallUpdate *)self hasSet];
  if ((v57 & 0x2000) != 0)
  {
    *((_WORD *)v58 + 192) |= 0x2000u;
    objc_msgSend(v58, "setScreenSharingType:", -[CXCallUpdate screenSharingType](self, "screenSharingType"));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXCallUpdate *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallUpdate)initWithCoder:(id)a3
{
  uint64_t v334 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CXCallUpdate *)self init];

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_UUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    v180[0] = 0;
    id v10 = v4;
    __int16 v11 = NSStringFromSelector(sel_hasSet);
    uint64_t v12 = [v10 decodeBytesForKey:v11 returnedLength:v180];

    if (v180[0] != 12)
    {
      v177 = 0;
      goto LABEL_159;
    }
    uint64_t v13 = *(void *)v12;
    *((_DWORD *)&v5->_hasSet + 2) = *(_DWORD *)(v12 + 8);
    *(void *)&v5->_hasSet = v13;
    uint64_t v332 = [(CXCallUpdate *)v5 hasSet];
    int v333 = v14;
    if (v332)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v16 = [v10 decodeObjectOfClasses:v15 forKey:@"account"];
      account = v5->_account;
      v5->_account = (CXAccount *)v16;
    }
    uint64_t v330 = [(CXCallUpdate *)v5 hasSet];
    int v331 = v18;
    if ((v330 & 2) != 0)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v20 = [v10 decodeObjectOfClasses:v19 forKey:@"activeRemoteParticipant"];
      activeRemoteParticipant = v5->_activeRemoteParticipant;
      v5->_activeRemoteParticipant = (CXParticipant *)v20;
    }
    uint64_t v328 = [(CXCallUpdate *)v5 hasSet];
    int v329 = v22;
    if ((v328 & 4) != 0)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v24 = [v10 decodeObjectOfClasses:v23 forKey:@"remoteHandle"];
      remoteHandle = v5->_remoteHandle;
      v5->_remoteHandle = (CXHandle *)v24;
    }
    uint64_t v326 = [(CXCallUpdate *)v5 hasSet];
    int v327 = v26;
    if ((v326 & 8) != 0)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v28 = [v10 decodeObjectOfClasses:v27 forKey:@"localizedCallerName"];
      localizedCallerName = v5->_localizedCallerName;
      v5->_localizedCallerName = (NSString *)v28;
    }
    uint64_t v324 = [(CXCallUpdate *)v5 hasSet];
    int v325 = v30;
    if ((v324 & 0x10) != 0)
    {
      char v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v32 = [v10 decodeObjectOfClasses:v31 forKey:@"localizedCallerImageURL"];
      localizedCallerImageURL = v5->_localizedCallerImageURL;
      v5->_localizedCallerImageURL = (CXSandboxExtendedURL *)v32;
    }
    uint64_t v322 = [(CXCallUpdate *)v5 hasSet];
    int v323 = v34;
    if ((v322 & 0x20) != 0) {
      v5->_emergency = [v10 decodeBoolForKey:@"emergency"];
    }
    uint64_t v320 = [(CXCallUpdate *)v5 hasSet];
    int v321 = v35;
    if ((v320 & 0x40) != 0) {
      v5->_failureExpected = [v10 decodeBoolForKey:@"failureExpected"];
    }
    uint64_t v318 = [(CXCallUpdate *)v5 hasSet];
    int v319 = v36;
    if ((v318 & 0x80) != 0) {
      v5->_supportsEmergencyFallback = [v10 decodeBoolForKey:@"supportsEmergencyFallback"];
    }
    uint64_t v316 = [(CXCallUpdate *)v5 hasSet];
    int v317 = v37;
    if ((v316 & 0x100) != 0) {
      v5->_usingBaseband = [v10 decodeBoolForKey:@"usingBaseband"];
    }
    uint64_t v314 = [(CXCallUpdate *)v5 hasSet];
    int v315 = v38;
    if ((v314 & 0x200) != 0) {
      v5->_blocked = [v10 decodeBoolForKey:@"blocked"];
    }
    uint64_t v312 = [(CXCallUpdate *)v5 hasSet];
    int v313 = v39;
    if ((v312 & 0x400) != 0) {
      v5->_int64_t ttyType = [v10 decodeIntegerForKey:@"ttyType"];
    }
    uint64_t v310 = [(CXCallUpdate *)v5 hasSet];
    int v311 = v40;
    if ((v310 & 0x4000000000000000) != 0) {
      v5->_int64_t bluetoothAudioFormat = [v10 decodeIntegerForKey:@"bluetoothAudioFormat"];
    }
    uint64_t v308 = [(CXCallUpdate *)v5 hasSet];
    int v309 = v41;
    if ((v308 & 0x1000) != 0) {
      v5->_mayRequireBreakBeforeMake = [v10 decodeBoolForKey:@"mayRequireBreakBeforeMake"];
    }
    uint64_t v306 = [(CXCallUpdate *)v5 hasSet];
    int v307 = v42;
    if ((v306 & 0x2000) != 0) {
      v5->_hasVideo = [v10 decodeBoolForKey:@"hasVideo"];
    }
    uint64_t v304 = [(CXCallUpdate *)v5 hasSet];
    int v305 = v43;
    if ((v304 & 0x4000) != 0)
    {
      __int16 v44 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v45 = [v10 decodeObjectOfClasses:v44 forKey:@"audioCategory"];
      audioCategory = v5->_audioCategory;
      v5->_audioCategory = (NSString *)v45;
    }
    uint64_t v302 = [(CXCallUpdate *)v5 hasSet];
    int v303 = v47;
    if ((v302 & 0x8000) != 0)
    {
      char v48 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v49 = [v10 decodeObjectOfClasses:v48 forKey:@"audioMode"];
      audioMode = v5->_audioMode;
      v5->_audioMode = (NSString *)v49;
    }
    uint64_t v300 = [(CXCallUpdate *)v5 hasSet];
    int v301 = v51;
    if ((v300 & 0x10000) != 0) {
      v5->_int64_t audioInterruptionProvider = [v10 decodeIntegerForKey:@"audioInterruptionProvider"];
    }
    uint64_t v298 = [(CXCallUpdate *)v5 hasSet];
    int v299 = v52;
    if ((v298 & 0x20000) != 0) {
      v5->_int64_t audioInterruptionOperationMode = [v10 decodeIntegerForKey:@"audioInterruptionOperationMode"];
    }
    uint64_t v296 = [(CXCallUpdate *)v5 hasSet];
    int v297 = v53;
    if ((v296 & 0x40000) != 0) {
      v5->_int64_t verificationStatus = [v10 decodeIntegerForKey:@"verificationStatus"];
    }
    uint64_t v294 = [(CXCallUpdate *)v5 hasSet];
    int v295 = v54;
    if ((v294 & 0x80000) != 0) {
      v5->_int64_t priority = [v10 decodeIntegerForKey:@"priority"];
    }
    uint64_t v292 = [(CXCallUpdate *)v5 hasSet];
    int v293 = v55;
    if ((v292 & 0x100000) != 0) {
      v5->_requiresInCallSounds = [v10 decodeBoolForKey:@"requiresInCallSounds"];
    }
    uint64_t v290 = [(CXCallUpdate *)v5 hasSet];
    int v291 = v56;
    if ((v290 & 0x200000) != 0) {
      v5->_int64_t inCallSoundRegion = [v10 decodeIntegerForKey:@"inCallSoundRegion"];
    }
    uint64_t v288 = [(CXCallUpdate *)v5 hasSet];
    int v289 = v57;
    if ((v288 & 0x400000) != 0) {
      v5->_supportsHolding = [v10 decodeBoolForKey:@"supportsHolding"];
    }
    uint64_t v286 = [(CXCallUpdate *)v5 hasSet];
    int v287 = v58;
    if ((v286 & 0x800000) != 0) {
      v5->_supportsGrouping = [v10 decodeBoolForKey:@"supportsGrouping"];
    }
    uint64_t v284 = [(CXCallUpdate *)v5 hasSet];
    int v285 = v59;
    if ((v284 & 0x1000000) != 0) {
      v5->_supportsUngrouping = [v10 decodeBoolForKey:@"supportsUngrouping"];
    }
    uint64_t v282 = [(CXCallUpdate *)v5 hasSet];
    int v283 = v60;
    if ((v282 & 0x2000000) != 0) {
      v5->_supportsDTMF = [v10 decodeBoolForKey:@"supportsDTMF"];
    }
    uint64_t v280 = [(CXCallUpdate *)v5 hasSet];
    int v281 = v61;
    if ((v280 & 0x4000000) != 0) {
      v5->_supportsDTMFUpdates = [v10 decodeBoolForKey:@"supportsDTMFUpdates"];
    }
    uint64_t v278 = [(CXCallUpdate *)v5 hasSet];
    int v279 = v62;
    if ((v278 & 0x8000000) != 0) {
      v5->_supportsUnambiguousMultiPartyState = [v10 decodeBoolForKey:@"supportsUnambiguousMultiPartyState"];
    }
    uint64_t v276 = [(CXCallUpdate *)v5 hasSet];
    int v277 = v63;
    if ((v276 & 0x10000000) != 0) {
      v5->_supportsAddCall = [v10 decodeBoolForKey:@"supportsAddCall"];
    }
    uint64_t v274 = [(CXCallUpdate *)v5 hasSet];
    int v275 = v64;
    if ((v274 & 0x20000000) != 0) {
      v5->_supportsSendingToVoicemail = [v10 decodeBoolForKey:@"supportsSendingToVoicemail"];
    }
    uint64_t v272 = [(CXCallUpdate *)v5 hasSet];
    int v273 = v65;
    if ((v272 & 0x40000000) != 0) {
      v5->_supportsRecording = [v10 decodeBoolForKey:@"supportsRecording"];
    }
    uint64_t v270 = [(CXCallUpdate *)v5 hasSet];
    int v271 = v66;
    if ((v270 & 0x80000000) != 0) {
      v5->_isUnderlyingLinksConnected = [v10 decodeBoolForKey:@"isUnderlyingLinksConnected"];
    }
    uint64_t v268 = [(CXCallUpdate *)v5 hasSet];
    int v269 = v67;
    if ((v67 & 0x800) != 0) {
      v5->_supportsScreening = [v10 decodeBoolForKey:@"supportsScreening"];
    }
    uint64_t v266 = [(CXCallUpdate *)v5 hasSet];
    int v267 = v68;
    if ((v266 & 0x100000000) != 0) {
      v5->_int64_t videoStreamToken = [v10 decodeIntegerForKey:@"videoStreamToken"];
    }
    uint64_t v264 = [(CXCallUpdate *)v5 hasSet];
    int v265 = v69;
    if ((v264 & 0x200000000) != 0)
    {
      v70 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v71 = [v10 decodeObjectOfClasses:v70 forKey:@"callTokens"];
      callTokens = v5->_callTokens;
      v5->_callTokens = (CXCallTokens *)v71;
    }
    uint64_t v262 = [(CXCallUpdate *)v5 hasSet];
    int v263 = v73;
    if ((v262 & 0x400000000) != 0)
    {
      v74 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v75 = [v10 decodeObjectOfClasses:v74 forKey:@"announceProviderIdentifier"];
      announceProviderIdentifier = v5->_announceProviderIdentifier;
      v5->_announceProviderIdentifier = (NSString *)v75;
    }
    uint64_t v260 = [(CXCallUpdate *)v5 hasSet];
    int v261 = v77;
    if ((v260 & 0x800000000) != 0)
    {
      v78 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v79 = [v10 decodeObjectOfClasses:v78 forKey:@"initiator"];
      initiator = v5->_initiator;
      v5->_initiator = (CXHandle *)v79;
    }
    uint64_t v258 = [(CXCallUpdate *)v5 hasSet];
    int v259 = v81;
    if ((v258 & 0x1000000000) != 0)
    {
      v82 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v83 = [v10 decodeObjectOfClasses:v82 forKey:@"crossDeviceIdentifier"];
      crossDeviceIdentifier = v5->_crossDeviceIdentifier;
      v5->_crossDeviceIdentifier = (NSString *)v83;
    }
    uint64_t v256 = [(CXCallUpdate *)v5 hasSet];
    int v257 = v85;
    if ((v256 & 0x2000000000) != 0)
    {
      v86 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v87 = [v10 decodeObjectOfClasses:v86 forKey:@"ISOCountryCode"];
      ISOCountryCode = v5->_ISOCountryCode;
      v5->_ISOCountryCode = (NSString *)v87;
    }
    uint64_t v254 = [(CXCallUpdate *)v5 hasSet];
    int v255 = v89;
    if ((v254 & 0x4000000000) != 0)
    {
      v90 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v91 = [v10 decodeObjectOfClasses:v90 forKey:@"localSenderIdentityUUID"];
      localSenderIdentityUUID = v5->_localSenderIdentityUUID;
      v5->_localSenderIdentityUUID = (NSUUID *)v91;
    }
    uint64_t v252 = [(CXCallUpdate *)v5 hasSet];
    int v253 = v93;
    if ((v252 & 0x8000000000) != 0)
    {
      v94 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v95 = [v10 decodeObjectOfClasses:v94 forKey:@"localSenderIdentityAccountUUID"];
      localSenderIdentityAccountUUID = v5->_localSenderIdentityAccountUUID;
      v5->_localSenderIdentityAccountUUID = (NSUUID *)v95;
    }
    uint64_t v250 = [(CXCallUpdate *)v5 hasSet];
    int v251 = v97;
    if ((v250 & 0x10000000000) != 0)
    {
      v98 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v99 = [v10 decodeObjectOfClasses:v98 forKey:@"localMemberHandleValue"];
      localMemberHandleValue = v5->_localMemberHandleValue;
      v5->_localMemberHandleValue = (NSString *)v99;
    }
    uint64_t v248 = [(CXCallUpdate *)v5 hasSet];
    int v249 = v101;
    if ((v248 & 0x20000000000) != 0)
    {
      v102 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v103 = [v10 decodeObjectOfClasses:v102 forKey:@"localSenderSubscriptionIdentifier"];
      localSenderSubscriptionIdentifier = v5->_localSenderSubscriptionIdentifier;
      v5->_localSenderSubscriptionIdentifier = (NSString *)v103;
    }
    uint64_t v246 = [(CXCallUpdate *)v5 hasSet];
    int v247 = v105;
    if ((v246 & 0x40000000000) != 0)
    {
      v106 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v107 = [v10 decodeObjectOfClasses:v106 forKey:@"participantGroupUUID"];
      participantGroupUUID = v5->_participantGroupUUID;
      v5->_participantGroupUUID = (NSUUID *)v107;
    }
    uint64_t v244 = [(CXCallUpdate *)v5 hasSet];
    int v245 = v109;
    if ((v244 & 0x80000000000) != 0)
    {
      v110 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v111 = objc_opt_class();
      v112 = objc_msgSend(v110, "setWithObjects:", v111, objc_opt_class(), 0);
      uint64_t v113 = [v10 decodeObjectOfClasses:v112 forKey:@"remoteParticipantHandles"];
      remoteParticipantHandles = v5->_remoteParticipantHandles;
      v5->_remoteParticipantHandles = (NSSet *)v113;
    }
    uint64_t v242 = [(CXCallUpdate *)v5 hasSet];
    int v243 = v115;
    if ((v242 & 0x100000000000) != 0)
    {
      v116 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v117 = objc_opt_class();
      v118 = objc_msgSend(v116, "setWithObjects:", v117, objc_opt_class(), 0);
      uint64_t v119 = [v10 decodeObjectOfClasses:v118 forKey:@"otherInvitedHandles"];
      otherInvitedHandles = v5->_otherInvitedHandles;
      v5->_otherInvitedHandles = (NSSet *)v119;
    }
    uint64_t v240 = [(CXCallUpdate *)v5 hasSet];
    int v241 = v121;
    if ((v240 & 0x200000000000) != 0)
    {
      v122 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v123 = objc_opt_class();
      v124 = objc_msgSend(v122, "setWithObjects:", v123, objc_opt_class(), 0);
      uint64_t v125 = [v10 decodeObjectOfClasses:v124 forKey:@"activeRemoteParticipantHandles"];
      activeRemoteParticipantHandles = v5->_activeRemoteParticipantHandles;
      v5->_activeRemoteParticipantHandles = (NSSet *)v125;
    }
    uint64_t v238 = [(CXCallUpdate *)v5 hasSet];
    int v239 = v127;
    if ((v238 & 0x400000000000) != 0)
    {
      v128 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v129 = [v10 decodeObjectOfClasses:v128 forKey:@"handoffContext"];
      handoffContext = v5->_handoffContext;
      v5->_handoffContext = (CXHandoffContext *)v129;
    }
    uint64_t v236 = [(CXCallUpdate *)v5 hasSet];
    int v237 = v131;
    if ((v236 & 0x800000000000) != 0)
    {
      v132 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v133 = [v10 decodeObjectOfClasses:v132 forKey:@"screenShareAttributes"];
      screenShareAttributes = v5->_screenShareAttributes;
      v5->_screenShareAttributes = (CXScreenShareAttributes *)v133;
    }
    uint64_t v234 = [(CXCallUpdate *)v5 hasSet];
    int v235 = v135;
    if ((v234 & 0x1000000000000) != 0)
    {
      v136 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v137 = objc_opt_class();
      uint64_t v138 = objc_opt_class();
      uint64_t v139 = objc_opt_class();
      uint64_t v140 = objc_opt_class();
      uint64_t v179 = objc_opt_class();
      v141 = objc_msgSend(v136, "setWithObjects:", v137, v138, v139, v140, v179, objc_opt_class(), 0);
      uint64_t v142 = [v10 decodeObjectOfClasses:v141 forKey:@"context"];
      context = v5->_context;
      v5->_context = (NSDictionary *)v142;
    }
    uint64_t v232 = [(CXCallUpdate *)v5 hasSet];
    int v233 = v144;
    if ((v232 & 0x2000000000000) != 0) {
      v5->_prefersExclusiveAccessToCellularNetwork = [v10 decodeBoolForKey:@"prefersExclusiveAccessToCellularNetwork"];
    }
    uint64_t v230 = [(CXCallUpdate *)v5 hasSet];
    int v231 = v145;
    if ((v230 & 0x800) != 0) {
      v5->_supportsTTYWithVoice = [v10 decodeBoolForKey:@"supportsTTYWithVoice"];
    }
    uint64_t v228 = [(CXCallUpdate *)v5 hasSet];
    int v229 = v146;
    if ((v228 & 0x4000000000000) != 0) {
      v5->_remoteUplinkMuted = [v10 decodeBoolForKey:@"remoteUplinkMuted"];
    }
    uint64_t v226 = [(CXCallUpdate *)v5 hasSet];
    int v227 = v147;
    if ((v226 & 0x8000000000000) != 0) {
      v5->_shouldSuppressInCallUI = [v10 decodeBoolForKey:@"shouldSuppressInCallUI"];
    }
    uint64_t v224 = [(CXCallUpdate *)v5 hasSet];
    int v225 = v148;
    if ((v224 & 0x10000000000000) != 0) {
      v5->_requiresAuthentication = [v10 decodeBoolForKey:@"requiresAuthentication"];
    }
    uint64_t v222 = [(CXCallUpdate *)v5 hasSet];
    int v223 = v149;
    if ((v222 & 0x20000000000000) != 0) {
      v5->_mutuallyExclusiveCall = [v10 decodeBoolForKey:@"mutuallyExclusiveCall"];
    }
    uint64_t v220 = [(CXCallUpdate *)v5 hasSet];
    int v221 = v150;
    if ((v220 & 0x40000000000000) != 0) {
      v5->_int64_t junkConfidence = [v10 decodeIntegerForKey:@"junkConfidence"];
    }
    uint64_t v218 = [(CXCallUpdate *)v5 hasSet];
    int v219 = v151;
    if ((v151 & 0x400) != 0) {
      v5->_int64_t callSubType = [v10 decodeIntegerForKey:@"callSubType"];
    }
    uint64_t v216 = [(CXCallUpdate *)v5 hasSet];
    int v217 = v152;
    if ((v216 & 0x80000000000000) != 0) {
      v5->_int64_t identificationCategory = [v10 decodeIntegerForKey:@"identificationCategory"];
    }
    uint64_t v214 = [(CXCallUpdate *)v5 hasSet];
    int v215 = v153;
    if ((v214 & 0x100000000000000) != 0) {
      v5->_conversation = [v10 decodeBoolForKey:@"conversation"];
    }
    uint64_t v212 = [(CXCallUpdate *)v5 hasSet];
    int v213 = v154;
    if ((v212 & 0x200000000000000) != 0) {
      v5->_mixesVoiceWithMedia = [v10 decodeBoolForKey:@"mixesVoiceWithMedia"];
    }
    uint64_t v210 = [(CXCallUpdate *)v5 hasSet];
    int v211 = v155;
    if ((v210 & 0x400000000000000) != 0) {
      v5->_prefersToPlayDuringWombat = [v10 decodeBoolForKey:@"prefersToPlayDuringWombat"];
    }
    uint64_t v208 = [(CXCallUpdate *)v5 hasSet];
    int v209 = v156;
    if ((v208 & 0x800000000000000) != 0) {
      v5->_mediaPlaybackOnExternalDevice = [v10 decodeBoolForKey:@"mediaPlaybackOnExternalDevice"];
    }
    uint64_t v206 = [(CXCallUpdate *)v5 hasSet];
    int v207 = v157;
    if (v206 < 0) {
      v5->_ignoresBluetoothDeviceUID = [v10 decodeBoolForKey:@"ignoresBluetoothDeviceUID"];
    }
    uint64_t v204 = [(CXCallUpdate *)v5 hasSet];
    int v205 = v158;
    if ((v204 & 0x2000000000000000) != 0) {
      v5->_sharingScreen = [v10 decodeBoolForKey:@"sharingScreen"];
    }
    uint64_t v202 = [(CXCallUpdate *)v5 hasSet];
    int v203 = v159;
    if (v159) {
      v5->_int64_t serviceStatus = [v10 decodeIntegerForKey:@"serviceStatus"];
    }
    uint64_t v200 = [(CXCallUpdate *)v5 hasSet];
    int v201 = v160;
    if ((v160 & 2) != 0) {
      v5->_int64_t transmissionMode = [v10 decodeIntegerForKey:@"transmissionMode"];
    }
    uint64_t v198 = [(CXCallUpdate *)v5 hasSet];
    int v199 = v161;
    if ((v161 & 4) != 0) {
      v5->_accessoryButtonEventsEnabled = [v10 decodeBoolForKey:@"accessoryButtonEventsEnabled"];
    }
    uint64_t v196 = [(CXCallUpdate *)v5 hasSet];
    int v197 = v162;
    if ((v162 & 8) != 0) {
      v5->_sendingVideo = [v10 decodeBoolForKey:@"sendingVideo"];
    }
    uint64_t v194 = [(CXCallUpdate *)v5 hasSet];
    int v195 = v163;
    if ((v163 & 0x100) != 0) {
      v5->_isReRing = [v10 decodeBoolForKey:@"isReRing"];
    }
    uint64_t v192 = [(CXCallUpdate *)v5 hasSet];
    int v193 = v164;
    if ((v164 & 0x200) != 0) {
      v5->_suppressRingtone = [v10 decodeBoolForKey:@"suppressRingtone"];
    }
    uint64_t v190 = [(CXCallUpdate *)v5 hasSet];
    int v191 = v165;
    if ((v165 & 0x10) != 0) {
      v5->_hasBeenRedirected = [v10 decodeBoolForKey:@"hasBeenRedirected"];
    }
    uint64_t v188 = [(CXCallUpdate *)v5 hasSet];
    int v189 = v166;
    if ((v166 & 0x20) != 0) {
      v5->_isKnownCaller = [v10 decodeBoolForKey:@"isKnownCaller"];
    }
    uint64_t v186 = [(CXCallUpdate *)v5 hasSet];
    int v187 = v167;
    if ((v167 & 0x40) != 0) {
      v5->_filteredOutReason = [v10 decodeIntegerForKey:@"filteredOutReason"];
    }
    uint64_t v184 = [(CXCallUpdate *)v5 hasSet];
    int v185 = v168;
    if ((v168 & 0x80) != 0)
    {
      v169 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v170 = objc_opt_class();
      uint64_t v171 = objc_opt_class();
      v172 = objc_msgSend(v169, "setWithObjects:", v170, v171, objc_opt_class(), 0);
      uint64_t v173 = [v10 decodeObjectOfClasses:v172 forKey:@"silencingUserInfo"];
      silencingUserInfo = v5->_silencingUserInfo;
      v5->_silencingUserInfo = (NSMutableDictionary *)v173;
    }
    uint64_t v182 = [(CXCallUpdate *)v5 hasSet];
    int v183 = v175;
    if ((v175 & 0x1000) != 0) {
      v5->_int64_t screenSharingIntention = [v10 decodeIntegerForKey:@"screenSharingIntention"];
    }
    v180[1] = [(CXCallUpdate *)v5 hasSet];
    int v181 = v176;
    if ((v176 & 0x2000) != 0) {
      v5->_int64_t screenSharingType = [v10 decodeIntegerForKey:@"screenSharingType"];
    }
  }
  v177 = v5;
LABEL_159:

  return v177;
}

- (void)encodeWithCoder:(id)a3
{
  id v45 = a3;
  id v4 = [(CXCallUpdate *)self UUID];
  id v5 = NSStringFromSelector(sel_UUID);
  [v45 encodeObject:v4 forKey:v5];

  uint64_t v6 = NSStringFromSelector(sel_hasSet);
  [v45 encodeBytes:&self->_hasSet length:12 forKey:v6];

  if ([(CXCallUpdate *)self hasSet])
  {
    objc_super v7 = [(CXCallUpdate *)self account];
    [v45 encodeObject:v7 forKey:@"account"];
  }
  if (([(CXCallUpdate *)self hasSet] & 2) != 0)
  {
    uint64_t v8 = [(CXCallUpdate *)self activeRemoteParticipant];
    [v45 encodeObject:v8 forKey:@"activeRemoteParticipant"];
  }
  if (([(CXCallUpdate *)self hasSet] & 4) != 0)
  {
    v9 = [(CXCallUpdate *)self remoteHandle];
    [v45 encodeObject:v9 forKey:@"remoteHandle"];
  }
  if (([(CXCallUpdate *)self hasSet] & 8) != 0)
  {
    id v10 = [(CXCallUpdate *)self localizedCallerName];
    [v45 encodeObject:v10 forKey:@"localizedCallerName"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10) != 0)
  {
    __int16 v11 = [(CXCallUpdate *)self localizedCallerImageURL];
    [v45 encodeObject:v11 forKey:@"localizedCallerImageURL"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isEmergency](self, "isEmergency"), @"emergency");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isFailureExpected](self, "isFailureExpected"), @"failureExpected");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsEmergencyFallback](self, "supportsEmergencyFallback"), @"supportsEmergencyFallback");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isUsingBaseband](self, "isUsingBaseband"), @"usingBaseband");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isBlocked](self, "isBlocked"), @"blocked");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate ttyType](self, "ttyType"), @"ttyType");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000000000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate bluetoothAudioFormat](self, "bluetoothAudioFormat"), @"bluetoothAudioFormat");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake"), @"mayRequireBreakBeforeMake");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate hasVideo](self, "hasVideo"), @"hasVideo");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000) != 0)
  {
    uint64_t v12 = [(CXCallUpdate *)self audioCategory];
    [v45 encodeObject:v12 forKey:@"audioCategory"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000) != 0)
  {
    uint64_t v13 = [(CXCallUpdate *)self audioMode];
    [v45 encodeObject:v13 forKey:@"audioMode"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate audioInterruptionProvider](self, "audioInterruptionProvider"), @"audioInterruptionProvider");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"), @"audioInterruptionOperationMode");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate verificationStatus](self, "verificationStatus"), @"verificationStatus");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate priority](self, "priority"), @"priority");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate requiresInCallSounds](self, "requiresInCallSounds"), @"requiresInCallSounds");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate inCallSoundRegion](self, "inCallSoundRegion"), @"inCallSoundRegion");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsHolding](self, "supportsHolding"), @"supportsHolding");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsGrouping](self, "supportsGrouping"), @"supportsGrouping");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsUngrouping](self, "supportsUngrouping"), @"supportsUngrouping");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsDTMF](self, "supportsDTMF"), @"supportsDTMF");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsDTMFUpdates](self, "supportsDTMFUpdates"), @"supportsDTMFUpdates");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"), @"supportsUnambiguousMultiPartyState");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsAddCall](self, "supportsAddCall"), @"supportsAddCall");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsSendingToVoicemail](self, "supportsSendingToVoicemail"), @"supportsSendingToVoicemail");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsRecording](self, "supportsRecording"), @"supportsRecording");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isUnderlyingLinksConnected](self, "isUnderlyingLinksConnected"), @"isUnderlyingLinksConnected");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v14 & 0x800) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsScreening](self, "supportsScreening"), @"supportsScreening");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate videoStreamToken](self, "videoStreamToken"), @"videoStreamToken");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000) != 0)
  {
    v15 = [(CXCallUpdate *)self callTokens];
    [v45 encodeObject:v15 forKey:@"callTokens"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000) != 0)
  {
    uint64_t v16 = [(CXCallUpdate *)self announceProviderIdentifier];
    [v45 encodeObject:v16 forKey:@"announceProviderIdentifier"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000) != 0)
  {
    v17 = [(CXCallUpdate *)self initiator];
    [v45 encodeObject:v17 forKey:@"initiator"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000) != 0)
  {
    int v18 = [(CXCallUpdate *)self crossDeviceIdentifier];
    [v45 encodeObject:v18 forKey:@"crossDeviceIdentifier"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000) != 0)
  {
    v19 = [(CXCallUpdate *)self ISOCountryCode];
    [v45 encodeObject:v19 forKey:@"ISOCountryCode"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000) != 0)
  {
    uint64_t v20 = [(CXCallUpdate *)self localSenderIdentityUUID];
    [v45 encodeObject:v20 forKey:@"localSenderIdentityUUID"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000000) != 0)
  {
    v21 = [(CXCallUpdate *)self localSenderIdentityAccountUUID];
    [v45 encodeObject:v21 forKey:@"localSenderIdentityAccountUUID"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000000) != 0)
  {
    int v22 = [(CXCallUpdate *)self localMemberHandleValue];
    [v45 encodeObject:v22 forKey:@"localMemberHandleValue"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000000) != 0)
  {
    v23 = [(CXCallUpdate *)self localSenderSubscriptionIdentifier];
    [v45 encodeObject:v23 forKey:@"localSenderSubscriptionIdentifier"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000000) != 0)
  {
    uint64_t v24 = [(CXCallUpdate *)self participantGroupUUID];
    [v45 encodeObject:v24 forKey:@"participantGroupUUID"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000000) != 0)
  {
    v25 = [(CXCallUpdate *)self remoteParticipantHandles];
    [v45 encodeObject:v25 forKey:@"remoteParticipantHandles"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000000) != 0)
  {
    int v26 = [(CXCallUpdate *)self otherInvitedHandles];
    [v45 encodeObject:v26 forKey:@"otherInvitedHandles"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000000) != 0)
  {
    v27 = [(CXCallUpdate *)self activeRemoteParticipantHandles];
    [v45 encodeObject:v27 forKey:@"activeRemoteParticipantHandles"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000000) != 0)
  {
    uint64_t v28 = [(CXCallUpdate *)self handoffContext];
    [v45 encodeObject:v28 forKey:@"handoffContext"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000000) != 0)
  {
    __int16 v29 = [(CXCallUpdate *)self screenShareAttributes];
    [v45 encodeObject:v29 forKey:@"screenShareAttributes"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x1000000000000) != 0)
  {
    int v30 = [(CXCallUpdate *)self context];
    [v45 encodeObject:v30 forKey:@"context"];
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate prefersExclusiveAccessToCellularNetwork](self, "prefersExclusiveAccessToCellularNetwork"), @"prefersExclusiveAccessToCellularNetwork");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate supportsTTYWithVoice](self, "supportsTTYWithVoice"), @"supportsTTYWithVoice");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x4000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isRemoteUplinkMuted](self, "isRemoteUplinkMuted"), @"remoteUplinkMuted");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x8000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate shouldSuppressInCallUI](self, "shouldSuppressInCallUI"), @"shouldSuppressInCallUI");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x10000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"), @"requiresAuthentication");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x20000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"), @"mutuallyExclusiveCall");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x40000000000000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate junkConfidence](self, "junkConfidence"), @"junkConfidence");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v31 & 0x400) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate callSubType](self, "callSubType"), @"callSubType");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x80000000000000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate identificationCategory](self, "identificationCategory"), @"identificationCategory");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x100000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isConversation](self, "isConversation"), @"conversation");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x200000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate mixesVoiceWithMedia](self, "mixesVoiceWithMedia"), @"mixesVoiceWithMedia");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x400000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"), @"prefersToPlayDuringWombat");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x800000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice"), @"mediaPlaybackOnExternalDevice");
  }
  if ([(CXCallUpdate *)self hasSet] < 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate ignoresBluetoothDeviceUID](self, "ignoresBluetoothDeviceUID"), @"ignoresBluetoothDeviceUID");
  }
  if (([(CXCallUpdate *)self hasSet] & 0x2000000000000000) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isSharingScreen](self, "isSharingScreen"), @"sharingScreen");
  }
  [(CXCallUpdate *)self hasSet];
  if (v32) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate serviceStatus](self, "serviceStatus"), @"serviceStatus");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v33 & 2) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate transmissionMode](self, "transmissionMode"), @"transmissionMode");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v34 & 4) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"), @"accessoryButtonEventsEnabled");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v35 & 8) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isSendingVideo](self, "isSendingVideo"), @"sendingVideo");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v36 & 0x100) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isReRing](self, "isReRing"), @"isReRing");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v37 & 0x200) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate suppressRingtone](self, "suppressRingtone"), @"suppressRingtone");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v38 & 0x10) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate hasBeenRedirected](self, "hasBeenRedirected"), @"hasBeenRedirected");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v39 & 0x20) != 0) {
    objc_msgSend(v45, "encodeBool:forKey:", -[CXCallUpdate isKnownCaller](self, "isKnownCaller"), @"isKnownCaller");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v40 & 0x40) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate filteredOutReason](self, "filteredOutReason"), @"filteredOutReason");
  }
  [(CXCallUpdate *)self hasSet];
  if ((v41 & 0x1000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate screenSharingIntention](self, "screenSharingIntention"), @"screenSharingIntention");
  }
  [(CXCallUpdate *)self hasSet];
  if (v42 < 0)
  {
    int v43 = [(CXCallUpdate *)self silencingUserInfo];
    [v45 encodeObject:v43 forKey:@"silencingUserInfo"];
  }
  [(CXCallUpdate *)self hasSet];
  if ((v44 & 0x2000) != 0) {
    objc_msgSend(v45, "encodeInteger:forKey:", -[CXCallUpdate screenSharingType](self, "screenSharingType"), @"screenSharingType");
  }
}

- (void)setSilencingUserInfo:(id)a3
{
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (BOOL)isFailureExpected
{
  return self->_failureExpected;
}

- (BOOL)isUsingBaseband
{
  return self->_usingBaseband;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (BOOL)isMutuallyExclusiveCall
{
  return self->_mutuallyExclusiveCall;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (CXCallUpdateHasSet)hasSet
{
  int v2 = *((_DWORD *)&self->_hasSet + 2);
  uint64_t hasSet = (uint64_t)self->_hasSet;
  return result;
}

- (void)setHasSet:(CXCallUpdateHasSet)a3
{
  self->_uint64_t hasSet = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_screenShareAttributes, 0);
  objc_storeStrong((id *)&self->_handoffContext, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_participantGroupUUID, 0);
  objc_storeStrong((id *)&self->_localSenderSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_localMemberHandleValue, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_crossDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_announceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_callTokens, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_localizedCallerName, 0);
  objc_storeStrong((id *)&self->_remoteHandle, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_silencingUserInfo, 0);

  objc_storeStrong((id *)&self->_localizedCallerImageURL, 0);
}

@end