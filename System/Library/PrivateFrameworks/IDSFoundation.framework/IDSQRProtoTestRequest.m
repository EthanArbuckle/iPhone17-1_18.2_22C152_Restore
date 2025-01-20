@interface IDSQRProtoTestRequest
- (BOOL)hasRequestedErrorCode;
- (BOOL)hasRequestedMessageType;
- (BOOL)hasSubOperation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)subOperation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestedErrorCode;
- (unsigned)requestedMessageType;
- (unsigned)testOptionFlags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRequestedErrorCode:(BOOL)a3;
- (void)setHasRequestedMessageType:(BOOL)a3;
- (void)setRequestedErrorCode:(unsigned int)a3;
- (void)setRequestedMessageType:(unsigned int)a3;
- (void)setSubOperation:(id)a3;
- (void)setTestOptionFlags:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoTestRequest

- (void)setRequestedMessageType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requestedMessageType = a3;
}

- (void)setHasRequestedMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestedMessageType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestedErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestedErrorCode = a3;
}

- (void)setHasRequestedErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSubOperation
{
  return self->_subOperation != 0;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoTestRequest;
  v4 = [(IDSQRProtoTestRequest *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_testOptionFlags, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"test_option_flags");

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_requestedMessageType, v12);
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, @"requested_message_type");

    char has = (char)self->_has;
  }
  if (has)
  {
    v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_requestedErrorCode, v12);
    objc_msgSend_setObject_forKey_(v5, v18, (uint64_t)v17, v19, @"requested_error_code");
  }
  subOperation = self->_subOperation;
  if (subOperation) {
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)subOperation, v12, @"sub_operation");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoTestRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  v5 = v6;
  if (self->_subOperation)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[6] = self->_testOptionFlags;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_requestedMessageType;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_requestedErrorCode;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  subOperation = self->_subOperation;
  if (subOperation)
  {
    v9 = v4;
    objc_msgSend_setSubOperation_(v4, v5, (uint64_t)subOperation, v6);
    v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  *(_DWORD *)(v12 + 24) = self->_testOptionFlags;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 12) = self->_requestedMessageType;
    *(unsigned char *)(v12 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v12 + 8) = self->_requestedErrorCode;
    *(unsigned char *)(v12 + 28) |= 1u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_subOperation, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[2];
  v15[2] = v17;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || self->_testOptionFlags != *((_DWORD *)v4 + 6)) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_requestedMessageType != *((_DWORD *)v4 + 3)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_15:
    char isEqual = 0;
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_requestedErrorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_15;
  }
  subOperation = self->_subOperation;
  uint64_t v11 = v4[2];
  if ((unint64_t)subOperation | v11) {
    char isEqual = objc_msgSend_isEqual_(subOperation, v8, v11, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_16:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_requestedMessageType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_requestedErrorCode;
LABEL_6:
  unsigned int testOptionFlags = self->_testOptionFlags;
  return v5 ^ v6 ^ objc_msgSend_hash(self->_subOperation, a2, v2, v3) ^ (2654435761 * testOptionFlags);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int testOptionFlags = *((_DWORD *)v4 + 6);
  char v7 = *((unsigned char *)v4 + 28);
  if ((v7 & 2) != 0)
  {
    self->_requestedMessageType = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if (v7)
  {
    self->_requestedErrorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v8 = *((void *)v4 + 2);
  if (v8)
  {
    id v9 = v4;
    objc_msgSend_setSubOperation_(self, v5, v8, v6);
    id v4 = v9;
  }
}

- (unsigned)testOptionFlags
{
  return self->_testOptionFlags;
}

- (void)setTestOptionFlags:(unsigned int)a3
{
  self->_unsigned int testOptionFlags = a3;
}

- (unsigned)requestedMessageType
{
  return self->_requestedMessageType;
}

- (unsigned)requestedErrorCode
{
  return self->_requestedErrorCode;
}

- (NSString)subOperation
{
  return self->_subOperation;
}

- (void)setSubOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end