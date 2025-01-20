@interface IMAVChatParticipant
- (BOOL)_generateCallInfo:(id)a3;
- (BOOL)_inviteDelivered;
- (BOOL)_processResponseDictionary:(id)a3 allowSecondConnection:(BOOL)a4;
- (BOOL)hasConnectingSessions;
- (BOOL)hasReinitiateCapability;
- (BOOL)hasUnfinishedSessions;
- (BOOL)isAudioMuted;
- (BOOL)isInitiator;
- (BOOL)isLocalParticipant;
- (BOOL)isMediaStalled;
- (BOOL)isSendingAudio;
- (BOOL)isSendingVideo;
- (BOOL)isVideoDegraded;
- (BOOL)isVideoPaused;
- (BOOL)matchesAVConferenceCallID:(int64_t)a3;
- (CGRect)_remoteLandscapeContentRect;
- (CGRect)_remotePortraitContentRect;
- (CGRect)contentRectForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4;
- (CGSize)_remoteLandscapeOrientation;
- (CGSize)_remotePIPLandscapeOrientation;
- (CGSize)_remotePIPPortraitOrientation;
- (CGSize)_remotePortraitOrientation;
- (CGSize)aspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4;
- (CGSize)localAspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4;
- (IMAVChat)avChat;
- (IMAVChatParticipant)init;
- (IMHandle)imHandle;
- (IMHandle)invitedBy;
- (NSArray)additionalPeers;
- (NSArray)excludingPushTokens;
- (NSData)inFrequencyLevel;
- (NSData)outFrequencyLevel;
- (NSDictionary)properties;
- (NSMutableArray)_participantsCallInfo;
- (NSString)_conferenceID;
- (NSString)name;
- (NSString)vcPartyID;
- (NSTimer)_connectTimeoutTimer;
- (id)_callInfoForCallID:(int64_t)a3;
- (id)_callInfoForReinitiate;
- (id)_callInfoWithState:(int64_t)a3;
- (id)_callInfosWaitingForAcceptAction;
- (id)_callInfosWaitingForResponse;
- (id)_initAs:(id)a3 invitedBy:(id)a4 sendingAudio:(BOOL)a5 sendingVideo:(BOOL)a6 usingICE:(BOOL)a7 toChat:(id)a8 inState:(unsigned int)a9 withError:(int)a10 andReason:(unsigned int)a11 andVCPartyID:(id)a12 account:(id)a13;
- (id)_natType;
- (id)_processIncomingCallProperties:(id)a3;
- (id)_proxyRepresentation;
- (id)callInfoBeingHandedOff;
- (id)description;
- (id)initAs:(id)a3 invitedBy:(id)a4 toChat:(id)a5 account:(id)a6;
- (int)error;
- (int64_t)bestCallID;
- (unsigned)_screenOrientation;
- (unsigned)cameraOrientation;
- (unsigned)cameraType;
- (unsigned)reasonChatEnded;
- (unsigned)state;
- (void)_cancelInvitationWithReason:(unsigned int)a3 response:(id)a4;
- (void)_cleanupOrphanedCallInfos;
- (void)_connectTimeout:(id)a3;
- (void)_handleIMAVResponse:(unsigned int)a3;
- (void)_hangupCallLaterIfReinitiateFailsForCallInfo:(id)a3;
- (void)_noteInviteDelivered:(BOOL)a3;
- (void)_processPropertyUpdate:(id)a3;
- (void)_reInitiateWithCallInfo:(id)a3;
- (void)_registerCallInfo:(id)a3;
- (void)_sendResponse:(unsigned int)a3 callInfo:(id)a4;
- (void)_setCameraOrientation:(unsigned int)a3;
- (void)_setCameraType:(unsigned int)a3;
- (void)_setChatError:(int)a3;
- (void)_setConferenceID:(id)a3;
- (void)_setConnectTimeoutTimer:(id)a3;
- (void)_setInviteDelivered:(BOOL)a3;
- (void)_setRemoteLandscapeContentRect:(CGRect)a3;
- (void)_setRemoteLandscapeOrientation:(CGSize)a3;
- (void)_setRemotePIPLandscapeOrientation:(CGSize)a3;
- (void)_setRemotePIPPortraitOrientation:(CGSize)a3;
- (void)_setRemotePortraitContentRect:(CGRect)a3;
- (void)_setRemotePortraitOrientation:(CGSize)a3;
- (void)_setScreenOrientation:(unsigned int)a3;
- (void)_setState:(unsigned int)a3 withReason:(unsigned int)a4 andError:(int)a5;
- (void)_switchToUseNewIMHandle:(id)a3;
- (void)_updateProperties:(id)a3;
- (void)cancelInvitation;
- (void)cancelInvitationWithReason:(unsigned int)a3;
- (void)cancelInvitationWithResponse:(unsigned int)a3;
- (void)dealloc;
- (void)disconnectFromAVChat;
- (void)reinitializeCallForCallID:(unsigned int)a3;
- (void)requestIconIfNecessary;
- (void)resetWaitingToConnectTimer;
- (void)sendAVMessage:(unsigned int)a3 userInfo:(id)a4;
- (void)sendInvitation;
- (void)sendResponse:(unsigned int)a3;
- (void)setAVChat:(id)a3;
- (void)setAdditionalPeers:(id)a3;
- (void)setAudioMuted:(BOOL)a3;
- (void)setExcludingPushTokens:(id)a3;
- (void)setHasReinitiateCapability:(BOOL)a3;
- (void)setInFrequencyLevel:(id)a3;
- (void)setMediaStalled:(BOOL)a3;
- (void)setOutFrequencyLevel:(id)a3;
- (void)setProperties:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setStateToEndedWithReason:(unsigned int)a3 andError:(int)a4;
- (void)setVCPartyID:(id)a3;
- (void)setVideoBackLayer:(void *)a3;
- (void)setVideoDegraded:(BOOL)a3;
- (void)setVideoLayer:(void *)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setWaitingToConnect:(BOOL)a3;
- (void)set_participantsCallInfo:(id)a3;
- (void)videoBackLayer;
- (void)videoLayer;
@end

@implementation IMAVChatParticipant

- (IMAVChatParticipant)init
{
  v7 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, v2, v3, v4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, (uint64_t)self, @"IMAVChatParticipant.m", 51, @"-[IMAVChatParticipant init] should never be called!");

  return 0;
}

- (id)_initAs:(id)a3 invitedBy:(id)a4 sendingAudio:(BOOL)a5 sendingVideo:(BOOL)a6 usingICE:(BOOL)a7 toChat:(id)a8 inState:(unsigned int)a9 withError:(int)a10 andReason:(unsigned int)a11 andVCPartyID:(id)a12 account:(id)a13
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a8;
  id v23 = a12;
  v69.receiver = self;
  v69.super_class = (Class)IMAVChatParticipant;
  v28 = [(IMAVChatParticipant *)&v69 init];
  if (v28)
  {
    BOOL v68 = a6;
    if (!v20 || !v21 || !v22)
    {
      v66 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v24, v25, v26, v27);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v67, (uint64_t)a2, (uint64_t)v28, @"IMAVChatParticipant.m", 68, @"Invalid parameter not satisfying: %@", @"(imHandle != nil) && (inviter != nil) && (chat != nil)");
    }
    if (!v28->_participantsCallInfo)
    {
      v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      participantsCallInfo = v28->_participantsCallInfo;
      v28->_participantsCallInfo = v29;
    }
    objc_storeStrong((id *)&v28->_imHandle, a3);
    objc_storeStrong((id *)&v28->_inviter, a4);
    objc_msgSend_setAVChat_(v28, v31, (uint64_t)v22, v32, v33);
    v38 = objc_msgSend_conferenceID(v22, v34, v35, v36, v37);
    uint64_t v43 = objc_msgSend_copy(v38, v39, v40, v41, v42);
    conferenceID = v28->_conferenceID;
    v28->_conferenceID = (NSString *)v43;

    objc_msgSend__setScreenOrientation_(v28, v45, 0, v46, v47);
    __asm { FMOV            V0.2D, #-1.0 }
    v28->_remotePortraitOrientation = _Q0;
    v28->_remoteLandscapeOrientation = _Q0;
    v28->_sendingAudio = a5;
    v28->_sendingVideo = v68;
    objc_msgSend__setCameraType_(v28, v53, 0, v54, v55);
    objc_msgSend__setCameraOrientation_(v28, v56, 0, v57, v58);
    v28->_isInitiator = v20 == v21;
    objc_msgSend_setVCPartyID_(v28, v59, (uint64_t)v23, v60, v61);
    v28->_state = a9;
    v28->_chatEndedReason = a11;
    inFrequencyLevel = v28->_inFrequencyLevel;
    v28->_inFrequencyLevel = 0;

    outFrequencyLevel = v28->_outFrequencyLevel;
    v28->_outFrequencyLevel = 0;

    v64 = v28;
  }

  return v28;
}

- (void)_registerCallInfo:(id)a3
{
  uint64_t v4 = (const char *)a3;
  participantsCallInfo = self->_participantsCallInfo;
  v13 = (char *)v4;
  if (!participantsCallInfo)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v9 = self->_participantsCallInfo;
    self->_participantsCallInfo = v8;

    uint64_t v4 = v13;
    participantsCallInfo = self->_participantsCallInfo;
  }
  if ((objc_msgSend_containsObjectIdenticalTo_(participantsCallInfo, v4, (uint64_t)v4, v5, v6) & 1) == 0) {
    objc_msgSend_addObject_(self->_participantsCallInfo, v10, (uint64_t)v13, v11, v12);
  }
}

- (id)callInfoBeingHandedOff
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x22A628890](self, a2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = self->_participantsCallInfo;
  id v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend_isBeingHandedOff(v13, v6, v7, v8, v9, (void)v15))
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v15, (uint64_t)v19, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)matchesAVConferenceCallID:(int64_t)a3
{
  uint64_t v5 = (void *)MEMORY[0x22A628890](self, a2);
  if (objc_msgSend_count(self->_participantsCallInfo, v6, v7, v8, v9))
  {
    v13 = objc_msgSend__callInfoForCallID_(self, v10, a3, v11, v12);
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  return v14;
}

- (BOOL)hasUnfinishedSessions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = self->_participantsCallInfo;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v2);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend_state(v11, v4, v5, v6, v7, (void)v13) != 4 && objc_msgSend_state(v11, v4, v5, v6, v7))
        {
          LOBYTE(v8) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

- (BOOL)hasConnectingSessions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = self->_participantsCallInfo;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend_state(*(void **)(*((void *)&v12 + 1) + 8 * i), v4, v5, v6, v7, (void)v12) < 3)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v12, (uint64_t)v16, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)hasReinitiateCapability
{
  return self->_hasReinitiateCapability;
}

- (int64_t)bestCallID
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v2 = self->_participantsCallInfo;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v38, (uint64_t)v42, 16);
  if (!v4)
  {
    unsigned int v32 = 0;
    goto LABEL_22;
  }
  uint64_t v9 = v4;
  id v10 = 0;
  uint64_t v11 = 0;
  long long v12 = 0;
  uint64_t v13 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v39 != v13) {
        objc_enumerationMutation(v2);
      }
      long long v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      if ((objc_msgSend_isFinished(v15, v5, v6, v7, v8, (void)v38) & 1) == 0)
      {
        uint64_t v20 = v15;

        long long v12 = v20;
      }
      if ((objc_msgSend_isFinished(v15, v16, v17, v18, v19) & 1) == 0
        && (objc_msgSend_isBeingHandedOff(v15, v21, v22, v23, v24) & 1) == 0)
      {
        uint64_t v25 = v15;

        id v10 = v25;
      }
      if (objc_msgSend_state(v15, v21, v22, v23, v24) <= 2)
      {
        v30 = v15;

        uint64_t v11 = v30;
      }
      unsigned int v31 = objc_msgSend_callID(v15, v26, v27, v28, v29);
    }
    unsigned int v32 = v31;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v38, (uint64_t)v42, 16);
  }
  while (v9);

  if (v10)
  {
    unsigned int v32 = objc_msgSend_callID(v10, v33, v34, v35, v36);

    uint64_t v2 = v10;
LABEL_22:

    return v32;
  }
  if (v11)
  {
    unsigned int v32 = objc_msgSend_callID(v11, v33, v34, v35, v36);

    uint64_t v2 = v11;
    goto LABEL_22;
  }
  if (v12)
  {
    unsigned int v32 = objc_msgSend_callID(v12, v33, v34, v35, v36);
    uint64_t v2 = v12;
    goto LABEL_22;
  }
  return v32;
}

- (id)_callInfoForCallID:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = self->_participantsCallInfo;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v4);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_callID(v14, v7, v8, v9, v10, (void)v17) == a3)
        {
          id v15 = v14;
          goto LABEL_11;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (id)initAs:(id)a3 invitedBy:(id)a4 toChat:(id)a5 account:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (objc_msgSend_isLoginIMHandle(v10, v14, v15, v16, v17))
  {
    uint64_t v22 = objc_msgSend_sharedInstance(IMAVController, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend_microphoneCapable(v22, v23, v24, v25, v26);

    if (objc_msgSend_isVideo(v12, v28, v29, v30, v31))
    {
      uint64_t v36 = objc_msgSend_sharedInstance(IMAVController, v32, v33, v34, v35);
      uint64_t isVideo = objc_msgSend_cameraCapable(v36, v37, v38, v39, v40);
    }
    else
    {
      uint64_t isVideo = 0;
    }
    uint64_t hasCapability = 0;
  }
  else if (v10 == v11)
  {
    uint64_t isVideo = objc_msgSend_isVideo(v12, v18, v19, v20, v21);
    uint64_t hasCapability = 0;
    uint64_t v27 = 1;
  }
  else
  {
    unint64_t v42 = objc_msgSend_capabilities(v10, v18, v19, v20, v21);
    uint64_t v27 = (v42 >> 19) & 1;
    uint64_t isVideo = objc_msgSend_isVideo(v12, v43, v44, v45, v46) & ((v42 & 0x40000) != 0);
    uint64_t hasCapability = objc_msgSend_hasCapability_(v10, v47, 0x2000000000, v48, v49);
  }
  v51 = objc_msgSend_vcPartyIDForIMHandle_(v12, v32, (uint64_t)v10, v34, v35);
  int v55 = 0;
  inited = objc_msgSend__initAs_invitedBy_sendingAudio_sendingVideo_usingICE_toChat_inState_withError_andReason_andVCPartyID_account_(self, v52, (uint64_t)v10, (uint64_t)v11, v27, isVideo, hasCapability, v12, 0, v55, v51, v13);

  return inited;
}

- (void)disconnectFromAVChat
{
  objc_msgSend_setAVChat_(self, a2, 0, v2, v3);
}

- (id)description
{
  uint64_t v6 = objc_msgSend_avChat(self, a2, v2, v3, v4);
  int isVideo = objc_msgSend_isVideo(v6, v7, v8, v9, v10);
  id v12 = @"an audio";
  if (isVideo) {
    id v12 = @"a video";
  }
  id v13 = v12;

  long long v18 = @"has been invited to";
  switch(self->_state)
  {
    case 0u:

      long long v18 = @"is not yet involved in";
      id v13 = @"a";
      break;
    case 1u:
      break;
    case 2u:
      long long v18 = @"is waiting for others to join";
      break;
    case 3u:
      long long v18 = @"is connecting to";
      break;
    case 4u:
      long long v18 = @"is connected to";
      break;
    case 5u:

      long long v18 = @"has left";
      id v13 = @"the";
      break;
    default:

      long long v18 = @"is in an invalid state";
      id v13 = @"for a";
      break;
  }
  uint64_t v19 = NSString;
  uint64_t v20 = objc_msgSend_imHandle(self, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_vcPartyID(self, v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_stringWithFormat_(v19, v26, @"%@ %@ %@ %@ chat (%p)", v27, v28, v20, v18, v13, v25, self);

  return v29;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "participant: %@", buf, 0xCu);
  }

  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v4, v5, v6, v7);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, 0, 0);

  inFrequencyLevel = self->_inFrequencyLevel;
  self->_inFrequencyLevel = 0;

  outFrequencyLevel = self->_outFrequencyLevel;
  self->_outFrequencyLevel = 0;

  participantsCallInfo = self->_participantsCallInfo;
  self->_participantsCallInfo = 0;

  additionalPeers = self->_additionalPeers;
  self->_additionalPeers = 0;

  excludingPushTokens = self->_excludingPushTokens;
  self->_excludingPushTokens = 0;

  properties = self->_properties;
  self->_properties = 0;

  imHandle = self->_imHandle;
  self->_imHandle = 0;

  inviter = self->_inviter;
  self->_inviter = 0;

  objc_msgSend_disconnectFromAVChat(self, v18, v19, v20, v21);
  objc_msgSend_setVCPartyID_(self, v22, 0, v23, v24);
  v25.receiver = self;
  v25.super_class = (Class)IMAVChatParticipant;
  [(IMAVChatParticipant *)&v25 dealloc];
}

- (NSString)name
{
  return (NSString *)objc_msgSend_name(self->_imHandle, a2, v2, v3, v4);
}

- (BOOL)isLocalParticipant
{
  uint64_t v5 = self;
  uint64_t v6 = objc_msgSend_avChat(self, a2, v2, v3, v4);
  objc_msgSend_localParticipant(v6, v7, v8, v9, v10);
  id v11 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v11 == v5;

  return (char)v5;
}

- (void)requestIconIfNecessary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    uint64_t v17 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "participant: %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v8 = objc_msgSend_imHandle(self, v4, v5, v6, v7);
  if ((objc_msgSend_isBuddy(v8, v9, v10, v11, v12) & 1) == 0) {
    objc_msgSend_requestValueOfProperty_(v8, v13, *MEMORY[0x263F4A698], v14, v15);
  }
}

- (id)_callInfoWithState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = self->_participantsCallInfo;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_state(v14, v7, v8, v9, v10, (void)v17) == a3)
        {
          id v15 = v14;
          goto LABEL_11;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (id)_callInfosWaitingForAcceptAction
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  participantsCallInfo = self->_participantsCallInfo;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_224FA106C;
  v10[3] = &unk_264710AC0;
  id v5 = v3;
  id v11 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(participantsCallInfo, v6, (uint64_t)v10, v7, v8);

  return v5;
}

- (id)_callInfosWaitingForResponse
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  participantsCallInfo = self->_participantsCallInfo;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_224FA11A0;
  v10[3] = &unk_264710AC0;
  id v5 = v3;
  id v11 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(participantsCallInfo, v6, (uint64_t)v10, v7, v8);

  return v5;
}

- (id)_processIncomingCallProperties:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v65 = 138412290;
    id v66 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "_processIncomingCallProperties: %@", (uint8_t *)&v65, 0xCu);
  }

  uint64_t v6 = objc_alloc_init(IMAVChatParticipantCallInfo);
  uint64_t v10 = objc_msgSend_objectForKey_(v4, v7, *MEMORY[0x263F4A6C8], v8, v9);
  objc_msgSend_setRemoteICEData_(v6, v11, (uint64_t)v10, v12, v13);

  long long v17 = objc_msgSend_objectForKey_(v4, v14, *MEMORY[0x263F4A6E8], v15, v16);
  objc_msgSend_setRemoteNATType_(v6, v18, (uint64_t)v17, v19, v20);

  uint64_t v24 = objc_msgSend_objectForKey_(v4, v21, *MEMORY[0x263F4A6E0], v22, v23);
  objc_msgSend_setRemoteNATIP_(v6, v25, (uint64_t)v24, v26, v27);

  uint64_t v31 = objc_msgSend_objectForKey_(v4, v28, *MEMORY[0x263F4A6A8], v29, v30);
  objc_msgSend_setPeerCN_(v6, v32, (uint64_t)v31, v33, v34);

  uint64_t v38 = objc_msgSend_objectForKey_(v4, v35, *MEMORY[0x263F4A738], v36, v37);
  objc_msgSend_setRemoteSKEData_(v6, v39, (uint64_t)v38, v40, v41);

  uint64_t v45 = objc_msgSend_objectForKey_(v4, v42, *MEMORY[0x263F4A718], v43, v44);
  objc_msgSend_setPeerProtocolVersion_(v6, v46, (uint64_t)v45, v47, v48);

  objc_msgSend__registerCallInfo_(self, v49, (uint64_t)v6, v50, v51);
  int v55 = objc_msgSend_objectForKey_(v4, v52, *MEMORY[0x263F4A6C0], v53, v54);
  uint64_t v60 = objc_msgSend_BOOLValue(v55, v56, v57, v58, v59);
  objc_msgSend_setHasReinitiateCapability_(self, v61, v60, v62, v63);

  return v6;
}

- (BOOL)_processResponseDictionary:(id)a3 allowSecondConnection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v197 = *MEMORY[0x263EF8340];
  uint64_t v6 = (IMAVChatParticipant *)a3;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v194 = v6;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "_processResponseDictionary: %@", buf, 0xCu);
  }

  uint64_t v14 = objc_msgSend_objectForKey_(v6, v8, *MEMORY[0x263F4A730], v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v11, (uint64_t)v14, v12, v13);
    uint64_t v20 = objc_msgSend__callInfosWaitingForResponse(self, v16, v17, v18, v19);
    objc_super v25 = objc_msgSend___imFirstObject(v20, v21, v22, v23, v24);

    if (!v25)
    {
      uint64_t v26 = sub_224FB12A0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend__participantsCallInfo(self, v27, v28, v29, v30);
        uint64_t v31 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v194 = self;
        __int16 v195 = 2112;
        v196 = v31;
        _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "[WARN] *** No call info found for participant: %@  (All: %@)", buf, 0x16u);
      }
    }
    unsigned int v32 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v33 = (const void *)*MEMORY[0x263F4A748];
    uint64_t v37 = objc_msgSend_objectForKey_(v15, v34, *MEMORY[0x263F4A748], v35, v36);
    if (v37) {
      CFDictionarySetValue(v32, v33, v37);
    }

    uint64_t v41 = objc_msgSend_objectForKey_(v15, v38, *MEMORY[0x263F4A6A8], v39, v40);
    objc_msgSend_setPeerCN_(v25, v42, (uint64_t)v41, v43, v44);

    uint64_t v48 = objc_msgSend_objectForKey_(v15, v45, *MEMORY[0x263F4A6C8], v46, v47);
    objc_msgSend_setRemoteICEData_(v25, v49, (uint64_t)v48, v50, v51);

    int v55 = objc_msgSend_objectForKey_(v15, v52, *MEMORY[0x263F4A6E8], v53, v54);
    objc_msgSend_setRemoteNATType_(v25, v56, (uint64_t)v55, v57, v58);

    uint64_t v62 = objc_msgSend_objectForKey_(v15, v59, *MEMORY[0x263F4A6E0], v60, v61);
    objc_msgSend_setRemoteNATIP_(v25, v63, (uint64_t)v62, v64, v65);

    objc_super v69 = objc_msgSend_objectForKey_(v15, v66, *MEMORY[0x263F4A6D0], v67, v68);
    objc_msgSend_setRelayInitiate_(v25, v70, (uint64_t)v69, v71, v72);

    v76 = objc_msgSend_objectForKey_(v15, v73, *MEMORY[0x263F4A738], v74, v75);
    objc_msgSend_setRemoteSKEData_(v25, v77, (uint64_t)v76, v78, v79);

    v83 = objc_msgSend_objectForKey_(v15, v80, *MEMORY[0x263F4A718], v81, v82);
    objc_msgSend_setPeerProtocolVersion_(v25, v84, (uint64_t)v83, v85, v86);

    objc_msgSend_setState_(v25, v87, 1, v88, v89);
    if (objc_msgSend_count(v32, v90, v91, v92, v93)) {
      objc_msgSend_setProperties_(self, v94, (uint64_t)v32, v95, v96);
    }
    v97 = objc_msgSend_objectForKey_(v6, v94, *MEMORY[0x263F4A728], v95, v96);
    uint64_t v102 = objc_msgSend_intValue(v97, v98, v99, v100, v101);

    unsigned int v107 = objc_msgSend_state(self, v103, v104, v105, v106);
    v111 = objc_msgSend_objectForKey_(v15, v108, *MEMORY[0x263F4A6C0], v109, v110);
    uint64_t v116 = objc_msgSend_BOOLValue(v111, v112, v113, v114, v115);
    objc_msgSend_setHasReinitiateCapability_(self, v117, v116, v118, v119);

    v120 = sub_224FB12A0();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVResponse(v102);
      v192 = v14;
      v121 = v6;
      v122 = v32;
      BOOL v123 = v4;
      v124 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v194 = v124;
      __int16 v195 = 2112;
      v196 = self;
      _os_log_impl(&dword_224F93000, v120, OS_LOG_TYPE_DEFAULT, "Handling response: %@ from participant: %@", buf, 0x16u);

      BOOL v4 = v123;
      unsigned int v32 = v122;
      uint64_t v6 = v121;
      uint64_t v14 = v192;
    }

    objc_msgSend__handleIMAVResponse_(self, v125, v102, v126, v127);
    if (!v102)
    {
      if (v107 < 3 || v4)
      {
        if (v107 >= 3 && v4)
        {
          objc_msgSend__callInfoWithState_(self, v128, 3, v130, v131);
          v133 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
          v138 = v133;
          if (v133)
          {
            objc_msgSend_setIsBeingHandedOff_(v133, v134, 1, v136, v137);
            objc_msgSend_setIsReinitiate_(v25, v139, 1, v140, v141);
          }
          v142 = objc_msgSend_sharedInstance(IMAVInterface, v134, v135, v136, v137);
          v147 = objc_msgSend_avChat(self, v143, v144, v145, v146);
          unsigned int v152 = objc_msgSend_callID(v138, v148, v149, v150, v151);
          objc_msgSend_endAVConferenceWithChat_callID_(v142, v153, (uint64_t)v147, v152, v154);

          v155 = sub_224FB12A0();
          if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v194 = v138;
            _os_log_impl(&dword_224F93000, v155, OS_LOG_TYPE_DEFAULT, "Officially stopping the call we're handing off from %@", buf, 0xCu);
          }

          v160 = objc_msgSend_avChat(self, v156, v157, v158, v159);
          v165 = objc_msgSend_vcPartyID(self, v161, v162, v163, v164);
          objc_msgSend_conferencePersonWithID_mediaDidStall_(v160, v166, (uint64_t)v165, 1, v167);

          v172 = objc_msgSend_avChat(self, v168, v169, v170, v171);
          objc_msgSend__setIsAudioInterrupted_(v172, v173, 1, v174, v175);

          v180 = objc_msgSend_avChat(self, v176, v177, v178, v179);
          objc_msgSend__setIsVideoInterrupted_(v180, v181, 1, v182, v183);
        }
        v132 = objc_msgSend_sharedInstance(IMAVInterface, v128, v129, v130, v131);
        v188 = objc_msgSend_avChat(self, v184, v185, v186, v187);
        objc_msgSend_avChat_prepareConnectionWithCallInfo_(v132, v189, (uint64_t)v188, (uint64_t)v25, v190);
      }
      else
      {
        v132 = sub_224FB12A0();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v194 = self;
          _os_log_impl(&dword_224F93000, v132, OS_LOG_TYPE_DEFAULT, "Received accept for participant (%@) who was already connecting, ignoring this", buf, 0xCu);
        }
      }
    }
  }

  return v14 != 0;
}

- (BOOL)_generateCallInfo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  BOOL v4 = (IMAVChatParticipant *)a3;
  id v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 138412546;
    unint64_t v42 = self;
    __int16 v43 = 2112;
    uint64_t v44 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "getLocalICEData: %@ callInfo: %@", (uint8_t *)&v41, 0x16u);
  }

  uint64_t v10 = objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_avChat(self, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_ID(self->_imHandle, v16, v17, v18, v19);
  objc_super v25 = objc_msgSend_service(self->_imHandle, v21, v22, v23, v24);
  char v27 = objc_msgSend_avChat_generateCallInfoForID_service_usingRelay_callInfo_(v10, v26, (uint64_t)v15, (uint64_t)v20, (uint64_t)v25, 0, v4);

  uint64_t v28 = sub_224FB12A0();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_localICEData(v4, v29, v30, v31, v32);
    uint64_t v33 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
    int v41 = 138412546;
    unint64_t v42 = v33;
    __int16 v43 = 2112;
    uint64_t v44 = self;
    _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "    result: %@ participant: %@", (uint8_t *)&v41, 0x16u);
  }
  uint64_t v38 = objc_msgSend_avChat(self, v34, v35, v36, v37);
  objc_msgSend__postNotificationName_participant_userInfo_(v38, v39, @"__kIMAVChatParticipantCallInfoChangedNotification", (uint64_t)self, 0);

  return v27;
}

- (id)_natType
{
  id v5 = objc_msgSend_properties(self, a2, v2, v3, v4);
  uint64_t v6 = *MEMORY[0x263F4A6E8];
  uint64_t v10 = objc_msgSend_objectForKey_(v5, v7, *MEMORY[0x263F4A6E8], v8, v9);

  if (v10)
  {
    uint64_t v14 = objc_msgSend_objectForKey_(v5, v11, v6, v12, v13);
  }
  else
  {
    uint64_t v18 = objc_msgSend_objectForKey_(v5, v11, *MEMORY[0x263F4A730], v12, v13);
    if (v18)
    {
      uint64_t v19 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v15, (uint64_t)v18, v16, v17);
      uint64_t v14 = objc_msgSend_objectForKey_(v19, v20, v6, v21, v22);
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  return v14;
}

- (void)_handleIMAVResponse:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      id v5 = sub_224FB12A0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Remote user accepted", buf, 2u);
      }

      objc_msgSend_setState_(self, v6, 3, v7, v8);
      return;
    case 1u:
      uint64_t v9 = sub_224FB12A0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Remote user has Declined", v33, 2u);
      }

      objc_msgSend_setStateToEndedWithReason_andError_(self, v10, 5, 0, v11);
      return;
    case 2u:
      uint64_t v12 = sub_224FB12A0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Remote user is busy", v35, 2u);
      }

      objc_msgSend_setStateToEndedWithReason_andError_(self, v13, 3, 0, v14);
      return;
    case 4u:
      uint64_t v15 = sub_224FB12A0();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      __int16 v32 = 0;
      uint64_t v16 = "Remote user doesn't have a good network";
      uint64_t v17 = (uint8_t *)&v32;
      break;
    case 5u:
      uint64_t v15 = sub_224FB12A0();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_WORD *)uint64_t v31 = 0;
      uint64_t v16 = "Remote user has no wifi";
      uint64_t v17 = v31;
      break;
    case 7u:
      uint64_t v18 = sub_224FB12A0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_224F93000, v18, OS_LOG_TYPE_DEFAULT, "Remote user has missed the call", v34, 2u);
      }

      objc_msgSend_setStateToEndedWithReason_andError_(self, v19, 22, 0, v20);
      return;
    case 0xBu:
      uint64_t v15 = sub_224FB12A0();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      __int16 v30 = 0;
      uint64_t v16 = "Remote user filtered the call";
      uint64_t v17 = (uint8_t *)&v30;
      break;
    default:
      objc_msgSend_setStateToEndedWithReason_andError_(self, a2, 5, 0xFFFFFFFFLL, v3);
      return;
  }
  _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
LABEL_25:

  objc_super v25 = objc_msgSend_avChat(self, v21, v22, v23, v24);
  objc_msgSend__reduceInvitationTimeoutTime(v25, v26, v27, v28, v29);
}

- (void)_noteInviteDelivered:(BOOL)a3
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v5 = self->_participantsCallInfo;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v94, (uint64_t)v100, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v95;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v95 != v13) {
        objc_enumerationMutation(v5);
      }
      uint64_t v15 = *(void **)(*((void *)&v94 + 1) + 8 * v14);
      if (objc_msgSend_state(v15, v8, v9, v10, v11, (void)v94) <= 2)
      {
        if (objc_msgSend_inviteNeedsDelivery(v15, v8, v9, v10, v11)) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v94, (uint64_t)v100, 16);
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    objc_msgSend_setInviteNeedsDelivery_(v15, v8, 0, v10, v11);
    if (a3)
    {

      goto LABEL_18;
    }
    if (objc_msgSend_isReinitiate(v15, v16, v17, v18, v19))
    {
      uint64_t v24 = sub_224FB12A0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v99 = v15;
        _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "Ending call info %@ since the re-initiate failed", buf, 0xCu);
      }

      objc_msgSend_setState_(v15, v25, 4, v26, v27);
      __int16 v32 = objc_msgSend_sharedInstance(IMAVInterface, v28, v29, v30, v31);
      uint64_t v37 = objc_msgSend_avChat(self, v33, v34, v35, v36);
      unsigned int v42 = objc_msgSend_callID(v15, v38, v39, v40, v41);
      objc_msgSend_endAVConferenceWithChat_callID_(v32, v43, (uint64_t)v37, v42, v44);
    }
  }
LABEL_17:

  if (a3)
  {
LABEL_18:
    if (objc_msgSend__inviteDelivered(self, v20, v21, v22, v23, (void)v94)) {
      return;
    }
    uint64_t v49 = objc_msgSend_avChat(self, v45, v46, v47, v48);
    uint64_t v54 = objc_msgSend_localParticipant(v49, v50, v51, v52, v53);
    if (objc_msgSend_isInitiator(v54, v55, v56, v57, v58))
    {
      unsigned int v63 = objc_msgSend_state(self, v59, v60, v61, v62);

      if (v63 > 3) {
        return;
      }
      uint64_t v68 = objc_msgSend_avChat(self, v64, v65, v66, v67);
      objc_msgSend__postNotificationName_participant_userInfo_(v68, v69, @"__kIMAVChatParticipantInvitationDeliveredNotification", (uint64_t)self, 0);

      uint64_t v74 = objc_msgSend_avChat(self, v70, v71, v72, v73);
      uint64_t v79 = objc_msgSend__timings(v74, v75, v76, v77, v78);
      objc_msgSend_stopTimingForKey_(v79, v80, @"invitation-delivery-time", v81, v82);

      objc_msgSend__setInviteDelivered_(self, v83, 1, v84, v85);
      uint64_t v49 = objc_msgSend_sharedInstance(IMAVCallManager, v86, v87, v88, v89);
      objc_msgSend__sendProxyUpdate(v49, v90, v91, v92, v93);
    }
    else
    {
    }
  }
}

- (void)_cleanupOrphanedCallInfos
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v6 = objc_msgSend__participantsCallInfo(self, a2, v2, v3, v4);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v40, (uint64_t)v46, 16);
  if (v8)
  {
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)v41;
    *(void *)&long long v13 = 138412290;
    long long v39 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (objc_msgSend_state(v17, v9, v10, v11, v12, v39) <= 1)
        {
          uint64_t v18 = sub_224FB12A0();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v39;
            uint64_t v45 = v17;
            _os_log_impl(&dword_224F93000, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up call info because it has not started connecting: %@", buf, 0xCu);
          }

          objc_msgSend_setState_(v17, v19, 4, v20, v21);
          uint64_t v26 = objc_msgSend_sharedInstance(IMAVInterface, v22, v23, v24, v25);
          uint64_t v31 = objc_msgSend_avChat(self, v27, v28, v29, v30);
          unsigned int v36 = objc_msgSend_callID(v17, v32, v33, v34, v35);
          objc_msgSend_endAVConferenceWithChat_callID_(v26, v37, (uint64_t)v31, v36, v38);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v40, (uint64_t)v46, 16);
    }
    while (v14);
  }
}

- (void)_hangupCallLaterIfReinitiateFailsForCallInfo:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  im_dispatch_after();
}

- (id)_callInfoForReinitiate
{
  uint64_t v2 = objc_alloc_init(IMAVChatParticipantCallInfo);
  objc_msgSend_setIsReinitiate_(v2, v3, 1, v4, v5);
  objc_msgSend_setInviteNeedsDelivery_(v2, v6, 1, v7, v8);
  return v2;
}

- (void)reinitializeCallForCallID:(unsigned int)a3
{
  uint64_t v6 = objc_msgSend__callInfoForCallID_(self, a2, a3, v3, v4);
  if ((objc_msgSend_isBeingHandedOff(v6, v7, v8, v9, v10) & 1) == 0
    && (objc_msgSend_isFinished(v6, v11, v12, v13, v14) & 1) == 0
    && objc_msgSend_state(v6, v15, v16, v17, v18) == 3)
  {
    uint64_t v19 = MEMORY[0x22A628580](@"com.apple.conference", @"kDisableReInitiate");

    if (!v19)
    {
      if ((objc_msgSend_isLocalParticipant(self, v20, v21, v22, v23) & 1) == 0
        && (objc_msgSend_hasConnectingSessions(self, v24, v25, v26, v27) & 1) == 0
        && objc_msgSend_hasReinitiateCapability(self, v24, v25, v26, v27))
      {
        objc_msgSend_setIsBeingHandedOff_(v6, v24, 1, v26, v27);
        __int16 v32 = objc_msgSend__callInfoForReinitiate(self, v28, v29, v30, v31);
        objc_msgSend__registerCallInfo_(self, v33, (uint64_t)v32, v34, v35);
        objc_msgSend__reInitiateWithCallInfo_(self, v36, (uint64_t)v32, v37, v38);
        objc_msgSend__hangupCallLaterIfReinitiateFailsForCallInfo_(self, v39, (uint64_t)v32, v40, v41);
      }
      if ((objc_msgSend_hasReinitiateCapability(self, v24, v25, v26, v27) & 1) == 0)
      {
        long long v42 = sub_224FB12A0();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v43 = 0;
          _os_log_impl(&dword_224F93000, v42, OS_LOG_TYPE_DEFAULT, " We don't have re-initiate capability...", v43, 2u);
        }
      }
    }
  }
}

- (void)setState:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_state != a3)
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v5 = sub_224FB12A0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = _NSStringDescriptionForIMAVChatParticipantState(v3);
      uint64_t v7 = _NSStringDescriptionForIMAVChatParticipantState(self->_state);
      *(_DWORD *)uint64_t v24 = 138412802;
      *(void *)&v24[4] = self;
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v6;
      *(_WORD *)&v24[22] = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "participant: %@   state: %@   oldState: %@", v24, 0x20u);
    }
    unsigned int state = self->_state;
    if (state == 5)
    {
      uint64_t v13 = sub_224FB12A0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_224F93000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition: cannot transition out of end state!", v24, 2u);
      }
    }
    else
    {
      switch((int)v3)
      {
        case 1:
          if (state)
          {
            uint64_t v14 = sub_224FB12A0();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = _NSStringDescriptionForIMAVChatParticipantState(self->_state);
              uint64_t v16 = _NSStringDescriptionForIMAVChatParticipantState(1u);
              *(_DWORD *)uint64_t v24 = 138412546;
              *(void *)&v24[4] = v15;
              *(_WORD *)&v24[12] = 2112;
              *(void *)&v24[14] = v16;
              _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition:  from state (%@) to state (%@)!", v24, 0x16u);
            }
          }
          if (objc_msgSend_isInitiator(self, v8, v9, v10, v11))
          {
            uint64_t v17 = sub_224FB12A0();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_39;
            }
            *(_WORD *)uint64_t v24 = 0;
            uint64_t v18 = "[WARN] IMAVChatParticipant: the initiator of a chat should never be invited!";
            goto LABEL_38;
          }
          goto LABEL_40;
        case 2:
          if (state - 3 >= 2)
          {
            if (!state) {
              goto LABEL_35;
            }
          }
          else if (objc_msgSend_isInitiator(self, v8, v9, v10, v11))
          {
            goto LABEL_35;
          }
          uint64_t v21 = sub_224FB12A0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = _NSStringDescriptionForIMAVChatParticipantState(self->_state);
            uint64_t v23 = _NSStringDescriptionForIMAVChatParticipantState(2u);
            *(_DWORD *)uint64_t v24 = 138412546;
            *(void *)&v24[4] = v22;
            *(_WORD *)&v24[12] = 2112;
            *(void *)&v24[14] = v23;
            _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition:  from state (%@) to state (%@)!", v24, 0x16u);
          }
LABEL_35:
          if ((objc_msgSend_isInitiator(self, v8, v9, v10, v11) & 1) == 0)
          {
            uint64_t v17 = sub_224FB12A0();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_39;
            }
            *(_WORD *)uint64_t v24 = 0;
            uint64_t v18 = "[WARN] IMAVChatParticipant: only the initiator of a chat should ever be waiting!";
            goto LABEL_38;
          }
LABEL_40:
          objc_msgSend__setState_withReason_andError_(self, v8, v3, 0, 0, *(_OWORD *)v24, *(void *)&v24[16]);
          break;
        case 3:
          if (state - 1 >= 2)
          {
            uint64_t v17 = sub_224FB12A0();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_39;
            }
            uint64_t v19 = _NSStringDescriptionForIMAVChatParticipantState(self->_state);
            uint64_t v20 = _NSStringDescriptionForIMAVChatParticipantState(3u);
            *(_DWORD *)uint64_t v24 = 138412546;
            *(void *)&v24[4] = v19;
            *(_WORD *)&v24[12] = 2112;
            *(void *)&v24[14] = v20;
            goto LABEL_27;
          }
          goto LABEL_40;
        case 4:
          if (state != 3)
          {
            uint64_t v17 = sub_224FB12A0();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_39;
            }
            uint64_t v19 = _NSStringDescriptionForIMAVChatParticipantState(self->_state);
            uint64_t v20 = _NSStringDescriptionForIMAVChatParticipantState(4u);
            *(_DWORD *)uint64_t v24 = 138412546;
            *(void *)&v24[4] = v19;
            *(_WORD *)&v24[12] = 2112;
            *(void *)&v24[14] = v20;
LABEL_27:
            _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state transition:  from state (%@) to state (%@)!", v24, 0x16u);

            goto LABEL_28;
          }
          goto LABEL_40;
        case 5:
          uint64_t v17 = sub_224FB12A0();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v24 = 0;
            uint64_t v18 = "[WARN] IMAVChatParticipant: do not use setState:IMAVChatStateEnded.  Use setStateToEndedWithReason:andError: instead.";
LABEL_38:
            _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, v18, v24, 2u);
          }
          goto LABEL_39;
        default:
          uint64_t v17 = sub_224FB12A0();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = _NSStringDescriptionForIMAVChatParticipantState(v3);
            *(_DWORD *)uint64_t v24 = 138412290;
            *(void *)&v24[4] = v19;
            _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: invalid state (%@)", v24, 0xCu);
LABEL_28:
          }
LABEL_39:

          goto LABEL_40;
      }
    }
  }
}

- (void)setStateToEndedWithReason:(unsigned int)a3 andError:(int)a4
{
  unsigned int state = self->_state;
  if (state != 5)
  {
    uint64_t v5 = *(void *)&a4;
    uint64_t v6 = *(void *)&a3;
    if (!state)
    {
      uint64_t v8 = sub_224FB12A0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatParticipant: Invalid state transition: from zero state to end state.", v9, 2u);
      }
    }
    objc_msgSend__setState_withReason_andError_(self, a2, 5, v6, v5);
  }
}

- (void)_setState:(unsigned int)a3 withReason:(unsigned int)a4 andError:(int)a5
{
  uint64_t v5 = *(void *)&a3;
  uint64_t state = self->_state;
  self->_uint64_t state = a3;
  self->_chatEndedReason = a4;
  uint64_t v8 = objc_msgSend_account(self->_imHandle, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
  uint64_t v13 = objc_msgSend_arrayOfAllIMHandles(v8, v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_indexOfObjectIdenticalTo_(v13, v14, (uint64_t)self->_imHandle, v15, v16);

  if (v5 == 5 && v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setCapabilities_(self->_imHandle, v18, 0, v20, v21);
    objc_msgSend_setPersonStatus_(self->_imHandle, v22, 0, v23, v24);
  }
  objc_msgSend_avChat(self, v18, v19, v20, v21);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participant_changedFromState_toState_(v26, v25, (uint64_t)self, state, v5);
}

- (void)_processPropertyUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_msgSend_objectForKey_(a3, a2, *MEMORY[0x263F4A700], v3, v4);
  uint64_t v6 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    uint64_t v22 = v6;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "kFZVCPropertyPeerMayRequireCTBreak: %@", (uint8_t *)&v21, 0xCu);
  }

  if (objc_msgSend_BOOLValue(v6, v8, v9, v10, v11))
  {
    uint64_t v12 = sub_224FB12A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      uint64_t v22 = self;
      _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "%@ may require break before make!", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v17 = objc_msgSend_avChat(self, v13, v14, v15, v16);
    objc_msgSend_setMayRequireBreakBeforeMake_(v17, v18, 1, v19, v20);
  }
}

- (void)_updateProperties:(id)a3
{
  id v38 = a3;
  if (objc_msgSend_count(v38, v4, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend_properties(self, v8, v9, v10, v11);
    if (!v12
      || (uint64_t v17 = (void *)v12,
          objc_msgSend_properties(self, v13, v14, v15, v16),
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v18, v19, (uint64_t)v38, v20, v21),
          v18,
          v17,
          (isEqualToDictionary & 1) == 0))
    {
      uint64_t v23 = objc_msgSend_properties(self, v13, v14, v15, v16);
      uint64_t v28 = objc_msgSend_mutableCopy(v23, v24, v25, v26, v27);

      objc_msgSend_addEntriesFromDictionary_(v28, v29, (uint64_t)v38, v30, v31);
      objc_msgSend_setProperties_(self, v32, (uint64_t)v28, v33, v34);
      objc_msgSend__processPropertyUpdate_(self, v35, (uint64_t)v38, v36, v37);
    }
  }
}

- (void)_setConferenceID:(id)a3
{
  if (self->_conferenceID != a3)
  {
    self->_conferenceID = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
    MEMORY[0x270F9A758]();
  }
}

- (void)setInFrequencyLevel:(id)a3
{
  uint64_t v5 = (NSData *)a3;
  p_inFrequencyLevel = &self->_inFrequencyLevel;
  if (self->_inFrequencyLevel != v5)
  {
    uint64_t v14 = v5;
    objc_storeStrong((id *)p_inFrequencyLevel, a3);
    uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v7, v8, v9, v10);
    objc_msgSend___mainThreadPostNotificationName_object_(v11, v12, @"__kIMAVChatParticipantInFrequencyChangedNotification", (uint64_t)self, v13);

    uint64_t v5 = v14;
  }
  MEMORY[0x270F9A758](p_inFrequencyLevel, v5);
}

- (void)setOutFrequencyLevel:(id)a3
{
  uint64_t v5 = (NSData *)a3;
  p_outFrequencyLevel = &self->_outFrequencyLevel;
  if (self->_outFrequencyLevel != v5)
  {
    uint64_t v14 = v5;
    objc_storeStrong((id *)p_outFrequencyLevel, a3);
    uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v7, v8, v9, v10);
    objc_msgSend___mainThreadPostNotificationName_object_(v11, v12, @"__kIMAVChatParticipantOutFrequencyChangedNotification", (uint64_t)self, v13);

    uint64_t v5 = v14;
  }
  MEMORY[0x270F9A758](p_outFrequencyLevel, v5);
}

- (void)_switchToUseNewIMHandle:(id)a3
{
  uint64_t v5 = (IMHandle *)a3;
  if (v5)
  {
    imHandle = self->_imHandle;
    p_imHandle = &self->_imHandle;
    if (imHandle != v5)
    {
      uint64_t v8 = v5;
      objc_storeStrong((id *)p_imHandle, a3);
      uint64_t v5 = v8;
    }
  }
}

- (void)sendAVMessage:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_msgSend_avChat(self, v7, v8, v9, v10);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_imHandle(self, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_ID(v20, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_sessionID(v47, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_conferenceID(v47, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_account(v47, v36, v37, v38, v39);
  uint64_t v45 = objc_msgSend_uniqueID(v40, v41, v42, v43, v44);
  objc_msgSend_sendAVMessageToPerson_sessionID_type_userInfo_conference_account_(v15, v46, (uint64_t)v25, v30, v4, v6, v35, v45);
}

- (CGRect)contentRectForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  char isLocalParticipant = objc_msgSend_isLocalParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  if ((isLocalParticipant & 1) == 0)
  {
    uint64_t v12 = 240;
    if (a3 < 2) {
      uint64_t v12 = 208;
    }
    uint64_t v13 = 248;
    if (a3 < 2) {
      uint64_t v13 = 216;
    }
    uint64_t v14 = 256;
    if (a3 < 2) {
      uint64_t v14 = 224;
    }
    uint64_t v15 = 264;
    if (a3 < 2) {
      uint64_t v15 = 232;
    }
    double v8 = *(double *)((char *)&self->super.isa + v12);
    double v9 = *(double *)((char *)&self->super.isa + v13);
    double v10 = *(double *)((char *)&self->super.isa + v14);
    double v11 = *(double *)((char *)&self->super.isa + v15);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGSize)aspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  if (objc_msgSend_isLocalParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4))
  {
    uint64_t v12 = objc_msgSend_avChat(self, v8, v9, v10, v11);
    objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(v12, v13, v6, v5, v14);
    CGFloat width = v15;
    CGFloat height = v17;
  }
  else if (v6 > 1)
  {
    CGFloat width = self->_remoteLandscapeOrientation.width;
    CGFloat height = self->_remoteLandscapeOrientation.height;
  }
  else
  {
    CGFloat width = self->_remotePortraitOrientation.width;
    CGFloat height = self->_remotePortraitOrientation.height;
  }
  double v19 = width;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (CGSize)localAspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  if (objc_msgSend_isLocalParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4))
  {
    uint64_t v12 = objc_msgSend_avChat(self, v8, v9, v10, v11);
    objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(v12, v13, v6, v5, v14);
    CGFloat width = v15;
    CGFloat height = v17;
  }
  else if (v6 > 1)
  {
    CGFloat width = self->_remotePIPLandscapeOrientation.width;
    CGFloat height = self->_remotePIPLandscapeOrientation.height;
  }
  else
  {
    CGFloat width = self->_remotePIPPortraitOrientation.width;
    CGFloat height = self->_remotePIPPortraitOrientation.height;
  }
  double v19 = width;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (unsigned)state
{
  return self->_state;
}

- (BOOL)isSendingAudio
{
  return self->_sendingAudio;
}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (BOOL)isAudioMuted
{
  return self->_audioMuted;
}

- (void)setAudioMuted:(BOOL)a3
{
  self->_audioMuted = a3;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (void)setVideoPaused:(BOOL)a3
{
  self->_videoPaused = a3;
}

- (BOOL)isVideoDegraded
{
  return self->_videoDegraded;
}

- (void)setVideoDegraded:(BOOL)a3
{
  self->_videoDegraded = a3;
}

- (NSArray)additionalPeers
{
  return self->_additionalPeers;
}

- (void)setAdditionalPeers:(id)a3
{
}

- (NSArray)excludingPushTokens
{
  return self->_excludingPushTokens;
}

- (void)setExcludingPushTokens:(id)a3
{
}

- (BOOL)isMediaStalled
{
  return self->_mediaStalled;
}

- (void)setMediaStalled:(BOOL)a3
{
  self->_mediaStalled = a3;
}

- (NSString)vcPartyID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVCPartyID:(id)a3
{
}

- (unsigned)cameraType
{
  return self->_cameraType;
}

- (void)_setCameraType:(unsigned int)a3
{
  self->_cameraType = a3;
}

- (unsigned)cameraOrientation
{
  return self->_cameraOrientation;
}

- (void)_setCameraOrientation:(unsigned int)a3
{
  self->_cameraOrientation = a3;
}

- (IMHandle)imHandle
{
  return self->_imHandle;
}

- (IMHandle)invitedBy
{
  return self->_inviter;
}

- (IMAVChat)avChat
{
  return self->_avChat;
}

- (void)setAVChat:(id)a3
{
  self->_avChat = (IMAVChat *)a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (unsigned)reasonChatEnded
{
  return self->_chatEndedReason;
}

- (int)error
{
  return self->_chatError;
}

- (void)_setChatError:(int)a3
{
  self->_chatError = a3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)_conferenceID
{
  return self->_conferenceID;
}

- (CGSize)_remotePortraitOrientation
{
  double width = self->_remotePortraitOrientation.width;
  double height = self->_remotePortraitOrientation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setRemotePortraitOrientation:(CGSize)a3
{
  self->_remotePortraitOrientation = a3;
}

- (CGSize)_remoteLandscapeOrientation
{
  double width = self->_remoteLandscapeOrientation.width;
  double height = self->_remoteLandscapeOrientation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setRemoteLandscapeOrientation:(CGSize)a3
{
  self->_remoteLandscapeOrientation = a3;
}

- (BOOL)_inviteDelivered
{
  return self->_inviteDelivered;
}

- (void)_setInviteDelivered:(BOOL)a3
{
  self->_inviteDelivered = a3;
}

- (NSTimer)_connectTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)_setConnectTimeoutTimer:(id)a3
{
}

- (CGSize)_remotePIPPortraitOrientation
{
  double width = self->_remotePIPPortraitOrientation.width;
  double height = self->_remotePIPPortraitOrientation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setRemotePIPPortraitOrientation:(CGSize)a3
{
  self->_remotePIPPortraitOrientation = a3;
}

- (CGSize)_remotePIPLandscapeOrientation
{
  double width = self->_remotePIPLandscapeOrientation.width;
  double height = self->_remotePIPLandscapeOrientation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setRemotePIPLandscapeOrientation:(CGSize)a3
{
  self->_remotePIPLandscapeOrientation = a3;
}

- (CGRect)_remotePortraitContentRect
{
  double x = self->_remotePortraitContentRect.origin.x;
  double y = self->_remotePortraitContentRect.origin.y;
  double width = self->_remotePortraitContentRect.size.width;
  double height = self->_remotePortraitContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setRemotePortraitContentRect:(CGRect)a3
{
  self->_remotePortraitContentRect = a3;
}

- (CGRect)_remoteLandscapeContentRect
{
  double x = self->_remoteLandscapeContentRect.origin.x;
  double y = self->_remoteLandscapeContentRect.origin.y;
  double width = self->_remoteLandscapeContentRect.size.width;
  double height = self->_remoteLandscapeContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setRemoteLandscapeContentRect:(CGRect)a3
{
  self->_remoteLandscapeContentRect = a3;
}

- (unsigned)_screenOrientation
{
  return self->_screenOrientation;
}

- (void)_setScreenOrientation:(unsigned int)a3
{
  self->_screenOrientation = a3;
}

- (NSMutableArray)_participantsCallInfo
{
  return self->_participantsCallInfo;
}

- (void)set_participantsCallInfo:(id)a3
{
}

- (void)setHasReinitiateCapability:(BOOL)a3
{
  self->_hasReinitiateCapabilitdouble y = a3;
}

- (NSData)inFrequencyLevel
{
  return self->_inFrequencyLevel;
}

- (NSData)outFrequencyLevel
{
  return self->_outFrequencyLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outFrequencyLevel, 0);
  objc_storeStrong((id *)&self->_inFrequencyLevel, 0);
  objc_storeStrong((id *)&self->_participantsCallInfo, 0);
  objc_storeStrong((id *)&self->_connectTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_conferenceID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_inviter, 0);
  objc_storeStrong((id *)&self->_imHandle, 0);
  objc_storeStrong((id *)&self->_vcPartyID, 0);
  objc_storeStrong((id *)&self->_excludingPushTokens, 0);
  objc_storeStrong((id *)&self->_additionalPeers, 0);
}

- (void)_reInitiateWithCallInfo:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_avChat(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_GUID(v9, v10, v11, v12, v13);
  double v19 = objc_msgSend_vcPartyID(self, v15, v16, v17, v18);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_224FAE17C;
  v23[3] = &unk_264710E78;
  id v24 = v9;
  id v25 = v4;
  double v20 = dispatch_get_global_queue(0, 0);
  id v21 = v4;
  id v22 = v9;
  sub_224FAE05C(v14, v19, 1, v23, v20);
}

- (void)sendInvitation
{
  if (!objc_msgSend_state(self, a2, v2, v3, v4))
  {
    objc_msgSend_setState_(self, v6, 1, v7, v8);
    uint64_t v13 = objc_msgSend_avChat(self, v9, v10, v11, v12);
    uint64_t v18 = objc_msgSend__timings(v13, v14, v15, v16, v17);
    objc_msgSend_stopTimingForKey_(v18, v19, @"time-to-av-invitation-op-creation", v20, v21);

    id v22 = objc_alloc_init(IMAVChatParticipantCallInfo);
    objc_msgSend__registerCallInfo_(self, v23, (uint64_t)v22, v24, v25);
    uint64_t v30 = objc_msgSend_GUID(v13, v26, v27, v28, v29);
    uint64_t v35 = objc_msgSend_vcPartyID(self, v31, v32, v33, v34);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = sub_224FAED38;
    v38[3] = &unk_264710EA0;
    uint64_t v39 = v22;
    uint64_t v36 = dispatch_get_global_queue(0, 0);
    uint64_t v37 = v22;
    sub_224FAE05C(v30, v35, 0, v38, v36);
  }
}

- (void)cancelInvitation
{
  objc_msgSend__cancelInvitationWithReason_response_(self, a2, 1, 0, v2);
}

- (void)cancelInvitationWithResponse:(unsigned int)a3
{
  objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__cancelInvitationWithReason_response_(self, v6, 1, (uint64_t)v8, v7);
}

- (void)cancelInvitationWithReason:(unsigned int)a3
{
  objc_msgSend__cancelInvitationWithReason_response_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)_cancelInvitationWithReason:(unsigned int)a3 response:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_msgSend_setStateToEndedWithReason_andError_(self, v7, v4, 0, v8);
  uint64_t v13 = objc_msgSend_avChat(self, v9, v10, v11, v12);
  unsigned int v18 = objc_msgSend_endedReason(v13, v14, v15, v16, v17);

  if (v18 <= 0x18 && ((1 << v18) & 0x1811000) != 0)
  {
    uint64_t v23 = sub_224FB12A0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = objc_msgSend_avChat(self, v24, v25, v26, v27);
      uint64_t v33 = objc_msgSend_endedReason(v28, v29, v30, v31, v32);
      uint64_t v38 = _NSStringDescriptionForIMAVChatEndedReason(v33, v34, v35, v36, v37);
      int v86 = 138412290;
      uint64_t v87 = v38;
      _os_log_impl(&dword_224F93000, v23, OS_LOG_TYPE_DEFAULT, "No need to send cancel since chat ended with reason %@", (uint8_t *)&v86, 0xCu);
    }
  }
  else
  {
    uint64_t v23 = objc_msgSend_imHandle(self, v19, v20, v21, v22);
    uint64_t v39 = sub_224FB12A0();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = objc_msgSend_ID(v23, v40, v41, v42, v43);
      int v86 = 138412290;
      uint64_t v87 = v44;
      _os_log_impl(&dword_224F93000, v39, OS_LOG_TYPE_DEFAULT, "Sending cancel invite for %@ to service", (uint8_t *)&v86, 0xCu);
    }
    uint64_t v45 = sub_224FB12A0();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = objc_msgSend_ID(v23, v46, v47, v48, v49);
      int v86 = 138412546;
      uint64_t v87 = v50;
      __int16 v88 = 2112;
      id v89 = v6;
      _os_log_impl(&dword_224F93000, v45, OS_LOG_TYPE_DEFAULT, "Sending cancel invite to %@ with response %@", (uint8_t *)&v86, 0x16u);
    }
    int v55 = objc_msgSend_avChat(self, v51, v52, v53, v54);
    uint64_t v60 = objc_msgSend_sharedInstance(IMAVController, v56, v57, v58, v59);
    uint64_t v61 = NSDictionary;
    uint64_t v62 = NSNumber;
    uint64_t v67 = objc_msgSend_sessionID(v55, v63, v64, v65, v66);
    uint64_t v71 = objc_msgSend_numberWithUnsignedInt_(v62, v68, v67, v69, v70);
    uint64_t v74 = objc_msgSend_dictionaryWithObject_forKey_(v61, v72, (uint64_t)v71, *MEMORY[0x263F4A740], v73);
    uint64_t v79 = objc_msgSend_account(v23, v75, v76, v77, v78);
    uint64_t v84 = objc_msgSend_conferenceID(v55, v80, v81, v82, v83);
    objc_msgSend_cancelVCRequestWithBuddy_vcProps_forAccount_conferenceID_reason_(v60, v85, (uint64_t)v23, (uint64_t)v74, (uint64_t)v79, v84, v6);
  }
}

- (void)_sendResponse:(unsigned int)a3 callInfo:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = _NSStringDescriptionForIMAVResponse(a3);
    *(_DWORD *)buf = 138412546;
    uint64_t v45 = self;
    __int16 v46 = 2112;
    uint64_t v47 = v8;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "participant: %@   response: %@", buf, 0x16u);
  }
  uint64_t v13 = objc_msgSend_avChat(self, v9, v10, v11, v12);
  unsigned int v18 = v13;
  if (a3)
  {
    double v19 = objc_msgSend_GUID(v13, v14, v15, v16, v17);
    uint64_t v24 = objc_msgSend_vcPartyID(self, v20, v21, v22, v23);
    sub_224FAF2F0(a3, 0, 1, 1, (uint64_t)v19, v24, v6);
  }
  else
  {
    if (objc_msgSend_isReinitiate(v6, v14, v15, v16, v17)) {
      objc_msgSend__hangupCallLaterIfReinitiateFailsForCallInfo_(self, v25, (uint64_t)v6, v27, v28);
    }
    uint64_t v29 = objc_msgSend_GUID(v18, v25, v26, v27, v28);
    uint64_t v34 = objc_msgSend_vcPartyID(self, v30, v31, v32, v33);
    char isReinitiate = objc_msgSend_isReinitiate(v6, v35, v36, v37, v38);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = sub_224FAF2CC;
    v41[3] = &unk_264710EC8;
    int v43 = 0;
    id v42 = v6;
    uint64_t v40 = dispatch_get_global_queue(0, 0);
    sub_224FAE05C(v29, v34, isReinitiate, v41, v40);

    double v19 = v42;
  }
}

- (void)sendResponse:(unsigned int)a3
{
  objc_msgSend__sendResponse_callInfo_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)setWaitingToConnect:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    uint64_t v25 = self;
    __int16 v26 = 1024;
    BOOL v27 = v3;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "participant: %@  waiting: %d", (uint8_t *)&v24, 0x12u);
  }

  uint64_t v10 = objc_msgSend__connectTimeoutTimer(self, v6, v7, v8, v9);
  uint64_t v15 = v10;
  if (v3)
  {

    if (!v15)
    {
      uint64_t v17 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], v16, (uint64_t)self, (uint64_t)sel__connectTimeout_, 0, 0, 180.0);
      objc_msgSend__setConnectTimeoutTimer_(self, v18, (uint64_t)v17, v19, v20);
    }
  }
  else
  {
    objc_msgSend_invalidate(v10, v11, v12, v13, v14);

    objc_msgSend__setConnectTimeoutTimer_(self, v21, 0, v22, v23);
  }
}

- (void)resetWaitingToConnectTimer
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    uint64_t v22 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "participant: %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v8 = objc_msgSend__connectTimeoutTimer(self, v4, v5, v6, v7);
  objc_msgSend_invalidate(v8, v9, v10, v11, v12);

  objc_msgSend__setConnectTimeoutTimer_(self, v13, 0, v14, v15);
  uint64_t v17 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], v16, (uint64_t)self, (uint64_t)sel__connectTimeout_, 0, 0, 180.0);
  objc_msgSend__setConnectTimeoutTimer_(self, v18, (uint64_t)v17, v19, v20);
}

- (void)_connectTimeout:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_name(self, v5, v6, v7, v8);
    int v15 = 138412290;
    uint64_t v16 = v9;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "Participant %@ _connectTimeout", (uint8_t *)&v15, 0xCu);
  }
  objc_msgSend__setConnectTimeoutTimer_(self, v10, 0, v11, v12);
  objc_msgSend_setStateToEndedWithReason_andError_(self, v13, 6, 1008, v14);
}

- (void)videoLayer
{
  if (!objc_msgSend_isLocalParticipant(self, a2, v2, v3, v4)) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_localVideoLayer(v9, v10, v11, v12, v13);

  return v14;
}

- (void)setVideoLayer:(void *)a3
{
  if (objc_msgSend_isLocalParticipant(self, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalVideoLayer_(v13, v10, (uint64_t)a3, v11, v12);
  }
}

- (void)videoBackLayer
{
  if (!objc_msgSend_isLocalParticipant(self, a2, v2, v3, v4)) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_localVideoBackLayer(v9, v10, v11, v12, v13);

  return v14;
}

- (void)setVideoBackLayer:(void *)a3
{
  if (objc_msgSend_isLocalParticipant(self, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalVideoBackLayer_(v13, v10, (uint64_t)a3, v11, v12);
  }
}

- (id)_proxyRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v10 = objc_msgSend_name(self, v4, v5, v6, v7);
  if (v10) {
    objc_msgSend_setObject_forKey_(v3, v8, (uint64_t)v10, @"Name", v9);
  }

  return v3;
}

@end