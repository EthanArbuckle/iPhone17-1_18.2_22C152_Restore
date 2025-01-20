@interface GEORating
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORating)init;
- (GEORating)initWithData:(id)a3;
- (GEORating)initWithSampleSizeForUserRatingScore:(unsigned int)a3 normalizedUserRatingScore:(float)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsReview:(uint64_t)a1;
- (void)addReview:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEORating

- (GEORating)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORating;
  v2 = [(GEORating *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORating)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORating;
  v3 = [(GEORating *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addReview:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEORatingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReviews_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEORating _addNoFlagsReview:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 92) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 92) |= 0x200u;
  }
}

- (void)_addNoFlagsReview:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORating;
  v4 = [(GEORating *)&v8 description];
  id v5 = [(GEORating *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORating _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEORating readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 92);
    if ((v5 & 2) != 0)
    {
      objc_super v6 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
      [v4 setObject:v6 forKey:@"score"];

      __int16 v5 = *(_WORD *)(a1 + 92);
    }
    if (v5)
    {
      id v7 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
      [v4 setObject:v7 forKey:@"maxScore"];

      __int16 v5 = *(_WORD *)(a1 + 92);
    }
    if ((v5 & 4) != 0)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
      [v4 setObject:v8 forKey:@"numberOfRatings"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEORatingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProvider_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v11 = *(id *)(a1 + 40);
    if (v11) {
      [v4 setObject:v11 forKey:@"provider"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEORatingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readURL_tags_3058);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v14 = *(id *)(a1 + 24);
    if (v14)
    {
      if (a2) {
        v15 = @"uRL";
      }
      else {
        v15 = @"URL";
      }
      [v4 setObject:v14 forKey:v15];
    }

    if ([*(id *)(a1 + 56) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v17 = *(id *)(a1 + 56);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v37 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v16 addObject:v22];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v18);
      }

      [v4 setObject:v16 forKey:@"review"];
    }
    if ((*(_WORD *)(a1 + 92) & 8) != 0)
    {
      v23 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
      [v4 setObject:v23 forKey:@"numberOfReviews"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v24 = *(void **)(a1 + 8);
      if (v24)
      {
        id v25 = v24;
        objc_sync_enter(v25);
        GEORatingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRatingCategoryId_tags);
        objc_sync_exit(v25);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v26 = *(id *)(a1 + 48);
    if (v26) {
      [v4 setObject:v26 forKey:@"ratingCategoryId"];
    }

    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __39__GEORating__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;
      }
      else
      {
        id v32 = v28;
      }
      [v4 setObject:v32 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORating _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_3081;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3082;
      }
      GEORatingReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEORatingCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __39__GEORating__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEORatingReadAllFrom((uint64_t)self, a3, 0);
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
    if ((*(_WORD *)&self->_flags & 0x3E0) == 0)
    {
      id v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_27;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORating readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
LABEL_24:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_24;
  }
LABEL_5:
  if ((flags & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_provider) {
    PBDataWriterWriteStringField();
  }
  if (self->_uRL) {
    PBDataWriterWriteStringField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_reviews;
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

  if ((*(_WORD *)&self->_flags & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_ratingCategoryId) {
    PBDataWriterWriteStringField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_27:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORatingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORating readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
LABEL_21:
    *(double *)(v5 + 32) = self->_maxScore;
    *(_WORD *)(v5 + 92) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(double *)(v5 + 64) = self->_score;
  *(_WORD *)(v5 + 92) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_21;
  }
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 84) = self->_numberOfRatings;
    *(_WORD *)(v5 + 92) |= 4u;
  }
LABEL_9:
  uint64_t v10 = [(NSString *)self->_provider copyWithZone:a3];
  id v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_uRL copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v14 = self->_reviews;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        -[GEORating addReview:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_numberOfReviews;
    *(_WORD *)(v5 + 92) |= 8u;
  }
  uint64_t v19 = -[NSString copyWithZone:](self->_ratingCategoryId, "copyWithZone:", a3, (void)v23);
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  -[GEORating readAll:]((uint64_t)self, 1);
  -[GEORating readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_score != *((double *)v4 + 8)) {
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) != 0)
  {
LABEL_30:
    char v12 = 0;
    goto LABEL_31;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_maxScore != *((double *)v4 + 4)) {
      goto LABEL_30;
    }
  }
  else if (v6)
  {
    goto LABEL_30;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numberOfRatings != *((_DWORD *)v4 + 21)) {
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_30;
  }
  provider = self->_provider;
  if ((unint64_t)provider | *((void *)v4 + 5) && !-[NSString isEqual:](provider, "isEqual:")) {
    goto LABEL_30;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:")) {
      goto LABEL_30;
    }
  }
  reviews = self->_reviews;
  if ((unint64_t)reviews | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](reviews, "isEqual:")) {
      goto LABEL_30;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_numberOfReviews != *((_DWORD *)v4 + 22)) {
      goto LABEL_30;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_30;
  }
  ratingCategoryId = self->_ratingCategoryId;
  if ((unint64_t)ratingCategoryId | *((void *)v4 + 6)) {
    char v12 = -[NSString isEqual:](ratingCategoryId, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  -[GEORating readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    double score = self->_score;
    double v6 = -score;
    if (score >= 0.0) {
      double v6 = self->_score;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (flags)
  {
    double maxScore = self->_maxScore;
    double v11 = -maxScore;
    if (maxScore >= 0.0) {
      double v11 = self->_maxScore;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((flags & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_numberOfRatings;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_provider hash];
  NSUInteger v16 = [(NSString *)self->_uRL hash];
  uint64_t v17 = [(NSMutableArray *)self->_reviews hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v18 = 2654435761 * self->_numberOfReviews;
  }
  else {
    uint64_t v18 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ [(NSString *)self->_ratingCategoryId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviews, 0);
  objc_storeStrong((id *)&self->_ratingCategoryId, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORating)initWithSampleSizeForUserRatingScore:(unsigned int)a3 normalizedUserRatingScore:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GEORating;
  double v6 = [(GEORating *)&v10 init];
  long double v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_flags |= 0x200u;
    *(_WORD *)&v6->_flags |= 8u;
    v6->_numberOfReviews = a3;
    *(_WORD *)&v6->_flags |= 0x200u;
    *(_WORD *)&v6->_flags |= 2u;
    v6->_double score = a4;
    *(_WORD *)&v6->_flags |= 0x200u;
    *(_WORD *)&v6->_flags |= 1u;
    v6->_double maxScore = 100.0;
    double v8 = v6;
  }

  return v7;
}

@end