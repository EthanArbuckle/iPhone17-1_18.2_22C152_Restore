@interface GEORPFeedbackConversationMessage
+ (BOOL)isValid:(id)a3;
+ (Class)surveyResponseType;
- (BOOL)hasComments;
- (BOOL)hasPostedAt;
- (BOOL)hasPostedBy;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackConversationMessage)init;
- (GEORPFeedbackConversationMessage)initWithData:(id)a3;
- (GEORPFeedbackConversationMessage)initWithDictionary:(id)a3;
- (GEORPFeedbackConversationMessage)initWithJSON:(id)a3;
- (GEORPPostedBy)postedBy;
- (GEORPTimestamp)postedAt;
- (NSMutableArray)surveyResponses;
- (NSString)comments;
- (NSString)uuid;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)surveyResponseAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)surveyResponsesCount;
- (void)_addNoFlagsSurveyResponse:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readComments;
- (void)_readPostedAt;
- (void)_readPostedBy;
- (void)_readSurveyResponses;
- (void)_readUuid;
- (void)addSurveyResponse:(id)a3;
- (void)clearSurveyResponses;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setComments:(id)a3;
- (void)setPostedAt:(id)a3;
- (void)setPostedBy:(id)a3;
- (void)setSurveyResponses:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackConversationMessage

- (GEORPFeedbackConversationMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackConversationMessage;
  v2 = [(GEORPFeedbackConversationMessage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackConversationMessage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackConversationMessage;
  v3 = [(GEORPFeedbackConversationMessage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackConversationMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUuid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (NSString)uuid
{
  -[GEORPFeedbackConversationMessage _readUuid]((uint64_t)self);
  uuid = self->_uuid;

  return uuid;
}

- (void)setUuid:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)_readPostedBy
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
        GEORPFeedbackConversationMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPostedBy_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPostedBy
{
  return self->_postedBy != 0;
}

- (GEORPPostedBy)postedBy
{
  -[GEORPFeedbackConversationMessage _readPostedBy]((uint64_t)self);
  postedBy = self->_postedBy;

  return postedBy;
}

- (void)setPostedBy:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_postedBy, a3);
}

- (void)_readPostedAt
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
        GEORPFeedbackConversationMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPostedAt_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPostedAt
{
  return self->_postedAt != 0;
}

- (GEORPTimestamp)postedAt
{
  -[GEORPFeedbackConversationMessage _readPostedAt]((uint64_t)self);
  postedAt = self->_postedAt;

  return postedAt;
}

- (void)setPostedAt:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_postedAt, a3);
}

- (void)_readComments
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
        GEORPFeedbackConversationMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComments_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasComments
{
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPFeedbackConversationMessage _readComments]((uint64_t)self);
  comments = self->_comments;

  return comments;
}

- (void)setComments:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (void)_readSurveyResponses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackConversationMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSurveyResponses_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)surveyResponses
{
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  surveyResponses = self->_surveyResponses;

  return surveyResponses;
}

- (void)setSurveyResponses:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  surveyResponses = self->_surveyResponses;
  self->_surveyResponses = v4;
}

- (void)clearSurveyResponses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  surveyResponses = self->_surveyResponses;

  [(NSMutableArray *)surveyResponses removeAllObjects];
}

- (void)addSurveyResponse:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  -[GEORPFeedbackConversationMessage _addNoFlagsSurveyResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsSurveyResponse:(uint64_t)a1
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

- (unint64_t)surveyResponsesCount
{
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  surveyResponses = self->_surveyResponses;

  return [(NSMutableArray *)surveyResponses count];
}

- (id)surveyResponseAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  surveyResponses = self->_surveyResponses;

  return (id)[(NSMutableArray *)surveyResponses objectAtIndex:a3];
}

+ (Class)surveyResponseType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackConversationMessage;
  id v4 = [(GEORPFeedbackConversationMessage *)&v8 description];
  id v5 = [(GEORPFeedbackConversationMessage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackConversationMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 uuid];
    if (v5) {
      [v4 setObject:v5 forKey:@"uuid"];
    }

    objc_super v6 = [(id)a1 postedBy];
    id v7 = v6;
    if (v6)
    {
      if (a2)
      {
        objc_super v8 = [v6 jsonRepresentation];
        v9 = @"postedBy";
      }
      else
      {
        objc_super v8 = [v6 dictionaryRepresentation];
        v9 = @"posted_by";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 postedAt];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"postedAt";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"posted_at";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = [(id)a1 comments];
    if (v14) {
      [v4 setObject:v14 forKey:@"comments"];
    }

    if ([*(id *)(a1 + 48) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v15 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v18);
      }

      if (a2) {
        v23 = @"surveyResponse";
      }
      else {
        v23 = @"survey_response";
      }
      [v4 setObject:v15 forKey:v23];
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __62__GEORPFeedbackConversationMessage__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackConversationMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEORPFeedbackConversationMessage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackConversationMessage)initWithDictionary:(id)a3
{
  return (GEORPFeedbackConversationMessage *)-[GEORPFeedbackConversationMessage _initWithDictionary:isJSON:](self, a3, 0);
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
      objc_super v6 = [v5 objectForKeyedSubscript:@"uuid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setUuid:v7];
      }
      if (a3) {
        objc_super v8 = @"postedBy";
      }
      else {
        objc_super v8 = @"posted_by";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEORPPostedBy alloc];
        if (a3) {
          uint64_t v11 = [(GEORPPostedBy *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEORPPostedBy *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setPostedBy:v11];
      }
      if (a3) {
        v13 = @"postedAt";
      }
      else {
        v13 = @"posted_at";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEORPTimestamp alloc];
        if (a3) {
          uint64_t v16 = [(GEORPTimestamp *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEORPTimestamp *)v15 initWithDictionary:v14];
        }
        uint64_t v17 = (void *)v16;
        [a1 setPostedAt:v16];
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:@"comments"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = (void *)[v18 copy];
        [a1 setComments:v19];
      }
      if (a3) {
        v20 = @"surveyResponse";
      }
      else {
        v20 = @"survey_response";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v5;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v28 = [GEORPFeedbackSurveyResponse alloc];
                if (a3) {
                  uint64_t v29 = [(GEORPFeedbackSurveyResponse *)v28 initWithJSON:v27];
                }
                else {
                  uint64_t v29 = [(GEORPFeedbackSurveyResponse *)v28 initWithDictionary:v27];
                }
                v30 = (void *)v29;
                [a1 addSurveyResponse:v29];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v24);
        }

        id v5 = v32;
      }
    }
  }

  return a1;
}

- (GEORPFeedbackConversationMessage)initWithJSON:(id)a3
{
  return (GEORPFeedbackConversationMessage *)-[GEORPFeedbackConversationMessage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_408_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_409_0;
    }
    GEORPFeedbackConversationMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackConversationMessageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackConversationMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackConversationMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackConversationMessageIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPFeedbackConversationMessage *)self readAll:0];
    if (self->_uuid) {
      PBDataWriterWriteStringField();
    }
    if (self->_postedBy) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_postedAt) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_comments) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_surveyResponses;
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

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPFeedbackConversationMessage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_uuid) {
    objc_msgSend(v8, "setUuid:");
  }
  if (self->_postedBy) {
    objc_msgSend(v8, "setPostedBy:");
  }
  if (self->_postedAt) {
    objc_msgSend(v8, "setPostedAt:");
  }
  if (self->_comments) {
    objc_msgSend(v8, "setComments:");
  }
  if ([(GEORPFeedbackConversationMessage *)self surveyResponsesCount])
  {
    [v8 clearSurveyResponses];
    unint64_t v4 = [(GEORPFeedbackConversationMessage *)self surveyResponsesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackConversationMessage *)self surveyResponseAtIndex:i];
        [v8 addSurveyResponse:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackConversationMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackConversationMessage *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_uuid copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  id v10 = [(GEORPPostedBy *)self->_postedBy copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(GEORPTimestamp *)self->_postedAt copyWithZone:a3];
  long long v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_comments copyWithZone:a3];
  long long v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = self->_surveyResponses;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v5 addSurveyResponse:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackConversationMessage *)self readAll:1],
         [v4 readAll:1],
         uuid = self->_uuid,
         !((unint64_t)uuid | v4[7]))
     || -[NSString isEqual:](uuid, "isEqual:"))
    && ((postedBy = self->_postedBy, !((unint64_t)postedBy | v4[5]))
     || -[GEORPPostedBy isEqual:](postedBy, "isEqual:"))
    && ((postedAt = self->_postedAt, !((unint64_t)postedAt | v4[4]))
     || -[GEORPTimestamp isEqual:](postedAt, "isEqual:"))
    && ((comments = self->_comments, !((unint64_t)comments | v4[3]))
     || -[NSString isEqual:](comments, "isEqual:")))
  {
    surveyResponses = self->_surveyResponses;
    if ((unint64_t)surveyResponses | v4[6]) {
      char v10 = -[NSMutableArray isEqual:](surveyResponses, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEORPFeedbackConversationMessage *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  unint64_t v4 = [(GEORPPostedBy *)self->_postedBy hash] ^ v3;
  unint64_t v5 = [(GEORPTimestamp *)self->_postedAt hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_comments hash];
  return v6 ^ [(NSMutableArray *)self->_surveyResponses hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[7]) {
    -[GEORPFeedbackConversationMessage setUuid:](self, "setUuid:");
  }
  postedBy = self->_postedBy;
  id v6 = v4[5];
  if (postedBy)
  {
    if (v6) {
      -[GEORPPostedBy mergeFrom:](postedBy, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPFeedbackConversationMessage setPostedBy:](self, "setPostedBy:");
  }
  postedAt = self->_postedAt;
  id v8 = v4[4];
  if (postedAt)
  {
    if (v8) {
      -[GEORPTimestamp mergeFrom:](postedAt, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORPFeedbackConversationMessage setPostedAt:](self, "setPostedAt:");
  }
  if (v4[3]) {
    -[GEORPFeedbackConversationMessage setComments:](self, "setComments:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v4[6];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[GEORPFeedbackConversationMessage addSurveyResponse:](self, "addSurveyResponse:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
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
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackConversationMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_413);
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
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackConversationMessage *)self readAll:0];
    [(GEORPPostedBy *)self->_postedBy clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_surveyResponses;
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
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_surveyResponses, 0);
  objc_storeStrong((id *)&self->_postedBy, 0);
  objc_storeStrong((id *)&self->_postedAt, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end