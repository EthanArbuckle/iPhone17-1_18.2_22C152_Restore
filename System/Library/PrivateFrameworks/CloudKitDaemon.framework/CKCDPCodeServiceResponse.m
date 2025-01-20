@interface CKCDPCodeServiceResponse
+ (Class)assetAuthorizationResponsesType;
- (BOOL)hasAttestationResponse;
- (BOOL)hasError;
- (BOOL)hasSerializedResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCDPCodeServiceResponseAttestationResponse)attestationResponse;
- (CKCDPError)error;
- (NSData)serializedResult;
- (NSMutableArray)assetAuthorizationResponses;
- (id)assetAuthorizationResponsesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)assetAuthorizationResponsesCount;
- (unint64_t)hash;
- (void)addAssetAuthorizationResponses:(id)a3;
- (void)clearAssetAuthorizationResponses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetAuthorizationResponses:(id)a3;
- (void)setAttestationResponse:(id)a3;
- (void)setError:(id)a3;
- (void)setSerializedResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceResponse

- (BOOL)hasSerializedResult
{
  return self->_serializedResult != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)clearAssetAuthorizationResponses
{
  objc_msgSend_removeAllObjects(self->_assetAuthorizationResponses, a2, v2);
}

- (void)addAssetAuthorizationResponses:(id)a3
{
  v4 = (const char *)a3;
  assetAuthorizationResponses = self->_assetAuthorizationResponses;
  v8 = (char *)v4;
  if (!assetAuthorizationResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_assetAuthorizationResponses;
    self->_assetAuthorizationResponses = v6;

    v4 = v8;
    assetAuthorizationResponses = self->_assetAuthorizationResponses;
  }
  objc_msgSend_addObject_(assetAuthorizationResponses, v4, (uint64_t)v4);
}

- (unint64_t)assetAuthorizationResponsesCount
{
  return objc_msgSend_count(self->_assetAuthorizationResponses, a2, v2);
}

- (id)assetAuthorizationResponsesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assetAuthorizationResponses, a2, a3);
}

+ (Class)assetAuthorizationResponsesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAttestationResponse
{
  return self->_attestationResponse != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceResponse;
  v4 = [(CKCDPCodeServiceResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  serializedResult = self->_serializedResult;
  if (serializedResult) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serializedResult, @"serializedResult");
  }
  error = self->_error;
  if (error)
  {
    v9 = objc_msgSend_dictionaryRepresentation(error, v5, (uint64_t)serializedResult);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"error");
  }
  if (objc_msgSend_count(self->_assetAuthorizationResponses, v5, (uint64_t)serializedResult))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_assetAuthorizationResponses, v14, v15);
    v18 = objc_msgSend_initWithCapacity_(v13, v17, v16);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v19 = self->_assetAuthorizationResponses;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v34, v38, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v19);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v34 + 1) + 8 * i), v22, v23, (void)v34);
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v34, v38, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, @"assetAuthorizationResponses");
  }
  attestationResponse = self->_attestationResponse;
  if (attestationResponse)
  {
    v31 = objc_msgSend_dictionaryRepresentation(attestationResponse, v11, v12);
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, @"attestationResponse");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0])) {
    return *((unsigned char *)a3 + *v6) == 0;
  }
  v8 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*((unsigned char *)a3 + *v6)) {
      return *((unsigned char *)a3 + *v6) == 0;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v4;
      unint64_t v13 = *(void *)((char *)a3 + v12);
      if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
      *(void *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        unint64_t v11 = 0;
        int v16 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
    int v16 = *((unsigned __int8 *)a3 + *v6);
    if (*((unsigned char *)a3 + *v6)) {
      unint64_t v11 = 0;
    }
LABEL_14:
    if (v16 || (v11 & 7) == 4) {
      return *((unsigned char *)a3 + *v6) == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v18 = (NSData *)objc_claimAutoreleasedReturnValue();
        serializedResult = (CKCDPError *)self->_serializedResult;
        self->_serializedResult = v18;
        goto LABEL_31;
      case 2u:
        serializedResult = objc_alloc_init(CKCDPError);
        objc_storeStrong((id *)&self->_error, serializedResult);
        if (!PBReaderPlaceMark() || (sub_1C4FC0D34(serializedResult, (uint64_t)a3) & 1) == 0) {
          goto LABEL_35;
        }
        goto LABEL_30;
      case 3u:
        serializedResult = objc_alloc_init(CKCDPCodeServiceResponseAssetAuthorizationResponse);
        objc_msgSend_addAssetAuthorizationResponses_(self, v20, (uint64_t)serializedResult);
        if (!PBReaderPlaceMark() || !sub_1C4FDF9EC((char *)serializedResult, (uint64_t)a3)) {
          goto LABEL_35;
        }
        goto LABEL_30;
      case 5u:
        serializedResult = objc_alloc_init(CKCDPCodeServiceResponseAttestationResponse);
        objc_storeStrong((id *)&self->_attestationResponse, serializedResult);
        if PBReaderPlaceMark() && (sub_1C4F6C254(serializedResult, (uint64_t)a3))
        {
LABEL_30:
          PBReaderRecallMark();
LABEL_31:

LABEL_32:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            return *((unsigned char *)a3 + *v6) == 0;
          }
          continue;
        }
LABEL_35:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_32;
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_serializedResult) {
    PBDataWriterWriteDataField();
  }
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_assetAuthorizationResponses;
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

  if (self->_attestationResponse) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  serializedResult = self->_serializedResult;
  if (serializedResult) {
    objc_msgSend_setSerializedResult_(v17, v4, (uint64_t)serializedResult);
  }
  error = self->_error;
  if (error) {
    objc_msgSend_setError_(v17, v4, (uint64_t)error);
  }
  if (objc_msgSend_assetAuthorizationResponsesCount(self, v4, (uint64_t)error))
  {
    objc_msgSend_clearAssetAuthorizationResponses(v17, v7, v8);
    uint64_t v11 = objc_msgSend_assetAuthorizationResponsesCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_assetAuthorizationResponsesAtIndex_(self, v7, i);
        objc_msgSend_addAssetAuthorizationResponses_(v17, v15, (uint64_t)v14);
      }
    }
  }
  attestationResponse = self->_attestationResponse;
  if (attestationResponse) {
    objc_msgSend_setAttestationResponse_(v17, v7, (uint64_t)attestationResponse);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_serializedResult, v11, (uint64_t)a3);
  long long v13 = (void *)v10[4];
  v10[4] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_error, v14, (uint64_t)a3);
  int v16 = (void *)v10[3];
  v10[3] = v15;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = self->_assetAuthorizationResponses;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v30, v34, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v30 + 1) + 8 * v23), v20, (uint64_t)a3, (void)v30);
        objc_msgSend_addAssetAuthorizationResponses_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v30, v34, 16);
    }
    while (v21);
  }

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_attestationResponse, v26, (uint64_t)a3);
  v28 = (void *)v10[2];
  v10[2] = v27;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((serializedResult = self->_serializedResult, uint64_t v9 = v4[4], !((unint64_t)serializedResult | v9))
     || objc_msgSend_isEqual_(serializedResult, v7, v9))
    && ((error = self->_error, uint64_t v11 = v4[3], !((unint64_t)error | v11))
     || objc_msgSend_isEqual_(error, v7, v11))
    && ((assetAuthorizationResponses = self->_assetAuthorizationResponses,
         uint64_t v13 = v4[1],
         !((unint64_t)assetAuthorizationResponses | v13))
     || objc_msgSend_isEqual_(assetAuthorizationResponses, v7, v13)))
  {
    attestationResponse = self->_attestationResponse;
    uint64_t v15 = v4[2];
    if ((unint64_t)attestationResponse | v15) {
      char isEqual = objc_msgSend_isEqual_(attestationResponse, v7, v15);
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
  uint64_t v4 = objc_msgSend_hash(self->_serializedResult, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_error, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_assetAuthorizationResponses, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_attestationResponse, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 4);
  if (v6) {
    objc_msgSend_setSerializedResult_(self, v4, v6);
  }
  error = self->_error;
  uint64_t v8 = *((void *)v5 + 3);
  if (error)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(error, v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setError_(self, v4, v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = *((id *)v5 + 1);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_addAssetAuthorizationResponses_(self, v12, *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, v23, 16);
    }
    while (v13);
  }

  attestationResponse = self->_attestationResponse;
  uint64_t v18 = *((void *)v5 + 2);
  if (attestationResponse)
  {
    if (v18) {
      objc_msgSend_mergeFrom_(attestationResponse, v16, v18);
    }
  }
  else if (v18)
  {
    objc_msgSend_setAttestationResponse_(self, v16, v18);
  }
}

- (NSData)serializedResult
{
  return self->_serializedResult;
}

- (void)setSerializedResult:(id)a3
{
}

- (CKCDPError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)assetAuthorizationResponses
{
  return self->_assetAuthorizationResponses;
}

- (void)setAssetAuthorizationResponses:(id)a3
{
}

- (CKCDPCodeServiceResponseAttestationResponse)attestationResponse
{
  return self->_attestationResponse;
}

- (void)setAttestationResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_attestationResponse, 0);
  objc_storeStrong((id *)&self->_assetAuthorizationResponses, 0);
}

@end