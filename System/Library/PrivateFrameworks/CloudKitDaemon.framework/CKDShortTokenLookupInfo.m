@interface CKDShortTokenLookupInfo
- (BOOL)forceDSRefetch;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFetchRootRecord;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSData)shortSharingTokenHashData;
- (NSString)participantID;
- (NSString)routingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setForceDSRefetch:(BOOL)a3;
- (void)setParticipantID:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)setShortSharingTokenHashData:(id)a3;
- (void)setShouldFetchRootRecord:(BOOL)a3;
@end

@implementation CKDShortTokenLookupInfo

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  v3 = objc_opt_new();
  v6 = objc_msgSend_routingKey(self, v4, v5);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, @"routingKey");

  v10 = objc_msgSend_shortSharingTokenHashData(self, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, @"shortSharingTokenHashData");

  v12 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t RootRecord = objc_msgSend_shouldFetchRootRecord(self, v13, v14);
  v17 = objc_msgSend_numberWithBool_(v12, v16, RootRecord);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, @"shouldFetchRootRecord");

  v19 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v22 = objc_msgSend_forceDSRefetch(self, v20, v21);
  v24 = objc_msgSend_numberWithBool_(v19, v23, v22);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v24, @"forceDSRefetch");

  v28 = objc_msgSend_participantID(self, v26, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v28, @"participantID");

  v32 = objc_msgSend_properties(v3, v30, v31);

  return (CKRoughlyEquivalentProperties *)v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v7 = objc_msgSend_routingKey(self, v5, v6);
  uint64_t v10 = objc_msgSend_copy(v7, v8, v9);
  v11 = (void *)v4[2];
  v4[2] = v10;

  uint64_t v14 = objc_msgSend_shortSharingTokenHashData(self, v12, v13);
  uint64_t v17 = objc_msgSend_copy(v14, v15, v16);
  v18 = (void *)v4[3];
  v4[3] = v17;

  *((unsigned char *)v4 + 8) = objc_msgSend_shouldFetchRootRecord(self, v19, v20);
  *((unsigned char *)v4 + 9) = objc_msgSend_forceDSRefetch(self, v21, v22);
  uint64_t v25 = objc_msgSend_participantID(self, v23, v24);
  v26 = (void *)v4[4];
  v4[4] = v25;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDShortTokenLookupInfo *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v8 = objc_msgSend_routingKey(v5, v6, v7);
      uint64_t v11 = objc_msgSend_routingKey(self, v9, v10);
      if (v8 == (void *)v11)
      {
      }
      else
      {
        uint64_t v14 = (void *)v11;
        v15 = objc_msgSend_routingKey(self, v12, v13);
        v18 = objc_msgSend_routingKey(v5, v16, v17);
        int isEqualToString = objc_msgSend_isEqualToString_(v15, v19, (uint64_t)v18);

        if (!isEqualToString) {
          goto LABEL_15;
        }
      }
      uint64_t v24 = objc_msgSend_shortSharingTokenHashData(v5, v21, v22);
      uint64_t v27 = objc_msgSend_shortSharingTokenHashData(self, v25, v26);
      if (v24 == (void *)v27)
      {
      }
      else
      {
        v30 = (void *)v27;
        uint64_t v31 = objc_msgSend_shortSharingTokenHashData(self, v28, v29);
        v34 = objc_msgSend_shortSharingTokenHashData(v5, v32, v33);
        int isEqualToData = objc_msgSend_isEqualToData_(v31, v35, (uint64_t)v34);

        if (!isEqualToData) {
          goto LABEL_15;
        }
      }
      int RootRecord = objc_msgSend_shouldFetchRootRecord(v5, v37, v38);
      if (RootRecord == objc_msgSend_shouldFetchRootRecord(self, v40, v41))
      {
        int v44 = objc_msgSend_forceDSRefetch(v5, v42, v43);
        if (v44 == objc_msgSend_forceDSRefetch(self, v45, v46))
        {
          v50 = objc_msgSend_participantID(v5, v47, v48);
          uint64_t v53 = objc_msgSend_participantID(self, v51, v52);
          if (v50 == (void *)v53)
          {
            char v23 = 1;
            v56 = v50;
          }
          else
          {
            v56 = (void *)v53;
            v57 = objc_msgSend_participantID(self, v54, v55);
            v60 = objc_msgSend_participantID(v5, v58, v59);
            char v23 = objc_msgSend_isEqualToString_(v57, v61, (uint64_t)v60);
          }
          goto LABEL_16;
        }
      }
LABEL_15:
      char v23 = 0;
LABEL_16:

      goto LABEL_17;
    }
    char v23 = 0;
  }
LABEL_17:

  return v23;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_routingKey(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  uint64_t v10 = objc_msgSend_shortSharingTokenHashData(self, v8, v9);
  uint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  uint64_t v16 = objc_msgSend_participantID(self, v14, v15);
  unint64_t v19 = v13 ^ objc_msgSend_hash(v16, v17, v18);

  return v19;
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
}

- (NSData)shortSharingTokenHashData
{
  return self->_shortSharingTokenHashData;
}

- (void)setShortSharingTokenHashData:(id)a3
{
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchint RootRecord = a3;
}

- (BOOL)forceDSRefetch
{
  return self->_forceDSRefetch;
}

- (void)setForceDSRefetch:(BOOL)a3
{
  self->_forceDSRefetch = a3;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shortSharingTokenHashData, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
}

@end