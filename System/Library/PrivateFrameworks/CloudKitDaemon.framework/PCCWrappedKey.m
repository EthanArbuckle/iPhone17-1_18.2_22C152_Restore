@interface PCCWrappedKey
- (NSData)routingToken;
- (PCCWrappedKey)initWithKey:(id)a3 permittedRemoteMeasurement:(id)a4 attestation:(id)a5;
- (id)data;
- (pcc_wrapped_invocation_key)wrappedInvocationKey;
- (void)dealloc;
- (void)setRoutingToken:(id)a3;
- (void)setWrappedInvocationKey:(pcc_wrapped_invocation_key *)a3;
@end

@implementation PCCWrappedKey

- (PCCWrappedKey)initWithKey:(id)a3 permittedRemoteMeasurement:(id)a4 attestation:(id)a5
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v143.receiver = self;
  v143.super_class = (Class)PCCWrappedKey;
  v13 = [(PCCWrappedKey *)&v143 init];
  if (!v13) {
    goto LABEL_29;
  }
  if (v10)
  {
    v14 = (void *)MEMORY[0x1E4F1CA58];
    objc_msgSend_applicationEnclaveQuote(v10, v11, v12);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_bytes(v15, v16, v17);
    v21 = objc_msgSend_applicationEnclaveQuote(v10, v19, v20);
    uint64_t v24 = objc_msgSend_length(v21, v22, v23);
    v26 = objc_msgSend_dataWithBytes_length_(v14, v25, v18, v24);

    id v27 = v26;
    v142[0] = objc_msgSend_mutableBytes(v27, v28, v29);
    v142[1] = objc_msgSend_length(v27, v30, v31);
    v32 = (void *)MEMORY[0x1E4F1CA58];
    objc_msgSend_quotingEnclaveQuote(v10, v33, v34);
    id v35 = objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_bytes(v35, v36, v37);
    v41 = objc_msgSend_quotingEnclaveQuote(v10, v39, v40);
    uint64_t v44 = objc_msgSend_length(v41, v42, v43);
    v46 = objc_msgSend_dataWithBytes_length_(v32, v45, v38, v44);

    id v47 = v46;
    v142[2] = objc_msgSend_mutableBytes(v47, v48, v49);
    v135 = v47;
    v142[3] = objc_msgSend_length(v47, v50, v51);
    v52 = (void *)MEMORY[0x1E4F1CA58];
    objc_msgSend_certificate(v10, v53, v54);
    id v55 = objc_claimAutoreleasedReturnValue();
    uint64_t v57 = objc_msgSend_cStringUsingEncoding_(v55, v56, 4);
    v60 = objc_msgSend_certificate(v10, v58, v59);
    uint64_t v62 = objc_msgSend_lengthOfBytesUsingEncoding_(v60, v61, 4);
    v64 = objc_msgSend_dataWithBytes_length_(v52, v63, v57, v62);

    id v65 = v64;
    v142[4] = objc_msgSend_mutableBytes(v65, v66, v67);
    v142[5] = objc_msgSend_length(v65, v68, v69);
    v72 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v70, v71);
    v74 = objc_msgSend_stringArrayForKey_(v72, v73, @"PCCPinnedVerificationHashes");
    char v76 = objc_msgSend_BOOLForKey_(v72, v75, @"PCCPinnedVerificationDisabled");
    id v136 = v9;
    if (objc_msgSend_count(v74, v77, v78))
    {
      uint64_t v81 = objc_msgSend_count(v74, v79, v80);
      v137 = (char *)malloc_type_calloc(0x20uLL, (unsigned __int16)v81, 0xAC995C02uLL);
      if (!v137) {
        goto LABEL_25;
      }
      uint64_t v126 = v81;
      v127 = v74;
      char v131 = v76;
      v128 = v72;
      id v129 = v65;
      id v132 = v27;
      v133 = v13;
      id v130 = v10;
      v134 = v8;
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v82 = v74;
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v138, v151, 16);
      if (v84)
      {
        uint64_t v85 = v84;
        uint64_t v86 = 0;
        uint64_t v87 = *(void *)v139;
        do
        {
          uint64_t v88 = 0;
          v89 = &v137[32 * v86];
          do
          {
            if (*(void *)v139 != v87) {
              objc_enumerationMutation(v82);
            }
            uint64_t v90 = *(void *)(*((void *)&v138 + 1) + 8 * v88);
            id v91 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            v93 = objc_msgSend_initWithBase64EncodedString_options_(v91, v92, v90, 1);
            unint64_t v96 = objc_msgSend_length(v93, v94, v95);
            if (v96 >= 0x20) {
              size_t v97 = 32;
            }
            else {
              size_t v97 = v96;
            }
            id v98 = v93;
            v101 = (const void *)objc_msgSend_bytes(v98, v99, v100);
            memcpy(v89, v101, v97);

            ++v88;
            v89 += 32;
          }
          while (v85 != v88);
          uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v102, (uint64_t)&v138, v151, 16);
          v86 += v88;
        }
        while (v85);
      }

      v103 = v136;
      v104 = v137;
      id v65 = v129;
      id v10 = v130;
      v74 = v127;
      v72 = v128;
      unsigned __int16 v105 = v126;
    }
    else
    {
      char v131 = v76;
      v103 = v9;
      v133 = v13;
      v134 = v8;
      id v132 = v27;
      unsigned __int16 v105 = 243;
      v104 = &unk_1EA3CD0B8;
    }
    id v106 = v103;
    uint64_t v111 = objc_msgSend_bytes(v106, v107, v108);
    unint64_t v112 = 0;
    memset(v148, 0, sizeof(v148));
    v149 = v104;
    uint64_t v150 = v105;
    BYTE2(v150) = v131;
    do
    {
      if (v112 >= objc_msgSend_length(v106, v109, v110, v126, v127, v128, v129, v130)) {
        break;
      }
      *((unsigned char *)v148 + v112) = *(unsigned char *)(v111 + v112);
      ++v112;
    }
    while (v112 != 32);
    char v147 = 0;
    memset(v146, 0, sizeof(v146));
    sub_1C504CFE0(v142, (uint64_t)v148, (uint64_t)v146);
    int v114 = v113;
    if (v104 != &unk_1EA3CD0B8) {
      free(v104);
    }
    id v27 = v132;
    v13 = v133;
    id v8 = v134;
    if (v114)
    {
      int v115 = 1;
      id v9 = v136;
      goto LABEL_27;
    }
    uint64_t v145 = 0;
    memset(v144, 0, sizeof(v144));
    *(void *)&double v118 = sub_1C504CA60((uint64_t)v146, (uint64_t)v144).n128_u64[0];
    id v9 = v136;
    if (!v119)
    {
      objc_msgSend_secret(v134, v116, v117, v118);
      v133->_wrappedInvocationKey = (pcc_wrapped_invocation_key *)sub_1C504C9B0();
      uint64_t v122 = objc_msgSend_routingToken(v10, v120, v121);
      routingToken = v133->_routingToken;
      v133->_routingToken = (NSData *)v122;

      sub_1C504CCC8((uint64_t)v144);
      int v115 = 0;
LABEL_27:

      if (v115) {
        goto LABEL_28;
      }
LABEL_29:
      v124 = v13;
      goto LABEL_30;
    }
LABEL_25:
    int v115 = 1;
    goto LABEL_27;
  }
LABEL_28:
  v124 = 0;
LABEL_30:

  return v124;
}

- (id)data
{
  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)self->_wrappedInvocationKey->var0, self->_wrappedInvocationKey->var1, 0);
}

- (void)dealloc
{
  objc_msgSend_clear(self, a2, v2);
  free(self->_wrappedInvocationKey);
  v4.receiver = self;
  v4.super_class = (Class)PCCWrappedKey;
  [(PCCWrappedKey *)&v4 dealloc];
}

- (pcc_wrapped_invocation_key)wrappedInvocationKey
{
  return self->_wrappedInvocationKey;
}

- (void)setWrappedInvocationKey:(pcc_wrapped_invocation_key *)a3
{
  self->_wrappedInvocationKey = a3;
}

- (NSData)routingToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRoutingToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end