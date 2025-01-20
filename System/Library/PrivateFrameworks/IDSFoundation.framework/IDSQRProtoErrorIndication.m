@interface IDSQRProtoErrorIndication
- (BOOL)hasChannelId;
- (BOOL)hasClientAddress;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorReason;
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientAddress;
- (NSString)errorReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txnId;
- (unsigned)channelId;
- (unsigned)errorCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(unsigned int)a3;
- (void)setClientAddress:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorReason:(id)a3;
- (void)setHasChannelId:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoErrorIndication

- (void)setChannelId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_channelId = a3;
}

- (void)setHasChannelId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannelId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorReason
{
  return self->_errorReason != 0;
}

- (BOOL)hasClientAddress
{
  return self->_clientAddress != 0;
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
  v13.super_class = (Class)IDSQRProtoErrorIndication;
  v4 = [(IDSQRProtoErrorIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, self->_channelId, v7);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, v11, @"channel_id");

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, self->_errorCode, v7);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, v14, @"error_code");
  }
  errorReason = self->_errorReason;
  if (errorReason) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)errorReason, v7, @"error_reason");
  }
  clientAddress = self->_clientAddress;
  if (clientAddress) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientAddress, v7, @"client_address");
  }
  if (*(unsigned char *)&self->_has)
  {
    v17 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, self->_txnId, v7);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, v19, @"txn_id");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoErrorIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_errorReason) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientAddress) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_channelId;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[8] = self->_errorCode;
    *((unsigned char *)v4 + 48) |= 4u;
  }
  errorReason = self->_errorReason;
  double v10 = v4;
  if (errorReason)
  {
    objc_msgSend_setErrorReason_(v4, v5, (uint64_t)errorReason, v6);
    v4 = v10;
  }
  clientAddress = self->_clientAddress;
  if (clientAddress)
  {
    objc_msgSend_setClientAddress_(v10, v5, (uint64_t)clientAddress, v6);
    v4 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_txnId;
    *((unsigned char *)v4 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = v12;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 16) = self->_channelId;
    *(unsigned char *)(v12 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v12 + 32) = self->_errorCode;
    *(unsigned char *)(v12 + 48) |= 4u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_errorReason, v13, (uint64_t)a3, v14);
  v18 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v17;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_clientAddress, v19, (uint64_t)a3, v20);
  v22 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v21;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v15 + 8) = self->_txnId;
    *(unsigned char *)(v15 + 48) |= 1u;
  }
  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[6] & 2) == 0 || self->_channelId != *((_DWORD *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if ((v4[6] & 2) != 0)
  {
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[6] & 4) == 0 || self->_errorCode != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }
  else if ((v4[6] & 4) != 0)
  {
    goto LABEL_20;
  }
  errorReason = self->_errorReason;
  uint64_t v11 = v4[5];
  if ((unint64_t)errorReason | v11 && !objc_msgSend_isEqual_(errorReason, v8, v11, v9)) {
    goto LABEL_20;
  }
  clientAddress = self->_clientAddress;
  uint64_t v13 = v4[3];
  if ((unint64_t)clientAddress | v13)
  {
    if (!objc_msgSend_isEqual_(clientAddress, v8, v13, v9)) {
      goto LABEL_20;
    }
  }
  BOOL v14 = (v4[6] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[6] & 1) == 0 || self->_txnId != v4[1]) {
      goto LABEL_20;
    }
    BOOL v14 = 1;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_channelId;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_errorCode;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  uint64_t v7 = objc_msgSend_hash(self->_errorReason, a2, v2, v3);
  uint64_t v11 = objc_msgSend_hash(self->_clientAddress, v8, v9, v10);
  if (*(unsigned char *)&self->_has) {
    unint64_t v12 = 2654435761u * self->_txnId;
  }
  else {
    unint64_t v12 = 0;
  }
  return v6 ^ v5 ^ v7 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 2) != 0)
  {
    self->_channelId = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if ((v7 & 4) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v8 = *((void *)v4 + 5);
  id v10 = v4;
  if (v8)
  {
    objc_msgSend_setErrorReason_(self, v5, v8, v6);
    id v4 = v10;
  }
  uint64_t v9 = *((void *)v4 + 3);
  if (v9)
  {
    objc_msgSend_setClientAddress_(self, v5, v9, v6);
    id v4 = v10;
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_txnId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)channelId
{
  return self->_channelId;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSString)errorReason
{
  return self->_errorReason;
}

- (void)setErrorReason:(id)a3
{
}

- (NSString)clientAddress
{
  return self->_clientAddress;
}

- (void)setClientAddress:(id)a3
{
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorReason, 0);
  objc_storeStrong((id *)&self->_clientAddress, 0);
}

@end