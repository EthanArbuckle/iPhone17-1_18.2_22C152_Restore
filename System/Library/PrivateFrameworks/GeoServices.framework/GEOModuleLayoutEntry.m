@interface GEOModuleLayoutEntry
+ (id)moduleLayoutEntryFromArray:(id)a3;
- (GEOModuleLayoutEntry)initWithModuleLayoutEntry:(id)a3 moduleConfigProvider:(id)a4;
- (NSArray)modules;
- (NSString)debugName;
- (id)description;
- (void)_performPostCheckForModules:(id)a3;
@end

@implementation GEOModuleLayoutEntry

+ (id)moduleLayoutEntryFromArray:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(GEOPDModuleLayoutEntry);
  [(GEOPDModuleLayoutEntry *)v4 setDebugLayoutId:@"customLayout"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        v10 = objc_alloc_init(GEOPDModule);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v9;
          if ([v11 isEqualToString:@"MODULE_TYPE_UNKNOWN"])
          {
            uint64_t v12 = 0;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_TITLE"])
          {
            uint64_t v12 = 1;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_BUTTONS"])
          {
            uint64_t v12 = 2;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_INLINE_MAP"])
          {
            uint64_t v12 = 3;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_PHOTOS"])
          {
            uint64_t v12 = 4;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_INFOS"])
          {
            uint64_t v12 = 5;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_TRANSIT_DEPARTURE"])
          {
            uint64_t v12 = 6;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_TRANSIT_ATTRIBUTION"])
          {
            uint64_t v12 = 7;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_ENCYCLOPEDIC"])
          {
            uint64_t v12 = 8;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_HOURS"])
          {
            uint64_t v12 = 9;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_BUSINESS_INFOS"])
          {
            uint64_t v12 = 10;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_REVIEWS"])
          {
            uint64_t v12 = 11;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_ACTIONS_ROW"])
          {
            uint64_t v12 = 12;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_RESERVATIONS"])
          {
            uint64_t v12 = 14;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_OFFICIAL_APPS"])
          {
            uint64_t v12 = 15;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_VENUE_BROWSE"])
          {
            uint64_t v12 = 16;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_VENUE_INFO"])
          {
            uint64_t v12 = 17;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_INFO_PARENT"])
          {
            uint64_t v12 = 18;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_ANNOTATED_LIST"])
          {
            uint64_t v12 = 19;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_ANNOTATED_PICTURE"])
          {
            uint64_t v12 = 20;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_MESSAGE"])
          {
            uint64_t v12 = 21;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_MESSAGE_HOURS"])
          {
            uint64_t v12 = 22;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_ACTION_FOOTER"])
          {
            uint64_t v12 = 23;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_ATTRIBUTION"])
          {
            uint64_t v12 = 24;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_WEB_CONTENT"])
          {
            uint64_t v12 = 25;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_RELATED_PLACE_LIST"])
          {
            uint64_t v12 = 26;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_SERVICE_HOURS"])
          {
            uint64_t v12 = 27;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_QUICK_LINKS"])
          {
            uint64_t v12 = 28;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_COLLECTIONS"])
          {
            uint64_t v12 = 29;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
          {
            uint64_t v12 = 30;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
          {
            uint64_t v12 = 31;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_CURATED_COLLECTIONS"])
          {
            uint64_t v12 = 32;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_PLACE_QUESTIONNAIRE"])
          {
            uint64_t v12 = 33;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_APPLE_RATINGS"])
          {
            uint64_t v12 = 34;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_PLACE_RIBBON"])
          {
            uint64_t v12 = 35;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_REVIEW_AND_RATING"])
          {
            uint64_t v12 = 36;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_ABOUT"])
          {
            uint64_t v12 = 37;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_TEMPLATE_PLACE"])
          {
            uint64_t v12 = 38;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_TRANSIT_LABELS"])
          {
            uint64_t v12 = 39;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_PLACECARD_ENRICHMENT"])
          {
            uint64_t v12 = 40;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_UNIFIED_ACTION_ROW"])
          {
            uint64_t v12 = 41;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
          {
            uint64_t v12 = 42;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_EV_CHARGER"])
          {
            uint64_t v12 = 43;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_HIKING_ASSOCIATION"])
          {
            uint64_t v12 = 44;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_NOTE"])
          {
            uint64_t v12 = 45;
          }
          else if ([v11 isEqualToString:@"MODULE_TYPE_HIKE_SUGGESTION"])
          {
            uint64_t v12 = 46;
          }
          else
          {
            uint64_t v12 = 0;
          }

          [(GEOPDModule *)v10 setType:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_192;
          }
          id v13 = v9;
          v14 = [v13 objectForKeyedSubscript:@"type"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v16 = [v13 objectForKeyedSubscript:@"type"];
            if ([v16 isEqualToString:@"MODULE_TYPE_UNKNOWN"])
            {
              uint64_t v17 = 0;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_TITLE"])
            {
              uint64_t v17 = 1;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_BUTTONS"])
            {
              uint64_t v17 = 2;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_INLINE_MAP"])
            {
              uint64_t v17 = 3;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_PHOTOS"])
            {
              uint64_t v17 = 4;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_INFOS"])
            {
              uint64_t v17 = 5;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_TRANSIT_DEPARTURE"])
            {
              uint64_t v17 = 6;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_TRANSIT_ATTRIBUTION"])
            {
              uint64_t v17 = 7;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_ENCYCLOPEDIC"])
            {
              uint64_t v17 = 8;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_HOURS"])
            {
              uint64_t v17 = 9;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_BUSINESS_INFOS"])
            {
              uint64_t v17 = 10;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_REVIEWS"])
            {
              uint64_t v17 = 11;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_ACTIONS_ROW"])
            {
              uint64_t v17 = 12;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_RESERVATIONS"])
            {
              uint64_t v17 = 14;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_OFFICIAL_APPS"])
            {
              uint64_t v17 = 15;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_VENUE_BROWSE"])
            {
              uint64_t v17 = 16;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_VENUE_INFO"])
            {
              uint64_t v17 = 17;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_INFO_PARENT"])
            {
              uint64_t v17 = 18;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_ANNOTATED_LIST"])
            {
              uint64_t v17 = 19;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_ANNOTATED_PICTURE"])
            {
              uint64_t v17 = 20;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_MESSAGE"])
            {
              uint64_t v17 = 21;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_MESSAGE_HOURS"])
            {
              uint64_t v17 = 22;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_ACTION_FOOTER"])
            {
              uint64_t v17 = 23;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_ATTRIBUTION"])
            {
              uint64_t v17 = 24;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_WEB_CONTENT"])
            {
              uint64_t v17 = 25;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_RELATED_PLACE_LIST"])
            {
              uint64_t v17 = 26;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_SERVICE_HOURS"])
            {
              uint64_t v17 = 27;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_QUICK_LINKS"])
            {
              uint64_t v17 = 28;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_COLLECTIONS"])
            {
              uint64_t v17 = 29;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_PLACE_BROWSE_CATEGORIES"])
            {
              uint64_t v17 = 30;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
            {
              uint64_t v17 = 31;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_CURATED_COLLECTIONS"])
            {
              uint64_t v17 = 32;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_PLACE_QUESTIONNAIRE"])
            {
              uint64_t v17 = 33;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_APPLE_RATINGS"])
            {
              uint64_t v17 = 34;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_PLACE_RIBBON"])
            {
              uint64_t v17 = 35;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_REVIEW_AND_RATING"])
            {
              uint64_t v17 = 36;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_ABOUT"])
            {
              uint64_t v17 = 37;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_TEMPLATE_PLACE"])
            {
              uint64_t v17 = 38;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_TRANSIT_LABELS"])
            {
              uint64_t v17 = 39;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_PLACECARD_ENRICHMENT"])
            {
              uint64_t v17 = 40;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_UNIFIED_ACTION_ROW"])
            {
              uint64_t v17 = 41;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_QUESTIONNAIRE_SUGGESTION"])
            {
              uint64_t v17 = 42;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_EV_CHARGER"])
            {
              uint64_t v17 = 43;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_HIKING_ASSOCIATION"])
            {
              uint64_t v17 = 44;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_NOTE"])
            {
              uint64_t v17 = 45;
            }
            else if ([v16 isEqualToString:@"MODULE_TYPE_HIKE_SUGGESTION"])
            {
              uint64_t v17 = 46;
            }
            else
            {
              uint64_t v17 = 0;
            }

            [(GEOPDModule *)v10 setType:v17];
          }
          v18 = [v13 objectForKeyedSubscript:@"web_content_url"];
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();

          if (v19)
          {
            v20 = objc_alloc_init(GEOPDModuleOptions);
            [(GEOPDModule *)v10 setOptions:v20];

            v21 = [v13 objectForKeyedSubscript:@"web_content_url"];
            v22 = [(GEOPDModule *)v10 options];
            [v22 setWebContentUrl:v21];
          }
        }

LABEL_192:
        if ([(GEOPDModule *)v10 type]) {
          [(GEOPDModuleLayoutEntry *)v4 addModules:v10];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v6 = v23;
    }
    while (v23);
  }

  v24 = [[GEOModuleLayoutEntry alloc] initWithModuleLayoutEntry:v4 moduleConfigProvider:0];

  return v24;
}

- (GEOModuleLayoutEntry)initWithModuleLayoutEntry:(id)a3 moduleConfigProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOModuleLayoutEntry;
  v9 = [(GEOModuleLayoutEntry *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_moduleLayoutEntry, a3);
    objc_storeStrong((id *)&v10->_moduleConfigProvider, a4);
    id v11 = v10;
  }

  return v10;
}

- (NSString)debugName
{
  id v3 = [(GEOPDModuleLayoutEntry *)self->_moduleLayoutEntry debugLayoutId];

  if (v3)
  {
    v4 = [(GEOPDModuleLayoutEntry *)self->_moduleLayoutEntry debugLayoutId];
  }
  else
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [(GEOPDModuleLayoutEntry *)self->_moduleLayoutEntry platformType];
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = off_1E53E1CF8[(int)v6];
    }
    uint64_t v8 = [(GEOPDModuleLayoutEntry *)self->_moduleLayoutEntry applicationIds];
    v9 = (void *)v8;
    v10 = @"no app Id";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v4 = [v5 stringWithFormat:@"Layout %@ - %@", v7, v10];
  }

  return (NSString *)v4;
}

- (NSArray)modules
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(GEOPDModuleLayoutEntry *)self->_moduleLayoutEntry modules];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(GEOPDModuleLayoutEntry *)self->_moduleLayoutEntry modules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [[GEOModule alloc] initWithModule:*(void *)(*((void *)&v14 + 1) + 8 * i) moduleConfigProvider:self->_moduleConfigProvider];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(GEOModuleLayoutEntry *)self _performPostCheckForModules:v5];
  uint64_t v12 = (void *)[v5 copy];

  return (NSArray *)v12;
}

- (void)_performPostCheckForModules:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v26) == 39)
        {
          id v9 = v8;

          if (v9)
          {
            id v10 = v3;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v11 = v10;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v27;
              while (2)
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v27 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                  if ([v16 type] == 2)
                  {
                    id v17 = v16;

                    if (v17) {
                      [v11 removeObject:v17];
                    }
                    goto LABEL_22;
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
                if (v13) {
                  continue;
                }
                break;
              }
            }

            id v17 = 0;
LABEL_22:
            id v18 = v11;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v19 = v18;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v27;
              while (2)
              {
                for (uint64_t k = 0; k != v21; ++k)
                {
                  if (*(void *)v27 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v26 + 1) + 8 * k);
                  if ([v24 type] == 12)
                  {
                    id v25 = v24;

                    if (v25)
                    {
                      [v19 removeObject:v25];
                    }
                    goto LABEL_33;
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }

LABEL_33:
          }
          goto LABEL_34;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

LABEL_34:
}

- (id)description
{
  v2 = [(GEOModuleLayoutEntry *)self modules];
  id v3 = [v2 description];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleConfigProvider, 0);

  objc_storeStrong((id *)&self->_moduleLayoutEntry, 0);
}

@end