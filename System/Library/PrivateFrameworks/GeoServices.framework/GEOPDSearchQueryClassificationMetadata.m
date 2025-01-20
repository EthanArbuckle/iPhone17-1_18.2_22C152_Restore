@interface GEOPDSearchQueryClassificationMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryClassificationMetadata)init;
- (GEOPDSearchQueryClassificationMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsModelVersion:(uint64_t)a1;
- (void)_addNoFlagsPrediction:(uint64_t)a1;
- (void)addModelVersion:(uint64_t)a1;
- (void)addPrediction:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryClassificationMetadata

- (GEOPDSearchQueryClassificationMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryClassificationMetadata;
  v2 = [(GEOPDSearchQueryClassificationMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryClassificationMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryClassificationMetadata;
  v3 = [(GEOPDSearchQueryClassificationMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addPrediction:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPredictions_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchQueryClassificationMetadata _addNoFlagsPrediction:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsPrediction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModelVersions_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchQueryClassificationMetadata _addNoFlagsModelVersion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsModelVersion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryClassificationMetadata;
  v4 = [(GEOPDSearchQueryClassificationMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryClassificationMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryClassificationMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQueryClassificationMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClassiferId_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 16);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"classiferId";
      }
      else {
        objc_super v8 = @"classifer_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if ([*(id *)(a1 + 32) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v10 addObject:v16];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v12);
      }

      [v4 setObject:v10 forKey:@"prediction"];
    }
    char v17 = *(unsigned char *)(a1 + 60);
    if ((v17 & 2) != 0)
    {
      LODWORD(v9) = *(_DWORD *)(a1 + 56);
      v18 = [NSNumber numberWithFloat:v9];
      [v4 setObject:v18 forKey:@"poiGeoThreshold"];

      char v17 = *(unsigned char *)(a1 + 60);
    }
    if (v17)
    {
      LODWORD(v9) = *(_DWORD *)(a1 + 52);
      v19 = [NSNumber numberWithFloat:v9];
      [v4 setObject:v19 forKey:@"localGlobalThreshold"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v21 = *(id *)(a1 + 24);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            v26 = objc_msgSend(v25, "dictionaryRepresentation", (void)v29);
            }
            objc_msgSend(v20, "addObject:", v26, (void)v29);
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v22);
      }

      if (a2) {
        v27 = @"modelVersion";
      }
      else {
        v27 = @"model_version";
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v27, (void)v29);
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
  return -[GEOPDSearchQueryClassificationMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1194;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1195;
      }
      GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryClassificationMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryClassificationMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryClassificationMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 0);
    if (self->_classiferId) {
      PBDataWriterWriteStringField();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_predictions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteFloatField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = self->_modelVersions;
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
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryClassificationMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_classiferId copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = self->_predictions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchQueryClassificationMetadata addPrediction:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 56) = self->_poiGeoThreshold;
    *(unsigned char *)(v5 + 60) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(float *)(v5 + 52) = self->_localGlobalThreshold;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_modelVersions;
  uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v8);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        -[GEOPDSearchQueryClassificationMetadata addModelVersion:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)v4, 1);
  classiferId = self->_classiferId;
  if ((unint64_t)classiferId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](classiferId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  predictions = self->_predictions;
  if ((unint64_t)predictions | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](predictions, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_poiGeoThreshold != *((float *)v4 + 14)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_localGlobalThreshold != *((float *)v4 + 13)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_18;
  }
  modelVersions = self->_modelVersions;
  if ((unint64_t)modelVersions | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](modelVersions, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_classiferId hash];
  uint64_t v4 = [(NSMutableArray *)self->_predictions hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    float poiGeoThreshold = self->_poiGeoThreshold;
    double v8 = poiGeoThreshold;
    if (poiGeoThreshold < 0.0) {
      double v8 = -poiGeoThreshold;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (flags)
  {
    float localGlobalThreshold = self->_localGlobalThreshold;
    double v13 = localGlobalThreshold;
    if (localGlobalThreshold < 0.0) {
      double v13 = -localGlobalThreshold;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ [(NSMutableArray *)self->_modelVersions hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_modelVersions, 0);
  objc_storeStrong((id *)&self->_classiferId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end