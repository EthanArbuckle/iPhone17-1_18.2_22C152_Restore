@interface CKCDPCodeServiceRequestOperationGroup
- (BOOL)hasOperationGroupId;
- (BOOL)hasOperationGroupName;
- (BOOL)hasOperationGroupQuantity;
- (BOOL)hasOperationId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)operationGroupId;
- (NSString)operationGroupName;
- (NSString)operationId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)operationGroupQuantity;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOperationGroupQuantity:(BOOL)a3;
- (void)setOperationGroupId:(id)a3;
- (void)setOperationGroupName:(id)a3;
- (void)setOperationGroupQuantity:(int64_t)a3;
- (void)setOperationId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestOperationGroup

- (BOOL)hasOperationId
{
  return self->_operationId != 0;
}

- (BOOL)hasOperationGroupId
{
  return self->_operationGroupId != 0;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (void)setOperationGroupQuantity:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_operationGroupQuantity = a3;
}

- (void)setHasOperationGroupQuantity:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationGroupQuantity
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestOperationGroup;
  v4 = [(CKCDPCodeServiceRequestOperationGroup *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  operationId = self->_operationId;
  if (operationId) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)operationId, @"operationId");
  }
  operationGroupId = self->_operationGroupId;
  if (operationGroupId) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupId, @"operationGroupId");
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupName, @"operationGroupName");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_operationGroupQuantity);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"operationGroupQuantity");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F02D64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_operationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_operationGroupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_operationGroupName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  operationId = self->_operationId;
  id v9 = v4;
  if (operationId)
  {
    objc_msgSend_setOperationId_(v4, v5, (uint64_t)operationId);
    id v4 = v9;
  }
  operationGroupId = self->_operationGroupId;
  if (operationGroupId)
  {
    objc_msgSend_setOperationGroupId_(v9, v5, (uint64_t)operationGroupId);
    id v4 = v9;
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    objc_msgSend_setOperationGroupName_(v9, v5, (uint64_t)operationGroupName);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_operationGroupQuantity;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_operationId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_operationGroupId, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_operationGroupName, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v10 + 8) = self->_operationGroupQuantity;
    *(unsigned char *)(v10 + 40) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_12;
  }
  operationId = self->_operationId;
  uint64_t v9 = v4[4];
  if ((unint64_t)operationId | v9)
  {
    if (!objc_msgSend_isEqual_(operationId, v7, v9)) {
      goto LABEL_12;
    }
  }
  operationGroupId = self->_operationGroupId;
  uint64_t v11 = v4[2];
  if ((unint64_t)operationGroupId | v11)
  {
    if (!objc_msgSend_isEqual_(operationGroupId, v7, v11)) {
      goto LABEL_12;
    }
  }
  operationGroupName = self->_operationGroupName;
  uint64_t v13 = v4[3];
  if ((unint64_t)operationGroupName | v13)
  {
    if (!objc_msgSend_isEqual_(operationGroupName, v7, v13)) {
      goto LABEL_12;
    }
  }
  BOOL v14 = (v4[5] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[5] & 1) != 0 && self->_operationGroupQuantity == v4[1])
    {
      BOOL v14 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v14 = 0;
  }
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_operationId, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_operationGroupId, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_operationGroupName, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_operationGroupQuantity;
  }
  else {
    uint64_t v11 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[4];
  uint64_t v9 = v4;
  if (v6)
  {
    objc_msgSend_setOperationId_(self, v5, v6);
    uint64_t v4 = v9;
  }
  uint64_t v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setOperationGroupId_(self, v5, v7);
    uint64_t v4 = v9;
  }
  uint64_t v8 = v4[3];
  if (v8)
  {
    objc_msgSend_setOperationGroupName_(self, v5, v8);
    uint64_t v4 = v9;
  }
  if (v4[5])
  {
    self->_operationGroupQuantity = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)operationId
{
  return self->_operationId;
}

- (void)setOperationId:(id)a3
{
}

- (NSString)operationGroupId
{
  return self->_operationGroupId;
}

- (void)setOperationGroupId:(id)a3
{
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
}

- (int64_t)operationGroupQuantity
{
  return self->_operationGroupQuantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationId, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationGroupId, 0);
}

@end