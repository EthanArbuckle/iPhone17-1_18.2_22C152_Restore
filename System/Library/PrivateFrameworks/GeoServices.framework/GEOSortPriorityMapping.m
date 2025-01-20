@interface GEOSortPriorityMapping
+ (id)sortPriorityMappingFromDefaultsValue:(id)a3;
+ (int64_t)resultSubtypeForACResultSubtype:(int)a3;
+ (int64_t)resultTypeForACResultType:(int)a3;
- (GEOSortPriorityMapping)init;
- (GEOSortPriorityMapping)initWithAutocompleteResultSortPriorityMapping:(id)a3;
- (GEOSortPriorityMapping)initWithEntries:(id)a3;
- (NSArray)entries;
@end

@implementation GEOSortPriorityMapping

- (GEOSortPriorityMapping)init
{
  result = (GEOSortPriorityMapping *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSortPriorityMapping)initWithEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSortPriorityMapping;
  v5 = [(GEOSortPriorityMapping *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entries = v5->_entries;
    v5->_entries = (NSArray *)v6;
  }
  return v5;
}

- (GEOSortPriorityMapping)initWithAutocompleteResultSortPriorityMapping:(id)a3
{
  v19 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        v10 = [GEOSortPriorityMappingEntry alloc];
        if (v9)
        {
          if ((*(unsigned char *)(v9 + 28) & 2) != 0) {
            uint64_t v11 = *(unsigned int *)(v9 + 20);
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = *(int *)(v9 + 24);
          int64_t v13 = +[GEOSortPriorityMapping resultTypeForACResultType:](GEOSortPriorityMapping, "resultTypeForACResultType:", v11, v19);
          if (*(unsigned char *)(v9 + 28)) {
            uint64_t v14 = *(unsigned int *)(v9 + 16);
          }
          else {
            uint64_t v14 = 0;
          }
        }
        else
        {
          int64_t v13 = +[GEOSortPriorityMapping resultTypeForACResultType:0];
          uint64_t v12 = 0;
          uint64_t v14 = 0;
        }
        v15 = [(GEOSortPriorityMappingEntry *)v10 initWithPriority:v12 resultType:v13 resultSubtype:+[GEOSortPriorityMapping resultSubtypeForACResultSubtype:](GEOSortPriorityMapping, "resultSubtypeForACResultSubtype:", v14, v19)];
        [v4 addObject:v15];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v6 = v16;
    }
    while (v16);
  }

  v17 = [(GEOSortPriorityMapping *)v19 initWithEntries:v4];
  return v17;
}

+ (id)sortPriorityMappingFromDefaultsValue:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [MEMORY[0x1E4F1CA48] array];
    uint64_t v26 = v25 = v3;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v5) {
      goto LABEL_102;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if ([v10 count] == 3)
          {
            uint64_t v11 = [v10 objectAtIndexedSubscript:0];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_98;
            }
            uint64_t v12 = [v10 objectAtIndexedSubscript:1];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_98;
            }
            int64_t v13 = [v10 objectAtIndexedSubscript:2];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v15 = [v10 objectAtIndexedSubscript:0];
              if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_UNKNOWN"])
              {
                uint64_t v16 = 0;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_ANY"])
              {
                uint64_t v16 = 1;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_SERVER"])
              {
                uint64_t v16 = 2;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CALENDAR"])
              {
                uint64_t v16 = 3;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_COLLECTION"])
              {
                uint64_t v16 = 4;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CONTACTS"])
              {
                uint64_t v16 = 5;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CORE_RECENTS"])
              {
                uint64_t v16 = 6;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_CORE_ROUTINE"])
              {
                uint64_t v16 = 7;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_HISTORY"])
              {
                uint64_t v16 = 8;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_SIRI_SUGGESTIONS"])
              {
                uint64_t v16 = 9;
              }
              else if ([v15 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_SUGGESTIONS"])
              {
                uint64_t v16 = 10;
              }
              else
              {
                uint64_t v16 = 0;
              }

              uint64_t v17 = [a1 resultTypeForACResultType:v16];
              id v18 = [v10 objectAtIndexedSubscript:1];
              if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_UNKNOWN"])
              {
                uint64_t v19 = 0;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_ANY"])
              {
                uint64_t v19 = 1;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_FAVORITES"])
              {
                uint64_t v19 = 2;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_MARKED_LOCATION"])
              {
                uint64_t v19 = 3;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_CONTACTS_ME_CARD"])
              {
                uint64_t v19 = 4;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MAIL"])
              {
                uint64_t v19 = 5;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MESSAGES"])
              {
                uint64_t v19 = 6;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_HOME"])
              {
                uint64_t v19 = 7;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_PARKED_CAR"])
              {
                uint64_t v19 = 8;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_WORK"])
              {
                uint64_t v19 = 9;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_DIRECTIONS"])
              {
                uint64_t v19 = 10;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_PLACE"])
              {
                uint64_t v19 = 11;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_QUERY"])
              {
                uint64_t v19 = 12;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_TRANSIT_LINE"])
              {
                uint64_t v19 = 13;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOME"])
              {
                uint64_t v19 = 14;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_WORK"])
              {
                uint64_t v19 = 15;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CALENDAR_EVENT"])
              {
                uint64_t v19 = 16;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FREQUENT_LOCATION"])
              {
                uint64_t v19 = 17;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RECENT_HISTORY"])
              {
                uint64_t v19 = 18;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FAVORITE_PLACE"])
              {
                uint64_t v19 = 19;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_PARKED_CAR"])
              {
                uint64_t v19 = 20;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESTAURANT_RESERVATION"])
              {
                uint64_t v19 = 21;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RIDESHARING"])
              {
                uint64_t v19 = 22;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CARPLAY_LOW_ENERGY"])
              {
                uint64_t v19 = 23;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESUME_ROUTE"])
              {
                uint64_t v19 = 24;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_APP_CONNECTION"])
              {
                uint64_t v19 = 25;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOTEL"])
              {
                uint64_t v19 = 26;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CAR_RENTAL"])
              {
                uint64_t v19 = 27;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TRAVEL_FLIGHT"])
              {
                uint64_t v19 = 28;
              }
              else if ([v18 isEqualToString:@"AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TICKETED_EVENT"])
              {
                uint64_t v19 = 29;
              }
              else
              {
                uint64_t v19 = 0;
              }

              uint64_t v20 = [a1 resultSubtypeForACResultSubtype:v19];
              long long v21 = [v10 objectAtIndexedSubscript:2];
              uint64_t v22 = [v21 integerValue];

              uint64_t v11 = [[GEOSortPriorityMappingEntry alloc] initWithPriority:v22 resultType:v17 resultSubtype:v20];
              [v26 addObject:v11];
LABEL_98:
            }
          }

          continue;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v6)
      {
LABEL_102:

        long long v23 = (void *)[objc_alloc((Class)a1) initWithEntries:v26];
        id v3 = v25;
        goto LABEL_104;
      }
    }
  }
  long long v23 = 0;
LABEL_104:

  return v23;
}

+ (int64_t)resultTypeForACResultType:(int)a3
{
  if (a3 >= 0xB) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (int64_t)resultSubtypeForACResultSubtype:(int)a3
{
  if (a3 >= 0x1E) {
    return 1;
  }
  else {
    return a3;
  }
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
}

@end