@interface GEOPDSearchQueryInterpretationMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryInterpretationMetadata)init;
- (GEOPDSearchQueryInterpretationMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsFeatureMap:(uint64_t)a1;
- (void)_addNoFlagsTriggerFeatures:(uint64_t)a1;
- (void)addFeatureMap:(uint64_t)a1;
- (void)addTriggerFeatures:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryInterpretationMetadata

- (GEOPDSearchQueryInterpretationMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryInterpretationMetadata;
  v2 = [(GEOPDSearchQueryInterpretationMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryInterpretationMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryInterpretationMetadata;
  v3 = [(GEOPDSearchQueryInterpretationMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addFeatureMap:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryInterpretationMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureMaps_tags_1850);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchQueryInterpretationMetadata _addNoFlagsFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 68) |= 0x40u;
  }
}

- (void)_addNoFlagsFeatureMap:(uint64_t)a1
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

- (void)addTriggerFeatures:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryInterpretationMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTriggerFeatures_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchQueryInterpretationMetadata _addNoFlagsTriggerFeatures:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 68) |= 0x40u;
  }
}

- (void)_addNoFlagsTriggerFeatures:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryInterpretationMetadata;
  v4 = [(GEOPDSearchQueryInterpretationMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryInterpretationMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryInterpretationMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQueryInterpretationMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 68))
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 60);
      objc_super v6 = [NSNumber numberWithFloat:v5];
      [v4 setObject:v6 forKey:@"score"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v38 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v7 addObject:v13];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"featureMap";
      }
      else {
        v14 = @"feature_map";
      }
      [v4 setObject:v7 forKey:v14];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = objc_msgSend(v20, "dictionaryRepresentation", (void)v33);
            }
            objc_msgSend(v15, "addObject:", v21, (void)v33);
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"triggerFeatures";
      }
      else {
        v22 = @"trigger_features";
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v22, (void)v33);
    }
    if ((*(unsigned char *)(a1 + 68) & 2) != 0)
    {
      v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
      if (a2) {
        v24 = @"isFromRuntimeQueryTriggerStore";
      }
      else {
        v24 = @"is_from_runtime_query_trigger_store";
      }
      [v4 setObject:v23 forKey:v24];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v25 = *(void **)(a1 + 8);
      if (v25)
      {
        id v26 = v25;
        objc_sync_enter(v26);
        GEOPDSearchQueryInterpretationMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCompletion_tags_1852);
        objc_sync_exit(v26);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v27 = *(id *)(a1 + 24);
    if (v27) {
      [v4 setObject:v27 forKey:@"completion"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v28 = *(void **)(a1 + 8);
      if (v28)
      {
        id v29 = v28;
        objc_sync_enter(v29);
        GEOPDSearchQueryInterpretationMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCanonicalCompletion_tags);
        objc_sync_exit(v29);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v30 = *(id *)(a1 + 16);
    if (v30)
    {
      if (a2) {
        v31 = @"canonicalCompletion";
      }
      else {
        v31 = @"canonical_completion";
      }
      [v4 setObject:v30 forKey:v31];
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
  return -[GEOPDSearchQueryInterpretationMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1871;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1872;
      }
      GEOPDSearchQueryInterpretationMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryInterpretationMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryInterpretationMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryInterpretationMetadata readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteFloatField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_featureMaps;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_triggerFeatures;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_completion) {
      PBDataWriterWriteStringField();
    }
    if (self->_canonicalCompletion) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
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
      GEOPDSearchQueryInterpretationMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryInterpretationMetadata readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(float *)(v5 + 60) = self->_score;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = self->_featureMaps;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchQueryInterpretationMetadata addFeatureMap:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = self->_triggerFeatures;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        -[GEOPDSearchQueryInterpretationMetadata addTriggerFeatures:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_isFromRuntimeQueryTriggerStore;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v19 = -[NSString copyWithZone:](self->_completion, "copyWithZone:", a3, (void)v23);
  long long v20 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v19;

  uint64_t v21 = [(NSString *)self->_canonicalCompletion copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  -[GEOPDSearchQueryInterpretationMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryInterpretationMetadata readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_score != *((float *)v4 + 15)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_23;
  }
  featureMaps = self->_featureMaps;
  if ((unint64_t)featureMaps | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](featureMaps, "isEqual:"))
  {
    goto LABEL_23;
  }
  triggerFeatures = self->_triggerFeatures;
  if ((unint64_t)triggerFeatures | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](triggerFeatures, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) != 0)
    {
      if (self->_isFromRuntimeQueryTriggerStore)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_19;
      }
    }
LABEL_23:
    char v9 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  completion = self->_completion;
  if ((unint64_t)completion | *((void *)v4 + 3) && !-[NSString isEqual:](completion, "isEqual:")) {
    goto LABEL_23;
  }
  canonicalCompletion = self->_canonicalCompletion;
  if ((unint64_t)canonicalCompletion | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](canonicalCompletion, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryInterpretationMetadata readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags)
  {
    float score = self->_score;
    double v5 = score;
    if (score < 0.0) {
      double v5 = -score;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_featureMaps hash];
  uint64_t v9 = [(NSMutableArray *)self->_triggerFeatures hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_isFromRuntimeQueryTriggerStore;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v8 ^ v3 ^ v9 ^ v10;
  NSUInteger v12 = [(NSString *)self->_completion hash];
  return v11 ^ v12 ^ [(NSString *)self->_canonicalCompletion hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerFeatures, 0);
  objc_storeStrong((id *)&self->_featureMaps, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_canonicalCompletion, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end