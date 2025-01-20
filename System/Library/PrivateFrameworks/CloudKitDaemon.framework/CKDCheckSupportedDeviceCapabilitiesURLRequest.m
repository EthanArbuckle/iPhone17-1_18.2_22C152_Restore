@interface CKDCheckSupportedDeviceCapabilitiesURLRequest
- (CKDCheckSupportedDeviceCapabilitiesURLRequest)initWithOperation:(id)a3 zoneIDs:(id)a4 desiredCapabilitySets:(id)a5 options:(id)a6;
- (CKDeviceCapabilityCheckOptions)options;
- (NSArray)desiredCapabilitySets;
- (NSArray)zoneIDs;
- (NSMutableDictionary)capabililitySetsByRequestID;
- (NSMutableDictionary)zoneIDByRequestID;
- (id)errorFromClientValidationBlock;
- (id)errorFromServerBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)supportedDeviceCapabilitiesCheckedForZoneBlock;
- (void)reportClientValidationError:(id)a3 forZoneID:(id)a4 capabilitySet:(id)a5;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setCapabililitySetsByRequestID:(id)a3;
- (void)setDesiredCapabilitySets:(id)a3;
- (void)setErrorFromClientValidationBlock:(id)a3;
- (void)setErrorFromServerBlock:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSupportedDeviceCapabilitiesCheckedForZoneBlock:(id)a3;
- (void)setZoneIDByRequestID:(id)a3;
- (void)setZoneIDs:(id)a3;
@end

@implementation CKDCheckSupportedDeviceCapabilitiesURLRequest

- (CKDCheckSupportedDeviceCapabilitiesURLRequest)initWithOperation:(id)a3 zoneIDs:(id)a4 desiredCapabilitySets:(id)a5 options:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKDCheckSupportedDeviceCapabilitiesURLRequest;
  v14 = [(CKDURLRequest *)&v21 initWithOperation:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_zoneIDs, a4);
    objc_storeStrong((id *)&v15->_desiredCapabilitySets, a5);
    uint64_t v16 = objc_opt_new();
    zoneIDByRequestID = v15->_zoneIDByRequestID;
    v15->_zoneIDByRequestID = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    capabililitySetsByRequestID = v15->_capabililitySetsByRequestID;
    v15->_capabililitySetsByRequestID = (NSMutableDictionary *)v18;

    objc_storeStrong((id *)&v15->_options, a6);
  }

  return v15;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v110 = (id)objc_opt_new();
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  objc_msgSend_zoneIDs(self, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v117, v126, 16);
  if (v107)
  {
    uint64_t v106 = *(void *)v118;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v118 != v106) {
          objc_enumerationMutation(obj);
        }
        uint64_t v108 = v8;
        uint64_t v9 = *(void *)(*((void *)&v117 + 1) + 8 * v8);
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        objc_msgSend_desiredCapabilitySets(self, v6, v7);
        id v109 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v10, (uint64_t)&v113, v125, 16);
        if (v112)
        {
          uint64_t v111 = *(void *)v114;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v114 != v111) {
                objc_enumerationMutation(v109);
              }
              uint64_t v12 = *(void *)(*((void *)&v113 + 1) + 8 * v11);
              id v13 = objc_opt_new();
              uint64_t v16 = objc_msgSend_translator(self, v14, v15);
              uint64_t v18 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v16, v17, v9);
              objc_msgSend_setZoneIdentifier_(v13, v19, (uint64_t)v18);

              v22 = objc_msgSend_translator(self, v20, v21);
              v25 = objc_msgSend_container(self, v23, v24);
              v28 = objc_msgSend_deviceID(v25, v26, v27);
              v30 = objc_msgSend_pDeviceCapabilitiesFromDeviceCapabilitySet_withDeviceID_(v22, v29, v12, v28);

              v33 = objc_msgSend_zoneLevelCapabilities(v30, v31, v32);
              objc_msgSend_setZoneLevelCapabilities_(v13, v34, (uint64_t)v33);

              v37 = objc_msgSend_recordLevelCapabilities(v30, v35, v36);
              objc_msgSend_setRecordLevelCapabilities_(v13, v38, (uint64_t)v37);

              v41 = objc_msgSend_fieldLevelCapabilities(v30, v39, v40);
              objc_msgSend_setFieldLevelCapabilities_(v13, v42, (uint64_t)v41);

              v45 = objc_msgSend_options(self, v43, v44);
              LODWORD(v22) = objc_msgSend_excludeDevicesWithoutCapabilityCheckingSupport(v45, v46, v47);

              if (v22)
              {
                v50 = objc_msgSend_options(self, v48, v49);
                uint64_t v53 = objc_msgSend_excludeDevicesWithoutCapabilityCheckingSupport(v50, v51, v52);
                objc_msgSend_setExcludeDevicesWithoutCapabilityCheckingSupport_(v13, v54, v53);
              }
              v55 = objc_msgSend_options(self, v48, v49);
              v58 = objc_msgSend_excludeZoneAccessBefore(v55, v56, v57);

              if (v58)
              {
                v61 = objc_msgSend_translator(self, v59, v60);
                v64 = objc_msgSend_options(self, v62, v63);
                v67 = objc_msgSend_excludeZoneAccessBefore(v64, v65, v66);
                v69 = objc_msgSend_pDateFromDate_(v61, v68, (uint64_t)v67);
                objc_msgSend_setExcludeZoneAccessBefore_(v13, v70, (uint64_t)v69);
              }
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v71 = (void *)*MEMORY[0x1E4F1A530];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
              {
                v100 = v71;
                v103 = objc_msgSend_requestUUID(self, v101, v102);
                *(_DWORD *)buf = 138543618;
                v122 = v103;
                __int16 v123 = 2112;
                v124 = v13;
                _os_log_debug_impl(&dword_1C4CFF000, v100, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Sending device capabilities check: %@\"", buf, 0x16u);
              }
              uint64_t v74 = objc_msgSend_operationType(self, v72, v73);
              v76 = objc_msgSend_operationRequestWithType_(self, v75, v74);
              objc_msgSend_setAdopterCapabilitiesCheckRequest_(v76, v77, (uint64_t)v13);
              v80 = objc_msgSend_zoneIDByRequestID(self, v78, v79);
              v83 = objc_msgSend_request(v76, v81, v82);
              v86 = objc_msgSend_operationUUID(v83, v84, v85);
              objc_msgSend_setObject_forKeyedSubscript_(v80, v87, v9, v86);

              v90 = objc_msgSend_capabililitySetsByRequestID(self, v88, v89);
              v93 = objc_msgSend_request(v76, v91, v92);
              v96 = objc_msgSend_operationUUID(v93, v94, v95);
              objc_msgSend_setObject_forKeyedSubscript_(v90, v97, v12, v96);

              objc_msgSend_addObject_(v110, v98, (uint64_t)v76);
              ++v11;
            }
            while (v112 != v11);
            uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v99, (uint64_t)&v113, v125, 16);
          }
          while (v112);
        }

        uint64_t v8 = v108 + 1;
      }
      while (v108 + 1 != v107);
      uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v117, v126, 16);
    }
    while (v107);
  }

  return v110;
}

- (void)reportClientValidationError:(id)a3 forZoneID:(id)a4 capabilitySet:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_errorFromClientValidationBlock(self, v10, v11);

  if (v12)
  {
    objc_msgSend_errorFromClientValidationBlock(self, v13, v14);
    uint64_t v15 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, id))v15)[2](v15, v16, v8, v9);
  }
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v718 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_zoneIDByRequestID(self, v5, v6);
  v10 = objc_msgSend_response(v4, v8, v9);
  id v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  uint64_t v18 = objc_msgSend_capabililitySetsByRequestID(self, v16, v17);
  uint64_t v21 = objc_msgSend_response(v4, v19, v20);
  uint64_t v24 = objc_msgSend_operationUUID(v21, v22, v23);
  v26 = objc_msgSend_objectForKeyedSubscript_(v18, v25, (uint64_t)v24);

  uint64_t v27 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  id v28 = (id)*MEMORY[0x1E4F1A548];
  v29 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v28);
  }

  v30 = (id *)MEMORY[0x1E4F1A530];
  v31 = (id)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    id v109 = objc_msgSend_requestUUID(self, v32, v33);
    *(_DWORD *)buf = 138543874;
    v707 = v109;
    __int16 v708 = 2112;
    id v709 = v4;
    __int16 v710 = 2112;
    uint64_t v711 = (uint64_t)v15;
    _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received device capabilities check response: %@ for zoneID: %@\"", buf, 0x20u);
  }
  uint64_t v36 = objc_msgSend_result(v4, v34, v35);
  int hasError = objc_msgSend_hasError(v36, v37, v38);

  if (!hasError)
  {
    v48 = objc_opt_new();
    if (!objc_msgSend_hasAdopterCapabilitiesCheckResponse(v4, v49, v50))
    {
      v69 = 0;
      v694 = 0;
      goto LABEL_17;
    }
    uint64_t v53 = objc_msgSend_adopterCapabilitiesCheckResponse(v4, v51, v52);
    if (!objc_msgSend_hasIsSupported(v53, v54, v55)) {
      goto LABEL_40;
    }
    if (objc_msgSend_isSupported(v53, v56, v57))
    {
      uint64_t v60 = v26;
      v61 = v48;
      if (*v29 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v27);
      }
      v62 = (void *)*MEMORY[0x1E4F1A530];
      int v63 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_INFO))
      {
        v64 = v62;
        v67 = objc_msgSend_requestUUID(self, v65, v66);
        *(_DWORD *)buf = 138543618;
        v707 = v67;
        __int16 v708 = 2112;
        id v709 = v15;
        _os_log_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_INFO, "req: %{public}@, \"Server returned isSupported:YES for the device capability check. zoneID: %@\"", buf, 0x16u);
      }
      v68 = 0;
      v69 = 0;
      unsigned int v689 = 0;
      v694 = 0;
      int v70 = 1;
      goto LABEL_41;
    }
    if (!objc_msgSend_hasSignedSupportedAdopterCapabilities(v53, v58, v59)
      || (objc_msgSend_hasSignedZoneUsage(v53, v82, v83) & 1) == 0
      && !objc_msgSend_hasSignedShareUsage(v53, v84, v85))
    {
LABEL_40:
      uint64_t v60 = v26;
      v61 = v48;
      v68 = 0;
      v69 = 0;
      unsigned int v689 = 0;
      v694 = 0;
      int v63 = 0;
      int v70 = 0;
      goto LABEL_41;
    }
    if (objc_msgSend_hasSignedZoneUsage(v53, v84, v85)
      && objc_msgSend_hasSignedShareUsage(v53, v86, v87))
    {
      id v88 = *v27;
      if (*v29 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v88);
      }

      uint64_t v89 = *v30;
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        uint64_t v92 = objc_msgSend_requestUUID(self, v90, v91);
        *(_DWORD *)buf = 138543618;
        v707 = v92;
        __int16 v708 = 2112;
        id v709 = v15;
        _os_log_impl(&dword_1C4CFF000, v89, OS_LOG_TYPE_INFO, "req: %{public}@, \"Warn: Unexpected - server returned isSupported:NO with both zone and share usage! zoneID: %@\"", buf, 0x16u);

        v29 = (void *)MEMORY[0x1E4F1A550];
      }
    }
    v685 = v53;
    if (!objc_msgSend_hasSignedZoneUsage(v53, v86, v87))
    {
      BOOL v114 = 0;
      v675 = 0;
      v686 = 0;
      v684 = 0;
      v68 = 0;
      v694 = 0;
      int hasSignedShareUsage = objc_msgSend_hasSignedShareUsage(v53, v93, v94);
      goto LABEL_49;
    }
    uint64_t v95 = objc_msgSend_signedZoneUsage(v53, v93, v94);
    v688 = v95;
    if (objc_msgSend_hasVersion(v95, v96, v97) && (int)objc_msgSend_version(v95, v98, v99) >= 2)
    {
      if (*v29 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v27);
      }
      id v100 = *v30;
      uint64_t v53 = v685;
      if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
      {
        v496 = v100;
        v499 = objc_msgSend_requestUUID(self, v497, v498);
        int v502 = objc_msgSend_version(v688, v500, v501);
        *(_DWORD *)buf = 138543874;
        v707 = v499;
        __int16 v708 = 2048;
        id v709 = (id)v502;
        __int16 v710 = 2112;
        uint64_t v711 = (uint64_t)v15;
        _os_log_error_impl(&dword_1C4CFF000, v496, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Unsupported device capability check response from the server: Zone usage blob version %ld is not supported. zoneID: %@\"", buf, 0x20u);
      }
      v103 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v104 = *MEMORY[0x1E4F19C40];
      objc_msgSend_requestUUID(self, v101, v102);
      id v687 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v103, v105, v104, 160, @"Unsupported zone usage version in device capability check response for request %@", v687);
      v68 = LABEL_73:;
LABEL_74:
      v173 = 0;
      v686 = 0;
      v684 = 0;
      v69 = 0;
      unsigned int v689 = 0;
      v694 = 0;
      int v70 = 0;
      int v676 = 10;
LABEL_192:

LABEL_193:
      if (v676)
      {

        uint64_t v60 = v26;
        v61 = v48;
        int v63 = 0;
        if (v68) {
          goto LABEL_42;
        }
LABEL_195:
        if (v70)
        {
          v464 = objc_msgSend_supportedDeviceCapabilitiesCheckedForZoneBlock(self, v106, v107);

          if (v464)
          {
            v465 = [CKDDeviceCapabilityCheckResult alloc];
            v45 = v694;
            if (v63)
            {
              inited = objc_msgSend_initSupported(v465, v466, v467);
              v48 = v61;
            }
            else
            {
              v48 = v61;
              inited = objc_msgSend_initNotSupportedWithUserID_publicKeys_canValidateWithKT_shareID_(v465, v466, (uint64_t)v694, v61, v689, v69);
            }
            objc_msgSend_supportedDeviceCapabilitiesCheckedForZoneBlock(self, v468, v469);
            v471 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
            v474 = objc_msgSend_result(v4, v472, v473);
            v26 = v60;
            ((void (**)(void, void *, void *, void *, void *))v471)[2](v471, v15, v60, inited, v474);

            v68 = 0;
            goto LABEL_45;
          }
          v68 = 0;
          goto LABEL_43;
        }
        v48 = v61;
        v26 = v60;
        uint64_t v27 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
        v29 = (void *)MEMORY[0x1E4F1A550];
        v30 = (id *)MEMORY[0x1E4F1A530];
LABEL_17:
        id v71 = *v27;
        if (*v29 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v71);
        }

        v72 = *v30;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          id v110 = objc_msgSend_requestUUID(self, v73, v74);
          long long v113 = objc_msgSend_result(v4, v111, v112);
          *(_DWORD *)buf = 138543874;
          v707 = v110;
          __int16 v708 = 2112;
          id v709 = v113;
          __int16 v710 = 2112;
          uint64_t v711 = (uint64_t)v15;
          _os_log_error_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Incomplete device capability check response from the server: %@, zoneID: %@\"", buf, 0x20u);
        }
        v75 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v76 = *MEMORY[0x1E4F19C40];
        uint64_t v79 = objc_msgSend_requestUUID(self, v77, v78);
        v68 = objc_msgSend_errorWithDomain_code_format_(v75, v80, v76, 161, @"Incomplete device capability check response for request %@", v79);

        objc_msgSend_reportClientValidationError_forZoneID_capabilitySet_(self, v81, (uint64_t)v68, v15, v26);
        goto LABEL_44;
      }
      uint64_t v60 = v26;
      v61 = v48;
      int v63 = 0;
LABEL_41:

      if (v68)
      {
LABEL_42:
        objc_msgSend_reportClientValidationError_forZoneID_capabilitySet_(self, v106, (uint64_t)v68, v15, v60);
LABEL_43:
        v48 = v61;
        v26 = v60;
LABEL_44:
        v45 = v694;
LABEL_45:

        goto LABEL_46;
      }
      goto LABEL_195;
    }
    if (objc_msgSend_hasSignature(v95, v98, v99)
      && (objc_msgSend_signature(v95, v129, v130),
          v131 = objc_claimAutoreleasedReturnValue(),
          uint64_t v134 = objc_msgSend_length(v131, v132, v133),
          v131,
          v134))
    {
      v135 = objc_msgSend_container(self, v129, v130);
      v138 = objc_msgSend_pcsManager(v135, v136, v137);
      v141 = objc_msgSend_signature(v95, v139, v140);
      v144 = objc_msgSend_serializedObject(v95, v142, v143);
      id v705 = 0;
      char v695 = objc_msgSend_validateFullPublicKeySignature_forSignedData_error_(v138, v145, (uint64_t)v141, v144, &v705);
      id v687 = v705;

      if ((v695 & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v53 = v685;
        v406 = (void *)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
        {
          v532 = v406;
          v535 = objc_msgSend_requestUUID(self, v533, v534);
          *(_DWORD *)buf = 138543874;
          v707 = v535;
          __int16 v708 = 2112;
          id v709 = v687;
          __int16 v710 = 2112;
          uint64_t v711 = (uint64_t)v15;
          _os_log_error_impl(&dword_1C4CFF000, v532, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Zone usage signature validation failed: %@ zoneID: %@\"", buf, 0x20u);
        }
        v409 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v410 = *MEMORY[0x1E4F19C40];
        v411 = objc_msgSend_requestUUID(self, v407, v408);
        v68 = objc_msgSend_errorWithDomain_code_error_format_(v409, v412, v410, 161, v687, @"Failed to validate zone usage signature in device capability check response for request %@", v411);

        goto LABEL_74;
      }
      int canValidateWithKT = objc_msgSend_canValidateWithKT(v95, v146, v147);
      v150 = objc_msgSend_container(self, v148, v149);
      v153 = objc_msgSend_pcsManager(v150, v151, v152);
      v156 = objc_msgSend_signature(v95, v154, v155);
      id v704 = v687;
      v675 = objc_msgSend_publicKeyFromSignature_error_(v153, v157, (uint64_t)v156, &v704);
      id v158 = v704;

      uint64_t v27 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
      uint64_t v53 = v685;
      if (v158)
      {
        id v159 = (id)*MEMORY[0x1E4F1A548];
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v159);
        }

        v160 = (id)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
        {
          v564 = objc_msgSend_requestUUID(self, v161, v162);
          *(_DWORD *)buf = 138543618;
          v707 = v564;
          __int16 v708 = 2112;
          id v709 = v158;
          _os_log_error_impl(&dword_1C4CFF000, v160, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to extract public key from the signature: %@\"", buf, 0x16u);
        }
      }

      v30 = (id *)MEMORY[0x1E4F1A530];
    }
    else
    {
      v163 = objc_msgSend_options(self, v129, v130);
      int v166 = objc_msgSend_excludeDevicesWithoutCapabilityCheckingSupport(v163, v164, v165);

      if (v166)
      {
        uint64_t v53 = v685;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v27);
        }
        id v167 = *v30;
        if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
        {
          v492 = v167;
          v495 = objc_msgSend_requestUUID(self, v493, v494);
          *(_DWORD *)buf = 138543362;
          v707 = v495;
          _os_log_error_impl(&dword_1C4CFF000, v492, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server. Server returned isSupported:NO for a device without capability checking support, when devices without capability checking support should have been excluded.\"", buf, 0xCu);
        }
        v170 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v171 = *MEMORY[0x1E4F19C40];
        objc_msgSend_requestUUID(self, v168, v169);
        id v687 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v170, v172, v171, 161, @"Device without capability checking support should have been excluded, but was returned by server in request: %@", v687);
        goto LABEL_73;
      }
      int canValidateWithKT = 0;
      v675 = 0;
      uint64_t v53 = v685;
    }
    v258 = [CKDPZoneUsage alloc];
    v261 = objc_msgSend_serializedObject(v688, v259, v260);
    v263 = objc_msgSend_initWithData_(v258, v262, (uint64_t)v261);

    id v687 = v263;
    if (objc_msgSend_hasVersion(v263, v264, v265) && (int)objc_msgSend_version(v263, v266, v267) >= 2)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v27);
      }
      id v268 = *v30;
      if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
      {
        v536 = v268;
        v539 = objc_msgSend_requestUUID(self, v537, v538);
        int v542 = objc_msgSend_version(v687, v540, v541);
        *(_DWORD *)buf = 138543874;
        v707 = v539;
        __int16 v708 = 2048;
        id v709 = (id)v542;
        __int16 v710 = 2112;
        uint64_t v711 = (uint64_t)v15;
        _os_log_error_impl(&dword_1C4CFF000, v536, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Unsupported device capability check response from the server: Zone usage version %ld is not supported. zoneID: %@\"", buf, 0x20u);
      }
      v271 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v272 = *MEMORY[0x1E4F19C40];
      v273 = objc_msgSend_requestUUID(self, v269, v270);
      objc_msgSend_errorWithDomain_code_format_(v271, v274, v272, 160, @"Unsupported zone usage version in device capability check response for request %@", v273);
      v68 = LABEL_133:;

      v686 = 0;
      v684 = 0;
      v69 = 0;
      unsigned int v689 = 0;
      v694 = 0;
      int v70 = 0;
      int v676 = 10;
      v173 = v675;
      goto LABEL_192;
    }
    v275 = v263;
    v276 = (void *)MEMORY[0x1E4F1A550];
    if (!v275
      || !objc_msgSend_hasZoneIdentifier(v275, v266, v267)
      || !objc_msgSend_hasUserIdentifier(v275, v277, v278)
      || !objc_msgSend_hasDeviceIdentifier(v275, v279, v280)
      || (objc_msgSend_hasTime(v275, v281, v282) & 1) == 0)
    {
      if (*v276 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v27);
      }
      id v318 = *v30;
      if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
      {
        v488 = v318;
        v491 = objc_msgSend_requestUUID(self, v489, v490);
        *(_DWORD *)buf = 138543874;
        v707 = v491;
        __int16 v708 = 2112;
        id v709 = v687;
        __int16 v710 = 2112;
        uint64_t v711 = (uint64_t)v15;
        _os_log_error_impl(&dword_1C4CFF000, v488, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Invalid zone usage content: %@, zoneID: %@\"", buf, 0x20u);
      }
      v321 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v322 = *MEMORY[0x1E4F19C40];
      v273 = objc_msgSend_requestUUID(self, v319, v320);
      objc_msgSend_errorWithDomain_code_format_(v321, v323, v322, 161, @"Invalid zone usage content in device capability check response for request %@", v273);
      goto LABEL_133;
    }
    v285 = objc_msgSend_translator(self, v283, v284);
    v288 = objc_msgSend_time(v275, v286, v287);
    v686 = objc_msgSend_dateFromPDate_(v285, v289, (uint64_t)v288);

    v292 = objc_msgSend_deviceIdentifier(v275, v290, v291);
    v684 = objc_msgSend_name(v292, v293, v294);

    v297 = objc_msgSend_userIdentifier(v275, v295, v296);
    objc_msgSend_name(v297, v298, v299);
    v694 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();

    v302 = objc_msgSend_translator(self, v300, v301);
    v305 = objc_msgSend_zoneIdentifier(v275, v303, v304);
    id v703 = 0;
    v307 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(v302, v306, (uint64_t)v305, &v703);
    id v673 = v703;

    v650 = v48;
    if (objc_msgSend_isEqual_(v307, v308, (uint64_t)v15))
    {
      v311 = objc_msgSend_translator(self, v309, v310);
      v314 = objc_msgSend_containerScopedUserID(v311, v312, v313);
      char isEqual = objc_msgSend_isEqual_(v694, v315, (uint64_t)v314);

      if (isEqual)
      {
        v68 = 0;
        int v676 = 0;
        int v317 = 1;
LABEL_238:

        BOOL v114 = canValidateWithKT != 0;
        if (!v317)
        {
          v69 = 0;
          unsigned int v689 = 0;
          int v70 = 0;
          v48 = v650;
          goto LABEL_241;
        }
        v48 = v650;
        uint64_t v27 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
        uint64_t v53 = v685;
        int hasSignedShareUsage = objc_msgSend_hasSignedShareUsage(v685, v595, v596);
LABEL_49:
        if (!hasSignedShareUsage)
        {
          unsigned int v689 = v114;
          v69 = 0;
LABEL_76:
          v174 = objc_msgSend_options(self, v116, v117);
          uint64_t v177 = objc_msgSend_excludeZoneAccessBefore(v174, v175, v176);

          v688 = (void *)v177;
          if (v177)
          {
            objc_msgSend_timeIntervalSinceDate_(v686, v178, v177);
            if (v180 < 0.0)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v53 = v685;
              id v181 = *v30;
              if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
              {
                v503 = v181;
                v506 = objc_msgSend_requestUUID(self, v504, v505);
                *(_DWORD *)buf = 138544130;
                v707 = v506;
                __int16 v708 = 2112;
                id v709 = v686;
                __int16 v710 = 2112;
                uint64_t v711 = (uint64_t)v688;
                __int16 v712 = 2112;
                v713 = v15;
                _os_log_error_impl(&dword_1C4CFF000, v503, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server: Zone/share usage blob date is too old: %@ (vs. %@), zoneID: %@\"", buf, 0x2Au);
              }
              v184 = (void *)MEMORY[0x1E4F1A280];
              uint64_t v185 = *MEMORY[0x1E4F19C40];
              objc_msgSend_requestUUID(self, v182, v183);
              id v687 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v667 = objc_msgSend_errorWithDomain_code_format_(v184, v186, v185, 161, @"Invalid zone/share usage date (%@) in device capability check response for request %@", v686, v687);
              unsigned int v689 = 0;
              int v70 = 0;
              int v676 = 10;
              v173 = v675;
              goto LABEL_190;
            }
          }
          uint64_t v53 = v685;
          v217 = objc_msgSend_signedSupportedAdopterCapabilities(v685, v178, v179);
          id v687 = v217;
          if (objc_msgSend_hasVersion(v217, v218, v219)
            && (int)objc_msgSend_version(v217, v220, v221) >= 2)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v222 = *v30;
            if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
            {
              v557 = v222;
              v560 = objc_msgSend_requestUUID(self, v558, v559);
              int v563 = objc_msgSend_version(v687, v561, v562);
              *(_DWORD *)buf = 138543874;
              v707 = v560;
              __int16 v708 = 2048;
              id v709 = (id)v563;
              __int16 v710 = 2112;
              uint64_t v711 = (uint64_t)v15;
              _os_log_error_impl(&dword_1C4CFF000, v557, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Unsupported device capability check response from the server: Device capabilities blob version %ld is not supported. zoneID: %@\"", buf, 0x20u);
            }
            v225 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v226 = *MEMORY[0x1E4F19C40];
            objc_msgSend_requestUUID(self, v223, v224);
            id v665 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v225, v227, v226, 160, @"Unsupported device capabilities version in device capability check response for request %@", v665);
            uint64_t v667 = LABEL_147:;
            unsigned int v689 = 0;
            int v70 = 0;
            int v676 = 10;
LABEL_148:
            v173 = v675;
LABEL_189:

            v68 = v665;
LABEL_190:

            goto LABEL_191;
          }
          if (objc_msgSend_hasSignature(v217, v220, v221)
            && (objc_msgSend_signature(v217, v228, v229),
                v679 = objc_claimAutoreleasedReturnValue(),
                uint64_t v670 = objc_msgSend_length(v679, v230, v231),
                v679,
                v670))
          {
            v660 = objc_msgSend_container(self, v228, v229);
            v680 = objc_msgSend_pcsManager(v660, v232, v233);
            v671 = objc_msgSend_signature(v217, v234, v235);
            v653 = objc_msgSend_serializedObject(v217, v236, v237);
            id v698 = 0;
            char v656 = objc_msgSend_validateFullPublicKeySignature_forSignedData_error_(v680, v238, (uint64_t)v671, v653, &v698);
            id v665 = v698;

            if ((v656 & 1) == 0)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              id v482 = *v30;
              if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
              {
                v597 = v482;
                v600 = objc_msgSend_requestUUID(self, v598, v599);
                *(_DWORD *)buf = 138543874;
                v707 = v600;
                __int16 v708 = 2112;
                id v709 = v665;
                __int16 v710 = 2112;
                uint64_t v711 = (uint64_t)v15;
                _os_log_error_impl(&dword_1C4CFF000, v597, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Device capabilities signature validation failed: %@, zoneID: %@\"", buf, 0x20u);
              }
              v485 = (void *)MEMORY[0x1E4F1A280];
              uint64_t v692 = *MEMORY[0x1E4F19C40];
              uint64_t v486 = objc_msgSend_requestUUID(self, v483, v484);
              uint64_t v667 = objc_msgSend_errorWithDomain_code_error_format_(v485, v487, v692, 161, v665, @"Failed to validate device capabilities signature in device capability check response for request %@", v486);

              unsigned int v689 = 0;
              int v70 = 0;
              int v676 = 10;
              v68 = (void *)v486;
              goto LABEL_148;
            }
            int v672 = objc_msgSend_canValidateWithKT(v217, v239, v240);
            v661 = objc_msgSend_container(self, v241, v242);
            v681 = objc_msgSend_pcsManager(v661, v243, v244);
            v652 = objc_msgSend_signature(v217, v245, v246);
            id v697 = v665;
            uint64_t v657 = objc_msgSend_publicKeyFromSignature_error_(v681, v247, (uint64_t)v652, &v697);
            id v654 = v697;

            id v665 = (id)v657;
          }
          else
          {
            v341 = objc_msgSend_options(self, v228, v229);
            int v682 = objc_msgSend_excludeDevicesWithoutCapabilityCheckingSupport(v341, v342, v343);

            if (v682)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              id v344 = *v30;
              if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
              {
                v553 = v344;
                v556 = objc_msgSend_requestUUID(self, v554, v555);
                *(_DWORD *)buf = 138543362;
                v707 = v556;
                _os_log_error_impl(&dword_1C4CFF000, v553, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server. Server returned isSupported:NO for a device without capability checking support, when devices without capability checking support should have been excluded.\"", buf, 0xCu);
              }
              v347 = (void *)MEMORY[0x1E4F1A280];
              uint64_t v348 = *MEMORY[0x1E4F19C40];
              objc_msgSend_requestUUID(self, v345, v346);
              id v665 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_format_(v347, v349, v348, 161, @"Device without capability checking support should have been excluded, but was returned by server in request: %@", v665);
              goto LABEL_147;
            }
            id v665 = 0;
            int v672 = 0;
          }
          v683 = [CKDPSupportedCapabilities alloc];
          v415 = objc_msgSend_serializedObject(v687, v413, v414);
          v663 = objc_msgSend_initWithData_(v683, v416, (uint64_t)v415);

          if (!v663
            || !objc_msgSend_hasUserIdentifier(v663, v417, v418)
            || !objc_msgSend_hasDeviceIdentifier(v663, v419, v420)
            || (objc_msgSend_hasTime(v663, v421, v422) & 1) == 0)
          {
            id v453 = (id)*MEMORY[0x1E4F1A548];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v453);
            }

            v454 = *v30;
            if (os_log_type_enabled(v454, OS_LOG_TYPE_ERROR))
            {
              v531 = objc_msgSend_requestUUID(self, v455, v456);
              *(_DWORD *)buf = 138543874;
              v707 = v531;
              __int16 v708 = 2112;
              id v709 = v663;
              __int16 v710 = 2112;
              uint64_t v711 = (uint64_t)v15;
              _os_log_error_impl(&dword_1C4CFF000, v454, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Invalid device capabilities content: %@, zoneID: %@\"", buf, 0x20u);
            }
            v457 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v458 = *MEMORY[0x1E4F19C40];
            v659 = objc_msgSend_requestUUID(self, v459, v460);
            uint64_t v462 = objc_msgSend_errorWithDomain_code_format_(v457, v461, v458, 161, @"Invalid device capabilities content in device capability check response for request %@", v659);
            unsigned int v689 = 0;
            int v70 = 0;
            v463 = v68;
            int v676 = 10;
            v68 = (void *)v462;
            v173 = v675;
            goto LABEL_188;
          }
          v425 = v48;
          v426 = objc_msgSend_userIdentifier(v663, v423, v424);
          v429 = objc_msgSend_name(v426, v427, v428);

          v432 = objc_msgSend_deviceIdentifier(v663, v430, v431);
          v655 = objc_msgSend_name(v432, v433, v434);

          v659 = v429;
          v649 = v26;
          if (!objc_msgSend_isEqual_(v429, v435, (uint64_t)v694)
            || (objc_msgSend_isEqual_(v655, v436, (uint64_t)v684) & 1) == 0)
          {
            id v511 = (id)*MEMORY[0x1E4F1A548];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v511);
            }

            v512 = (id)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled(v512, OS_LOG_TYPE_ERROR))
            {
              v623 = objc_msgSend_requestUUID(self, v513, v514);
              *(_DWORD *)buf = 138544642;
              v707 = v623;
              __int16 v708 = 2112;
              id v709 = v429;
              __int16 v710 = 2112;
              uint64_t v711 = (uint64_t)v694;
              __int16 v712 = 2112;
              v713 = v655;
              __int16 v714 = 2112;
              v715 = v684;
              __int16 v716 = 2112;
              v717 = v15;
              _os_log_error_impl(&dword_1C4CFF000, v512, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Device capabilities have different userID and/or deviceID than the zone/share usage. userID: %@ vs. %@, deviceID: %@ vs. %@, zoneID: %@\"", buf, 0x3Eu);
            }
            v515 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v516 = *MEMORY[0x1E4F19C40];
            v441 = objc_msgSend_requestUUID(self, v517, v518);
            objc_msgSend_errorWithDomain_code_format_(v515, v519, v516, 161, @"Inconsistent device capabilities and usage in device capability check response for request %@", v441);
            unsigned int v689 = 0;
            int v70 = 0;
            v450 = v68;
            v68 = int v676 = 10;
            goto LABEL_250;
          }
          v439 = objc_msgSend_translator(self, v437, v438);
          v441 = objc_msgSend_deviceCapabilitySetFromPDeviceCapabilitySet_(v439, v440, (uint64_t)v663);

          if (objc_msgSend_isCapabilitySet_subsetOf_(MEMORY[0x1E4F19F58], v442, (uint64_t)v26, v441))
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v445 = (void *)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
            {
              v643 = v445;
              v646 = objc_msgSend_requestUUID(self, v644, v645);
              *(_DWORD *)buf = 138544130;
              v707 = v646;
              __int16 v708 = 2112;
              id v709 = v649;
              __int16 v710 = 2112;
              uint64_t v711 = (uint64_t)v441;
              __int16 v712 = 2112;
              v713 = v15;
              _os_log_error_impl(&dword_1C4CFF000, v643, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Server returned isSupported:NO, but the returned device capabilities do support the requested capabilities. requested: %@, returned: %@, zoneID: %@\"", buf, 0x2Au);
            }
            v448 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v449 = *MEMORY[0x1E4F19C40];
            v450 = objc_msgSend_requestUUID(self, v446, v447);
            uint64_t v452 = objc_msgSend_errorWithDomain_code_format_(v448, v451, v449, 161, @"Incorrect device capability check response for request %@", v450);
          }
          else
          {
            v602 = objc_msgSend_translator(self, v443, v444);
            v605 = objc_msgSend_time(v663, v603, v604);
            v450 = objc_msgSend_dateFromPDate_(v602, v606, (uint64_t)v605);

            objc_msgSend_timeIntervalSinceNow(v450, v607, v608);
            if (v611 >= -16070400.0)
            {
              objc_msgSend_timeIntervalSinceNow(v686, v609, v610);
              if (v613 >= -16070400.0)
              {
                if (objc_msgSend_isEqualToData_(v675, v612, (uint64_t)v665))
                {
                  if (v675 && objc_msgSend_length(v675, v625, v626)) {
                    objc_msgSend_addObject_(v425, v627, (uint64_t)v675);
                  }
                }
                else if (v689 == v672)
                {
                  if (v675 && objc_msgSend_length(v675, v625, v626)) {
                    objc_msgSend_addObject_(v425, v625, (uint64_t)v675);
                  }
                  if (v665 && objc_msgSend_length(v665, v625, v626)) {
                    objc_msgSend_addObject_(v425, v642, (uint64_t)v665);
                  }
                }
                else
                {
                  v636 = v675;
                  if (v689) {
                    v636 = v665;
                  }
                  id v637 = v636;
                  v640 = v637;
                  if (v637 && objc_msgSend_length(v637, v638, v639)) {
                    objc_msgSend_addObject_(v425, v641, (uint64_t)v640);
                  }

                  unsigned int v689 = 0;
                }
                int v676 = 0;
                int v70 = 1;
                goto LABEL_250;
              }
            }
            id v614 = (id)*MEMORY[0x1E4F1A548];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v614);
            }

            v615 = (id)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled(v615, OS_LOG_TYPE_ERROR))
            {
              v647 = objc_msgSend_requestUUID(self, v616, v617);
              *(_DWORD *)buf = 138544130;
              v707 = v647;
              __int16 v708 = 2112;
              id v709 = v450;
              __int16 v710 = 2112;
              uint64_t v711 = (uint64_t)v686;
              __int16 v712 = 2112;
              v713 = v15;
              _os_log_error_impl(&dword_1C4CFF000, v615, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Server returned device capabilities and/or zone/share usage that is too far in the past: %@ and %@, zoneID: %@\"", buf, 0x2Au);
            }
            v618 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v693 = *MEMORY[0x1E4F19C40];
            v621 = objc_msgSend_requestUUID(self, v619, v620);
            uint64_t v452 = objc_msgSend_errorWithDomain_code_format_(v618, v622, v693, 161, @"Obsolete device capability check response for request %@", v621);
          }
          unsigned int v689 = 0;
          int v70 = 0;
          int v676 = 10;
          v68 = (void *)v452;
LABEL_250:

          v48 = v425;
          v26 = v649;
          uint64_t v53 = v685;
          v173 = v675;
          v463 = v655;
LABEL_188:
          uint64_t v667 = (uint64_t)v68;

          v68 = v663;
          goto LABEL_189;
        }
        long long v118 = objc_msgSend_signedShareUsage(v53, v116, v117);
        v688 = v118;
        if (objc_msgSend_hasVersion(v118, v119, v120) && (int)objc_msgSend_version(v118, v121, v122) >= 2)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], *v27);
          }
          id v123 = *v30;
          uint64_t v53 = v685;
          if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
          {
            v524 = v123;
            v527 = objc_msgSend_requestUUID(self, v525, v526);
            int v530 = objc_msgSend_version(v688, v528, v529);
            *(_DWORD *)buf = 138543874;
            v707 = v527;
            __int16 v708 = 2048;
            id v709 = (id)v530;
            __int16 v710 = 2112;
            uint64_t v711 = (uint64_t)v15;
            _os_log_error_impl(&dword_1C4CFF000, v524, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Unsupported device capability check response from the server: Share usage blob version %ld is not supported. zoneID: %@\"", buf, 0x20u);
          }
          v126 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v127 = *MEMORY[0x1E4F19C40];
          objc_msgSend_requestUUID(self, v124, v125);
          id v687 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(v126, v128, v127, 160, @"Unsupported share usage version in device capability check response for request %@", v687);
          uint64_t v667 = LABEL_110:;
LABEL_111:
          v173 = v675;

LABEL_164:
          v69 = 0;
          unsigned int v689 = 0;
          int v70 = 0;
          int v676 = 10;
LABEL_191:
          v68 = (void *)v667;
          goto LABEL_192;
        }
        unsigned int v689 = v114;
        if (objc_msgSend_hasSignature(v118, v121, v122)
          && (objc_msgSend_signature(v118, v187, v188),
              v189 = objc_claimAutoreleasedReturnValue(),
              uint64_t v192 = objc_msgSend_length(v189, v190, v191),
              v189,
              v192))
        {
          v691 = objc_msgSend_container(self, v187, v188);
          v668 = objc_msgSend_pcsManager(v691, v193, v194);
          v197 = objc_msgSend_signature(v118, v195, v196);
          v200 = objc_msgSend_serializedObject(v118, v198, v199);
          id v702 = 0;
          char v677 = objc_msgSend_validateFullPublicKeySignature_forSignedData_error_(v668, v201, (uint64_t)v197, v200, &v702);
          id v687 = v702;

          if ((v677 & 1) == 0)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v53 = v685;
            id v475 = *v30;
            if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
            {
              v565 = v475;
              v568 = objc_msgSend_requestUUID(self, v566, v567);
              *(_DWORD *)buf = 138543874;
              v707 = v568;
              __int16 v708 = 2112;
              id v709 = v687;
              __int16 v710 = 2112;
              uint64_t v711 = (uint64_t)v15;
              _os_log_error_impl(&dword_1C4CFF000, v565, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Share usage signature validation failed: %@ zoneID: %@\"", buf, 0x20u);
            }
            v478 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v479 = *MEMORY[0x1E4F19C40];
            uint64_t v480 = objc_msgSend_requestUUID(self, v476, v477);
            uint64_t v667 = objc_msgSend_errorWithDomain_code_error_format_(v478, v481, v479, 161, v687, @"Failed to validate share usage signature in device capability check response for request %@", v480);

            v68 = (void *)v480;
            goto LABEL_111;
          }
          unsigned int v689 = objc_msgSend_canValidateWithKT(v118, v202, v203);
          v669 = objc_msgSend_container(self, v204, v205);
          v664 = objc_msgSend_pcsManager(v669, v206, v207);
          v210 = objc_msgSend_signature(v118, v208, v209);
          id v701 = v687;
          uint64_t v678 = objc_msgSend_publicKeyFromSignature_error_(v664, v211, (uint64_t)v210, &v701);
          id v212 = v701;

          if (v212)
          {
            id v213 = (id)*MEMORY[0x1E4F1A548];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v213);
            }

            v214 = *v30;
            if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
            {
              v601 = objc_msgSend_requestUUID(self, v215, v216);
              *(_DWORD *)buf = 138543618;
              v707 = v601;
              __int16 v708 = 2112;
              id v709 = v212;
              _os_log_error_impl(&dword_1C4CFF000, v214, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to extract public key from the signature: %@\"", buf, 0x16u);
            }
          }

          v675 = (void *)v678;
        }
        else
        {
          v248 = objc_msgSend_options(self, v187, v188);
          int v251 = objc_msgSend_excludeDevicesWithoutCapabilityCheckingSupport(v248, v249, v250);

          if (v251)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v53 = v685;
            id v252 = *v30;
            if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
            {
              v520 = v252;
              v523 = objc_msgSend_requestUUID(self, v521, v522);
              *(_DWORD *)buf = 138543362;
              v707 = v523;
              _os_log_error_impl(&dword_1C4CFF000, v520, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server. Server returned isSupported:NO for a device without capability checking support, when devices without capability checking support should have been excluded.\"", buf, 0xCu);
            }
            v255 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v256 = *MEMORY[0x1E4F19C40];
            objc_msgSend_requestUUID(self, v253, v254);
            id v687 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v255, v257, v256, 161, @"Device without capability checking support should have been excluded, but was returned by server in request: %@", v687);
            goto LABEL_110;
          }
        }
        v324 = [CKDPShareUsage alloc];
        v327 = objc_msgSend_serializedObject(v688, v325, v326);
        v329 = objc_msgSend_initWithData_(v324, v328, (uint64_t)v327);

        uint64_t v53 = v685;
        id v687 = v329;
        if (objc_msgSend_hasVersion(v329, v330, v331) && (int)objc_msgSend_version(v329, v332, v333) >= 2)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v334 = *v30;
          if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
          {
            v569 = v334;
            v572 = objc_msgSend_requestUUID(self, v570, v571);
            int v575 = objc_msgSend_version(v687, v573, v574);
            *(_DWORD *)buf = 138543874;
            v707 = v572;
            __int16 v708 = 2048;
            id v709 = (id)v575;
            __int16 v710 = 2112;
            uint64_t v711 = (uint64_t)v15;
            _os_log_error_impl(&dword_1C4CFF000, v569, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Unsupported device capability check response from the server: Share usage version %ld is not supported. zoneID: %@\"", buf, 0x20u);
          }
          v337 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v338 = *MEMORY[0x1E4F19C40];
          v339 = objc_msgSend_requestUUID(self, v335, v336);
          objc_msgSend_errorWithDomain_code_format_(v337, v340, v338, 160, @"Unsupported share usage version in device capability check response for request %@", v339);
          uint64_t v667 = LABEL_163:;
          v173 = v675;

          goto LABEL_164;
        }
        if (!v329
          || !objc_msgSend_hasShareIdentifier(v329, v332, v333)
          || !objc_msgSend_hasUserIdentifier(v329, v350, v351)
          || !objc_msgSend_hasDeviceIdentifier(v329, v352, v353)
          || (objc_msgSend_hasTime(v329, v354, v355) & 1) == 0)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v400 = *v30;
          if (os_log_type_enabled((os_log_t)*v30, OS_LOG_TYPE_ERROR))
          {
            v507 = v400;
            v510 = objc_msgSend_requestUUID(self, v508, v509);
            *(_DWORD *)buf = 138543874;
            v707 = v510;
            __int16 v708 = 2112;
            id v709 = v687;
            __int16 v710 = 2112;
            uint64_t v711 = (uint64_t)v15;
            _os_log_error_impl(&dword_1C4CFF000, v507, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Invalid share usage content: %@, zoneID: %@\"", buf, 0x20u);
          }
          v403 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v404 = *MEMORY[0x1E4F19C40];
          v339 = objc_msgSend_requestUUID(self, v401, v402);
          objc_msgSend_errorWithDomain_code_format_(v403, v405, v404, 161, @"Invalid share usage content in device capability check response for request %@", v339);
          goto LABEL_163;
        }
        uint64_t v674 = (uint64_t)v15;
        v648 = v26;
        v651 = v48;
        objc_msgSend_translator(self, v356, v357);
        v359 = v358 = v329;
        v362 = objc_msgSend_time(v358, v360, v361);
        uint64_t v666 = objc_msgSend_dateFromPDate_(v359, v363, (uint64_t)v362);

        v366 = objc_msgSend_deviceIdentifier(v358, v364, v365);
        uint64_t v662 = objc_msgSend_name(v366, v367, v368);

        v371 = objc_msgSend_userIdentifier(v358, v369, v370);
        uint64_t v658 = objc_msgSend_name(v371, v372, v373);

        v376 = objc_msgSend_translator(self, v374, v375);
        v377 = v358;
        v380 = objc_msgSend_shareIdentifier(v358, v378, v379);
        id v700 = 0;
        v69 = objc_msgSend_recordIDFromPShareIdentifier_error_(v376, v381, (uint64_t)v380, &v700);
        id v382 = v700;

        if (!v69)
        {
          v385 = objc_msgSend_translator(self, v383, v384);
          v388 = objc_msgSend_shareIdentifier(v377, v386, v387);
          v391 = objc_msgSend_zoneIdentifier(v388, v389, v390);
          id v699 = v382;
          v393 = objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(v385, v392, (uint64_t)v391, &v699);
          id v394 = v699;

          id v395 = objc_alloc(MEMORY[0x1E4F1A2F8]);
          v69 = objc_msgSend_initWithRecordName_zoneID_(v395, v396, @"(rdar://136681514)", v393);

          id v382 = v394;
        }
        v397 = objc_msgSend_zoneID(v69, v383, v384);
        int v399 = objc_msgSend_isEqual_(v397, v398, v674);
        if (v399)
        {
          int v676 = 0;
        }
        else
        {
          id v576 = (id)*MEMORY[0x1E4F1A548];
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v576);
          }

          v577 = (id)*MEMORY[0x1E4F1A530];
          if (os_log_type_enabled(v577, OS_LOG_TYPE_ERROR))
          {
            v628 = objc_msgSend_requestUUID(self, v578, v579);
            *(_DWORD *)buf = 138543874;
            v707 = v628;
            __int16 v708 = 2112;
            id v709 = v397;
            __int16 v710 = 2112;
            uint64_t v711 = v674;
            _os_log_error_impl(&dword_1C4CFF000, v577, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Share usage is for a different zone: %@ (expected %@)\"", buf, 0x20u);
          }
          v696 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v580 = *MEMORY[0x1E4F19C40];
          v583 = objc_msgSend_requestUUID(self, v581, v582);
          uint64_t v585 = objc_msgSend_errorWithDomain_code_error_format_(v696, v584, v580, 161, v382, @"Invalid share usage zone ID in device capability check response for request %@", v583);

          int v676 = 10;
          v68 = (void *)v585;
        }

        if (v399)
        {
          uint64_t v15 = (void *)v674;
          v686 = (void *)v666;
          v684 = (void *)v662;
          v694 = (void (**)(void, void, void, void))v658;
          v26 = v648;
          v48 = v651;
          v30 = (id *)MEMORY[0x1E4F1A530];
          goto LABEL_76;
        }
        unsigned int v689 = 0;
        int v70 = 0;
        uint64_t v15 = (void *)v674;
        v686 = (void *)v666;
        v684 = (void *)v662;
        v694 = (void (**)(void, void, void, void))v658;
        v26 = v648;
        v48 = v651;
LABEL_241:
        uint64_t v53 = v685;
        v173 = v675;
        goto LABEL_193;
      }
      id v586 = (id)*MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v586);
      }

      v587 = (id)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled(v587, OS_LOG_TYPE_ERROR))
      {
        v629 = objc_msgSend_requestUUID(self, v588, v589);
        v632 = objc_msgSend_translator(self, v630, v631);
        v635 = objc_msgSend_containerScopedUserID(v632, v633, v634);
        *(_DWORD *)buf = 138544130;
        v707 = v629;
        __int16 v708 = 2112;
        id v709 = v694;
        __int16 v710 = 2112;
        uint64_t v711 = (uint64_t)v635;
        __int16 v712 = 2112;
        v713 = v15;
        _os_log_error_impl(&dword_1C4CFF000, v587, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Zone usage is for a different user: %@ (expected %@), zoneID: %@\"", buf, 0x2Au);
      }
      v590 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v591 = *MEMORY[0x1E4F19C40];
      v551 = objc_msgSend_requestUUID(self, v592, v593);
      objc_msgSend_errorWithDomain_code_error_format_(v590, v594, v591, 161, v673, @"Invalid zone usage user ID in device capability check response for request %@", v551);
    }
    else
    {
      id v543 = *v27;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v543);
      }

      v544 = (id)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled(v544, OS_LOG_TYPE_ERROR))
      {
        v624 = objc_msgSend_requestUUID(self, v545, v546);
        *(_DWORD *)buf = 138543874;
        v707 = v624;
        __int16 v708 = 2112;
        id v709 = v307;
        __int16 v710 = 2112;
        uint64_t v711 = (uint64_t)v15;
        _os_log_error_impl(&dword_1C4CFF000, v544, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Invalid device capability check response from the server! Zone usage is for a different zone: %@ (expected %@)\"", buf, 0x20u);
      }
      v547 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v548 = *MEMORY[0x1E4F19C40];
      v551 = objc_msgSend_requestUUID(self, v549, v550);
      objc_msgSend_errorWithDomain_code_error_format_(v547, v552, v548, 161, v673, @"Invalid zone usage zone ID in device capability check response for request %@", v551);
    v68 = };

    int v317 = 0;
    int v676 = 10;
    goto LABEL_238;
  }
  v42 = objc_msgSend_errorFromServerBlock(self, v40, v41);

  if (v42)
  {
    objc_msgSend_errorFromServerBlock(self, v43, v44);
    v45 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_result(v4, v46, v47);
    ((void (**)(void, void *, void *, void *))v45)[2](v45, v15, v26, v48);
LABEL_46:
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_zoneIDByRequestID(self, v5, v6);
  v10 = objc_msgSend_response(v4, v8, v9);
  id v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  uint64_t v18 = objc_msgSend_capabililitySetsByRequestID(self, v16, v17);
  uint64_t v21 = objc_msgSend_response(v4, v19, v20);
  uint64_t v24 = objc_msgSend_operationUUID(v21, v22, v23);
  v26 = objc_msgSend_objectForKeyedSubscript_(v18, v25, (uint64_t)v24);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v27 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
  {
    v37 = v27;
    uint64_t v40 = objc_msgSend_requestUUID(self, v38, v39);
    v43 = objc_msgSend_response(v4, v41, v42);
    v46 = objc_msgSend_operationUUID(v43, v44, v45);
    int v47 = 138543874;
    v48 = v40;
    __int16 v49 = 2112;
    uint64_t v50 = v46;
    __int16 v51 = 2112;
    id v52 = v4;
    _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Parse failure in device capabilities check response, operationUUID: %@, responseObject: %@\"", (uint8_t *)&v47, 0x20u);
  }
  v30 = objc_msgSend_errorFromServerBlock(self, v28, v29);

  if (v30)
  {
    objc_msgSend_errorFromServerBlock(self, v31, v32);
    uint64_t v33 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v36 = objc_msgSend_result(v4, v34, v35);
    ((void (**)(void, void *, void *, void *))v33)[2](v33, v15, v26, v36);
  }
}

- (id)supportedDeviceCapabilitiesCheckedForZoneBlock
{
  return self->_supportedDeviceCapabilitiesCheckedForZoneBlock;
}

- (void)setSupportedDeviceCapabilitiesCheckedForZoneBlock:(id)a3
{
}

- (id)errorFromServerBlock
{
  return self->_errorFromServerBlock;
}

- (void)setErrorFromServerBlock:(id)a3
{
}

- (id)errorFromClientValidationBlock
{
  return self->_errorFromClientValidationBlock;
}

- (void)setErrorFromClientValidationBlock:(id)a3
{
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (void)setDesiredCapabilitySets:(id)a3
{
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSMutableDictionary)zoneIDByRequestID
{
  return self->_zoneIDByRequestID;
}

- (void)setZoneIDByRequestID:(id)a3
{
}

- (NSMutableDictionary)capabililitySetsByRequestID
{
  return self->_capabililitySetsByRequestID;
}

- (void)setCapabililitySetsByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabililitySetsByRequestID, 0);
  objc_storeStrong((id *)&self->_zoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_errorFromClientValidationBlock, 0);
  objc_storeStrong(&self->_errorFromServerBlock, 0);
  objc_storeStrong(&self->_supportedDeviceCapabilitiesCheckedForZoneBlock, 0);
}

@end