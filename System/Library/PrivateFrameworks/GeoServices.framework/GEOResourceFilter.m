@interface GEOResourceFilter
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOResourceFilter)init;
- (GEOResourceFilter)initWithData:(id)a3;
- (GEOResourceFilter)initWithDictionary:(id)a3;
- (GEOResourceFilter)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)scalesAsString:(int)a3;
- (id)scenariosAsString:(int)a3;
- (int)StringAsScales:(id)a3;
- (int)StringAsScenarios:(id)a3;
- (int)scaleAtIndex:(unint64_t)a3;
- (int)scales;
- (int)scenarioAtIndex:(unint64_t)a3;
- (int)scenarios;
- (unint64_t)hash;
- (unint64_t)scalesCount;
- (unint64_t)scenariosCount;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readScales;
- (void)_readScenarios;
- (void)addScale:(int)a3;
- (void)addScenario:(int)a3;
- (void)clearScales;
- (void)clearScenarios;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setScales:(int *)a3 count:(unint64_t)a4;
- (void)setScenarios:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOResourceFilter

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_677;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_678;
    }
    GEOResourceFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceFilter;
  [(GEOResourceFilter *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOResourceFilter *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual()))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)scalesCount
{
  return self->_scales.count;
}

- (void)_readScales
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
        GEOResourceFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScales_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)scenariosCount
{
  return self->_scenarios.count;
}

- (int)scaleAtIndex:(unint64_t)a3
{
  -[GEOResourceFilter _readScales]((uint64_t)self);
  p_scales = &self->_scales;
  unint64_t count = self->_scales.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_scales->list[a3];
}

- (void)_readScenarios
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
        GEOResourceFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScenarios_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (GEOResourceFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOResourceFilter;
  v2 = [(GEOResourceFilter *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v6 = reader;
  objc_sync_enter(v6);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOResourceFilter *)self readAll:0];
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOResourceFilterReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOResourceFilter *)self readAll:0];
    id v5 = v10;
    if (self->_scales.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_scales.count);
    }
    if (self->_scenarios.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < self->_scenarios.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (GEOResourceFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceFilter;
  id v3 = [(GEOResourceFilter *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (int)scales
{
  return self->_scales.list;
}

- (void)clearScales
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedInt32Clear();
}

- (void)addScale:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)setScales:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147390](&self->_scales, a3, a4);
}

- (id)scalesAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DE140[a3];
  }

  return v3;
}

- (int)StringAsScales:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_1X"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_2X"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_3X"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)scenarios
{
  return self->_scenarios.list;
}

- (void)clearScenarios
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedInt32Clear();
}

- (void)addScenario:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (int)scenarioAtIndex:(unint64_t)a3
{
  -[GEOResourceFilter _readScenarios]((uint64_t)self);
  p_scenarios = &self->_scenarios;
  unint64_t count = self->_scenarios.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_scenarios->list[a3];
}

- (void)setScenarios:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147390](&self->_scenarios, a3, a4);
}

- (id)scenariosAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DE160[a3];
  }

  return v3;
}

- (int)StringAsScenarios:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_CARPLAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_NAVIGATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_EXPLICIT"])
  {
    int v4 = 4;
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
  v8.super_class = (Class)GEOResourceFilter;
  int v4 = [(GEOResourceFilter *)&v8 description];
  id v5 = [(GEOResourceFilter *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResourceFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      int v5 = a2;
      unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v7 = a1 + 3;
      if (a1[4])
      {
        unint64_t v8 = 0;
        do
        {
          uint64_t v9 = *(int *)(*v7 + 4 * v8);
          if (v9 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
            id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v10 = off_1E53DE140[v9];
          }
          [v6 addObject:v10];

          ++v8;
          objc_super v7 = a1 + 3;
        }
        while (v8 < a1[4]);
      }
      [v4 setObject:v6 forKey:@"scale"];

      a2 = v5;
    }
    if (a1[7])
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v12 = a1 + 6;
      if (a1[7])
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = off_1E53DE160[v14];
          }
          [v11 addObject:v15];

          ++v13;
          v12 = a1 + 6;
        }
        while (v13 < a1[7]);
      }
      [v4 setObject:v11 forKey:@"scenario"];
    }
    v16 = (void *)a1[2];
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __47__GEOResourceFilter__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOResourceFilter _dictionaryRepresentation:](self, 1);
}

void __47__GEOResourceFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    unint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    unint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOResourceFilter)initWithDictionary:(id)a3
{
  return (GEOResourceFilter *)-[GEOResourceFilter _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_52;
  }
  int v4 = (void *)[a1 init];
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"scale"];
    objc_opt_class();
    id v26 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v24 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (!v7) {
      goto LABEL_25;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          if ([v12 isEqualToString:@"RESOURCE_FILTER_SCALE_UNKNOWN"])
          {
            uint64_t v13 = 0;
          }
          else if ([v12 isEqualToString:@"RESOURCE_FILTER_SCALE_1X"])
          {
            uint64_t v13 = 1;
          }
          else if ([v12 isEqualToString:@"RESOURCE_FILTER_SCALE_2X"])
          {
            uint64_t v13 = 2;
          }
          else if ([v12 isEqualToString:@"RESOURCE_FILTER_SCALE_3X"])
          {
            uint64_t v13 = 3;
          }
          else
          {
            uint64_t v13 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v13 = [v11 intValue];
        }
        objc_msgSend(v4, "addScale:", v13, v24);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (!v8)
      {
LABEL_25:

        id v5 = v24;
LABEL_26:

        uint64_t v14 = [v3 objectForKeyedSubscript:@"scenario"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_51;
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v25 = v14;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (!v16) {
          goto LABEL_50;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
LABEL_29:
        uint64_t v19 = 0;
LABEL_30:
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v20;
          if ([v21 isEqualToString:@"RESOURCE_FILTER_SCENARIO_UNKNOWN"])
          {
            uint64_t v22 = 0;
          }
          else if ([v21 isEqualToString:@"RESOURCE_FILTER_SCENARIO_CARPLAY"])
          {
            uint64_t v22 = 1;
          }
          else if ([v21 isEqualToString:@"RESOURCE_FILTER_SCENARIO_NAVIGATION"])
          {
            uint64_t v22 = 2;
          }
          else if ([v21 isEqualToString:@"RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY"])
          {
            uint64_t v22 = 3;
          }
          else if ([v21 isEqualToString:@"RESOURCE_FILTER_SCENARIO_EXPLICIT"])
          {
            uint64_t v22 = 4;
          }
          else
          {
            uint64_t v22 = 0;
          }

LABEL_47:
          objc_msgSend(v4, "addScenario:", v22, v25);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v22 = [v20 intValue];
            goto LABEL_47;
          }
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (!v17)
          {
LABEL_50:

            uint64_t v14 = v25;
            id v3 = v26;
LABEL_51:

            break;
          }
          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
  }
LABEL_52:

  return v4;
}

- (GEOResourceFilter)initWithJSON:(id)a3
{
  return (GEOResourceFilter *)-[GEOResourceFilter _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourceFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourceFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOResourceFilter *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOResourceFilter *)self scalesCount])
  {
    [v10 clearScales];
    unint64_t v4 = [(GEOResourceFilter *)self scalesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addScale:", -[GEOResourceFilter scaleAtIndex:](self, "scaleAtIndex:", i));
    }
  }
  if ([(GEOResourceFilter *)self scenariosCount])
  {
    [v10 clearScenarios];
    unint64_t v7 = [(GEOResourceFilter *)self scenariosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v10, "addScenario:", -[GEOResourceFilter scenarioAtIndex:](self, "scenarioAtIndex:", j));
    }
  }
}

- (unint64_t)hash
{
  [(GEOResourceFilter *)self readAll:1];
  uint64_t v2 = PBRepeatedInt32Hash();
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = [v10 scalesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOResourceFilter addScale:](self, "addScale:", [v10 scaleAtIndex:i]);
  }
  uint64_t v7 = [v10 scenariosCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[GEOResourceFilter addScenario:](self, "addScenario:", [v10 scenarioAtIndex:j]);
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
      GEOResourceFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_682);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOResourceFilter *)self readAll:0];
  }
}

@end