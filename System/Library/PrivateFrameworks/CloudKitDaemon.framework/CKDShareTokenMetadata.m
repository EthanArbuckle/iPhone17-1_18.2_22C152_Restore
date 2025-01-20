@interface CKDShareTokenMetadata
- (BOOL)forceDSRefetch;
- (NSData)privateTokenData;
- (NSData)publicTokenData;
- (NSData)shortSharingTokenData;
- (NSData)shortSharingTokenHashData;
- (NSString)participantID;
- (NSString)routingKey;
- (NSString)shortSharingToken;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setForceDSRefetch:(BOOL)a3;
- (void)setParticipantID:(id)a3;
- (void)setPrivateTokenData:(id)a3;
- (void)setPublicTokenData:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)setShortSharingTokenData:(id)a3;
@end

@implementation CKDShareTokenMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v7 = objc_msgSend_routingKey(self, v5, v6);
  uint64_t v10 = objc_msgSend_copy(v7, v8, v9);
  v11 = (void *)v4[2];
  v4[2] = v10;

  v14 = objc_msgSend_shortSharingTokenData(self, v12, v13);
  uint64_t v17 = objc_msgSend_copy(v14, v15, v16);
  v18 = (void *)v4[3];
  v4[3] = v17;

  v21 = objc_msgSend_privateTokenData(self, v19, v20);
  uint64_t v24 = objc_msgSend_copy(v21, v22, v23);
  v25 = (void *)v4[5];
  v4[5] = v24;

  v28 = objc_msgSend_publicTokenData(self, v26, v27);
  uint64_t v31 = objc_msgSend_copy(v28, v29, v30);
  v32 = (void *)v4[4];
  v4[4] = v31;

  v35 = objc_msgSend_participantID(self, v33, v34);
  uint64_t v38 = objc_msgSend_copy(v35, v36, v37);
  v39 = (void *)v4[6];
  v4[6] = v38;

  return v4;
}

- (NSString)shortSharingToken
{
  v3 = objc_msgSend_shortSharingTokenData(self, a2, v2);
  uint64_t v6 = objc_msgSend_CKBase64URLSafeString(v3, v4, v5);

  return (NSString *)v6;
}

- (NSData)shortSharingTokenHashData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_shortSharingToken(self, a2, v2, 0, 0, 0, 0);
  uint64_t v6 = (const void *)objc_msgSend_UTF8String(v3, v4, v5);
  CC_LONG v8 = objc_msgSend_lengthOfBytesUsingEncoding_(v3, v7, 4);
  CC_SHA256(v6, v8, (unsigned __int8 *)&v12);
  uint64_t v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v9, (uint64_t)&v12, 32);

  return (NSData *)v10;
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
}

- (NSData)shortSharingTokenData
{
  return self->_shortSharingTokenData;
}

- (void)setShortSharingTokenData:(id)a3
{
}

- (BOOL)forceDSRefetch
{
  return self->_forceDSRefetch;
}

- (void)setForceDSRefetch:(BOOL)a3
{
  self->_forceDSRefetch = a3;
}

- (NSData)publicTokenData
{
  return self->_publicTokenData;
}

- (void)setPublicTokenData:(id)a3
{
}

- (NSData)privateTokenData
{
  return self->_privateTokenData;
}

- (void)setPrivateTokenData:(id)a3
{
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
  objc_storeStrong((id *)&self->_privateTokenData, 0);
  objc_storeStrong((id *)&self->_publicTokenData, 0);
  objc_storeStrong((id *)&self->_shortSharingTokenData, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
}

@end