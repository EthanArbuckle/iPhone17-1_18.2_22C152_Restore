@interface GEOLPRInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLicensePlate;
- (BOOL)hasMaskedplateGeneratorValidatorVersion;
- (BOOL)hasPowerTypeKey;
- (BOOL)hasTimestamp;
- (BOOL)hasVehicleTypeKey;
- (BOOL)hasVersionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRInfo)init;
- (GEOLPRInfo)initWithData:(id)a3;
- (GEOLPRInfo)initWithDictionary:(id)a3;
- (GEOLPRInfo)initWithJSON:(id)a3;
- (NSData)versionId;
- (NSString)licensePlate;
- (NSString)powerTypeKey;
- (NSString)vehicleTypeKey;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)maskedplateGeneratorValidatorVersion;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLicensePlate;
- (void)_readPowerTypeKey;
- (void)_readVehicleTypeKey;
- (void)_readVersionId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasMaskedplateGeneratorValidatorVersion:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLicensePlate:(id)a3;
- (void)setMaskedplateGeneratorValidatorVersion:(unsigned int)a3;
- (void)setPowerTypeKey:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVehicleTypeKey:(id)a3;
- (void)setVersionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRInfo

- (GEOLPRInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRInfo;
  v2 = [(GEOLPRInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRInfo;
  v3 = [(GEOLPRInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLicensePlate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicensePlate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLicensePlate
{
  return self->_licensePlate != 0;
}

- (NSString)licensePlate
{
  -[GEOLPRInfo _readLicensePlate]((uint64_t)self);
  licensePlate = self->_licensePlate;

  return licensePlate;
}

- (void)setLicensePlate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_licensePlate, a3);
}

- (void)_readVehicleTypeKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleTypeKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehicleTypeKey
{
  return self->_vehicleTypeKey != 0;
}

- (NSString)vehicleTypeKey
{
  -[GEOLPRInfo _readVehicleTypeKey]((uint64_t)self);
  vehicleTypeKey = self->_vehicleTypeKey;

  return vehicleTypeKey;
}

- (void)setVehicleTypeKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_vehicleTypeKey, a3);
}

- (void)_readPowerTypeKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPowerTypeKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPowerTypeKey
{
  return self->_powerTypeKey != 0;
}

- (NSString)powerTypeKey
{
  -[GEOLPRInfo _readPowerTypeKey]((uint64_t)self);
  powerTypeKey = self->_powerTypeKey;

  return powerTypeKey;
}

- (void)setPowerTypeKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_powerTypeKey, a3);
}

- (void)_readVersionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersionId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVersionId
{
  return self->_versionId != 0;
}

- (NSData)versionId
{
  -[GEOLPRInfo _readVersionId]((uint64_t)self);
  versionId = self->_versionId;

  return versionId;
}

- (void)setVersionId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_versionId, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)maskedplateGeneratorValidatorVersion
{
  return self->_maskedplateGeneratorValidatorVersion;
}

- (void)setMaskedplateGeneratorValidatorVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_maskedplateGeneratorValidatorVersion = a3;
}

- (void)setHasMaskedplateGeneratorValidatorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMaskedplateGeneratorValidatorVersion
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRInfo;
  v4 = [(GEOLPRInfo *)&v8 description];
  v5 = [(GEOLPRInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 licensePlate];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"licensePlate";
      }
      else {
        objc_super v6 = @"license_plate";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 vehicleTypeKey];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"vehicleTypeKey";
      }
      else {
        objc_super v8 = @"vehicle_type_key";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 powerTypeKey];
    if (v9)
    {
      if (a2) {
        v10 = @"powerTypeKey";
      }
      else {
        v10 = @"power_type_key";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [(id)a1 versionId];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 base64EncodedStringWithOptions:0];
        [v4 setObject:v13 forKey:@"versionId"];
      }
      else
      {
        [v4 setObject:v11 forKey:@"version_id"];
      }
    }

    char v14 = *(unsigned char *)(a1 + 80);
    if (v14)
    {
      v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v4 setObject:v15 forKey:@"timestamp"];

      char v14 = *(unsigned char *)(a1 + 80);
    }
    if ((v14 & 2) != 0)
    {
      v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        v17 = @"maskedplateGeneratorValidatorVersion";
      }
      else {
        v17 = @"maskedplate_generator_validator_version";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __40__GEOLPRInfo__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOLPRInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOLPRInfo)initWithDictionary:(id)a3
{
  return (GEOLPRInfo *)-[GEOLPRInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"licensePlate";
      }
      else {
        objc_super v6 = @"license_plate";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setLicensePlate:v8];
      }
      if (a3) {
        v9 = @"vehicleTypeKey";
      }
      else {
        v9 = @"vehicle_type_key";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setVehicleTypeKey:v11];
      }
      if (a3) {
        v12 = @"powerTypeKey";
      }
      else {
        v12 = @"power_type_key";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v14 = (void *)[v13 copy];
        [a1 setPowerTypeKey:v14];
      }
      if (a3) {
        v15 = @"versionId";
      }
      else {
        v15 = @"version_id";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];
        [a1 setVersionId:v17];
      }
      v18 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimestamp:", objc_msgSend(v18, "unsignedLongLongValue"));
      }

      if (a3) {
        v19 = @"maskedplateGeneratorValidatorVersion";
      }
      else {
        v19 = @"maskedplate_generator_validator_version";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaskedplateGeneratorValidatorVersion:", objc_msgSend(v20, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLPRInfo)initWithJSON:(id)a3
{
  return (GEOLPRInfo *)-[GEOLPRInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_3456;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3457;
    }
    GEOLPRInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRInfo *)self readAll:0];
    if (self->_licensePlate) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_vehicleTypeKey)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_powerTypeKey)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_versionId)
    {
      PBDataWriterWriteDataField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOLPRInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_licensePlate) {
    objc_msgSend(v6, "setLicensePlate:");
  }
  if (self->_vehicleTypeKey) {
    objc_msgSend(v6, "setVehicleTypeKey:");
  }
  v4 = v6;
  if (self->_powerTypeKey)
  {
    objc_msgSend(v6, "setPowerTypeKey:");
    v4 = v6;
  }
  if (self->_versionId)
  {
    objc_msgSend(v6, "setVersionId:");
    v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v4[5] = self->_timestamp;
    *((unsigned char *)v4 + 80) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_maskedplateGeneratorValidatorVersion;
    *((unsigned char *)v4 + 80) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRInfo *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_licensePlate copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_vehicleTypeKey copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_powerTypeKey copyWithZone:a3];
  char v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  uint64_t v15 = [(NSData *)self->_versionId copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(unsigned char *)(v5 + 80) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_maskedplateGeneratorValidatorVersion;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOLPRInfo *)self readAll:1];
  [v4 readAll:1];
  licensePlate = self->_licensePlate;
  if ((unint64_t)licensePlate | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](licensePlate, "isEqual:")) {
      goto LABEL_19;
    }
  }
  vehicleTypeKey = self->_vehicleTypeKey;
  if ((unint64_t)vehicleTypeKey | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](vehicleTypeKey, "isEqual:")) {
      goto LABEL_19;
    }
  }
  powerTypeKey = self->_powerTypeKey;
  if ((unint64_t)powerTypeKey | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](powerTypeKey, "isEqual:")) {
      goto LABEL_19;
    }
  }
  versionId = self->_versionId;
  if ((unint64_t)versionId | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](versionId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_timestamp != *((void *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  BOOL v9 = (*((unsigned char *)v4 + 80) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_maskedplateGeneratorValidatorVersion != *((_DWORD *)v4 + 19)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  [(GEOLPRInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_licensePlate hash];
  NSUInteger v4 = [(NSString *)self->_vehicleTypeKey hash];
  NSUInteger v5 = [(NSString *)self->_powerTypeKey hash];
  uint64_t v6 = [(NSData *)self->_versionId hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v7 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_maskedplateGeneratorValidatorVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[3])
  {
    -[GEOLPRInfo setLicensePlate:](self, "setLicensePlate:");
    NSUInteger v4 = v6;
  }
  if (v4[6])
  {
    -[GEOLPRInfo setVehicleTypeKey:](self, "setVehicleTypeKey:");
    NSUInteger v4 = v6;
  }
  if (v4[4])
  {
    -[GEOLPRInfo setPowerTypeKey:](self, "setPowerTypeKey:");
    NSUInteger v4 = v6;
  }
  if (v4[7])
  {
    -[GEOLPRInfo setVersionId:](self, "setVersionId:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 80);
  if (v5)
  {
    self->_timestamp = v4[5];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 80);
  }
  if ((v5 & 2) != 0)
  {
    self->_maskedplateGeneratorValidatorVersion = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOLPRInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3461);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLPRInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionId, 0);
  objc_storeStrong((id *)&self->_vehicleTypeKey, 0);
  objc_storeStrong((id *)&self->_powerTypeKey, 0);
  objc_storeStrong((id *)&self->_licensePlate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end