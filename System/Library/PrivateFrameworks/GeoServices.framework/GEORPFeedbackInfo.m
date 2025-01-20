@interface GEORPFeedbackInfo
+ (BOOL)isValid:(id)a3;
+ (Class)feedbackComponentType;
- (BOOL)hasFeedbackId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackInfo)init;
- (GEORPFeedbackInfo)initWithData:(id)a3;
- (GEORPFeedbackInfo)initWithDictionary:(id)a3;
- (GEORPFeedbackInfo)initWithJSON:(id)a3;
- (NSMutableArray)feedbackComponents;
- (NSString)feedbackId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackComponentAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)feedbackComponentsCount;
- (unint64_t)hash;
- (void)_addNoFlagsFeedbackComponent:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFeedbackComponents;
- (void)_readFeedbackId;
- (void)addFeedbackComponent:(id)a3;
- (void)clearFeedbackComponents;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFeedbackComponents:(id)a3;
- (void)setFeedbackId:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackInfo

- (GEORPFeedbackInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackInfo;
  v2 = [(GEORPFeedbackInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackInfo;
  v3 = [(GEORPFeedbackInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFeedbackId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasFeedbackId
{
  return self->_feedbackId != 0;
}

- (NSString)feedbackId
{
  -[GEORPFeedbackInfo _readFeedbackId]((uint64_t)self);
  feedbackId = self->_feedbackId;

  return feedbackId;
}

- (void)setFeedbackId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_feedbackId, a3);
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readFeedbackComponents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackComponents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)feedbackComponents
{
  -[GEORPFeedbackInfo _readFeedbackComponents]((uint64_t)self);
  feedbackComponents = self->_feedbackComponents;

  return feedbackComponents;
}

- (void)setFeedbackComponents:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  feedbackComponents = self->_feedbackComponents;
  self->_feedbackComponents = v4;
}

- (void)clearFeedbackComponents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  feedbackComponents = self->_feedbackComponents;

  [(NSMutableArray *)feedbackComponents removeAllObjects];
}

- (void)addFeedbackComponent:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackInfo _readFeedbackComponents]((uint64_t)self);
  -[GEORPFeedbackInfo _addNoFlagsFeedbackComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsFeedbackComponent:(uint64_t)a1
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

- (unint64_t)feedbackComponentsCount
{
  -[GEORPFeedbackInfo _readFeedbackComponents]((uint64_t)self);
  feedbackComponents = self->_feedbackComponents;

  return [(NSMutableArray *)feedbackComponents count];
}

- (id)feedbackComponentAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackInfo _readFeedbackComponents]((uint64_t)self);
  feedbackComponents = self->_feedbackComponents;

  return (id)[(NSMutableArray *)feedbackComponents objectAtIndex:a3];
}

+ (Class)feedbackComponentType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackInfo;
  id v4 = [(GEORPFeedbackInfo *)&v8 description];
  id v5 = [(GEORPFeedbackInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_45;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 feedbackId];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"feedbackId";
    }
    else {
      objc_super v6 = @"feedback_id";
    }
    [v4 setObject:v5 forKey:v6];
  }

  if (*(unsigned char *)(a1 + 56))
  {
    int v7 = *(_DWORD *)(a1 + 52);
    if (v7 <= 29)
    {
      objc_super v8 = @"STATUS_SUCCESS";
      switch(v7)
      {
        case 0:
          goto LABEL_25;
        case 1:
          objc_super v8 = @"STATUS_FAILED";
          break;
        case 2:
          objc_super v8 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_20;
        case 5:
          objc_super v8 = @"INVALID_REQUEST";
          break;
        default:
          if (v7 != 20) {
            goto LABEL_20;
          }
          objc_super v8 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_25;
    }
    if (v7 > 49)
    {
      if (v7 == 50)
      {
        objc_super v8 = @"STATUS_DEDUPED";
        goto LABEL_25;
      }
      if (v7 == 60)
      {
        objc_super v8 = @"VERSION_MISMATCH";
        goto LABEL_25;
      }
    }
    else
    {
      if (v7 == 30)
      {
        objc_super v8 = @"NEEDS_REFINEMENT";
        goto LABEL_25;
      }
      if (v7 == 40)
      {
        objc_super v8 = @"FAILED_NOT_AUTHORIZED";
LABEL_25:
        [v4 setObject:v8 forKey:@"status"];

        goto LABEL_26;
      }
    }
LABEL_20:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_26:
  if ([*(id *)(a1 + 24) count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = *(id *)(a1 + 24);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (a2) {
            [v15 jsonRepresentation];
          }
          else {
          v16 = [v15 dictionaryRepresentation];
          }
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    if (a2) {
      v17 = @"feedbackComponent";
    }
    else {
      v17 = @"feedback_component";
    }
    [v4 setObject:v9 forKey:v17];
  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    v19 = [v18 dictionaryRepresentation];
    v20 = v19;
    if (a2)
    {
      v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__GEORPFeedbackInfo__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v22 = v21;
      id v26 = v22;
      [v20 enumerateKeysAndObjectsUsingBlock:v25];
      id v23 = v22;

      v20 = v23;
    }
    [v4 setObject:v20 forKey:@"Unknown Fields"];
  }
LABEL_45:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEORPFeedbackInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v7 = *(void **)(a1 + 32);
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

- (GEORPFeedbackInfo)initWithDictionary:(id)a3
{
  return (GEORPFeedbackInfo *)-[GEORPFeedbackInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_50;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_50;
  }
  if (a3) {
    objc_super v6 = @"feedbackId";
  }
  else {
    objc_super v6 = @"feedback_id";
  }
  int v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setFeedbackId:v8];
  }
  v9 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v11 = 20;
    }
    else if ([v10 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v11 = 30;
    }
    else if ([v10 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v11 = 40;
    }
    else if ([v10 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v11 = 50;
    }
    else if ([v10 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v11 = 60;
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_31:
    [a1 setStatus:v11];
  }

  if (a3) {
    uint64_t v12 = @"feedbackComponent";
  }
  else {
    uint64_t v12 = @"feedback_component";
  }
  uint64_t v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v20 = [GEORPFeedbackComponent alloc];
            if (a3) {
              uint64_t v21 = [(GEORPFeedbackComponent *)v20 initWithJSON:v19];
            }
            else {
              uint64_t v21 = [(GEORPFeedbackComponent *)v20 initWithDictionary:v19];
            }
            id v22 = (void *)v21;
            [a1 addFeedbackComponent:v21];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }

    id v5 = v24;
  }

LABEL_50:
  return a1;
}

- (GEORPFeedbackInfo)initWithJSON:(id)a3
{
  return (GEORPFeedbackInfo *)-[GEORPFeedbackInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_545_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_546_0;
    }
    GEORPFeedbackInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackInfo *)self readAll:0];
    if (self->_feedbackId) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_feedbackComponents;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEORPFeedbackInfo _readFeedbackComponents]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_feedbackComponents;
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
  uint64_t v8 = (id *)a3;
  [(GEORPFeedbackInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_feedbackId) {
    objc_msgSend(v8, "setFeedbackId:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 13) = self->_status;
    *((unsigned char *)v8 + 56) |= 1u;
  }
  if ([(GEORPFeedbackInfo *)self feedbackComponentsCount])
  {
    [v8 clearFeedbackComponents];
    unint64_t v4 = [(GEORPFeedbackInfo *)self feedbackComponentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackInfo *)self feedbackComponentAtIndex:i];
        [v8 addFeedbackComponent:v7];
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackInfo *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_feedbackId copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_status;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = self->_feedbackComponents;
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
        [(id)v5 addFeedbackComponent:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  uint64_t v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPFeedbackInfo *)self readAll:1];
  [v4 readAll:1];
  feedbackId = self->_feedbackId;
  if ((unint64_t)feedbackId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](feedbackId, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_status != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  feedbackComponents = self->_feedbackComponents;
  if ((unint64_t)feedbackComponents | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](feedbackComponents, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPFeedbackInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_feedbackId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(NSMutableArray *)self->_feedbackComponents hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 4)) {
    -[GEORPFeedbackInfo setFeedbackId:](self, "setFeedbackId:");
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_status = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackInfo addFeedbackComponent:](self, "addFeedbackComponent:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_550);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackInfo *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_feedbackComponents;
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
  objc_storeStrong((id *)&self->_feedbackId, 0);
  objc_storeStrong((id *)&self->_feedbackComponents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end