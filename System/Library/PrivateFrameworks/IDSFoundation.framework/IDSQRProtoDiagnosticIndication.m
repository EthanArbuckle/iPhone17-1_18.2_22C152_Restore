@interface IDSQRProtoDiagnosticIndication
- (BOOL)hasPacketsRecordDuration;
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)failureSubtype;
- (NSString)failureSubtypeContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txnId;
- (unsigned)packetsRecordDuration;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFailureSubtype:(id)a3;
- (void)setFailureSubtypeContext:(id)a3;
- (void)setHasPacketsRecordDuration:(BOOL)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setPacketsRecordDuration:(unsigned int)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoDiagnosticIndication

- (void)setPacketsRecordDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_packetsRecordDuration = a3;
}

- (void)setHasPacketsRecordDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPacketsRecordDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoDiagnosticIndication;
  v4 = [(IDSQRProtoDiagnosticIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = v5;
  failureSubtype = self->_failureSubtype;
  if (failureSubtype) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)failureSubtype, v7, @"failure_subtype");
  }
  failureSubtypeContext = self->_failureSubtypeContext;
  if (failureSubtypeContext) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)failureSubtypeContext, v7, @"failure_subtype_context");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_packetsRecordDuration, v7);
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, v14, @"packets_record_duration");

    char has = (char)self->_has;
  }
  if (has)
  {
    v15 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_txnId, v7);
    objc_msgSend_setObject_forKey_(v8, v16, (uint64_t)v15, v17, @"txn_id");
  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoDiagnosticIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_failureSubtype) {
    sub_19DB7E7B8();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  if (!self->_failureSubtypeContext) {
    sub_19DB7E7E4();
  }
  PBDataWriterWriteStringField();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  objc_msgSend_setFailureSubtype_(v9, v4, (uint64_t)self->_failureSubtype, v5);
  objc_msgSend_setFailureSubtypeContext_(v9, v6, (uint64_t)self->_failureSubtypeContext, v7);
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v9 + 8) = self->_packetsRecordDuration;
    *((unsigned char *)v9 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v9 + 1) = self->_txnId;
    *((unsigned char *)v9 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_failureSubtype, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_failureSubtypeContext, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v19;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 32) = self->_packetsRecordDuration;
    *(unsigned char *)(v12 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v12 + 8) = self->_txnId;
    *(unsigned char *)(v12 + 36) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_15;
  }
  failureSubtype = self->_failureSubtype;
  uint64_t v11 = v4[2];
  if ((unint64_t)failureSubtype | v11)
  {
    if (!objc_msgSend_isEqual_(failureSubtype, v8, v11, v9)) {
      goto LABEL_15;
    }
  }
  failureSubtypeContext = self->_failureSubtypeContext;
  uint64_t v13 = v4[3];
  if ((unint64_t)failureSubtypeContext | v13)
  {
    if (!objc_msgSend_isEqual_(failureSubtypeContext, v8, v13, v9)) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_packetsRecordDuration != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  BOOL v14 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_txnId != v4[1]) {
      goto LABEL_15;
    }
    BOOL v14 = 1;
  }
LABEL_16:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_failureSubtype, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_failureSubtypeContext, v6, v7, v8);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_packetsRecordDuration;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v11 = 0;
    return v9 ^ v5 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v11 = 2654435761u * self->_txnId;
  return v9 ^ v5 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 2);
  id v10 = v4;
  if (v7)
  {
    objc_msgSend_setFailureSubtype_(self, v5, v7, v6);
    id v4 = v10;
  }
  uint64_t v8 = *((void *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setFailureSubtypeContext_(self, v5, v8, v6);
    id v4 = v10;
  }
  char v9 = *((unsigned char *)v4 + 36);
  if ((v9 & 2) != 0)
  {
    self->_packetsRecordDuration = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v4 + 36);
  }
  if (v9)
  {
    self->_txnId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)failureSubtype
{
  return self->_failureSubtype;
}

- (void)setFailureSubtype:(id)a3
{
}

- (NSString)failureSubtypeContext
{
  return self->_failureSubtypeContext;
}

- (void)setFailureSubtypeContext:(id)a3
{
}

- (unsigned)packetsRecordDuration
{
  return self->_packetsRecordDuration;
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureSubtypeContext, 0);
  objc_storeStrong((id *)&self->_failureSubtype, 0);
}

@end