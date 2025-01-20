@interface GEOLogMsgEventEVRoutingVehicleDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBatteryCapacity;
- (BOOL)hasMake;
- (BOOL)hasModel;
- (BOOL)hasTowingNotSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)towingNotSupported;
- (GEOLogMsgEventEVRoutingVehicleDetails)init;
- (GEOLogMsgEventEVRoutingVehicleDetails)initWithData:(id)a3;
- (GEOLogMsgEventEVRoutingVehicleDetails)initWithDictionary:(id)a3;
- (GEOLogMsgEventEVRoutingVehicleDetails)initWithJSON:(id)a3;
- (NSString)make;
- (NSString)model;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)batteryCapacity;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMake;
- (void)_readModel;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBatteryCapacity:(unsigned int)a3;
- (void)setHasBatteryCapacity:(BOOL)a3;
- (void)setHasTowingNotSupported:(BOOL)a3;
- (void)setMake:(id)a3;
- (void)setModel:(id)a3;
- (void)setTowingNotSupported:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventEVRoutingVehicleDetails

- (GEOLogMsgEventEVRoutingVehicleDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventEVRoutingVehicleDetails;
  v2 = [(GEOLogMsgEventEVRoutingVehicleDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventEVRoutingVehicleDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventEVRoutingVehicleDetails;
  v3 = [(GEOLogMsgEventEVRoutingVehicleDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMake
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVRoutingVehicleDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMake_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasMake
{
  return self->_make != 0;
}

- (NSString)make
{
  -[GEOLogMsgEventEVRoutingVehicleDetails _readMake]((uint64_t)self);
  make = self->_make;

  return make;
}

- (void)setMake:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_make, a3);
}

- (void)_readModel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVRoutingVehicleDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModel_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (NSString)model
{
  -[GEOLogMsgEventEVRoutingVehicleDetails _readModel]((uint64_t)self);
  model = self->_model;

  return model;
}

- (void)setModel:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_model, a3);
}

- (unsigned)batteryCapacity
{
  return self->_batteryCapacity;
}

- (void)setBatteryCapacity:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_batteryCapacity = a3;
}

- (void)setHasBatteryCapacity:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasBatteryCapacity
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)towingNotSupported
{
  return self->_towingNotSupported;
}

- (void)setTowingNotSupported:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_towingNotSupported = a3;
}

- (void)setHasTowingNotSupported:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTowingNotSupported
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventEVRoutingVehicleDetails;
  v4 = [(GEOLogMsgEventEVRoutingVehicleDetails *)&v8 description];
  v5 = [(GEOLogMsgEventEVRoutingVehicleDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventEVRoutingVehicleDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 make];
    if (v5) {
      [v4 setObject:v5 forKey:@"make"];
    }

    objc_super v6 = [(id)a1 model];
    if (v6) {
      [v4 setObject:v6 forKey:@"model"];
    }

    char v7 = *(unsigned char *)(a1 + 52);
    if (v7)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
      if (a2) {
        v9 = @"batteryCapacity";
      }
      else {
        v9 = @"battery_capacity";
      }
      [v4 setObject:v8 forKey:v9];

      char v7 = *(unsigned char *)(a1 + 52);
    }
    if ((v7 & 2) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      if (a2) {
        v11 = @"towingNotSupported";
      }
      else {
        v11 = @"towing_not_supported";
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
  return -[GEOLogMsgEventEVRoutingVehicleDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventEVRoutingVehicleDetails)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventEVRoutingVehicleDetails *)-[GEOLogMsgEventEVRoutingVehicleDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"make"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v7 = (void *)[v6 copy];
        [a1 setMake:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"model"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setModel:v9];
      }
      if (a3) {
        v10 = @"batteryCapacity";
      }
      else {
        v10 = @"battery_capacity";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBatteryCapacity:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"towingNotSupported";
      }
      else {
        v12 = @"towing_not_supported";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTowingNotSupported:", objc_msgSend(v13, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventEVRoutingVehicleDetails)initWithJSON:(id)a3
{
  return (GEOLogMsgEventEVRoutingVehicleDetails *)-[GEOLogMsgEventEVRoutingVehicleDetails _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2962;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2963;
    }
    GEOLogMsgEventEVRoutingVehicleDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventEVRoutingVehicleDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventEVRoutingVehicleDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    char v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventEVRoutingVehicleDetails *)self readAll:0];
    if (self->_make) {
      PBDataWriterWriteStringField();
    }
    if (self->_model) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgEventEVRoutingVehicleDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_make) {
    objc_msgSend(v5, "setMake:");
  }
  if (self->_model) {
    objc_msgSend(v5, "setModel:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v5 + 11) = self->_batteryCapacity;
    *((unsigned char *)v5 + 52) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 48) = self->_towingNotSupported;
    *((unsigned char *)v5 + 52) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventEVRoutingVehicleDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventEVRoutingVehicleDetails *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_make copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_model copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 44) = self->_batteryCapacity;
    *(unsigned char *)(v5 + 52) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_towingNotSupported;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOLogMsgEventEVRoutingVehicleDetails *)self readAll:1];
  [v4 readAll:1];
  make = self->_make;
  if ((unint64_t)make | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](make, "isEqual:")) {
      goto LABEL_13;
    }
  }
  model = self->_model;
  if ((unint64_t)model | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](model, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_batteryCapacity != *((_DWORD *)v4 + 11)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_13;
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_towingNotSupported)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventEVRoutingVehicleDetails *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_make hash];
  NSUInteger v4 = [(NSString *)self->_model hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_batteryCapacity;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_towingNotSupported;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[2])
  {
    -[GEOLogMsgEventEVRoutingVehicleDetails setMake:](self, "setMake:");
    NSUInteger v4 = v6;
  }
  if (v4[3])
  {
    -[GEOLogMsgEventEVRoutingVehicleDetails setModel:](self, "setModel:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_batteryCapacity = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_towingNotSupported = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end