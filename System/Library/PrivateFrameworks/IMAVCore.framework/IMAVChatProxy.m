@interface IMAVChatProxy
- (BOOL)_isCallUpgradeTo:(id)a3;
- (BOOL)_isProxy;
- (BOOL)hasReceivedFirstFrame;
- (BOOL)isActive;
- (BOOL)isCaller;
- (BOOL)isMute;
- (BOOL)isRelayed;
- (BOOL)isSendingAudio;
- (BOOL)isSendingVideo;
- (BOOL)isStateFinal;
- (BOOL)isVideo;
- (IMHandle)initiatorIMHandle;
- (IMHandle)otherIMHandle;
- (NSArray)remoteParticipants;
- (NSDate)dateConnected;
- (NSDate)dateEnded;
- (NSNumber)dataDownloaded;
- (NSNumber)dataUploaded;
- (NSString)GUID;
- (NSString)conferenceID;
- (double)connectionTimeoutTime;
- (double)invitationTimeoutTime;
- (id)account;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)endedError;
- (unsigned)endedReason;
- (unsigned)sessionID;
- (unsigned)state;
- (void)acceptInvitation;
- (void)cancelInvitation;
- (void)declineInvitation;
- (void)endChat;
- (void)endChatWithReason:(unsigned int)a3;
- (void)finalUpdate;
- (void)forwardInvocation:(id)a3;
- (void)invite:(id)a3 additionalPeers:(id)a4;
- (void)invite:(id)a3 additionalPeers:(id)a4 excludingPushTokens:(id)a5;
- (void)inviteAll;
- (void)setConnectionTimeoutTime:(double)a3;
- (void)setInvitationTimeoutTime:(double)a3;
- (void)setIsSendingAudio:(BOOL)a3;
- (void)setIsSendingVideo:(BOOL)a3;
- (void)setLocalAspectRatio:(CGSize)a3 cameraOrientation:(unsigned int)a4 cameraType:(unsigned int)a5;
- (void)setMute:(BOOL)a3;
- (void)setRelayed:(BOOL)a3;
- (void)updateWithInfo:(id)a3;
@end

@implementation IMAVChatProxy

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_initiatorIMHandle(self, a2, v2, v3, v4);
  v12 = objc_msgSend_description(v7, v8, v9, v10, v11);
  v17 = objc_msgSend_otherIMHandle(self, v13, v14, v15, v16);
  v22 = objc_msgSend_description(v17, v18, v19, v20, v21);
  v26 = objc_msgSend_stringWithFormat_(v6, v23, @"Initiator: %@, Receiver: %@", v24, v25, v12, v22);

  v27 = NSString;
  if (objc_msgSend_isVideo(self, v28, v29, v30, v31)) {
    v36 = @"Video";
  }
  else {
    v36 = @"Audio";
  }
  unsigned int v37 = objc_msgSend_state(self, v32, v33, v34, v35);
  v38 = _NSStringDescriptionForIMAVChatState(v37);
  v43 = objc_msgSend_conferenceID(self, v39, v40, v41, v42);
  uint64_t v48 = objc_msgSend_sessionID(self, v44, v45, v46, v47);
  v53 = objc_msgSend_GUID(self, v49, v50, v51, v52);
  v57 = objc_msgSend_stringWithFormat_(v27, v54, @"<%p> %@ chat with %@ (state %@) (ConfID: %@) (SID: %u) (GUID: %@)", v55, v56, self, v36, v26, v38, v43, v48, v53);

  return v57;
}

- (id)account
{
  return (id)objc_msgSend_objectForKey_(self->_info, a2, @"AccountID", v2, v3);
}

- (NSString)GUID
{
  return (NSString *)objc_msgSend_objectForKey_(self->_info, a2, @"GUID", v2, v3);
}

- (unsigned)sessionID
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"SessionID", v2, v3);
  unsigned int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)conferenceID
{
  return (NSString *)objc_msgSend_objectForKey_(self->_info, a2, @"ConferenceID", v2, v3);
}

- (unsigned)state
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"State", v2, v3);
  unsigned int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isStateFinal
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsStateFinal", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isSendingAudio
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsSendingAudio", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v33[0] = 67109378;
    v33[1] = v3;
    __int16 v34 = 2112;
    uint64_t v35 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Client called setIsSendingAudio %d on chat proxy %@", (uint8_t *)v33, 0x12u);
  }

  uint64_t v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = objc_alloc(NSNumber);
  uint64_t v15 = objc_msgSend_initWithBool_(v7, v8, v3, v9, v10);
  if (v15) {
    CFDictionarySetValue(v6, @"IsSendingAudio", v15);
  }
  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_account(self, v17, v18, v19, v20);
  v26 = objc_msgSend_GUID(self, v22, v23, v24, v25);
  uint64_t isVideo = objc_msgSend_isVideo(self, v27, v28, v29, v30);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v16, v32, (uint64_t)v21, 11, (uint64_t)v6, v26, isVideo);
}

- (BOOL)isSendingVideo
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsSendingVideo", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsSendingVideo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v33[0] = 67109378;
    v33[1] = v3;
    __int16 v34 = 2112;
    uint64_t v35 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Client called setIsSendingVideo %d on chat proxy %@", (uint8_t *)v33, 0x12u);
  }

  uint64_t v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = objc_alloc(NSNumber);
  uint64_t v15 = objc_msgSend_initWithBool_(v7, v8, v3, v9, v10);
  if (v15) {
    CFDictionarySetValue(v6, @"IsSendingVideo", v15);
  }
  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_account(self, v17, v18, v19, v20);
  v26 = objc_msgSend_GUID(self, v22, v23, v24, v25);
  uint64_t isVideo = objc_msgSend_isVideo(self, v27, v28, v29, v30);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v16, v32, (uint64_t)v21, 13, (uint64_t)v6, v26, isVideo);
}

- (void)setLocalAspectRatio:(CGSize)a3 cameraOrientation:(unsigned int)a4 cameraType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v56.double width = width;
    v56.double height = height;
    uint64_t v11 = NSStringFromSize(v56);
    int v47 = 138413058;
    uint64_t v48 = v11;
    __int16 v49 = 1024;
    int v50 = v6;
    __int16 v51 = 1024;
    int v52 = v5;
    __int16 v53 = 2112;
    v54 = self;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Client called setLocalAspectRatio: %@ cameraOrientation: %d cameraType: %d on chat proxy %@", (uint8_t *)&v47, 0x22u);
  }
  uint64_t v12 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v17 = objc_msgSend_valueWithSize_(MEMORY[0x263F08D40], v13, v14, v15, v16, width, height);
  uint64_t v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v18, v6, v19, v20);
  uint64_t v29 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v22, v5, v23, v24);
  if (v17) {
    CFDictionarySetValue(v12, @"AspectRatio", v17);
  }
  if (v21) {
    CFDictionarySetValue(v12, @"Orientation", v21);
  }
  if (v29) {
    CFDictionarySetValue(v12, @"CameraType", v29);
  }
  uint64_t v30 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v25, v26, v27, v28);
  uint64_t v35 = objc_msgSend_account(self, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_GUID(self, v36, v37, v38, v39);
  uint64_t isVideo = objc_msgSend_isVideo(self, v41, v42, v43, v44);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v30, v46, (uint64_t)v35, 12, (uint64_t)v12, v40, isVideo);
}

- (BOOL)hasReceivedFirstFrame
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"HasReceivedFirstFrame", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSNumber)dataUploaded
{
  return (NSNumber *)objc_msgSend_objectForKey_(self->_info, a2, @"DataUploaded", v2, v3);
}

- (NSNumber)dataDownloaded
{
  return (NSNumber *)objc_msgSend_objectForKey_(self->_info, a2, @"DataDownloaded", v2, v3);
}

- (NSDate)dateConnected
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"DateConnected", v2, v3);
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  double v10 = v9;
  if (v9 >= 1.0)
  {
    id v12 = objc_alloc(MEMORY[0x263EFF910]);
    uint64_t v11 = objc_msgSend_initWithTimeIntervalSince1970_(v12, v13, v14, v15, v16, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return (NSDate *)v11;
}

- (NSDate)dateEnded
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"DateEnded", v2, v3);
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  double v10 = v9;
  if (v9 >= 1.0)
  {
    id v12 = objc_alloc(MEMORY[0x263EFF910]);
    uint64_t v11 = objc_msgSend_initWithTimeIntervalSince1970_(v12, v13, v14, v15, v16, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return (NSDate *)v11;
}

- (NSArray)remoteParticipants
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_objectForKey_(self->_info, a2, @"RemoteParticipants", v2, v3);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = [IMAVChatParticipantProxy alloc];
        uint64_t v20 = objc_msgSend_initWithDictionary_chat_(v14, v15, v13, (uint64_t)self, v16, (void)v23);
        if (v20) {
          objc_msgSend_addObject_(v6, v17, (uint64_t)v20, v18, v19);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v21, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v10);
  }

  return (NSArray *)v6;
}

- (IMHandle)initiatorIMHandle
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"Initiator", v2, v3);
  uint64_t v8 = objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v5, (uint64_t)v4, v6, v7);

  return (IMHandle *)v8;
}

- (IMHandle)otherIMHandle
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"Other", v2, v3);
  uint64_t v8 = objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v5, (uint64_t)v4, v6, v7);

  return (IMHandle *)v8;
}

- (BOOL)_isProxy
{
  return 1;
}

- (BOOL)isActive
{
  return objc_msgSend_state(self, a2, v2, v3, v4) - 1 < 4;
}

- (BOOL)isCaller
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsCaller", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isVideo
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsVideo", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isMute
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsMute", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setMute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v34[0] = 67109378;
    v34[1] = v3;
    __int16 v35 = 2112;
    uint64_t v36 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Client called setMute %d on chat proxy %@", (uint8_t *)v34, 0x12u);
  }

  uint64_t v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = objc_alloc(NSNumber);
  uint64_t v16 = objc_msgSend_initWithDouble_(v7, v8, v9, v10, v11, (double)v3);
  if (v16) {
    CFDictionarySetValue(v6, @"IsMute", v16);
  }
  v17 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v12, v13, v14, v15);
  v22 = objc_msgSend_account(self, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_GUID(self, v23, v24, v25, v26);
  uint64_t isVideo = objc_msgSend_isVideo(self, v28, v29, v30, v31);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v17, v33, (uint64_t)v22, 9, (uint64_t)v6, v27, isVideo);
}

- (unsigned)endedReason
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"EndedReason", v2, v3);
  unsigned int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)endedError
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"EndedError", v2, v3);
  int v9 = objc_msgSend_intValue(v4, v5, v6, v7, v8);

  return v9;
}

- (double)invitationTimeoutTime
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"InvitationTimeoutTime", v2, v3);
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  double v10 = v9;

  return v10;
}

- (void)setInvitationTimeoutTime:(double)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 134218242;
    double v35 = a3;
    __int16 v36 = 2112;
    uint64_t v37 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Client called setInvitationTimeoutTime %f on chat proxy %@", (uint8_t *)&v34, 0x16u);
  }

  uint64_t v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = objc_alloc(NSNumber);
  uint64_t v16 = objc_msgSend_initWithDouble_(v7, v8, v9, v10, v11, a3);
  if (v16) {
    CFDictionarySetValue(v6, @"InvitationTimeoutTime", v16);
  }
  v17 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v12, v13, v14, v15);
  v22 = objc_msgSend_account(self, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_GUID(self, v23, v24, v25, v26);
  uint64_t isVideo = objc_msgSend_isVideo(self, v28, v29, v30, v31);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v17, v33, (uint64_t)v22, 7, (uint64_t)v6, v27, isVideo);
}

- (double)connectionTimeoutTime
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"ConnectionTimeoutTime", v2, v3);
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  double v10 = v9;

  return v10;
}

- (void)setConnectionTimeoutTime:(double)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 134218242;
    double v35 = a3;
    __int16 v36 = 2112;
    uint64_t v37 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Client called setConnectionTimeoutTime %f on chat proxy %@", (uint8_t *)&v34, 0x16u);
  }

  uint64_t v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = objc_alloc(NSNumber);
  uint64_t v16 = objc_msgSend_initWithDouble_(v7, v8, v9, v10, v11, a3);
  if (v16) {
    CFDictionarySetValue(v6, @"ConnectionTimeoutTime", v16);
  }
  v17 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v12, v13, v14, v15);
  v22 = objc_msgSend_account(self, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_GUID(self, v23, v24, v25, v26);
  uint64_t isVideo = objc_msgSend_isVideo(self, v28, v29, v30, v31);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v17, v33, (uint64_t)v22, 8, (uint64_t)v6, v27, isVideo);
}

- (BOOL)isRelayed
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsRelayed", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setRelayed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 67109378;
    BOOL v43 = v3;
    __int16 v44 = 2112;
    uint64_t v45 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Client called setRelayed %d on chat proxy %@", (uint8_t *)&v42, 0x12u);
  }

  if (objc_msgSend_isRelayed(self, v6, v7, v8, v9) == v3)
  {
    uint64_t v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int isRelayed = objc_msgSend_isRelayed(self, v37, v38, v39, v40);
      int v42 = 67109120;
      BOOL v43 = isRelayed;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Not updating relayed value because it is already %d", (uint8_t *)&v42, 8u);
    }
  }
  else
  {
    uint64_t v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v11 = objc_alloc(NSNumber);
    uint64_t v19 = objc_msgSend_initWithBool_(v11, v12, v3, v13, v14);
    if (v19) {
      CFDictionarySetValue((CFMutableDictionaryRef)v10, @"IsRelayed", v19);
    }
    uint64_t v20 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v15, v16, v17, v18);
    uint64_t v25 = objc_msgSend_account(self, v21, v22, v23, v24);
    uint64_t v30 = objc_msgSend_GUID(self, v26, v27, v28, v29);
    uint64_t isVideo = objc_msgSend_isVideo(self, v31, v32, v33, v34);
    objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v20, v36, (uint64_t)v25, 10, (uint64_t)v10, v30, isVideo);
  }
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

- (void)inviteAll
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Client called inviteAll on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  uint64_t v8 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_account(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_GUID(self, v14, v15, v16, v17);
  uint64_t isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 5, 0, v18, isVideo);
}

- (void)invite:(id)a3 additionalPeers:(id)a4
{
}

- (void)invite:(id)a3 additionalPeers:(id)a4 excludingPushTokens:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_224FB12A0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138413058;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v10;
    __int16 v44 = 2112;
    uint64_t v45 = self;
    _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "Client called invite %@ additionalPeers %@ excludingPushTokens %@ on chat proxy %@", (uint8_t *)&v38, 0x2Au);
  }

  uint64_t v12 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v20 = objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v13, (uint64_t)v8, v14, v15);
  if (v20) {
    CFDictionarySetValue(v12, @"Buddy", v20);
  }
  if (v9) {
    CFDictionarySetValue(v12, @"AdditionalPeers", v9);
  }
  if (v10) {
    CFDictionarySetValue(v12, @"ExcludingPushTokens", v10);
  }
  uint64_t v21 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_account(self, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_GUID(self, v27, v28, v29, v30);
  uint64_t isVideo = objc_msgSend_isVideo(self, v32, v33, v34, v35);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v21, v37, (uint64_t)v26, 6, (uint64_t)v12, v31, isVideo);
}

- (void)acceptInvitation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Client called acceptInvitation on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  id v8 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_account(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_GUID(self, v14, v15, v16, v17);
  uint64_t isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 1, 0, v18, isVideo);
}

- (void)cancelInvitation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Client called cancelInvitation on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  id v8 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_account(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_GUID(self, v14, v15, v16, v17);
  uint64_t isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 3, 0, v18, isVideo);
}

- (void)declineInvitation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Client called declineInvitation on chat proxy %@", (uint8_t *)&v25, 0xCu);
  }

  id v8 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_account(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_GUID(self, v14, v15, v16, v17);
  uint64_t isVideo = objc_msgSend_isVideo(self, v19, v20, v21, v22);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v8, v24, (uint64_t)v13, 2, 0, v18, isVideo);
}

- (void)endChat
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Client called endChat on chat proxy %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend_endChatWithReason_(self, v4, 0, v5, v6);
}

- (void)endChatWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _NSStringDescriptionForIMAVChatEndedReason(v3, v6, v7, v8, v9);
    int v37 = 138412546;
    int v38 = v10;
    __int16 v39 = 2112;
    __int16 v40 = self;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Client called endChatWithReason %@ on chat proxy %@", (uint8_t *)&v37, 0x16u);
  }
  uint64_t v11 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v15 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, v3, v13, v14);
  if (v15) {
    CFDictionarySetValue(v11, @"EndedReason", v15);
  }

  uint64_t v20 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v16, v17, v18, v19);
  int v25 = objc_msgSend_account(self, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_GUID(self, v26, v27, v28, v29);
  uint64_t isVideo = objc_msgSend_isVideo(self, v31, v32, v33, v34);
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v20, v36, (uint64_t)v25, 4, (uint64_t)v11, v30, isVideo);
}

- (void)finalUpdate
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Proxy is going away faking a state change to ended", v24, 2u);
  }

  uint64_t v8 = objc_msgSend_mutableCopy(self->_info, v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, 5, v10, v11);
  objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, @"State", v14);

  uint64_t v18 = objc_msgSend_numberWithBool_(NSNumber, v15, 1, v16, v17);
  objc_msgSend_setObject_forKey_(v8, v19, (uint64_t)v18, @"IsStateFinal", v20);

  objc_msgSend_updateWithInfo_(self, v21, (uint64_t)v8, v22, v23);
}

- (void)updateWithInfo:(id)a3
{
  uint64_t v257 = *MEMORY[0x263EF8340];
  uint64_t v5 = (__CFString *)a3;
  uint64_t v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v255 = self;
    *(_WORD *)&v255[8] = 2112;
    v256 = v5;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "Updating proxy %@ with info %@", buf, 0x16u);
  }

  unsigned int v246 = objc_msgSend_state(self, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_remoteParticipants(self, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_lastObject(v15, v16, v17, v18, v19);
  int v243 = objc_msgSend__inviteDelivered(v20, v21, v22, v23, v24);

  int isMute = objc_msgSend_isMute(self, v25, v26, v27, v28);
  int isSendingAudio = objc_msgSend_isSendingAudio(self, v29, v30, v31, v32);
  __int16 v36 = objc_msgSend_objectForKey_(self->_info, v33, @"MetadataFinalized", v34, v35);
  int v41 = objc_msgSend_BOOLValue(v36, v37, v38, v39, v40);

  uint64_t v45 = objc_msgSend_objectForKey_(self->_info, v42, @"HasReceivedFirstFrame", v43, v44);
  int v50 = objc_msgSend_BOOLValue(v45, v46, v47, v48, v49);

  objc_storeStrong((id *)&self->_info, a3);
  unsigned int v248 = objc_msgSend_state(self, v51, v52, v53, v54);
  v59 = objc_msgSend_remoteParticipants(self, v55, v56, v57, v58);
  v64 = objc_msgSend_lastObject(v59, v60, v61, v62, v63);
  int v242 = objc_msgSend__inviteDelivered(v64, v65, v66, v67, v68);

  int v239 = objc_msgSend_isMute(self, v69, v70, v71, v72);
  int v247 = objc_msgSend_isSendingAudio(self, v73, v74, v75, v76);
  v80 = objc_msgSend_objectForKey_(v5, v77, @"MetadataFinalized", v78, v79);
  int v244 = objc_msgSend_BOOLValue(v80, v81, v82, v83, v84);

  v88 = objc_msgSend_objectForKey_(self->_info, v85, @"HasReceivedFirstFrame", v86, v87);
  int v245 = objc_msgSend_BOOLValue(v88, v89, v90, v91, v92);

  v93 = sub_224FB12A0();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    v94 = _NSStringDescriptionForIMAVChatState(v246);
    _NSStringDescriptionForIMAVChatState(v248);
    v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)v255 = v94;
    *(_WORD *)&v255[8] = 2112;
    v256 = v95;
    _os_log_impl(&dword_224F93000, v93, OS_LOG_TYPE_DEFAULT, "Old state %@, new state %@", buf, 0x16u);
  }
  v96 = sub_224FB12A0();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    if (v243) {
      v97 = @"YES";
    }
    else {
      v97 = @"NO";
    }
    if (v242) {
      v98 = @"YES";
    }
    else {
      v98 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v255 = v97;
    *(_WORD *)&v255[8] = 2112;
    v256 = v98;
    _os_log_impl(&dword_224F93000, v96, OS_LOG_TYPE_DEFAULT, "Old delivered %@, new  %@", buf, 0x16u);
  }

  v99 = sub_224FB12A0();
  int v100 = isSendingAudio;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    if (isSendingAudio) {
      v101 = @"YES";
    }
    else {
      v101 = @"NO";
    }
    if (v247) {
      v102 = @"YES";
    }
    else {
      v102 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v255 = v101;
    *(_WORD *)&v255[8] = 2112;
    v256 = v102;
    _os_log_impl(&dword_224F93000, v99, OS_LOG_TYPE_DEFAULT, "Old sendingAudio %@, new %@", buf, 0x16u);
  }

  v103 = sub_224FB12A0();
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
  {
    if (v41) {
      v104 = @"YES";
    }
    else {
      v104 = @"NO";
    }
    if (v244) {
      v105 = @"YES";
    }
    else {
      v105 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v255 = v104;
    *(_WORD *)&v255[8] = 2112;
    v256 = v105;
    _os_log_impl(&dword_224F93000, v103, OS_LOG_TYPE_DEFAULT, "Old metadataFinalized %@, new %@", buf, 0x16u);
  }

  v106 = sub_224FB12A0();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    if (v50) {
      v107 = @"YES";
    }
    else {
      v107 = @"NO";
    }
    if (v245) {
      v108 = @"YES";
    }
    else {
      v108 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v255 = v107;
    *(_WORD *)&v255[8] = 2112;
    v256 = v108;
    _os_log_impl(&dword_224F93000, v106, OS_LOG_TYPE_DEFAULT, "Old hasReceivedFirstRemoteFrame %@, new %@", buf, 0x16u);
  }

  unint64_t v113 = 0x263F08000uLL;
  if (v246 != v248)
  {
    int isVideo = objc_msgSend_isVideo(self, v109, v110, v111, v112);
    v115 = sub_224FB12A0();
    BOOL v116 = os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT);
    if (isVideo)
    {
      if (v116)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v115, OS_LOG_TYPE_DEFAULT, "Kicking off AV call state update", buf, 2u);
      }

      v121 = objc_msgSend_sharedInstance(IMAVCallManager, v117, v118, v119, v120);
      objc_msgSend__updateAVCallState(v121, v122, v123, v124, v125);
    }
    else
    {
      if (v116)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v115, OS_LOG_TYPE_DEFAULT, "Kicking off AC call state update", buf, 2u);
      }

      v121 = objc_msgSend_sharedInstance(IMAVCallManager, v126, v127, v128, v129);
      objc_msgSend__updateACCallState(v121, v130, v131, v132, v133);
    }

    if (v248 == 1)
    {
      int v238 = v41;
      if (objc_msgSend_isCaller(self, v134, v135, v136, v137))
      {
        v142 = sub_224FB12A0();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v255 = self;
          _os_log_impl(&dword_224F93000, v142, OS_LOG_TYPE_DEFAULT, " => Proxy is an outgoing chat, not notifying as invited: %@", buf, 0xCu);
        }
      }
      else
      {
        int v237 = v50;
        long long v251 = 0u;
        long long v252 = 0u;
        long long v249 = 0u;
        long long v250 = 0u;
        v143 = objc_msgSend_sharedInstance(IMAVController, v138, v139, v140, v141);
        v142 = objc_msgSend_delegates(v143, v144, v145, v146, v147);

        uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v148, (uint64_t)&v249, (uint64_t)v253, 16);
        if (v149)
        {
          uint64_t v150 = v149;
          v151 = self;
          v236 = v5;
          uint64_t v152 = *(void *)v250;
          do
          {
            for (uint64_t i = 0; i != v150; ++i)
            {
              if (*(void *)v250 != v152) {
                objc_enumerationMutation(v142);
              }
              v154 = *(void **)(*((void *)&v249 + 1) + 8 * i);
              v155 = sub_224FB12A0();
              if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v255 = v154;
                _os_log_impl(&dword_224F93000, v155, OS_LOG_TYPE_DEFAULT, "Checking delegate: %@", buf, 0xCu);
              }

              char v156 = objc_opt_respondsToSelector();
              v157 = sub_224FB12A0();
              BOOL v158 = os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT);
              if (v156)
              {
                if (v158)
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v255 = v154;
                  _os_log_impl(&dword_224F93000, v157, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
                }

                objc_msgSend_invitedToIMAVChat_(v154, v159, (uint64_t)v151, v160, v161);
              }
              else
              {
                if (v158)
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v255 = v154;
                  _os_log_impl(&dword_224F93000, v157, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
                }
              }
            }
            uint64_t v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v162, (uint64_t)&v249, (uint64_t)v253, 16);
          }
          while (v150);
          uint64_t v5 = v236;
          self = v151;
          int v50 = v237;
          int v100 = isSendingAudio;
          unint64_t v113 = 0x263F08000;
        }
      }

      int v41 = v238;
    }
    v163 = sub_224FB12A0();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v255 = v246;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)&v255[6] = v248;
      _os_log_impl(&dword_224F93000, v163, OS_LOG_TYPE_DEFAULT, "Posting proxy state changed notification from %d to %d", buf, 0xEu);
    }

    v168 = objc_msgSend_defaultCenter(*(void **)(v113 + 2560), v164, v165, v166, v167);
    v169 = NSDictionary;
    objc_msgSend_numberWithUnsignedInt_(NSNumber, v170, v248, v171, v172);
    v174 = unint64_t v173 = v113;
    v178 = objc_msgSend_dictionaryWithObjectsAndKeys_(v169, v175, (uint64_t)v174, v176, v177, @"__kIMAVChatStateKey", 0);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v168, v179, @"__kIMAVChatStateChangedNotification", (uint64_t)self, (uint64_t)v178);

    unint64_t v113 = v173;
  }
  if (((v242 ^ 1 | v243) & 1) == 0)
  {
    v180 = sub_224FB12A0();
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v180, OS_LOG_TYPE_DEFAULT, "Posting proxy participant notification delivered", buf, 2u);
    }

    v185 = objc_msgSend_defaultCenter(*(void **)(v113 + 2560), v181, v182, v183, v184);
    v190 = objc_msgSend_remoteParticipants(self, v186, v187, v188, v189);
    objc_msgSend_lastObject(v190, v191, v192, v193, v194);
    v196 = unint64_t v195 = v113;
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v185, v197, @"__kIMAVChatParticipantInvitationDeliveredNotification", (uint64_t)v196, 0);

    unint64_t v113 = v195;
  }
  if (isMute != v239)
  {
    v198 = sub_224FB12A0();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v255 = isMute;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)&v255[6] = v239;
      _os_log_impl(&dword_224F93000, v198, OS_LOG_TYPE_DEFAULT, "Posting proxy is mute changed notification from %d to %d", buf, 0xEu);
    }

    v203 = objc_msgSend_defaultCenter(*(void **)(v113 + 2560), v199, v200, v201, v202);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v203, v204, @"__kIMAVChatIsMutedChangedNotification", (uint64_t)self, 0);
  }
  if (v100 != v247)
  {
    v205 = sub_224FB12A0();
    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v255 = v100;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)&v255[6] = v247;
      _os_log_impl(&dword_224F93000, v205, OS_LOG_TYPE_DEFAULT, "Posting proxy sending audio changed notification from %d to %d", buf, 0xEu);
    }

    v210 = objc_msgSend_defaultCenter(*(void **)(v113 + 2560), v206, v207, v208, v209);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v210, v211, @"__kIMAVChatSendingAudioChangedNotification", (uint64_t)self, 0);
  }
  if (((v244 ^ 1 | v41) & 1) == 0)
  {
    v212 = sub_224FB12A0();
    if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v212, OS_LOG_TYPE_DEFAULT, "Posting proxy conference metadata updated notification", buf, 2u);
    }

    v217 = objc_msgSend_defaultCenter(*(void **)(v113 + 2560), v213, v214, v215, v216);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v217, v218, @"__kIMAVChatConferenceMetadataUpdatedNotification", (uint64_t)self, 0);
  }
  if (((v245 ^ 1 | v50) & 1) == 0)
  {
    v219 = sub_224FB12A0();
    if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v219, OS_LOG_TYPE_DEFAULT, "Posting proxy participant received first frame notification", buf, 2u);
    }

    v224 = objc_msgSend_defaultCenter(*(void **)(v113 + 2560), v220, v221, v222, v223);
    v229 = objc_msgSend_remoteParticipants(self, v225, v226, v227, v228);
    v234 = objc_msgSend_lastObject(v229, v230, v231, v232, v233);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v224, v235, @"__kIMAVChatParticipantReceivedFirstFrameNotification", (uint64_t)v234, 0);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, SEL))MEMORY[0x270F9A6D0])(IMAVChat, sel_instanceMethodSignatureForSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (const char *)objc_msgSend_selector(v3, v5, v6, v7, v8);
    uint64_t v10 = NSStringFromSelector(v9);
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] ********** IMAVChatProxy does not respond to selector %@, please file a radar **********", (uint8_t *)&v11, 0xCu);
  }
  IMLogBacktrace();
}

- (void).cxx_destruct
{
}

@end