@interface GEOTransitStepUpdate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBoardingInfo;
- (BOOL)hasInstructions;
- (BOOL)hasScheduleInfo;
- (BOOL)hasUpdateIdentifier;
- (BOOL)hasVehiclePositionInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOInstructionSet)instructions;
- (GEOTransitBoardingInfo)boardingInfo;
- (GEOTransitScheduleInfo)scheduleInfo;
- (GEOTransitStepUpdate)init;
- (GEOTransitStepUpdate)initWithData:(id)a3;
- (GEOTransitStepUpdate)initWithDictionary:(id)a3;
- (GEOTransitStepUpdate)initWithJSON:(id)a3;
- (GEOTransitVehiclePositionInfo)vehiclePositionInfo;
- (NSData)updateIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBoardingInfo;
- (void)_readInstructions;
- (void)_readScheduleInfo;
- (void)_readUpdateIdentifier;
- (void)_readVehiclePositionInfo;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBoardingInfo:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setScheduleInfo:(id)a3;
- (void)setUpdateIdentifier:(id)a3;
- (void)setVehiclePositionInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitStepUpdate

- (GEOTransitStepUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitStepUpdate;
  v2 = [(GEOTransitStepUpdate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitStepUpdate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitStepUpdate;
  v3 = [(GEOTransitStepUpdate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUpdateIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUpdateIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUpdateIdentifier
{
  return self->_updateIdentifier != 0;
}

- (NSData)updateIdentifier
{
  -[GEOTransitStepUpdate _readUpdateIdentifier]((uint64_t)self);
  updateIdentifier = self->_updateIdentifier;

  return updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (void)_readInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasInstructions
{
  return self->_instructions != 0;
}

- (GEOInstructionSet)instructions
{
  -[GEOTransitStepUpdate _readInstructions]((uint64_t)self);
  instructions = self->_instructions;

  return instructions;
}

- (void)setInstructions:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (void)_readVehiclePositionInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehiclePositionInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehiclePositionInfo
{
  return self->_vehiclePositionInfo != 0;
}

- (GEOTransitVehiclePositionInfo)vehiclePositionInfo
{
  -[GEOTransitStepUpdate _readVehiclePositionInfo]((uint64_t)self);
  vehiclePositionInfo = self->_vehiclePositionInfo;

  return vehiclePositionInfo;
}

- (void)setVehiclePositionInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_vehiclePositionInfo, a3);
}

- (void)_readScheduleInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScheduleInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasScheduleInfo
{
  return self->_scheduleInfo != 0;
}

- (GEOTransitScheduleInfo)scheduleInfo
{
  -[GEOTransitStepUpdate _readScheduleInfo]((uint64_t)self);
  scheduleInfo = self->_scheduleInfo;

  return scheduleInfo;
}

- (void)setScheduleInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_scheduleInfo, a3);
}

- (void)_readBoardingInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBoardingInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasBoardingInfo
{
  return self->_boardingInfo != 0;
}

- (GEOTransitBoardingInfo)boardingInfo
{
  -[GEOTransitStepUpdate _readBoardingInfo]((uint64_t)self);
  boardingInfo = self->_boardingInfo;

  return boardingInfo;
}

- (void)setBoardingInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_boardingInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitStepUpdate;
  v4 = [(GEOTransitStepUpdate *)&v8 description];
  v5 = [(GEOTransitStepUpdate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitStepUpdate _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 updateIdentifier];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"updateIdentifier"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"update_identifier"];
      }
    }

    objc_super v8 = [a1 instructions];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"instructions"];
    }
    v11 = [a1 vehiclePositionInfo];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"vehiclePositionInfo";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"vehicle_position_info";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [a1 scheduleInfo];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"scheduleInfo";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"schedule_info";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [a1 boardingInfo];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"boardingInfo";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"boarding_info";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = (void *)a1[2];
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __50__GEOTransitStepUpdate__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOTransitStepUpdate _dictionaryRepresentation:](self, 1);
}

void __50__GEOTransitStepUpdate__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitStepUpdate)initWithDictionary:(id)a3
{
  return (GEOTransitStepUpdate *)-[GEOTransitStepUpdate _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"updateIdentifier";
      }
      else {
        objc_super v6 = @"update_identifier";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setUpdateIdentifier:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"instructions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOInstructionSet alloc];
        if (a3) {
          uint64_t v11 = [(GEOInstructionSet *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOInstructionSet *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setInstructions:v11];
      }
      if (a3) {
        v13 = @"vehiclePositionInfo";
      }
      else {
        v13 = @"vehicle_position_info";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOTransitVehiclePositionInfo alloc];
        if (a3) {
          uint64_t v16 = [(GEOTransitVehiclePositionInfo *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOTransitVehiclePositionInfo *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setVehiclePositionInfo:v16];
      }
      if (a3) {
        v18 = @"scheduleInfo";
      }
      else {
        v18 = @"schedule_info";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOTransitScheduleInfo alloc];
        if (a3) {
          uint64_t v21 = [(GEOTransitScheduleInfo *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOTransitScheduleInfo *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setScheduleInfo:v21];
      }
      if (a3) {
        v23 = @"boardingInfo";
      }
      else {
        v23 = @"boarding_info";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEOTransitBoardingInfo alloc];
        if (a3) {
          uint64_t v26 = [(GEOTransitBoardingInfo *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOTransitBoardingInfo *)v25 initWithDictionary:v24];
        }
        id v27 = (void *)v26;
        [a1 setBoardingInfo:v26];
      }
    }
  }

  return a1;
}

- (GEOTransitStepUpdate)initWithJSON:(id)a3
{
  return (GEOTransitStepUpdate *)-[GEOTransitStepUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_549;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_550;
    }
    GEOTransitStepUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitStepUpdateCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitStepUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitStepUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitStepUpdateIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOTransitStepUpdate *)self readAll:0];
    if (self->_updateIdentifier) {
      PBDataWriterWriteDataField();
    }
    id v5 = v8;
    if (self->_instructions)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_vehiclePositionInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_scheduleInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_boardingInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTransitStepUpdate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_updateIdentifier) {
    objc_msgSend(v5, "setUpdateIdentifier:");
  }
  if (self->_instructions) {
    objc_msgSend(v5, "setInstructions:");
  }
  v4 = v5;
  if (self->_vehiclePositionInfo)
  {
    objc_msgSend(v5, "setVehiclePositionInfo:");
    v4 = v5;
  }
  if (self->_scheduleInfo)
  {
    objc_msgSend(v5, "setScheduleInfo:");
    v4 = v5;
  }
  if (self->_boardingInfo)
  {
    objc_msgSend(v5, "setBoardingInfo:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitStepUpdate *)self readAll:0];
    uint64_t v8 = [(NSData *)self->_updateIdentifier copyWithZone:a3];
    v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    id v10 = [(GEOInstructionSet *)self->_instructions copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    id v12 = [(GEOTransitVehiclePositionInfo *)self->_vehiclePositionInfo copyWithZone:a3];
    v13 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v12;

    id v14 = [(GEOTransitScheduleInfo *)self->_scheduleInfo copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    id v16 = [(GEOTransitBoardingInfo *)self->_boardingInfo copyWithZone:a3];
    v17 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTransitStepUpdateReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitStepUpdate *)self readAll:1],
         [v4 readAll:1],
         updateIdentifier = self->_updateIdentifier,
         !((unint64_t)updateIdentifier | v4[6]))
     || -[NSData isEqual:](updateIdentifier, "isEqual:"))
    && ((instructions = self->_instructions, !((unint64_t)instructions | v4[4]))
     || -[GEOInstructionSet isEqual:](instructions, "isEqual:"))
    && ((vehiclePositionInfo = self->_vehiclePositionInfo, !((unint64_t)vehiclePositionInfo | v4[7]))
     || -[GEOTransitVehiclePositionInfo isEqual:](vehiclePositionInfo, "isEqual:"))
    && ((scheduleInfo = self->_scheduleInfo, !((unint64_t)scheduleInfo | v4[5]))
     || -[GEOTransitScheduleInfo isEqual:](scheduleInfo, "isEqual:")))
  {
    boardingInfo = self->_boardingInfo;
    if ((unint64_t)boardingInfo | v4[3]) {
      char v10 = -[GEOTransitBoardingInfo isEqual:](boardingInfo, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEOTransitStepUpdate *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_updateIdentifier hash];
  unint64_t v4 = [(GEOInstructionSet *)self->_instructions hash] ^ v3;
  unint64_t v5 = [(GEOTransitVehiclePositionInfo *)self->_vehiclePositionInfo hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOTransitScheduleInfo *)self->_scheduleInfo hash];
  return v6 ^ [(GEOTransitBoardingInfo *)self->_boardingInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  if (v12[6]) {
    -[GEOTransitStepUpdate setUpdateIdentifier:](self, "setUpdateIdentifier:");
  }
  instructions = self->_instructions;
  uint64_t v5 = v12[4];
  if (instructions)
  {
    if (v5) {
      -[GEOInstructionSet mergeFrom:](instructions, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOTransitStepUpdate setInstructions:](self, "setInstructions:");
  }
  vehiclePositionInfo = self->_vehiclePositionInfo;
  uint64_t v7 = v12[7];
  if (vehiclePositionInfo)
  {
    if (v7) {
      -[GEOTransitVehiclePositionInfo mergeFrom:](vehiclePositionInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOTransitStepUpdate setVehiclePositionInfo:](self, "setVehiclePositionInfo:");
  }
  scheduleInfo = self->_scheduleInfo;
  uint64_t v9 = v12[5];
  if (scheduleInfo)
  {
    if (v9) {
      -[GEOTransitScheduleInfo mergeFrom:](scheduleInfo, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOTransitStepUpdate setScheduleInfo:](self, "setScheduleInfo:");
  }
  boardingInfo = self->_boardingInfo;
  uint64_t v11 = v12[3];
  if (boardingInfo)
  {
    if (v11) {
      -[GEOTransitBoardingInfo mergeFrom:](boardingInfo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOTransitStepUpdate setBoardingInfo:](self, "setBoardingInfo:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitStepUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_554);
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
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitStepUpdate *)self readAll:0];
    [(GEOInstructionSet *)self->_instructions clearUnknownFields:1];
    [(GEOTransitVehiclePositionInfo *)self->_vehiclePositionInfo clearUnknownFields:1];
    [(GEOTransitScheduleInfo *)self->_scheduleInfo clearUnknownFields:1];
    boardingInfo = self->_boardingInfo;
    [(GEOTransitBoardingInfo *)boardingInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehiclePositionInfo, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleInfo, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_boardingInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end