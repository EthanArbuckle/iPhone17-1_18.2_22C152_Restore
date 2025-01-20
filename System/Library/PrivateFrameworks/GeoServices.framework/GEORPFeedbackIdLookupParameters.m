@interface GEORPFeedbackIdLookupParameters
+ (BOOL)isValid:(id)a3;
+ (Class)feedbackIdType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackIdLookupParameters)init;
- (GEORPFeedbackIdLookupParameters)initWithData:(id)a3;
- (GEORPFeedbackIdLookupParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackIdLookupParameters)initWithJSON:(id)a3;
- (NSMutableArray)feedbackIds;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackComponentTypesAsString:(int)a3;
- (id)feedbackIdAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (int)StringAsFeedbackComponentTypes:(id)a3;
- (int)feedbackComponentTypeAtIndex:(unint64_t)a3;
- (int)feedbackComponentTypes;
- (unint64_t)feedbackComponentTypesCount;
- (unint64_t)feedbackIdsCount;
- (unint64_t)hash;
- (void)_addNoFlagsFeedbackId:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFeedbackComponentTypes;
- (void)_readFeedbackIds;
- (void)addFeedbackComponentType:(int)a3;
- (void)addFeedbackId:(id)a3;
- (void)clearFeedbackComponentTypes;
- (void)clearFeedbackIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFeedbackComponentTypes:(int *)a3 count:(unint64_t)a4;
- (void)setFeedbackIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackIdLookupParameters

- (GEORPFeedbackIdLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackIdLookupParameters;
  v2 = [(GEORPFeedbackIdLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackIdLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackIdLookupParameters;
  v3 = [(GEORPFeedbackIdLookupParameters *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEORPFeedbackIdLookupParameters;
  [(GEORPFeedbackIdLookupParameters *)&v3 dealloc];
}

- (void)_readFeedbackIds
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
        GEORPFeedbackIdLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)feedbackIds
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  feedbackIds = self->_feedbackIds;

  return feedbackIds;
}

- (void)setFeedbackIds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  feedbackIds = self->_feedbackIds;
  self->_feedbackIds = v4;
}

- (void)clearFeedbackIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  feedbackIds = self->_feedbackIds;

  [(NSMutableArray *)feedbackIds removeAllObjects];
}

- (void)addFeedbackId:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  -[GEORPFeedbackIdLookupParameters _addNoFlagsFeedbackId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsFeedbackId:(uint64_t)a1
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

- (unint64_t)feedbackIdsCount
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  feedbackIds = self->_feedbackIds;

  return [(NSMutableArray *)feedbackIds count];
}

- (id)feedbackIdAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackIds]((uint64_t)self);
  feedbackIds = self->_feedbackIds;

  return (id)[(NSMutableArray *)feedbackIds objectAtIndex:a3];
}

+ (Class)feedbackIdType
{
  return (Class)objc_opt_class();
}

- (void)_readFeedbackComponentTypes
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
        GEORPFeedbackIdLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackComponentTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
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
  *(unsigned char *)&self->_flags |= 8u;

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
  *(unsigned char *)&self->_flags |= 8u;
}

- (int)feedbackComponentTypeAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackIdLookupParameters _readFeedbackComponentTypes]((uint64_t)self);
  p_feedbackComponentTypes = &self->_feedbackComponentTypes;
  unint64_t count = self->_feedbackComponentTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
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
  *(unsigned char *)&self->_flags |= 8u;

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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackIdLookupParameters;
  int v4 = [(GEORPFeedbackIdLookupParameters *)&v8 description];
  id v5 = [(GEORPFeedbackIdLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackIdLookupParameters _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[6])
    {
      id v5 = [a1 feedbackIds];
      if (a2) {
        objc_super v6 = @"feedbackId";
      }
      else {
        objc_super v6 = @"feedback_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (a1[4])
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v8 = a1 + 3;
      if (a1[4])
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(int *)(*v8 + 4 * v9);
          if (v10 >= 8)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = off_1E53F6828[v10];
          }
          [v7 addObject:v11];

          ++v9;
          objc_super v8 = a1 + 3;
        }
        while (v9 < a1[4]);
      }
      if (a2) {
        v12 = @"feedbackComponentType";
      }
      else {
        v12 = @"feedback_component_type";
      }
      [v4 setObject:v7 forKey:v12];
    }
    v13 = (void *)a1[2];
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __61__GEORPFeedbackIdLookupParameters__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackIdLookupParameters _dictionaryRepresentation:](self, 1);
}

void __61__GEORPFeedbackIdLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackIdLookupParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackIdLookupParameters *)-[GEORPFeedbackIdLookupParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"feedbackId";
      }
      else {
        objc_super v6 = @"feedback_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v27 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = (void *)[v13 copy];
                [a1 addFeedbackId:v14];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v10);
        }

        id v5 = v27;
      }

      if (a3) {
        v15 = @"feedbackComponentType";
      }
      else {
        v15 = @"feedback_component_type";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v26 = v16;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (!v18) {
          goto LABEL_50;
        }
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v29;
        while (1)
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v28 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = v22;
              if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_UNKNOWN"])
              {
                uint64_t v24 = 0;
              }
              else if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_NOTIFICATION"])
              {
                uint64_t v24 = 1;
              }
              else if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_OVERVIEW"])
              {
                uint64_t v24 = 2;
              }
              else if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_CONVERSATION"])
              {
                uint64_t v24 = 3;
              }
              else if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT"])
              {
                uint64_t v24 = 4;
              }
              else if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_RAP"])
              {
                uint64_t v24 = 5;
              }
              else if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
              {
                uint64_t v24 = 6;
              }
              else if ([v23 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES"])
              {
                uint64_t v24 = 7;
              }
              else
              {
                uint64_t v24 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_48;
              }
              uint64_t v24 = [v22 intValue];
            }
            objc_msgSend(a1, "addFeedbackComponentType:", v24, v26);
LABEL_48:
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (!v19)
          {
LABEL_50:

            v16 = v26;
            id v5 = v27;
            break;
          }
        }
      }
    }
  }

  return a1;
}

- (GEORPFeedbackIdLookupParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackIdLookupParameters *)-[GEORPFeedbackIdLookupParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_477_0;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_478_0;
    }
    GEORPFeedbackIdLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackIdLookupParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackIdLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackIdLookupParameters *)self readAll:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_feedbackIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (self->_feedbackComponentTypes.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_feedbackComponentTypes.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v11 = (id *)a3;
  [(GEORPFeedbackIdLookupParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPFeedbackIdLookupParameters *)self feedbackIdsCount])
  {
    [v11 clearFeedbackIds];
    unint64_t v4 = [(GEORPFeedbackIdLookupParameters *)self feedbackIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackIdLookupParameters *)self feedbackIdAtIndex:i];
        [v11 addFeedbackId:v7];
      }
    }
  }
  if ([(GEORPFeedbackIdLookupParameters *)self feedbackComponentTypesCount])
  {
    [v11 clearFeedbackComponentTypes];
    unint64_t v8 = [(GEORPFeedbackIdLookupParameters *)self feedbackComponentTypesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v11, "addFeedbackComponentType:", -[GEORPFeedbackIdLookupParameters feedbackComponentTypeAtIndex:](self, "feedbackComponentTypeAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackIdLookupParametersReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackIdLookupParameters *)self readAll:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v8 = self->_feedbackIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v5 addFeedbackId:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackIdLookupParameters *)self readAll:1],
         [v4 readAll:1],
         feedbackIds = self->_feedbackIds,
         !((unint64_t)feedbackIds | v4[6]))
     || -[NSMutableArray isEqual:](feedbackIds, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEORPFeedbackIdLookupParameters *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_feedbackIds hash];
  return PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4[6];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackIdLookupParameters addFeedbackId:](self, "addFeedbackId:", *(void *)(*((void *)&v13 + 1) + 8 * v9++), (void)v13);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 feedbackComponentTypesCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
      -[GEORPFeedbackIdLookupParameters addFeedbackComponentType:](self, "addFeedbackComponentType:", objc_msgSend(v4, "feedbackComponentTypeAtIndex:", i, (void)v13));
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
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackIdLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_482);
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
    [(GEORPFeedbackIdLookupParameters *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end