@interface GEOPDPlaceQuestionnaireResult
- (BOOL)collectPhotos;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceQuestionnaireResult)init;
- (GEOPDPlaceQuestionnaireResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)historicalMapsIds;
- (id)jsonRepresentation;
- (id)photoConstraints;
- (id)scorecardLayout;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsHistoricalMapsId:(uint64_t)a1;
- (void)_readHistoricalMapsIds;
- (void)_readMapsId;
- (void)_readPhotoConstraints;
- (void)_readScorecardLayout;
- (void)addHistoricalMapsId:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setMapsId:(uint64_t)a1;
- (void)setPhotoConstraints:(uint64_t)a1;
- (void)setScorecardLayout:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceQuestionnaireResult

- (GEOPDPlaceQuestionnaireResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceQuestionnaireResult;
  v2 = [(GEOPDPlaceQuestionnaireResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceQuestionnaireResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceQuestionnaireResult;
  v3 = [(GEOPDPlaceQuestionnaireResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readScorecardLayout
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScorecardLayout_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)scorecardLayout
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceQuestionnaireResult _readScorecardLayout]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setScorecardLayout:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 68) |= 0x100u;
  *(_WORD *)(a1 + 68) |= 0x200u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_131);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)setMapsId:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 68) |= 0x40u;
  *(_WORD *)(a1 + 68) |= 0x200u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readHistoricalMapsIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHistoricalMapsIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)historicalMapsIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceQuestionnaireResult _readHistoricalMapsIds]((uint64_t)a1);
    a1 = (id *)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addHistoricalMapsId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceQuestionnaireResult _readHistoricalMapsIds](a1);
    -[GEOPDPlaceQuestionnaireResult _addNoFlagsHistoricalMapsId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_WORD *)(a1 + 68) |= 0x200u;
  }
}

- (void)_addNoFlagsHistoricalMapsId:(uint64_t)a1
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

- (BOOL)collectPhotos
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 68);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    return (v2 & 4) == 0 || *(unsigned char *)(v1 + 65) != 0;
  }
  return result;
}

- (void)_readPhotoConstraints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoConstraints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)photoConstraints
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDPlaceQuestionnaireResult _readPhotoConstraints]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPhotoConstraints:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 68) |= 0x80u;
  *(_WORD *)(a1 + 68) |= 0x200u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceQuestionnaireResult;
  id v4 = [(GEOPDPlaceQuestionnaireResult *)&v8 description];
  id v5 = [(GEOPDPlaceQuestionnaireResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceQuestionnaireResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_73;
  }
  -[GEOPDPlaceQuestionnaireResult readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(_WORD *)(a1 + 68))
  {
    int v5 = *(_DWORD *)(a1 + 60);
    if (v5 <= 29)
    {
      objc_super v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          objc_super v6 = @"STATUS_FAILED";
          break;
        case 2:
          objc_super v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          objc_super v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          objc_super v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        objc_super v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        objc_super v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        objc_super v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        objc_super v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v6 forKey:@"status"];

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  id v7 = -[GEOPDPlaceQuestionnaireResult scorecardLayout]((id *)a1);
  objc_super v8 = v7;
  if (v7)
  {
    if (a2)
    {
      v9 = [v7 jsonRepresentation];
      v10 = @"scorecardLayout";
    }
    else
    {
      v9 = [v7 dictionaryRepresentation];
      v10 = @"scorecard_layout";
    }
    [v4 setObject:v9 forKey:v10];
  }
  -[GEOPDPlaceQuestionnaireResult _readMapsId](a1);
  id v11 = *(id *)(a1 + 24);
  v12 = v11;
  if (v11)
  {
    if (a2)
    {
      v13 = [v11 jsonRepresentation];
      v14 = @"mapsId";
    }
    else
    {
      v13 = [v11 dictionaryRepresentation];
      v14 = @"maps_id";
    }
    [v4 setObject:v13 forKey:v14];
  }
  if ((*(_WORD *)(a1 + 68) & 8) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 66)];
    if (a2) {
      v16 = @"isOverride";
    }
    else {
      v16 = @"is_override";
    }
    [v4 setObject:v15 forKey:v16];
  }
  if ([*(id *)(a1 + 16) count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = *(id *)(a1 + 16);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (a2) {
            [v23 jsonRepresentation];
          }
          else {
          v24 = [v23 dictionaryRepresentation];
          }
          [v17 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v20);
    }

    if (a2) {
      v25 = @"historicalMapsId";
    }
    else {
      v25 = @"historical_maps_id";
    }
    [v4 setObject:v17 forKey:v25];
  }
  __int16 v26 = *(_WORD *)(a1 + 68);
  if ((v26 & 0x10) == 0)
  {
    if ((v26 & 2) == 0) {
      goto LABEL_53;
    }
LABEL_65:
    v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
    if (a2) {
      v36 = @"alwaysPositionInitialRatingCtaTowardsTop";
    }
    else {
      v36 = @"always_position_initial_rating_cta_towards_top";
    }
    [v4 setObject:v35 forKey:v36];

    if ((*(_WORD *)(a1 + 68) & 4) == 0) {
      goto LABEL_58;
    }
    goto LABEL_54;
  }
  v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 67)];
  if (a2) {
    v34 = @"suppressOnExistingRichData";
  }
  else {
    v34 = @"suppress_on_existing_rich_data";
  }
  [v4 setObject:v33 forKey:v34];

  __int16 v26 = *(_WORD *)(a1 + 68);
  if ((v26 & 2) != 0) {
    goto LABEL_65;
  }
LABEL_53:
  if ((v26 & 4) != 0)
  {
LABEL_54:
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
    if (a2) {
      v28 = @"collectPhotos";
    }
    else {
      v28 = @"collect_photos";
    }
    [v4 setObject:v27 forKey:v28];
  }
LABEL_58:
  v29 = -[GEOPDPlaceQuestionnaireResult photoConstraints]((id *)a1);
  v30 = v29;
  if (v29)
  {
    if (a2)
    {
      v31 = [v29 jsonRepresentation];
      v32 = @"photoConstraints";
    }
    else
    {
      v31 = [v29 dictionaryRepresentation];
      v32 = @"photo_constraints";
    }
    [v4 setObject:v31 forKey:v32];
  }
LABEL_73:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceQuestionnaireResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_179_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_180_0;
      }
      GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPlaceQuestionnaireResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1 || (uint64_t v112 = [a1 init]) == 0)
  {
    uint64_t v112 = 0;
    goto LABEL_166;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"STATUS_SUCCESS"])
    {
      int v8 = 0;
    }
    else if ([v7 isEqualToString:@"STATUS_FAILED"])
    {
      int v8 = 1;
    }
    else if ([v7 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      int v8 = 2;
    }
    else if ([v7 isEqualToString:@"INVALID_REQUEST"])
    {
      int v8 = 5;
    }
    else if ([v7 isEqualToString:@"FAILED_NO_RESULT"])
    {
      int v8 = 20;
    }
    else if ([v7 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      int v8 = 30;
    }
    else if ([v7 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      int v8 = 40;
    }
    else if ([v7 isEqualToString:@"STATUS_DEDUPED"])
    {
      int v8 = 50;
    }
    else if ([v7 isEqualToString:@"VERSION_MISMATCH"])
    {
      int v8 = 60;
    }
    else
    {
      int v8 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v6 intValue];
LABEL_27:
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 1u;
    *(_DWORD *)(v112 + 60) = v8;
  }

  if (a3) {
    v9 = @"scorecardLayout";
  }
  else {
    v9 = @"scorecard_layout";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [GEOPDScorecardLayout alloc];
    if (v11)
    {
      v12 = v11;
      id v13 = v10;
      v14 = [(GEOPDScorecardLayout *)v12 init];
      if (v14)
      {
        v15 = [v13 objectForKeyedSubscript:@"version"];
        objc_opt_class();
        uint64_t v105 = (uint64_t)v14;
        if (objc_opt_isKindOfClass())
        {
          v16 = (void *)[v15 copy];
          -[GEOPDScorecardLayout setVersion:](v105, v16);

          v14 = (GEOPDScorecardLayout *)v105;
        }

        if (a3) {
          v17 = @"ratingCategory";
        }
        else {
          v17 = @"rating_category";
        }
        id v18 = [v13 objectForKeyedSubscript:v17];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v101 = v13;
          v102 = v10;
          id v103 = v5;
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          v100 = v18;
          obuint64_t j = v18;
          uint64_t v19 = [obj countByEnumeratingWithState:&v117 objects:&v126 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = @"localized_name";
            uint64_t v22 = *(void *)v118;
            if (a3) {
              uint64_t v21 = @"localizedName";
            }
            v107 = v21;
            uint64_t v108 = *(void *)v118;
            do
            {
              uint64_t v23 = 0;
              uint64_t v109 = v20;
              do
              {
                if (*(void *)v118 != v22) {
                  objc_enumerationMutation(obj);
                }
                v24 = *(void **)(*((void *)&v117 + 1) + 8 * v23);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v25 = [GEOPDRatingCategory alloc];
                  if (v25)
                  {
                    __int16 v26 = v25;
                    id v27 = v24;
                    uint64_t v28 = [(GEOPDRatingCategory *)v26 init];
                    if (v28)
                    {
                      v111 = v27;
                      v29 = [v27 objectForKeyedSubscript:@"key"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v30 = (void *)[v29 copy];
                        id v31 = v30;
                        *(unsigned char *)(v28 + 44) |= 1u;
                        *(unsigned char *)(v28 + 44) |= 4u;
                        objc_storeStrong((id *)(v28 + 16), v30);

                        uint64_t v22 = v108;
                      }

                      id v27 = v111;
                      v32 = [v111 objectForKeyedSubscript:v107];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v123 = 0u;
                        long long v124 = 0u;
                        long long v121 = 0u;
                        long long v122 = 0u;
                        v106 = v32;
                        id v33 = v32;
                        uint64_t v34 = [v33 countByEnumeratingWithState:&v121 objects:v130 count:16];
                        if (v34)
                        {
                          uint64_t v35 = v34;
                          uint64_t v36 = *(void *)v122;
                          do
                          {
                            for (uint64_t i = 0; i != v35; ++i)
                            {
                              if (*(void *)v122 != v36) {
                                objc_enumerationMutation(v33);
                              }
                              uint64_t v38 = *(void *)(*((void *)&v121 + 1) + 8 * i);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                long long v39 = [GEOLocalizedString alloc];
                                if (a3) {
                                  long long v40 = [(GEOLocalizedString *)v39 initWithJSON:v38];
                                }
                                else {
                                  long long v40 = [(GEOLocalizedString *)v39 initWithDictionary:v38];
                                }
                                long long v41 = v40;
                                -[GEOPDRatingCategory addLocalizedName:](v28, v40);
                              }
                            }
                            uint64_t v35 = [v33 countByEnumeratingWithState:&v121 objects:v130 count:16];
                          }
                          while (v35);
                        }

                        v14 = (GEOPDScorecardLayout *)v105;
                        v32 = v106;
                        uint64_t v22 = v108;
                        id v27 = v111;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v28 = 0;
                  }
                  -[GEOPDScorecardLayout addRatingCategory:]((uint64_t)v14, (void *)v28);

                  uint64_t v20 = v109;
                }
                ++v23;
              }
              while (v23 != v20);
              uint64_t v42 = [obj countByEnumeratingWithState:&v117 objects:&v126 count:16];
              uint64_t v20 = v42;
            }
            while (v42);
          }

          v10 = v102;
          id v5 = v103;
          id v18 = v100;
          id v13 = v101;
        }
      }
    }
    else
    {
      v14 = 0;
    }
    -[GEOPDPlaceQuestionnaireResult setScorecardLayout:](v112, v14);
  }
  if (a3) {
    uint64_t v43 = @"mapsId";
  }
  else {
    uint64_t v43 = @"maps_id";
  }
  v44 = objc_msgSend(v5, "objectForKeyedSubscript:", v43, v100, v101, v102);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v45 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      v46 = [(GEOPDMapsIdentifier *)v45 initWithJSON:v44];
    }
    else {
      v46 = [(GEOPDMapsIdentifier *)v45 initWithDictionary:v44];
    }
    v47 = v46;
    -[GEOPDPlaceQuestionnaireResult setMapsId:](v112, v46);
  }
  if (a3) {
    v48 = @"isOverride";
  }
  else {
    v48 = @"is_override";
  }
  v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v50 = [v49 BOOLValue];
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 8u;
    *(unsigned char *)(v112 + 66) = v50;
  }

  if (a3) {
    v51 = @"historicalMapsId";
  }
  else {
    v51 = @"historical_maps_id";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = v5;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v54 = v52;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v113 objects:v125 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v114;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v114 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v113 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v60 = [GEOPDMapsIdentifier alloc];
            if (a3) {
              v61 = [(GEOPDMapsIdentifier *)v60 initWithJSON:v59];
            }
            else {
              v61 = [(GEOPDMapsIdentifier *)v60 initWithDictionary:v59];
            }
            v62 = v61;
            -[GEOPDPlaceQuestionnaireResult addHistoricalMapsId:](v112, v61);
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v113 objects:v125 count:16];
      }
      while (v56);
    }

    id v5 = v53;
  }

  if (a3) {
    v63 = @"suppressOnExistingRichData";
  }
  else {
    v63 = @"suppress_on_existing_rich_data";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v65 = [v64 BOOLValue];
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 0x10u;
    *(unsigned char *)(v112 + 67) = v65;
  }

  if (a3) {
    v66 = @"alwaysPositionInitialRatingCtaTowardsTop";
  }
  else {
    v66 = @"always_position_initial_rating_cta_towards_top";
  }
  v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v68 = [v67 BOOLValue];
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 2u;
    *(unsigned char *)(v112 + 64) = v68;
  }

  if (a3) {
    v69 = @"collectPhotos";
  }
  else {
    v69 = @"collect_photos";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v71 = [v70 BOOLValue];
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 4u;
    *(unsigned char *)(v112 + 65) = v71;
  }

  if (a3) {
    v72 = @"photoConstraints";
  }
  else {
    v72 = @"photo_constraints";
  }
  v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v74 = [GEOPDPhotoConstraints alloc];
    if (v74)
    {
      v75 = v74;
      id v76 = v73;
      uint64_t v77 = [(GEOPDPhotoConstraints *)v75 init];
      if (v77)
      {
        if (a3) {
          v78 = @"mediaTypes";
        }
        else {
          v78 = @"media_types";
        }
        v79 = [v76 objectForKeyedSubscript:v78];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v104 = v5;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          id v80 = v79;
          uint64_t v81 = [v80 countByEnumeratingWithState:&v126 objects:v130 count:16];
          if (v81)
          {
            uint64_t v82 = v81;
            uint64_t v83 = *(void *)v127;
            do
            {
              for (uint64_t k = 0; k != v82; ++k)
              {
                if (*(void *)v127 != v83) {
                  objc_enumerationMutation(v80);
                }
                v85 = *(void **)(*((void *)&v126 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v86 = (void *)[v85 copy];
                  -[GEOPDPhotoConstraints addMediaTypes:](v77, v86);
                }
              }
              uint64_t v82 = [v80 countByEnumeratingWithState:&v126 objects:v130 count:16];
            }
            while (v82);
          }

          id v5 = v104;
        }

        if (a3) {
          v87 = @"maxNumberOfPhotos";
        }
        else {
          v87 = @"max_number_of_photos";
        }
        v88 = [v76 objectForKeyedSubscript:v87];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v89 = [v88 unsignedIntValue];
          *(unsigned char *)(v77 + 40) |= 8u;
          *(_DWORD *)(v77 + 36) = v89;
        }

        if (a3) {
          v90 = @"maxPixels";
        }
        else {
          v90 = @"max_pixels";
        }
        v91 = [v76 objectForKeyedSubscript:v90];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v92 = [v91 unsignedLongLongValue];
          *(unsigned char *)(v77 + 40) |= 1u;
          *(void *)(v77 + 8) = v92;
        }

        if (a3) {
          v93 = @"minPixels";
        }
        else {
          v93 = @"min_pixels";
        }
        v94 = [v76 objectForKeyedSubscript:v93];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v95 = [v94 unsignedLongLongValue];
          *(unsigned char *)(v77 + 40) |= 2u;
          *(void *)(v77 + 24) = v95;
        }

        if (a3) {
          v96 = @"maxAspectRatio";
        }
        else {
          v96 = @"max_aspect_ratio";
        }
        v97 = [v76 objectForKeyedSubscript:v96];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v97 floatValue];
          *(unsigned char *)(v77 + 40) |= 4u;
          *(_DWORD *)(v77 + 32) = v98;
        }
      }
    }
    else
    {
      uint64_t v77 = 0;
    }
    -[GEOPDPlaceQuestionnaireResult setPhotoConstraints:](v112, (void *)v77);
  }
LABEL_166:

  return v112;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceQuestionnaireResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceQuestionnaireResultIsDirty((uint64_t)self) & 1) == 0)
  {
    id v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 0);
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_scorecardLayout) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_historicalMapsIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_photoConstraints) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPlaceQuestionnaireResult _readHistoricalMapsIds](result);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(v3 + 16);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2, (void)v9))
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    -[GEOPDPlaceQuestionnaireResult _readMapsId](v3);
    return [*(id *)(v3 + 24) hasGreenTeaWithValue:a2];
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 0);
    if (*(_WORD *)&self->_flags)
    {
      *(_DWORD *)(v5 + 60) = self->_status;
      *(_WORD *)(v5 + 68) |= 1u;
    }
    id v9 = [(GEOPDScorecardLayout *)self->_scorecardLayout copyWithZone:a3];
    long long v10 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v9;

    id v11 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
    long long v12 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v11;

    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(unsigned char *)(v5 + 66) = self->_isOverride;
      *(_WORD *)(v5 + 68) |= 8u;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v13 = self->_historicalMapsIds;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
          -[GEOPDPlaceQuestionnaireResult addHistoricalMapsId:](v5, v17);
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(unsigned char *)(v5 + 67) = self->_suppressOnExistingRichData;
      *(_WORD *)(v5 + 68) |= 0x10u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_18:
        if ((flags & 4) == 0)
        {
LABEL_20:
          id v19 = -[GEOPDPhotoConstraints copyWithZone:](self->_photoConstraints, "copyWithZone:", a3, (void)v21);
          id v8 = *(id *)(v5 + 32);
          *(void *)(v5 + 32) = v19;
          goto LABEL_21;
        }
LABEL_19:
        *(unsigned char *)(v5 + 65) = self->_collectPhotos;
        *(_WORD *)(v5 + 68) |= 4u;
        goto LABEL_20;
      }
    }
    else if ((flags & 2) == 0)
    {
      goto LABEL_18;
    }
    *(unsigned char *)(v5 + 64) = self->_alwaysPositionInitialRatingCtaTowardsTop;
    *(_WORD *)(v5 + 68) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDPlaceQuestionnaireResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_21:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)v4, 1);
  __int16 v5 = *((_WORD *)v4 + 34);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_status != *((_DWORD *)v4 + 15)) {
      goto LABEL_42;
    }
  }
  else if (v5)
  {
    goto LABEL_42;
  }
  scorecardLayout = self->_scorecardLayout;
  if ((unint64_t)scorecardLayout | *((void *)v4 + 5)
    && !-[GEOPDScorecardLayout isEqual:](scorecardLayout, "isEqual:"))
  {
    goto LABEL_42;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 3))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")) {
      goto LABEL_42;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 34);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_42;
    }
    if (self->_isOverride)
    {
      if (!*((unsigned char *)v4 + 66)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 66))
    {
      goto LABEL_42;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_42;
  }
  historicalMapsIds = self->_historicalMapsIds;
  if ((unint64_t)historicalMapsIds | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](historicalMapsIds, "isEqual:")) {
      goto LABEL_42;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 34);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0) {
      goto LABEL_42;
    }
    if (self->_suppressOnExistingRichData)
    {
      if (!*((unsigned char *)v4 + 67)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 67))
    {
      goto LABEL_42;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0) {
      goto LABEL_42;
    }
    if (self->_alwaysPositionInitialRatingCtaTowardsTop)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_42;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((flags & 4) == 0)
  {
    if ((v9 & 4) == 0) {
      goto LABEL_48;
    }
LABEL_42:
    char v11 = 0;
    goto LABEL_43;
  }
  if ((v9 & 4) == 0) {
    goto LABEL_42;
  }
  if (!self->_collectPhotos)
  {
    if (!*((unsigned char *)v4 + 65)) {
      goto LABEL_48;
    }
    goto LABEL_42;
  }
  if (!*((unsigned char *)v4 + 65)) {
    goto LABEL_42;
  }
LABEL_48:
  photoConstraints = self->_photoConstraints;
  if ((unint64_t)photoConstraints | *((void *)v4 + 4)) {
    char v11 = -[GEOPDPhotoConstraints isEqual:](photoConstraints, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_43:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 1);
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDScorecardLayout *)self->_scorecardLayout hash];
  unint64_t v5 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_isOverride;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_historicalMapsIds hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    uint64_t v9 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v10 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ [(GEOPDPhotoConstraints *)self->_photoConstraints hash];
  }
  uint64_t v9 = 2654435761 * self->_suppressOnExistingRichData;
  if ((flags & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_alwaysPositionInitialRatingCtaTowardsTop;
  if ((flags & 4) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_collectPhotos;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ [(GEOPDPhotoConstraints *)self->_photoConstraints hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_56;
  }
  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)v3, 0);
  if (*((_WORD *)v4 + 34))
  {
    *(_DWORD *)(a1 + 60) = *((_DWORD *)v4 + 15);
    *(_WORD *)(a1 + 68) |= 1u;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = (void *)*((void *)v4 + 5);
  if (v5)
  {
    if (v6)
    {
      id v7 = v6;
      -[GEOPDScorecardLayout readAll:]((uint64_t)v7, 0);
      id v8 = (void *)*((void *)v7 + 3);
      if (v8) {
        -[GEOPDScorecardLayout setVersion:](v5, v8);
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v9 = *((id *)v7 + 2);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(v9);
            }
            -[GEOPDScorecardLayout addRatingCategory:](v5, *(void **)(*((void *)&v35 + 1) + 8 * i));
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v11);
      }
    }
  }
  else if (v6)
  {
    -[GEOPDPlaceQuestionnaireResult setScorecardLayout:](a1, v6);
  }
  uint64_t v14 = *(void **)(a1 + 24);
  uint64_t v15 = *((void *)v4 + 3);
  if (v14)
  {
    if (v15) {
      objc_msgSend(v14, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOPDPlaceQuestionnaireResult setMapsId:](a1, *((void **)v4 + 3));
  }
  if ((*((_WORD *)v4 + 34) & 8) != 0)
  {
    *(unsigned char *)(a1 + 66) = *((unsigned char *)v4 + 66);
    *(_WORD *)(a1 + 68) |= 8u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = *((id *)v4 + 2);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOPDPlaceQuestionnaireResult addHistoricalMapsId:](a1, *(void **)(*((void *)&v31 + 1) + 8 * j));
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v18);
  }

  __int16 v21 = *((_WORD *)v4 + 34);
  if ((v21 & 0x10) != 0)
  {
    *(unsigned char *)(a1 + 67) = *((unsigned char *)v4 + 67);
    *(_WORD *)(a1 + 68) |= 0x10u;
    __int16 v21 = *((_WORD *)v4 + 34);
    if ((v21 & 2) == 0)
    {
LABEL_34:
      if ((v21 & 4) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((v21 & 2) == 0)
  {
    goto LABEL_34;
  }
  *(unsigned char *)(a1 + 64) = *((unsigned char *)v4 + 64);
  *(_WORD *)(a1 + 68) |= 2u;
  if ((*((_WORD *)v4 + 34) & 4) != 0)
  {
LABEL_35:
    *(unsigned char *)(a1 + 65) = *((unsigned char *)v4 + 65);
    *(_WORD *)(a1 + 68) |= 4u;
  }
LABEL_36:
  uint64_t v22 = *(void *)(a1 + 32);
  long long v23 = (void *)*((void *)v4 + 4);
  if (v22)
  {
    if (v23)
    {
      long long v24 = v23;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v25 = v24[2];
      uint64_t v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v40, 16, (void)v31);
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v36;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(v25);
            }
            -[GEOPDPhotoConstraints addMediaTypes:](v22, *(void **)(*((void *)&v35 + 1) + 8 * k));
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v27);
      }

      char v30 = *((unsigned char *)v24 + 40);
      if ((v30 & 8) != 0)
      {
        *(_DWORD *)(v22 + 36) = *((_DWORD *)v24 + 9);
        *(unsigned char *)(v22 + 40) |= 8u;
        char v30 = *((unsigned char *)v24 + 40);
        if ((v30 & 1) == 0)
        {
LABEL_47:
          if ((v30 & 2) == 0) {
            goto LABEL_48;
          }
          goto LABEL_59;
        }
      }
      else if (((_BYTE)v24[5] & 1) == 0)
      {
        goto LABEL_47;
      }
      *(void *)(v22 + 8) = v24[1];
      *(unsigned char *)(v22 + 40) |= 1u;
      char v30 = *((unsigned char *)v24 + 40);
      if ((v30 & 2) == 0)
      {
LABEL_48:
        if ((v30 & 4) == 0)
        {
LABEL_50:

          goto LABEL_56;
        }
LABEL_49:
        *(_DWORD *)(v22 + 32) = *((_DWORD *)v24 + 8);
        *(unsigned char *)(v22 + 40) |= 4u;
        goto LABEL_50;
      }
LABEL_59:
      *(void *)(v22 + 24) = v24[3];
      *(unsigned char *)(v22 + 40) |= 2u;
      if (((_BYTE)v24[5] & 4) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if (v23)
  {
    -[GEOPDPlaceQuestionnaireResult setPhotoConstraints:](a1, v23);
  }
LABEL_56:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorecardLayout, 0);
  objc_storeStrong((id *)&self->_photoConstraints, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_historicalMapsIds, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end