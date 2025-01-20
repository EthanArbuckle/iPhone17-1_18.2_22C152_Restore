@interface CKDCodeFunctionInvokeOperation
+ (id)URLFromEntitlementString:(id)a3;
+ (id)entitlementURLForServiceName:(id)a3 container:(id)a4;
+ (id)nameForState:(unint64_t)a3;
+ (int64_t)isPredominatelyDownload;
- (BOOL)makeStateTransition;
- (BOOL)shouldFetchAssetContentInMemory;
- (BOOL)shouldSendRecordPCSKeys;
- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4;
- (CKDCodeFunctionInvokeOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDProtocolTranslator)translator;
- (CKDTrustedTargetKey)trustedTargetKey;
- (CKDTrustedTargetWrappedKey)trustedTargetWrappedKey;
- (NSArray)pccWrappedKeys;
- (NSArray)requestLocalEnvelopes;
- (NSArray)requestLocalSerializations;
- (NSArray)requestRecords;
- (NSArray)responseRecords;
- (NSData)attestationEntropy;
- (NSData)permittedRemoteMeasurement;
- (NSData)serializedArguments;
- (NSData)serializedResponse;
- (NSString)functionName;
- (NSString)serviceName;
- (NSString)trustedTargetDomain;
- (NSString)trustedTargetOID;
- (NSURL)resolvedBaseURL;
- (PCCKey)pccKey;
- (id)activityCreate;
- (id)encryptData:(id)a3;
- (id)initialResponseReceivedCallback;
- (id)recordFetchCommandBlock;
- (id)recordFetchCompletionBlock;
- (id)recordFetchProgressBlock;
- (id)replaceLocalSerializationsBlobs;
- (id)replaceWireSerializations;
- (int)operationType;
- (unint64_t)dataProtectionType;
- (void)_checkShouldSendRecordPCSKeys;
- (void)_getDeserializedRecords;
- (void)_getSerializedRequest;
- (void)_invokeFunction;
- (void)_invokeLocalFunction;
- (void)_postflightRecords;
- (void)_preflightRecords;
- (void)_prepareForProtectedCloudCompute;
- (void)_prepareForTrustedTargetEncryption;
- (void)main;
- (void)setAttestationEntropy:(id)a3;
- (void)setDataProtectionType:(unint64_t)a3;
- (void)setInitialResponseReceivedCallback:(id)a3;
- (void)setPccKey:(id)a3;
- (void)setPccWrappedKeys:(id)a3;
- (void)setPermittedRemoteMeasurement:(id)a3;
- (void)setRecordFetchCommandBlock:(id)a3;
- (void)setRecordFetchCompletionBlock:(id)a3;
- (void)setRecordFetchProgressBlock:(id)a3;
- (void)setReplaceLocalSerializationsBlobs:(id)a3;
- (void)setReplaceWireSerializations:(id)a3;
- (void)setRequestLocalEnvelopes:(id)a3;
- (void)setRequestLocalSerializations:(id)a3;
- (void)setRequestRecords:(id)a3;
- (void)setResolvedBaseURL:(id)a3;
- (void)setResponseRecords:(id)a3;
- (void)setSerializedArguments:(id)a3;
- (void)setSerializedResponse:(id)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
- (void)setShouldSendRecordPCSKeys:(BOOL)a3;
- (void)setTranslator:(id)a3;
- (void)setTrustedTargetDomain:(id)a3;
- (void)setTrustedTargetKey:(id)a3;
- (void)setTrustedTargetOID:(id)a3;
- (void)setTrustedTargetWrappedKey:(id)a3;
@end

@implementation CKDCodeFunctionInvokeOperation

- (CKDCodeFunctionInvokeOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)CKDCodeFunctionInvokeOperation;
  v10 = [(CKDDatabaseOperation *)&v63 initWithOperationInfo:v6 container:v7];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_serviceName(v6, v8, v9);
    serviceName = v10->_serviceName;
    v10->_serviceName = (NSString *)v11;

    uint64_t v15 = objc_msgSend_functionName(v6, v13, v14);
    functionName = v10->_functionName;
    v10->_functionName = (NSString *)v15;

    uint64_t v19 = objc_msgSend_requestLocalSerializations(v6, v17, v18);
    requestLocalSerializations = v10->_requestLocalSerializations;
    v10->_requestLocalSerializations = (NSArray *)v19;

    uint64_t v23 = objc_msgSend_requestLocalEnvelopes(v6, v21, v22);
    requestLocalEnvelopes = v10->_requestLocalEnvelopes;
    v10->_requestLocalEnvelopes = (NSArray *)v23;

    v10->_dataProtectionType = objc_msgSend_dataProtectionType(v6, v25, v26);
    uint64_t v29 = objc_msgSend_permittedRemoteMeasurement(v6, v27, v28);
    permittedRemoteMeasurement = v10->_permittedRemoteMeasurement;
    v10->_permittedRemoteMeasurement = (NSData *)v29;

    uint64_t v33 = objc_msgSend_trustedTargetDomain(v6, v31, v32);
    trustedTargetDomain = v10->_trustedTargetDomain;
    v10->_trustedTargetDomain = (NSString *)v33;

    uint64_t v37 = objc_msgSend_trustedTargetOID(v6, v35, v36);
    trustedTargetOID = v10->_trustedTargetOID;
    v10->_trustedTargetOID = (NSString *)v37;

    int shouldSendRecordPCSKeys = objc_msgSend_shouldSendRecordPCSKeys(v6, v39, v40);
    v10->_int shouldSendRecordPCSKeys = shouldSendRecordPCSKeys;
    if (shouldSendRecordPCSKeys)
    {
      v44 = objc_msgSend_deviceContext(v10, v42, v43);
      v47 = objc_msgSend_accountDataSecurityObserver(v44, v45, v46);
      v50 = objc_msgSend_account(v7, v48, v49);
      int v52 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v47, v51, (uint64_t)v50, 1);

      if (v52)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v53 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v59 = v53;
          v62 = objc_msgSend_operationID(v6, v60, v61);
          *(_DWORD *)buf = 138412290;
          v65 = v62;
          _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "Overriding shouldSendRecordPCSKeys to NO due to walrus enabled for operation %@", buf, 0xCu);
        }
        v10->_int shouldSendRecordPCSKeys = 0;
      }
    }
    v10->_shouldFetchAssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(v6, v42, v43);
    serializedResponse = v10->_serializedResponse;
    v10->_serializedResponse = 0;

    pccKey = v10->_pccKey;
    v10->_pccKey = 0;

    pccWrappedKeys = v10->_pccWrappedKeys;
    v10->_pccWrappedKeys = 0;

    attestationEntropy = v10->_attestationEntropy;
    v10->_attestationEntropy = 0;
  }
  return v10;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/ckcode-function-invoke", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 1101;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__checkShouldSendRecordPCSKeys(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__preflightRecords(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__getSerializedRequest(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      v13 = objc_msgSend_resolvedBaseURL(self, v11, v12);

      if (v13) {
        objc_msgSend__invokeLocalFunction(self, v14, v15);
      }
      else {
        objc_msgSend__invokeFunction(self, v14, v15);
      }
      break;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__getDeserializedRecords(self, v16, v17);
      break;
    case 6:
      objc_msgSend_setState_(self, v4, 7);
      objc_msgSend__postflightRecords(self, v18, v19);
      break;
    case 7:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      uint64_t v22 = objc_msgSend_error(self, v20, v21);
      objc_msgSend_finishWithError_(self, v23, (uint64_t)v22);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 6)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDCodeFunctionInvokeOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F6890[a3 - 2];
  }
  return v3;
}

- (id)encryptData:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_dataProtectionType(self, v5, v6);
  if (v7 == 2)
  {
    uint64_t v10 = objc_msgSend_trustedTargetKey(self, v8, v9);
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    uint64_t v10 = objc_msgSend_pccKey(self, v8, v9);
LABEL_5:
    uint64_t v12 = v10;
    v13 = objc_msgSend_encrypt_(v10, v11, (uint64_t)v4);

    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (void)_preflightRecords
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_requestLocalSerializations(self, a2, v2);
  uint64_t v6 = objc_msgSend_count(v3, v4, v5);

  if (!v6) {
    goto LABEL_19;
  }
  v105 = objc_opt_new();
  v106 = objc_opt_new();
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  objc_msgSend_requestLocalSerializations(self, v9, v10);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v110, v118, 16);
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = *(void *)v111;
  uint64_t v102 = *MEMORY[0x1E4F19DD8];
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v111 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v110 + 1) + 8 * i);
      id v16 = objc_alloc(MEMORY[0x1E4F28DC0]);
      id v109 = 0;
      uint64_t v18 = objc_msgSend_initForReadingFromData_error_(v16, v17, v15, &v109);
      id v20 = v109;
      if (!v18
        || (id v21 = objc_alloc(MEMORY[0x1E4F1A2D8]),
            (uint64_t v23 = objc_msgSend_initWithCoder_(v21, v22, (uint64_t)v18)) == 0))
      {
        if (!v20)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, v102, 1017, @"Invalid record archive: %@", v15);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_setError_(self, v19, (uint64_t)v20);
        goto LABEL_43;
      }
      objc_msgSend_addObject_(v105, v19, (uint64_t)v23);
      uint64_t v26 = objc_msgSend_recordID(v23, v24, v25);
      uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v106, v27, (uint64_t)v26);

      if (!v28)
      {
        v39 = objc_msgSend_recordID(v23, v29, v30);
        objc_msgSend_setObject_forKeyedSubscript_(v106, v40, (uint64_t)v23, v39);

        goto LABEL_16;
      }
      v31 = objc_msgSend_values(v23, v29, v30);
      v34 = objc_msgSend_values(v28, v32, v33);
      int isEqual = objc_msgSend_isEqual_(v31, v35, (uint64_t)v34);

      uint64_t v37 = (void *)*MEMORY[0x1E4F1A548];
      if (!isEqual)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v37);
        }
        v86 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v115 = v28;
          __int16 v116 = 2112;
          v117 = v23;
          _os_log_error_impl(&dword_1C4CFF000, v86, OS_LOG_TYPE_ERROR, "Trying to save two RecordTransports for the same record: recordA=%@ recordB=%@", buf, 0x16u);
        }
        v89 = (void *)MEMORY[0x1E4F1A280];
        v90 = objc_msgSend_recordID(v23, v87, v88);
        v92 = objc_msgSend_errorWithDomain_code_format_(v89, v91, v102, 1017, @"Cannot send two records for the same record ID in the same request: %@", v90);
        objc_msgSend_setError_(self, v93, (uint64_t)v92);

LABEL_43:
        return;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v37);
      }
      v38 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v115 = v23;
        _os_log_debug_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_DEBUG, "Coalescing identical request record: %@", buf, 0xCu);
      }
LABEL_16:
    }
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v110, v118, 16);
    if (v12) {
      continue;
    }
    break;
  }
LABEL_18:

  objc_msgSend_setRequestRecords_(self, v42, (uint64_t)v105);
  uint64_t v43 = objc_opt_new();
  uint64_t v46 = objc_msgSend_allValues(v106, v44, v45);
  objc_msgSend_setRecordsToSave_(v43, v47, (uint64_t)v46);

  objc_msgSend_setShouldModifyRecordsInDatabase_(v43, v48, 0);
  objc_msgSend_setAlwaysFetchPCSFromServer_(v43, v49, 1);
  objc_initWeak((id *)buf, self);
  uint64_t v50 = objc_opt_class();
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = sub_1C4F371F0;
  v107[3] = &unk_1E64F66E8;
  objc_copyWeak(&v108, (id *)buf);
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v51, v50, v43, v107);
  objc_destroyWeak(&v108);
  objc_destroyWeak((id *)buf);

LABEL_19:
  int v52 = objc_msgSend_requestLocalEnvelopes(self, v7, v8);
  uint64_t v55 = objc_msgSend_count(v52, v53, v54);

  if (!v55) {
    goto LABEL_31;
  }
  uint64_t v58 = objc_msgSend_dataProtectionType(self, v56, v57);
  switch(v58)
  {
    case 2:
      v67 = objc_msgSend_trustedTargetDomain(self, v56, v57);
      if (v67)
      {
        v68 = objc_msgSend_trustedTargetOID(self, v56, v57);
        BOOL v69 = v68 == 0;

        if (!v69) {
          goto LABEL_31;
        }
      }
      v70 = (void *)MEMORY[0x1E4F1A280];
      v71 = objc_msgSend_serviceName(self, v56, v57);
      v74 = objc_msgSend_functionName(self, v72, v73);
      v76 = objc_msgSend_errorWithDomain_code_format_(v70, v75, *MEMORY[0x1E4F19DD8], 1017, @"Request with protected envelopes and trusted target data protection type must have target domain and OID: %@.%@", v71, v74);
      objc_msgSend_setError_(self, v77, (uint64_t)v76);

      break;
    case 1:
      v78 = objc_msgSend_permittedRemoteMeasurement(self, v56, v57);
      BOOL v79 = v78 == 0;

      if (!v79) {
        goto LABEL_31;
      }
      v94 = (void *)MEMORY[0x1E4F1A280];
      v95 = objc_msgSend_serviceName(self, v56, v57);
      v98 = objc_msgSend_functionName(self, v96, v97);
      v100 = objc_msgSend_errorWithDomain_code_format_(v94, v99, *MEMORY[0x1E4F19DD8], 1017, @"Request with protected envelopes and SGX data protection type must have a permittedRemoteMeasurement: %@.%@", v95, v98);
      objc_msgSend_setError_(self, v101, (uint64_t)v100);

      break;
    case 0:
      v59 = (void *)MEMORY[0x1E4F1A280];
      v60 = objc_msgSend_serviceName(self, v56, v57);
      objc_super v63 = objc_msgSend_functionName(self, v61, v62);
      v65 = objc_msgSend_errorWithDomain_code_format_(v59, v64, *MEMORY[0x1E4F19DD8], 1017, @"Request has protected envelopes, but no data protection type: %@.%@", v60, v63);
      objc_msgSend_setError_(self, v66, (uint64_t)v65);

      return;
    default:
LABEL_31:
      uint64_t v80 = objc_msgSend_dataProtectionType(self, v56, v57);
      switch(v80)
      {
        case 2:
          objc_msgSend__prepareForTrustedTargetEncryption(self, v81, v82);
          break;
        case 1:
          objc_msgSend__prepareForProtectedCloudCompute(self, v81, v82);
          break;
        case 0:
          if (objc_msgSend_shouldSendRecordPCSKeys(self, v81, v82))
          {
            v84 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v83, *MEMORY[0x1E4F19DD8], 1017, @"Cannot set shouldSendRecordPCSKeys without data protection. Please specify a dataProtectionType on your operation.");
            objc_msgSend_setError_(self, v85, (uint64_t)v84);
          }
          break;
      }
      break;
  }
}

- (void)_prepareForProtectedCloudCompute
{
  id v4 = objc_msgSend_resolvedBaseURL(self, a2, v2);

  if (v4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v5 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      uint64_t v6 = "Not preparing for PCC because we have a base URL";
LABEL_6:
      _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = objc_alloc_init(PCCKey);
    objc_msgSend_setPccKey_(self, v8, (uint64_t)v7);

    if (*MEMORY[0x1E4F1A4E0]
      && (objc_msgSend_unitTestOverrides(self, v9, v10),
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v11, v12, @"SkipAttestation"),
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          int v16 = objc_msgSend_BOOLValue(v13, v14, v15),
          v13,
          v11,
          v16))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v5 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        uint64_t v6 = "Skipping PCC attestation because we were asked to";
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v17 = objc_opt_new();
      id v20 = objc_msgSend_serviceName(self, v18, v19);
      objc_msgSend_setServiceName_(v17, v21, (uint64_t)v20);

      objc_msgSend_setFunctionName_(v17, v22, 0);
      objc_initWeak(buf, self);
      uint64_t v23 = objc_opt_class();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1C4F376EC;
      v25[3] = &unk_1E64F66E8;
      objc_copyWeak(&v26, buf);
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v24, v23, v17, v25);
      objc_destroyWeak(&v26);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_prepareForTrustedTargetEncryption
{
  if (objc_msgSend_shouldSendRecordPCSKeys(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_stateTransitionGroup(self, v4, v5);
    dispatch_group_enter(v6);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v7 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "About to fetch public key for trusted target encryption", (uint8_t *)location, 2u);
    }
    uint64_t v8 = objc_alloc_init(CKDTrustedTargetKey);
    objc_msgSend_setTrustedTargetKey_(self, v9, (uint64_t)v8);

    objc_initWeak(location, self);
    uint64_t v10 = objc_opt_new();
    objc_msgSend_setType_(v10, v11, 1);
    uint64_t v12 = objc_opt_class();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C4F37FA0;
    v14[3] = &unk_1E64F6758;
    objc_copyWeak(&v15, location);
    v14[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v13, v12, v10, v14);
    objc_destroyWeak(&v15);

    objc_destroyWeak(location);
  }
}

- (void)_checkShouldSendRecordPCSKeys
{
  if (objc_msgSend_shouldSendRecordPCSKeys(self, a2, v2))
  {
    id v4 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v6 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_DEBUG, "Adopter set shouldSendRecordPCSKeys. Checking if we should actually do that.", buf, 2u);
    }
    if (objc_msgSend_dataProtectionType(self, v7, v8) == 2)
    {
      if (*v4 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Will check server configuration to see if we should send the record keys", buf, 2u);
      }
      uint64_t v12 = objc_msgSend_stateTransitionGroup(self, v10, v11);
      dispatch_group_enter(v12);

      id v15 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v13, v14);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_1C4F384A0;
      v17[3] = &unk_1E64F1CC8;
      v17[4] = self;
      objc_msgSend_configurationForOperation_completionHandler_(v15, v16, (uint64_t)self, v17);
    }
  }
}

- (void)_getSerializedRequest
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  if (objc_msgSend_shouldSendRecordPCSKeys(self, v4, v5)) {
    v68 = objc_opt_new();
  }
  else {
    v68 = 0;
  }
  uint64_t v8 = objc_msgSend_requestLocalEnvelopes(self, v6, v7);
  uint64_t v11 = objc_msgSend_count(v8, v9, v10);

  if (v11)
  {
    uint64_t v14 = objc_msgSend_requestLocalEnvelopes(self, v12, v13);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = sub_1C4F38C4C;
    v82[3] = &unk_1E64F6780;
    v82[4] = self;
    int v16 = objc_msgSend_CKMap_(v14, v15, (uint64_t)v82);
  }
  else
  {
    int v16 = 0;
  }
  uint64_t v17 = objc_msgSend_requestRecords(self, v12, v13);
  uint64_t v20 = objc_msgSend_count(v17, v18, v19);

  if (v20)
  {
    v67 = v16;
    uint64_t v23 = [CKDProtocolTranslator alloc];
    id v26 = objc_msgSend_container(self, v24, v25);
    uint64_t v29 = objc_msgSend_databaseScope(self, v27, v28);
    v31 = objc_msgSend_initWithContainer_databaseScope_(v23, v30, (uint64_t)v26, v29);

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v34 = objc_msgSend_requestRecords(self, v32, v33);
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v78, v83, 16);
    if (v36)
    {
      uint64_t v38 = v36;
      uint64_t v39 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v79 != v39) {
            objc_enumerationMutation(v34);
          }
          v41 = objc_msgSend_pRecordFromRecord_(v31, v37, *(void *)(*((void *)&v78 + 1) + 8 * i));
          v44 = objc_msgSend_data(v41, v42, v43);
          objc_msgSend_addObject_(v3, v45, (uint64_t)v44);
          if (objc_msgSend_shouldSendRecordPCSKeys(self, v46, v47))
          {
            uint64_t v50 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v48, v49);
            objc_msgSend_addObject_(v68, v51, (uint64_t)v50);
          }
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v78, v83, 16);
      }
      while (v38);
    }

    int v16 = v67;
  }
  int v52 = objc_msgSend_stateTransitionGroup(self, v21, v22);
  dispatch_group_enter(v52);

  dispatch_group_t v53 = dispatch_group_create();
  if (objc_msgSend_shouldSendRecordPCSKeys(self, v54, v55))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v58 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_DEBUG, "About to fetch PCS data for secure compute operation", buf, 2u);
    }
    uint64_t v61 = objc_msgSend_requestRecords(self, v59, v60);
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = sub_1C4F38C58;
    v73[3] = &unk_1E64F67D0;
    v74 = v53;
    v75 = self;
    id v76 = v68;
    objc_msgSend_enumerateObjectsUsingBlock_(v61, v62, (uint64_t)v73);
  }
  objc_super v63 = objc_msgSend_callbackQueue(self, v56, v57);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F39254;
  block[3] = &unk_1E64F0DF0;
  block[4] = self;
  id v70 = v3;
  id v71 = v68;
  id v72 = v16;
  id v64 = v16;
  id v65 = v68;
  id v66 = v3;
  dispatch_group_notify(v53, v63, block);
}

- (void)_invokeFunction
{
  id v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  uint64_t v5 = [CKDCodeFunctionInvokeURLRequest alloc];
  uint64_t v8 = objc_msgSend_serviceName(self, v6, v7);
  uint64_t v11 = objc_msgSend_functionName(self, v9, v10);
  uint64_t v14 = objc_msgSend_serializedArguments(self, v12, v13);
  uint64_t v17 = objc_msgSend_attestationEntropy(self, v15, v16);
  uint64_t v20 = objc_msgSend_pccWrappedKeys(self, v18, v19);
  uint64_t v23 = objc_msgSend_trustedTargetWrappedKey(self, v21, v22);
  uint64_t v25 = objc_msgSend_initWithOperation_serviceName_functionName_serializedParameters_attestationEntropy_pccWrappedInvocationKeys_trustedTargetWrappedInvocationKey_(v5, v24, (uint64_t)self, v8, v11, v14, v17, v20, v23);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v25);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1C4F396AC;
  v38[3] = &unk_1E64F6820;
  objc_copyWeak(&v39, &location);
  objc_copyWeak(&v40, &from);
  objc_msgSend_setSerializedResultsCallback_(v25, v26, (uint64_t)v38);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1C4F399DC;
  v35[3] = &unk_1E64F0170;
  objc_copyWeak(&v36, &location);
  objc_copyWeak(&v37, &from);
  objc_msgSend_setCompletionBlock_(v25, v27, (uint64_t)v35);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v28 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_INFO, "Invoking CKCode function", buf, 2u);
  }
  objc_msgSend_setRequest_(self, v29, (uint64_t)v25);
  uint64_t v32 = objc_msgSend_container(self, v30, v31);
  objc_msgSend_performRequest_(v32, v33, (uint64_t)v25);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_invokeLocalFunction
{
  id v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  uint64_t v5 = [CKDCodeLocalFunctionInvokeURLRequest alloc];
  uint64_t v8 = objc_msgSend_serviceName(self, v6, v7);
  uint64_t v11 = objc_msgSend_functionName(self, v9, v10);
  uint64_t v14 = objc_msgSend_serializedArguments(self, v12, v13);
  uint64_t v17 = objc_msgSend_resolvedBaseURL(self, v15, v16);
  uint64_t v19 = objc_msgSend_initWithOperation_serviceName_functionName_serializedParameters_resolvedBaseURL_(v5, v18, (uint64_t)self, v8, v11, v14, v17);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v19);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1C4F39E30;
  v32[3] = &unk_1E64F6848;
  objc_copyWeak(&v33, &location);
  objc_copyWeak(&v34, &from);
  objc_msgSend_setSerializedResultsCallback_(v19, v20, (uint64_t)v32);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4F3A444;
  v29[3] = &unk_1E64F0170;
  objc_copyWeak(&v30, &location);
  objc_copyWeak(&v31, &from);
  objc_msgSend_setCompletionBlock_(v19, v21, (uint64_t)v29);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v22 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "Invoking CKCode function", v28, 2u);
  }
  objc_msgSend_setRequest_(self, v23, (uint64_t)v19);
  id v26 = objc_msgSend_container(self, v24, v25);
  objc_msgSend_performRequest_(v26, v27, (uint64_t)v19);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_getDeserializedRecords
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_stateTransitionGroup(self, v4, v5);
  dispatch_group_enter(v6);

  objc_initWeak(&location, self);
  objc_msgSend_initialResponseReceivedCallback(self, v7, v8);
  uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_serializedResponse(self, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4F3A704;
  v14[3] = &unk_1E64F6870;
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  id v13 = v3;
  id v15 = v13;
  ((void (**)(void, void *, void *))v9)[2](v9, v12, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_postflightRecords
{
  id v4 = objc_msgSend_responseRecords(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
    dispatch_group_enter(v10);

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = objc_opt_new();
    objc_msgSend_setShouldFetchAssetContent_(v12, v13, 1);
    uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v14, v15);
    objc_msgSend_setShouldFetchAssetContentInMemory_(v12, v17, AssetContentInMemory);
    uint64_t v18 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1C4F3AA50;
    v21[3] = &unk_1E64F0260;
    v21[4] = self;
    id v22 = v11;
    id v19 = v11;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v20, v18, v12, v21);
  }
}

+ (int64_t)isPredominatelyDownload
{
  return -1;
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v9 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    uint64_t v12 = objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    uint64_t v14 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    uint64_t v17 = objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    int v18 = 138544130;
    id v19 = v7;
    __int16 v20 = 2048;
    id v21 = self;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Starting CKCode function invoke operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);
  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

+ (id)URLFromEntitlementString:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((objc_msgSend_hasPrefix_(v3, v4, @"http") & 1) == 0)
  {
    uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, v5, @"http://%@", v3);

    id v3 = (id)v6;
  }
  uint64_t v7 = objc_msgSend_componentsWithString_(MEMORY[0x1E4F29088], v5, (uint64_t)v3);
  objc_msgSend_applyDefaultParametersToServiceURLComponents_(MEMORY[0x1E4F19EA8], v8, (uint64_t)v7);
  uint64_t v11 = objc_msgSend_URL(v7, v9, v10);

  if (!v11)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v3;
      _os_log_error_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_ERROR, "Couldn't generate URL from entitlement string %{public}@", buf, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)entitlementURLForServiceName:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_entitlements(v7, v8, v9);
  id v13 = objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(v10, v11, v12);
  uint64_t v16 = objc_msgSend_containerID(v7, v14, v15);
  id v19 = objc_msgSend_containerIdentifier(v16, v17, v18);
  id v21 = objc_msgSend_objectForKeyedSubscript_(v13, v20, (uint64_t)v19);
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v6);

  if (v23) {
    goto LABEL_4;
  }
  uint64_t v26 = objc_msgSend_entitlements(v7, v24, v25);
  uint64_t v29 = objc_msgSend_codeServiceURLByServiceEntitlement(v26, v27, v28);
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v6);

  if (v23
    || (objc_msgSend_entitlements(v7, v24, v31),
        uint64_t v32 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_codeServiceURLEntitlement(v32, v33, v34),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        v32,
        v23))
  {
LABEL_4:
    v35 = objc_msgSend_URLFromEntitlementString_(a1, v24, (uint64_t)v23);
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CKDCodeFunctionInvokeOperation;
  if ([(CKDOperation *)&v41 validateAgainstLiveContainer:v6 error:a4])
  {
    uint64_t v9 = objc_msgSend_operationInfo(self, v7, v8);
    uint64_t v12 = objc_msgSend_clientRuntimeProvidedServiceURL(v9, v10, v11);

    if (!v12)
    {
      int IsLocalBit = objc_msgSend_legacyIsLocalBit(v9, v13, v14);
      uint64_t v25 = objc_opt_class();
      uint64_t v28 = v25;
      if (!IsLocalBit)
      {
        uint64_t v32 = objc_msgSend_serviceName(self, v26, v27);
        uint64_t v34 = objc_msgSend_entitlementURLForServiceName_container_(v28, v33, (uint64_t)v32, v6);
        objc_msgSend_setResolvedBaseURL_(self, v35, (uint64_t)v34);

        goto LABEL_15;
      }
      uint64_t v21 = objc_msgSend_URLFromEntitlementString_(v25, v26, @"http://127.0.0.1:31234");
LABEL_8:
      uint64_t v29 = (void *)v21;
      objc_msgSend_setResolvedBaseURL_(self, v22, v21);

LABEL_15:
      BOOL v23 = 1;
      goto LABEL_16;
    }
    uint64_t v15 = objc_msgSend_entitlements(v6, v13, v14);
    char hasExplicitCodeOperationURLEntitlement = objc_msgSend_hasExplicitCodeOperationURLEntitlement(v15, v16, v17);

    if (hasExplicitCodeOperationURLEntitlement)
    {
      uint64_t v21 = objc_msgSend_clientRuntimeProvidedServiceURL(v9, v19, v20);
      goto LABEL_8;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v30 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      id v37 = v30;
      id v40 = objc_msgSend_clientRuntimeProvidedServiceURL(v9, v38, v39);
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v40;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Un-entitled client is not allowed to set explicit code operation url of %{public}@", buf, 0xCu);

      if (a4) {
        goto LABEL_13;
      }
    }
    else if (a4)
    {
LABEL_13:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v31, *MEMORY[0x1E4F19DD8], 1017, @"Process not entitled to set explicit code operation url");
      BOOL v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    BOOL v23 = 0;
    goto LABEL_16;
  }
  BOOL v23 = 0;
LABEL_17:

  return v23;
}

- (id)replaceLocalSerializationsBlobs
{
  return self->_replaceLocalSerializationsBlobs;
}

- (void)setReplaceLocalSerializationsBlobs:(id)a3
{
}

- (id)initialResponseReceivedCallback
{
  return self->_initialResponseReceivedCallback;
}

- (void)setInitialResponseReceivedCallback:(id)a3
{
}

- (id)replaceWireSerializations
{
  return self->_replaceWireSerializations;
}

- (void)setReplaceWireSerializations:(id)a3
{
}

- (id)recordFetchCompletionBlock
{
  return self->_recordFetchCompletionBlock;
}

- (void)setRecordFetchCompletionBlock:(id)a3
{
}

- (id)recordFetchProgressBlock
{
  return self->_recordFetchProgressBlock;
}

- (void)setRecordFetchProgressBlock:(id)a3
{
}

- (id)recordFetchCommandBlock
{
  return self->_recordFetchCommandBlock;
}

- (void)setRecordFetchCommandBlock:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (PCCKey)pccKey
{
  return self->_pccKey;
}

- (void)setPccKey:(id)a3
{
}

- (NSArray)pccWrappedKeys
{
  return self->_pccWrappedKeys;
}

- (void)setPccWrappedKeys:(id)a3
{
}

- (NSData)attestationEntropy
{
  return self->_attestationEntropy;
}

- (void)setAttestationEntropy:(id)a3
{
}

- (NSArray)requestLocalSerializations
{
  return self->_requestLocalSerializations;
}

- (void)setRequestLocalSerializations:(id)a3
{
}

- (NSArray)requestLocalEnvelopes
{
  return self->_requestLocalEnvelopes;
}

- (void)setRequestLocalEnvelopes:(id)a3
{
}

- (unint64_t)dataProtectionType
{
  return self->_dataProtectionType;
}

- (void)setDataProtectionType:(unint64_t)a3
{
  self->_dataProtectionType = a3;
}

- (NSData)permittedRemoteMeasurement
{
  return self->_permittedRemoteMeasurement;
}

- (void)setPermittedRemoteMeasurement:(id)a3
{
}

- (BOOL)shouldSendRecordPCSKeys
{
  return self->_shouldSendRecordPCSKeys;
}

- (void)setShouldSendRecordPCSKeys:(BOOL)a3
{
  self->_int shouldSendRecordPCSKeys = a3;
}

- (NSString)trustedTargetDomain
{
  return self->_trustedTargetDomain;
}

- (void)setTrustedTargetDomain:(id)a3
{
}

- (NSString)trustedTargetOID
{
  return self->_trustedTargetOID;
}

- (void)setTrustedTargetOID:(id)a3
{
}

- (CKDTrustedTargetKey)trustedTargetKey
{
  return self->_trustedTargetKey;
}

- (void)setTrustedTargetKey:(id)a3
{
}

- (CKDTrustedTargetWrappedKey)trustedTargetWrappedKey
{
  return self->_trustedTargetWrappedKey;
}

- (void)setTrustedTargetWrappedKey:(id)a3
{
}

- (NSURL)resolvedBaseURL
{
  return self->_resolvedBaseURL;
}

- (void)setResolvedBaseURL:(id)a3
{
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContentInMemory = a3;
}

- (NSArray)requestRecords
{
  return self->_requestRecords;
}

- (void)setRequestRecords:(id)a3
{
}

- (NSData)serializedArguments
{
  return self->_serializedArguments;
}

- (void)setSerializedArguments:(id)a3
{
}

- (NSData)serializedResponse
{
  return self->_serializedResponse;
}

- (void)setSerializedResponse:(id)a3
{
}

- (NSArray)responseRecords
{
  return self->_responseRecords;
}

- (void)setResponseRecords:(id)a3
{
}

- (CKDProtocolTranslator)translator
{
  return self->_translator;
}

- (void)setTranslator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_responseRecords, 0);
  objc_storeStrong((id *)&self->_serializedResponse, 0);
  objc_storeStrong((id *)&self->_serializedArguments, 0);
  objc_storeStrong((id *)&self->_requestRecords, 0);
  objc_storeStrong((id *)&self->_resolvedBaseURL, 0);
  objc_storeStrong((id *)&self->_trustedTargetWrappedKey, 0);
  objc_storeStrong((id *)&self->_trustedTargetKey, 0);
  objc_storeStrong((id *)&self->_trustedTargetOID, 0);
  objc_storeStrong((id *)&self->_trustedTargetDomain, 0);
  objc_storeStrong((id *)&self->_permittedRemoteMeasurement, 0);
  objc_storeStrong((id *)&self->_requestLocalEnvelopes, 0);
  objc_storeStrong((id *)&self->_requestLocalSerializations, 0);
  objc_storeStrong((id *)&self->_attestationEntropy, 0);
  objc_storeStrong((id *)&self->_pccWrappedKeys, 0);
  objc_storeStrong((id *)&self->_pccKey, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_recordFetchCommandBlock, 0);
  objc_storeStrong(&self->_recordFetchProgressBlock, 0);
  objc_storeStrong(&self->_recordFetchCompletionBlock, 0);
  objc_storeStrong(&self->_replaceWireSerializations, 0);
  objc_storeStrong(&self->_initialResponseReceivedCallback, 0);
  objc_storeStrong(&self->_replaceLocalSerializationsBlobs, 0);
}

@end