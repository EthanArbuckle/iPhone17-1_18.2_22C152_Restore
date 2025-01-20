@interface GEOAutomobileOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIncludeHistoricTravelTime;
- (BOOL)hasIncludeStaticTravelTime;
- (BOOL)hasTrafficType;
- (BOOL)hasUserPreferences;
- (BOOL)hasVehicleSpecifications;
- (BOOL)includeHistoricTravelTime;
- (BOOL)includeStaticTravelTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAutomobileOptions)init;
- (GEOAutomobileOptions)initWithData:(id)a3;
- (GEOAutomobileOptions)initWithDictionary:(id)a3;
- (GEOAutomobileOptions)initWithJSON:(id)a3;
- (GEOUserPreferences)userPreferences;
- (GEOVehicleSpecifications)vehicleSpecifications;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)trafficTypeAsString:(int)a3;
- (int)StringAsTrafficType:(id)a3;
- (int)trafficType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readUserPreferences;
- (void)_readVehicleSpecifications;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIncludeHistoricTravelTime:(BOOL)a3;
- (void)setHasIncludeStaticTravelTime:(BOOL)a3;
- (void)setHasTrafficType:(BOOL)a3;
- (void)setIncludeHistoricTravelTime:(BOOL)a3;
- (void)setIncludeStaticTravelTime:(BOOL)a3;
- (void)setTrafficType:(int)a3;
- (void)setUserPreferences:(id)a3;
- (void)setVehicleSpecifications:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAutomobileOptions

- (void)setTrafficType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_trafficType = a3;
}

- (void)setIncludeHistoricTravelTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_includeHistoricTravelTime = a3;
}

- (void)setUserPreferences:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_userPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleSpecifications, 0);
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOVehicleSpecifications)vehicleSpecifications
{
  -[GEOAutomobileOptions _readVehicleSpecifications]((uint64_t)self);
  vehicleSpecifications = self->_vehicleSpecifications;

  return vehicleSpecifications;
}

- (void)_readVehicleSpecifications
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAutomobileOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleSpecifications_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAutomobileOptionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAutomobileOptions *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v6 = v9;
    }
    if (self->_userPreferences)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_vehicleSpecifications)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAutomobileOptions *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(unsigned char *)(v5 + 56) = self->_includeHistoricTravelTime;
      *(unsigned char *)(v5 + 60) |= 2u;
      char flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          id v10 = [(GEOUserPreferences *)self->_userPreferences copyWithZone:a3];
          v11 = *(void **)(v5 + 24);
          *(void *)(v5 + 24) = v10;

          id v12 = [(GEOVehicleSpecifications *)self->_vehicleSpecifications copyWithZone:a3];
          v13 = *(void **)(v5 + 32);
          *(void *)(v5 + 32) = v12;

          v14 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(unsigned char *)(v5 + 57) = self->_includeStaticTravelTime;
        *(unsigned char *)(v5 + 60) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 52) = self->_trafficType;
    *(unsigned char *)(v5 + 60) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOAutomobileOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (GEOAutomobileOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAutomobileOptions;
  v2 = [(GEOAutomobileOptions *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_839;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_840;
    }
    GEOAutomobileOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOUserPreferences *)self->_userPreferences readAll:1];
    [(GEOVehicleSpecifications *)self->_vehicleSpecifications readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOAutomobileOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAutomobileOptions;
  BOOL v3 = [(GEOAutomobileOptions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (BOOL)includeHistoricTravelTime
{
  return self->_includeHistoricTravelTime;
}

- (void)setHasIncludeHistoricTravelTime:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncludeHistoricTravelTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)trafficType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_trafficType;
  }
  else {
    return 1;
  }
}

- (void)setHasTrafficType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasTrafficType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0578[a3 - 1];
  }

  return v3;
}

- (int)StringAsTrafficType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATIC_SPEEDS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HISTORICAL_SPEEDS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LIVE_SPEEDS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)includeStaticTravelTime
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) == 0 || self->_includeStaticTravelTime;
}

- (void)setIncludeStaticTravelTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_includeStaticTravelTime = a3;
}

- (void)setHasIncludeStaticTravelTime:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIncludeStaticTravelTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readUserPreferences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAutomobileOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserPreferences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUserPreferences
{
  return self->_userPreferences != 0;
}

- (GEOUserPreferences)userPreferences
{
  -[GEOAutomobileOptions _readUserPreferences]((uint64_t)self);
  userPreferences = self->_userPreferences;

  return userPreferences;
}

- (BOOL)hasVehicleSpecifications
{
  return self->_vehicleSpecifications != 0;
}

- (void)setVehicleSpecifications:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_vehicleSpecifications, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAutomobileOptions;
  int v4 = [(GEOAutomobileOptions *)&v8 description];
  uint64_t v5 = [(GEOAutomobileOptions *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAutomobileOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_26;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 60) & 1) == 0) {
      goto LABEL_4;
    }
LABEL_13:
    unsigned int v13 = *(_DWORD *)(a1 + 52) - 1;
    if (v13 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53E0578[v13];
    }
    [v4 setObject:v14 forKey:@"trafficType"];

    if ((*(unsigned char *)(a1 + 60) & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v4 setObject:v12 forKey:@"includeHistoricTravelTime"];

  char v5 = *(unsigned char *)(a1 + 60);
  if (v5) {
    goto LABEL_13;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_super v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
    if (a2) {
      objc_super v7 = @"includeStaticTravelTime";
    }
    else {
      objc_super v7 = @"include_static_travel_time";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = [(id)a1 userPreferences];
  id v9 = v8;
  if (v8)
  {
    if (a2)
    {
      id v10 = [v8 jsonRepresentation];
      v11 = @"userPreferences";
    }
    else
    {
      id v10 = [v8 dictionaryRepresentation];
      v11 = @"user_preferences";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v15 = [(id)a1 vehicleSpecifications];
  v16 = v15;
  if (v15)
  {
    if (a2)
    {
      v17 = [v15 jsonRepresentation];
      v18 = @"vehicleSpecifications";
    }
    else
    {
      v17 = [v15 dictionaryRepresentation];
      v18 = @"vehicle_specifications";
    }
    [v4 setObject:v17 forKey:v18];
  }
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    v20 = [v19 dictionaryRepresentation];
    v21 = v20;
    if (a2)
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__GEOAutomobileOptions__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E53D8860;
      id v23 = v22;
      id v27 = v23;
      [v21 enumerateKeysAndObjectsUsingBlock:v26];
      id v24 = v23;

      v21 = v24;
    }
    [v4 setObject:v21 forKey:@"Unknown Fields"];
  }
LABEL_26:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAutomobileOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOAutomobileOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOAutomobileOptions)initWithDictionary:(id)a3
{
  return (GEOAutomobileOptions *)-[GEOAutomobileOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_39;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_39;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"includeHistoricTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeHistoricTravelTime:", objc_msgSend(v6, "BOOLValue"));
  }

  objc_super v7 = [v5 objectForKeyedSubscript:@"trafficType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"STATIC_SPEEDS"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"HISTORICAL_SPEEDS"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"LIVE_SPEEDS"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 1;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_16:
    [a1 setTrafficType:v9];
  }

  if (a3) {
    id v10 = @"includeStaticTravelTime";
  }
  else {
    id v10 = @"include_static_travel_time";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncludeStaticTravelTime:", objc_msgSend(v11, "BOOLValue"));
  }

  if (a3) {
    id v12 = @"userPreferences";
  }
  else {
    id v12 = @"user_preferences";
  }
  unsigned int v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOUserPreferences alloc];
    if (a3) {
      uint64_t v15 = [(GEOUserPreferences *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOUserPreferences *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setUserPreferences:v15];
  }
  if (a3) {
    v17 = @"vehicleSpecifications";
  }
  else {
    v17 = @"vehicle_specifications";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEOVehicleSpecifications alloc];
    if (a3) {
      uint64_t v20 = [(GEOVehicleSpecifications *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOVehicleSpecifications *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setVehicleSpecifications:v20];
  }
LABEL_39:

  return a1;
}

- (GEOAutomobileOptions)initWithJSON:(id)a3
{
  return (GEOAutomobileOptions *)-[GEOAutomobileOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAutomobileOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAutomobileOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOAutomobileOptions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v6 + 56) = self->_includeHistoricTravelTime;
    *((unsigned char *)v6 + 60) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 13) = self->_trafficType;
  *((unsigned char *)v6 + 60) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v6 + 57) = self->_includeStaticTravelTime;
    *((unsigned char *)v6 + 60) |= 4u;
  }
LABEL_5:
  if (self->_userPreferences)
  {
    objc_msgSend(v6, "setUserPreferences:");
    int v4 = v6;
  }
  if (self->_vehicleSpecifications)
  {
    objc_msgSend(v6, "setVehicleSpecifications:");
    int v4 = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOAutomobileOptions *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_27;
    }
    if (self->_includeHistoricTravelTime)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_trafficType != *((_DWORD *)v4 + 13)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) != 0)
    {
      if (self->_includeStaticTravelTime)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    char v7 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 60) & 4) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  userPreferences = self->_userPreferences;
  if ((unint64_t)userPreferences | *((void *)v4 + 3)
    && !-[GEOUserPreferences isEqual:](userPreferences, "isEqual:"))
  {
    goto LABEL_27;
  }
  vehicleSpecifications = self->_vehicleSpecifications;
  if ((unint64_t)vehicleSpecifications | *((void *)v4 + 4)) {
    char v7 = -[GEOVehicleSpecifications isEqual:](vehicleSpecifications, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  [(GEOAutomobileOptions *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_includeHistoricTravelTime;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_trafficType;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_includeStaticTravelTime;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEOUserPreferences *)self->_userPreferences hash];
  return v6 ^ [(GEOVehicleSpecifications *)self->_vehicleSpecifications hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = v10;
  char v5 = *((unsigned char *)v10 + 60);
  if ((v5 & 2) != 0)
  {
    self->_includeHistoricTravelTime = *((unsigned char *)v10 + 56);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v10 + 60);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v10 + 60) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_trafficType = *((_DWORD *)v10 + 13);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v10 + 60) & 4) != 0)
  {
LABEL_4:
    self->_includeStaticTravelTime = *((unsigned char *)v10 + 57);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
  userPreferences = self->_userPreferences;
  uint64_t v7 = *((void *)v10 + 3);
  if (userPreferences)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOUserPreferences mergeFrom:](userPreferences, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOAutomobileOptions setUserPreferences:](self, "setUserPreferences:");
  }
  uint64_t v4 = v10;
LABEL_14:
  vehicleSpecifications = self->_vehicleSpecifications;
  uint64_t v9 = v4[4];
  if (vehicleSpecifications)
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[GEOVehicleSpecifications mergeFrom:](vehicleSpecifications, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[GEOAutomobileOptions setVehicleSpecifications:](self, "setVehicleSpecifications:");
  }
  uint64_t v4 = v10;
LABEL_20:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOAutomobileOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_844);
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
  *(unsigned char *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAutomobileOptions *)self readAll:0];
    [(GEOUserPreferences *)self->_userPreferences clearUnknownFields:1];
    vehicleSpecifications = self->_vehicleSpecifications;
    [(GEOVehicleSpecifications *)vehicleSpecifications clearUnknownFields:1];
  }
}

@end