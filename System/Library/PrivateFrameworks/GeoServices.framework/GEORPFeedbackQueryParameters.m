@interface GEORPFeedbackQueryParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasComponentQueryParameters;
- (BOOL)hasFilter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackComponentQueryParameters)componentQueryParameters;
- (GEORPFeedbackQueryParameters)init;
- (GEORPFeedbackQueryParameters)initWithData:(id)a3;
- (GEORPFeedbackQueryParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackQueryParameters)initWithJSON:(id)a3;
- (GEORPFilter)filter;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackComponentTypesAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsFeedbackComponentTypes:(id)a3;
- (int)feedbackComponentTypeAtIndex:(unint64_t)a3;
- (int)feedbackComponentTypes;
- (unint64_t)feedbackComponentTypesCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readComponentQueryParameters;
- (void)_readFeedbackComponentTypes;
- (void)_readFilter;
- (void)addFeedbackComponentType:(int)a3;
- (void)clearFeedbackComponentTypes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setComponentQueryParameters:(id)a3;
- (void)setFeedbackComponentTypes:(int *)a3 count:(unint64_t)a4;
- (void)setFilter:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackQueryParameters

- (GEORPFeedbackQueryParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackQueryParameters;
  v2 = [(GEORPFeedbackQueryParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackQueryParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackQueryParameters;
  v3 = [(GEORPFeedbackQueryParameters *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEORPFeedbackQueryParameters;
  [(GEORPFeedbackQueryParameters *)&v3 dealloc];
}

- (void)_readFeedbackComponentTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackQueryParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackComponentTypes_tags_644);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)feedbackComponentTypesCount
{
  return self->_feedbackComponentTypes.count;
}

- (int)feedbackComponentTypes
{
  return self->_feedbackComponentTypes.list;
}

- (void)clearFeedbackComponentTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedInt32Clear();
}

- (void)addFeedbackComponentType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (int)feedbackComponentTypeAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackQueryParameters _readFeedbackComponentTypes]((uint64_t)self);
  p_feedbackComponentTypes = &self->_feedbackComponentTypes;
  unint64_t count = self->_feedbackComponentTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_feedbackComponentTypes->list[a3];
}

- (void)setFeedbackComponentTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147390](&self->_feedbackComponentTypes, a3, a4);
}

- (id)feedbackComponentTypesAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F6828[a3];
  }

  return v3;
}

- (int)StringAsFeedbackComponentTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_NOTIFICATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_OVERVIEW"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_CONVERSATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_RAP"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackQueryParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFilter
{
  return self->_filter != 0;
}

- (GEORPFilter)filter
{
  -[GEORPFeedbackQueryParameters _readFilter]((uint64_t)self);
  filter = self->_filter;

  return filter;
}

- (void)setFilter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void)_readComponentQueryParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackQueryParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComponentQueryParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasComponentQueryParameters
{
  return self->_componentQueryParameters != 0;
}

- (GEORPFeedbackComponentQueryParameters)componentQueryParameters
{
  -[GEORPFeedbackQueryParameters _readComponentQueryParameters]((uint64_t)self);
  componentQueryParameters = self->_componentQueryParameters;

  return componentQueryParameters;
}

- (void)setComponentQueryParameters:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_componentQueryParameters, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackQueryParameters;
  int v4 = [(GEORPFeedbackQueryParameters *)&v8 description];
  v5 = [(GEORPFeedbackQueryParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackQueryParameters _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = a1 + 3;
      if (a1[4])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 8)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53F6828[v8];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = a1 + 3;
        }
        while (v7 < a1[4]);
      }
      if (a2) {
        v10 = @"feedbackComponentType";
      }
      else {
        v10 = @"feedback_component_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    v11 = [a1 filter];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"filter"];
    }
    v14 = [a1 componentQueryParameters];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"componentQueryParameters";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"component_query_parameters";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = (void *)a1[2];
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __58__GEORPFeedbackQueryParameters__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackQueryParameters _dictionaryRepresentation:](self, 1);
}

void __58__GEORPFeedbackQueryParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackQueryParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackQueryParameters *)-[GEORPFeedbackQueryParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"feedbackComponentType";
      }
      else {
        unint64_t v7 = @"feedback_component_type";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v5;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v27 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (!v10) {
          goto LABEL_36;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v30;
        while (1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_UNKNOWN"])
              {
                uint64_t v16 = 0;
              }
              else if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_NOTIFICATION"])
              {
                uint64_t v16 = 1;
              }
              else if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_OVERVIEW"])
              {
                uint64_t v16 = 2;
              }
              else if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_CONVERSATION"])
              {
                uint64_t v16 = 3;
              }
              else if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT"])
              {
                uint64_t v16 = 4;
              }
              else if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_RAP"])
              {
                uint64_t v16 = 5;
              }
              else if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
              {
                uint64_t v16 = 6;
              }
              else if ([v15 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES"])
              {
                uint64_t v16 = 7;
              }
              else
              {
                uint64_t v16 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v16 = [v14 intValue];
            }
            [v6 addFeedbackComponentType:v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (!v11)
          {
LABEL_36:

            id v5 = v28;
            uint64_t v8 = v27;
            break;
          }
        }
      }

      v17 = [v5 objectForKeyedSubscript:@"filter"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEORPFilter alloc];
        if (a3) {
          uint64_t v19 = [(GEORPFilter *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEORPFilter *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [v6 setFilter:v19];
      }
      if (a3) {
        v21 = @"componentQueryParameters";
      }
      else {
        v21 = @"component_query_parameters";
      }
      id v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = [GEORPFeedbackComponentQueryParameters alloc];
        if (a3) {
          uint64_t v24 = [(GEORPFeedbackComponentQueryParameters *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEORPFeedbackComponentQueryParameters *)v23 initWithDictionary:v22];
        }
        v25 = (void *)v24;
        [v6 setComponentQueryParameters:v24];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEORPFeedbackQueryParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackQueryParameters *)-[GEORPFeedbackQueryParameters _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_656;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_657;
    }
    GEORPFeedbackQueryParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPFilter *)self->_filter readAll:1];
    [(GEORPFeedbackComponentQueryParameters *)self->_componentQueryParameters readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackQueryParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackQueryParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackQueryParametersIsDirty((uint64_t)self))
  {
    unint64_t v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackQueryParameters *)self readAll:0];
    id v5 = v9;
    if (self->_feedbackComponentTypes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_feedbackComponentTypes.count);
    }
    if (self->_filter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_componentQueryParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPFeedbackQueryParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPFeedbackQueryParameters *)self feedbackComponentTypesCount])
  {
    [v8 clearFeedbackComponentTypes];
    unint64_t v4 = [(GEORPFeedbackQueryParameters *)self feedbackComponentTypesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addFeedbackComponentType:", -[GEORPFeedbackQueryParameters feedbackComponentTypeAtIndex:](self, "feedbackComponentTypeAtIndex:", i));
    }
  }
  if (self->_filter) {
    objc_msgSend(v8, "setFilter:");
  }
  unint64_t v7 = v8;
  if (self->_componentQueryParameters)
  {
    objc_msgSend(v8, "setComponentQueryParameters:");
    unint64_t v7 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackQueryParameters *)self readAll:0];
    PBRepeatedInt32Copy();
    id v8 = [(GEORPFilter *)self->_filter copyWithZone:a3];
    id v9 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v8;

    id v10 = [(GEORPFeedbackComponentQueryParameters *)self->_componentQueryParameters copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackQueryParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORPFeedbackQueryParameters *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual())
    && ((filter = self->_filter, !((unint64_t)filter | v4[7])) || -[GEORPFilter isEqual:](filter, "isEqual:")))
  {
    componentQueryParameters = self->_componentQueryParameters;
    if ((unint64_t)componentQueryParameters | v4[6]) {
      char v7 = -[GEORPFeedbackComponentQueryParameters isEqual:](componentQueryParameters, "isEqual:");
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
  [(GEORPFeedbackQueryParameters *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  unint64_t v4 = [(GEORPFilter *)self->_filter hash];
  return v4 ^ v3 ^ [(GEORPFeedbackComponentQueryParameters *)self->_componentQueryParameters hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v12 = a3;
  [v12 readAll:0];
  uint64_t v4 = [v12 feedbackComponentTypesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORPFeedbackQueryParameters addFeedbackComponentType:](self, "addFeedbackComponentType:", [v12 feedbackComponentTypeAtIndex:i]);
  }
  filter = self->_filter;
  id v8 = v12;
  uint64_t v9 = v12[7];
  if (filter)
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEORPFilter mergeFrom:](filter, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEORPFeedbackQueryParameters setFilter:](self, "setFilter:");
  }
  id v8 = v12;
LABEL_10:
  componentQueryParameters = self->_componentQueryParameters;
  uint64_t v11 = v8[6];
  if (componentQueryParameters)
  {
    if (!v11) {
      goto LABEL_16;
    }
    -[GEORPFeedbackComponentQueryParameters mergeFrom:](componentQueryParameters, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_16;
    }
    -[GEORPFeedbackQueryParameters setComponentQueryParameters:](self, "setComponentQueryParameters:");
  }
  id v8 = v12;
LABEL_16:
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
      GEORPFeedbackQueryParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_661);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackQueryParameters *)self readAll:0];
    [(GEORPFilter *)self->_filter clearUnknownFields:1];
    componentQueryParameters = self->_componentQueryParameters;
    [(GEORPFeedbackComponentQueryParameters *)componentQueryParameters clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_componentQueryParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end