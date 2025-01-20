@interface GEOLogMsgStatePlaceSummaryLayout
+ (BOOL)isValid:(id)a3;
+ (Class)dynamicContextHyperlinkDetailsType;
+ (Class)trailingEntityActionDetailsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStatePlaceSummaryLayout)init;
- (GEOLogMsgStatePlaceSummaryLayout)initWithData:(id)a3;
- (GEOLogMsgStatePlaceSummaryLayout)initWithDictionary:(id)a3;
- (GEOLogMsgStatePlaceSummaryLayout)initWithJSON:(id)a3;
- (NSMutableArray)dynamicContextHyperlinkDetails;
- (NSMutableArray)trailingEntityActionDetails;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dynamicContextHyperlinkDetailsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)trailingEntityActionDetailsAtIndex:(unint64_t)a3;
- (unint64_t)dynamicContextHyperlinkDetailsCount;
- (unint64_t)hash;
- (unint64_t)muids;
- (unint64_t)muidsAtIndex:(unint64_t)a3;
- (unint64_t)muidsCount;
- (unint64_t)trailingEntityActionDetailsCount;
- (void)_addNoFlagsDynamicContextHyperlinkDetails:(uint64_t)a1;
- (void)_addNoFlagsTrailingEntityActionDetails:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDynamicContextHyperlinkDetails;
- (void)_readMuids;
- (void)_readTrailingEntityActionDetails;
- (void)addDynamicContextHyperlinkDetails:(id)a3;
- (void)addMuids:(unint64_t)a3;
- (void)addTrailingEntityActionDetails:(id)a3;
- (void)clearDynamicContextHyperlinkDetails;
- (void)clearMuids;
- (void)clearTrailingEntityActionDetails;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDynamicContextHyperlinkDetails:(id)a3;
- (void)setMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTrailingEntityActionDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStatePlaceSummaryLayout

- (void)_readMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceSummaryLayoutReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuids_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOLogMsgStatePlaceSummaryLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  v2 = [(GEOLogMsgStatePlaceSummaryLayout *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStatePlaceSummaryLayout)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  id v3 = [(GEOLogMsgStatePlaceSummaryLayout *)&v7 initWithData:a3];
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
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  [(GEOLogMsgStatePlaceSummaryLayout *)&v3 dealloc];
}

- (unint64_t)muidsCount
{
  return self->_muids.count;
}

- (unint64_t)muids
{
  return self->_muids.list;
}

- (void)clearMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt64Clear();
}

- (void)addMuids:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unint64_t)muidsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceSummaryLayout _readMuids]((uint64_t)self);
  p_muids = &self->_muids;
  unint64_t count = self->_muids.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_muids->list[a3];
}

- (void)setMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147438](&self->_muids, a3, a4);
}

- (void)_readTrailingEntityActionDetails
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
        GEOLogMsgStatePlaceSummaryLayoutReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrailingEntityActionDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)trailingEntityActionDetails
{
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  trailingEntityActionDetails = self->_trailingEntityActionDetails;

  return trailingEntityActionDetails;
}

- (void)setTrailingEntityActionDetails:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  trailingEntityActionDetails = self->_trailingEntityActionDetails;
  self->_trailingEntityActionDetails = v4;
}

- (void)clearTrailingEntityActionDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  trailingEntityActionDetails = self->_trailingEntityActionDetails;

  [(NSMutableArray *)trailingEntityActionDetails removeAllObjects];
}

- (void)addTrailingEntityActionDetails:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  -[GEOLogMsgStatePlaceSummaryLayout _addNoFlagsTrailingEntityActionDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsTrailingEntityActionDetails:(uint64_t)a1
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

- (unint64_t)trailingEntityActionDetailsCount
{
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  trailingEntityActionDetails = self->_trailingEntityActionDetails;

  return [(NSMutableArray *)trailingEntityActionDetails count];
}

- (id)trailingEntityActionDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  trailingEntityActionDetails = self->_trailingEntityActionDetails;

  return (id)[(NSMutableArray *)trailingEntityActionDetails objectAtIndex:a3];
}

+ (Class)trailingEntityActionDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readDynamicContextHyperlinkDetails
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
        GEOLogMsgStatePlaceSummaryLayoutReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDynamicContextHyperlinkDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)dynamicContextHyperlinkDetails
{
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;

  return dynamicContextHyperlinkDetails;
}

- (void)setDynamicContextHyperlinkDetails:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;
  self->_dynamicContextHyperlinkDetails = v4;
}

- (void)clearDynamicContextHyperlinkDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;

  [(NSMutableArray *)dynamicContextHyperlinkDetails removeAllObjects];
}

- (void)addDynamicContextHyperlinkDetails:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  -[GEOLogMsgStatePlaceSummaryLayout _addNoFlagsDynamicContextHyperlinkDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsDynamicContextHyperlinkDetails:(uint64_t)a1
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

- (unint64_t)dynamicContextHyperlinkDetailsCount
{
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;

  return [(NSMutableArray *)dynamicContextHyperlinkDetails count];
}

- (id)dynamicContextHyperlinkDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;

  return (id)[(NSMutableArray *)dynamicContextHyperlinkDetails objectAtIndex:a3];
}

+ (Class)dynamicContextHyperlinkDetailsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  id v4 = [(GEOLogMsgStatePlaceSummaryLayout *)&v8 description];
  id v5 = [(GEOLogMsgStatePlaceSummaryLayout *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStatePlaceSummaryLayout _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v5 = PBRepeatedUInt64NSArray();
      [v4 setObject:v5 forKey:@"muids"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"trailingEntityActionDetails";
      }
      else {
        v14 = @"trailing_entity_action_details";
      }
      [v4 setObject:v6 forKey:v14];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = objc_msgSend(v21, "dictionaryRepresentation", (void)v25);
            }
            objc_msgSend(v15, "addObject:", v22, (void)v25);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v18);
      }

      if (a2) {
        v23 = @"dynamicContextHyperlinkDetails";
      }
      else {
        v23 = @"dynamic_context_hyperlink_details";
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v23, (void)v25);
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
  return -[GEOLogMsgStatePlaceSummaryLayout _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStatePlaceSummaryLayout)initWithDictionary:(id)a3
{
  return (GEOLogMsgStatePlaceSummaryLayout *)-[GEOLogMsgStatePlaceSummaryLayout _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"muids"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v45 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addMuids:", objc_msgSend(v12, "unsignedLongLongValue"));
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
          }
          while (v9);
        }
      }
      if (a3) {
        v13 = @"trailingEntityActionDetails";
      }
      else {
        v13 = @"trailing_entity_action_details";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v41 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEOTrailingEntityActionDetails alloc];
                if (a3) {
                  uint64_t v22 = [(GEOTrailingEntityActionDetails *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOTrailingEntityActionDetails *)v21 initWithDictionary:v20];
                }
                v23 = (void *)v22;
                [a1 addTrailingEntityActionDetails:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v17);
        }
      }
      if (a3) {
        v24 = @"dynamicContextHyperlinkDetails";
      }
      else {
        v24 = @"dynamic_context_hyperlink_details";
      }
      long long v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v37 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v32 = [GEODynamicContextHyperlinkDetails alloc];
                if (a3) {
                  uint64_t v33 = [(GEODynamicContextHyperlinkDetails *)v32 initWithJSON:v31];
                }
                else {
                  uint64_t v33 = [(GEODynamicContextHyperlinkDetails *)v32 initWithDictionary:v31];
                }
                v34 = (void *)v33;
                [a1 addDynamicContextHyperlinkDetails:v33];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v28);
        }
      }
    }
  }

  return a1;
}

- (GEOLogMsgStatePlaceSummaryLayout)initWithJSON:(id)a3
{
  return (GEOLogMsgStatePlaceSummaryLayout *)-[GEOLogMsgStatePlaceSummaryLayout _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_9071;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_9072;
    }
    GEOLogMsgStatePlaceSummaryLayoutReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStatePlaceSummaryLayoutCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStatePlaceSummaryLayoutIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStatePlaceSummaryLayoutReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
  {
    id v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStatePlaceSummaryLayout *)self readAll:0];
    if (self->_muids.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_muids.count);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_trailingEntityActionDetails;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = self->_dynamicContextHyperlinkDetails;
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
  }
}

- (void)copyTo:(id)a3
{
  id v15 = (id *)a3;
  [(GEOLogMsgStatePlaceSummaryLayout *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 14) = self->_readerMarkPos;
  *((_DWORD *)v15 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgStatePlaceSummaryLayout *)self muidsCount])
  {
    [v15 clearMuids];
    unint64_t v4 = [(GEOLogMsgStatePlaceSummaryLayout *)self muidsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v15, "addMuids:", -[GEOLogMsgStatePlaceSummaryLayout muidsAtIndex:](self, "muidsAtIndex:", i));
    }
  }
  if ([(GEOLogMsgStatePlaceSummaryLayout *)self trailingEntityActionDetailsCount])
  {
    [v15 clearTrailingEntityActionDetails];
    unint64_t v7 = [(GEOLogMsgStatePlaceSummaryLayout *)self trailingEntityActionDetailsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOLogMsgStatePlaceSummaryLayout *)self trailingEntityActionDetailsAtIndex:j];
        [v15 addTrailingEntityActionDetails:v10];
      }
    }
  }
  if ([(GEOLogMsgStatePlaceSummaryLayout *)self dynamicContextHyperlinkDetailsCount])
  {
    [v15 clearDynamicContextHyperlinkDetails];
    unint64_t v11 = [(GEOLogMsgStatePlaceSummaryLayout *)self dynamicContextHyperlinkDetailsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        v14 = [(GEOLogMsgStatePlaceSummaryLayout *)self dynamicContextHyperlinkDetailsAtIndex:k];
        [v15 addDynamicContextHyperlinkDetails:v14];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStatePlaceSummaryLayoutReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStatePlaceSummaryLayout *)self readAll:0];
  PBRepeatedUInt64Copy();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_trailingEntityActionDetails;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addTrailingEntityActionDetails:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_dynamicContextHyperlinkDetails;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (void)v19);
        [v5 addDynamicContextHyperlinkDetails:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOLogMsgStatePlaceSummaryLayout *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedUInt64IsEqual())
    && ((trailingEntityActionDetails = self->_trailingEntityActionDetails,
         !((unint64_t)trailingEntityActionDetails | v4[6]))
     || -[NSMutableArray isEqual:](trailingEntityActionDetails, "isEqual:")))
  {
    dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;
    if ((unint64_t)dynamicContextHyperlinkDetails | v4[5]) {
      char v7 = -[NSMutableArray isEqual:](dynamicContextHyperlinkDetails, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgStatePlaceSummaryLayout *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt64Hash();
  uint64_t v4 = [(NSMutableArray *)self->_trailingEntityActionDetails hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_dynamicContextHyperlinkDetails hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 muidsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOLogMsgStatePlaceSummaryLayout addMuids:](self, "addMuids:", [v4 muidsAtIndex:i]);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4[6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEOLogMsgStatePlaceSummaryLayout *)self addTrailingEntityActionDetails:*(void *)(*((void *)&v22 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v4[5];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOLogMsgStatePlaceSummaryLayout addDynamicContextHyperlinkDetails:](self, "addDynamicContextHyperlinkDetails:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingEntityActionDetails, 0);
  objc_storeStrong((id *)&self->_dynamicContextHyperlinkDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end