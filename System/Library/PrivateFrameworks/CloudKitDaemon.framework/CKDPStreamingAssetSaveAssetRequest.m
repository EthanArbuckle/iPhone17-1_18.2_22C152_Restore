@interface CKDPStreamingAssetSaveAssetRequest
- (BOOL)hasRequestedSize;
- (BOOL)hasUploadReceipt;
- (BOOL)hasUploadedSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uploadReceipt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)requestedSize;
- (int64_t)uploadedSize;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRequestedSize:(BOOL)a3;
- (void)setHasUploadedSize:(BOOL)a3;
- (void)setRequestedSize:(int64_t)a3;
- (void)setUploadReceipt:(id)a3;
- (void)setUploadedSize:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPStreamingAssetSaveAssetRequest

- (void)setRequestedSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestedSize = a3;
}

- (void)setHasRequestedSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUploadedSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uploadedSize = a3;
}

- (void)setHasUploadedSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUploadedSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUploadReceipt
{
  return self->_uploadReceipt != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPStreamingAssetSaveAssetRequest;
  v4 = [(CKDPStreamingAssetSaveAssetRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if (has)
  {
    v7 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_requestedSize);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"requestedSize");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_uploadedSize);
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, @"uploadedSize");
  }
  uploadReceipt = self->_uploadReceipt;
  if (uploadReceipt) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)uploadReceipt, @"uploadReceipt");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4DF4AB8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_uploadReceipt)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_requestedSize;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_uploadedSize;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  uploadReceipt = self->_uploadReceipt;
  if (uploadReceipt)
  {
    v8 = v4;
    objc_msgSend_setUploadReceipt_(v4, v5, (uint64_t)uploadReceipt);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_requestedSize;
    *(unsigned char *)(v10 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v10 + 16) = self->_uploadedSize;
    *(unsigned char *)(v10 + 32) |= 2u;
  }
  uint64_t v14 = objc_msgSend_copyWithZone_(self->_uploadReceipt, v11, (uint64_t)a3);
  v15 = (void *)v12[3];
  v12[3] = v14;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_requestedSize != v4[1]) {
      goto LABEL_14;
    }
  }
  else if (v4[4])
  {
LABEL_14:
    char isEqual = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_uploadedSize != v4[2]) {
      goto LABEL_14;
    }
  }
  else if ((v4[4] & 2) != 0)
  {
    goto LABEL_14;
  }
  uploadReceipt = self->_uploadReceipt;
  uint64_t v9 = v4[3];
  if ((unint64_t)uploadReceipt | v9) {
    char isEqual = objc_msgSend_isEqual_(uploadReceipt, v7, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_15:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_requestedSize;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ objc_msgSend_hash(self->_uploadReceipt, a2, v2);
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_uploadedSize;
  return v4 ^ v3 ^ objc_msgSend_hash(self->_uploadReceipt, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v6 = *((unsigned char *)v4 + 32);
  if (v6)
  {
    self->_requestedSize = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_uploadedSize = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v7 = *((void *)v4 + 3);
  if (v7)
  {
    id v8 = v4;
    objc_msgSend_setUploadReceipt_(self, v5, v7);
    id v4 = v8;
  }
}

- (int64_t)requestedSize
{
  return self->_requestedSize;
}

- (int64_t)uploadedSize
{
  return self->_uploadedSize;
}

- (NSString)uploadReceipt
{
  return self->_uploadReceipt;
}

- (void)setUploadReceipt:(id)a3
{
}

- (void).cxx_destruct
{
}

@end