@interface CKDPStreamingAssetRetrieveAssetResponse
- (BOOL)hasDownloadURL;
- (BOOL)hasDownloadURLExpirationTimeSeconds;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)downloadURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)downloadURLExpirationTimeSeconds;
- (int64_t)size;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDownloadURL:(id)a3;
- (void)setDownloadURLExpirationTimeSeconds:(int64_t)a3;
- (void)setHasDownloadURLExpirationTimeSeconds:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setSize:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPStreamingAssetRetrieveAssetResponse

- (void)setSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasDownloadURL
{
  return self->_downloadURL != 0;
}

- (void)setDownloadURLExpirationTimeSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_downloadURLExpirationTimeSeconds = a3;
}

- (void)setHasDownloadURLExpirationTimeSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDownloadURLExpirationTimeSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPStreamingAssetRetrieveAssetResponse;
  v4 = [(CKDPStreamingAssetRetrieveAssetResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_size);
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"size");
  }
  downloadURL = self->_downloadURL;
  if (downloadURL) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)downloadURL, @"downloadURL");
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_downloadURLExpirationTimeSeconds);
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, @"downloadURLExpirationTimeSeconds");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E83E8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_downloadURL)
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_size;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  downloadURL = self->_downloadURL;
  if (downloadURL)
  {
    v7 = v4;
    objc_msgSend_setDownloadURL_(v4, v5, (uint64_t)downloadURL);
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_downloadURLExpirationTimeSeconds;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v10 + 16) = self->_size;
    *(unsigned char *)(v10 + 32) |= 2u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_downloadURL, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v13;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v12 + 8) = self->_downloadURLExpirationTimeSeconds;
    *(unsigned char *)(v12 + 32) |= 1u;
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
  if ((has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_size != v4[2]) {
      goto LABEL_14;
    }
  }
  else if ((v4[4] & 2) != 0)
  {
    goto LABEL_14;
  }
  downloadURL = self->_downloadURL;
  uint64_t v11 = v4[3];
  if ((unint64_t)downloadURL | v11)
  {
    if (!objc_msgSend_isEqual_(downloadURL, v7, v11))
    {
LABEL_14:
      BOOL v12 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 32);
  }
  BOOL v12 = (v9 & 1) == 0;
  if (has)
  {
    if ((v9 & 1) == 0 || self->_downloadURLExpirationTimeSeconds != v4[1]) {
      goto LABEL_14;
    }
    BOOL v12 = 1;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_size;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_downloadURL, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_downloadURLExpirationTimeSeconds;
  }
  else {
    uint64_t v6 = 0;
  }
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if ((v4[4] & 2) != 0)
  {
    self->_size = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v6 = v4[3];
  if (v6)
  {
    v7 = v4;
    objc_msgSend_setDownloadURL_(self, v5, v6);
    uint64_t v4 = v7;
  }
  if (v4[4])
  {
    self->_downloadURLExpirationTimeSeconds = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int64_t)size
{
  return self->_size;
}

- (NSString)downloadURL
{
  return self->_downloadURL;
}

- (void)setDownloadURL:(id)a3
{
}

- (int64_t)downloadURLExpirationTimeSeconds
{
  return self->_downloadURLExpirationTimeSeconds;
}

- (void).cxx_destruct
{
}

@end