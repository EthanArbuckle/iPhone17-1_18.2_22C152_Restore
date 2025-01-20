@interface IDSQRProtoGoAwayIndication
- (BOOL)hasReasonString;
- (BOOL)hasServerBlob;
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serverBlob;
- (NSString)reasonString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txnId;
- (unsigned)reasonCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setReasonCode:(unsigned int)a3;
- (void)setReasonString:(id)a3;
- (void)setServerBlob:(id)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoGoAwayIndication

- (BOOL)hasReasonString
{
  return self->_reasonString != 0;
}

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
  v13.super_class = (Class)IDSQRProtoGoAwayIndication;
  v4 = [(IDSQRProtoGoAwayIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_reasonCode, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"reason_code");

  reasonString = self->_reasonString;
  if (reasonString) {
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)reasonString, v12, @"reason_string");
  }
  serverBlob = self->_serverBlob;
  if (serverBlob) {
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)serverBlob, v12, @"server_blob");
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, self->_txnId, v12);
    objc_msgSend_setObject_forKey_(v5, v16, (uint64_t)v15, v17, @"txn_id");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoGoAwayIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_reasonString) {
    PBDataWriterWriteStringField();
  }
  if (self->_serverBlob) {
    PBDataWriterWriteDataField();
  }
  v4 = v5;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[4] = self->_reasonCode;
  reasonString = self->_reasonString;
  v9 = v4;
  if (reasonString)
  {
    objc_msgSend_setReasonString_(v4, v5, (uint64_t)reasonString, v6);
    v4 = v9;
  }
  serverBlob = self->_serverBlob;
  if (serverBlob)
  {
    objc_msgSend_setServerBlob_(v9, v5, (uint64_t)serverBlob, v6);
    v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_txnId;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 16) = self->_reasonCode;
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_reasonString, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_serverBlob, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v19;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v12 + 8) = self->_txnId;
    *(unsigned char *)(v12 + 40) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_11;
  }
  if (self->_reasonCode != *((_DWORD *)v4 + 4)) {
    goto LABEL_11;
  }
  reasonString = self->_reasonString;
  uint64_t v11 = v4[3];
  if ((unint64_t)reasonString | v11)
  {
    if (!objc_msgSend_isEqual_(reasonString, v8, v11, v9)) {
      goto LABEL_11;
    }
  }
  serverBlob = self->_serverBlob;
  uint64_t v13 = v4[4];
  if ((unint64_t)serverBlob | v13)
  {
    if (!objc_msgSend_isEqual_(serverBlob, v8, v13, v9)) {
      goto LABEL_11;
    }
  }
  BOOL v14 = (v4[5] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[5] & 1) != 0 && self->_txnId == v4[1])
    {
      BOOL v14 = 1;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v14 = 0;
  }
LABEL_12:

  return v14;
}

- (unint64_t)hash
{
  unsigned int reasonCode = self->_reasonCode;
  uint64_t v6 = objc_msgSend_hash(self->_reasonString, a2, v2, v3);
  uint64_t v10 = objc_msgSend_hash(self->_serverBlob, v7, v8, v9);
  if (*(unsigned char *)&self->_has) {
    unint64_t v11 = 2654435761u * self->_txnId;
  }
  else {
    unint64_t v11 = 0;
  }
  return v6 ^ v10 ^ v11 ^ (2654435761 * reasonCode);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int reasonCode = *((_DWORD *)v4 + 4);
  uint64_t v7 = *((void *)v4 + 3);
  id v9 = v4;
  if (v7)
  {
    objc_msgSend_setReasonString_(self, v5, v7, v6);
    id v4 = v9;
  }
  uint64_t v8 = *((void *)v4 + 4);
  if (v8)
  {
    objc_msgSend_setServerBlob_(self, v5, v8, v6);
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_txnId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(unsigned int)a3
{
  self->_unsigned int reasonCode = a3;
}

- (NSString)reasonString
{
  return self->_reasonString;
}

- (void)setReasonString:(id)a3
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
  objc_storeStrong((id *)&self->_serverBlob, 0);
  objc_storeStrong((id *)&self->_reasonString, 0);
}

@end