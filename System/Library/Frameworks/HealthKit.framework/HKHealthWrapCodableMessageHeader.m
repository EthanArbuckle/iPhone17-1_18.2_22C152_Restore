@interface HKHealthWrapCodableMessageHeader
- (BOOL)compressed;
- (BOOL)hasCompressed;
- (BOOL)hasEncryptedHMACKey;
- (BOOL)hasEncryptedMessageKey;
- (BOOL)hasEncryptionIdentity;
- (BOOL)hasStudyIdentifier;
- (BOOL)hasStudyUUID;
- (BOOL)hasTrailingHMACLength;
- (BOOL)hasTrailingSHALength;
- (BOOL)hasUploadUUID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedHMACKey;
- (NSData)encryptedMessageKey;
- (NSData)encryptionIdentity;
- (NSData)studyUUID;
- (NSData)uploadUUID;
- (NSString)studyIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)trailingHMACLength;
- (int)trailingSHALength;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setEncryptedHMACKey:(id)a3;
- (void)setEncryptedMessageKey:(id)a3;
- (void)setEncryptionIdentity:(id)a3;
- (void)setHasCompressed:(BOOL)a3;
- (void)setHasTrailingHMACLength:(BOOL)a3;
- (void)setHasTrailingSHALength:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setStudyIdentifier:(id)a3;
- (void)setStudyUUID:(id)a3;
- (void)setTrailingHMACLength:(int)a3;
- (void)setTrailingSHALength:(int)a3;
- (void)setUploadUUID:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKHealthWrapCodableMessageHeader

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEncryptedMessageKey
{
  return self->_encryptedMessageKey != 0;
}

- (BOOL)hasEncryptionIdentity
{
  return self->_encryptionIdentity != 0;
}

- (BOOL)hasUploadUUID
{
  return self->_uploadUUID != 0;
}

- (BOOL)hasStudyIdentifier
{
  return self->_studyIdentifier != 0;
}

- (BOOL)hasEncryptedHMACKey
{
  return self->_encryptedHMACKey != 0;
}

- (void)setTrailingHMACLength:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_trailingHMACLength = a3;
}

- (void)setHasTrailingHMACLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTrailingHMACLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTrailingSHALength:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_trailingSHALength = a3;
}

- (void)setHasTrailingSHALength:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrailingSHALength
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCompressed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_compressed = a3;
}

- (void)setHasCompressed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCompressed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasStudyUUID
{
  return self->_studyUUID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKHealthWrapCodableMessageHeader;
  v4 = [(HKHealthWrapCodableMessageHeader *)&v8 description];
  v5 = [(HKHealthWrapCodableMessageHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  encryptedMessageKey = self->_encryptedMessageKey;
  if (encryptedMessageKey) {
    [v3 setObject:encryptedMessageKey forKey:@"encryptedMessageKey"];
  }
  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity) {
    [v3 setObject:encryptionIdentity forKey:@"encryptionIdentity"];
  }
  uploadUUID = self->_uploadUUID;
  if (uploadUUID) {
    [v3 setObject:uploadUUID forKey:@"uploadUUID"];
  }
  studyIdentifier = self->_studyIdentifier;
  if (studyIdentifier) {
    [v3 setObject:studyIdentifier forKey:@"studyIdentifier"];
  }
  encryptedHMACKey = self->_encryptedHMACKey;
  if (encryptedHMACKey) {
    [v3 setObject:encryptedHMACKey forKey:@"encryptedHMACKey"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_trailingHMACLength];
    [v3 setObject:v14 forKey:@"trailingHMACLength"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  v15 = [NSNumber numberWithInt:self->_trailingSHALength];
  [v3 setObject:v15 forKey:@"trailingSHALength"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    v11 = [NSNumber numberWithBool:self->_compressed];
    [v3 setObject:v11 forKey:@"compressed"];
  }
LABEL_17:
  studyUUID = self->_studyUUID;
  if (studyUUID) {
    [v3 setObject:studyUUID forKey:@"studyUUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKHealthWrapCodableMessageHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_encryptedMessageKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_encryptionIdentity)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_uploadUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_studyIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_encryptedHMACKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_17:
  if (self->_studyUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_version;
    *((unsigned char *)v4 + 76) |= 1u;
  }
  id v6 = v4;
  if (self->_encryptedMessageKey)
  {
    objc_msgSend(v4, "setEncryptedMessageKey:");
    id v4 = v6;
  }
  if (self->_encryptionIdentity)
  {
    objc_msgSend(v6, "setEncryptionIdentity:");
    id v4 = v6;
  }
  if (self->_uploadUUID)
  {
    objc_msgSend(v6, "setUploadUUID:");
    id v4 = v6;
  }
  if (self->_studyIdentifier)
  {
    objc_msgSend(v6, "setStudyIdentifier:");
    id v4 = v6;
  }
  if (self->_encryptedHMACKey)
  {
    objc_msgSend(v6, "setEncryptedHMACKey:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_trailingHMACLength;
    *((unsigned char *)v4 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 15) = self->_trailingSHALength;
  *((unsigned char *)v4 + 76) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    *((unsigned char *)v4 + 72) = self->_compressed;
    *((unsigned char *)v4 + 76) |= 8u;
  }
LABEL_17:
  if (self->_studyUUID)
  {
    objc_msgSend(v6, "setStudyUUID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_version;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_encryptedMessageKey copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSData *)self->_encryptionIdentity copyWithZone:a3];
  v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  uint64_t v11 = [(NSData *)self->_uploadUUID copyWithZone:a3];
  v12 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v11;

  uint64_t v13 = [(NSString *)self->_studyIdentifier copyWithZone:a3];
  v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  uint64_t v15 = [(NSData *)self->_encryptedHMACKey copyWithZone:a3];
  v16 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v15;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 60) = self->_trailingSHALength;
    *(unsigned char *)(v6 + 76) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 56) = self->_trailingHMACLength;
  *(unsigned char *)(v6 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 72) = self->_compressed;
    *(unsigned char *)(v6 + 76) |= 8u;
  }
LABEL_7:
  uint64_t v18 = [(NSData *)self->_studyUUID copyWithZone:a3];
  v19 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v18;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_version != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_31;
  }
  encryptedMessageKey = self->_encryptedMessageKey;
  if ((unint64_t)encryptedMessageKey | *((void *)v4 + 3)
    && !-[NSData isEqual:](encryptedMessageKey, "isEqual:"))
  {
    goto LABEL_31;
  }
  encryptionIdentity = self->_encryptionIdentity;
  if ((unint64_t)encryptionIdentity | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](encryptionIdentity, "isEqual:")) {
      goto LABEL_31;
    }
  }
  uploadUUID = self->_uploadUUID;
  if ((unint64_t)uploadUUID | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](uploadUUID, "isEqual:")) {
      goto LABEL_31;
    }
  }
  studyIdentifier = self->_studyIdentifier;
  if ((unint64_t)studyIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](studyIdentifier, "isEqual:")) {
      goto LABEL_31;
    }
  }
  encryptedHMACKey = self->_encryptedHMACKey;
  if ((unint64_t)encryptedHMACKey | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](encryptedHMACKey, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_trailingHMACLength != *((_DWORD *)v4 + 14)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_trailingSHALength != *((_DWORD *)v4 + 15)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0) {
      goto LABEL_37;
    }
LABEL_31:
    char v10 = 0;
    goto LABEL_32;
  }
  if ((*((unsigned char *)v4 + 76) & 8) == 0) {
    goto LABEL_31;
  }
  if (!self->_compressed)
  {
    if (!*((unsigned char *)v4 + 72)) {
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  if (!*((unsigned char *)v4 + 72)) {
    goto LABEL_31;
  }
LABEL_37:
  studyUUID = self->_studyUUID;
  if ((unint64_t)studyUUID | *((void *)v4 + 6)) {
    char v10 = -[NSData isEqual:](studyUUID, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_encryptedMessageKey hash];
  uint64_t v5 = [(NSData *)self->_encryptionIdentity hash];
  uint64_t v6 = [(NSData *)self->_uploadUUID hash];
  NSUInteger v7 = [(NSString *)self->_studyIdentifier hash];
  uint64_t v8 = [(NSData *)self->_encryptedHMACKey hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSData *)self->_studyUUID hash];
  }
  uint64_t v9 = 2654435761 * self->_trailingHMACLength;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v10 = 2654435761 * self->_trailingSHALength;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v11 = 2654435761 * self->_compressed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSData *)self->_studyUUID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 76))
  {
    self->_version = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[HKHealthWrapCodableMessageHeader setEncryptedMessageKey:](self, "setEncryptedMessageKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[HKHealthWrapCodableMessageHeader setEncryptionIdentity:](self, "setEncryptionIdentity:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[HKHealthWrapCodableMessageHeader setUploadUUID:](self, "setUploadUUID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[HKHealthWrapCodableMessageHeader setStudyIdentifier:](self, "setStudyIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[HKHealthWrapCodableMessageHeader setEncryptedHMACKey:](self, "setEncryptedHMACKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_trailingHMACLength = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 76);
    if ((v5 & 4) == 0)
    {
LABEL_15:
      if ((v5 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) == 0)
  {
    goto LABEL_15;
  }
  self->_trailingSHALength = *((_DWORD *)v4 + 15);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
LABEL_16:
    self->_compressed = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_17:
  if (*((void *)v4 + 6))
  {
    -[HKHealthWrapCodableMessageHeader setStudyUUID:](self, "setStudyUUID:");
    id v4 = v6;
  }
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)encryptedMessageKey
{
  return self->_encryptedMessageKey;
}

- (void)setEncryptedMessageKey:(id)a3
{
}

- (NSData)encryptionIdentity
{
  return self->_encryptionIdentity;
}

- (void)setEncryptionIdentity:(id)a3
{
}

- (NSData)uploadUUID
{
  return self->_uploadUUID;
}

- (void)setUploadUUID:(id)a3
{
}

- (NSString)studyIdentifier
{
  return self->_studyIdentifier;
}

- (void)setStudyIdentifier:(id)a3
{
}

- (NSData)encryptedHMACKey
{
  return self->_encryptedHMACKey;
}

- (void)setEncryptedHMACKey:(id)a3
{
}

- (int)trailingHMACLength
{
  return self->_trailingHMACLength;
}

- (int)trailingSHALength
{
  return self->_trailingSHALength;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (NSData)studyUUID
{
  return self->_studyUUID;
}

- (void)setStudyUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadUUID, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_studyIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptionIdentity, 0);
  objc_storeStrong((id *)&self->_encryptedMessageKey, 0);

  objc_storeStrong((id *)&self->_encryptedHMACKey, 0);
}

@end