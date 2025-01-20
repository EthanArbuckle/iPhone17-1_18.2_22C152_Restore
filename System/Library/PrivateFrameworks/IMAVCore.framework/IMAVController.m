@interface IMAVController
+ (id)sharedInstance;
- (BOOL)_ready;
- (BOOL)_shouldObserveConferences;
- (BOOL)_shouldRunACConferences;
- (BOOL)_shouldRunConferences;
- (BOOL)blockIncomingInvitationsDuringCall;
- (BOOL)blockMultipleIncomingInvitations;
- (BOOL)blockOutgoingInvitationsDuringCall;
- (BOOL)cameraCapable;
- (BOOL)cameraConnected;
- (BOOL)hasActiveConference;
- (BOOL)hasRunningConference;
- (BOOL)microphoneCapable;
- (BOOL)microphoneConnected;
- (IMAVController)init;
- (IMAVControllerDelegate)delegate;
- (NSArray)delegates;
- (NSMutableArray)_delegates;
- (id)vcResponseInfoWithSessionID:(unsigned int)a3;
- (unsigned)overallChatState;
- (void)_dumpCaps;
- (void)_receivedPendingACRequests;
- (void)_receivedPendingVCRequests;
- (void)_setServiceVCCaps:(unint64_t)a3 toCaps:(unint64_t)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)blockOnPendingVCInvitationsWithCapabilities:(int64_t)a3;
- (void)cancelVCRequestWithBuddy:(id)a3 vcProps:(id)a4 forAccount:(id)a5 conferenceID:(id)a6 reason:(id)a7;
- (void)declineVCRequestWithBuddy:(id)a3 response:(unsigned int)a4 vcProps:(id)a5 conferenceID:(id)a6;
- (void)declineVCRequestWithBuddy:(id)a3 response:(unsigned int)a4 vcProps:(id)a5 forAccount:(id)a6 conferenceID:(id)a7;
- (void)pushCachedVCCapsToDaemon;
- (void)removeDelegate:(id)a3;
- (void)requestPendingACInvitations;
- (void)requestPendingVCInvitations;
- (void)setBlockIncomingInvitationsDuringCall:(BOOL)a3;
- (void)setBlockMultipleIncomingInvitations:(BOOL)a3;
- (void)setBlockOutgoingInvitationsDuringCall:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIMAVCapabilities:(int64_t)a3 toCaps:(int64_t)a4;
- (void)set_delegates:(id)a3;
- (void)setupIMAVController;
- (void)vcCapabilitiesChanged:(unint64_t)a3;
@end

@implementation IMAVController

- (BOOL)_shouldObserveConferences
{
  v5 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], a2, v2, v3, v4);
  BOOL v10 = (*MEMORY[0x263F4A640] & objc_msgSend_capabilities(v5, v6, v7, v8, v9)) != 0;

  return v10;
}

+ (id)sharedInstance
{
  if (qword_26AB79698 != -1) {
    dispatch_once(&qword_26AB79698, &unk_26D85A550);
  }
  uint64_t v2 = (void *)qword_26AB796C8;
  return v2;
}

- (BOOL)_shouldRunConferences
{
  v5 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], a2, v2, v3, v4);
  BOOL v10 = (*MEMORY[0x263F4A650] & objc_msgSend_capabilities(v5, v6, v7, v8, v9)) != 0;

  return v10;
}

- (BOOL)_shouldRunACConferences
{
  v5 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], a2, v2, v3, v4);
  BOOL v10 = (*MEMORY[0x263F4A648] & objc_msgSend_capabilities(v5, v6, v7, v8, v9)) != 0;

  return v10;
}

- (void)setupIMAVController
{
  if (qword_26AB79690 != -1) {
    dispatch_once(&qword_26AB79690, &unk_26D85A570);
  }
  id v5 = (id)objc_msgSend_sharedInstance(IMAVTelephonyManager, a2, v2, v3, v4);
  id v10 = (id)objc_msgSend_sharedInstance(IMAVInterface, v6, v7, v8, v9);
}

- (IMAVController)init
{
  v20.receiver = self;
  v20.super_class = (Class)IMAVController;
  uint64_t v2 = [(IMAVController *)&v20 init];
  v6 = v2;
  if (v2)
  {
    objc_msgSend_setBlockIncomingInvitationsDuringCall_(v2, v3, 1, v4, v5);
    objc_msgSend_setBlockMultipleIncomingInvitations_(v6, v7, 1, v8, v9);
    objc_msgSend_setBlockOutgoingInvitationsDuringCall_(v6, v10, 1, v11, v12);
    uint64_t v17 = objc_msgSend_nonRetainingArray(MEMORY[0x263EFF980], v13, v14, v15, v16);
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v17;
  }
  return v6;
}

- (void)declineVCRequestWithBuddy:(id)a3 response:(unsigned int)a4 vcProps:(id)a5 conferenceID:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  objc_msgSend_account(v12, v13, v14, v15, v16);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(self, v17, (uint64_t)v12, v7, (uint64_t)v11, v18, v10);
}

- (id)vcResponseInfoWithSessionID:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF9A0];
    v6 = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a3, v3, v4);
    uint64_t v9 = objc_msgSend_dictionaryWithObject_forKey_(v5, v7, (uint64_t)v6, *MEMORY[0x263F4A740], v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)declineVCRequestWithBuddy:(id)a3 response:(unsigned int)a4 vcProps:(id)a5 forAccount:(id)a6 conferenceID:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = (__CFString *)a7;
  v22 = objc_msgSend_objectForKey_(a5, v15, *MEMORY[0x263F4A6B8], v16, v17);
  if (v22)
  {
    v23 = objc_msgSend_dictionaryWithPlistData_(NSDictionary, v18, (uint64_t)v22, v20, v21);
    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v23 = 0;
  if (!v13)
  {
LABEL_3:
    objc_msgSend_account(v12, v18, v19, v20, v21);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  v24 = objc_msgSend_objectForKey_(v23, v18, *MEMORY[0x263F4A740], v20, v21);
  uint64_t v29 = objc_msgSend_unsignedIntValue(v24, v25, v26, v27, v28);

  v33 = objc_msgSend_vcResponseInfoWithSessionID_(self, v30, v29, v31, v32);

  v38 = objc_msgSend_plistData(v33, v34, v35, v36, v37);

  id v39 = objc_alloc(NSDictionary);
  v43 = objc_msgSend_numberWithInt_(NSNumber, v40, v10, v41, v42);
  v47 = objc_msgSend_initWithObjectsAndKeys_(v39, v44, (uint64_t)v43, v45, v46, *MEMORY[0x263F4A728], v38, *MEMORY[0x263F4A730], 0);

  v48 = sub_224FB12A0();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ID(v12, v49, v50, v51, v52);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = v53;
    _os_log_impl(&dword_224F93000, v48, OS_LOG_TYPE_DEFAULT, "Sending decline to service for: %@", buf, 0xCu);
  }
  v54 = sub_224FB12A0();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v95 = v14;
    __int16 v96 = 2112;
    id v97 = v13;
    __int16 v98 = 2112;
    id v99 = v12;
    _os_log_impl(&dword_224F93000, v54, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);
  }

  v55 = sub_224FB12A0();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_loginStatusMessage(v13, v56, v57, v58, v59);
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = v60;
    _os_log_impl(&dword_224F93000, v55, OS_LOG_TYPE_DEFAULT, "        Account login status: %@", buf, 0xCu);
  }
  v61 = sub_224FB12A0();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_isActive(v13, v62, v63, v64, v65)) {
      v66 = @"YES";
    }
    else {
      v66 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v95 = v66;
    _os_log_impl(&dword_224F93000, v61, OS_LOG_TYPE_DEFAULT, "        Account active: %@", buf, 0xCu);
  }

  v67 = sub_224FB12A0();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v72 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v68, v69, v70, v71);
    if (objc_msgSend_isConnected(v72, v73, v74, v75, v76)) {
      v77 = @"YES";
    }
    else {
      v77 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v95 = v77;
    _os_log_impl(&dword_224F93000, v67, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);
  }
  v82 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v78, v79, v80, v81);
  v87 = objc_msgSend_ID(v12, v83, v84, v85, v86);
  v92 = objc_msgSend_uniqueID(v13, v88, v89, v90, v91);
  objc_msgSend_respondToVCInvitationWithPerson_properties_conference_account_(v82, v93, (uint64_t)v87, (uint64_t)v47, (uint64_t)v14, v92);
}

- (void)cancelVCRequestWithBuddy:(id)a3 vcProps:(id)a4 forAccount:(id)a5 conferenceID:(id)a6 reason:(id)a7
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (__CFString *)a6;
  id v79 = a7;
  if (!v13)
  {
    objc_msgSend_account(v11, v15, v16, v17, v18);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v19 = objc_msgSend_objectForKey_(v12, v15, *MEMORY[0x263F4A740], v17, v18);
  unsigned int v80 = objc_msgSend_unsignedIntValue(v19, v20, v21, v22, v23);

  v24 = sub_224FB12A0();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ID(v11, v25, v26, v27, v28);
    uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v83 = v29;
    _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "Sending cancel to service for: %@", buf, 0xCu);
  }
  v30 = sub_224FB12A0();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v83 = v14;
    __int16 v84 = 2112;
    id v85 = v13;
    __int16 v86 = 2112;
    id v87 = v11;
    _os_log_impl(&dword_224F93000, v30, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);
  }

  uint64_t v31 = sub_224FB12A0();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_loginStatusMessage(v13, v32, v33, v34, v35);
    uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v83 = v36;
    _os_log_impl(&dword_224F93000, v31, OS_LOG_TYPE_DEFAULT, "        Account login status: %@", buf, 0xCu);
  }
  uint64_t v37 = sub_224FB12A0();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_isActive(v13, v38, v39, v40, v41)) {
      uint64_t v42 = @"YES";
    }
    else {
      uint64_t v42 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v83 = v42;
    _os_log_impl(&dword_224F93000, v37, OS_LOG_TYPE_DEFAULT, "        Account active: %@", buf, 0xCu);
  }

  v43 = sub_224FB12A0();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v48 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v44, v45, v46, v47);
    if (objc_msgSend_isConnected(v48, v49, v50, v51, v52)) {
      v53 = @"YES";
    }
    else {
      v53 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v83 = v53;
    _os_log_impl(&dword_224F93000, v43, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);
  }
  uint64_t v58 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v54, v55, v56, v57);
  uint64_t v63 = objc_msgSend_ID(v11, v59, v60, v61, v62);
  v67 = objc_msgSend_vcResponseInfoWithSessionID_(self, v64, v80, v65, v66);
  v72 = objc_msgSend_account(v11, v68, v69, v70, v71);
  v77 = objc_msgSend_uniqueID(v72, v73, v74, v75, v76);
  objc_msgSend_cancelVCRequestWithPerson_properties_conference_reason_account_(v58, v78, (uint64_t)v63, (uint64_t)v67, (uint64_t)v14, v79, v77);
}

- (NSArray)delegates
{
  return (NSArray *)self->_delegates;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v13 = a3;
  id v9 = a4;
  if (v13 && (objc_msgSend_containsObjectIdenticalTo_(self->_delegates, v6, (uint64_t)v13, v7, v8) & 1) == 0) {
    objc_msgSend_addObject_(self->_delegates, v10, (uint64_t)v13, v11, v12);
  }
}

- (void)removeDelegate:(id)a3
{
  if (a3) {
    objc_msgSend_removeObjectIdenticalTo_(self->_delegates, a2, (uint64_t)a3, v3, v4);
  }
}

- (IMAVControllerDelegate)delegate
{
  return (IMAVControllerDelegate *)objc_msgSend___imFirstObject(self->_delegates, a2, v2, v3, v4);
}

- (void)setDelegate:(id)a3
{
  id v12 = a3;
  objc_msgSend_delegate(self, v4, v5, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = v12;
  if (v8 != v12)
  {
    objc_msgSend_addDelegate_queue_(self, v9, (uint64_t)v12, MEMORY[0x263EF83A0], v10);
    uint64_t v11 = v12;
  }
}

- (void)_dumpCaps
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_hasRunningConference(self, v4, v5, v6, v7)) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    int v39 = 138412290;
    uint64_t v40 = v8;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "     has running conference: %@", (uint8_t *)&v39, 0xCu);
  }

  id v9 = sub_224FB12A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_hasActiveConference(self, v10, v11, v12, v13)) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    int v39 = 138412290;
    uint64_t v40 = v14;
    _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "      has active conference: %@", (uint8_t *)&v39, 0xCu);
  }

  uint64_t v15 = sub_224FB12A0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_cameraConnected(self, v16, v17, v18, v19)) {
      uint64_t v20 = @"YES";
    }
    else {
      uint64_t v20 = @"NO";
    }
    int v39 = 138412290;
    uint64_t v40 = v20;
    _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "           camera connected: %@", (uint8_t *)&v39, 0xCu);
  }

  uint64_t v21 = sub_224FB12A0();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_cameraCapable(self, v22, v23, v24, v25)) {
      uint64_t v26 = @"YES";
    }
    else {
      uint64_t v26 = @"NO";
    }
    int v39 = 138412290;
    uint64_t v40 = v26;
    _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "             camera capable: %@", (uint8_t *)&v39, 0xCu);
  }

  uint64_t v27 = sub_224FB12A0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_microphoneCapable(self, v28, v29, v30, v31)) {
      uint64_t v32 = @"YES";
    }
    else {
      uint64_t v32 = @"NO";
    }
    int v39 = 138412290;
    uint64_t v40 = v32;
    _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "         microphone capable: %@", (uint8_t *)&v39, 0xCu);
  }

  uint64_t v33 = sub_224FB12A0();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_microphoneConnected(self, v34, v35, v36, v37)) {
      v38 = @"YES";
    }
    else {
      v38 = @"NO";
    }
    int v39 = 138412290;
    uint64_t v40 = v38;
    _os_log_impl(&dword_224F93000, v33, OS_LOG_TYPE_DEFAULT, "       microphone connected: %@", (uint8_t *)&v39, 0xCu);
  }
}

- (void)_setServiceVCCaps:(unint64_t)a3 toCaps:(unint64_t)a4
{
  uint64_t v5 = (qword_26AB79680 & ~a3 | a4) & 0x1F0000 | 0x100000020000;
  qword_26AB79680 = v5;
  if (!qword_26AB79688) {
    qword_26AB79688 = v5;
  }
  objc_msgSend__dumpCaps(self, a2, a3, a4, v4);
  uint64_t v10 = objc_msgSend__nonFinalChat(IMAVChat, v6, v7, v8, v9);

  if (!v10) {
    qword_26AB79680 = qword_26AB79680 & 0xFFFFFFFFFFEEFFFFLL | 0x100000;
  }
  objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v11, v12, v13, v14);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVCCapabilities_(v18, v15, qword_26AB79680, v16, v17);
}

- (void)setIMAVCapabilities:(int64_t)a3 toCaps:(int64_t)a4
{
  uint64x2_t v5 = (uint64x2_t)vdupq_n_s64(a3);
  int8x16_t v6 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_224FD27F0), (int8x16_t)xmmword_224FD2820), vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_224FD2800), (int8x16_t)xmmword_224FD2810));
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(a4);
  uint64_t v8 = (uint64_t)vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
  int8x16_t v9 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v7, (uint64x2_t)xmmword_224FD27F0), (int8x16_t)xmmword_224FD2820), vandq_s8((int8x16_t)vshlq_u64(v7, (uint64x2_t)xmmword_224FD2800), (int8x16_t)xmmword_224FD2810));
  objc_msgSend__setServiceVCCaps_toCaps_(self, a2, v8, *(void *)&vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), v4);
}

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  if (objc_msgSend__shouldRunConferences(self, a2, a3, v3, v4)) {
    LOBYTE(v11) = 0;
  }
  else {
    int v11 = objc_msgSend__shouldRunACConferences(self, v7, v8, v9, v10) ^ 1;
  }
  if (objc_msgSend__shouldObserveConferences(self, v7, v8, v9, v10))
  {
    if (qword_26AB79680) {
      char v16 = v11;
    }
    else {
      char v16 = 1;
    }
    if (v16) {
      goto LABEL_9;
    }
  }
  else if (!qword_26AB79680)
  {
LABEL_9:
    qword_26AB79680 = a3;
  }
  if (qword_26AB79688 != a3)
  {
    qword_26AB79688 = a3;
    if ((objc_msgSend__shouldRunConferences(self, v12, v13, v14, v15) & 1) != 0
      || (objc_msgSend__shouldRunACConferences(self, v17, v18, v19, v20) & 1) != 0
      || objc_msgSend__shouldObserveConferences(self, v17, v18, v19, v20))
    {
      uint64_t v21 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v17, v18, v19, v20);
      uint64_t v25 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v22, qword_26AB79680 | 0x100000, v23, v24);
      objc_msgSend_setObject_forKey_(v21, v26, (uint64_t)v25, @"CachedVCCaps", v27);
    }
    objc_msgSend__dumpCaps(self, v17, v18, v19, v20);
    objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v28, v29, v30, v31);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v34, v32, @"VideoCapabilitesChangedNotification", 0, v33);
  }
}

- (void)pushCachedVCCapsToDaemon
{
  objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2, v3, v4);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_objectForKey_(v32, v6, @"CachedVCCaps", v7, v8);
  uint64_t v14 = v9;
  uint64_t v15 = qword_26AB79680;
  if (qword_26AB79680) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v9 == 0;
  }
  if (v16)
  {
    if (!qword_26AB79680) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12, v13) | 0x100000;
  }
  objc_msgSend__setServiceVCCaps_toCaps_(self, v10, 2031616, v15, v13);
  uint64_t v21 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v17, v18, v19, v20);
  objc_msgSend___mainThreadPostNotificationName_object_(v21, v22, @"VideoCapabilitesChangedNotification", 0, v23);

  uint64_t v28 = objc_msgSend_sharedInstance(IMAVController, v24, v25, v26, v27);
  objc_msgSend_vcCapabilitiesChanged_(v28, v29, v15, v30, v31);

LABEL_8:
}

- (unsigned)overallChatState
{
  uint64x2_t v5 = objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  unsigned int v10 = objc_msgSend__callState(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)cameraConnected
{
  return (BYTE2(qword_26AB79680) >> 2) & 1;
}

- (BOOL)microphoneConnected
{
  return (BYTE2(qword_26AB79680) >> 3) & 1;
}

- (BOOL)hasActiveConference
{
  uint64x2_t v5 = objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  if (objc_msgSend__hasActiveFaceTimeCall(v5, v6, v7, v8, v9))
  {
    char v14 = 1;
  }
  else
  {
    uint64_t v15 = objc_msgSend_sharedInstance(IMAVCallManager, v10, v11, v12, v13);
    char v14 = objc_msgSend__hasActiveAudioCall(v15, v16, v17, v18, v19);
  }
  return v14;
}

- (BOOL)hasRunningConference
{
  uint64x2_t v5 = objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  unsigned int v10 = objc_msgSend__callState(v5, v6, v7, v8, v9);

  return v10 > 1 && v10 != 5;
}

- (BOOL)cameraCapable
{
  return (BYTE2(qword_26AB79688) >> 2) & 1;
}

- (BOOL)microphoneCapable
{
  return (BYTE2(qword_26AB79688) >> 3) & 1;
}

- (void)requestPendingVCInvitations
{
  if (objc_msgSend__shouldRunConferences(self, a2, v2, v3, v4))
  {
    objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v5, v6, v7, v8);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestPendingVCInvites(v13, v9, v10, v11, v12);
  }
}

- (void)requestPendingACInvitations
{
  if (objc_msgSend__shouldRunACConferences(self, a2, v2, v3, v4))
  {
    objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v5, v6, v7, v8);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestPendingACInvites(v13, v9, v10, v11, v12);
  }
}

- (BOOL)_ready
{
  return qword_26AB79680 != 0;
}

- (void)_receivedPendingACRequests
{
  byte_2680BEF48 = 1;
  uint64_t v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Got pending AC requests flushed", v3, 2u);
  }
}

- (void)_receivedPendingVCRequests
{
  byte_2680BEF49 = 1;
  uint64_t v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Got pending VC requests flushed", v3, 2u);
  }
}

- (void)blockOnPendingVCInvitationsWithCapabilities:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], a2, a3, v3, v4);
  char isConnected = objc_msgSend_isConnected(v6, v7, v8, v9, v10);

  if ((isConnected & 1) == 0)
  {
    int shouldRunACConferences = objc_msgSend__shouldRunACConferences(self, v12, v13, v14, v15);
    int shouldRunConferences = objc_msgSend__shouldRunConferences(self, v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v22, v23, v24, v25);
    objc_msgSend_blockUntilConnected(v26, v27, v28, v29, v30);

    if (shouldRunACConferences)
    {
      uint64_t v35 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v31, v32, v33, v34);
      objc_msgSend_addObserver_selector_name_object_(v35, v36, (uint64_t)self, (uint64_t)sel__receivedPendingACRequests, @"__kIMAVControllerPendingACInvitationRequestComplete", 0);
    }
    int v37 = shouldRunACConferences;
    if (shouldRunConferences)
    {
      v38 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v31, v32, v33, v34);
      objc_msgSend_addObserver_selector_name_object_(v38, v39, (uint64_t)self, (uint64_t)sel__receivedPendingVCRequests, @"__kIMAVControllerPendingAVInvitationRequestComplete", 0);

      int v37 = 1;
    }
    uint64_t v40 = objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v31, v32, v33, v34);
    id v41 = objc_alloc_init(MEMORY[0x263EFF910]);
    uint64_t v42 = sub_224FB12A0();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v42, OS_LOG_TYPE_DEFAULT, "Starting block for VC invitations", buf, 2u);
    }

    byte_2680BEF48 = 0;
    byte_2680BEF49 = 0;
    if (shouldRunACConferences)
    {
      uint64_t v47 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v43, v44, v45, v46);
      objc_msgSend_requestPendingACInvites(v47, v48, v49, v50, v51);
    }
    uint64_t v74 = self;
    if (shouldRunConferences)
    {
      uint64_t v52 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v43, v44, v45, v46);
      objc_msgSend_requestPendingVCInvites(v52, v53, v54, v55, v56);
    }
    int v57 = v37 ^ 1;
    uint64_t v58 = *MEMORY[0x263F4A4E8];
    int v59 = shouldRunConferences ^ 1;
    while (1)
    {
      int v60 = shouldRunACConferences & (byte_2680BEF48 ^ 1);
      if ((v60 | v59))
      {
        int v61 = v60 | shouldRunConferences;
      }
      else
      {
        int v61 = shouldRunConferences;
        if (byte_2680BEF49) {
          break;
        }
      }
      int v62 = v61 ^ 1;
      if (((v62 | v57) & 1) == 0)
      {
        uint64_t v63 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v43, v44, v45, v46, 2.0);
        objc_msgSend_runMode_beforeDate_(v40, v64, v58, (uint64_t)v63, v65);

        int v66 = shouldRunACConferences & (byte_2680BEF48 ^ 1);
        if ((v66 | v59))
        {
          int v62 = (v66 | shouldRunConferences) ^ 1;
        }
        else
        {
          if (byte_2680BEF49) {
            break;
          }
          int v62 = 0;
        }
      }
      if ((v62 | v57)) {
        break;
      }
      objc_msgSend_timeIntervalSinceNow(v41, v43, v44, v45, v46);
      if (v67 <= -2.0)
      {
        v68 = sub_224FB12A0();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v76 = 0;
          _os_log_impl(&dword_224F93000, v68, OS_LOG_TYPE_DEFAULT, "Timed out blocking for VC invitiations", v76, 2u);
        }

        break;
      }
    }
    if (shouldRunACConferences)
    {
      uint64_t v69 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v43, v44, v45, v46);
      objc_msgSend_removeObserver_name_object_(v69, v70, (uint64_t)v74, @"__kIMAVControllerPendingACInvitationRequestComplete", 0);
    }
    if (shouldRunConferences)
    {
      uint64_t v71 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v43, v44, v45, v46);
      objc_msgSend_removeObserver_name_object_(v71, v72, (uint64_t)v74, @"__kIMAVControllerPendingAVInvitationRequestComplete", 0);
    }
    v73 = sub_224FB12A0();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v75 = 0;
      _os_log_impl(&dword_224F93000, v73, OS_LOG_TYPE_DEFAULT, "Complete block for VC invitations", v75, 2u);
    }
  }
}

- (NSMutableArray)_delegates
{
  return self->_delegates;
}

- (void)set_delegates:(id)a3
{
}

- (BOOL)blockMultipleIncomingInvitations
{
  return self->_blockMultipleIncomingInvitations;
}

- (void)setBlockMultipleIncomingInvitations:(BOOL)a3
{
  self->_blockMultipleIncomingInvitations = a3;
}

- (BOOL)blockOutgoingInvitationsDuringCall
{
  return self->_blockOutgoingInvitationsDuringCall;
}

- (void)setBlockOutgoingInvitationsDuringCall:(BOOL)a3
{
  self->_blockOutgoingInvitationsDuringCall = a3;
}

- (BOOL)blockIncomingInvitationsDuringCall
{
  return self->_blockIncomingInvitationsDuringCall;
}

- (void)setBlockIncomingInvitationsDuringCall:(BOOL)a3
{
  self->_blockIncomingInvitationsDuringCall = a3;
}

- (void).cxx_destruct
{
}

@end