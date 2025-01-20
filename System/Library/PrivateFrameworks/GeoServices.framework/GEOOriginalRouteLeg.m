@interface GEOOriginalRouteLeg
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDestinationWaypointInfo;
- (BOOL)hasEncryptedTourMuid;
- (BOOL)hasEvStateInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOriginWaypointInfo;
- (BOOL)hasPathLeg;
- (BOOL)hasZilchPoints;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOEVStateInfo)evStateInfo;
- (GEOOriginalRouteLeg)init;
- (GEOOriginalRouteLeg)initWithData:(id)a3;
- (GEOOriginalRouteLeg)initWithDictionary:(id)a3;
- (GEOOriginalRouteLeg)initWithJSON:(id)a3;
- (GEOWaypointInfo)destinationWaypointInfo;
- (GEOWaypointInfo)originWaypointInfo;
- (NSData)pathLeg;
- (NSData)zilchPoints;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)encryptedTourMuid;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDestinationWaypointInfo;
- (void)_readEvStateInfo;
- (void)_readOriginWaypointInfo;
- (void)_readPathLeg;
- (void)_readZilchPoints;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDestinationWaypointInfo:(id)a3;
- (void)setEncryptedTourMuid:(unint64_t)a3;
- (void)setEvStateInfo:(id)a3;
- (void)setHasEncryptedTourMuid:(BOOL)a3;
- (void)setOriginWaypointInfo:(id)a3;
- (void)setPathLeg:(id)a3;
- (void)setZilchPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOOriginalRouteLeg

- (GEOOriginalRouteLeg)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOOriginalRouteLeg;
  v2 = [(GEOOriginalRouteLeg *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOOriginalRouteLeg)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOOriginalRouteLeg;
  v3 = [(GEOOriginalRouteLeg *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteLegReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilchPoints_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasZilchPoints
{
  return self->_zilchPoints != 0;
}

- (NSData)zilchPoints
{
  -[GEOOriginalRouteLeg _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_zilchPoints, a3);
}

- (void)_readPathLeg
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteLegReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPathLeg_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPathLeg
{
  return self->_pathLeg != 0;
}

- (NSData)pathLeg
{
  -[GEOOriginalRouteLeg _readPathLeg]((uint64_t)self);
  pathLeg = self->_pathLeg;

  return pathLeg;
}

- (void)setPathLeg:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_pathLeg, a3);
}

- (void)_readEvStateInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteLegReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvStateInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEvStateInfo
{
  return self->_evStateInfo != 0;
}

- (GEOEVStateInfo)evStateInfo
{
  -[GEOOriginalRouteLeg _readEvStateInfo]((uint64_t)self);
  evStateInfo = self->_evStateInfo;

  return evStateInfo;
}

- (void)setEvStateInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_evStateInfo, a3);
}

- (void)_readOriginWaypointInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteLegReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginWaypointInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOriginWaypointInfo
{
  return self->_originWaypointInfo != 0;
}

- (GEOWaypointInfo)originWaypointInfo
{
  -[GEOOriginalRouteLeg _readOriginWaypointInfo]((uint64_t)self);
  originWaypointInfo = self->_originWaypointInfo;

  return originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_originWaypointInfo, a3);
}

- (void)_readDestinationWaypointInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteLegReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationWaypointInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDestinationWaypointInfo
{
  return self->_destinationWaypointInfo != 0;
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  -[GEOOriginalRouteLeg _readDestinationWaypointInfo]((uint64_t)self);
  destinationWaypointInfo = self->_destinationWaypointInfo;

  return destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_destinationWaypointInfo, a3);
}

- (unint64_t)encryptedTourMuid
{
  return self->_encryptedTourMuid;
}

- (void)setEncryptedTourMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_encryptedTourMuid = a3;
}

- (void)setHasEncryptedTourMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasEncryptedTourMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOOriginalRouteLeg;
  v4 = [(GEOOriginalRouteLeg *)&v8 description];
  v5 = [(GEOOriginalRouteLeg *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOOriginalRouteLeg _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 zilchPoints];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"zilchPoints"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"zilch_points"];
      }
    }

    objc_super v8 = [(id)a1 pathLeg];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 base64EncodedStringWithOptions:0];
        [v4 setObject:v10 forKey:@"pathLeg"];
      }
      else
      {
        [v4 setObject:v8 forKey:@"path_leg"];
      }
    }

    v11 = [(id)a1 evStateInfo];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"evStateInfo";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"ev_state_info";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 originWaypointInfo];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"originWaypointInfo";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"origin_waypoint_info";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [(id)a1 destinationWaypointInfo];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"destinationWaypointInfo";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"destination_waypoint_info";
      }
      [v4 setObject:v21 forKey:v22];
    }
    if (*(unsigned char *)(a1 + 84))
    {
      v23 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v24 = @"encryptedTourMuid";
      }
      else {
        v24 = @"encrypted_tour_muid";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = *(void **)(a1 + 16);
    if (v25)
    {
      v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __49__GEOOriginalRouteLeg__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;

        v27 = v30;
      }
      [v4 setObject:v27 forKey:@"Unknown Fields"];
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
  return -[GEOOriginalRouteLeg _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOOriginalRouteLeg__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOOriginalRouteLeg)initWithDictionary:(id)a3
{
  return (GEOOriginalRouteLeg *)-[GEOOriginalRouteLeg _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"zilchPoints";
      }
      else {
        objc_super v6 = @"zilch_points";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setZilchPoints:v8];
      }
      if (a3) {
        v9 = @"pathLeg";
      }
      else {
        v9 = @"path_leg";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        [a1 setPathLeg:v11];
      }
      if (a3) {
        v12 = @"evStateInfo";
      }
      else {
        v12 = @"ev_state_info";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEOEVStateInfo alloc];
        if (a3) {
          uint64_t v15 = [(GEOEVStateInfo *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOEVStateInfo *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setEvStateInfo:v15];
      }
      if (a3) {
        v17 = @"originWaypointInfo";
      }
      else {
        v17 = @"origin_waypoint_info";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOWaypointInfo alloc];
        if (a3) {
          uint64_t v20 = [(GEOWaypointInfo *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOWaypointInfo *)v19 initWithDictionary:v18];
        }
        v21 = (void *)v20;
        [a1 setOriginWaypointInfo:v20];
      }
      if (a3) {
        v22 = @"destinationWaypointInfo";
      }
      else {
        v22 = @"destination_waypoint_info";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [GEOWaypointInfo alloc];
        if (a3) {
          uint64_t v25 = [(GEOWaypointInfo *)v24 initWithJSON:v23];
        }
        else {
          uint64_t v25 = [(GEOWaypointInfo *)v24 initWithDictionary:v23];
        }
        v26 = (void *)v25;
        [a1 setDestinationWaypointInfo:v25];
      }
      if (a3) {
        v27 = @"encryptedTourMuid";
      }
      else {
        v27 = @"encrypted_tour_muid";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEncryptedTourMuid:", objc_msgSend(v28, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOOriginalRouteLeg)initWithJSON:(id)a3
{
  return (GEOOriginalRouteLeg *)-[GEOOriginalRouteLeg _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_4096;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4097;
    }
    GEOOriginalRouteLegReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOEVStateInfo *)self->_evStateInfo readAll:1];
    [(GEOWaypointInfo *)self->_originWaypointInfo readAll:1];
    [(GEOWaypointInfo *)self->_destinationWaypointInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOOriginalRouteLegIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOOriginalRouteLegReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOOriginalRouteLegIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOOriginalRouteLeg *)self readAll:0];
    if (self->_zilchPoints) {
      PBDataWriterWriteDataField();
    }
    id v5 = v8;
    if (self->_pathLeg)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_evStateInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_originWaypointInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_destinationWaypointInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOOriginalRouteLeg _readDestinationWaypointInfo]((uint64_t)self);
  if ([(GEOWaypointInfo *)self->_destinationWaypointInfo hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOOriginalRouteLeg _readOriginWaypointInfo]((uint64_t)self);
  originWaypointInfo = self->_originWaypointInfo;

  return [(GEOWaypointInfo *)originWaypointInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOOriginalRouteLeg *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_zilchPoints) {
    objc_msgSend(v5, "setZilchPoints:");
  }
  if (self->_pathLeg) {
    objc_msgSend(v5, "setPathLeg:");
  }
  v4 = v5;
  if (self->_evStateInfo)
  {
    objc_msgSend(v5, "setEvStateInfo:");
    v4 = v5;
  }
  if (self->_originWaypointInfo)
  {
    objc_msgSend(v5, "setOriginWaypointInfo:");
    v4 = v5;
  }
  if (self->_destinationWaypointInfo)
  {
    objc_msgSend(v5, "setDestinationWaypointInfo:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[4] = self->_encryptedTourMuid;
    *((unsigned char *)v4 + 84) |= 1u;
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
      GEOOriginalRouteLegReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOOriginalRouteLeg *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_zilchPoints copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  uint64_t v11 = [(NSData *)self->_pathLeg copyWithZone:a3];
  v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  id v13 = [(GEOEVStateInfo *)self->_evStateInfo copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  id v15 = [(GEOWaypointInfo *)self->_originWaypointInfo copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  id v17 = [(GEOWaypointInfo *)self->_destinationWaypointInfo copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_encryptedTourMuid;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOOriginalRouteLeg *)self readAll:1];
  [v4 readAll:1];
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](zilchPoints, "isEqual:")) {
      goto LABEL_16;
    }
  }
  pathLeg = self->_pathLeg;
  if ((unint64_t)pathLeg | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](pathLeg, "isEqual:")) {
      goto LABEL_16;
    }
  }
  evStateInfo = self->_evStateInfo;
  if ((unint64_t)evStateInfo | *((void *)v4 + 5))
  {
    if (!-[GEOEVStateInfo isEqual:](evStateInfo, "isEqual:")) {
      goto LABEL_16;
    }
  }
  originWaypointInfo = self->_originWaypointInfo;
  if ((unint64_t)originWaypointInfo | *((void *)v4 + 6))
  {
    if (!-[GEOWaypointInfo isEqual:](originWaypointInfo, "isEqual:")) {
      goto LABEL_16;
    }
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  if ((unint64_t)destinationWaypointInfo | *((void *)v4 + 3))
  {
    if (!-[GEOWaypointInfo isEqual:](destinationWaypointInfo, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 84) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 84) & 1) != 0 && self->_encryptedTourMuid == *((void *)v4 + 4))
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  [(GEOOriginalRouteLeg *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_zilchPoints hash];
  uint64_t v4 = [(NSData *)self->_pathLeg hash];
  unint64_t v5 = [(GEOEVStateInfo *)self->_evStateInfo hash];
  unint64_t v6 = [(GEOWaypointInfo *)self->_originWaypointInfo hash];
  unint64_t v7 = [(GEOWaypointInfo *)self->_destinationWaypointInfo hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v8 = 2654435761u * self->_encryptedTourMuid;
  }
  else {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v11 = a3;
  [v11 readAll:0];
  uint64_t v4 = v11;
  if (v11[8])
  {
    -[GEOOriginalRouteLeg setZilchPoints:](self, "setZilchPoints:");
    uint64_t v4 = v11;
  }
  if (v4[7])
  {
    -[GEOOriginalRouteLeg setPathLeg:](self, "setPathLeg:");
    uint64_t v4 = v11;
  }
  evStateInfo = self->_evStateInfo;
  uint64_t v6 = v4[5];
  if (evStateInfo)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOEVStateInfo mergeFrom:](evStateInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOOriginalRouteLeg setEvStateInfo:](self, "setEvStateInfo:");
  }
  uint64_t v4 = v11;
LABEL_11:
  originWaypointInfo = self->_originWaypointInfo;
  uint64_t v8 = v4[6];
  if (originWaypointInfo)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOWaypointInfo mergeFrom:](originWaypointInfo, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOOriginalRouteLeg setOriginWaypointInfo:](self, "setOriginWaypointInfo:");
  }
  uint64_t v4 = v11;
LABEL_17:
  destinationWaypointInfo = self->_destinationWaypointInfo;
  uint64_t v10 = v4[3];
  if (destinationWaypointInfo)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEOWaypointInfo mergeFrom:](destinationWaypointInfo, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEOOriginalRouteLeg setDestinationWaypointInfo:](self, "setDestinationWaypointInfo:");
  }
  uint64_t v4 = v11;
LABEL_23:
  if (*((unsigned char *)v4 + 84))
  {
    self->_encryptedTourMuid = v4[4];
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
      GEOOriginalRouteLegReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4101);
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
  *(unsigned char *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOOriginalRouteLeg *)self readAll:0];
    [(GEOEVStateInfo *)self->_evStateInfo clearUnknownFields:1];
    [(GEOWaypointInfo *)self->_originWaypointInfo clearUnknownFields:1];
    destinationWaypointInfo = self->_destinationWaypointInfo;
    [(GEOWaypointInfo *)destinationWaypointInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_pathLeg, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_evStateInfo, 0);
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end