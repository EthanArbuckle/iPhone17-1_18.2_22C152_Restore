@interface GEOPDPlaceSummaryLayoutTemplateEntry
+ (BOOL)isValid:(id)a3;
+ (Class)lineType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlatformType;
- (BOOL)hasTrailingEntityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutTemplateEntry)init;
- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithData:(id)a3;
- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithJSON:(id)a3;
- (NSMutableArray)lines;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)lineAtIndex:(unint64_t)a3;
- (id)platformTypeAsString:(int)a3;
- (id)trailingEntityTypeAsString:(int)a3;
- (id)trailingEntityTypeOrdersAsString:(int)a3;
- (int)StringAsPlatformType:(id)a3;
- (int)StringAsTrailingEntityType:(id)a3;
- (int)StringAsTrailingEntityTypeOrders:(id)a3;
- (int)platformType;
- (int)trailingEntityType;
- (int)trailingEntityTypeOrderAtIndex:(unint64_t)a3;
- (int)trailingEntityTypeOrders;
- (unint64_t)hash;
- (unint64_t)linesCount;
- (unint64_t)trailingEntityTypeOrdersCount;
- (void)_addNoFlagsLine:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLines;
- (void)_readTrailingEntityTypeOrders;
- (void)addLine:(id)a3;
- (void)addTrailingEntityTypeOrder:(int)a3;
- (void)clearLines;
- (void)clearTrailingEntityTypeOrders;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasPlatformType:(BOOL)a3;
- (void)setHasTrailingEntityType:(BOOL)a3;
- (void)setLines:(id)a3;
- (void)setPlatformType:(int)a3;
- (void)setTrailingEntityType:(int)a3;
- (void)setTrailingEntityTypeOrders:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutTemplateEntry

- (GEOPDPlaceSummaryLayoutTemplateEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  v2 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  v3 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  [(GEOPDPlaceSummaryLayoutTemplateEntry *)&v3 dealloc];
}

- (int)platformType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_platformType;
  }
  else {
    return 0;
  }
}

- (void)setPlatformType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_platformType = a3;
}

- (void)setHasPlatformType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasPlatformType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)platformTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53E6238[a3];
  }

  return v3;
}

- (int)StringAsPlatformType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLATFORM_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLATFORM_TYPE_IOS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLATFORM_TYPE_MACOS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLATFORM_TYPE_ANY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLines
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutTemplateEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLines_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)lines
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  lines = self->_lines;

  return lines;
}

- (void)setLines:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  lines = self->_lines;
  self->_lines = v4;
}

- (void)clearLines
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  lines = self->_lines;

  [(NSMutableArray *)lines removeAllObjects];
}

- (void)addLine:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutTemplateEntry _addNoFlagsLine:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLine:(uint64_t)a1
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

- (unint64_t)linesCount
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  lines = self->_lines;

  return [(NSMutableArray *)lines count];
}

- (id)lineAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  lines = self->_lines;

  return (id)[(NSMutableArray *)lines objectAtIndex:a3];
}

+ (Class)lineType
{
  return (Class)objc_opt_class();
}

- (int)trailingEntityType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_trailingEntityType;
  }
  else {
    return 0;
  }
}

- (void)setTrailingEntityType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_trailingEntityType = a3;
}

- (void)setHasTrailingEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTrailingEntityType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)trailingEntityTypeAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E6258[a3];
  }

  return v3;
}

- (int)StringAsTrailingEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTrailingEntityTypeOrders
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutTemplateEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrailingEntityTypeOrders_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (unint64_t)trailingEntityTypeOrdersCount
{
  return self->_trailingEntityTypeOrders.count;
}

- (int)trailingEntityTypeOrders
{
  return self->_trailingEntityTypeOrders.list;
}

- (void)clearTrailingEntityTypeOrders
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedInt32Clear();
}

- (void)addTrailingEntityTypeOrder:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (int)trailingEntityTypeOrderAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readTrailingEntityTypeOrders]((uint64_t)self);
  p_trailingEntityTypeOrders = &self->_trailingEntityTypeOrders;
  unint64_t count = self->_trailingEntityTypeOrders.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trailingEntityTypeOrders->list[a3];
}

- (void)setTrailingEntityTypeOrders:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147390](&self->_trailingEntityTypeOrders, a3, a4);
}

- (id)trailingEntityTypeOrdersAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E6258[a3];
  }

  return v3;
}

- (int)StringAsTrailingEntityTypeOrders:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  int v4 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)&v8 description];
  id v5 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutTemplateEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 68))
    {
      uint64_t v5 = *(int *)(a1 + 60);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E6238[v5];
      }
      if (a2) {
        id v7 = @"platformType";
      }
      else {
        id v7 = @"platform_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    if ([*(id *)(a1 + 40) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"line"];
    }
    if ((*(unsigned char *)(a1 + 68) & 2) != 0)
    {
      uint64_t v16 = *(int *)(a1 + 64);
      if (v16 >= 0xC)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_1E53E6258[v16];
      }
      if (a2) {
        v18 = @"trailingEntityType";
      }
      else {
        v18 = @"trailing_entity_type";
      }
      [v4 setObject:v17 forKey:v18];
    }
    if (*(void *)(a1 + 24))
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v20 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v21 = 0;
        do
        {
          uint64_t v22 = *(int *)(*v20 + 4 * v21);
          if (v22 >= 0xC)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = off_1E53E6258[v22];
          }
          [v19 addObject:v23];

          ++v21;
          v20 = (void *)(a1 + 16);
        }
        while (v21 < *(void *)(a1 + 24));
      }
      if (a2) {
        v24 = @"trailingEntityTypeOrder";
      }
      else {
        v24 = @"trailing_entity_type_order";
      }
      [v4 setObject:v19 forKey:v24];
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
  return -[GEOPDPlaceSummaryLayoutTemplateEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutTemplateEntry *)-[GEOPDPlaceSummaryLayoutTemplateEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_110;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"platformType";
    }
    else {
      id v7 = @"platform_type";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 isEqualToString:@"PLATFORM_TYPE_UNKNOWN"])
      {
        uint64_t v10 = 0;
      }
      else if ([v9 isEqualToString:@"PLATFORM_TYPE_IOS"])
      {
        uint64_t v10 = 1;
      }
      else if ([v9 isEqualToString:@"PLATFORM_TYPE_MACOS"])
      {
        uint64_t v10 = 2;
      }
      else if ([v9 isEqualToString:@"PLATFORM_TYPE_ANY"])
      {
        uint64_t v10 = 3;
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_20;
      }
      uint64_t v10 = [v8 intValue];
    }
    [v6 setPlatformType:v10];
LABEL_20:

    uint64_t v11 = [v5 objectForKeyedSubscript:@"line"];
    objc_opt_class();
    id v38 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v36 = v11;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v44 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [GEOPDPlaceSummaryLayoutLine alloc];
              if (a3) {
                uint64_t v19 = [(GEOPDPlaceSummaryLayoutLine *)v18 initWithJSON:v17];
              }
              else {
                uint64_t v19 = [(GEOPDPlaceSummaryLayoutLine *)v18 initWithDictionary:v17];
              }
              v20 = (void *)v19;
              objc_msgSend(v6, "addLine:", v19, v36);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v14);
      }

      uint64_t v11 = v36;
      id v5 = v38;
    }

    if (a3) {
      unint64_t v21 = @"trailingEntityType";
    }
    else {
      unint64_t v21 = @"trailing_entity_type";
    }
    uint64_t v22 = objc_msgSend(v5, "objectForKeyedSubscript:", v21, v36);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
      if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN"])
      {
        uint64_t v24 = 0;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL"])
      {
        uint64_t v24 = 1;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS"])
      {
        uint64_t v24 = 2;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER"])
      {
        uint64_t v24 = 3;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND"])
      {
        uint64_t v24 = 4;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL"])
      {
        uint64_t v24 = 5;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE"])
      {
        uint64_t v24 = 6;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP"])
      {
        uint64_t v24 = 7;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR"])
      {
        uint64_t v24 = 8;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA"])
      {
        uint64_t v24 = 9;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP"])
      {
        uint64_t v24 = 10;
      }
      else if ([v23 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT"])
      {
        uint64_t v24 = 11;
      }
      else
      {
        uint64_t v24 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_67:

        if (a3) {
          v25 = @"trailingEntityTypeOrder";
        }
        else {
          v25 = @"trailing_entity_type_order";
        }
        long long v26 = [v5 objectForKeyedSubscript:v25];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v37 = v26;
          id v27 = v26;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (!v28) {
            goto LABEL_108;
          }
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v40;
          while (1)
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v40 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v39 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v33 = v32;
                if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN"])
                {
                  uint64_t v34 = 0;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL"])
                {
                  uint64_t v34 = 1;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS"])
                {
                  uint64_t v34 = 2;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER"])
                {
                  uint64_t v34 = 3;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND"])
                {
                  uint64_t v34 = 4;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL"])
                {
                  uint64_t v34 = 5;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE"])
                {
                  uint64_t v34 = 6;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP"])
                {
                  uint64_t v34 = 7;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR"])
                {
                  uint64_t v34 = 8;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA"])
                {
                  uint64_t v34 = 9;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP"])
                {
                  uint64_t v34 = 10;
                }
                else if ([v33 isEqualToString:@"PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT"])
                {
                  uint64_t v34 = 11;
                }
                else
                {
                  uint64_t v34 = 0;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                uint64_t v34 = [v32 intValue];
              }
              objc_msgSend(v6, "addTrailingEntityTypeOrder:", v34, v37);
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (!v29)
            {
LABEL_108:

              long long v26 = v37;
              id v5 = v38;
              break;
            }
          }
        }

        goto LABEL_110;
      }
      uint64_t v24 = [v22 intValue];
    }
    [v6 setTrailingEntityType:v24];
    goto LABEL_67;
  }
LABEL_110:

  return v6;
}

- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutTemplateEntry *)-[GEOPDPlaceSummaryLayoutTemplateEntry _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_333_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_334_0;
    }
    GEOPDPlaceSummaryLayoutTemplateEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceSummaryLayoutTemplateEntryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutTemplateEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutTemplateEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDPlaceSummaryLayoutTemplateEntry *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = self->_lines;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    p_trailingEntityTypeOrders = &self->_trailingEntityTypeOrders;
    if (p_trailingEntityTypeOrders->count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < p_trailingEntityTypeOrders->count);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_lines;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v11 = (id *)a3;
  [(GEOPDPlaceSummaryLayoutTemplateEntry *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 12) = self->_readerMarkPos;
  *((_DWORD *)v11 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v11 + 15) = self->_platformType;
    *((unsigned char *)v11 + 68) |= 1u;
  }
  if ([(GEOPDPlaceSummaryLayoutTemplateEntry *)self linesCount])
  {
    [v11 clearLines];
    unint64_t v4 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)self linesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)self lineAtIndex:i];
        [v11 addLine:v7];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v11 + 16) = self->_trailingEntityType;
    *((unsigned char *)v11 + 68) |= 2u;
  }
  if ([(GEOPDPlaceSummaryLayoutTemplateEntry *)self trailingEntityTypeOrdersCount])
  {
    [v11 clearTrailingEntityTypeOrders];
    unint64_t v8 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)self trailingEntityTypeOrdersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v11, "addTrailingEntityTypeOrder:", -[GEOPDPlaceSummaryLayoutTemplateEntry trailingEntityTypeOrderAtIndex:](self, "trailingEntityTypeOrderAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceSummaryLayoutTemplateEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceSummaryLayoutTemplateEntry *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_platformType;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v9 = self->_lines;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v5 addLine:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_trailingEntityType;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOPDPlaceSummaryLayoutTemplateEntry *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 68);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_platformType != *((_DWORD *)v4 + 15)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_16;
  }
  lines = self->_lines;
  if ((unint64_t)lines | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](lines, "isEqual:"))
    {
LABEL_16:
      char IsEqual = 0;
      goto LABEL_17;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_trailingEntityType != *((_DWORD *)v4 + 16)) {
      goto LABEL_16;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_16;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_17:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutTemplateEntry *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_platformType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_lines hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_trailingEntityType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 68))
  {
    self->_platformType = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPDPlaceSummaryLayoutTemplateEntry addLine:](self, "addLine:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_trailingEntityType = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_flags |= 2u;
  }
  uint64_t v10 = objc_msgSend(v4, "trailingEntityTypeOrdersCount", (void)v13);
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOPDPlaceSummaryLayoutTemplateEntry addTrailingEntityTypeOrder:](self, "addTrailingEntityTypeOrder:", [v4 trailingEntityTypeOrderAtIndex:j]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end