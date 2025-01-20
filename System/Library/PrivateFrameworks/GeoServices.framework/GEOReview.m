@interface GEOReview
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOReview)init;
- (GEOReview)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOReview

- (GEOReview)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOReview;
  v2 = [(GEOReview *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOReview)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOReview;
  v3 = [(GEOReview *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOReview;
  v4 = [(GEOReview *)&v8 description];
  v5 = [(GEOReview *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOReview _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOReview readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSnippet_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v7 = *(id *)(a1 + 56);
    if (v7) {
      [v4 setObject:v7 forKey:@"snippet"];
    }

    __int16 v8 = *(_WORD *)(a1 + 88);
    if ((v8 & 2) != 0)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      [v4 setObject:v9 forKey:@"score"];

      __int16 v8 = *(_WORD *)(a1 + 88);
    }
    if (v8)
    {
      v10 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
      [v4 setObject:v10 forKey:@"reviewTime"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReviewer_tags_0);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v13 = *(id *)(a1 + 40);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"reviewer"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUid_tags_3101);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v18 = *(id *)(a1 + 64);
    if (v18) {
      [v4 setObject:v18 forKey:@"uid"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOReviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguageCode_tags_3102);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v21 = *(id *)(a1 + 24);
    if (v21) {
      [v4 setObject:v21 forKey:@"languageCode"];
    }

    if ((*(_WORD *)(a1 + 88) & 4) != 0)
    {
      v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
      if (a2) {
        v23 = @"isChinaSuppressed";
      }
      else {
        v23 = @"is_china_suppressed";
      }
      [v4 setObject:v22 forKey:v23];
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
        v31[2] = __39__GEOReview__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOReview _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_3119;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_3120;
      }
      GEOReviewReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOUser readAll:](*(void *)(a1 + 40), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __39__GEOReview__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    __int16 v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    __int16 v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOReviewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x140) != 0) {
    goto LABEL_8;
  }
  if ((flags & 0x20) != 0)
  {
    reviewer = self->_reviewer;
    if (reviewer)
    {
      os_unfair_lock_lock_with_options();
      BOOL IsDirty = _GEOUserIsDirty((uint64_t)reviewer);
      os_unfair_lock_unlock(&reviewer->_readerLock);
      if (IsDirty) {
        goto LABEL_8;
      }
      __int16 flags = (__int16)self->_flags;
    }
  }
  if ((flags & 0x90) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v12 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    goto LABEL_23;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOReview readAll:]((uint64_t)self, 0);
  if (self->_snippet) {
    PBDataWriterWriteStringField();
  }
  __int16 v8 = (__int16)self->_flags;
  id v9 = v12;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v9 = v12;
    __int16 v8 = (__int16)self->_flags;
  }
  if (v8)
  {
    PBDataWriterWriteDoubleField();
    id v9 = v12;
  }
  if (self->_reviewer)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v12;
  }
  if (self->_uid)
  {
    PBDataWriterWriteStringField();
    id v9 = v12;
  }
  if (self->_languageCode)
  {
    PBDataWriterWriteStringField();
    id v9 = v12;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v9 = v12;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v9];
LABEL_23:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOReviewReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOReview readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_snippet copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_score;
    *(_WORD *)(v5 + 88) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 32) = self->_reviewTime;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  id v12 = [(GEOUser *)self->_reviewer copyWithZone:a3];
  id v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_uid copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_languageCode copyWithZone:a3];
  id v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 84) = self->_isChinaSuppressed;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  id v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOReview readAll:]((uint64_t)self, 1);
  -[GEOReview readAll:]((uint64_t)v4, 1);
  snippet = self->_snippet;
  if ((unint64_t)snippet | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](snippet, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_score != *((double *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_22;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_reviewTime != *((double *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if (v7)
  {
    goto LABEL_22;
  }
  reviewer = self->_reviewer;
  if ((unint64_t)reviewer | *((void *)v4 + 5) && !-[GEOUser isEqual:](reviewer, "isEqual:")) {
    goto LABEL_22;
  }
  uid = self->_uid;
  if ((unint64_t)uid | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](uid, "isEqual:")) {
      goto LABEL_22;
    }
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 v11 = *((_WORD *)v4 + 44);
  BOOL v12 = (v11 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v11 & 4) == 0)
    {
LABEL_22:
      BOOL v12 = 0;
      goto LABEL_23;
    }
    if (self->_isChinaSuppressed)
    {
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 84))
    {
      goto LABEL_22;
    }
    BOOL v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  -[GEOReview readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_snippet hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    double score = self->_score;
    double v7 = -score;
    if (score >= 0.0) {
      double v7 = self->_score;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if (flags)
  {
    double reviewTime = self->_reviewTime;
    double v12 = -reviewTime;
    if (reviewTime >= 0.0) {
      double v12 = self->_reviewTime;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v15 = [(GEOUser *)self->_reviewer hash];
  NSUInteger v16 = [(NSString *)self->_uid hash];
  NSUInteger v17 = [(NSString *)self->_languageCode hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v18 = 2654435761 * self->_isChinaSuppressed;
  }
  else {
    uint64_t v18 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
  objc_storeStrong((id *)&self->_reviewer, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end