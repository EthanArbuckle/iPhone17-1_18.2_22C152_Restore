@interface GEOPDReview
+ (id)reviewsForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDReview)init;
- (GEOPDReview)initWithData:(id)a3;
- (id)_bestSnippet;
- (id)_bestSnippetLocale;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)rating;
- (id)reviewId;
- (id)reviewer;
- (id)snippets;
- (unint64_t)hash;
- (void)_addNoFlagsSnippet:(uint64_t)a1;
- (void)_readRating;
- (void)_readReviewId;
- (void)_readReviewer;
- (void)_readSnippets;
- (void)addSnippet:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDReview

- (id)_bestSnippet
{
  v2 = -[GEOPDReview snippets]((id *)&self->super.super.isa);
  v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)_bestSnippetLocale
{
  v2 = -[GEOPDReview snippets]((id *)&self->super.super.isa);
  v3 = +[GEOLocalizedString bestLocalizedStringForCurrentLocale:v2 fallbackToFirstAvailable:1];
  v4 = [v3 locale];

  return v4;
}

+ (id)reviewsForPlaceData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__GEOPDReview_PlaceDataExtras__reviewsForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:7 usingBlock:v10];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __52__GEOPDReview_PlaceDataExtras__reviewsForPlaceData___block_invoke(uint64_t a1, id *a2)
{
  v3 = -[GEOPDComponentValue review](a2);
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

- (GEOPDReview)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDReview;
  v2 = [(GEOPDReview *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDReview)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDReview;
  v3 = [(GEOPDReview *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSnippets
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
        GEOPDReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSnippets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)snippets
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDReview _readSnippets]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSnippet:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDReview _readSnippets](a1);
    -[GEOPDReview _addNoFlagsSnippet:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsSnippet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readReviewer
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
        GEOPDReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReviewer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)reviewer
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDReview _readReviewer]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readReviewId
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
        GEOPDReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReviewId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)reviewId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDReview _readReviewId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readRating
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
        GEOPDReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRating_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)rating
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDReview _readRating]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDReview;
  id v4 = [(GEOPDReview *)&v8 description];
  id v5 = [(GEOPDReview *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDReview _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDReview readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 56) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v6 = *(id *)(a1 + 56);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v33 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"snippet"];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      v13 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      if (a2) {
        v14 = @"reviewTime";
      }
      else {
        v14 = @"review_time";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = -[GEOPDReview reviewer]((id *)a1);
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"reviewer"];
    }
    v18 = -[GEOPDReview reviewId]((id *)a1);
    if (v18)
    {
      if (a2) {
        v19 = @"reviewId";
      }
      else {
        v19 = @"review_id";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = -[GEOPDReview rating]((id *)a1);
    v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"rating"];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __41__GEOPDReview__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPDReview _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_8343;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_8344;
      }
      GEOPDReviewReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDReviewCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __41__GEOPDReview__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDReviewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x60) != 0) {
    goto LABEL_8;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    reviewer = self->_reviewer;
    if (reviewer)
    {
      os_unfair_lock_lock_with_options();
      BOOL IsDirty = _GEOPDUserIsDirty((uint64_t)reviewer);
      os_unfair_lock_unlock(&reviewer->_readerLock);
      if (IsDirty)
      {
LABEL_8:
        os_unfair_lock_unlock(&self->_readerLock);
        -[GEOPDReview readAll:]((uint64_t)self, 0);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = self->_snippets;
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v9);
              }
              PBDataWriterWriteSubmessage();
            }
            uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }

        if (*(unsigned char *)&self->_flags) {
          PBDataWriterWriteDoubleField();
        }
        if (self->_reviewer) {
          PBDataWriterWriteSubmessage();
        }
        if (self->_reviewId) {
          PBDataWriterWriteStringField();
        }
        if (self->_rating) {
          PBDataWriterWriteSubmessage();
        }
        -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v19);
        goto LABEL_24;
      }
      char flags = (char)self->_flags;
    }
  }
  if ((flags & 0xC) != 0) {
    goto LABEL_8;
  }
  if ((flags & 0x20) != 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = self->_snippets;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          if (GEOLocalizedStringIsDirty(*(void *)(*((void *)&v23 + 1) + 8 * j)))
          {

            goto LABEL_8;
          }
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  v17 = self->_reader;
  objc_sync_enter(v17);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v4 writeData:v18];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v17);
LABEL_24:
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
      GEOPDReviewReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDReview readAll:]((uint64_t)self, 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = self->_snippets;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        -[GEOPDReview addSnippet:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 40) = self->_reviewTime;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  id v14 = -[GEOPDUser copyWithZone:](self->_reviewer, "copyWithZone:", a3, (void)v22);
  uint64_t v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_reviewId copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  id v18 = [(GEOPDRating *)self->_rating copyWithZone:a3];
  long long v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  long long v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDReview readAll:]((uint64_t)self, 1);
  -[GEOPDReview readAll:]((uint64_t)v4, 1);
  snippets = self->_snippets;
  if ((unint64_t)snippets | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](snippets, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_reviewTime != *((double *)v4 + 5)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  reviewer = self->_reviewer;
  if ((unint64_t)reviewer | *((void *)v4 + 6) && !-[GEOPDUser isEqual:](reviewer, "isEqual:")) {
    goto LABEL_15;
  }
  reviewId = self->_reviewId;
  if ((unint64_t)reviewId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](reviewId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  rating = self->_rating;
  if ((unint64_t)rating | *((void *)v4 + 3)) {
    char v9 = -[GEOPDRating isEqual:](rating, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDReview readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_snippets hash];
  if (*(unsigned char *)&self->_flags)
  {
    double reviewTime = self->_reviewTime;
    double v6 = -reviewTime;
    if (reviewTime >= 0.0) {
      double v6 = self->_reviewTime;
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
  unint64_t v9 = v4 ^ v3;
  unint64_t v10 = [(GEOPDUser *)self->_reviewer hash];
  NSUInteger v11 = v9 ^ v10 ^ [(NSString *)self->_reviewId hash];
  return v11 ^ [(GEOPDRating *)self->_rating hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippets, 0);
  objc_storeStrong((id *)&self->_reviewer, 0);
  objc_storeStrong((id *)&self->_reviewId, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end