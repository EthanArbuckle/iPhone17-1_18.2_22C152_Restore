@interface IMAVChat
+ (double)defaultConnectionTimeoutTime;
+ (double)defaultInvitationTimeoutTime;
+ (id)_acceptedChats;
+ (id)_activeChat;
+ (id)_avChatArray;
+ (id)_avChatConnectingFromIMHandle:(id)a3;
+ (id)_avChatInvitedByIMHandle:(id)a3 orConferenceID:(id)a4;
+ (id)_avChatWaitingForReplyFromIMHandle:(id)a3 orConferenceID:(id)a4;
+ (id)_avChatWithConferenceID:(id)a3;
+ (id)_avChatWithGUID:(id)a3;
+ (id)_avChatWithMatchingIMHandles:(id)a3 video:(BOOL)a4;
+ (id)_bestGuessAVChatWithIMHandle:(id)a3 conferenceID:(id)a4 sessionID:(unsigned int)a5 properties:(id)a6;
+ (id)_chatList;
+ (id)_chatListLock;
+ (id)_chatWithSessionID:(unsigned int)a3;
+ (id)_chatsWithIMAVChatState:(unsigned int)a3;
+ (id)_connectedChat;
+ (id)_connectedChats;
+ (id)_connectingChats;
+ (id)_imHandleFromProxyRepresentation:(id)a3;
+ (id)_incomingInvitations;
+ (id)_nonFinalChat;
+ (id)_outgoingInvitations;
+ (id)_proxyRepresentationForIMHandle:(id)a3;
+ (id)acceptedChats;
+ (id)activeChat;
+ (id)avChatWithGUID:(id)a3;
+ (id)chatList;
+ (id)chatsWithIMAVChatState:(unsigned int)a3;
+ (id)connectedChat;
+ (id)connectedChats;
+ (id)connectingChats;
+ (id)incomingInvitations;
+ (id)nonFinalChat;
+ (id)outgoingInvitations;
+ (int)systemSupportsNewOutgoingConferenceTo:(id)a3 isVideo:(BOOL)a4;
+ (void)setDefaultConnectionTimeoutTime:(double)a3;
+ (void)setDefaultInvitationTimeoutTime:(double)a3;
- (BOOL)_allParticipantsUsingICE;
- (BOOL)_cachedBoolForKey:(id)a3;
- (BOOL)_connectionStarted;
- (BOOL)_hasCachedBoolForKey:(id)a3;
- (BOOL)_isAudioInterrupted;
- (BOOL)_isCallUpgradeTo:(id)a3;
- (BOOL)_isProxy;
- (BOOL)_isVideoInterrupted;
- (BOOL)_isVideoUpgradeTo:(id)a3;
- (BOOL)_moveVCPartyID:(id)a3 toIndex:(unsigned int)a4 inCount:(unsigned int)a5;
- (BOOL)_needsAudioRestart;
- (BOOL)_needsVideoRestart;
- (BOOL)_participantsCheckOut;
- (BOOL)_processVCResponseDict:(id)a3;
- (BOOL)_usesRelay;
- (BOOL)airplaneModeEnabled;
- (BOOL)didRemoteMute;
- (BOOL)didRemotePause;
- (BOOL)hasReceivedFirstFrame;
- (BOOL)isActive;
- (BOOL)isCaller;
- (BOOL)isConferenceSilent;
- (BOOL)isMute;
- (BOOL)isPaused;
- (BOOL)isRelayed;
- (BOOL)isRemoteMute;
- (BOOL)isSendingAudio;
- (BOOL)isSendingVideo;
- (BOOL)isStateFinal;
- (BOOL)isTerminating;
- (BOOL)isUsingWifi;
- (BOOL)isVideo;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)metadataFinalized;
- (BOOL)startPreviewWithError:(id *)a3;
- (BOOL)stopPreview;
- (CGSize)landscapeAspectRatios;
- (CGSize)localAspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4;
- (CGSize)portraitAspectRatios;
- (IMAVChatParticipant)initiatorParticipant;
- (IMAVChatParticipant)localParticipant;
- (IMAccount)account;
- (IMHandle)initiatorIMHandle;
- (IMHandle)otherIMHandle;
- (NSArray)_imHandles;
- (NSArray)participants;
- (NSArray)remoteParticipants;
- (NSData)_relayRemotePrimaryIdentifier;
- (NSDate)_interruptionBegan;
- (NSDate)dateConnected;
- (NSDate)dateCreated;
- (NSDate)dateEnded;
- (NSDate)inviteTimeoutTimerStart;
- (NSDictionary)_extraServerContext;
- (NSDictionary)_pingTestResults;
- (NSDictionary)callerProperties;
- (NSNumber)_backCameraCaptureTime;
- (NSNumber)_callDuration;
- (NSNumber)_connectDuration;
- (NSNumber)_currentNatType;
- (NSNumber)_frontCameraCaptureTime;
- (NSNumber)_natType;
- (NSNumber)_relayConnectDuration;
- (NSNumber)_remoteNatType;
- (NSNumber)dataDownloaded;
- (NSNumber)dataRate;
- (NSNumber)dataUploaded;
- (NSString)GUID;
- (NSString)_callStatisticsGUID;
- (NSString)conferenceID;
- (NSTimer)connectionTimeoutTimer;
- (NSTimer)firstFrameTimeoutTimer;
- (NSTimer)inviteTimeoutTimer;
- (OS_dispatch_queue)_conferenceQueue;
- (double)connectionTimeoutTime;
- (double)invitationTimeoutTime;
- (id)_conferenceController;
- (id)_initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5 GUID:(id)a6;
- (id)_initWith:(id)a3 invitedBy:(id)a4 sessionID:(unsigned int)a5 GUID:(id)a6 video:(BOOL)a7 extraProperties:(id)a8;
- (id)_initWith:(id)a3 invitedBy:(id)a4 sessionID:(unsigned int)a5 isRelayed:(BOOL)a6 GUID:(id)a7 video:(BOOL)a8 extraProperties:(id)a9;
- (id)_participantMatchingVCPartyID:(id)a3;
- (id)_proxyRepresentation;
- (id)_proxyRepresentationForIMAVChatParticipant:(id)a3;
- (id)_timings;
- (id)description;
- (id)initIncomingFrom:(id)a3 isVideo:(BOOL)a4 callerProperties:(id)a5;
- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4;
- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5;
- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5 GUID:(id)a6;
- (id)inviteesInfo;
- (id)participantMatchingIMHandle:(id)a3;
- (id)participantWithAVConferenceCallID:(int64_t)a3;
- (id)participantWithID:(id)a3;
- (id)vcPartyIDForIMHandle:(id)a3;
- (int)_connectionType;
- (int)endedError;
- (int64_t)_bustedCallID;
- (int64_t)_networkCheckResult;
- (int64_t)_pingTestResult;
- (unint64_t)_localNetworkConnectionType;
- (unint64_t)_remoteNetworkConnectionType;
- (unsigned)cameraOrientation;
- (unsigned)cameraType;
- (unsigned)endedReason;
- (unsigned)sessionID;
- (unsigned)state;
- (void)__responseToVCInvite:(id)a3;
- (void)__sendEndCallMetricToAWDWithReason:(unsigned int)a3 andError:(int)a4;
- (void)__sendEndCallMetricToViceroyWithReason:(unsigned int)a3 andError:(int)a4;
- (void)_airplaneModeChanged:(id)a3;
- (void)_cacheBool:(BOOL)a3 forKey:(id)a4;
- (void)_cancelInvitationWithReason:(unsigned int)a3 error:(int)a4;
- (void)_clearCache;
- (void)_clearConnectionTimeoutTimer;
- (void)_clearFirstFrameTimeoutTimer;
- (void)_clearInvitationTimeoutTimer;
- (void)_conferenceOtherParticipant:(id)a3 didConnect:(BOOL)a4;
- (void)_connectionTimeout:(id)a3;
- (void)_endChatWithReason:(unsigned int)a3 andError:(int)a4;
- (void)_entitlementsChanged:(id)a3;
- (void)_firstFrameTimeout:(id)a3;
- (void)_handleAVError:(id)a3;
- (void)_handleGenericAVMessageFromParticipant:(id)a3 type:(unsigned int)a4 userInfo:(id)a5 handled:(BOOL)a6;
- (void)_handleRelayCancel:(id)a3 fromParticipant:(id)a4;
- (void)_handleRelayInitate:(id)a3 fromParticipant:(id)a4;
- (void)_handleRelayUpdate:(id)a3 fromParticipant:(id)a4;
- (void)_initParticipantsWithIMHandles:(id)a3;
- (void)_insertRemoteParticipant:(id)a3 atIndex:(unint64_t)a4;
- (void)_invitationTimeout:(id)a3;
- (void)_noteFirstFrame;
- (void)_peerID:(id)a3 changedTo:(id)a4;
- (void)_postNotificationName:(id)a3 participant:(id)a4 userInfo:(id)a5;
- (void)_postNotificationName:(id)a3 userInfo:(id)a4;
- (void)_postParticipantMediaChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 cameraWillSwitch:(BOOL)a7 camera:(unsigned int)a8 orientation:(unsigned int)a9 aspect:(CGSize)a10;
- (void)_postStateToDelegateIfNecessary;
- (void)_reduceInvitationTimeoutTime;
- (void)_responseToVCInvite:(id)a3;
- (void)_resumeAudioState;
- (void)_resumeVideoState;
- (void)_saveAudioRestartState;
- (void)_saveVideoRestartState;
- (void)_setActiveConference;
- (void)_setAirplaneModeEnabled:(BOOL)a3;
- (void)_setBackCameraCaptureTime:(id)a3;
- (void)_setCallStatisticsGUID:(id)a3;
- (void)_setCallerProperties:(id)a3;
- (void)_setConferenceController:(id)a3;
- (void)_setConferenceID:(id)a3;
- (void)_setConnectionStarted:(BOOL)a3;
- (void)_setConnectionTimeoutTimer;
- (void)_setConnectionTimeoutTimer:(id)a3;
- (void)_setConnectionType:(int)a3;
- (void)_setCreationDate;
- (void)_setDateConnected;
- (void)_setDidRemoteMute:(BOOL)a3;
- (void)_setDidRemotePause:(BOOL)a3;
- (void)_setFirstFrameTimeoutTimer;
- (void)_setFirstFrameTimeoutTimer:(id)a3;
- (void)_setFrontCameraCaptureTime:(id)a3;
- (void)_setGUID:(id)a3;
- (void)_setInterruptionBegan:(id)a3;
- (void)_setInvitationTimeoutTimer;
- (void)_setInviteTimeoutTimer:(id)a3;
- (void)_setInviteTimeoutTimerStart:(id)a3;
- (void)_setIsAudioInterrupted:(BOOL)a3;
- (void)_setIsVideoInterrupted:(BOOL)a3;
- (void)_setLandscapeAspectRatios:(CGSize)a3;
- (void)_setLocalNetworkConnectionType:(unint64_t)a3;
- (void)_setMetadataFinalized:(BOOL)a3;
- (void)_setNatType:(id)a3;
- (void)_setNeedsAudioRestart:(BOOL)a3;
- (void)_setNeedsVideoRestart:(BOOL)a3;
- (void)_setNetworkCheckResult:(int64_t)a3;
- (void)_setPingTestResult:(int64_t)a3;
- (void)_setPingTestResults:(id)a3;
- (void)_setPortraitAspectRatios:(CGSize)a3;
- (void)_setRelayRemotePrimaryIdentifier:(id)a3;
- (void)_setRemoteNetworkConnectionType:(unint64_t)a3;
- (void)_setStateDisconnected;
- (void)_setTerminating:(BOOL)a3;
- (void)_submitCallConnectedLogging;
- (void)_submitCallEndedLoggingWithReason:(unsigned int)a3 andError:(int)a4;
- (void)_submitCallInterruptionBeganLogging;
- (void)_submitCallInterruptionEndedLogging;
- (void)_submitCallStartedLoggingWithRecipientID:(id)a3 isCaller:(BOOL)a4 isVideo:(BOOL)a5;
- (void)_updateIMHandleInBuddyList:(id)a3;
- (void)_vccInitDidFinish:(id)a3;
- (void)acceptInvitation;
- (void)beginChat;
- (void)cancelInvitation;
- (void)conferenceAVConferenceCallID:(int64_t)a3 didConnect:(BOOL)a4;
- (void)conferenceDidPauseAudioWithCallID:(int64_t)a3 didPauseAudio:(BOOL)a4;
- (void)conferenceDidStopWithCallID:(int64_t)a3 error:(id)a4;
- (void)conferencePersonWithID:(id)a3 didDegrade:(BOOL)a4;
- (void)conferencePersonWithID:(id)a3 didMute:(BOOL)a4;
- (void)conferencePersonWithID:(id)a3 didPause:(BOOL)a4;
- (void)conferencePersonWithID:(id)a3 localIPDidChange:(id)a4;
- (void)conferencePersonWithID:(id)a3 mediaDidStall:(BOOL)a4;
- (void)conferencePersonWithID:(id)a3 sendRelayCancel:(id)a4;
- (void)conferencePersonWithID:(id)a3 sendRelayRequest:(id)a4;
- (void)conferencePersonWithID:(id)a3 sendRelayUpdate:(id)a4;
- (void)dealloc;
- (void)declineInvitation;
- (void)declineInvitationWithResponse:(unsigned int)a3;
- (void)endChat;
- (void)endChatWithError:(int)a3;
- (void)endChatWithReason:(unsigned int)a3;
- (void)endChatWithReason:(unsigned int)a3 error:(int)a4;
- (void)handleGenericAVMessageFromParticipant:(id)a3 type:(unsigned int)a4 userInfo:(id)a5;
- (void)invite:(id)a3;
- (void)invite:(id)a3 additionalPeers:(id)a4;
- (void)invite:(id)a3 additionalPeers:(id)a4 excludingPushTokens:(id)a5;
- (void)inviteAll;
- (void)localVideoBackLayer;
- (void)localVideoLayer;
- (void)notificationCenterDidDisappear;
- (void)notificationCenterWillAppear;
- (void)participant:(id)a3 changedFromState:(unsigned int)a4 toState:(unsigned int)a5;
- (void)setCameraOrientation:(unsigned int)a3;
- (void)setCameraType:(unsigned int)a3;
- (void)setConnectionTimeoutTime:(double)a3;
- (void)setDataDownloaded:(id)a3;
- (void)setDataRate:(id)a3;
- (void)setDataUploaded:(id)a3;
- (void)setInvitationTimeoutTime:(double)a3;
- (void)setIsSendingAudio:(BOOL)a3;
- (void)setIsSendingVideo:(BOOL)a3;
- (void)setLocalAspectRatio:(CGSize)a3 cameraOrientation:(unsigned int)a4 cameraType:(unsigned int)a5;
- (void)setLocalVideoBackLayer:(void *)a3;
- (void)setLocalVideoLayer:(void *)a3;
- (void)setMayRequireBreakBeforeMake:(BOOL)a3;
- (void)setMetadataFinalized;
- (void)setMute:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRelayed:(BOOL)a3;
- (void)setRemoteMute:(BOOL)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(unsigned int)a3;
- (void)set_conferenceQueue:(id)a3;
- (void)systemApplicationDidBecomeActive;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationDidResume;
- (void)systemApplicationDidResumeForEventsOnly;
- (void)systemApplicationDidSuspend;
- (void)systemApplicationWillEnterForeground;
- (void)systemDidFastUserSwitchOut;
- (void)systemWillShutdown;
- (void)toggleMute;
- (void)togglePaused;
@end

@implementation IMAVChat

- (id)_initWith:(id)a3 invitedBy:(id)a4 sessionID:(unsigned int)a5 GUID:(id)a6 video:(BOOL)a7 extraProperties:(id)a8
{
  return (id)objc_msgSend__initWith_invitedBy_sessionID_isRelayed_GUID_video_extraProperties_(self, a2, (uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, 0, a6, a7, a8);
}

- (id)_initWith:(id)a3 invitedBy:(id)a4 sessionID:(unsigned int)a5 isRelayed:(BOOL)a6 GUID:(id)a7 video:(BOOL)a8 extraProperties:(id)a9
{
  BOOL v9 = a8;
  uint64_t v196 = *MEMORY[0x263EF8340];
  double v15 = COERCE_DOUBLE(a3);
  id v16 = a4;
  id v17 = a7;
  id v180 = a9;
  v18 = sub_224FB12A0();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    v183 = self;
    __int16 v184 = 2112;
    double v185 = v15;
    __int16 v186 = 2112;
    id v187 = v16;
    __int16 v188 = 1024;
    unsigned int v189 = a5;
    __int16 v190 = 2112;
    id v191 = v17;
    __int16 v192 = 1024;
    BOOL v193 = v9;
    __int16 v194 = 2112;
    id v195 = v180;
    _os_log_impl(&dword_224F93000, v18, OS_LOG_TYPE_DEFAULT, "avchat: %@  invited: %@  invitedBy: %@  sessionID: %u guid: %@  video: %d props: %@", buf, 0x40u);
  }

  v181.receiver = self;
  v181.super_class = (Class)IMAVChat;
  v19 = [(IMAVChat *)&v181 init];
  if (!v19) {
    goto LABEL_27;
  }
  v20 = (IMTimingCollection *)objc_alloc_init(MEMORY[0x263F4A628]);
  timingCollection = v19->_timingCollection;
  v19->_timingCollection = v20;

  v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v23 = dispatch_queue_create("com.apple.imavchat_conference_queue", v22);
  conferenceQueue = v19->_conferenceQueue;
  v19->_conferenceQueue = (OS_dispatch_queue *)v23;

  objc_msgSend_localPortraitAspectRatio(IMAVLocalPreviewClient, v25, v26, v27, v28);
  double v30 = v29;
  double v32 = v31;
  v33 = sub_224FB12A0();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v183 = *(IMAVChat **)&v30;
    __int16 v184 = 2048;
    double v185 = v32;
    _os_log_impl(&dword_224F93000, v33, OS_LOG_TYPE_DEFAULT, "   Portrait Aspect: (%f / %f)", buf, 0x16u);
  }

  v34 = sub_224FB12A0();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v183 = *(IMAVChat **)&v32;
    __int16 v184 = 2048;
    double v185 = v30;
    _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, "  Landscape Aspect: (%f / %f)", buf, 0x16u);
  }

  if (v9)
  {
    objc_msgSend_setLocalAspectRatio_cameraOrientation_cameraType_(v19, v35, 2, 0, v38, v32, v30);
    objc_msgSend_setLocalAspectRatio_cameraOrientation_cameraType_(v19, v39, 0, 0, v40, v30, v32);
  }
  objc_msgSend_defaultConnectionTimeoutTime(IMAVChat, v35, v36, v37, v38);
  v19->_connectionTimeoutTime = v41;
  uint64_t v46 = objc_msgSend_defaultInvitationTimeoutTime(IMAVChat, v42, v43, v44, v45);
  v19->_invitationTimeoutTime = v51;
  if (v17)
  {
    v52 = (NSString *)v17;
  }
  else
  {
    sub_224FAAC04(v46, v47, v48, v49, v50);
    v52 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  GUID = v19->_GUID;
  v19->_GUID = v52;

  v58 = objc_msgSend_sharedInstance(IMAVCallManager, v54, v55, v56, v57);
  objc_msgSend__addIMAVChatToChatList_(v58, v59, (uint64_t)v19, v60, v61);

  v66 = objc_msgSend_sharedInstance(IMAVInterface, v62, v63, v64, v65);
  objc_msgSend_setDelegate_(v66, v67, (uint64_t)v19, v68, v69);

  v74 = objc_msgSend_account(v16, v70, v71, v72, v73);
  objc_storeStrong((id *)&v19->_initiator, a4);
  objc_msgSend_loginIMHandle(v74, v75, v76, v77, v78);
  id v79 = (id)objc_claimAutoreleasedReturnValue();
  v19->_isCaller = v79 == v16;

  p_timingCollection = (void **)&v19->_timingCollection;
  v80 = v19->_timingCollection;
  v19->_unsigned int sessionID = a5;
  v19->_isVideo = v9;
  v19->_relayed = a6;
  objc_msgSend_startTimingForKey_(v80, v82, @"time-to-connected", v83, v84);
  objc_msgSend_startTimingForKey_(v19->_timingCollection, v85, @"time-to-connecting", v86, v87);
  if (v19->_isCaller) {
    objc_msgSend_startTimingForKey_(*p_timingCollection, v88, @"time-to-invitation", v89, v90);
  }
  else {
    objc_msgSend_startTimingForKey_(*p_timingCollection, v88, @"time-to-response", v89, v90);
  }
  objc_msgSend_startTimingForKey_(*p_timingCollection, v91, @"time-to-connection-data-gathering", v92, v93);
  objc_msgSend_startTimingForKey_(*p_timingCollection, v94, @"time-to-query-for-connection-data-gathering", v95, v96);
  v97 = sub_224FB12A0();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int sessionID = v19->_sessionID;
    *(_DWORD *)buf = 67109120;
    LODWORD(v183) = sessionID;
    _os_log_impl(&dword_224F93000, v97, OS_LOG_TYPE_DEFAULT, "IMAVChat created with sessionID %u", buf, 8u);
  }

  objc_msgSend__setCreationDate(v19, v99, v100, v101, v102);
  dateEnded = v19->_dateEnded;
  v19->_dateEnded = 0;

  if (!v19->_isCaller)
  {
    v108 = sub_224FB12A0();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v108, OS_LOG_TYPE_DEFAULT, " ** not the caller, let's warmup", buf, 2u);
    }

    v113 = objc_msgSend_sharedInstance(IMAVInterface, v109, v110, v111, v112);
    objc_msgSend__notifyAboutPotentialCallForChat_(v113, v114, (uint64_t)v19, v115, v116);
  }
  v117 = objc_msgSend___imFirstObject(*(void **)&v15, v104, v105, v106, v107);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend__initParticipantsWithIMHandles_(v19, v118, *(uint64_t *)&v15, v120, v121);
  }
  else
  {
    v122 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v118, v119, v120, v121);
    v123 = (objc_class *)objc_opt_class();
    v124 = NSStringFromClass(v123);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v122, v125, (uint64_t)a2, (uint64_t)v19, @"IMAVChat.m", 174, @"Invalid class %@", v124);
  }
  if (objc_msgSend__participantsCheckOut(v19, v126, v127, v128, v129))
  {
    v134 = objc_msgSend_initiatorParticipant(v19, v130, v131, v132, v133);
    id v138 = (id)objc_msgSend__processIncomingCallProperties_(v134, v135, (uint64_t)v180, v136, v137);
    v143 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v139, v140, v141, v142);
    objc_msgSend_addObserver_selector_name_object_(v143, v144, (uint64_t)v19, (uint64_t)sel__airplaneModeChanged_, *MEMORY[0x263F4A4C8], 0);

    v149 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v145, v146, v147, v148);
    objc_msgSend_addObserver_selector_name_object_(v149, v150, (uint64_t)v19, (uint64_t)sel__entitlementsChanged_, *MEMORY[0x263F3BAE8], 0);

    v155 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v151, v152, v153, v154);
    objc_msgSend_addListener_(v155, v156, (uint64_t)v19, v157, v158);

    v163 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v159, v160, v161, v162);
    objc_msgSend_setActive_(v163, v164, 1, v165, v166);

    v171 = objc_msgSend_sharedInstance(IMAVController, v167, v168, v169, v170);
    objc_msgSend__dumpCaps(v171, v172, v173, v174, v175);

LABEL_27:
    v176 = v19;
    goto LABEL_31;
  }
  v177 = sub_224FB12A0();
  if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v183 = (IMAVChat *)@"Participants failed basic check";
    _os_log_impl(&dword_224F93000, v177, OS_LOG_TYPE_DEFAULT, "[WARN] %@", buf, 0xCu);
  }

  v176 = 0;
LABEL_31:

  return v176;
}

- (id)initIncomingFrom:(id)a3 isVideo:(BOOL)a4 callerProperties:(id)a5
{
  BOOL v6 = a4;
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v61 = self;
    __int16 v62 = 2112;
    id v63 = v8;
    __int16 v64 = 1024;
    BOOL v65 = v6;
    __int16 v66 = 2112;
    id v67 = v9;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "avchat: %@  initiator: %@  isVideo: %d properties: %@", buf, 0x26u);
  }

  objc_msgSend__setCreationDate(self, v11, v12, v13, v14);
  dateEnded = self->_dateEnded;
  self->_dateEnded = 0;

  v19 = objc_msgSend_objectForKey_(v9, v16, *MEMORY[0x263F4A6B8], v17, v18);
  dispatch_queue_t v23 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v20, (uint64_t)v19, v21, v22);
  uint64_t v27 = v23;
  if (!v23)
  {
    uint64_t v45 = objc_msgSend_stringWithFormat_(NSString, v24, @"Couldn't unarchive conference data %@", v25, v26, v19);
    BOOL v46 = v45 == 0;

    if (!v46)
    {
      v47 = sub_224FB12A0();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_stringWithFormat_(NSString, v48, @"Couldn't unarchive conference data %@", v49, v50, v19);
        double v51 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = v51;
        _os_log_impl(&dword_224F93000, v47, OS_LOG_TYPE_DEFAULT, "[WARN] %@", buf, 0xCu);
      }
    }

    goto LABEL_16;
  }
  uint64_t v28 = objc_msgSend_objectForKey_(v23, v24, *MEMORY[0x263F4A740], v25, v26);
  v33 = v28;
  if (v28)
  {
    uint64_t v37 = objc_msgSend_unsignedIntValue(v28, v29, v30, v31, v32);
    if (!v37)
    {
      uint64_t v38 = objc_msgSend_stringWithFormat_(NSString, v34, @"sessionIDValue %@ is not valid", v35, v36, v33);
      BOOL v39 = v38 == 0;

      if (!v39)
      {
        uint64_t v40 = sub_224FB12A0();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_stringWithFormat_(NSString, v41, @"sessionIDValue %@ is not valid", v42, v43, v33);
          uint64_t v44 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          uint64_t v61 = v44;
          _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "[WARN] %@", buf, 0xCu);
        }
      }

LABEL_16:
      v52 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v37 = 0;
  }
  v53 = IMSingleObjectArray();
  uint64_t v55 = objc_msgSend__initWith_invitedBy_sessionID_GUID_video_extraProperties_(self, v54, (uint64_t)v53, (uint64_t)v8, v37, 0, v6, v27);

  if (v55) {
    objc_msgSend__setCallerProperties_(v55, v56, (uint64_t)v9, v57, v58);
  }

  self = v55;
  v52 = self;
LABEL_21:

  return v52;
}

+ (int)systemSupportsNewOutgoingConferenceTo:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = v5;
    __int16 v56 = 1024;
    BOOL v57 = v4;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "imHandles: %@  isVideo: %d", buf, 0x12u);
  }

  v11 = objc_msgSend_sharedInstance(IMAVInterface, v7, v8, v9, v10);
  id v16 = v11;
  if (v4)
  {
    char CanVideoChat = objc_msgSend_systemCanVideoChat(v11, v12, v13, v14, v15);

    if ((CanVideoChat & 1) == 0)
    {
      int v22 = -1;
      goto LABEL_27;
    }
  }
  else
  {
    int CanAudioChat = objc_msgSend_systemCanAudioChat(v11, v12, v13, v14, v15);

    if (!CanAudioChat)
    {
      int v22 = -2;
      goto LABEL_27;
    }
  }
  if ((unint64_t)objc_msgSend_count(v5, v18, v19, v20, v21) >= 2)
  {
    if (v4) {
      int v22 = 4;
    }
    else {
      int v22 = 3;
    }
    goto LABEL_27;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v24 = v5;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v49, (uint64_t)v53, 16);
  if (!v26) {
    goto LABEL_24;
  }
  uint64_t v31 = v26;
  uint64_t v32 = *(void *)v50;
  while (2)
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (*(void *)v50 != v32) {
        objc_enumerationMutation(v24);
      }
      v34 = objc_msgSend_service(*(void **)(*((void *)&v49 + 1) + 8 * i), v27, v28, v29, v30, (void)v49);
      BOOL v39 = objc_msgSend_facetimeService(MEMORY[0x263F4A610], v35, v36, v37, v38);

      if (v34 == v39)
      {
        uint64_t v40 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v27, v28, v29, v30);
        uint64_t v45 = v40;
        if (v4)
        {
          char v46 = objc_msgSend_faceTimeAvailable(v40, v41, v42, v43, v44);

          if ((v46 & 1) == 0)
          {
            int v22 = 6;
LABEL_26:

            goto LABEL_27;
          }
        }
        else
        {
          int v47 = objc_msgSend_callingAvailable(v40, v41, v42, v43, v44);

          if (!v47)
          {
            int v22 = 5;
            goto LABEL_26;
          }
        }
      }
    }
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v31) {
      continue;
    }
    break;
  }
LABEL_24:

  int v22 = 0;
LABEL_27:

  return v22;
}

- (id)_initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5 GUID:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v10 = (IMAVChat *)a3;
  id v11 = a6;
  if (!objc_msgSend_systemSupportsNewOutgoingConferenceTo_isVideo_(IMAVChat, v12, (uint64_t)v10, v8, v13))
  {
    uint64_t v19 = objc_msgSend_lastObject(v10, v14, v15, v16, v17);
    id v24 = objc_msgSend_account(v19, v20, v21, v22, v23);
    uint64_t v29 = objc_msgSend_service(v24, v25, v26, v27, v28);
    IMOperationalAccountForService();
    uint64_t v30 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_account(v19, v31, v32, v33, v34);
    uint64_t v35 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

    if (v35 == v30)
    {
      uint64_t v61 = v10;
      objc_msgSend_ID(v19, v36, v37, v38, v39);
    }
    else
    {
      uint64_t v40 = sub_224FB12A0();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_account(v19, v41, v42, v43, v44);
        uint64_t v45 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v101 = v45;
        __int16 v102 = 2112;
        v103 = v30;
        _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "******** Invalid account selected to intiate a call from, failing call, please file a radar: %@    (Should have been: %@)", buf, 0x16u);
      }
      char v46 = sub_224FB12A0();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_account(v19, v47, v48, v49, v50);
        long long v51 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v101 = v51;
        __int16 v102 = 2112;
        v103 = v30;
        _os_log_impl(&dword_224F93000, v46, OS_LOG_TYPE_DEFAULT, "[WARN] ******** Invalid account selected to intiate a call from, failing call, please file a radar: %@    (Should have been: %@)", buf, 0x16u);
      }
      if (!v30)
      {
        uint64_t v96 = sub_224FB12A0();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v96, OS_LOG_TYPE_DEFAULT, "****** No active accounts at all, failing call", buf, 2u);
        }

        uint64_t v77 = sub_224FB12A0();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v77, OS_LOG_TYPE_DEFAULT, "[WARN] ****** No active accounts at all, failing call", buf, 2u);
        }
        uint64_t v18 = 0;
        goto LABEL_25;
      }
      __int16 v56 = objc_msgSend_ID(v19, v52, v53, v54, v55);
      uint64_t v60 = objc_msgSend_imHandleWithID_(v30, v57, (uint64_t)v56, v58, v59);

      IMSingleObjectArray();
      uint64_t v61 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

      __int16 v62 = sub_224FB12A0();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v101 = v30;
        __int16 v102 = 2112;
        v103 = v61;
        _os_log_impl(&dword_224F93000, v62, OS_LOG_TYPE_DEFAULT, "   Fixed, moved over to this account: %@    recipients: %@", buf, 0x16u);
      }

      uint64_t v19 = v60;
      objc_msgSend_ID(v60, v63, v64, v65, v66);
    id v67 = };
    objc_msgSend__submitCallStartedLoggingWithRecipientID_isCaller_isVideo_(self, v68, (uint64_t)v67, 1, v8);

    uint64_t v69 = sub_224FB12A0();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v101 = self;
      __int16 v102 = 2112;
      v103 = v61;
      __int16 v104 = 1024;
      BOOL v105 = v8;
      _os_log_impl(&dword_224F93000, v69, OS_LOG_TYPE_DEFAULT, "avchat: %@  to: %@  isVideo: %d", buf, 0x1Cu);
    }

    uint64_t v72 = objc_msgSend__avChatWithMatchingIMHandles_video_(IMAVChat, v70, (uint64_t)v61, v8, v71);
    uint64_t v77 = v72;
    if (v72)
    {
      objc_msgSend_acceptInvitation(v72, v73, v74, v75, v76);
      uint64_t v77 = v77;
      uint64_t v10 = v61;
      uint64_t v18 = (IMAVChat *)v77;
    }
    else
    {
      BOOL v98 = v7;
      v99 = v30;
      do
        uint64_t v78 = MEMORY[0x22A628690]();
      while (!v78);
      uint64_t v83 = v78;
      uint64_t v84 = objc_msgSend___imFirstObject(v61, v79, v80, v81, v82);
      uint64_t v89 = objc_msgSend_account(v84, v85, v86, v87, v88);
      v94 = objc_msgSend_loginIMHandle(v89, v90, v91, v92, v93);
      self = (IMAVChat *)(id)objc_msgSend__initWith_invitedBy_sessionID_isRelayed_GUID_video_extraProperties_(self, v95, (uint64_t)v61, (uint64_t)v94, v83, v98, v11, v8, 0);

      uint64_t v10 = v61;
      uint64_t v18 = self;
      uint64_t v30 = v99;
    }
LABEL_25:

    goto LABEL_26;
  }

  uint64_t v18 = 0;
LABEL_26:

  return v18;
}

- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initOutgoingTo_isVideo_isRelayed_, a3, a4, 0);
}

- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initOutgoingTo_isVideo_isRelayed_GUID_, a3, a4, a5);
}

- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5 GUID:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = sub_224FB12A0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    if (v8) {
      uint64_t v13 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v125 = v10;
    __int16 v126 = 2112;
    uint64_t v127 = v13;
    _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Client requested to create an outgoing chat with imHandles %@ isVideo %@", buf, 0x16u);
  }

  uint64_t v18 = objc_msgSend_sharedInstance(IMAVController, v14, v15, v16, v17);
  if (objc_msgSend__shouldRunConferences(v18, v19, v20, v21, v22)) {
    BOOL v27 = !v8;
  }
  else {
    BOOL v27 = 1;
  }
  if (!v27)
  {

LABEL_16:
    self = (IMAVChat *)(id)objc_msgSend__initOutgoingTo_isVideo_isRelayed_GUID_(self, v51, (uint64_t)v10, v8, v7, v11);
    uint64_t v35 = (IMAVChatProxy *)self;
    goto LABEL_31;
  }
  uint64_t v28 = objc_msgSend_sharedInstance(IMAVController, v23, v24, v25, v26);
  int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

  if (shouldRunACConferences && !v8) {
    goto LABEL_16;
  }
  uint64_t v34 = sub_224FB12A0();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, "Creating an outgoing proxy", buf, 2u);
  }

  uint64_t v35 = objc_alloc_init(IMAVChatProxy);
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v40 = objc_msgSend_numberWithBool_(NSNumber, v37, v7, v38, v39);
  objc_msgSend_setObject_forKey_(v36, v41, (uint64_t)v40, @"IsRelayed", v42);

  if (v11)
  {
    id v49 = v11;
  }
  else
  {
    sub_224FAAC04(v43, v44, v45, v46, v47);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      v123 = 0;
      goto LABEL_19;
    }
  }
  v123 = v49;
  objc_msgSend_setObject_forKey_(v36, v48, (uint64_t)v49, @"GUID", v50);
LABEL_19:
  uint64_t v53 = objc_msgSend___imFirstObject(v10, v48, (uint64_t)v49, v52, v50);
  uint64_t v58 = objc_msgSend_account(v53, v54, v55, v56, v57);
  id v63 = objc_msgSend_loginIMHandle(v58, v59, v60, v61, v62);
  uint64_t v67 = objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v64, (uint64_t)v63, v65, v66);

  if (v67) {
    objc_msgSend_setObject_forKey_(v36, v68, v67, @"Initiator", v71);
  }
  uint64_t v72 = objc_msgSend_lastObject(v10, v68, v69, v70, v71, v67);
  uint64_t v76 = objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v73, (uint64_t)v72, v74, v75);

  if (v76) {
    objc_msgSend_setObject_forKey_(v36, v77, (uint64_t)v76, @"Other", v80);
  }
  uint64_t v81 = objc_msgSend___imFirstObject(v10, v77, v78, v79, v80);
  uint64_t v86 = objc_msgSend_account(v81, v82, v83, v84, v85);
  uint64_t v91 = objc_msgSend_uniqueID(v86, v87, v88, v89, v90);

  if (v91) {
    objc_msgSend_setObject_forKey_(v36, v92, (uint64_t)v91, @"AccountID", v94);
  }
  uint64_t v95 = objc_msgSend_numberWithBool_(NSNumber, v92, v8, v93, v94);
  objc_msgSend_setObject_forKey_(v36, v96, (uint64_t)v95, @"IsVideo", v97);

  objc_msgSend_setObject_forKey_(v36, v98, (uint64_t)&unk_26D8638D8, @"State", v99);
  objc_msgSend_setObject_forKey_(v36, v100, MEMORY[0x263EFFA88], @"IsCaller", v101);
  objc_msgSend_updateWithInfo_(v35, v102, (uint64_t)v36, v103, v104);
  BOOL v105 = sub_224FB12A0();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v125 = v36;
    _os_log_impl(&dword_224F93000, v105, OS_LOG_TYPE_DEFAULT, "Create proxy with info %@", buf, 0xCu);
  }

  uint64_t v110 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v106, v107, v108, v109);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v110, v111, (uint64_t)v91, 0, (uint64_t)v36, v123, v8);

  uint64_t v116 = objc_msgSend_sharedInstance(IMAVCallManager, v112, v113, v114, v115);
  uint64_t v120 = v116;
  if (v8) {
    objc_msgSend__addAVChatProxy_(v116, v117, (uint64_t)v35, v118, v119);
  }
  else {
    objc_msgSend__addACChatProxy_(v116, v117, (uint64_t)v35, v118, v119);
  }

LABEL_31:
  return v35;
}

- (void)dealloc
{
  uint64_t v172 = *MEMORY[0x263EF8340];
  v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v171 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", buf, 0xCu);
  }

  BOOL v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    timingCollection = self->_timingCollection;
    *(_DWORD *)buf = 138412290;
    v171 = (IMAVChat *)timingCollection;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "Timings: %@", buf, 0xCu);
  }

  id v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v6, v7, v8, v9);
  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, 0, 0);

  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v12, v13, v14, v15);
  objc_msgSend_removeListener_(v16, v17, (uint64_t)self, v18, v19);

  uint64_t v24 = objc_msgSend_sharedInstance(IMAVInterface, v20, v21, v22, v23);
  objc_msgSend__avChatDealloc_(v24, v25, (uint64_t)self, v26, v27);

  uint64_t v32 = objc_msgSend_sharedInstance(IMAVInterface, v28, v29, v30, v31);
  objc_msgSend_unsetDelegate_(v32, v33, (uint64_t)self, v34, v35);

  if (self->_localState != self->_lastPostedState)
  {
    uint64_t v40 = objc_msgSend_sharedInstance(IMAVInterface, v36, v37, v38, v39);
    objc_msgSend_chatStateUpdated(v40, v41, v42, v43, v44);
  }
  int isCaller = objc_msgSend_isCaller(self, v36, v37, v38, v39);
  unsigned int localState = self->_localState;
  if (!isCaller)
  {
    if (localState - 1 > 2) {
      goto LABEL_19;
    }
    uint64_t v56 = objc_msgSend_initiatorParticipant(self, v46, v47, v48, v49);
    uint64_t v67 = sub_224FB12A0();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v171 = (IMAVChat *)v56;
      _os_log_impl(&dword_224F93000, v67, OS_LOG_TYPE_DEFAULT, "Dealloc: Declining current chat with: %@", buf, 0xCu);
    }

    objc_msgSend_sharedInstance(IMAVController, v68, v69, v70, v71);
    uint64_t v66 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = objc_msgSend_imHandle(v56, v72, v73, v74, v75);
    callerProperties = self->_callerProperties;
    uint64_t v82 = objc_msgSend_imHandle(v56, v78, v79, v80, v81);
    uint64_t v87 = objc_msgSend_account(v82, v83, v84, v85, v86);
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v66, v88, (uint64_t)v76, 1, (uint64_t)callerProperties, v87, self->_conferenceID);

    goto LABEL_17;
  }
  if ((localState | 2) != 3) {
    goto LABEL_19;
  }
  unsigned int v51 = objc_msgSend_endedReason(self, v46, v47, v48, v49);
  if (v51 > 0x18 || ((1 << v51) & 0x1811000) == 0)
  {
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    uint64_t v56 = objc_msgSend_remoteParticipants(self, v52, v53, v54, v55);
    uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v132, (uint64_t)&v165, (uint64_t)v169, 16);
    if (v133)
    {
      uint64_t v135 = v133;
      uint64_t v136 = *(void *)v166;
      *(void *)&long long v134 = 138412290;
      long long v163 = v134;
      do
      {
        for (uint64_t i = 0; i != v135; ++i)
        {
          if (*(void *)v166 != v136) {
            objc_enumerationMutation(v56);
          }
          id v138 = *(IMAVChat **)(*((void *)&v165 + 1) + 8 * i);
          v139 = sub_224FB12A0();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v163;
            v171 = v138;
            _os_log_impl(&dword_224F93000, v139, OS_LOG_TYPE_DEFAULT, "Dealloc: Cancelling outgoing invitation to %@", buf, 0xCu);
          }

          v144 = objc_msgSend_sharedInstance(IMAVController, v140, v141, v142, v143);
          v149 = objc_msgSend_imHandle(v138, v145, v146, v147, v148);
          v150 = self->_callerProperties;
          v155 = objc_msgSend_imHandle(v138, v151, v152, v153, v154);
          uint64_t v160 = objc_msgSend_account(v155, v156, v157, v158, v159);
          objc_msgSend_cancelVCRequestWithBuddy_vcProps_forAccount_conferenceID_reason_(v144, v161, (uint64_t)v149, (uint64_t)v150, (uint64_t)v160, self->_conferenceID, 0);
        }
        uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v162, (uint64_t)&v165, (uint64_t)v169, 16);
      }
      while (v135);
    }
    goto LABEL_18;
  }
  uint64_t v56 = sub_224FB12A0();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v61 = objc_msgSend_endedReason(self, v57, v58, v59, v60);
    _NSStringDescriptionForIMAVChatEndedReason(v61, v62, v63, v64, v65);
    uint64_t v66 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v171 = v66;
    _os_log_impl(&dword_224F93000, v56, OS_LOG_TYPE_DEFAULT, "Dealloc: Not Cancelling outgoing invitation since the chat ended with reason %@", buf, 0xCu);
LABEL_17:
  }
LABEL_18:

LABEL_19:
  objc_msgSend_makeObjectsPerformSelector_(self->_participants, v46, (uint64_t)sel_disconnectFromAVChat, v48, v49, v163);
  objc_msgSend_disconnectFromAVChat(self->_localParticipant, v89, v90, v91, v92);
  self->_unsigned int localState = 0;
  uint64_t v97 = objc_msgSend_sharedInstance(IMAVCallManager, v93, v94, v95, v96);
  objc_msgSend__removeIMAVChatFromChatList_(v97, v98, (uint64_t)self, v99, v100);

  BOOL v105 = objc_msgSend_sharedInstance(IMAVCallManager, v101, v102, v103, v104);
  objc_msgSend__sendProxyUpdate(v105, v106, v107, v108, v109);

  objc_msgSend__clearConnectionTimeoutTimer(self, v110, v111, v112, v113);
  objc_msgSend__clearFirstFrameTimeoutTimer(self, v114, v115, v116, v117);
  objc_msgSend__clearInvitationTimeoutTimer(self, v118, v119, v120, v121);
  __int16 v126 = objc_msgSend_sharedInstance(IMAVController, v122, v123, v124, v125);
  objc_msgSend_updateActiveConference(v126, v127, v128, v129, v130);

  conferenceQueue = self->_conferenceQueue;
  if (conferenceQueue)
  {
    self->_conferenceQueue = 0;
  }
  v164.receiver = self;
  v164.super_class = (Class)IMAVChat;
  [(IMAVChat *)&v164 dealloc];
}

- (id)description
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v7 = objc_msgSend_initWithString_(v3, v4, (uint64_t)&stru_26D85AF10, v5, v6);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = self->_participants;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v10)
  {
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = objc_msgSend_imHandle(*(void **)(*((void *)&v43 + 1) + 8 * i), v11, v12, v13, v14);
        uint64_t v23 = objc_msgSend_description(v18, v19, v20, v21, v22);
        objc_msgSend_appendString_(v7, v24, (uint64_t)v23, v25, v26);

        objc_msgSend_appendString_(v7, v27, @", ", v28, v29);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v15);
  }

  uint64_t v30 = NSString;
  if (self->_isVideo) {
    uint64_t v31 = @"Video";
  }
  else {
    uint64_t v31 = @"Audio";
  }
  uint64_t v32 = _NSStringDescriptionForIMAVChatState(self->_localState);
  GUID = self->_GUID;
  conferenceID = self->_conferenceID;
  uint64_t sessionID = self->_sessionID;
  id v36 = (objc_class *)objc_opt_class();
  uint64_t v37 = NSStringFromClass(v36);
  double v41 = objc_msgSend_stringWithFormat_(v30, v38, @"<%p> %@ chat with %@ (state %@) (ConfID: %@) (SID: %u) (GUID: %@) (Kind: %@)", v39, v40, self, v31, v7, v32, conferenceID, sessionID, GUID, v37, (void)v43);

  return v41;
}

- (void)beginChat
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    uint64_t v23 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend__setCreationDate(self, v4, v5, v6, v7);
  localParticipant = self->_localParticipant;
  if (self->_isCaller)
  {
    objc_msgSend_setState_(localParticipant, v8, 2, v10, v11);
  }
  else
  {
    uint64_t v13 = objc_msgSend_invitedBy(localParticipant, v8, v9, v10, v11);
    uint64_t v17 = objc_msgSend_participantMatchingIMHandle_(self, v14, (uint64_t)v13, v15, v16);

    if (!v17)
    {
      uint64_t v21 = sub_224FB12A0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] ********* -[IMAVChat beginChat] Could not find participant which invited me!", (uint8_t *)&v22, 2u);
      }
    }
    objc_msgSend_setState_(v17, v18, 2, v19, v20);
  }
}

- (void)endChat
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend_otherIMHandle(self, v4, v5, v6, v7);
    objc_msgSend_ID(v8, v9, v10, v11, v12);
    uint64_t v13 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    int v17 = 138412290;
    uint64_t v18 = v13;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Marking conference with %@ as ended", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v14 = sub_224FB12A0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    uint64_t v18 = self;
    _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend_endChatWithReason_error_(self, v15, 8, 0, v16);
}

- (void)endChatWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _NSStringDescriptionForIMAVChatEndedReason(v3, v6, v7, v8, v9);
    int v13 = 138412546;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ reason: %@", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend_endChatWithReason_error_(self, v11, v3, 0, v12);
}

- (void)endChatWithError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _NSStringDescriptionForIMAVChatError(v3, v6, v7, v8, v9);
    int v14 = 138412546;
    __int16 v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ error: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v3) {
    unsigned int v13 = 7;
  }
  else {
    unsigned int v13 = 0;
  }
  if (self->_localState == 4) {
    objc_msgSend_endChatWithReason_error_(self, v11, v13, v3, v12);
  }
  else {
    objc_msgSend_endChatWithReason_error_(self, v11, 6, v3, v12);
  }
}

- (void)endChatWithReason:(unsigned int)a3 error:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = _NSStringDescriptionForIMAVChatEndedReason(v5, v8, v9, v10, v11);
    uint64_t v17 = _NSStringDescriptionForIMAVChatError(v4, v13, v14, v15, v16);
    *(_DWORD *)buf = 138412802;
    uint64_t v70 = self;
    __int16 v71 = 2112;
    uint64_t v72 = v12;
    __int16 v73 = 2112;
    uint64_t v74 = v17;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@ reason: %@ error: %@", buf, 0x20u);
  }
  if (objc_msgSend_isCaller(self, v18, v19, v20, v21))
  {
    unsigned int v63 = v4;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v26 = objc_msgSend_remoteParticipants(self, v22, v23, v24, v25);
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v64, (uint64_t)v68, 16);
    if (v28)
    {
      uint64_t v33 = v28;
      uint64_t v34 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v65 != v34) {
            objc_enumerationMutation(v26);
          }
          id v36 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (objc_msgSend_state(v36, v29, v30, v31, v32) - 1 <= 2)
          {
            if (v5 == 29)
            {
              uint64_t v49 = objc_msgSend_sharedInstance(IMAVInterface, v29, v30, v31, v32);
              uint64_t v54 = objc_msgSend_avChat(v36, v50, v51, v52, v53);
              objc_msgSend_cancelConferenceForAVChat_(v49, v55, (uint64_t)v54, v56, v57);

              objc_msgSend_cancelInvitationWithResponse_(v36, v58, 10, v59, v60);
            }
            else if (v5 == 27)
            {
              uint64_t v37 = objc_msgSend_sharedInstance(IMAVInterface, v29, v30, v31, v32);
              uint64_t v42 = objc_msgSend_avChat(v36, v38, v39, v40, v41);
              objc_msgSend_cancelConferenceForAVChat_(v37, v43, (uint64_t)v42, v44, v45);

              objc_msgSend_cancelInvitationWithResponse_(v36, v46, 8, v47, v48);
            }
            else
            {
              objc_msgSend_cancelInvitationWithReason_(v36, v29, v5, v31, v32);
            }
          }
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v64, (uint64_t)v68, 16);
      }
      while (v33);
    }

    uint64_t v4 = v63;
  }
  unsigned int localState = self->_localState;
  if (localState == 3)
  {
    if (objc_msgSend_isCaller(self, v22, v23, v24, v25))
    {
      objc_msgSend_cancelInvitation(self, v22, v62, v24, v25);
      return;
    }
  }
  else if (localState != 1)
  {
    objc_msgSend__endChatWithReason_andError_(self, v22, v5, v4, v25);
    return;
  }
  objc_msgSend_declineInvitationWithResponse_(self, v22, 1, v24, v25);
}

- (void)_endChatWithReason:(unsigned int)a3 andError:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v163 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = _NSStringDescriptionForIMAVChatEndedReason(v4, v7, v8, v9, v10);
    uint64_t v16 = _NSStringDescriptionForIMAVChatError(a4, v12, v13, v14, v15);
    *(_DWORD *)buf = 138412802;
    v156 = self;
    __int16 v157 = 2112;
    uint64_t v158 = v11;
    __int16 v159 = 2112;
    *(void *)uint64_t v160 = v16;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "avchat: %@ reason: %@ error: %@", buf, 0x20u);
  }
  uint64_t v21 = &off_224FD2000;
  if (objc_msgSend_isActive(self, v17, v18, v19, v20))
  {
    int v22 = sub_224FB12A0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_msgSend_otherIMHandle(self, v23, v24, v25, v26);
      objc_msgSend_ID(v27, v28, v29, v30, v31);
      uint64_t v32 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = _NSStringDescriptionForIMAVChatEndedReason(v4, v33, v34, v35, v36);
      uint64_t v42 = _NSStringDescriptionForIMAVChatError(a4, v38, v39, v40, v41);
      *(_DWORD *)buf = 138413314;
      v156 = v32;
      __int16 v157 = 2112;
      uint64_t v158 = v37;
      __int16 v159 = 1024;
      *(_DWORD *)uint64_t v160 = v4;
      *(_WORD *)&v160[4] = 2112;
      *(void *)&v160[6] = v42;
      __int16 v161 = 1024;
      int v162 = a4;
      _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "Marking conference with %@ as ended with reason: %@ (%d) error: %@ (%d)", buf, 0x2Cu);
    }
    uint64_t v47 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v43, v44, v45, v46);
    int valid = objc_msgSend_validNetworkEnabled(v47, v48, v49, v50, v51);

    uint64_t v57 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v53, v54, v55, v56);
    int v62 = objc_msgSend_validNetworkActive(v57, v58, v59, v60, v61);

    long long v67 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v63, v64, v65, v66);
    int v72 = objc_msgSend_validNetworkReachable(v67, v68, v69, v70, v71);

    uint64_t v77 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v73, v74, v75, v76);
    int v82 = objc_msgSend_willSearchForNetwork(v77, v78, v79, v80, v81);

    uint64_t v83 = sub_224FB12A0();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v83, OS_LOG_TYPE_DEFAULT, "********** Network Status ************", buf, 2u);
    }

    uint64_t v84 = sub_224FB12A0();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      if (valid) {
        uint64_t v85 = @"YES";
      }
      else {
        uint64_t v85 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v85;
      _os_log_impl(&dword_224F93000, v84, OS_LOG_TYPE_DEFAULT, "Is Network Enabled: %@", buf, 0xCu);
    }

    uint64_t v86 = sub_224FB12A0();
    uint64_t v21 = &off_224FD2000;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      if (v62) {
        uint64_t v87 = @"YES";
      }
      else {
        uint64_t v87 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v87;
      _os_log_impl(&dword_224F93000, v86, OS_LOG_TYPE_DEFAULT, "Is Network Active: %@", buf, 0xCu);
    }

    uint64_t v88 = sub_224FB12A0();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      if (v72) {
        uint64_t v89 = @"YES";
      }
      else {
        uint64_t v89 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v89;
      _os_log_impl(&dword_224F93000, v88, OS_LOG_TYPE_DEFAULT, "Is Network Reachable: %@", buf, 0xCu);
    }

    uint64_t v90 = sub_224FB12A0();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      if (v82) {
        uint64_t v91 = @"YES";
      }
      else {
        uint64_t v91 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v91;
      _os_log_impl(&dword_224F93000, v90, OS_LOG_TYPE_DEFAULT, "Will Search for Network: %@", buf, 0xCu);
    }

    uint64_t v92 = sub_224FB12A0();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v92, OS_LOG_TYPE_DEFAULT, "**************************************", buf, 2u);
    }
  }
  uint64_t v93 = sub_224FB12A0();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    timingCollection = self->_timingCollection;
    *(_DWORD *)buf = *((void *)v21 + 241);
    v156 = (IMAVChat *)timingCollection;
    _os_log_impl(&dword_224F93000, v93, OS_LOG_TYPE_DEFAULT, "Chat timings: %@", buf, 0xCu);
  }

  if (objc_msgSend_isActive(self, v95, v96, v97, v98))
  {
    uint64_t v103 = objc_msgSend_sharedInstance(IMAVInterface, v99, v100, v101, v102);
    objc_msgSend_endConferenceForAVChat_(v103, v104, (uint64_t)self, v105, v106);
  }
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  uint64_t v147 = self;
  uint64_t v107 = self->_participants;
  uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v108, (uint64_t)&v150, (uint64_t)v154, 16);
  if (v109)
  {
    uint64_t v114 = v109;
    uint64_t v115 = *(void *)v151;
    int v148 = *((void *)v21 + 241);
    do
    {
      for (uint64_t i = 0; i != v114; ++i)
      {
        if (*(void *)v151 != v115) {
          objc_enumerationMutation(v107);
        }
        uint64_t v117 = *(void **)(*((void *)&v150 + 1) + 8 * i);
        if (objc_msgSend_state(v117, v110, v111, v112, v113) != 5) {
          objc_msgSend_setStateToEndedWithReason_andError_(v117, v118, v4, a4, v119);
        }
        uint64_t v120 = sub_224FB12A0();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__participantsCallInfo(v117, v121, v122, v123, v124);
          uint64_t v125 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v148;
          v156 = v125;
          _os_log_impl(&dword_224F93000, v120, OS_LOG_TYPE_DEFAULT, "_endChatWithReason participant info states %@", buf, 0xCu);
        }
      }
      uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v110, (uint64_t)&v150, (uint64_t)v154, 16);
    }
    while (v114);
  }

  uint64_t v130 = objc_msgSend_sharedInstance(IMAVController, v126, v127, v128, v129);
  objc_msgSend_updateActiveConference(v130, v131, v132, v133, v134);

  if (!v147->_hasGatheredInfo)
  {
    v147->_hasGatheredInfo = 1;
    objc_msgSend__submitCallEndedLoggingWithReason_andError_(v147, v135, v4, a4, v138);
  }
  objc_msgSend__postStateToDelegateIfNecessary(v147, v135, v136, v137, v138);
  uint64_t v143 = objc_msgSend_sharedInstance(IMAVInterface, v139, v140, v141, v142);
  objc_msgSend_unsetDelegate_(v143, v144, (uint64_t)v147, v145, v146);
}

- (id)inviteesInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = objc_msgSend_remoteParticipants(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_lastObject(v9, v10, v11, v12, v13);

  uint64_t v19 = objc_msgSend_additionalPeers(v14, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_count(v19, v20, v21, v22, v23);

  if (v24)
  {
    uint64_t v29 = objc_msgSend_additionalPeers(v14, v25, v26, v27, v28);
    objc_msgSend_addObjectsFromArray_(v3, v30, (uint64_t)v29, v31, v32);
  }
  else
  {
    uint64_t v33 = objc_msgSend_otherIMHandle(self, v25, v26, v27, v28);
    uint64_t v29 = objc_msgSend_originalID(v33, v34, v35, v36, v37);

    if (!objc_msgSend_length(v29, v38, v39, v40, v41))
    {
      uint64_t v46 = objc_msgSend_otherIMHandle(self, v42, v43, v44, v45);
      uint64_t v51 = objc_msgSend_ID(v46, v47, v48, v49, v50);

      uint64_t v29 = (void *)v51;
    }
    objc_msgSend_addObject_(v3, v42, (uint64_t)v29, v44, v45);
  }

  uint64_t v56 = objc_msgSend_excludingPushTokens(v14, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_count(v56, v57, v58, v59, v60);

  if (v61)
  {
    uint64_t v66 = objc_msgSend_excludingPushTokens(v14, v62, v63, v64, v65);
    objc_msgSend_addObjectsFromArray_(v4, v67, (uint64_t)v66, v68, v69);
  }
  uint64_t v70 = NSDictionary;
  uint64_t sessionID = self->_sessionID;
  if (sessionID)
  {
    int v72 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v62, sessionID, v64, v65);
    objc_msgSend_dictionaryWithObjectsAndKeys_(v70, v73, (uint64_t)v72, v74, v75, *MEMORY[0x263F4A740], v3, *MEMORY[0x263F4A6D8], v4, @"excludingPushTokens", 0);
  }
  else
  {
    int v72 = 0;
    objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v62, 0, v64, v65, *MEMORY[0x263F4A740], v3, *MEMORY[0x263F4A6D8], v4, @"excludingPushTokens", 0);
  uint64_t v76 = };
  if (sessionID) {

  }
  return v76;
}

- (BOOL)_isCallUpgradeTo:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_otherIMHandle(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_ID(v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_ID(v4, v15, v16, v17, v18);

  LOBYTE(v4) = MEMORY[0x22A6286B0](v14, v19);
  return (char)v4;
}

- (BOOL)_isVideoUpgradeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_otherIMHandle(self, a2, (uint64_t)a3, v3, v4);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = objc_msgSend_sharedInstance(IMAVCallManager, v7, v8, v9, v10, 0);
  uint64_t v16 = objc_msgSend_calls(v11, v12, v13, v14, v15);

  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v18)
  {
    uint64_t v23 = v18;
    uint64_t v24 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v16);
        }
        uint64_t v26 = *(IMAVChat **)(*((void *)&v29 + 1) + 8 * i);
        if (v26 != self
          && objc_msgSend_isActive(*(void **)(*((void *)&v29 + 1) + 8 * i), v19, v20, v21, v22)
          && objc_msgSend_isVideo(self, v19, v20, v21, v22)
          && (objc_msgSend_isVideo(v26, v19, v20, v21, v22) & 1) == 0
          && (objc_msgSend__isCallUpgradeTo_(v26, v19, (uint64_t)v6, v21, v22) & 1) != 0)
        {
          BOOL v27 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v29, (uint64_t)v33, 16);
      if (v23) {
        continue;
      }
      break;
    }
  }
  BOOL v27 = 0;
LABEL_15:

  return v27;
}

- (void)inviteAll
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Starting invite process", buf, 2u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v4, @"time-to-invitation", v5, v6);
  objc_msgSend_stopTimingForKey_(self->_timingCollection, v7, @"time-to-av-invitation-op-creation", v8, v9);
  objc_msgSend__setActiveConference(self, v10, v11, v12, v13);
  objc_msgSend_setMute_(self, v14, 0, v15, v16);
  objc_msgSend_setPaused_(self, v17, 0, v18, v19);
  uint64_t v24 = objc_msgSend_sharedInstance(IMAVInterface, v20, v21, v22, v23);
  int isAVInterfaceReady = objc_msgSend_isAVInterfaceReady(v24, v25, v26, v27, v28);

  long long v30 = sub_224FB12A0();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (isAVInterfaceReady)
  {
    if (v31)
    {
      *(_WORD *)uint64_t v55 = 0;
      _os_log_impl(&dword_224F93000, v30, OS_LOG_TYPE_DEFAULT, "Delivering Invites", v55, 2u);
    }

    uint64_t v36 = objc_msgSend_remoteParticipants(self, v32, v33, v34, v35);
    objc_msgSend_makeObjectsPerformSelector_(v36, v37, (uint64_t)sel_sendInvitation, v38, v39);
  }
  else
  {
    if (v31)
    {
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl(&dword_224F93000, v30, OS_LOG_TYPE_DEFAULT, "Initing Interface", v54, 2u);
    }

    self->_hasPendingInit = 1;
    uint64_t v44 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v40, v41, v42, v43);
    objc_msgSend_addObserver_selector_name_object_(v44, v45, (uint64_t)self, (uint64_t)sel__vccInitDidFinish_, @"__kIMAVInterfaceReadyNotification", 0);

    uint64_t v36 = objc_msgSend_sharedInstance(IMAVInterface, v46, v47, v48, v49);
    objc_msgSend_initAVInterface(v36, v50, v51, v52, v53);
  }
}

- (void)_cancelInvitationWithReason:(unsigned int)a3 error:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  objc_msgSend_initiatorParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStateToEndedWithReason_andError_(v9, v7, v6, v5, v8);
}

- (void)cancelInvitation
{
  objc_msgSend__cancelInvitationWithReason_error_(self, a2, 1, 0, v2);
}

- (void)invite:(id)a3 additionalPeers:(id)a4 excludingPushTokens:(id)a5
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a5;
  uint64_t v11 = sub_224FB12A0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      uint64_t v17 = objc_msgSend_ID(v8, v13, v14, v15, v16);
      *(_DWORD *)buf = 138412290;
      uint64_t v105 = v17;
      _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "Asked to invite a buddy: %@", buf, 0xCu);
    }
    uint64_t v11 = objc_msgSend_remoteParticipants(self, v18, v19, v20, v21);
    if (objc_msgSend_count(v11, v22, v23, v24, v25))
    {
      if (objc_msgSend_count(v9, v26, v27, v28, v29))
      {
        uint64_t v34 = objc_msgSend_remoteParticipants(self, v30, v31, v32, v33);
        uint64_t v39 = objc_msgSend_lastObject(v34, v35, v36, v37, v38);

        uint64_t v40 = sub_224FB12A0();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v105 = v9;
          _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "Additional peers %@", buf, 0xCu);
        }

        objc_msgSend_setAdditionalPeers_(v39, v41, (uint64_t)v9, v42, v43);
      }
      if (objc_msgSend_count(v10, v30, v31, v32, v33))
      {
        uint64_t v48 = objc_msgSend_remoteParticipants(self, v44, v45, v46, v47);
        uint64_t v53 = objc_msgSend_lastObject(v48, v49, v50, v51, v52);

        uint64_t v54 = sub_224FB12A0();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v105 = v10;
          _os_log_impl(&dword_224F93000, v54, OS_LOG_TYPE_DEFAULT, "Excluding push tokens %@", buf, 0xCu);
        }

        objc_msgSend_setExcludingPushTokens_(v53, v55, (uint64_t)v10, v56, v57);
      }
      objc_msgSend_makeObjectsPerformSelector_(v11, v44, (uint64_t)sel_sendInvitation, v46, v47);
      inited = sub_224FB12A0();
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v105 = v11;
        _os_log_impl(&dword_224F93000, inited, OS_LOG_TYPE_DEFAULT, "We already have a remote participant in this chat %@, can't add more", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v59 = [IMAVChatParticipant alloc];
      uint64_t v64 = objc_msgSend_account(v8, v60, v61, v62, v63);
      uint64_t v69 = objc_msgSend_loginIMHandle(v64, v65, v66, v67, v68);
      uint64_t v74 = objc_msgSend_account(v8, v70, v71, v72, v73);
      inited = objc_msgSend_initAs_invitedBy_toChat_account_(v59, v75, (uint64_t)v8, (uint64_t)v69, (uint64_t)self, v74);

      if (objc_msgSend_count(v9, v76, v77, v78, v79))
      {
        uint64_t v84 = sub_224FB12A0();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v105 = v9;
          _os_log_impl(&dword_224F93000, v84, OS_LOG_TYPE_DEFAULT, "Additional peers %@", buf, 0xCu);
        }

        objc_msgSend_setAdditionalPeers_(inited, v85, (uint64_t)v9, v86, v87);
      }
      if (objc_msgSend_count(v10, v80, v81, v82, v83))
      {
        uint64_t v90 = sub_224FB12A0();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v105 = v10;
          _os_log_impl(&dword_224F93000, v90, OS_LOG_TYPE_DEFAULT, "Excluding push tokens %@", buf, 0xCu);
        }

        objc_msgSend_setExcludingPushTokens_(inited, v91, (uint64_t)v10, v92, v93);
      }
      objc_msgSend__insertRemoteParticipant_atIndex_(self, v88, (uint64_t)inited, 0, v89);
      objc_msgSend_sendInvitation(inited, v94, v95, v96, v97);
      uint64_t v101 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v98, (uint64_t)inited, v99, v100, @"__kIMAVChatParticipantKey", 0);
      objc_msgSend__postNotificationName_userInfo_(self, v102, @"__kIMAVChatParticipantAddedNotification", (uint64_t)v101, v103);
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "[WARN] AVChat asked to invite buddy == nil !", buf, 2u);
  }
}

- (void)invite:(id)a3 additionalPeers:(id)a4
{
}

- (void)invite:(id)a3
{
}

- (void)acceptInvitation
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isCaller(self, a2, v2, v3, v4))
  {
    uint64_t v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v79 = 138412290;
      uint64_t v80 = self;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Received bogus when I'm actually the caller for chat: %@", (uint8_t *)&v79, 0xCu);
    }
    goto LABEL_17;
  }
  int v11 = objc_msgSend_state(self, v6, v7, v8, v9);
  uint64_t v10 = sub_224FB12A0();
  BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v11 != 1)
  {
    if (!v12) {
      goto LABEL_17;
    }
    unsigned int v63 = objc_msgSend_state(self, v13, v14, v15, v16);
    _NSStringDescriptionForIMAVChatState(v63);
    uint64_t v64 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    int v79 = 138412290;
    uint64_t v80 = v64;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Received bogus accept request in state: %@", (uint8_t *)&v79, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  if (v12)
  {
    LOWORD(v79) = 0;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Starting accept process", (uint8_t *)&v79, 2u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v17, @"time-to-response", v18, v19);
  objc_msgSend_startTimingForKey_(self->_timingCollection, v20, @"time-to-start-connecting", v21, v22);
  uint64_t v10 = objc_msgSend_initiatorParticipant(self, v23, v24, v25, v26);
  uint64_t v31 = objc_msgSend_sharedInstance(IMAVInterface, v27, v28, v29, v30);
  objc_msgSend_setDelegate_(v31, v32, (uint64_t)self, v33, v34);

  objc_msgSend_setMute_(self, v35, 0, v36, v37);
  objc_msgSend_setPaused_(self, v38, 0, v39, v40);
  objc_msgSend_setState_(v10, v41, 3, v42, v43);
  objc_msgSend__setActiveConference(self, v44, v45, v46, v47);
  uint64_t v52 = objc_msgSend_sharedInstance(IMAVInterface, v48, v49, v50, v51);
  int isAVInterfaceReady = objc_msgSend_isAVInterfaceReady(v52, v53, v54, v55, v56);

  uint64_t v58 = sub_224FB12A0();
  BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
  if (!isAVInterfaceReady)
  {
    if (v59)
    {
      LOWORD(v79) = 0;
      _os_log_impl(&dword_224F93000, v58, OS_LOG_TYPE_DEFAULT, "Building AV Interface", (uint8_t *)&v79, 2u);
    }

    self->_hasPendingAccept = 1;
    uint64_t v69 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v65, v66, v67, v68);
    objc_msgSend_addObserver_selector_name_object_(v69, v70, (uint64_t)self, (uint64_t)sel__vccInitDidFinish_, @"__kIMAVInterfaceReadyNotification", 0);

    objc_msgSend_sharedInstance(IMAVInterface, v71, v72, v73, v74);
    uint64_t v64 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_initAVInterface(v64, v75, v76, v77, v78);
    goto LABEL_16;
  }
  if (v59)
  {
    LOWORD(v79) = 0;
    _os_log_impl(&dword_224F93000, v58, OS_LOG_TYPE_DEFAULT, "Sending response", (uint8_t *)&v79, 2u);
  }

  objc_msgSend_sendResponse_(v10, v60, 0, v61, v62);
LABEL_17:
}

- (void)declineInvitationWithResponse:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Starting decline process", v21, 2u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v6, @"time-to-response", v7, v8);
  uint64_t v13 = objc_msgSend_initiatorParticipant(self, v9, v10, v11, v12);
  objc_msgSend_sendResponse_(v13, v14, v3, v15, v16);

  switch((int)v3)
  {
    case 2:
      uint64_t v19 = self;
      uint64_t v20 = 8;
      goto LABEL_11;
    case 4:
      uint64_t v19 = self;
      uint64_t v20 = 12;
      goto LABEL_11;
    case 5:
      objc_msgSend__endChatWithReason_andError_(self, v17, 12, 6000, v18);
      return;
    case 6:
      uint64_t v19 = self;
      uint64_t v20 = 14;
      goto LABEL_11;
    case 7:
      uint64_t v19 = self;
      uint64_t v20 = 21;
      goto LABEL_11;
    case 11:
      uint64_t v19 = self;
      uint64_t v20 = 31;
      goto LABEL_11;
    default:
      uint64_t v19 = self;
      uint64_t v20 = 5;
LABEL_11:
      objc_msgSend__endChatWithReason_andError_(v19, v17, v20, 0, v18);
      return;
  }
}

- (void)declineInvitation
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Starting decline process", v7, 2u);
  }

  objc_msgSend_declineInvitationWithResponse_(self, v4, 1, v5, v6);
}

- (void)_setStateDisconnected
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v13, 0xCu);
  }

  unsigned int localState = self->_localState;
  if (localState == 3)
  {
    uint64_t v9 = 6;
  }
  else
  {
    if (localState != 4) {
      return;
    }
    uint64_t v9 = 7;
  }
  uint64_t v10 = objc_msgSend_endedError(self, v4, v5, v6, v7);
  objc_msgSend__endChatWithReason_andError_(self, v11, v9, v10, v12);
}

- (BOOL)_processVCResponseDict:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x263F4A720], v6, v7);
    uint64_t v17 = objc_msgSend_participantMatchingIMHandle_(self, v10, (uint64_t)v9, v11, v12);
    if (!v17)
    {
      uint64_t v18 = objc_msgSend_remoteParticipants(self, v13, v14, v15, v16);
      uint64_t v17 = objc_msgSend_lastObject(v18, v19, v20, v21, v22);
    }
    objc_msgSend__switchToUseNewIMHandle_(v17, v13, (uint64_t)v9, v15, v16);
    uint64_t v29 = objc_msgSend_objectForKey_(v8, v23, *MEMORY[0x263F4A730], v24, v25);
    if (!v29)
    {
      char v50 = 1;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v30 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v26, (uint64_t)v29, v27, v28);
    uint64_t v34 = objc_msgSend_objectForKey_(v30, v31, *MEMORY[0x263F4A740], v32, v33);
    uint64_t v39 = v34;
    if (v34)
    {
      int v40 = objc_msgSend_unsignedIntValue(v34, v35, v36, v37, v38);
      unsigned int sessionID = self->_sessionID;
      uint64_t v42 = sub_224FB12A0();
      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      if (v40 == sessionID)
      {
        if (v43)
        {
          int v55 = 138412290;
          uint64_t v56 = v39;
          _os_log_impl(&dword_224F93000, v42, OS_LOG_TYPE_DEFAULT, "response or counter-proposal received for expected session ID %@", (uint8_t *)&v55, 0xCu);
        }

        char v50 = objc_msgSend__processResponseDictionary_allowSecondConnection_(v17, v48, (uint64_t)v8, 0, v49);
        goto LABEL_21;
      }
      if (v43)
      {
        int v52 = objc_msgSend_unsignedIntValue(v39, v44, v45, v46, v47);
        unsigned int v53 = self->_sessionID;
        int v55 = 138412802;
        uint64_t v56 = v9;
        __int16 v57 = 1024;
        int v58 = v52;
        __int16 v59 = 1024;
        unsigned int v60 = v53;
        _os_log_impl(&dword_224F93000, v42, OS_LOG_TYPE_DEFAULT, "Response or counter-proposal received from %@ with session ID %d that doesn't match %u", (uint8_t *)&v55, 0x18u);
      }
    }
    else
    {
      uint64_t v51 = sub_224FB12A0();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v55) = 0;
        _os_log_impl(&dword_224F93000, v51, OS_LOG_TYPE_DEFAULT, "[WARN] No session ID", (uint8_t *)&v55, 2u);
      }
    }
    char v50 = 0;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v55) = 0;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVChat _processVCResponseDict:] nil dict", (uint8_t *)&v55, 2u);
  }
  char v50 = 0;
LABEL_23:

  return v50;
}

- (void)__responseToVCInvite:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x263F4A720], v6, v7);
  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Response from: %@  dictionary: %@", (uint8_t *)&v25, 0x16u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v10, @"time-to-response", v11, v12);
  objc_msgSend_startTimingForKey_(self->_timingCollection, v13, @"time-to-start-connecting", v14, v15);
  int v19 = objc_msgSend__processVCResponseDict_(self, v16, (uint64_t)v4, v17, v18);
  uint64_t v20 = sub_224FB12A0();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      LOWORD(v25) = 0;
      uint64_t v22 = "Successfully processed VC response";
      uint64_t v23 = v20;
      uint32_t v24 = 2;
LABEL_8:
      _os_log_impl(&dword_224F93000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, v24);
    }
  }
  else if (v21)
  {
    int v25 = 138412290;
    id v26 = v4;
    uint64_t v22 = "[WARN] Failed processing of VC response dictionary: %@";
    uint64_t v23 = v20;
    uint32_t v24 = 12;
    goto LABEL_8;
  }
}

- (void)_responseToVCInvite:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7, v8) != 2
    && objc_msgSend_state(self, v9, v10, v11, v12) != 3
    && objc_msgSend_state(self, v9, v10, v11, v12) != 4)
  {
    uint64_t v16 = sub_224FB12A0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "[WARN] Received response while we're not waiting for a response";
      uint64_t v18 = buf;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if ((objc_msgSend_isCaller(self, v9, v10, v11, v12) & 1) == 0)
  {
    uint64_t v16 = sub_224FB12A0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      uint64_t v17 = "[WARN] Received response while we're not the caller, ignoring";
      uint64_t v18 = (uint8_t *)&v19;
LABEL_10:
      _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  objc_msgSend___responseToVCInvite_(self, v13, (uint64_t)v4, v14, v15);
LABEL_12:
}

- (void)_handleGenericAVMessageFromParticipant:(id)a3 type:(unsigned int)a4 userInfo:(id)a5 handled:(BOOL)a6
{
  *(void *)&v39[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  if ((int)a4 <= 1000)
  {
    if (a4 != 350)
    {
      if (a4 == 1000)
      {
        uint64_t v12 = sub_224FB12A0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = 138412290;
          *(void *)uint64_t v39 = v10;
          _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Received ping from participant: %@  => sending pong", (uint8_t *)&v38, 0xCu);
        }

        objc_msgSend_sendAVMessage_userInfo_(v10, v13, 1001, 0, v14);
        goto LABEL_22;
      }
      goto LABEL_18;
    }
    uint64_t v20 = sub_224FB12A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412290;
      *(void *)uint64_t v39 = v10;
      _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "Received prepare from participant: %@", (uint8_t *)&v38, 0xCu);
    }
    goto LABEL_14;
  }
  if (a4 != 1001)
  {
    if (a4 != 1500)
    {
LABEL_18:
      if (!a6)
      {
        __int16 v27 = sub_224FB12A0();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = objc_msgSend_imHandle(v10, v28, v29, v30, v31);
          uint64_t v37 = objc_msgSend_ID(v32, v33, v34, v35, v36);
          int v38 = 67109378;
          v39[0] = a4;
          LOWORD(v39[1]) = 2112;
          *(void *)((char *)&v39[1] + 2) = v37;
          _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Unhandled messagetype id: %d from: %@", (uint8_t *)&v38, 0x12u);
        }
      }
      goto LABEL_22;
    }
    uint64_t v15 = sub_224FB12A0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412290;
      *(void *)uint64_t v39 = v10;
      _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "Received local IP change from participant: %@ => notifying AVConference", (uint8_t *)&v38, 0xCu);
    }

    uint64_t v20 = objc_msgSend_sharedInstance(IMAVInterface, v16, v17, v18, v19);
    objc_msgSend_processRemoteIPChanged_fromParticipant_(v20, v21, (uint64_t)v11, (uint64_t)v10, v22);
LABEL_14:

    goto LABEL_22;
  }
  uint64_t v23 = sub_224FB12A0();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412290;
    *(void *)uint64_t v39 = v10;
    _os_log_impl(&dword_224F93000, v23, OS_LOG_TYPE_DEFAULT, "Received pong from participant: %@  => clearing break before make timer", (uint8_t *)&v38, 0xCu);
  }

  objc_msgSend_setMayRequireBreakBeforeMake_(self, v24, 0, v25, v26);
LABEL_22:
}

- (void)handleGenericAVMessageFromParticipant:(id)a3 type:(unsigned int)a4 userInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "handleGenericAVMessageFromParticipant: %@   Type: %d   UserInfo: %@", (uint8_t *)&v12, 0x1Cu);
  }

  objc_msgSend__handleGenericAVMessageFromParticipant_type_userInfo_handled_(self, v11, (uint64_t)v8, v6, (uint64_t)v9, 0);
}

- (id)participantWithAVConferenceCallID:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = objc_msgSend_remoteParticipants(self, a2, a3, v3, v4, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v6);
        }
        int v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend_matchesAVConferenceCallID_(v15, v9, a3, v10, v11))
        {
          id v16 = v15;
          goto LABEL_11;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)participantWithID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ vcPartyID: %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = objc_msgSend__participantMatchingVCPartyID_(self, v6, (uint64_t)v4, v7, v8);

  return v9;
}

- (id)vcPartyIDForIMHandle:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    long long v18 = self;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ imhandle: %@", (uint8_t *)&v17, 0x16u);
  }

  id v9 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v6, ++dword_2680BE688, v7, v8);
  objc_msgSend_stringValue(v9, v10, v11, v12, v13);
  id v14 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

  if (dword_2680BE688 == 9999) {
    dword_2680BE688 = 1000;
  }
  uint64_t v15 = sub_224FB12A0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    long long v18 = v14;
    _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "  Using VC Party Coerced ID: %@", (uint8_t *)&v17, 0xCu);
  }

  return v14;
}

- (id)participantMatchingIMHandle:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_participants;
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v5);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend_imHandle(v14, v7, v8, v9, v10, (void)v17);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (void)_setCallerProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSDictionary *)a3;
  uint64_t v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = self;
    __int16 v17 = 2112;
    long long v18 = v5;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "avchat: %@ properties: %@", (uint8_t *)&v15, 0x16u);
  }

  if (self->_callerProperties != v5)
  {
    objc_storeStrong((id *)&self->_callerProperties, a3);
    id v11 = objc_msgSend_initiatorParticipant(self, v7, v8, v9, v10);
    objc_msgSend_setProperties_(v11, v12, (uint64_t)v5, v13, v14);
  }
}

- (IMHandle)otherIMHandle
{
  if ((unint64_t)objc_msgSend_count(self->_participants, a2, v2, v3, v4) < 2)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend_objectAtIndex_(self->_participants, v6, 1, v7, v8);
    uint64_t v14 = objc_msgSend_imHandle(v9, v10, v11, v12, v13);
  }
  return (IMHandle *)v14;
}

- (BOOL)_isProxy
{
  return 0;
}

- (IMAccount)account
{
  return (IMAccount *)objc_msgSend_account(self->_initiator, a2, v2, v3, v4);
}

- (void)_setConferenceID:(id)a3
{
  if (self->_conferenceID != a3)
  {
    uint64_t v6 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
    conferenceID = self->_conferenceID;
    self->_conferenceID = v6;

    objc_msgSend__postNotificationName_userInfo_(self, v8, @"__kIMAVChatConferenceIDChangedNotification", 0, v9);
    objc_msgSend_makeObjectsPerformSelector_withObject_(self->_participants, v10, (uint64_t)sel__setConferenceID_, (uint64_t)self->_conferenceID, v11);
    uint64_t v12 = sub_224FB12A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Conference ID changed sending proxy update", v22, 2u);
    }

    __int16 v17 = objc_msgSend_sharedInstance(IMAVCallManager, v13, v14, v15, v16);
    objc_msgSend__sendProxyUpdate(v17, v18, v19, v20, v21);
  }
}

- (int)endedError
{
  return objc_msgSend_error(self->_localParticipant, a2, v2, v3, v4);
}

- (unsigned)endedReason
{
  return objc_msgSend_reasonChatEnded(self->_localParticipant, a2, v2, v3, v4);
}

- (void)_setCreationDate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v12, 0xCu);
  }

  if (!self->_dateCreated)
  {
    objc_msgSend_date(MEMORY[0x263EFF910], v4, v5, v6, v7);
    uint64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateCreated = self->_dateCreated;
    self->_dateCreated = v8;
  }
  if (!self->_conferenceID)
  {
    sub_224FAAC34();
    uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    conferenceID = self->_conferenceID;
    self->_conferenceID = v10;
  }
}

- (void)_setDateConnected
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    uint64_t v21 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v20, 0xCu);
  }

  if (!self->_dateConnected)
  {
    objc_msgSend_date(MEMORY[0x263EFF910], v4, v5, v6, v7);
    uint64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateConnected = self->_dateConnected;
    self->_dateConnected = v8;

    uint64_t v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Date connected changed, sending proxy update", (uint8_t *)&v20, 2u);
    }

    uint64_t v15 = objc_msgSend_sharedInstance(IMAVCallManager, v11, v12, v13, v14);
    objc_msgSend__sendProxyUpdate(v15, v16, v17, v18, v19);
  }
}

- (int64_t)_bustedCallID
{
  uint64_t v5 = objc_msgSend_remoteParticipants(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend___imFirstObject(v5, v6, v7, v8, v9);
  int64_t v15 = objc_msgSend_bestCallID(v10, v11, v12, v13, v14);

  return v15;
}

- (BOOL)isConferenceSilent
{
  return 0;
}

- (NSNumber)_remoteNatType
{
  uint64_t v5 = objc_msgSend_remoteParticipants(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_lastObject(v5, v6, v7, v8, v9);
  int64_t v15 = objc_msgSend__natType(v10, v11, v12, v13, v14);

  return (NSNumber *)v15;
}

- (NSNumber)_currentNatType
{
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_natTypeForAVChat_(v6, v7, (uint64_t)self, v8, v9);

  return (NSNumber *)v10;
}

- (NSNumber)_connectDuration
{
  uint64_t v6 = objc_msgSend_dateConnected(self, a2, v2, v3, v4);
  uint64_t v11 = (void *)v6;
  if (self->_dateStartedConnecting)
  {
    if (!v6)
    {
      uint64_t v11 = objc_msgSend_date(MEMORY[0x263EFF910], v7, v8, v9, v10);
    }
    objc_msgSend_timeIntervalSinceDate_(v11, v7, (uint64_t)self->_dateStartedConnecting, v9, v10);
  }
  else
  {
    double v12 = 0.0;
  }
  uint64_t v13 = objc_msgSend_numberWithDouble_(NSNumber, v7, v8, v9, v10, v12);

  return (NSNumber *)v13;
}

- (NSNumber)_callDuration
{
  uint64_t v6 = objc_msgSend_dateConnected(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_dateEnded(self, v7, v8, v9, v10);
  uint64_t v16 = v11;
  if (v6)
  {
    if (v11)
    {
      id v17 = v11;
    }
    else
    {
      objc_msgSend_date(MEMORY[0x263EFF910], v12, v13, v14, v15);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v21 = v17;
    objc_msgSend_timeIntervalSinceDate_(v17, v18, (uint64_t)v6, v19, v20);
    double v23 = v22;

    objc_msgSend_numberWithDouble_(NSNumber, v24, v25, v26, v27, v23);
  }
  else
  {
    objc_msgSend_numberWithDouble_(NSNumber, v12, v13, v14, v15, 0.0);
  id v28 = };

  return (NSNumber *)v28;
}

- (NSNumber)_relayConnectDuration
{
  double v5 = 0.0;
  if (self->_dateReceivedRelayInitiate)
  {
    dateReceivedRelayUpdate = self->_dateReceivedRelayUpdate;
    if (dateReceivedRelayUpdate)
    {
      uint64_t v8 = dateReceivedRelayUpdate;
    }
    else
    {
      objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3, v4);
      uint64_t v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    double v12 = v8;
    objc_msgSend_timeIntervalSinceDate_(v8, v9, (uint64_t)self->_dateReceivedRelayInitiate, v10, v11);
    double v5 = v13;
  }
  if (v5 >= 0.0) {
    double v14 = v5;
  }
  else {
    double v14 = 0.0;
  }
  uint64_t v15 = NSNumber;
  return (NSNumber *)objc_msgSend_numberWithDouble_(v15, a2, v2, v3, v4, v14);
}

- (BOOL)_usesRelay
{
  return (int)objc_msgSend__connectionType(self, a2, v2, v3, v4) > 1;
}

- (NSNumber)_natType
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  natType = self->_natType;
  if (natType) {
    uint64_t v6 = objc_msgSend_unsignedIntValue(natType, a2, v2, v3, v4);
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  if (CFPreferencesGetAppBooleanValue(@"UseCustomNatType", @"com.apple.conference", 0))
  {
    uint64_t v6 = IMGetDomainIntForKey();
    uint64_t v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v6;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "overriding natType: %u", (uint8_t *)v13, 8u);
    }
  }
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, v6, v8, v9);
  }
  return (NSNumber *)v11;
}

- (BOOL)isUsingWifi
{
  return objc_msgSend__localNetworkConnectionType(self, a2, v2, v3, v4) != 1;
}

- (void)setRelayed:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_relayed != a3)
  {
    BOOL v3 = a3;
    double v5 = sub_224FB12A0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"YES";
      if (self->_relayed) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      if (!v3) {
        uint64_t v6 = @"NO";
      }
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set relayed from %@ to %@.", (uint8_t *)&v16, 0x16u);
    }

    self->_relayed = v3;
    double v12 = objc_msgSend_sharedInstance(IMAVInterface, v8, v9, v10, v11);
    objc_msgSend_chatRelayedStatusChanged_(v12, v13, (uint64_t)self, v14, v15);
  }
}

- (void)setMayRequireBreakBeforeMake:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_mayRequireBreakBeforeMake != a3)
  {
    BOOL v3 = a3;
    double v5 = sub_224FB12A0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"YES";
      if (self->_mayRequireBreakBeforeMake) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      if (!v3) {
        uint64_t v6 = @"NO";
      }
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      double v13 = v6;
      _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set mayRequireBreakBeforeMake from %@ to %@.", (uint8_t *)&v10, 0x16u);
    }

    self->_mayRequireBreakBeforeMake = v3;
    objc_msgSend__postNotificationName_userInfo_(self, v8, @"__kIMAVChatMayRequireBreakBeforeMakeChangedNotification", 0, v9);
  }
}

- (unint64_t)_localNetworkConnectionType
{
  unint64_t result = self->_localNetworkConnectionType;
  if (!result)
  {
    uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], a2, v2, v3, v4);
    char v16 = objc_msgSend_allowAnyNetwork(v7, v8, v9, v10, v11);
    if ((v16 & 1) != 0
      || (objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v12, v13, v14, v15),
          double v5 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_nonWifiFaceTimeAvailable(v5, v17, v18, v19, v20)))
    {
      uint64_t v21 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v12, v13, v14, v15);
      int v26 = objc_msgSend_dataActiveAndReachable(v21, v22, v23, v24, v25);

      if (v16)
      {
LABEL_8:

        if (v26) {
          return 1;
        }
        else {
          return 2;
        }
      }
    }
    else
    {
      int v26 = 0;
    }

    goto LABEL_8;
  }
  return result;
}

- (NSArray)_imHandles
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = objc_msgSend_remoteParticipants(self, v4, v5, v6, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v10)
  {
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = objc_msgSend_imHandle(*(void **)(*((void *)&v23 + 1) + 8 * i), v11, v12, v13, v14);
        objc_msgSend_addObject_(v3, v19, (uint64_t)v18, v20, v21);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v15);
  }

  return (NSArray *)v3;
}

- (void)_handleAVError:(id)a3
{
  v53[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v49 = self;
    __int16 v50 = 2112;
    id v51 = v5;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "AVChat: %@ received error: %@", buf, 0x16u);
  }

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v41 = sub_224FB12A0();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = (objc_class *)objc_opt_class();
      BOOL v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138412802;
      uint64_t v49 = self;
      __int16 v50 = 2112;
      id v51 = v5;
      __int16 v52 = 2112;
      v53[0] = v43;
      _os_log_impl(&dword_224F93000, v41, OS_LOG_TYPE_DEFAULT, "[WARN] Invalid error type posted to chat: %@   error: %@    class: %@", buf, 0x20u);
    }
  }
  else if (objc_msgSend_isActive(self, v7, v8, v9, v10))
  {
    uint64_t v47 = 0;
    unsigned __int8 v46 = 1;
    int v15 = objc_msgSend_state(self, v11, v12, v13, v14);
    sub_224FA6104(v5, (_DWORD *)&v47 + 1, (int *)&v47, &v46);
    uint64_t v16 = sub_224FB12A0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_domain(v5, v17, v18, v19, v20);
      uint64_t v21 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      long long v26 = objc_msgSend_description(v5, v22, v23, v24, v25);
      int v31 = objc_msgSend_code(v5, v27, v28, v29, v30);
      uint64_t v36 = _NSStringDescriptionForIMAVChatEndedReason(HIDWORD(v47), v32, v33, v34, v35);
      *(_DWORD *)buf = 138413058;
      uint64_t v49 = v21;
      __int16 v50 = 2112;
      id v51 = v26;
      __int16 v52 = 1024;
      LODWORD(v53[0]) = v31;
      WORD2(v53[0]) = 2112;
      *(void *)((char *)v53 + 6) = v36;
      _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, "Conference received error: [%@:%@:%d:%@]", buf, 0x26u);
    }
    int v37 = v46;
    int v38 = sub_224FB12A0();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    if (v15 != 4 || v37)
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v38, OS_LOG_TYPE_DEFAULT, "This is a fatal error", buf, 2u);
      }

      objc_storeStrong((id *)&self->_error, a3);
      objc_msgSend__endChatWithReason_andError_(self, v44, HIDWORD(v47), v47, v45);
    }
    else
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v38, OS_LOG_TYPE_DEFAULT, "This is not a fatal error, and we're connected already - so ignoring", buf, 2u);
      }
    }
  }
  else
  {
    int v40 = sub_224FB12A0();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "Ignoring error, we're already dead anyway!", buf, 2u);
    }
  }
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_GUID)
  {
    uint64_t v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification name: %@  object: %@  userInfo: %@", (uint8_t *)&v15, 0x20u);
    }

    uint64_t v13 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v9, v10, v11, v12);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v13, v14, (uint64_t)v6, (uint64_t)self, (uint64_t)v7);
  }
}

- (void)_postNotificationName:(id)a3 participant:(id)a4 userInfo:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_GUID)
  {
    uint64_t v11 = sub_224FB12A0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "Posting participant notification name: %@  object: %@  userInfo: %@", (uint8_t *)&v18, 0x20u);
    }

    id v16 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v12, v13, v14, v15);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v16, v17, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10);
  }
}

- (void)_noteFirstFrame
{
  id v6 = objc_msgSend_dateConnected(self, a2, v2, v3, v4);

  if (!v6)
  {
    objc_msgSend__setDateConnected(self, v7, v8, v9, v10);
    objc_msgSend__submitCallConnectedLogging(self, v11, v12, v13, v14);
  }
  self->_hasReceivedFirstFrame = 1;
  objc_msgSend_sharedInstance(IMAVCallManager, v7, v8, v9, v10);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendProxyUpdate(v19, v15, v16, v17, v18);
}

- (id)_timings
{
  return self->_timingCollection;
}

- (void)_clearCache
{
  objc_msgSend_removeAllObjects(self->_conferenceStateCache, a2, v2, v3, v4);
}

- (void)_cacheBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id key = a4;
  if (!self->_conferenceStateCache)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    conferenceStateCache = self->_conferenceStateCache;
    self->_conferenceStateCache = Mutable;
  }
  uint64_t v11 = objc_msgSend_numberWithBool_(NSNumber, v6, v4, v7, v8);
  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_conferenceStateCache, key, v11);
  }
}

- (BOOL)_hasCachedBoolForKey:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_objectForKey_(self->_conferenceStateCache, v9, (uint64_t)v4, v10, v11);
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_cachedBoolForKey:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_objectForKey_(self->_conferenceStateCache, v9, (uint64_t)v4, v10, v11);
    char v17 = objc_msgSend_BOOLValue(v12, v13, v14, v15, v16);
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (OS_dispatch_queue)_conferenceQueue
{
  return self->_conferenceQueue;
}

- (void)set_conferenceQueue:(id)a3
{
}

- (int)_connectionType
{
  return self->_connectionType;
}

- (void)_setConnectionType:(int)a3
{
  self->_connectionType = a3;
}

- (NSString)_callStatisticsGUID
{
  return self->_callStatisticsGUID;
}

- (void)_setCallStatisticsGUID:(id)a3
{
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (NSDictionary)callerProperties
{
  return self->_callerProperties;
}

- (IMHandle)initiatorIMHandle
{
  return self->_initiator;
}

- (void)_setNatType:(id)a3
{
}

- (void)_setLocalNetworkConnectionType:(unint64_t)a3
{
  self->_localNetworkConnectionType = a3;
}

- (unint64_t)_remoteNetworkConnectionType
{
  return self->_remoteNetworkConnectionType;
}

- (void)_setRemoteNetworkConnectionType:(unint64_t)a3
{
  self->_remoteNetworkConnectionType = a3;
}

- (BOOL)_needsAudioRestart
{
  return self->_needsAudioRestart;
}

- (void)_setNeedsAudioRestart:(BOOL)a3
{
  self->_needsAudioRestart = a3;
}

- (BOOL)_needsVideoRestart
{
  return self->_needsVideoRestart;
}

- (void)_setNeedsVideoRestart:(BOOL)a3
{
  self->_needsVideoRestart = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (NSDate)_interruptionBegan
{
  return self->_interruptionBegan;
}

- (void)_setInterruptionBegan:(id)a3
{
}

- (NSNumber)_frontCameraCaptureTime
{
  return self->_frontCameraCaptureTime;
}

- (void)_setFrontCameraCaptureTime:(id)a3
{
}

- (NSNumber)_backCameraCaptureTime
{
  return self->_backCameraCaptureTime;
}

- (void)_setBackCameraCaptureTime:(id)a3
{
}

- (NSNumber)dataRate
{
  return self->_dataRate;
}

- (void)setDataRate:(id)a3
{
}

- (NSNumber)dataUploaded
{
  return self->_dataUploaded;
}

- (void)setDataUploaded:(id)a3
{
}

- (NSNumber)dataDownloaded
{
  return self->_dataDownloaded;
}

- (void)setDataDownloaded:(id)a3
{
}

- (BOOL)_isVideoInterrupted
{
  return self->_isVideoInterrupted;
}

- (void)_setIsVideoInterrupted:(BOOL)a3
{
  self->_isVideoInterrupted = a3;
}

- (BOOL)_isAudioInterrupted
{
  return self->_isAudioInterrupted;
}

- (void)_setIsAudioInterrupted:(BOOL)a3
{
  self->_isAudioInterrupted = a3;
}

- (BOOL)_connectionStarted
{
  return self->_connectionStarted;
}

- (void)_setConnectionStarted:(BOOL)a3
{
  self->_connectionStarted = a3;
}

- (NSData)_relayRemotePrimaryIdentifier
{
  return self->_relayRemotePrimaryIdentifier;
}

- (void)_setRelayRemotePrimaryIdentifier:(id)a3
{
}

- (BOOL)isRelayed
{
  return self->_relayed;
}

- (BOOL)isCaller
{
  return self->_isCaller;
}

- (NSString)conferenceID
{
  return self->_conferenceID;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)_setGUID:(id)a3
{
}

- (id)_conferenceController
{
  return self->_conferenceController;
}

- (void)_setConferenceController:(id)a3
{
  self->_conferenceController = a3;
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (unsigned)state
{
  return self->_localState;
}

- (IMAVChatParticipant)localParticipant
{
  return self->_localParticipant;
}

- (NSArray)participants
{
  return &self->_participants->super;
}

- (NSDictionary)_extraServerContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)_pingTestResults
{
  return self->_pingTestResults;
}

- (void)_setPingTestResults:(id)a3
{
}

- (int64_t)_pingTestResult
{
  return self->_pingTestResult;
}

- (void)_setPingTestResult:(int64_t)a3
{
  self->_pingTestResult = a3;
}

- (int64_t)_networkCheckResult
{
  return self->_networkCheckResult;
}

- (void)_setNetworkCheckResult:(int64_t)a3
{
  self->_networkCheckResult = a3;
}

- (BOOL)mayRequireBreakBeforeMake
{
  return self->_mayRequireBreakBeforeMake;
}

- (NSTimer)inviteTimeoutTimer
{
  return self->_inviteTimeoutTimer;
}

- (void)_setInviteTimeoutTimer:(id)a3
{
}

- (NSDate)inviteTimeoutTimerStart
{
  return self->_inviteTimeoutTimerStart;
}

- (void)_setInviteTimeoutTimerStart:(id)a3
{
}

- (NSTimer)firstFrameTimeoutTimer
{
  return self->_firstFrameTimeoutTimer;
}

- (void)_setFirstFrameTimeoutTimer:(id)a3
{
}

- (NSTimer)connectionTimeoutTimer
{
  return self->_connectionTimeoutTimer;
}

- (void)_setConnectionTimeoutTimer:(id)a3
{
}

- (CGSize)portraitAspectRatios
{
  double width = self->_portraitAspectRatios.width;
  double height = self->_portraitAspectRatios.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setPortraitAspectRatios:(CGSize)a3
{
  self->_portraitAspectRatios = a3;
}

- (CGSize)landscapeAspectRatios
{
  double width = self->_landscapeAspectRatios.width;
  double height = self->_landscapeAspectRatios.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setLandscapeAspectRatios:(CGSize)a3
{
  self->_landscapeAspectRatios = a3;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (void)_setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (BOOL)didRemoteMute
{
  return self->_didRemoteMute;
}

- (void)_setDidRemoteMute:(BOOL)a3
{
  self->_didRemoteMute = a3;
}

- (BOOL)didRemotePause
{
  return self->_didRemotePause;
}

- (void)_setDidRemotePause:(BOOL)a3
{
  self->_didRemotePause = a3;
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)_setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (BOOL)metadataFinalized
{
  return self->_metadataFinalized;
}

- (void)_setMetadataFinalized:(BOOL)a3
{
  self->_metadataFinalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_firstFrameTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_inviteTimeoutTimerStart, 0);
  objc_storeStrong((id *)&self->_inviteTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_callStatisticsGUID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_relayRemotePrimaryIdentifier, 0);
  objc_storeStrong((id *)&self->_conferenceQueue, 0);
  objc_storeStrong((id *)&self->_callerProperties, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_dataDownloaded, 0);
  objc_storeStrong((id *)&self->_dataUploaded, 0);
  objc_storeStrong((id *)&self->_dataRate, 0);
  objc_storeStrong((id *)&self->_backCameraCaptureTime, 0);
  objc_storeStrong((id *)&self->_frontCameraCaptureTime, 0);
  objc_storeStrong((id *)&self->_pingTestResults, 0);
  objc_storeStrong((id *)&self->_interruptionBegan, 0);
  objc_storeStrong((id *)&self->_dateReceivedRelayUpdate, 0);
  objc_storeStrong((id *)&self->_dateReceivedRelayInitiate, 0);
  objc_storeStrong((id *)&self->_dateEnded, 0);
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_dateStartedConnecting, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_extraServerContext, 0);
  objc_storeStrong((id *)&self->_natType, 0);
  objc_storeStrong((id *)&self->_conferenceStateCache, 0);
  objc_storeStrong((id *)&self->_localParticipant, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_conferenceID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (void)localVideoLayer
{
  id v5 = objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_localVideoLayer(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setLocalVideoLayer:(void *)a3
{
  objc_msgSend_sharedInstance(IMAVInterface, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoLayer_(v9, v6, (uint64_t)a3, v7, v8);
}

- (void)localVideoBackLayer
{
  id v5 = objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_localVideoBackLayer(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setLocalVideoBackLayer:(void *)a3
{
  objc_msgSend_sharedInstance(IMAVInterface, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoBackLayer_(v9, v6, (uint64_t)a3, v7, v8);
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend_sharedInstance(IMAVInterface, a2, v3, v4, v5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteVideoPresentationSize_forChat_(v12, v9, (uint64_t)self, v10, v11, width, height);
}

- (void)setRemoteVideoPresentationState:(unsigned int)a3
{
  uint64_t v5 = *(void *)&a3;
  objc_msgSend_sharedInstance(IMAVInterface, a2, *(uint64_t *)&a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteVideoPresentationState_forChat_(v9, v7, v5, (uint64_t)self, v8);
}

- (BOOL)startPreviewWithError:(id *)a3
{
  uint64_t v5 = a3;
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVInterface, a2, (uint64_t)a3, v3, v4);
  LOBYTE(v5) = objc_msgSend_startPreviewWithError_(v6, v7, (uint64_t)v5, v8, v9);

  return (char)v5;
}

- (BOOL)stopPreview
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  char v10 = objc_msgSend_stopPreview(v5, v6, v7, v8, v9);

  return v10;
}

- (void)_postParticipantMediaChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 cameraWillSwitch:(BOOL)a7 camera:(unsigned int)a8 orientation:(unsigned int)a9 aspect:(CGSize)a10
{
  double height = a10.height;
  double width = a10.width;
  BOOL v13 = a7;
  BOOL v14 = a6;
  BOOL v15 = a5;
  BOOL v16 = a4;
  uint64_t v27 = (char *)a3;
  __int16 v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v23 = !v14 && !v13 && !v15 && !v16;
  if ((v23 & 1) != 0 || v16)
  {
    uint64_t v24 = objc_msgSend_numberWithInteger_(NSNumber, v18, a8, v20, v21);
    if (v24) {
      CFDictionarySetValue(v22, @"__kIMAVChatCameraTypeKey", v24);
    }
  }
  if ((v23 | v15) == 1)
  {
    uint64_t v25 = objc_msgSend_numberWithInteger_(NSNumber, v18, a9, v20, v21);
    if (v25) {
      CFDictionarySetValue(v22, @"__kIMAVChatCameraOrientationKey", v25);
    }
  }
  if ((v23 | v14) == 1)
  {
    long long v26 = objc_msgSend_valueWithSize_(MEMORY[0x263F08D40], v18, v19, v20, v21, width, height);
    if (v26) {
      CFDictionarySetValue(v22, @"__kIMAVChatCameraAspectRatioKey", v26);
    }
  }
  if ((v23 | v13) == 1) {
    CFDictionarySetValue(v22, @"__kIMAVChatCameraWillChangeKey", &unk_26D8638F0);
  }
  if (v27) {
    objc_msgSend__postNotificationName_participant_userInfo_(self, v27, @"__kIMAVChatMediaPropertiesChangedNotification", (uint64_t)v27, (uint64_t)v22);
  }
  else {
    objc_msgSend__postNotificationName_userInfo_(self, 0, @"__kIMAVChatMediaPropertiesChangedNotification", (uint64_t)v22, v21);
  }
}

- (unsigned)cameraType
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, v2, v3, v4);
  unsigned int v10 = objc_msgSend_cameraType(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setCameraType:(unsigned int)a3
{
  uint64_t v5 = *(void *)&a3;
  if (a3 != 1
    || (objc_msgSend_sharedInstance(IMAVInterface, a2, *(uint64_t *)&a3, v3, v4),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v12 = objc_msgSend_systemSupportsBackFacingCamera(v7, v8, v9, v10, v11),
        v7,
        v12))
  {
    BOOL v13 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, *(uint64_t *)&a3, v3, v4);
    objc_msgSend_setCameraType_(v13, v14, v5, v15, v16);

    LODWORD(v13) = objc_msgSend_cameraOrientation(self, v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_cameraOrientation(self, v21, v22, v23, v24);
    objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(self, v26, v25, v5, v27);
    objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orientation_aspect_(self, v28, 0, 1, 0, 0, 0, v5, v13);
  }
}

- (unsigned)cameraOrientation
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, v2, v3, v4);
  unsigned int v10 = objc_msgSend_cameraOrientation(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setCameraOrientation:(unsigned int)a3
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, *(uint64_t *)&a3, v3, v4);
  objc_msgSend_setCameraOrientation_(v7, v8, v5, v9, v10);

  uint64_t v15 = objc_msgSend_cameraType(self, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_cameraType(self, v16, v17, v18, v19);
  objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(self, v21, v5, v20, v22);
  int v24 = v5;
  objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orientation_aspect_(self, v23, 0, 0, 1, 0, 0, v15, v24);
}

- (CGSize)localAspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  if (a3 > 1) {
    objc_msgSend_landscapeAspectRatios(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  }
  else {
    objc_msgSend_portraitAspectRatios(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)setLocalAspectRatio:(CGSize)a3 cameraOrientation:(unsigned int)a4 cameraType:(unsigned int)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v9 = sub_224FB12A0();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4 > 1)
  {
    if (v10)
    {
      v38.double width = width;
      v38.double height = height;
      uint64_t v20 = NSStringFromSize(v38);
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      uint64_t v35 = v20;
      _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Chat: %@ set local landscape aspect ratio to %@", buf, 0x16u);
    }
    objc_msgSend__setLandscapeAspectRatios_(self, v21, v22, v23, v24, width, height);
  }
  else
  {
    if (v10)
    {
      v37.double width = width;
      v37.double height = height;
      uint64_t v11 = NSStringFromSize(v37);
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      uint64_t v35 = v11;
      _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Chat: %@ set local portrait aspect ratio to %@", buf, 0x16u);
    }
    objc_msgSend__setPortraitAspectRatios_(self, v12, v13, v14, v15, width, height);
  }
  uint64_t v25 = objc_msgSend_cameraType(self, v16, v17, v18, v19);
  int v31 = objc_msgSend_cameraOrientation(self, v26, v27, v28, v29);
  objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orientation_aspect_(self, v30, 0, 0, 0, 1, 0, v25, width, height, v31);
}

+ (double)defaultInvitationTimeoutTime
{
  return *(double *)&qword_2680BE6F8;
}

+ (void)setDefaultInvitationTimeoutTime:(double)a3
{
  qword_2680BE6F8 = *(void *)&a3;
}

+ (double)defaultConnectionTimeoutTime
{
  return *(double *)&qword_2680BE700;
}

+ (void)setDefaultConnectionTimeoutTime:(double)a3
{
  qword_2680BE700 = *(void *)&a3;
}

- (double)invitationTimeoutTime
{
  return self->_invitationTimeoutTime;
}

- (void)setInvitationTimeoutTime:(double)a3
{
  if (self->_invitationTimeoutTime != a3)
  {
    self->_invitationTimeoutTime = a3;
    if (objc_msgSend_state(self, a2, v3, v4, v5) == 1
      || objc_msgSend_state(self, v7, v8, v9, v10) == 2)
    {
      objc_msgSend__setInvitationTimeoutTimer(self, v7, v8, v9, v10);
    }
  }
}

- (double)connectionTimeoutTime
{
  return self->_connectionTimeoutTime;
}

- (void)setConnectionTimeoutTime:(double)a3
{
  if (self->_connectionTimeoutTime != a3)
  {
    self->_connectionTimeoutTime = a3;
    if (objc_msgSend_state(self, a2, v3, v4, v5) == 3)
    {
      objc_msgSend__setConnectionTimeoutTimer(self, v7, v8, v9, v10);
    }
  }
}

- (void)_clearConnectionTimeoutTimer
{
  double v6 = objc_msgSend_connectionTimeoutTimer(self, a2, v2, v3, v4);

  if (v6)
  {
    uint64_t v7 = sub_224FB12A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Clearing connection timeout timer", v20, 2u);
    }

    uint64_t v12 = objc_msgSend_connectionTimeoutTimer(self, v8, v9, v10, v11);
    objc_msgSend_invalidate(v12, v13, v14, v15, v16);

    objc_msgSend__setConnectionTimeoutTimer_(self, v17, 0, v18, v19);
  }
}

- (void)_setConnectionTimeoutTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_msgSend__clearConnectionTimeoutTimer(self, a2, v2, v3, v4);
  if (self->_connectionTimeoutTime > 0.0)
  {
    double v6 = sub_224FB12A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double connectionTimeoutTime = self->_connectionTimeoutTime;
      *(_DWORD *)buf = 134217984;
      double v9 = connectionTimeoutTime;
      _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "Setting new connection timeout timer for %f seconds", buf, 0xCu);
    }

    im_main_thread();
  }
}

- (void)_connectionTimeout:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v6 = objc_msgSend_state(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v7 = sub_224FB12A0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 4)
  {
    if (v8)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring timeout timer, we're connected", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v8)
    {
      int v16 = 138412290;
      uint64_t v17 = self;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Connection timeout for: %@", (uint8_t *)&v16, 0xCu);
    }

    double v9 = sub_224FB12A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Hitting connection timeout", (uint8_t *)&v16, 2u);
    }

    objc_msgSend__clearConnectionTimeoutTimer(self, v10, v11, v12, v13);
    objc_msgSend__endChatWithReason_andError_(self, v14, 6, 1008, v15);
  }
}

- (void)_clearInvitationTimeoutTimer
{
  int v6 = objc_msgSend_inviteTimeoutTimer(self, a2, v2, v3, v4);

  if (v6)
  {
    uint64_t v7 = sub_224FB12A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Clearing invitation timeout timer", v20, 2u);
    }

    uint64_t v12 = objc_msgSend_inviteTimeoutTimer(self, v8, v9, v10, v11);
    objc_msgSend_invalidate(v12, v13, v14, v15, v16);

    objc_msgSend__setInviteTimeoutTimer_(self, v17, 0, v18, v19);
  }
}

- (void)_setInvitationTimeoutTimer
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_msgSend__clearInvitationTimeoutTimer(self, a2, v2, v3, v4);
  objc_msgSend__setInviteTimeoutTimerStart_(self, v6, 0, v7, v8);
  if (self->_invitationTimeoutTime > 0.0)
  {
    uint64_t v9 = sub_224FB12A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double invitationTimeoutTime = self->_invitationTimeoutTime;
      *(_DWORD *)buf = 134217984;
      double v12 = invitationTimeoutTime;
      _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Setting new invitation timeout timer for %f seconds", buf, 0xCu);
    }

    im_main_thread();
  }
}

- (void)_invitationTimeout:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    uint64_t v18 = self;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "Invitation timeout for: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Hitting Invitation timeout", (uint8_t *)&v17, 2u);
  }

  objc_msgSend__clearInvitationTimeoutTimer(self, v6, v7, v8, v9);
  if (objc_msgSend_isCaller(self, v10, v11, v12, v13)) {
    objc_msgSend__endChatWithReason_andError_(self, v14, 22, 0, v16);
  }
  else {
    objc_msgSend_declineInvitationWithResponse_(self, v14, 7, v15, v16);
  }
}

- (void)_reduceInvitationTimeoutTime
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v8 = objc_msgSend_inviteTimeoutTimerStart(self, v4, v5, v6, v7);
  objc_msgSend_timeIntervalSinceDate_(v3, v9, (uint64_t)v8, v10, v11);
  double v13 = v12;

  double v18 = self->_invitationTimeoutTime * 0.5;
  if (v13 < v18)
  {
    objc_msgSend_setInvitationTimeoutTime_(self, v14, v15, v16, v17, self->_invitationTimeoutTime * 0.5);
    uint64_t v19 = sub_224FB12A0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      double v21 = v18;
      _os_log_impl(&dword_224F93000, v19, OS_LOG_TYPE_DEFAULT, "Reducing invitation timeout time to %f", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_clearFirstFrameTimeoutTimer
{
  uint64_t v6 = objc_msgSend_firstFrameTimeoutTimer(self, a2, v2, v3, v4);

  if (v6)
  {
    uint64_t v7 = sub_224FB12A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v20 = 0;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Clearing first frame timeout timer", v20, 2u);
    }

    double v12 = objc_msgSend_firstFrameTimeoutTimer(self, v8, v9, v10, v11);
    objc_msgSend_invalidate(v12, v13, v14, v15, v16);

    objc_msgSend__setFirstFrameTimeoutTimer_(self, v17, 0, v18, v19);
  }
}

- (void)_setFirstFrameTimeoutTimer
{
  objc_msgSend__clearFirstFrameTimeoutTimer(self, a2, v2, v3, v4);
  if (objc_msgSend_isVideo(self, v6, v7, v8, v9) && !self->_hasReceivedFirstFrame)
  {
    uint64_t v14 = objc_msgSend_firstFrameTimeoutTimer(self, v10, v11, v12, v13);

    if (!v14) {
      im_main_thread();
    }
  }
}

- (void)_firstFrameTimeout:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138412290;
    uint64_t v32 = self;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "First frame timeout for: %@", (uint8_t *)&v31, 0xCu);
  }

  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Hitting first frame timeout timeout, generating fake first frame", (uint8_t *)&v31, 2u);
  }

  uint64_t v10 = objc_msgSend_remoteParticipants(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15)
  {
    int v20 = objc_msgSend_remoteParticipants(self, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend___imFirstObject(v20, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v25 = 0;
  }
  objc_msgSend__noteFirstFrame(self, v16, v17, v18, v19);
  objc_msgSend__postNotificationName_participant_userInfo_(self, v26, @"__kIMAVChatParticipantReceivedFirstFrameNotification", (uint64_t)v25, 0);
  objc_msgSend__clearFirstFrameTimeoutTimer(self, v27, v28, v29, v30);
}

- (void)_vccInitDidFinish:(id)a3
{
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)NSSize v38 = 0;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, v38, 2u);
  }

  if (self->_localState != 5)
  {
    if (self->_hasPendingInit)
    {
      if (!self->_isCaller) {
        goto LABEL_10;
      }
      uint64_t v9 = objc_msgSend_remoteParticipants(self, v5, v6, v7, v8);
      objc_msgSend_makeObjectsPerformSelector_(v9, v10, (uint64_t)sel_sendInvitation, v11, v12);
    }
    else
    {
      if (!self->_hasPendingAccept) {
        goto LABEL_10;
      }
      uint64_t v9 = objc_msgSend_initiatorParticipant(self, v5, v6, v7, v8);
      objc_msgSend_sendResponse_(v9, v13, 0, v14, v15);
    }

LABEL_10:
    self->_hasPendingInit = 0;
    self->_hasPendingAccept = 0;
    if (objc_msgSend_isActive(self, v5, v6, v7, v8))
    {
      int v20 = objc_msgSend_sharedInstance(IMAVInterface, v16, v17, v18, v19);
      objc_msgSend_landscapeAspectRatios(self, v21, v22, v23, v24);
      double v26 = v25;
      double v28 = v27;
      objc_msgSend_portraitAspectRatios(self, v29, v30, v31, v32);
      objc_msgSend_avChat_setLocalLandscapeAspectRatio_localPortraitAspectRatio_(v20, v33, (uint64_t)self, v34, v35, v26, v28, v36, v37);
    }
  }
}

- (void)conferenceDidStopWithCallID:(int64_t)a3 error:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v10 = objc_msgSend_participantWithAVConferenceCallID_(self, v7, a3, v8, v9);
  uint64_t v14 = objc_msgSend__callInfoForCallID_(v10, v11, a3, v12, v13);
  objc_msgSend_setState_(v14, v15, 4, v16, v17);
  if (v6)
  {
    objc_msgSend__handleAVError_(self, v18, (uint64_t)v6, v20, v21);
  }
  else if (objc_msgSend_hasUnfinishedSessions(v10, v18, v19, v20, v21))
  {
    double v25 = sub_224FB12A0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_224F93000, v25, OS_LOG_TYPE_DEFAULT, "The other party still has other sessions, so we will not be hanging up.", (uint8_t *)&v32, 2u);
    }
  }
  else
  {
    objc_msgSend_endChatWithReason_(self, v22, 9, v23, v24);
  }
  double v26 = sub_224FB12A0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = objc_msgSend__participantsCallInfo(v10, v27, v28, v29, v30);
    int v32 = 138412290;
    uint64_t v33 = v31;
    _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "conferenceDidStopWithCallID participant info states %@", (uint8_t *)&v32, 0xCu);
  }
}

- (void)conferenceDidPauseAudioWithCallID:(int64_t)a3 didPauseAudio:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412802;
    uint64_t v24 = self;
    __int16 v25 = 1024;
    int v26 = v5;
    __int16 v27 = 1024;
    BOOL v28 = v4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@ callID: %d didPauseAudio: %d", (uint8_t *)&v23, 0x18u);
  }

  objc_msgSend__clearCache(self, v8, v9, v10, v11);
  objc_msgSend__postNotificationName_userInfo_(self, v12, @"__kIMAVChatSendingAudioChangedNotification", 0, v13);
  uint64_t v18 = objc_msgSend_sharedInstance(IMAVCallManager, v14, v15, v16, v17);
  objc_msgSend__sendProxyUpdate(v18, v19, v20, v21, v22);
}

- (void)conferenceAVConferenceCallID:(int64_t)a3 didConnect:(BOOL)a4
{
  BOOL v5 = a4;
  int v6 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend_participantWithAVConferenceCallID_(self, a2, a3, a4, v4);
  if (v10)
  {
    objc_msgSend__conferenceOtherParticipant_didConnect_(self, v8, (uint64_t)v10, v5, v9);
  }
  else
  {
    uint64_t v11 = sub_224FB12A0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v6;
      _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVChat conferencePersonWithID:didConnect:] received for unknown callee with callID %d", (uint8_t *)v12, 8u);
    }
  }
}

- (void)_conferenceOtherParticipant:(id)a3 didConnect:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend_state(v6, v7, v8, v9, v10) != 5)
  {
    if (v6)
    {
      if (v4)
      {
        uint64_t v15 = objc_msgSend_imHandle(v6, v11, v12, v13, v14);
        uint64_t v20 = objc_msgSend_invitedBy(self->_localParticipant, v16, v17, v18, v19);

        if (v15 == v20) {
          objc_msgSend_setWaitingToConnect_(v6, v21, 0, v22, v23);
        }
        objc_msgSend_setState_(v6, v21, 4, v22, v23);
      }
      else if (objc_msgSend_hasUnfinishedSessions(v6, v11, v12, v13, v14))
      {
        __int16 v27 = sub_224FB12A0();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "The other party still has other sessions, so we will not be hanging up.", (uint8_t *)&v33, 2u);
        }
      }
      else
      {
        objc_msgSend_setStateToEndedWithReason_andError_(v6, v25, 6, 1008, v26);
      }
      uint64_t v24 = sub_224FB12A0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = objc_msgSend__participantsCallInfo(v6, v28, v29, v30, v31);
        int v33 = 138412290;
        uint64_t v34 = v32;
        _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "_conferenceOtherParticipant:didConnect: participant info states %@", (uint8_t *)&v33, 0xCu);
      }
    }
    else
    {
      uint64_t v24 = sub_224FB12A0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVChat conferencePersonWithID:didConnect:] received for unknown callee", (uint8_t *)&v33, 2u);
      }
    }
  }
}

- (void)conferencePersonWithID:(id)a3 didMute:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = (IMAVChat *)a3;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412802;
    BOOL v39 = self;
    __int16 v40 = 2112;
    uint64_t v41 = v6;
    __int16 v42 = 1024;
    BOOL v43 = v4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  didMute: %d", (uint8_t *)&v38, 0x1Cu);
  }

  objc_msgSend__setDidRemoteMute_(self, v8, v4, v9, v10);
  uint64_t v18 = objc_msgSend__participantMatchingVCPartyID_(self, v11, (uint64_t)v6, v12, v13);
  if (v18)
  {
    uint64_t v19 = objc_msgSend_didRemoteMute(self, v14, v15, v16, v17);
    objc_msgSend_setAudioMuted_(v18, v20, v19, v21, v22);
    uint64_t v23 = NSDictionary;
    uint64_t v24 = NSNumber;
    uint64_t v29 = objc_msgSend_didRemoteMute(self, v25, v26, v27, v28);
    int v33 = objc_msgSend_numberWithBool_(v24, v30, v29, v31, v32);
    double v36 = objc_msgSend_dictionaryWithObject_forKey_(v23, v34, (uint64_t)v33, @"__kIMAVChatMuteStateKey", v35);
    objc_msgSend__postNotificationName_participant_userInfo_(self, v37, @"__kIMAVChatParticipantMuteChangedNotification", (uint64_t)v18, (uint64_t)v36);
  }
  else
  {
    int v33 = sub_224FB12A0();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412290;
      BOOL v39 = v6;
      _os_log_impl(&dword_224F93000, v33, OS_LOG_TYPE_DEFAULT, "[WARN] [conferencePersonWithID:didMute:] received for vcPartyID %@ not in conference!", (uint8_t *)&v38, 0xCu);
    }
  }
}

- (void)conferencePersonWithID:(id)a3 didPause:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = (IMAVChat *)a3;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412802;
    BOOL v39 = self;
    __int16 v40 = 2112;
    uint64_t v41 = v6;
    __int16 v42 = 1024;
    BOOL v43 = v4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  didPause: %d", (uint8_t *)&v38, 0x1Cu);
  }

  uint64_t v11 = objc_msgSend__participantMatchingVCPartyID_(self, v8, (uint64_t)v6, v9, v10);
  objc_msgSend__setDidRemotePause_(self, v12, v4, v13, v14);
  if (v11)
  {
    uint64_t v19 = objc_msgSend_didRemotePause(self, v15, v16, v17, v18);
    objc_msgSend_setVideoPaused_(v11, v20, v19, v21, v22);
    uint64_t v23 = NSDictionary;
    uint64_t v24 = NSNumber;
    uint64_t v29 = objc_msgSend_didRemotePause(self, v25, v26, v27, v28);
    int v33 = objc_msgSend_numberWithBool_(v24, v30, v29, v31, v32);
    double v36 = objc_msgSend_dictionaryWithObject_forKey_(v23, v34, (uint64_t)v33, @"__kIMAVChatPauseStateKey", v35);
    objc_msgSend__postNotificationName_participant_userInfo_(self, v37, @"__kIMAVChatParticipantPauseChangedNotification", (uint64_t)v11, (uint64_t)v36);
  }
  else
  {
    int v33 = sub_224FB12A0();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412290;
      BOOL v39 = v6;
      _os_log_impl(&dword_224F93000, v33, OS_LOG_TYPE_DEFAULT, "[WARN] -[conferencePersonWithID:didPause:] received for vcPartyID %@ not in conference!", (uint8_t *)&v38, 0xCu);
    }
  }
}

- (void)conferencePersonWithID:(id)a3 didDegrade:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = self;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 1024;
    BOOL v31 = v4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  personID: %@  didDegrade: %d", buf, 0x1Cu);
  }

  uint64_t v11 = objc_msgSend__participantMatchingVCPartyID_(self, v8, (uint64_t)v6, v9, v10);
  uint64_t v15 = v11;
  if (v11)
  {
    objc_msgSend_setVideoDegraded_(v11, v12, v4, v13, v14);
    uint64_t v16 = NSDictionary;
    uint64_t v20 = objc_msgSend_numberWithBool_(NSNumber, v17, v4, v18, v19);
    uint64_t v24 = objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v21, (uint64_t)v20, v22, v23, @"__kIMAVChatVideoDegradedKey", 0);
    objc_msgSend__postNotificationName_participant_userInfo_(self, v25, @"__kIMAVChatParticipantVideoQualityChangedNotification", (uint64_t)v15, (uint64_t)v24);
  }
  else
  {
    uint64_t v20 = sub_224FB12A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] [conferencePersonWithID:didDegrade] received for vcPartyID (nil)", buf, 2u);
    }
  }
}

- (void)conferencePersonWithID:(id)a3 mediaDidStall:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = self;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 1024;
    BOOL v31 = v4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  mediaDidStall: %d", buf, 0x1Cu);
  }

  uint64_t v11 = objc_msgSend__participantMatchingVCPartyID_(self, v8, (uint64_t)v6, v9, v10);
  uint64_t v15 = v11;
  if (v11)
  {
    objc_msgSend_setMediaStalled_(v11, v12, v4, v13, v14);
    uint64_t v16 = NSDictionary;
    uint64_t v20 = objc_msgSend_numberWithBool_(NSNumber, v17, v4, v18, v19);
    uint64_t v24 = objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v21, (uint64_t)v20, v22, v23, @"__kIMAVChatMediaStalledKey", 0);
    objc_msgSend__postNotificationName_participant_userInfo_(self, v25, @"__kIMAVChatParticipantMediaStalledChangedNotification", (uint64_t)v15, (uint64_t)v24);
  }
  else
  {
    uint64_t v20 = sub_224FB12A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] [conferencePersonWithID:mediaDidStall] received for vcPartyID (nil)", buf, 2u);
    }
  }
}

- (void)conferencePersonWithID:(id)a3 sendRelayRequest:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = (IMAVChat *)a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 138412802;
    unsigned __int8 v46 = self;
    __int16 v47 = 2112;
    uint64_t v48 = v6;
    __int16 v49 = 2112;
    id v50 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  parameters: %@", (uint8_t *)&v45, 0x20u);
  }

  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 138412290;
    unsigned __int8 v46 = v6;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Sending relay initiate to: %@", (uint8_t *)&v45, 0xCu);
  }

  uint64_t v13 = objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  uint64_t v18 = objc_msgSend_imHandle(v13, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_account(v18, v19, v20, v21, v22);
  __int16 v28 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v24, v25, v26, v27);
  int v33 = objc_msgSend_conferenceID(self, v29, v30, v31, v32);
  int v38 = objc_msgSend_ID(v18, v34, v35, v36, v37);
  BOOL v43 = objc_msgSend_uniqueID(v23, v39, v40, v41, v42);
  objc_msgSend_relay_sendInitateRequest_toPerson_account_(v28, v44, (uint64_t)v33, (uint64_t)v7, (uint64_t)v38, v43);
}

- (void)conferencePersonWithID:(id)a3 sendRelayUpdate:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = (IMAVChat *)a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = 138412802;
    __int16 v57 = self;
    __int16 v58 = 2112;
    __int16 v59 = v6;
    __int16 v60 = 2112;
    id v61 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  parameters: %@", (uint8_t *)&v56, 0x20u);
  }

  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = 138412290;
    __int16 v57 = v6;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Sending relay update to: %@", (uint8_t *)&v56, 0xCu);
  }

  uint64_t v13 = objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  uint64_t v18 = objc_msgSend_imHandle(v13, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_account(v18, v19, v20, v21, v22);
  __int16 v28 = objc_msgSend__timings(self, v24, v25, v26, v27);
  objc_msgSend_stopTimingForKey_(v28, v29, @"time-from-relay-initiate-to-outgoing-relay-update", v30, v31);

  objc_msgSend_startTimingForKey_(self->_timingCollection, v32, @"time-from-outgoing-relay-update-to-connected", v33, v34);
  BOOL v39 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_conferenceID(self, v40, v41, v42, v43);
  __int16 v49 = objc_msgSend_ID(v18, v45, v46, v47, v48);
  uint64_t v54 = objc_msgSend_uniqueID(v23, v50, v51, v52, v53);
  objc_msgSend_relay_sendUpdate_toPerson_account_(v39, v55, (uint64_t)v44, (uint64_t)v7, (uint64_t)v49, v54);
}

- (void)conferencePersonWithID:(id)a3 sendRelayCancel:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = (IMAVChat *)a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 138412802;
    uint64_t v46 = self;
    __int16 v47 = 2112;
    uint64_t v48 = v6;
    __int16 v49 = 2112;
    id v50 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  parameters: %@", (uint8_t *)&v45, 0x20u);
  }

  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 138412290;
    uint64_t v46 = v6;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Sending relay cancel to: %@", (uint8_t *)&v45, 0xCu);
  }

  uint64_t v13 = objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  uint64_t v18 = objc_msgSend_imHandle(v13, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_account(v18, v19, v20, v21, v22);
  __int16 v28 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v24, v25, v26, v27);
  uint64_t v33 = objc_msgSend_conferenceID(self, v29, v30, v31, v32);
  uint64_t v38 = objc_msgSend_ID(v18, v34, v35, v36, v37);
  uint64_t v43 = objc_msgSend_uniqueID(v23, v39, v40, v41, v42);
  objc_msgSend_relay_sendCancel_toPerson_account_(v28, v44, (uint64_t)v33, (uint64_t)v7, (uint64_t)v38, v43);
}

- (void)conferencePersonWithID:(id)a3 localIPDidChange:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = (IMAVChat *)a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = self;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  newBlob: %@", buf, 0x20u);
  }

  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v6;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Sending local IP change to: %@", buf, 0xCu);
  }

  uint64_t v13 = objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  uint64_t v18 = objc_msgSend__FTStringFromBaseData(v7, v14, v15, v16, v17);
  id v19 = objc_alloc(NSDictionary);
  uint64_t v23 = objc_msgSend_initWithObjectsAndKeys_(v19, v20, (uint64_t)v18, v21, v22, @"LocalIPChangeNewBlob", 0);
  objc_msgSend_sendAVMessage_userInfo_(v13, v24, 1500, (uint64_t)v23, v25);
}

- (void)setMute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  BOOL v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    int v32 = 138412546;
    uint64_t v33 = v6;
    __int16 v34 = 2112;
    uint64_t v35 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Set mute: %@ on chat (%@)", (uint8_t *)&v32, 0x16u);
  }

  if (objc_msgSend_isActive(self, v7, v8, v9, v10))
  {
    int isMute = objc_msgSend_isMute(self, v11, v12, v13, v14);
    objc_msgSend__clearCache(self, v16, v17, v18, v19);
    uint64_t v24 = objc_msgSend_sharedInstance(IMAVInterface, v20, v21, v22, v23);
    objc_msgSend_avChat_setMute_(v24, v25, (uint64_t)self, v3, v26);

    if (isMute != v3) {
      objc_msgSend__postNotificationName_userInfo_(self, v27, @"__kIMAVChatIsMutedChangedNotification", 0, v29);
    }
  }
  else
  {
    __int16 v30 = sub_224FB12A0();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = @"NO";
      if (v3) {
        id v31 = @"YES";
      }
      int v32 = 138412546;
      uint64_t v33 = v31;
      __int16 v34 = 2112;
      uint64_t v35 = self;
      _os_log_impl(&dword_224F93000, v30, OS_LOG_TYPE_DEFAULT, "Tried to set paused: %@ on an inactive chat (%@)", (uint8_t *)&v32, 0x16u);
    }
  }
  objc_msgSend_setAudioMuted_(self->_localParticipant, v27, v3, v28, v29);
}

- (BOOL)isMute
{
  if (objc_msgSend__hasCachedBoolForKey_(self, a2, @"isMute", v2, v3))
  {
    return MEMORY[0x270F9A6D0](self, sel__cachedBoolForKey_, @"isMute", v7, v8);
  }
  else
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
    uint64_t isMuteForAVChat = objc_msgSend_isMuteForAVChat_(v9, v10, (uint64_t)self, v11, v12);

    objc_msgSend__cacheBool_forKey_(self, v14, isMuteForAVChat, @"isMute", v15);
    return isMuteForAVChat;
  }
}

- (void)toggleMute
{
  uint64_t v7 = objc_msgSend_isMute(self, a2, v2, v3, v4) ^ 1;
  objc_msgSend_setMute_(self, v6, v7, v8, v9);
}

- (void)setRemoteMute:(BOOL)a3
{
  BOOL v5 = a3;
  if (objc_msgSend_isActive(self, a2, a3, v3, v4))
  {
    objc_msgSend__clearCache(self, v7, v8, v9, v10);
    objc_msgSend_sharedInstance(IMAVInterface, v11, v12, v13, v14);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_avChat_setRemoteMute_(v17, v15, (uint64_t)self, v5, v16);
  }
}

- (BOOL)isRemoteMute
{
  if (objc_msgSend__hasCachedBoolForKey_(self, a2, @"isRemoteMute", v2, v3))
  {
    return MEMORY[0x270F9A6D0](self, sel__cachedBoolForKey_, @"isRemoteMute", v7, v8);
  }
  else
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
    uint64_t isRemoteMuteForAVChat = objc_msgSend_isRemoteMuteForAVChat_(v9, v10, (uint64_t)self, v11, v12);

    objc_msgSend__cacheBool_forKey_(self, v14, isRemoteMuteForAVChat, @"isRemoteMute", v15);
    return isRemoteMuteForAVChat;
  }
}

- (BOOL)isSendingAudio
{
  if (objc_msgSend__hasCachedBoolForKey_(self, a2, @"isSendingAudio", v2, v3))
  {
    return MEMORY[0x270F9A6D0](self, sel__cachedBoolForKey_, @"isSendingAudio", v7, v8);
  }
  else
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
    uint64_t isSendingAudioForAVChat = objc_msgSend_isSendingAudioForAVChat_(v9, v10, (uint64_t)self, v11, v12);

    objc_msgSend__cacheBool_forKey_(self, v14, isSendingAudioForAVChat, @"isSendingAudio", v15);
    return isSendingAudioForAVChat;
  }
}

- (void)setIsSendingAudio:(BOOL)a3
{
  BOOL v5 = a3;
  objc_msgSend__clearCache(self, a2, a3, v3, v4);
  objc_msgSend_sharedInstance(IMAVInterface, v7, v8, v9, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avChat_setSendingAudio_(v13, v11, (uint64_t)self, v5, v12);
}

- (BOOL)hasReceivedFirstFrame
{
  return self->_hasReceivedFirstFrame;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    int v26 = 138412546;
    uint64_t v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Set paused: %@ on chat (%@)", (uint8_t *)&v26, 0x16u);
  }

  if (objc_msgSend_isActive(self, v7, v8, v9, v10))
  {
    objc_msgSend__clearCache(self, v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_sharedInstance(IMAVInterface, v15, v16, v17, v18);
    objc_msgSend_avChat_setPaused_(v19, v20, (uint64_t)self, v3, v21);
  }
  else
  {
    uint64_t v19 = sub_224FB12A0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = @"NO";
      if (v3) {
        uint64_t v22 = @"YES";
      }
      int v26 = 138412546;
      uint64_t v27 = v22;
      __int16 v28 = 2112;
      uint64_t v29 = self;
      _os_log_impl(&dword_224F93000, v19, OS_LOG_TYPE_DEFAULT, "Tried to set paused: %@ on an inactive chat (%@)", (uint8_t *)&v26, 0x16u);
    }
  }

  objc_msgSend_setVideoPaused_(self->_localParticipant, v23, v3, v24, v25);
}

- (BOOL)isPaused
{
  if (objc_msgSend__hasCachedBoolForKey_(self, a2, @"isPaused", v2, v3))
  {
    return MEMORY[0x270F9A6D0](self, sel__cachedBoolForKey_, @"isPaused", v7, v8);
  }
  else
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
    uint64_t isPausedForAVChat = objc_msgSend_isPausedForAVChat_(v9, v10, (uint64_t)self, v11, v12);

    objc_msgSend__cacheBool_forKey_(self, v14, isPausedForAVChat, @"isPaused", v15);
    return isPausedForAVChat;
  }
}

- (void)togglePaused
{
  uint64_t v7 = objc_msgSend_isPaused(self, a2, v2, v3, v4) ^ 1;
  objc_msgSend_setPaused_(self, v6, v7, v8, v9);
}

- (BOOL)isSendingVideo
{
  if (objc_msgSend__hasCachedBoolForKey_(self, a2, @"isSendingVideo", v2, v3))
  {
    return MEMORY[0x270F9A6D0](self, sel__cachedBoolForKey_, @"isSendingVideo", v7, v8);
  }
  else
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
    uint64_t isSendingVideoForAVChat = objc_msgSend_isSendingVideoForAVChat_(v9, v10, (uint64_t)self, v11, v12);

    objc_msgSend__cacheBool_forKey_(self, v14, isSendingVideoForAVChat, @"isSendingVideo", v15);
    return isSendingVideoForAVChat;
  }
}

- (void)setIsSendingVideo:(BOOL)a3
{
  BOOL v5 = a3;
  objc_msgSend__clearCache(self, a2, a3, v3, v4);
  objc_msgSend_sharedInstance(IMAVInterface, v7, v8, v9, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avChat_setSendingVideo_(v13, v11, (uint64_t)self, v5, v12);
}

- (void)_handleRelayInitate:(id)a3 fromParticipant:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v49 = self;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v6;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  participant: %@   properties: %@", buf, 0x20u);
  }

  id v13 = objc_msgSend_avChat(v7, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend__timings(v13, v14, v15, v16, v17);
  objc_msgSend_startTimingForKey_(v18, v19, @"time-from-relay-initiate-to-outgoing-relay-update", v20, v21);

  int v26 = objc_msgSend_avChat(v7, v22, v23, v24, v25);
  id v31 = objc_msgSend__timings(v26, v27, v28, v29, v30);
  objc_msgSend_startTimingForKey_(v31, v32, @"time-from-relay-initiate-to-incoming-relay-update", v33, v34);

  uint64_t v35 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
  dateReceivedRelayInitiate = self->_dateReceivedRelayInitiate;
  self->_dateReceivedRelayInitiate = v35;

  uint64_t v41 = objc_msgSend__conferenceQueue(self, v37, v38, v39, v40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FB45F0;
  block[3] = &unk_264710F68;
  id v45 = v7;
  id v46 = v6;
  __int16 v47 = self;
  id v42 = v6;
  id v43 = v7;
  dispatch_async(v41, block);
}

- (void)_handleRelayUpdate:(id)a3 fromParticipant:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v49 = self;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v6;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  participant: %@   properties: %@", buf, 0x20u);
  }

  id v13 = objc_msgSend_avChat(v7, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend__timings(v13, v14, v15, v16, v17);
  objc_msgSend_stopTimingForKey_(v18, v19, @"time-from-relay-initiate-to-incoming-relay-update", v20, v21);

  int v26 = objc_msgSend_avChat(v7, v22, v23, v24, v25);
  id v31 = objc_msgSend__timings(v26, v27, v28, v29, v30);
  objc_msgSend_startTimingForKey_(v31, v32, @"time-from-relay-incoming-relay-update-to-connected", v33, v34);

  uint64_t v35 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
  dateReceivedRelayUpdate = self->_dateReceivedRelayUpdate;
  self->_dateReceivedRelayUpdate = v35;

  uint64_t v41 = objc_msgSend__conferenceQueue(self, v37, v38, v39, v40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FB4964;
  block[3] = &unk_264710F68;
  id v45 = v7;
  id v46 = self;
  id v47 = v6;
  id v42 = v6;
  id v43 = v7;
  dispatch_async(v41, block);
}

- (void)_handleRelayCancel:(id)a3 fromParticipant:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  participant: %@   properties: %@", buf, 0x20u);
  }

  dateReceivedRelayInitiate = self->_dateReceivedRelayInitiate;
  self->_dateReceivedRelayInitiate = 0;

  dateReceivedRelayUpdate = self->_dateReceivedRelayUpdate;
  self->_dateReceivedRelayUpdate = 0;

  uint64_t v15 = objc_msgSend__conferenceQueue(self, v11, v12, v13, v14);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FB4CE4;
  block[3] = &unk_264710F68;
  id v19 = v7;
  uint64_t v20 = self;
  id v21 = v6;
  id v16 = v6;
  id v17 = v7;
  dispatch_async(v15, block);
}

- (BOOL)isStateFinal
{
  return self->_localState == 5;
}

- (BOOL)isActive
{
  return self->_localState - 1 < 4;
}

- (void)_setActiveConference
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "_setActiveConference", (uint8_t *)&v31, 2u);
  }

  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138412290;
    int v32 = self;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v31, 0xCu);
  }

  if (objc_msgSend_isActive(self, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_sharedInstance(IMAVInterface, v9, v10, v11, v12);
    objc_msgSend_landscapeAspectRatios(self, v14, v15, v16, v17);
    double v19 = v18;
    double v21 = v20;
    objc_msgSend_portraitAspectRatios(self, v22, v23, v24, v25);
    objc_msgSend_avChat_setLocalLandscapeAspectRatio_localPortraitAspectRatio_(v13, v26, (uint64_t)self, v27, v28, v19, v21, v29, v30);
  }
  objc_msgSend__postStateToDelegateIfNecessary(self, v9, v10, v11, v12);
}

- (void)participant:(id)a3 changedFromState:(unsigned int)a4 toState:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v202 = *MEMORY[0x263EF8340];
  uint64_t v8 = (IMAVChatParticipant *)a3;
  uint64_t v9 = sub_224FB12A0();
  uint64_t v169 = v8;
  uint64_t v170 = self;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _NSStringDescriptionForIMAVChatParticipantState(v6);
    uint64_t v11 = _NSStringDescriptionForIMAVChatParticipantState(v5);
    *(_DWORD *)buf = 138412802;
    v197 = v8;
    __int16 v198 = 2112;
    v199 = v10;
    __int16 v200 = 2112;
    v201 = v11;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "P: %@  changedFromState: %@   toState: %@", buf, 0x20u);
  }
  if (self->_localParticipant != v8) {
    goto LABEL_7;
  }
  uint64_t v16 = sub_224FB12A0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatState(self->_localState);
    uint64_t v17 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
    double v18 = _NSStringDescriptionForIMAVChatParticipantState(v5);
    *(_DWORD *)buf = 138412546;
    v197 = v17;
    __int16 v198 = 2112;
    v199 = v18;
    _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, "Conference state changed from: %@   to: %@", buf, 0x16u);
  }
  unsigned int localState = self->_localState;
  if (localState != v5)
  {
    BOOL v156 = localState > 5;
    int v77 = (1 << localState) & 0x23;
    BOOL v20 = (v156 || v77 == 0) && (v5 < 2 || v5 == 5);
    self->_unsigned int localState = v5;
  }
  else
  {
LABEL_7:
    BOOL v20 = 0;
  }
  if (self->_localParticipant != v8)
  {
    double v21 = NSDictionary;
    uint64_t v22 = objc_msgSend_numberWithInt_(NSNumber, v12, v5, v14, v15);
    __int16 v26 = objc_msgSend_numberWithInt_(NSNumber, v23, v6, v24, v25);
    double v30 = objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v27, (uint64_t)v22, v28, v29, @"__kIMAVChatParticipantStateKey", v26, @"__kIMAVChatParticipantPreviousStateKey", 0);
    objc_msgSend__postNotificationName_participant_userInfo_(self, v31, @"__kIMAVChatParticipantStateChangedNotification", (uint64_t)v8, (uint64_t)v30);

    localParticipant = self->_localParticipant;
    if (localParticipant != v8)
    {
      int isInitiator = objc_msgSend_isInitiator(localParticipant, v12, v13, v14, v15);
      uint64_t v38 = objc_msgSend_invitedBy(self->_localParticipant, v34, v35, v36, v37);
      id v43 = objc_msgSend_imHandle(v8, v39, v40, v41, v42);

      if ((isInitiator & 1) == 0 && v38 != v43) {
        goto LABEL_57;
      }
      switch((int)v5)
      {
        case 1:
          if (isInitiator && !self->_localState) {
            goto LABEL_15;
          }
          goto LABEL_57;
        case 2:
          if (!self->_localState)
          {
            objc_msgSend_setState_(self->_localParticipant, v44, 1, v46, v47);
            long long v189 = 0u;
            long long v190 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            uint64_t v104 = self->_participants;
            uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v134, (uint64_t)&v187, (uint64_t)v195, 16);
            if (v135)
            {
              uint64_t v139 = v135;
              uint64_t v140 = *(void *)v188;
              do
              {
                for (uint64_t i = 0; i != v139; ++i)
                {
                  if (*(void *)v188 != v140) {
                    objc_enumerationMutation(v104);
                  }
                  uint64_t v142 = *(IMAVChatParticipant **)(*((void *)&v187 + 1) + 8 * i);
                  if (v142 != v169 && v142 != v170->_localParticipant) {
                    objc_msgSend_setState_(v142, v136, 1, v137, v138);
                  }
                }
                uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v136, (uint64_t)&v187, (uint64_t)v195, 16);
              }
              while (v139);
            }
            goto LABEL_56;
          }
          goto LABEL_57;
        case 3:
          if (self->_localState - 1 <= 1) {
            goto LABEL_91;
          }
          goto LABEL_57;
        case 4:
          if (self->_localState == 3) {
            objc_msgSend_setState_(self->_localParticipant, v44, 4, v46, v47);
          }
          goto LABEL_57;
        case 5:
          if (self->_localState == 5) {
            goto LABEL_57;
          }
          if (v38 == v43)
          {
            __int16 v159 = self->_localParticipant;
          }
          else
          {
            long long v185 = 0u;
            long long v186 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            uint64_t v143 = self->_participants;
            uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v144, (uint64_t)&v183, (uint64_t)v194, 16);
            if (v145)
            {
              uint64_t v150 = v145;
              unsigned int v151 = 0;
              uint64_t v152 = *(void *)v184;
              do
              {
                for (uint64_t j = 0; j != v150; ++j)
                {
                  if (*(void *)v184 != v152) {
                    objc_enumerationMutation(v143);
                  }
                  uint64_t v154 = *(IMAVChatParticipant **)(*((void *)&v183 + 1) + 8 * j);
                  if (v154 != v170->_localParticipant)
                  {
                    unsigned int v155 = objc_msgSend_state(v154, v146, v147, v148, v149);
                    if (!v151
                      || (v151 != 5 ? (BOOL v156 = v155 > v151) : (BOOL v156 = 1),
                          !v156 ? (int v157 = 0) : (int v157 = 1),
                          v155 != 5 ? (BOOL v158 = v157 == 0) : (BOOL v158 = 1),
                          !v158))
                    {
                      unsigned int v151 = v155;
                    }
                  }
                }
                uint64_t v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v146, (uint64_t)&v183, (uint64_t)v194, 16);
              }
              while (v150);

              self = v170;
              if (v151 != 5 && v151)
              {
                if (isInitiator)
                {
                  if (v151 == 1)
                  {
LABEL_15:
                    objc_msgSend_setState_(v170->_localParticipant, v44, 2, v46, v47);
                  }
                  else if (v151 == 3)
                  {
LABEL_91:
                    objc_msgSend_setState_(v170->_localParticipant, v44, 3, v46, v47);
                  }
                }
                goto LABEL_57;
              }
            }
            else
            {
            }
            __int16 v159 = self->_localParticipant;
          }
          uint64_t v160 = objc_msgSend_reasonChatEnded(v169, v44, v45, v46, v47);
          uint64_t v165 = objc_msgSend_error(v169, v161, v162, v163, v164);
          objc_msgSend_setStateToEndedWithReason_andError_(v159, v166, v160, v165, v167);
          goto LABEL_57;
        default:
          goto LABEL_57;
      }
    }
  }
  if (v6 || v5 != 2)
  {
    if (v5 == 5)
    {
      uint64_t v52 = objc_msgSend_reasonChatEnded(v8, v12, v13, v14, v15);
      if ((v6 - 3) <= 1)
      {
        if (objc_msgSend_isActive(self, v48, v49, v50, v51))
        {
          __int16 v57 = objc_msgSend_sharedInstance(IMAVInterface, v53, v54, v55, v56);
          objc_msgSend_endConferenceForAVChat_(v57, v58, (uint64_t)self, v59, v60);
        }
        if (objc_msgSend_isTerminating(self, v53, v54, v55, v56)) {
          objc_msgSend__blockUntilSendQueueIsEmpty(MEMORY[0x263F4A568], v48, v49, v50, v51);
        }
      }
      if (objc_msgSend_isInitiator(v8, v48, v49, v50, v51))
      {
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        uint64_t v65 = self->_participants;
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v179, (uint64_t)v193, 16);
        if (v67)
        {
          uint64_t v72 = v67;
          uint64_t v73 = *(void *)v180;
          do
          {
            for (uint64_t k = 0; k != v72; ++k)
            {
              if (*(void *)v180 != v73) {
                objc_enumerationMutation(v65);
              }
              uint64_t v75 = *(IMAVChatParticipant **)(*((void *)&v179 + 1) + 8 * k);
              if (v75 != v170->_localParticipant
                && objc_msgSend_state(*(void **)(*((void *)&v179 + 1) + 8 * k), v68, v69, v70, v71) == 1)
              {
                objc_msgSend_cancelInvitation(v75, v68, v69, v70, v71);
              }
            }
            uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v179, (uint64_t)v193, 16);
          }
          while (v72);
        }

        uint64_t v8 = v169;
        self = v170;
      }
      if ((v52 & 0xFFFFFFF7) == 1)
      {
        uint64_t v76 = 0;
        uint64_t v52 = 10;
      }
      else
      {
        uint64_t v76 = objc_msgSend_error(v8, v61, v62, v63, v64);
      }
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      int v79 = self->_participants;
      uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v175, (uint64_t)v192, 16);
      if (v81)
      {
        uint64_t v86 = v81;
        uint64_t v87 = *(void *)v176;
        do
        {
          for (uint64_t m = 0; m != v86; ++m)
          {
            if (*(void *)v176 != v87) {
              objc_enumerationMutation(v79);
            }
            uint64_t v89 = *(void **)(*((void *)&v175 + 1) + 8 * m);
            if (objc_msgSend_state(v89, v82, v83, v84, v85) != 5) {
              objc_msgSend_setStateToEndedWithReason_andError_(v89, v82, v52, v76, v85);
            }
          }
          uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v82, (uint64_t)&v175, (uint64_t)v192, 16);
        }
        while (v86);
      }

      uint64_t v94 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v90, v91, v92, v93);
      objc_msgSend_removeObserver_name_object_(v94, v95, (uint64_t)v170, 0, 0);

      uint64_t v100 = objc_msgSend_date(MEMORY[0x263EFF910], v96, v97, v98, v99);
      dateEnded = v170->_dateEnded;
      v170->_dateEnded = (NSDate *)v100;

      objc_msgSend__endChatWithReason_andError_(v170, v102, v52, v76, v103);
    }
  }
  else
  {
    objc_msgSend_inviteAll(self, v12, v13, v14, v15);
  }
  objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
  uint64_t v104 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateActiveConference(v104, v105, v106, v107, v108);
LABEL_56:

LABEL_57:
  uint64_t v110 = v169;
  uint64_t v109 = v170;
  if (v170->_localParticipant == v169)
  {
    if (v20)
    {
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      objc_msgSend_remoteParticipants(v170, v44, v45, v46, v47);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v111, (uint64_t)&v171, (uint64_t)v191, 16);
      if (v112)
      {
        uint64_t v117 = v112;
        uint64_t v118 = *(void *)v172;
        do
        {
          for (uint64_t n = 0; n != v117; ++n)
          {
            if (*(void *)v172 != v118) {
              objc_enumerationMutation(obj);
            }
            uint64_t v120 = objc_msgSend_state(*(void **)(*((void *)&v171 + 1) + 8 * n), v113, v114, v115, v116);
            if (v120 != 5)
            {
              uint64_t v121 = v120;
              uint64_t v122 = NSDictionary;
              uint64_t v123 = objc_msgSend_numberWithInt_(NSNumber, v113, 5, v115, v116);
              uint64_t v127 = objc_msgSend_numberWithInt_(NSNumber, v124, v121, v125, v126);
              uint64_t v131 = objc_msgSend_dictionaryWithObjectsAndKeys_(v122, v128, (uint64_t)v123, v129, v130, @"__kIMAVChatParticipantStateKey", v127, @"__kIMAVChatParticipantPreviousStateKey", 0);
              objc_msgSend__postNotificationName_participant_userInfo_(v170, v132, @"__kIMAVChatParticipantStateChangedNotification", (uint64_t)v169, (uint64_t)v131);
            }
          }
          uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v113, (uint64_t)&v171, (uint64_t)v191, 16);
        }
        while (v117);
      }

      uint64_t v110 = v169;
      uint64_t v109 = v170;
    }
    objc_msgSend__postStateToDelegateIfNecessary(v109, v44, v45, v46, v47);
  }
}

- (void)_postStateToDelegateIfNecessary
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v177 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", buf, 0xCu);
  }

  unsigned int localState = self->_localState;
  if (localState != self->_lastPostedState)
  {
    switch(localState)
    {
      case 0u:
        goto LABEL_10;
      case 1u:
      case 2u:
        objc_msgSend__clearConnectionTimeoutTimer(self, v4, v5, v6, v7);
        objc_msgSend__setInvitationTimeoutTimer(self, v9, v10, v11, v12);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v13, v14, v15, v16);
        break;
      case 3u:
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v4, @"time-to-start-connecting", v6, v7);
        objc_msgSend_startTimingForKey_(self->_timingCollection, v17, @"time-connecting-to-connected", v18, v19);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v20, @"time-to-connecting", v21, v22);
        objc_msgSend__clearInvitationTimeoutTimer(self, v23, v24, v25, v26);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v27, v28, v29, v30);
        objc_msgSend__setConnectionTimeoutTimer(self, v31, v32, v33, v34);
        if (!self->_dateStartedConnecting)
        {
          uint64_t v35 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
          dateStartedConnecting = self->_dateStartedConnecting;
          self->_dateStartedConnecting = v35;
        }
        break;
      case 4u:
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v4, @"time-from-outgoing-relay-update-to-connected", v6, v7);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v37, @"time-from-relay-incoming-relay-update-to-connected", v38, v39);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v40, @"time-connecting-to-connected", v41, v42);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v43, @"time-to-connected", v44, v45);
        objc_msgSend__clearConnectionTimeoutTimer(self, v46, v47, v48, v49);
        objc_msgSend__clearInvitationTimeoutTimer(self, v50, v51, v52, v53);
        objc_msgSend__setFirstFrameTimeoutTimer(self, v54, v55, v56, v57);
        objc_msgSend__entitlementsChanged_(self, v58, 0, v59, v60);
        break;
      case 5u:
        objc_msgSend__clearConnectionTimeoutTimer(self, v4, v5, v6, v7);
        objc_msgSend__clearInvitationTimeoutTimer(self, v61, v62, v63, v64);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v65, v66, v67, v68);
        uint64_t v73 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v69, v70, v71, v72);
        objc_msgSend_removeObserver_name_object_(v73, v74, (uint64_t)self, 0, 0);

LABEL_10:
        objc_msgSend__clearConnectionTimeoutTimer(self, v4, v5, v6, v7);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v75, v76, v77, v78);
        objc_msgSend__clearInvitationTimeoutTimer(self, v79, v80, v81, v82);
        break;
      default:
        break;
    }
    if (self->_localState == 5)
    {
      uint64_t v83 = NSString;
      uint64_t v84 = objc_msgSend_reasonChatEnded(self->_localParticipant, v4, v5, v6, v7);
      uint64_t v89 = _NSStringDescriptionForIMAVChatEndedReason(v84, v85, v86, v87, v88);
      uint64_t v94 = objc_msgSend_error(self->_localParticipant, v90, v91, v92, v93);
      uint64_t v99 = _NSStringDescriptionForIMAVChatError(v94, v95, v96, v97, v98);
      uint64_t v103 = objc_msgSend_stringWithFormat_(v83, v100, @"%@ - %@", v101, v102, v89, v99);

      _IMLoggingSetFailureReason();
    }
    uint64_t v104 = objc_msgSend_sharedInstance(IMAVInterface, v4, v5, v6, v7);
    objc_msgSend_chatStateUpdated(v104, v105, v106, v107, v108);

    unsigned int v113 = self->_localState;
    if (self->_lastPostedState <= 5 && v113 == 5)
    {
      if (!self->_dateEnded)
      {
        objc_msgSend_date(MEMORY[0x263EFF910], v109, v110, v111, v112);
        uint64_t v115 = (NSDate *)objc_claimAutoreleasedReturnValue();
        dateEnded = self->_dateEnded;
        self->_dateEnded = v115;
      }
      uint64_t v117 = objc_msgSend_sharedInstance(IMAVInterface, v109, v110, v111, v112);
      objc_msgSend__conferenceEnded_(v117, v118, (uint64_t)self, v119, v120);

      unsigned int v113 = self->_localState;
    }
    self->_lastPostedState = v113;
    uint64_t v121 = sub_224FB12A0();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(self->_lastPostedState);
      uint64_t v122 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      uint64_t v127 = objc_msgSend_endedReason(self, v123, v124, v125, v126);
      uint64_t v132 = _NSStringDescriptionForIMAVChatEndedReason(v127, v128, v129, v130, v131);
      uint64_t v137 = objc_msgSend_endedError(self, v133, v134, v135, v136);
      uint64_t v142 = _NSStringDescriptionForIMAVChatError(v137, v138, v139, v140, v141);
      *(_DWORD *)buf = 138412802;
      long long v177 = v122;
      __int16 v178 = 2112;
      long long v179 = v132;
      __int16 v180 = 2112;
      long long v181 = v142;
      _os_log_impl(&dword_224F93000, v121, OS_LOG_TYPE_DEFAULT, "Posting state change to %@   reason: %@   error: %@", buf, 0x20u);
    }
    uint64_t v143 = sub_224FB12A0();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v148 = objc_msgSend_reasonChatEnded(self->_localParticipant, v144, v145, v146, v147);
      _NSStringDescriptionForIMAVChatEndedReason(v148, v149, v150, v151, v152);
      long long v153 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      long long v177 = v153;
      _os_log_impl(&dword_224F93000, v143, OS_LOG_TYPE_DEFAULT, "    Reason: %@", buf, 0xCu);
    }
    uint64_t v154 = sub_224FB12A0();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v159 = objc_msgSend_error(self->_localParticipant, v155, v156, v157, v158);
      _NSStringDescriptionForIMAVChatError(v159, v160, v161, v162, v163);
      uint64_t v164 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      long long v177 = v164;
      _os_log_impl(&dword_224F93000, v154, OS_LOG_TYPE_DEFAULT, "     Error: %@", buf, 0xCu);
    }
    uint64_t v165 = NSDictionary;
    uint64_t v169 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v166, self->_lastPostedState, v167, v168);
    long long v173 = objc_msgSend_dictionaryWithObjectsAndKeys_(v165, v170, (uint64_t)v169, v171, v172, @"__kIMAVChatStateKey", 0);
    objc_msgSend__postNotificationName_userInfo_(self, v174, @"__kIMAVChatStateChangedNotification", (uint64_t)v173, v175);
  }
}

- (void)systemDidFastUserSwitchOut
{
  if ((objc_msgSend_isStateFinal(self, a2, v2, v3, v4) & 1) == 0)
  {
    objc_msgSend_endChat(self, v6, v7, v8, v9);
  }
}

- (void)_saveAudioRestartState
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend_isSendingAudio(self, v6, v7, v8, v9)
    && (objc_msgSend__needsAudioRestart(self, v10, v11, v12, v13) & 1) == 0)
  {
    uint64_t v14 = sub_224FB12A0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      uint64_t v25 = self;
      _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "** Setting needs audio restarted: %@", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend__setNeedsAudioRestart_(self, v15, 1, v16, v17);
    objc_msgSend_setMute_(self, v18, 1, v19, v20);
    objc_msgSend_setIsSendingAudio_(self, v21, 0, v22, v23);
  }
}

- (void)_saveVideoRestartState
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend_isSendingVideo(self, v6, v7, v8, v9)
    && (objc_msgSend__needsVideoRestart(self, v10, v11, v12, v13) & 1) == 0)
  {
    uint64_t v14 = sub_224FB12A0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      uint64_t v25 = self;
      _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "** Setting needs video restarted: %@", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend__setNeedsVideoRestart_(self, v15, 1, v16, v17);
    objc_msgSend_setPaused_(self, v18, 1, v19, v20);
    objc_msgSend_setIsSendingVideo_(self, v21, 0, v22, v23);
  }
}

- (void)_resumeAudioState
{
  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend__needsAudioRestart(self, v6, v7, v8, v9))
  {
    uint64_t v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "** Restarting audio!", v20, 2u);
    }

    objc_msgSend__setNeedsAudioRestart_(self, v11, 0, v12, v13);
    objc_msgSend_setMute_(self, v14, 0, v15, v16);
    objc_msgSend_setIsSendingAudio_(self, v17, 1, v18, v19);
  }
}

- (void)_resumeVideoState
{
  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend__needsVideoRestart(self, v6, v7, v8, v9))
  {
    uint64_t v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "** Restarting video!", v20, 2u);
    }

    objc_msgSend__setNeedsVideoRestart_(self, v11, 0, v12, v13);
    objc_msgSend_setPaused_(self, v14, 0, v15, v16);
    objc_msgSend_setIsSendingVideo_(self, v17, 1, v18, v19);
  }
}

- (void)systemApplicationDidBecomeActive
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Become active: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)systemApplicationDidEnterBackground
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Application is entering background: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend__saveVideoRestartState(self, v4, v5, v6, v7);
}

- (void)systemApplicationWillEnterForeground
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Application is entering foreground: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)systemApplicationDidSuspend
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Application did suspend: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend__saveVideoRestartState(self, v4, v5, v6, v7);
}

- (void)systemApplicationDidResume
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Application did resume: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)systemApplicationDidResumeForEventsOnly
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Application did resume for events only: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)notificationCenterWillAppear
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Notification center is appearing: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)notificationCenterDidDisappear
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Notification center did disappear: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)systemWillShutdown
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "System will shut down, ending chat: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_endChat(self, v4, v5, v6, v7);
}

- (void)_airplaneModeChanged:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v6 = objc_msgSend_airplaneModeEnabled(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_sharedInstance(MEMORY[0x263F4A5C0], v7, v8, v9, v10);
  uint64_t isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v11, v12, v13, v14, v15);
  objc_msgSend__setAirplaneModeEnabled_(self, v17, isAirplaneModeEnabled, v18, v19);

  if (v6 != objc_msgSend_airplaneModeEnabled(self, v20, v21, v22, v23)
    && objc_msgSend_airplaneModeEnabled(self, v24, v25, v26, v27))
  {
    uint64_t v28 = sub_224FB12A0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412290;
      uint64_t v34 = self;
      _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "Airplane mode was enabled, ending chat: %@", (uint8_t *)&v33, 0xCu);
    }

    objc_msgSend_endChat(self, v29, v30, v31, v32);
  }
}

- (void)_entitlementsChanged:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (objc_msgSend__localNetworkConnectionType(self, a2, (uint64_t)a3, v3, v4) == 1)
  {
    uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v6, v7, v8, v9);
    char v15 = objc_msgSend_nonWifiFaceTimeAvailable(v10, v11, v12, v13, v14);

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = sub_224FB12A0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        uint64_t v22 = self;
        _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, "FaceTime over cellular was disabled, ending chat: %@", (uint8_t *)&v21, 0xCu);
      }

      objc_msgSend_endChat(self, v17, v18, v19, v20);
    }
  }
}

- (void)_peerID:(id)a3 changedTo:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v52 = 138412546;
    id v53 = v6;
    __int16 v54 = 2112;
    id v55 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "peerID: %@ changedTo: %@", (uint8_t *)&v52, 0x16u);
  }

  if ((objc_msgSend_isEqualToString_(v6, v9, (uint64_t)v7, v10, v11) & 1) == 0
    && objc_msgSend_length(v6, v12, v13, v14, v15)
    && objc_msgSend_length(v7, v16, v17, v18, v19))
  {
    int v24 = objc_msgSend_account(self, v20, v21, v22, v23);
    uint64_t v28 = objc_msgSend_imHandleWithID_(v24, v25, (uint64_t)v6, v26, v27);

    int v33 = objc_msgSend_account(self, v29, v30, v31, v32);
    uint64_t v37 = objc_msgSend_imHandleWithID_(v33, v34, (uint64_t)v7, v35, v36);

    uint64_t v38 = sub_224FB12A0();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = 138412546;
      id v53 = v28;
      __int16 v54 = 2112;
      id v55 = v37;
      _os_log_impl(&dword_224F93000, v38, OS_LOG_TYPE_DEFAULT, "old handle: %@   new handle: %@", (uint8_t *)&v52, 0x16u);
    }

    if (v28 && v37)
    {
      uint64_t v42 = objc_msgSend_participantMatchingIMHandle_(self, v39, (uint64_t)v37, v40, v41);
      if (v42)
      {
        uint64_t v46 = (void *)v42;
        uint64_t v47 = sub_224FB12A0();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v52) = 0;
          _os_log_impl(&dword_224F93000, v47, OS_LOG_TYPE_DEFAULT, "Already have new handle", (uint8_t *)&v52, 2u);
        }
      }
      else
      {
        uint64_t v46 = objc_msgSend_participantMatchingIMHandle_(self, v43, (uint64_t)v28, v44, v45);
        uint64_t v48 = sub_224FB12A0();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          int v52 = 138412290;
          id v53 = v46;
          _os_log_impl(&dword_224F93000, v48, OS_LOG_TYPE_DEFAULT, "found participant: %@", (uint8_t *)&v52, 0xCu);
        }

        objc_msgSend__switchToUseNewIMHandle_(v46, v49, (uint64_t)v37, v50, v51);
      }
    }
  }
}

- (void)_updateIMHandleInBuddyList:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F4A4A8];
  objc_msgSend_postNotificationName_(v3, v5, *MEMORY[0x263F4A4A8], v6, v7);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = objc_msgSend_accountSiblingsArray(v3, v8, v9, v10, v11, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v14)
  {
    uint64_t v18 = v14;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_postNotificationName_(*(void **)(*((void *)&v21 + 1) + 8 * v20++), v15, v4, v16, v17);
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v18);
  }
}

- (void)_insertRemoteParticipant:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, v25, 2u);
  }

  objc_msgSend_requestIconIfNecessary(v6, v8, v9, v10, v11);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v16 = a4 + 1, v16 >= objc_msgSend_count(self->_participants, v12, v13, v14, v15))) {
    objc_msgSend_addObject_(self->_participants, v12, (uint64_t)v6, v14, v15);
  }
  else {
    objc_msgSend_insertObject_atIndex_(self->_participants, v12, (uint64_t)v6, v16, v15);
  }
  long long v21 = objc_msgSend_imHandle(v6, v17, v18, v19, v20);
  objc_msgSend__updateIMHandleInBuddyList_(self, v22, (uint64_t)v21, v23, v24);
}

- (BOOL)_moveVCPartyID:(id)a3 toIndex:(unsigned int)a4 inCount:(unsigned int)a5
{
  LODWORD(v5) = a5;
  id v11 = a3;
  if (v5)
  {
    uint64_t v12 = objc_msgSend_objectAtIndex_(self->_participants, v8, 0, v9, v10);
    uint64_t v17 = objc_msgSend_vcPartyID(v12, v13, v14, v15, v16);
    char isEqualToString = objc_msgSend_isEqualToString_(v11, v18, (uint64_t)v17, v19, v20);

    if (isEqualToString)
    {
      uint64_t v25 = 0;
      LOBYTE(v5) = 1;
LABEL_8:
      if (v25 != a4)
      {
        objc_msgSend_removeObjectAtIndex_(self->_participants, v22, v25, v23, v24);
        objc_msgSend_insertObject_atIndex_(self->_participants, v39, (uint64_t)v12, a4, v40);
      }
    }
    else
    {
      unint64_t v26 = v5;
      uint64_t v5 = 1;
      while (1)
      {

        if (v26 == v5) {
          break;
        }
        uint64_t v12 = objc_msgSend_objectAtIndex_(self->_participants, v27, v5, v28, v29);
        uint64_t v34 = objc_msgSend_vcPartyID(v12, v30, v31, v32, v33);
        int v38 = objc_msgSend_isEqualToString_(v11, v35, (uint64_t)v34, v36, v37);

        ++v5;
        if (v38)
        {
          uint64_t v25 = v5 - 1;
          LOBYTE(v5) = v5 - 1 < v26;
          goto LABEL_8;
        }
      }
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (void)_initParticipantsWithIMHandles:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v78 = self;
    __int16 v79 = 2112;
    id v80 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@  imhandles: %@", buf, 0x16u);
  }

  int v10 = objc_msgSend_count(v4, v6, v7, v8, v9);
  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v15 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v11, v12, v10 + 1, v13, v14);
  participants = self->_participants;
  self->_participants = v15;

  uint64_t v70 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v17, (uint64_t)v4, v18, v19);
  objc_msgSend_addObject_(v70, v20, (uint64_t)self->_initiator, v21, v22);
  uint64_t v27 = objc_msgSend___imFirstObject(v4, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_account(v27, v28, v29, v30, v31);
  uint64_t v37 = objc_msgSend_loginIMHandle(v32, v33, v34, v35, v36);

  int v38 = [IMAVChatParticipant alloc];
  initiator = self->_initiator;
  uint64_t v44 = objc_msgSend_account(v37, v40, v41, v42, v43);
  inited = (IMAVChatParticipant *)objc_msgSend_initAs_invitedBy_toChat_account_(v38, v45, (uint64_t)v37, (uint64_t)initiator, (uint64_t)self, v44);
  localParticipant = self->_localParticipant;
  self->_localParticipant = inited;

  objc_msgSend_addObject_(self->_participants, v48, (uint64_t)self->_localParticipant, v49, v50);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v4;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v72, (uint64_t)v76, 16);
  if (v52)
  {
    uint64_t v54 = v52;
    unsigned int v55 = 0;
    uint64_t v56 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v73 != v56) {
          objc_enumerationMutation(obj);
        }
        __int16 v58 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        if (v58 == v37)
        {
          if (self->_isVideo) {
            unsigned int v55 = 0;
          }
        }
        else
        {
          uint64_t v59 = [IMAVChatParticipant alloc];
          uint64_t v60 = self->_initiator;
          uint64_t v65 = objc_msgSend_account(v58, v61, v62, v63, v64);
          uint64_t v67 = objc_msgSend_initAs_invitedBy_toChat_account_(v59, v66, (uint64_t)v58, (uint64_t)v60, (uint64_t)self, v65);

          objc_msgSend__insertRemoteParticipant_atIndex_(self, v68, (uint64_t)v67, v55, v69);
          ++v55;
        }
      }
      uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v72, (uint64_t)v76, 16);
    }
    while (v54);
  }
}

- (BOOL)_participantsCheckOut
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, buf, 2u);
  }

  uint64_t v8 = objc_msgSend_count(self->_participants, v4, v5, v6, v7);
  if ((unint64_t)(v8 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v13 = v8;
    uint64_t v14 = sub_224FB12A0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isVideo) {
        uint64_t v15 = @"YES";
      }
      else {
        uint64_t v15 = @"NO";
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v68 = v13;
      *(_WORD *)&v68[4] = 2112;
      *(void *)&v68[6] = v15;
      uint64_t v16 = "Failing due to count check:   count: %d  isVideo: %@";
      uint64_t v17 = v14;
      uint32_t v18 = 18;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  localParticipant = self->_localParticipant;
  if (!localParticipant)
  {
    uint64_t v14 = sub_224FB12A0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "Failing due to empty local participant";
      uint64_t v17 = v14;
      uint32_t v18 = 2;
LABEL_23:
      _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
LABEL_24:
    BOOL v56 = 0;
    goto LABEL_39;
  }
  uint64_t v14 = objc_msgSend_invitedBy(localParticipant, v9, v10, v11, v12);
  uint64_t v24 = objc_msgSend_imHandle(self->_localParticipant, v20, v21, v22, v23);
  int v25 = v14 == v24;
  int isCaller = self->_isCaller;

  if (isCaller == v25)
  {
    uint64_t v31 = objc_msgSend_set(MEMORY[0x263EFF9C0], v27, v28, v29, v30);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v32 = self->_participants;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v62, (uint64_t)v66, 16);
    if (v34)
    {
      uint64_t v39 = v34;
      char v40 = 0;
      uint64_t v41 = *(void *)v63;
      while (2)
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v63 != v41) {
            objc_enumerationMutation(v32);
          }
          uint64_t v43 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v44 = objc_msgSend_imHandle(v43, v35, v36, v37, v38, (void)v62);
          uint64_t v49 = objc_msgSend_invitedBy(v43, v45, v46, v47, v48);
          if (objc_msgSend_containsObject_(v31, v50, (uint64_t)v44, v51, v52))
          {
            uint64_t v60 = sub_224FB12A0();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)uint64_t v68 = v44;
              _os_log_impl(&dword_224F93000, v60, OS_LOG_TYPE_DEFAULT, "Failing due to duplicate handle: %@", buf, 0xCu);
            }

            goto LABEL_36;
          }
          v40 |= v44 == v49;
          objc_msgSend_addObject_(v31, v53, (uint64_t)v44, v54, v55);
        }
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v62, (uint64_t)v66, 16);
        if (v39) {
          continue;
        }
        break;
      }

      if (v40)
      {
        BOOL v56 = 1;
        goto LABEL_38;
      }
    }
    else
    {
    }
    sub_224FB12A0();
    uint64_t v32 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v32->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, &v32->super.super, OS_LOG_TYPE_DEFAULT, "Failing due to inviter not being in the participant list", buf, 2u);
    }
LABEL_36:
  }
  else
  {
    uint64_t v31 = sub_224FB12A0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v57 = self->_localParticipant;
      BOOL v58 = self->_isCaller;
      *(_DWORD *)buf = 138412802;
      if (v58) {
        uint64_t v59 = @"YES";
      }
      else {
        uint64_t v59 = @"NO";
      }
      *(void *)uint64_t v68 = v57;
      *(_WORD *)&v68[8] = 2112;
      *(void *)&v68[10] = v14;
      __int16 v69 = 2112;
      uint64_t v70 = v59;
      _os_log_impl(&dword_224F93000, v31, OS_LOG_TYPE_DEFAULT, "Failing inviter check:   localParticipant: %@   invitedBy: %@   isCaller: %@", buf, 0x20u);
    }
  }
  BOOL v56 = 0;
LABEL_38:

LABEL_39:
  return v56;
}

- (IMAVChatParticipant)initiatorParticipant
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = self->_participants;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v4)
  {
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v2);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend_isInitiator(v12, v5, v6, v7, v8))
        {
          id v13 = v12;
          goto LABEL_13;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }

  sub_224FB12A0();
  uint64_t v2 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v2->super.super, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_224F93000, &v2->super.super, OS_LOG_TYPE_DEFAULT, "[WARN] *********** -[IMAVChat initiatorParticipant] couldn't find initiator participant!", v15, 2u);
  }
  id v13 = 0;
LABEL_13:

  return (IMAVChatParticipant *)v13;
}

- (NSArray)remoteParticipants
{
  int v6 = objc_msgSend_count(self->_participants, a2, v2, v3, v4);
  if (v6 > 1) {
    objc_msgSend_subarrayWithRange_(self->_participants, v7, 1, (v6 - 1), v10);
  }
  else {
  uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8, v9, v10);
  }
  return (NSArray *)v11;
}

- (BOOL)_allParticipantsUsingICE
{
  return 1;
}

- (id)_participantMatchingVCPartyID:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = v4;
  if (!v4)
  {
LABEL_12:
    uint64_t v26 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = self->_participants;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, (uint64_t)v32, 16);
    if (v12)
    {
      uint64_t v17 = v12;
      uint64_t v18 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v10);
          }
          uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v21 = objc_msgSend_vcPartyID(v20, v13, v14, v15, v16, (void)v28);
          char isEqualToString = objc_msgSend_isEqualToString_(v9, v22, (uint64_t)v21, v23, v24);

          if (isEqualToString)
          {
            uint64_t v26 = v20;

            goto LABEL_15;
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v17) {
          continue;
        }
        break;
      }
    }

    goto LABEL_12;
  }
  uint64_t v26 = self->_localParticipant;
LABEL_15:

  return v26;
}

+ (id)chatList
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_calls(v5, v6, v7, v8, v9);

  return v10;
}

+ (id)connectedChat
{
  uint64_t v6 = objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  uint64_t v15 = objc_msgSend_activeChat(a1, v11, v12, v13, v14);
  uint64_t v20 = v15;
  if (v15 && objc_msgSend_state(v15, v16, v17, v18, v19) == 2)
  {
    uint64_t v21 = objc_msgSend__chatListLock(IMAVChat, v16, v17, v18, v19);
    objc_msgSend_unlock(v21, v22, v23, v24, v25);

    id v26 = 0;
  }
  else
  {
    uint64_t v27 = objc_msgSend__chatListLock(IMAVChat, v16, v17, v18, v19);
    objc_msgSend_unlock(v27, v28, v29, v30, v31);

    id v26 = v20;
  }

  return v26;
}

+ (id)activeChat
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  int hasActiveConference = objc_msgSend_hasActiveConference(v5, v6, v7, v8, v9);

  if (hasActiveConference)
  {
    uint64_t v15 = objc_msgSend__chatListLock(IMAVChat, v11, v12, v13, v14);
    objc_msgSend_lock(v15, v16, v17, v18, v19);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v24 = objc_msgSend_chatList(IMAVChat, v20, v21, v22, v23, 0);
    id v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v30)
    {
      uint64_t v31 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v30; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v24);
          }
          uint64_t v33 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          unsigned int v34 = objc_msgSend_state(v33, v26, v27, v28, v29);
          if (v34 > 5 || ((1 << v34) & 0x23) == 0)
          {
            id v30 = v33;
            goto LABEL_16;
          }
        }
        id v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    char v40 = objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    objc_msgSend_unlock(v40, v41, v42, v43, v44);
  }
  else
  {
    id v30 = 0;
  }
  return v30;
}

+ (id)nonFinalChat
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v14 = objc_msgSend_chatList(IMAVChat, v10, v11, v12, v13, 0);
  id v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v20)
  {
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        int v24 = objc_msgSend_state(v23, v16, v17, v18, v19);
        if (v24) {
          BOOL v25 = v24 == 5;
        }
        else {
          BOOL v25 = 1;
        }
        if (!v25)
        {
          id v20 = v23;
          goto LABEL_13;
        }
      }
      id v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v20);
  }
LABEL_13:

  id v30 = objc_msgSend__chatListLock(IMAVChat, v26, v27, v28, v29);
  objc_msgSend_unlock(v30, v31, v32, v33, v34);

  return v20;
}

+ (id)incomingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel_chatsWithIMAVChatState_, 1);
}

+ (id)outgoingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel_chatsWithIMAVChatState_, 2);
}

+ (id)connectingChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel_chatsWithIMAVChatState_, 3);
}

+ (id)connectedChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel_chatsWithIMAVChatState_, 4);
}

+ (id)acceptedChats
{
  uint64_t v5 = objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend_connectingChats(IMAVChat, v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_initWithArray_(v10, v16, (uint64_t)v15, v17, v18);

  int v24 = objc_msgSend_connectedChats(IMAVChat, v20, v21, v22, v23);
  objc_msgSend_addObjectsFromArray_(v19, v25, (uint64_t)v24, v26, v27);

  uint64_t v32 = objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v19;
}

+ (id)chatsWithIMAVChatState:(unsigned int)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend__chatListLock(IMAVChat, a2, *(uint64_t *)&a3, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v15 = objc_msgSend_chatList(IMAVChat, v11, v12, v13, v14, 0);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v17)
  {
    uint64_t v22 = v17;
    id v23 = 0;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v15);
        }
        uint64_t v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend_state(v26, v18, v19, v20, v21) == a3)
        {
          if (!v23) {
            id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          objc_msgSend_addObject_(v23, v18, (uint64_t)v26, v20, v21);
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v22);
  }
  else
  {
    id v23 = 0;
  }

  uint64_t v31 = objc_msgSend__chatListLock(IMAVChat, v27, v28, v29, v30);
  objc_msgSend_unlock(v31, v32, v33, v34, v35);

  return v23;
}

+ (id)avChatWithGUID:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend__chatListLock(IMAVChat, v8, v9, v10, v11);
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v21 = objc_msgSend_chatList(IMAVChat, v17, v18, v19, v20, 0);
    id v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v27)
    {
      uint64_t v28 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(v21);
          }
          uint64_t v30 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v31 = objc_msgSend_GUID(v30, v23, v24, v25, v26);
          int isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v3, v33, v34);

          if (isEqualToString)
          {
            id v27 = v30;
            goto LABEL_12;
          }
        }
        id v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v27) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    long long v40 = objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    objc_msgSend_unlock(v40, v41, v42, v43, v44);
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

+ (id)_avChatArray
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend__copyMutableFTCalls(v5, v6, v7, v8, v9);

  return v10;
}

+ (id)_chatWithSessionID:(unsigned int)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend__chatListLock(IMAVChat, a2, *(uint64_t *)&a3, v3, v4);
  objc_msgSend_lock(v7, v8, v9, v10, v11);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v16 = objc_msgSend__chatList(a1, v12, v13, v14, v15, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v18)
  {
    uint64_t v23 = v18;
    uint64_t v24 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v16);
        }
        uint64_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend_sessionID(v26, v19, v20, v21, v22) == a3)
        {
          id v27 = v26;
          goto LABEL_11;
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v23) {
        continue;
      }
      break;
    }
  }
  id v27 = 0;
LABEL_11:

  uint64_t v32 = objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v27;
}

+ (id)_chatList
{
  uint64_t v5 = objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  uint64_t v14 = objc_msgSend_sharedInstance(IMAVCallManager, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend__FTCalls(v14, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_copy(v19, v20, v21, v22, v23);

  uint64_t v29 = objc_msgSend__chatListLock(IMAVChat, v25, v26, v27, v28);
  objc_msgSend_unlock(v29, v30, v31, v32, v33);

  return v24;
}

+ (id)_connectedChat
{
  uint64_t v5 = objc_msgSend__activeChat(a1, a2, v2, v3, v4);
  uint64_t v10 = v5;
  if (v5 && objc_msgSend_state(v5, v6, v7, v8, v9) == 2) {
    id v11 = 0;
  }
  else {
    id v11 = v10;
  }

  return v11;
}

+ (id)_activeChat
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  int hasActiveConference = objc_msgSend_hasActiveConference(v5, v6, v7, v8, v9);

  if (hasActiveConference)
  {
    uint64_t v15 = objc_msgSend__chatListLock(IMAVChat, v11, v12, v13, v14);
    objc_msgSend_lock(v15, v16, v17, v18, v19);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v24 = objc_msgSend__chatList(IMAVChat, v20, v21, v22, v23, 0);
    id v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v30)
    {
      uint64_t v31 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v30; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v24);
          }
          uint64_t v33 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          unsigned int v34 = objc_msgSend_state(v33, v26, v27, v28, v29);
          if (v34 > 5 || ((1 << v34) & 0x23) == 0)
          {
            id v30 = v33;
            goto LABEL_16;
          }
        }
        id v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    long long v40 = objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    objc_msgSend_unlock(v40, v41, v42, v43, v44);
  }
  else
  {
    id v30 = 0;
  }
  return v30;
}

+ (id)_nonFinalChat
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v14 = objc_msgSend_sharedInstance(IMAVCallManager, v10, v11, v12, v13, 0);
  uint64_t v19 = objc_msgSend__FTCalls(v14, v15, v16, v17, v18);

  id v25 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v19);
        }
        uint64_t v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        int v29 = objc_msgSend_state(v28, v21, v22, v23, v24);
        if (v29) {
          BOOL v30 = v29 == 5;
        }
        else {
          BOOL v30 = 1;
        }
        if (!v30)
        {
          id v25 = v28;
          goto LABEL_13;
        }
      }
      id v25 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v25);
  }
LABEL_13:

  uint64_t v35 = objc_msgSend__chatListLock(IMAVChat, v31, v32, v33, v34);
  objc_msgSend_unlock(v35, v36, v37, v38, v39);

  return v25;
}

+ (id)_chatListLock
{
  if (qword_26AB79650 != -1) {
    dispatch_once(&qword_26AB79650, &unk_26D85A650);
  }
  uint64_t v2 = (void *)qword_26AB79658;
  return v2;
}

+ (id)_avChatWithConferenceID:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend__chatListLock(IMAVChat, v8, v9, v10, v11);
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v21 = objc_msgSend__chatList(IMAVChat, v17, v18, v19, v20, 0);
    id v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v27)
    {
      uint64_t v28 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(v21);
          }
          BOOL v30 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v31 = objc_msgSend_conferenceID(v30, v23, v24, v25, v26);
          int isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v3, v33, v34);

          if (isEqualToString)
          {
            id v27 = v30;
            goto LABEL_12;
          }
        }
        id v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v27) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    long long v40 = objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    objc_msgSend_unlock(v40, v41, v42, v43, v44);
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

+ (id)_avChatWithGUID:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend__chatListLock(IMAVChat, v8, v9, v10, v11);
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v21 = objc_msgSend__chatList(IMAVChat, v17, v18, v19, v20, 0);
    id v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v27)
    {
      uint64_t v28 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(v21);
          }
          BOOL v30 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v31 = objc_msgSend_GUID(v30, v23, v24, v25, v26);
          int isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v3, v33, v34);

          if (isEqualToString)
          {
            id v27 = v30;
            goto LABEL_12;
          }
        }
        id v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v27) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    long long v40 = objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    objc_msgSend_unlock(v40, v41, v42, v43, v44);
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

+ (id)_incomingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel__chatsWithIMAVChatState_, 1);
}

+ (id)_outgoingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel__chatsWithIMAVChatState_, 2);
}

+ (id)_connectingChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel__chatsWithIMAVChatState_, 3);
}

+ (id)_connectedChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x270F9A6D0])(a1, sel__chatsWithIMAVChatState_, 4);
}

+ (id)_acceptedChats
{
  uint64_t v5 = objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend__connectingChats(IMAVChat, v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_initWithArray_(v10, v16, (uint64_t)v15, v17, v18);

  uint64_t v24 = objc_msgSend__connectedChats(IMAVChat, v20, v21, v22, v23);
  objc_msgSend_addObjectsFromArray_(v19, v25, (uint64_t)v24, v26, v27);

  uint64_t v32 = objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v19;
}

+ (id)_chatsWithIMAVChatState:(unsigned int)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend__chatListLock(IMAVChat, a2, *(uint64_t *)&a3, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVCallManager, v11, v12, v13, v14, 0);
  uint64_t v20 = objc_msgSend__nonRetainingChatList(v15, v16, v17, v18, v19);

  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v22)
  {
    uint64_t v27 = v22;
    id v28 = 0;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v20);
        }
        uint64_t v31 = objc_msgSend_copyObject(*(void **)(*((void *)&v50 + 1) + 8 * i), v23, v24, v25, v26);
        uint64_t v36 = v31;
        if (v31 && objc_msgSend_state(v31, v32, v33, v34, v35) == a3)
        {
          if (!v28) {
            id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          objc_msgSend_addObject_(v28, v37, (uint64_t)v36, v38, v39);
        }
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v27);
  }
  else
  {
    id v28 = 0;
  }

  uint64_t v44 = objc_msgSend__chatListLock(IMAVChat, v40, v41, v42, v43);
  objc_msgSend_unlock(v44, v45, v46, v47, v48);

  return v28;
}

+ (id)_bestGuessAVChatWithIMHandle:(id)a3 conferenceID:(id)a4 sessionID:(unsigned int)a5 properties:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = sub_224FB12A0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMAVCallManager, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend__FTCalls(v17, v18, v19, v20, v21);
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v149 = v22;
    _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "All Chats: %@", buf, 0xCu);
  }
  uint64_t v26 = objc_msgSend__chatWithSessionID_(IMAVChat, v23, v7, v24, v25);
  if (v26)
  {
    id v30 = (id)v26;
    uint64_t v31 = sub_224FB12A0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v149 = v7;
      *(_WORD *)&v149[4] = 2112;
      *(void *)&v149[6] = v30;
      uint64_t v32 = "      SessionID [%u] => AVChat [%@]";
      uint64_t v33 = v31;
      uint32_t v34 = 18;
LABEL_11:
      _os_log_impl(&dword_224F93000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v10)
  {
    objc_msgSend__avChatWithConferenceID_(IMAVChat, v27, (uint64_t)v10, v28, v29);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = sub_224FB12A0();
    BOOL v35 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (!v35) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v149 = v10;
      *(_WORD *)&v149[8] = 2112;
      *(void *)&v149[10] = v30;
      uint64_t v32 = "      conferenceID [%@] => AVChat [%@]";
LABEL_10:
      uint64_t v33 = v31;
      uint32_t v34 = 22;
      goto LABEL_11;
    }
    if (v35)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v149 = v10;
      uint64_t v36 = "      Found no AVChat for conference ID [%@], returning none";
      uint64_t v37 = v31;
      uint32_t v38 = 12;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v7)
  {
    uint64_t v31 = sub_224FB12A0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v149 = v7;
      uint64_t v36 = "      Found no AVChat for sessionID [%u], returning none";
      uint64_t v37 = v31;
      uint32_t v38 = 8;
LABEL_17:
      _os_log_impl(&dword_224F93000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
    }
LABEL_18:
    id v30 = 0;
    goto LABEL_19;
  }
  uint64_t v40 = objc_msgSend__avChatInvitedByIMHandle_orConferenceID_(IMAVChat, v27, (uint64_t)v9, 0, v29);
  if (v40)
  {
    id v30 = (id)v40;
    uint64_t v31 = sub_224FB12A0();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)uint64_t v149 = v9;
    *(_WORD *)&v149[8] = 2112;
    *(void *)&v149[10] = v30;
    uint64_t v32 = "      _avChatInvitedByIMHandle [%@] => AVChat [%@]";
    goto LABEL_10;
  }
  uint64_t v43 = objc_msgSend__avChatWaitingForReplyFromIMHandle_orConferenceID_(IMAVChat, v41, (uint64_t)v9, 0, v42);
  if (v43)
  {
    id v30 = (id)v43;
    uint64_t v31 = sub_224FB12A0();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)uint64_t v149 = v9;
    *(_WORD *)&v149[8] = 2112;
    *(void *)&v149[10] = v30;
    uint64_t v32 = "      _avChatWaitingForReplyFromIMHandle [%@] => AVChat [%@]";
    goto LABEL_10;
  }
  uint64_t v48 = objc_msgSend__connectedChat(IMAVChat, v44, v45, v46, v47);
  if (v48)
  {
    id v30 = (id)v48;
    uint64_t v31 = sub_224FB12A0();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v149 = v30;
    uint64_t v32 = "      connectedChat => AVChat [%@]";
    goto LABEL_35;
  }
  uint64_t v53 = objc_msgSend__activeChat(IMAVChat, v49, v50, v51, v52);
  if (v53)
  {
    id v30 = (id)v53;
    uint64_t v31 = sub_224FB12A0();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v149 = v30;
    uint64_t v32 = "      activeChat [%@]";
    goto LABEL_35;
  }
  if (!objc_msgSend_count(v11, v54, v55, v56, v57)) {
    goto LABEL_65;
  }
  long long v62 = objc_msgSend__chatListLock(IMAVChat, v58, v59, v60, v61);
  objc_msgSend_lock(v62, v63, v64, v65, v66);

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  uint64_t v71 = objc_msgSend_sharedInstance(IMAVCallManager, v67, v68, v69, v70);
  uint64_t v76 = objc_msgSend__nonRetainingChatList(v71, v72, v73, v74, v75);

  obuint64_t j = v76;
  uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v142, (uint64_t)v147, 16);
  if (v133)
  {
    uint64_t v132 = *(void *)v143;
    while (2)
    {
      for (uint64_t i = 0; i != v133; ++i)
      {
        if (*(void *)v143 != v132) {
          objc_enumerationMutation(obj);
        }
        uint64_t v83 = objc_msgSend_object(*(void **)(*((void *)&v142 + 1) + 8 * i), v78, v79, v80, v81);
        if (v83)
        {
          uint64_t v134 = i;
          uint64_t v135 = v83;
          uint64_t v137 = objc_msgSend_callerProperties(v83, v78, v79, v80, v81);
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          objc_msgSend_allKeys(v11, v84, v85, v86, v87);
          id v136 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v88, (uint64_t)&v138, (uint64_t)v146, 16);
          if (v89)
          {
            uint64_t v93 = v89;
            uint64_t v94 = *(void *)v139;
            while (2)
            {
              for (uint64_t j = 0; j != v93; ++j)
              {
                if (*(void *)v139 != v94) {
                  objc_enumerationMutation(v136);
                }
                uint64_t v96 = *(void *)(*((void *)&v138 + 1) + 8 * j);
                uint64_t v97 = objc_msgSend_objectForKey_(v11, v90, v96, v91, v92);
                uint64_t v101 = objc_msgSend_objectForKey_(v137, v98, v96, v99, v100);
                int isEqual = objc_msgSend_isEqual_(v97, v102, (uint64_t)v101, v103, v104);

                if (!isEqual)
                {

                  uint64_t i = v134;
                  goto LABEL_53;
                }
              }
              uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v90, (uint64_t)&v138, (uint64_t)v146, 16);
              if (v93) {
                continue;
              }
              break;
            }
          }

          id v30 = v135;
          uint64_t v106 = sub_224FB12A0();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v111 = objc_msgSend_allKeys(v11, v107, v108, v109, v110);
            *(_DWORD *)buf = 138412546;
            *(void *)uint64_t v149 = v111;
            *(_WORD *)&v149[8] = 2112;
            *(void *)&v149[10] = v30;
            _os_log_impl(&dword_224F93000, v106, OS_LOG_TYPE_DEFAULT, "      properties [%@] => AVChat [%@]", buf, 0x16u);
          }
          goto LABEL_59;
        }
LABEL_53:
        ;
      }
      uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v142, (uint64_t)v147, 16);
      if (v133) {
        continue;
      }
      break;
    }
  }
  id v30 = 0;
LABEL_59:

  uint64_t v116 = objc_msgSend__chatListLock(IMAVChat, v112, v113, v114, v115);
  objc_msgSend_unlock(v116, v117, v118, v119, v120);

  if (!v30)
  {
LABEL_65:
    uint64_t v121 = objc_msgSend_sharedInstance(IMAVCallManager, v58, v59, v60, v61);
    uint64_t v126 = objc_msgSend__FTCalls(v121, v122, v123, v124, v125);
    objc_msgSend_lastObject(v126, v127, v128, v129, v130);
    id v30 = (id)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      uint64_t v31 = sub_224FB12A0();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v149 = v30;
      uint64_t v32 = "      Last Chat => AVChat [%@]";
LABEL_35:
      uint64_t v33 = v31;
      uint32_t v34 = 12;
      goto LABEL_11;
    }
  }
LABEL_20:

  return v30;
}

+ (id)_avChatInvitedByIMHandle:(id)a3 orConferenceID:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v10 = objc_msgSend__avChatWithConferenceID_(a1, v7, (uint64_t)a4, v8, v9);
  uint64_t v15 = v10;
  if (v10)
  {
    id v16 = v10;
  }
  else
  {
    uint64_t v17 = objc_msgSend__chatListLock(IMAVChat, v11, v12, v13, v14);
    objc_msgSend_lock(v17, v18, v19, v20, v21);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v26 = objc_msgSend__chatList(IMAVChat, v22, v23, v24, v25, 0);
    id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v16)
    {
      uint64_t v32 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(v26);
          }
          uint32_t v34 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          objc_msgSend_initiatorIMHandle(v34, v28, v29, v30, v31);
          id v35 = (id)objc_claimAutoreleasedReturnValue();

          if (v35 == v6)
          {
            id v16 = v34;
            goto LABEL_13;
          }
        }
        id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    uint64_t v40 = objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    objc_msgSend_unlock(v40, v41, v42, v43, v44);
  }
  return v16;
}

+ (id)_avChatWaitingForReplyFromIMHandle:(id)a3 orConferenceID:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend__avChatWithConferenceID_(a1, a2, (uint64_t)a4, (uint64_t)a4, v4);
  id v10 = v5;
  if (v5 && objc_msgSend_isCaller(v5, v6, v7, v8, v9))
  {
    id v11 = v10;
  }
  else
  {
    uint64_t v12 = objc_msgSend__chatListLock(IMAVChat, v6, v7, v8, v9);
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v21 = objc_msgSend__chatList(IMAVChat, v17, v18, v19, v20, 0);
    id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v11)
    {
      uint64_t v27 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(v21);
          }
          uint64_t v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (objc_msgSend_state(v29, v23, v24, v25, v26) == 2
            && objc_msgSend_isCaller(v29, v23, v24, v25, v26))
          {
            id v11 = v29;
            goto LABEL_15;
          }
        }
        id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v40, (uint64_t)v44, 16);
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    uint32_t v34 = objc_msgSend__chatListLock(IMAVChat, v30, v31, v32, v33);
    objc_msgSend_unlock(v34, v35, v36, v37, v38);
  }
  return v11;
}

+ (id)_avChatConnectingFromIMHandle:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v8 = objc_msgSend__chatListLock(IMAVChat, v4, v5, v6, v7);
  objc_msgSend_lock(v8, v9, v10, v11, v12);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v17 = objc_msgSend__chatList(IMAVChat, v13, v14, v15, v16, 0);
  id v23 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend_state(v26, v19, v20, v21, v22) == 3
          && (objc_msgSend_isCaller(v26, v19, v20, v21, v22) & 1) == 0)
        {
          if (!v3
            || (objc_msgSend_participantMatchingIMHandle_(v26, v19, (uint64_t)v3, v21, v22),
                uint64_t v27 = objc_claimAutoreleasedReturnValue(),
                v27,
                v27))
          {
            id v23 = v26;
            goto LABEL_14;
          }
        }
      }
      id v23 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  uint64_t v32 = objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v23;
}

+ (id)_avChatWithMatchingIMHandles:(id)a3 video:(BOOL)a4
{
  int v110 = a4;
  uint64_t v122 = *MEMORY[0x263EF8340];
  uint64_t v4 = (__CFString *)a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"NO";
    if (v110) {
      uint64_t v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v119 = v4;
    __int16 v120 = 2112;
    uint64_t v121 = v6;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "imHandles: %@  video: %@", buf, 0x16u);
  }

  objc_msgSend_lastObject(v4, v7, v8, v9, v10);
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = sub_224FB12A0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__avChatArray(IMAVChat, v13, v14, v15, v16);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v119 = v17;
    _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "All existing AVChats: %@", buf, 0xCu);
  }
  uint64_t v22 = objc_msgSend__chatListLock(IMAVChat, v18, v19, v20, v21);
  objc_msgSend_lock(v22, v23, v24, v25, v26);

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v31 = objc_msgSend__chatList(IMAVChat, v27, v28, v29, v30);
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v113, (uint64_t)v117, 16);
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v114;
    uint64_t v111 = *(void *)v114;
    uint64_t v112 = v31;
LABEL_9:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v114 != v35) {
        objc_enumerationMutation(v31);
      }
      uint64_t v37 = *(__CFString **)(*((void *)&v113 + 1) + 8 * v36);
      long long v38 = sub_224FB12A0();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v119 = v37;
        _os_log_impl(&dword_224F93000, v38, OS_LOG_TYPE_DEFAULT, "Checking AVChat: %@", buf, 0xCu);
      }

      if (objc_msgSend_isCaller(v37, v39, v40, v41, v42))
      {
        long long v47 = sub_224FB12A0();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v47, OS_LOG_TYPE_DEFAULT, "  ==> Not using this, this is an outgoing", buf, 2u);
        }
        goto LABEL_36;
      }
      long long v47 = objc_msgSend_remoteParticipants(v37, v43, v44, v45, v46);
      if ((unint64_t)objc_msgSend_count(v47, v48, v49, v50, v51) >= 2)
      {
        uint64_t v56 = sub_224FB12A0();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v56, OS_LOG_TYPE_DEFAULT, "  ==> Outgoing multiparty, skipping", buf, 2u);
        }

        goto LABEL_36;
      }
      uint64_t v57 = objc_msgSend_lastObject(v47, v52, v53, v54, v55);
      objc_msgSend_imHandle(v57, v58, v59, v60, v61);
      long long v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v62 == v11) {
        goto LABEL_28;
      }
      uint64_t v67 = sub_224FB12A0();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v119 = v62;
        __int16 v120 = 2112;
        uint64_t v121 = v11;
        _os_log_impl(&dword_224F93000, v67, OS_LOG_TYPE_DEFAULT, "  ==> %@ and %@ do not match", buf, 0x16u);
      }

      long long v72 = objc_msgSend_ID(v62, v68, v69, v70, v71);
      objc_msgSend_ID(v11, v73, v74, v75, v76);
      v78 = uint64_t v77 = v11;
      int hasSuffix = objc_msgSend_hasSuffix_(v72, v79, (uint64_t)v78, v80, v81);

      uint64_t v11 = v77;
      if (hasSuffix) {
        break;
      }
LABEL_35:

      uint64_t v35 = v111;
      uint64_t v31 = v112;
LABEL_36:

      if (v34 == ++v36)
      {
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v97, (uint64_t)&v113, (uint64_t)v117, 16);
        if (v34) {
          goto LABEL_9;
        }
        uint64_t v98 = 0;
        goto LABEL_43;
      }
    }
    uint64_t v83 = sub_224FB12A0();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v83, OS_LOG_TYPE_DEFAULT, "  ==> Letting this slide...", buf, 2u);
    }

LABEL_28:
    if (objc_msgSend_state(v37, v63, v64, v65, v66) < 3)
    {
      int isVideo = objc_msgSend_isVideo(v37, v84, v85, v86, v87);
      uint64_t v88 = sub_224FB12A0();
      BOOL v96 = os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);
      if (isVideo == v110)
      {
        if (v96)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v119 = v37;
          _os_log_impl(&dword_224F93000, v88, OS_LOG_TYPE_DEFAULT, "We found a matching chat: %@", buf, 0xCu);
        }

        uint64_t v98 = v37;
        unint64_t v99 = 0x264710000;
        uint64_t v31 = v112;
        goto LABEL_44;
      }
      if (v96)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v88, OS_LOG_TYPE_DEFAULT, "  ==> Video flags do not match", buf, 2u);
      }
    }
    else
    {
      uint64_t v88 = sub_224FB12A0();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v93 = objc_msgSend_state(v37, v89, v90, v91, v92);
        _NSStringDescriptionForIMAVChatState(v93);
        uint64_t v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v119 = v94;
        _os_log_impl(&dword_224F93000, v88, OS_LOG_TYPE_DEFAULT, "  ==> State of this chat is not adequate: %@", buf, 0xCu);
      }
    }

    goto LABEL_35;
  }
  uint64_t v98 = 0;
LABEL_43:
  unint64_t v99 = 0x264710000uLL;
LABEL_44:

  uint64_t v104 = objc_msgSend__chatListLock(*(void **)(v99 + 1544), v100, v101, v102, v103);
  objc_msgSend_unlock(v104, v105, v106, v107, v108);

  return v98;
}

+ (id)_imHandleFromProxyRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_objectForKey_(v3, v4, @"Service", v5, v6);
  uint64_t v11 = objc_msgSend_objectForKey_(v3, v8, @"AccountGUID", v9, v10);
  uint64_t v15 = objc_msgSend_objectForKey_(v3, v12, @"AccountLogin", v13, v14);
  uint64_t v19 = objc_msgSend_objectForKey_(v3, v16, @"HandleID", v17, v18);

  id v23 = objc_msgSend_serviceWithName_(MEMORY[0x263F4A608], v20, (uint64_t)v7, v21, v22);
  uint64_t v28 = objc_msgSend_sharedInstance(MEMORY[0x263F4A520], v24, v25, v26, v27);
  uint64_t v30 = objc_msgSend_bestAccountForService_login_guid_(v28, v29, (uint64_t)v23, (uint64_t)v15, (uint64_t)v11);

  uint64_t v34 = objc_msgSend_imHandleWithID_(v30, v31, (uint64_t)v19, v32, v33);

  return v34;
}

+ (id)_proxyRepresentationForIMHandle:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v10 = objc_msgSend_service(v4, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_name(v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_account(v4, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_uniqueID(v20, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_login(v20, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_ID(v4, v31, v32, v33, v34);

  if (v15) {
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v15, @"Service", v37);
  }
  if (v25) {
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v25, @"AccountGUID", v37);
  }
  if (v30) {
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v30, @"AccountLogin", v37);
  }
  if (v35) {
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v35, @"HandleID", v37);
  }

  return v5;
}

- (id)_proxyRepresentationForIMAVChatParticipant:(id)a3
{
  id v3 = a3;
  id v4 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v9 = objc_msgSend_name(v3, v5, v6, v7, v8);
  if (v9) {
    CFDictionarySetValue(v4, @"Name", v9);
  }

  uint64_t v10 = NSNumber;
  uint64_t v15 = objc_msgSend__inviteDelivered(v3, v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_numberWithBool_(v10, v16, v15, v17, v18);
  if (v19) {
    CFDictionarySetValue(v4, @"IsInvitationDelivered", v19);
  }

  uint64_t v20 = NSNumber;
  uint64_t isLocalParticipant = objc_msgSend_isLocalParticipant(v3, v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_numberWithBool_(v20, v26, isLocalParticipant, v27, v28);
  if (v29) {
    CFDictionarySetValue(v4, @"IsLocalParticipant", v29);
  }

  return v4;
}

- (id)_proxyRepresentation
{
  uint64_t v215 = *MEMORY[0x263EF8340];
  id v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = objc_msgSend_GUID(self, v4, v5, v6, v7);
  if (v8) {
    CFDictionarySetValue(v3, @"GUID", v8);
  }

  uint64_t v13 = objc_msgSend_account(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_uniqueID(v13, v14, v15, v16, v17);

  if (v18) {
    CFDictionarySetValue(v3, @"AccountID", v18);
  }

  uint64_t v23 = objc_msgSend_conferenceID(self, v19, v20, v21, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"ConferenceID", v23);
  }

  uint64_t v24 = NSNumber;
  uint64_t v29 = objc_msgSend_state(self, v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_numberWithUnsignedInt_(v24, v30, v29, v31, v32);
  if (v33) {
    CFDictionarySetValue(v3, @"State", v33);
  }

  uint64_t v34 = NSNumber;
  uint64_t isStateFinal = objc_msgSend_isStateFinal(self, v35, v36, v37, v38);
  uint64_t v43 = objc_msgSend_numberWithBool_(v34, v40, isStateFinal, v41, v42);
  if (v43) {
    CFDictionarySetValue(v3, @"IsStateFinal", v43);
  }

  long long v48 = objc_msgSend_initiatorIMHandle(self, v44, v45, v46, v47);
  uint64_t v52 = objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v49, (uint64_t)v48, v50, v51);

  if (v52) {
    CFDictionarySetValue(v3, @"Initiator", v52);
  }

  uint64_t v57 = objc_msgSend_otherIMHandle(self, v53, v54, v55, v56);
  uint64_t v61 = objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v58, (uint64_t)v57, v59, v60);

  if (v61) {
    CFDictionarySetValue(v3, @"Other", v61);
  }

  long long v62 = NSNumber;
  uint64_t isCaller = objc_msgSend_isCaller(self, v63, v64, v65, v66);
  uint64_t v71 = objc_msgSend_numberWithBool_(v62, v68, isCaller, v69, v70);
  if (v71) {
    CFDictionarySetValue(v3, @"IsCaller", v71);
  }

  long long v72 = NSNumber;
  uint64_t isVideo = objc_msgSend_isVideo(self, v73, v74, v75, v76);
  uint64_t v81 = objc_msgSend_numberWithBool_(v72, v78, isVideo, v79, v80);
  if (v81) {
    CFDictionarySetValue(v3, @"IsVideo", v81);
  }

  uint64_t v82 = NSNumber;
  uint64_t v87 = objc_msgSend_endedReason(self, v83, v84, v85, v86);
  uint64_t v91 = objc_msgSend_numberWithUnsignedInt_(v82, v88, v87, v89, v90);
  if (v91) {
    CFDictionarySetValue(v3, @"EndedReason", v91);
  }

  uint64_t v92 = NSNumber;
  uint64_t v97 = objc_msgSend_endedError(self, v93, v94, v95, v96);
  uint64_t v101 = objc_msgSend_numberWithInt_(v92, v98, v97, v99, v100);
  if (v101) {
    CFDictionarySetValue(v3, @"EndedError", v101);
  }

  uint64_t v102 = NSNumber;
  uint64_t isMute = objc_msgSend_isMute(self, v103, v104, v105, v106);
  uint64_t v111 = objc_msgSend_numberWithBool_(v102, v108, isMute, v109, v110);
  if (v111) {
    CFDictionarySetValue(v3, @"IsMute", v111);
  }

  uint64_t v112 = NSNumber;
  uint64_t isSendingAudio = objc_msgSend_isSendingAudio(self, v113, v114, v115, v116);
  uint64_t v121 = objc_msgSend_numberWithBool_(v112, v118, isSendingAudio, v119, v120);
  if (v121) {
    CFDictionarySetValue(v3, @"IsSendingAudio", v121);
  }

  uint64_t v122 = NSNumber;
  uint64_t isSendingVideo = objc_msgSend_isSendingVideo(self, v123, v124, v125, v126);
  uint64_t v131 = objc_msgSend_numberWithBool_(v122, v128, isSendingVideo, v129, v130);
  if (v131) {
    CFDictionarySetValue(v3, @"IsSendingVideo", v131);
  }

  id v136 = objc_msgSend_dataUploaded(self, v132, v133, v134, v135);
  if (v136) {
    CFDictionarySetValue(v3, @"DataUploaded", v136);
  }

  long long v141 = objc_msgSend_dataDownloaded(self, v137, v138, v139, v140);
  if (v141) {
    CFDictionarySetValue(v3, @"DataDownloaded", v141);
  }

  long long v145 = objc_msgSend_numberWithBool_(NSNumber, v142, self->_relayed, v143, v144);
  if (v145) {
    CFDictionarySetValue(v3, @"IsRelayed", v145);
  }

  uint64_t v146 = NSNumber;
  uint64_t v151 = objc_msgSend_metadataFinalized(self, v147, v148, v149, v150);
  unsigned int v155 = objc_msgSend_numberWithBool_(v146, v152, v151, v153, v154);
  if (v155) {
    CFDictionarySetValue(v3, @"MetadataFinalized", v155);
  }

  uint64_t v159 = objc_msgSend_numberWithBool_(NSNumber, v156, self->_hasReceivedFirstFrame, v157, v158);
  if (v159) {
    CFDictionarySetValue(v3, @"HasReceivedFirstFrame", v159);
  }

  uint64_t v164 = objc_msgSend_dateConnected(self, v160, v161, v162, v163);
  objc_msgSend_timeIntervalSince1970(v164, v165, v166, v167, v168);
  long long v173 = objc_msgSend_numberWithDouble_(NSNumber, v169, v170, v171, v172);
  if (v173) {
    CFDictionarySetValue(v3, @"DateConnected", v173);
  }

  __int16 v178 = objc_msgSend_dateEnded(self, v174, v175, v176, v177);
  objc_msgSend_timeIntervalSince1970(v178, v179, v180, v181, v182);
  long long v187 = objc_msgSend_numberWithDouble_(NSNumber, v183, v184, v185, v186);
  if (v187) {
    CFDictionarySetValue(v3, @"DateEnded", v187);
  }

  __int16 v192 = objc_msgSend_remoteParticipants(self, v188, v189, v190, v191);
  id v193 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v210 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  id v194 = v192;
  uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v210, (uint64_t)v214, 16);
  if (v196)
  {
    uint64_t v200 = v196;
    v209 = v164;
    v201 = 0;
    uint64_t v202 = *(void *)v211;
    do
    {
      uint64_t v203 = 0;
      v204 = v201;
      do
      {
        if (*(void *)v211 != v202) {
          objc_enumerationMutation(v194);
        }
        v201 = objc_msgSend__proxyRepresentationForIMAVChatParticipant_(self, v197, *(void *)(*((void *)&v210 + 1) + 8 * v203), v198, v199);

        objc_msgSend_addObject_(v193, v205, (uint64_t)v201, v206, v207);
        ++v203;
        v204 = v201;
      }
      while (v200 != v203);
      uint64_t v200 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v197, (uint64_t)&v210, (uint64_t)v214, 16);
    }
    while (v200);

    uint64_t v164 = v209;
  }

  if (v193) {
    CFDictionarySetValue(v3, @"RemoteParticipants", v193);
  }

  return v3;
}

- (void)setMetadataFinalized
{
  objc_msgSend__setMetadataFinalized_(self, a2, 1, v2, v3);
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v5, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v11, v9, @"__kIMAVChatConferenceMetadataUpdatedNotification", (uint64_t)self, v10);
}

- (void)_submitCallStartedLoggingWithRecipientID:(id)a3 isCaller:(BOOL)a4 isVideo:(BOOL)a5
{
  BOOL v5 = a4;
  IMStringIsEmail();
  if (v5) {
    FTAWDSetSubmissionDate();
  }
  objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v6, v7, v8, v9);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_isScreenLocked(v14, v10, v11, v12, v13);
  FTAWDLogCallStarted();
}

- (void)_submitCallConnectedLogging
{
  objc_msgSend_isCaller(self, a2, v2, v3, v4);
  objc_msgSend_isVideo(self, v6, v7, v8, v9);
  objc_msgSend__connectDuration(self, v10, v11, v12, v13);
  id v75 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__remoteNetworkConnectionType(self, v14, v15, v16, v17);
  objc_msgSend__localNetworkConnectionType(self, v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend__connectionType(self, v22, v23, v24, v25);
  sub_224FCD528(v26);
  objc_msgSend__usesRelay(self, v27, v28, v29, v30);
  long long v39 = objc_msgSend__natType(self, v31, v32, v33, v34);
  if (!v39)
  {
    long long v39 = objc_msgSend__currentNatType(self, v35, v36, v37, v38);
  }
  uint64_t v40 = objc_msgSend__remoteNatType(self, v35, v36, v37, v38);
  uint64_t v45 = objc_msgSend_unsignedIntValue(v39, v41, v42, v43, v44);
  uint64_t v46 = sub_224FCD5D8(v45);
  uint64_t v51 = objc_msgSend_unsignedIntValue(v40, v47, v48, v49, v50);
  uint64_t v52 = sub_224FCD5D8(v51);
  uint64_t v56 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v53, v46, v54, v55);

  uint64_t v60 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v57, v52, v58, v59);

  uint64_t v65 = objc_msgSend__relayConnectDuration(self, v61, v62, v63, v64);
  uint64_t v70 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v66, v67, v68, v69);
  objc_msgSend_isScreenLocked(v70, v71, v72, v73, v74);
  FTAWDLogCallConnected();
}

- (void)_submitCallInterruptionBeganLogging
{
  objc_msgSend_isCaller(self, a2, v2, v3, v4);
  objc_msgSend_isVideo(self, v6, v7, v8, v9);
  objc_msgSend__isVideoInterrupted(self, v10, v11, v12, v13);
  objc_msgSend__isAudioInterrupted(self, v14, v15, v16, v17);
  uint64_t v18 = NSNumber;
  uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x263F4A638], v19, v20, v21, v22);
  if (objc_msgSend__localNetworkConnectionType(self, v24, v25, v26, v27) == 1) {
    uint64_t v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 3, v29, v30);
  }
  else {
    uint64_t v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 2, v29, v30);
  }
  objc_msgSend_numberWithInt_(v18, v32, v31, v33, v34);
  id v53 = (id)objc_claimAutoreleasedReturnValue();

  long long v39 = objc_msgSend__interruptionBegan(self, v35, v36, v37, v38);

  if (!v39)
  {
    uint64_t v44 = objc_msgSend_date(MEMORY[0x263EFF910], v40, v41, v42, v43);
    objc_msgSend__setInterruptionBegan_(self, v45, (uint64_t)v44, v46, v47);
  }
  uint64_t v48 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v40, v41, v42, v43);
  objc_msgSend_isScreenLocked(v48, v49, v50, v51, v52);
  FTAWDLogCallInterruptionBegan();
}

- (void)_submitCallInterruptionEndedLogging
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  objc_msgSend_isCaller(self, a2, v2, v3, v4);
  objc_msgSend_isVideo(self, v6, v7, v8, v9);
  objc_msgSend__isVideoInterrupted(self, v10, v11, v12, v13);
  objc_msgSend__isAudioInterrupted(self, v14, v15, v16, v17);
  uint64_t v18 = NSNumber;
  uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x263F4A638], v19, v20, v21, v22);
  if (objc_msgSend__localNetworkConnectionType(self, v24, v25, v26, v27) == 1) {
    uint64_t v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 3, v29, v30);
  }
  else {
    uint64_t v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 2, v29, v30);
  }
  uint64_t v35 = objc_msgSend_numberWithInt_(v18, v32, v31, v33, v34);

  uint64_t v40 = objc_msgSend_date(MEMORY[0x263EFF910], v36, v37, v38, v39);
  uint64_t v45 = objc_msgSend__interruptionBegan(self, v41, v42, v43, v44);
  objc_msgSend_timeIntervalSinceDate_(v40, v46, (uint64_t)v45, v47, v48);
  double v50 = v49;

  uint64_t v51 = sub_224FB12A0();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v56 = objc_msgSend__interruptionBegan(self, v52, v53, v54, v55);
    uint64_t v61 = objc_msgSend_date(MEMORY[0x263EFF910], v57, v58, v59, v60);
    int v78 = 138412802;
    uint64_t v79 = v56;
    __int16 v80 = 2112;
    uint64_t v81 = v61;
    __int16 v82 = 2048;
    double v83 = v50;
    _os_log_impl(&dword_224F93000, v51, OS_LOG_TYPE_DEFAULT, "Interruption start date %@ end date %@ interval %f", (uint8_t *)&v78, 0x20u);
  }
  uint64_t v65 = objc_msgSend_numberWithLongLong_(NSNumber, v62, (unint64_t)(v50 * 1000.0), v63, v64);
  uint64_t v70 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v66, v67, v68, v69);
  objc_msgSend_isScreenLocked(v70, v71, v72, v73, v74);
  FTAWDLogCallInterruptionEnded();

  objc_msgSend__setInterruptionBegan_(self, v75, 0, v76, v77);
}

- (void)__sendEndCallMetricToViceroyWithReason:(unsigned int)a3 andError:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v7 = objc_msgSend_numberWithInt_(NSNumber, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  objc_msgSend_numberWithInt_(NSNumber, v8, v5, v9, v10);
  v276 = int v268 = v5;
  if (qword_2680BF000
    || ((uint64_t v15 = (void **)MEMORY[0x22A628620]("GKSErrorDetailedError", @"AVConference")) == 0
      ? (uint64_t v16 = 0)
      : (uint64_t v16 = *v15),
        objc_storeStrong((id *)&qword_2680BF000, v16),
        qword_2680BF000))
  {
    uint64_t v17 = objc_msgSend_userInfo(self->_error, v11, v12, v13, v14);
    uint64_t v21 = objc_msgSend_objectForKey_(v17, v18, qword_2680BF000, v19, v20);
    uint64_t v26 = objc_msgSend_intValue(v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v26 = 0xFFFFFFFFLL;
  }
  if (qword_2680BF008
    || ((uint64_t v27 = (void **)MEMORY[0x22A628620]("GKSErrorReturnCode", @"AVConference")) == 0
      ? (uint64_t v28 = 0)
      : (uint64_t v28 = *v27),
        objc_storeStrong((id *)&qword_2680BF008, v28),
        qword_2680BF008))
  {
    uint64_t v29 = objc_msgSend_userInfo(self->_error, v11, v12, v13, v14);
    uint64_t v33 = objc_msgSend_objectForKey_(v29, v30, qword_2680BF008, v31, v32);
    uint64_t v38 = objc_msgSend_intValue(v33, v34, v35, v36, v37);
  }
  else
  {
    uint64_t v38 = 0xFFFFFFFFLL;
  }
  uint64_t v39 = objc_msgSend_numberWithInt_(NSNumber, v11, v26, v13, v14);
  uint64_t v43 = objc_msgSend_numberWithInt_(NSNumber, v40, v38, v41, v42);
  uint64_t v52 = objc_msgSend__natType(self, v44, v45, v46, v47);
  if (!v52)
  {
    uint64_t v52 = objc_msgSend__currentNatType(self, v48, v49, v50, v51);
  }
  v257 = objc_msgSend__remoteNatType(self, v48, v49, v50, v51);
  uint64_t v53 = NSNumber;
  uint64_t v58 = objc_msgSend_otherIMHandle(self, v54, v55, v56, v57);
  uint64_t v63 = objc_msgSend_ID(v58, v59, v60, v61, v62);
  uint64_t v68 = objc_msgSend__FZBestGuessFZIDType(v63, v64, v65, v66, v67);
  uint64_t v72 = objc_msgSend_numberWithInteger_(v53, v69, v68, v70, v71);

  uint64_t v73 = NSNumber;
  uint64_t isCaller = objc_msgSend_isCaller(self, v74, v75, v76, v77);
  v274 = objc_msgSend_numberWithInt_(v73, v79, isCaller, v80, v81);
  __int16 v82 = NSNumber;
  uint64_t isVideo = objc_msgSend_isVideo(self, v83, v84, v85, v86);
  uint64_t v91 = objc_msgSend_numberWithBool_(v82, v88, isVideo, v89, v90);
  uint64_t v96 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v92, v93, v94, v95);
  uint64_t v97 = NSNumber;
  uint64_t valid = objc_msgSend_validNetworkEnabled(v96, v98, v99, v100, v101);
  v251 = objc_msgSend_numberWithInt_(v97, v103, valid, v104, v105);
  uint64_t v106 = NSNumber;
  uint64_t v111 = objc_msgSend_validNetworkActive(v96, v107, v108, v109, v110);
  value = objc_msgSend_numberWithInt_(v106, v112, v111, v113, v114);
  uint64_t v115 = NSNumber;
  v267 = v96;
  uint64_t v120 = objc_msgSend_validNetworkReachable(v96, v116, v117, v118, v119);
  objc_msgSend_numberWithInt_(v115, v121, v120, v122, v123);
  id v270 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v128 = objc_msgSend__remoteNetworkConnectionType(self, v124, v125, v126, v127);
  BOOL v133 = objc_msgSend__localNetworkConnectionType(self, v129, v130, v131, v132) == 1;
  v253 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v134, v133, v135, v136);
  v255 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v137, v128 == 1, v138, v139);
  uint64_t v140 = NSNumber;
  uint64_t v145 = objc_msgSend__usesRelay(self, v141, v142, v143, v144);
  v261 = objc_msgSend_numberWithInt_(v140, v146, v145, v147, v148);
  uint64_t v149 = NSNumber;
  uint64_t v154 = objc_msgSend__connectionType(self, v150, v151, v152, v153);
  v265 = objc_msgSend_numberWithInt_(v149, v155, v154, v156, v157);
  v259 = objc_msgSend__relayConnectDuration(self, v158, v159, v160, v161);
  v263 = objc_msgSend__connectDuration(self, v162, v163, v164, v165);
  v249 = objc_msgSend_dataRate(self, v166, v167, v168, v169);
  uint64_t v170 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v171 = v7;
  v278 = v171;
  if (v171)
  {
    CFDictionarySetValue(v170, @"end-reason", v171);
    id v171 = v278;
  }

  id v172 = v276;
  if (v172) {
    CFDictionarySetValue(v170, @"end-error", v172);
  }

  id v173 = v39;
  if (v173) {
    CFDictionarySetValue(v170, @"gks-error", v173);
  }

  id v174 = v43;
  if (v174) {
    CFDictionarySetValue(v170, @"gks-return-code", v174);
  }

  id v175 = v91;
  if (v175) {
    CFDictionarySetValue(v170, @"video", v175);
  }

  id v176 = v52;
  if (v176) {
    CFDictionarySetValue(v170, @"nat-type", v176);
  }

  id v177 = v257;
  v277 = v177;
  if (v177)
  {
    CFDictionarySetValue(v170, @"remote-nat-type", v177);
    id v177 = v277;
  }

  id v178 = v72;
  if (v178) {
    CFDictionarySetValue(v170, @"remote-type", v178);
  }

  id v179 = v274;
  v275 = v179;
  if (v179)
  {
    CFDictionarySetValue(v170, @"outgoing", v179);
    id v179 = v275;
  }

  id v180 = v251;
  if (v180) {
    CFDictionarySetValue(v170, @"network", v180);
  }

  id v181 = value;
  valuea = v181;
  if (v181)
  {
    CFDictionarySetValue(v170, @"active", v181);
    id v181 = valuea;
  }

  id v182 = v270;
  id v271 = v182;
  if (v182)
  {
    CFDictionarySetValue(v170, @"reachable", v182);
    id v182 = v271;
  }
  v258 = v176;

  id v183 = v253;
  if (v183) {
    CFDictionarySetValue(v170, @"local-cell", v183);
  }
  v252 = v183;
  v254 = v180;

  id v184 = v255;
  if (v184) {
    CFDictionarySetValue(v170, @"remote-cell", v184);
  }
  v256 = v178;

  id v185 = v261;
  if (v185) {
    CFDictionarySetValue(v170, @"relay", v185);
  }
  v262 = v174;

  id v186 = v265;
  if (v186) {
    CFDictionarySetValue(v170, @"connection-type", v186);
  }
  v266 = v172;

  id v187 = v259;
  if (v187) {
    CFDictionarySetValue(v170, @"relay-connect-time", v187);
  }
  v260 = v175;

  id v188 = v263;
  if (v188) {
    CFDictionarySetValue(v170, @"connect-time", v188);
  }

  id v193 = objc_msgSend__callDuration(self, v189, v190, v191, v192);
  if (v193) {
    CFDictionarySetValue(v170, @"duration", v193);
  }

  uint64_t v198 = objc_msgSend__frontCameraCaptureTime(self, v194, v195, v196, v197);
  if (v198) {
    CFDictionarySetValue(v170, @"frontCapture-time", v198);
  }

  uint64_t v203 = objc_msgSend__backCameraCaptureTime(self, v199, v200, v201, v202);
  if (v203) {
    CFDictionarySetValue(v170, @"backCapture-time", v203);
  }
  v264 = v173;

  id v204 = v249;
  if (v204) {
    CFDictionarySetValue(v170, @"sessionBitRate", v204);
  }

  v205 = NSNumber;
  uint64_t v210 = objc_msgSend__networkCheckResult(self, v206, v207, v208, v209);
  v214 = objc_msgSend_numberWithInteger_(v205, v211, v210, v212, v213);
  if (v214) {
    CFDictionarySetValue(v170, @"network-check", v214);
  }

  if (v268 == 32001)
  {
    uint64_t v219 = objc_msgSend__pingTestResult(self, v215, v216, v217, v218);
    v223 = objc_msgSend_numberWithInteger_(NSNumber, v220, v219, v221, v222);
    if (v223) {
      CFDictionarySetValue(v170, @"ping-test", v223);
    }

    if (!v219)
    {
      v224 = objc_msgSend__pingTestResults(self, v215, v216, v217, v218);
      v228 = objc_msgSend_objectForKey_(v224, v225, @"AVPingTestMin", v226, v227);
      v245 = objc_msgSend_objectForKey_(v224, v229, @"AVPingTestAvg", v230, v231);
      v246 = objc_msgSend_objectForKey_(v224, v232, @"AVPingTestMax", v233, v234);
      v269 = v224;
      v248 = objc_msgSend_objectForKey_(v224, v235, @"AVPingTestPacketLoss", v236, v237);
      id v238 = v228;
      if (v238) {
        CFDictionarySetValue(v170, @"ping-min", v238);
      }
      v250 = v238;

      id v239 = v246;
      if (v239) {
        CFDictionarySetValue(v170, @"ping-max", v239);
      }
      v247 = v239;

      id v240 = v245;
      if (v240) {
        CFDictionarySetValue(v170, @"ping-avg", v240);
      }

      id v241 = v248;
      if (v241) {
        CFDictionarySetValue(v170, @"ping-packetLoss", v241);
      }
    }
  }
  v242 = objc_msgSend_sharedInstance(IMAVInterface, v215, v216, v217, v218);
  objc_msgSend__submitLoggingInformation_forChat_(v242, v243, (uint64_t)v170, (uint64_t)self, v244);
}

- (void)__sendEndCallMetricToAWDWithReason:(unsigned int)a3 andError:(int)a4
{
  sub_224FCD698(*(uint64_t *)&a3);
  sub_224FCD760(a4);
  sub_224FCD774(a4);
  sub_224FCD790(a4);
  unsigned int v6 = sub_224FCD7A4(a4);
  unsigned int v7 = sub_224FCD88C(a4);
  unsigned int v8 = sub_224FCD8A8(a4);
  unsigned int v9 = sub_224FCD8C4(a4);
  sub_224FCD748(a4);
  unsigned int v289 = v6;
  unsigned int v288 = v8;
  unsigned int v287 = v9;
  if (qword_2680BF010
    || ((uint64_t v14 = (void **)MEMORY[0x22A628620]("GKSErrorDetailedError", @"AVConference")) == 0
      ? (uint64_t v15 = 0)
      : (uint64_t v15 = *v14),
        objc_storeStrong((id *)&qword_2680BF010, v15),
        qword_2680BF010))
  {
    uint64_t v16 = objc_msgSend_userInfo(self->_error, v10, v11, v12, v13);
    uint64_t v20 = objc_msgSend_objectForKey_(v16, v17, qword_2680BF010, v18, v19);
    uint64_t v25 = objc_msgSend_intValue(v20, v21, v22, v23, v24);

    objc_msgSend_numberWithInt_(NSNumber, v26, v25, v27, v28);
  }
  else
  {
    objc_msgSend_numberWithInt_(NSNumber, v10, 0xFFFFFFFFLL, v12, v13);
  v299 = };
  if (qword_2680BF018
    || ((uint64_t v33 = (void **)MEMORY[0x22A628620]("GKSErrorReturnCode", @"AVConference")) == 0
      ? (uint64_t v34 = 0)
      : (uint64_t v34 = *v33),
        objc_storeStrong((id *)&qword_2680BF018, v34),
        qword_2680BF018))
  {
    uint64_t v35 = objc_msgSend_userInfo(self->_error, v29, v30, v31, v32);
    uint64_t v39 = objc_msgSend_objectForKey_(v35, v36, qword_2680BF018, v37, v38);
    uint64_t v44 = objc_msgSend_intValue(v39, v40, v41, v42, v43);

    objc_msgSend_numberWithInt_(NSNumber, v45, v44, v46, v47);
  }
  else
  {
    objc_msgSend_numberWithInt_(NSNumber, v29, 0xFFFFFFFFLL, v31, v32);
  v298 = };
  unsigned int v286 = objc_msgSend__remoteNetworkConnectionType(self, v48, v49, v50, v51);
  unsigned int v285 = objc_msgSend__localNetworkConnectionType(self, v52, v53, v54, v55);
  uint64_t v64 = objc_msgSend__natType(self, v56, v57, v58, v59);
  if (!v64)
  {
    uint64_t v64 = objc_msgSend__currentNatType(self, v60, v61, v62, v63);
  }
  uint64_t v65 = objc_msgSend__remoteNatType(self, v60, v61, v62, v63);
  v297 = objc_msgSend__callDuration(self, v66, v67, v68, v69);
  v296 = objc_msgSend__frontCameraCaptureTime(self, v70, v71, v72, v73);
  v295 = objc_msgSend__backCameraCaptureTime(self, v74, v75, v76, v77);
  v294 = objc_msgSend_dataRate(self, v78, v79, v80, v81);
  uint64_t v86 = objc_msgSend_unsignedIntValue(v64, v82, v83, v84, v85);
  uint64_t v87 = sub_224FCD5D8(v86);
  uint64_t v92 = objc_msgSend_unsignedIntValue(v65, v88, v89, v90, v91);
  uint64_t v93 = sub_224FCD5D8(v92);
  uint64_t v97 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v94, v87, v95, v96);

  uint64_t v101 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v98, v93, v99, v100);

  uint64_t v106 = objc_msgSend__pingTestResult(self, v102, v103, v104, v105);
  if (v106)
  {
    if (v106 >= 1)
    {
      uint64_t v111 = sub_224FB12A0();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v111, OS_LOG_TYPE_DEFAULT, "[WARN] Ping test failed", buf, 2u);
      }
    }
    v276 = 0;
    uint64_t v112 = 0;
    v292 = 0;
    v293 = 0;
  }
  else
  {
    uint64_t v113 = objc_msgSend__pingTestResults(self, v107, v108, v109, v110);
    v276 = objc_msgSend_objectForKey_(v113, v114, @"AVPingTestMin", v115, v116);
    uint64_t v112 = objc_msgSend_objectForKey_(v113, v117, @"AVPingTestAvg", v118, v119);
    v293 = objc_msgSend_objectForKey_(v113, v120, @"AVPingTestMax", v121, v122);
    v292 = objc_msgSend_objectForKey_(v113, v123, @"AVPingTestPacketLoss", v124, v125);
  }
  unint64_t v126 = objc_msgSend__networkCheckResult(self, v107, v108, v109, v110);
  int v284 = sub_224FCD8EC(v126);
  uint64_t v131 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v127, v128, v129, v130);
  char valid = objc_msgSend_validNetworkEnabled(v131, v132, v133, v134, v135);

  uint64_t v140 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v136, v137, v138, v139);
  char v282 = objc_msgSend_validNetworkActive(v140, v141, v142, v143, v144);

  uint64_t v149 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v145, v146, v147, v148);
  char v281 = objc_msgSend_validNetworkReachable(v149, v150, v151, v152, v153);

  v291 = objc_msgSend__connectDuration(self, v154, v155, v156, v157);
  uint64_t v162 = objc_msgSend__connectionType(self, v158, v159, v160, v161);
  int v280 = sub_224FCD528(v162);
  char v279 = objc_msgSend__usesRelay(self, v163, v164, v165, v166);
  v290 = objc_msgSend__relayConnectDuration(self, v167, v168, v169, v170);
  objc_msgSend_isCaller(self, v171, v172, v173, v174);
  objc_msgSend_isVideo(self, v175, v176, v177, v178);
  char isVideoInterrupted = objc_msgSend__isVideoInterrupted(self, v179, v180, v181, v182);
  unsigned __int8 isAudioInterrupted = objc_msgSend__isAudioInterrupted(self, v183, v184, v185, v186);
  uint64_t v192 = objc_msgSend__localNetworkConnectionType(self, v188, v189, v190, v191);
  if (v192)
  {
    if (v192 == 2) {
      uint64_t v197 = 2;
    }
    else {
      uint64_t v197 = 3;
    }
    uint64_t v198 = objc_msgSend_sharedInstance(MEMORY[0x263F4A638], v193, v194, v195, v196);
    uint64_t v202 = objc_msgSend_linkQualityValueForInterfaceType_(v198, v199, v197, v200, v201);
  }
  else
  {
    uint64_t v202 = 0;
  }
  uint64_t v203 = objc_msgSend_numberWithInt_(NSNumber, v193, v202, v195, v196);
  uint64_t v275 = objc_msgSend__bustedCallID(self, v204, v205, v206, v207);
  uint64_t v212 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v208, v209, v210, v211);
  LOBYTE(v273) = objc_msgSend_isScreenLocked(v212, v213, v214, v215, v216);
  id v271 = v203;
  v272 = v298;
  BYTE2(v269) = 0;
  BYTE1(v269) = isAudioInterrupted;
  LOBYTE(v269) = isVideoInterrupted;
  v267 = v101;
  int v268 = v290;
  v266 = v97;
  BYTE4(v264) = v279;
  LODWORD(v264) = v280;
  unint64_t v263 = __PAIR64__(v285, v286);
  v262 = v291;
  v261 = v299;
  v260 = v294;
  v259 = v295;
  v258 = v296;
  HIDWORD(v256) = v284;
  BYTE2(v256) = v281;
  BYTE1(v256) = v282;
  LOBYTE(v256) = valid;
  v255 = v292;
  v253 = v112;
  v254 = v293;
  v252 = v276;
  v251 = v297;
  unint64_t v250 = __PAIR64__(v287, v288);
  unint64_t v249 = __PAIR64__(v7, v289);
  FTAWDLogCallEnded();

  if (IsIMAVChatEndedReasonACallFailure(a3))
  {
    objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v217, v218, v219, v220, __PAIR64__(v7, v289), __PAIR64__(v287, v288), v297, v276, v112, v293, v292, v256, v296, v295, v294, v299, v291, __PAIR64__(v285, v286),
      v264,
      v97,
      v101,
      v290,
      v269,
      v203,
      v298,
    uint64_t v221 = v273);
    LOBYTE(v273) = objc_msgSend_isScreenLocked(v221, v222, v223, v224, v225);
    id v271 = v203;
    v272 = v298;
    BYTE2(v269) = 0;
    BYTE1(v269) = isAudioInterrupted;
    LOBYTE(v269) = isVideoInterrupted;
    v267 = v101;
    int v268 = v290;
    v266 = v97;
    BYTE4(v264) = v279;
    LODWORD(v264) = v280;
    unint64_t v263 = __PAIR64__(v285, v286);
    v262 = v291;
    v261 = v299;
    v260 = v294;
    v259 = v295;
    v258 = v296;
    HIDWORD(v256) = v284;
    BYTE2(v256) = v281;
    BYTE1(v256) = v282;
    LOBYTE(v256) = valid;
    v255 = v292;
    v253 = v112;
    v254 = v293;
    v252 = v276;
    v251 = v297;
    unint64_t v250 = __PAIR64__(v287, v288);
    unint64_t v249 = __PAIR64__(v7, v289);
    FTAWDLogCallFailed();
  }
  objc_msgSend_sharedInstance(MEMORY[0x263F4A5B0], v217, v218, v219, v220, v249, v250, v251, v252, v253, v254, v255, v256, v258, v259, v260, v261, v262, v263,
    v264,
    v266,
    v267,
    v268,
    v269,
    v271,
    v272,
  uint64_t v226 = v273);
  int isInternalInstall = objc_msgSend_isInternalInstall(v226, v227, v228, v229, v230);

  if (isInternalInstall)
  {
    uint64_t v236 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v232, v233, v234, v235);
    LOBYTE(v274) = objc_msgSend_isScreenLocked(v236, v237, v238, v239, v240);
    *(_WORD *)((char *)&v270 + 1) = isAudioInterrupted;
    LOBYTE(v270) = isVideoInterrupted;
    BYTE4(v265) = v279;
    LODWORD(v265) = v280;
    HIDWORD(v257) = v284;
    BYTE2(v257) = v281;
    BYTE1(v257) = v282;
    LOBYTE(v257) = valid;
    id v241 = FTAWDLogCallEndedViceroy();

    objc_msgSend_sharedInstance(IMAVInterface, v242, v243, v244, v245, __PAIR64__(v7, v289), __PAIR64__(v287, v288), v297, v276, v112, v293, v292, v257, v296, v295, v294, v299, v291, __PAIR64__(v285, v286),
      v265,
      v97,
      v101,
      v290,
      v270,
      v203,
      v298,
    v246 = v274);
    objc_msgSend__submitEndCallMetric_forCallID_(v246, v247, (uint64_t)v241, v275, v248);
  }
}

- (void)_submitCallEndedLoggingWithReason:(unsigned int)a3 andError:(int)a4
{
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  unsigned int v8 = dispatch_get_global_queue(-32768, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_224FCF320;
  v9[3] = &unk_2647112E0;
  v9[4] = self;
  int v10 = a4;
  unsigned int v11 = a3;
  dispatch_after(v7, v8, v9);
}

@end