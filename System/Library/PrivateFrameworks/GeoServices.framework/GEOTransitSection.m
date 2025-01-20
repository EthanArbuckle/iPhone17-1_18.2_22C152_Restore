@interface GEOTransitSection
+ (BOOL)isValid:(id)a3;
+ (Class)ticketingSegmentType;
- (BOOL)disableAlightNotifications;
- (BOOL)hasActionSheetName;
- (BOOL)hasDisableAlightNotifications;
- (BOOL)hasNextOptionsIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitSection)init;
- (GEOTransitSection)initWithData:(id)a3;
- (GEOTransitSection)initWithDictionary:(id)a3;
- (GEOTransitSection)initWithJSON:(id)a3;
- (NSMutableArray)ticketingSegments;
- (NSString)actionSheetName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)ticketingSegmentAtIndex:(unint64_t)a3;
- (int)nextOptionsIndex;
- (unint64_t)actionSheetArtworkIndexsCount;
- (unint64_t)hash;
- (unint64_t)routeDetailsArtworkIndexsCount;
- (unint64_t)stepIndexsCount;
- (unint64_t)ticketingSegmentsCount;
- (unsigned)actionSheetArtworkIndexAtIndex:(unint64_t)a3;
- (unsigned)actionSheetArtworkIndexs;
- (unsigned)routeDetailsArtworkIndexAtIndex:(unint64_t)a3;
- (unsigned)routeDetailsArtworkIndexs;
- (unsigned)stepIndexAtIndex:(unint64_t)a3;
- (unsigned)stepIndexs;
- (void)_addNoFlagsTicketingSegment:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readActionSheetArtworkIndexs;
- (void)_readActionSheetName;
- (void)_readRouteDetailsArtworkIndexs;
- (void)_readStepIndexs;
- (void)_readTicketingSegments;
- (void)addActionSheetArtworkIndex:(unsigned int)a3;
- (void)addRouteDetailsArtworkIndex:(unsigned int)a3;
- (void)addStepIndex:(unsigned int)a3;
- (void)addTicketingSegment:(id)a3;
- (void)clearActionSheetArtworkIndexs;
- (void)clearRouteDetailsArtworkIndexs;
- (void)clearStepIndexs;
- (void)clearTicketingSegments;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setActionSheetArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setActionSheetName:(id)a3;
- (void)setDisableAlightNotifications:(BOOL)a3;
- (void)setHasDisableAlightNotifications:(BOOL)a3;
- (void)setHasNextOptionsIndex:(BOOL)a3;
- (void)setNextOptionsIndex:(int)a3;
- (void)setRouteDetailsArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setStepIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTicketingSegments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitSection

- (GEOTransitSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitSection;
  v2 = [(GEOTransitSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitSection;
  v3 = [(GEOTransitSection *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitSection;
  [(GEOTransitSection *)&v3 dealloc];
}

- (void)_readStepIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStepIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)stepIndexsCount
{
  return self->_stepIndexs.count;
}

- (unsigned)stepIndexs
{
  return self->_stepIndexs.list;
}

- (void)clearStepIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  PBRepeatedUInt32Clear();
}

- (void)addStepIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unsigned)stepIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitSection _readStepIndexs]((uint64_t)self);
  p_stepIndexs = &self->_stepIndexs;
  unint64_t count = self->_stepIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_stepIndexs->list[a3];
}

- (void)setStepIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  MEMORY[0x1F4147400](&self->_stepIndexs, a3, a4);
}

- (int)nextOptionsIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_nextOptionsIndex;
  }
  else {
    return -1;
  }
}

- (void)setNextOptionsIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_nextOptionsIndex = a3;
}

- (void)setHasNextOptionsIndex:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasNextOptionsIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readActionSheetName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionSheetName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasActionSheetName
{
  return self->_actionSheetName != 0;
}

- (NSString)actionSheetName
{
  -[GEOTransitSection _readActionSheetName]((uint64_t)self);
  actionSheetName = self->_actionSheetName;

  return actionSheetName;
}

- (void)setActionSheetName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_actionSheetName, a3);
}

- (void)_readActionSheetArtworkIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionSheetArtworkIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)actionSheetArtworkIndexsCount
{
  return self->_actionSheetArtworkIndexs.count;
}

- (unsigned)actionSheetArtworkIndexs
{
  return self->_actionSheetArtworkIndexs.list;
}

- (void)clearActionSheetArtworkIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  PBRepeatedUInt32Clear();
}

- (void)addActionSheetArtworkIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unsigned)actionSheetArtworkIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitSection _readActionSheetArtworkIndexs]((uint64_t)self);
  p_actionSheetArtworkIndexs = &self->_actionSheetArtworkIndexs;
  unint64_t count = self->_actionSheetArtworkIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_actionSheetArtworkIndexs->list[a3];
}

- (void)setActionSheetArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  MEMORY[0x1F4147400](&self->_actionSheetArtworkIndexs, a3, a4);
}

- (void)_readRouteDetailsArtworkIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteDetailsArtworkIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)routeDetailsArtworkIndexsCount
{
  return self->_routeDetailsArtworkIndexs.count;
}

- (unsigned)routeDetailsArtworkIndexs
{
  return self->_routeDetailsArtworkIndexs.list;
}

- (void)clearRouteDetailsArtworkIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  PBRepeatedUInt32Clear();
}

- (void)addRouteDetailsArtworkIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unsigned)routeDetailsArtworkIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitSection _readRouteDetailsArtworkIndexs]((uint64_t)self);
  p_routeDetailsArtworkIndexs = &self->_routeDetailsArtworkIndexs;
  unint64_t count = self->_routeDetailsArtworkIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_routeDetailsArtworkIndexs->list[a3];
}

- (void)setRouteDetailsArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;

  MEMORY[0x1F4147400](&self->_routeDetailsArtworkIndexs, a3, a4);
}

- (BOOL)disableAlightNotifications
{
  return self->_disableAlightNotifications;
}

- (void)setDisableAlightNotifications:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_disableAlightNotifications = a3;
}

- (void)setHasDisableAlightNotifications:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDisableAlightNotifications
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readTicketingSegments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTicketingSegments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)ticketingSegments
{
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  ticketingSegments = self->_ticketingSegments;

  return ticketingSegments;
}

- (void)setTicketingSegments:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  ticketingSegments = self->_ticketingSegments;
  self->_ticketingSegments = v4;
}

- (void)clearTicketingSegments
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  ticketingSegments = self->_ticketingSegments;

  [(NSMutableArray *)ticketingSegments removeAllObjects];
}

- (void)addTicketingSegment:(id)a3
{
  id v4 = a3;
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  -[GEOTransitSection _addNoFlagsTicketingSegment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsTicketingSegment:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)ticketingSegmentsCount
{
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  ticketingSegments = self->_ticketingSegments;

  return [(NSMutableArray *)ticketingSegments count];
}

- (id)ticketingSegmentAtIndex:(unint64_t)a3
{
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  ticketingSegments = self->_ticketingSegments;

  return (id)[(NSMutableArray *)ticketingSegments objectAtIndex:a3];
}

+ (Class)ticketingSegmentType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitSection;
  id v4 = [(GEOTransitSection *)&v8 description];
  id v5 = [(GEOTransitSection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 80))
    {
      id v5 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v6 = @"stepIndex";
      }
      else {
        objc_super v6 = @"step_index";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(_WORD *)(a1 + 132))
    {
      id v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 124)];
      if (a2) {
        objc_super v8 = @"nextOptionsIndex";
      }
      else {
        objc_super v8 = @"next_options_index";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 actionSheetName];
    if (v9)
    {
      if (a2) {
        v10 = @"actionSheetName";
      }
      else {
        v10 = @"action_sheet_name";
      }
      [v4 setObject:v9 forKey:v10];
    }

    if (*(void *)(a1 + 32))
    {
      v11 = PBRepeatedUInt32NSArray();
      if (a2) {
        v12 = @"actionSheetArtworkIndex";
      }
      else {
        v12 = @"action_sheet_artwork_index";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(void *)(a1 + 56))
    {
      v13 = PBRepeatedUInt32NSArray();
      if (a2) {
        v14 = @"routeDetailsArtworkIndex";
      }
      else {
        v14 = @"route_details_artwork_index";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if ((*(_WORD *)(a1 + 132) & 2) != 0)
    {
      v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 128)];
      if (a2) {
        v16 = @"disableAlightNotifications";
      }
      else {
        v16 = @"disable_alight_notifications";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([*(id *)(a1 + 104) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = *(id *)(a1 + 104);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"ticketingSegment";
      }
      else {
        v25 = @"ticketing_segment";
      }
      [v4 setObject:v17 forKey:v25];
    }
    v26 = *(void **)(a1 + 16);
    if (v26)
    {
      v27 = [v26 dictionaryRepresentation];
      v28 = v27;
      if (a2)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __47__GEOTransitSection__dictionaryRepresentation___block_invoke;
        v33[3] = &unk_1E53D8860;
        id v30 = v29;
        id v34 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v33];
        id v31 = v30;

        v28 = v31;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOTransitSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOTransitSection)initWithDictionary:(id)a3
{
  return (GEOTransitSection *)-[GEOTransitSection _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"stepIndex";
      }
      else {
        objc_super v6 = @"step_index";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v49 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v63 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addStepIndex:", objc_msgSend(v13, "unsignedIntValue"));
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
          }
          while (v10);
        }

        id v5 = v49;
      }

      if (a3) {
        v14 = @"nextOptionsIndex";
      }
      else {
        v14 = @"next_options_index";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNextOptionsIndex:", objc_msgSend(v15, "intValue"));
      }

      if (a3) {
        v16 = @"actionSheetName";
      }
      else {
        v16 = @"action_sheet_name";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = (void *)[v17 copy];
        [a1 setActionSheetName:v18];
      }
      if (a3) {
        uint64_t v19 = @"actionSheetArtworkIndex";
      }
      else {
        uint64_t v19 = @"action_sheet_artwork_index";
      }
      uint64_t v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v59 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v58 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addActionSheetArtworkIndex:", objc_msgSend(v26, "unsignedIntValue"));
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v23);
        }

        id v5 = v49;
      }

      if (a3) {
        v27 = @"routeDetailsArtworkIndex";
      }
      else {
        v27 = @"route_details_artwork_index";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v67 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v55;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v55 != v32) {
                objc_enumerationMutation(v29);
              }
              id v34 = *(void **)(*((void *)&v54 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addRouteDetailsArtworkIndex:", objc_msgSend(v34, "unsignedIntValue"));
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v54 objects:v67 count:16];
          }
          while (v31);
        }

        id v5 = v49;
      }

      if (a3) {
        long long v35 = @"disableAlightNotifications";
      }
      else {
        long long v35 = @"disable_alight_notifications";
      }
      long long v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDisableAlightNotifications:", objc_msgSend(v36, "BOOLValue"));
      }

      if (a3) {
        long long v37 = @"ticketingSegment";
      }
      else {
        long long v37 = @"ticketing_segment";
      }
      long long v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v51;
          do
          {
            for (uint64_t m = 0; m != v41; ++m)
            {
              if (*(void *)v51 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v50 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v45 = [GEOTransitTicketingSegment alloc];
                if (a3) {
                  uint64_t v46 = [(GEOTransitTicketingSegment *)v45 initWithJSON:v44];
                }
                else {
                  uint64_t v46 = [(GEOTransitTicketingSegment *)v45 initWithDictionary:v44];
                }
                v47 = (void *)v46;
                [a1 addTicketingSegment:v46];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v50 objects:v66 count:16];
          }
          while (v41);
        }

        id v5 = v49;
      }
    }
  }

  return a1;
}

- (GEOTransitSection)initWithJSON:(id)a3
{
  return (GEOTransitSection *)-[GEOTransitSection _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1266;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1267;
    }
    GEOTransitSectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitSectionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitSectionIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitSection *)self readAll:0];
    if (self->_stepIndexs.count)
    {
      uint64_t v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_stepIndexs.count)
      {
        unint64_t v6 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v6;
        }
        while (v6 < self->_stepIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_actionSheetName) {
      PBDataWriterWriteStringField();
    }
    if (self->_actionSheetArtworkIndexs.count)
    {
      uint64_t v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_actionSheetArtworkIndexs.count)
      {
        unint64_t v7 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v7;
        }
        while (v7 < self->_actionSheetArtworkIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_routeDetailsArtworkIndexs.count)
    {
      uint64_t v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_routeDetailsArtworkIndexs.count)
      {
        unint64_t v8 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v8;
        }
        while (v8 < self->_routeDetailsArtworkIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = self->_ticketingSegments;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
  }
}

- (void)copyTo:(id)a3
{
  long long v17 = (id *)a3;
  [(GEOTransitSection *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 28) = self->_readerMarkPos;
  *((_DWORD *)v17 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitSection *)self stepIndexsCount])
  {
    [v17 clearStepIndexs];
    unint64_t v4 = [(GEOTransitSection *)self stepIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v17, "addStepIndex:", -[GEOTransitSection stepIndexAtIndex:](self, "stepIndexAtIndex:", i));
    }
  }
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v17 + 31) = self->_nextOptionsIndex;
    *((_WORD *)v17 + 66) |= 1u;
  }
  if (self->_actionSheetName) {
    objc_msgSend(v17, "setActionSheetName:");
  }
  if ([(GEOTransitSection *)self actionSheetArtworkIndexsCount])
  {
    [v17 clearActionSheetArtworkIndexs];
    unint64_t v7 = [(GEOTransitSection *)self actionSheetArtworkIndexsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v17, "addActionSheetArtworkIndex:", -[GEOTransitSection actionSheetArtworkIndexAtIndex:](self, "actionSheetArtworkIndexAtIndex:", j));
    }
  }
  if ([(GEOTransitSection *)self routeDetailsArtworkIndexsCount])
  {
    [v17 clearRouteDetailsArtworkIndexs];
    unint64_t v10 = [(GEOTransitSection *)self routeDetailsArtworkIndexsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v17, "addRouteDetailsArtworkIndex:", -[GEOTransitSection routeDetailsArtworkIndexAtIndex:](self, "routeDetailsArtworkIndexAtIndex:", k));
    }
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v17 + 128) = self->_disableAlightNotifications;
    *((_WORD *)v17 + 66) |= 2u;
  }
  if ([(GEOTransitSection *)self ticketingSegmentsCount])
  {
    [v17 clearTicketingSegments];
    unint64_t v13 = [(GEOTransitSection *)self ticketingSegmentsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
      {
        long long v16 = [(GEOTransitSection *)self ticketingSegmentAtIndex:m];
        [v17 addTicketingSegment:v16];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitSection *)self readAll:0];
  PBRepeatedUInt32Copy();
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 124) = self->_nextOptionsIndex;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_actionSheetName copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v9;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 128) = self->_disableAlightNotifications;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v11 = self->_ticketingSegments;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addTicketingSegment:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  long long v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOTransitSection *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_16;
  }
  __int16 v5 = *((_WORD *)v4 + 66);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_nextOptionsIndex != *((_DWORD *)v4 + 31)) {
      goto LABEL_16;
    }
  }
  else if (v5)
  {
    goto LABEL_16;
  }
  actionSheetName = self->_actionSheetName;
  if ((unint64_t)actionSheetName | *((void *)v4 + 12)
    && !-[NSString isEqual:](actionSheetName, "isEqual:")
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_16;
  }
  __int16 v7 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_22;
    }
LABEL_16:
    char v8 = 0;
    goto LABEL_17;
  }
  if ((v7 & 2) == 0) {
    goto LABEL_16;
  }
  if (!self->_disableAlightNotifications)
  {
    if (!*((unsigned char *)v4 + 128)) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (!*((unsigned char *)v4 + 128)) {
    goto LABEL_16;
  }
LABEL_22:
  ticketingSegments = self->_ticketingSegments;
  if ((unint64_t)ticketingSegments | *((void *)v4 + 13)) {
    char v8 = -[NSMutableArray isEqual:](ticketingSegments, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  [(GEOTransitSection *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  if (*(_WORD *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_nextOptionsIndex;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_actionSheetName hash];
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_disableAlightNotifications;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ [(NSMutableArray *)self->_ticketingSegments hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 stepIndexsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOTransitSection addStepIndex:](self, "addStepIndex:", [v4 stepIndexAtIndex:i]);
  }
  if (*((_WORD *)v4 + 66))
  {
    self->_nextOptionsIndex = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 12)) {
    -[GEOTransitSection setActionSheetName:](self, "setActionSheetName:");
  }
  uint64_t v8 = [v4 actionSheetArtworkIndexsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[GEOTransitSection addActionSheetArtworkIndex:](self, "addActionSheetArtworkIndex:", [v4 actionSheetArtworkIndexAtIndex:j]);
  }
  uint64_t v11 = [v4 routeDetailsArtworkIndexsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[GEOTransitSection addRouteDetailsArtworkIndex:](self, "addRouteDetailsArtworkIndex:", [v4 routeDetailsArtworkIndexAtIndex:k]);
  }
  if ((*((_WORD *)v4 + 66) & 2) != 0)
  {
    self->_disableAlightNotifications = *((unsigned char *)v4 + 128);
    *(_WORD *)&self->_flags |= 2u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 13);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t m = 0; m != v16; ++m)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[GEOTransitSection addTicketingSegment:](self, "addTicketingSegment:", *(void *)(*((void *)&v19 + 1) + 8 * m), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitSectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1271);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitSection *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_ticketingSegments;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticketingSegments, 0);
  objc_storeStrong((id *)&self->_actionSheetName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end