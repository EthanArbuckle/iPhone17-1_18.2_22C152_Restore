@interface GEOTransitListInstruction
+ (BOOL)isValid:(id)a3;
+ (Class)commandFormattedType;
+ (Class)detailFormattedType;
+ (Class)noticeFormattedType;
+ (Class)priceFormattedType;
- (BOOL)_transit_hasAnyFieldSet;
- (BOOL)hasExpandableListFormatted;
- (BOOL)hasTimeInstructions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)expandableListFormatted;
- (GEOTransitListInstruction)init;
- (GEOTransitListInstruction)initWithData:(id)a3;
- (GEOTransitListInstruction)initWithDictionary:(id)a3;
- (GEOTransitListInstruction)initWithJSON:(id)a3;
- (GEOTransitListTimeInstruction)timeInstructions;
- (NSMutableArray)commandFormatteds;
- (NSMutableArray)detailFormatteds;
- (NSMutableArray)noticeFormatteds;
- (NSMutableArray)priceFormatteds;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)commandFormattedAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)detailFormattedAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)noticeFormattedAtIndex:(unint64_t)a3;
- (id)priceFormattedAtIndex:(unint64_t)a3;
- (unint64_t)commandFormattedsCount;
- (unint64_t)detailFormattedsCount;
- (unint64_t)hash;
- (unint64_t)noticeFormattedsCount;
- (unint64_t)priceFormattedsCount;
- (void)_addNoFlagsCommandFormatted:(uint64_t)a1;
- (void)_addNoFlagsDetailFormatted:(uint64_t)a1;
- (void)_addNoFlagsNoticeFormatted:(uint64_t)a1;
- (void)_addNoFlagsPriceFormatted:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCommandFormatteds;
- (void)_readDetailFormatteds;
- (void)_readExpandableListFormatted;
- (void)_readNoticeFormatteds;
- (void)_readPriceFormatteds;
- (void)_readTimeInstructions;
- (void)_transit_mergeFrom:(id)a3;
- (void)addCommandFormatted:(id)a3;
- (void)addDetailFormatted:(id)a3;
- (void)addNoticeFormatted:(id)a3;
- (void)addPriceFormatted:(id)a3;
- (void)clearCommandFormatteds;
- (void)clearDetailFormatteds;
- (void)clearNoticeFormatteds;
- (void)clearPriceFormatteds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCommandFormatteds:(id)a3;
- (void)setDetailFormatteds:(id)a3;
- (void)setExpandableListFormatted:(id)a3;
- (void)setNoticeFormatteds:(id)a3;
- (void)setPriceFormatteds:(id)a3;
- (void)setTimeInstructions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitListInstruction

- (GEOTransitListInstruction)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitListInstruction;
  v2 = [(GEOTransitListInstruction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitListInstruction)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitListInstruction;
  v3 = [(GEOTransitListInstruction *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readNoticeFormatteds
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
        GEOTransitListInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNoticeFormatteds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)noticeFormatteds
{
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  noticeFormatteds = self->_noticeFormatteds;

  return noticeFormatteds;
}

- (void)setNoticeFormatteds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  noticeFormatteds = self->_noticeFormatteds;
  self->_noticeFormatteds = v4;
}

- (void)clearNoticeFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  noticeFormatteds = self->_noticeFormatteds;

  [(NSMutableArray *)noticeFormatteds removeAllObjects];
}

- (void)addNoticeFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsNoticeFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsNoticeFormatted:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)noticeFormattedsCount
{
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  noticeFormatteds = self->_noticeFormatteds;

  return [(NSMutableArray *)noticeFormatteds count];
}

- (id)noticeFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  noticeFormatteds = self->_noticeFormatteds;

  return (id)[(NSMutableArray *)noticeFormatteds objectAtIndex:a3];
}

+ (Class)noticeFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readCommandFormatteds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommandFormatteds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)commandFormatteds
{
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  commandFormatteds = self->_commandFormatteds;

  return commandFormatteds;
}

- (void)setCommandFormatteds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  commandFormatteds = self->_commandFormatteds;
  self->_commandFormatteds = v4;
}

- (void)clearCommandFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  commandFormatteds = self->_commandFormatteds;

  [(NSMutableArray *)commandFormatteds removeAllObjects];
}

- (void)addCommandFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsCommandFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsCommandFormatted:(uint64_t)a1
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

- (unint64_t)commandFormattedsCount
{
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  commandFormatteds = self->_commandFormatteds;

  return [(NSMutableArray *)commandFormatteds count];
}

- (id)commandFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  commandFormatteds = self->_commandFormatteds;

  return (id)[(NSMutableArray *)commandFormatteds objectAtIndex:a3];
}

+ (Class)commandFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readDetailFormatteds
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
        GEOTransitListInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetailFormatteds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)detailFormatteds
{
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  detailFormatteds = self->_detailFormatteds;

  return detailFormatteds;
}

- (void)setDetailFormatteds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  detailFormatteds = self->_detailFormatteds;
  self->_detailFormatteds = v4;
}

- (void)clearDetailFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  detailFormatteds = self->_detailFormatteds;

  [(NSMutableArray *)detailFormatteds removeAllObjects];
}

- (void)addDetailFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsDetailFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsDetailFormatted:(uint64_t)a1
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

- (unint64_t)detailFormattedsCount
{
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  detailFormatteds = self->_detailFormatteds;

  return [(NSMutableArray *)detailFormatteds count];
}

- (id)detailFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  detailFormatteds = self->_detailFormatteds;

  return (id)[(NSMutableArray *)detailFormatteds objectAtIndex:a3];
}

+ (Class)detailFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readPriceFormatteds
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
        GEOTransitListInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPriceFormatteds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)priceFormatteds
{
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  priceFormatteds = self->_priceFormatteds;

  return priceFormatteds;
}

- (void)setPriceFormatteds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  priceFormatteds = self->_priceFormatteds;
  self->_priceFormatteds = v4;
}

- (void)clearPriceFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  priceFormatteds = self->_priceFormatteds;

  [(NSMutableArray *)priceFormatteds removeAllObjects];
}

- (void)addPriceFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsPriceFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsPriceFormatted:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)priceFormattedsCount
{
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  priceFormatteds = self->_priceFormatteds;

  return [(NSMutableArray *)priceFormatteds count];
}

- (id)priceFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  priceFormatteds = self->_priceFormatteds;

  return (id)[(NSMutableArray *)priceFormatteds objectAtIndex:a3];
}

+ (Class)priceFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readExpandableListFormatted
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
        GEOTransitListInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExpandableListFormatted_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasExpandableListFormatted
{
  return self->_expandableListFormatted != 0;
}

- (GEOFormattedString)expandableListFormatted
{
  -[GEOTransitListInstruction _readExpandableListFormatted]((uint64_t)self);
  expandableListFormatted = self->_expandableListFormatted;

  return expandableListFormatted;
}

- (void)setExpandableListFormatted:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_expandableListFormatted, a3);
}

- (void)_readTimeInstructions
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
        GEOTransitListInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeInstructions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTimeInstructions
{
  return self->_timeInstructions != 0;
}

- (GEOTransitListTimeInstruction)timeInstructions
{
  -[GEOTransitListInstruction _readTimeInstructions]((uint64_t)self);
  timeInstructions = self->_timeInstructions;

  return timeInstructions;
}

- (void)setTimeInstructions:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_timeInstructions, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitListInstruction;
  id v4 = [(GEOTransitListInstruction *)&v8 description];
  id v5 = [(GEOTransitListInstruction *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitListInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 48) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v70 objects:v77 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v71 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v70 objects:v77 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"noticeFormatted";
      }
      else {
        v13 = @"notice_formatted";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v15 = *(id *)(a1 + 24);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v67 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v66 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v66 objects:v76 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"commandFormatted";
      }
      else {
        v22 = @"command_formatted";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v24 = *(id *)(a1 + 32);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v62 objects:v75 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v63;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v63 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v62 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v62 objects:v75 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"detailFormatted";
      }
      else {
        v31 = @"detail_formatted";
      }
      [v4 setObject:v23 forKey:v31];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v33 = *(id *)(a1 + 56);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:v74 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v59;
        do
        {
          for (uint64_t m = 0; m != v35; ++m)
          {
            if (*(void *)v59 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v58 + 1) + 8 * m);
            if (a2) {
              [v38 jsonRepresentation];
            }
            else {
            v39 = [v38 dictionaryRepresentation];
            }
            [v32 addObject:v39];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v74 count:16];
        }
        while (v35);
      }

      if (a2) {
        v40 = @"priceFormatted";
      }
      else {
        v40 = @"price_formatted";
      }
      [v4 setObject:v32 forKey:v40];
    }
    v41 = [(id)a1 expandableListFormatted];
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        v43 = [v41 jsonRepresentation];
        v44 = @"expandableListFormatted";
      }
      else
      {
        v43 = [v41 dictionaryRepresentation];
        v44 = @"expandable_list_formatted";
      }
      [v4 setObject:v43 forKey:v44];
    }
    v45 = [(id)a1 timeInstructions];
    v46 = v45;
    if (v45)
    {
      if (a2)
      {
        v47 = [v45 jsonRepresentation];
        v48 = @"timeInstructions";
      }
      else
      {
        v47 = [v45 dictionaryRepresentation];
        v48 = @"time_instructions";
      }
      [v4 setObject:v47 forKey:v48];
    }
    v49 = *(void **)(a1 + 16);
    if (v49)
    {
      v50 = [v49 dictionaryRepresentation];
      v51 = v50;
      if (a2)
      {
        v52 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __55__GEOTransitListInstruction__dictionaryRepresentation___block_invoke;
        v56[3] = &unk_1E53D8860;
        id v53 = v52;
        id v57 = v53;
        [v51 enumerateKeysAndObjectsUsingBlock:v56];
        id v54 = v53;

        v51 = v54;
      }
      [v4 setObject:v51 forKey:@"Unknown Fields"];
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
  return -[GEOTransitListInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOTransitListInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitListInstruction)initWithDictionary:(id)a3
{
  return (GEOTransitListInstruction *)-[GEOTransitListInstruction _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"noticeFormatted";
      }
      else {
        id v6 = @"notice_formatted";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v61 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v74 objects:v81 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v75 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v15 = [(GEOFormattedString *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOFormattedString *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addNoticeFormatted:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v74 objects:v81 count:16];
          }
          while (v10);
        }

        id v5 = v61;
      }

      if (a3) {
        uint64_t v17 = @"commandFormatted";
      }
      else {
        uint64_t v17 = @"command_formatted";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v70 objects:v80 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v71 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v70 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v25 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v26 = [(GEOFormattedString *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOFormattedString *)v25 initWithDictionary:v24];
                }
                uint64_t v27 = (void *)v26;
                [a1 addCommandFormatted:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v70 objects:v80 count:16];
          }
          while (v21);
        }

        id v5 = v61;
      }

      if (a3) {
        v28 = @"detailFormatted";
      }
      else {
        v28 = @"detail_formatted";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v79 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v67;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v67 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v66 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v36 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v37 = [(GEOFormattedString *)v36 initWithJSON:v35];
                }
                else {
                  uint64_t v37 = [(GEOFormattedString *)v36 initWithDictionary:v35];
                }
                v38 = (void *)v37;
                [a1 addDetailFormatted:v37];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v66 objects:v79 count:16];
          }
          while (v32);
        }

        id v5 = v61;
      }

      if (a3) {
        v39 = @"priceFormatted";
      }
      else {
        v39 = @"price_formatted";
      }
      v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v41 = v40;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v78 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v63;
          do
          {
            for (uint64_t m = 0; m != v43; ++m)
            {
              if (*(void *)v63 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v62 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v47 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v48 = [(GEOFormattedString *)v47 initWithJSON:v46];
                }
                else {
                  uint64_t v48 = [(GEOFormattedString *)v47 initWithDictionary:v46];
                }
                v49 = (void *)v48;
                [a1 addPriceFormatted:v48];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v62 objects:v78 count:16];
          }
          while (v43);
        }

        id v5 = v61;
      }

      if (a3) {
        v50 = @"expandableListFormatted";
      }
      else {
        v50 = @"expandable_list_formatted";
      }
      v51 = [v5 objectForKeyedSubscript:v50];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v52 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v53 = [(GEOFormattedString *)v52 initWithJSON:v51];
        }
        else {
          uint64_t v53 = [(GEOFormattedString *)v52 initWithDictionary:v51];
        }
        id v54 = (void *)v53;
        [a1 setExpandableListFormatted:v53];
      }
      if (a3) {
        v55 = @"timeInstructions";
      }
      else {
        v55 = @"time_instructions";
      }
      v56 = [v5 objectForKeyedSubscript:v55];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v57 = [GEOTransitListTimeInstruction alloc];
        if (a3) {
          uint64_t v58 = [(GEOTransitListTimeInstruction *)v57 initWithJSON:v56];
        }
        else {
          uint64_t v58 = [(GEOTransitListTimeInstruction *)v57 initWithDictionary:v56];
        }
        long long v59 = (void *)v58;
        [a1 setTimeInstructions:v58];
      }
    }
  }

  return a1;
}

- (GEOTransitListInstruction)initWithJSON:(id)a3
{
  return (GEOTransitListInstruction *)-[GEOTransitListInstruction _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_8228;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_8229;
    }
    GEOTransitListInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitListInstructionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitListInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitListInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitListInstructionIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v22 = self->_reader;
    objc_sync_enter(v22);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v23 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v23];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitListInstruction *)self readAll:0];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = self->_noticeFormatteds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v7);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v10 = self->_commandFormatteds;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v11);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v14 = self->_detailFormatteds;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v15);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v18 = self->_priceFormatteds;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
      }
      while (v19);
    }

    if (self->_expandableListFormatted) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_timeInstructions) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v21 = (id *)a3;
  [(GEOTransitListInstruction *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v21 + 1, self->_reader);
  *((_DWORD *)v21 + 18) = self->_readerMarkPos;
  *((_DWORD *)v21 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitListInstruction *)self noticeFormattedsCount])
  {
    [v21 clearNoticeFormatteds];
    unint64_t v4 = [(GEOTransitListInstruction *)self noticeFormattedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitListInstruction *)self noticeFormattedAtIndex:i];
        [v21 addNoticeFormatted:v7];
      }
    }
  }
  if ([(GEOTransitListInstruction *)self commandFormattedsCount])
  {
    [v21 clearCommandFormatteds];
    unint64_t v8 = [(GEOTransitListInstruction *)self commandFormattedsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTransitListInstruction *)self commandFormattedAtIndex:j];
        [v21 addCommandFormatted:v11];
      }
    }
  }
  if ([(GEOTransitListInstruction *)self detailFormattedsCount])
  {
    [v21 clearDetailFormatteds];
    unint64_t v12 = [(GEOTransitListInstruction *)self detailFormattedsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOTransitListInstruction *)self detailFormattedAtIndex:k];
        [v21 addDetailFormatted:v15];
      }
    }
  }
  if ([(GEOTransitListInstruction *)self priceFormattedsCount])
  {
    [v21 clearPriceFormatteds];
    unint64_t v16 = [(GEOTransitListInstruction *)self priceFormattedsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOTransitListInstruction *)self priceFormattedAtIndex:m];
        [v21 addPriceFormatted:v19];
      }
    }
  }
  if (self->_expandableListFormatted) {
    objc_msgSend(v21, "setExpandableListFormatted:");
  }
  uint64_t v20 = v21;
  if (self->_timeInstructions)
  {
    objc_msgSend(v21, "setTimeInstructions:");
    uint64_t v20 = v21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitListInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitListInstruction *)self readAll:0];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v8 = self->_noticeFormatteds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addNoticeFormatted:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v9);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v13 = self->_commandFormatteds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v13);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addCommandFormatted:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v14);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v18 = self->_detailFormatteds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addDetailFormatted:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v19);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v23 = self->_priceFormatteds;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * m), "copyWithZone:", a3, (void)v33);
        [(id)v5 addPriceFormatted:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v24);
  }

  id v28 = [(GEOFormattedString *)self->_expandableListFormatted copyWithZone:a3];
  long long v29 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v28;

  id v30 = [(GEOTransitListTimeInstruction *)self->_timeInstructions copyWithZone:a3];
  long long v31 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v30;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitListInstruction *)self readAll:1],
         [v4 readAll:1],
         noticeFormatteds = self->_noticeFormatteds,
         !((unint64_t)noticeFormatteds | v4[6]))
     || -[NSMutableArray isEqual:](noticeFormatteds, "isEqual:"))
    && ((commandFormatteds = self->_commandFormatteds, !((unint64_t)commandFormatteds | v4[3]))
     || -[NSMutableArray isEqual:](commandFormatteds, "isEqual:"))
    && ((detailFormatteds = self->_detailFormatteds, !((unint64_t)detailFormatteds | v4[4]))
     || -[NSMutableArray isEqual:](detailFormatteds, "isEqual:"))
    && ((priceFormatteds = self->_priceFormatteds, !((unint64_t)priceFormatteds | v4[7]))
     || -[NSMutableArray isEqual:](priceFormatteds, "isEqual:"))
    && ((expandableListFormatted = self->_expandableListFormatted, !((unint64_t)expandableListFormatted | v4[5]))
     || -[GEOFormattedString isEqual:](expandableListFormatted, "isEqual:")))
  {
    timeInstructions = self->_timeInstructions;
    if ((unint64_t)timeInstructions | v4[8]) {
      char v11 = -[GEOTransitListTimeInstruction isEqual:](timeInstructions, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEOTransitListInstruction *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_noticeFormatteds hash];
  uint64_t v4 = [(NSMutableArray *)self->_commandFormatteds hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_detailFormatteds hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_priceFormatteds hash];
  unint64_t v7 = [(GEOFormattedString *)self->_expandableListFormatted hash];
  return v6 ^ v7 ^ [(GEOTransitListTimeInstruction *)self->_timeInstructions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v4[6];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOTransitListInstruction *)self addNoticeFormatted:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v7);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOTransitListInstruction *)self addCommandFormatted:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v12);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v4[4];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOTransitListInstruction *)self addDetailFormatted:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v17);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v4[7];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        -[GEOTransitListInstruction addPriceFormatted:](self, "addPriceFormatted:", *(void *)(*((void *)&v29 + 1) + 8 * m), (void)v29);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v22);
  }

  expandableListFormatted = self->_expandableListFormatted;
  id v26 = v4[5];
  if (expandableListFormatted)
  {
    if (v26) {
      -[GEOFormattedString mergeFrom:](expandableListFormatted, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOTransitListInstruction setExpandableListFormatted:](self, "setExpandableListFormatted:");
  }
  timeInstructions = self->_timeInstructions;
  id v28 = v4[8];
  if (timeInstructions)
  {
    if (v28) {
      -[GEOTransitListTimeInstruction mergeFrom:](timeInstructions, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEOTransitListInstruction setTimeInstructions:](self, "setTimeInstructions:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTransitListInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8233);
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitListInstruction *)self readAll:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v7 = self->_noticeFormatteds;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v9);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = self->_commandFormatteds;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v14);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v17 = self->_detailFormatteds;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v19);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v22 = self->_priceFormatteds;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (void)v27);
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v24);
    }

    [(GEOFormattedString *)self->_expandableListFormatted clearUnknownFields:1];
    [(GEOTransitListTimeInstruction *)self->_timeInstructions clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInstructions, 0);
  objc_storeStrong((id *)&self->_priceFormatteds, 0);
  objc_storeStrong((id *)&self->_noticeFormatteds, 0);
  objc_storeStrong((id *)&self->_expandableListFormatted, 0);
  objc_storeStrong((id *)&self->_detailFormatteds, 0);
  objc_storeStrong((id *)&self->_commandFormatteds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  if ([(GEOTransitListInstruction *)self noticeFormattedsCount]
    || [(GEOTransitListInstruction *)self commandFormattedsCount]
    || [(GEOTransitListInstruction *)self detailFormattedsCount]
    || [(GEOTransitListInstruction *)self priceFormattedsCount]
    || [(GEOTransitListInstruction *)self hasExpandableListFormatted])
  {
    return 1;
  }

  return [(GEOTransitListInstruction *)self hasTimeInstructions];
}

- (void)_transit_mergeFrom:(id)a3
{
  id v70 = a3;
  uint64_t v4 = [(GEOTransitListInstruction *)self noticeFormatteds];
  id v5 = [v70 noticeFormatteds];
  id v6 = v4;
  id v7 = v5;
  if (!v7)
  {
    id v12 = v6;
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
  id v10 = (id)_MergedGlobals_223;
  if ([v9 conformsToProtocol:v10])
  {
    char v11 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if (v11)
    {
LABEL_14:
      if ([v9 conformsToProtocol:v8]
        && [v6 conformsToProtocol:v8])
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        id v9 = v6;
      }
      id v12 = v9;
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
    uint64_t v13 = [v9 dictionaryRepresentation];
    uint64_t v14 = [v13 count];

    if (v14) {
      goto LABEL_14;
    }
  }
  id v12 = 0;
LABEL_18:

LABEL_19:
  [(GEOTransitListInstruction *)self setNoticeFormatteds:v12];

  uint64_t v15 = [(GEOTransitListInstruction *)self commandFormatteds];
  uint64_t v16 = [v70 commandFormatteds];
  id v17 = v15;
  id v18 = v16;
  if (!v18)
  {
    id v23 = v17;
    goto LABEL_37;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v19 = (id)_MergedGlobals_223;
  id v20 = v18;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v21 = (id)_MergedGlobals_223;
  if ([v20 conformsToProtocol:v21])
  {
    char v22 = objc_msgSend(v20, "_transit_hasAnyFieldSet");

    if (v22)
    {
LABEL_32:
      if ([v20 conformsToProtocol:v19]
        && [v17 conformsToProtocol:v19])
      {
        objc_msgSend(v17, "_transit_mergeFrom:", v20);
        id v20 = v17;
      }
      id v23 = v20;
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
    uint64_t v24 = [v20 dictionaryRepresentation];
    uint64_t v25 = [v24 count];

    if (v25) {
      goto LABEL_32;
    }
  }
  id v23 = 0;
LABEL_36:

LABEL_37:
  [(GEOTransitListInstruction *)self setCommandFormatteds:v23];

  uint64_t v26 = [(GEOTransitListInstruction *)self detailFormatteds];
  long long v27 = [v70 detailFormatteds];
  id v28 = v26;
  id v29 = v27;
  if (!v29)
  {
    id v34 = v28;
    goto LABEL_55;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v30 = (id)_MergedGlobals_223;
  id v31 = v29;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v32 = (id)_MergedGlobals_223;
  if ([v31 conformsToProtocol:v32])
  {
    char v33 = objc_msgSend(v31, "_transit_hasAnyFieldSet");

    if (v33)
    {
LABEL_50:
      if ([v31 conformsToProtocol:v30]
        && [v28 conformsToProtocol:v30])
      {
        objc_msgSend(v28, "_transit_mergeFrom:", v31);
        id v31 = v28;
      }
      id v34 = v31;
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
    long long v35 = [v31 dictionaryRepresentation];
    uint64_t v36 = [v35 count];

    if (v36) {
      goto LABEL_50;
    }
  }
  id v34 = 0;
LABEL_54:

LABEL_55:
  [(GEOTransitListInstruction *)self setDetailFormatteds:v34];

  long long v37 = [(GEOTransitListInstruction *)self priceFormatteds];
  long long v38 = [v70 priceFormatteds];
  id v39 = v37;
  id v40 = v38;
  if (!v40)
  {
    id v45 = v39;
    goto LABEL_73;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v41 = (id)_MergedGlobals_223;
  id v42 = v40;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v43 = (id)_MergedGlobals_223;
  if ([v42 conformsToProtocol:v43])
  {
    char v44 = objc_msgSend(v42, "_transit_hasAnyFieldSet");

    if (v44)
    {
LABEL_68:
      if ([v42 conformsToProtocol:v41]
        && [v39 conformsToProtocol:v41])
      {
        objc_msgSend(v39, "_transit_mergeFrom:", v42);
        id v42 = v39;
      }
      id v45 = v42;
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
    long long v46 = [v42 dictionaryRepresentation];
    uint64_t v47 = [v46 count];

    if (v47) {
      goto LABEL_68;
    }
  }
  id v45 = 0;
LABEL_72:

LABEL_73:
  [(GEOTransitListInstruction *)self setPriceFormatteds:v45];

  long long v48 = [(GEOTransitListInstruction *)self expandableListFormatted];
  uint64_t v49 = [v70 expandableListFormatted];
  id v50 = v48;
  id v51 = v49;
  if (!v51)
  {
    id v56 = v50;
    goto LABEL_91;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v52 = (id)_MergedGlobals_223;
  id v53 = v51;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v54 = (id)_MergedGlobals_223;
  if ([v53 conformsToProtocol:v54])
  {
    char v55 = objc_msgSend(v53, "_transit_hasAnyFieldSet");

    if (v55)
    {
LABEL_86:
      if ([v53 conformsToProtocol:v52]
        && [v50 conformsToProtocol:v52])
      {
        objc_msgSend(v50, "_transit_mergeFrom:", v53);
        id v53 = v50;
      }
      id v56 = v53;
      goto LABEL_90;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_86;
    }
    id v57 = [v53 dictionaryRepresentation];
    uint64_t v58 = [v57 count];

    if (v58) {
      goto LABEL_86;
    }
  }
  id v56 = 0;
LABEL_90:

LABEL_91:
  [(GEOTransitListInstruction *)self setExpandableListFormatted:v56];

  long long v59 = [(GEOTransitListInstruction *)self timeInstructions];
  long long v60 = [v70 timeInstructions];
  id v61 = v59;
  id v62 = v60;
  if (!v62)
  {
    id v67 = v61;
    goto LABEL_109;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v63 = (id)_MergedGlobals_223;
  id v64 = v62;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v65 = (id)_MergedGlobals_223;
  if ([v64 conformsToProtocol:v65])
  {
    char v66 = objc_msgSend(v64, "_transit_hasAnyFieldSet");

    if (v66)
    {
LABEL_104:
      if ([v64 conformsToProtocol:v63]
        && [v61 conformsToProtocol:v63])
      {
        objc_msgSend(v61, "_transit_mergeFrom:", v64);
        id v64 = v61;
      }
      id v67 = v64;
      goto LABEL_108;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_104;
    }
    long long v68 = [v64 dictionaryRepresentation];
    uint64_t v69 = [v68 count];

    if (v69) {
      goto LABEL_104;
    }
  }
  id v67 = 0;
LABEL_108:

LABEL_109:
  [(GEOTransitListInstruction *)self setTimeInstructions:v67];
}

@end