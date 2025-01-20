@interface MTRCASESessionResumptionInfo
+ (BOOL)supportsSecureCoding;
- (MTRCASESessionResumptionInfo)initWithCoder:(id)a3;
- (NSData)resumptionID;
- (NSData)sharedSecret;
- (NSNumber)nodeID;
- (NSSet)caseAuthenticatedTags;
- (void)encodeWithCoder:(id)a3;
- (void)setCaseAuthenticatedTags:(id)a3;
- (void)setNodeID:(id)a3;
- (void)setResumptionID:(id)a3;
- (void)setSharedSecret:(id)a3;
@end

@implementation MTRCASESessionResumptionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRCASESessionResumptionInfo)initWithCoder:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)MTRCASESessionResumptionInfo;
  v5 = [(MTRCASESessionResumptionInfo *)&v52 init];
  if (!v5) {
    goto LABEL_43;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"nodeID");
  p_nodeID = &v5->_nodeID;
  nodeID = v5->_nodeID;
  v5->_nodeID = (NSNumber *)v8;

  if (v5->_nodeID)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v40 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = *p_nodeID;
        *(_DWORD *)buf = 138412290;
        v55 = (NSData *)v41;
        _os_log_impl(&dword_2446BD000, v40, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo got %@ for node ID, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_43;
      }
LABEL_42:
      sub_244CC4DE0(0, 1);
LABEL_43:
      v37 = 0;
      goto LABEL_44;
    }
    v11 = *p_nodeID;
  }
  else
  {
    v11 = 0;
  }
  if (!sub_244B19E20(v11))
  {
    v38 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = *p_nodeID;
      *(_DWORD *)buf = 138412290;
      v55 = (NSData *)v39;
      _os_log_impl(&dword_2446BD000, v38, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo node ID has invalid value: %@", buf, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  uint64_t v12 = objc_opt_class();
  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"resumptionID");
  resumptionID = v5->_resumptionID;
  v5->_resumptionID = (NSData *)v14;

  if (v5->_resumptionID)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = v5->_resumptionID;
        *(_DWORD *)buf = 138412290;
        v55 = v43;
        _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo got %@ for resumption ID, not NSData.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  uint64_t v16 = objc_opt_class();
  uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"sharedSecret");
  sharedSecret = v5->_sharedSecret;
  v5->_sharedSecret = (NSData *)v18;

  if (v5->_sharedSecret)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v44 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = v5->_sharedSecret;
        *(_DWORD *)buf = 138412290;
        v55 = v45;
        _os_log_impl(&dword_2446BD000, v44, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo got %@ for shared secret, not NSData.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  uint64_t v20 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v21, v20, @"CATs");
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v48, v53, 16);
  if (v24)
  {
    uint64_t v25 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = (NSData *)*(id *)(*((void *)&v48 + 1) + 8 * i);
        if (!sub_244B21514(v27))
        {

LABEL_46:
          v47 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v27;
            _os_log_impl(&dword_2446BD000, v47, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo CASE tag has invalid value: %@", buf, 0xCu);
          }

          if (sub_244CC4E58(1u)) {
            sub_244CC4DE0(0, 1);
          }

          v37 = 0;
          goto LABEL_51;
        }
        unint64_t v30 = objc_msgSend_unsignedLongLongValue(v27, v28, v29);
        if ((_WORD)v30) {
          BOOL v31 = HIDWORD(v30) == 0;
        }
        else {
          BOOL v31 = 0;
        }
        char v32 = v31;

        if ((v32 & 1) == 0) {
          goto LABEL_46;
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v33, (uint64_t)&v48, v53, 16);
      if (v24) {
        continue;
      }
      break;
    }
  }

  uint64_t v35 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v34, (uint64_t)v22);
  caseAuthenticatedTags = v5->_caseAuthenticatedTags;
  v5->_caseAuthenticatedTags = (NSSet *)v35;

  v37 = v5;
LABEL_51:

LABEL_44:
  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  uint64_t v6 = objc_msgSend_nodeID(self, v4, v5);
  objc_msgSend_encodeObject_forKey_(v23, v7, (uint64_t)v6, @"nodeID");

  v10 = objc_msgSend_resumptionID(self, v8, v9);
  objc_msgSend_encodeObject_forKey_(v23, v11, (uint64_t)v10, @"resumptionID");

  uint64_t v14 = objc_msgSend_sharedSecret(self, v12, v13);
  objc_msgSend_encodeObject_forKey_(v23, v15, (uint64_t)v14, @"sharedSecret");

  uint64_t v18 = objc_msgSend_caseAuthenticatedTags(self, v16, v17);
  v21 = objc_msgSend_allObjects(v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v21, @"CATs");
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
}

- (NSData)resumptionID
{
  return self->_resumptionID;
}

- (void)setResumptionID:(id)a3
{
}

- (NSData)sharedSecret
{
  return self->_sharedSecret;
}

- (void)setSharedSecret:(id)a3
{
}

- (NSSet)caseAuthenticatedTags
{
  return self->_caseAuthenticatedTags;
}

- (void)setCaseAuthenticatedTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseAuthenticatedTags, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_resumptionID, 0);

  objc_storeStrong((id *)&self->_nodeID, 0);
}

@end