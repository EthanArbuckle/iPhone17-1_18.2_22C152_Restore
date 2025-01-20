@interface GEOPDTransitScheduleGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitScheduleGroup)init;
- (GEOPDTransitScheduleGroup)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)pinnedDisplayName;
- (uint64_t)departureSequenceContainerIndexAtIndex:(uint64_t)result;
- (uint64_t)groupType;
- (uint64_t)incidentIdAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readDepartureSequenceContainerIndexs;
- (void)_readDisplayName;
- (void)_readIncidentIds;
- (void)_readPinnedDisplayName;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitScheduleGroup

- (GEOPDTransitScheduleGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitScheduleGroup;
  v2 = [(GEOPDTransitScheduleGroup *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitScheduleGroup)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitScheduleGroup;
  v3 = [(GEOPDTransitScheduleGroup *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDTransitScheduleGroup;
  [(GEOPDTransitScheduleGroup *)&v3 dealloc];
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_9578);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitScheduleGroup _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readDepartureSequenceContainerIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartureSequenceContainerIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)departureSequenceContainerIndexAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDTransitScheduleGroup _readDepartureSequenceContainerIndexs](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (void)_readIncidentIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)incidentIdAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDTransitScheduleGroup _readIncidentIds](result);
    unint64_t v4 = *(void *)(v3 + 80);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 72) + 8 * a2);
  }
  return result;
}

- (void)_readPinnedDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPinnedDisplayName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)pinnedDisplayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitScheduleGroup _readPinnedDisplayName]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)groupType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 144);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 120));
    if (v2) {
      return *(unsigned int *)(v1 + 124);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitScheduleGroup;
  unint64_t v4 = [(GEOPDTransitScheduleGroup *)&v8 description];
  v5 = [(GEOPDTransitScheduleGroup *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitScheduleGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    unint64_t v4 = 0;
    goto LABEL_60;
  }
  -[GEOPDTransitScheduleGroup readAll:](a1, 1);
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = -[GEOPDTransitScheduleGroup displayName]((id *)a1);
  if (v5)
  {
    if (a2) {
      uint64_t v6 = @"displayName";
    }
    else {
      uint64_t v6 = @"display_name";
    }
    [v4 setObject:v5 forKey:v6];
  }

  __int16 v7 = *(_WORD *)(a1 + 144);
  if ((v7 & 8) != 0)
  {
    v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
    if (a2) {
      v21 = @"minWalkingDistance";
    }
    else {
      v21 = @"min_walking_distance";
    }
    [v4 setObject:v20 forKey:v21];

    __int16 v7 = *(_WORD *)(a1 + 144);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0) {
        goto LABEL_10;
      }
LABEL_46:
      v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
      if (a2) {
        v25 = @"minWalkingTime";
      }
      else {
        v25 = @"min_walking_time";
      }
      [v4 setObject:v24 forKey:v25];

      if ((*(_WORD *)(a1 + 144) & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_9;
  }
  v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
  if (a2) {
    v23 = @"maxWalkingDistance";
  }
  else {
    v23 = @"max_walking_distance";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v7 = *(_WORD *)(a1 + 144);
  if ((v7 & 0x10) != 0) {
    goto LABEL_46;
  }
LABEL_10:
  if ((v7 & 4) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
    if (a2) {
      v9 = @"maxWalkingTime";
    }
    else {
      v9 = @"max_walking_time";
    }
    [v4 setObject:v8 forKey:v9];
  }
LABEL_15:
  if (*(void *)(a1 + 56))
  {
    v10 = PBRepeatedUInt32NSArray();
    if (a2) {
      v11 = @"departureSequenceIndex";
    }
    else {
      v11 = @"departure_sequence_index";
    }
    [v4 setObject:v10 forKey:v11];
  }
  if (*(void *)(a1 + 32))
  {
    v12 = PBRepeatedUInt32NSArray();
    if (a2) {
      v13 = @"departureSequenceContainerIndex";
    }
    else {
      v13 = @"departure_sequence_container_index";
    }
    [v4 setObject:v12 forKey:v13];
  }
  if (*(void *)(a1 + 80))
  {
    v14 = PBRepeatedUInt64NSArray();
    if (a2) {
      v15 = @"incidentId";
    }
    else {
      v15 = @"incident_id";
    }
    [v4 setObject:v14 forKey:v15];
  }
  v16 = -[GEOPDTransitScheduleGroup pinnedDisplayName]((id *)a1);
  if (v16)
  {
    if (a2) {
      v17 = @"pinnedDisplayName";
    }
    else {
      v17 = @"pinned_display_name";
    }
    [v4 setObject:v16 forKey:v17];
  }

  if (*(_WORD *)(a1 + 144))
  {
    uint64_t v18 = *(int *)(a1 + 124);
    if (v18 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E53E4378[v18];
    }
    if (a2) {
      v26 = @"groupType";
    }
    else {
      v26 = @"group_type";
    }
    [v4 setObject:v19 forKey:v26];
  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    v28 = [v27 dictionaryRepresentation];
    v29 = v28;
    if (a2)
    {
      v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __55__GEOPDTransitScheduleGroup__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E53D8860;
      id v31 = v30;
      id v35 = v31;
      [v29 enumerateKeysAndObjectsUsingBlock:v34];
      id v32 = v31;

      v29 = v32;
    }
    [v4 setObject:v29 forKey:@"Unknown Fields"];
  }
LABEL_60:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitScheduleGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_9628;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_9629;
      }
      GEOPDTransitScheduleGroupReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

void __55__GEOPDTransitScheduleGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  __int16 v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitScheduleGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xFC0) == 0)
    {
      id v10 = self->_reader;
      objc_sync_enter(v10);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v12 writeData:v11];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v10);
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 0);
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  __int16 flags = (__int16)self->_flags;
  id v6 = v12;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v6 = v12;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_26:
      PBDataWriterWriteUint32Field();
      id v6 = v12;
      if ((*(_WORD *)&self->_flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  id v6 = v12;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_8:
  if ((flags & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    id v6 = v12;
  }
LABEL_10:
  if (self->_departureSequenceIndexs.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v6 = v12;
      ++v7;
    }
    while (v7 < self->_departureSequenceIndexs.count);
  }
  if (self->_departureSequenceContainerIndexs.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v6 = v12;
      ++v8;
    }
    while (v8 < self->_departureSequenceContainerIndexs.count);
  }
  if (self->_incidentIds.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v6 = v12;
      ++v9;
    }
    while (v9 < self->_incidentIds.count);
  }
  if (self->_pinnedDisplayName)
  {
    PBDataWriterWriteStringField();
    id v6 = v12;
  }
  if (*(_WORD *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v6 = v12;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_29:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTransitScheduleGroupReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_13;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_displayName copyWithZone:a3];
  id v10 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_minWalkingDistance;
    *(_WORD *)(v5 + 144) |= 8u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_16:
      *(_DWORD *)(v5 + 140) = self->_minWalkingTime;
      *(_WORD *)(v5 + 144) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_maxWalkingDistance;
  *(_WORD *)(v5 + 144) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((flags & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 132) = self->_maxWalkingTime;
    *(_WORD *)(v5 + 144) |= 4u;
  }
LABEL_10:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  uint64_t v12 = [(NSString *)self->_pinnedDisplayName copyWithZone:a3];
  v13 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v12;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 124) = self->_groupType;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_13:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 1);
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_minWalkingDistance != *((_DWORD *)v4 + 34)) {
      goto LABEL_33;
    }
  }
  else if ((v7 & 8) != 0)
  {
LABEL_33:
    BOOL v10 = 0;
    goto LABEL_34;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_maxWalkingDistance != *((_DWORD *)v4 + 32)) {
      goto LABEL_33;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_minWalkingTime != *((_DWORD *)v4 + 35)) {
      goto LABEL_33;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_maxWalkingTime != *((_DWORD *)v4 + 33)) {
      goto LABEL_33;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_33;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_33;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_33;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_33;
  }
  pinnedDisplayName = self->_pinnedDisplayName;
  if ((unint64_t)pinnedDisplayName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](pinnedDisplayName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 72);
  BOOL v10 = (v9 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if ((v9 & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 31)) {
      goto LABEL_33;
    }
    BOOL v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 1);
  NSUInteger v14 = [(NSString *)self->_displayName hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_minWalkingDistance;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_maxWalkingDistance;
      if ((flags & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((flags & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((flags & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_minWalkingTime;
  if ((flags & 4) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_maxWalkingTime;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = 0;
LABEL_10:
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v10 = PBRepeatedUInt64Hash();
  NSUInteger v11 = [(NSString *)self->_pinnedDisplayName hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end