@interface GEOVehicleSpecifications
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEvInfo;
- (BOOL)hasLprInfo;
- (BOOL)hasLprPlateMissingReason;
- (BOOL)hasVehicleInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOEVInfo)evInfo;
- (GEOLPRInfo)lprInfo;
- (GEOVehicleInfo)vehicleInfo;
- (GEOVehicleSpecifications)init;
- (GEOVehicleSpecifications)initWithData:(id)a3;
- (GEOVehicleSpecifications)initWithDictionary:(id)a3;
- (GEOVehicleSpecifications)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)lprPlateMissingReasonAsString:(int)a3;
- (int)StringAsLprPlateMissingReason:(id)a3;
- (int)lprPlateMissingReason;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEvInfo;
- (void)_readLprInfo;
- (void)_readVehicleInfo;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEvInfo:(id)a3;
- (void)setHasLprPlateMissingReason:(BOOL)a3;
- (void)setLprInfo:(id)a3;
- (void)setLprPlateMissingReason:(int)a3;
- (void)setVehicleInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVehicleSpecifications

- (GEOVehicleSpecifications)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVehicleSpecifications;
  v2 = [(GEOVehicleSpecifications *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVehicleSpecifications)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVehicleSpecifications;
  v3 = [(GEOVehicleSpecifications *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLprInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVehicleSpecificationsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLprInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLprInfo
{
  return self->_lprInfo != 0;
}

- (GEOLPRInfo)lprInfo
{
  -[GEOVehicleSpecifications _readLprInfo]((uint64_t)self);
  lprInfo = self->_lprInfo;

  return lprInfo;
}

- (void)setLprInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_lprInfo, a3);
}

- (void)_readEvInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVehicleSpecificationsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvInfo_tags_8797);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEvInfo
{
  return self->_evInfo != 0;
}

- (GEOEVInfo)evInfo
{
  -[GEOVehicleSpecifications _readEvInfo]((uint64_t)self);
  evInfo = self->_evInfo;

  return evInfo;
}

- (void)setEvInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_evInfo, a3);
}

- (void)_readVehicleInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVehicleSpecificationsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasVehicleInfo
{
  return self->_vehicleInfo != 0;
}

- (GEOVehicleInfo)vehicleInfo
{
  -[GEOVehicleSpecifications _readVehicleInfo]((uint64_t)self);
  vehicleInfo = self->_vehicleInfo;

  return vehicleInfo;
}

- (void)setVehicleInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_vehicleInfo, a3);
}

- (int)lprPlateMissingReason
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_lprPlateMissingReason;
  }
  else {
    return 1;
  }
}

- (void)setLprPlateMissingReason:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_lprPlateMissingReason = a3;
}

- (void)setHasLprPlateMissingReason:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasLprPlateMissingReason
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)lprPlateMissingReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0838[a3 - 1];
  }

  return v3;
}

- (int)StringAsLprPlateMissingReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNSELECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NO_RULES_APPLY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNABLE_TO_MASK_PLATE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVehicleSpecifications;
  int v4 = [(GEOVehicleSpecifications *)&v8 description];
  v5 = [(GEOVehicleSpecifications *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVehicleSpecifications _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 lprInfo];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"lprInfo";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"lpr_info";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 evInfo];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"evInfo";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"ev_info";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 vehicleInfo];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"vehicleInfo";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"vehicle_info";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      unsigned int v17 = *(_DWORD *)(a1 + 60) - 1;
      if (v17 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_1E53E0838[v17];
      }
      if (a2) {
        v19 = @"lprPlateMissingReason";
      }
      else {
        v19 = @"lpr_plate_missing_reason";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __54__GEOVehicleSpecifications__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVehicleSpecifications _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOVehicleSpecifications__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOVehicleSpecifications)initWithDictionary:(id)a3
{
  return (GEOVehicleSpecifications *)-[GEOVehicleSpecifications _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"lprInfo";
      }
      else {
        objc_super v6 = @"lpr_info";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLPRInfo alloc];
        if (a3) {
          uint64_t v9 = [(GEOLPRInfo *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLPRInfo *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setLprInfo:v9];
      }
      if (a3) {
        v11 = @"evInfo";
      }
      else {
        v11 = @"ev_info";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOEVInfo alloc];
        if (a3) {
          uint64_t v14 = [(GEOEVInfo *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOEVInfo *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setEvInfo:v14];
      }
      if (a3) {
        v16 = @"vehicleInfo";
      }
      else {
        v16 = @"vehicle_info";
      }
      unsigned int v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOVehicleInfo alloc];
        if (a3) {
          uint64_t v19 = [(GEOVehicleInfo *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOVehicleInfo *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setVehicleInfo:v19];
      }
      if (a3) {
        v21 = @"lprPlateMissingReason";
      }
      else {
        v21 = @"lpr_plate_missing_reason";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
        if ([v23 isEqualToString:@"UNSELECTED"])
        {
          uint64_t v24 = 1;
        }
        else if ([v23 isEqualToString:@"NO_RULES_APPLY"])
        {
          uint64_t v24 = 2;
        }
        else if ([v23 isEqualToString:@"UNABLE_TO_MASK_PLATE"])
        {
          uint64_t v24 = 3;
        }
        else
        {
          uint64_t v24 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_42:

          goto LABEL_43;
        }
        uint64_t v24 = [v22 intValue];
      }
      [a1 setLprPlateMissingReason:v24];
      goto LABEL_42;
    }
  }
LABEL_43:

  return a1;
}

- (GEOVehicleSpecifications)initWithJSON:(id)a3
{
  return (GEOVehicleSpecifications *)-[GEOVehicleSpecifications _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8819;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8820;
    }
    GEOVehicleSpecificationsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLPRInfo *)self->_lprInfo readAll:1];
    [(GEOEVInfo *)self->_evInfo readAll:1];
    [(GEOVehicleInfo *)self->_vehicleInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVehicleSpecificationsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVehicleSpecificationsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVehicleSpecificationsIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVehicleSpecifications *)self readAll:0];
    if (self->_lprInfo) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_evInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_vehicleInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOVehicleSpecifications *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_lprInfo) {
    objc_msgSend(v5, "setLprInfo:");
  }
  if (self->_evInfo) {
    objc_msgSend(v5, "setEvInfo:");
  }
  int v4 = v5;
  if (self->_vehicleInfo)
  {
    objc_msgSend(v5, "setVehicleInfo:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 15) = self->_lprPlateMissingReason;
    *((unsigned char *)v4 + 64) |= 1u;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVehicleSpecificationsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVehicleSpecifications *)self readAll:0];
  id v9 = [(GEOLPRInfo *)self->_lprInfo copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOEVInfo *)self->_evInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOVehicleInfo *)self->_vehicleInfo copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_lprPlateMissingReason;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOVehicleSpecifications *)self readAll:1];
  [v4 readAll:1];
  lprInfo = self->_lprInfo;
  if ((unint64_t)lprInfo | *((void *)v4 + 4))
  {
    if (!-[GEOLPRInfo isEqual:](lprInfo, "isEqual:")) {
      goto LABEL_12;
    }
  }
  evInfo = self->_evInfo;
  if ((unint64_t)evInfo | *((void *)v4 + 3))
  {
    if (!-[GEOEVInfo isEqual:](evInfo, "isEqual:")) {
      goto LABEL_12;
    }
  }
  vehicleInfo = self->_vehicleInfo;
  if ((unint64_t)vehicleInfo | *((void *)v4 + 5))
  {
    if (!-[GEOVehicleInfo isEqual:](vehicleInfo, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_lprPlateMissingReason == *((_DWORD *)v4 + 15))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  [(GEOVehicleSpecifications *)self readAll:1];
  unint64_t v3 = [(GEOLPRInfo *)self->_lprInfo hash];
  unint64_t v4 = [(GEOEVInfo *)self->_evInfo hash];
  unint64_t v5 = [(GEOVehicleInfo *)self->_vehicleInfo hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_lprPlateMissingReason;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v11 = a3;
  [v11 readAll:0];
  unint64_t v4 = v11;
  lprInfo = self->_lprInfo;
  uint64_t v6 = v11[4];
  if (lprInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLPRInfo mergeFrom:](lprInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOVehicleSpecifications setLprInfo:](self, "setLprInfo:");
  }
  unint64_t v4 = v11;
LABEL_7:
  evInfo = self->_evInfo;
  uint64_t v8 = v4[3];
  if (evInfo)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOEVInfo mergeFrom:](evInfo, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOVehicleSpecifications setEvInfo:](self, "setEvInfo:");
  }
  unint64_t v4 = v11;
LABEL_13:
  vehicleInfo = self->_vehicleInfo;
  uint64_t v10 = v4[5];
  if (vehicleInfo)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[GEOVehicleInfo mergeFrom:](vehicleInfo, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[GEOVehicleSpecifications setVehicleInfo:](self, "setVehicleInfo:");
  }
  unint64_t v4 = v11;
LABEL_19:
  if (v4[8])
  {
    self->_lprPlateMissingReason = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOVehicleSpecificationsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8824);
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
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOVehicleSpecifications *)self readAll:0];
    [(GEOLPRInfo *)self->_lprInfo clearUnknownFields:1];
    [(GEOEVInfo *)self->_evInfo clearUnknownFields:1];
    vehicleInfo = self->_vehicleInfo;
    [(GEOVehicleInfo *)vehicleInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleInfo, 0);
  objc_storeStrong((id *)&self->_lprInfo, 0);
  objc_storeStrong((id *)&self->_evInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end