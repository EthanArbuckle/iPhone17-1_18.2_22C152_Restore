@interface CKDUpdateDeviceCapabilitiesURLRequest
- (CKDUpdateDeviceCapabilitiesURLRequest)initWithOperation:(id)a3 supportedCapabilities:(id)a4 zoneUsages:(id)a5 shareUsages:(id)a6;
- (NSArray)supportedCapabilities;
- (NSDictionary)shareUsages;
- (NSDictionary)zoneUsages;
- (NSMutableDictionary)shareIDByRequestID;
- (NSMutableDictionary)zoneIDByRequestID;
- (NSString)deviceCapabilitiesSaveRequestID;
- (id)deviceCapabilitiesUpdatedBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)shareUsageUpdatedBlock;
- (id)zoneUsageUpdatedBlock;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setDeviceCapabilitiesSaveRequestID:(id)a3;
- (void)setDeviceCapabilitiesUpdatedBlock:(id)a3;
- (void)setShareIDByRequestID:(id)a3;
- (void)setShareUsageUpdatedBlock:(id)a3;
- (void)setShareUsages:(id)a3;
- (void)setSupportedCapabilities:(id)a3;
- (void)setZoneIDByRequestID:(id)a3;
- (void)setZoneUsageUpdatedBlock:(id)a3;
- (void)setZoneUsages:(id)a3;
@end

@implementation CKDUpdateDeviceCapabilitiesURLRequest

- (CKDUpdateDeviceCapabilitiesURLRequest)initWithOperation:(id)a3 supportedCapabilities:(id)a4 zoneUsages:(id)a5 shareUsages:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKDUpdateDeviceCapabilitiesURLRequest;
  v14 = [(CKDURLRequest *)&v17 initWithOperation:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_supportedCapabilities, a4);
    objc_storeStrong((id *)&v15->_zoneUsages, a5);
    objc_storeStrong((id *)&v15->_shareUsages, a6);
  }

  return v15;
}

- (id)requestOperationClasses
{
  v3 = objc_opt_new();
  v6 = objc_msgSend_zoneUsages(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_opt_class();
    objc_msgSend_addObject_(v3, v13, v12);
  }
  v14 = objc_msgSend_shareUsages(self, v10, v11);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);

  if (v17)
  {
    uint64_t v20 = objc_opt_class();
    objc_msgSend_addObject_(v3, v21, v20);
  }
  v22 = objc_msgSend_supportedCapabilities(self, v18, v19);
  if (v22)
  {
  }
  else if (objc_msgSend_count(v3, v23, v24))
  {
    goto LABEL_9;
  }
  uint64_t v25 = objc_opt_class();
  objc_msgSend_addObject_(v3, v26, v25);
LABEL_9:
  return v3;
}

- (id)generateRequestOperations
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6 = objc_msgSend_supportedCapabilities(self, v4, v5);

  if (!v6) {
    goto LABEL_16;
  }
  v67 = objc_opt_new();
  uint64_t v11 = objc_msgSend_translator(self, v9, v10);
  v14 = objc_msgSend_supportedCapabilities(self, v12, v13);
  uint64_t v17 = objc_msgSend_container(self, v15, v16);
  uint64_t v20 = objc_msgSend_deviceID(v17, v18, v19);
  v22 = objc_msgSend_pDeviceCapabilitiesFromDeviceCapabilitySet_withDeviceID_(v11, v21, (uint64_t)v14, v20);

  uint64_t v25 = objc_msgSend_data(v22, v23, v24);
  v28 = objc_msgSend_container(self, v26, v27);
  v31 = objc_msgSend_pcsManager(v28, v29, v30);
  id v74 = 0;
  v33 = objc_msgSend_createCloudKitFeaturesSignatureForData_forScope_error_(v31, v32, (uint64_t)v25, 1, &v74);
  id v34 = v74;

  BOOL v35 = v34 || v33 == 0;
  BOOL v36 = !v35;
  BOOL v66 = v36;
  if (v35)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v53 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v34;
      _os_log_error_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_ERROR, "Failed to generate signature for supported device capabilities. Error: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v37 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v54, *MEMORY[0x1E4F19DD8], 5023, v34, @"Failed to create cryptographic signature when saving device capabilities.");
    objc_msgSend_finishWithError_(self, v55, (uint64_t)v37);
  }
  else
  {
    v37 = objc_opt_new();
    objc_msgSend_setVersion_(v37, v38, 1);
    objc_msgSend_setSerializedObject_(v37, v39, (uint64_t)v25);
    objc_msgSend_setSignature_(v37, v40, (uint64_t)v33);
    objc_msgSend_setSignedSupportedAdopterCapabilities_(v67, v41, (uint64_t)v37);
    v43 = objc_msgSend_operationRequestWithType_(self, v42, 407);
    objc_msgSend_setAdopterCapabilitiesSaveRequest_(v43, v44, (uint64_t)v67);
    objc_msgSend_addObject_(v3, v45, (uint64_t)v43);
    v48 = objc_msgSend_request(v43, v46, v47);
    v51 = objc_msgSend_operationUUID(v48, v49, v50);
    objc_msgSend_setDeviceCapabilitiesSaveRequestID_(self, v52, (uint64_t)v51);
  }
  if (!v66)
  {
    id v61 = 0;
  }
  else
  {
LABEL_16:
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v76 = 0x2020000000;
    char v77 = 0;
    v56 = objc_msgSend_zoneUsages(self, v7, v8);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = sub_1C4E5B248;
    v71[3] = &unk_1E64F42E0;
    v71[4] = self;
    p_long long buf = &buf;
    id v57 = v3;
    id v72 = v57;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v56, v58, (uint64_t)v71);

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      id v61 = 0;
    }
    else
    {
      v62 = objc_msgSend_shareUsages(self, v59, v60);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = sub_1C4E5B58C;
      v68[3] = &unk_1E64F4308;
      v68[4] = self;
      v70 = &buf;
      id v63 = v57;
      id v69 = v63;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v62, v64, (uint64_t)v68);

      if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
        id v61 = 0;
      }
      else {
        id v61 = v63;
      }
    }
    _Block_object_dispose(&buf, 8);
  }

  return v61;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_response(v4, v5, v6);
  uint64_t v10 = objc_msgSend_operationUUID(v7, v8, v9);

  uint64_t v13 = objc_msgSend_response(v4, v11, v12);
  int v16 = objc_msgSend_type(v13, v14, v15);

  if (v16 != 407)
  {
    v31 = objc_msgSend_response(v4, v17, v18);
    int v34 = objc_msgSend_type(v31, v32, v33);

    if (v34 == 409)
    {
      v37 = objc_msgSend_zoneIDByRequestID(self, v35, v36);
      v39 = objc_msgSend_objectForKeyedSubscript_(v37, v38, (uint64_t)v10);

      v42 = objc_msgSend_zoneUsages(self, v40, v41);
      v44 = objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)v39);

      if (v39 && v44)
      {
        uint64_t v47 = objc_msgSend_zoneUsageUpdatedBlock(self, v45, v46);

        if (v47)
        {
          uint64_t v50 = objc_msgSend_zoneUsageUpdatedBlock(self, v48, v49);
LABEL_20:
          v73 = (void (**)(void, void, void, void))v50;
          id v74 = objc_msgSend_result(v4, v51, v52);
          ((void (**)(void, void *, void *, void *))v73)[2](v73, v39, v44, v74);

          goto LABEL_21;
        }
        goto LABEL_21;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v75 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        v85 = v10;
        __int16 v86 = 2112;
        id v87 = v39;
        __int16 v88 = 2112;
        v89 = v44;
        char v77 = "Unexpected zone usage save response for operationUUID %@, zoneID: %@, date: %@";
LABEL_40:
        _os_log_error_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_ERROR, v77, buf, 0x20u);
      }
    }
    else
    {
      v56 = objc_msgSend_response(v4, v35, v36);
      int v59 = objc_msgSend_type(v56, v57, v58);

      if (v59 != 410)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v78 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          v85 = v10;
          __int16 v86 = 2112;
          id v87 = v4;
          _os_log_error_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_ERROR, "Unexpected response type for operationUUID %@: %@", buf, 0x16u);
        }
        goto LABEL_30;
      }
      v62 = objc_msgSend_shareIDByRequestID(self, v60, v61);
      v39 = objc_msgSend_objectForKeyedSubscript_(v62, v63, (uint64_t)v10);

      BOOL v66 = objc_msgSend_shareUsages(self, v64, v65);
      v44 = objc_msgSend_objectForKeyedSubscript_(v66, v67, (uint64_t)v39);

      if (v39 && v44)
      {
        v70 = objc_msgSend_shareUsageUpdatedBlock(self, v68, v69);

        if (v70)
        {
          uint64_t v50 = objc_msgSend_shareUsageUpdatedBlock(self, v71, v72);
          goto LABEL_20;
        }
LABEL_21:
        v55 = 0;
LABEL_35:

        goto LABEL_36;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v75 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        v85 = v10;
        __int16 v86 = 2112;
        id v87 = v39;
        __int16 v88 = 2112;
        v89 = v44;
        char v77 = "Unexpected share usage save response for operationUUID %@, shareID: %@, date: %@";
        goto LABEL_40;
      }
    }
    v55 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v76, *MEMORY[0x1E4F19C40], 1, @"Unrecognized operation UUID in server response: %@", v10);
    goto LABEL_35;
  }
  uint64_t v19 = objc_msgSend_deviceCapabilitiesSaveRequestID(self, v17, v18);
  int isEqual = objc_msgSend_isEqual_(v10, v20, (uint64_t)v19);

  if (isEqual)
  {
    uint64_t v24 = objc_msgSend_deviceCapabilitiesUpdatedBlock(self, v22, v23);

    if (v24)
    {
      objc_msgSend_deviceCapabilitiesUpdatedBlock(self, v25, v26);
      uint64_t v27 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v30 = objc_msgSend_result(v4, v28, v29);
      ((void (**)(void, void *))v27)[2](v27, v30);
    }
LABEL_30:
    v55 = 0;
    goto LABEL_36;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v53 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    v80 = v53;
    v83 = objc_msgSend_deviceCapabilitiesSaveRequestID(self, v81, v82);
    *(_DWORD *)long long buf = 138412546;
    v85 = v10;
    __int16 v86 = 2112;
    id v87 = v83;
    _os_log_error_impl(&dword_1C4CFF000, v80, OS_LOG_TYPE_ERROR, "Unexpected device capabilities save response operationUUID: %@, expeccted: %@", buf, 0x16u);
  }
  v55 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v54, *MEMORY[0x1E4F19C40], 1, @"Unrecognized operation UUID in server response: %@", v10);
LABEL_36:

  return v55;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_response(v4, v5, v6);
  uint64_t v10 = objc_msgSend_operationUUID(v7, v8, v9);

  uint64_t v13 = objc_msgSend_deviceCapabilitiesSaveRequestID(self, v11, v12);
  int isEqual = objc_msgSend_isEqual_(v10, v14, (uint64_t)v13);

  if (!isEqual)
  {
    uint64_t v25 = objc_msgSend_zoneIDByRequestID(self, v16, v17);
    objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v10);
    v21 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      uint64_t v29 = objc_msgSend_zoneUsages(self, v27, v28);
      v31 = objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v21);

      int v34 = objc_msgSend_zoneUsageUpdatedBlock(self, v32, v33);

      if (v34)
      {
        objc_msgSend_zoneUsageUpdatedBlock(self, v35, v36);
        v37 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_result(v4, v38, v39);
        ((void (**)(void, void (**)(void, void), void *, void *))v37)[2](v37, v21, v31, v40);
      }
    }
    else
    {
      uint64_t v41 = objc_msgSend_shareIDByRequestID(self, v27, v28);
      v31 = objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)v10);

      if (v31)
      {
        v45 = objc_msgSend_shareUsages(self, v43, v44);
        uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)v31);

        uint64_t v50 = objc_msgSend_shareUsageUpdatedBlock(self, v48, v49);

        if (v50)
        {
          objc_msgSend_shareUsageUpdatedBlock(self, v51, v52);
          v53 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend_result(v4, v54, v55);
          ((void (**)(void, void *, void *, void *))v53)[2](v53, v31, v47, v56);
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v57 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          int v58 = 138412546;
          int v59 = v10;
          __int16 v60 = 2112;
          id v61 = v4;
          _os_log_error_impl(&dword_1C4CFF000, v57, OS_LOG_TYPE_ERROR, "Unexpected response for operationUUID %@: %@", (uint8_t *)&v58, 0x16u);
        }
      }
    }

    goto LABEL_16;
  }
  uint64_t v18 = objc_msgSend_deviceCapabilitiesUpdatedBlock(self, v16, v17);

  if (v18)
  {
    objc_msgSend_deviceCapabilitiesUpdatedBlock(self, v19, v20);
    v21 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v24 = objc_msgSend_result(v4, v22, v23);
    ((void (**)(void, void *))v21)[2](v21, v24);

LABEL_16:
  }
}

- (NSArray)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (void)setSupportedCapabilities:(id)a3
{
}

- (NSDictionary)zoneUsages
{
  return self->_zoneUsages;
}

- (void)setZoneUsages:(id)a3
{
}

- (NSDictionary)shareUsages
{
  return self->_shareUsages;
}

- (void)setShareUsages:(id)a3
{
}

- (id)deviceCapabilitiesUpdatedBlock
{
  return self->_deviceCapabilitiesUpdatedBlock;
}

- (void)setDeviceCapabilitiesUpdatedBlock:(id)a3
{
}

- (id)zoneUsageUpdatedBlock
{
  return self->_zoneUsageUpdatedBlock;
}

- (void)setZoneUsageUpdatedBlock:(id)a3
{
}

- (id)shareUsageUpdatedBlock
{
  return self->_shareUsageUpdatedBlock;
}

- (void)setShareUsageUpdatedBlock:(id)a3
{
}

- (NSString)deviceCapabilitiesSaveRequestID
{
  return self->_deviceCapabilitiesSaveRequestID;
}

- (void)setDeviceCapabilitiesSaveRequestID:(id)a3
{
}

- (NSMutableDictionary)zoneIDByRequestID
{
  return self->_zoneIDByRequestID;
}

- (void)setZoneIDByRequestID:(id)a3
{
}

- (NSMutableDictionary)shareIDByRequestID
{
  return self->_shareIDByRequestID;
}

- (void)setShareIDByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIDByRequestID, 0);
  objc_storeStrong((id *)&self->_zoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_deviceCapabilitiesSaveRequestID, 0);
  objc_storeStrong(&self->_shareUsageUpdatedBlock, 0);
  objc_storeStrong(&self->_zoneUsageUpdatedBlock, 0);
  objc_storeStrong(&self->_deviceCapabilitiesUpdatedBlock, 0);
  objc_storeStrong((id *)&self->_shareUsages, 0);
  objc_storeStrong((id *)&self->_zoneUsages, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
}

@end