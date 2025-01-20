@interface IDSQRProtoReallocateIndication
- (BOOL)hasServerBlob;
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)reallocateToken;
- (NSData)serverBlob;
- (NSData)sessionId;
- (NSString)clientAddress;
- (NSString)serverAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txnId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientAddress:(id)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setReallocateToken:(id)a3;
- (void)setServerAddress:(id)a3;
- (void)setServerBlob:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoReallocateIndication

- (BOOL)hasServerBlob
{
  return self->_serverBlob != 0;
}

- (void)setTxnId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_txnId = a3;
}

- (void)setHasTxnId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxnId
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoReallocateIndication;
  v4 = [(IDSQRProtoReallocateIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = v5;
  reallocateToken = self->_reallocateToken;
  if (reallocateToken) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)reallocateToken, v7, @"reallocate_token");
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)sessionId, v7, @"session_id");
  }
  clientAddress = self->_clientAddress;
  if (clientAddress) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)clientAddress, v7, @"client_address");
  }
  serverAddress = self->_serverAddress;
  if (serverAddress) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)serverAddress, v7, @"server_address");
  }
  serverBlob = self->_serverBlob;
  if (serverBlob) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)serverBlob, v7, @"server_blob");
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_txnId, v7);
    objc_msgSend_setObject_forKey_(v8, v15, (uint64_t)v14, v16, @"txn_id");
  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoReallocateIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_reallocateToken) {
    sub_19DB764DC();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (!self->_sessionId) {
    sub_19DB76508();
  }
  PBDataWriterWriteDataField();
  if (!self->_clientAddress) {
    sub_19DB76534();
  }
  PBDataWriterWriteStringField();
  if (!self->_serverAddress) {
    sub_19DB76560();
  }
  PBDataWriterWriteStringField();
  if (self->_serverBlob) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v15 = a3;
  objc_msgSend_setReallocateToken_(v15, v4, (uint64_t)self->_reallocateToken, v5);
  objc_msgSend_setSessionId_(v15, v6, (uint64_t)self->_sessionId, v7);
  objc_msgSend_setClientAddress_(v15, v8, (uint64_t)self->_clientAddress, v9);
  objc_msgSend_setServerAddress_(v15, v10, (uint64_t)self->_serverAddress, v11);
  serverBlob = self->_serverBlob;
  if (serverBlob) {
    objc_msgSend_setServerBlob_(v15, v12, (uint64_t)serverBlob, v13);
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v15 + 1) = self->_txnId;
    *((unsigned char *)v15 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_reallocateToken, v13, (uint64_t)a3, v14);
  double v16 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_sessionId, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v19;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_clientAddress, v21, (uint64_t)a3, v22);
  v24 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v23;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_serverAddress, v25, (uint64_t)a3, v26);
  v28 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v27;

  uint64_t v31 = objc_msgSend_copyWithZone_(self->_serverBlob, v29, (uint64_t)a3, v30);
  v32 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v31;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v12 + 8) = self->_txnId;
    *(unsigned char *)(v12 + 56) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_16;
  }
  reallocateToken = self->_reallocateToken;
  uint64_t v11 = v4[3];
  if ((unint64_t)reallocateToken | v11)
  {
    if (!objc_msgSend_isEqual_(reallocateToken, v8, v11, v9)) {
      goto LABEL_16;
    }
  }
  sessionId = self->_sessionId;
  uint64_t v13 = v4[6];
  if ((unint64_t)sessionId | v13)
  {
    if (!objc_msgSend_isEqual_(sessionId, v8, v13, v9)) {
      goto LABEL_16;
    }
  }
  clientAddress = self->_clientAddress;
  uint64_t v15 = v4[2];
  if ((unint64_t)clientAddress | v15)
  {
    if (!objc_msgSend_isEqual_(clientAddress, v8, v15, v9)) {
      goto LABEL_16;
    }
  }
  serverAddress = self->_serverAddress;
  uint64_t v17 = v4[4];
  if ((unint64_t)serverAddress | v17)
  {
    if (!objc_msgSend_isEqual_(serverAddress, v8, v17, v9)) {
      goto LABEL_16;
    }
  }
  serverBlob = self->_serverBlob;
  uint64_t v19 = v4[5];
  if ((unint64_t)serverBlob | v19)
  {
    if (!objc_msgSend_isEqual_(serverBlob, v8, v19, v9)) {
      goto LABEL_16;
    }
  }
  BOOL v20 = (v4[7] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[7] & 1) != 0 && self->_txnId == v4[1])
    {
      BOOL v20 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v20 = 0;
  }
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_reallocateToken, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_sessionId, v6, v7, v8);
  uint64_t v13 = objc_msgSend_hash(self->_clientAddress, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(self->_serverAddress, v14, v15, v16);
  uint64_t v21 = objc_msgSend_hash(self->_serverBlob, v18, v19, v20);
  if (*(unsigned char *)&self->_has) {
    unint64_t v22 = 2654435761u * self->_txnId;
  }
  else {
    unint64_t v22 = 0;
  }
  return v9 ^ v5 ^ v13 ^ v17 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = v4[3];
  double v12 = v4;
  if (v7)
  {
    objc_msgSend_setReallocateToken_(self, v5, v7, v6);
    id v4 = v12;
  }
  uint64_t v8 = v4[6];
  if (v8)
  {
    objc_msgSend_setSessionId_(self, v5, v8, v6);
    id v4 = v12;
  }
  uint64_t v9 = v4[2];
  if (v9)
  {
    objc_msgSend_setClientAddress_(self, v5, v9, v6);
    id v4 = v12;
  }
  uint64_t v10 = v4[4];
  if (v10)
  {
    objc_msgSend_setServerAddress_(self, v5, v10, v6);
    id v4 = v12;
  }
  uint64_t v11 = v4[5];
  if (v11)
  {
    objc_msgSend_setServerBlob_(self, v5, v11, v6);
    id v4 = v12;
  }
  if (v4[7])
  {
    self->_txnId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)reallocateToken
{
  return self->_reallocateToken;
}

- (void)setReallocateToken:(id)a3
{
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)clientAddress
{
  return self->_clientAddress;
}

- (void)setClientAddress:(id)a3
{
}

- (NSString)serverAddress
{
  return self->_serverAddress;
}

- (void)setServerAddress:(id)a3
{
}

- (NSData)serverBlob
{
  return self->_serverBlob;
}

- (void)setServerBlob:(id)a3
{
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_serverBlob, 0);
  objc_storeStrong((id *)&self->_serverAddress, 0);
  objc_storeStrong((id *)&self->_reallocateToken, 0);
  objc_storeStrong((id *)&self->_clientAddress, 0);
}

@end