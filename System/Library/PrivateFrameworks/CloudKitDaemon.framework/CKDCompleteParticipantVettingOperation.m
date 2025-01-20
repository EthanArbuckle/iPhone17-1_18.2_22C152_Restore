@interface CKDCompleteParticipantVettingOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDCompleteParticipantVettingOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKShareMetadata)shareMetadata;
- (NSData)encryptedKey;
- (NSString)baseToken;
- (NSString)displayedHostname;
- (NSString)routingKey;
- (NSString)shortToken;
- (NSString)vettingEmail;
- (NSString)vettingPhone;
- (NSString)vettingToken;
- (id)activityCreate;
- (id)shortSharingTokenFromData:(id)a3;
- (id)shortSharingTokenFromFullToken:(id)a3;
- (id)verifyProgressShareMetadataFetchedBlock;
- (id)verifyProgressURLReconstructedBlock;
- (void)_forceFetchShareMetadata;
- (void)_performAuthKitVerification;
- (void)_reconstructShareURL;
- (void)_reconstructShortToken;
- (void)_verifyOONParticipant;
- (void)main;
- (void)setShareMetadata:(id)a3;
- (void)setShortToken:(id)a3;
- (void)setVerifyProgressShareMetadataFetchedBlock:(id)a3;
- (void)setVerifyProgressURLReconstructedBlock:(id)a3;
@end

@implementation CKDCompleteParticipantVettingOperation

- (CKDCompleteParticipantVettingOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CKDCompleteParticipantVettingOperation;
  v9 = [(CKDOperation *)&v58 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_vettingToken(v6, v7, v8);
    uint64_t v13 = objc_msgSend_copy(v10, v11, v12);
    vettingToken = v9->_vettingToken;
    v9->_vettingToken = (NSString *)v13;

    v17 = objc_msgSend_vettingEmail(v6, v15, v16);
    uint64_t v20 = objc_msgSend_copy(v17, v18, v19);
    vettingEmail = v9->_vettingEmail;
    v9->_vettingEmail = (NSString *)v20;

    v24 = objc_msgSend_vettingPhone(v6, v22, v23);
    uint64_t v27 = objc_msgSend_copy(v24, v25, v26);
    vettingPhone = v9->_vettingPhone;
    v9->_vettingPhone = (NSString *)v27;

    v31 = objc_msgSend_routingKey(v6, v29, v30);
    uint64_t v34 = objc_msgSend_copy(v31, v32, v33);
    routingKey = v9->_routingKey;
    v9->_routingKey = (NSString *)v34;

    v38 = objc_msgSend_encryptedKey(v6, v36, v37);
    uint64_t v41 = objc_msgSend_copy(v38, v39, v40);
    encryptedKey = v9->_encryptedKey;
    v9->_encryptedKey = (NSData *)v41;

    v45 = objc_msgSend_baseToken(v6, v43, v44);
    uint64_t v48 = objc_msgSend_copy(v45, v46, v47);
    baseToken = v9->_baseToken;
    v9->_baseToken = (NSString *)v48;

    v52 = objc_msgSend_displayedHostname(v6, v50, v51);
    uint64_t v55 = objc_msgSend_copy(v52, v53, v54);
    displayedHostname = v9->_displayedHostname;
    v9->_displayedHostname = (NSString *)v55;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/verify-share-vetting", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__reconstructShortToken(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__performAuthKitVerification(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__forceFetchShareMetadata(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__reconstructShareURL(self, v11, v12);
      break;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__verifyOONParticipant(self, v13, v14);
      break;
    case 6:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      v17 = objc_msgSend_error(self, v15, v16);
      objc_msgSend_finishWithError_(self, v18, (uint64_t)v17);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  v4 = @"Vetting with AuthKit";
  switch(a3)
  {
    case 1uLL:
      objc_msgSendSuper2(&v8, sel_nameForState_, 1, v6.receiver, v6.super_class, v7.receiver, v7.super_class, a1, &OBJC_METACLASS___CKDCompleteParticipantVettingOperation);
      goto LABEL_10;
    case 2uLL:
      v4 = @"Reconstructing short token";
      break;
    case 3uLL:
      break;
    case 4uLL:
      v4 = @"Force fetching share metadata";
      break;
    case 5uLL:
      v4 = @"Reconstructing share URL";
      break;
    case 6uLL:
      v4 = @"Verifying OON key can be swapped";
      break;
    default:
      if (a3 == 0xFFFFFFFF) {
        objc_msgSendSuper2(&v7, sel_nameForState_, 0xFFFFFFFFLL, v6.receiver, v6.super_class, a1, &OBJC_METACLASS___CKDCompleteParticipantVettingOperation, v8.receiver, v8.super_class);
      }
      else {
        objc_msgSendSuper2(&v6, sel_nameForState_, a3, a1, &OBJC_METACLASS___CKDCompleteParticipantVettingOperation, v7.receiver, v7.super_class, v8.receiver, v8.super_class);
      }
LABEL_10:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (id)shortSharingTokenFromFullToken:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v6 = (const void *)objc_msgSend_UTF8String(v3, v4, v5, 0, 0, 0, 0);
  CC_LONG v8 = objc_msgSend_lengthOfBytesUsingEncoding_(v3, v7, 4);

  CC_SHA256(v6, v8, (unsigned __int8 *)&v15);
  uint64_t v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v9, (uint64_t)&v15, 16);
  uint64_t v13 = objc_msgSend_CKBase64URLSafeString(v10, v11, v12);

  return v13;
}

- (id)shortSharingTokenFromData:(id)a3
{
  return (id)objc_msgSend_CKBase64URLSafeString(a3, a2, (uint64_t)a3);
}

- (void)_reconstructShortToken
{
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_1C4DFE9A8;
  v30[4] = sub_1C4DFE9B8;
  id v31 = 0;
  v4 = objc_msgSend_container(self, a2, v2);
  objc_super v7 = objc_msgSend_account(v4, v5, v6);
  uint64_t v10 = objc_msgSend_accountType(v7, v8, v9);

  if (v10 == 1)
  {
    uint64_t v12 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 1002, @"This request requires an authenticated account");
    objc_msgSend_setError_(self, v13, (uint64_t)v12);
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v16 = objc_msgSend_stateTransitionGroup(self, v14, v15);
    dispatch_group_enter(v16);

    uint64_t v19 = objc_msgSend_container(self, v17, v18);
    v22 = objc_msgSend_pcsManager(v19, v20, v21);
    v25 = objc_msgSend_encryptedKey(self, v23, v24);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1C4DFE9C0;
    v27[3] = &unk_1E64F3680;
    objc_copyWeak(&v28, &location);
    v27[4] = self;
    v27[5] = v30;
    objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v22, v26, (uint64_t)v25, 0, 2, v27);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(v30, 8);
}

- (void)_performAuthKitVerification
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v4 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    CC_LONG v8 = objc_msgSend_vettingToken(self, v6, v7);
    v11 = objc_msgSend_container(self, v9, v10);
    uint64_t v14 = objc_msgSend_account(v11, v12, v13);
    v17 = objc_msgSend_accountID(v14, v15, v16);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_INFO, "Performing vetting on token: %{public}@, for: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v43 = sub_1C4DFE9A8;
  uint64_t v44 = sub_1C4DFE9B8;
  uint64_t v18 = self;
  v45 = v18;
  uint64_t v21 = objc_msgSend_stateTransitionGroup(v18, v19, v20);
  dispatch_group_enter(v21);

  uint64_t v24 = objc_msgSend_container(v18, v22, v23);
  uint64_t v27 = objc_msgSend_account(v24, v25, v26);
  uint64_t v30 = objc_msgSend_vettingToken(v18, v28, v29);
  uint64_t v33 = objc_msgSend_vettingEmail(v18, v31, v32);
  v36 = objc_msgSend_vettingPhone(v18, v34, v35);
  v39 = objc_msgSend_container(v18, v37, v38);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1C4DFF03C;
  v41[3] = &unk_1E64F36A8;
  v41[4] = v18;
  v41[5] = buf;
  v41[6] = a2;
  objc_msgSend_validateVettingToken_vettingEmail_vettingPhone_container_completionHandler_(v27, v40, (uint64_t)v30, v33, v36, v39, v41);

  _Block_object_dispose(buf, 8);
}

- (void)_forceFetchShareMetadata
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = NSString;
  uint64_t v6 = *MEMORY[0x1E4F1A5C0];
  uint64_t v9 = objc_msgSend_routingKey(self, v7, v8);
  uint64_t v12 = objc_msgSend_shortToken(self, v10, v11);
  uint64_t v14 = objc_msgSend_stringWithFormat_(v5, v13, @"https://%@/share/%@%@", v6, v9, v12);
  uint64_t v16 = objc_msgSend_URLWithString_(v4, v15, (uint64_t)v14);

  v24[0] = v16;
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v24, 1);
  objc_msgSend_setShareURLsToFetch_(v3, v19, (uint64_t)v18);

  objc_msgSend_setShouldFetchRootRecord_(v3, v20, 0);
  uint64_t v21 = objc_opt_class();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1C4DFF404;
  v23[3] = &unk_1E64F0210;
  v23[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v22, v21, v3, v23);
}

- (void)_reconstructShareURL
{
  v4 = objc_msgSend_shareMetadata(self, a2, v2);
  uint64_t v7 = objc_msgSend_share(v4, v5, v6);
  objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x1E4F19DC8]);
  id v42 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = objc_msgSend_shareMetadata(self, v9, v10);
  uint64_t v14 = objc_msgSend_share(v11, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, *MEMORY[0x1E4F19DD0]);

  uint64_t v19 = objc_msgSend_container(self, v17, v18);
  v22 = objc_msgSend_containerID(v19, v20, v21);

  uint64_t v23 = (void *)MEMORY[0x1E4F1A2D8];
  uint64_t v24 = NSString;
  uint64_t v27 = objc_msgSend_routingKey(self, v25, v26);
  uint64_t v30 = objc_msgSend_shortToken(self, v28, v29);
  uint64_t v32 = objc_msgSend_stringWithFormat_(v24, v31, @"%@%@", v27, v30);
  uint64_t v35 = objc_msgSend_displayedHostname(self, v33, v34);
  uint64_t v37 = objc_msgSend_shareURLWithShortToken_shareTitle_shareType_containerID_displayedHostname_(v23, v36, (uint64_t)v32, v42, v16, v22, v35);

  uint64_t v40 = objc_msgSend_verifyProgressURLReconstructedBlock(self, v38, v39);
  uint64_t v41 = (void *)v40;
  if (v40) {
    (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v37);
  }
}

- (void)_verifyOONParticipant
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_shareMetadata(self, a2, v2);
  uint64_t v8 = objc_msgSend_callingParticipant(v5, v6, v7);
  uint64_t v11 = objc_msgSend_privateToken(v5, v9, v10);
  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v14 = (void *)v11;
  uint64_t v15 = objc_msgSend_callingParticipant(v5, v12, v13);
  uint64_t v18 = objc_msgSend_userIdentity(v15, v16, v17);
  uint64_t v21 = objc_msgSend_outOfNetworkPrivateKey(v18, v19, v20);

  if (v21)
  {
    SEL v89 = a2;
    v92 = v8;
    uint64_t v24 = objc_msgSend_container(self, v22, v23);
    uint64_t v27 = objc_msgSend_pcsManager(v24, v25, v26);
    uint64_t v30 = objc_msgSend_callingParticipant(v5, v28, v29);
    objc_msgSend_userIdentity(v30, v31, v32);
    uint64_t v33 = v90 = self;
    v36 = objc_msgSend_outOfNetworkPrivateKey(v33, v34, v35);
    uint64_t v39 = objc_msgSend_privateToken(v5, v37, v38);
    id v42 = objc_msgSend_callingParticipant(v5, v40, v41);
    v45 = objc_msgSend_protectionInfo(v42, v43, v44);
    id v97 = 0;
    uint64_t v47 = objc_msgSend_createProtectionInfoFromOONPrivateKey_privateToken_OONProtectionInfo_error_(v27, v46, (uint64_t)v36, v39, v45, &v97);
    id v91 = v97;

    if (v47)
    {
      v50 = objc_msgSend_stateTransitionGroup(v90, v48, v49);
      dispatch_group_enter(v50);

      v53 = objc_msgSend_container(v90, v51, v52);
      v56 = objc_msgSend_pcsManager(v53, v54, v55);
      v59 = objc_msgSend_share(v5, v57, v58);
      v62 = objc_msgSend_invitedProtectionData(v59, v60, v61);
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = sub_1C4DFFF88;
      v93[3] = &unk_1E64F3720;
      SEL v96 = v89;
      v93[4] = v90;
      uint64_t v8 = v92;
      id v94 = v92;
      id v95 = v5;
      objc_msgSend_canDecryptInvitedProtectionData_participantProtectionInfo_serviceType_completionHandler_(v56, v63, (uint64_t)v62, v47, 2, v93);

      v64 = v91;
    }
    else
    {
      v64 = v91;
      uint64_t v8 = v92;
      if (!v91)
      {
        v87 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v48, v49);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v87, v88, (uint64_t)v89, v90, @"CKDCompleteParticipantVettingOperation.m", 290, @"OON key-swap failed, but without error");
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v73 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        v77 = v73;
        objc_msgSend_participantID(v92, v78, v79);
        v80 = (char *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend_share(v5, v81, v82);
        v86 = objc_msgSend_recordID(v83, v84, v85);
        *(_DWORD *)buf = 138412802;
        v99 = v80;
        __int16 v100 = 2112;
        v101 = v86;
        __int16 v102 = 2112;
        id v103 = v91;
        _os_log_error_impl(&dword_1C4CFF000, v77, OS_LOG_TYPE_ERROR, "Failed to create protection info in OON key-swap for participantID: %@, recordID: %@, error: %@", buf, 0x20u);
      }
      v75 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v74, *MEMORY[0x1E4F19DD8], 8009, v91, @"Dryrun OON keyswap failed");
      objc_msgSend_setError_(v90, v76, (uint64_t)v75);
    }
  }
  else
  {
LABEL_5:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v65 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v67 = v65;
      v70 = objc_msgSend_privateToken(v5, v68, v69);
      v71 = "outOfNetworkPrivateKey";
      if (!v70) {
        v71 = "privateToken";
      }
      *(_DWORD *)buf = 136315138;
      v99 = v71;
      _os_log_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_INFO, "OON keyswap: Not swapping OON keys as %s is missing", buf, 0xCu);
    }
    v64 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v66, *MEMORY[0x1E4F19DD8], 8009, @"We don't have the necessary keys to perform an OON key swap");
    objc_msgSend_setError_(self, v72, (uint64_t)v64);
  }
}

- (void)main
{
  v4 = objc_msgSend_vettingToken(self, a2, v2);
  BOOL v5 = v4 == 0;

  objc_msgSend_makeStateTransition_(self, v6, v5);
}

- (id)verifyProgressURLReconstructedBlock
{
  return self->_verifyProgressURLReconstructedBlock;
}

- (void)setVerifyProgressURLReconstructedBlock:(id)a3
{
}

- (id)verifyProgressShareMetadataFetchedBlock
{
  return self->_verifyProgressShareMetadataFetchedBlock;
}

- (void)setVerifyProgressShareMetadataFetchedBlock:(id)a3
{
}

- (NSString)vettingToken
{
  return self->_vettingToken;
}

- (NSString)vettingEmail
{
  return self->_vettingEmail;
}

- (NSString)vettingPhone
{
  return self->_vettingPhone;
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (NSString)shortToken
{
  return self->_shortToken;
}

- (void)setShortToken:(id)a3
{
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_shortToken, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_vettingPhone, 0);
  objc_storeStrong((id *)&self->_vettingEmail, 0);
  objc_storeStrong((id *)&self->_vettingToken, 0);
  objc_storeStrong(&self->_verifyProgressShareMetadataFetchedBlock, 0);
  objc_storeStrong(&self->_verifyProgressURLReconstructedBlock, 0);
}

@end