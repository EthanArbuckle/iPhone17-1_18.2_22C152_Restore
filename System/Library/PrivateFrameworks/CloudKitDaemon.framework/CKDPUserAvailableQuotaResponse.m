@interface CKDPUserAvailableQuotaResponse
- (BOOL)hasStorageAvailableBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)storageAvailableBytes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStorageAvailableBytes:(BOOL)a3;
- (void)setStorageAvailableBytes:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUserAvailableQuotaResponse

- (void)setStorageAvailableBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_storageAvailableBytes = a3;
}

- (void)setHasStorageAvailableBytes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStorageAvailableBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserAvailableQuotaResponse;
  v4 = [(CKDPUserAvailableQuotaResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v4, self->_storageAvailableBytes);
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"storageAvailableBytes");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D4DB64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_storageAvailableBytes;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = self->_storageAvailableBytes;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_6;
  }
  BOOL v7 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_storageAvailableBytes == *((void *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v7 = 0;
  }
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_storageAvailableBytes;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_storageAvailableBytes = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)storageAvailableBytes
{
  return self->_storageAvailableBytes;
}

@end