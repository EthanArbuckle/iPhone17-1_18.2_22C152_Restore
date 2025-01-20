@interface GEOPDSearchQueryIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryIntent)init;
- (GEOPDSearchQueryIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)queryIntentMetadata;
- (uint64_t)_initWithDictionary:(unsigned int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsGlobalFeatureMap:(uint64_t)a1;
- (void)_addNoFlagsGlobalStringFeatureMap:(uint64_t)a1;
- (void)_addNoFlagsWhatIntent:(uint64_t)a1;
- (void)_addNoFlagsWhereIntent:(uint64_t)a1;
- (void)_readQueryIntentMetadata;
- (void)_readWhatIntents;
- (void)_readWhereIntents;
- (void)addGlobalFeatureMap:(uint64_t)a1;
- (void)addGlobalStringFeatureMap:(uint64_t)a1;
- (void)addWhatIntent:(uint64_t)a1;
- (void)addWhereIntent:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setQueryIntentMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryIntent

- (GEOPDSearchQueryIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryIntent;
  v2 = [(GEOPDSearchQueryIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryIntent;
  v3 = [(GEOPDSearchQueryIntent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWhatIntents
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
        GEOPDSearchQueryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWhatIntents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addWhatIntent:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchQueryIntent _readWhatIntents](a1);
    -[GEOPDSearchQueryIntent _addNoFlagsWhatIntent:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsWhatIntent:(uint64_t)a1
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

- (void)_readWhereIntents
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
        GEOPDSearchQueryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWhereIntents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addWhereIntent:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchQueryIntent _readWhereIntents](a1);
    -[GEOPDSearchQueryIntent _addNoFlagsWhereIntent:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsWhereIntent:(uint64_t)a1
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

- (void)_readQueryIntentMetadata
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
        GEOPDSearchQueryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryIntentMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)queryIntentMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchQueryIntent _readQueryIntentMetadata]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setQueryIntentMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 76) |= 4u;
    *(unsigned char *)(a1 + 76) |= 0x40u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)addGlobalFeatureMap:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 1) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGlobalFeatureMaps_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQueryIntent _addNoFlagsGlobalFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 1u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsGlobalFeatureMap:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addGlobalStringFeatureMap:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGlobalStringFeatureMaps_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQueryIntent _addNoFlagsGlobalStringFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsGlobalStringFeatureMap:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryIntent;
  id v4 = [(GEOPDSearchQueryIntent *)&v8 description];
  id v5 = [(GEOPDSearchQueryIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQueryIntent readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 48) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v60 objects:v67 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v61 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            if (a2) {
              [v10 jsonRepresentation];
            }
            else {
            v11 = [v10 dictionaryRepresentation];
            }
            [v5 addObject:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v60 objects:v67 count:16];
        }
        while (v7);
      }

      if (a2) {
        v12 = @"whatIntent";
      }
      else {
        v12 = @"what_intent";
      }
      [v4 setObject:v5 forKey:v12];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v14 = *(id *)(a1 + 56);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v57 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v13 addObject:v19];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"whereIntent";
      }
      else {
        v20 = @"where_intent";
      }
      [v4 setObject:v13 forKey:v20];
    }
    v21 = -[GEOPDSearchQueryIntent queryIntentMetadata]((id *)a1);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"queryIntentMetadata";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"query_intent_metadata";
      }
      [v4 setObject:v23 forKey:v24];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v25 = *(void **)(a1 + 8);
      if (v25)
      {
        id v26 = v25;
        objc_sync_enter(v26);
        GEOPDSearchQueryIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRewrittenQueryNonPayloadField_tags);
        objc_sync_exit(v26);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v27 = *(id *)(a1 + 40);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"rewrittenQueryNonPayloadField";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"rewritten_query_non_payload_field";
      }
      [v4 setObject:v29 forKey:v30];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v32 = *(id *)(a1 + 16);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v65 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v53;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v53 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = *(void **)(*((void *)&v52 + 1) + 8 * k);
            if (a2) {
              [v36 jsonRepresentation];
            }
            else {
            v37 = [v36 dictionaryRepresentation];
            }
            [v31 addObject:v37];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v65 count:16];
        }
        while (v33);
      }

      if (a2) {
        v38 = @"globalFeatureMap";
      }
      else {
        v38 = @"global_feature_map";
      }
      [v4 setObject:v31 forKey:v38];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v40 = *(id *)(a1 + 24);
      uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v49;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v49 != v42) {
              objc_enumerationMutation(v40);
            }
            v44 = *(void **)(*((void *)&v48 + 1) + 8 * m);
            if (a2) {
              [v44 jsonRepresentation];
            }
            else {
            v45 = objc_msgSend(v44, "dictionaryRepresentation", (void)v48);
            }
            objc_msgSend(v39, "addObject:", v45, (void)v48);
          }
          uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
        }
        while (v41);
      }

      if (a2) {
        v46 = @"globalStringFeatureMap";
      }
      else {
        v46 = @"global_string_feature_map";
      }
      objc_msgSend(v4, "setObject:forKey:", v39, v46, (void)v48);
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
  return -[GEOPDSearchQueryIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_1544;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1545;
      }
      GEOPDSearchQueryIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryIntentCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)_initWithDictionary:(unsigned int)a3 isJSON:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_196;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_196;
  }
  if (a3) {
    id v6 = @"whatIntent";
  }
  else {
    id v6 = @"what_intent";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  id v88 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v101 objects:v108 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v102;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v102 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v101 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = [GEOPDSearchIntent alloc];
            if (v14) {
              id v15 = -[GEOPDSearchIntent _initWithDictionary:isJSON:](v14, v13, a3);
            }
            else {
              id v15 = 0;
            }
            -[GEOPDSearchQueryIntent addWhatIntent:](a1, v15);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v16 = [v8 countByEnumeratingWithState:&v101 objects:v108 count:16];
        uint64_t v10 = v16;
      }
      while (v16);
    }

    id v5 = v88;
  }

  if (a3) {
    v17 = @"whereIntent";
  }
  else {
    v17 = @"where_intent";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v97 objects:v107 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v98;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v98 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v97 + 1) + 8 * v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v25 = [GEOPDSearchIntent alloc];
            if (v25) {
              id v26 = -[GEOPDSearchIntent _initWithDictionary:isJSON:](v25, v24, a3);
            }
            else {
              id v26 = 0;
            }
            -[GEOPDSearchQueryIntent addWhereIntent:](a1, v26);
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v27 = [v19 countByEnumeratingWithState:&v97 objects:v107 count:16];
        uint64_t v21 = v27;
      }
      while (v27);
    }

    id v5 = v88;
  }

  if (a3) {
    v28 = @"queryIntentMetadata";
  }
  else {
    v28 = @"query_intent_metadata";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOPDSearchQueryIntentMetadata alloc];
    if (v30) {
      v31 = (void *)-[GEOPDSearchQueryIntentMetadata _initWithDictionary:isJSON:](v30, v29, a3);
    }
    else {
      v31 = 0;
    }
    -[GEOPDSearchQueryIntent setQueryIntentMetadata:](a1, v31);
  }
  if (a3) {
    id v32 = @"rewrittenQueryNonPayloadField";
  }
  else {
    id v32 = @"rewritten_query_non_payload_field";
  }
  uint64_t v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = [GEOPDSearchRewrittenQueryNonPayloadField alloc];
    if (!v34)
    {
LABEL_158:
      long long v63 = v34;
      *(unsigned char *)(a1 + 76) |= 8u;
      *(unsigned char *)(a1 + 76) |= 0x40u;
      objc_storeStrong((id *)(a1 + 40), v34);

      goto LABEL_159;
    }
    id v35 = v33;
    uint64_t v34 = [(GEOPDSearchRewrittenQueryNonPayloadField *)v34 init];
    if (!v34)
    {
LABEL_157:

      goto LABEL_158;
    }
    if (a3) {
      v36 = @"hasNumericSplit";
    }
    else {
      v36 = @"has_numeric_split";
    }
    v37 = [v35 objectForKeyedSubscript:v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v38 = [v37 BOOLValue];
      *(unsigned char *)&v34->_flags |= 0x20u;
      v34->_hasNumericSplit = v38;
    }

    if (a3) {
      v39 = @"hasCamelCase";
    }
    else {
      v39 = @"has_camel_case";
    }
    id v40 = [v35 objectForKeyedSubscript:v39];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v41 = [v40 BOOLValue];
      *(unsigned char *)&v34->_flags |= 4u;
      v34->_hasCamelCase = v41;
    }

    if (a3) {
      uint64_t v42 = @"hasDirectionsIntent";
    }
    else {
      uint64_t v42 = @"has_directions_intent";
    }
    v43 = [v35 objectForKeyedSubscript:v42];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v44 = [v43 BOOLValue];
      *(unsigned char *)&v34->_flags |= 8u;
      v34->_hasDirectionsIntent = v44;
    }

    if (a3) {
      v45 = @"hasSynonymCounterpart";
    }
    else {
      v45 = @"has_synonym_counterPart";
    }
    v46 = [v35 objectForKeyedSubscript:v45];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v47 = [v46 BOOLValue];
      *(unsigned char *)&v34->_flags |= 0x40u;
      v34->_hasSynonymCounterpart = v47;
    }

    if (a3) {
      long long v48 = @"hasEmojiRewrite";
    }
    else {
      long long v48 = @"has_emoji_rewrite";
    }
    long long v49 = [v35 objectForKeyedSubscript:v48];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v50 = [v49 BOOLValue];
      *(unsigned char *)&v34->_flags |= 0x10u;
      v34->_hasEmojiRewrite = v50;
    }

    if (a3) {
      long long v51 = @"rewrittenQuery";
    }
    else {
      long long v51 = @"rewritten_query";
    }
    long long v52 = [v35 objectForKeyedSubscript:v51];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v53 = (void *)[v52 copy];
      id v54 = v53;
      objc_storeStrong((id *)&v34->_rewrittenQuery, v53);
    }
    if (a3) {
      long long v55 = @"pipelineType";
    }
    else {
      long long v55 = @"pipeline_type";
    }
    long long v56 = [v35 objectForKeyedSubscript:v55];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v57 = v56;
      id v87 = v35;
      if ([v57 isEqualToString:@"NONE"])
      {
        int v58 = 0;
      }
      else if ([v57 isEqualToString:@"POI_ONLY"])
      {
        int v58 = 1;
      }
      else if ([v57 isEqualToString:@"GEO_ONLY"])
      {
        int v58 = 2;
      }
      else if ([v57 isEqualToString:@"COMMON"])
      {
        int v58 = 3;
      }
      else
      {
        int v58 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_99;
      }
      id v87 = v35;
      int v58 = [v56 intValue];
    }
    *(unsigned char *)&v34->_flags |= 1u;
    v34->_pipelineType = v58;
    id v35 = v87;
LABEL_99:

    if (a3) {
      long long v59 = @"rewrittenQueryType";
    }
    else {
      long long v59 = @"rewritten_query_type";
    }
    long long v60 = objc_msgSend(v35, "objectForKeyedSubscript:", v59, v87);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v61 = v60;
      if ([v61 isEqualToString:@"NONE_REWRITTEN_QUERY_TYPE"])
      {
        int v62 = 0;
      }
      else if ([v61 isEqualToString:@"NORMALIZATION"])
      {
        int v62 = 1;
      }
      else if ([v61 isEqualToString:@"SPELL_CORRECTION"])
      {
        int v62 = 2;
      }
      else if ([v61 isEqualToString:@"TOK_SYNONYM"])
      {
        int v62 = 3;
      }
      else if ([v61 isEqualToString:@"REWRITTEN_QUERY_TYPE_SYNONYM"])
      {
        int v62 = 4;
      }
      else if ([v61 isEqualToString:@"TOKENIZATION"])
      {
        int v62 = 5;
      }
      else if ([v61 isEqualToString:@"COMPLETION"])
      {
        int v62 = 6;
      }
      else if ([v61 isEqualToString:@"CLASSIFICATION"])
      {
        int v62 = 7;
      }
      else if ([v61 isEqualToString:@"QUERY_INTERPRETATION"])
      {
        int v62 = 8;
      }
      else if ([v61 isEqualToString:@"TAG"])
      {
        int v62 = 9;
      }
      else if ([v61 isEqualToString:@"DEFINITIVE_QU"])
      {
        int v62 = 10;
      }
      else
      {
        if ([v61 isEqualToString:@"POI_SEARCH_SPELL_CORRECTION"])
        {
          int v62 = 11;
        }
        else if ([v61 isEqualToString:@"TRANSLITERATION"])
        {
          int v62 = 12;
        }
        else if ([v61 isEqualToString:@"FUZZY_MATCH_V2"])
        {
          int v62 = 13;
        }
        else if ([v61 isEqualToString:@"DISPLAY_NAME"])
        {
          int v62 = 14;
        }
        else if ([v61 isEqualToString:@"DIRECTION"])
        {
          int v62 = 15;
        }
        else if ([v61 isEqualToString:@"EMOJI"])
        {
          int v62 = 16;
        }
        else if ([v61 isEqualToString:@"ZIP_DOOR_INTERPREATION"])
        {
          int v62 = 17;
        }
        else if ([v61 isEqualToString:@"SIRI_ATTRIBUTES"])
        {
          int v62 = 18;
        }
        else if ([v61 isEqualToString:@"TOKEN_IMPORTANCE"])
        {
          int v62 = 19;
        }
        else if ([v61 isEqualToString:@"BRAND_DATA"])
        {
          int v62 = 20;
        }
        else if ([v61 isEqualToString:@"NEURAL_REWRITE"])
        {
          int v62 = 21;
        }
        else if ([v61 isEqualToString:@"EMBEDDING"])
        {
          int v62 = 22;
        }
        else
        {
          int v62 = 0;
        }
        id v5 = v88;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_156:

        goto LABEL_157;
      }
      int v62 = [v60 intValue];
    }
    *(unsigned char *)&v34->_flags |= 2u;
    v34->_rewrittenQueryType = v62;
    goto LABEL_156;
  }
LABEL_159:

  if (a3) {
    v64 = @"globalFeatureMap";
  }
  else {
    v64 = @"global_feature_map";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v66 = v65;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v93 objects:v106 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v94;
      do
      {
        uint64_t v70 = 0;
        do
        {
          if (*(void *)v94 != v69) {
            objc_enumerationMutation(v66);
          }
          v71 = *(void **)(*((void *)&v93 + 1) + 8 * v70);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v72 = [GEOPDSearchPair alloc];
            if (v72) {
              v73 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v72, v71);
            }
            else {
              v73 = 0;
            }
            -[GEOPDSearchQueryIntent addGlobalFeatureMap:](a1, v73);
          }
          ++v70;
        }
        while (v68 != v70);
        uint64_t v74 = [v66 countByEnumeratingWithState:&v93 objects:v106 count:16];
        uint64_t v68 = v74;
      }
      while (v74);
    }

    id v5 = v88;
  }

  if (a3) {
    v75 = @"globalStringFeatureMap";
  }
  else {
    v75 = @"global_string_feature_map";
  }
  v76 = [v5 objectForKeyedSubscript:v75];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v77 = v76;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v89 objects:v105 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v90;
      do
      {
        uint64_t v81 = 0;
        do
        {
          if (*(void *)v90 != v80) {
            objc_enumerationMutation(v77);
          }
          v82 = *(void **)(*((void *)&v89 + 1) + 8 * v81);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v83 = [GEOPDSearchStringStringPair alloc];
            if (v83) {
              v84 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v83, v82);
            }
            else {
              v84 = 0;
            }
            -[GEOPDSearchQueryIntent addGlobalStringFeatureMap:](a1, v84);
          }
          ++v81;
        }
        while (v79 != v81);
        uint64_t v85 = [v77 countByEnumeratingWithState:&v89 objects:v105 count:16];
        uint64_t v79 = v85;
      }
      while (v85);
    }

    id v5 = v88;
  }

LABEL_196:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_40;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x70) != 0) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    queryIntentMetadata = self->_queryIntentMetadata;
    if (queryIntentMetadata)
    {
      os_unfair_lock_lock_with_options();
      char IsDirty = _GEOPDSearchQueryIntentMetadataIsDirty((uint64_t)queryIntentMetadata);
      os_unfair_lock_unlock(&queryIntentMetadata->_readerLock);
      if (IsDirty) {
        goto LABEL_40;
      }
      char flags = (char)self->_flags;
    }
  }
  if ((flags & 0xB) == 0)
  {
    if ((flags & 0x10) != 0)
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v9 = self->_whatIntents;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v61 objects:v71 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v62;
LABEL_11:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v62 != v11) {
            objc_enumerationMutation(v9);
          }
          if (GEOPDSearchIntentIsDirty(*(os_unfair_lock_s **)(*((void *)&v61 + 1) + 8 * v12))) {
            goto LABEL_39;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v61 objects:v71 count:16];
            if (v10) {
              goto LABEL_11;
            }
            break;
          }
        }
      }

      char flags = (char)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v9 = self->_whereIntents;
      uint64_t v13 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v58;
LABEL_21:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v58 != v14) {
            objc_enumerationMutation(v9);
          }
          if (GEOPDSearchIntentIsDirty(*(os_unfair_lock_s **)(*((void *)&v57 + 1) + 8 * v15))) {
            goto LABEL_39;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v57 objects:v70 count:16];
            if (v13) {
              goto LABEL_21;
            }
            break;
          }
        }
      }

      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v9 = self->_globalStringFeatureMaps;
      uint64_t v16 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v53 objects:v69 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v54;
LABEL_31:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v9);
          }
          if (GEOPDSearchStringStringPairIsDirty(*(void *)(*((void *)&v53 + 1) + 8 * v18))) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v53 objects:v69 count:16];
            if (v16) {
              goto LABEL_31;
            }
            goto LABEL_37;
          }
        }
LABEL_39:

        goto LABEL_40;
      }
LABEL_37:
    }
    id v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
    goto LABEL_73;
  }
LABEL_40:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 0);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v21 = self->_whatIntents;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v49 objects:v68 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v49 objects:v68 count:16];
    }
    while (v22);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v25 = self->_whereIntents;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v45 objects:v67 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v45 objects:v67 count:16];
    }
    while (v26);
  }

  if (self->_queryIntentMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rewrittenQueryNonPayloadField) {
    PBDataWriterWriteSubmessage();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v29 = self->_globalFeatureMaps;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v41 objects:v66 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v41 objects:v66 count:16];
    }
    while (v30);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v33 = self->_globalStringFeatureMaps;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v37 objects:v65 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v33);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v37 objects:v65 count:16];
    }
    while (v34);
  }

LABEL_73:
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDSearchQueryIntent _readQueryIntentMetadata](a1);
  if ((-[GEOPDSearchQueryIntentMetadata hasGreenTeaWithValue:](*(void *)(a1 + 32), a2) & 1) == 0)
  {
    -[GEOPDSearchQueryIntent _readWhatIntents](a1);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[GEOPDSearchIntent hasGreenTeaWithValue:](*(void *)(*((void *)&v19 + 1) + 8 * v9), a2)) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v7) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      -[GEOPDSearchQueryIntent _readWhereIntents](a1);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = *(id *)(a1 + 56);
      uint64_t v10 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (!v10)
      {
LABEL_20:
        uint64_t v4 = 0;
LABEL_22:

        return v4;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
LABEL_14:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v5);
        }
        if (-[GEOPDSearchIntent hasGreenTeaWithValue:](*(void *)(*((void *)&v15 + 1) + 8 * v13), a2)) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
      }
    }
    uint64_t v4 = 1;
    goto LABEL_22;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDSearchQueryIntentReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 0);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = self->_whatIntents;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * v11) copyWithZone:a3];
        -[GEOPDSearchQueryIntent addWhatIntent:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v9);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v13 = self->_whereIntents;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v42;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v16) copyWithZone:a3];
        -[GEOPDSearchQueryIntent addWhereIntent:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOPDSearchQueryIntentMetadata *)self->_queryIntentMetadata copyWithZone:a3];
  long long v19 = (void *)v5[4];
  v5[4] = v18;

  id v20 = [(GEOPDSearchRewrittenQueryNonPayloadField *)self->_rewrittenQueryNonPayloadField copyWithZone:a3];
  long long v21 = (void *)v5[5];
  v5[5] = v20;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v22 = self->_globalFeatureMaps;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v38;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v25) copyWithZone:a3];
        -[GEOPDSearchQueryIntent addGlobalFeatureMap:]((uint64_t)v5, v26);

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v23);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v27 = self->_globalStringFeatureMaps;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v34;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v30), "copyWithZone:", a3, (void)v33);
        -[GEOPDSearchQueryIntent addGlobalStringFeatureMap:]((uint64_t)v5, v31);

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v28);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 1),
         -[GEOPDSearchQueryIntent readAll:]((uint64_t)v4, 1),
         whatIntents = self->_whatIntents,
         !((unint64_t)whatIntents | v4[6]))
     || -[NSMutableArray isEqual:](whatIntents, "isEqual:"))
    && ((whereIntents = self->_whereIntents, !((unint64_t)whereIntents | v4[7]))
     || -[NSMutableArray isEqual:](whereIntents, "isEqual:"))
    && ((queryIntentMetadata = self->_queryIntentMetadata, !((unint64_t)queryIntentMetadata | v4[4]))
     || -[GEOPDSearchQueryIntentMetadata isEqual:](queryIntentMetadata, "isEqual:"))
    && ((rewrittenQueryNonPayloadField = self->_rewrittenQueryNonPayloadField,
         !((unint64_t)rewrittenQueryNonPayloadField | v4[5]))
     || -[GEOPDSearchRewrittenQueryNonPayloadField isEqual:](rewrittenQueryNonPayloadField, "isEqual:"))
    && ((globalFeatureMaps = self->_globalFeatureMaps, !((unint64_t)globalFeatureMaps | v4[2]))
     || -[NSMutableArray isEqual:](globalFeatureMaps, "isEqual:")))
  {
    globalStringFeatureMaps = self->_globalStringFeatureMaps;
    if ((unint64_t)globalStringFeatureMaps | v4[3]) {
      char v11 = -[NSMutableArray isEqual:](globalStringFeatureMaps, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_whatIntents hash];
  uint64_t v4 = [(NSMutableArray *)self->_whereIntents hash] ^ v3;
  unint64_t v5 = v4 ^ [(GEOPDSearchQueryIntentMetadata *)self->_queryIntentMetadata hash];
  unint64_t v6 = [(GEOPDSearchRewrittenQueryNonPayloadField *)self->_rewrittenQueryNonPayloadField hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSMutableArray *)self->_globalFeatureMaps hash];
  return v7 ^ [(NSMutableArray *)self->_globalStringFeatureMaps hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whereIntents, 0);
  objc_storeStrong((id *)&self->_whatIntents, 0);
  objc_storeStrong((id *)&self->_rewrittenQueryNonPayloadField, 0);
  objc_storeStrong((id *)&self->_queryIntentMetadata, 0);
  objc_storeStrong((id *)&self->_globalStringFeatureMaps, 0);
  objc_storeStrong((id *)&self->_globalFeatureMaps, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end