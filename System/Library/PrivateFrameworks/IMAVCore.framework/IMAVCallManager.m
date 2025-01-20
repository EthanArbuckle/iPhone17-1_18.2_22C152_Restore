@interface IMAVCallManager
+ (id)sharedInstance;
- (BOOL)_hasActiveAudioCall;
- (BOOL)_hasActiveFaceTimeCall;
- (BOOL)hasActiveCall;
- (IMAVCallManager)init;
- (NSArray)calls;
- (id)_activeAudioCall;
- (id)_activeFaceTimeCall;
- (id)_copyMutableFTCalls;
- (id)_mutableFTCalls;
- (id)_nonRetainingChatList;
- (unsigned)_callState;
- (unsigned)_callStateForType:(unsigned int)a3;
- (unsigned)callState;
- (void)_addACChatProxy:(id)a3;
- (void)_addAVChatProxy:(id)a3;
- (void)_addIMAVChatToChatList:(id)a3;
- (void)_postStateChangeIfNecessary;
- (void)_postStateChangeNamed:(id)a3 fromState:(unsigned int)a4 toState:(unsigned int)a5 postType:(BOOL)a6 type:(unsigned int)a7;
- (void)_removeIMAVChatFromChatList:(id)a3;
- (void)_sendProxyUpdate;
- (void)_setACCallState:(unsigned int)a3;
- (void)_setACCallState:(unsigned int)a3 quietly:(BOOL)a4;
- (void)_setAVCallState:(unsigned int)a3;
- (void)_setAVCallState:(unsigned int)a3 quietly:(BOOL)a4;
- (void)_updateACCallState;
- (void)_updateACChatProxyWithInfo:(id)a3;
- (void)_updateAVCallState;
- (void)_updateAVChatProxyWithInfo:(id)a3;
- (void)_updateOverallChatState;
@end

@implementation IMAVCallManager

+ (id)sharedInstance
{
  if (qword_26AB796A8 != -1) {
    dispatch_once(&qword_26AB796A8, &unk_26D85A5D0);
  }
  v2 = (void *)qword_26AB796D8;
  return v2;
}

- (IMAVCallManager)init
{
  v85.receiver = self;
  v85.super_class = (Class)IMAVCallManager;
  v6 = [(IMAVCallManager *)&v85 init];
  if (v6)
  {
    v7 = objc_msgSend_sharedInstance(IMAVController, v2, v3, v4, v5);
    if (objc_msgSend__shouldRunConferences(v7, v8, v9, v10, v11))
    {
      int shouldRunACConferences = 1;
    }
    else
    {
      v17 = objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
      int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v17, v18, v19, v20, v21);
    }
    v26 = objc_msgSend_sharedInstance(IMAVController, v22, v23, v24, v25);
    char shouldObserveConferences = objc_msgSend__shouldObserveConferences(v26, v27, v28, v29, v30);

    if (shouldRunACConferences)
    {
      objc_msgSend_ensureHandlerSetup(IMAVHandler, v32, v33, v34, v35);
      uint64_t v40 = objc_msgSend_date(MEMORY[0x263EFF910], v36, v37, v38, v39);
      lastCallStateChange = v6->_lastCallStateChange;
      v6->_lastCallStateChange = (NSDate *)v40;

      v46 = objc_msgSend_sharedInstance(IMAVController, v42, v43, v44, v45);
      int shouldRunConferences = objc_msgSend__shouldRunConferences(v46, v47, v48, v49, v50);

      if (shouldRunConferences) {
        notify_register_check("kIMAVCoreAVCallStateChanged", &v6->_avToken);
      }
      v56 = objc_msgSend_sharedInstance(IMAVController, v52, v53, v54, v55);
      int v61 = objc_msgSend__shouldRunACConferences(v56, v57, v58, v59, v60);

      if (v61) {
        notify_register_check("kIMAVCoreACCallStateChanged", &v6->_acToken);
      }
    }
    else if ((shouldObserveConferences & 1) == 0)
    {
      uint64_t v80 = MEMORY[0x263EF8330];
      uint64_t v81 = 3221225472;
      v82 = sub_224FAB03C;
      v83 = &unk_264710E50;
      v70 = v6;
      v84 = v70;
      v71 = (void *)MEMORY[0x263EF83A0];
      im_notify_register_dispatch();
      state64[1] = MEMORY[0x263EF8330];
      state64[2] = 3221225472;
      state64[3] = (uint64_t)sub_224FAB0B4;
      state64[4] = (uint64_t)&unk_264710E50;
      v72 = v70;
      v79 = v72;
      im_notify_register_dispatch();

      state64[0] = 0;
      notify_get_state(v6->_avToken, state64);
      objc_msgSend__setAVCallState_quietly_(v72, v73, LODWORD(state64[0]), 1, v74);
      notify_get_state(v70[17], state64);
      objc_msgSend__setACCallState_quietly_(v72, v75, LODWORD(state64[0]), 1, v76);

      guidToAVChatProxyMap = (NSMutableDictionary *)v84;
      goto LABEL_13;
    }
    v62 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    acChatProxyArray = v6->_acChatProxyArray;
    v6->_acChatProxyArray = v62;

    v64 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    avChatProxyArray = v6->_avChatProxyArray;
    v6->_avChatProxyArray = v64;

    v66 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    guidToACChatProxyMap = v6->_guidToACChatProxyMap;
    v6->_guidToACChatProxyMap = v66;

    v68 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    guidToAVChatProxyMap = v6->_guidToAVChatProxyMap;
    v6->_guidToAVChatProxyMap = v68;
LABEL_13:
  }
  return v6;
}

- (NSArray)calls
{
  v6 = objc_msgSend__mutableFTCalls(self, a2, v2, v3, v4);
  objc_msgSend_addObjectsFromArray_(v6, v7, (uint64_t)self->_acChatProxyArray, v8, v9);
  objc_msgSend_addObjectsFromArray_(v6, v10, (uint64_t)self->_avChatProxyArray, v11, v12);
  return (NSArray *)v6;
}

- (id)_mutableFTCalls
{
  uint64_t v5 = objc_msgSend__copyMutableFTCalls(self, a2, v2, v3, v4);
  return v5;
}

- (id)_copyMutableFTCalls
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = objc_msgSend__chatListLock(IMAVChat, v4, v5, v6, v7);
  objc_msgSend_lock(v8, v9, v10, v11, v12);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v13 = self->_chatArray;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v15)
  {
    uint64_t v20 = v15;
    uint64_t v21 = *(void *)v38;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v13);
        }
        v26 = objc_msgSend_object(*(void **)(*((void *)&v37 + 1) + 8 * v22), v16, v17, v18, v19, (void)v37);
        if (v26) {
          objc_msgSend_addObject_(v3, v23, (uint64_t)v26, v24, v25);
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v20);
  }

  v31 = objc_msgSend__chatListLock(IMAVChat, v27, v28, v29, v30);
  objc_msgSend_unlock(v31, v32, v33, v34, v35);

  return v3;
}

- (id)_nonRetainingChatList
{
  chatArray = self->_chatArray;
  if (!chatArray)
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = self->_chatArray;
    self->_chatArray = v4;

    chatArray = self->_chatArray;
  }
  return chatArray;
}

- (void)_addIMAVChatToChatList:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend__chatListLock(IMAVChat, v5, v6, v7, v8);
  objc_msgSend_lock(v9, v10, v11, v12, v13);

  if (!self->_chatArray)
  {
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    chatArray = self->_chatArray;
    self->_chatArray = v14;
  }
  id v16 = objc_alloc(MEMORY[0x263F4A630]);
  id inited = (id)objc_msgSend_initRefWithObject_(v16, v17, (uint64_t)v4, v18, v19);

  objc_msgSend_addObject_(self->_chatArray, v20, (uint64_t)inited, v21, v22);
  v27 = objc_msgSend__chatListLock(IMAVChat, v23, v24, v25, v26);
  objc_msgSend_unlock(v27, v28, v29, v30, v31);
}

- (void)_removeIMAVChatFromChatList:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend__chatListLock(IMAVChat, v5, v6, v7, v8);
  objc_msgSend_lock(v9, v10, v11, v12, v13);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v14 = self->_chatArray;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v16)
  {
    uint64_t v21 = v16;
    uint64_t v22 = *(void *)v34;
LABEL_3:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v34 != v22) {
        objc_enumerationMutation(v14);
      }
      if ((id)objc_msgSend_hash(*(void **)(*((void *)&v33 + 1) + 8 * v23), v17, v18, v19, v20, (void)v33) == v4) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v33, (uint64_t)v37, 16);
        if (v21) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v28 = objc_msgSend__chatListLock(IMAVChat, v24, v25, v26, v27);
  objc_msgSend_unlock(v28, v29, v30, v31, v32);
}

- (void)_postStateChangeNamed:(id)a3 fromState:(unsigned int)a4 toState:(unsigned int)a5 postType:(BOOL)a6 type:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v17 = objc_msgSend_numberWithInt_(NSNumber, v14, v10, v15, v16);
  uint64_t v21 = objc_msgSend_numberWithInt_(NSNumber, v18, v9, v19, v20);
  uint64_t v25 = objc_msgSend_initWithObjectsAndKeys_(v13, v22, (uint64_t)v17, v23, v24, @"PreviousState", v21, @"NewState", 0);

  if (v8)
  {
    uint64_t v29 = objc_msgSend_numberWithInt_(NSNumber, v26, v7, v27, v28);
    objc_msgSend_setObject_forKey_(v25, v30, (uint64_t)v29, @"CallType", v31);
  }
  uint64_t v32 = sub_224FB12A0();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = v12;
    __int16 v41 = 2112;
    uint64_t v42 = v25;
    _os_log_impl(&dword_224F93000, v32, OS_LOG_TYPE_DEFAULT, "Posting %@  with %@", buf, 0x16u);
  }

  long long v37 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v33, v34, v35, v36);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v37, v38, (uint64_t)v12, (uint64_t)self, (uint64_t)v25);
}

- (void)_postStateChangeIfNecessary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_callState(self, a2, v2, v3, v4);
  if (self->_globalCallState != v6)
  {
    uint64_t v7 = v6;
    BOOL v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = _NSStringDescriptionForIMAVChatState(self->_globalCallState);
      uint64_t v10 = _NSStringDescriptionForIMAVChatState(v7);
      int v13 = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Global call state changed from %@ to %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t globalCallState = self->_globalCallState;
    self->_uint64_t globalCallState = v7;
    objc_msgSend__postStateChangeNamed_fromState_toState_postType_type_(self, v12, @"com.apple.avcore.callstatechanged", globalCallState, v7, 0, 0);
  }
}

- (unsigned)_callState
{
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10)) {
    goto LABEL_4;
  }
  __int16 v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  if (objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19))
  {

LABEL_4:
LABEL_5:
    uint64_t v28 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v24, v25, v26, v27);
    objc_msgSend_connectToDaemon(v28, v29, v30, v31, v32);

    goto LABEL_6;
  }
  uint64_t v34 = objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
  char shouldObserveConferences = objc_msgSend__shouldObserveConferences(v34, v35, v36, v37, v38);

  if (shouldObserveConferences) {
    goto LABEL_5;
  }
LABEL_6:
  if (self->_avCallState <= self->_acCallState) {
    return self->_acCallState;
  }
  else {
    return self->_avCallState;
  }
}

- (unsigned)_callStateForType:(unsigned int)a3
{
  uint64_t v7 = objc_msgSend_sharedInstance(IMAVController, a2, *(uint64_t *)&a3, v3, v4);
  if (objc_msgSend__shouldRunConferences(v7, v8, v9, v10, v11)) {
    goto LABEL_4;
  }
  uint64_t v16 = objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
  if (objc_msgSend__shouldRunACConferences(v16, v17, v18, v19, v20))
  {

LABEL_4:
LABEL_5:
    uint64_t v29 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v25, v26, v27, v28);
    objc_msgSend_connectToDaemon(v29, v30, v31, v32, v33);

    goto LABEL_6;
  }
  uint64_t v36 = objc_msgSend_sharedInstance(IMAVController, v21, v22, v23, v24);
  char shouldObserveConferences = objc_msgSend__shouldObserveConferences(v36, v37, v38, v39, v40);

  if (shouldObserveConferences) {
    goto LABEL_5;
  }
LABEL_6:
  if (a3 == 1)
  {
    uint64_t v34 = 72;
    return *(_DWORD *)((char *)&self->super.isa + v34);
  }
  if (a3 == 2)
  {
    uint64_t v34 = 76;
    return *(_DWORD *)((char *)&self->super.isa + v34);
  }
  return 0;
}

- (void)_setAVCallState:(unsigned int)a3
{
  objc_msgSend__setAVCallState_quietly_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)_setAVCallState:(unsigned int)a3 quietly:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_avCallState != a3)
  {
    uint64_t v7 = sub_224FB12A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = _NSStringDescriptionForIMAVChatState(self->_avCallState);
      uint64_t v9 = _NSStringDescriptionForIMAVChatState(a3);
      int v27 = 138412546;
      *(void *)uint64_t v28 = v8;
      *(_WORD *)&v28[8] = 2112;
      uint64_t v29 = v9;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Setting av call state from %@ to %@", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v14 = objc_msgSend__callState(self, v10, v11, v12, v13);
    self->_avCallState = a3;
    uint64_t v19 = objc_msgSend__callState(self, v15, v16, v17, v18);
    if (!a4)
    {
      uint64_t v20 = v19;
      if (v14 != v19)
      {
        uint64_t v21 = sub_224FB12A0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 67109376;
          *(_DWORD *)uint64_t v28 = v14;
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = v20;
          _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "Posting overall non-telephony state changed from %d to %d", (uint8_t *)&v27, 0xEu);
        }

        objc_msgSend__postStateChangeNamed_fromState_toState_postType_type_(self, v22, @"com.apple.avcore._callstatechanged", v14, v20, 1, 1);
        objc_msgSend__postStateChangeIfNecessary(self, v23, v24, v25, v26);
      }
    }
  }
}

- (void)_updateAVCallState
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = objc_msgSend_calls(self, a2, v2, v3, v4, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v36, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend_isVideo(v17, v9, v10, v11, v12))
        {
          unsigned int v18 = objc_msgSend_state(v17, v9, v10, v11, v12);
          int isStateFinal = objc_msgSend_isStateFinal(v17, v19, v20, v21, v22);
          if (v14 <= v18) {
            unsigned int v24 = v18;
          }
          else {
            unsigned int v24 = v14;
          }
          if (isStateFinal) {
            uint64_t v14 = v14;
          }
          else {
            uint64_t v14 = v24;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v30, (uint64_t)v36, 16);
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  uint64_t v25 = sub_224FB12A0();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = _NSStringDescriptionForIMAVChatState(v14);
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v26;
    _os_log_impl(&dword_224F93000, v25, OS_LOG_TYPE_DEFAULT, "Updating AV call state to %@", buf, 0xCu);
  }
  objc_msgSend__setAVCallState_(self, v27, v14, v28, v29);
}

- (void)_setACCallState:(unsigned int)a3
{
  objc_msgSend__setACCallState_quietly_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (void)_setACCallState:(unsigned int)a3 quietly:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_acCallState != a3)
  {
    uint64_t v7 = sub_224FB12A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = _NSStringDescriptionForIMAVChatState(self->_acCallState);
      uint64_t v9 = _NSStringDescriptionForIMAVChatState(a3);
      int v27 = 138412546;
      *(void *)uint64_t v28 = v8;
      *(_WORD *)&v28[8] = 2112;
      uint64_t v29 = v9;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Setting ac call state from %@ to %@", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v14 = objc_msgSend__callState(self, v10, v11, v12, v13);
    self->_acCallState = a3;
    uint64_t v19 = objc_msgSend__callState(self, v15, v16, v17, v18);
    if (!a4)
    {
      uint64_t v20 = v19;
      if (v14 != v19)
      {
        uint64_t v21 = sub_224FB12A0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 67109376;
          *(_DWORD *)uint64_t v28 = v14;
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = v20;
          _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "Posting overall non-telephony state changed from %d to %d", (uint8_t *)&v27, 0xEu);
        }

        objc_msgSend__postStateChangeNamed_fromState_toState_postType_type_(self, v22, @"com.apple.avcore._callstatechanged", v14, v20, 1, 2);
        objc_msgSend__postStateChangeIfNecessary(self, v23, v24, v25, v26);
      }
    }
  }
}

- (void)_updateACCallState
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = objc_msgSend_calls(self, a2, v2, v3, v4, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v36, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ((objc_msgSend_isVideo(v17, v9, v10, v11, v12) & 1) == 0)
        {
          unsigned int v18 = objc_msgSend_state(v17, v9, v10, v11, v12);
          int isStateFinal = objc_msgSend_isStateFinal(v17, v19, v20, v21, v22);
          if (v14 <= v18) {
            unsigned int v24 = v18;
          }
          else {
            unsigned int v24 = v14;
          }
          if (isStateFinal) {
            uint64_t v14 = v14;
          }
          else {
            uint64_t v14 = v24;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v30, (uint64_t)v36, 16);
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  uint64_t v25 = sub_224FB12A0();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = _NSStringDescriptionForIMAVChatState(v14);
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v26;
    _os_log_impl(&dword_224F93000, v25, OS_LOG_TYPE_DEFAULT, "Updating AC call state to %@", buf, 0xCu);
  }
  objc_msgSend__setACCallState_(self, v27, v14, v28, v29);
}

- (unsigned)callState
{
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10)) {
    goto LABEL_4;
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  if (objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19))
  {

LABEL_4:
LABEL_5:
    uint64_t v28 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v24, v25, v26, v27);
    objc_msgSend_connectToDaemon(v28, v29, v30, v31, v32);

    goto LABEL_6;
  }
  uint64_t v34 = objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
  char shouldObserveConferences = objc_msgSend__shouldObserveConferences(v34, v35, v36, v37, v38);

  if (shouldObserveConferences) {
    goto LABEL_5;
  }
LABEL_6:
  return objc_msgSend__callState(self, v24, v25, v26, v27);
}

- (void)_updateOverallChatState
{
  uint64_t v205 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {
  }
  else
  {
    uint64_t v19 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
    int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v19, v20, v21, v22, v23);

    if (!shouldRunACConferences) {
      return;
    }
  }
  long long v200 = 0u;
  long long v201 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  v193 = self;
  uint64_t v25 = objc_msgSend_calls(self, v15, v16, v17, v18);
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v198, (uint64_t)v204, 16);
  if (!v27)
  {
    v196 = 0;
    v197 = 0;
    unsigned int v195 = 0;
    uint64_t v29 = 0;
    goto LABEL_25;
  }
  uint64_t v28 = v27;
  v196 = 0;
  v197 = 0;
  unsigned int v195 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = *(void *)v199;
  unint64_t v31 = 0x26B5F4000uLL;
  do
  {
    uint64_t v32 = 0;
    uint64_t v194 = v28;
    do
    {
      if (*(void *)v199 != v30) {
        objc_enumerationMutation(v25);
      }
      long long v33 = *(void **)(*((void *)&v198 + 1) + 8 * v32);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unsigned int v38 = objc_msgSend_state(v33, v34, v35, v36, v37);
        if ((objc_msgSend_isStateFinal(v33, v39, v40, v41, v42) & 1) == 0)
        {
          if (objc_msgSend_isVideo(v33, v34, v43, v44, v45))
          {
            if (v29 <= v38) {
              uint64_t v29 = v38;
            }
            else {
              uint64_t v29 = v29;
            }
            uint64_t v50 = v196;
            v51 = v197;
            v52 = v33;
            if (v29 != objc_msgSend_state(v196, v46, v47, v48, v49)) {
              goto LABEL_20;
            }
          }
          else
          {
            uint64_t v53 = v30;
            unint64_t v54 = v31;
            uint64_t v55 = v25;
            uint64_t v56 = v29;
            unsigned int v57 = v195;
            if (v195 <= v38) {
              unsigned int v57 = v38;
            }
            uint64_t v50 = v197;
            v51 = v33;
            v52 = v196;
            unsigned int v195 = v57;
            BOOL v58 = v57 == objc_msgSend_state(v197, v46, v47, v48, v49);
            uint64_t v29 = v56;
            uint64_t v25 = v55;
            unint64_t v31 = v54;
            uint64_t v30 = v53;
            uint64_t v28 = v194;
            if (!v58)
            {
LABEL_20:
              id v59 = v33;

              v196 = v52;
              v197 = v51;
            }
          }
        }
      }
      ++v32;
    }
    while (v28 != v32);
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v34, (uint64_t)&v198, (uint64_t)v204, 16);
  }
  while (v28);
LABEL_25:

  uint64_t v60 = v193;
  objc_msgSend__sendProxyUpdate(v193, v61, v62, v63, v64);
  if (v29 == 5)
  {

    v196 = 0;
    uint64_t v29 = 0;
  }
  uint64_t v69 = v195;
  if (v195 == 5)
  {

    v197 = 0;
    uint64_t v69 = 0;
  }
  if (!(v29 | v69))
  {
    v70 = sub_224FB12A0();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(0);
      v71 = (IMPowerAssertion *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v203 = v71;
      _os_log_impl(&dword_224F93000, v70, OS_LOG_TYPE_DEFAULT, "Ending logging session with state: %@", buf, 0xCu);
    }
    v72 = sub_224FB12A0();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend__FTCalls(v193, v73, v74, v75, v76);
      v77 = (IMPowerAssertion *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v203 = v77;
      _os_log_impl(&dword_224F93000, v72, OS_LOG_TYPE_DEFAULT, "Remaining chats: %@", buf, 0xCu);
    }
  }
  v78 = objc_msgSend_sharedInstance(IMAVController, v65, v66, v67, v68);
  int shouldRunConferences = objc_msgSend__shouldRunConferences(v78, v79, v80, v81, v82);

  if (shouldRunConferences)
  {
    uint64_t v88 = v29;
    uint64_t v89 = v69;
    unsigned int avCallState = v193->_avCallState;
    v91 = NSDictionary;
    uint64_t v92 = v88;
    v93 = _NSStringDescriptionForIMAVChatState(v88);
    v94 = _NSStringDescriptionForIMAVChatState(avCallState);
    v95 = NSString;
    objc_msgSend_timeIntervalSinceNow(v193->_lastCallStateChange, v96, v97, v98, v99);
    v104 = objc_msgSend_stringWithFormat_(v95, v101, @"%.1f", v102, v103, fabs(v100));
    v108 = objc_msgSend_dictionaryWithObjectsAndKeys_(v91, v105, (uint64_t)v93, v106, v107, @"CurrentState", v94, @"PreviousState", v104, @"TimeSinceLastStateChange", 0);

    if (qword_26AB79668 != -1) {
      dispatch_once(&qword_26AB79668, &unk_26D85A5F0);
    }
    uint64_t v60 = v193;
    uint64_t v69 = v89;
    if (off_26AB79660) {
      off_26AB79660(8, @"VideoCallStateChange", v108, 0);
    }

    uint64_t v29 = v92;
  }
  v109 = objc_msgSend_sharedInstance(IMAVController, v84, v85, v86, v87);
  int v114 = objc_msgSend__shouldRunACConferences(v109, v110, v111, v112, v113);

  if (v114)
  {
    unsigned int acCallState = v60->_acCallState;
    v120 = NSDictionary;
    uint64_t v121 = v69;
    v122 = _NSStringDescriptionForIMAVChatState(v69);
    v123 = _NSStringDescriptionForIMAVChatState(acCallState);
    v124 = NSString;
    objc_msgSend_timeIntervalSinceNow(v60->_lastCallStateChange, v125, v126, v127, v128);
    v133 = objc_msgSend_stringWithFormat_(v124, v130, @"%.1f", v131, v132, fabs(v129));
    v137 = objc_msgSend_dictionaryWithObjectsAndKeys_(v120, v134, (uint64_t)v122, v135, v136, @"CurrentState", v123, @"PreviousState", v133, @"TimeSinceLastStateChange", 0);

    if (qword_26AB794E0 != -1) {
      dispatch_once(&qword_26AB794E0, &unk_26D85A610);
    }
    uint64_t v60 = v193;
    uint64_t v69 = v121;
    if (off_26AB794E8) {
      off_26AB794E8(8, @"AudioCallStateChange", v137, 0);
    }
  }
  uint64_t v138 = objc_msgSend_date(MEMORY[0x263EFF910], v115, v116, v117, v118);
  lastCallStateChange = v60->_lastCallStateChange;
  v60->_lastCallStateChange = (NSDate *)v138;

  v144 = objc_msgSend_sharedInstance(IMAVController, v140, v141, v142, v143);
  int v149 = objc_msgSend__shouldRunConferences(v144, v145, v146, v147, v148);

  if (v149)
  {
    objc_msgSend__setAVCallState_(v60, v150, v29, v152, v153);
    notify_set_state(v60->_avToken, v29);
    notify_post("kIMAVCoreAVCallStateChanged");
  }
  v154 = objc_msgSend_sharedInstance(IMAVController, v150, v151, v152, v153);
  int v159 = objc_msgSend__shouldRunACConferences(v154, v155, v156, v157, v158);

  if (v159)
  {
    objc_msgSend__setACCallState_(v60, v160, v69, v162, v163);
    notify_set_state(v60->_acToken, v69);
    notify_post("kIMAVCoreACCallStateChanged");
  }
  v164 = objc_msgSend_sharedInstance(IMAVController, v160, v161, v162, v163);
  char v169 = objc_msgSend__shouldRunConferences(v164, v165, v166, v167, v168);

  v174 = objc_msgSend_sharedInstance(IMAVController, v170, v171, v172, v173);
  char v179 = objc_msgSend__shouldRunACConferences(v174, v175, v176, v177, v178);

  if (v29) {
    char v180 = v169;
  }
  else {
    char v180 = 0;
  }
  if (v69) {
    char v181 = v179;
  }
  else {
    char v181 = 0;
  }
  powerAssertion = v60->_powerAssertion;
  if (v180 & 1) != 0 || (v181)
  {
    if (!powerAssertion)
    {
      id v186 = objc_alloc(MEMORY[0x263F4A5E0]);
      uint64_t v190 = objc_msgSend_initWithIdentifier_(v186, v187, @"ActiveFaceTimeConferenceAssertion", v188, v189);
      v191 = v60->_powerAssertion;
      v60->_powerAssertion = (IMPowerAssertion *)v190;

      v185 = sub_224FB12A0();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
      {
        v192 = v60->_powerAssertion;
        *(_DWORD *)buf = 138412290;
        v203 = v192;
        _os_log_impl(&dword_224F93000, v185, OS_LOG_TYPE_DEFAULT, "Setting power assertion: %@", buf, 0xCu);
      }
LABEL_66:
    }
  }
  else if (powerAssertion)
  {
    v183 = sub_224FB12A0();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
    {
      v184 = v60->_powerAssertion;
      *(_DWORD *)buf = 138412290;
      v203 = v184;
      _os_log_impl(&dword_224F93000, v183, OS_LOG_TYPE_DEFAULT, "Releasing power assertion: %@", buf, 0xCu);
    }

    v185 = v60->_powerAssertion;
    v60->_powerAssertion = 0;
    goto LABEL_66;
  }
}

- (void)_addAVChatProxy:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!self->_guidToAVChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    guidToAVChatProxyMap = self->_guidToAVChatProxyMap;
    self->_guidToAVChatProxyMap = Mutable;
  }
  if (!self->_avChatProxyArray)
  {
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    avChatProxyArray = self->_avChatProxyArray;
    self->_avChatProxyArray = v11;
  }
  uint64_t v13 = self->_guidToAVChatProxyMap;
  uint64_t v14 = objc_msgSend_GUID(v8, v4, v5, v6, v7);
  objc_msgSend_setObject_forKey_(v13, v15, (uint64_t)v8, (uint64_t)v14, v16);

  objc_msgSend_addObject_(self->_avChatProxyArray, v17, (uint64_t)v8, v18, v19);
  uint64_t v20 = sub_224FB12A0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = self->_guidToAVChatProxyMap;
    int v22 = 138412290;
    uint64_t v23 = v21;
    _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "New AV proxy map after add %@", (uint8_t *)&v22, 0xCu);
  }
}

- (void)_addACChatProxy:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!self->_guidToACChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    guidToACChatProxyMap = self->_guidToACChatProxyMap;
    self->_guidToACChatProxyMap = Mutable;
  }
  if (!self->_acChatProxyArray)
  {
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    acChatProxyArray = self->_acChatProxyArray;
    self->_acChatProxyArray = v11;
  }
  uint64_t v13 = self->_guidToACChatProxyMap;
  uint64_t v14 = objc_msgSend_GUID(v8, v4, v5, v6, v7);
  objc_msgSend_setObject_forKey_(v13, v15, (uint64_t)v8, (uint64_t)v14, v16);

  objc_msgSend_addObject_(self->_acChatProxyArray, v17, (uint64_t)v8, v18, v19);
  uint64_t v20 = sub_224FB12A0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = self->_guidToACChatProxyMap;
    int v22 = 138412290;
    uint64_t v23 = v21;
    _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "New AC proxy map after add %@", (uint8_t *)&v22, 0xCu);
  }
}

- (void)_updateAVChatProxyWithInfo:(id)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_guidToAVChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    guidToAVChatProxyMap = self->_guidToAVChatProxyMap;
    self->_guidToAVChatProxyMap = Mutable;
  }
  if (!self->_avChatProxyArray)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    avChatProxyArray = self->_avChatProxyArray;
    self->_avChatProxyArray = v7;
  }
  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = self->_guidToAVChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v125 = v10;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Old AV proxy map %@", buf, 0xCu);
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v4;
  uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v117, (uint64_t)v123, 16);
  if (v108)
  {
    uint64_t v106 = *(void *)v118;
    *(void *)&long long v16 = 138412290;
    long long v104 = v16;
    uint64_t v107 = self;
    do
    {
      for (uint64_t i = 0; i != v108; ++i)
      {
        if (*(void *)v118 != v106) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(NSMutableDictionary **)(*((void *)&v117 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend_objectForKey_(v18, v13, @"GUID", v14, v15, v104);
        if (v23)
        {
          uint64_t v24 = v11;
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          uint64_t v25 = objc_msgSend__calls(self, v19, v20, v21, v22);
          uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v113, (uint64_t)v122, 16);
          if (v27)
          {
            uint64_t v32 = v27;
            uint64_t v33 = *(void *)v114;
            while (2)
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v114 != v33) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v35 = objc_msgSend_GUID(*(void **)(*((void *)&v113 + 1) + 8 * j), v28, v29, v30, v31);
                int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v35, v36, (uint64_t)v23, v37, v38);

                if (isEqualToIgnoringCase)
                {
                  uint64_t v53 = sub_224FB12A0();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_224F93000, v53, OS_LOG_TYPE_DEFAULT, "Ignoring proxy update, we own the real IMAVChat object", buf, 2u);
                  }

                  id v11 = v24;
                  objc_msgSend_addObject_(v24, v54, (uint64_t)v23, v55, v56);
                  goto LABEL_41;
                }
              }
              uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v113, (uint64_t)v122, 16);
              if (v32) {
                continue;
              }
              break;
            }
          }

          uint64_t v40 = sub_224FB12A0();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v104;
            v125 = v18;
            _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "Updating chat proxy with info %@", buf, 0xCu);
          }

          id v11 = v24;
          objc_msgSend_addObject_(v24, v41, (uint64_t)v23, v42, v43);
          uint64_t v47 = objc_msgSend_objectForKey_(v107->_guidToAVChatProxyMap, v44, (uint64_t)v23, v45, v46);
          uint64_t v48 = sub_224FB12A0();
          BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
          if (v47)
          {
            if (v49)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_224F93000, v48, OS_LOG_TYPE_DEFAULT, "Found existing proxy, updating...", buf, 2u);
            }

            objc_msgSend_updateWithInfo_(v47, v50, (uint64_t)v18, v51, v52);
          }
          else
          {
            if (v49)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_224F93000, v48, OS_LOG_TYPE_DEFAULT, "Creating new proxy", buf, 2u);
            }

            id v59 = objc_alloc_init(IMAVChatProxy);
            objc_msgSend_setObject_forKey_(v107->_guidToAVChatProxyMap, v60, (uint64_t)v59, (uint64_t)v23, v61);
            objc_msgSend_addObject_(v107->_avChatProxyArray, v62, (uint64_t)v59, v63, v64);
            objc_msgSend_updateWithInfo_(v59, v65, (uint64_t)v18, v66, v67);
            uint64_t v68 = sub_224FB12A0();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v69 = v107->_guidToAVChatProxyMap;
              *(_DWORD *)buf = v104;
              v125 = v69;
              _os_log_impl(&dword_224F93000, v68, OS_LOG_TYPE_DEFAULT, "AV Proxy Map: %@", buf, 0xCu);
            }
          }
LABEL_41:
          self = v107;
        }
        else
        {
          unsigned int v57 = sub_224FB12A0();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_224F93000, v57, OS_LOG_TYPE_DEFAULT, "No GUID in proxy update, ignoring...", buf, 2u);
          }

          BOOL v58 = sub_224FB12A0();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v104;
            v125 = v18;
            _os_log_impl(&dword_224F93000, v58, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }
      }
      uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v117, (uint64_t)v123, 16);
    }
    while (v108);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  uint64_t v74 = objc_msgSend__copyForEnumerating(self->_avChatProxyArray, v70, v71, v72, v73);
  uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v109, (uint64_t)v121, 16);
  if (v76)
  {
    uint64_t v81 = v76;
    uint64_t v82 = *(void *)v110;
    do
    {
      for (uint64_t k = 0; k != v81; ++k)
      {
        if (*(void *)v110 != v82) {
          objc_enumerationMutation(v74);
        }
        v84 = *(void **)(*((void *)&v109 + 1) + 8 * k);
        uint64_t v85 = objc_msgSend_GUID(v84, v77, v78, v79, v80);
        char v89 = objc_msgSend_containsObject_(v11, v86, (uint64_t)v85, v87, v88);

        if ((v89 & 1) == 0)
        {
          v90 = self->_guidToAVChatProxyMap;
          v91 = objc_msgSend_GUID(v84, v77, v78, v79, v80);
          objc_msgSend_removeObjectForKey_(v90, v92, (uint64_t)v91, v93, v94);

          objc_msgSend_removeObjectIdenticalTo_(self->_avChatProxyArray, v95, (uint64_t)v84, v96, v97);
          objc_msgSend_finalUpdate(v84, v98, v99, v100, v101);
        }
      }
      uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v109, (uint64_t)v121, 16);
    }
    while (v81);
  }

  uint64_t v102 = sub_224FB12A0();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v103 = self->_guidToAVChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v125 = v103;
    _os_log_impl(&dword_224F93000, v102, OS_LOG_TYPE_DEFAULT, "New AV proxy map %@", buf, 0xCu);
  }
}

- (void)_updateACChatProxyWithInfo:(id)a3
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_guidToACChatProxyMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    guidToACChatProxyMap = self->_guidToACChatProxyMap;
    self->_guidToACChatProxyMap = Mutable;
  }
  if (!self->_acChatProxyArray)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    acChatProxyArray = self->_acChatProxyArray;
    self->_acChatProxyArray = v7;
  }
  id v105 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = self->_guidToACChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v122 = v10;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "Old AC proxy map %@", buf, 0xCu);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  obuint64_t j = v4;
  uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v114, (uint64_t)v120, 16);
  if (v104)
  {
    uint64_t v103 = *(void *)v115;
    *(void *)&long long v15 = 138412290;
    long long v101 = v15;
    do
    {
      for (uint64_t i = 0; i != v104; ++i)
      {
        if (*(void *)v115 != v103) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(NSMutableDictionary **)(*((void *)&v114 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_objectForKey_(v17, v12, @"GUID", v13, v14, v101);
        if (v22)
        {
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          uint64_t v23 = objc_msgSend__calls(self, v18, v19, v20, v21);
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v110, (uint64_t)v119, 16);
          if (v25)
          {
            uint64_t v30 = v25;
            uint64_t v31 = *(void *)v111;
            while (2)
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v111 != v31) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v33 = objc_msgSend_GUID(*(void **)(*((void *)&v110 + 1) + 8 * j), v26, v27, v28, v29);
                int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v33, v34, (uint64_t)v22, v35, v36);

                if (isEqualToIgnoringCase)
                {
                  uint64_t v51 = sub_224FB12A0();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_224F93000, v51, OS_LOG_TYPE_DEFAULT, "Ignoring proxy update, we own the real IMAVChat object", buf, 2u);
                  }

                  objc_msgSend_addObject_(v105, v52, (uint64_t)v22, v53, v54);
                  goto LABEL_40;
                }
              }
              uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v110, (uint64_t)v119, 16);
              if (v30) {
                continue;
              }
              break;
            }
          }

          uint64_t v38 = sub_224FB12A0();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v101;
            v122 = v17;
            _os_log_impl(&dword_224F93000, v38, OS_LOG_TYPE_DEFAULT, "Updating chat proxy with info %@", buf, 0xCu);
          }

          objc_msgSend_addObject_(v105, v39, (uint64_t)v22, v40, v41);
          uint64_t v45 = objc_msgSend_objectForKey_(self->_guidToACChatProxyMap, v42, (uint64_t)v22, v43, v44);
          uint64_t v46 = sub_224FB12A0();
          BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
          if (v45)
          {
            if (v47)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_224F93000, v46, OS_LOG_TYPE_DEFAULT, "Found existing proxy, updating...", buf, 2u);
            }

            objc_msgSend_updateWithInfo_(v45, v48, (uint64_t)v17, v49, v50);
          }
          else
          {
            if (v47)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_224F93000, v46, OS_LOG_TYPE_DEFAULT, "Creating new proxy", buf, 2u);
            }

            uint64_t v56 = objc_alloc_init(IMAVChatProxy);
            objc_msgSend_setObject_forKey_(self->_guidToACChatProxyMap, v57, (uint64_t)v56, (uint64_t)v22, v58);
            objc_msgSend_addObject_(self->_acChatProxyArray, v59, (uint64_t)v56, v60, v61);
            objc_msgSend_updateWithInfo_(v56, v62, (uint64_t)v17, v63, v64);
            v65 = sub_224FB12A0();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v66 = self->_guidToACChatProxyMap;
              *(_DWORD *)buf = v101;
              v122 = v66;
              _os_log_impl(&dword_224F93000, v65, OS_LOG_TYPE_DEFAULT, "AC Proxy Map: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v55 = sub_224FB12A0();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_224F93000, v55, OS_LOG_TYPE_DEFAULT, "No GUID in proxy update, ignoring...", buf, 2u);
          }

          uint64_t v45 = sub_224FB12A0();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v101;
            v122 = v17;
            _os_log_impl(&dword_224F93000, v45, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }

LABEL_40:
      }
      uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v114, (uint64_t)v120, 16);
    }
    while (v104);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v71 = objc_msgSend__copyForEnumerating(self->_acChatProxyArray, v67, v68, v69, v70);
  uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v106, (uint64_t)v118, 16);
  if (v73)
  {
    uint64_t v78 = v73;
    uint64_t v79 = *(void *)v107;
    do
    {
      for (uint64_t k = 0; k != v78; ++k)
      {
        if (*(void *)v107 != v79) {
          objc_enumerationMutation(v71);
        }
        uint64_t v81 = *(void **)(*((void *)&v106 + 1) + 8 * k);
        uint64_t v82 = objc_msgSend_GUID(v81, v74, v75, v76, v77);
        char v86 = objc_msgSend_containsObject_(v105, v83, (uint64_t)v82, v84, v85);

        if ((v86 & 1) == 0)
        {
          uint64_t v87 = self->_guidToACChatProxyMap;
          uint64_t v88 = objc_msgSend_GUID(v81, v74, v75, v76, v77);
          objc_msgSend_removeObjectForKey_(v87, v89, (uint64_t)v88, v90, v91);

          objc_msgSend_removeObjectIdenticalTo_(self->_acChatProxyArray, v92, (uint64_t)v81, v93, v94);
          objc_msgSend_finalUpdate(v81, v95, v96, v97, v98);
        }
      }
      uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v74, (uint64_t)&v106, (uint64_t)v118, 16);
    }
    while (v78);
  }

  uint64_t v99 = sub_224FB12A0();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v100 = self->_guidToACChatProxyMap;
    *(_DWORD *)buf = 138412290;
    v122 = v100;
    _os_log_impl(&dword_224F93000, v99, OS_LOG_TYPE_DEFAULT, "New AC proxy map %@", buf, 0xCu);
  }
}

- (void)_sendProxyUpdate
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  int shouldRunConferences = objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10);

  unint64_t v16 = 0x263F4A000;
  if (shouldRunConferences)
  {
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v22 = objc_msgSend_calls(self, v18, v19, v20, v21);
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v90, (uint64_t)v95, 16);
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v91;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v91 != v26) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void **)(*((void *)&v90 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isVideo(v28, v29, v30, v31, v32))
          {
            uint64_t v36 = objc_msgSend__proxyRepresentation(v28, v29, v33, v34, v35);
            objc_msgSend_addObject_(v17, v37, (uint64_t)v36, v38, v39);
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v29, (uint64_t)&v90, (uint64_t)v95, 16);
      }
      while (v25);
    }

    uint64_t v40 = sub_224FB12A0();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "Sending video chat proxy update", buf, 2u);
    }

    unint64_t v16 = 0x263F4A000uLL;
    uint64_t v45 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v41, v42, v43, v44);
    objc_msgSend_setValue_ofProperty_(v45, v46, (uint64_t)v17, @"AVChatProxy", v47);
  }
  uint64_t v48 = objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
  int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v48, v49, v50, v51, v52);

  if (shouldRunACConferences)
  {
    id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v59 = objc_msgSend_calls(self, v55, v56, v57, v58, 0);
    uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v85, (uint64_t)v94, 16);
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v86;
      do
      {
        uint64_t v64 = 0;
        do
        {
          if (*(void *)v86 != v63) {
            objc_enumerationMutation(v59);
          }
          v65 = *(void **)(*((void *)&v85 + 1) + 8 * v64);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isVideo(v65, v66, v67, v68, v69) & 1) == 0)
          {
            uint64_t v73 = objc_msgSend__proxyRepresentation(v65, v66, v70, v71, v72);
            objc_msgSend_addObject_(v54, v74, (uint64_t)v73, v75, v76);
          }
          ++v64;
        }
        while (v62 != v64);
        uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v66, (uint64_t)&v85, (uint64_t)v94, 16);
      }
      while (v62);
    }

    uint64_t v77 = sub_224FB12A0();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v77, OS_LOG_TYPE_DEFAULT, "Sending audio chat proxy update", buf, 2u);
    }

    uint64_t v82 = objc_msgSend_sharedInstance(*(void **)(v16 + 1384), v78, v79, v80, v81);
    objc_msgSend_setValue_ofProperty_(v82, v83, (uint64_t)v54, @"ACChatProxy", v84);
  }
}

- (BOOL)hasActiveCall
{
  int v5 = objc_msgSend_callState(self, a2, v2, v3, v4);
  return v5 != 5 && v5 != 0;
}

- (BOOL)_hasActiveFaceTimeCall
{
  int v4 = objc_msgSend__callStateForType_(self, a2, 1, v2, v3);
  return v4 != 5 && v4 != 0;
}

- (BOOL)_hasActiveAudioCall
{
  int v4 = objc_msgSend__callStateForType_(self, a2, 2, v2, v3);
  return v4 != 5 && v4 != 0;
}

- (id)_activeFaceTimeCall
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v5 = objc_msgSend__FTCalls(self, a2, v2, v3, v4, 0);
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend_isVideo(v14, v7, v8, v9, v10))
        {
          int v15 = objc_msgSend_state(v14, v7, v8, v9, v10);
          if (v15 != 5 && v15 != 0)
          {
            id v11 = v14;
            goto LABEL_14;
          }
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v11);
  }
LABEL_14:

  return v11;
}

- (id)_activeAudioCall
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v5 = objc_msgSend__FTCalls(self, a2, v2, v3, v4, 0);
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend_isVideo(v14, v7, v8, v9, v10) & 1) == 0)
        {
          int v15 = objc_msgSend_state(v14, v7, v8, v9, v10);
          if (v15 != 5 && v15 != 0)
          {
            id v11 = v14;
            goto LABEL_14;
          }
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v11);
  }
LABEL_14:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCallStateChange, 0);
  objc_storeStrong((id *)&self->_guidToAVChatProxyMap, 0);
  objc_storeStrong((id *)&self->_guidToACChatProxyMap, 0);
  objc_storeStrong((id *)&self->_avChatProxyArray, 0);
  objc_storeStrong((id *)&self->_acChatProxyArray, 0);
  objc_storeStrong((id *)&self->_chatArray, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
}

@end