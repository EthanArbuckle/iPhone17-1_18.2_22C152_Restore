@interface GEOSpokenGuidance
+ (BOOL)isValid:(id)a3;
+ (Class)announcementType;
+ (Class)timeGapType;
- (BOOL)hasAlignment;
- (BOOL)hasEndDesiredTime;
- (BOOL)hasExclusiveSetIdentifier;
- (BOOL)hasNumChainedVariants;
- (BOOL)hasPriority;
- (BOOL)hasRepetitionInterval;
- (BOOL)hasStartDesiredTime;
- (BOOL)hasTapBeforeAnnouncement;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)tapBeforeAnnouncement;
- (GEOSpokenGuidance)init;
- (GEOSpokenGuidance)initWithData:(id)a3;
- (GEOSpokenGuidance)initWithDictionary:(id)a3;
- (GEOSpokenGuidance)initWithJSON:(id)a3;
- (NSMutableArray)announcements;
- (NSMutableArray)timeGaps;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)alignmentAsString:(int)a3;
- (id)announcementAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)timeGapAtIndex:(unint64_t)a3;
- (int)StringAsAlignment:(id)a3;
- (int)alignment;
- (unint64_t)announcementsCount;
- (unint64_t)hash;
- (unint64_t)timeGapsCount;
- (unsigned)endDesiredTime;
- (unsigned)exclusiveSetIdentifier;
- (unsigned)numChainedVariants;
- (unsigned)priority;
- (unsigned)repetitionInterval;
- (unsigned)startDesiredTime;
- (void)_addNoFlagsAnnouncement:(uint64_t)a1;
- (void)_addNoFlagsTimeGap:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnnouncements;
- (void)_readTimeGaps;
- (void)addAnnouncement:(id)a3;
- (void)addTimeGap:(id)a3;
- (void)clearAnnouncements;
- (void)clearTimeGaps;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlignment:(int)a3;
- (void)setAnnouncements:(id)a3;
- (void)setEndDesiredTime:(unsigned int)a3;
- (void)setExclusiveSetIdentifier:(unsigned int)a3;
- (void)setHasAlignment:(BOOL)a3;
- (void)setHasEndDesiredTime:(BOOL)a3;
- (void)setHasExclusiveSetIdentifier:(BOOL)a3;
- (void)setHasNumChainedVariants:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasRepetitionInterval:(BOOL)a3;
- (void)setHasStartDesiredTime:(BOOL)a3;
- (void)setHasTapBeforeAnnouncement:(BOOL)a3;
- (void)setNumChainedVariants:(unsigned int)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setRepetitionInterval:(unsigned int)a3;
- (void)setStartDesiredTime:(unsigned int)a3;
- (void)setTapBeforeAnnouncement:(BOOL)a3;
- (void)setTimeGaps:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSpokenGuidance

- (GEOSpokenGuidance)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSpokenGuidance;
  v2 = [(GEOSpokenGuidance *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSpokenGuidance)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSpokenGuidance;
  v3 = [(GEOSpokenGuidance *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAnnouncements
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 84) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSpokenGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnouncements_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)announcements
{
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  announcements = self->_announcements;

  return announcements;
}

- (void)setAnnouncements:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  announcements = self->_announcements;
  self->_announcements = v4;
}

- (void)clearAnnouncements
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  announcements = self->_announcements;

  [(NSMutableArray *)announcements removeAllObjects];
}

- (void)addAnnouncement:(id)a3
{
  id v4 = a3;
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  -[GEOSpokenGuidance _addNoFlagsAnnouncement:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsAnnouncement:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)announcementsCount
{
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  announcements = self->_announcements;

  return [(NSMutableArray *)announcements count];
}

- (id)announcementAtIndex:(unint64_t)a3
{
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  announcements = self->_announcements;

  return (id)[(NSMutableArray *)announcements objectAtIndex:a3];
}

+ (Class)announcementType
{
  return (Class)objc_opt_class();
}

- (unsigned)startDesiredTime
{
  return self->_startDesiredTime;
}

- (void)setStartDesiredTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  self->_startDesiredTime = a3;
}

- (void)setHasStartDesiredTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2112;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasStartDesiredTime
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unsigned)endDesiredTime
{
  return self->_endDesiredTime;
}

- (void)setEndDesiredTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_endDesiredTime = a3;
}

- (void)setHasEndDesiredTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasEndDesiredTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)alignment
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_alignment;
  }
  else {
    return 1;
  }
}

- (void)setAlignment:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_alignment = a3;
}

- (void)setHasAlignment:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasAlignment
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)alignmentAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E06C8[a3];
  }

  return v3;
}

- (int)StringAsAlignment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ALIGNMENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AT_START"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WHEN_CONVENIENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AT_END"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REPETITION_ONLY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)repetitionInterval
{
  return self->_repetitionInterval;
}

- (void)setRepetitionInterval:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_repetitionInterval = a3;
}

- (void)setHasRepetitionInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2080;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRepetitionInterval
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)numChainedVariants
{
  return self->_numChainedVariants;
}

- (void)setNumChainedVariants:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_numChainedVariants = a3;
}

- (void)setHasNumChainedVariants:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasNumChainedVariants
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)tapBeforeAnnouncement
{
  return self->_tapBeforeAnnouncement;
}

- (void)setTapBeforeAnnouncement:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  self->_tapBeforeAnnouncement = a3;
}

- (void)setHasTapBeforeAnnouncement:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2176;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTapBeforeAnnouncement
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readTimeGaps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 84) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSpokenGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeGaps_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)timeGaps
{
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  timeGaps = self->_timeGaps;

  return timeGaps;
}

- (void)setTimeGaps:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  timeGaps = self->_timeGaps;
  self->_timeGaps = v4;
}

- (void)clearTimeGaps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  timeGaps = self->_timeGaps;

  [(NSMutableArray *)timeGaps removeAllObjects];
}

- (void)addTimeGap:(id)a3
{
  id v4 = a3;
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  -[GEOSpokenGuidance _addNoFlagsTimeGap:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsTimeGap:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)timeGapsCount
{
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  timeGaps = self->_timeGaps;

  return [(NSMutableArray *)timeGaps count];
}

- (id)timeGapAtIndex:(unint64_t)a3
{
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  timeGaps = self->_timeGaps;

  return (id)[(NSMutableArray *)timeGaps objectAtIndex:a3];
}

+ (Class)timeGapType
{
  return (Class)objc_opt_class();
}

- (unsigned)exclusiveSetIdentifier
{
  return self->_exclusiveSetIdentifier;
}

- (void)setExclusiveSetIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_exclusiveSetIdentifier = a3;
}

- (void)setHasExclusiveSetIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasExclusiveSetIdentifier
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSpokenGuidance;
  id v4 = [(GEOSpokenGuidance *)&v8 description];
  id v5 = [(GEOSpokenGuidance *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpokenGuidance _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_49;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 24) count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v6 = *(id *)(a1 + 24);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v52 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = [v11 dictionaryRepresentation];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v8);
    }

    [v4 setObject:v5 forKey:@"announcement"];
  }
  __int16 v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 0x40) != 0)
  {
    v34 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      v35 = @"startDesiredTime";
    }
    else {
      v35 = @"start_desired_time";
    }
    [v4 setObject:v34 forKey:v35];

    __int16 v13 = *(_WORD *)(a1 + 84);
    if ((v13 & 2) == 0)
    {
LABEL_16:
      if ((v13 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_60;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_16;
  }
  v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  if (a2) {
    v37 = @"endDesiredTime";
  }
  else {
    v37 = @"end_desired_time";
  }
  [v4 setObject:v36 forKey:v37];

  __int16 v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 1) == 0)
  {
LABEL_17:
    if ((v13 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_64;
  }
LABEL_60:
  uint64_t v38 = *(int *)(a1 + 52);
  if (v38 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = off_1E53E06C8[v38];
  }
  [v4 setObject:v39 forKey:@"alignment"];

  __int16 v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 0x20) == 0)
  {
LABEL_18:
    if ((v13 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_64:
  v40 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  if (a2) {
    v41 = @"repetitionInterval";
  }
  else {
    v41 = @"repetition_interval";
  }
  [v4 setObject:v40 forKey:v41];

  __int16 v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 0x10) == 0)
  {
LABEL_19:
    if ((v13 & 8) == 0) {
      goto LABEL_20;
    }
LABEL_69:
    v43 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
    if (a2) {
      v44 = @"numChainedVariants";
    }
    else {
      v44 = @"num_chained_variants";
    }
    [v4 setObject:v43 forKey:v44];

    if ((*(_WORD *)(a1 + 84) & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
LABEL_68:
  v42 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
  [v4 setObject:v42 forKey:@"priority"];

  __int16 v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 8) != 0) {
    goto LABEL_69;
  }
LABEL_20:
  if ((v13 & 0x80) != 0)
  {
LABEL_21:
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    if (a2) {
      v15 = @"tapBeforeAnnouncement";
    }
    else {
      v15 = @"tap_before_announcement";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_25:
  if ([*(id *)(a1 + 32) count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          if (a2) {
            [v22 jsonRepresentation];
          }
          else {
          v23 = [v22 dictionaryRepresentation];
          }
          [v16 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v19);
    }

    if (a2) {
      v24 = @"timeGap";
    }
    else {
      v24 = @"time_gap";
    }
    [v4 setObject:v16 forKey:v24];
  }
  if ((*(_WORD *)(a1 + 84) & 4) != 0)
  {
    v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
    if (a2) {
      v26 = @"exclusiveSetIdentifier";
    }
    else {
      v26 = @"exclusive_set_identifier";
    }
    [v4 setObject:v25 forKey:v26];
  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    v28 = [v27 dictionaryRepresentation];
    v29 = v28;
    if (a2)
    {
      v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __47__GEOSpokenGuidance__dictionaryRepresentation___block_invoke;
      v45[3] = &unk_1E53D8860;
      id v31 = v30;
      id v46 = v31;
      [v29 enumerateKeysAndObjectsUsingBlock:v45];
      id v32 = v31;

      v29 = v32;
    }
    [v4 setObject:v29 forKey:@"Unknown Fields"];
  }
LABEL_49:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSpokenGuidance _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOSpokenGuidance__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOSpokenGuidance)initWithDictionary:(id)a3
{
  return (GEOSpokenGuidance *)-[GEOSpokenGuidance _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_83;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_83;
  }
  id v6 = [v5 objectForKeyedSubscript:@"announcement"];
  objc_opt_class();
  id v44 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v13 = [GEOFormattedString alloc];
            if (a3) {
              uint64_t v14 = [(GEOFormattedString *)v13 initWithJSON:v12];
            }
            else {
              uint64_t v14 = [(GEOFormattedString *)v13 initWithDictionary:v12];
            }
            v15 = (void *)v14;
            [a1 addAnnouncement:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v9);
    }

    id v5 = v44;
  }

  if (a3) {
    v16 = @"startDesiredTime";
  }
  else {
    v16 = @"start_desired_time";
  }
  id v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStartDesiredTime:", objc_msgSend(v17, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v18 = @"endDesiredTime";
  }
  else {
    uint64_t v18 = @"end_desired_time";
  }
  uint64_t v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndDesiredTime:", objc_msgSend(v19, "unsignedIntValue"));
  }

  uint64_t v20 = [v5 objectForKeyedSubscript:@"alignment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
    if ([v21 isEqualToString:@"UNKNOWN_ALIGNMENT"])
    {
      uint64_t v22 = 0;
    }
    else if ([v21 isEqualToString:@"AT_START"])
    {
      uint64_t v22 = 1;
    }
    else if ([v21 isEqualToString:@"WHEN_CONVENIENT"])
    {
      uint64_t v22 = 2;
    }
    else if ([v21 isEqualToString:@"AT_END"])
    {
      uint64_t v22 = 3;
    }
    else if ([v21 isEqualToString:@"REPETITION_ONLY"])
    {
      uint64_t v22 = 4;
    }
    else
    {
      uint64_t v22 = 0;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v20 intValue];
LABEL_42:
    [a1 setAlignment:v22];
  }

  if (a3) {
    v23 = @"repetitionInterval";
  }
  else {
    v23 = @"repetition_interval";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRepetitionInterval:", objc_msgSend(v24, "unsignedIntValue"));
  }

  v25 = [v5 objectForKeyedSubscript:@"priority"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPriority:", objc_msgSend(v25, "unsignedIntValue"));
  }

  if (a3) {
    v26 = @"numChainedVariants";
  }
  else {
    v26 = @"num_chained_variants";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumChainedVariants:", objc_msgSend(v27, "unsignedIntValue"));
  }

  if (a3) {
    v28 = @"tapBeforeAnnouncement";
  }
  else {
    v28 = @"tap_before_announcement";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTapBeforeAnnouncement:", objc_msgSend(v29, "BOOLValue"));
  }

  if (a3) {
    v30 = @"timeGap";
  }
  else {
    v30 = @"time_gap";
  }
  id v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = [GEOTimeGap alloc];
            if (a3) {
              uint64_t v39 = [(GEOTimeGap *)v38 initWithJSON:v37];
            }
            else {
              uint64_t v39 = [(GEOTimeGap *)v38 initWithDictionary:v37];
            }
            v40 = (void *)v39;
            [a1 addTimeGap:v39];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v34);
    }

    id v5 = v44;
  }

  if (a3) {
    v41 = @"exclusiveSetIdentifier";
  }
  else {
    v41 = @"exclusive_set_identifier";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setExclusiveSetIdentifier:", objc_msgSend(v42, "unsignedIntValue"));
  }

LABEL_83:
  return a1;
}

- (GEOSpokenGuidance)initWithJSON:(id)a3
{
  return (GEOSpokenGuidance *)-[GEOSpokenGuidance _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_7012;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_7013;
    }
    GEOSpokenGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOSpokenGuidanceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSpokenGuidanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpokenGuidanceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0xE00) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSpokenGuidance *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_announcements;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = self->_timeGaps;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEOSpokenGuidance *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 10) = self->_readerMarkPos;
  *((_DWORD *)v13 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOSpokenGuidance *)self announcementsCount])
  {
    [v13 clearAnnouncements];
    unint64_t v4 = [(GEOSpokenGuidance *)self announcementsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSpokenGuidance *)self announcementAtIndex:i];
        [v13 addAnnouncement:v7];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v13 + 19) = self->_startDesiredTime;
    *((_WORD *)v13 + 42) |= 0x40u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v13 + 14) = self->_endDesiredTime;
  *((_WORD *)v13 + 42) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v13 + 13) = self->_alignment;
  *((_WORD *)v13 + 42) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v13 + 18) = self->_repetitionInterval;
  *((_WORD *)v13 + 42) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_10:
    if ((flags & 8) == 0) {
      goto LABEL_11;
    }
LABEL_27:
    *((_DWORD *)v13 + 16) = self->_numChainedVariants;
    *((_WORD *)v13 + 42) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_26:
  *((_DWORD *)v13 + 17) = self->_priority;
  *((_WORD *)v13 + 42) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_27;
  }
LABEL_11:
  if ((flags & 0x80) != 0)
  {
LABEL_12:
    *((unsigned char *)v13 + 80) = self->_tapBeforeAnnouncement;
    *((_WORD *)v13 + 42) |= 0x80u;
  }
LABEL_13:
  if ([(GEOSpokenGuidance *)self timeGapsCount])
  {
    [v13 clearTimeGaps];
    unint64_t v9 = [(GEOSpokenGuidance *)self timeGapsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOSpokenGuidance *)self timeGapAtIndex:j];
        [v13 addTimeGap:v12];
      }
    }
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v13 + 15) = self->_exclusiveSetIdentifier;
    *((_WORD *)v13 + 42) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSpokenGuidanceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSpokenGuidance *)self readAll:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v9 = self->_announcements;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAnnouncement:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_startDesiredTime;
    *(_WORD *)(v5 + 84) |= 0x40u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_14:
      if ((flags & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_33;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v5 + 56) = self->_endDesiredTime;
  *(_WORD *)(v5 + 84) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_15:
    if ((flags & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 52) = self->_alignment;
  *(_WORD *)(v5 + 84) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_16:
    if ((flags & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 72) = self->_repetitionInterval;
  *(_WORD *)(v5 + 84) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_17:
    if ((flags & 8) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    *(_DWORD *)(v5 + 64) = self->_numChainedVariants;
    *(_WORD *)(v5 + 84) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_35:
  *(_DWORD *)(v5 + 68) = self->_priority;
  *(_WORD *)(v5 + 84) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if ((flags & 0x80) != 0)
  {
LABEL_19:
    *(unsigned char *)(v5 + 80) = self->_tapBeforeAnnouncement;
    *(_WORD *)(v5 + 84) |= 0x80u;
  }
LABEL_20:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = self->_timeGaps;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        [(id)v5 addTimeGap:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_exclusiveSetIdentifier;
    *(_WORD *)(v5 + 84) |= 4u;
  }
  long long v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  [(GEOSpokenGuidance *)self readAll:1];
  [v4 readAll:1];
  announcements = self->_announcements;
  if ((unint64_t)announcements | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](announcements, "isEqual:")) {
      goto LABEL_49;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 42);
  if ((flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_startDesiredTime != *((_DWORD *)v4 + 19)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_endDesiredTime != *((_DWORD *)v4 + 14)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_alignment != *((_DWORD *)v4 + 13)) {
      goto LABEL_49;
    }
  }
  else if (v7)
  {
    goto LABEL_49;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_repetitionInterval != *((_DWORD *)v4 + 18)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_priority != *((_DWORD *)v4 + 17)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_numChainedVariants != *((_DWORD *)v4 + 16)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_49;
    }
    if (self->_tapBeforeAnnouncement)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  timeGaps = self->_timeGaps;
  if (!((unint64_t)timeGaps | *((void *)v4 + 4))) {
    goto LABEL_45;
  }
  if (!-[NSMutableArray isEqual:](timeGaps, "isEqual:"))
  {
LABEL_49:
    BOOL v9 = 0;
    goto LABEL_50;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 42);
LABEL_45:
  BOOL v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_exclusiveSetIdentifier != *((_DWORD *)v4 + 15)) {
      goto LABEL_49;
    }
    BOOL v9 = 1;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  [(GEOSpokenGuidance *)self readAll:1];
  uint64_t v14 = [(NSMutableArray *)self->_announcements hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    uint64_t v4 = 2654435761 * self->_startDesiredTime;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_endDesiredTime;
      if (flags) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
  if (flags)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_alignment;
    if ((flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_repetitionInterval;
    if ((flags & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_priority;
    if ((flags & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((flags & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_numChainedVariants;
  if ((flags & 0x80) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_tapBeforeAnnouncement;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
LABEL_16:
  uint64_t v11 = [(NSMutableArray *)self->_timeGaps hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_exclusiveSetIdentifier;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOSpokenGuidance *)self addAnnouncement:*(void *)(*((void *)&v20 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 42);
  if ((v10 & 0x40) != 0)
  {
    self->_startDesiredTime = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 0x40u;
    __int16 v10 = *((_WORD *)v4 + 42);
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_28;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_endDesiredTime = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v10 = *((_WORD *)v4 + 42);
  if ((v10 & 1) == 0)
  {
LABEL_11:
    if ((v10 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_alignment = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v10 = *((_WORD *)v4 + 42);
  if ((v10 & 0x20) == 0)
  {
LABEL_12:
    if ((v10 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_repetitionInterval = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v10 = *((_WORD *)v4 + 42);
  if ((v10 & 0x10) == 0)
  {
LABEL_13:
    if ((v10 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_priority = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 0x10u;
  __int16 v10 = *((_WORD *)v4 + 42);
  if ((v10 & 8) == 0)
  {
LABEL_14:
    if ((v10 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  self->_numChainedVariants = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v4 + 42) & 0x80) != 0)
  {
LABEL_15:
    self->_tapBeforeAnnouncement = *((unsigned char *)v4 + 80);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_16:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEOSpokenGuidance addTimeGap:](self, "addTimeGap:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
    self->_exclusiveSetIdentifier = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 4u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOSpokenGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7017);
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x900u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSpokenGuidance *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_announcements;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_timeGaps;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeGaps, 0);
  objc_storeStrong((id *)&self->_announcements, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end