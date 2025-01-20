@interface GEOLogMsgStateARPRatingSubmission
+ (BOOL)isValid:(id)a3;
+ (Class)ratingsType;
- (BOOL)hasIsFromMapsSuggesions;
- (BOOL)hasIsFromRecommendationCard;
- (BOOL)hasIsPlacecardInlineSubmission;
- (BOOL)hasOriginTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMapsSuggesions;
- (BOOL)isFromRecommendationCard;
- (BOOL)isPlacecardInlineSubmission;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateARPRatingSubmission)init;
- (GEOLogMsgStateARPRatingSubmission)initWithData:(id)a3;
- (GEOLogMsgStateARPRatingSubmission)initWithDictionary:(id)a3;
- (GEOLogMsgStateARPRatingSubmission)initWithJSON:(id)a3;
- (NSMutableArray)ratings;
- (NSString)originTarget;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)ratingsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)ratingsCount;
- (void)_addNoFlagsRatings:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readOriginTarget;
- (void)_readRatings;
- (void)addRatings:(id)a3;
- (void)clearRatings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIsFromMapsSuggesions:(BOOL)a3;
- (void)setHasIsFromRecommendationCard:(BOOL)a3;
- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3;
- (void)setIsFromMapsSuggesions:(BOOL)a3;
- (void)setIsFromRecommendationCard:(BOOL)a3;
- (void)setIsPlacecardInlineSubmission:(BOOL)a3;
- (void)setOriginTarget:(id)a3;
- (void)setRatings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateARPRatingSubmission

- (GEOLogMsgStateARPRatingSubmission)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateARPRatingSubmission;
  v2 = [(GEOLogMsgStateARPRatingSubmission *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateARPRatingSubmission)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateARPRatingSubmission;
  v3 = [(GEOLogMsgStateARPRatingSubmission *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginTarget
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateARPRatingSubmissionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginTarget_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasOriginTarget
{
  return self->_originTarget != 0;
}

- (NSString)originTarget
{
  -[GEOLogMsgStateARPRatingSubmission _readOriginTarget]((uint64_t)self);
  originTarget = self->_originTarget;

  return originTarget;
}

- (void)setOriginTarget:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_originTarget, a3);
}

- (BOOL)isFromRecommendationCard
{
  return self->_isFromRecommendationCard;
}

- (void)setIsFromRecommendationCard:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_isFromRecommendationCard = a3;
}

- (void)setHasIsFromRecommendationCard:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsFromRecommendationCard
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isFromMapsSuggesions
{
  return self->_isFromMapsSuggesions;
}

- (void)setIsFromMapsSuggesions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_isFromMapsSuggesions = a3;
}

- (void)setHasIsFromMapsSuggesions:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasIsFromMapsSuggesions
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isPlacecardInlineSubmission
{
  return self->_isPlacecardInlineSubmission;
}

- (void)setIsPlacecardInlineSubmission:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_isPlacecardInlineSubmission = a3;
}

- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsPlacecardInlineSubmission
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readRatings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateARPRatingSubmissionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRatings_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)ratings
{
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  ratings = self->_ratings;

  return ratings;
}

- (void)setRatings:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  ratings = self->_ratings;
  self->_ratings = v4;
}

- (void)clearRatings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  ratings = self->_ratings;

  [(NSMutableArray *)ratings removeAllObjects];
}

- (void)addRatings:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  -[GEOLogMsgStateARPRatingSubmission _addNoFlagsRatings:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsRatings:(uint64_t)a1
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

- (unint64_t)ratingsCount
{
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  ratings = self->_ratings;

  return [(NSMutableArray *)ratings count];
}

- (id)ratingsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  ratings = self->_ratings;

  return (id)[(NSMutableArray *)ratings objectAtIndex:a3];
}

+ (Class)ratingsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateARPRatingSubmission;
  id v4 = [(GEOLogMsgStateARPRatingSubmission *)&v8 description];
  id v5 = [(GEOLogMsgStateARPRatingSubmission *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateARPRatingSubmission _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_26;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 originTarget];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"originTarget";
    }
    else {
      objc_super v6 = @"origin_target";
    }
    [v4 setObject:v5 forKey:v6];
  }

  char v7 = *(unsigned char *)(a1 + 48);
  if ((v7 & 2) != 0)
  {
    v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 45)];
    if (a2) {
      v20 = @"isFromRecommendationCard";
    }
    else {
      v20 = @"is_from_recommendation_card";
    }
    [v4 setObject:v19 forKey:v20];

    char v7 = *(unsigned char *)(a1 + 48);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)(a1 + 48) & 1) == 0)
  {
    goto LABEL_9;
  }
  v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
  if (a2) {
    v22 = @"isFromMapsSuggesions";
  }
  else {
    v22 = @"is_from_maps_suggesions";
  }
  [v4 setObject:v21 forKey:v22];

  if ((*(unsigned char *)(a1 + 48) & 4) != 0)
  {
LABEL_10:
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 46)];
    if (a2) {
      v9 = @"isPlacecardInlineSubmission";
    }
    else {
      v9 = @"is_placecard_inline_submission";
    }
    [v4 setObject:v8 forKey:v9];
  }
LABEL_14:
  if ([*(id *)(a1 + 24) count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = *(id *)(a1 + 24);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (a2) {
            [v16 jsonRepresentation];
          }
          else {
          v17 = objc_msgSend(v16, "dictionaryRepresentation", (void)v23);
          }
          objc_msgSend(v10, "addObject:", v17, (void)v23);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"ratings"];
  }
LABEL_26:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateARPRatingSubmission _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateARPRatingSubmission)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateARPRatingSubmission *)-[GEOLogMsgStateARPRatingSubmission _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"originTarget";
      }
      else {
        objc_super v6 = @"origin_target";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setOriginTarget:v8];
      }
      if (a3) {
        v9 = @"isFromRecommendationCard";
      }
      else {
        v9 = @"is_from_recommendation_card";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsFromRecommendationCard:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        id v11 = @"isFromMapsSuggesions";
      }
      else {
        id v11 = @"is_from_maps_suggesions";
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsFromMapsSuggesions:", objc_msgSend(v12, "BOOLValue"));
      }

      if (a3) {
        uint64_t v13 = @"isPlacecardInlineSubmission";
      }
      else {
        uint64_t v13 = @"is_placecard_inline_submission";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsPlacecardInlineSubmission:", objc_msgSend(v14, "BOOLValue"));
      }

      v15 = [v5 objectForKeyedSubscript:@"ratings"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = v15;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v22 = [GEOARPRating alloc];
                if (a3) {
                  uint64_t v23 = [(GEOARPRating *)v22 initWithJSON:v21];
                }
                else {
                  uint64_t v23 = [(GEOARPRating *)v22 initWithDictionary:v21];
                }
                long long v24 = (void *)v23;
                [a1 addRatings:v23];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v18);
        }

        v15 = v26;
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateARPRatingSubmission)initWithJSON:(id)a3
{
  return (GEOLogMsgStateARPRatingSubmission *)-[GEOLogMsgStateARPRatingSubmission _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_6522;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_6523;
    }
    GEOLogMsgStateARPRatingSubmissionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStateARPRatingSubmissionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateARPRatingSubmissionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateARPRatingSubmissionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x38) == 0)
    {
      id v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_21;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateARPRatingSubmission *)self readAll:0];
  if (self->_originTarget) {
    PBDataWriterWriteStringField();
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_7;
    }
LABEL_18:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_18;
  }
LABEL_7:
  if ((flags & 4) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v7 = self->_ratings;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

LABEL_21:
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOLogMsgStateARPRatingSubmission *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 8) = self->_readerMarkPos;
  *((_DWORD *)v9 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originTarget) {
    objc_msgSend(v9, "setOriginTarget:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    *((unsigned char *)v9 + 44) = self->_isFromMapsSuggesions;
    *((unsigned char *)v9 + 48) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *((unsigned char *)v9 + 45) = self->_isFromRecommendationCard;
  *((unsigned char *)v9 + 48) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_15;
  }
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    *((unsigned char *)v9 + 46) = self->_isPlacecardInlineSubmission;
    *((unsigned char *)v9 + 48) |= 4u;
  }
LABEL_7:
  if ([(GEOLogMsgStateARPRatingSubmission *)self ratingsCount])
  {
    [v9 clearRatings];
    unint64_t v5 = [(GEOLogMsgStateARPRatingSubmission *)self ratingsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLogMsgStateARPRatingSubmission *)self ratingsAtIndex:i];
        [v9 addRatings:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStateARPRatingSubmissionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateARPRatingSubmission *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_originTarget copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 45) = self->_isFromRecommendationCard;
    *(unsigned char *)(v5 + 48) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 44) = self->_isFromMapsSuggesions;
  *(unsigned char *)(v5 + 48) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 46) = self->_isPlacecardInlineSubmission;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_9:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_ratings;
  uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addRatings:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOLogMsgStateARPRatingSubmission *)self readAll:1];
  [v4 readAll:1];
  originTarget = self->_originTarget;
  if ((unint64_t)originTarget | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](originTarget, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0) {
      goto LABEL_24;
    }
    if (self->_isFromRecommendationCard)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0) {
      goto LABEL_24;
    }
    if (self->_isFromMapsSuggesions)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0) {
      goto LABEL_30;
    }
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 48) & 4) == 0) {
    goto LABEL_24;
  }
  if (!self->_isPlacecardInlineSubmission)
  {
    if (!*((unsigned char *)v4 + 46)) {
      goto LABEL_30;
    }
    goto LABEL_24;
  }
  if (!*((unsigned char *)v4 + 46)) {
    goto LABEL_24;
  }
LABEL_30:
  ratings = self->_ratings;
  if ((unint64_t)ratings | *((void *)v4 + 3)) {
    char v6 = -[NSMutableArray isEqual:](ratings, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateARPRatingSubmission *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_originTarget hash];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_ratings hash];
  }
  uint64_t v4 = 2654435761 * self->_isFromRecommendationCard;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isFromMapsSuggesions;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isPlacecardInlineSubmission;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_ratings hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 2)) {
    -[GEOLogMsgStateARPRatingSubmission setOriginTarget:](self, "setOriginTarget:");
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_isFromRecommendationCard = *((unsigned char *)v4 + 45);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_isFromMapsSuggesions = *((unsigned char *)v4 + 44);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_6:
    self->_isPlacecardInlineSubmission = *((unsigned char *)v4 + 46);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_7:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOLogMsgStateARPRatingSubmission addRatings:](self, "addRatings:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_originTarget, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end