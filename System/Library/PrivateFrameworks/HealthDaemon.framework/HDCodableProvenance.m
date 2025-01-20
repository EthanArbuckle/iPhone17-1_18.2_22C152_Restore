@interface HDCodableProvenance
- (BOOL)hasContributorUUID;
- (BOOL)hasDeviceUUID;
- (BOOL)hasOriginBuild;
- (BOOL)hasOriginMajorVersion;
- (BOOL)hasOriginMinorVersion;
- (BOOL)hasOriginPatchVersion;
- (BOOL)hasOriginProductType;
- (BOOL)hasSourceUUID;
- (BOOL)hasSourceVersion;
- (BOOL)hasTimeZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)contributorUUID;
- (NSData)deviceUUID;
- (NSData)sourceUUID;
- (NSString)originBuild;
- (NSString)originProductType;
- (NSString)sourceVersion;
- (NSString)timeZoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedDeviceUUID;
- (id)decodedSourceUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originMajorVersion;
- (int)originMinorVersion;
- (int)originPatchVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContributorUUID:(id)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setHasOriginMajorVersion:(BOOL)a3;
- (void)setHasOriginMinorVersion:(BOOL)a3;
- (void)setHasOriginPatchVersion:(BOOL)a3;
- (void)setOriginBuild:(id)a3;
- (void)setOriginMajorVersion:(int)a3;
- (void)setOriginMinorVersion:(int)a3;
- (void)setOriginPatchVersion:(int)a3;
- (void)setOriginProductType:(id)a3;
- (void)setSourceUUID:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)setTimeZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableProvenance

- (void)setOriginBuild:(id)a3
{
}

- (void)setOriginProductType:(id)a3
{
}

- (void)setTimeZoneName:(id)a3
{
}

- (void)setSourceUUID:(id)a3
{
}

- (void)setSourceVersion:(id)a3
{
}

- (void)setDeviceUUID:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_originBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_deviceUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_sourceVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_originProductType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_16:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_17:
  if (self->_contributorUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_originProductType, 0);
  objc_storeStrong((id *)&self->_originBuild, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_contributorUUID, 0);
}

- (id)decodedSourceUUID
{
  if (self->_sourceUUID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)decodedDeviceUUID
{
  if (self->_deviceUUID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (NSString)originProductType
{
  return self->_originProductType;
}

- (BOOL)hasOriginMajorVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)originBuild
{
  return self->_originBuild;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (BOOL)hasOriginBuild
{
  return self->_originBuild != 0;
}

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (BOOL)hasDeviceUUID
{
  return self->_deviceUUID != 0;
}

- (BOOL)hasSourceVersion
{
  return self->_sourceVersion != 0;
}

- (BOOL)hasOriginProductType
{
  return self->_originProductType != 0;
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (void)setOriginMajorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_originMajorVersion = a3;
}

- (void)setHasOriginMajorVersion:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setOriginMinorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_originMinorVersion = a3;
}

- (void)setHasOriginMinorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginMinorVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOriginPatchVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_originPatchVersion = a3;
}

- (void)setHasOriginPatchVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginPatchVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasContributorUUID
{
  return self->_contributorUUID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableProvenance;
  id v4 = [(HDCodableProvenance *)&v8 description];
  v5 = [(HDCodableProvenance *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  originBuild = self->_originBuild;
  if (originBuild) {
    [v3 setObject:originBuild forKey:@"originBuild"];
  }
  sourceUUID = self->_sourceUUID;
  if (sourceUUID) {
    [v4 setObject:sourceUUID forKey:@"sourceUUID"];
  }
  deviceUUID = self->_deviceUUID;
  if (deviceUUID) {
    [v4 setObject:deviceUUID forKey:@"deviceUUID"];
  }
  sourceVersion = self->_sourceVersion;
  if (sourceVersion) {
    [v4 setObject:sourceVersion forKey:@"sourceVersion"];
  }
  originProductType = self->_originProductType;
  if (originProductType) {
    [v4 setObject:originProductType forKey:@"originProductType"];
  }
  timeZoneName = self->_timeZoneName;
  if (timeZoneName) {
    [v4 setObject:timeZoneName forKey:@"timeZoneName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = [NSNumber numberWithInt:self->_originMajorVersion];
    [v4 setObject:v15 forKey:@"originMajorVersion"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  v16 = [NSNumber numberWithInt:self->_originMinorVersion];
  [v4 setObject:v16 forKey:@"originMinorVersion"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_16:
    v12 = [NSNumber numberWithInt:self->_originPatchVersion];
    [v4 setObject:v12 forKey:@"originPatchVersion"];
  }
LABEL_17:
  contributorUUID = self->_contributorUUID;
  if (contributorUUID) {
    [v4 setObject:contributorUUID forKey:@"contributorUUID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableProvenanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_originBuild)
  {
    objc_msgSend(v4, "setOriginBuild:");
    id v4 = v6;
  }
  if (self->_sourceUUID)
  {
    objc_msgSend(v6, "setSourceUUID:");
    id v4 = v6;
  }
  if (self->_deviceUUID)
  {
    objc_msgSend(v6, "setDeviceUUID:");
    id v4 = v6;
  }
  if (self->_sourceVersion)
  {
    objc_msgSend(v6, "setSourceVersion:");
    id v4 = v6;
  }
  if (self->_originProductType)
  {
    objc_msgSend(v6, "setOriginProductType:");
    id v4 = v6;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v6, "setTimeZoneName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_originMajorVersion;
    *((unsigned char *)v4 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 9) = self->_originMinorVersion;
  *((unsigned char *)v4 + 80) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 10) = self->_originPatchVersion;
    *((unsigned char *)v4 + 80) |= 4u;
  }
LABEL_17:
  if (self->_contributorUUID)
  {
    objc_msgSend(v6, "setContributorUUID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_originBuild copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_sourceUUID copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSData *)self->_deviceUUID copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_sourceVersion copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_originProductType copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_timeZoneName copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_originMinorVersion;
    *(unsigned char *)(v5 + 80) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_originMajorVersion;
  *(unsigned char *)(v5 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_originPatchVersion;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
LABEL_5:
  uint64_t v19 = [(NSData *)self->_contributorUUID copyWithZone:a3];
  v20 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  originBuild = self->_originBuild;
  if ((unint64_t)originBuild | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](originBuild, "isEqual:")) {
      goto LABEL_31;
    }
  }
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:")) {
      goto LABEL_31;
    }
  }
  deviceUUID = self->_deviceUUID;
  if ((unint64_t)deviceUUID | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](deviceUUID, "isEqual:")) {
      goto LABEL_31;
    }
  }
  sourceVersion = self->_sourceVersion;
  if ((unint64_t)sourceVersion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](sourceVersion, "isEqual:")) {
      goto LABEL_31;
    }
  }
  originProductType = self->_originProductType;
  if ((unint64_t)originProductType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](originProductType, "isEqual:")) {
      goto LABEL_31;
    }
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_originMajorVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_31:
    char v12 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_originMinorVersion != *((_DWORD *)v4 + 9)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_originPatchVersion != *((_DWORD *)v4 + 10)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_31;
  }
  contributorUUID = self->_contributorUUID;
  if ((unint64_t)contributorUUID | *((void *)v4 + 1)) {
    char v12 = -[NSData isEqual:](contributorUUID, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_32:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_originBuild hash];
  uint64_t v4 = [(NSData *)self->_sourceUUID hash];
  uint64_t v5 = [(NSData *)self->_deviceUUID hash];
  NSUInteger v6 = [(NSString *)self->_sourceVersion hash];
  NSUInteger v7 = [(NSString *)self->_originProductType hash];
  NSUInteger v8 = [(NSString *)self->_timeZoneName hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSData *)self->_contributorUUID hash];
  }
  uint64_t v9 = 2654435761 * self->_originMajorVersion;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v10 = 2654435761 * self->_originMinorVersion;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v11 = 2654435761 * self->_originPatchVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSData *)self->_contributorUUID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[HDCodableProvenance setOriginBuild:](self, "setOriginBuild:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[HDCodableProvenance setSourceUUID:](self, "setSourceUUID:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[HDCodableProvenance setDeviceUUID:](self, "setDeviceUUID:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[HDCodableProvenance setSourceVersion:](self, "setSourceVersion:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCodableProvenance setOriginProductType:](self, "setOriginProductType:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[HDCodableProvenance setTimeZoneName:](self, "setTimeZoneName:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 80);
  if (v5)
  {
    self->_originMajorVersion = v4[8];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_15:
      if ((v5 & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((v4[20] & 2) == 0)
  {
    goto LABEL_15;
  }
  self->_originMinorVersion = v4[9];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[20] & 4) != 0)
  {
LABEL_16:
    self->_originPatchVersion = v4[10];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_17:
  if (*((void *)v4 + 1))
  {
    -[HDCodableProvenance setContributorUUID:](self, "setContributorUUID:");
    uint64_t v4 = v6;
  }
}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (NSData)deviceUUID
{
  return self->_deviceUUID;
}

- (int)originMajorVersion
{
  return self->_originMajorVersion;
}

- (int)originMinorVersion
{
  return self->_originMinorVersion;
}

- (int)originPatchVersion
{
  return self->_originPatchVersion;
}

- (NSData)contributorUUID
{
  return self->_contributorUUID;
}

- (void)setContributorUUID:(id)a3
{
}

@end