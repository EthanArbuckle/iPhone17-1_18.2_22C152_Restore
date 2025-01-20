@interface CKDPCodeFunctionInvokeResponse
- (BOOL)hasAttestationResponse;
- (BOOL)hasSerializedResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPCodeFunctionInvokeResponseAttestationResponse)attestationResponse;
- (NSData)serializedResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttestationResponse:(id)a3;
- (void)setSerializedResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPCodeFunctionInvokeResponse

- (BOOL)hasSerializedResult
{
  return self->_serializedResult != 0;
}

- (BOOL)hasAttestationResponse
{
  return self->_attestationResponse != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPCodeFunctionInvokeResponse;
  v4 = [(CKDPCodeFunctionInvokeResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  serializedResult = self->_serializedResult;
  if (serializedResult) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serializedResult, @"serializedResult");
  }
  attestationResponse = self->_attestationResponse;
  if (attestationResponse)
  {
    v9 = objc_msgSend_dictionaryRepresentation(attestationResponse, v5, (uint64_t)serializedResult);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"attestationResponse");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FF0634((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serializedResult)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_attestationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  serializedResult = self->_serializedResult;
  id v8 = v4;
  if (serializedResult)
  {
    objc_msgSend_setSerializedResult_(v4, v5, (uint64_t)serializedResult);
    id v4 = v8;
  }
  attestationResponse = self->_attestationResponse;
  if (attestationResponse)
  {
    objc_msgSend_setAttestationResponse_(v8, v5, (uint64_t)attestationResponse);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_serializedResult, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_attestationResponse, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((serializedResult = self->_serializedResult, uint64_t v9 = v4[2], !((unint64_t)serializedResult | v9))
     || objc_msgSend_isEqual_(serializedResult, v7, v9)))
  {
    attestationResponse = self->_attestationResponse;
    uint64_t v11 = v4[1];
    if ((unint64_t)attestationResponse | v11) {
      char isEqual = objc_msgSend_isEqual_(attestationResponse, v7, v11);
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
  return objc_msgSend_hash(self->_attestationResponse, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4[2];
  id v8 = v4;
  if (v5)
  {
    objc_msgSend_setSerializedResult_(self, (const char *)v4, v5);
    uint64_t v4 = v8;
  }
  attestationResponse = self->_attestationResponse;
  uint64_t v7 = v4[1];
  if (attestationResponse)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(attestationResponse, (const char *)v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setAttestationResponse_(self, (const char *)v4, v7);
  }
  MEMORY[0x1F41817F8]();
}

- (NSData)serializedResult
{
  return self->_serializedResult;
}

- (void)setSerializedResult:(id)a3
{
}

- (CKDPCodeFunctionInvokeResponseAttestationResponse)attestationResponse
{
  return self->_attestationResponse;
}

- (void)setAttestationResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedResult, 0);
  objc_storeStrong((id *)&self->_attestationResponse, 0);
}

@end