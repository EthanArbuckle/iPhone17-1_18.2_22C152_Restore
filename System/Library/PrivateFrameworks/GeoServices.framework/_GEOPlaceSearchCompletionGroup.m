@interface _GEOPlaceSearchCompletionGroup
- (BOOL)enableMapsSuggestServerReranking;
- (BOOL)enforceServerResultsOrder;
- (BOOL)isSectionForClientOnlyResults;
- (BOOL)shouldInterleaveClientResults;
- (NSArray)excludedClientResultTypes;
- (NSArray)includedClientResultTypes;
- (NSArray)items;
- (NSString)localizedSectionHeader;
- (_GEOPlaceSearchCompletionGroup)initWithSection:(id)a3 traits:(id)a4 entryListIndex:(int)a5 mapItems:(id)a6 collections:(id)a7 publishers:(id)a8;
@end

@implementation _GEOPlaceSearchCompletionGroup

- (_GEOPlaceSearchCompletionGroup)initWithSection:(id)a3 traits:(id)a4 entryListIndex:(int)a5 mapItems:(id)a6 collections:(id)a7 publishers:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v14 = (id *)a3;
  id v47 = a4;
  id v46 = a6;
  id v45 = a7;
  id v44 = a8;
  v52.receiver = self;
  v52.super_class = (Class)_GEOPlaceSearchCompletionGroup;
  v15 = [(_GEOPlaceSearchCompletionGroup *)&v52 init];
  v16 = v15;
  v17 = 0;
  if (v14 && v15)
  {
    v18 = -[GEOPDAutocompleteResultSection name](v14);
    uint64_t v19 = [v18 copy];
    localizedSectionHeader = v16->_localizedSectionHeader;
    v42 = v16;
    v16->_localizedSectionHeader = (NSString *)v19;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v43 = (uint64_t)v14;
    v21 = -[GEOPDAutocompleteResultSection entries](v14);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      v25 = 0;
      uint64_t v26 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(v21);
          }
          v28 = [[_GEOPlaceSearchCompletionItem alloc] initWithEntry:*(void *)(*((void *)&v48 + 1) + 8 * i) traits:v47 entryListIndex:v11 entryIndex:v24 + i mapItems:v46 collections:v45 publishers:v44];
          if (v28)
          {
            if (!v25)
            {
              v25 = [MEMORY[0x1E4F1CA48] array];
            }
            [v25 addObject:v28];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v53 count:16];
        uint64_t v24 = (v24 + i);
      }
      while (v23);
    }
    else
    {
      v25 = 0;
    }

    v16 = v42;
    if ([v25 count]) {
      objc_storeStrong((id *)&v42->_items, v25);
    }
    v14 = (id *)v43;
    v42->_shouldInterleaveClientResults = *(unsigned char *)(v43 + 143);
    v42->_enforceServerResultsOrder = *(unsigned char *)(v43 + 141);
    v42->_enableMapsSuggestServerReranking = *(unsigned char *)(v43 + 140);
    v42->_isSectionForClientOnlyResults = *(unsigned char *)(v43 + 142);
    id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
    -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](v43);
    v30 = (void *)[v29 initWithCapacity:*(void *)(v43 + 80)];
    -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](v43);
    if (*(void *)(v43 + 80))
    {
      unint64_t v31 = 0;
      do
      {
        v32 = objc_msgSend(NSNumber, "numberWithInt:", -[GEOPDAutocompleteResultSection includedClientResultTypeAtIndex:](v43, v31));
        [v30 addObject:v32];

        ++v31;
        -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](v43);
      }
      while (v31 < *(void *)(v43 + 80));
    }
    if ([v30 count])
    {
      uint64_t v33 = [v30 copy];
      includedClientResultTypes = v42->_includedClientResultTypes;
      v42->_includedClientResultTypes = (NSArray *)v33;
    }
    id v35 = objc_alloc(MEMORY[0x1E4F1CA48]);
    -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](v43);
    v36 = (void *)[v35 initWithCapacity:*(void *)(v43 + 56)];
    -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](v43);
    if (*(void *)(v43 + 56))
    {
      unint64_t v37 = 0;
      do
      {
        v38 = objc_msgSend(NSNumber, "numberWithInt:", -[GEOPDAutocompleteResultSection excludedClientResultTypeAtIndex:](v43, v37));
        [v36 addObject:v38];

        ++v37;
        -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](v43);
      }
      while (v37 < *(void *)(v43 + 56));
    }
    if ([v36 count])
    {
      uint64_t v39 = [v36 copy];
      excludedClientResultTypes = v42->_excludedClientResultTypes;
      v42->_excludedClientResultTypes = (NSArray *)v39;
    }
    v17 = v42;
  }
  return v17;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)localizedSectionHeader
{
  return self->_localizedSectionHeader;
}

- (BOOL)shouldInterleaveClientResults
{
  return self->_shouldInterleaveClientResults;
}

- (BOOL)enforceServerResultsOrder
{
  return self->_enforceServerResultsOrder;
}

- (BOOL)enableMapsSuggestServerReranking
{
  return self->_enableMapsSuggestServerReranking;
}

- (BOOL)isSectionForClientOnlyResults
{
  return self->_isSectionForClientOnlyResults;
}

- (NSArray)includedClientResultTypes
{
  return self->_includedClientResultTypes;
}

- (NSArray)excludedClientResultTypes
{
  return self->_excludedClientResultTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedClientResultTypes, 0);
  objc_storeStrong((id *)&self->_includedClientResultTypes, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_localizedSectionHeader, 0);
}

@end