@interface HDCodableSyncStateOrigin
- (BOOL)hasBuild;
- (BOOL)hasMajorVersion;
- (BOOL)hasMinorVersion;
- (BOOL)hasPatchVersion;
- (BOOL)hasProductType;
- (BOOL)hasSyncIdentity;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSString)build;
- (NSString)productType;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)majorVersion;
- (int)minorVersion;
- (int)patchVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setHasMajorVersion:(BOOL)a3;
- (void)setHasMinorVersion:(BOOL)a3;
- (void)setHasPatchVersion:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMajorVersion:(int)a3;
- (void)setMinorVersion:(int)a3;
- (void)setPatchVersion:(int)a3;
- (void)setProductType:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSyncStateOrigin

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (void)setMajorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_majorVersion = a3;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMajorVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMinorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minorVersion = a3;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinorVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPatchVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_patchVersion = a3;
}

- (void)setHasPatchVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPatchVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncStateOrigin;
  v4 = [(HDCodableSyncStateOrigin *)&v8 description];
  v5 = [(HDCodableSyncStateOrigin *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  build = self->_build;
  if (build) {
    [v3 setObject:build forKey:@"build"];
  }
  productType = self->_productType;
  if (productType) {
    [v3 setObject:productType forKey:@"productType"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithInt:self->_majorVersion];
    [v3 setObject:v12 forKey:@"majorVersion"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v13 = [NSNumber numberWithInt:self->_minorVersion];
  [v3 setObject:v13 forKey:@"minorVersion"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    objc_super v8 = [NSNumber numberWithInt:self->_patchVersion];
    [v3 setObject:v8 forKey:@"patchVersion"];
  }
LABEL_11:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v10 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"syncIdentity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncStateOriginReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
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
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_11:
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v6 = v4;
  if (self->_build)
  {
    objc_msgSend(v4, "setBuild:");
    id v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_majorVersion;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 7) = self->_minorVersion;
  *((unsigned char *)v4 + 56) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 8) = self->_patchVersion;
    *((unsigned char *)v4 + 56) |= 8u;
  }
LABEL_11:
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_build copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_productType copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 28) = self->_minorVersion;
    *(unsigned char *)(v6 + 56) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 24) = self->_majorVersion;
  *(unsigned char *)(v6 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 32) = self->_patchVersion;
    *(unsigned char *)(v6 + 56) |= 8u;
  }
LABEL_7:
  id v12 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_28:
    char v8 = 0;
    goto LABEL_29;
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 2) && !-[NSString isEqual:](build, "isEqual:")) {
    goto LABEL_28;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_majorVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_minorVersion != *((_DWORD *)v4 + 7)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_patchVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_28;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 6)) {
    char v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v5 = -timestamp;
    if (timestamp >= 0.0) {
      double v5 = self->_timestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_build hash];
  NSUInteger v9 = [(NSString *)self->_productType hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  }
  uint64_t v10 = 2654435761 * self->_majorVersion;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_minorVersion;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v12 = 2654435761 * self->_patchVersion;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  double v5 = v4;
  if ((_BYTE)v4[7])
  {
    self->_double timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v9 = v4;
  if (*((void *)v4 + 2))
  {
    -[HDCodableSyncStateOrigin setBuild:](self, "setBuild:");
    double v5 = v9;
  }
  if (*((void *)v5 + 5))
  {
    -[HDCodableSyncStateOrigin setProductType:](self, "setProductType:");
    double v5 = v9;
  }
  char v6 = *((unsigned char *)v5 + 56);
  if ((v6 & 2) != 0)
  {
    self->_majorVersion = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 56);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if (((_BYTE)v5[7] & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_minorVersion = *((_DWORD *)v5 + 7);
  *(unsigned char *)&self->_has |= 4u;
  if (((_BYTE)v5[7] & 8) != 0)
  {
LABEL_10:
    self->_patchVersion = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_11:
  syncIdentity = self->_syncIdentity;
  uint64_t v8 = *((void *)v5 + 6);
  if (syncIdentity)
  {
    if (!v8) {
      goto LABEL_20;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_20;
    }
    -[HDCodableSyncStateOrigin setSyncIdentity:](self, "setSyncIdentity:");
  }
  double v5 = v9;
LABEL_20:
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)patchVersion
{
  return self->_patchVersion;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_productType, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end