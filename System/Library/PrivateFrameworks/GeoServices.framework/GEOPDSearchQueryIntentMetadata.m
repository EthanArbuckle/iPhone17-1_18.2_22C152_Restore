@interface GEOPDSearchQueryIntentMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryIntentMetadata)init;
- (GEOPDSearchQueryIntentMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)acHintMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsQueryClassificationMetadata:(uint64_t)a1;
- (void)_addNoFlagsQueryEmbeddingMetadata:(uint64_t)a1;
- (void)_readAcHintMetadata;
- (void)addQueryClassificationMetadata:(uint64_t)a1;
- (void)addQueryEmbeddingMetadata:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setAcHintMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryIntentMetadata

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchQueryIntentMetadata _readAcHintMetadata](result);
    uint64_t v4 = *(void *)(v3 + 64);
    return -[GEOPDSearchACHintMetadata hasGreenTeaWithValue:](v4, a2);
  }
  return result;
}

- (GEOPDSearchQueryIntentMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  v2 = [(GEOPDSearchQueryIntentMetadata *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryIntentMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  uint64_t v3 = [(GEOPDSearchQueryIntentMetadata *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  [(GEOPDSearchQueryIntentMetadata *)&v3 dealloc];
}

- (void)addQueryClassificationMetadata:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 4) == 0)
    {
      uint64_t v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryClassificationMetadatas_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    -[GEOPDSearchQueryIntentMetadata _addNoFlagsQueryClassificationMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 308) |= 0x400uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    *(void *)(a1 + 308) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsQueryClassificationMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      uint64_t v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readAcHintMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 308) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAcHintMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (id)acHintMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchQueryIntentMetadata _readAcHintMetadata]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAcHintMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 308) |= 0x400000080uLL;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)addQueryEmbeddingMetadata:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 0x80) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryEmbeddingMetadatas_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    -[GEOPDSearchQueryIntentMetadata _addNoFlagsQueryEmbeddingMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 308) |= 0x8000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    *(void *)(a1 + 308) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsQueryEmbeddingMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  id v4 = [(GEOPDSearchQueryIntentMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryIntentMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQueryIntentMetadata readAll:](a1, 1);
    v212 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 2) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalQuery_tags_1564);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v6 = *(id *)(a1 + 80);
    if (v6)
    {
      if (a2) {
        id v7 = @"originalQuery";
      }
      else {
        id v7 = @"original_query";
      }
      [v212 setObject:v6 forKey:v7];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 0x80) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRewrittenQuery_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v10 = *(id *)(a1 + 264);
    if (v10)
    {
      if (a2) {
        v11 = @"rewrittenQuery";
      }
      else {
        v11 = @"rewritten_query";
      }
      [v212 setObject:v10 forKey:v11];
    }

    uint64_t v12 = *(void *)(a1 + 308);
    if ((v12 & 2) != 0)
    {
      v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 300)];
      if (a2) {
        v14 = @"rewrittenQueryIndex";
      }
      else {
        v14 = @"rewritten_query_index";
      }
      [v212 setObject:v13 forKey:v14];

      uint64_t v12 = *(void *)(a1 + 308);
    }
    if (v12)
    {
      v15 = [NSNumber numberWithDouble:*(double *)(a1 + 168)];
      if (a2) {
        v16 = @"queryIntentWeight";
      }
      else {
        v16 = @"query_intent_weight";
      }
      [v212 setObject:v15 forKey:v16];

      uint64_t v12 = *(void *)(a1 + 308);
    }
    if ((v12 & 8) != 0)
    {
      v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 305)];
      if (a2) {
        v18 = @"isFromKnowledgeGraph";
      }
      else {
        v18 = @"is_from_knowledge_graph";
      }
      [v212 setObject:v17 forKey:v18];

      uint64_t v12 = *(void *)(a1 + 308);
    }
    if ((v12 & 0x10) != 0)
    {
      v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 306)];
      if (a2) {
        v20 = @"isFromSearchQu";
      }
      else {
        v20 = @"is_from_search_qu";
      }
      [v212 setObject:v19 forKey:v20];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 4) == 0)
    {
      v21 = *(void **)(a1 + 8);
      if (v21)
      {
        id v22 = v21;
        objc_sync_enter(v22);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryTagMetadata_tags);
        objc_sync_exit(v22);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v23 = *(id *)(a1 + 224);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"queryTagMetadata";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"query_tag_metadata";
      }
      id v27 = v25;

      [v212 setObject:v27 forKey:v26];
    }

    if ([*(id *)(a1 + 88) count])
    {
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v217 = 0u;
      long long v218 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      id v29 = *(id *)(a1 + 88);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v217 objects:v222 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v218;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v218 != v31) {
              objc_enumerationMutation(v29);
            }
            v33 = *(void **)(*((void *)&v217 + 1) + 8 * i);
            if (a2) {
              [v33 jsonRepresentation];
            }
            else {
            id v34 = [v33 dictionaryRepresentation];
            }

            [v28 addObject:v34];
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v217 objects:v222 count:16];
        }
        while (v30);
      }

      if (a2) {
        v35 = @"queryClassificationMetadata";
      }
      else {
        v35 = @"query_classification_metadata";
      }
      [v212 setObject:v28 forKey:v35];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 1) == 0)
    {
      v36 = *(void **)(a1 + 8);
      if (v36)
      {
        id v37 = v36;
        objc_sync_enter(v37);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuerySpellCorrectionMetadata_tags);
        objc_sync_exit(v37);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v38 = *(id *)(a1 + 208);
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"querySpellCorrectionMetadata";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"query_spell_correction_metadata";
      }
      id v42 = v40;

      [v212 setObject:v42 forKey:v41];
    }

    if ((*(unsigned char *)(a1 + 308) & 4) != 0)
    {
      v43 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 304)];
      if (a2) {
        v44 = @"isFromDefinitiveQu";
      }
      else {
        v44 = @"is_from_definitive_qu";
      }
      [v212 setObject:v43 forKey:v44];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 2) == 0)
    {
      v45 = *(void **)(a1 + 8);
      if (v45)
      {
        id v46 = v45;
        objc_sync_enter(v46);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryGeoMetadata_tags);
        objc_sync_exit(v46);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v47 = *(id *)(a1 + 144);
    v48 = v47;
    if (v47)
    {
      if (a2)
      {
        v49 = [v47 jsonRepresentation];
        v50 = @"queryGeoMetadata";
      }
      else
      {
        v49 = [v47 dictionaryRepresentation];
        v50 = @"query_geo_metadata";
      }
      id v51 = v49;

      [v212 setObject:v51 forKey:v50];
    }

    if (*(void *)(a1 + 24))
    {
      v52 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v53 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v54 = 0;
        do
        {
          uint64_t v55 = *(int *)(*v53 + 4 * v54);
          if (v55 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v55);
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v56 = off_1E53E2860[v55];
          }
          [v52 addObject:v56];

          ++v54;
          v53 = (void *)(a1 + 16);
        }
        while (v54 < *(void *)(a1 + 24));
      }
      if (a2) {
        v57 = @"intentSource";
      }
      else {
        v57 = @"intent_source";
      }
      [v212 setObject:v52 forKey:v57];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 2) == 0)
    {
      v58 = *(void **)(a1 + 8);
      if (v58)
      {
        id v59 = v58;
        objc_sync_enter(v59);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuerySynonymMetadata_tags);
        objc_sync_exit(v59);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v60 = *(id *)(a1 + 216);
    v61 = v60;
    if (v60)
    {
      if (a2)
      {
        v62 = [v60 jsonRepresentation];
        v63 = @"querySynonymMetadata";
      }
      else
      {
        v62 = [v60 dictionaryRepresentation];
        v63 = @"query_synonym_metadata";
      }
      id v64 = v62;

      [v212 setObject:v64 forKey:v63];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 0x40) == 0)
    {
      v65 = *(void **)(a1 + 8);
      if (v65)
      {
        id v66 = v65;
        objc_sync_enter(v66);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryDymMetadata_tags);
        objc_sync_exit(v66);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v67 = *(id *)(a1 + 120);
    v68 = v67;
    if (v67)
    {
      if (a2)
      {
        v69 = [v67 jsonRepresentation];
        v70 = @"queryDymMetadata";
      }
      else
      {
        v69 = [v67 dictionaryRepresentation];
        v70 = @"query_dym_metadata";
      }
      id v71 = v69;

      [v212 setObject:v71 forKey:v70];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 8) == 0)
    {
      v72 = *(void **)(a1 + 8);
      if (v72)
      {
        id v73 = v72;
        objc_sync_enter(v73);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryCompletionMetadata_tags);
        objc_sync_exit(v73);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v74 = *(id *)(a1 + 96);
    v75 = v74;
    if (v74)
    {
      if (a2)
      {
        v76 = [v74 jsonRepresentation];
        v77 = @"queryCompletionMetadata";
      }
      else
      {
        v76 = [v74 dictionaryRepresentation];
        v77 = @"query_completion_metadata";
      }
      id v78 = v76;

      [v212 setObject:v78 forKey:v77];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 0x10) == 0)
    {
      v79 = *(void **)(a1 + 8);
      if (v79)
      {
        id v80 = v79;
        objc_sync_enter(v80);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryInterpretationMetadata_tags);
        objc_sync_exit(v80);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v81 = *(id *)(a1 + 176);
    v82 = v81;
    if (v81)
    {
      if (a2)
      {
        v83 = [v81 jsonRepresentation];
        v84 = @"queryInterpretationMetadata";
      }
      else
      {
        v83 = [v81 dictionaryRepresentation];
        v84 = @"query_interpretation_metadata";
      }
      id v85 = v83;

      [v212 setObject:v85 forKey:v84];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 0x20) == 0)
    {
      v86 = *(void **)(a1 + 8);
      if (v86)
      {
        id v87 = v86;
        objc_sync_enter(v87);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryDirectionsIntentMetadata_tags);
        objc_sync_exit(v87);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v88 = *(id *)(a1 + 112);
    v89 = v88;
    if (v88)
    {
      if (a2)
      {
        v90 = [v88 jsonRepresentation];
        v91 = @"queryDirectionsIntentMetadata";
      }
      else
      {
        v90 = [v88 dictionaryRepresentation];
        v91 = @"query_directions_intent_metadata";
      }
      id v92 = v90;

      [v212 setObject:v92 forKey:v91];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 0x40) == 0)
    {
      v93 = *(void **)(a1 + 8);
      if (v93)
      {
        id v94 = v93;
        objc_sync_enter(v94);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryNormalizerMetadata_tags);
        objc_sync_exit(v94);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v95 = *(id *)(a1 + 192);
    v96 = v95;
    if (v95)
    {
      if (a2)
      {
        v97 = [v95 jsonRepresentation];
        v98 = @"queryNormalizerMetadata";
      }
      else
      {
        v97 = [v95 dictionaryRepresentation];
        v98 = @"query_normalizer_metadata";
      }
      id v99 = v97;

      [v212 setObject:v99 forKey:v98];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 4) == 0)
    {
      v100 = *(void **)(a1 + 8);
      if (v100)
      {
        id v101 = v100;
        objc_sync_enter(v101);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryGeoNormalizerMetadata_tags);
        objc_sync_exit(v101);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v102 = *(id *)(a1 + 152);
    v103 = v102;
    if (v102)
    {
      if (a2)
      {
        v104 = [v102 jsonRepresentation];
        v105 = @"queryGeoNormalizerMetadata";
      }
      else
      {
        v104 = [v102 dictionaryRepresentation];
        v105 = @"query_geo_normalizer_metadata";
      }
      id v106 = v104;

      [v212 setObject:v106 forKey:v105];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 0x10) == 0)
    {
      v107 = *(void **)(a1 + 8);
      if (v107)
      {
        id v108 = v107;
        objc_sync_enter(v108);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryTokenizerMetadata_tags);
        objc_sync_exit(v108);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v109 = *(id *)(a1 + 240);
    v110 = v109;
    if (v109)
    {
      if (a2)
      {
        v111 = [v109 jsonRepresentation];
        v112 = @"queryTokenizerMetadata";
      }
      else
      {
        v111 = [v109 dictionaryRepresentation];
        v112 = @"query_tokenizer_metadata";
      }
      id v113 = v111;

      [v212 setObject:v113 forKey:v112];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 0x20) == 0)
    {
      v114 = *(void **)(a1 + 8);
      if (v114)
      {
        id v115 = v114;
        objc_sync_enter(v115);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryTransliterMetadata_tags);
        objc_sync_exit(v115);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v116 = *(id *)(a1 + 248);
    v117 = v116;
    if (v116)
    {
      if (a2)
      {
        v118 = [v116 jsonRepresentation];
        v119 = @"queryTransliterMetadata";
      }
      else
      {
        v118 = [v116 dictionaryRepresentation];
        v119 = @"query_transliter_metadata";
      }
      id v120 = v118;

      [v212 setObject:v120 forKey:v119];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 1) == 0)
    {
      v121 = *(void **)(a1 + 8);
      if (v121)
      {
        id v122 = v121;
        objc_sync_enter(v122);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryFuzzyMatchV2Metadata_tags);
        objc_sync_exit(v122);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v123 = *(id *)(a1 + 136);
    v124 = v123;
    if (v123)
    {
      if (a2)
      {
        v125 = [v123 jsonRepresentation];
        v126 = @"queryFuzzyMatchV2Metadata";
      }
      else
      {
        v125 = [v123 dictionaryRepresentation];
        v126 = @"query_fuzzy_match_v2_metadata";
      }
      id v127 = v125;

      [v212 setObject:v127 forKey:v126];
    }

    if (*(void *)(a1 + 48))
    {
      v128 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v129 = (void *)(a1 + 40);
      if (*(void *)(a1 + 48))
      {
        unint64_t v130 = 0;
        do
        {
          uint64_t v131 = *(int *)(*v129 + 4 * v130);
          if (v131 >= 0x17)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v131);
            v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v132 = off_1E53E2970[v131];
          }
          [v128 addObject:v132];

          ++v130;
          v129 = (void *)(a1 + 40);
        }
        while (v130 < *(void *)(a1 + 48));
      }
      if (a2) {
        v133 = @"rewrittenQueryType";
      }
      else {
        v133 = @"rewritten_query_type";
      }
      [v212 setObject:v128 forKey:v133];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 0x80) == 0)
    {
      v134 = *(void **)(a1 + 8);
      if (v134)
      {
        id v135 = v134;
        objc_sync_enter(v135);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryPoiMetadata_tags);
        objc_sync_exit(v135);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v136 = *(id *)(a1 + 200);
    v137 = v136;
    if (v136)
    {
      if (a2)
      {
        v138 = [v136 jsonRepresentation];
        v139 = @"queryPoiMetadata";
      }
      else
      {
        v138 = [v136 dictionaryRepresentation];
        v139 = @"query_poi_metadata";
      }
      id v140 = v138;

      [v212 setObject:v140 forKey:v139];
    }

    v141 = -[GEOPDSearchQueryIntentMetadata acHintMetadata]((id *)a1);
    v142 = v141;
    if (v141)
    {
      if (a2)
      {
        v143 = [v141 jsonRepresentation];
        v144 = @"acHintMetadata";
      }
      else
      {
        v143 = [v141 dictionaryRepresentation];
        v144 = @"ac_hint_metadata";
      }
      id v145 = v143;

      [v212 setObject:v145 forKey:v144];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 8) == 0)
    {
      v146 = *(void **)(a1 + 8);
      if (v146)
      {
        id v147 = v146;
        objc_sync_enter(v147);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryGeoTagMetadata_tags);
        objc_sync_exit(v147);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v148 = *(id *)(a1 + 160);
    v149 = v148;
    if (v148)
    {
      if (a2)
      {
        v150 = [v148 jsonRepresentation];
        v151 = @"queryGeoTagMetadata";
      }
      else
      {
        v150 = [v148 dictionaryRepresentation];
        v151 = @"query_geo_tag_metadata";
      }
      id v152 = v150;

      [v212 setObject:v152 forKey:v151];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 0x40) == 0)
    {
      v153 = *(void **)(a1 + 8);
      if (v153)
      {
        id v154 = v153;
        objc_sync_enter(v154);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRawQueryTokenizerMetadata_tags);
        objc_sync_exit(v154);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v155 = *(id *)(a1 + 256);
    v156 = v155;
    if (v155)
    {
      if (a2)
      {
        v157 = [v155 jsonRepresentation];
        v158 = @"rawQueryTokenizerMetadata";
      }
      else
      {
        v157 = [v155 dictionaryRepresentation];
        v158 = @"raw_query_tokenizer_metadata";
      }
      id v159 = v157;

      [v212 setObject:v159 forKey:v158];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 311) & 8) == 0)
    {
      v160 = *(void **)(a1 + 8);
      if (v160)
      {
        id v161 = v160;
        objc_sync_enter(v161);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryTokenImportanceMetadata_tags);
        objc_sync_exit(v161);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v162 = *(id *)(a1 + 232);
    v163 = v162;
    if (v162)
    {
      if (a2)
      {
        v164 = [v162 jsonRepresentation];
        v165 = @"queryTokenImportanceMetadata";
      }
      else
      {
        v164 = [v162 dictionaryRepresentation];
        v165 = @"query_token_importance_metadata";
      }
      id v166 = v164;

      [v212 setObject:v166 forKey:v165];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 1) == 0)
    {
      v167 = *(void **)(a1 + 8);
      if (v167)
      {
        id v168 = v167;
        objc_sync_enter(v168);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoTokenImportanceMetadata_tags);
        objc_sync_exit(v168);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v169 = *(id *)(a1 + 72);
    v170 = v169;
    if (v169)
    {
      if (a2)
      {
        v171 = [v169 jsonRepresentation];
        v172 = @"geoTokenImportanceMetadata";
      }
      else
      {
        v171 = [v169 dictionaryRepresentation];
        v172 = @"geo_token_importance_metadata";
      }
      id v173 = v171;

      [v212 setObject:v173 forKey:v172];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 312) & 1) == 0)
    {
      v174 = *(void **)(a1 + 8);
      if (v174)
      {
        id v175 = v174;
        objc_sync_enter(v175);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRichBrandMetadata_tags);
        objc_sync_exit(v175);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v176 = *(id *)(a1 + 272);
    v177 = v176;
    if (v176)
    {
      if (a2)
      {
        v178 = [v176 jsonRepresentation];
        v179 = @"richBrandMetadata";
      }
      else
      {
        v178 = [v176 dictionaryRepresentation];
        v179 = @"rich_brand_metadata";
      }
      id v180 = v178;

      [v212 setObject:v180 forKey:v179];
    }

    if ([*(id *)(a1 + 128) count])
    {
      v181 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
      long long v215 = 0u;
      long long v216 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      id v182 = *(id *)(a1 + 128);
      uint64_t v183 = [v182 countByEnumeratingWithState:&v213 objects:v221 count:16];
      if (v183)
      {
        uint64_t v184 = *(void *)v214;
        do
        {
          for (uint64_t j = 0; j != v183; ++j)
          {
            if (*(void *)v214 != v184) {
              objc_enumerationMutation(v182);
            }
            v186 = *(void **)(*((void *)&v213 + 1) + 8 * j);
            if (a2) {
              [v186 jsonRepresentation];
            }
            else {
            id v187 = [v186 dictionaryRepresentation];
            }

            [v181 addObject:v187];
          }
          uint64_t v183 = [v182 countByEnumeratingWithState:&v213 objects:v221 count:16];
        }
        while (v183);
      }

      if (a2) {
        v188 = @"queryEmbeddingMetadata";
      }
      else {
        v188 = @"query_embedding_metadata";
      }
      [v212 setObject:v181 forKey:v188];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 312) & 2) == 0)
    {
      v189 = *(void **)(a1 + 8);
      if (v189)
      {
        id v190 = v189;
        objc_sync_enter(v190);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSynonymMetadata_tags);
        objc_sync_exit(v190);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v191 = *(id *)(a1 + 280);
    v192 = v191;
    if (v191)
    {
      if (a2)
      {
        v193 = [v191 jsonRepresentation];
        v194 = @"tokenSynonymMetadata";
      }
      else
      {
        v193 = [v191 dictionaryRepresentation];
        v194 = @"token_synonym_metadata";
      }
      id v195 = v193;

      [v212 setObject:v195 forKey:v194];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 310) & 0x20) == 0)
    {
      v196 = *(void **)(a1 + 8);
      if (v196)
      {
        id v197 = v196;
        objc_sync_enter(v197);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryNeuralRewriteMetadata_tags);
        objc_sync_exit(v197);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v198 = *(id *)(a1 + 184);
    v199 = v198;
    if (v198)
    {
      if (a2)
      {
        v200 = [v198 jsonRepresentation];
        v201 = @"queryNeuralRewriteMetadata";
      }
      else
      {
        v200 = [v198 dictionaryRepresentation];
        v201 = @"query_neural_rewrite_metadata";
      }
      id v202 = v200;

      [v212 setObject:v202 forKey:v201];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(unsigned char *)(a1 + 309) & 0x10) == 0)
    {
      v203 = *(void **)(a1 + 8);
      if (v203)
      {
        id v204 = v203;
        objc_sync_enter(v204);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryCtrMetadata_tags);
        objc_sync_exit(v204);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    id v205 = *(id *)(a1 + 104);
    v206 = v205;
    if (v205)
    {
      if (a2)
      {
        v207 = [v205 jsonRepresentation];
        v208 = @"queryCtrMetadata";
      }
      else
      {
        v207 = [v205 dictionaryRepresentation];
        v208 = @"query_ctr_metadata";
      }
      id v209 = v207;

      [v212 setObject:v209 forKey:v208];
    }

    id v210 = v212;
  }
  else
  {
    id v210 = 0;
  }

  return v210;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1785;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1786;
      }
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryIntentMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v1034 = *MEMORY[0x1E4F143B8];
  id v885 = a2;
  id v4 = (id)[a1 init];

  uint64_t v966 = (uint64_t)v4;
  if (!v4) {
    goto LABEL_1750;
  }
  if (a3) {
    id v5 = @"originalQuery";
  }
  else {
    id v5 = @"original_query";
  }
  v860 = v5;
  id v6 = objc_msgSend(v885, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[v6 copy];
    id v8 = v7;
    *(void *)(v966 + 308) |= 0x400000200uLL;
    objc_storeStrong((id *)(v966 + 80), v7);
  }
  if (a3) {
    id v9 = @"rewrittenQuery";
  }
  else {
    id v9 = @"rewritten_query";
  }
  v859 = v9;
  id v10 = objc_msgSend(v885, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    id v12 = v11;
    *(void *)(v966 + 308) |= 0x480000000uLL;
    objc_storeStrong((id *)(v966 + 264), v11);
  }
  if (a3) {
    v13 = @"rewrittenQueryIndex";
  }
  else {
    v13 = @"rewritten_query_index";
  }
  v14 = [v885 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [v14 intValue];
    *(void *)(v966 + 308) |= 0x400000002uLL;
    *(_DWORD *)(v966 + 300) = v15;
  }

  if (a3) {
    v16 = @"queryIntentWeight";
  }
  else {
    v16 = @"query_intent_weight";
  }
  v17 = [v885 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v17 doubleValue];
    *(void *)(v966 + 308) |= 0x400000001uLL;
    *(void *)(v966 + 168) = v18;
  }

  if (a3) {
    v19 = @"isFromKnowledgeGraph";
  }
  else {
    v19 = @"is_from_knowledge_graph";
  }
  v20 = [v885 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v21 = [v20 BOOLValue];
    *(void *)(v966 + 308) |= 0x400000008uLL;
    *(unsigned char *)(v966 + 305) = v21;
  }

  if (a3) {
    id v22 = @"isFromSearchQu";
  }
  else {
    id v22 = @"is_from_search_qu";
  }
  id v23 = [v885 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v24 = [v23 BOOLValue];
    *(void *)(v966 + 308) |= 0x400000010uLL;
    *(unsigned char *)(v966 + 306) = v24;
  }

  if (a3) {
    v25 = @"queryTagMetadata";
  }
  else {
    v25 = @"query_tag_metadata";
  }
  v923 = [v885 objectForKeyedSubscript:v25];
  objc_opt_class();
  v26 = v923;
  if (objc_opt_isKindOfClass())
  {
    id v27 = [GEOPDSearchQueryTagMetadata alloc];
    if (v27)
    {
      v28 = v27;
      id v29 = v923;
      uint64_t v30 = [(GEOPDSearchQueryTagMetadata *)v28 init];
      if (v30)
      {
        id v914 = v29;
        uint64_t v31 = [v29 objectForKeyedSubscript:@"rank"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v32 = [v31 unsignedIntValue];
          *(unsigned char *)(v30 + 72) |= 0x40u;
          *(unsigned char *)(v30 + 72) |= 8u;
          *(_DWORD *)(v30 + 68) = v32;
        }

        v33 = [v29 objectForKeyedSubscript:@"score"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v33 doubleValue];
          *(unsigned char *)(v30 + 72) |= 0x40u;
          *(unsigned char *)(v30 + 72) |= 2u;
          *(void *)(v30 + 32) = v34;
        }

        if (a3) {
          v35 = @"normalizedScore";
        }
        else {
          v35 = @"normalized_score";
        }
        v36 = [v29 objectForKeyedSubscript:v35];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v36 doubleValue];
          *(unsigned char *)(v30 + 72) |= 0x40u;
          *(unsigned char *)(v30 + 72) |= 1u;
          *(void *)(v30 + 24) = v37;
        }

        if (a3) {
          id v38 = @"sigmoidScore";
        }
        else {
          id v38 = @"sigmoid_score";
        }
        v39 = [v29 objectForKeyedSubscript:v38];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v39 doubleValue];
          *(unsigned char *)(v30 + 72) |= 0x40u;
          *(unsigned char *)(v30 + 72) |= 4u;
          *(void *)(v30 + 40) = v40;
        }

        if (a3) {
          v41 = @"spanScore";
        }
        else {
          v41 = @"span_score";
        }
        v906 = [v29 objectForKeyedSubscript:v41];
        objc_opt_class();
        id v42 = v906;
        if (objc_opt_isKindOfClass())
        {
          long long v1028 = 0u;
          long long v1027 = 0u;
          long long v1026 = 0u;
          long long v1025 = 0u;
          obuint64_t j = v906;
          uint64_t v43 = [obj countByEnumeratingWithState:&v1025 objects:v1033 count:16];
          if (!v43) {
            goto LABEL_109;
          }
          v44 = @"intent_type";
          uint64_t v45 = *(void *)v1026;
          if (a3) {
            v44 = @"intentType";
          }
          v937 = v44;
          while (1)
          {
            uint64_t v46 = 0;
            do
            {
              if (*(void *)v1026 != v45) {
                objc_enumerationMutation(obj);
              }
              id v47 = *(void **)(*((void *)&v1025 + 1) + 8 * v46);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v48 = [GEOPDSearchSpanScore alloc];
                if (v48)
                {
                  id v49 = v47;
                  uint64_t v50 = [(GEOPDSearchSpanScore *)v48 init];
                  if (v50)
                  {
                    id v51 = [v49 objectForKeyedSubscript:v937];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v52 = v51;
                      if ([v52 isEqualToString:@"INTENT_TYPE_UNKNOWN"])
                      {
                        int v53 = 0;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_CATEGORY"])
                      {
                        int v53 = 1;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_CHAIN"])
                      {
                        int v53 = 2;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_BUSINESS"])
                      {
                        int v53 = 3;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_GEO"])
                      {
                        int v53 = 4;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_PROXIMITY"])
                      {
                        int v53 = 5;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_LOCATION"])
                      {
                        int v53 = 6;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_ATTRIBUTE"])
                      {
                        int v53 = 7;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_CLIENT_RESOLVED"])
                      {
                        int v53 = 8;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_SEARCH_FILTER"])
                      {
                        int v53 = 9;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_DIRECTION_INTENT"])
                      {
                        int v53 = 10;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_TRANSIT"])
                      {
                        int v53 = 11;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_PHONE_NUMBER"])
                      {
                        int v53 = 12;
                      }
                      else if ([v52 isEqualToString:@"INTENT_TYPE_KEYWORD"])
                      {
                        int v53 = 13;
                      }
                      else
                      {
                        int v53 = 0;
                      }

LABEL_99:
                      *(unsigned char *)(v50 + 20) |= 2u;
                      *(_DWORD *)(v50 + 16) = v53;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v53 = [v51 intValue];
                        goto LABEL_99;
                      }
                    }

                    unint64_t v54 = [v49 objectForKeyedSubscript:@"score"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v54 doubleValue];
                      *(unsigned char *)(v50 + 20) |= 1u;
                      *(void *)(v50 + 8) = v55;
                    }
                  }
                }
                else
                {
                  uint64_t v50 = 0;
                }
                -[GEOPDSearchQueryTagMetadata addSpanScore:](v30, (void *)v50);
              }
              ++v46;
            }
            while (v43 != v46);
            uint64_t v56 = [obj countByEnumeratingWithState:&v1025 objects:v1033 count:16];
            uint64_t v43 = v56;
            if (!v56)
            {
LABEL_109:

              id v42 = v906;
              break;
            }
          }
        }

        if (a3) {
          v57 = @"modelVersion";
        }
        else {
          v57 = @"model_version";
        }
        v58 = [v914 objectForKeyedSubscript:v57];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1024 = 0u;
          long long v1023 = 0u;
          long long v1022 = 0u;
          long long v1021 = 0u;
          id v59 = v58;
          uint64_t v60 = [v59 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
          if (v60)
          {
            uint64_t v61 = *(void *)v1022;
            do
            {
              uint64_t v62 = 0;
              do
              {
                if (*(void *)v1022 != v61) {
                  objc_enumerationMutation(v59);
                }
                v63 = *(void **)(*((void *)&v1021 + 1) + 8 * v62);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v64 = [GEOPDSearchStringStringPair alloc];
                  if (v64) {
                    v65 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v64, v63);
                  }
                  else {
                    v65 = 0;
                  }
                  -[GEOPDSearchQueryTagMetadata addModelVersion:](v30, v65);
                }
                ++v62;
              }
              while (v60 != v62);
              uint64_t v66 = [v59 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
              uint64_t v60 = v66;
            }
            while (v66);
          }
        }
        id v29 = v914;
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
    id v67 = (id)v30;
    *(void *)(v966 + 308) |= 0x404000000uLL;
    objc_storeStrong((id *)(v966 + 224), (id)v30);

    v26 = v923;
  }

  if (a3) {
    v68 = @"queryClassificationMetadata";
  }
  else {
    v68 = @"query_classification_metadata";
  }
  id v892 = [v885 objectForKeyedSubscript:v68];
  objc_opt_class();
  v69 = v892;
  if (objc_opt_isKindOfClass())
  {
    long long v983 = 0u;
    long long v984 = 0u;
    long long v981 = 0u;
    long long v982 = 0u;
    id v915 = v892;
    uint64_t v938 = [v915 countByEnumeratingWithState:&v981 objects:v1012 count:16];
    if (v938)
    {
      uint64_t v924 = *(void *)v982;
      if (a3) {
        v70 = @"classiferId";
      }
      else {
        v70 = @"classifer_id";
      }
      id v71 = @"model_version";
      if (a3) {
        id v71 = @"modelVersion";
      }
      v899 = v71;
      v907 = v70;
      do
      {
        uint64_t v72 = 0;
        do
        {
          if (*(void *)v982 != v924) {
            objc_enumerationMutation(v915);
          }
          id v73 = *(void **)(*((void *)&v981 + 1) + 8 * v72);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v74 = [GEOPDSearchQueryClassificationMetadata alloc];
            if (v74)
            {
              id obja = v73;
              uint64_t v75 = [(GEOPDSearchQueryClassificationMetadata *)v74 init];
              if (v75)
              {
                v76 = [obja objectForKeyedSubscript:v907];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v77 = (void *)[v76 copy];
                  id v78 = v77;
                  *(unsigned char *)(v75 + 60) |= 4u;
                  *(unsigned char *)(v75 + 60) |= 0x20u;
                  objc_storeStrong((id *)(v75 + 16), v77);
                }
                v79 = [obja objectForKeyedSubscript:@"prediction"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v1028 = 0u;
                  long long v1027 = 0u;
                  long long v1026 = 0u;
                  long long v1025 = 0u;
                  id v80 = v79;
                  uint64_t v81 = [v80 countByEnumeratingWithState:&v1025 objects:v1033 count:16];
                  if (v81)
                  {
                    uint64_t v82 = *(void *)v1026;
                    do
                    {
                      uint64_t v83 = 0;
                      do
                      {
                        if (*(void *)v1026 != v82) {
                          objc_enumerationMutation(v80);
                        }
                        v84 = *(void **)(*((void *)&v1025 + 1) + 8 * v83);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v85 = [GEOPDSearchKeyValueFloatPair alloc];
                          if (v85) {
                            v86 = (void *)-[GEOPDSearchKeyValueFloatPair _initWithDictionary:isJSON:]((uint64_t)v85, v84);
                          }
                          else {
                            v86 = 0;
                          }
                          -[GEOPDSearchQueryClassificationMetadata addPrediction:](v75, v86);
                        }
                        ++v83;
                      }
                      while (v81 != v83);
                      uint64_t v87 = [v80 countByEnumeratingWithState:&v1025 objects:v1033 count:16];
                      uint64_t v81 = v87;
                    }
                    while (v87);
                  }
                }
                id v88 = [obja objectForKeyedSubscript:@"poiGeoThreshold"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v88 floatValue];
                  *(unsigned char *)(v75 + 60) |= 0x20u;
                  *(unsigned char *)(v75 + 60) |= 2u;
                  *(_DWORD *)(v75 + 56) = v89;
                }

                v90 = [obja objectForKeyedSubscript:@"localGlobalThreshold"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v90 floatValue];
                  *(unsigned char *)(v75 + 60) |= 0x20u;
                  *(unsigned char *)(v75 + 60) |= 1u;
                  *(_DWORD *)(v75 + 52) = v91;
                }

                id v92 = [obja objectForKeyedSubscript:v899];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v1024 = 0u;
                  long long v1023 = 0u;
                  long long v1022 = 0u;
                  long long v1021 = 0u;
                  id v93 = v92;
                  uint64_t v94 = [v93 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
                  if (v94)
                  {
                    uint64_t v95 = *(void *)v1022;
                    do
                    {
                      uint64_t v96 = 0;
                      do
                      {
                        if (*(void *)v1022 != v95) {
                          objc_enumerationMutation(v93);
                        }
                        v97 = *(void **)(*((void *)&v1021 + 1) + 8 * v96);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v98 = [GEOPDSearchStringStringPair alloc];
                          if (v98) {
                            id v99 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v98, v97);
                          }
                          else {
                            id v99 = 0;
                          }
                          -[GEOPDSearchQueryClassificationMetadata addModelVersion:](v75, v99);
                        }
                        ++v96;
                      }
                      while (v94 != v96);
                      uint64_t v100 = [v93 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
                      uint64_t v94 = v100;
                    }
                    while (v100);
                  }
                }
              }
            }
            else
            {
              uint64_t v75 = 0;
            }
            -[GEOPDSearchQueryIntentMetadata addQueryClassificationMetadata:](v966, (void *)v75);
          }
          ++v72;
        }
        while (v72 != v938);
        uint64_t v101 = [v915 countByEnumeratingWithState:&v981 objects:v1012 count:16];
        uint64_t v938 = v101;
      }
      while (v101);
    }

    v69 = v892;
  }

  if (a3) {
    id v102 = @"querySpellCorrectionMetadata";
  }
  else {
    id v102 = @"query_spell_correction_metadata";
  }
  v103 = [v885 objectForKeyedSubscript:v102];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v104 = [GEOPDSearchQuerySpellCorrectionMetadata alloc];
    if (!v104)
    {
      uint64_t v106 = 0;
      goto LABEL_330;
    }
    id v105 = v103;
    uint64_t v106 = [(GEOPDSearchQuerySpellCorrectionMetadata *)v104 init];
    if (!v106)
    {
LABEL_329:

LABEL_330:
      id v173 = (id)v106;
      *(void *)(v966 + 308) |= 0x401000000uLL;
      objc_storeStrong((id *)(v966 + 208), (id)v106);

      goto LABEL_331;
    }
    if (a3) {
      v107 = @"spellSuggestion";
    }
    else {
      v107 = @"spell_suggestion";
    }
    id v108 = [v105 objectForKeyedSubscript:v107];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v109 = [GEOPDSearchSpellSuggestion alloc];
      if (v109) {
        v110 = (void *)-[GEOPDSearchSpellSuggestion _initWithDictionary:isJSON:]((uint64_t)v109, v108, a3);
      }
      else {
        v110 = 0;
      }
      id v111 = v110;
      *(_WORD *)(v106 + 100) |= 0x2000u;
      *(_WORD *)(v106 + 100) |= 0x8000u;
      objc_storeStrong((id *)(v106 + 48), v110);
    }
    if (a3) {
      v112 = @"isFromPoiSearchSpeller";
    }
    else {
      v112 = @"is_from_poi_search_speller";
    }
    id v113 = [v105 objectForKeyedSubscript:v112];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v114 = [v113 BOOLValue];
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 0x200u;
      *(unsigned char *)(v106 + 95) = v114;
    }

    if (a3) {
      id v115 = @"resultStatus";
    }
    else {
      id v115 = @"result_status";
    }
    id v116 = [v105 objectForKeyedSubscript:v115];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v117 = v116;
      if ([v117 isEqualToString:@"NOT_IN_WHITE_LIST"])
      {
        int v118 = 1;
      }
      else if ([v117 isEqualToString:@"SPELL_CORRECTION_NOT_ATTEMPTED"])
      {
        int v118 = 2;
      }
      else if ([v117 isEqualToString:@"NO_SUGGESTIONS"])
      {
        int v118 = 3;
      }
      else if ([v117 isEqualToString:@"SPELL_CORRECTION_NOT_REQUIRED"])
      {
        int v118 = 4;
      }
      else if ([v117 isEqualToString:@"SPELL_CORRECTED"])
      {
        int v118 = 5;
      }
      else if ([v117 isEqualToString:@"NOT_PROCESSED"])
      {
        int v118 = 6;
      }
      else
      {
        int v118 = 1;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_231;
      }
      int v118 = [v116 intValue];
    }
    *(_WORD *)(v106 + 100) |= 0x8000u;
    *(_WORD *)(v106 + 100) |= 0x10u;
    *(_DWORD *)(v106 + 84) = v118;
LABEL_231:

    if (a3) {
      v119 = @"decileId";
    }
    else {
      v119 = @"decile_id";
    }
    id v120 = [v105 objectForKeyedSubscript:v119];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v121 = [v120 unsignedLongLongValue];
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 1u;
      *(void *)(v106 + 32) = v121;
    }

    if (a3) {
      id v122 = @"isSpellCorrectionSameAsOrgQuery";
    }
    else {
      id v122 = @"is_spell_correction_same_as_org_query";
    }
    id v123 = [v105 objectForKeyedSubscript:v122];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v124 = [v123 BOOLValue];
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 0x400u;
      *(unsigned char *)(v106 + 96) = v124;
    }

    if (a3) {
      v125 = @"tokenCandidate";
    }
    else {
      v125 = @"token_candidate";
    }
    v126 = [v105 objectForKeyedSubscript:v125];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1024 = 0u;
      long long v1023 = 0u;
      long long v1022 = 0u;
      long long v1021 = 0u;
      id v127 = v126;
      uint64_t v128 = [v127 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
      if (v128)
      {
        uint64_t v129 = *(void *)v1022;
        do
        {
          uint64_t v130 = 0;
          do
          {
            if (*(void *)v1022 != v129) {
              objc_enumerationMutation(v127);
            }
            uint64_t v131 = *(void **)(*((void *)&v1021 + 1) + 8 * v130);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v132 = [GEOPDSearchTokenCandidates alloc];
              if (v132) {
                v133 = -[GEOPDSearchTokenCandidates _initWithDictionary:isJSON:](v132, v131, a3);
              }
              else {
                v133 = 0;
              }
              -[GEOPDSearchQuerySpellCorrectionMetadata addTokenCandidate:](v106, v133);
            }
            ++v130;
          }
          while (v128 != v130);
          uint64_t v134 = [v127 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
          uint64_t v128 = v134;
        }
        while (v134);
      }
    }
    if (a3) {
      id v135 = @"misspellScore";
    }
    else {
      id v135 = @"misspell_score";
    }
    id v136 = [v105 objectForKeyedSubscript:v135];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v136 doubleValue];
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 2u;
      *(void *)(v106 + 40) = v137;
    }

    if (a3) {
      v138 = @"isConfidentSpellCorrection";
    }
    else {
      v138 = @"is_confident_spell_correction";
    }
    v139 = [v105 objectForKeyedSubscript:v138];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v140 = [v139 BOOLValue];
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 0x100u;
      *(unsigned char *)(v106 + 94) = v140;
    }

    if (a3) {
      v141 = @"allTokenCandidates";
    }
    else {
      v141 = @"all_token_candidates";
    }
    v142 = [v105 objectForKeyedSubscript:v141];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1020 = 0u;
      long long v1019 = 0u;
      long long v1018 = 0u;
      long long v1017 = 0u;
      id v143 = v142;
      uint64_t v144 = [v143 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
      if (v144)
      {
        uint64_t v145 = *(void *)v1018;
        do
        {
          uint64_t v146 = 0;
          do
          {
            if (*(void *)v1018 != v145) {
              objc_enumerationMutation(v143);
            }
            id v147 = *(void **)(*((void *)&v1017 + 1) + 8 * v146);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v148 = [GEOPDSearchTokenCandidates alloc];
              if (v148) {
                v149 = -[GEOPDSearchTokenCandidates _initWithDictionary:isJSON:](v148, v147, a3);
              }
              else {
                v149 = 0;
              }
              -[GEOPDSearchQuerySpellCorrectionMetadata addAllTokenCandidates:](v106, v149);
            }
            ++v146;
          }
          while (v144 != v146);
          uint64_t v150 = [v143 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
          uint64_t v144 = v150;
        }
        while (v150);
      }
    }
    if (a3) {
      v151 = @"allSpellSuggestions";
    }
    else {
      v151 = @"all_spell_suggestions";
    }
    id v152 = [v105 objectForKeyedSubscript:v151];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1016 = 0u;
      long long v1015 = 0u;
      long long v1014 = 0u;
      long long v1013 = 0u;
      id v153 = v152;
      uint64_t v154 = [v153 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
      if (v154)
      {
        uint64_t v155 = *(void *)v1014;
        do
        {
          uint64_t v156 = 0;
          do
          {
            if (*(void *)v1014 != v155) {
              objc_enumerationMutation(v153);
            }
            v157 = *(void **)(*((void *)&v1013 + 1) + 8 * v156);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v158 = [GEOPDSearchSpellSuggestion alloc];
              if (v158) {
                id v159 = (void *)-[GEOPDSearchSpellSuggestion _initWithDictionary:isJSON:]((uint64_t)v158, v157, a3);
              }
              else {
                id v159 = 0;
              }
              -[GEOPDSearchQuerySpellCorrectionMetadata addAllSpellSuggestions:](v106, v159);
            }
            ++v156;
          }
          while (v154 != v156);
          uint64_t v160 = [v153 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
          uint64_t v154 = v160;
        }
        while (v160);
      }
    }
    if (a3) {
      id v161 = @"spellerRankerModelType";
    }
    else {
      id v161 = @"speller_ranker_model_type";
    }
    id v162 = [v105 objectForKeyedSubscript:v161];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v163 = v162;
      if ([v163 isEqualToString:@"MODEL_TYPE_UNKNOWN"])
      {
        int v164 = 0;
      }
      else if ([v163 isEqualToString:@"MODEL_TYPE_XGBOOST"])
      {
        int v164 = 1;
      }
      else if ([v163 isEqualToString:@"MODEL_TYPE_DL_SEQ2SEQ"])
      {
        int v164 = 2;
      }
      else
      {
        int v164 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_320:

        v165 = [v105 objectForKeyedSubscript:@"isFromDLCacheModel"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v166 = [v165 BOOLValue];
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 0x40u;
          *(unsigned char *)(v106 + 92) = v166;
        }

        v167 = [v105 objectForKeyedSubscript:@"isFromDLRuntimeModel"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v168 = [v167 BOOLValue];
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 0x80u;
          *(unsigned char *)(v106 + 93) = v168;
        }

        id v169 = [v105 objectForKeyedSubscript:@"modelNumberMajor"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v170 = [v169 unsignedIntValue];
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 4u;
          *(_DWORD *)(v106 + 76) = v170;
        }

        v171 = [v105 objectForKeyedSubscript:@"modelNumberMinor"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v172 = [v171 unsignedIntValue];
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 8u;
          *(_DWORD *)(v106 + 80) = v172;
        }

        goto LABEL_329;
      }
      int v164 = [v162 intValue];
    }
    *(_WORD *)(v106 + 100) |= 0x8000u;
    *(_WORD *)(v106 + 100) |= 0x20u;
    *(_DWORD *)(v106 + 88) = v164;
    goto LABEL_320;
  }
LABEL_331:

  if (a3) {
    v174 = @"isFromDefinitiveQu";
  }
  else {
    v174 = @"is_from_definitive_qu";
  }
  id v175 = [v885 objectForKeyedSubscript:v174];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v176 = [v175 BOOLValue];
    *(void *)(v966 + 308) |= 0x400000004uLL;
    *(unsigned char *)(v966 + 304) = v176;
  }

  if (a3) {
    v177 = @"queryGeoMetadata";
  }
  else {
    v177 = @"query_geo_metadata";
  }
  v178 = [v885 objectForKeyedSubscript:v177];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v179 = [GEOPDSearchQueryGeoMetadata alloc];
    if (v179)
    {
      id v180 = v178;
      v181 = [(GEOPDSearchQueryGeoMetadata *)v179 init];
      if (v181)
      {
        if (a3) {
          id v182 = @"namedFeature";
        }
        else {
          id v182 = @"named_feature";
        }
        uint64_t v183 = [v180 objectForKeyedSubscript:v182];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1032 = 0u;
          long long v1031 = 0u;
          long long v1030 = 0u;
          long long v1029 = 0u;
          id v184 = v183;
          uint64_t v185 = [v184 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
          if (v185)
          {
            uint64_t v186 = *(void *)v1030;
            do
            {
              for (uint64_t i = 0; i != v185; ++i)
              {
                if (*(void *)v1030 != v186) {
                  objc_enumerationMutation(v184);
                }
                uint64_t v188 = *(void *)(*((void *)&v1029 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v189 = [GEONamedFeature alloc];
                  if (a3) {
                    id v190 = [(GEONamedFeature *)v189 initWithJSON:v188];
                  }
                  else {
                    id v190 = [(GEONamedFeature *)v189 initWithDictionary:v188];
                  }
                  id v191 = v190;
                  -[GEOPDSearchQueryGeoMetadata addNamedFeature:]((uint64_t)v181, v190);
                }
              }
              uint64_t v185 = [v184 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
            }
            while (v185);
          }
        }
      }
    }
    else
    {
      v181 = 0;
    }
    v192 = v181;
    *(void *)(v966 + 308) |= 0x400020000uLL;
    objc_storeStrong((id *)(v966 + 144), v181);
  }
  if (a3) {
    v193 = @"intentSource";
  }
  else {
    v193 = @"intent_source";
  }
  id objb = [v885 objectForKeyedSubscript:v193];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v979 = 0u;
    long long v980 = 0u;
    long long v977 = 0u;
    long long v978 = 0u;
    id v194 = objb;
    uint64_t v195 = [v194 countByEnumeratingWithState:&v977 objects:v1011 count:16];
    if (!v195) {
      goto LABEL_389;
    }
    uint64_t v196 = *(void *)v978;
    while (1)
    {
      for (uint64_t j = 0; j != v195; ++j)
      {
        if (*(void *)v978 != v196) {
          objc_enumerationMutation(v194);
        }
        id v198 = *(void **)(*((void *)&v977 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v199 = v198;
          if (([v199 isEqualToString:@"NONE"] & 1) == 0
            && ([v199 isEqualToString:@"PERCEPTRON"] & 1) == 0
            && ([v199 isEqualToString:@"TREE_BASED"] & 1) == 0
            && ([v199 isEqualToString:@"QIS"] & 1) == 0
            && ([v199 isEqualToString:@"AC_TAP"] & 1) == 0
            && ([v199 isEqualToString:@"NEURAL"] & 1) == 0)
          {
            [v199 isEqualToString:@"GEO"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v198 intValue];
        }
        v200 = (os_unfair_lock_s *)v966;
        os_unfair_lock_lock((os_unfair_lock_t)(v966 + 296));
        if ((*(unsigned char *)(v966 + 308) & 0x20) == 0)
        {
          v201 = *(void **)(v966 + 8);
          if (v201)
          {
            id v202 = v201;
            objc_sync_enter(v202);
            GEOPDSearchQueryIntentMetadataReadSpecified(v966, *(void *)(v966 + 8), (int *)&_readIntentSources_tags);
            objc_sync_exit(v202);

            v200 = (os_unfair_lock_s *)v966;
          }
        }
        os_unfair_lock_unlock(v200 + 74);
        PBRepeatedInt32Add();
        os_unfair_lock_lock_with_options();
        *(void *)(v966 + 308) |= 0x20uLL;
        os_unfair_lock_unlock((os_unfair_lock_t)(v966 + 296));
        *(void *)(v966 + 308) |= 0x400000000uLL;
      }
      uint64_t v195 = [v194 countByEnumeratingWithState:&v977 objects:v1011 count:16];
      if (!v195)
      {
LABEL_389:

        break;
      }
    }
  }

  if (a3) {
    v203 = @"querySynonymMetadata";
  }
  else {
    v203 = @"query_synonym_metadata";
  }
  id v204 = [v885 objectForKeyedSubscript:v203];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v205 = [GEOPDSearchQuerySynonymMetadata alloc];
    if (v205) {
      v206 = (void *)-[GEOPDSearchQuerySynonymMetadata _initWithDictionary:isJSON:](v205, v204, a3);
    }
    else {
      v206 = 0;
    }
    id v207 = v206;
    *(void *)(v966 + 308) |= 0x402000000uLL;
    objc_storeStrong((id *)(v966 + 216), v206);
  }
  if (a3) {
    v208 = @"queryDymMetadata";
  }
  else {
    v208 = @"query_dym_metadata";
  }
  id v209 = [v885 objectForKeyedSubscript:v208];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v210 = [GEOPDSearchQueryDymMetadata alloc];
    if (!v210)
    {
      uint64_t v212 = 0;
      goto LABEL_428;
    }
    id v211 = v209;
    uint64_t v212 = [(GEOPDSearchQueryDymMetadata *)v210 init];
    if (!v212)
    {
LABEL_427:

LABEL_428:
      id v224 = (id)v212;
      *(void *)(v966 + 308) |= 0x400004000uLL;
      objc_storeStrong((id *)(v966 + 120), (id)v212);

      goto LABEL_429;
    }
    long long v213 = [v211 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v214 = v213;
      if ([v214 isEqualToString:@"NONE"])
      {
        int v215 = 0;
      }
      else if ([v214 isEqualToString:@"ORIGINAL"])
      {
        int v215 = 1;
      }
      else if ([v214 isEqualToString:@"REFINED"])
      {
        int v215 = 2;
      }
      else if ([v214 isEqualToString:@"DISPLAY_ONLY"])
      {
        int v215 = 3;
      }
      else
      {
        int v215 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_417:

        long long v216 = [v211 objectForKeyedSubscript:v860];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v217 = (void *)[v216 copy];
          id v218 = v217;
          *(unsigned char *)(v212 + 48) |= 2u;
          *(unsigned char *)(v212 + 48) |= 8u;
          objc_storeStrong((id *)(v212 + 16), v217);
        }
        if (a3) {
          long long v219 = @"synonymMetadata";
        }
        else {
          long long v219 = @"synonym_metadata";
        }
        long long v220 = [v211 objectForKeyedSubscript:v219];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v221 = [GEOPDSearchQuerySynonymMetadata alloc];
          if (v221) {
            v222 = (void *)-[GEOPDSearchQuerySynonymMetadata _initWithDictionary:isJSON:](v221, v220, a3);
          }
          else {
            v222 = 0;
          }
          id v223 = v222;
          *(unsigned char *)(v212 + 48) |= 4u;
          *(unsigned char *)(v212 + 48) |= 8u;
          objc_storeStrong((id *)(v212 + 24), v222);
        }
        goto LABEL_427;
      }
      int v215 = [v213 intValue];
    }
    *(unsigned char *)(v212 + 48) |= 8u;
    *(unsigned char *)(v212 + 48) |= 1u;
    *(_DWORD *)(v212 + 44) = v215;
    goto LABEL_417;
  }
LABEL_429:

  if (a3) {
    v225 = @"queryCompletionMetadata";
  }
  else {
    v225 = @"query_completion_metadata";
  }
  id objc = [v885 objectForKeyedSubscript:v225];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v226 = [GEOPDSearchQueryCompletionMetadata alloc];
    if (v226)
    {
      id v939 = objc;
      uint64_t v227 = [(GEOPDSearchQueryCompletionMetadata *)v226 init];
      if (v227)
      {
        v228 = [v939 objectForKeyedSubscript:@"completion"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v229 = (void *)[v228 copy];
          id v230 = v229;
          *(_WORD *)(v227 + 112) |= 0x40u;
          *(_WORD *)(v227 + 112) |= 0x100u;
          objc_storeStrong((id *)(v227 + 64), v229);
        }
        v231 = [v939 objectForKeyedSubscript:@"score"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v231 floatValue];
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 2u;
          *(_DWORD *)(v227 + 100) = v232;
        }

        v233 = [v939 objectForKeyedSubscript:@"popularity"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v234 = [v233 longLongValue];
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 1u;
          *(void *)(v227 + 72) = v234;
        }

        v925 = [v939 objectForKeyedSubscript:@"tags"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1024 = 0u;
          long long v1023 = 0u;
          long long v1022 = 0u;
          long long v1021 = 0u;
          id v235 = v925;
          uint64_t v236 = [v235 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
          if (v236)
          {
            uint64_t v237 = *(void *)v1022;
            do
            {
              for (uint64_t k = 0; k != v236; ++k)
              {
                if (*(void *)v1022 != v237) {
                  objc_enumerationMutation(v235);
                }
                v239 = *(void **)(*((void *)&v1021 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v239 intValue];
                  os_unfair_lock_lock((os_unfair_lock_t)(v227 + 96));
                  if ((*(_WORD *)(v227 + 112) & 0x20) == 0)
                  {
                    v240 = *(void **)(v227 + 8);
                    if (v240)
                    {
                      id v241 = v240;
                      objc_sync_enter(v241);
                      GEOPDSearchQueryCompletionMetadataReadSpecified(v227, *(void *)(v227 + 8), (int *)&_readTags_tags);
                      objc_sync_exit(v241);
                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
                  PBRepeatedInt32Add();
                  os_unfair_lock_lock_with_options();
                  *(_WORD *)(v227 + 112) |= 0x20u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
                  *(_WORD *)(v227 + 112) |= 0x100u;
                }
              }
              uint64_t v236 = [v235 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
            }
            while (v236);
          }
        }
        if (a3) {
          v242 = @"tagConfidence";
        }
        else {
          v242 = @"tag_confidence";
        }
        v243 = [v939 objectForKeyedSubscript:v242];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v243 floatValue];
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 4u;
          *(_DWORD *)(v227 + 104) = v244;
        }

        if (a3) {
          v245 = @"isCompletematch";
        }
        else {
          v245 = @"is_completeMatch";
        }
        v246 = [v939 objectForKeyedSubscript:v245];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v247 = [v246 BOOLValue];
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 8u;
          *(unsigned char *)(v227 + 108) = v247;
        }

        v248 = [v939 objectForKeyedSubscript:@"tokens"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1020 = 0u;
          long long v1019 = 0u;
          long long v1018 = 0u;
          long long v1017 = 0u;
          id v249 = v248;
          uint64_t v250 = [v249 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
          if (v250)
          {
            uint64_t v251 = *(void *)v1018;
            do
            {
              for (uint64_t m = 0; m != v250; ++m)
              {
                if (*(void *)v1018 != v251) {
                  objc_enumerationMutation(v249);
                }
                v253 = *(void **)(*((void *)&v1017 + 1) + 8 * m);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v254 = (void *)[v253 copy];
                  -[GEOPDSearchQueryCompletionMetadata addTokens:](v227, v254);
                }
              }
              uint64_t v250 = [v249 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
            }
            while (v250);
          }
        }
        if (a3) {
          v255 = @"completionSourceTypes";
        }
        else {
          v255 = @"completion_source_types";
        }
        v926 = [v939 objectForKeyedSubscript:v255];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1016 = 0u;
          long long v1015 = 0u;
          long long v1014 = 0u;
          long long v1013 = 0u;
          id v256 = v926;
          uint64_t v257 = [v256 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
          if (!v257) {
            goto LABEL_511;
          }
          uint64_t v258 = *(void *)v1014;
          while (1)
          {
            for (uint64_t n = 0; n != v257; ++n)
            {
              if (*(void *)v1014 != v258) {
                objc_enumerationMutation(v256);
              }
              v260 = *(void **)(*((void *)&v1013 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v261 = v260;
                if (([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_DEFAULT"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_LOG"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_EDITORIAL"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_CLUSTER"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_LATENT_BRAND"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_GLOV"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_EXPANSION"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_EMBEDDING"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_EMBEDDING_NNS"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_LOCALIZATION"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_STRUCTURED"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_LEGACY"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_RANKING"] & 1) == 0
                  && ([v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_TRANSLATION"] & 1) == 0)
                {
                  [v261 isEqualToString:@"COMPLETION_SOURCE_TYPE_APPLE_LLM"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v260 intValue];
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v227 + 96));
              if ((*(_WORD *)(v227 + 112) & 0x10) == 0)
              {
                v262 = *(void **)(v227 + 8);
                if (v262)
                {
                  id v263 = v262;
                  objc_sync_enter(v263);
                  GEOPDSearchQueryCompletionMetadataReadSpecified(v227, *(void *)(v227 + 8), (int *)&_readCompletionSourceTypes_tags);
                  objc_sync_exit(v263);
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v227 + 112) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
              *(_WORD *)(v227 + 112) |= 0x100u;
            }
            uint64_t v257 = [v256 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
            if (!v257)
            {
LABEL_511:

              break;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v227 = 0;
    }
    id v264 = (id)v227;
    *(void *)(v966 + 308) |= 0x400000800uLL;
    objc_storeStrong((id *)(v966 + 96), (id)v227);
  }
  if (a3) {
    v265 = @"queryInterpretationMetadata";
  }
  else {
    v265 = @"query_interpretation_metadata";
  }
  v862 = [v885 objectForKeyedSubscript:v265];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v266 = [GEOPDSearchQueryInterpretationMetadata alloc];
    if (v266)
    {
      id v861 = v862;
      uint64_t v940 = [(GEOPDSearchQueryInterpretationMetadata *)v266 init];
      if (v940)
      {
        v267 = [v861 objectForKeyedSubscript:@"score"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v267 floatValue];
          *(unsigned char *)(v940 + 68) |= 0x40u;
          *(unsigned char *)(v940 + 68) |= 1u;
          *(_DWORD *)(v940 + 60) = v268;
        }

        if (a3) {
          v269 = @"featureMap";
        }
        else {
          v269 = @"feature_map";
        }
        v270 = [v861 objectForKeyedSubscript:v269];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v991 = 0u;
          long long v992 = 0u;
          long long v989 = 0u;
          long long v990 = 0u;
          id v271 = v270;
          uint64_t v272 = [v271 countByEnumeratingWithState:&v989 objects:&v1017 count:16];
          if (v272)
          {
            uint64_t v273 = *(void *)v990;
            do
            {
              uint64_t v274 = 0;
              do
              {
                if (*(void *)v990 != v273) {
                  objc_enumerationMutation(v271);
                }
                v275 = *(void **)(*((void *)&v989 + 1) + 8 * v274);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v276 = [GEOPDSearchPair alloc];
                  if (v276) {
                    v277 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v276, v275);
                  }
                  else {
                    v277 = 0;
                  }
                  -[GEOPDSearchQueryInterpretationMetadata addFeatureMap:](v940, v277);
                }
                ++v274;
              }
              while (v272 != v274);
              uint64_t v278 = [v271 countByEnumeratingWithState:&v989 objects:&v1017 count:16];
              uint64_t v272 = v278;
            }
            while (v278);
          }
        }
        if (a3) {
          v279 = @"triggerFeatures";
        }
        else {
          v279 = @"trigger_features";
        }
        v858 = [v861 objectForKeyedSubscript:v279];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v987 = 0u;
          long long v988 = 0u;
          long long v985 = 0u;
          long long v986 = 0u;
          id v893 = v858;
          uint64_t v908 = [v893 countByEnumeratingWithState:&v985 objects:&v1013 count:16];
          if (v908)
          {
            v280 = @"canonical_name";
            id v900 = *(id *)v986;
            if (a3) {
              v280 = @"canonicalName";
            }
            v886 = v280;
            v281 = @"entityId";
            if (!a3) {
              v281 = @"entity_id";
            }
            v881 = v281;
            v282 = @"global_popularity";
            if (a3) {
              v282 = @"globalPopularity";
            }
            v878 = v282;
            if (a3) {
              v283 = @"localPmiScore";
            }
            else {
              v283 = @"local_pmi_score";
            }
            v876 = v283;
            if (a3) {
              v284 = @"globalPmiScore";
            }
            else {
              v284 = @"global_pmi_Score";
            }
            v285 = @"display_name";
            if (a3) {
              v285 = @"displayName";
            }
            v873 = v285;
            v874 = v284;
            if (a3) {
              v286 = @"completionSourceTypes";
            }
            else {
              v286 = @"completion_source_types";
            }
            v287 = @"isUseShowOnMapHighlightExtra";
            if (!a3) {
              v287 = @"is_use_show_on_map_highlight_extra";
            }
            v871 = v287;
            v872 = v286;
            v288 = @"similarity_score";
            if (a3) {
              v288 = @"similarityScore";
            }
            v870 = v288;
            if (a3) {
              v289 = @"w2vSimilarityScore";
            }
            else {
              v289 = @"w2v_similarity_score";
            }
            v869 = v289;
            if (a3) {
              v290 = @"globalEntityPopularity";
            }
            else {
              v290 = @"global_entity_popularity";
            }
            v291 = @"local_entity_popularity";
            if (a3) {
              v291 = @"localEntityPopularity";
            }
            v867 = v291;
            v868 = v290;
            if (a3) {
              v292 = @"prefCategory";
            }
            else {
              v292 = @"pref_category";
            }
            v293 = @"modernToLegacyIdMapping";
            if (!a3) {
              v293 = @"modern_to_legacy_id_mapping";
            }
            v865 = v293;
            v866 = v292;
            v294 = @"related_categories";
            if (a3) {
              v294 = @"relatedCategories";
            }
            v864 = v294;
            if (a3) {
              v295 = @"densityScore";
            }
            else {
              v295 = @"density_score";
            }
            v863 = v295;
            do
            {
              uint64_t v296 = 0;
              do
              {
                if (*(id *)v986 != v900)
                {
                  uint64_t v297 = v296;
                  objc_enumerationMutation(v893);
                  uint64_t v296 = v297;
                }
                uint64_t v927 = v296;
                v298 = *(void **)(*((void *)&v985 + 1) + 8 * v296);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v299 = [GEOPDSearchTriggerFeature alloc];
                  if (v299)
                  {
                    id objd = v298;
                    uint64_t v300 = [(GEOPDSearchTriggerFeature *)v299 init];
                    if (v300)
                    {
                      v301 = [objd objectForKeyedSubscript:@"trigger"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v302 = (void *)[v301 copy];
                        id v303 = v302;
                        *(_DWORD *)(v300 + 196) |= 0x100000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 152), v302);
                      }
                      v304 = [objd objectForKeyedSubscript:v886];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v305 = (void *)[v304 copy];
                        id v306 = v305;
                        *(_DWORD *)(v300 + 196) |= 0x4000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 40), v305);
                      }
                      v307 = [objd objectForKeyedSubscript:@"tag"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v308 = [v307 intValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x800u;
                        *(_DWORD *)(v300 + 188) = v308;
                      }

                      v309 = [objd objectForKeyedSubscript:v881];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v310 = (void *)[v309 copy];
                        id v311 = v310;
                        *(_DWORD *)(v300 + 196) |= 0x10000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 64), v310);
                      }
                      v312 = [objd objectForKeyedSubscript:v878];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v313 = [v312 longLongValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 4u;
                        *(void *)(v300 + 80) = v313;
                      }

                      v314 = [objd objectForKeyedSubscript:v876];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v314 floatValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x400u;
                        *(_DWORD *)(v300 + 184) = v315;
                      }

                      v316 = [objd objectForKeyedSubscript:v874];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v316 floatValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x200u;
                        *(_DWORD *)(v300 + 180) = v317;
                      }

                      v318 = [objd objectForKeyedSubscript:@"lat"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v318 doubleValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 8u;
                        *(void *)(v300 + 88) = v319;
                      }

                      v320 = [objd objectForKeyedSubscript:@"lng"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v320 doubleValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x10u;
                        *(void *)(v300 + 96) = v321;
                      }

                      v322 = [objd objectForKeyedSubscript:v873];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v323 = (void *)[v322 copy];
                        id v324 = v323;
                        *(_DWORD *)(v300 + 196) |= 0x8000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 56), v323);
                      }
                      v325 = [objd objectForKeyedSubscript:@"localPopularity"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v326 = [v325 longLongValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x20u;
                        *(void *)(v300 + 104) = v326;
                      }

                      id v916 = [objd objectForKeyedSubscript:v872];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1007 = 0u;
                        long long v1008 = 0u;
                        long long v1005 = 0u;
                        long long v1006 = 0u;
                        id v327 = v916;
                        uint64_t v328 = [v327 countByEnumeratingWithState:&v1005 objects:v1033 count:16];
                        if (!v328) {
                          goto LABEL_646;
                        }
                        uint64_t v329 = *(void *)v1006;
                        while (1)
                        {
                          for (iuint64_t i = 0; ii != v328; ++ii)
                          {
                            if (*(void *)v1006 != v329) {
                              objc_enumerationMutation(v327);
                            }
                            v331 = *(void **)(*((void *)&v1005 + 1) + 8 * ii);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v332 = v331;
                              if (([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_DEFAULT"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_LOG"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_EDITORIAL"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_CLUSTER"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_LATENT_BRAND"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_GLOV"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_EXPANSION"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_EMBEDDING"] & 1) == 0
                                && ([v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_EMBEDDING_NNS"] & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", @"COMPLETION_SOURCE_TYPE_LOCALIZATION") & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", @"COMPLETION_SOURCE_TYPE_STRUCTURED") & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", @"COMPLETION_SOURCE_TYPE_LEGACY") & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", @"COMPLETION_SOURCE_TYPE_RANKING") & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", @"COMPLETION_SOURCE_TYPE_TRANSLATION") & 1) == 0)
                              {
                                [v332 isEqualToString:@"COMPLETION_SOURCE_TYPE_APPLE_LLM"];
                              }
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0) {
                                continue;
                              }
                              [v331 intValue];
                            }
                            os_unfair_lock_lock((os_unfair_lock_t)(v300 + 176));
                            if ((*(unsigned char *)(v300 + 197) & 0x20) == 0)
                            {
                              v333 = *(void **)(v300 + 8);
                              if (v333)
                              {
                                id v334 = v333;
                                objc_sync_enter(v334);
                                GEOPDSearchTriggerFeatureReadSpecified(v300, *(void *)(v300 + 8), (int *)&_readCompletionSourceTypes_tags_2510);
                                objc_sync_exit(v334);
                              }
                            }
                            os_unfair_lock_unlock((os_unfair_lock_t)(v300 + 176));
                            PBRepeatedInt32Add();
                            os_unfair_lock_lock_with_options();
                            *(_DWORD *)(v300 + 196) |= 0x2000u;
                            os_unfair_lock_unlock((os_unfair_lock_t)(v300 + 176));
                            *(_DWORD *)(v300 + 196) |= 0x200000u;
                          }
                          uint64_t v328 = [v327 countByEnumeratingWithState:&v1005 objects:v1033 count:16];
                          if (!v328)
                          {
LABEL_646:

                            break;
                          }
                        }
                      }

                      v335 = [objd objectForKeyedSubscript:v871];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        char v336 = [v335 BOOLValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x1000u;
                        *(unsigned char *)(v300 + 192) = v336;
                      }

                      v337 = [objd objectForKeyedSubscript:v870];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v337 doubleValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x80u;
                        *(void *)(v300 + 144) = v338;
                      }

                      v339 = [objd objectForKeyedSubscript:v869];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v339 doubleValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x100u;
                        *(void *)(v300 + 160) = v340;
                      }

                      v341 = [objd objectForKeyedSubscript:v868];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v342 = [v341 longLongValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 2u;
                        *(void *)(v300 + 72) = v342;
                      }

                      v343 = [objd objectForKeyedSubscript:v867];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v344 = [v343 longLongValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x40u;
                        *(void *)(v300 + 112) = v344;
                      }

                      v345 = [objd objectForKeyedSubscript:v866];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1003 = 0u;
                        long long v1004 = 0u;
                        long long v1001 = 0u;
                        long long v1002 = 0u;
                        id v346 = v345;
                        uint64_t v347 = [v346 countByEnumeratingWithState:&v1001 objects:&v1029 count:16];
                        if (v347)
                        {
                          uint64_t v348 = *(void *)v1002;
                          do
                          {
                            for (juint64_t j = 0; jj != v347; ++jj)
                            {
                              if (*(void *)v1002 != v348) {
                                objc_enumerationMutation(v346);
                              }
                              v350 = *(void **)(*((void *)&v1001 + 1) + 8 * jj);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v351 = (void *)[v350 copy];
                                -[GEOPDSearchTriggerFeature addPrefCategory:]((os_unfair_lock_s *)v300, v351);
                              }
                            }
                            uint64_t v347 = [v346 countByEnumeratingWithState:&v1001 objects:&v1029 count:16];
                          }
                          while (v347);
                        }
                      }
                      v352 = [objd objectForKeyedSubscript:v865];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v999 = 0u;
                        long long v1000 = 0u;
                        long long v997 = 0u;
                        long long v998 = 0u;
                        id v353 = v352;
                        uint64_t v354 = [v353 countByEnumeratingWithState:&v997 objects:&v1025 count:16];
                        if (v354)
                        {
                          uint64_t v355 = *(void *)v998;
                          do
                          {
                            uint64_t v356 = 0;
                            do
                            {
                              if (*(void *)v998 != v355) {
                                objc_enumerationMutation(v353);
                              }
                              v357 = *(void **)(*((void *)&v997 + 1) + 8 * v356);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v358 = [GEOPDSearchKeyValuePair alloc];
                                if (v358) {
                                  v359 = (void *)-[GEOPDSearchKeyValuePair _initWithDictionary:isJSON:]((uint64_t)v358, v357);
                                }
                                else {
                                  v359 = 0;
                                }
                                -[GEOPDSearchTriggerFeature addModernToLegacyIdMapping:](v300, v359);
                              }
                              ++v356;
                            }
                            while (v354 != v356);
                            uint64_t v360 = [v353 countByEnumeratingWithState:&v997 objects:&v1025 count:16];
                            uint64_t v354 = v360;
                          }
                          while (v360);
                        }
                      }
                      v361 = [objd objectForKeyedSubscript:v864];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v995 = 0u;
                        long long v996 = 0u;
                        long long v993 = 0u;
                        long long v994 = 0u;
                        id v362 = v361;
                        uint64_t v363 = [v362 countByEnumeratingWithState:&v993 objects:&v1021 count:16];
                        if (v363)
                        {
                          uint64_t v364 = *(void *)v994;
                          do
                          {
                            uint64_t v365 = 0;
                            do
                            {
                              if (*(void *)v994 != v364) {
                                objc_enumerationMutation(v362);
                              }
                              v366 = *(void **)(*((void *)&v993 + 1) + 8 * v365);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v367 = [GEOPDSearchRelatedCategory alloc];
                                if (v367) {
                                  v368 = (void *)-[GEOPDSearchRelatedCategory _initWithDictionary:isJSON:](v367, v366, a3);
                                }
                                else {
                                  v368 = 0;
                                }
                                -[GEOPDSearchTriggerFeature addRelatedCategories:](v300, v368);
                              }
                              ++v365;
                            }
                            while (v363 != v365);
                            uint64_t v369 = [v362 countByEnumeratingWithState:&v993 objects:&v1021 count:16];
                            uint64_t v363 = v369;
                          }
                          while (v369);
                        }
                      }
                      v370 = [objd objectForKeyedSubscript:v863];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v371 = [v370 longLongValue];
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 1u;
                        *(void *)(v300 + 48) = v371;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v300 = 0;
                  }
                  -[GEOPDSearchQueryInterpretationMetadata addTriggerFeatures:](v940, (void *)v300);
                }
                uint64_t v296 = v927 + 1;
              }
              while (v927 + 1 != v908);
              uint64_t v372 = [v893 countByEnumeratingWithState:&v985 objects:&v1013 count:16];
              uint64_t v908 = v372;
            }
            while (v372);
          }
        }
        if (a3) {
          v373 = @"isFromRuntimeQueryTriggerStore";
        }
        else {
          v373 = @"is_from_runtime_query_trigger_store";
        }
        v374 = [v861 objectForKeyedSubscript:v373];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v375 = [v374 BOOLValue];
          *(unsigned char *)(v940 + 68) |= 0x40u;
          *(unsigned char *)(v940 + 68) |= 2u;
          *(unsigned char *)(v940 + 64) = v375;
        }

        v376 = [v861 objectForKeyedSubscript:@"completion"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v377 = (void *)[v376 copy];
          id v378 = v377;
          *(unsigned char *)(v940 + 68) |= 8u;
          *(unsigned char *)(v940 + 68) |= 0x40u;
          objc_storeStrong((id *)(v940 + 24), v377);
        }
        if (a3) {
          v379 = @"canonicalCompletion";
        }
        else {
          v379 = @"canonical_completion";
        }
        v380 = [v861 objectForKeyedSubscript:v379];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v381 = (void *)[v380 copy];
          id v382 = v381;
          *(unsigned char *)(v940 + 68) |= 4u;
          *(unsigned char *)(v940 + 68) |= 0x40u;
          objc_storeStrong((id *)(v940 + 16), v381);
        }
      }
    }
    else
    {
      uint64_t v940 = 0;
    }
    id v383 = (id)v940;
    *(void *)(v966 + 308) |= 0x400100000uLL;
    objc_storeStrong((id *)(v966 + 176), (id)v940);
  }
  if (a3) {
    v384 = @"queryDirectionsIntentMetadata";
  }
  else {
    v384 = @"query_directions_intent_metadata";
  }
  v385 = [v885 objectForKeyedSubscript:v384];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v386 = [GEOPDSearchQueryDirectionsIntentMetadata alloc];
    if (!v386)
    {
      uint64_t v388 = 0;
      goto LABEL_805;
    }
    id v387 = v385;
    uint64_t v388 = [(GEOPDSearchQueryDirectionsIntentMetadata *)v386 init];
    if (!v388)
    {
LABEL_804:

LABEL_805:
      id v412 = (id)v388;
      *(void *)(v966 + 308) |= 0x400002000uLL;
      objc_storeStrong((id *)(v966 + 112), (id)v388);

      goto LABEL_806;
    }
    if (a3) {
      v389 = @"intentType";
    }
    else {
      v389 = @"intent_type";
    }
    v390 = [v387 objectForKeyedSubscript:v389];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v391 = v390;
      if ([v391 isEqualToString:@"UNKNOWN"])
      {
        int v392 = 0;
      }
      else if ([v391 isEqualToString:@"FROM_PLACE1"])
      {
        int v392 = 1;
      }
      else if ([v391 isEqualToString:@"TO_PLACE1"])
      {
        int v392 = 2;
      }
      else if ([v391 isEqualToString:@"FROM_PLACE1_TO_PLACE2"])
      {
        int v392 = 3;
      }
      else if ([v391 isEqualToString:@"FROM_PLACE2_TO_PLACE1"])
      {
        int v392 = 4;
      }
      else if ([v391 isEqualToString:@"DIRECTIONS_PHRASE_ONLY"])
      {
        int v392 = 5;
      }
      else
      {
        int v392 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_750;
      }
      int v392 = [v390 intValue];
    }
    *(unsigned char *)(v388 + 68) |= 0x80u;
    *(unsigned char *)(v388 + 68) |= 1u;
    *(_DWORD *)(v388 + 52) = v392;
LABEL_750:

    if (a3) {
      v393 = @"directionPhrase";
    }
    else {
      v393 = @"direction_phrase";
    }
    v394 = [v387 objectForKeyedSubscript:v393];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v395 = (void *)[v394 copy];
      id v396 = v395;
      *(unsigned char *)(v388 + 68) |= 0x10u;
      *(unsigned char *)(v388 + 68) |= 0x80u;
      objc_storeStrong((id *)(v388 + 16), v395);
    }
    v397 = [v387 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v398 = v397;
      if ([v398 isEqualToString:@"AUTOMOBILE"])
      {
        int v399 = 0;
      }
      else if ([v398 isEqualToString:@"TRANSIT"])
      {
        int v399 = 1;
      }
      else if ([v398 isEqualToString:@"WALKING"])
      {
        int v399 = 2;
      }
      else if ([v398 isEqualToString:@"BICYCLE"])
      {
        int v399 = 3;
      }
      else if ([v398 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
      {
        int v399 = 4;
      }
      else if ([v398 isEqualToString:@"FERRY"])
      {
        int v399 = 5;
      }
      else if ([v398 isEqualToString:@"RIDESHARE"])
      {
        int v399 = 6;
      }
      else
      {
        int v399 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_775;
      }
      int v399 = [v397 intValue];
    }
    *(unsigned char *)(v388 + 68) |= 0x80u;
    *(unsigned char *)(v388 + 68) |= 8u;
    *(_DWORD *)(v388 + 64) = v399;
LABEL_775:

    v400 = [v387 objectForKeyedSubscript:@"preposition1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v401 = v400;
      if ([v401 isEqualToString:@"UNKNOWN_PREPOSITION"])
      {
        int v402 = 0;
      }
      else if ([v401 isEqualToString:@"FROM"])
      {
        int v402 = 1;
      }
      else if ([v401 isEqualToString:@"TO"])
      {
        int v402 = 2;
      }
      else
      {
        int v402 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_787;
      }
      int v402 = [v400 intValue];
    }
    *(unsigned char *)(v388 + 68) |= 0x80u;
    *(unsigned char *)(v388 + 68) |= 2u;
    *(_DWORD *)(v388 + 56) = v402;
LABEL_787:

    v403 = [v387 objectForKeyedSubscript:@"place1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v404 = (void *)[v403 copy];
      id v405 = v404;
      *(unsigned char *)(v388 + 68) |= 0x20u;
      *(unsigned char *)(v388 + 68) |= 0x80u;
      objc_storeStrong((id *)(v388 + 24), v404);
    }
    v406 = [v387 objectForKeyedSubscript:@"preposition2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v407 = v406;
      if ([v407 isEqualToString:@"UNKNOWN_PREPOSITION"])
      {
        int v408 = 0;
      }
      else if ([v407 isEqualToString:@"FROM"])
      {
        int v408 = 1;
      }
      else if ([v407 isEqualToString:@"TO"])
      {
        int v408 = 2;
      }
      else
      {
        int v408 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_801:

        v409 = [v387 objectForKeyedSubscript:@"place2"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v410 = (void *)[v409 copy];
          id v411 = v410;
          *(unsigned char *)(v388 + 68) |= 0x40u;
          *(unsigned char *)(v388 + 68) |= 0x80u;
          objc_storeStrong((id *)(v388 + 32), v410);
        }
        goto LABEL_804;
      }
      int v408 = [v406 intValue];
    }
    *(unsigned char *)(v388 + 68) |= 0x80u;
    *(unsigned char *)(v388 + 68) |= 4u;
    *(_DWORD *)(v388 + 60) = v408;
    goto LABEL_801;
  }
LABEL_806:

  if (a3) {
    v413 = @"queryNormalizerMetadata";
  }
  else {
    v413 = @"query_normalizer_metadata";
  }
  v414 = [v885 objectForKeyedSubscript:v413];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v415 = [GEOPDSearchQueryNormalizerMetadata alloc];
    if (v415)
    {
      id v416 = v414;
      uint64_t v417 = [(GEOPDSearchQueryNormalizerMetadata *)v415 init];
      if (v417)
      {
        v418 = [v416 objectForKeyedSubscript:v860];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v419 = (void *)[v418 copy];
          id v420 = v419;
          *(unsigned char *)(v417 + 52) |= 4u;
          *(unsigned char *)(v417 + 52) |= 8u;
          objc_storeStrong((id *)(v417 + 32), v419);
        }
        if (a3) {
          v421 = @"normalizedQuery";
        }
        else {
          v421 = @"normalized_query";
        }
        v422 = [v416 objectForKeyedSubscript:v421];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v423 = (void *)[v422 copy];
          id v424 = v423;
          *(unsigned char *)(v417 + 52) |= 1u;
          *(unsigned char *)(v417 + 52) |= 8u;
          objc_storeStrong((id *)(v417 + 16), v423);
        }
        if (a3) {
          v425 = @"normalizerName";
        }
        else {
          v425 = @"normalizer_name";
        }
        v426 = [v416 objectForKeyedSubscript:v425];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v427 = (void *)[v426 copy];
          id v428 = v427;
          *(unsigned char *)(v417 + 52) |= 2u;
          *(unsigned char *)(v417 + 52) |= 8u;
          objc_storeStrong((id *)(v417 + 24), v427);
        }
      }
    }
    else
    {
      uint64_t v417 = 0;
    }
    id v429 = (id)v417;
    *(void *)(v966 + 308) |= 0x400400000uLL;
    objc_storeStrong((id *)(v966 + 192), (id)v417);
  }
  if (a3) {
    v430 = @"queryGeoNormalizerMetadata";
  }
  else {
    v430 = @"query_geo_normalizer_metadata";
  }
  id obje = [v885 objectForKeyedSubscript:v430];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v431 = [GEOPDSearchQueryGeoNormalizerMetadata alloc];
    if (v431)
    {
      id v941 = obje;
      uint64_t v432 = [(GEOPDSearchQueryGeoNormalizerMetadata *)v431 init];
      if (v432)
      {
        if (a3) {
          v433 = @"unitNumber";
        }
        else {
          v433 = @"unit_number";
        }
        v434 = [v941 objectForKeyedSubscript:v433];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v435 = (void *)[v434 copy];
          id v436 = v435;
          *(unsigned char *)(v432 + 92) |= 0x10u;
          *(unsigned char *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 64), v435);
        }
        v437 = [v941 objectForKeyedSubscript:@"floor"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v438 = (void *)[v437 copy];
          id v439 = v438;
          *(unsigned char *)(v432 + 92) |= 2u;
          *(unsigned char *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 40), v438);
        }
        if (a3) {
          v440 = @"poPox";
        }
        else {
          v440 = @"po_pox";
        }
        v441 = [v941 objectForKeyedSubscript:v440];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v442 = (void *)[v441 copy];
          id v443 = v442;
          *(unsigned char *)(v432 + 92) |= 8u;
          *(unsigned char *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 56), v442);
        }
        if (a3) {
          v444 = @"mailStop";
        }
        else {
          v444 = @"mail_stop";
        }
        v445 = [v941 objectForKeyedSubscript:v444];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v446 = (void *)[v445 copy];
          id v447 = v446;
          *(unsigned char *)(v432 + 92) |= 4u;
          *(unsigned char *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 48), v446);
        }
        if (a3) {
          v448 = @"unitTypeId";
        }
        else {
          v448 = @"unit_type_id";
        }
        v449 = [v941 objectForKeyedSubscript:v448];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v450 = (void *)[v449 copy];
          id v451 = v450;
          *(unsigned char *)(v432 + 92) |= 0x20u;
          *(unsigned char *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 72), v450);
        }
        v928 = [v941 objectForKeyedSubscript:@"normalizers"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1032 = 0u;
          long long v1031 = 0u;
          long long v1030 = 0u;
          long long v1029 = 0u;
          id v452 = v928;
          uint64_t v453 = [v452 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
          if (!v453) {
            goto LABEL_877;
          }
          uint64_t v454 = *(void *)v1030;
          while (1)
          {
            for (kuint64_t k = 0; kk != v453; ++kk)
            {
              if (*(void *)v1030 != v454) {
                objc_enumerationMutation(v452);
              }
              v456 = *(void **)(*((void *)&v1029 + 1) + 8 * kk);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v457 = v456;
                if (([v457 isEqualToString:@"NORMALIZE"] & 1) == 0
                  && ([v457 isEqualToString:@"TOKEN_DROP"] & 1) == 0
                  && ([v457 isEqualToString:@"SEGMENTATION"] & 1) == 0
                  && ([v457 isEqualToString:@"NUMERICS_REPLACEMENT"] & 1) == 0)
                {
                  [v457 isEqualToString:@"RBO"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v456 intValue];
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v432 + 88));
              if ((*(unsigned char *)(v432 + 92) & 1) == 0)
              {
                v458 = *(void **)(v432 + 8);
                if (v458)
                {
                  id v459 = v458;
                  objc_sync_enter(v459);
                  GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(v432, *(void *)(v432 + 8), (int *)&_readNormalizers_tags);
                  objc_sync_exit(v459);
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v432 + 88));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v432 + 92) |= 1u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v432 + 88));
              *(unsigned char *)(v432 + 92) |= 0x40u;
            }
            uint64_t v453 = [v452 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
            if (!v453)
            {
LABEL_877:

              break;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v432 = 0;
    }
    id v460 = (id)v432;
    *(void *)(v966 + 308) |= 0x400040000uLL;
    objc_storeStrong((id *)(v966 + 152), (id)v432);
  }
  if (a3) {
    v461 = @"queryTokenizerMetadata";
  }
  else {
    v461 = @"query_tokenizer_metadata";
  }
  v462 = [v885 objectForKeyedSubscript:v461];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v463 = [GEOPDSearchQueryTokenizerMetadata alloc];
    if (v463) {
      v464 = (void *)-[GEOPDSearchQueryTokenizerMetadata _initWithDictionary:isJSON:](v463, v462, a3);
    }
    else {
      v464 = 0;
    }
    id v465 = v464;
    *(void *)(v966 + 308) |= 0x410000000uLL;
    objc_storeStrong((id *)(v966 + 240), v464);
  }
  if (a3) {
    v466 = @"queryTransliterMetadata";
  }
  else {
    v466 = @"query_transliter_metadata";
  }
  v467 = [v885 objectForKeyedSubscript:v466];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v468 = [GEOPDSearchQueryTransliteratorMetadata alloc];
    if (!v468)
    {
      uint64_t v470 = 0;
      goto LABEL_918;
    }
    id v469 = v467;
    uint64_t v470 = [(GEOPDSearchQueryTransliteratorMetadata *)v468 init];
    if (!v470)
    {
LABEL_917:

LABEL_918:
      id v482 = (id)v470;
      *(void *)(v966 + 308) |= 0x420000000uLL;
      objc_storeStrong((id *)(v966 + 248), (id)v470);

      goto LABEL_919;
    }
    v471 = [v469 objectForKeyedSubscript:@"reading"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v472 = (void *)[v471 copy];
      id v473 = v472;
      *(unsigned char *)(v470 + 48) |= 4u;
      *(unsigned char *)(v470 + 48) |= 8u;
      objc_storeStrong((id *)(v470 + 24), v472);
    }
    if (a3) {
      v474 = @"parentQuery";
    }
    else {
      v474 = @"parent_query";
    }
    v475 = [v469 objectForKeyedSubscript:v474];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v476 = (void *)[v475 copy];
      id v477 = v476;
      *(unsigned char *)(v470 + 48) |= 2u;
      *(unsigned char *)(v470 + 48) |= 8u;
      objc_storeStrong((id *)(v470 + 16), v476);
    }
    if (a3) {
      v478 = @"transliteratorSource";
    }
    else {
      v478 = @"transliterator_source";
    }
    v479 = [v469 objectForKeyedSubscript:v478];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v480 = v479;
      if ([v480 isEqualToString:@"NONE"])
      {
        int v481 = 0;
      }
      else if ([v480 isEqualToString:@"ICU"])
      {
        int v481 = 1;
      }
      else if ([v480 isEqualToString:@"KUROMOJI"])
      {
        int v481 = 2;
      }
      else
      {
        int v481 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_916:

        goto LABEL_917;
      }
      int v481 = [v479 intValue];
    }
    *(unsigned char *)(v470 + 48) |= 8u;
    *(unsigned char *)(v470 + 48) |= 1u;
    *(_DWORD *)(v470 + 44) = v481;
    goto LABEL_916;
  }
LABEL_919:

  if (a3) {
    v483 = @"queryFuzzyMatchV2Metadata";
  }
  else {
    v483 = @"query_fuzzy_match_v2_metadata";
  }
  id objf = [v885 objectForKeyedSubscript:v483];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v484 = [GEOPDSearchQueryFuzzyMatchV2Metadata alloc];
    if (v484)
    {
      id v942 = objf;
      uint64_t v485 = [(GEOPDSearchQueryFuzzyMatchV2Metadata *)v484 init];
      if (v485)
      {
        v486 = [v942 objectForKeyedSubscript:@"rewrittenQueries"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1020 = 0u;
          long long v1019 = 0u;
          long long v1018 = 0u;
          long long v1017 = 0u;
          id v487 = v486;
          uint64_t v488 = [v487 countByEnumeratingWithState:&v1017 objects:v1033 count:16];
          if (v488)
          {
            uint64_t v489 = *(void *)v1018;
            do
            {
              for (muint64_t m = 0; mm != v488; ++mm)
              {
                if (*(void *)v1018 != v489) {
                  objc_enumerationMutation(v487);
                }
                v491 = *(void **)(*((void *)&v1017 + 1) + 8 * mm);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v492 = (void *)[v491 copy];
                  -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueries:](v485, v492);
                }
              }
              uint64_t v488 = [v487 countByEnumeratingWithState:&v1017 objects:v1033 count:16];
            }
            while (v488);
          }
        }
        v493 = [v942 objectForKeyedSubscript:@"useFuzzyV1"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v494 = [v493 BOOLValue];
          *(unsigned char *)(v485 + 96) |= 0x40u;
          *(unsigned char *)(v485 + 96) |= 2u;
          *(unsigned char *)(v485 + 93) = v494;
        }

        v495 = [v942 objectForKeyedSubscript:@"pruneFuzzyV2Results"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v496 = [v495 BOOLValue];
          *(unsigned char *)(v485 + 96) |= 0x40u;
          *(unsigned char *)(v485 + 96) |= 1u;
          *(unsigned char *)(v485 + 92) = v496;
        }

        v929 = [v942 objectForKeyedSubscript:@"fuzzyV2Scores"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1016 = 0u;
          long long v1015 = 0u;
          long long v1014 = 0u;
          long long v1013 = 0u;
          id v497 = v929;
          uint64_t v498 = [v497 countByEnumeratingWithState:&v1013 objects:&v1029 count:16];
          if (v498)
          {
            uint64_t v499 = *(void *)v1014;
            do
            {
              for (nuint64_t n = 0; nn != v498; ++nn)
              {
                if (*(void *)v1014 != v499) {
                  objc_enumerationMutation(v497);
                }
                v501 = *(void **)(*((void *)&v1013 + 1) + 8 * nn);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v501 doubleValue];
                  os_unfair_lock_lock((os_unfair_lock_t)(v485 + 88));
                  if ((*(unsigned char *)(v485 + 96) & 4) == 0)
                  {
                    v502 = *(void **)(v485 + 8);
                    if (v502)
                    {
                      id v503 = v502;
                      objc_sync_enter(v503);
                      GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(v485, *(void *)(v485 + 8), (int *)&_readFuzzyV2Scores_tags);
                      objc_sync_exit(v503);
                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
                  PBRepeatedDoubleAdd();
                  os_unfair_lock_lock_with_options();
                  *(unsigned char *)(v485 + 96) |= 4u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
                  *(unsigned char *)(v485 + 96) |= 0x40u;
                }
              }
              uint64_t v498 = [v497 countByEnumeratingWithState:&v1013 objects:&v1029 count:16];
            }
            while (v498);
          }
        }
        if (a3) {
          v504 = @"rewriteTypes";
        }
        else {
          v504 = @"rewrite_types";
        }
        v930 = [v942 objectForKeyedSubscript:v504];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1007 = 0u;
          long long v1008 = 0u;
          long long v1005 = 0u;
          long long v1006 = 0u;
          id v505 = v930;
          uint64_t v506 = [v505 countByEnumeratingWithState:&v1005 objects:&v1025 count:16];
          if (!v506) {
            goto LABEL_977;
          }
          v507 = @"LAZY_REWRITE_NONE";
          uint64_t v508 = *(void *)v1006;
          while (1)
          {
            for (uint64_t i1 = 0; i1 != v506; ++i1)
            {
              if (*(void *)v1006 != v508) {
                objc_enumerationMutation(v505);
              }
              v510 = *(void **)(*((void *)&v1005 + 1) + 8 * i1);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v511 = v510;
                if (([v511 isEqualToString:v507] & 1) == 0
                  && ([v511 isEqualToString:@"FV2"] & 1) == 0)
                {
                  [v511 isEqualToString:@"TOK"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v510 intValue];
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v485 + 88));
              if ((*(unsigned char *)(v485 + 96) & 8) == 0)
              {
                v512 = *(void **)(v485 + 8);
                if (v512)
                {
                  v513 = v507;
                  id v514 = v512;
                  objc_sync_enter(v514);
                  GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(v485, *(void *)(v485 + 8), (int *)&_readRewriteTypes_tags);
                  objc_sync_exit(v514);

                  v507 = v513;
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v485 + 96) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
              *(unsigned char *)(v485 + 96) |= 0x40u;
            }
            uint64_t v506 = [v505 countByEnumeratingWithState:&v1005 objects:&v1025 count:16];
            if (!v506)
            {
LABEL_977:

              break;
            }
          }
        }

        v515 = [v942 objectForKeyedSubscript:@"rewrittenQueryTokens"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1003 = 0u;
          long long v1004 = 0u;
          long long v1001 = 0u;
          long long v1002 = 0u;
          id v516 = v515;
          uint64_t v517 = [v516 countByEnumeratingWithState:&v1001 objects:&v1021 count:16];
          if (v517)
          {
            uint64_t v518 = *(void *)v1002;
            do
            {
              uint64_t v519 = 0;
              do
              {
                if (*(void *)v1002 != v518) {
                  objc_enumerationMutation(v516);
                }
                v520 = *(void **)(*((void *)&v1001 + 1) + 8 * v519);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v521 = [GEOPDSearchTokenSet alloc];
                  if (v521) {
                    v522 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v521, v520, a3);
                  }
                  else {
                    v522 = 0;
                  }
                  -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueryTokens:](v485, v522);
                }
                ++v519;
              }
              while (v517 != v519);
              uint64_t v523 = [v516 countByEnumeratingWithState:&v1001 objects:&v1021 count:16];
              uint64_t v517 = v523;
            }
            while (v523);
          }
        }
      }
    }
    else
    {
      uint64_t v485 = 0;
    }
    id v524 = (id)v485;
    *(void *)(v966 + 308) |= 0x400010000uLL;
    objc_storeStrong((id *)(v966 + 136), (id)v485);
  }
  if (a3) {
    v525 = @"rewrittenQueryType";
  }
  else {
    v525 = @"rewritten_query_type";
  }
  id objg = [v885 objectForKeyedSubscript:v525];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v975 = 0u;
    long long v976 = 0u;
    long long v973 = 0u;
    long long v974 = 0u;
    id v526 = objg;
    uint64_t v527 = [v526 countByEnumeratingWithState:&v973 objects:v1010 count:16];
    if (!v527) {
      goto LABEL_1039;
    }
    uint64_t v528 = *(void *)v974;
    while (1)
    {
      for (uint64_t i2 = 0; i2 != v527; ++i2)
      {
        if (*(void *)v974 != v528) {
          objc_enumerationMutation(v526);
        }
        v530 = *(void **)(*((void *)&v973 + 1) + 8 * i2);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v531 = v530;
          if (([v531 isEqualToString:@"NONE_REWRITTEN_QUERY_TYPE"] & 1) == 0
            && ([v531 isEqualToString:@"NORMALIZATION"] & 1) == 0
            && ([v531 isEqualToString:@"SPELL_CORRECTION"] & 1) == 0
            && ([v531 isEqualToString:@"TOK_SYNONYM"] & 1) == 0
            && ([v531 isEqualToString:@"REWRITTEN_QUERY_TYPE_SYNONYM"] & 1) == 0
            && ([v531 isEqualToString:@"TOKENIZATION"] & 1) == 0
            && ([v531 isEqualToString:@"COMPLETION"] & 1) == 0
            && ([v531 isEqualToString:@"CLASSIFICATION"] & 1) == 0
            && ([v531 isEqualToString:@"QUERY_INTERPRETATION"] & 1) == 0
            && ([v531 isEqualToString:@"TAG"] & 1) == 0
            && ([v531 isEqualToString:@"DEFINITIVE_QU"] & 1) == 0
            && ([v531 isEqualToString:@"POI_SEARCH_SPELL_CORRECTION"] & 1) == 0
            && ([v531 isEqualToString:@"TRANSLITERATION"] & 1) == 0
            && ([v531 isEqualToString:@"FUZZY_MATCH_V2"] & 1) == 0
            && ([v531 isEqualToString:@"DISPLAY_NAME"] & 1) == 0
            && ([v531 isEqualToString:@"DIRECTION"] & 1) == 0
            && ([v531 isEqualToString:@"EMOJI"] & 1) == 0
            && ([v531 isEqualToString:@"ZIP_DOOR_INTERPREATION"] & 1) == 0
            && ([v531 isEqualToString:@"SIRI_ATTRIBUTES"] & 1) == 0
            && ([v531 isEqualToString:@"TOKEN_IMPORTANCE"] & 1) == 0
            && ([v531 isEqualToString:@"BRAND_DATA"] & 1) == 0
            && ([v531 isEqualToString:@"NEURAL_REWRITE"] & 1) == 0)
          {
            [v531 isEqualToString:@"EMBEDDING"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v530 intValue];
        }
        v532 = (os_unfair_lock_s *)v966;
        os_unfair_lock_lock((os_unfair_lock_t)(v966 + 296));
        if ((*(unsigned char *)(v966 + 308) & 0x40) == 0)
        {
          v533 = *(void **)(v966 + 8);
          if (v533)
          {
            id v534 = v533;
            objc_sync_enter(v534);
            GEOPDSearchQueryIntentMetadataReadSpecified(v966, *(void *)(v966 + 8), (int *)&_readRewrittenQueryTypes_tags);
            objc_sync_exit(v534);

            v532 = (os_unfair_lock_s *)v966;
          }
        }
        os_unfair_lock_unlock(v532 + 74);
        PBRepeatedInt32Add();
        os_unfair_lock_lock_with_options();
        *(void *)(v966 + 308) |= 0x40uLL;
        os_unfair_lock_unlock((os_unfair_lock_t)(v966 + 296));
        *(void *)(v966 + 308) |= 0x400000000uLL;
      }
      uint64_t v527 = [v526 countByEnumeratingWithState:&v973 objects:v1010 count:16];
      if (!v527)
      {
LABEL_1039:

        break;
      }
    }
  }

  if (a3) {
    v535 = @"queryPoiMetadata";
  }
  else {
    v535 = @"query_poi_metadata";
  }
  v536 = [v885 objectForKeyedSubscript:v535];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v537 = [GEOPDSearchQueryPoiMetadata alloc];
    if (v537)
    {
      id v538 = v536;
      v539 = [(GEOPDSearchQueryPoiMetadata *)v537 init];
      if (v539)
      {
        if (a3) {
          v540 = @"namedFeature";
        }
        else {
          v540 = @"named_feature";
        }
        v541 = [v538 objectForKeyedSubscript:v540];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1032 = 0u;
          long long v1031 = 0u;
          long long v1030 = 0u;
          long long v1029 = 0u;
          id v542 = v541;
          uint64_t v543 = [v542 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
          if (v543)
          {
            uint64_t v544 = *(void *)v1030;
            do
            {
              for (uint64_t i3 = 0; i3 != v543; ++i3)
              {
                if (*(void *)v1030 != v544) {
                  objc_enumerationMutation(v542);
                }
                uint64_t v546 = *(void *)(*((void *)&v1029 + 1) + 8 * i3);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v547 = [GEONamedFeature alloc];
                  if (a3) {
                    v548 = [(GEONamedFeature *)v547 initWithJSON:v546];
                  }
                  else {
                    v548 = [(GEONamedFeature *)v547 initWithDictionary:v546];
                  }
                  v549 = v548;
                  -[GEOPDSearchQueryPoiMetadata addNamedFeature:]((uint64_t)v539, v548);
                }
              }
              uint64_t v543 = [v542 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
            }
            while (v543);
          }
        }
      }
    }
    else
    {
      v539 = 0;
    }
    v550 = v539;
    *(void *)(v966 + 308) |= 0x400800000uLL;
    objc_storeStrong((id *)(v966 + 200), v539);
  }
  if (a3) {
    v551 = @"acHintMetadata";
  }
  else {
    v551 = @"ac_hint_metadata";
  }
  id v901 = [v885 objectForKeyedSubscript:v551];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v552 = [GEOPDSearchACHintMetadata alloc];
    if (v552)
    {
      id v894 = v901;
      objh = [(GEOPDSearchACHintMetadata *)v552 init];
      if (objh)
      {
        v553 = [v894 objectForKeyedSubscript:@"feature"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1016 = 0u;
          long long v1015 = 0u;
          long long v1014 = 0u;
          long long v1013 = 0u;
          id v554 = v553;
          uint64_t v555 = [v554 countByEnumeratingWithState:&v1013 objects:&v1029 count:16];
          if (v555)
          {
            uint64_t v556 = *(void *)v1014;
            do
            {
              uint64_t v557 = 0;
              do
              {
                if (*(void *)v1014 != v556) {
                  objc_enumerationMutation(v554);
                }
                v558 = *(void **)(*((void *)&v1013 + 1) + 8 * v557);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v559 = [GEOPDSearchKeyValueFloatPair alloc];
                  if (v559) {
                    v560 = (void *)-[GEOPDSearchKeyValueFloatPair _initWithDictionary:isJSON:]((uint64_t)v559, v558);
                  }
                  else {
                    v560 = 0;
                  }
                  -[GEOPDSearchACHintMetadata addFeature:]((uint64_t)objh, v560);
                }
                ++v557;
              }
              while (v555 != v557);
              uint64_t v561 = [v554 countByEnumeratingWithState:&v1013 objects:&v1029 count:16];
              uint64_t v555 = v561;
            }
            while (v561);
          }
        }
        if (a3) {
          v562 = @"brooklynEntry";
        }
        else {
          v562 = @"brooklyn_entry";
        }
        v563 = [v894 objectForKeyedSubscript:v562];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1007 = 0u;
          long long v1008 = 0u;
          long long v1005 = 0u;
          long long v1006 = 0u;
          id v564 = v563;
          uint64_t v565 = [v564 countByEnumeratingWithState:&v1005 objects:&v1025 count:16];
          if (v565)
          {
            uint64_t v566 = *(void *)v1006;
            do
            {
              for (uint64_t i4 = 0; i4 != v565; ++i4)
              {
                if (*(void *)v1006 != v566) {
                  objc_enumerationMutation(v564);
                }
                uint64_t v568 = *(void *)(*((void *)&v1005 + 1) + 8 * i4);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v569 = [GEOPDAutocompleteEntry alloc];
                  if (a3) {
                    v570 = [(GEOPDAutocompleteEntry *)v569 initWithJSON:v568];
                  }
                  else {
                    v570 = [(GEOPDAutocompleteEntry *)v569 initWithDictionary:v568];
                  }
                  v571 = v570;
                  -[GEOPDSearchACHintMetadata addBrooklynEntry:]((uint64_t)objh, v570);
                }
              }
              uint64_t v565 = [v564 countByEnumeratingWithState:&v1005 objects:&v1025 count:16];
            }
            while (v565);
          }
        }
        if (a3) {
          v572 = @"addressEntry";
        }
        else {
          v572 = @"address_entry";
        }
        v887 = [v894 objectForKeyedSubscript:v572];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1003 = 0u;
          long long v1004 = 0u;
          long long v1001 = 0u;
          long long v1002 = 0u;
          id v917 = v887;
          uint64_t v943 = [v917 countByEnumeratingWithState:&v1001 objects:&v1021 count:16];
          if (v943)
          {
            uint64_t v931 = *(void *)v1002;
            if (a3) {
              v573 = @"topResult";
            }
            else {
              v573 = @"top_result";
            }
            v909 = v573;
            do
            {
              uint64_t v574 = 0;
              do
              {
                if (*(void *)v1002 != v931) {
                  objc_enumerationMutation(v917);
                }
                v575 = *(void **)(*((void *)&v1001 + 1) + 8 * v574);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v576 = [GEOPDSearchAddressEntry alloc];
                  if (v576)
                  {
                    id v577 = v575;
                    uint64_t v578 = [(GEOPDSearchAddressEntry *)v576 init];
                    if (v578)
                    {
                      v579 = [v577 objectForKeyedSubscript:v909];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v580 = [GEOPDSearchEntry alloc];
                        if (v580) {
                          v581 = (void *)-[GEOPDSearchEntry _initWithDictionary:isJSON:](v580, v579, a3);
                        }
                        else {
                          v581 = 0;
                        }
                        id v582 = v581;
                        *(unsigned char *)(v578 + 44) |= 2u;
                        *(unsigned char *)(v578 + 44) |= 4u;
                        objc_storeStrong((id *)(v578 + 24), v581);
                      }
                      v583 = [v577 objectForKeyedSubscript:@"candidates"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1020 = 0u;
                        long long v1019 = 0u;
                        long long v1018 = 0u;
                        long long v1017 = 0u;
                        id v584 = v583;
                        uint64_t v585 = [v584 countByEnumeratingWithState:&v1017 objects:v1033 count:16];
                        if (v585)
                        {
                          uint64_t v586 = *(void *)v1018;
                          do
                          {
                            uint64_t v587 = 0;
                            do
                            {
                              if (*(void *)v1018 != v586) {
                                objc_enumerationMutation(v584);
                              }
                              v588 = *(void **)(*((void *)&v1017 + 1) + 8 * v587);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v589 = [GEOPDSearchEntry alloc];
                                if (v589) {
                                  v590 = (void *)-[GEOPDSearchEntry _initWithDictionary:isJSON:](v589, v588, a3);
                                }
                                else {
                                  v590 = 0;
                                }
                                -[GEOPDSearchAddressEntry addCandidates:](v578, v590);
                              }
                              ++v587;
                            }
                            while (v585 != v587);
                            uint64_t v591 = [v584 countByEnumeratingWithState:&v1017 objects:v1033 count:16];
                            uint64_t v585 = v591;
                          }
                          while (v591);
                        }
                      }
                    }
                  }
                  else
                  {
                    uint64_t v578 = 0;
                  }
                  -[GEOPDSearchACHintMetadata addAddressEntry:]((uint64_t)objh, (void *)v578);
                }
                ++v574;
              }
              while (v574 != v943);
              uint64_t v592 = [v917 countByEnumeratingWithState:&v1001 objects:&v1021 count:16];
              uint64_t v943 = v592;
            }
            while (v592);
          }
        }
        if (a3) {
          v593 = @"businessEntry";
        }
        else {
          v593 = @"business_entry";
        }
        v944 = [v894 objectForKeyedSubscript:v593];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1020 = 0u;
          long long v1019 = 0u;
          long long v1018 = 0u;
          long long v1017 = 0u;
          id v594 = v944;
          uint64_t v595 = [v594 countByEnumeratingWithState:&v1017 objects:v1033 count:16];
          if (v595)
          {
            uint64_t v596 = *(void *)v1018;
            if (a3) {
              v597 = @"businessId";
            }
            else {
              v597 = @"business_id";
            }
            do
            {
              uint64_t v598 = 0;
              do
              {
                if (*(void *)v1018 != v596) {
                  objc_enumerationMutation(v594);
                }
                v599 = *(void **)(*((void *)&v1017 + 1) + 8 * v598);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v600 = [GEOPDSearchBusinessEntry alloc];
                  if (v600)
                  {
                    id v601 = v599;
                    uint64_t v602 = [(GEOPDSearchBusinessEntry *)v600 init];
                    if (v602)
                    {
                      v603 = [v601 objectForKeyedSubscript:v597];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v604 = [v603 unsignedLongLongValue];
                        *(unsigned char *)(v602 + 16) |= 1u;
                        *(void *)(v602 + 8) = v604;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v602 = 0;
                  }
                  -[GEOPDSearchACHintMetadata addBusinessEntry:]((uint64_t)objh, (void *)v602);
                }
                ++v598;
              }
              while (v595 != v598);
              uint64_t v605 = [v594 countByEnumeratingWithState:&v1017 objects:v1033 count:16];
              uint64_t v595 = v605;
            }
            while (v605);
          }
        }
      }
    }
    else
    {
      objh = 0;
    }
    -[GEOPDSearchQueryIntentMetadata setAcHintMetadata:](v966, objh);
  }
  if (a3) {
    v606 = @"queryGeoTagMetadata";
  }
  else {
    v606 = @"query_geo_tag_metadata";
  }
  v888 = [v885 objectForKeyedSubscript:v606];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_1434;
  }
  v607 = [GEOPDSearchQueryGeoTagMetadata alloc];
  if (v607)
  {
    id v882 = v888;
    objuint64_t i = [(GEOPDSearchQueryGeoTagMetadata *)v607 init];
    if (!obji)
    {
LABEL_1432:

      goto LABEL_1433;
    }
    if (a3) {
      v608 = @"tagSources";
    }
    else {
      v608 = @"tag_sources";
    }
    v945 = [v882 objectForKeyedSubscript:v608];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1016 = 0u;
      long long v1015 = 0u;
      long long v1014 = 0u;
      long long v1013 = 0u;
      id v609 = v945;
      uint64_t v610 = [v609 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
      if (!v610) {
        goto LABEL_1228;
      }
      uint64_t v611 = *(void *)v1014;
      while (1)
      {
        for (uint64_t i5 = 0; i5 != v610; ++i5)
        {
          if (*(void *)v1014 != v611) {
            objc_enumerationMutation(v609);
          }
          v613 = *(void **)(*((void *)&v1013 + 1) + 8 * i5);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v614 = v613;
            if (([v614 isEqualToString:@"CRF"] & 1) == 0
              && ([v614 isEqualToString:@"LSTM"] & 1) == 0
              && ([v614 isEqualToString:@"WFST"] & 1) == 0
              && ([v614 isEqualToString:@"TAG_HINTS"] & 1) == 0
              && ([v614 isEqualToString:@"JP_BUILDING"] & 1) == 0
              && ([v614 isEqualToString:@"INTERSECTION_RULE"] & 1) == 0
              && ([v614 isEqualToString:@"INTERSECTION_WITH_DOOR_NUMBER"] & 1) == 0
              && ([v614 isEqualToString:@"INTERSECTION_WITHOUT_CONNECTOR"] & 1) == 0
              && ([v614 isEqualToString:@"ALTER_SINGLE_DIRECTION"] & 1) == 0
              && ([v614 isEqualToString:@"ALTER_ABOVE_STREET_DIRECTION"] & 1) == 0
              && ([v614 isEqualToString:@"ALTER_ABOVE_STREET_ARTICLE"] & 1) == 0
              && ([v614 isEqualToString:@"ALTER_ABOVE_STREET_POSTAL_ONLY"] & 1) == 0
              && ([v614 isEqualToString:@"ALTER_ABOVE_STREET_IPHOTO_LOCALITY_ONLY"] & 1) == 0
              && ([v614 isEqualToString:@"ALTER_BELOW_STREET_ONLY"] & 1) == 0
              && ([v614 isEqualToString:@"ALTER_FRENCH_DOOR_NUMBER"] & 1) == 0
              && ([v614 isEqualToString:@"FORK_ALL_STREET_PARSE_BY_RULE"] & 1) == 0
              && ([v614 isEqualToString:@"WFST_AUGMENTATION"] & 1) == 0
              && ([v614 isEqualToString:@"DICTIONARY_AUGMENTATION"] & 1) == 0
              && ([v614 isEqualToString:@"STATIC_RULE_AUGMENTATION"] & 1) == 0
              && ([v614 isEqualToString:@"TOKENDROP_BELOW_STREET"] & 1) == 0
              && ([v614 isEqualToString:@"TOKENDROP_ABOVE_STREET"] & 1) == 0
              && ([v614 isEqualToString:@"OVERRIDE"] & 1) == 0
              && ([v614 isEqualToString:@"POSTAL_TOKENS_ONLY_FOR_IE"] & 1) == 0
              && ([v614 isEqualToString:@"TYPE_TOKEN"] & 1) == 0
              && ([v614 isEqualToString:@"REMOVE_SUB_PREMISE_FOR_CA"] & 1) == 0
              && ([v614 isEqualToString:@"AC_HINT"] & 1) == 0
              && ([v614 isEqualToString:@"POSTAL_AND_DOOR_NUMBER_ONLY"] & 1) == 0)
            {
              [v614 isEqualToString:@"BUILDING"];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v613 intValue];
          }
          v615 = (os_unfair_lock_s *)obji;
          os_unfair_lock_lock(&obji->_readerLock);
          if ((*(unsigned char *)&obji->_flags & 2) == 0)
          {
            reader = obji->_reader;
            if (reader)
            {
              v617 = reader;
              objc_sync_enter(v617);
              GEOPDSearchQueryGeoTagMetadataReadSpecified((uint64_t)obji, (unint64_t)obji->_reader, (int *)&_readTagSources_tags);
              objc_sync_exit(v617);

              v615 = (os_unfair_lock_s *)obji;
            }
          }
          os_unfair_lock_unlock(v615 + 22);
          PBRepeatedInt32Add();
          os_unfair_lock_lock_with_options();
          *(unsigned char *)&obji->_flags |= 2u;
          os_unfair_lock_unlock(&obji->_readerLock);
          *(unsigned char *)&obji->_flags |= 0x10u;
        }
        uint64_t v610 = [v609 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
        if (!v610)
        {
LABEL_1228:

          break;
        }
      }
    }

    if (a3) {
      v618 = @"geoParsingResult";
    }
    else {
      v618 = @"geo_parsing_result";
    }
    v619 = [v882 objectForKeyedSubscript:v618];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_1365:

      if (a3) {
        v654 = @"geoTypeMap";
      }
      else {
        v654 = @"geo_type_map";
      }
      v879 = [v882 objectForKeyedSubscript:v654];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v1020 = 0u;
        long long v1019 = 0u;
        long long v1018 = 0u;
        long long v1017 = 0u;
        id v902 = v879;
        id v918 = (id)[v902 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
        if (v918)
        {
          uint64_t v910 = *(void *)v1018;
          if (a3) {
            v655 = @"geoTypeId";
          }
          else {
            v655 = @"geo_type_id";
          }
          v895 = v655;
          do
          {
            v656 = 0;
            do
            {
              if (*(void *)v1018 != v910) {
                objc_enumerationMutation(v902);
              }
              v657 = *(void **)(*((void *)&v1017 + 1) + 8 * (void)v656);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v658 = [GEOPDSearchStringGeoTypesPair alloc];
                if (v658)
                {
                  id v946 = v657;
                  uint64_t v659 = [(GEOPDSearchStringGeoTypesPair *)v658 init];
                  if (v659)
                  {
                    v660 = [v946 objectForKeyedSubscript:@"key"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v661 = (void *)[v660 copy];
                      id v662 = v661;
                      *(unsigned char *)(v659 + 60) |= 2u;
                      *(unsigned char *)(v659 + 60) |= 4u;
                      objc_storeStrong((id *)(v659 + 40), v661);
                    }
                    v932 = [v946 objectForKeyedSubscript:v895];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1024 = 0u;
                      long long v1023 = 0u;
                      long long v1022 = 0u;
                      long long v1021 = 0u;
                      id v663 = v932;
                      uint64_t v664 = [v663 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
                      if (v664)
                      {
                        uint64_t v665 = *(void *)v1022;
                        do
                        {
                          for (uint64_t i6 = 0; i6 != v664; ++i6)
                          {
                            if (*(void *)v1022 != v665) {
                              objc_enumerationMutation(v663);
                            }
                            v667 = *(void **)(*((void *)&v1021 + 1) + 8 * i6);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              [v667 intValue];
                              os_unfair_lock_lock((os_unfair_lock_t)(v659 + 56));
                              if ((*(unsigned char *)(v659 + 60) & 1) == 0)
                              {
                                v668 = *(void **)(v659 + 8);
                                if (v668)
                                {
                                  id v669 = v668;
                                  objc_sync_enter(v669);
                                  GEOPDSearchStringGeoTypesPairReadSpecified(v659, *(void *)(v659 + 8), (int *)&_readGeoTypeIds_tags);
                                  objc_sync_exit(v669);
                                }
                              }
                              os_unfair_lock_unlock((os_unfair_lock_t)(v659 + 56));
                              PBRepeatedInt32Add();
                              os_unfair_lock_lock_with_options();
                              *(unsigned char *)(v659 + 60) |= 1u;
                              os_unfair_lock_unlock((os_unfair_lock_t)(v659 + 56));
                              *(unsigned char *)(v659 + 60) |= 4u;
                            }
                          }
                          uint64_t v664 = [v663 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
                        }
                        while (v664);
                      }
                    }
                  }
                }
                else
                {
                  uint64_t v659 = 0;
                }
                -[GEOPDSearchQueryGeoTagMetadata addGeoTypeMap:]((uint64_t)obji, (void *)v659);
              }
              v656 = (char *)v656 + 1;
            }
            while (v656 != v918);
            uint64_t v670 = [v902 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
            id v918 = (id)v670;
          }
          while (v670);
        }
      }
      if (a3) {
        v671 = @"geoRewriteTypes";
      }
      else {
        v671 = @"geo_rewrite_types";
      }
      v947 = [v882 objectForKeyedSubscript:v671];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v1024 = 0u;
        long long v1023 = 0u;
        long long v1022 = 0u;
        long long v1021 = 0u;
        id v672 = v947;
        uint64_t v673 = [v672 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
        if (!v673) {
          goto LABEL_1430;
        }
        uint64_t v674 = *(void *)v1022;
        while (1)
        {
          for (uint64_t i7 = 0; i7 != v673; ++i7)
          {
            if (*(void *)v1022 != v674) {
              objc_enumerationMutation(v672);
            }
            v676 = *(void **)(*((void *)&v1021 + 1) + 8 * i7);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v677 = v676;
              if (([v677 isEqualToString:@"PREFIX_TO_FIRST_DIGIT"] & 1) == 0
                && ([v677 isEqualToString:@"MX_COLONIA_STRICT"] & 1) == 0
                && ([v677 isEqualToString:@"ON_IN"] & 1) == 0
                && ([v677 isEqualToString:@"IE_COUNTY_STRICT"] & 1) == 0
                && ([v677 isEqualToString:@"STATE_OF_STRICT"] & 1) == 0)
              {
                [v677 isEqualToString:@"TR_MAHALLESI"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v676 intValue];
            }
            v678 = (os_unfair_lock_s *)obji;
            os_unfair_lock_lock(&obji->_readerLock);
            if ((*(unsigned char *)&obji->_flags & 1) == 0)
            {
              v679 = obji->_reader;
              if (v679)
              {
                v680 = v679;
                objc_sync_enter(v680);
                GEOPDSearchQueryGeoTagMetadataReadSpecified((uint64_t)obji, (unint64_t)obji->_reader, (int *)&_readGeoRewriteTypes_tags);
                objc_sync_exit(v680);

                v678 = (os_unfair_lock_s *)obji;
              }
            }
            os_unfair_lock_unlock(v678 + 22);
            PBRepeatedInt32Add();
            os_unfair_lock_lock_with_options();
            *(unsigned char *)&obji->_flags |= 1u;
            os_unfair_lock_unlock(&obji->_readerLock);
            *(unsigned char *)&obji->_flags |= 0x10u;
          }
          uint64_t v673 = [v672 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
          if (!v673)
          {
LABEL_1430:

            break;
          }
        }
      }

      goto LABEL_1432;
    }
    v620 = [GEOPDSearchGeoParsingResult alloc];
    if (!v620)
    {
      uint64_t v622 = 0;
LABEL_1364:
      id v653 = (id)v622;
      *(unsigned char *)&obji->_flags |= 4u;
      *(unsigned char *)&obji->_flags |= 0x10u;
      objc_storeStrong((id *)&obji->_geoParsingResult, (id)v622);

      goto LABEL_1365;
    }
    id v621 = v619;
    uint64_t v622 = [(GEOPDSearchGeoParsingResult *)v620 init];
    if (!v622)
    {
LABEL_1363:

      goto LABEL_1364;
    }
    v623 = [v621 objectForKeyedSubscript:@"labeling"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1024 = 0u;
      long long v1023 = 0u;
      long long v1022 = 0u;
      long long v1021 = 0u;
      id v624 = v623;
      uint64_t v625 = [v624 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
      if (v625)
      {
        uint64_t v626 = *(void *)v1022;
        do
        {
          uint64_t v627 = 0;
          do
          {
            if (*(void *)v1022 != v626) {
              objc_enumerationMutation(v624);
            }
            v628 = *(void **)(*((void *)&v1021 + 1) + 8 * v627);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v629 = [GEOPDSearchAddressLabeledToken alloc];
              if (v629) {
                v630 = (void *)-[GEOPDSearchAddressLabeledToken _initWithDictionary:isJSON:](v629, v628, a3);
              }
              else {
                v630 = 0;
              }
              -[GEOPDSearchGeoParsingResult addLabeling:](v622, v630);
            }
            ++v627;
          }
          while (v625 != v627);
          uint64_t v631 = [v624 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
          uint64_t v625 = v631;
        }
        while (v631);
      }
    }
    if (a3) {
      v632 = @"labelScore";
    }
    else {
      v632 = @"label_score";
    }
    v633 = [v621 objectForKeyedSubscript:v632];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v633 doubleValue];
      *(unsigned char *)(v622 + 64) |= 0x20u;
      *(unsigned char *)(v622 + 64) |= 1u;
      *(void *)(v622 + 24) = v634;
    }

    if (a3) {
      v635 = @"tagSource";
    }
    else {
      v635 = @"tag_source";
    }
    v636 = [v621 objectForKeyedSubscript:v635];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v637 = v636;
      if ([v637 isEqualToString:@"CRF"])
      {
        int v638 = 1;
      }
      else if ([v637 isEqualToString:@"LSTM"])
      {
        int v638 = 2;
      }
      else if ([v637 isEqualToString:@"WFST"])
      {
        int v638 = 3;
      }
      else if ([v637 isEqualToString:@"TAG_HINTS"])
      {
        int v638 = 4;
      }
      else if ([v637 isEqualToString:@"JP_BUILDING"])
      {
        int v638 = 5;
      }
      else if ([v637 isEqualToString:@"INTERSECTION_RULE"])
      {
        int v638 = 6;
      }
      else if ([v637 isEqualToString:@"INTERSECTION_WITH_DOOR_NUMBER"])
      {
        int v638 = 7;
      }
      else if ([v637 isEqualToString:@"INTERSECTION_WITHOUT_CONNECTOR"])
      {
        int v638 = 8;
      }
      else if ([v637 isEqualToString:@"ALTER_SINGLE_DIRECTION"])
      {
        int v638 = 9;
      }
      else if ([v637 isEqualToString:@"ALTER_ABOVE_STREET_DIRECTION"])
      {
        int v638 = 10;
      }
      else if ([v637 isEqualToString:@"ALTER_ABOVE_STREET_ARTICLE"])
      {
        int v638 = 11;
      }
      else if ([v637 isEqualToString:@"ALTER_ABOVE_STREET_POSTAL_ONLY"])
      {
        int v638 = 12;
      }
      else if ([v637 isEqualToString:@"ALTER_ABOVE_STREET_IPHOTO_LOCALITY_ONLY"])
      {
        int v638 = 13;
      }
      else if ([v637 isEqualToString:@"ALTER_BELOW_STREET_ONLY"])
      {
        int v638 = 14;
      }
      else if ([v637 isEqualToString:@"ALTER_FRENCH_DOOR_NUMBER"])
      {
        int v638 = 15;
      }
      else if ([v637 isEqualToString:@"FORK_ALL_STREET_PARSE_BY_RULE"])
      {
        int v638 = 16;
      }
      else if ([v637 isEqualToString:@"WFST_AUGMENTATION"])
      {
        int v638 = 17;
      }
      else if ([v637 isEqualToString:@"DICTIONARY_AUGMENTATION"])
      {
        int v638 = 18;
      }
      else if ([v637 isEqualToString:@"STATIC_RULE_AUGMENTATION"])
      {
        int v638 = 19;
      }
      else if ([v637 isEqualToString:@"TOKENDROP_BELOW_STREET"])
      {
        int v638 = 20;
      }
      else if ([v637 isEqualToString:@"TOKENDROP_ABOVE_STREET"])
      {
        int v638 = 21;
      }
      else if ([v637 isEqualToString:@"OVERRIDE"])
      {
        int v638 = 22;
      }
      else if ([v637 isEqualToString:@"POSTAL_TOKENS_ONLY_FOR_IE"])
      {
        int v638 = 23;
      }
      else if ([v637 isEqualToString:@"TYPE_TOKEN"])
      {
        int v638 = 24;
      }
      else if ([v637 isEqualToString:@"REMOVE_SUB_PREMISE_FOR_CA"])
      {
        int v638 = 25;
      }
      else if ([v637 isEqualToString:@"AC_HINT"])
      {
        int v638 = 26;
      }
      else if ([v637 isEqualToString:@"POSTAL_AND_DOOR_NUMBER_ONLY"])
      {
        int v638 = 27;
      }
      else if ([v637 isEqualToString:@"BUILDING"])
      {
        int v638 = 28;
      }
      else
      {
        int v638 = 1;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1339:

        if (a3) {
          v639 = @"droppedTokens";
        }
        else {
          v639 = @"dropped_tokens";
        }
        v640 = [v621 objectForKeyedSubscript:v639];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1020 = 0u;
          long long v1019 = 0u;
          long long v1018 = 0u;
          long long v1017 = 0u;
          id v641 = v640;
          uint64_t v642 = [v641 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
          if (v642)
          {
            uint64_t v643 = *(void *)v1018;
            do
            {
              uint64_t v644 = 0;
              do
              {
                if (*(void *)v1018 != v643) {
                  objc_enumerationMutation(v641);
                }
                v645 = *(void **)(*((void *)&v1017 + 1) + 8 * v644);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v646 = [GEOPDSearchAddressLabeledToken alloc];
                  if (v646) {
                    v647 = (void *)-[GEOPDSearchAddressLabeledToken _initWithDictionary:isJSON:](v646, v645, a3);
                  }
                  else {
                    v647 = 0;
                  }
                  -[GEOPDSearchGeoParsingResult addDroppedTokens:](v622, v647);
                }
                ++v644;
              }
              while (v642 != v644);
              uint64_t v648 = [v641 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
              uint64_t v642 = v648;
            }
            while (v648);
          }
        }
        if (a3) {
          v649 = @"taggerModelId";
        }
        else {
          v649 = @"tagger_model_id";
        }
        v650 = [v621 objectForKeyedSubscript:v649];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v651 = (void *)[v650 copy];
          id v652 = v651;
          *(unsigned char *)(v622 + 64) |= 0x10u;
          *(unsigned char *)(v622 + 64) |= 0x20u;
          objc_storeStrong((id *)(v622 + 40), v651);
        }
        goto LABEL_1363;
      }
      int v638 = [v636 intValue];
    }
    *(unsigned char *)(v622 + 64) |= 0x20u;
    *(unsigned char *)(v622 + 64) |= 2u;
    *(_DWORD *)(v622 + 60) = v638;
    goto LABEL_1339;
  }
  objuint64_t i = 0;
LABEL_1433:
  v681 = obji;
  *(void *)(v966 + 308) |= 0x400080000uLL;
  objc_storeStrong((id *)(v966 + 160), obji);

LABEL_1434:
  if (a3) {
    v682 = @"rawQueryTokenizerMetadata";
  }
  else {
    v682 = @"raw_query_tokenizer_metadata";
  }
  v683 = [v885 objectForKeyedSubscript:v682];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v684 = [GEOPDSearchQueryTokenizerMetadata alloc];
    if (v684) {
      v685 = (void *)-[GEOPDSearchQueryTokenizerMetadata _initWithDictionary:isJSON:](v684, v683, a3);
    }
    else {
      v685 = 0;
    }
    id v686 = v685;
    *(void *)(v966 + 308) |= 0x440000000uLL;
    objc_storeStrong((id *)(v966 + 256), v685);
  }
  if (a3) {
    v687 = @"queryTokenImportanceMetadata";
  }
  else {
    v687 = @"query_token_importance_metadata";
  }
  v688 = [v885 objectForKeyedSubscript:v687];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v689 = [GEOPDSearchQueryTokenImportanceMetadata alloc];
    if (v689) {
      v690 = (void *)-[GEOPDSearchQueryTokenImportanceMetadata _initWithDictionary:isJSON:](v689, v688, a3);
    }
    else {
      v690 = 0;
    }
    id v691 = v690;
    *(void *)(v966 + 308) |= 0x408000000uLL;
    objc_storeStrong((id *)(v966 + 232), v690);
  }
  if (a3) {
    v692 = @"geoTokenImportanceMetadata";
  }
  else {
    v692 = @"geo_token_importance_metadata";
  }
  v693 = [v885 objectForKeyedSubscript:v692];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v694 = [GEOPDSearchQueryTokenImportanceMetadata alloc];
    if (v694) {
      v695 = (void *)-[GEOPDSearchQueryTokenImportanceMetadata _initWithDictionary:isJSON:](v694, v693, a3);
    }
    else {
      v695 = 0;
    }
    id v696 = v695;
    *(void *)(v966 + 308) |= 0x400000100uLL;
    objc_storeStrong((id *)(v966 + 72), v695);
  }
  if (a3) {
    v697 = @"richBrandMetadata";
  }
  else {
    v697 = @"rich_brand_metadata";
  }
  v948 = [v885 objectForKeyedSubscript:v697];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v698 = [GEOPDSearchRichBrandMetadata alloc];
    if (v698)
    {
      id v933 = v948;
      uint64_t v699 = [(GEOPDSearchRichBrandMetadata *)v698 init];
      if (v699)
      {
        v700 = [v933 objectForKeyedSubscript:@"muid"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v701 = [v700 unsignedLongLongValue];
          *(unsigned char *)(v699 + 60) |= 0x10u;
          *(unsigned char *)(v699 + 60) |= 1u;
          *(void *)(v699 + 32) = v701;
        }

        if (a3) {
          v702 = @"brandRelationshipInfo";
        }
        else {
          v702 = @"brand_relationship_info";
        }
        v703 = [v933 objectForKeyedSubscript:v702];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1028 = 0u;
          long long v1027 = 0u;
          long long v1026 = 0u;
          long long v1025 = 0u;
          id v704 = v703;
          uint64_t v705 = [v704 countByEnumeratingWithState:&v1025 objects:v1033 count:16];
          if (v705)
          {
            uint64_t v706 = *(void *)v1026;
            do
            {
              uint64_t v707 = 0;
              do
              {
                if (*(void *)v1026 != v706) {
                  objc_enumerationMutation(v704);
                }
                v708 = *(void **)(*((void *)&v1025 + 1) + 8 * v707);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v709 = [GEOPDSearchChainInfo alloc];
                  if (v709) {
                    v710 = (void *)-[GEOPDSearchChainInfo _initWithDictionary:isJSON:](v709, v708, a3);
                  }
                  else {
                    v710 = 0;
                  }
                  -[GEOPDSearchRichBrandMetadata addBrandRelationshipInfo:](v699, v710);
                }
                ++v707;
              }
              while (v705 != v707);
              uint64_t v711 = [v704 countByEnumeratingWithState:&v1025 objects:v1033 count:16];
              uint64_t v705 = v711;
            }
            while (v711);
          }
        }
        if (a3) {
          v712 = @"brandDensity";
        }
        else {
          v712 = @"brand_density";
        }
        v713 = [v933 objectForKeyedSubscript:v712];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v714 = [GEOPDSearchBrandDensity alloc];
          if (v714) {
            v715 = (void *)-[GEOPDSearchBrandDensity _initWithDictionary:isJSON:](v714, v713);
          }
          else {
            v715 = 0;
          }
          id v716 = v715;
          *(unsigned char *)(v699 + 60) |= 2u;
          *(unsigned char *)(v699 + 60) |= 0x10u;
          objc_storeStrong((id *)(v699 + 16), v715);
        }
        if (a3) {
          v717 = @"preferredCategory";
        }
        else {
          v717 = @"preferred_category";
        }
        id v919 = [v933 objectForKeyedSubscript:v717];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1024 = 0u;
          long long v1023 = 0u;
          long long v1022 = 0u;
          long long v1021 = 0u;
          id v718 = v919;
          uint64_t v719 = [v718 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
          if (v719)
          {
            v720 = @"category_id";
            uint64_t v721 = *(void *)v1022;
            if (a3) {
              v720 = @"categoryId";
            }
            objuint64_t j = v720;
            do
            {
              uint64_t v722 = 0;
              do
              {
                if (*(void *)v1022 != v721) {
                  objc_enumerationMutation(v718);
                }
                v723 = *(void **)(*((void *)&v1021 + 1) + 8 * v722);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v724 = [GEOPDSearchPreferredCategory alloc];
                  if (v724)
                  {
                    id v725 = v723;
                    uint64_t v726 = [(GEOPDSearchPreferredCategory *)v724 init];
                    if (v726)
                    {
                      v727 = [v725 objectForKeyedSubscript:objj];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v728 = (void *)[v727 copy];
                        id v729 = v728;
                        objc_storeStrong((id *)(v726 + 8), v728);
                      }
                      v730 = [v725 objectForKeyedSubscript:@"score"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v730 floatValue];
                        *(unsigned char *)(v726 + 20) |= 1u;
                        *(_DWORD *)(v726 + 16) = v731;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v726 = 0;
                  }
                  -[GEOPDSearchRichBrandMetadata addPreferredCategory:](v699, (void *)v726);
                }
                ++v722;
              }
              while (v719 != v722);
              uint64_t v732 = [v718 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
              uint64_t v719 = v732;
            }
            while (v732);
          }
        }
      }
    }
    else
    {
      uint64_t v699 = 0;
    }
    id v733 = (id)v699;
    *(void *)(v966 + 308) |= 0x500000000uLL;
    objc_storeStrong((id *)(v966 + 272), (id)v699);
  }
  if (a3) {
    v734 = @"queryEmbeddingMetadata";
  }
  else {
    v734 = @"query_embedding_metadata";
  }
  v883 = [v885 objectForKeyedSubscript:v734];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v971 = 0u;
    long long v972 = 0u;
    long long v969 = 0u;
    long long v970 = 0u;
    id v903 = v883;
    v920 = (char *)[v903 countByEnumeratingWithState:&v969 objects:v1009 count:16];
    if (v920)
    {
      uint64_t v911 = *(void *)v970;
      if (a3) {
        v735 = @"embeddingId";
      }
      else {
        v735 = @"embedding_id";
      }
      v736 = @"model_version";
      if (a3) {
        v736 = @"modelVersion";
      }
      v889 = v736;
      v896 = v735;
      do
      {
        v737 = 0;
        do
        {
          if (*(void *)v970 != v911)
          {
            v738 = v737;
            objc_enumerationMutation(v903);
            v737 = v738;
          }
          objuint64_t k = v737;
          v739 = *(void **)(*((void *)&v969 + 1) + 8 * (void)v737);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v740 = [GEOPDSearchQueryEmbeddingMetadata alloc];
            if (v740)
            {
              id v949 = v739;
              uint64_t v741 = [(GEOPDSearchQueryEmbeddingMetadata *)v740 init];
              if (v741)
              {
                v742 = [v949 objectForKeyedSubscript:v896];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v743 = (void *)[v742 copy];
                  id v744 = v743;
                  *(unsigned char *)(v741 + 68) |= 2u;
                  *(unsigned char *)(v741 + 68) |= 8u;
                  objc_storeStrong((id *)(v741 + 40), v743);
                }
                v934 = [v949 objectForKeyedSubscript:@"embedding"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v1028 = 0u;
                  long long v1027 = 0u;
                  long long v1026 = 0u;
                  long long v1025 = 0u;
                  id v745 = v934;
                  uint64_t v746 = [v745 countByEnumeratingWithState:&v1025 objects:v1033 count:16];
                  if (v746)
                  {
                    uint64_t v747 = *(void *)v1026;
                    do
                    {
                      for (uint64_t i8 = 0; i8 != v746; ++i8)
                      {
                        if (*(void *)v1026 != v747) {
                          objc_enumerationMutation(v745);
                        }
                        v749 = *(void **)(*((void *)&v1025 + 1) + 8 * i8);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v749 floatValue];
                          os_unfair_lock_lock((os_unfair_lock_t)(v741 + 64));
                          if ((*(unsigned char *)(v741 + 68) & 1) == 0)
                          {
                            v750 = *(void **)(v741 + 8);
                            if (v750)
                            {
                              id v751 = v750;
                              objc_sync_enter(v751);
                              GEOPDSearchQueryEmbeddingMetadataReadSpecified(v741, *(void *)(v741 + 8), (int *)&_readEmbeddings_tags);
                              objc_sync_exit(v751);
                            }
                          }
                          os_unfair_lock_unlock((os_unfair_lock_t)(v741 + 64));
                          PBRepeatedFloatAdd();
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v741 + 68) |= 1u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v741 + 64));
                          *(unsigned char *)(v741 + 68) |= 8u;
                        }
                      }
                      uint64_t v746 = [v745 countByEnumeratingWithState:&v1025 objects:v1033 count:16];
                    }
                    while (v746);
                  }
                }
                v752 = [v949 objectForKeyedSubscript:v889];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v1024 = 0u;
                  long long v1023 = 0u;
                  long long v1022 = 0u;
                  long long v1021 = 0u;
                  id v753 = v752;
                  uint64_t v754 = [v753 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
                  if (v754)
                  {
                    uint64_t v755 = *(void *)v1022;
                    do
                    {
                      uint64_t v756 = 0;
                      do
                      {
                        if (*(void *)v1022 != v755) {
                          objc_enumerationMutation(v753);
                        }
                        v757 = *(void **)(*((void *)&v1021 + 1) + 8 * v756);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v758 = [GEOPDSearchStringStringPair alloc];
                          if (v758) {
                            v759 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v758, v757);
                          }
                          else {
                            v759 = 0;
                          }
                          -[GEOPDSearchQueryEmbeddingMetadata addModelVersion:](v741, v759);
                        }
                        ++v756;
                      }
                      while (v754 != v756);
                      uint64_t v760 = [v753 countByEnumeratingWithState:&v1021 objects:&v1029 count:16];
                      uint64_t v754 = v760;
                    }
                    while (v760);
                  }
                }
              }
            }
            else
            {
              uint64_t v741 = 0;
            }
            -[GEOPDSearchQueryIntentMetadata addQueryEmbeddingMetadata:](v966, (void *)v741);
          }
          v737 = objk + 1;
        }
        while (objk + 1 != v920);
        uint64_t v761 = [v903 countByEnumeratingWithState:&v969 objects:v1009 count:16];
        v920 = (char *)v761;
      }
      while (v761);
    }
  }
  if (a3) {
    v762 = @"tokenSynonymMetadata";
  }
  else {
    v762 = @"token_synonym_metadata";
  }
  v880 = [v885 objectForKeyedSubscript:v762];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_1656;
  }
  v763 = [GEOPDSearchTokenSynonymMetadata alloc];
  if (!v763)
  {
    v912 = 0;
    goto LABEL_1655;
  }
  id v877 = v880;
  v912 = [(GEOPDSearchTokenSynonymMetadata *)v763 init];
  if (!v912) {
    goto LABEL_1654;
  }
  v875 = [v877 objectForKeyedSubscript:@"synonymList"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_1653;
  }
  long long v1016 = 0u;
  long long v1015 = 0u;
  long long v1014 = 0u;
  long long v1013 = 0u;
  id v921 = v875;
  uint64_t v950 = [v921 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
  if (!v950) {
    goto LABEL_1652;
  }
  uint64_t v935 = *(void *)v1014;
  if (a3) {
    v764 = @"synFeatureMap";
  }
  else {
    v764 = @"syn_feature_map";
  }
  v765 = @"rewrite_provider";
  if (a3) {
    v765 = @"rewriteProvider";
  }
  v897 = v765;
  v904 = v764;
  v766 = @"token_list";
  if (a3) {
    v766 = @"tokenList";
  }
  v890 = v766;
  v767 = @"synonym_text";
  if (a3) {
    v767 = @"synonymText";
  }
  v884 = v767;
  do
  {
    uint64_t v768 = 0;
    do
    {
      if (*(void *)v1014 != v935) {
        objc_enumerationMutation(v921);
      }
      v769 = *(void **)(*((void *)&v1013 + 1) + 8 * v768);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v770 = [GEOPDSearchSynonym alloc];
        if (v770)
        {
          id objl = v769;
          uint64_t v771 = [(GEOPDSearchSynonym *)v770 init];
          if (v771)
          {
            v772 = [objl objectForKeyedSubscript:@"confidence"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v772 floatValue];
              *(unsigned char *)(v771 + 60) |= 0x20u;
              *(unsigned char *)(v771 + 60) |= 1u;
              *(_DWORD *)(v771 + 52) = v773;
            }

            v774 = [objl objectForKeyedSubscript:v904];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v1024 = 0u;
              long long v1023 = 0u;
              long long v1022 = 0u;
              long long v1021 = 0u;
              id v775 = v774;
              uint64_t v776 = [v775 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
              if (v776)
              {
                uint64_t v777 = *(void *)v1022;
                do
                {
                  uint64_t v778 = 0;
                  do
                  {
                    if (*(void *)v1022 != v777) {
                      objc_enumerationMutation(v775);
                    }
                    v779 = *(void **)(*((void *)&v1021 + 1) + 8 * v778);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v780 = [GEOPDSearchPair alloc];
                      if (v780) {
                        v781 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v780, v779);
                      }
                      else {
                        v781 = 0;
                      }
                      -[GEOPDSearchSynonym addSynFeatureMap:](v771, v781);
                    }
                    ++v778;
                  }
                  while (v776 != v778);
                  uint64_t v782 = [v775 countByEnumeratingWithState:&v1021 objects:v1033 count:16];
                  uint64_t v776 = v782;
                }
                while (v782);
              }
            }
            v783 = [objl objectForKeyedSubscript:v897];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v784 = v783;
              if ([v784 isEqualToString:@"NONE_TYPE"])
              {
                int v785 = 0;
              }
              else if ([v784 isEqualToString:@"FWDGEO"])
              {
                int v785 = 1;
              }
              else if ([v784 isEqualToString:@"LOCALSEARCH"])
              {
                int v785 = 2;
              }
              else if ([v784 isEqualToString:@"POIGEOMIXED"])
              {
                int v785 = 3;
              }
              else
              {
                int v785 = 0;
              }

LABEL_1627:
              *(unsigned char *)(v771 + 60) |= 0x20u;
              *(unsigned char *)(v771 + 60) |= 2u;
              *(_DWORD *)(v771 + 56) = v785;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v785 = [v783 intValue];
                goto LABEL_1627;
              }
            }

            v786 = [objl objectForKeyedSubscript:v890];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v1020 = 0u;
              long long v1019 = 0u;
              long long v1018 = 0u;
              long long v1017 = 0u;
              id v787 = v786;
              uint64_t v788 = [v787 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
              if (v788)
              {
                uint64_t v789 = *(void *)v1018;
                do
                {
                  uint64_t v790 = 0;
                  do
                  {
                    if (*(void *)v1018 != v789) {
                      objc_enumerationMutation(v787);
                    }
                    v791 = *(void **)(*((void *)&v1017 + 1) + 8 * v790);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v792 = [GEOPDSearchStringStringPair alloc];
                      if (v792) {
                        v793 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v792, v791);
                      }
                      else {
                        v793 = 0;
                      }
                      -[GEOPDSearchSynonym addTokenList:](v771, v793);
                    }
                    ++v790;
                  }
                  while (v788 != v790);
                  uint64_t v794 = [v787 countByEnumeratingWithState:&v1017 objects:&v1029 count:16];
                  uint64_t v788 = v794;
                }
                while (v794);
              }
            }
            v795 = [objl objectForKeyedSubscript:v884];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v796 = (void *)[v795 copy];
              id v797 = v796;
              *(unsigned char *)(v771 + 60) |= 8u;
              *(unsigned char *)(v771 + 60) |= 0x20u;
              objc_storeStrong((id *)(v771 + 24), v796);
            }
          }
        }
        else
        {
          uint64_t v771 = 0;
        }
        -[GEOPDSearchTokenSynonymMetadata addSynonymList:]((uint64_t)v912, (void *)v771);
      }
      ++v768;
    }
    while (v768 != v950);
    uint64_t v798 = [v921 countByEnumeratingWithState:&v1013 objects:&v1025 count:16];
    uint64_t v950 = v798;
  }
  while (v798);
LABEL_1652:

LABEL_1653:
LABEL_1654:

LABEL_1655:
  v799 = v912;
  *(void *)(v966 + 308) |= 0x600000000uLL;
  objc_storeStrong((id *)(v966 + 280), v912);

LABEL_1656:
  if (a3) {
    v800 = @"queryNeuralRewriteMetadata";
  }
  else {
    v800 = @"query_neural_rewrite_metadata";
  }
  v801 = [v885 objectForKeyedSubscript:v800];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v802 = [GEOPDSearchQueryNeuralRewriteMetadata alloc];
    if (v802)
    {
      id v803 = v801;
      uint64_t v804 = [(GEOPDSearchQueryNeuralRewriteMetadata *)v802 init];
      if (v804)
      {
        if (a3) {
          v805 = @"modelId";
        }
        else {
          v805 = @"model_id";
        }
        v806 = [v803 objectForKeyedSubscript:v805];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v807 = (void *)[v806 copy];
          id v808 = v807;
          *(unsigned char *)(v804 + 56) |= 4u;
          *(unsigned char *)(v804 + 56) |= 0x10u;
          objc_storeStrong((id *)(v804 + 24), v807);
        }
        if (a3) {
          v809 = @"modelScore";
        }
        else {
          v809 = @"model_score";
        }
        v810 = [v803 objectForKeyedSubscript:v809];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v810 floatValue];
          *(unsigned char *)(v804 + 56) |= 0x10u;
          *(unsigned char *)(v804 + 56) |= 1u;
          *(_DWORD *)(v804 + 52) = v811;
        }

        if (a3) {
          v812 = @"inputQuery";
        }
        else {
          v812 = @"input_query";
        }
        v813 = [v803 objectForKeyedSubscript:v812];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v814 = (void *)[v813 copy];
          id v815 = v814;
          *(unsigned char *)(v804 + 56) |= 2u;
          *(unsigned char *)(v804 + 56) |= 0x10u;
          objc_storeStrong((id *)(v804 + 16), v814);
        }
        v816 = [v803 objectForKeyedSubscript:v859];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v817 = (void *)[v816 copy];
          id v818 = v817;
          *(unsigned char *)(v804 + 56) |= 8u;
          *(unsigned char *)(v804 + 56) |= 0x10u;
          objc_storeStrong((id *)(v804 + 32), v817);
        }
      }
    }
    else
    {
      uint64_t v804 = 0;
    }
    id v819 = (id)v804;
    *(void *)(v966 + 308) |= 0x400200000uLL;
    objc_storeStrong((id *)(v966 + 184), (id)v804);
  }
  if (a3) {
    v820 = @"queryCtrMetadata";
  }
  else {
    v820 = @"query_ctr_metadata";
  }
  id v905 = [v885 objectForKeyedSubscript:v820];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_1749;
  }
  v821 = [GEOPDSearchQueryCtrMetadata alloc];
  if (!v821)
  {
    objuint64_t m = 0;
    goto LABEL_1748;
  }
  id v898 = v905;
  objuint64_t m = [(GEOPDSearchQueryCtrMetadata *)v821 init];
  if (!objm) {
    goto LABEL_1747;
  }
  v891 = [v898 objectForKeyedSubscript:@"queryCtrKeyValuePair"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_1746;
  }
  long long v1032 = 0u;
  long long v1031 = 0u;
  long long v1030 = 0u;
  long long v1029 = 0u;
  id v822 = v891;
  uint64_t v823 = [v822 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
  if (!v823) {
    goto LABEL_1745;
  }
  v824 = @"num_taps";
  uint64_t v825 = *(void *)v1030;
  BOOL v826 = a3 == 0;
  if (a3) {
    v824 = @"numTaps";
  }
  v968 = v824;
  if (v826) {
    v827 = @"num_impressions";
  }
  else {
    v827 = @"numImpressions";
  }
  v828 = @"num_query_taps";
  if (!v826) {
    v828 = @"numQueryTaps";
  }
  v936 = v828;
  v951 = v827;
  if (v826) {
    v829 = @"forward_sctr";
  }
  else {
    v829 = @"forwardSctr";
  }
  v830 = @"backwardSctr";
  if (v826) {
    v830 = @"backward_sctr";
  }
  v913 = v830;
  v922 = v829;
  while (2)
  {
    uint64_t v831 = 0;
    while (2)
    {
      if (*(void *)v1030 != v825) {
        objc_enumerationMutation(v822);
      }
      v832 = *(void **)(*((void *)&v1029 + 1) + 8 * v831);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v833 = [GEOPDSearchCTRStoreKeyValuePair alloc];
        if (v833)
        {
          id v834 = v832;
          uint64_t v835 = [(GEOPDSearchCTRStoreKeyValuePair *)v833 init];
          if (v835)
          {
            v836 = [v834 objectForKeyedSubscript:v968];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v837 = [v836 intValue];
              *(unsigned char *)(v835 + 68) |= 0x80u;
              *(unsigned char *)(v835 + 68) |= 0x10u;
              *(_DWORD *)(v835 + 60) = v837;
            }

            v838 = [v834 objectForKeyedSubscript:v951];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v839 = [v838 intValue];
              *(unsigned char *)(v835 + 68) |= 0x80u;
              *(unsigned char *)(v835 + 68) |= 4u;
              *(_DWORD *)(v835 + 52) = v839;
            }

            v840 = [v834 objectForKeyedSubscript:v936];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v841 = [v840 intValue];
              *(unsigned char *)(v835 + 68) |= 0x80u;
              *(unsigned char *)(v835 + 68) |= 8u;
              *(_DWORD *)(v835 + 56) = v841;
            }

            v842 = [v834 objectForKeyedSubscript:v922];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v843 = [v842 intValue];
              *(unsigned char *)(v835 + 68) |= 0x80u;
              *(unsigned char *)(v835 + 68) |= 2u;
              *(_DWORD *)(v835 + 48) = v843;
            }

            v844 = [v834 objectForKeyedSubscript:v913];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v845 = [v844 intValue];
              *(unsigned char *)(v835 + 68) |= 0x80u;
              *(unsigned char *)(v835 + 68) |= 1u;
              *(_DWORD *)(v835 + 44) = v845;
            }

            v846 = [v834 objectForKeyedSubscript:@"query"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v847 = (void *)[v846 copy];
              id v848 = v847;
              *(unsigned char *)(v835 + 68) |= 0x40u;
              *(unsigned char *)(v835 + 68) |= 0x80u;
              objc_storeStrong((id *)(v835 + 24), v847);
            }
            v849 = [v834 objectForKeyedSubscript:@"geoHash"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v850 = (void *)[v849 copy];
              id v851 = v850;
              *(unsigned char *)(v835 + 68) |= 0x20u;
              *(unsigned char *)(v835 + 68) |= 0x80u;
              objc_storeStrong((id *)(v835 + 16), v850);
            }
            v852 = [v834 objectForKeyedSubscript:@"type"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v853 = v852;
              if ([v853 isEqualToString:@"CTR_GEO"])
              {
                int v854 = 1;
              }
              else if ([v853 isEqualToString:@"CTR_POI"])
              {
                int v854 = 2;
              }
              else if ([v853 isEqualToString:@"CTR_QUERY_SUGGESTION"])
              {
                int v854 = 3;
              }
              else if ([v853 isEqualToString:@"CTR_IS_NOT_TAPPED"])
              {
                int v854 = 4;
              }
              else
              {
                int v854 = 1;
              }

LABEL_1737:
              *(unsigned char *)(v835 + 68) |= 0x80u;
              *(_DWORD *)(v835 + 64) = v854;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v854 = [v852 intValue];
                goto LABEL_1737;
              }
            }
          }
        }
        else
        {
          uint64_t v835 = 0;
        }
        -[GEOPDSearchQueryCtrMetadata addQueryCtrKeyValuePair:]((uint64_t)objm, (void *)v835);
      }
      if (v823 != ++v831) {
        continue;
      }
      break;
    }
    uint64_t v855 = [v822 countByEnumeratingWithState:&v1029 objects:v1033 count:16];
    uint64_t v823 = v855;
    if (v855) {
      continue;
    }
    break;
  }
LABEL_1745:

LABEL_1746:
LABEL_1747:

LABEL_1748:
  v856 = objm;
  *(void *)(v966 + 308) |= 0x400001000uLL;
  objc_storeStrong((id *)(v966 + 104), objm);

LABEL_1749:
LABEL_1750:

  return v966;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryIntentMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryIntentMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_85;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 0);
  if (self->_originalQuery) {
    PBDataWriterWriteStringField();
  }
  if (self->_rewrittenQuery) {
    PBDataWriterWriteStringField();
  }
  $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_10;
      }
LABEL_82:
      PBDataWriterWriteBOOLField();
      if ((*(void *)&self->_flags & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0) {
    goto LABEL_82;
  }
LABEL_10:
  if ((*(unsigned char *)&flags & 0x10) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
  if (self->_queryTagMetadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_queryClassificationMetadatas;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  if (self->_querySpellCorrectionMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_queryGeoMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_intentSources.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_intentSources.count);
  }
  if (self->_querySynonymMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryDymMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryCompletionMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryInterpretationMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryDirectionsIntentMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryNormalizerMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryGeoNormalizerMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryTokenizerMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryTransliterMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryFuzzyMatchV2Metadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rewrittenQueryTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_rewrittenQueryTypes.count);
  }
  if (self->_queryPoiMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_acHintMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryGeoTagMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rawQueryTokenizerMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryTokenImportanceMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_geoTokenImportanceMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_richBrandMetadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v13 = self->_queryEmbeddingMetadatas;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  if (self->_tokenSynonymMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryNeuralRewriteMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryCtrMetadata) {
    PBDataWriterWriteSubmessage();
  }
LABEL_85:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 4) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryIntentMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_27;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_originalQuery copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  uint64_t v11 = [(NSString *)self->_rewrittenQuery copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v11;

  $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_rewrittenQueryIndex;
    *(void *)(v5 + 308) |= 2uLL;
    $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_8;
      }
LABEL_30:
      *(unsigned char *)(v5 + 305) = self->_isFromKnowledgeGraph;
      *(void *)(v5 + 308) |= 8uLL;
      if ((*(void *)&self->_flags & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v5 + 168) = self->_queryIntentWeight;
  *(void *)(v5 + 308) |= 1uLL;
  $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0) {
    goto LABEL_30;
  }
LABEL_8:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_9:
    *(unsigned char *)(v5 + 306) = self->_isFromSearchQu;
    *(void *)(v5 + 308) |= 0x10uLL;
  }
LABEL_10:
  id v14 = [(GEOPDSearchQueryTagMetadata *)self->_queryTagMetadata copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v14;

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v16 = self->_queryClassificationMetadatas;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v75 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchQueryIntentMetadata addQueryClassificationMetadata:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v74 objects:v79 count:16];
    }
    while (v17);
  }

  id v21 = [(GEOPDSearchQuerySpellCorrectionMetadata *)self->_querySpellCorrectionMetadata copyWithZone:a3];
  long long v22 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v21;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 304) = self->_isFromDefinitiveQu;
    *(void *)(v5 + 308) |= 4uLL;
  }
  id v23 = [(GEOPDSearchQueryGeoMetadata *)self->_queryGeoMetadata copyWithZone:a3];
  long long v24 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v23;

  PBRepeatedInt32Copy();
  id v25 = [(GEOPDSearchQuerySynonymMetadata *)self->_querySynonymMetadata copyWithZone:a3];
  long long v26 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v25;

  id v27 = [(GEOPDSearchQueryDymMetadata *)self->_queryDymMetadata copyWithZone:a3];
  v28 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v27;

  id v29 = [(GEOPDSearchQueryCompletionMetadata *)self->_queryCompletionMetadata copyWithZone:a3];
  uint64_t v30 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v29;

  id v31 = [(GEOPDSearchQueryInterpretationMetadata *)self->_queryInterpretationMetadata copyWithZone:a3];
  int v32 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v31;

  id v33 = [(GEOPDSearchQueryDirectionsIntentMetadata *)self->_queryDirectionsIntentMetadata copyWithZone:a3];
  uint64_t v34 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v33;

  id v35 = [(GEOPDSearchQueryNormalizerMetadata *)self->_queryNormalizerMetadata copyWithZone:a3];
  v36 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v35;

  id v37 = [(GEOPDSearchQueryGeoNormalizerMetadata *)self->_queryGeoNormalizerMetadata copyWithZone:a3];
  id v38 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v37;

  id v39 = [(GEOPDSearchQueryTokenizerMetadata *)self->_queryTokenizerMetadata copyWithZone:a3];
  uint64_t v40 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v39;

  id v41 = [(GEOPDSearchQueryTransliteratorMetadata *)self->_queryTransliterMetadata copyWithZone:a3];
  id v42 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v41;

  id v43 = [(GEOPDSearchQueryFuzzyMatchV2Metadata *)self->_queryFuzzyMatchV2Metadata copyWithZone:a3];
  v44 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v43;

  PBRepeatedInt32Copy();
  id v45 = [(GEOPDSearchQueryPoiMetadata *)self->_queryPoiMetadata copyWithZone:a3];
  uint64_t v46 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v45;

  id v47 = [(GEOPDSearchACHintMetadata *)self->_acHintMetadata copyWithZone:a3];
  v48 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v47;

  id v49 = [(GEOPDSearchQueryGeoTagMetadata *)self->_queryGeoTagMetadata copyWithZone:a3];
  uint64_t v50 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v49;

  id v51 = [(GEOPDSearchQueryTokenizerMetadata *)self->_rawQueryTokenizerMetadata copyWithZone:a3];
  id v52 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v51;

  id v53 = [(GEOPDSearchQueryTokenImportanceMetadata *)self->_queryTokenImportanceMetadata copyWithZone:a3];
  unint64_t v54 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v53;

  id v55 = [(GEOPDSearchQueryTokenImportanceMetadata *)self->_geoTokenImportanceMetadata copyWithZone:a3];
  uint64_t v56 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v55;

  id v57 = [(GEOPDSearchRichBrandMetadata *)self->_richBrandMetadata copyWithZone:a3];
  v58 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v57;

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v59 = self->_queryEmbeddingMetadatas;
  uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v71 != v61) {
          objc_enumerationMutation(v59);
        }
        v63 = objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * j), "copyWithZone:", a3, (void)v70);
        -[GEOPDSearchQueryIntentMetadata addQueryEmbeddingMetadata:](v5, v63);
      }
      uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v60);
  }

  id v64 = [(GEOPDSearchTokenSynonymMetadata *)self->_tokenSynonymMetadata copyWithZone:a3];
  v65 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v64;

  id v66 = [(GEOPDSearchQueryNeuralRewriteMetadata *)self->_queryNeuralRewriteMetadata copyWithZone:a3];
  id v67 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v66;

  id v68 = [(GEOPDSearchQueryCtrMetadata *)self->_queryCtrMetadata copyWithZone:a3];
  id v8 = *(id *)(v5 + 104);
  *(void *)(v5 + 104) = v68;
LABEL_27:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_92;
  }
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)v4, 1);
  originalQuery = self->_originalQuery;
  if ((unint64_t)originalQuery | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](originalQuery, "isEqual:")) {
      goto LABEL_92;
    }
  }
  rewrittenQuery = self->_rewrittenQuery;
  if ((unint64_t)rewrittenQuery | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](rewrittenQuery, "isEqual:")) {
      goto LABEL_92;
    }
  }
  $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
  uint64_t v8 = *(void *)(v4 + 308);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_rewrittenQueryIndex != *((_DWORD *)v4 + 75)) {
      goto LABEL_92;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_92;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v8 & 1) == 0 || self->_queryIntentWeight != *((double *)v4 + 21)) {
      goto LABEL_92;
    }
  }
  else if (v8)
  {
    goto LABEL_92;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0) {
      goto LABEL_92;
    }
    if (self->_isFromKnowledgeGraph)
    {
      if (!v4[305]) {
        goto LABEL_92;
      }
    }
    else if (v4[305])
    {
      goto LABEL_92;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_92;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_92;
    }
    if (self->_isFromSearchQu)
    {
      if (!v4[306]) {
        goto LABEL_92;
      }
    }
    else if (v4[306])
    {
      goto LABEL_92;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_92;
  }
  queryTagMetadata = self->_queryTagMetadata;
  if ((unint64_t)queryTagMetadata | *((void *)v4 + 28)
    && !-[GEOPDSearchQueryTagMetadata isEqual:](queryTagMetadata, "isEqual:"))
  {
    goto LABEL_92;
  }
  queryClassificationMetadatas = self->_queryClassificationMetadatas;
  if ((unint64_t)queryClassificationMetadatas | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](queryClassificationMetadatas, "isEqual:")) {
      goto LABEL_92;
    }
  }
  querySpellCorrectionMetadata = self->_querySpellCorrectionMetadata;
  if ((unint64_t)querySpellCorrectionMetadata | *((void *)v4 + 26))
  {
    if (!-[GEOPDSearchQuerySpellCorrectionMetadata isEqual:](querySpellCorrectionMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  uint64_t v12 = *(void *)(v4 + 308);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v12 & 4) != 0)
    {
      if (self->_isFromDefinitiveQu)
      {
        if (!v4[304]) {
          goto LABEL_92;
        }
        goto LABEL_46;
      }
      if (!v4[304]) {
        goto LABEL_46;
      }
    }
LABEL_92:
    char v35 = 0;
    goto LABEL_93;
  }
  if ((v12 & 4) != 0) {
    goto LABEL_92;
  }
LABEL_46:
  queryGeoMetadata = self->_queryGeoMetadata;
  if ((unint64_t)queryGeoMetadata | *((void *)v4 + 18)
    && !-[GEOPDSearchQueryGeoMetadata isEqual:](queryGeoMetadata, "isEqual:"))
  {
    goto LABEL_92;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_92;
  }
  querySynonymMetadata = self->_querySynonymMetadata;
  if ((unint64_t)querySynonymMetadata | *((void *)v4 + 27))
  {
    if (!-[GEOPDSearchQuerySynonymMetadata isEqual:](querySynonymMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryDymMetadata = self->_queryDymMetadata;
  if ((unint64_t)queryDymMetadata | *((void *)v4 + 15))
  {
    if (!-[GEOPDSearchQueryDymMetadata isEqual:](queryDymMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryCompletionMetadata = self->_queryCompletionMetadata;
  if ((unint64_t)queryCompletionMetadata | *((void *)v4 + 12))
  {
    if (!-[GEOPDSearchQueryCompletionMetadata isEqual:](queryCompletionMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryInterpretationMetadata = self->_queryInterpretationMetadata;
  if ((unint64_t)queryInterpretationMetadata | *((void *)v4 + 22))
  {
    if (!-[GEOPDSearchQueryInterpretationMetadata isEqual:](queryInterpretationMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryDirectionsIntentMetadata = self->_queryDirectionsIntentMetadata;
  if ((unint64_t)queryDirectionsIntentMetadata | *((void *)v4 + 14))
  {
    if (!-[GEOPDSearchQueryDirectionsIntentMetadata isEqual:](queryDirectionsIntentMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryNormalizerMetadata = self->_queryNormalizerMetadata;
  if ((unint64_t)queryNormalizerMetadata | *((void *)v4 + 24))
  {
    if (!-[GEOPDSearchQueryNormalizerMetadata isEqual:](queryNormalizerMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryGeoNormalizerMetadata = self->_queryGeoNormalizerMetadata;
  if ((unint64_t)queryGeoNormalizerMetadata | *((void *)v4 + 19))
  {
    if (!-[GEOPDSearchQueryGeoNormalizerMetadata isEqual:](queryGeoNormalizerMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryTokenizerMetadata = self->_queryTokenizerMetadata;
  if ((unint64_t)queryTokenizerMetadata | *((void *)v4 + 30))
  {
    if (!-[GEOPDSearchQueryTokenizerMetadata isEqual:](queryTokenizerMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryTransliterMetadata = self->_queryTransliterMetadata;
  if ((unint64_t)queryTransliterMetadata | *((void *)v4 + 31))
  {
    if (!-[GEOPDSearchQueryTransliteratorMetadata isEqual:](queryTransliterMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryFuzzyMatchV2Metadata = self->_queryFuzzyMatchV2Metadata;
  if ((unint64_t)queryFuzzyMatchV2Metadata | *((void *)v4 + 17))
  {
    if (!-[GEOPDSearchQueryFuzzyMatchV2Metadata isEqual:](queryFuzzyMatchV2Metadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_92;
  }
  queryPoiMetadata = self->_queryPoiMetadata;
  if ((unint64_t)queryPoiMetadata | *((void *)v4 + 25))
  {
    if (!-[GEOPDSearchQueryPoiMetadata isEqual:](queryPoiMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  acHintMetadata = self->_acHintMetadata;
  if ((unint64_t)acHintMetadata | *((void *)v4 + 8))
  {
    if (!-[GEOPDSearchACHintMetadata isEqual:](acHintMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryGeoTagMetadata = self->_queryGeoTagMetadata;
  if ((unint64_t)queryGeoTagMetadata | *((void *)v4 + 20))
  {
    if (!-[GEOPDSearchQueryGeoTagMetadata isEqual:](queryGeoTagMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  rawQueryTokenizerMetadata = self->_rawQueryTokenizerMetadata;
  if ((unint64_t)rawQueryTokenizerMetadata | *((void *)v4 + 32))
  {
    if (!-[GEOPDSearchQueryTokenizerMetadata isEqual:](rawQueryTokenizerMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryTokenImportanceMetadata = self->_queryTokenImportanceMetadata;
  if ((unint64_t)queryTokenImportanceMetadata | *((void *)v4 + 29))
  {
    if (!-[GEOPDSearchQueryTokenImportanceMetadata isEqual:](queryTokenImportanceMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  geoTokenImportanceMetadata = self->_geoTokenImportanceMetadata;
  if ((unint64_t)geoTokenImportanceMetadata | *((void *)v4 + 9))
  {
    if (!-[GEOPDSearchQueryTokenImportanceMetadata isEqual:](geoTokenImportanceMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  richBrandMetadata = self->_richBrandMetadata;
  if ((unint64_t)richBrandMetadata | *((void *)v4 + 34))
  {
    if (!-[GEOPDSearchRichBrandMetadata isEqual:](richBrandMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryEmbeddingMetadatas = self->_queryEmbeddingMetadatas;
  if ((unint64_t)queryEmbeddingMetadatas | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](queryEmbeddingMetadatas, "isEqual:")) {
      goto LABEL_92;
    }
  }
  tokenSynonymMetadata = self->_tokenSynonymMetadata;
  if ((unint64_t)tokenSynonymMetadata | *((void *)v4 + 35))
  {
    if (!-[GEOPDSearchTokenSynonymMetadata isEqual:](tokenSynonymMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryNeuralRewriteMetadata = self->_queryNeuralRewriteMetadata;
  if ((unint64_t)queryNeuralRewriteMetadata | *((void *)v4 + 23))
  {
    if (!-[GEOPDSearchQueryNeuralRewriteMetadata isEqual:](queryNeuralRewriteMetadata, "isEqual:")) {
      goto LABEL_92;
    }
  }
  queryCtrMetadata = self->_queryCtrMetadata;
  if ((unint64_t)queryCtrMetadata | *((void *)v4 + 13)) {
    char v35 = -[GEOPDSearchQueryCtrMetadata isEqual:](queryCtrMetadata, "isEqual:");
  }
  else {
    char v35 = 1;
  }
LABEL_93:

  return v35;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v45 = [(NSString *)self->_originalQuery hash];
  NSUInteger v43 = [(NSString *)self->_rewrittenQuery hash];
  $BAF710AE58301BBFFC7E171ED67E2070 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&flags) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v11 = 0;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  uint64_t v4 = 2654435761 * self->_rewrittenQueryIndex;
  if ((*(unsigned char *)&flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  double queryIntentWeight = self->_queryIntentWeight;
  double v6 = -queryIntentWeight;
  if (queryIntentWeight >= 0.0) {
    double v6 = self->_queryIntentWeight;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  double v9 = fmod(v7, 1.84467441e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      unint64_t v11 = v10 + (unint64_t)v8;
    }
    else {
      unint64_t v11 = 2654435761u * (unint64_t)v9;
    }
    if ((*(unsigned char *)&flags & 8) != 0)
    {
LABEL_16:
      uint64_t v12 = 2654435761 * self->_isFromKnowledgeGraph;
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_17;
      }
LABEL_11:
      uint64_t v13 = 2654435761 * self->_isFromSearchQu;
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v11 = v10 - (unint64_t)fabs(v8);
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_16;
    }
  }
LABEL_10:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_17:
  uint64_t v13 = 0;
LABEL_18:
  unint64_t v14 = [(GEOPDSearchQueryTagMetadata *)self->_queryTagMetadata hash];
  uint64_t v15 = [(NSMutableArray *)self->_queryClassificationMetadatas hash];
  unint64_t v16 = [(GEOPDSearchQuerySpellCorrectionMetadata *)self->_querySpellCorrectionMetadata hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v17 = 2654435761 * self->_isFromDefinitiveQu;
  }
  else {
    uint64_t v17 = 0;
  }
  NSUInteger v18 = v44 ^ v45 ^ v4 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  unint64_t v19 = [(GEOPDSearchQueryGeoMetadata *)self->_queryGeoMetadata hash];
  uint64_t v20 = v19 ^ PBRepeatedInt32Hash();
  unint64_t v21 = v20 ^ [(GEOPDSearchQuerySynonymMetadata *)self->_querySynonymMetadata hash];
  unint64_t v22 = v18 ^ v21 ^ [(GEOPDSearchQueryDymMetadata *)self->_queryDymMetadata hash];
  unint64_t v23 = [(GEOPDSearchQueryCompletionMetadata *)self->_queryCompletionMetadata hash];
  unint64_t v24 = v23 ^ [(GEOPDSearchQueryInterpretationMetadata *)self->_queryInterpretationMetadata hash];
  unint64_t v25 = v24 ^ [(GEOPDSearchQueryDirectionsIntentMetadata *)self->_queryDirectionsIntentMetadata hash];
  unint64_t v26 = v25 ^ [(GEOPDSearchQueryNormalizerMetadata *)self->_queryNormalizerMetadata hash];
  unint64_t v27 = v22 ^ v26 ^ [(GEOPDSearchQueryGeoNormalizerMetadata *)self->_queryGeoNormalizerMetadata hash];
  unint64_t v28 = [(GEOPDSearchQueryTokenizerMetadata *)self->_queryTokenizerMetadata hash];
  unint64_t v29 = v28 ^ [(GEOPDSearchQueryTransliteratorMetadata *)self->_queryTransliterMetadata hash];
  unint64_t v30 = v29 ^ [(GEOPDSearchQueryFuzzyMatchV2Metadata *)self->_queryFuzzyMatchV2Metadata hash];
  uint64_t v31 = v30 ^ PBRepeatedInt32Hash();
  unint64_t v32 = v31 ^ [(GEOPDSearchQueryPoiMetadata *)self->_queryPoiMetadata hash];
  unint64_t v33 = v27 ^ v32 ^ [(GEOPDSearchACHintMetadata *)self->_acHintMetadata hash];
  unint64_t v34 = [(GEOPDSearchQueryGeoTagMetadata *)self->_queryGeoTagMetadata hash];
  unint64_t v35 = v34 ^ [(GEOPDSearchQueryTokenizerMetadata *)self->_rawQueryTokenizerMetadata hash];
  unint64_t v36 = v35 ^ [(GEOPDSearchQueryTokenImportanceMetadata *)self->_queryTokenImportanceMetadata hash];
  unint64_t v37 = v36 ^ [(GEOPDSearchQueryTokenImportanceMetadata *)self->_geoTokenImportanceMetadata hash];
  unint64_t v38 = v37 ^ [(GEOPDSearchRichBrandMetadata *)self->_richBrandMetadata hash];
  uint64_t v39 = v38 ^ [(NSMutableArray *)self->_queryEmbeddingMetadatas hash];
  unint64_t v40 = v33 ^ v39 ^ [(GEOPDSearchTokenSynonymMetadata *)self->_tokenSynonymMetadata hash];
  unint64_t v41 = [(GEOPDSearchQueryNeuralRewriteMetadata *)self->_queryNeuralRewriteMetadata hash];
  return v40 ^ v41 ^ [(GEOPDSearchQueryCtrMetadata *)self->_queryCtrMetadata hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSynonymMetadata, 0);
  objc_storeStrong((id *)&self->_richBrandMetadata, 0);
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_rawQueryTokenizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryTransliterMetadata, 0);
  objc_storeStrong((id *)&self->_queryTokenizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryTokenImportanceMetadata, 0);
  objc_storeStrong((id *)&self->_queryTagMetadata, 0);
  objc_storeStrong((id *)&self->_querySynonymMetadata, 0);
  objc_storeStrong((id *)&self->_querySpellCorrectionMetadata, 0);
  objc_storeStrong((id *)&self->_queryPoiMetadata, 0);
  objc_storeStrong((id *)&self->_queryNormalizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryNeuralRewriteMetadata, 0);
  objc_storeStrong((id *)&self->_queryInterpretationMetadata, 0);
  objc_storeStrong((id *)&self->_queryGeoTagMetadata, 0);
  objc_storeStrong((id *)&self->_queryGeoNormalizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryGeoMetadata, 0);
  objc_storeStrong((id *)&self->_queryFuzzyMatchV2Metadata, 0);
  objc_storeStrong((id *)&self->_queryEmbeddingMetadatas, 0);
  objc_storeStrong((id *)&self->_queryDymMetadata, 0);
  objc_storeStrong((id *)&self->_queryDirectionsIntentMetadata, 0);
  objc_storeStrong((id *)&self->_queryCtrMetadata, 0);
  objc_storeStrong((id *)&self->_queryCompletionMetadata, 0);
  objc_storeStrong((id *)&self->_queryClassificationMetadatas, 0);
  objc_storeStrong((id *)&self->_originalQuery, 0);
  objc_storeStrong((id *)&self->_geoTokenImportanceMetadata, 0);
  objc_storeStrong((id *)&self->_acHintMetadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end