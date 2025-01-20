@interface GEOTransitSignInstruction
+ (BOOL)isValid:(id)a3;
+ (Class)commandFormattedType;
+ (Class)detailFormattedType;
+ (Class)noticeFormattedType;
+ (Class)priceFormattedType;
- (BOOL)_transit_hasAnyFieldSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitSignInstruction)init;
- (GEOTransitSignInstruction)initWithData:(id)a3;
- (GEOTransitSignInstruction)initWithDictionary:(id)a3;
- (GEOTransitSignInstruction)initWithJSON:(id)a3;
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
- (void)_readNoticeFormatteds;
- (void)_readPriceFormatteds;
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
- (void)setNoticeFormatteds:(id)a3;
- (void)setPriceFormatteds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitSignInstruction

- (GEOTransitSignInstruction)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitSignInstruction;
  v2 = [(GEOTransitSignInstruction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitSignInstruction)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitSignInstruction;
  v3 = [(GEOTransitSignInstruction *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCommandFormatteds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommandFormatteds_tags_8426);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)commandFormatteds
{
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
  commandFormatteds = self->_commandFormatteds;

  return commandFormatteds;
}

- (void)setCommandFormatteds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  commandFormatteds = self->_commandFormatteds;
  self->_commandFormatteds = v4;
}

- (void)clearCommandFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  commandFormatteds = self->_commandFormatteds;

  [(NSMutableArray *)commandFormatteds removeAllObjects];
}

- (void)addCommandFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsCommandFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
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
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
  commandFormatteds = self->_commandFormatteds;

  return [(NSMutableArray *)commandFormatteds count];
}

- (id)commandFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetailFormatteds_tags_8427);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)detailFormatteds
{
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
  detailFormatteds = self->_detailFormatteds;

  return detailFormatteds;
}

- (void)setDetailFormatteds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  detailFormatteds = self->_detailFormatteds;
  self->_detailFormatteds = v4;
}

- (void)clearDetailFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  detailFormatteds = self->_detailFormatteds;

  [(NSMutableArray *)detailFormatteds removeAllObjects];
}

- (void)addDetailFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsDetailFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
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
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
  detailFormatteds = self->_detailFormatteds;

  return [(NSMutableArray *)detailFormatteds count];
}

- (id)detailFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
  detailFormatteds = self->_detailFormatteds;

  return (id)[(NSMutableArray *)detailFormatteds objectAtIndex:a3];
}

+ (Class)detailFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readNoticeFormatteds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNoticeFormatteds_tags_8428);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)noticeFormatteds
{
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  noticeFormatteds = self->_noticeFormatteds;

  return noticeFormatteds;
}

- (void)setNoticeFormatteds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  noticeFormatteds = self->_noticeFormatteds;
  self->_noticeFormatteds = v4;
}

- (void)clearNoticeFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  noticeFormatteds = self->_noticeFormatteds;

  [(NSMutableArray *)noticeFormatteds removeAllObjects];
}

- (void)addNoticeFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsNoticeFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsNoticeFormatted:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)noticeFormattedsCount
{
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  noticeFormatteds = self->_noticeFormatteds;

  return [(NSMutableArray *)noticeFormatteds count];
}

- (id)noticeFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  noticeFormatteds = self->_noticeFormatteds;

  return (id)[(NSMutableArray *)noticeFormatteds objectAtIndex:a3];
}

+ (Class)noticeFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readPriceFormatteds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPriceFormatteds_tags_8429);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)priceFormatteds
{
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  priceFormatteds = self->_priceFormatteds;

  return priceFormatteds;
}

- (void)setPriceFormatteds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  priceFormatteds = self->_priceFormatteds;
  self->_priceFormatteds = v4;
}

- (void)clearPriceFormatteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  priceFormatteds = self->_priceFormatteds;

  [(NSMutableArray *)priceFormatteds removeAllObjects];
}

- (void)addPriceFormatted:(id)a3
{
  id v4 = a3;
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsPriceFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsPriceFormatted:(uint64_t)a1
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

- (unint64_t)priceFormattedsCount
{
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  priceFormatteds = self->_priceFormatteds;

  return [(NSMutableArray *)priceFormatteds count];
}

- (id)priceFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  priceFormatteds = self->_priceFormatteds;

  return (id)[(NSMutableArray *)priceFormatteds objectAtIndex:a3];
}

+ (Class)priceFormattedType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitSignInstruction;
  id v4 = [(GEOTransitSignInstruction *)&v8 description];
  id v5 = [(GEOTransitSignInstruction *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSignInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v63 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v62 objects:v69 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"commandFormatted";
      }
      else {
        v13 = @"command_formatted";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v59 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v58 objects:v68 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"detailFormatted";
      }
      else {
        v22 = @"detail_formatted";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v24 = *(id *)(a1 + 40);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v67 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v55;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v55 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v54 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v67 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"noticeFormatted";
      }
      else {
        v31 = @"notice_formatted";
      }
      [v4 setObject:v23 forKey:v31];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v33 = *(id *)(a1 + 48);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v51;
        do
        {
          for (uint64_t m = 0; m != v35; ++m)
          {
            if (*(void *)v51 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v50 + 1) + 8 * m);
            if (a2) {
              [v38 jsonRepresentation];
            }
            else {
            v39 = [v38 dictionaryRepresentation];
            }
            [v32 addObject:v39];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
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
    v41 = *(void **)(a1 + 16);
    if (v41)
    {
      v42 = [v41 dictionaryRepresentation];
      v43 = v42;
      if (a2)
      {
        v44 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v42, "count"));
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __55__GEOTransitSignInstruction__dictionaryRepresentation___block_invoke;
        v48[3] = &unk_1E53D8860;
        id v45 = v44;
        id v49 = v45;
        [v43 enumerateKeysAndObjectsUsingBlock:v48];
        id v46 = v45;

        v43 = v46;
      }
      [v4 setObject:v43 forKey:@"Unknown Fields"];
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
  return -[GEOTransitSignInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOTransitSignInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitSignInstruction)initWithDictionary:(id)a3
{
  return (GEOTransitSignInstruction *)-[GEOTransitSignInstruction _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"commandFormatted";
      }
      else {
        id v6 = @"command_formatted";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v51 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v71 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v65 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v64 + 1) + 8 * i);
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
                [a1 addCommandFormatted:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v64 objects:v71 count:16];
          }
          while (v10);
        }

        id v5 = v51;
      }

      if (a3) {
        uint64_t v17 = @"detailFormatted";
      }
      else {
        uint64_t v17 = @"detail_formatted";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v61 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v60 + 1) + 8 * j);
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
                [a1 addDetailFormatted:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v70 count:16];
          }
          while (v21);
        }

        id v5 = v51;
      }

      if (a3) {
        v28 = @"noticeFormatted";
      }
      else {
        v28 = @"notice_formatted";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v69 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v57 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v56 + 1) + 8 * k);
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
                [a1 addNoticeFormatted:v37];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v56 objects:v69 count:16];
          }
          while (v32);
        }

        id v5 = v51;
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
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v41 = v40;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v68 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v53;
          do
          {
            for (uint64_t m = 0; m != v43; ++m)
            {
              if (*(void *)v53 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v52 + 1) + 8 * m);
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
                id v49 = (void *)v48;
                [a1 addPriceFormatted:v48];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v52 objects:v68 count:16];
          }
          while (v43);
        }

        id v5 = v51;
      }
    }
  }

  return a1;
}

- (GEOTransitSignInstruction)initWithJSON:(id)a3
{
  return (GEOTransitSignInstruction *)-[GEOTransitSignInstruction _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_8430;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_8431;
    }
    GEOTransitSignInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitSignInstructionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSignInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSignInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitSignInstructionIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOTransitSignInstruction *)self readAll:0];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = self->_commandFormatteds;
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
    uint64_t v10 = self->_detailFormatteds;
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
    v14 = self->_noticeFormatteds;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v20 = (id *)a3;
  [(GEOTransitSignInstruction *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 14) = self->_readerMarkPos;
  *((_DWORD *)v20 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitSignInstruction *)self commandFormattedsCount])
  {
    [v20 clearCommandFormatteds];
    unint64_t v4 = [(GEOTransitSignInstruction *)self commandFormattedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitSignInstruction *)self commandFormattedAtIndex:i];
        [v20 addCommandFormatted:v7];
      }
    }
  }
  if ([(GEOTransitSignInstruction *)self detailFormattedsCount])
  {
    [v20 clearDetailFormatteds];
    unint64_t v8 = [(GEOTransitSignInstruction *)self detailFormattedsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTransitSignInstruction *)self detailFormattedAtIndex:j];
        [v20 addDetailFormatted:v11];
      }
    }
  }
  if ([(GEOTransitSignInstruction *)self noticeFormattedsCount])
  {
    [v20 clearNoticeFormatteds];
    unint64_t v12 = [(GEOTransitSignInstruction *)self noticeFormattedsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOTransitSignInstruction *)self noticeFormattedAtIndex:k];
        [v20 addNoticeFormatted:v15];
      }
    }
  }
  if ([(GEOTransitSignInstruction *)self priceFormattedsCount])
  {
    [v20 clearPriceFormatteds];
    unint64_t v16 = [(GEOTransitSignInstruction *)self priceFormattedsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOTransitSignInstruction *)self priceFormattedAtIndex:m];
        [v20 addPriceFormatted:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitSignInstructionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitSignInstruction *)self readAll:0];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v8 = self->_commandFormatteds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * i) copyWithZone:a3];
        [v5 addCommandFormatted:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v9);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v13 = self->_detailFormatteds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * j) copyWithZone:a3];
        [v5 addDetailFormatted:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v14);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v18 = self->_noticeFormatteds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * k) copyWithZone:a3];
        [v5 addNoticeFormatted:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v19);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v23 = self->_priceFormatteds;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * m), "copyWithZone:", a3, (void)v29);
        [v5 addPriceFormatted:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v24);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitSignInstruction *)self readAll:1],
         [v4 readAll:1],
         commandFormatteds = self->_commandFormatteds,
         !((unint64_t)commandFormatteds | v4[3]))
     || -[NSMutableArray isEqual:](commandFormatteds, "isEqual:"))
    && ((detailFormatteds = self->_detailFormatteds, !((unint64_t)detailFormatteds | v4[4]))
     || -[NSMutableArray isEqual:](detailFormatteds, "isEqual:"))
    && ((noticeFormatteds = self->_noticeFormatteds, !((unint64_t)noticeFormatteds | v4[5]))
     || -[NSMutableArray isEqual:](noticeFormatteds, "isEqual:")))
  {
    priceFormatteds = self->_priceFormatteds;
    if ((unint64_t)priceFormatteds | v4[6]) {
      char v9 = -[NSMutableArray isEqual:](priceFormatteds, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOTransitSignInstruction *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_commandFormatteds hash];
  uint64_t v4 = [(NSMutableArray *)self->_detailFormatteds hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_noticeFormatteds hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_priceFormatteds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOTransitSignInstruction *)self addCommandFormatted:*(void *)(*((void *)&v37 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v4[4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOTransitSignInstruction *)self addDetailFormatted:*(void *)(*((void *)&v33 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v4[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOTransitSignInstruction *)self addNoticeFormatted:*(void *)(*((void *)&v29 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v4[6];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[GEOTransitSignInstruction addPriceFormatted:](self, "addPriceFormatted:", *(void *)(*((void *)&v25 + 1) + 8 * v24++), (void)v25);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
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
      GEOTransitSignInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8435);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitSignInstruction *)self readAll:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v7 = self->_commandFormatteds;
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
    uint64_t v12 = self->_detailFormatteds;
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
    uint64_t v17 = self->_noticeFormatteds;
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
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceFormatteds, 0);
  objc_storeStrong((id *)&self->_noticeFormatteds, 0);
  objc_storeStrong((id *)&self->_detailFormatteds, 0);
  objc_storeStrong((id *)&self->_commandFormatteds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  return [(GEOTransitSignInstruction *)self noticeFormattedsCount]
      || [(GEOTransitSignInstruction *)self commandFormattedsCount]
      || [(GEOTransitSignInstruction *)self detailFormattedsCount]
      || [(GEOTransitSignInstruction *)self priceFormattedsCount] != 0;
}

- (void)_transit_mergeFrom:(id)a3
{
  id v44 = a3;
  uint64_t v4 = [(GEOTransitSignInstruction *)self noticeFormatteds];
  id v5 = [v44 noticeFormatteds];
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
  [(GEOTransitSignInstruction *)self setNoticeFormatteds:v11];

  uint64_t v14 = [(GEOTransitSignInstruction *)self commandFormatteds];
  uint64_t v15 = [v44 commandFormatteds];
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
    uint64_t v22 = [v19 dictionaryRepresentation];
    uint64_t v23 = [v22 count];

    if (v23) {
      goto LABEL_32;
    }
  }
  id v21 = 0;
LABEL_36:

LABEL_37:
  [(GEOTransitSignInstruction *)self setCommandFormatteds:v21];

  uint64_t v24 = [(GEOTransitSignInstruction *)self detailFormatteds];
  uint64_t v25 = [v44 detailFormatteds];
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
    long long v32 = [v29 dictionaryRepresentation];
    uint64_t v33 = [v32 count];

    if (v33) {
      goto LABEL_50;
    }
  }
  id v31 = 0;
LABEL_54:

LABEL_55:
  [(GEOTransitSignInstruction *)self setDetailFormatteds:v31];

  long long v34 = [(GEOTransitSignInstruction *)self priceFormatteds];
  long long v35 = [v44 priceFormatteds];
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
    long long v42 = [v39 dictionaryRepresentation];
    uint64_t v43 = [v42 count];

    if (v43) {
      goto LABEL_68;
    }
  }
  id v41 = 0;
LABEL_72:

LABEL_73:
  [(GEOTransitSignInstruction *)self setPriceFormatteds:v41];
}

@end