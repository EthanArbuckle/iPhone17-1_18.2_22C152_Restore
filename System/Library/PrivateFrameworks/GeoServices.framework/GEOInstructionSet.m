@interface GEOInstructionSet
+ (BOOL)isValid:(id)a3;
- (BOOL)_transit_hasAnyFieldSet;
- (BOOL)hasCountStopsText;
- (BOOL)hasDepartureBar;
- (BOOL)hasDepartureBarStyle;
- (BOOL)hasDrivingWalkingListInstruction;
- (BOOL)hasDrivingWalkingSignInstruction;
- (BOOL)hasDrivingWalkingSpokenInstruction;
- (BOOL)hasGenericInstruction;
- (BOOL)hasTransitListInstruction;
- (BOOL)hasTransitSignInstruction;
- (BOOL)hideTimeInstructionsIfCollapsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODrivingWalkingInstruction)drivingWalkingListInstruction;
- (GEODrivingWalkingInstruction)drivingWalkingSignInstruction;
- (GEODrivingWalkingSpokenInstruction)drivingWalkingSpokenInstruction;
- (GEOFormattedString)countStopsText;
- (GEOFormattedString)departureBar;
- (GEOGenericInstruction)genericInstruction;
- (GEOInstructionSet)init;
- (GEOInstructionSet)initWithData:(id)a3;
- (GEOInstructionSet)initWithDictionary:(id)a3;
- (GEOInstructionSet)initWithJSON:(id)a3;
- (GEOServerFormattedString)countStopsFormattedString;
- (GEOServerFormattedString)departureBarFormattedString;
- (GEOServerFormattedString)expandableListFormattedString;
- (GEOServerFormattedString)primaryTimeFormattedString;
- (GEOServerFormattedString)secondaryTimeFormattedString;
- (GEOTransitListInstruction)transitListInstruction;
- (GEOTransitSignInstruction)transitSignInstruction;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)departureBarStyleAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsDepartureBarStyle:(id)a3;
- (int)departureBarStyle;
- (int64_t)departureBarFormatStyle;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCountStopsText;
- (void)_readDepartureBar;
- (void)_readDrivingWalkingListInstruction;
- (void)_readDrivingWalkingSignInstruction;
- (void)_readDrivingWalkingSpokenInstruction;
- (void)_readGenericInstruction;
- (void)_readTransitListInstruction;
- (void)_readTransitSignInstruction;
- (void)_transit_mergeFrom:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCountStopsText:(id)a3;
- (void)setDepartureBar:(id)a3;
- (void)setDepartureBarStyle:(int)a3;
- (void)setDrivingWalkingListInstruction:(id)a3;
- (void)setDrivingWalkingSignInstruction:(id)a3;
- (void)setDrivingWalkingSpokenInstruction:(id)a3;
- (void)setGenericInstruction:(id)a3;
- (void)setHasDepartureBarStyle:(BOOL)a3;
- (void)setTransitListInstruction:(id)a3;
- (void)setTransitSignInstruction:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOInstructionSet

- (GEOInstructionSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOInstructionSet;
  v2 = [(GEOInstructionSet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOInstructionSet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOInstructionSet;
  v3 = [(GEOInstructionSet *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTransitSignInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitSignInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitSignInstruction
{
  return self->_transitSignInstruction != 0;
}

- (GEOTransitSignInstruction)transitSignInstruction
{
  -[GEOInstructionSet _readTransitSignInstruction]((uint64_t)self);
  transitSignInstruction = self->_transitSignInstruction;

  return transitSignInstruction;
}

- (void)setTransitSignInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_transitSignInstruction, a3);
}

- (void)_readTransitListInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitListInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitListInstruction
{
  return self->_transitListInstruction != 0;
}

- (GEOTransitListInstruction)transitListInstruction
{
  -[GEOInstructionSet _readTransitListInstruction]((uint64_t)self);
  transitListInstruction = self->_transitListInstruction;

  return transitListInstruction;
}

- (void)setTransitListInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_transitListInstruction, a3);
}

- (void)_readGenericInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGenericInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasGenericInstruction
{
  return self->_genericInstruction != 0;
}

- (GEOGenericInstruction)genericInstruction
{
  -[GEOInstructionSet _readGenericInstruction]((uint64_t)self);
  genericInstruction = self->_genericInstruction;

  return genericInstruction;
}

- (void)setGenericInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_genericInstruction, a3);
}

- (void)_readDepartureBar
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartureBar_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDepartureBar
{
  return self->_departureBar != 0;
}

- (GEOFormattedString)departureBar
{
  -[GEOInstructionSet _readDepartureBar]((uint64_t)self);
  departureBar = self->_departureBar;

  return departureBar;
}

- (void)setDepartureBar:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_departureBar, a3);
}

- (int)departureBarStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_departureBarStyle;
  }
  else {
    return 0;
  }
}

- (void)setDepartureBarStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_departureBarStyle = a3;
}

- (void)setHasDepartureBarStyle:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasDepartureBarStyle
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)departureBarStyleAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0288[a3];
  }

  return v3;
}

- (int)StringAsDepartureBarStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REAL_TIME_ON_TIME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REAL_TIME_DELAYS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CLICKABLE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readCountStopsText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountStopsText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasCountStopsText
{
  return self->_countStopsText != 0;
}

- (GEOFormattedString)countStopsText
{
  -[GEOInstructionSet _readCountStopsText]((uint64_t)self);
  countStopsText = self->_countStopsText;

  return countStopsText;
}

- (void)setCountStopsText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_countStopsText, a3);
}

- (void)_readDrivingWalkingSignInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDrivingWalkingSignInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDrivingWalkingSignInstruction
{
  return self->_drivingWalkingSignInstruction != 0;
}

- (GEODrivingWalkingInstruction)drivingWalkingSignInstruction
{
  -[GEOInstructionSet _readDrivingWalkingSignInstruction]((uint64_t)self);
  drivingWalkingSignInstruction = self->_drivingWalkingSignInstruction;

  return drivingWalkingSignInstruction;
}

- (void)setDrivingWalkingSignInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_drivingWalkingSignInstruction, a3);
}

- (void)_readDrivingWalkingListInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDrivingWalkingListInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDrivingWalkingListInstruction
{
  return self->_drivingWalkingListInstruction != 0;
}

- (GEODrivingWalkingInstruction)drivingWalkingListInstruction
{
  -[GEOInstructionSet _readDrivingWalkingListInstruction]((uint64_t)self);
  drivingWalkingListInstruction = self->_drivingWalkingListInstruction;

  return drivingWalkingListInstruction;
}

- (void)setDrivingWalkingListInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_drivingWalkingListInstruction, a3);
}

- (void)_readDrivingWalkingSpokenInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDrivingWalkingSpokenInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDrivingWalkingSpokenInstruction
{
  return self->_drivingWalkingSpokenInstruction != 0;
}

- (GEODrivingWalkingSpokenInstruction)drivingWalkingSpokenInstruction
{
  -[GEOInstructionSet _readDrivingWalkingSpokenInstruction]((uint64_t)self);
  drivingWalkingSpokenInstruction = self->_drivingWalkingSpokenInstruction;

  return drivingWalkingSpokenInstruction;
}

- (void)setDrivingWalkingSpokenInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_drivingWalkingSpokenInstruction, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOInstructionSet;
  int v4 = [(GEOInstructionSet *)&v8 description];
  v5 = [(GEOInstructionSet *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOInstructionSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 transitSignInstruction];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"transitSignInstruction";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"transit_sign_instruction";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 transitListInstruction];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"transitListInstruction";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"transit_list_instruction";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 genericInstruction];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"genericInstruction";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"generic_instruction";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 departureBar];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"departureBar";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"departure_bar";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if (*(_WORD *)(a1 + 104))
    {
      uint64_t v21 = *(int *)(a1 + 100);
      if (v21 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = off_1E53E0288[v21];
      }
      if (a2) {
        v23 = @"departureBarStyle";
      }
      else {
        v23 = @"departure_bar_style";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 countStopsText];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"countStopsText";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"count_stops_text";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = [(id)a1 drivingWalkingSignInstruction];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"drivingWalkingSignInstruction";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"driving_walking_sign_instruction";
      }
      [v4 setObject:v30 forKey:v31];
    }
    v32 = [(id)a1 drivingWalkingListInstruction];
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 jsonRepresentation];
        v35 = @"drivingWalkingListInstruction";
      }
      else
      {
        v34 = [v32 dictionaryRepresentation];
        v35 = @"driving_walking_list_instruction";
      }
      [v4 setObject:v34 forKey:v35];
    }
    v36 = [(id)a1 drivingWalkingSpokenInstruction];
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        v39 = @"drivingWalkingSpokenInstruction";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        v39 = @"driving_walking_spoken_instruction";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = *(void **)(a1 + 16);
    if (v40)
    {
      v41 = [v40 dictionaryRepresentation];
      v42 = v41;
      if (a2)
      {
        v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __47__GEOInstructionSet__dictionaryRepresentation___block_invoke;
        v47[3] = &unk_1E53D8860;
        id v44 = v43;
        id v48 = v44;
        [v42 enumerateKeysAndObjectsUsingBlock:v47];
        id v45 = v44;

        v42 = v45;
      }
      [v4 setObject:v42 forKey:@"Unknown Fields"];
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
  return -[GEOInstructionSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOInstructionSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOInstructionSet)initWithDictionary:(id)a3
{
  return (GEOInstructionSet *)-[GEOInstructionSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_83;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_83;
  }
  if (a3) {
    objc_super v6 = @"transitSignInstruction";
  }
  else {
    objc_super v6 = @"transit_sign_instruction";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOTransitSignInstruction alloc];
    if (a3) {
      uint64_t v9 = [(GEOTransitSignInstruction *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOTransitSignInstruction *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setTransitSignInstruction:v9];
  }
  if (a3) {
    v11 = @"transitListInstruction";
  }
  else {
    v11 = @"transit_list_instruction";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEOTransitListInstruction alloc];
    if (a3) {
      uint64_t v14 = [(GEOTransitListInstruction *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOTransitListInstruction *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setTransitListInstruction:v14];
  }
  if (a3) {
    v16 = @"genericInstruction";
  }
  else {
    v16 = @"generic_instruction";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEOGenericInstruction alloc];
    if (a3) {
      uint64_t v19 = [(GEOGenericInstruction *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOGenericInstruction *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setGenericInstruction:v19];
  }
  if (a3) {
    uint64_t v21 = @"departureBar";
  }
  else {
    uint64_t v21 = @"departure_bar";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v24 = [(GEOFormattedString *)v23 initWithJSON:v22];
    }
    else {
      uint64_t v24 = [(GEOFormattedString *)v23 initWithDictionary:v22];
    }
    v25 = (void *)v24;
    [a1 setDepartureBar:v24];
  }
  if (a3) {
    v26 = @"departureBarStyle";
  }
  else {
    v26 = @"departure_bar_style";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
    if ([v28 isEqualToString:@"DEFAULT"])
    {
      uint64_t v29 = 0;
    }
    else if ([v28 isEqualToString:@"REAL_TIME_ON_TIME"])
    {
      uint64_t v29 = 1;
    }
    else if ([v28 isEqualToString:@"REAL_TIME_DELAYS"])
    {
      uint64_t v29 = 2;
    }
    else if ([v28 isEqualToString:@"CLICKABLE"])
    {
      uint64_t v29 = 3;
    }
    else
    {
      uint64_t v29 = 0;
    }

    goto LABEL_51;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v29 = [v27 intValue];
LABEL_51:
    [a1 setDepartureBarStyle:v29];
  }

  if (a3) {
    v30 = @"countStopsText";
  }
  else {
    v30 = @"count_stops_text";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v33 = [(GEOFormattedString *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEOFormattedString *)v32 initWithDictionary:v31];
    }
    v34 = (void *)v33;
    [a1 setCountStopsText:v33];
  }
  if (a3) {
    v35 = @"drivingWalkingSignInstruction";
  }
  else {
    v35 = @"driving_walking_sign_instruction";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = [GEODrivingWalkingInstruction alloc];
    if (v37) {
      v38 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v37, v36, a3);
    }
    else {
      v38 = 0;
    }
    [a1 setDrivingWalkingSignInstruction:v38];
  }
  if (a3) {
    v39 = @"drivingWalkingListInstruction";
  }
  else {
    v39 = @"driving_walking_list_instruction";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [GEODrivingWalkingInstruction alloc];
    if (v41) {
      v42 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v41, v40, a3);
    }
    else {
      v42 = 0;
    }
    [a1 setDrivingWalkingListInstruction:v42];
  }
  if (a3) {
    v43 = @"drivingWalkingSpokenInstruction";
  }
  else {
    v43 = @"driving_walking_spoken_instruction";
  }
  id v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v45 = [GEODrivingWalkingSpokenInstruction alloc];
    if (a3) {
      uint64_t v46 = [(GEODrivingWalkingSpokenInstruction *)v45 initWithJSON:v44];
    }
    else {
      uint64_t v46 = [(GEODrivingWalkingSpokenInstruction *)v45 initWithDictionary:v44];
    }
    v47 = (void *)v46;
    [a1 setDrivingWalkingSpokenInstruction:v46];
  }
LABEL_83:

  return a1;
}

- (GEOInstructionSet)initWithJSON:(id)a3
{
  return (GEOInstructionSet *)-[GEOInstructionSet _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3243;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3244;
    }
    GEOInstructionSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOInstructionSetCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOInstructionSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOInstructionSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOInstructionSetIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOInstructionSet *)self readAll:0];
    if (self->_transitSignInstruction) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_transitListInstruction)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_genericInstruction)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_departureBar)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_countStopsText)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_drivingWalkingSignInstruction)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_drivingWalkingListInstruction)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_drivingWalkingSpokenInstruction)
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
  [(GEOInstructionSet *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 22) = self->_readerMarkPos;
  *((_DWORD *)v5 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_transitSignInstruction) {
    objc_msgSend(v5, "setTransitSignInstruction:");
  }
  if (self->_transitListInstruction) {
    objc_msgSend(v5, "setTransitListInstruction:");
  }
  int v4 = v5;
  if (self->_genericInstruction)
  {
    objc_msgSend(v5, "setGenericInstruction:");
    int v4 = v5;
  }
  if (self->_departureBar)
  {
    objc_msgSend(v5, "setDepartureBar:");
    int v4 = v5;
  }
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v4 + 25) = self->_departureBarStyle;
    *((_WORD *)v4 + 52) |= 1u;
  }
  if (self->_countStopsText)
  {
    objc_msgSend(v5, "setCountStopsText:");
    int v4 = v5;
  }
  if (self->_drivingWalkingSignInstruction)
  {
    objc_msgSend(v5, "setDrivingWalkingSignInstruction:");
    int v4 = v5;
  }
  if (self->_drivingWalkingListInstruction)
  {
    objc_msgSend(v5, "setDrivingWalkingListInstruction:");
    int v4 = v5;
  }
  if (self->_drivingWalkingSpokenInstruction)
  {
    objc_msgSend(v5, "setDrivingWalkingSpokenInstruction:");
    int v4 = v5;
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
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOInstructionSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOInstructionSet *)self readAll:0];
  id v9 = [(GEOTransitSignInstruction *)self->_transitSignInstruction copyWithZone:a3];
  id v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  id v11 = [(GEOTransitListInstruction *)self->_transitListInstruction copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  id v13 = [(GEOGenericInstruction *)self->_genericInstruction copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  id v15 = [(GEOFormattedString *)self->_departureBar copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 100) = self->_departureBarStyle;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  id v17 = [(GEOFormattedString *)self->_countStopsText copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  id v19 = [(GEODrivingWalkingInstruction *)self->_drivingWalkingSignInstruction copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  id v21 = [(GEODrivingWalkingInstruction *)self->_drivingWalkingListInstruction copyWithZone:a3];
  v22 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v21;

  id v23 = [(GEODrivingWalkingSpokenInstruction *)self->_drivingWalkingSpokenInstruction copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v23;

  v25 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOInstructionSet *)self readAll:1];
  [v4 readAll:1];
  transitSignInstruction = self->_transitSignInstruction;
  if ((unint64_t)transitSignInstruction | *((void *)v4 + 10))
  {
    if (!-[GEOTransitSignInstruction isEqual:](transitSignInstruction, "isEqual:")) {
      goto LABEL_23;
    }
  }
  transitListInstruction = self->_transitListInstruction;
  if ((unint64_t)transitListInstruction | *((void *)v4 + 9))
  {
    if (!-[GEOTransitListInstruction isEqual:](transitListInstruction, "isEqual:")) {
      goto LABEL_23;
    }
  }
  genericInstruction = self->_genericInstruction;
  if ((unint64_t)genericInstruction | *((void *)v4 + 8))
  {
    if (!-[GEOGenericInstruction isEqual:](genericInstruction, "isEqual:")) {
      goto LABEL_23;
    }
  }
  departureBar = self->_departureBar;
  if ((unint64_t)departureBar | *((void *)v4 + 4))
  {
    if (!-[GEOFormattedString isEqual:](departureBar, "isEqual:")) {
      goto LABEL_23;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 52);
  if (*(_WORD *)&self->_flags)
  {
    if ((v9 & 1) == 0 || self->_departureBarStyle != *((_DWORD *)v4 + 25)) {
      goto LABEL_23;
    }
  }
  else if (v9)
  {
LABEL_23:
    char v14 = 0;
    goto LABEL_24;
  }
  countStopsText = self->_countStopsText;
  if ((unint64_t)countStopsText | *((void *)v4 + 3)
    && !-[GEOFormattedString isEqual:](countStopsText, "isEqual:"))
  {
    goto LABEL_23;
  }
  drivingWalkingSignInstruction = self->_drivingWalkingSignInstruction;
  if ((unint64_t)drivingWalkingSignInstruction | *((void *)v4 + 6))
  {
    if (!-[GEODrivingWalkingInstruction isEqual:](drivingWalkingSignInstruction, "isEqual:")) {
      goto LABEL_23;
    }
  }
  drivingWalkingListInstruction = self->_drivingWalkingListInstruction;
  if ((unint64_t)drivingWalkingListInstruction | *((void *)v4 + 5))
  {
    if (!-[GEODrivingWalkingInstruction isEqual:](drivingWalkingListInstruction, "isEqual:")) {
      goto LABEL_23;
    }
  }
  drivingWalkingSpokenInstruction = self->_drivingWalkingSpokenInstruction;
  if ((unint64_t)drivingWalkingSpokenInstruction | *((void *)v4 + 7)) {
    char v14 = -[GEODrivingWalkingSpokenInstruction isEqual:](drivingWalkingSpokenInstruction, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_24:

  return v14;
}

- (unint64_t)hash
{
  [(GEOInstructionSet *)self readAll:1];
  unint64_t v3 = [(GEOTransitSignInstruction *)self->_transitSignInstruction hash];
  unint64_t v4 = [(GEOTransitListInstruction *)self->_transitListInstruction hash];
  unint64_t v5 = [(GEOGenericInstruction *)self->_genericInstruction hash];
  unint64_t v6 = [(GEOFormattedString *)self->_departureBar hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_departureBarStyle;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(GEOFormattedString *)self->_countStopsText hash];
  unint64_t v10 = v8 ^ v9 ^ [(GEODrivingWalkingInstruction *)self->_drivingWalkingSignInstruction hash];
  unint64_t v11 = [(GEODrivingWalkingInstruction *)self->_drivingWalkingListInstruction hash];
  return v10 ^ v11 ^ [(GEODrivingWalkingSpokenInstruction *)self->_drivingWalkingSpokenInstruction hash];
}

- (void)mergeFrom:(id)a3
{
  id v21 = a3;
  [v21 readAll:0];
  unint64_t v4 = v21;
  transitSignInstruction = self->_transitSignInstruction;
  uint64_t v6 = v21[10];
  if (transitSignInstruction)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOTransitSignInstruction mergeFrom:](transitSignInstruction, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOInstructionSet setTransitSignInstruction:](self, "setTransitSignInstruction:");
  }
  unint64_t v4 = v21;
LABEL_7:
  transitListInstruction = self->_transitListInstruction;
  uint64_t v8 = v4[9];
  if (transitListInstruction)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOTransitListInstruction mergeFrom:](transitListInstruction, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOInstructionSet setTransitListInstruction:](self, "setTransitListInstruction:");
  }
  unint64_t v4 = v21;
LABEL_13:
  genericInstruction = self->_genericInstruction;
  uint64_t v10 = v4[8];
  if (genericInstruction)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[GEOGenericInstruction mergeFrom:](genericInstruction, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[GEOInstructionSet setGenericInstruction:](self, "setGenericInstruction:");
  }
  unint64_t v4 = v21;
LABEL_19:
  departureBar = self->_departureBar;
  uint64_t v12 = v4[4];
  if (departureBar)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[GEOFormattedString mergeFrom:](departureBar, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[GEOInstructionSet setDepartureBar:](self, "setDepartureBar:");
  }
  unint64_t v4 = v21;
LABEL_25:
  if (v4[13])
  {
    self->_departureBarStyle = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 1u;
  }
  countStopsText = self->_countStopsText;
  uint64_t v14 = v4[3];
  if (countStopsText)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOFormattedString mergeFrom:](countStopsText, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOInstructionSet setCountStopsText:](self, "setCountStopsText:");
  }
  unint64_t v4 = v21;
LABEL_33:
  drivingWalkingSignInstruction = self->_drivingWalkingSignInstruction;
  v16 = (void *)v4[6];
  if (drivingWalkingSignInstruction)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEODrivingWalkingInstruction mergeFrom:](drivingWalkingSignInstruction, v16);
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    [(GEOInstructionSet *)self setDrivingWalkingSignInstruction:v4[6]];
  }
  unint64_t v4 = v21;
LABEL_39:
  drivingWalkingListInstruction = self->_drivingWalkingListInstruction;
  v18 = (void *)v4[5];
  if (drivingWalkingListInstruction)
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEODrivingWalkingInstruction mergeFrom:](drivingWalkingListInstruction, v18);
  }
  else
  {
    if (!v18) {
      goto LABEL_45;
    }
    [(GEOInstructionSet *)self setDrivingWalkingListInstruction:v4[5]];
  }
  unint64_t v4 = v21;
LABEL_45:
  drivingWalkingSpokenInstruction = self->_drivingWalkingSpokenInstruction;
  uint64_t v20 = v4[7];
  if (drivingWalkingSpokenInstruction)
  {
    if (v20) {
      -[GEODrivingWalkingSpokenInstruction mergeFrom:](drivingWalkingSpokenInstruction, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEOInstructionSet setDrivingWalkingSpokenInstruction:](self, "setDrivingWalkingSpokenInstruction:");
  }

  MEMORY[0x1F4181870]();
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOInstructionSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3248);
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
  *(_WORD *)&self->_flags |= 0x402u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOInstructionSet *)self readAll:0];
    [(GEOTransitSignInstruction *)self->_transitSignInstruction clearUnknownFields:1];
    [(GEOTransitListInstruction *)self->_transitListInstruction clearUnknownFields:1];
    [(GEOGenericInstruction *)self->_genericInstruction clearUnknownFields:1];
    [(GEOFormattedString *)self->_departureBar clearUnknownFields:1];
    [(GEOFormattedString *)self->_countStopsText clearUnknownFields:1];
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_drivingWalkingSignInstruction);
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_drivingWalkingListInstruction);
    drivingWalkingSpokenInstruction = self->_drivingWalkingSpokenInstruction;
    [(GEODrivingWalkingSpokenInstruction *)drivingWalkingSpokenInstruction clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSignInstruction, 0);
  objc_storeStrong((id *)&self->_transitListInstruction, 0);
  objc_storeStrong((id *)&self->_genericInstruction, 0);
  objc_storeStrong((id *)&self->_drivingWalkingSpokenInstruction, 0);
  objc_storeStrong((id *)&self->_drivingWalkingSignInstruction, 0);
  objc_storeStrong((id *)&self->_drivingWalkingListInstruction, 0);
  objc_storeStrong((id *)&self->_departureBar, 0);
  objc_storeStrong((id *)&self->_countStopsText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  if ([(GEOInstructionSet *)self hasDepartureBar]
    || [(GEOInstructionSet *)self hasDepartureBarStyle]
    || [(GEOInstructionSet *)self hasCountStopsText]
    || [(GEOInstructionSet *)self hasTransitListInstruction])
  {
    return 1;
  }

  return [(GEOInstructionSet *)self hasTransitSignInstruction];
}

- (void)_transit_mergeFrom:(id)a3
{
  id v44 = a3;
  unint64_t v4 = [(GEOInstructionSet *)self departureBar];
  unint64_t v5 = [v44 departureBar];
  id v6 = v4;
  id v7 = v5;
  if (!v7)
  {
    id v11 = v6;
    goto LABEL_19;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v8 = (id)_MergedGlobals_223;
  id v9 = v7;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v9 conformsToProtocol:_MergedGlobals_223])
  {
    char v10 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if (v10)
    {
LABEL_14:
      if ([v9 conformsToProtocol:v8]
        && [v6 conformsToProtocol:v8])
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        id v9 = v6;
      }
      id v11 = v9;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_14;
    }
    uint64_t v12 = [v9 dictionaryRepresentation];
    uint64_t v13 = [v12 count];

    if (v13) {
      goto LABEL_14;
    }
  }
  id v11 = 0;
LABEL_18:

LABEL_19:
  [(GEOInstructionSet *)self setDepartureBar:v11];

  -[GEOInstructionSet setDepartureBarStyle:](self, "setDepartureBarStyle:", [v44 departureBarStyle]);
  uint64_t v14 = [(GEOInstructionSet *)self countStopsText];
  id v15 = [v44 countStopsText];
  id v16 = v14;
  id v17 = v15;
  if (!v17)
  {
    id v21 = v16;
    goto LABEL_37;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v18 = (id)_MergedGlobals_223;
  id v19 = v17;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v19 conformsToProtocol:_MergedGlobals_223])
  {
    char v20 = objc_msgSend(v19, "_transit_hasAnyFieldSet");

    if (v20)
    {
LABEL_32:
      if ([v19 conformsToProtocol:v18]
        && [v16 conformsToProtocol:v18])
      {
        objc_msgSend(v16, "_transit_mergeFrom:", v19);
        id v19 = v16;
      }
      id v21 = v19;
      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_32;
    }
    v22 = [v19 dictionaryRepresentation];
    uint64_t v23 = [v22 count];

    if (v23) {
      goto LABEL_32;
    }
  }
  id v21 = 0;
LABEL_36:

LABEL_37:
  [(GEOInstructionSet *)self setCountStopsText:v21];

  uint64_t v24 = [(GEOInstructionSet *)self transitListInstruction];
  v25 = [v44 transitListInstruction];
  id v26 = v24;
  id v27 = v25;
  if (!v27)
  {
    id v31 = v26;
    goto LABEL_55;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v28 = (id)_MergedGlobals_223;
  id v29 = v27;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v29 conformsToProtocol:_MergedGlobals_223])
  {
    char v30 = objc_msgSend(v29, "_transit_hasAnyFieldSet");

    if (v30)
    {
LABEL_50:
      if ([v29 conformsToProtocol:v28]
        && [v26 conformsToProtocol:v28])
      {
        objc_msgSend(v26, "_transit_mergeFrom:", v29);
        id v29 = v26;
      }
      id v31 = v29;
      goto LABEL_54;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_50;
    }
    v32 = [v29 dictionaryRepresentation];
    uint64_t v33 = [v32 count];

    if (v33) {
      goto LABEL_50;
    }
  }
  id v31 = 0;
LABEL_54:

LABEL_55:
  [(GEOInstructionSet *)self setTransitListInstruction:v31];

  v34 = [(GEOInstructionSet *)self transitSignInstruction];
  v35 = [v44 transitSignInstruction];
  id v36 = v34;
  id v37 = v35;
  if (!v37)
  {
    id v41 = v36;
    goto LABEL_73;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v38 = (id)_MergedGlobals_223;
  id v39 = v37;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v39 conformsToProtocol:_MergedGlobals_223])
  {
    char v40 = objc_msgSend(v39, "_transit_hasAnyFieldSet");

    if (v40)
    {
LABEL_68:
      if ([v39 conformsToProtocol:v38]
        && [v36 conformsToProtocol:v38])
      {
        objc_msgSend(v36, "_transit_mergeFrom:", v39);
        id v39 = v36;
      }
      id v41 = v39;
      goto LABEL_72;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_68;
    }
    v42 = [v39 dictionaryRepresentation];
    uint64_t v43 = [v42 count];

    if (v43) {
      goto LABEL_68;
    }
  }
  id v41 = 0;
LABEL_72:

LABEL_73:
  [(GEOInstructionSet *)self setTransitSignInstruction:v41];
}

- (GEOServerFormattedString)departureBarFormattedString
{
  if ([(GEOInstructionSet *)self hasDepartureBar])
  {
    BOOL v3 = [(GEOInstructionSet *)self departureBar];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

- (int64_t)departureBarFormatStyle
{
  uint64_t v2 = [(GEOInstructionSet *)self departureBarStyle] - 1;
  if (v2 < 3) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (GEOServerFormattedString)countStopsFormattedString
{
  if ([(GEOInstructionSet *)self hasCountStopsText])
  {
    BOOL v3 = [(GEOInstructionSet *)self countStopsText];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)expandableListFormattedString
{
  BOOL v3 = [(GEOInstructionSet *)self transitListInstruction];
  int v4 = [v3 hasExpandableListFormatted];

  if (v4)
  {
    unint64_t v5 = [(GEOInstructionSet *)self transitListInstruction];
    id v6 = [v5 expandableListFormatted];
  }
  else
  {
    id v6 = 0;
  }

  return (GEOServerFormattedString *)v6;
}

- (GEOServerFormattedString)primaryTimeFormattedString
{
  BOOL v3 = [(GEOInstructionSet *)self transitListInstruction];
  if ([v3 hasTimeInstructions])
  {
    int v4 = [(GEOInstructionSet *)self transitListInstruction];
    unint64_t v5 = [v4 timeInstructions];
  }
  else
  {
    unint64_t v5 = 0;
  }

  if ([v5 hasPrimaryText])
  {
    id v6 = [v5 primaryText];
  }
  else
  {
    id v6 = 0;
  }

  return (GEOServerFormattedString *)v6;
}

- (GEOServerFormattedString)secondaryTimeFormattedString
{
  BOOL v3 = [(GEOInstructionSet *)self transitListInstruction];
  if ([v3 hasTimeInstructions])
  {
    int v4 = [(GEOInstructionSet *)self transitListInstruction];
    unint64_t v5 = [v4 timeInstructions];
  }
  else
  {
    unint64_t v5 = 0;
  }

  if ([v5 hasSecondaryText])
  {
    id v6 = [v5 secondaryText];
  }
  else
  {
    id v6 = 0;
  }

  return (GEOServerFormattedString *)v6;
}

- (BOOL)hideTimeInstructionsIfCollapsed
{
  BOOL v3 = [(GEOInstructionSet *)self transitListInstruction];
  if ([v3 hasTimeInstructions])
  {
    int v4 = [(GEOInstructionSet *)self transitListInstruction];
    unint64_t v5 = [v4 timeInstructions];
  }
  else
  {
    unint64_t v5 = 0;
  }

  if ([v5 hasHideWhenListCollapsed]) {
    char v6 = [v5 hideWhenListCollapsed];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

@end