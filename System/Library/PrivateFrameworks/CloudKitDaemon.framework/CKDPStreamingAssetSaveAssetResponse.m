@interface CKDPStreamingAssetSaveAssetResponse
- (BOOL)hasReservedSize;
- (BOOL)hasUploadURL;
- (BOOL)hasUploadURLExpirationTimeSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uploadURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)reservedSize;
- (int64_t)uploadURLExpirationTimeSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasReservedSize:(BOOL)a3;
- (void)setHasUploadURLExpirationTimeSeconds:(BOOL)a3;
- (void)setReservedSize:(int64_t)a3;
- (void)setUploadURL:(id)a3;
- (void)setUploadURLExpirationTimeSeconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPStreamingAssetSaveAssetResponse

- (void)setReservedSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reservedSize = a3;
}

- (void)setHasReservedSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReservedSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUploadURL
{
  return self->_uploadURL != 0;
}

- (void)setUploadURLExpirationTimeSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uploadURLExpirationTimeSeconds = a3;
}

- (void)setHasUploadURLExpirationTimeSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUploadURLExpirationTimeSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPStreamingAssetSaveAssetResponse;
  v4 = [(CKDPStreamingAssetSaveAssetResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_reservedSize);
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"reservedSize");
  }
  uploadURL = self->_uploadURL;
  if (uploadURL) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)uploadURL, @"uploadURL");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_uploadURLExpirationTimeSeconds);
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, @"uploadURLExpirationTimeSeconds");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E1A7C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_uploadURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_reservedSize;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  uploadURL = self->_uploadURL;
  if (uploadURL)
  {
    v7 = v4;
    objc_msgSend_setUploadURL_(v4, v5, (uint64_t)uploadURL);
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_uploadURLExpirationTimeSeconds;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v10 + 8) = self->_reservedSize;
    *(unsigned char *)(v10 + 32) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_uploadURL, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v12 + 16) = self->_uploadURLExpirationTimeSeconds;
    *(unsigned char *)(v12 + 32) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 32);
  if (has)
  {
    if ((v4[4] & 1) == 0 || self->_reservedSize != v4[1]) {
      goto LABEL_14;
    }
  }
  else if (v4[4])
  {
    goto LABEL_14;
  }
  uploadURL = self->_uploadURL;
  uint64_t v11 = v4[3];
  if ((unint64_t)uploadURL | v11)
  {
    if (!objc_msgSend_isEqual_(uploadURL, v7, v11))
    {
LABEL_14:
      BOOL v12 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 32);
  }
  BOOL v12 = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_uploadURLExpirationTimeSeconds != v4[2]) {
      goto LABEL_14;
    }
    BOOL v12 = 1;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_reservedSize;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_uploadURL, a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_uploadURLExpirationTimeSeconds;
  }
  else {
    uint64_t v6 = 0;
  }
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[4])
  {
    self->_reservedSize = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v6 = v4[3];
  if (v6)
  {
    v7 = v4;
    objc_msgSend_setUploadURL_(self, v5, v6);
    uint64_t v4 = v7;
  }
  if ((v4[4] & 2) != 0)
  {
    self->_uploadURLExpirationTimeSeconds = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)reservedSize
{
  return self->_reservedSize;
}

- (NSString)uploadURL
{
  return self->_uploadURL;
}

- (void)setUploadURL:(id)a3
{
}

- (int64_t)uploadURLExpirationTimeSeconds
{
  return self->_uploadURLExpirationTimeSeconds;
}

- (void).cxx_destruct
{
}

@end