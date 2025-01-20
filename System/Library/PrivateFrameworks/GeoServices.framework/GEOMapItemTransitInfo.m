@interface GEOMapItemTransitInfo
@end

@implementation GEOMapItemTransitInfo

uint64_t __135___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_ignoreDirectionFilter_direction_validForDateFromBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 line];
  v5 = [v4 system];
  v6 = (void *)[v5 muid];
  if (v6 != (void *)[*(id *)(a1 + 32) muid]) {
    goto LABEL_27;
  }
  BOOL v7 = *(unsigned char *)(a1 + 72) == 0;
  if (*(unsigned char *)(a1 + 72)) {
    goto LABEL_3;
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17)
  {
    v6 = [v3 direction];
    if (![v6 isEqualToString:*(void *)(a1 + 40)]) {
      goto LABEL_26;
    }
    if (*(unsigned char *)(a1 + 72) || *(void *)(a1 + 40))
    {
LABEL_3:
      char v8 = 0;
      uint64_t v9 = *(void *)(a1 + 64);
      if (!v9) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  v18 = [v3 direction];
  if (v18)
  {

    if (!v17)
    {
LABEL_27:

LABEL_28:
      uint64_t v16 = 0;
      goto LABEL_29;
    }
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if (!v9)
  {
    if (v17) {

    }
    goto LABEL_8;
  }
  BOOL v7 = v17 != 0;
LABEL_4:
  v10 = (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  char v8 = [v3 isValidForDate:v10 inTimeZone:*(void *)(*(void *)(a1 + 48) + 48)] ^ 1;

LABEL_5:
  if (v7) {

  }
  if (v8) {
    goto LABEL_28;
  }
LABEL_8:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        if (GEOTransitIncidentEntityAffectsSequence(*(void **)(*((void *)&v20 + 1) + 8 * v15), v3))
        {
          uint64_t v16 = 0;
          goto LABEL_23;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 1;
LABEL_23:

LABEL_29:
  return v16;
}

uint64_t __113___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_container_validForDateFromBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 56);
  if (!v5)
  {
    v6 = (id *)(a1 + 40);
    if (!*(void *)(a1 + 40)) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v2 = (*(void (**)(void, id))(v5 + 16))(*(void *)(a1 + 56), v4);
  if (([v4 isValidForDate:v2 inTimeZone:*(void *)(*(void *)(a1 + 32) + 48)] & 1) == 0)
  {

    goto LABEL_19;
  }
  v6 = (id *)(a1 + 40);
  if (*(void *)(a1 + 40))
  {
LABEL_6:
    BOOL v7 = [v4 line];
    char v8 = [v7 system];
    uint64_t v9 = [v8 muid];
    uint64_t v10 = [*v6 muid];

    if (v5) {
    if (v9 == v10)
    }
      goto LABEL_9;
LABEL_19:
    uint64_t v16 = 0;
    goto LABEL_22;
  }

LABEL_9:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        if (GEOTransitIncidentEntityAffectsSequence(*(void **)(*((void *)&v18 + 1) + 8 * v15), v4))
        {
          uint64_t v16 = 0;
          goto LABEL_21;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 1;
LABEL_21:

LABEL_22:
  return v16;
}

void __111___GEOMapItemTransitInfo_departureSequenceContainersForSystem_excludingIncidentEntities_validForDateFromBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v4);
    if (v5[4])
    {
      -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v5);
      if (v5[4])
      {
        v27 = 0;
        unint64_t v6 = 0;
        do
        {
          unint64_t v7 = -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:]((uint64_t)v5, v6);
          if (v7 < [*(id *)(a1 + 32) count])
          {
            char v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7];
            uint64_t v9 = *(void *)(a1 + 72);
            if (v9)
            {
              uint64_t v10 = (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
              int v11 = [v8 isValidForDate:v10 inTimeZone:*(void *)(*(void *)(a1 + 40) + 48)];

              if (v11)
              {
                long long v30 = 0u;
                long long v31 = 0u;
                long long v28 = 0u;
                long long v29 = 0u;
                id v12 = *(id *)(a1 + 48);
                uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
                if (v13)
                {
                  uint64_t v14 = v13;
                  uint64_t v15 = *(void *)v29;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v14; ++i)
                    {
                      if (*(void *)v29 != v15) {
                        objc_enumerationMutation(v12);
                      }
                      if (GEOTransitIncidentEntityAffectsSequence(*(void **)(*((void *)&v28 + 1) + 8 * i), v8))
                      {

                        v27 = 0;
                        goto LABEL_18;
                      }
                    }
                    uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
                    if (v14) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_18:

                uint64_t v17 = [v8 line];
                long long v18 = [v17 system];
                uint64_t v19 = [v18 muid];
                uint64_t v20 = [*(id *)(a1 + 56) muid];

                if (v19 == v20)
                {
                  long long v21 = NSString;
                  long long v22 = [v8 containerDisplayName];
                  uint64_t v23 = [NSNumber numberWithUnsignedInteger:a3];
                  uint64_t v24 = [v21 stringWithFormat:@"%@_%@", v22, v23];

                  v27 = (void *)v24;
                }
              }
            }
          }
          ++v6;
          -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v5);
        }
        while (v6 < v5[4]);
        uint64_t v25 = v27;
        if (v27) {
          [*(id *)(a1 + 64) addObject:v27];
        }
      }
      else
      {
        uint64_t v25 = 0;
      }
    }
  }
}

void __106___GEOMapItemTransitInfo_serviceResumesResultForLine_excludingIncidentEntities_afterDate_usingContainers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = [v4 line];
  uint64_t v6 = [v5 muid];
  uint64_t v7 = [*(id *)(a1 + 32) muid];

  if (v6 != v7) {
    goto LABEL_27;
  }
  char v8 = [v4 firstDepartureOnOrAfterDate:*(void *)(a1 + 40)];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        if (GEOTransitIncidentEntityAffectsSequence(*(void **)(*((void *)&v25 + 1) + 8 * i), v4))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          goto LABEL_26;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  objc_msgSend(v8, "departureDate", (void)v25);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v4 firstDepartureFrequencyOnOrAfterDate:*(void *)(a1 + 40)];
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 firstTimeInFrequency];
    uint64_t v17 = (void *)v16;
    if (v9)
    {
      uint64_t v18 = [v9 earlierDate:v16];

      id v9 = (id)v18;
    }
    else
    {
      id v9 = (id)v16;
    }
  }
  uint64_t v19 = [v4 firstOpenOperatingDateOnOrAfterDate:*(void *)(a1 + 40)];
  uint64_t v20 = v19;
  if (!v19)
  {
LABEL_18:
    if (!v9) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  if (v9)
  {
    uint64_t v21 = [v9 earlierDate:v19];

    id v9 = (id)v21;
    goto LABEL_18;
  }
  id v9 = v19;
LABEL_21:
  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  if (v23)
  {
    id v24 = [v23 earlierDate:v9];

    if (v24 != v9) {
      goto LABEL_25;
    }
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  }
  objc_storeStrong((id *)(v22 + 40), v9);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
LABEL_25:

LABEL_26:
LABEL_27:
}

@end