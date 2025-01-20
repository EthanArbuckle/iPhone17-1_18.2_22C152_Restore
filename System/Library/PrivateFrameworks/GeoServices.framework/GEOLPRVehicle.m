@interface GEOLPRVehicle
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLicensePlate;
- (BOOL)hasPowerTypeKey;
- (BOOL)hasVehicleTypeKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRVehicle)init;
- (GEOLPRVehicle)initWithData:(id)a3;
- (GEOLPRVehicle)initWithDictionary:(id)a3;
- (GEOLPRVehicle)initWithJSON:(id)a3;
- (NSString)licensePlate;
- (NSString)name;
- (NSString)powerTypeKey;
- (NSString)vehicleTypeKey;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLicensePlate;
- (void)_readPowerTypeKey;
- (void)_readVehicleTypeKey;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLicensePlate:(id)a3;
- (void)setName:(id)a3;
- (void)setPowerTypeKey:(id)a3;
- (void)setVehicleTypeKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRVehicle

- (GEOLPRVehicle)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRVehicle;
  v2 = [(GEOLPRVehicle *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRVehicle)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRVehicle;
  v3 = [(GEOLPRVehicle *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)name
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRVehicleReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readName_tags_18);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPowerTypeKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRVehicleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPowerTypeKey_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPowerTypeKey
{
  return self->_powerTypeKey != 0;
}

- (NSString)powerTypeKey
{
  -[GEOLPRVehicle _readPowerTypeKey]((uint64_t)self);
  powerTypeKey = self->_powerTypeKey;

  return powerTypeKey;
}

- (void)setPowerTypeKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_powerTypeKey, a3);
}

- (void)_readVehicleTypeKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRVehicleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleTypeKey_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasVehicleTypeKey
{
  return self->_vehicleTypeKey != 0;
}

- (NSString)vehicleTypeKey
{
  -[GEOLPRVehicle _readVehicleTypeKey]((uint64_t)self);
  vehicleTypeKey = self->_vehicleTypeKey;

  return vehicleTypeKey;
}

- (void)setVehicleTypeKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_vehicleTypeKey, a3);
}

- (void)_readLicensePlate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRVehicleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicensePlate_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLicensePlate
{
  return self->_licensePlate != 0;
}

- (NSString)licensePlate
{
  -[GEOLPRVehicle _readLicensePlate]((uint64_t)self);
  licensePlate = self->_licensePlate;

  return licensePlate;
}

- (void)setLicensePlate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_licensePlate, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRVehicle;
  v4 = [(GEOLPRVehicle *)&v8 description];
  v5 = [(GEOLPRVehicle *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRVehicle _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 name];
    if (v5) {
      [v4 setObject:v5 forKey:@"name"];
    }

    objc_super v6 = [a1 powerTypeKey];
    if (v6)
    {
      if (a2) {
        objc_super v7 = @"powerTypeKey";
      }
      else {
        objc_super v7 = @"power_type_key";
      }
      [v4 setObject:v6 forKey:v7];
    }

    objc_super v8 = [a1 vehicleTypeKey];
    if (v8)
    {
      if (a2) {
        v9 = @"vehicleTypeKey";
      }
      else {
        v9 = @"vehicle_type_key";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = [a1 licensePlate];
    if (v10)
    {
      if (a2) {
        v11 = @"licensePlate";
      }
      else {
        v11 = @"license_plate";
      }
      [v4 setObject:v10 forKey:v11];
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
  return -[GEOLPRVehicle _dictionaryRepresentation:](self, 1);
}

- (GEOLPRVehicle)initWithDictionary:(id)a3
{
  return (GEOLPRVehicle *)-[GEOLPRVehicle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setName:v7];
      }
      if (a3) {
        objc_super v8 = @"powerTypeKey";
      }
      else {
        objc_super v8 = @"power_type_key";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (void *)[v9 copy];
        [a1 setPowerTypeKey:v10];
      }
      if (a3) {
        v11 = @"vehicleTypeKey";
      }
      else {
        v11 = @"vehicle_type_key";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setVehicleTypeKey:v13];
      }
      if (a3) {
        v14 = @"licensePlate";
      }
      else {
        v14 = @"license_plate";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setLicensePlate:v16];
      }
    }
  }

  return a1;
}

- (GEOLPRVehicle)initWithJSON:(id)a3
{
  return (GEOLPRVehicle *)-[GEOLPRVehicle _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_84;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_84;
    }
    GEOLPRVehicleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRVehicleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRVehicleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x1F) == 0)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_10;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRVehicle *)self readAll:0];
  PBDataWriterWriteStringField();
  if (self->_powerTypeKey) {
    PBDataWriterWriteStringField();
  }
  if (self->_vehicleTypeKey) {
    PBDataWriterWriteStringField();
  }
  id v5 = v8;
  if (self->_licensePlate)
  {
    PBDataWriterWriteStringField();
LABEL_10:
    id v5 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLPRVehicle *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v5 setName:self->_name];
  if (self->_powerTypeKey) {
    objc_msgSend(v5, "setPowerTypeKey:");
  }
  if (self->_vehicleTypeKey) {
    objc_msgSend(v5, "setVehicleTypeKey:");
  }
  v4 = v5;
  if (self->_licensePlate)
  {
    objc_msgSend(v5, "setLicensePlate:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRVehicle *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSString *)self->_powerTypeKey copyWithZone:a3];
    v11 = (void *)v5[4];
    v5[4] = v10;

    uint64_t v12 = [(NSString *)self->_vehicleTypeKey copyWithZone:a3];
    v13 = (void *)v5[5];
    v5[5] = v12;

    uint64_t v14 = [(NSString *)self->_licensePlate copyWithZone:a3];
    objc_super v7 = (PBDataReader *)v5[2];
    v5[2] = v14;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLPRVehicleReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRVehicle *)self readAll:1],
         [v4 readAll:1],
         name = self->_name,
         !((unint64_t)name | v4[3]))
     || -[NSString isEqual:](name, "isEqual:"))
    && ((powerTypeKey = self->_powerTypeKey, !((unint64_t)powerTypeKey | v4[4]))
     || -[NSString isEqual:](powerTypeKey, "isEqual:"))
    && ((vehicleTypeKey = self->_vehicleTypeKey, !((unint64_t)vehicleTypeKey | v4[5]))
     || -[NSString isEqual:](vehicleTypeKey, "isEqual:")))
  {
    licensePlate = self->_licensePlate;
    if ((unint64_t)licensePlate | v4[2]) {
      char v9 = -[NSString isEqual:](licensePlate, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOLPRVehicle *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_powerTypeKey hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_vehicleTypeKey hash];
  return v4 ^ v5 ^ [(NSString *)self->_licensePlate hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEOLPRVehicle setName:](self, "setName:");
  }
  if (v4[4]) {
    -[GEOLPRVehicle setPowerTypeKey:](self, "setPowerTypeKey:");
  }
  if (v4[5]) {
    -[GEOLPRVehicle setVehicleTypeKey:](self, "setVehicleTypeKey:");
  }
  if (v4[2]) {
    -[GEOLPRVehicle setLicensePlate:](self, "setLicensePlate:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeKey, 0);
  objc_storeStrong((id *)&self->_powerTypeKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_licensePlate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end