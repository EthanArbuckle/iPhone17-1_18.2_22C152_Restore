@interface GEOPDSearchQueryTagMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryTagMetadata)init;
- (GEOPDSearchQueryTagMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsModelVersion:(uint64_t)a1;
- (void)_addNoFlagsSpanScore:(uint64_t)a1;
- (void)addModelVersion:(uint64_t)a1;
- (void)addSpanScore:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryTagMetadata

- (GEOPDSearchQueryTagMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryTagMetadata;
  v2 = [(GEOPDSearchQueryTagMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryTagMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryTagMetadata;
  v3 = [(GEOPDSearchQueryTagMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addSpanScore:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryTagMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpanScores_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    -[GEOPDSearchQueryTagMetadata _addNoFlagsSpanScore:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsSpanScore:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addModelVersion:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryTagMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModelVersions_tags_2158);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    -[GEOPDSearchQueryTagMetadata _addNoFlagsModelVersion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsModelVersion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryTagMetadata;
  v4 = [(GEOPDSearchQueryTagMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryTagMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryTagMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    v4 = 0;
    goto LABEL_41;
  }
  -[GEOPDSearchQueryTagMetadata readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 72);
  if ((v5 & 8) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    [v4 setObject:v6 forKey:@"rank"];

    char v5 = *(unsigned char *)(a1 + 72);
  }
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_45:
    v29 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v30 = @"normalizedScore";
    }
    else {
      v30 = @"normalized_score";
    }
    [v4 setObject:v29 forKey:v30];

    if ((*(unsigned char *)(a1 + 72) & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  v28 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v4 setObject:v28 forKey:@"score"];

  char v5 = *(unsigned char *)(a1 + 72);
  if (v5) {
    goto LABEL_45;
  }
LABEL_6:
  if ((v5 & 4) != 0)
  {
LABEL_7:
    id v7 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    if (a2) {
      objc_super v8 = @"sigmoidScore";
    }
    else {
      objc_super v8 = @"sigmoid_score";
    }
    [v4 setObject:v7 forKey:v8];
  }
LABEL_11:
  if ([*(id *)(a1 + 48) count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (a2) {
            [v15 jsonRepresentation];
          }
          else {
          v16 = [v15 dictionaryRepresentation];
          }
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v12);
    }

    if (a2) {
      v17 = @"spanScore";
    }
    else {
      v17 = @"span_score";
    }
    [v4 setObject:v9 forKey:v17];
  }
  if ([*(id *)(a1 + 16) count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = *(id *)(a1 + 16);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          if (a2) {
            [v24 jsonRepresentation];
          }
          else {
          v25 = objc_msgSend(v24, "dictionaryRepresentation", (void)v31);
          }
          objc_msgSend(v18, "addObject:", v25, (void)v31);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v21);
    }

    if (a2) {
      v26 = @"modelVersion";
    }
    else {
      v26 = @"model_version";
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v26, (void)v31);
  }
LABEL_41:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryTagMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_2180;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2181;
      }
      GEOPDSearchQueryTagMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryTagMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryTagMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryTagMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
    goto LABEL_28;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryTagMetadata readAll:]((uint64_t)self, 0);
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_6;
      }
LABEL_25:
      PBDataWriterWriteDoubleField();
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_25;
  }
LABEL_6:
  if ((flags & 4) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = self->_spanScores;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_modelVersions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

LABEL_28:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryTagMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryTagMetadata readAll:]((uint64_t)self, 0);
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_rank;
    *(unsigned char *)(v5 + 72) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_8;
      }
LABEL_27:
      *(double *)(v5 + 24) = self->_normalizedScore;
      *(unsigned char *)(v5 + 72) |= 1u;
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v5 + 32) = self->_score;
  *(unsigned char *)(v5 + 72) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_27;
  }
LABEL_8:
  if ((flags & 4) != 0)
  {
LABEL_9:
    *(double *)(v5 + 40) = self->_sigmoidScore;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
LABEL_10:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = self->_spanScores;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchQueryTagMetadata addSpanScore:](v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_modelVersions;
  uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v8);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (void)v20);
        -[GEOPDSearchQueryTagMetadata addModelVersion:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  -[GEOPDSearchQueryTagMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryTagMetadata readAll:]((uint64_t)v4, 1);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_rank != *((_DWORD *)v4 + 17)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
LABEL_26:
    char v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_score != *((double *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_normalizedScore != *((double *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_sigmoidScore != *((double *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_26;
  }
  spanScores = self->_spanScores;
  if ((unint64_t)spanScores | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](spanScores, "isEqual:"))
  {
    goto LABEL_26;
  }
  modelVersions = self->_modelVersions;
  if ((unint64_t)modelVersions | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](modelVersions, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryTagMetadata readAll:]((uint64_t)self, 1);
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_rank;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double score = self->_score;
  double v6 = -score;
  if (score >= 0.0) {
    double v6 = self->_score;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if (flags)
  {
    double normalizedScore = self->_normalizedScore;
    double v12 = -normalizedScore;
    if (normalizedScore >= 0.0) {
      double v12 = self->_normalizedScore;
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
  if ((flags & 4) != 0)
  {
    double sigmoidScore = self->_sigmoidScore;
    double v17 = -sigmoidScore;
    if (sigmoidScore >= 0.0) {
      double v17 = self->_sigmoidScore;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  uint64_t v20 = v9 ^ v4 ^ v10 ^ v15 ^ [(NSMutableArray *)self->_spanScores hash];
  return v20 ^ [(NSMutableArray *)self->_modelVersions hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanScores, 0);
  objc_storeStrong((id *)&self->_modelVersions, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end