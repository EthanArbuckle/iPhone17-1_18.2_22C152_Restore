@interface GEORouteLineStyleInfo
+ (BOOL)isValid:(id)a3;
+ (Class)laneChangeInfoType;
- (BOOL)hasEndOffsetCm;
- (BOOL)hasLabelInfo;
- (BOOL)hasPreserveStyleInUpdates;
- (BOOL)hasPurpose;
- (BOOL)hasStartOffsetCm;
- (BOOL)hasStyleAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)preserveStyleInUpdates;
- (BOOL)readFrom:(id)a3;
- (GEOLabelInfo)labelInfo;
- (GEORouteLineStyleInfo)init;
- (GEORouteLineStyleInfo)initWithData:(id)a3;
- (GEORouteLineStyleInfo)initWithDictionary:(id)a3;
- (GEORouteLineStyleInfo)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSMutableArray)laneChangeInfos;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)laneChangeInfoAtIndex:(unint64_t)a3;
- (id)purposeAsString:(int)a3;
- (int)StringAsPurpose:(id)a3;
- (int)purpose;
- (unint64_t)hash;
- (unint64_t)laneChangeInfosCount;
- (unsigned)endOffsetCm;
- (unsigned)startOffsetCm;
- (void)_addNoFlagsLaneChangeInfo:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLabelInfo;
- (void)_readLaneChangeInfos;
- (void)_readStyleAttributes;
- (void)addLaneChangeInfo:(id)a3;
- (void)clearLaneChangeInfos;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEndOffsetCm:(unsigned int)a3;
- (void)setHasEndOffsetCm:(BOOL)a3;
- (void)setHasPreserveStyleInUpdates:(BOOL)a3;
- (void)setHasPurpose:(BOOL)a3;
- (void)setHasStartOffsetCm:(BOOL)a3;
- (void)setLabelInfo:(id)a3;
- (void)setLaneChangeInfos:(id)a3;
- (void)setPreserveStyleInUpdates:(BOOL)a3;
- (void)setPurpose:(int)a3;
- (void)setStartOffsetCm:(unsigned int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteLineStyleInfo

- (GEORouteLineStyleInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteLineStyleInfo;
  v2 = [(GEORouteLineStyleInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteLineStyleInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteLineStyleInfo;
  v3 = [(GEORouteLineStyleInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)purpose
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_purpose;
  }
  else {
    return 0;
  }
}

- (void)setPurpose:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasPurpose
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"STYLE_ONLY";
  }
  return v4;
}

- (int)StringAsPurpose:(id)a3
{
  return 0;
}

- (unsigned)startOffsetCm
{
  return self->_startOffsetCm;
}

- (void)setStartOffsetCm:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_startOffsetCm = a3;
}

- (void)setHasStartOffsetCm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 260;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStartOffsetCm
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)endOffsetCm
{
  return self->_endOffsetCm;
}

- (void)setEndOffsetCm:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_endOffsetCm = a3;
}

- (void)setHasEndOffsetCm:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasEndOffsetCm
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteLineStyleInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEORouteLineStyleInfo _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readLabelInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteLineStyleInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLabelInfo
{
  return self->_labelInfo != 0;
}

- (GEOLabelInfo)labelInfo
{
  -[GEORouteLineStyleInfo _readLabelInfo]((uint64_t)self);
  labelInfo = self->_labelInfo;

  return labelInfo;
}

- (void)setLabelInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_labelInfo, a3);
}

- (BOOL)preserveStyleInUpdates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 8) == 0 || self->_preserveStyleInUpdates;
}

- (void)setPreserveStyleInUpdates:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  self->_preserveStyleInUpdates = a3;
}

- (void)setHasPreserveStyleInUpdates:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 264;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPreserveStyleInUpdates
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readLaneChangeInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteLineStyleInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLaneChangeInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)laneChangeInfos
{
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  laneChangeInfos = self->_laneChangeInfos;

  return laneChangeInfos;
}

- (void)setLaneChangeInfos:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  laneChangeInfos = self->_laneChangeInfos;
  self->_laneChangeInfos = v4;
}

- (void)clearLaneChangeInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  laneChangeInfos = self->_laneChangeInfos;

  [(NSMutableArray *)laneChangeInfos removeAllObjects];
}

- (void)addLaneChangeInfo:(id)a3
{
  id v4 = a3;
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  -[GEORouteLineStyleInfo _addNoFlagsLaneChangeInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsLaneChangeInfo:(uint64_t)a1
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

- (unint64_t)laneChangeInfosCount
{
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  laneChangeInfos = self->_laneChangeInfos;

  return [(NSMutableArray *)laneChangeInfos count];
}

- (id)laneChangeInfoAtIndex:(unint64_t)a3
{
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  laneChangeInfos = self->_laneChangeInfos;

  return (id)[(NSMutableArray *)laneChangeInfos objectAtIndex:a3];
}

+ (Class)laneChangeInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteLineStyleInfo;
  id v4 = [(GEORouteLineStyleInfo *)&v8 description];
  id v5 = [(GEORouteLineStyleInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteLineStyleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 76);
    if ((v5 & 2) != 0)
    {
      if (*(_DWORD *)(a1 + 64))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 64));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = @"STYLE_ONLY";
      }
      [v4 setObject:v6 forKey:@"purpose"];

      __int16 v5 = *(_WORD *)(a1 + 76);
    }
    if ((v5 & 4) != 0)
    {
      id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        objc_super v8 = @"startOffsetCm";
      }
      else {
        objc_super v8 = @"start_offset_cm";
      }
      [v4 setObject:v7 forKey:v8];

      __int16 v5 = *(_WORD *)(a1 + 76);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        v10 = @"endOffsetCm";
      }
      else {
        v10 = @"end_offset_cm";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 styleAttributes];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"styleAttributes";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"style_attributes";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 labelInfo];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"labelInfo";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"label_info";
      }
      [v4 setObject:v17 forKey:v18];
    }
    if ((*(_WORD *)(a1 + 76) & 8) != 0)
    {
      v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      if (a2) {
        v20 = @"preserveStyleInUpdates";
      }
      else {
        v20 = @"preserve_style_in_updates";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v22 = *(id *)(a1 + 32);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v40 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v24);
      }

      if (a2) {
        v29 = @"laneChangeInfo";
      }
      else {
        v29 = @"lane_change_info";
      }
      [v4 setObject:v21 forKey:v29];
    }
    v30 = *(void **)(a1 + 16);
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __51__GEORouteLineStyleInfo__dictionaryRepresentation___block_invoke;
        v37[3] = &unk_1E53D8860;
        id v34 = v33;
        id v38 = v34;
        [v32 enumerateKeysAndObjectsUsingBlock:v37];
        id v35 = v34;

        v32 = v35;
      }
      [v4 setObject:v32 forKey:@"Unknown Fields"];
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
  return -[GEORouteLineStyleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORouteLineStyleInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteLineStyleInfo)initWithDictionary:(id)a3
{
  return (GEORouteLineStyleInfo *)-[GEORouteLineStyleInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_57;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_57;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"purpose"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 isEqualToString:@"STYLE_ONLY"];
    uint64_t v7 = 0;
LABEL_7:
    [a1 setPurpose:v7];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 intValue];
    goto LABEL_7;
  }
LABEL_8:

  if (a3) {
    objc_super v8 = @"startOffsetCm";
  }
  else {
    objc_super v8 = @"start_offset_cm";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStartOffsetCm:", objc_msgSend(v9, "unsignedIntValue"));
  }

  if (a3) {
    id v10 = @"endOffsetCm";
  }
  else {
    id v10 = @"end_offset_cm";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndOffsetCm:", objc_msgSend(v11, "unsignedIntValue"));
  }

  if (a3) {
    v12 = @"styleAttributes";
  }
  else {
    v12 = @"style_attributes";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOStyleAttributes alloc];
    if (a3) {
      uint64_t v15 = [(GEOStyleAttributes *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOStyleAttributes *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setStyleAttributes:v15];
  }
  if (a3) {
    v17 = @"labelInfo";
  }
  else {
    v17 = @"label_info";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEOLabelInfo alloc];
    if (a3) {
      uint64_t v20 = [(GEOLabelInfo *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOLabelInfo *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setLabelInfo:v20];
  }
  if (a3) {
    id v22 = @"preserveStyleInUpdates";
  }
  else {
    id v22 = @"preserve_style_in_updates";
  }
  uint64_t v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPreserveStyleInUpdates:", objc_msgSend(v23, "BOOLValue"));
  }

  if (a3) {
    uint64_t v24 = @"laneChangeInfo";
  }
  else {
    uint64_t v24 = @"lane_change_info";
  }
  uint64_t v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = v5;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32 = [GEOLaneChangeInfo alloc];
            if (a3) {
              uint64_t v33 = [(GEOLaneChangeInfo *)v32 initWithJSON:v31];
            }
            else {
              uint64_t v33 = [(GEOLaneChangeInfo *)v32 initWithDictionary:v31];
            }
            id v34 = (void *)v33;
            [a1 addLaneChangeInfo:v33];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v28);
    }

    id v5 = v36;
  }

LABEL_57:
  return a1;
}

- (GEORouteLineStyleInfo)initWithJSON:(id)a3
{
  return (GEORouteLineStyleInfo *)-[GEORouteLineStyleInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_6449;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_6450;
    }
    GEORouteLineStyleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORouteLineStyleInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteLineStyleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteLineStyleInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteLineStyleInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_25;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteLineStyleInfo *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
LABEL_22:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_22;
  }
LABEL_5:
  if (flags) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_styleAttributes) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_labelInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = self->_laneChangeInfos;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_25:
}

- (void)copyTo:(id)a3
{
  uint64_t v10 = (id *)a3;
  [(GEORouteLineStyleInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 12) = self->_readerMarkPos;
  *((_DWORD *)v10 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v10;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 16) = self->_purpose;
    *((_WORD *)v10 + 38) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v10 + 17) = self->_startOffsetCm;
  *((_WORD *)v10 + 38) |= 4u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_4:
    *((_DWORD *)v10 + 15) = self->_endOffsetCm;
    *((_WORD *)v10 + 38) |= 1u;
  }
LABEL_5:
  if (self->_styleAttributes)
  {
    objc_msgSend(v10, "setStyleAttributes:");
    id v4 = v10;
  }
  if (self->_labelInfo)
  {
    objc_msgSend(v10, "setLabelInfo:");
    id v4 = v10;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_preserveStyleInUpdates;
    *((_WORD *)v4 + 38) |= 8u;
  }
  if ([(GEORouteLineStyleInfo *)self laneChangeInfosCount])
  {
    [v10 clearLaneChangeInfos];
    unint64_t v6 = [(GEORouteLineStyleInfo *)self laneChangeInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEORouteLineStyleInfo *)self laneChangeInfoAtIndex:i];
        [v10 addLaneChangeInfo:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      GEORouteLineStyleInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteLineStyleInfo *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
LABEL_21:
    *(_DWORD *)(v5 + 68) = self->_startOffsetCm;
    *(_WORD *)(v5 + 76) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 64) = self->_purpose;
  *(_WORD *)(v5 + 76) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_21;
  }
LABEL_7:
  if (flags)
  {
LABEL_8:
    *(_DWORD *)(v5 + 60) = self->_endOffsetCm;
    *(_WORD *)(v5 + 76) |= 1u;
  }
LABEL_9:
  id v10 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(GEOLabelInfo *)self->_labelInfo copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_preserveStyleInUpdates;
    *(_WORD *)(v5 + 76) |= 8u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v14 = self->_laneChangeInfos;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v5 addLaneChangeInfo:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  [(GEORouteLineStyleInfo *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_purpose != *((_DWORD *)v4 + 16)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_startOffsetCm != *((_DWORD *)v4 + 17)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_25;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_endOffsetCm != *((_DWORD *)v4 + 15)) {
      goto LABEL_25;
    }
  }
  else if (v6)
  {
    goto LABEL_25;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 5)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_25;
  }
  labelInfo = self->_labelInfo;
  if ((unint64_t)labelInfo | *((void *)v4 + 3))
  {
    if (!-[GEOLabelInfo isEqual:](labelInfo, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 38);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_31;
    }
LABEL_25:
    char v10 = 0;
    goto LABEL_26;
  }
  if ((v9 & 8) == 0) {
    goto LABEL_25;
  }
  if (!self->_preserveStyleInUpdates)
  {
    if (!*((unsigned char *)v4 + 72)) {
      goto LABEL_31;
    }
    goto LABEL_25;
  }
  if (!*((unsigned char *)v4 + 72)) {
    goto LABEL_25;
  }
LABEL_31:
  laneChangeInfos = self->_laneChangeInfos;
  if ((unint64_t)laneChangeInfos | *((void *)v4 + 4)) {
    char v10 = -[NSMutableArray isEqual:](laneChangeInfos, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  [(GEORouteLineStyleInfo *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (flags) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_purpose;
  if ((flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_startOffsetCm;
  if (flags)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_endOffsetCm;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  unint64_t v7 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  unint64_t v8 = [(GEOLabelInfo *)self->_labelInfo hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v9 = 2654435761 * self->_preserveStyleInUpdates;
  }
  else {
    uint64_t v9 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSMutableArray *)self->_laneChangeInfos hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 2) != 0)
  {
    self->_purpose = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v4 + 38);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_startOffsetCm = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 4u;
  if (*((_WORD *)v4 + 38))
  {
LABEL_4:
    self->_endOffsetCm = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_5:
  styleAttributes = self->_styleAttributes;
  uint64_t v7 = *((void *)v4 + 5);
  if (styleAttributes)
  {
    if (v7) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORouteLineStyleInfo setStyleAttributes:](self, "setStyleAttributes:");
  }
  labelInfo = self->_labelInfo;
  uint64_t v9 = *((void *)v4 + 3);
  if (labelInfo)
  {
    if (v9) {
      -[GEOLabelInfo mergeFrom:](labelInfo, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORouteLineStyleInfo setLabelInfo:](self, "setLabelInfo:");
  }
  if ((*((_WORD *)v4 + 38) & 8) != 0)
  {
    self->_preserveStyleInUpdates = *((unsigned char *)v4 + 72);
    *(_WORD *)&self->_flags |= 8u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEORouteLineStyleInfo addLaneChangeInfo:](self, "addLaneChangeInfo:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEORouteLineStyleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6454);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x110u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORouteLineStyleInfo *)self readAll:0];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    [(GEOLabelInfo *)self->_labelInfo clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_laneChangeInfos;
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
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_laneChangeInfos, 0);
  objc_storeStrong((id *)&self->_labelInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end