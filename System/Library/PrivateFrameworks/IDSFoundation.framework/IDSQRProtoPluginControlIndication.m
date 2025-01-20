@interface IDSQRProtoPluginControlIndication
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)pluginParticipantId;
- (unint64_t)txnId;
- (unsigned)pluginOperation;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setPluginOperation:(unsigned int)a3;
- (void)setPluginParticipantId:(unint64_t)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoPluginControlIndication

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
  v13.super_class = (Class)IDSQRProtoPluginControlIndication;
  v4 = [(IDSQRProtoPluginControlIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_pluginOperation, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"plugin_operation");

  objc_super v13 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, self->_pluginParticipantId, v12);
  objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, v15, @"plugin_participant_id");

  if (*(unsigned char *)&self->_has)
  {
    v18 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v16, self->_txnId, v17);
    objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v20, @"txn_id");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPluginControlIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_pluginOperation;
  *((void *)a3 + 1) = self->_pluginParticipantId;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 2) = self->_txnId;
    *((unsigned char *)a3 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  id result = (id)objc_msgSend_init(v8, v9, v10, v11);
  *((_DWORD *)result + 6) = self->_pluginOperation;
  *((void *)result + 1) = self->_pluginParticipantId;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 2) = self->_txnId;
    *((unsigned char *)result + 28) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    || self->_pluginOperation != *((_DWORD *)v4 + 6)
    || self->_pluginParticipantId != *((void *)v4 + 1))
  {
    goto LABEL_8;
  }
  BOOL v8 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_txnId == *((void *)v4 + 2))
    {
      BOOL v8 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v8 = 0;
  }
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_txnId;
  }
  else {
    unint64_t v2 = 0;
  }
  return (2654435761u * self->_pluginParticipantId) ^ (2654435761 * self->_pluginOperation) ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_pluginOperation = *((_DWORD *)a3 + 6);
  self->_pluginParticipantId = *((void *)a3 + 1);
  if (*((unsigned char *)a3 + 28))
  {
    self->_txnId = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)pluginOperation
{
  return self->_pluginOperation;
}

- (void)setPluginOperation:(unsigned int)a3
{
  self->_pluginOperation = a3;
}

- (unint64_t)pluginParticipantId
{
  return self->_pluginParticipantId;
}

- (void)setPluginParticipantId:(unint64_t)a3
{
  self->_pluginParticipantId = a3;
}

- (unint64_t)txnId
{
  return self->_txnId;
}

@end