@interface CKDContainerSpecificInfoURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)allowsAuthedAccount;
- (BOOL)hasRequestBody;
- (BOOL)requireUserIDs;
- (BOOL)requiresConfiguration;
- (BOOL)requiresDeviceID;
- (BOOL)usesCloudKitAuthToken;
- (BOOL)usesiCloudAuthToken;
- (CKDContainerServerInfo)containerServerInfo;
- (CKDContainerSpecificInfoURLRequest)initWithOperation:(id)a3 containerIdentifier:(id)a4;
- (NSString)containerIdentifier;
- (id)url;
- (int64_t)partitionType;
- (int64_t)serverType;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseJSONObject:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setContainerServerInfo:(id)a3;
- (void)setRequireUserIDs:(BOOL)a3;
@end

@implementation CKDContainerSpecificInfoURLRequest

- (CKDContainerSpecificInfoURLRequest)initWithOperation:(id)a3 containerIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDContainerSpecificInfoURLRequest;
  v8 = [(CKDURLRequest *)&v11 initWithOperation:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_containerIdentifier, a4);
  }

  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDContainerSpecificInfoURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v9 fillOutEquivalencyPropertiesBuilder:v4];
  id v7 = objc_msgSend_containerIdentifier(self, v5, v6, v9.receiver, v9.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"containerIdentifier");
}

- (BOOL)requiresConfiguration
{
  return 0;
}

- (BOOL)requiresDeviceID
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_requireUserIDs(self, a2, v2) ^ 1;
}

- (BOOL)allowsAuthedAccount
{
  return 0;
}

- (BOOL)usesCloudKitAuthToken
{
  return 0;
}

- (BOOL)usesiCloudAuthToken
{
  return 1;
}

- (int64_t)serverType
{
  return 5;
}

- (int64_t)partitionType
{
  return 3;
}

- (id)url
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  id v7 = objc_msgSend_setupBaseURL(v4, v5, v6);

  objc_super v9 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E4F29088], v8, (uint64_t)v7, 1);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v13 = objc_msgSend_path(v9, v11, v12);
  if (v13)
  {
    v16 = (void *)v13;
    v17 = objc_msgSend_path(v9, v14, v15);
    uint64_t v20 = objc_msgSend_length(v17, v18, v19);

    if (v20)
    {
      v22 = objc_msgSend_path(v9, v14, v21);
      objc_msgSend_appendString_(v10, v23, (uint64_t)v22);
    }
  }
  objc_msgSend_appendString_(v10, v14, @"/setup/ck/v1/ckAppInit");
  objc_msgSend_setPath_(v9, v24, (uint64_t)v10);
  v38 = @"container";
  v27 = objc_msgSend_containerIdentifier(self, v25, v26);
  v39[0] = v27;
  v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v39, &v38, 1);

  v32 = objc_msgSend_CKPercentEscapedQueryString(v29, v30, v31);
  objc_msgSend_setPercentEncodedQuery_(v9, v33, (uint64_t)v32);

  v36 = objc_msgSend_URL(v9, v34, v35);

  return v36;
}

- (BOOL)hasRequestBody
{
  return 0;
}

- (void)requestDidParseJSONObject:(id)a3
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6))
  {
    v84 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v85 = *MEMORY[0x1E4F19DD8];
    v86 = objc_msgSend_containerIdentifier(self, v7, v8);
    v88 = objc_msgSend_errorWithDomain_code_format_(v84, v87, v85, 1014, @"Couldn't get container configuration from the server for container \"%@\"", v86);
    objc_msgSend_finishWithError_(self, v89, (uint64_t)v88);

    goto LABEL_69;
  }
  objc_super v9 = objc_opt_new();
  objc_msgSend_setContainerServerInfo_(self, v10, (uint64_t)v9);

  uint64_t v12 = objc_msgSend_CKFirstUrlForKeys_(v4, v11, (uint64_t)&unk_1F20AB670);
  uint64_t v15 = objc_msgSend_containerServerInfo(self, v13, v14);
  objc_msgSend_setPublicCloudDBURL_(v15, v16, (uint64_t)v12);

  uint64_t v19 = objc_msgSend_containerServerInfo(self, v17, v18);
  v22 = objc_msgSend_publicCloudDBURL(v19, v20, v21);

  v24 = (void *)MEMORY[0x1E4F1A550];
  if (!v22)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v25 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
    {
      v143 = v25;
      v146 = objc_msgSend_requestUUID(self, v144, v145);
      *(_DWORD *)buf = 138543362;
      v174 = v146;
      _os_log_error_impl(&dword_1C4CFF000, v143, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicCloudDBURL url\"", buf, 0xCu);
    }
  }
  uint64_t v26 = objc_msgSend_CKFirstUrlForKeys_(v4, v23, (uint64_t)&unk_1F20AB688);
  v29 = objc_msgSend_containerServerInfo(self, v27, v28);
  objc_msgSend_setPublicShareServiceURL_(v29, v30, (uint64_t)v26);

  v33 = objc_msgSend_containerServerInfo(self, v31, v32);
  v36 = objc_msgSend_publicShareServiceURL(v33, v34, v35);

  if (!v36)
  {
    if (*v24 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v38 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
    {
      v147 = v38;
      v150 = objc_msgSend_requestUUID(self, v148, v149);
      *(_DWORD *)buf = 138543362;
      v174 = v150;
      _os_log_error_impl(&dword_1C4CFF000, v147, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicShareServiceURL url\"", buf, 0xCu);
    }
  }
  v39 = objc_msgSend_CKFirstUrlForKeys_(v4, v37, (uint64_t)&unk_1F20AB6A0);
  v42 = objc_msgSend_containerServerInfo(self, v40, v41);
  objc_msgSend_setPublicDeviceServiceURL_(v42, v43, (uint64_t)v39);

  v46 = objc_msgSend_containerServerInfo(self, v44, v45);
  v49 = objc_msgSend_publicDeviceServiceURL(v46, v47, v48);

  if (!v49)
  {
    if (*v24 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v51 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
    {
      v151 = v51;
      v154 = objc_msgSend_requestUUID(self, v152, v153);
      *(_DWORD *)buf = 138543362;
      v174 = v154;
      _os_log_error_impl(&dword_1C4CFF000, v151, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicDeviceServiceURL url\"", buf, 0xCu);
    }
  }
  v52 = objc_msgSend_CKFirstUrlForKeys_(v4, v50, (uint64_t)&unk_1F20AB6B8);
  v55 = objc_msgSend_containerServerInfo(self, v53, v54);
  objc_msgSend_setPublicCodeServiceURL_(v55, v56, (uint64_t)v52);

  v59 = objc_msgSend_containerServerInfo(self, v57, v58);
  v62 = objc_msgSend_publicCodeServiceURL(v59, v60, v61);

  if (!v62)
  {
    if (*v24 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v64 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
    {
      v155 = v64;
      v158 = objc_msgSend_requestUUID(self, v156, v157);
      *(_DWORD *)buf = 138543362;
      v174 = v158;
      _os_log_error_impl(&dword_1C4CFF000, v155, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicCodeServiceURL url\"", buf, 0xCu);
    }
  }
  v65 = objc_msgSend_CKFirstUrlForKeys_(v4, v63, (uint64_t)&unk_1F20AB6D0);
  v68 = objc_msgSend_containerServerInfo(self, v66, v67);
  objc_msgSend_setPublicMetricsServiceURL_(v68, v69, (uint64_t)v65);

  v72 = objc_msgSend_containerServerInfo(self, v70, v71);
  v75 = objc_msgSend_publicMetricsServiceURL(v72, v73, v74);

  if (!v75)
  {
    if (*v24 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v77 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
    {
      v159 = v77;
      v162 = objc_msgSend_requestUUID(self, v160, v161);
      *(_DWORD *)buf = 138543362;
      v174 = v162;
      _os_log_error_impl(&dword_1C4CFF000, v159, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicMetricsServiceURL url\"", buf, 0xCu);
    }
  }
  v78 = objc_msgSend_objectForKeyedSubscript_(v4, v76, @"cloudKitUserId");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v90 = objc_msgSend_requireUserIDs(self, v79, v80);
    v91 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    v92 = (void *)*MEMORY[0x1E4F1A548];
    if (v90)
    {
      if (*v24 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v92);
      }
      v93 = (void *)*MEMORY[0x1E4F1A530];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      v96 = v93;
      v99 = objc_msgSend_requestUUID(self, v97, v98);
      *(_DWORD *)buf = 138543618;
      v174 = v99;
      __int16 v175 = 2114;
      v176 = v78;
      _os_log_error_impl(&dword_1C4CFF000, v96, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't parse a container scoped user id from %{public}@\"", buf, 0x16u);
    }
    else
    {
      if (*v24 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v92);
      }
      v100 = (void *)*MEMORY[0x1E4F1A530];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_38;
      }
      v96 = v100;
      v99 = objc_msgSend_requestUUID(self, v163, v164);
      *(_DWORD *)buf = 138543618;
      v174 = v99;
      __int16 v175 = 2114;
      v176 = v78;
      _os_log_debug_impl(&dword_1C4CFF000, v96, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Couldn't parse a container scoped user id from %{public}@\"", buf, 0x16u);
    }

LABEL_38:
    if (objc_msgSend_requireUserIDs(self, v94, v95))
    {
      v102 = objc_msgSend_iCloudAuthToken(self, v83, v101);
      uint64_t v105 = objc_msgSend_length(v102, v103, v104);

      if (!v105)
      {
        if (*v24 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v91);
        }
        v106 = (void *)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
        {
          v165 = v106;
          v168 = objc_msgSend_requestUUID(self, v166, v167);
          *(_DWORD *)buf = 138543362;
          v174 = v168;
          _os_log_debug_impl(&dword_1C4CFF000, v165, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Container scoped user ID was needed but not returned because we didn't have an iCloud auth token. Handling this as an auth failure.\"", buf, 0xCu);
        }
        objc_msgSend_setNeedsAuthRetry_(self, v107, 1);
      }
    }
    goto LABEL_45;
  }
  v81 = objc_msgSend_containerServerInfo(self, v79, v80);
  objc_msgSend_setContainerScopedUserID_(v81, v82, (uint64_t)v78);

LABEL_45:
  v108 = objc_msgSend_objectForKeyedSubscript_(v4, v83, @"orgInfo");
  v110 = objc_msgSend_objectForKeyedSubscript_(v108, v109, @"cloudKitOrgUserId");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v113 = objc_msgSend_containerServerInfo(self, v111, v112);
    objc_msgSend_setOrgAdminUserID_(v113, v114, (uint64_t)v110);
  }
  else
  {
    if (*v24 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v116 = (os_log_t *)MEMORY[0x1E4F1A530];
    v117 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
    {
      v139 = v117;
      v142 = objc_msgSend_requestUUID(self, v140, v141);
      *(_DWORD *)buf = 138543618;
      v174 = v142;
      __int16 v175 = 2114;
      v176 = v110;
      _os_log_debug_impl(&dword_1C4CFF000, v139, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Couldn't parse an org admin user id from %{public}@\"", buf, 0x16u);
    }
    if (objc_msgSend_requireUserIDs(self, v118, v119))
    {
      v121 = objc_msgSend_iCloudAuthToken(self, v115, v120);
      uint64_t v124 = objc_msgSend_length(v121, v122, v123);

      if (!v124)
      {
        if (*v24 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v125 = *v116;
        if (os_log_type_enabled(*v116, OS_LOG_TYPE_DEBUG))
        {
          v169 = v125;
          v172 = objc_msgSend_requestUUID(self, v170, v171);
          *(_DWORD *)buf = 138543362;
          v174 = v172;
          _os_log_debug_impl(&dword_1C4CFF000, v169, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Org Admin user ID was needed but not returned because we didn't have an iCloud auth token. Handling this as an auth failure.\"", buf, 0xCu);
        }
        objc_msgSend_setNeedsAuthRetry_(self, v126, 1);
      }
    }
  }
  v127 = objc_msgSend_objectForKeyedSubscript_(v4, v115, @"environment");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v130 = objc_msgSend_lowercaseString(v127, v128, v129);

    if ((objc_msgSend_isEqualToString_(v130, v131, @"production") & 1) != 0
      || !objc_msgSend_hasPrefix_(v130, v128, @"icloud"))
    {
      uint64_t v136 = 0;
    }
    else
    {
      v132 = objc_msgSend_substringWithRange_(v130, v128, 6, 1);
      uint64_t v135 = objc_msgSend_integerValue(v132, v133, v134);
      if ((unint64_t)(v135 - 1) >= 3) {
        uint64_t v136 = 0;
      }
      else {
        uint64_t v136 = v135;
      }
    }
    v127 = v130;
  }
  else
  {
    uint64_t v136 = 0;
  }
  v137 = objc_msgSend_containerServerInfo(self, v128, v129);
  objc_msgSend_setEnvironment_(v137, v138, v136);

LABEL_69:
}

- (BOOL)requireUserIDs
{
  return self->_requireUserIDs;
}

- (void)setRequireUserIDs:(BOOL)a3
{
  self->_requireUserIDs = a3;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (CKDContainerServerInfo)containerServerInfo
{
  return self->_containerServerInfo;
}

- (void)setContainerServerInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerServerInfo, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end