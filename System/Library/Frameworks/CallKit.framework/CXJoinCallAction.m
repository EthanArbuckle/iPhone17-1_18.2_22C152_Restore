@interface CXJoinCallAction
+ (BOOL)supportsSecureCoding;
+ (double)timeout;
- (BOOL)isJoiningConversationWithLink;
- (BOOL)isLetMeIn;
- (BOOL)isRelay;
- (BOOL)isScreening;
- (BOOL)isUpgrade;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)shouldSendLegacyScreenSharingInvite;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)wantsStagingArea;
- (CXHandle)callerID;
- (CXJoinCallAction)initWithCallUUID:(id)a3 groupUUID:(id)a4;
- (CXJoinCallAction)initWithCoder:(id)a3;
- (CXJoinCallActivity)joinCallActivity;
- (NSData)publicKey;
- (NSDate)dateStarted;
- (NSDictionary)notificationStylesByHandleType;
- (NSNumber)associationIdentifier;
- (NSSet)otherInvitedHandles;
- (NSSet)remoteMembers;
- (NSSet)remotePushTokens;
- (NSString)associationAVCIdentifier;
- (NSString)collaborationIdentifier;
- (NSString)conversationProviderIdentifier;
- (NSString)messagesGroupName;
- (NSString)pseudonym;
- (NSUUID)groupUUID;
- (NSUUID)messagesGroupUUID;
- (NSUUID)upgradeSessionUUID;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (unint64_t)avMode;
- (unint64_t)presentationMode;
- (unint64_t)screenShareRequestType;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithDateStarted:(id)a3;
- (void)setAssociationAVCIdentifier:(id)a3;
- (void)setAssociationIdentifier:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setCallerID:(id)a3;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setConversationProviderIdentifier:(id)a3;
- (void)setDateStarted:(id)a3;
- (void)setGroupUUID:(id)a3;
- (void)setJoinCallActivity:(id)a3;
- (void)setJoiningConversationWithLink:(BOOL)a3;
- (void)setLetMeIn:(BOOL)a3;
- (void)setMessagesGroupName:(id)a3;
- (void)setMessagesGroupUUID:(id)a3;
- (void)setNotificationStylesByHandleType:(id)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setPseudonym:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setRelay:(BOOL)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setRemotePushTokens:(id)a3;
- (void)setScreenShareRequestType:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setShouldSendLegacyScreenSharingInvite:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setUpgrade:(BOOL)a3;
- (void)setUpgradeSessionUUID:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setWantsStagingArea:(BOOL)a3;
- (void)updateAsFulfilledWithDateStarted:(id)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXJoinCallAction

- (CXJoinCallAction)initWithCallUUID:(id)a3 groupUUID:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CXJoinCallAction;
  v8 = [(CXCallAction *)&v15 initWithCallUUID:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupUUID, a4);
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    remoteMembers = v9->_remoteMembers;
    v9->_remoteMembers = (NSSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    otherInvitedHandles = v9->_otherInvitedHandles;
    v9->_otherInvitedHandles = (NSSet *)v12;

    v9->_video = 1;
  }

  return v9;
}

- (id)customDescription
{
  v37.receiver = self;
  v37.super_class = (Class)CXJoinCallAction;
  v3 = [(CXCallAction *)&v37 customDescription];
  v4 = [(CXJoinCallAction *)self groupUUID];
  [v3 appendFormat:@" groupUUID=%@", v4];

  v5 = [(CXJoinCallAction *)self remoteMembers];
  [v3 appendFormat:@" remoteMembers=%@", v5];

  v6 = [(CXJoinCallAction *)self otherInvitedHandles];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [(CXJoinCallAction *)self otherInvitedHandles];
    [v3 appendFormat:@" otherInvitedHandles=%@", v8];
  }
  v9 = [(CXJoinCallAction *)self callerID];

  if (v9)
  {
    uint64_t v10 = [(CXJoinCallAction *)self callerID];
    [v3 appendFormat:@" callerID=%@", v10];
  }
  objc_msgSend(v3, "appendFormat:", @" videoEnabled=%d", -[CXJoinCallAction isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", @" uplinkMuted=%d", -[CXJoinCallAction isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", @" shouldSuppressInCallUI=%d", -[CXJoinCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  v11 = [(CXJoinCallAction *)self dateStarted];
  [v3 appendFormat:@" dateStarted=%@", v11];

  objc_msgSend(v3, "appendFormat:", @" wantsStagingArea=%d", -[CXJoinCallAction wantsStagingArea](self, "wantsStagingArea"));
  objc_msgSend(v3, "appendFormat:", @" isLetMeIn=%d", -[CXJoinCallAction isLetMeIn](self, "isLetMeIn"));
  objc_msgSend(v3, "appendFormat:", @" isJoiningConversationWithLink=%d", -[CXJoinCallAction isJoiningConversationWithLink](self, "isJoiningConversationWithLink"));
  uint64_t v12 = [(CXJoinCallAction *)self pseudonym];

  if (v12)
  {
    v13 = [(CXJoinCallAction *)self pseudonym];
    [v3 appendFormat:@" pseudonym=%@", v13];
  }
  v14 = [(CXJoinCallAction *)self publicKey];

  if (v14)
  {
    objc_super v15 = [(CXJoinCallAction *)self publicKey];
    [v3 appendFormat:@" publicKey=%@", v15];
  }
  objc_msgSend(v3, "appendFormat:", @" video=%d", -[CXJoinCallAction isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", @" relay=%d", -[CXJoinCallAction isRelay](self, "isRelay"));
  objc_msgSend(v3, "appendFormat:", @" screening=%d", -[CXJoinCallAction isScreening](self, "isScreening"));
  objc_msgSend(v3, "appendFormat:", @" upgrade=%d", -[CXJoinCallAction isUpgrade](self, "isUpgrade"));
  v16 = [(CXJoinCallAction *)self upgradeSessionUUID];
  [v3 appendFormat:@" upgradeSessionUUID=%@", v16];

  objc_msgSend(v3, "appendFormat:", @" avMode=%lu", -[CXJoinCallAction avMode](self, "avMode"));
  [(id)objc_opt_class() timeout];
  objc_msgSend(v3, "appendFormat:", @" timeout=%f", v17);
  objc_msgSend(v3, "appendFormat:", @" presentationMode=%lu", -[CXJoinCallAction presentationMode](self, "presentationMode"));
  objc_msgSend(v3, "appendFormat:", @" screenShareRequestType=%lu", -[CXJoinCallAction screenShareRequestType](self, "screenShareRequestType"));
  objc_msgSend(v3, "appendFormat:", @" shouldSendLegacyScreenSharingInvite=%d", -[CXJoinCallAction shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));
  v18 = [(CXJoinCallAction *)self messagesGroupUUID];

  if (v18)
  {
    v19 = [(CXJoinCallAction *)self messagesGroupUUID];
    [v3 appendFormat:@" messagesGroupUUID=%@", v19];
  }
  v20 = [(CXJoinCallAction *)self messagesGroupName];

  if (v20)
  {
    v21 = [(CXJoinCallAction *)self messagesGroupName];
    [v3 appendFormat:@" messagesGroupName=%@", v21];
  }
  v22 = [(CXJoinCallAction *)self remotePushTokens];

  if (v22)
  {
    v23 = [(CXJoinCallAction *)self remotePushTokens];
    [v3 appendFormat:@" remotePushTokens=%@", v23];
  }
  v24 = [(CXJoinCallAction *)self joinCallActivity];

  if (v24)
  {
    v25 = [(CXJoinCallAction *)self joinCallActivity];
    [v3 appendFormat:@" joinCallActivity=%@", v25];
  }
  v26 = [(CXJoinCallAction *)self conversationProviderIdentifier];

  if (v26)
  {
    v27 = [(CXJoinCallAction *)self conversationProviderIdentifier];
    [v3 appendFormat:@" conversationProviderIdentifier=%@", v27];
  }
  v28 = [(CXJoinCallAction *)self notificationStylesByHandleType];

  if (v28)
  {
    v29 = [(CXJoinCallAction *)self notificationStylesByHandleType];
    [v3 appendFormat:@" notificationStylesByHandleType=%@", v29];
  }
  v30 = [(CXJoinCallAction *)self associationIdentifier];

  if (v30)
  {
    v31 = [(CXJoinCallAction *)self associationIdentifier];
    [v3 appendFormat:@" associationIdentifier=%@", v31];
  }
  v32 = [(CXJoinCallAction *)self associationAVCIdentifier];

  if (v32)
  {
    v33 = [(CXJoinCallAction *)self associationAVCIdentifier];
    [v3 appendFormat:@" associationAVCIdentifier=%@", v33];
  }
  v34 = [(CXJoinCallAction *)self collaborationIdentifier];

  if (v34)
  {
    v35 = [(CXJoinCallAction *)self collaborationIdentifier];
    [v3 appendFormat:@" collaborationIdentifier=%@", v35];
  }

  return v3;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXJoinCallAction *)self fulfillWithDateStarted:v3];
}

- (void)fulfillWithDateStarted:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXJoinCallAction fulfillWithDateStarted:]", @"dateStarted" format];
  }
  v4 = (void *)[(CXJoinCallAction *)self copy];
  [v4 updateAsFulfilledWithDateStarted:v6];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (void)updateAsFulfilledWithDateStarted:(id)a3
{
  id v4 = a3;
  [(CXAction *)self updateAsFulfilled];
  [(CXJoinCallAction *)self setDateStarted:v4];
}

+ (double)timeout
{
  v2 = [MEMORY[0x1E4F61768] sharedInstance];
  id v3 = [v2 objectForKey:@"join-call-action-timeout"];

  if (v3) {
    double v4 = (double)(unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    double v4 = 15.0;
  }

  return v4;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v24.receiver = self;
  v24.super_class = (Class)CXJoinCallAction;
  id v6 = a3;
  [(CXAction *)&v24 updateCopy:v6 withZone:a4];
  uint64_t v7 = [(CXJoinCallAction *)self groupUUID];
  [v6 setGroupUUID:v7];

  v8 = [(CXJoinCallAction *)self remoteMembers];
  [v6 setRemoteMembers:v8];

  v9 = [(CXJoinCallAction *)self otherInvitedHandles];
  [v6 setOtherInvitedHandles:v9];

  uint64_t v10 = [(CXJoinCallAction *)self callerID];
  [v6 setCallerID:v10];

  objc_msgSend(v6, "setVideoEnabled:", -[CXJoinCallAction isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v6, "setUplinkMuted:", -[CXJoinCallAction isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v6, "setShouldSuppressInCallUI:", -[CXJoinCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v6, "setWantsStagingArea:", -[CXJoinCallAction wantsStagingArea](self, "wantsStagingArea"));
  objc_msgSend(v6, "setLetMeIn:", -[CXJoinCallAction isLetMeIn](self, "isLetMeIn"));
  objc_msgSend(v6, "setJoiningConversationWithLink:", -[CXJoinCallAction isJoiningConversationWithLink](self, "isJoiningConversationWithLink"));
  v11 = [(CXJoinCallAction *)self pseudonym];
  [v6 setPseudonym:v11];

  uint64_t v12 = [(CXJoinCallAction *)self publicKey];
  [v6 setPublicKey:v12];

  objc_msgSend(v6, "setVideo:", -[CXJoinCallAction isVideo](self, "isVideo"));
  objc_msgSend(v6, "setUpgrade:", -[CXJoinCallAction isUpgrade](self, "isUpgrade"));
  v13 = [(CXJoinCallAction *)self messagesGroupUUID];
  [v6 setMessagesGroupUUID:v13];

  v14 = [(CXJoinCallAction *)self messagesGroupName];
  [v6 setMessagesGroupName:v14];

  objc_super v15 = [(CXJoinCallAction *)self dateStarted];
  [v6 setDateStarted:v15];

  v16 = [(CXJoinCallAction *)self upgradeSessionUUID];
  [v6 setUpgradeSessionUUID:v16];

  uint64_t v17 = [(CXJoinCallAction *)self remotePushTokens];
  [v6 setRemotePushTokens:v17];

  v18 = [(CXJoinCallAction *)self joinCallActivity];
  [v6 setJoinCallActivity:v18];

  v19 = [(CXJoinCallAction *)self conversationProviderIdentifier];
  [v6 setConversationProviderIdentifier:v19];

  v20 = [(CXJoinCallAction *)self notificationStylesByHandleType];
  [v6 setNotificationStylesByHandleType:v20];

  objc_msgSend(v6, "setAvMode:", -[CXJoinCallAction avMode](self, "avMode"));
  objc_msgSend(v6, "setPresentationMode:", -[CXJoinCallAction presentationMode](self, "presentationMode"));
  v21 = [(CXJoinCallAction *)self associationIdentifier];
  [v6 setAssociationIdentifier:v21];

  v22 = [(CXJoinCallAction *)self associationAVCIdentifier];
  [v6 setAssociationAVCIdentifier:v22];

  v23 = [(CXJoinCallAction *)self collaborationIdentifier];
  [v6 setCollaborationIdentifier:v23];

  objc_msgSend(v6, "setRelay:", -[CXJoinCallAction isRelay](self, "isRelay"));
  objc_msgSend(v6, "setScreenShareRequestType:", -[CXJoinCallAction screenShareRequestType](self, "screenShareRequestType"));
  objc_msgSend(v6, "setShouldSendLegacyScreenSharingInvite:", -[CXJoinCallAction shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXJoinCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)CXJoinCallAction;
  v5 = [(CXCallAction *)&v93 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_groupUUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    groupUUID = v5->_groupUUID;
    v5->_groupUUID = (NSUUID *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = NSStringFromSelector(sel_remoteMembers);
    uint64_t v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];
    remoteMembers = v5->_remoteMembers;
    v5->_remoteMembers = (NSSet *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v19 = NSStringFromSelector(sel_otherInvitedHandles);
    uint64_t v20 = [v4 decodeObjectOfClasses:v18 forKey:v19];
    otherInvitedHandles = v5->_otherInvitedHandles;
    v5->_otherInvitedHandles = (NSSet *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_callerID);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    callerID = v5->_callerID;
    v5->_callerID = (CXHandle *)v24;

    v26 = NSStringFromSelector(sel_isVideoEnabled);
    v5->_videoEnabled = [v4 decodeBoolForKey:v26];

    v27 = NSStringFromSelector(sel_isUplinkMuted);
    v5->_uplinkMuted = [v4 decodeBoolForKey:v27];

    v28 = NSStringFromSelector(sel_shouldSuppressInCallUI);
    v5->_shouldSuppressInCallUI = [v4 decodeBoolForKey:v28];

    v29 = NSStringFromSelector(sel_wantsStagingArea);
    v5->_wantsStagingArea = [v4 decodeBoolForKey:v29];

    v30 = NSStringFromSelector(sel_isLetMeIn);
    v5->_letMeIn = [v4 decodeBoolForKey:v30];

    v31 = NSStringFromSelector(sel_isJoiningConversationWithLink);
    v5->_joiningConversationWithLink = [v4 decodeBoolForKey:v31];

    v32 = NSStringFromSelector(sel_pseudonym);
    uint64_t v33 = [v4 decodeObjectForKey:v32];
    pseudonym = v5->_pseudonym;
    v5->_pseudonym = (NSString *)v33;

    v35 = NSStringFromSelector(sel_publicKey);
    uint64_t v36 = [v4 decodeObjectForKey:v35];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v36;

    v38 = NSStringFromSelector(sel_isVideo);
    v5->_video = [v4 decodeBoolForKey:v38];

    v39 = NSStringFromSelector(sel_isUpgrade);
    v5->_upgrade = [v4 decodeBoolForKey:v39];

    v40 = NSStringFromSelector(sel_isRelay);
    v5->_relay = [v4 decodeBoolForKey:v40];

    v41 = NSStringFromSelector(sel_messagesGroupUUID);
    uint64_t v42 = [v4 decodeObjectForKey:v41];
    messagesGroupUUID = v5->_messagesGroupUUID;
    v5->_messagesGroupUUID = (NSUUID *)v42;

    v44 = NSStringFromSelector(sel_messagesGroupName);
    uint64_t v45 = [v4 decodeObjectForKey:v44];
    messagesGroupName = v5->_messagesGroupName;
    v5->_messagesGroupName = (NSString *)v45;

    uint64_t v47 = objc_opt_class();
    v48 = NSStringFromSelector(sel_dateStarted);
    uint64_t v49 = [v4 decodeObjectOfClass:v47 forKey:v48];
    dateStarted = v5->_dateStarted;
    v5->_dateStarted = (NSDate *)v49;

    uint64_t v51 = objc_opt_class();
    v52 = NSStringFromSelector(sel_upgradeSessionUUID);
    uint64_t v53 = [v4 decodeObjectOfClass:v51 forKey:v52];
    upgradeSessionUUID = v5->_upgradeSessionUUID;
    v5->_upgradeSessionUUID = (NSUUID *)v53;

    v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    v58 = NSStringFromSelector(sel_remotePushTokens);
    uint64_t v59 = [v4 decodeObjectOfClasses:v57 forKey:v58];
    remotePushTokens = v5->_remotePushTokens;
    v5->_remotePushTokens = (NSSet *)v59;

    uint64_t v61 = objc_opt_class();
    v62 = NSStringFromSelector(sel_joinCallActivity);
    uint64_t v63 = [v4 decodeObjectOfClass:v61 forKey:v62];
    joinCallActivity = v5->_joinCallActivity;
    v5->_joinCallActivity = (CXJoinCallActivity *)v63;

    uint64_t v65 = objc_opt_class();
    v66 = NSStringFromSelector(sel_conversationProviderIdentifier);
    uint64_t v67 = [v4 decodeObjectOfClass:v65 forKey:v66];
    conversationProviderIdentifier = v5->_conversationProviderIdentifier;
    v5->_conversationProviderIdentifier = (NSString *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    v71 = objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v72 = NSStringFromSelector(sel_notificationStylesByHandleType);
    uint64_t v73 = [v4 decodeObjectOfClasses:v71 forKey:v72];
    notificationStylesByHandleType = v5->_notificationStylesByHandleType;
    v5->_notificationStylesByHandleType = (NSDictionary *)v73;

    v75 = NSStringFromSelector(sel_avMode);
    v5->_avMode = [v4 decodeIntegerForKey:v75];

    v76 = NSStringFromSelector(sel_presentationMode);
    v5->_presentationMode = [v4 decodeIntegerForKey:v76];

    uint64_t v77 = objc_opt_class();
    v78 = NSStringFromSelector(sel_associationIdentifier);
    uint64_t v79 = [v4 decodeObjectOfClass:v77 forKey:v78];
    associationIdentifier = v5->_associationIdentifier;
    v5->_associationIdentifier = (NSNumber *)v79;

    uint64_t v81 = objc_opt_class();
    v82 = NSStringFromSelector(sel_associationAVCIdentifier);
    uint64_t v83 = [v4 decodeObjectOfClass:v81 forKey:v82];
    associationAVCIdentifier = v5->_associationAVCIdentifier;
    v5->_associationAVCIdentifier = (NSString *)v83;

    uint64_t v85 = objc_opt_class();
    v86 = NSStringFromSelector(sel_collaborationIdentifier);
    uint64_t v87 = [v4 decodeObjectOfClass:v85 forKey:v86];
    collaborationIdentifier = v5->_collaborationIdentifier;
    v5->_collaborationIdentifier = (NSString *)v87;

    v89 = NSStringFromSelector(sel_isRelay);
    v5->_relay = [v4 decodeBoolForKey:v89];

    v90 = NSStringFromSelector(sel_screenShareRequestType);
    v5->_screenShareRequestType = [v4 decodeIntegerForKey:v90];

    v91 = NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
    v5->_shouldSendLegacyScreenSharingInvite = [v4 decodeBoolForKey:v91];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v65.receiver = self;
  v65.super_class = (Class)CXJoinCallAction;
  id v4 = a3;
  [(CXCallAction *)&v65 encodeWithCoder:v4];
  v5 = [(CXJoinCallAction *)self groupUUID];
  uint64_t v6 = NSStringFromSelector(sel_groupUUID);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(CXJoinCallAction *)self remoteMembers];
  uint64_t v8 = NSStringFromSelector(sel_remoteMembers);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(CXJoinCallAction *)self otherInvitedHandles];
  uint64_t v10 = NSStringFromSelector(sel_otherInvitedHandles);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(CXJoinCallAction *)self callerID];
  uint64_t v12 = NSStringFromSelector(sel_callerID);
  [v4 encodeObject:v11 forKey:v12];

  BOOL v13 = [(CXJoinCallAction *)self isVideoEnabled];
  uint64_t v14 = NSStringFromSelector(sel_isVideoEnabled);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(CXJoinCallAction *)self isUplinkMuted];
  v16 = NSStringFromSelector(sel_isUplinkMuted);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(CXJoinCallAction *)self shouldSuppressInCallUI];
  v18 = NSStringFromSelector(sel_shouldSuppressInCallUI);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(CXJoinCallAction *)self wantsStagingArea];
  uint64_t v20 = NSStringFromSelector(sel_wantsStagingArea);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(CXJoinCallAction *)self isVideo];
  uint64_t v22 = NSStringFromSelector(sel_isVideo);
  [v4 encodeBool:v21 forKey:v22];

  BOOL v23 = [(CXJoinCallAction *)self isUpgrade];
  uint64_t v24 = NSStringFromSelector(sel_isUpgrade);
  [v4 encodeBool:v23 forKey:v24];

  BOOL v25 = [(CXJoinCallAction *)self isLetMeIn];
  v26 = NSStringFromSelector(sel_isLetMeIn);
  [v4 encodeBool:v25 forKey:v26];

  BOOL v27 = [(CXJoinCallAction *)self isJoiningConversationWithLink];
  v28 = NSStringFromSelector(sel_isJoiningConversationWithLink);
  [v4 encodeBool:v27 forKey:v28];

  v29 = [(CXJoinCallAction *)self pseudonym];
  v30 = NSStringFromSelector(sel_pseudonym);
  [v4 encodeObject:v29 forKey:v30];

  v31 = [(CXJoinCallAction *)self publicKey];
  v32 = NSStringFromSelector(sel_publicKey);
  [v4 encodeObject:v31 forKey:v32];

  uint64_t v33 = [(CXJoinCallAction *)self messagesGroupUUID];
  v34 = NSStringFromSelector(sel_messagesGroupUUID);
  [v4 encodeObject:v33 forKey:v34];

  v35 = [(CXJoinCallAction *)self messagesGroupName];
  uint64_t v36 = NSStringFromSelector(sel_messagesGroupName);
  [v4 encodeObject:v35 forKey:v36];

  objc_super v37 = [(CXJoinCallAction *)self dateStarted];
  v38 = NSStringFromSelector(sel_dateStarted);
  [v4 encodeObject:v37 forKey:v38];

  v39 = [(CXJoinCallAction *)self upgradeSessionUUID];
  v40 = NSStringFromSelector(sel_upgradeSessionUUID);
  [v4 encodeObject:v39 forKey:v40];

  v41 = [(CXJoinCallAction *)self remotePushTokens];
  uint64_t v42 = NSStringFromSelector(sel_remotePushTokens);
  [v4 encodeObject:v41 forKey:v42];

  v43 = [(CXJoinCallAction *)self joinCallActivity];
  v44 = NSStringFromSelector(sel_joinCallActivity);
  [v4 encodeObject:v43 forKey:v44];

  uint64_t v45 = [(CXJoinCallAction *)self conversationProviderIdentifier];
  v46 = NSStringFromSelector(sel_conversationProviderIdentifier);
  [v4 encodeObject:v45 forKey:v46];

  uint64_t v47 = [(CXJoinCallAction *)self notificationStylesByHandleType];
  v48 = NSStringFromSelector(sel_notificationStylesByHandleType);
  [v4 encodeObject:v47 forKey:v48];

  unint64_t v49 = [(CXJoinCallAction *)self avMode];
  v50 = NSStringFromSelector(sel_avMode);
  [v4 encodeInteger:v49 forKey:v50];

  unint64_t v51 = [(CXJoinCallAction *)self presentationMode];
  v52 = NSStringFromSelector(sel_presentationMode);
  [v4 encodeInteger:v51 forKey:v52];

  uint64_t v53 = [(CXJoinCallAction *)self associationIdentifier];
  v54 = NSStringFromSelector(sel_associationIdentifier);
  [v4 encodeObject:v53 forKey:v54];

  v55 = [(CXJoinCallAction *)self associationAVCIdentifier];
  uint64_t v56 = NSStringFromSelector(sel_associationAVCIdentifier);
  [v4 encodeObject:v55 forKey:v56];

  v57 = [(CXJoinCallAction *)self collaborationIdentifier];
  v58 = NSStringFromSelector(sel_collaborationIdentifier);
  [v4 encodeObject:v57 forKey:v58];

  BOOL v59 = [(CXJoinCallAction *)self isRelay];
  v60 = NSStringFromSelector(sel_isRelay);
  [v4 encodeBool:v59 forKey:v60];

  unint64_t v61 = [(CXJoinCallAction *)self screenShareRequestType];
  v62 = NSStringFromSelector(sel_screenShareRequestType);
  [v4 encodeInteger:v61 forKey:v62];

  BOOL v63 = [(CXJoinCallAction *)self shouldSendLegacyScreenSharingInvite];
  v64 = NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
  [v4 encodeBool:v63 forKey:v64];
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
}

- (NSSet)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
}

- (CXHandle)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(id)a3
{
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_uplinkMuted = a3;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (BOOL)isLetMeIn
{
  return self->_letMeIn;
}

- (void)setLetMeIn:(BOOL)a3
{
  self->_letMeIn = a3;
}

- (BOOL)isJoiningConversationWithLink
{
  return self->_joiningConversationWithLink;
}

- (void)setJoiningConversationWithLink:(BOOL)a3
{
  self->_joiningConversationWithLink = a3;
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isUpgrade
{
  return self->_upgrade;
}

- (void)setUpgrade:(BOOL)a3
{
  self->_upgrade = a3;
}

- (NSUUID)upgradeSessionUUID
{
  return self->_upgradeSessionUUID;
}

- (void)setUpgradeSessionUUID:(id)a3
{
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
}

- (NSDate)dateStarted
{
  return self->_dateStarted;
}

- (void)setDateStarted:(id)a3
{
}

- (NSSet)remotePushTokens
{
  return self->_remotePushTokens;
}

- (void)setRemotePushTokens:(id)a3
{
}

- (CXJoinCallActivity)joinCallActivity
{
  return self->_joinCallActivity;
}

- (void)setJoinCallActivity:(id)a3
{
}

- (BOOL)isRelay
{
  return self->_relay;
}

- (void)setRelay:(BOOL)a3
{
  self->_relay = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (NSString)conversationProviderIdentifier
{
  return self->_conversationProviderIdentifier;
}

- (void)setConversationProviderIdentifier:(id)a3
{
}

- (NSDictionary)notificationStylesByHandleType
{
  return self->_notificationStylesByHandleType;
}

- (void)setNotificationStylesByHandleType:(id)a3
{
}

- (NSNumber)associationIdentifier
{
  return self->_associationIdentifier;
}

- (void)setAssociationIdentifier:(id)a3
{
}

- (NSString)associationAVCIdentifier
{
  return self->_associationAVCIdentifier;
}

- (void)setAssociationAVCIdentifier:(id)a3
{
}

- (unint64_t)screenShareRequestType
{
  return self->_screenShareRequestType;
}

- (void)setScreenShareRequestType:(unint64_t)a3
{
  self->_screenShareRequestType = a3;
}

- (BOOL)shouldSendLegacyScreenSharingInvite
{
  return self->_shouldSendLegacyScreenSharingInvite;
}

- (void)setShouldSendLegacyScreenSharingInvite:(BOOL)a3
{
  self->_shouldSendLegacyScreenSharingInvite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationAVCIdentifier, 0);
  objc_storeStrong((id *)&self->_associationIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationStylesByHandleType, 0);
  objc_storeStrong((id *)&self->_conversationProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_joinCallActivity, 0);
  objc_storeStrong((id *)&self->_remotePushTokens, 0);
  objc_storeStrong((id *)&self->_dateStarted, 0);
  objc_storeStrong((id *)&self->_messagesGroupName, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUID, 0);
  objc_storeStrong((id *)&self->_upgradeSessionUUID, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);

  objc_storeStrong((id *)&self->_groupUUID, 0);
}

@end