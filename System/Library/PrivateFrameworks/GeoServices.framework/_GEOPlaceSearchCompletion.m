@interface _GEOPlaceSearchCompletion
- (GEOAutocompleteSessionData)sessionData;
- (NSArray)groups;
- (_GEOPlaceSearchCompletion)initWithResponse:(id)a3 traits:(id)a4 sessionData:(id)a5 mapItems:(id)a6;
@end

@implementation _GEOPlaceSearchCompletion

- (_GEOPlaceSearchCompletion)initWithResponse:(id)a3 traits:(id)a4 sessionData:(id)a5 mapItems:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v50 = a4;
  id v11 = a5;
  id v49 = a6;
  v58.receiver = self;
  v58.super_class = (Class)_GEOPlaceSearchCompletion;
  v12 = [(_GEOPlaceSearchCompletion *)&v58 init];
  v13 = v12;
  v14 = 0;
  if (v10 && v12)
  {
    if ([v10 hasGlobalResult])
    {
      uint64_t v15 = [v10 globalResult];
      if (!v15)
      {
        v25 = 0;
        v14 = 0;
        goto LABEL_27;
      }
      v16 = (void *)v15;
      -[GEOPDPlaceGlobalResult _readAutocompleteResult](v15);
      uint64_t v17 = v16[8];

      if (v17)
      {
        v43 = v13;
        v44 = v11;
        v18 = [v10 globalResult];
        -[GEOPDPlaceGlobalResult autocompleteResult](v18);
        v19 = (id *)objc_claimAutoreleasedReturnValue();

        v20 = [MEMORY[0x1E4F1CA48] array];
        v21 = [MEMORY[0x1E4F1CA48] array];
        v45 = v10;
        v22 = [v10 mapsResults];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __74___GEOPlaceSearchCompletion_initWithResponse_traits_sessionData_mapItems___block_invoke;
        v55[3] = &unk_1E53DE640;
        id v48 = v20;
        id v56 = v48;
        id v47 = v21;
        id v57 = v47;
        [v22 enumerateObjectsUsingBlock:v55];

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v42 = v19;
        -[GEOPDAutocompleteResult sections](v19);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          v25 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v52 != v27) {
                objc_enumerationMutation(obj);
              }
              uint64_t v29 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              v30 = [_GEOPlaceSearchCompletionGroup alloc];
              v31 = (void *)[v48 copy];
              v32 = (void *)[v47 copy];
              v33 = [(_GEOPlaceSearchCompletionGroup *)v30 initWithSection:v29 traits:v50 entryListIndex:v26 + i mapItems:v49 collections:v31 publishers:v32];

              if (v33)
              {
                if (!v25)
                {
                  v25 = [MEMORY[0x1E4F1CA48] array];
                }
                [v25 addObject:v33];
              }
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
            uint64_t v26 = (v26 + i);
          }
          while (v24);
        }
        else
        {
          v25 = 0;
        }

        v13 = v43;
        id v11 = v44;
        if ([v25 count]) {
          objc_storeStrong((id *)&v43->_groups, v25);
        }
        id v10 = v45;
        v34 = [v45 globalResult];
        uint64_t v35 = -[GEOPDPlaceGlobalResult autocompleteResult](v34);
        v36 = (void *)v35;
        if (v35)
        {
          -[GEOPDAutocompleteResult _readAutocompleteSessionData](v35);
          uint64_t v37 = v36[3];

          if (!v37)
          {
LABEL_26:
            v14 = v43;

LABEL_27:
            goto LABEL_28;
          }
          v34 = [v45 globalResult];
          v36 = -[GEOPDPlaceGlobalResult autocompleteResult](v34);
          v38 = -[GEOPDAutocompleteResult autocompleteSessionData]((id *)v36);
          uint64_t v39 = [v44 updateWithAutoCompleteSessionData:v38];
          sessionData = v43->_sessionData;
          v43->_sessionData = (GEOAutocompleteSessionData *)v39;
        }
        goto LABEL_26;
      }
    }
    v14 = 0;
  }
LABEL_28:

  return v14;
}

- (NSArray)groups
{
  return self->_groups;
}

- (GEOAutocompleteSessionData)sessionData
{
  return self->_sessionData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);

  objc_storeStrong((id *)&self->_groups, 0);
}

@end