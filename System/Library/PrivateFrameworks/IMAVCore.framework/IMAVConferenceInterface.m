@interface IMAVConferenceInterface
+ (BOOL)_useMultipleAVConference;
+ (void)_postParticipantMediaChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 contentRectChanged:(BOOL)a7 cameraWillSwitch:(BOOL)a8 camera:(unsigned int)a9 orentation:(unsigned int)a10 aspect:(CGSize)a11 contentRect:(CGRect)a12;
+ (void)_postParticipantScreenAttributesChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 cameraWillSwitch:(BOOL)a7 camera:(unsigned int)a8 orentation:(unsigned int)a9 aspect:(CGSize)a10;
- (AVConference)controller;
- (BOOL)_hasAVConferenceObjectsForChatsOtherThan:(id)a3;
- (BOOL)_submitEndCallMetric:(id)a3 forCallID:(int64_t)a4;
- (BOOL)_submitLoggingInformation:(id)a3 forChat:(id)a4;
- (BOOL)avChat:(id)a3 generateCallInfoForID:(id)a4 service:(id)a5 usingRelay:(BOOL)a6 callInfo:(id)a7;
- (BOOL)isAVInterfaceReady;
- (BOOL)isMuteForAVChat:(id)a3;
- (BOOL)isPausedForAVChat:(id)a3;
- (BOOL)isSendingAudioForAVChat:(id)a3;
- (BOOL)isSendingVideoForAVChat:(id)a3;
- (BOOL)startPreviewWithError:(id *)a3;
- (BOOL)stopPreview;
- (BOOL)supportsLayers;
- (BOOL)supportsRelay;
- (IMAVConferenceInterface)init;
- (NSNumber)isSendingVideoExpected;
- (id)_avChatForConference:(id)a3;
- (id)_avChatForConference:(id)a3 callID:(int64_t)a4 errorString:(id)a5;
- (id)_conferenceForAVChat:(id)a3;
- (id)_controller;
- (id)_existingConferenceForAVChat:(id)a3;
- (id)_existingConferenceForAVChatGUID:(id)a3;
- (id)_faceTimeUUID;
- (id)_imAVChatParticipantForConference:(id)a3 callID:(int64_t)a4 errorString:(id)a5;
- (id)getNatIPFromICEData:(id)a3;
- (id)natTypeForAVChat:(id)a3;
- (int)_deviceRoleForAVChat:(id)a3;
- (int)avChat:(id)a3 endConferenceForUserID:(id)a4;
- (int)endConferenceForAVChat:(id)a3;
- (unint64_t)capabilities;
- (void)_avChatDealloc:(id)a3;
- (void)_cleanupAVInterface;
- (void)_conferenceEnded:(id)a3;
- (void)_configureAVConference:(id)a3 forChat:(id)a4;
- (void)_notifyAboutPotentialCallForChat:(id)a3;
- (void)_queueAVConferenceForCleanup:(id)a3;
- (void)avChat:(id)a3 prepareConnectionWithCallInfo:(id)a4;
- (void)avChat:(id)a3 setLocalLandscapeAspectRatio:(CGSize)a4 localPortraitAspectRatio:(CGSize)a5;
- (void)avChat:(id)a3 setMute:(BOOL)a4;
- (void)avChat:(id)a3 setPaused:(BOOL)a4;
- (void)avChat:(id)a3 setSendingAudio:(BOOL)a4;
- (void)avChat:(id)a3 setSendingVideo:(BOOL)a4;
- (void)cancelConferenceForAVChat:(id)a3;
- (void)chatRelayedStatusChanged:(id)a3;
- (void)chatStateUpdated;
- (void)conference:(id)a3 callID:(int64_t)a4 setPauseVideo:(BOOL)a5;
- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 didChangeLocalVariablesForCallID:(int64_t)a4;
- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5 callMetadata:(id)a6;
- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 localIPChange:(id)a4 withCallID:(int64_t)a5;
- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4;
- (void)conference:(id)a3 reinitializeCallForCallID:(unsigned int)a4;
- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5;
- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseAudio:(BOOL)a5 error:(id)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5;
- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5;
- (void)dealloc;
- (void)endAVConferenceWithChat:(id)a3 callID:(int64_t)a4;
- (void)handleRelayCancel:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5;
- (void)handleRelayInitate:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5;
- (void)handleRelayUpdate:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5;
- (void)initAVInterface;
- (void)localVideoBackLayer;
- (void)localVideoLayer;
- (void)processRemoteIPChanged:(id)a3 fromParticipant:(id)a4;
- (void)serverDiedForConference:(id)a3;
- (void)setLocalVideoBackLayer:(void *)a3;
- (void)setLocalVideoLayer:(void *)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3 forChat:(id)a4;
- (void)setRemoteVideoPresentationState:(unsigned int)a3 forChat:(id)a4;
- (void)setSendingVideoExpected:(id)a3;
- (void)updateAVChat:(id)a3 withCallMetadata:(id)a4 isFinalUpdate:(BOOL)a5;
@end

@implementation IMAVConferenceInterface

+ (BOOL)_useMultipleAVConference
{
  v5 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  if (objc_msgSend_blockMultipleIncomingInvitations(v5, v6, v7, v8, v9))
  {
    v14 = objc_msgSend_sharedInstance(IMAVController, v10, v11, v12, v13);
    if (objc_msgSend_blockIncomingInvitationsDuringCall(v14, v15, v16, v17, v18))
    {
      v23 = objc_msgSend_sharedInstance(IMAVController, v19, v20, v21, v22);
      int v28 = objc_msgSend_blockOutgoingInvitationsDuringCall(v23, v24, v25, v26, v27) ^ 1;
    }
    else
    {
      LOBYTE(v28) = 1;
    }
  }
  else
  {
    LOBYTE(v28) = 1;
  }

  return v28;
}

- (IMAVConferenceInterface)init
{
  v104.receiver = self;
  v104.super_class = (Class)IMAVConferenceInterface;
  uint64_t v2 = [(IMAVConferenceInterface *)&v104 init];

  if (v2)
  {
    qword_26AB79500 = MEMORY[0x22A628610](@"AVConference", @"AVConference");
    qword_26AB79648 = MEMORY[0x22A628610](@"VCCapabilities", @"AVConference");
    if (!qword_26AB795A0)
    {
      uint64_t v7 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_ClientData", @"AVConference");
      if (v7) {
        uint64_t v8 = *v7;
      }
      else {
        uint64_t v8 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795A0, v8);
    }
    if (!qword_26AB79608)
    {
      uint64_t v9 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_SelfNatType", @"AVConference");
      if (v9) {
        v10 = *v9;
      }
      else {
        v10 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79608, v10);
    }
    if (!qword_26AB795F8)
    {
      uint64_t v11 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_SelfBlob", @"AVConference");
      if (v11) {
        uint64_t v12 = *v11;
      }
      else {
        uint64_t v12 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795F8, v12);
    }
    if (!qword_26AB795C0)
    {
      uint64_t v13 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerID", @"AVConference");
      if (v13) {
        v14 = *v13;
      }
      else {
        v14 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795C0, v14);
    }
    if (!qword_26AB795C8)
    {
      v15 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerNatType", @"AVConference");
      if (v15) {
        uint64_t v16 = *v15;
      }
      else {
        uint64_t v16 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795C8, v16);
    }
    if (!qword_26AB795B0)
    {
      uint64_t v17 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerBlob", @"AVConference");
      if (v17) {
        uint64_t v18 = *v17;
      }
      else {
        uint64_t v18 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795B0, v18);
    }
    if (!qword_26AB79640)
    {
      v19 = (void **)MEMORY[0x22A628620]("GKSRelayType", @"AVConference");
      if (v19) {
        uint64_t v20 = *v19;
      }
      else {
        uint64_t v20 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79640, v20);
    }
    if (!qword_26AB795A8)
    {
      uint64_t v21 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_ConnectionID", @"AVConference");
      if (v21) {
        uint64_t v22 = *v21;
      }
      else {
        uint64_t v22 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795A8, v22);
    }
    if (!qword_26AB79638)
    {
      v23 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_TransactionID", @"AVConference");
      if (v23) {
        v24 = *v23;
      }
      else {
        v24 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79638, v24);
    }
    if (!qword_26AB79630)
    {
      uint64_t v25 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_Token", @"AVConference");
      if (v25) {
        uint64_t v26 = *v25;
      }
      else {
        uint64_t v26 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79630, v26);
    }
    if (!qword_26AB795D0)
    {
      uint64_t v27 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerRelayIP", @"AVConference");
      if (v27) {
        int v28 = *v27;
      }
      else {
        int v28 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795D0, v28);
    }
    if (!qword_26AB795E8)
    {
      v29 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerRelayPort", @"AVConference");
      if (v29) {
        v30 = *v29;
      }
      else {
        v30 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795E8, v30);
    }
    if (!qword_26AB79610)
    {
      v31 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_SelfRelayIP", @"AVConference");
      if (v31) {
        v32 = *v31;
      }
      else {
        v32 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79610, v32);
    }
    if (!qword_26AB79628)
    {
      v33 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_SelfRelayPort", @"AVConference");
      if (v33) {
        v34 = *v33;
      }
      else {
        v34 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79628, v34);
    }
    if (!qword_26AB79618)
    {
      v35 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_SelfRelayNatIP", @"AVConference");
      if (v35) {
        v36 = *v35;
      }
      else {
        v36 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79618, v36);
    }
    if (!qword_26AB79620)
    {
      v37 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_SelfRelayNatPort", @"AVConference");
      if (v37) {
        v38 = *v37;
      }
      else {
        v38 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79620, v38);
    }
    if (!qword_26AB795D8)
    {
      v39 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerRelayNatIP", @"AVConference");
      if (v39) {
        v40 = *v39;
      }
      else {
        v40 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795D8, v40);
    }
    if (!qword_26AB795E0)
    {
      v41 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerRelayNatPort", @"AVConference");
      if (v41) {
        v42 = *v41;
      }
      else {
        v42 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795E0, v42);
    }
    if (!qword_26AB795F0)
    {
      v43 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_RemotePrimaryId", @"AVConference");
      if (v43) {
        v44 = *v43;
      }
      else {
        v44 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795F0, v44);
    }
    if (!qword_26AB79600)
    {
      v45 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_SelfExternalAddr", @"AVConference");
      if (v45) {
        v46 = *v45;
      }
      else {
        v46 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79600, v46);
    }
    if (!qword_26AB795B8)
    {
      v47 = (void **)MEMORY[0x22A628620]("GKSRelayParameter_PeerExternalAddr", @"AVConference");
      if (v47) {
        v48 = *v47;
      }
      else {
        v48 = 0;
      }
      objc_storeStrong((id *)&qword_26AB795B8, v48);
    }
    if (!qword_26AB79550)
    {
      v49 = (void **)MEMORY[0x22A628620]("GKSDidStartParameter_ConnType", @"AVConference");
      if (v49) {
        v50 = *v49;
      }
      else {
        v50 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79550, v50);
    }
    if (!qword_26AB79558)
    {
      v51 = (void **)MEMORY[0x22A628620]("GKSDidStartParameter_Error", @"AVConference");
      if (v51) {
        v52 = *v51;
      }
      else {
        v52 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79558, v52);
    }
    if (!qword_26AB79548)
    {
      v53 = (void **)MEMORY[0x22A628620]("GKSDidStartParameter_CallID", @"AVConference");
      if (v53) {
        v54 = *v53;
      }
      else {
        v54 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79548, v54);
    }
    if (!qword_26AB79560)
    {
      v55 = (void **)MEMORY[0x22A628620]("GKSDidStartParameter_localUseCell", @"AVConference");
      if (v55) {
        v56 = *v55;
      }
      else {
        v56 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79560, v56);
    }
    if (!qword_26AB79568)
    {
      v57 = (void **)MEMORY[0x22A628620]("GKSDidStartParameter_remoteUseCell", @"AVConference");
      if (v57) {
        v58 = *v57;
      }
      else {
        v58 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79568, v58);
    }
    if (!qword_26AB79508)
    {
      v59 = (void **)MEMORY[0x22A628620]("GKSCDXServerAddress", @"AVConference");
      if (v59) {
        v60 = *v59;
      }
      else {
        v60 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79508, v60);
    }
    if (!qword_26AB79510)
    {
      v61 = (void **)MEMORY[0x22A628620]("GKSCommNATServerCohortAddress", @"AVConference");
      if (v61) {
        v62 = *v61;
      }
      else {
        v62 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79510, v62);
    }
    if (!qword_26AB79520)
    {
      v63 = (void **)MEMORY[0x22A628620]("GKSCommNATServerMain0Address", @"AVConference");
      if (v63) {
        v64 = *v63;
      }
      else {
        v64 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79520, v64);
    }
    if (!qword_26AB79530)
    {
      v65 = (void **)MEMORY[0x22A628620]("GKSCommNATServerMain1Address", @"AVConference");
      if (v65) {
        v66 = *v65;
      }
      else {
        v66 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79530, v66);
    }
    if (!qword_26AB79518)
    {
      v67 = (void **)MEMORY[0x22A628620]("GKSCommNATServerCohortName", @"AVConference");
      if (v67) {
        v68 = *v67;
      }
      else {
        v68 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79518, v68);
    }
    if (!qword_26AB79528)
    {
      v69 = (void **)MEMORY[0x22A628620]("GKSCommNATServerMain0Name", @"AVConference");
      if (v69) {
        v70 = *v69;
      }
      else {
        v70 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79528, v70);
    }
    if (!qword_26AB79538)
    {
      v71 = (void **)MEMORY[0x22A628620]("GKSCommNATServerMain1Name", @"AVConference");
      if (v71) {
        v72 = *v71;
      }
      else {
        v72 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79538, v72);
    }
    if (!qword_26AB79598)
    {
      v73 = (void **)MEMORY[0x22A628620]("GKSPreEmptiveRelayTimeout", @"AVConference");
      if (v73) {
        v74 = *v73;
      }
      else {
        v74 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79598, v74);
    }
    if (!qword_26AB79578)
    {
      v75 = (void **)MEMORY[0x22A628620]("GKSMaxRelayBitrate", @"AVConference");
      if (v75) {
        v76 = *v75;
      }
      else {
        v76 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79578, v76);
    }
    if (!qword_26AB79570)
    {
      v77 = (void **)MEMORY[0x22A628620]("GKSICETimeout", @"AVConference");
      if (v77) {
        v78 = *v77;
      }
      else {
        v78 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79570, v78);
    }
    if (!qword_26AB79580)
    {
      v79 = (void **)MEMORY[0x22A628620]("GKSNATCheckTimeout", @"AVConference");
      if (v79) {
        v80 = *v79;
      }
      else {
        v80 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79580, v80);
    }
    if (!qword_26AB79540)
    {
      v81 = (void **)MEMORY[0x22A628620]("GKSConnectionBlobMaxBytes", @"AVConference");
      if (v81) {
        v82 = *v81;
      }
      else {
        v82 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79540, v82);
    }
    if (!qword_26AB79590)
    {
      v83 = (void **)MEMORY[0x22A628620]("GKSNoRemotePacketsTimeout", @"AVConference");
      if (v83) {
        v84 = *v83;
      }
      else {
        v84 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79590, v84);
    }
    if (!qword_26AB79588)
    {
      v85 = (void **)MEMORY[0x22A628620]("GKSNetworkConditionsTimeout", @"AVConference");
      if (v85) {
        v86 = *v85;
      }
      else {
        v86 = 0;
      }
      objc_storeStrong((id *)&qword_26AB79588, v86);
    }
    v2->_duringInit = 1;
    objc_msgSend_initAVInterface(v2, v3, v4, v5, v6);
    v2->_duringInit = 0;
    v87 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    avConferencesLock = v2->_avConferencesLock;
    v2->_avConferencesLock = v87;

    v93 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v89, v90, v91, v92);
    v98 = objc_msgSend_listener(v93, v94, v95, v96, v97);
    objc_msgSend_addHandler_(v98, v99, (uint64_t)v2, v100, v101);
  }
  v102 = v2;

  return v102;
}

- (void)dealloc
{
  objc_msgSend_stopPreview(self, a2, v2, v3, v4);
  objc_msgSend_makeObjectsPerformSelector_withObject_(self->_avConferencesToCleanup, v6, (uint64_t)sel_setDelegate_, 0, v7);
  objc_msgSend_lock(self->_avConferencesLock, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_allValues(self->_avConferences, v12, v13, v14, v15);
  objc_msgSend_makeObjectsPerformSelector_withObject_(v16, v17, (uint64_t)sel_setDelegate_, 0, v18);
  objc_msgSend_unlock(self->_avConferencesLock, v19, v20, v21, v22);

  v23.receiver = self;
  v23.super_class = (Class)IMAVConferenceInterface;
  [(IMAVInterface *)&v23 dealloc];
}

- (id)_faceTimeUUID
{
  if (qword_2680BEFE8 != -1) {
    dispatch_once(&qword_2680BEFE8, &unk_26D85A670);
  }
  uint64_t v2 = (void *)qword_2680BEFE0;
  return v2;
}

- (void)_configureAVConference:(id)a3 forChat:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v6, v7, v8, v9);
  int v15 = objc_msgSend_nonWifiFaceTimeAvailable(v10, v11, v12, v13, v14);

  objc_msgSend_setRequiresWifi_(v5, v16, v15 ^ 1u, v17, v18);
  v19 = sub_224FB12A0();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = @"YES";
    if (v15) {
      uint64_t v20 = @"NO";
    }
    int v24 = 138412290;
    uint64_t v25 = v20;
    _os_log_impl(&dword_224F93000, v19, OS_LOG_TYPE_DEFAULT, "Requires wifi: %@", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend_setDelegate_(v5, v21, (uint64_t)self, v22, v23);
}

- (BOOL)_hasAVConferenceObjectsForChatsOtherThan:(id)a3
{
  avConferencesLock = self->_avConferencesLock;
  id v5 = a3;
  objc_msgSend_lock(avConferencesLock, v6, v7, v8, v9);
  avConferences = self->_avConferences;
  int v15 = objc_msgSend_GUID(v5, v11, v12, v13, v14);

  v19 = objc_msgSend_objectForKey_(avConferences, v16, (uint64_t)v15, v17, v18);

  BOOL v24 = v19 && (unint64_t)objc_msgSend_count(self->_avConferences, v20, v21, v22, v23) > 1
     || objc_msgSend_count(self->_avConferences, v20, v21, v22, v23) != 0;
  objc_msgSend_unlock(self->_avConferencesLock, v20, v21, v22, v23);
  return v24;
}

- (id)_existingConferenceForAVChat:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v5, v6, v7, v8);
  int v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  v19 = 0;
  if (v4)
  {
    if (v14)
    {
      v19 = objc_msgSend_GUID(v4, v15, v16, v17, v18);

      if (v19)
      {
        objc_msgSend_lock(self->_avConferencesLock, v20, v21, v22, v23);
        avConferences = self->_avConferences;
        v29 = objc_msgSend_GUID(v4, v25, v26, v27, v28);
        v19 = objc_msgSend_objectForKey_(avConferences, v30, (uint64_t)v29, v31, v32);

        objc_msgSend_unlock(self->_avConferencesLock, v33, v34, v35, v36);
      }
    }
  }

  return v19;
}

- (id)_existingConferenceForAVChatGUID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v5, v6, v7, v8);
  int v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  if (v14)
  {
    objc_msgSend_lock(self->_avConferencesLock, v15, v16, v17, v18);
    uint64_t v22 = objc_msgSend_objectForKey_(self->_avConferences, v19, (uint64_t)v4, v20, v21);
    objc_msgSend_unlock(self->_avConferencesLock, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)_conferenceForAVChat:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v5, v6, v7, v8);
  int v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  v19 = 0;
  if (v4 && v14)
  {
    uint64_t v20 = objc_msgSend_GUID(v4, v15, v16, v17, v18);

    if (v20)
    {
      objc_msgSend_lock(self->_avConferencesLock, v21, v22, v23, v24);
      avConferences = self->_avConferences;
      v30 = objc_msgSend_GUID(v4, v26, v27, v28, v29);
      v19 = objc_msgSend_objectForKey_(avConferences, v31, (uint64_t)v30, v32, v33);

      objc_msgSend_unlock(self->_avConferencesLock, v34, v35, v36, v37);
      if (!v19)
      {
        v42 = objc_msgSend__faceTimeUUID(self, v38, v39, v40, v41);
        v43 = sub_224FB12A0();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v42;
          _os_log_impl(&dword_224F93000, v43, OS_LOG_TYPE_DEFAULT, "Initializing conference with UUID %@", buf, 0xCu);
        }

        id v44 = objc_alloc((Class)qword_26AB79500);
        v49 = objc_msgSend__faceTimeUUID(self, v45, v46, v47, v48);
        v19 = objc_msgSend_initWithClientUUID_transportType_(v44, v50, (uint64_t)v49, 0, v51);

        v52 = sub_224FB12A0();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v77 = v19;
          __int16 v78 = 2112;
          id v79 = v4;
          _os_log_impl(&dword_224F93000, v52, OS_LOG_TYPE_DEFAULT, "Created AVConference Instance: %@ for chat: %@", buf, 0x16u);
        }

        if (v19)
        {
          objc_msgSend__configureAVConference_forChat_(self, v53, (uint64_t)v19, (uint64_t)v4, v54);
          objc_msgSend_lock(self->_avConferencesLock, v55, v56, v57, v58);
          v63 = self->_avConferences;
          if (!v63)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            v65 = self->_avConferences;
            self->_avConferences = Mutable;

            v63 = self->_avConferences;
          }
          v66 = objc_msgSend_GUID(v4, v59, v60, v61, v62);
          objc_msgSend_setObject_forKey_(v63, v67, (uint64_t)v19, (uint64_t)v66, v68);

          objc_msgSend_unlock(self->_avConferencesLock, v69, v70, v71, v72);
        }
        else
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_224FBB888;
          block[3] = &unk_264710F40;
          id v75 = v4;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
      }
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (id)_avChatForConference:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_lock(self->_avConferencesLock, v5, v6, v7, v8);
  v45 = self;
  uint64_t v46 = v4;
  uint64_t v12 = objc_msgSend_allKeysForObject_(self->_avConferences, v9, (uint64_t)v4, v10, v11);
  v49 = objc_msgSend__avChatArray(IMAVChat, v13, v14, v15, v16);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v12;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v55, (uint64_t)v60, 16);
  uint64_t v18 = 0;
  if (v50)
  {
    uint64_t v48 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v21 = v49;
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v51, (uint64_t)v59, 16);
        if (v23)
        {
          uint64_t v28 = v23;
          uint64_t v29 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v52 != v29) {
                objc_enumerationMutation(v21);
              }
              uint64_t v31 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              uint64_t v32 = objc_msgSend_GUID(v31, v24, v25, v26, v27);
              int isEqualToString = objc_msgSend_isEqualToString_(v32, v33, v20, v34, v35);

              if (isEqualToString)
              {
                id v37 = v31;

                uint64_t v18 = v37;
              }
            }
            uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v51, (uint64_t)v59, 16);
          }
          while (v28);
        }
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v55, (uint64_t)v60, 16);
    }
    while (v50);
  }

  objc_msgSend_unlock(v45->_avConferencesLock, v39, v40, v41, v42);
  id v43 = v18;

  return v43;
}

- (id)_imAVChatParticipantForConference:(id)a3 callID:(int64_t)a4 errorString:(id)a5
{
  uint64_t v6 = objc_msgSend__avChatForConference_callID_errorString_(self, a2, (uint64_t)a3, a4, (uint64_t)a5);
  uint64_t v10 = objc_msgSend_participantWithAVConferenceCallID_(v6, v7, a4, v8, v9);

  return v10;
}

- (id)_avChatForConference:(id)a3 callID:(int64_t)a4 errorString:(id)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a5;
  objc_msgSend__avChatForConference_(self, v9, (uint64_t)a3, v10, v11);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16) {
    goto LABEL_25;
  }
  uint64_t v17 = objc_msgSend__chatListLock(IMAVChat, v12, v13, v14, v15);
  objc_msgSend_lock(v17, v18, v19, v20, v21);

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v26 = objc_msgSend__chatList(IMAVChat, v22, v23, v24, v25, 0);
  id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v72, (uint64_t)v82, 16);
  if (v16)
  {
    uint64_t v31 = *(void *)v73;
    while (2)
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v73 != v31) {
          objc_enumerationMutation(v26);
        }
        uint64_t v33 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        uint64_t v34 = objc_msgSend_participantWithAVConferenceCallID_(v33, v28, a4, v29, v30);

        if (v34)
        {
          id v16 = v33;
          goto LABEL_12;
        }
      }
      id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v72, (uint64_t)v82, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  uint64_t v39 = objc_msgSend__chatListLock(IMAVChat, v35, v36, v37, v38);
  objc_msgSend_unlock(v39, v40, v41, v42, v43);

  if (a4)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"alwaysFixCallIDs", @"com.apple.conference", 0);
    if (v16 || !AppBooleanValue) {
      goto LABEL_22;
    }
LABEL_17:
    v45 = sub_224FB12A0();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v77 = v8;
      __int16 v78 = 1024;
      int v79 = a4;
      _os_log_impl(&dword_224F93000, v45, OS_LOG_TYPE_DEFAULT, "%@: Found no conference for CallID: %d  fixing this...", buf, 0x12u);
    }

    uint64_t v50 = objc_msgSend__connectedChat(IMAVChat, v46, v47, v48, v49);

    id v16 = (id)v50;
    if (!v50)
    {
      objc_msgSend__activeChat(IMAVChat, v51, v52, v53, v54);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v59 = objc_msgSend__avChatArray(IMAVChat, v55, v56, v57, v58);
        objc_msgSend_lastObject(v59, v60, v61, v62, v63);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    goto LABEL_22;
  }
  if (!v16) {
    goto LABEL_17;
  }
LABEL_22:
  v64 = sub_224FB12A0();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    int v69 = objc_msgSend__bustedCallID(v16, v65, v66, v67, v68);
    *(_DWORD *)buf = 138412802;
    id v77 = v16;
    __int16 v78 = 1024;
    int v79 = v69;
    __int16 v80 = 1024;
    int v81 = a4;
    _os_log_impl(&dword_224F93000, v64, OS_LOG_TYPE_DEFAULT, "_avChatForConference Found chat: %@ (%d) for callID: %d", buf, 0x18u);
  }

LABEL_25:
  id v70 = v16;

  return v70;
}

- (int)_deviceRoleForAVChat:(id)a3
{
  if (objc_msgSend_isRelayed(a3, a2, (uint64_t)a3, v3, v4)) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)_cleanupAVInterface
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Cleanup AV Interfaces", buf, 2u);
  }

  self->_pendingCleanup = 0;
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x263F8C6D0], v4, (uint64_t)self, (uint64_t)sel__cleanupAVInterface, 0);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_avConferencesToCleanup;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v28, (uint64_t)v34, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(NSMutableArray **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = sub_224FB12A0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = v11;
          _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Unsetting delegate for AVConference: %@", buf, 0xCu);
        }

        objc_msgSend_setDelegate_(v11, v13, 0, v14, v15);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v28, (uint64_t)v34, 16);
    }
    while (v8);
  }

  uint64_t v17 = sub_224FB12A0();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    avConferencesToCleanup = self->_avConferencesToCleanup;
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = avConferencesToCleanup;
    _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, "Releasing AVConferences: %@", buf, 0xCu);
  }

  objc_msgSend_removeAllObjects(self->_avConferencesToCleanup, v19, v20, v21, v22);
  if (!objc_msgSend_count(self->_avConferencesToCleanup, v23, v24, v25, v26))
  {
    uint64_t v27 = self->_avConferencesToCleanup;
    self->_avConferencesToCleanup = 0;
  }
}

- (void)_queueAVConferenceForCleanup:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v9 = objc_msgSend__useMultipleAVConference(IMAVConferenceInterface, v5, v6, v7, v8);
  if (v4 && v9)
  {
    uint64_t v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v48 = 138412290;
      id v49 = v4;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Queue AVConference for cleanup: %@", (uint8_t *)&v48, 0xCu);
    }

    avConferencesToCleanup = self->_avConferencesToCleanup;
    if (!avConferencesToCleanup)
    {
      uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v16 = self->_avConferencesToCleanup;
      self->_avConferencesToCleanup = v15;

      avConferencesToCleanup = self->_avConferencesToCleanup;
    }
    objc_msgSend_addObject_(avConferencesToCleanup, v11, (uint64_t)v4, v12, v13);
    objc_msgSend_setDelegate_(v4, v17, 0, v18, v19);
    self->_pendingCleanup = 1;
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x263F8C6D0], v20, (uint64_t)self, (uint64_t)sel__cleanupAVInterface, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(self, v21, (uint64_t)sel__cleanupAVInterface, 0, v22, 5.0);
    objc_msgSend_lock(self->_avConferencesLock, v23, v24, v25, v26);
    long long v30 = objc_msgSend_allKeysForObject_(self->_avConferences, v27, (uint64_t)v4, v28, v29);
    if (objc_msgSend_count(v30, v31, v32, v33, v34))
    {
      uint64_t v39 = sub_224FB12A0();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        int v48 = 138412290;
        id v49 = v4;
        _os_log_impl(&dword_224F93000, v39, OS_LOG_TYPE_DEFAULT, "Removing AVConference from available conference sets: %@", (uint8_t *)&v48, 0xCu);
      }

      objc_msgSend_removeObjectsForKeys_(self->_avConferences, v40, (uint64_t)v30, v41, v42);
    }
    if (!objc_msgSend_count(self->_avConferences, v35, v36, v37, v38))
    {
      avConferences = self->_avConferences;
      self->_avConferences = 0;
    }
    objc_msgSend_unlock(self->_avConferencesLock, v43, v44, v45, v46);
  }
}

- (void)initAVInterface
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Init AV Interface", buf, 2u);
  }

  v21.receiver = self;
  v21.super_class = (Class)IMAVConferenceInterface;
  [(IMAVInterface *)&v21 initAVInterface];
  uint64_t v8 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v4, v5, v6, v7);
  char v13 = objc_msgSend_faceTimeSupported(v8, v9, v10, v11, v12);

  if (v13)
  {
    if (self->_duringInit) {
      return;
    }
    uint64_t v18 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v14, v15, v16, v17);
    objc_msgSend___mainThreadPostNotificationName_object_(v18, v19, @"__kIMAVInterfaceReadyNotification", 0, v20);
  }
  else
  {
    uint64_t v18 = sub_224FB12A0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v18, OS_LOG_TYPE_DEFAULT, "Unsupported on this device, not initing", buf, 2u);
    }
  }
}

- (BOOL)isAVInterfaceReady
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], a2, v2, v3, v4);
  objc_msgSend_faceTimeSupported(v5, v6, v7, v8, v9);

  return 1;
}

- (void)_conferenceEnded:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "chat: %@", buf, 0xCu);
  }

  objc_msgSend_avChat_endConferenceForUserID_(self, v6, (uint64_t)v4, 0, v7);
  v15.receiver = self;
  v15.super_class = (Class)IMAVConferenceInterface;
  [(IMAVInterface *)&v15 _conferenceEnded:v4];
  uint64_t v11 = objc_msgSend__existingConferenceForAVChat_(self, v8, (uint64_t)v4, v9, v10);
  objc_msgSend__queueAVConferenceForCleanup_(self, v12, (uint64_t)v11, v13, v14);
}

- (BOOL)isMuteForAVChat:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (!v4)
  {
    uint64_t v24 = sub_224FB12A0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "No avChat", v26, 2u);
    }

    goto LABEL_9;
  }
  if (objc_msgSend__bustedCallID(v4, v5, v6, v7, v8) < 1)
  {
LABEL_9:
    char isMicrophoneMuted = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend_isAVInterfaceReady(self, v10, v11, v12, v13) & 1) == 0) {
    objc_msgSend_initAVInterface(self, v14, v15, v16, v17);
  }
  uint64_t v18 = objc_msgSend__existingConferenceForAVChat_(self, v14, (uint64_t)v9, v16, v17);
  char isMicrophoneMuted = objc_msgSend_isMicrophoneMuted(v18, v19, v20, v21, v22);

LABEL_10:
  return isMicrophoneMuted;
}

- (void)avChat:(id)a3 setMute:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (v10)
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v6, v7, v8, v9) & 1) == 0) {
      objc_msgSend_initAVInterface(self, v11, v12, v13, v14);
    }
    uint64_t v15 = sub_224FB12A0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = @"NO";
      if (v4) {
        uint64_t v16 = @"YES";
      }
      int v28 = 138412546;
      id v29 = v10;
      __int16 v30 = 2112;
      long long v31 = v16;
      _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "Setting %@ to muted: %@", (uint8_t *)&v28, 0x16u);
    }

    if (objc_msgSend_state(v10, v17, v18, v19, v20) >= 5) {
      objc_msgSend__conferenceForAVChat_(self, v21, 0, v22, v23);
    }
    else {
    uint64_t v24 = objc_msgSend__conferenceForAVChat_(self, v21, (uint64_t)v10, v22, v23);
    }
    objc_msgSend_setMicrophoneMuted_(v24, v25, v4, v26, v27);
  }
  else
  {
    uint64_t v24 = sub_224FB12A0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "No avChat", (uint8_t *)&v28, 2u);
    }
  }
}

- (BOOL)isPausedForAVChat:(id)a3
{
  return objc_msgSend_isSendingVideoForAVChat_(self, a2, (uint64_t)a3, v3, v4) ^ 1;
}

- (void)avChat:(id)a3 setPaused:(BOOL)a4
{
  objc_msgSend_avChat_setSendingVideo_(self, a2, (uint64_t)a3, !a4, v4);
}

- (BOOL)isSendingAudioForAVChat:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    if (objc_msgSend__bustedCallID(v4, v5, v6, v7, v8) < 1)
    {
      BOOL v34 = 1;
      goto LABEL_17;
    }
    if ((objc_msgSend_isAVInterfaceReady(self, v10, v11, v12, v13) & 1) == 0) {
      objc_msgSend_initAVInterface(self, v14, v15, v16, v17);
    }
    uint64_t v18 = objc_msgSend__existingConferenceForAVChat_(self, v14, (uint64_t)v9, v16, v17);
    char v37 = 0;
    uint64_t v23 = objc_msgSend__bustedCallID(v9, v19, v20, v21, v22);
    id v36 = 0;
    char v25 = objc_msgSend_getIsAudioPaused_callID_error_(v18, v24, (uint64_t)&v37, v23, (uint64_t)&v36);
    id v26 = v36;
    if ((v25 & 1) == 0)
    {
      uint64_t v27 = sub_224FB12A0();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v26;
        _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to get audio sending state: %@", buf, 0xCu);
      }

      char v37 = 0;
    }
    int v28 = sub_224FB12A0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = objc_msgSend__bustedCallID(v9, v29, v30, v31, v32);
      *(_DWORD *)buf = 138412802;
      id v39 = v9;
      __int16 v40 = 1024;
      int v41 = v33;
      __int16 v42 = 1024;
      BOOL v43 = v37 == 0;
      _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "isSendingAudioFor: %@   callID: %d returning %d", buf, 0x18u);
    }

    BOOL v34 = v37 == 0;
  }
  else
  {
    uint64_t v18 = sub_224FB12A0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v18, OS_LOG_TYPE_DEFAULT, "No avChat", buf, 2u);
    }
    BOOL v34 = 0;
  }

LABEL_17:
  return v34;
}

- (void)avChat:(id)a3 setSendingAudio:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (v10)
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v6, v7, v8, v9) & 1) == 0) {
      objc_msgSend_initAVInterface(self, v11, v12, v13, v14);
    }
    uint64_t v15 = sub_224FB12A0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        uint64_t v20 = @"YES";
      }
      else {
        uint64_t v20 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      id v46 = v10;
      __int16 v47 = 2112;
      int v48 = v20;
      __int16 v49 = 1024;
      int v50 = objc_msgSend__bustedCallID(v10, v16, v17, v18, v19);
      _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "Setting %@ to sending audio: %@  callID: %d", buf, 0x1Cu);
    }

    if (objc_msgSend_state(v10, v21, v22, v23, v24) >= 5) {
      objc_msgSend__conferenceForAVChat_(self, v25, 0, v26, v27);
    }
    else {
    int v28 = objc_msgSend__conferenceForAVChat_(self, v25, (uint64_t)v10, v26, v27);
    }
    uint64_t v33 = objc_msgSend__bustedCallID(v10, v29, v30, v31, v32);
    id v44 = 0;
    char v35 = objc_msgSend_setPauseAudio_callID_error_(v28, v34, !v4, v33, (uint64_t)&v44);
    id v36 = v44;
    if ((v35 & 1) == 0)
    {
      char v37 = sub_224FB12A0();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = objc_msgSend__bustedCallID(v10, v38, v39, v40, v41);
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v42;
        _os_log_impl(&dword_224F93000, v37, OS_LOG_TYPE_DEFAULT, "[WARN] Could not pause video for callID: %d", buf, 8u);
      }
    }
    if (v36)
    {
      BOOL v43 = sub_224FB12A0();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v36;
        _os_log_impl(&dword_224F93000, v43, OS_LOG_TYPE_DEFAULT, "[WARN] Error pausing video: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    int v28 = sub_224FB12A0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "No avChat", buf, 2u);
    }
  }
}

- (BOOL)isSendingVideoForAVChat:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = v4;
  if (!v4)
  {
    uint64_t v30 = sub_224FB12A0();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v30, OS_LOG_TYPE_DEFAULT, "No avChat", buf, 2u);
    }
    BOOL v39 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend__bustedCallID(v4, v5, v6, v7, v8) < 1)
  {
    BOOL v39 = 1;
  }
  else
  {
    if (objc_msgSend_isVideo(v9, v10, v11, v12, v13))
    {
      if ((objc_msgSend_isAVInterfaceReady(self, v14, v15, v16, v17) & 1) == 0) {
        objc_msgSend_initAVInterface(self, v18, v19, v20, v21);
      }
      uint64_t v22 = sub_224FB12A0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v45 = v9;
        __int16 v46 = 1024;
        int v47 = objc_msgSend__bustedCallID(v9, v23, v24, v25, v26);
        _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "isSendingVideoFor: %@   callID: %d", buf, 0x12u);
      }

      uint64_t v30 = objc_msgSend__existingConferenceForAVChat_(self, v27, (uint64_t)v9, v28, v29);
      char v43 = 0;
      uint64_t v35 = objc_msgSend__bustedCallID(v9, v31, v32, v33, v34);
      id v42 = 0;
      int v37 = objc_msgSend_getIsVideoPaused_callID_error_(v30, v36, (uint64_t)&v43, v35, (uint64_t)&v42);
      id v38 = v42;
      if (v37)
      {
        BOOL v39 = v43 == 0;
      }
      else
      {
        uint64_t v40 = sub_224FB12A0();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v38;
          _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to get video sending state: %@", buf, 0xCu);
        }

        BOOL v39 = 1;
      }

LABEL_19:
      goto LABEL_20;
    }
    BOOL v39 = 0;
  }
LABEL_20:

  return v39;
}

- (void)avChat:(id)a3 setSendingVideo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v11 = v6;
  if (!v6)
  {
    uint64_t v33 = sub_224FB12A0();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_224F93000, v33, OS_LOG_TYPE_DEFAULT, "No avChat", (uint8_t *)&v53, 2u);
    }
    goto LABEL_23;
  }
  if (objc_msgSend_isVideo(v6, v7, v8, v9, v10))
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v12, v13, v14, v15) & 1) == 0) {
      objc_msgSend_initAVInterface(self, v16, v17, v18, v19);
    }
    uint64_t v20 = sub_224FB12A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        uint64_t v25 = @"YES";
      }
      else {
        uint64_t v25 = @"NO";
      }
      int v53 = 138412802;
      uint64_t v54 = v11;
      __int16 v55 = 2112;
      uint64_t v56 = v25;
      __int16 v57 = 1024;
      int v58 = objc_msgSend__bustedCallID(v11, v21, v22, v23, v24);
      _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "Setting %@ to sending video: %@  callID: %d", (uint8_t *)&v53, 0x1Cu);
    }

    if (objc_msgSend_state(v11, v26, v27, v28, v29) >= 5) {
      objc_msgSend__conferenceForAVChat_(self, v30, 0, v31, v32);
    }
    else {
    uint64_t v33 = objc_msgSend__conferenceForAVChat_(self, v30, (uint64_t)v11, v31, v32);
    }
    if (objc_msgSend_state(v11, v34, v35, v36, v37) <= 3)
    {
      if (v4)
      {
        id v42 = objc_msgSend_isSendingVideoExpected(self, v38, v39, v40, v41);

        if (v42) {
          objc_msgSend_setSendingVideoExpected_(self, v38, 0, v40, v41);
        }
      }
      else
      {
        char v43 = sub_224FB12A0();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          int v53 = 67109120;
          LODWORD(v54) = 0;
          _os_log_impl(&dword_224F93000, v43, OS_LOG_TYPE_DEFAULT, "Attempted to pause AVConference's video before being connected, setting sendingVideoExpected to %d", (uint8_t *)&v53, 8u);
        }

        int v47 = objc_msgSend_numberWithBool_(NSNumber, v44, 0, v45, v46);
        objc_msgSend_setSendingVideoExpected_(self, v48, (uint64_t)v47, v49, v50);
      }
    }
    uint64_t v51 = objc_msgSend__bustedCallID(v11, v38, v39, v40, v41);
    objc_msgSend_conference_callID_setPauseVideo_(self, v52, (uint64_t)v33, v51, !v4);
LABEL_23:
  }
}

- (void)conference:(id)a3 callID:(int64_t)a4 setPauseVideo:(BOOL)a5
{
  int v5 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v10 = 0;
  char v6 = objc_msgSend_setPauseVideo_callID_error_(a3, a2, a5, a4, (uint64_t)&v10);
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v5;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not pause video for callID: %d", buf, 8u);
    }
  }
  if (v7)
  {
    uint64_t v9 = sub_224FB12A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Error pausing video: %@", buf, 0xCu);
    }
  }
}

- (unint64_t)capabilities
{
  return 917504;
}

- (BOOL)startPreviewWithError:(id *)a3
{
  char v6 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], a2, (uint64_t)a3, v3, v4);
  int v11 = objc_msgSend_faceTimeSupported(v6, v7, v8, v9, v10);

  if (v11)
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v12, v13, v14, v15) & 1) == 0) {
      objc_msgSend_initAVInterface(self, v16, v17, v18, v19);
    }
    uint64_t v20 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v16, v17, v18, v19);
    objc_msgSend_startPreview(v20, v21, v22, v23, v24);
  }
  return v11;
}

- (BOOL)stopPreview
{
  int v5 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, v2, v3, v4);
  objc_msgSend_stopPreview(v5, v6, v7, v8, v9);

  return 1;
}

- (int)endConferenceForAVChat:(id)a3
{
  return objc_msgSend_avChat_endConferenceForUserID_(self, a2, (uint64_t)a3, 0, v3);
}

- (void)endAVConferenceWithChat:(id)a3 callID:(int64_t)a4
{
  uint64_t v7 = objc_msgSend_GUID(a3, a2, (uint64_t)a3, a4, v4);
  objc_msgSend__existingConferenceForAVChatGUID_(self, v8, (uint64_t)v7, v9, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stopCallID_(v14, v11, a4, v12, v13);
}

- (void)_avChatDealloc:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v10 = objc_msgSend__conferenceQueue(v4, v5, v6, v7, v8);

    if (v10)
    {
      int v11 = sub_224FB12A0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = objc_msgSend_GUID(v9, v12, v13, v14, v15);
        *(_DWORD *)buf = 138412546;
        v76 = v16;
        __int16 v77 = 1024;
        int v78 = objc_msgSend__bustedCallID(v9, v17, v18, v19, v20);
        _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "DEALLOC AVChat with guid: %@  callID: %d", buf, 0x12u);
      }
      uint64_t v21 = sub_224FB12A0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v76 = v9;
        _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "chat: %@", buf, 0xCu);
      }

      uint64_t v26 = objc_msgSend_GUID(v9, v22, v23, v24, v25);
      uint64_t v30 = objc_msgSend__existingConferenceForAVChatGUID_(self, v27, (uint64_t)v26, v28, v29);

      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      v64 = v9;
      uint64_t v35 = objc_msgSend_remoteParticipants(v9, v31, v32, v33, v34);
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v69, (uint64_t)v74, 16);
      if (v37)
      {
        uint64_t v42 = v37;
        uint64_t v43 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v70 != v43) {
              objc_enumerationMutation(v35);
            }
            uint64_t v45 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            uint64_t v46 = objc_msgSend__participantsCallInfo(v45, v38, v39, v40, v41);
            uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v65, (uint64_t)v73, 16);
            if (v48)
            {
              uint64_t v52 = v48;
              uint64_t v53 = *(void *)v66;
              do
              {
                for (uint64_t j = 0; j != v52; ++j)
                {
                  if (*(void *)v66 != v53) {
                    objc_enumerationMutation(v46);
                  }
                  __int16 v55 = *(void **)(*((void *)&v65 + 1) + 8 * j);
                  objc_msgSend_setState_(v55, v49, 4, v50, v51);
                  unsigned int v60 = objc_msgSend_callID(v55, v56, v57, v58, v59);
                  objc_msgSend_stopCallID_(v30, v61, v60, v62, v63);
                }
                uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v65, (uint64_t)v73, 16);
              }
              while (v52);
            }
          }
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v69, (uint64_t)v74, 16);
        }
        while (v42);
      }

      uint64_t v9 = v64;
    }
  }
}

- (int)avChat:(id)a3 endConferenceForUserID:(id)a4
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v11 = a4;
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMAVController, v7, v8, v9, v10);
  if (!objc_msgSend__shouldRunConferences(v12, v13, v14, v15, v16))
  {
    uint64_t v21 = objc_msgSend_sharedInstance(IMAVController, v17, v18, v19, v20);
    int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v21, v22, v23, v24, v25);

    if (shouldRunACConferences) {
      goto LABEL_5;
    }
LABEL_25:
    int v82 = 0;
    goto LABEL_28;
  }

LABEL_5:
  uint64_t v27 = sub_224FB12A0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v97 = v6;
    __int16 v98 = 2112;
    id v99 = v11;
    _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "chat: %@  userID: %@", buf, 0x16u);
  }

  uint64_t v31 = objc_msgSend__existingConferenceForAVChat_(self, v28, (uint64_t)v6, v29, v30);
  if (v31)
  {
    id v84 = v11;
    uint64_t v32 = sub_224FB12A0();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = objc_msgSend_otherIMHandle(v6, v33, v34, v35, v36);
      uint64_t v42 = objc_msgSend_ID(v37, v38, v39, v40, v41);
      int v47 = objc_msgSend__bustedCallID(v6, v43, v44, v45, v46);
      *(_DWORD *)buf = 138412802;
      id v97 = v42;
      __int16 v98 = 2112;
      id v99 = v31;
      __int16 v100 = 1024;
      int v101 = v47;
      _os_log_impl(&dword_224F93000, v32, OS_LOG_TYPE_DEFAULT, "Stopping AVConference with: %@ (%@)  callID: %d", buf, 0x1Cu);
    }
    objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(self, v48, (uint64_t)v6, 0, 1);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v85 = v6;
    uint64_t v53 = objc_msgSend_remoteParticipants(v6, v49, v50, v51, v52);
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v90, (uint64_t)v95, 16);
    if (v55)
    {
      uint64_t v60 = v55;
      uint64_t v61 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v91 != v61) {
            objc_enumerationMutation(v53);
          }
          uint64_t v63 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          v64 = objc_msgSend__participantsCallInfo(v63, v56, v57, v58, v59, v84);
          uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v86, (uint64_t)v94, 16);
          if (v66)
          {
            uint64_t v70 = v66;
            uint64_t v71 = *(void *)v87;
            do
            {
              for (uint64_t j = 0; j != v70; ++j)
              {
                if (*(void *)v87 != v71) {
                  objc_enumerationMutation(v64);
                }
                long long v73 = *(void **)(*((void *)&v86 + 1) + 8 * j);
                objc_msgSend_setState_(v73, v67, 4, v68, v69);
                unsigned int v78 = objc_msgSend_callID(v73, v74, v75, v76, v77);
                objc_msgSend_stopCallID_(v31, v79, v78, v80, v81);
              }
              uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v86, (uint64_t)v94, 16);
            }
            while (v70);
          }
        }
        uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v90, (uint64_t)v95, 16);
      }
      while (v60);
    }

    int v82 = 1;
    id v11 = v84;
    id v6 = v85;
  }
  else
  {
    int v82 = 0;
  }

LABEL_28:
  return v82;
}

- (void)cancelConferenceForAVChat:(id)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v91 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "chat: %@", buf, 0xCu);
  }

  if (v4)
  {
    uint64_t v10 = objc_msgSend_sharedInstance(IMAVController, v6, v7, v8, v9);
    if (objc_msgSend__shouldRunConferences(v10, v11, v12, v13, v14))
    {

LABEL_7:
      uint64_t v28 = objc_msgSend__existingConferenceForAVChat_(self, v19, (uint64_t)v4, v20, v21);
      uint64_t v29 = sub_224FB12A0();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v30)
        {
          uint64_t v35 = objc_msgSend_otherIMHandle(v4, v31, v32, v33, v34);
          uint64_t v40 = objc_msgSend_ID(v35, v36, v37, v38, v39);
          int v45 = objc_msgSend__bustedCallID(v4, v41, v42, v43, v44);
          *(_DWORD *)buf = 138412802;
          id v91 = v40;
          __int16 v92 = 2112;
          long long v93 = v28;
          __int16 v94 = 1024;
          int v95 = v45;
          _os_log_impl(&dword_224F93000, v29, OS_LOG_TYPE_DEFAULT, "Canceling AVConference with: %@ (%@)  callID: %d", buf, 0x1Cu);
        }
        objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(self, v46, (uint64_t)v4, 0, 1);
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        uint64_t v29 = objc_msgSend_remoteParticipants(v4, v47, v48, v49, v50);
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v51, (uint64_t)&v84, (uint64_t)v89, 16);
        if (v52)
        {
          uint64_t v57 = v52;
          id v79 = v4;
          uint64_t v58 = *(void *)v85;
          do
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v85 != v58) {
                objc_enumerationMutation(v29);
              }
              uint64_t v60 = *(void **)(*((void *)&v84 + 1) + 8 * i);
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              uint64_t v61 = objc_msgSend__participantsCallInfo(v60, v53, v54, v55, v56);
              uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v80, (uint64_t)v88, 16);
              if (v63)
              {
                uint64_t v67 = v63;
                uint64_t v68 = *(void *)v81;
                do
                {
                  for (uint64_t j = 0; j != v67; ++j)
                  {
                    if (*(void *)v81 != v68) {
                      objc_enumerationMutation(v61);
                    }
                    uint64_t v70 = *(void **)(*((void *)&v80 + 1) + 8 * j);
                    objc_msgSend_setState_(v70, v64, 4, v65, v66);
                    unsigned int v75 = objc_msgSend_callID(v70, v71, v72, v73, v74);
                    objc_msgSend_cancelCallID_(v28, v76, v75, v77, v78);
                  }
                  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v64, (uint64_t)&v80, (uint64_t)v88, 16);
                }
                while (v67);
              }
            }
            uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v53, (uint64_t)&v84, (uint64_t)v89, 16);
          }
          while (v57);
          id v4 = v79;
        }
      }
      else if (v30)
      {
        *(_DWORD *)buf = 138412290;
        id v91 = v4;
        _os_log_impl(&dword_224F93000, v29, OS_LOG_TYPE_DEFAULT, "Not conference found to cancel for chat: %@", buf, 0xCu);
      }

      goto LABEL_30;
    }
    uint64_t v22 = objc_msgSend_sharedInstance(IMAVController, v15, v16, v17, v18);
    int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v22, v23, v24, v25, v26);

    if (shouldRunACConferences) {
      goto LABEL_7;
    }
  }
  uint64_t v28 = sub_224FB12A0();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "Not canceling conference for chat because chat is nil or this process doesn't run conferences", buf, 2u);
  }
LABEL_30:
}

- (void)_notifyAboutPotentialCallForChat:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMAVConferenceInterface;
  [(IMAVInterface *)&v14 _notifyAboutPotentialCallForChat:v4];
  if (v4)
  {
    uint64_t v8 = objc_msgSend__conferenceForAVChat_(self, v5, (uint64_t)v4, v6, v7);
    uint64_t v9 = sub_224FB12A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v8;
      _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Warming up conference %@", buf, 0xCu);
    }

    objc_msgSend_warmupForCall(v8, v10, v11, v12, v13);
  }
}

- (id)getNatIPFromICEData:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v3;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "Data: %@", (uint8_t *)&v22, 0xCu);
  }

  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v5, v6, v7, v8);
  int v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  uint64_t v18 = 0;
  if (v3 && v14)
  {
    uint64_t v18 = objc_msgSend_externalAddressForSelfConnectionBlob_((void *)qword_26AB79500, v15, (uint64_t)v3, v16, v17);
    uint64_t v19 = sub_224FB12A0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v18;
      _os_log_impl(&dword_224F93000, v19, OS_LOG_TYPE_DEFAULT, "returned result: %@", (uint8_t *)&v22, 0xCu);
    }

    if (!v18)
    {
      uint64_t v20 = sub_224FB12A0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] No nat-ip returned for data blob", (uint8_t *)&v22, 2u);
      }
    }
  }

  return v18;
}

- (id)natTypeForAVChat:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    uint64_t v12 = objc_msgSend__existingConferenceForAVChat_(self, v4, (uint64_t)v7, v5, v6);
    if (v12)
    {
      uint64_t v13 = objc_msgSend__timings(v7, v8, v9, v10, v11);
      objc_msgSend_startTimingForKey_(v13, v14, @"connection-data-nat-type-time", v15, v16);

      uint64_t v21 = objc_msgSend_natType(v12, v17, v18, v19, v20);
      uint64_t v26 = objc_msgSend__timings(v7, v22, v23, v24, v25);
      objc_msgSend_stopTimingForKey_(v26, v27, @"connection-data-nat-type-time", v28, v29);

      BOOL v30 = sub_224FB12A0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 67109120;
        int v42 = v21;
        _os_log_impl(&dword_224F93000, v30, OS_LOG_TYPE_DEFAULT, "natType: %u", (uint8_t *)&v41, 8u);
      }

      if (CFPreferencesGetAppBooleanValue(@"UseCustomNatType", @"com.apple.conference", 0))
      {
        uint64_t v21 = IMGetDomainIntForKey();
        uint64_t v34 = sub_224FB12A0();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = 67109120;
          int v42 = v21;
          _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, "overriding natType: %u", (uint8_t *)&v41, 8u);
        }
      }
      uint64_t v35 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v31, v21, v32, v33);
    }
    else
    {
      uint64_t v35 = 0;
    }
  }
  else
  {
    uint64_t v36 = sub_224FB12A0();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl(&dword_224F93000, v36, OS_LOG_TYPE_DEFAULT, "No avChat", (uint8_t *)&v41, 2u);
    }

    uint64_t v35 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v37, 0, v38, v39);
  }

  return v35;
}

- (void)avChat:(id)a3 prepareConnectionWithCallInfo:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v56 = v6;
    __int16 v57 = 2112;
    id v58 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "avChat: %@  callInfo: %@", buf, 0x16u);
  }

  if (v6)
  {
    uint64_t v13 = objc_msgSend_sharedInstance(IMAVController, v9, v10, v11, v12);
    if (objc_msgSend__shouldRunConferences(v13, v14, v15, v16, v17))
    {

LABEL_9:
      uint64_t v26 = objc_msgSend_otherIMHandle(v6, v22, v23, v24, v25);
      uint64_t v37 = objc_msgSend_participantMatchingIMHandle_(v6, v34, (uint64_t)v26, v35, v36);
      int v41 = objc_msgSend__conferenceForAVChat_(self, v38, (uint64_t)v6, v39, v40);
      uint64_t v46 = objc_msgSend__conferenceQueue(v6, v42, v43, v44, v45);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_224FBE4C8;
      block[3] = &unk_264710FB8;
      id v50 = v6;
      uint64_t v51 = self;
      id v52 = v7;
      id v53 = v41;
      id v54 = v37;
      id v47 = v37;
      id v48 = v41;
      dispatch_async(v46, block);

      goto LABEL_13;
    }
    uint64_t v28 = objc_msgSend_sharedInstance(IMAVController, v18, v19, v20, v21);
    char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if (shouldRunACConferences) {
      goto LABEL_9;
    }
    uint64_t v26 = sub_224FB12A0();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = "Returning because we are not the VC host";
LABEL_12:
    _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_13;
  }
  uint64_t v26 = sub_224FB12A0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v27 = "No avChat";
    goto LABEL_12;
  }
LABEL_13:
}

- (BOOL)avChat:(id)a3 generateCallInfoForID:(id)a4 service:(id)a5 usingRelay:(BOOL)a6 callInfo:(id)a7
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v18 = a7;
  if (v11 && objc_msgSend_state(v11, v14, v15, v16, v17) != 5)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v74 = sub_224FBF910;
    unsigned int v75 = sub_224FBF920;
    id v76 = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = sub_224FBF910;
    v71[4] = sub_224FBF920;
    id v72 = 0;
    uint64_t v24 = objc_msgSend__conferenceForAVChat_(self, v19, (uint64_t)v11, v20, v21);
    uint64_t v29 = objc_msgSend__timings(v11, v25, v26, v27, v28);
    objc_msgSend_stopTimingForKey_(v29, v30, @"time-to-query-for-connection-data-gathering", v31, v32);

    uint64_t v37 = objc_msgSend__timings(v11, v33, v34, v35, v36);
    objc_msgSend_startTimingForKey_(v37, v38, @"full-connection-data-gather", v39, v40);

    uint64_t v45 = objc_msgSend__conferenceQueue(v11, v41, v42, v43, v44);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_224FBF928;
    block[3] = &unk_264711008;
    id v46 = v11;
    id v64 = v46;
    uint64_t v65 = self;
    id v47 = v24;
    id v66 = v47;
    id v48 = v18;
    id v67 = v48;
    id v68 = v12;
    uint64_t v69 = buf;
    uint64_t v70 = v71;
    dispatch_sync(v45, block);

    id v53 = objc_msgSend__timings(v46, v49, v50, v51, v52);
    objc_msgSend_stopTimingForKey_(v53, v54, @"full-connection-data-gather", v55, v56);

    uint64_t v61 = objc_msgSend_localICEData(v48, v57, v58, v59, v60);
    BOOL v23 = v61 != 0;

    _Block_object_dispose(v71, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v22 = sub_224FB12A0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "Tried to get connection data for: %@  in a dead call: %@   => returning nil", buf, 0x16u);
    }

    BOOL v23 = 0;
  }

  return v23;
}

- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v6) {
      id v11 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v11;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Informed that conference did start: %@", buf, 0xCu);
  }

  uint64_t v16 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v12, v13, v14, v15);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_224FC05E8;
  v22[3] = &unk_264711030;
  BOOL v26 = v6;
  id v23 = v8;
  id v24 = v9;
  uint64_t v25 = self;
  id v17 = v9;
  id v18 = v8;
  objc_msgSend___im_performBlock_(v16, v19, (uint64_t)v22, v20, v21);
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5 callMetadata:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_224FB12A0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v32 = a4;
    _os_log_impl(&dword_224F93000, v13, OS_LOG_TYPE_DEFAULT, "Informed that conference did stop with callID: %ld", buf, 0xCu);
  }

  id v18 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v14, v15, v16, v17);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_224FC0D68;
  v25[3] = &unk_264711058;
  uint64_t v29 = self;
  int64_t v30 = a4;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  objc_msgSend___im_performBlock_(v18, v22, (uint64_t)v25, v23, v24);
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5
{
}

- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v8, v9, v10, v11);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_224FC1060;
  v18[3] = &unk_264710F68;
  v18[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v13 = v7;
  id v14 = v6;
  objc_msgSend___im_performBlock_(v12, v15, (uint64_t)v18, v16, v17);
}

- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v8, v9, v10, v11);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_224FC11B0;
  v18[3] = &unk_264710F68;
  v18[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v13 = v7;
  id v14 = v6;
  objc_msgSend___im_performBlock_(v12, v15, (uint64_t)v18, v16, v17);
}

- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = a4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Informed about first remote frame for call ID: %d", buf, 8u);
  }

  id v12 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v8, v9, v10, v11);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_224FC1360;
  v17[3] = &unk_264711080;
  id v19 = self;
  int64_t v20 = a4;
  id v18 = v6;
  id v13 = v6;
  objc_msgSend___im_performBlock_(v12, v14, (uint64_t)v17, v15, v16);
}

+ (void)_postParticipantMediaChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 contentRectChanged:(BOOL)a7 cameraWillSwitch:(BOOL)a8 camera:(unsigned int)a9 orentation:(unsigned int)a10 aspect:(CGSize)a11 contentRect:(CGRect)a12
{
  CGFloat height = a12.size.height;
  CGFloat width = a12.size.width;
  CGFloat y = a12.origin.y;
  CGFloat x = a12.origin.x;
  CGFloat v16 = a11.height;
  CGFloat v17 = a11.width;
  id v23 = a3;
  id v28 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v24, v25, v26, v27);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_224FC16F8;
  v33[3] = &unk_2647110A8;
  BOOL v43 = a4;
  BOOL v44 = a5;
  BOOL v45 = a6;
  BOOL v46 = a8;
  BOOL v47 = a7;
  CGFloat v35 = x;
  CGFloat v36 = y;
  CGFloat v37 = width;
  CGFloat v38 = height;
  unsigned int v41 = a9;
  unsigned int v42 = a10;
  CGFloat v39 = v17;
  CGFloat v40 = v16;
  id v34 = v23;
  id v29 = v23;
  objc_msgSend___im_performBlock_(v28, v30, (uint64_t)v33, v31, v32);
}

+ (void)_postParticipantScreenAttributesChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 cameraWillSwitch:(BOOL)a7 camera:(unsigned int)a8 orentation:(unsigned int)a9 aspect:(CGSize)a10
{
  CGFloat height = a10.height;
  CGFloat width = a10.width;
  id v16 = a3;
  id v21 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v17, v18, v19, v20);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_224FC19E0;
  v26[3] = &unk_2647110D0;
  BOOL v31 = a4;
  BOOL v32 = a5;
  BOOL v33 = a6;
  BOOL v34 = a7;
  unsigned int v30 = a9;
  CGFloat v28 = width;
  CGFloat v29 = height;
  id v27 = v16;
  id v22 = v16;
  objc_msgSend___im_performBlock_(v21, v23, (uint64_t)v26, v24, v25);
}

- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v14 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v10, v11, v12, v13);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_224FC1BE8;
  v20[3] = &unk_2647110F8;
  id v21 = v8;
  id v22 = v9;
  id v23 = self;
  int64_t v24 = a5;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);
}

- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v14 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v10, v11, v12, v13);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_224FC219C;
  v20[3] = &unk_2647110F8;
  id v21 = v8;
  id v22 = self;
  id v23 = v9;
  int64_t v24 = a5;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);
}

- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v14 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v10, v11, v12, v13);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_224FC278C;
  v20[3] = &unk_2647110F8;
  id v21 = v8;
  id v22 = v9;
  id v23 = self;
  int64_t v24 = a4;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);
}

- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v14 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v10, v11, v12, v13);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_224FC328C;
  v20[3] = &unk_2647110F8;
  id v21 = v8;
  id v22 = v9;
  id v23 = self;
  int64_t v24 = a4;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);
}

- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v14 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v10, v11, v12, v13);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_224FC35A4;
  v20[3] = &unk_2647110F8;
  id v21 = v8;
  id v22 = v9;
  id v23 = self;
  int64_t v24 = a4;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5
{
  id v8 = a3;
  uint64_t v13 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v9, v10, v11, v12);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_224FC38A4;
  v18[3] = &unk_264711120;
  uint64_t v20 = self;
  int64_t v21 = a4;
  BOOL v22 = a5;
  id v19 = v8;
  id v14 = v8;
  objc_msgSend___im_performBlock_(v13, v15, (uint64_t)v18, v16, v17);
}

- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  id v10 = a3;
  id v15 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v11, v12, v13, v14);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_224FC3A7C;
  v20[3] = &unk_264711148;
  BOOL v22 = self;
  int64_t v23 = a4;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v21 = v10;
  id v16 = v10;
  objc_msgSend___im_performBlock_(v15, v17, (uint64_t)v20, v18, v19);
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5
{
  id v8 = a3;
  uint64_t v13 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v9, v10, v11, v12);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_224FC3D18;
  v18[3] = &unk_264711120;
  uint64_t v20 = self;
  int64_t v21 = a4;
  BOOL v22 = a5;
  id v19 = v8;
  id v14 = v8;
  objc_msgSend___im_performBlock_(v13, v15, (uint64_t)v18, v16, v17);
}

- (void)conference:(id)a3 reinitializeCallForCallID:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v21 = a4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Told to reinitialize call for callID %d", buf, 8u);
  }

  uint64_t v12 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v8, v9, v10, v11);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_224FC4010;
  v17[3] = &unk_264711170;
  void v17[4] = self;
  id v18 = v6;
  unsigned int v19 = a4;
  id v13 = v6;
  objc_msgSend___im_performBlock_(v12, v14, (uint64_t)v17, v15, v16);
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseAudio:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = sub_224FB12A0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v27 = v10;
    __int16 v28 = 1024;
    BOOL v29 = v7;
    __int16 v30 = 1024;
    int v31 = a4;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "vc: %@  didPauseAudio: %d callID: %d error: %@", buf, 0x22u);
  }

  uint64_t v17 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v13, v14, v15, v16);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_224FC42A4;
  v22[3] = &unk_264711120;
  void v22[4] = self;
  id v23 = v10;
  int64_t v24 = a4;
  BOOL v25 = v7;
  id v18 = v10;
  objc_msgSend___im_performBlock_(v17, v19, (uint64_t)v22, v20, v21);
}

- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v8;
    __int16 v28 = 1024;
    BOOL v29 = v6;
    __int16 v30 = 1024;
    int v31 = a5;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "vc: %@  remoteAudioPaused: %d callID: %d", buf, 0x18u);
  }

  id v10 = sub_224FB12A0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = a5;
      uint64_t v12 = "Informed about remote audio muted for call ID: %d";
LABEL_8:
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a5;
    uint64_t v12 = "Informed about remote audio unmuted for call ID: %d";
    goto LABEL_8;
  }

  uint64_t v17 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v13, v14, v15, v16);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_224FC44E4;
  v22[3] = &unk_264711120;
  void v22[4] = self;
  id v23 = v8;
  int64_t v24 = a5;
  BOOL v25 = v6;
  id v18 = v8;
  objc_msgSend___im_performBlock_(v17, v19, (uint64_t)v22, v20, v21);
}

- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v8;
    __int16 v28 = 1024;
    BOOL v29 = v6;
    __int16 v30 = 1024;
    int v31 = a5;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "vc: %@  videoPaused: %d callID: %d", buf, 0x18u);
  }

  id v10 = sub_224FB12A0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = a5;
      uint64_t v12 = "Informed about remote video paused for call ID: %d";
LABEL_8:
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a5;
    uint64_t v12 = "Informed about remote video unpaused for call ID: %d";
    goto LABEL_8;
  }

  uint64_t v17 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v13, v14, v15, v16);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_224FC47BC;
  v22[3] = &unk_264711120;
  void v22[4] = self;
  id v23 = v8;
  int64_t v24 = a5;
  BOOL v25 = v6;
  id v18 = v8;
  objc_msgSend___im_performBlock_(v17, v19, (uint64_t)v22, v20, v21);
}

- (void)conference:(id)a3 localIPChange:(id)a4 withCallID:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 1024;
    int v31 = a5;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "vc: %@  newBlob: %@ callID: %d", buf, 0x1Cu);
  }

  BOOL v11 = sub_224FB12A0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a5;
    _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "Informed about local IP changing for call ID: %d", buf, 8u);
  }

  uint64_t v16 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v12, v13, v14, v15);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_224FC4A94;
  v22[3] = &unk_2647110F8;
  void v22[4] = self;
  id v23 = v8;
  id v24 = v9;
  int64_t v25 = a5;
  id v17 = v9;
  id v18 = v8;
  objc_msgSend___im_performBlock_(v16, v19, (uint64_t)v22, v20, v21);
}

- (void)conference:(id)a3 didChangeLocalVariablesForCallID:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 1024;
    int v23 = a4;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d", buf, 0x12u);
  }

  uint64_t v12 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v8, v9, v10, v11);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_224FC4C84;
  v17[3] = &unk_264711080;
  void v17[4] = self;
  id v18 = v6;
  int64_t v19 = a4;
  id v13 = v6;
  objc_msgSend___im_performBlock_(v12, v14, (uint64_t)v17, v15, v16);
}

- (void)serverDiedForConference:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v5, v6, v7, v8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_224FC4DB4;
  v14[3] = &unk_264710AF8;
  id v15 = v4;
  uint64_t v16 = self;
  id v10 = v4;
  objc_msgSend___im_performBlock_(v9, v11, (uint64_t)v14, v12, v13);
}

- (BOOL)supportsLayers
{
  return 1;
}

- (void)localVideoLayer
{
  if ((objc_msgSend_isAVInterfaceReady(self, a2, v2, v3, v4) & 1) == 0) {
    objc_msgSend_initAVInterface(self, v6, v7, v8, v9);
  }
  id v10 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v6, v7, v8, v9);
  id v15 = objc_msgSend_localVideoLayer(v10, v11, v12, v13, v14);

  return v15;
}

- (void)setLocalVideoLayer:(void *)a3
{
  if ((objc_msgSend_isAVInterfaceReady(self, a2, (uint64_t)a3, v3, v4) & 1) == 0) {
    objc_msgSend_initAVInterface(self, v7, v8, v9, v10);
  }
  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v7, v8, v9, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoLayer_(v14, v11, (uint64_t)a3, v12, v13);
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3 forChat:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (objc_msgSend_isVideo(v7, v8, v9, v10, v11))
  {
    if (v7)
    {
      if ((objc_msgSend_isAVInterfaceReady(self, v12, v13, v14, v15) & 1) == 0) {
        objc_msgSend_initAVInterface(self, v16, v17, v18, v19);
      }
      uint64_t v20 = objc_msgSend__existingConferenceForAVChat_(self, v16, (uint64_t)v7, v18, v19);
      if (v20)
      {
        id v21 = sub_224FB12A0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 134218240;
          double v31 = width;
          __int16 v32 = 2048;
          double v33 = height;
          _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "Setting remote video presented size to %f, %f", (uint8_t *)&v30, 0x16u);
        }

        uint64_t v26 = objc_msgSend__bustedCallID(v7, v22, v23, v24, v25);
        objc_msgSend_setConferenceVisualRectangle_forCallID_(v20, v27, v26, v28, v29, 0.0, 0.0, width, height);
      }
    }
    else
    {
      uint64_t v20 = sub_224FB12A0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "No avChat when asked to set presentation size", (uint8_t *)&v30, 2u);
      }
    }
  }
}

- (void)setRemoteVideoPresentationState:(unsigned int)a3 forChat:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (objc_msgSend_isVideo(v6, v7, v8, v9, v10))
  {
    if (v6)
    {
      if ((objc_msgSend_isAVInterfaceReady(self, v11, v12, v13, v14) & 1) == 0) {
        objc_msgSend_initAVInterface(self, v15, v16, v17, v18);
      }
      uint64_t v19 = objc_msgSend__existingConferenceForAVChat_(self, v15, (uint64_t)v6, v17, v18);
      if (v19)
      {
        uint64_t v20 = sub_224FB12A0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v29[0] = 67109120;
          v29[1] = a3;
          _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "Setting remote video presentation state to %d", (uint8_t *)v29, 8u);
        }

        if (a3 == 2) {
          uint64_t v25 = 2;
        }
        else {
          uint64_t v25 = a3 == 1;
        }
        uint64_t v26 = objc_msgSend__bustedCallID(v6, v21, v22, v23, v24);
        objc_msgSend_setConferenceState_forCallID_(v19, v27, v25, v26, v28);
      }
    }
    else
    {
      uint64_t v19 = sub_224FB12A0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        _os_log_impl(&dword_224F93000, v19, OS_LOG_TYPE_DEFAULT, "No avChat when asked to set presentation state", (uint8_t *)v29, 2u);
      }
    }
  }
}

- (void)localVideoBackLayer
{
  if ((objc_msgSend_isAVInterfaceReady(self, a2, v2, v3, v4) & 1) == 0) {
    objc_msgSend_initAVInterface(self, v6, v7, v8, v9);
  }
  uint64_t v10 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_localVideoBackLayer(v10, v11, v12, v13, v14);

  return v15;
}

- (void)setLocalVideoBackLayer:(void *)a3
{
  if ((objc_msgSend_isAVInterfaceReady(self, a2, (uint64_t)a3, v3, v4) & 1) == 0) {
    objc_msgSend_initAVInterface(self, v7, v8, v9, v10);
  }
  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v7, v8, v9, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoBackLayer_(v14, v11, (uint64_t)a3, v12, v13);
}

- (BOOL)supportsRelay
{
  return 1;
}

- (void)handleRelayInitate:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
  {
  }
  else
  {
    uint64_t v28 = objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
    char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if ((shouldRunACConferences & 1) == 0)
    {
      uint64_t v62 = sub_224FB12A0();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v62, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", buf, 2u);
      }
      goto LABEL_15;
    }
  }
  uint64_t v34 = objc_msgSend_avChat(v9, v24, v25, v26, v27);
  CGFloat v39 = objc_msgSend__conferenceQueue(v34, v35, v36, v37, v38);

  if (v39)
  {
    BOOL v44 = objc_msgSend_avChat(v9, v40, v41, v42, v43);
    id v48 = objc_msgSend__existingConferenceForAVChat_(self, v45, (uint64_t)v44, v46, v47);

    id v49 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v53 = objc_msgSend_initWithDictionary_(v49, v50, (uint64_t)v8, v51, v52);
    uint64_t v54 = *MEMORY[0x263F4A2F0];
    uint64_t v62 = objc_msgSend_objectForKey_(v8, v55, *MEMORY[0x263F4A2F0], v56, v57);
    if (!v62)
    {
      uint64_t v63 = objc_msgSend_avChat(v9, v58, v59, v60, v61);
      id v68 = objc_msgSend__relayRemotePrimaryIdentifier(v63, v64, v65, v66, v67);

      if (v68)
      {
        uint64_t v73 = objc_msgSend_avChat(v9, v69, v70, v71, v72);
        uint64_t v78 = objc_msgSend__relayRemotePrimaryIdentifier(v73, v74, v75, v76, v77);
        objc_msgSend_setObject_forKey_(v53, v79, (uint64_t)v78, v54, v80);
      }
    }
    long long v81 = sub_224FB12A0();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      long long v86 = objc_msgSend_vcPartyID(v9, v82, v83, v84, v85);
      *(_DWORD *)buf = 138412290;
      v111 = v86;
      _os_log_impl(&dword_224F93000, v81, OS_LOG_TYPE_DEFAULT, "Processing relay request response from: %@", buf, 0xCu);
    }
    long long v87 = sub_224FB12A0();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v92 = objc_msgSend_avChat(v9, v88, v89, v90, v91);
      *(_DWORD *)buf = 138412802;
      v111 = v92;
      __int16 v112 = 2112;
      id v113 = v9;
      __int16 v114 = 2112;
      id v115 = v8;
      _os_log_impl(&dword_224F93000, v87, OS_LOG_TYPE_DEFAULT, "handleRelayInitate AVChat: %@    participant: %@    properties: %@", buf, 0x20u);
    }
    id v97 = objc_msgSend_avChat(v9, v93, v94, v95, v96);
    uint64_t v102 = objc_msgSend__conferenceQueue(v97, v98, v99, v100, v101);
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = sub_224FC5710;
    v105[3] = &unk_264711198;
    id v106 = v48;
    id v107 = v10;
    id v108 = v53;
    id v109 = v9;
    id v103 = v53;
    id v104 = v48;
    dispatch_async(v102, v105);

LABEL_15:
  }
}

- (void)handleRelayUpdate:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
  {
  }
  else
  {
    uint64_t v28 = objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
    char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if ((shouldRunACConferences & 1) == 0)
    {
      uint64_t v71 = sub_224FB12A0();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v71, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", buf, 2u);
      }
      goto LABEL_12;
    }
  }
  uint64_t v34 = objc_msgSend_avChat(v9, v24, v25, v26, v27);
  CGFloat v39 = objc_msgSend__conferenceQueue(v34, v35, v36, v37, v38);

  if (v39)
  {
    BOOL v44 = objc_msgSend_avChat(v9, v40, v41, v42, v43);
    id v48 = objc_msgSend__existingConferenceForAVChat_(self, v45, (uint64_t)v44, v46, v47);

    id v49 = sub_224FB12A0();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = objc_msgSend_vcPartyID(v9, v50, v51, v52, v53);
      *(_DWORD *)buf = 138412290;
      uint64_t v78 = v54;
      _os_log_impl(&dword_224F93000, v49, OS_LOG_TYPE_DEFAULT, "Processing relay update from: %@", buf, 0xCu);
    }
    uint64_t v55 = sub_224FB12A0();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = objc_msgSend_avChat(v9, v56, v57, v58, v59);
      *(_DWORD *)buf = 138412802;
      uint64_t v78 = v60;
      __int16 v79 = 2112;
      id v80 = v9;
      __int16 v81 = 2112;
      id v82 = v8;
      _os_log_impl(&dword_224F93000, v55, OS_LOG_TYPE_DEFAULT, "handleRelayUpdate AVChat: %@    participant: %@    properties: %@", buf, 0x20u);
    }
    uint64_t v65 = objc_msgSend_avChat(v9, v61, v62, v63, v64);
    uint64_t v70 = objc_msgSend__conferenceQueue(v65, v66, v67, v68, v69);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = sub_224FC5A98;
    v72[3] = &unk_264711198;
    id v73 = v48;
    id v74 = v10;
    id v75 = v8;
    id v76 = v9;
    uint64_t v71 = v48;
    dispatch_async(v70, v72);

LABEL_12:
  }
}

- (void)handleRelayCancel:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
  {
  }
  else
  {
    uint64_t v28 = objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
    char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if ((shouldRunACConferences & 1) == 0)
    {
      uint64_t v71 = sub_224FB12A0();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v71, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", buf, 2u);
      }
      goto LABEL_12;
    }
  }
  uint64_t v34 = objc_msgSend_avChat(v9, v24, v25, v26, v27);
  CGFloat v39 = objc_msgSend__conferenceQueue(v34, v35, v36, v37, v38);

  if (v39)
  {
    BOOL v44 = objc_msgSend_avChat(v9, v40, v41, v42, v43);
    id v48 = objc_msgSend__existingConferenceForAVChat_(self, v45, (uint64_t)v44, v46, v47);

    id v49 = sub_224FB12A0();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = objc_msgSend_vcPartyID(v9, v50, v51, v52, v53);
      *(_DWORD *)buf = 138412290;
      uint64_t v78 = v54;
      _os_log_impl(&dword_224F93000, v49, OS_LOG_TYPE_DEFAULT, "Processing relay cancel from: %@", buf, 0xCu);
    }
    uint64_t v55 = sub_224FB12A0();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = objc_msgSend_avChat(v9, v56, v57, v58, v59);
      *(_DWORD *)buf = 138412802;
      uint64_t v78 = v60;
      __int16 v79 = 2112;
      id v80 = v9;
      __int16 v81 = 2112;
      id v82 = v8;
      _os_log_impl(&dword_224F93000, v55, OS_LOG_TYPE_DEFAULT, "handleRelayCancel AVChat: %@    participant: %@    properties: %@", buf, 0x20u);
    }
    uint64_t v65 = objc_msgSend_avChat(v9, v61, v62, v63, v64);
    uint64_t v70 = objc_msgSend__conferenceQueue(v65, v66, v67, v68, v69);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = sub_224FC5E20;
    v72[3] = &unk_264711198;
    id v73 = v48;
    id v74 = v10;
    id v75 = v8;
    id v76 = v9;
    uint64_t v71 = v48;
    dispatch_async(v70, v72);

LABEL_12:
  }
}

- (void)processRemoteIPChanged:(id)a3 fromParticipant:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Processing remote IP change from: %@", buf, 0xCu);
  }

  id v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_msgSend_avChat(v7, v10, v11, v12, v13);
    *(_DWORD *)buf = 138412802;
    id v60 = v14;
    __int16 v61 = 2112;
    id v62 = v7;
    __int16 v63 = 2112;
    id v64 = v6;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "remoteIPChangedWithBlob AVChat: %@    participant: %@    properties: %@", buf, 0x20u);
  }
  uint64_t v19 = objc_msgSend_avChat(v7, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend__conferenceQueue(v19, v20, v21, v22, v23);

  if (v24)
  {
    uint64_t v29 = objc_msgSend_avChat(v7, v25, v26, v27, v28);
    double v33 = objc_msgSend__existingConferenceForAVChat_(self, v30, (uint64_t)v29, v31, v32);

    uint64_t v37 = objc_msgSend_objectForKey_(v6, v34, @"LocalIPChangeNewBlob", v35, v36);
    uint64_t v42 = objc_msgSend__FTDataFromBase64String(v37, v38, v39, v40, v41);
    uint64_t v47 = objc_msgSend_avChat(v7, v43, v44, v45, v46);
    uint64_t v52 = objc_msgSend__conferenceQueue(v47, v48, v49, v50, v51);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_224FC6118;
    block[3] = &unk_264710F68;
    id v56 = v33;
    id v57 = v42;
    id v58 = v7;
    id v53 = v42;
    id v54 = v33;
    dispatch_async(v52, block);
  }
}

- (AVConference)controller
{
  return (AVConference *)((uint64_t (*)(IMAVConferenceInterface *, char *))MEMORY[0x270F9A6D0])(self, sel__controller);
}

- (id)_controller
{
  id v6 = objc_msgSend__activeChat(IMAVChat, a2, v2, v3, v4);
  id v10 = objc_msgSend__conferenceForAVChat_(self, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (void)chatStateUpdated
{
  id v6 = objc_msgSend__nonFinalChat(IMAVChat, a2, v2, v3, v4);

  uint64_t v11 = objc_msgSend_sharedInstance(IMAVDaemonController, v7, v8, v9, v10);
  uint64_t v15 = v11;
  if (v6) {
    objc_msgSend_addListenerID_(v11, v12, @"com.apple.IMAVConferenceAVAgentListener", v13, v14);
  }
  else {
    objc_msgSend_removeListenerID_(v11, v12, @"com.apple.IMAVConferenceAVAgentListener", v13, v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)IMAVConferenceInterface;
  [(IMAVInterface *)&v16 chatStateUpdated];
}

- (void)chatRelayedStatusChanged:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend__conferenceForAVChat_(self, v5, (uint64_t)v4, v6, v7);
  if (v12)
  {
    uint64_t v13 = objc_msgSend__conferenceQueue(v4, v8, v9, v10, v11);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_224FC6350;
    block[3] = &unk_264710F68;
    void block[4] = self;
    id v15 = v4;
    id v16 = v12;
    dispatch_async(v13, block);
  }
}

- (void)avChat:(id)a3 setLocalLandscapeAspectRatio:(CGSize)a4 localPortraitAspectRatio:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v15 = v10;
  if (!v10)
  {
    uint64_t v31 = sub_224FB12A0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      uint64_t v32 = "No avChat";
      goto LABEL_13;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend_isVideo(v10, v11, v12, v13, v14))
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v16, v17, v18, v19) & 1) == 0) {
      objc_msgSend_initAVInterface(self, v20, v21, v22, v23);
    }
    uint64_t v24 = sub_224FB12A0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v43.double width = v8;
      v43.double height = v7;
      uint64_t v25 = NSStringFromSize(v43);
      v44.double width = width;
      v44.double height = height;
      uint64_t v26 = NSStringFromSize(v44);
      int v36 = 138412802;
      uint64_t v37 = v15;
      __int16 v38 = 2112;
      uint64_t v39 = v25;
      __int16 v40 = 2112;
      uint64_t v41 = v26;
      _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "Chat: %@ Setting setLocalLandscapeAspectRatio: %@   localPortraitAspectRatio: %@", (uint8_t *)&v36, 0x20u);
    }
    if (v8 == 0.0 && v7 == 0.0)
    {
      uint64_t v31 = sub_224FB12A0();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        uint64_t v32 = "       ** someone hasn't configured this localLandscapeAspectRatio, it's CGSizeZero, skipping";
LABEL_13:
        _os_log_impl(&dword_224F93000, v31, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v36, 2u);
        goto LABEL_19;
      }
    }
    else
    {
      if (width != 0.0 || height != 0.0)
      {
        uint64_t v31 = objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v27, v28, v29, v30);
        objc_msgSend_avChat_setLocalPortraitRatio_localLandscapeRatio_(v31, v33, (uint64_t)v15, v34, v35, width, height, v8, v7);
        goto LABEL_19;
      }
      uint64_t v31 = sub_224FB12A0();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        uint64_t v32 = "       ** someone hasn't configured this localPortraitAspectRatio, it's CGSizeZero, skipping";
        goto LABEL_13;
      }
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (BOOL)_submitLoggingInformation:(id)a3 forChat:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    id v28 = v5;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Will submit logging info: %@   for chat: %@", (uint8_t *)&v27, 0x16u);
  }

  id v8 = objc_alloc_init((Class)qword_26AB79500);
  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "   => Found conference: %@", (uint8_t *)&v27, 0xCu);
  }

  char v10 = objc_opt_respondsToSelector();
  uint64_t v11 = sub_224FB12A0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = NSStringFromSelector(sel_setCallReport_withReport_);
      int v27 = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "%@ responds to %@", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v18 = objc_msgSend__bustedCallID(v6, v14, v15, v16, v17);
    uint64_t v11 = objc_msgSend_descriptionInStringsFileFormat(v5, v19, v20, v21, v22);
    objc_msgSend_setCallReport_withReport_(v8, v23, v18, (uint64_t)v11, v24);
  }
  else if (v12)
  {
    uint64_t v25 = NSStringFromSelector(sel_setCallReport_withReport_);
    int v27 = 138412546;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v25;
    _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "%@ DOES NOT respond to %@", (uint8_t *)&v27, 0x16u);
  }
  return 1;
}

- (BOOL)_submitEndCallMetric:(id)a3 forCallID:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v5;
    __int16 v18 = 1024;
    LODWORD(v19) = a4;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "Will submit end call metric: %@   for callID: %d", (uint8_t *)&v16, 0x12u);
  }

  id v7 = objc_alloc_init((Class)qword_26AB79500);
  id v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "   => Found conference: %@", (uint8_t *)&v16, 0xCu);
  }

  char v9 = objc_opt_respondsToSelector();
  char v10 = sub_224FB12A0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      BOOL v12 = NSStringFromSelector(sel_sendProtobuf_withType_forCallID_);
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "%@ responds to %@", (uint8_t *)&v16, 0x16u);
    }
    objc_msgSend_sendProtobuf_withType_forCallID_(v7, v13, (uint64_t)v5, 5312515, a4);
  }
  else
  {
    if (v11)
    {
      uint64_t v14 = NSStringFromSelector(sel_sendProtobuf_withType_forCallID_);
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "%@ DOES NOT respond to %@", (uint8_t *)&v16, 0x16u);
    }
  }

  return 1;
}

- (void)updateAVChat:(id)a3 withCallMetadata:(id)a4 isFinalUpdate:(BOOL)a5
{
  id v8 = a3;
  id v13 = a4;
  if (v8)
  {
    uint64_t v14 = objc_msgSend__conferenceQueue(v8, v9, v10, v11, v12);

    if (v14)
    {
      uint64_t v19 = objc_msgSend__bustedCallID(v8, v15, v16, v17, v18);
      uint64_t v23 = objc_msgSend__existingConferenceForAVChat_(self, v20, (uint64_t)v8, v21, v22);
      id v28 = objc_msgSend__conferenceQueue(v8, v24, v25, v26, v27);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_224FC6C58;
      block[3] = &unk_2647111E8;
      id v31 = v13;
      id v32 = v23;
      uint64_t v34 = v19;
      id v33 = v8;
      BOOL v35 = a5;
      id v29 = v23;
      dispatch_async(v28, block);
    }
  }
}

- (NSNumber)isSendingVideoExpected
{
  return self->_sendingVideoExpected;
}

- (void)setSendingVideoExpected:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingVideoExpected, 0);
  objc_storeStrong((id *)&self->_avConferencesLock, 0);
  objc_storeStrong((id *)&self->_avConferences, 0);
  objc_storeStrong((id *)&self->_avConferencesToCleanup, 0);
}

@end