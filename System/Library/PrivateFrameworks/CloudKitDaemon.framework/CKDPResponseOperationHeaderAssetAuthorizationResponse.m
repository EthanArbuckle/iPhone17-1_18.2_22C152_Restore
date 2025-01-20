@interface CKDPResponseOperationHeaderAssetAuthorizationResponse
+ (Class)responseHeadersType;
- (BOOL)hasAuthGetResponseBody;
- (BOOL)hasResponseUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authGetResponseBody;
- (NSMutableArray)responseHeaders;
- (NSString)responseUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)responseHeadersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)responseHeadersCount;
- (void)addResponseHeaders:(id)a3;
- (void)clearResponseHeaders;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthGetResponseBody:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setResponseUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationHeaderAssetAuthorizationResponse

- (BOOL)hasResponseUUID
{
  return self->_responseUUID != 0;
}

- (BOOL)hasAuthGetResponseBody
{
  return self->_authGetResponseBody != 0;
}

- (void)clearResponseHeaders
{
  objc_msgSend_removeAllObjects(self->_responseHeaders, a2, v2);
}

- (void)addResponseHeaders:(id)a3
{
  v4 = (const char *)a3;
  responseHeaders = self->_responseHeaders;
  v8 = (char *)v4;
  if (!responseHeaders)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_responseHeaders;
    self->_responseHeaders = v6;

    v4 = v8;
    responseHeaders = self->_responseHeaders;
  }
  objc_msgSend_addObject_(responseHeaders, v4, (uint64_t)v4);
}

- (unint64_t)responseHeadersCount
{
  return objc_msgSend_count(self->_responseHeaders, a2, v2);
}

- (id)responseHeadersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_responseHeaders, a2, a3);
}

+ (Class)responseHeadersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationHeaderAssetAuthorizationResponse;
  v4 = [(CKDPResponseOperationHeaderAssetAuthorizationResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  responseUUID = self->_responseUUID;
  if (responseUUID) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)responseUUID, @"responseUUID");
  }
  authGetResponseBody = self->_authGetResponseBody;
  if (authGetResponseBody) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)authGetResponseBody, @"authGetResponseBody");
  }
  if (objc_msgSend_count(self->_responseHeaders, v5, (uint64_t)authGetResponseBody))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_count(self->_responseHeaders, v10, v11);
    v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v15 = self->_responseHeaders;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, v31, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v27 + 1) + 8 * i), v18, v19, (void)v27);
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v27, v31, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v14, @"responseHeaders");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E9580C((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_responseUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_authGetResponseBody) {
    PBDataWriterWriteDataField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_responseHeaders;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  responseUUID = self->_responseUUID;
  if (responseUUID) {
    objc_msgSend_setResponseUUID_(v17, v4, (uint64_t)responseUUID);
  }
  authGetResponseBody = self->_authGetResponseBody;
  if (authGetResponseBody) {
    objc_msgSend_setAuthGetResponseBody_(v17, v4, (uint64_t)authGetResponseBody);
  }
  if (objc_msgSend_responseHeadersCount(self, v4, (uint64_t)authGetResponseBody))
  {
    objc_msgSend_clearResponseHeaders(v17, v7, v8);
    uint64_t v11 = objc_msgSend_responseHeadersCount(self, v9, v10);
    if (v11)
    {
      uint64_t v13 = v11;
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v15 = objc_msgSend_responseHeadersAtIndex_(self, v12, i);
        objc_msgSend_addResponseHeaders_(v17, v16, (uint64_t)v15);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_responseUUID, v11, (uint64_t)a3);
  uint64_t v13 = (void *)v10[3];
  v10[3] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_authGetResponseBody, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = self->_responseHeaders;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v27, v31, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v17);
        }
        v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * v23), v20, (uint64_t)a3, (void)v27);
        objc_msgSend_addResponseHeaders_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v27, v31, 16);
    }
    while (v21);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((responseUUID = self->_responseUUID, uint64_t v9 = v4[3], !((unint64_t)responseUUID | v9))
     || objc_msgSend_isEqual_(responseUUID, v7, v9))
    && ((authGetResponseBody = self->_authGetResponseBody, uint64_t v11 = v4[1], !((unint64_t)authGetResponseBody | v11))
     || objc_msgSend_isEqual_(authGetResponseBody, v7, v11)))
  {
    responseHeaders = self->_responseHeaders;
    uint64_t v13 = v4[2];
    if ((unint64_t)responseHeaders | v13) {
      char isEqual = objc_msgSend_isEqual_(responseHeaders, v7, v13);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_responseUUID, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_authGetResponseBody, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_responseHeaders, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 3);
  if (v6) {
    objc_msgSend_setResponseUUID_(self, v4, v6);
  }
  uint64_t v7 = *((void *)v5 + 1);
  if (v7) {
    objc_msgSend_setAuthGetResponseBody_(self, v4, v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addResponseHeaders_(self, v11, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }
}

- (NSString)responseUUID
{
  return self->_responseUUID;
}

- (void)setResponseUUID:(id)a3
{
}

- (NSData)authGetResponseBody
{
  return self->_authGetResponseBody;
}

- (void)setAuthGetResponseBody:(id)a3
{
}

- (NSMutableArray)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseUUID, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_authGetResponseBody, 0);
}

@end