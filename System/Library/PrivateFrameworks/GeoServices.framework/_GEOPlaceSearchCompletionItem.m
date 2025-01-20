@interface _GEOPlaceSearchCompletionItem
- (BOOL)getCoordinate:(id *)a3;
- (BOOL)hasDisambiguationRadiusMeters;
- (BOOL)hasQueryAcceleratorAffordanceEnabled;
- (BOOL)hasSortPriority;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsOfflineDownload;
- (GEOCollectionResult)collectionResult;
- (GEODirectionIntent)directionIntent;
- (GEOMapItem)geoMapItem;
- (GEOMapItemIdentifier)identifier;
- (GEOPDAutocompleteEntry)_placeDataAutocompleteEntry;
- (GEOPDAutocompleteEntry)entry;
- (GEOPublisherResult)publisherResult;
- (GEOResolvedItem)clientResolved;
- (GEORetainedSearchMetadata)retainedSearchMetadata;
- (GEOSearchCategory)searchCategory;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (GEOStyleAttributes)iconStyleAttributes;
- (NSArray)displayLines;
- (NSArray)resultRefinements;
- (NSData)entryMetadata;
- (NSData)metadata;
- (NSString)queryAcceleratorCompletionString;
- (_GEOPlaceSearchCompletionItem)initWithEntry:(id)a3 traits:(id)a4 entryListIndex:(int)a5 entryIndex:(int)a6 mapItems:(id)a7 collections:(id)a8 publishers:(id)a9;
- (float)disambiguationRadiusMeters;
- (id)highlightsForLine:(unint64_t)a3;
- (id)queryLine;
- (int)placeType;
- (int64_t)autocompleteCellType;
- (int64_t)entryTapBehavior;
- (int64_t)sortPriority;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation _GEOPlaceSearchCompletionItem

- (_GEOPlaceSearchCompletionItem)initWithEntry:(id)a3 traits:(id)a4 entryListIndex:(int)a5 entryIndex:(int)a6 mapItems:(id)a7 collections:(id)a8 publishers:(id)a9
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v127 = a3;
  id v125 = a4;
  id v124 = a7;
  id v123 = a8;
  id v122 = a9;
  v164.receiver = self;
  v164.super_class = (Class)_GEOPlaceSearchCompletionItem;
  v126 = [(_GEOPlaceSearchCompletionItem *)&v164 init];
  v16 = 0;
  if (!v127 || !v126) {
    goto LABEL_116;
  }
  p_entry = (id *)&v126->_entry;
  objc_storeStrong((id *)&v126->_entry, a3);
  uint64_t v18 = [v125 copy];
  traits = v126->_traits;
  v126->_traits = (GEOMapServiceTraits *)v18;

  v126->_entryListIndex = a5;
  v126->_entryIndex = a6;
  if ([v127 type] == 1 && objc_msgSend(v127, "hasBusiness"))
  {
    v20 = [v127 business];
    if ((([v20 hasMuid] & 1) != 0 || objc_msgSend(v20, "hasMapsId"))
      && [v124 count])
    {
      if ([v20 hasMapsId])
      {
        v21 = [GEOMapItemIdentifier alloc];
        v22 = [v20 mapsId];
        v23 = [(GEOMapItemIdentifier *)v21 initWithMapsIdentifier:v22];
      }
      else
      {
        v23 = 0;
      }
      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v25 = v124;
      uint64_t v27 = [v25 countByEnumeratingWithState:&v160 objects:v169 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v161;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v161 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v160 + 1) + 8 * i);
            if (!v23
              || ([*(id *)(*((void *)&v160 + 1) + 8 * i) _identifier],
                  v31 = objc_claimAutoreleasedReturnValue(),
                  int v32 = [v31 isEqualToGEOMapItemIdentifier:v23],
                  v31,
                  !v32))
            {
              if (![v20 hasMuid]) {
                continue;
              }
              uint64_t v33 = [v30 _muid];
              if (v33 != [v20 muid]) {
                continue;
              }
            }
            v26 = v30;
            goto LABEL_26;
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v160 objects:v169 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      if (![v20 hasPlace])
      {
LABEL_28:

        goto LABEL_29;
      }
      v24 = [_GEOPlaceDataItem alloc];
      v23 = [v127 business];
      id v25 = [(GEOMapItemIdentifier *)v23 place];
      v26 = [(_GEOPlaceDataItem *)v24 initWithPlaceData:v25];
LABEL_26:
      mapIteuint64_t m = v126->_mapItem;
      v126->_mapIteuint64_t m = (GEOMapItem *)v26;
    }
    goto LABEL_28;
  }
LABEL_29:
  if ([v127 type] == 3 && objc_msgSend(v127, "hasCategory"))
  {
    v35 = [[GEOSearchCategory alloc] initWithAutocompleteEntry:v127];
    category = v126->_category;
    v126->_category = v35;
  }
  if ([v127 type] == 2)
  {
    v37 = [v127 address];
    if ([v37 hasOpaqueGeoId])
    {

LABEL_36:
      v40 = [v127 address];
      if ([v40 hasMapsId])
      {
        v41 = [GEOMapItemIdentifier alloc];
        v42 = [v127 address];
        v43 = [v42 mapsId];
        v44 = [(GEOMapItemIdentifier *)v41 initWithMapsIdentifier:v43];
      }
      else
      {
        v44 = 0;
      }

      long long v158 = 0u;
      long long v159 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      id v45 = v124;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v156 objects:v168 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v157;
        while (2)
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v157 != v47) {
              objc_enumerationMutation(v45);
            }
            v49 = *(void **)(*((void *)&v156 + 1) + 8 * j);
            if (v44)
            {
              v50 = [*(id *)(*((void *)&v156 + 1) + 8 * j) _identifier];
              char v51 = [v50 isEqualToGEOMapItemIdentifier:v44];

              if (v51)
              {
LABEL_53:
                objc_storeStrong((id *)&v126->_mapItem, v49);
                goto LABEL_54;
              }
            }
            v52 = [v127 address];
            if ([v52 hasOpaqueGeoId])
            {
              uint64_t v53 = [v49 _muid];
              v54 = [v127 address];
              LOBYTE(v53) = v53 == [v54 opaqueGeoId];

              if (v53) {
                goto LABEL_53;
              }
            }
            else
            {
            }
          }
          uint64_t v46 = [v45 countByEnumeratingWithState:&v156 objects:v168 count:16];
          if (v46) {
            continue;
          }
          break;
        }
      }
LABEL_54:

      goto LABEL_55;
    }
    v38 = [v127 address];
    int v39 = [v38 hasMapsId];

    if (v39) {
      goto LABEL_36;
    }
  }
LABEL_55:
  if ([v127 type] == 8)
  {
    v55 = [v127 collection];
    v56 = [v55 collectionId];
    BOOL v57 = v56 == 0;

    if (!v57)
    {
      v58 = [GEOMapItemIdentifier alloc];
      v59 = [v127 collection];
      v60 = [v59 collectionId];
      v61 = [(GEOMapItemIdentifier *)v58 initWithMapsIdentifier:v60];

      uint64_t v150 = 0;
      v151 = &v150;
      uint64_t v152 = 0x3032000000;
      v153 = __Block_byref_object_copy__19;
      v154 = __Block_byref_object_dispose__19;
      id v155 = 0;
      v147[0] = MEMORY[0x1E4F143A8];
      v147[1] = 3221225472;
      v147[2] = __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke;
      v147[3] = &unk_1E53DEB30;
      v62 = v61;
      v148 = v62;
      v149 = &v150;
      [v123 enumerateObjectsUsingBlock:v147];
      if (v151[5])
      {
        v63 = [GEOCollectionResult alloc];
        uint64_t v64 = [(GEOCollectionResult *)v63 initWithCollectionResult:v151[5]];
        collectionResult = v126->_collectionResult;
        v126->_collectionResult = (GEOCollectionResult *)v64;
      }
      v66 = [(GEOCollectionResult *)v126->_collectionResult collection];
      BOOL v67 = v66 == 0;

      _Block_object_dispose(&v150, 8);
      if (v67) {
        goto LABEL_69;
      }
    }
  }
  if ([v127 type] != 9) {
    goto LABEL_119;
  }
  v68 = [v127 publisher];
  v69 = [v68 publisherId];
  BOOL v70 = v69 == 0;

  if (v70) {
    goto LABEL_119;
  }
  v71 = [GEOMapItemIdentifier alloc];
  v72 = [v127 publisher];
  v73 = [v72 publisherId];
  v74 = [(GEOMapItemIdentifier *)v71 initWithMapsIdentifier:v73];

  uint64_t v150 = 0;
  v151 = &v150;
  uint64_t v152 = 0x3032000000;
  v153 = __Block_byref_object_copy__19;
  v154 = __Block_byref_object_dispose__19;
  id v155 = 0;
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke_2;
  v144[3] = &unk_1E53DEB30;
  v75 = v74;
  v145 = v75;
  v146 = &v150;
  [v122 enumerateObjectsUsingBlock:v144];
  if (v151[5])
  {
    v76 = [GEOPublisherResult alloc];
    uint64_t v77 = [(GEOPublisherResult *)v76 initWithPublisherResult:v151[5]];
    publisherResult = v126->_publisherResult;
    v126->_publisherResult = (GEOPublisherResult *)v77;
  }
  v79 = [(GEOPublisherResult *)v126->_publisherResult publisher];
  BOOL v80 = v79 == 0;

  _Block_object_dispose(&v150, 8);
  if (v80)
  {
LABEL_69:
    v16 = 0;
  }
  else
  {
LABEL_119:
    if ([v127 type] == 5 && objc_msgSend(v127, "hasOfflineArea"))
    {
      v81 = [v127 offlineArea];
      if ([v81 hasMapsId])
      {
        v82 = [GEOMapItemIdentifier alloc];
        v83 = [v127 offlineArea];
        v84 = [v83 mapsId];
        v85 = [(GEOMapItemIdentifier *)v82 initWithMapsIdentifier:v84];
      }
      else
      {
        v85 = 0;
      }

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v86 = v124;
      uint64_t v87 = [v86 countByEnumeratingWithState:&v140 objects:v167 count:16];
      if (v87)
      {
        uint64_t v88 = *(void *)v141;
        while (2)
        {
          for (uint64_t k = 0; k != v87; ++k)
          {
            if (*(void *)v141 != v88) {
              objc_enumerationMutation(v86);
            }
            v90 = *(void **)(*((void *)&v140 + 1) + 8 * k);
            if (v85)
            {
              v91 = [*(id *)(*((void *)&v140 + 1) + 8 * k) _identifier];
              char v92 = [v91 isEqualToGEOMapItemIdentifier:v85];

              if (v92)
              {
LABEL_85:
                objc_storeStrong((id *)&v126->_mapItem, v90);
                goto LABEL_86;
              }
            }
            v93 = [v127 offlineArea];
            if ([v93 hasFeatureId])
            {
              uint64_t v94 = [v90 _muid];
              v95 = [v127 offlineArea];
              LOBYTE(v94) = v94 == [v95 featureId];

              if (v94) {
                goto LABEL_85;
              }
            }
            else
            {
            }
          }
          uint64_t v87 = [v86 countByEnumeratingWithState:&v140 objects:v167 count:16];
          if (v87) {
            continue;
          }
          break;
        }
      }
LABEL_86:

      v96 = [v127 offlineArea];
      if ([v96 hasAvailableForDownload])
      {
        v97 = [v127 offlineArea];
        v126->_supportsOfflineDownload = [v97 availableForDownload];
      }
      else
      {
        v126->_supportsOfflineDownload = 1;
      }
    }
    v98 = [MEMORY[0x1E4F1CA48] array];
    if ([*p_entry hasHighlightMain])
    {
      v99 = [*p_entry highlightMain];
      int v100 = [v99 hasLine];

      if (v100)
      {
        v101 = [*p_entry highlightMain];
        [v98 addObject:v101];
      }
    }
    if ([*p_entry hasHighlightExtra])
    {
      v102 = [*p_entry highlightExtra];
      int v103 = [v102 hasLine];

      if (v103)
      {
        v104 = [*p_entry highlightExtra];
        [v98 addObject:v104];
      }
    }
    v129 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v98, "count"));
    v128 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v98, "count"));
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    obuint64_t j = v98;
    uint64_t v105 = [obj countByEnumeratingWithState:&v136 objects:v166 count:16];
    if (v105)
    {
      uint64_t v131 = *(void *)v137;
      do
      {
        for (uint64_t m = 0; m != v105; ++m)
        {
          if (*(void *)v137 != v131) {
            objc_enumerationMutation(obj);
          }
          v107 = *(void **)(*((void *)&v136 + 1) + 8 * m);
          if ([v107 hasLine])
          {
            v108 = [v107 line];
            [(NSArray *)v129 addObject:v108];

            v109 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v107, "spansCount"));
            long long v134 = 0u;
            long long v135 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            v110 = [v107 spans];
            uint64_t v111 = [v110 countByEnumeratingWithState:&v132 objects:v165 count:16];
            if (v111)
            {
              uint64_t v112 = *(void *)v133;
              do
              {
                for (uint64_t n = 0; n != v111; ++n)
                {
                  if (*(void *)v133 != v112) {
                    objc_enumerationMutation(v110);
                  }
                  v114 = *(void **)(*((void *)&v132 + 1) + 8 * n);
                  if ([v114 hasStartIndex]
                    && [v114 hasLength])
                  {
                    unsigned int v115 = [v114 startIndex];
                    unsigned int v116 = [v114 length];
                    v117 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v115, v116);
                    [v109 addObject:v117];
                  }
                }
                uint64_t v111 = [v110 countByEnumeratingWithState:&v132 objects:v165 count:16];
              }
              while (v111);
            }

            [(NSArray *)v128 addObject:v109];
          }
        }
        uint64_t v105 = [obj countByEnumeratingWithState:&v136 objects:v166 count:16];
      }
      while (v105);
    }

    displayLines = v126->_displayLines;
    v126->_displayLines = v129;
    v119 = v129;

    lineHighlights = v126->_lineHighlights;
    v126->_lineHighlights = v128;

    v16 = v126;
  }
LABEL_116:

  return v16;
}

- (id)highlightsForLine:(unint64_t)a3
{
  if ([(NSArray *)self->_lineHighlights count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_lineHighlights objectAtIndex:a3];
  }

  return v5;
}

- (id)queryLine
{
  if ([(GEOPDAutocompleteEntry *)self->_entry hasQuery])
  {
    v3 = [(GEOPDAutocompleteEntry *)self->_entry query];
    int v4 = [v3 hasCompletion];

    if (v4)
    {
      v5 = [(GEOPDAutocompleteEntry *)self->_entry query];
      id v6 = [v5 completion];
LABEL_8:
      v8 = v6;
      goto LABEL_9;
    }
  }
  v5 = [(NSArray *)self->_displayLines componentsJoinedByString:@" "];
  if ([v5 length])
  {
    id v6 = v5;
    v5 = v6;
    goto LABEL_8;
  }
  category = self->_category;
  if (category)
  {
    id v6 = [(GEOSearchCategory *)category displayString];
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (GEOMapItem)geoMapItem
{
  return self->_mapItem;
}

- (GEOSearchCategory)searchCategory
{
  return self->_category;
}

- (GEOResolvedItem)clientResolved
{
  if ([(GEOPDAutocompleteEntry *)self->_entry type] == 6
    && ([(GEOPDAutocompleteEntry *)self->_entry clientResolved],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v4 = (void *)v3;
    v5 = [GEOResolvedItem alloc];
    id v6 = [(GEOPDAutocompleteEntry *)self->_entry clientResolved];
    v7 = [(GEOResolvedItem *)v5 initWithAutocompleteResolvedItem:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GEODirectionIntent)directionIntent
{
  if ([(GEOPDAutocompleteEntry *)self->_entry type] == 7
    && ([(GEOPDAutocompleteEntry *)self->_entry directionIntent],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 directionIntent],
        int v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    v5 = [[GEODirectionIntent alloc] initWithDirectionIntent:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  uint64_t v3 = [(GEOPDAutocompleteEntry *)self->_entry retainSearch];
  if (v3)
  {
    int v4 = [GEORetainedSearchMetadata alloc];
    v5 = [(GEOPDAutocompleteEntry *)self->_entry retainSearch];
    id v6 = [(GEORetainedSearchMetadata *)v4 initWithRetainedSearchMetadata:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasSortPriority
{
  return [(GEOPDAutocompleteEntry *)self->_entry hasSortPriority];
}

- (int64_t)sortPriority
{
  return [(GEOPDAutocompleteEntry *)self->_entry sortPriority];
}

- (int64_t)entryTapBehavior
{
  v2 = [(GEOPDAutocompleteEntry *)self->_entry query];
  int v3 = [v2 tapBehavior];

  return v3 != 0;
}

- (int64_t)autocompleteCellType
{
  uint64_t v2 = [(GEOPDAutocompleteEntry *)self->_entry autocompleteResultCellType]
     - 1;
  if (v2 < 4) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  int v3 = [(GEOPDAutocompleteEntry *)self->_entry serverResultScoreMetadata];
  if (v3)
  {
    int v4 = [GEOServerResultScoreMetadata alloc];
    v5 = [(GEOPDAutocompleteEntry *)self->_entry serverResultScoreMetadata];
    id v6 = [(GEOServerResultScoreMetadata *)v4 initWithGEOServerResultScoreMetadata:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasQueryAcceleratorAffordanceEnabled
{
  return [(GEOPDAutocompleteEntry *)self->_entry enableQueryAcceleratorAffordance];
}

- (NSString)queryAcceleratorCompletionString
{
  return [(GEOPDAutocompleteEntry *)self->_entry queryAcceleratorCompletionString];
}

- (BOOL)getCoordinate:(id *)a3
{
  mapIteuint64_t m = self->_mapItem;
  if (mapItem)
  {
    [(GEOMapItem *)mapItem coordinate];
    if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
    {
      if (a3)
      {
        [(GEOMapItem *)self->_mapItem coordinate];
        a3->var0 = v8;
        a3->var1 = v9;
      }
LABEL_13:
      LOBYTE(v10) = 1;
      return v10;
    }
  }
  if ([(GEOPDAutocompleteEntry *)self->_entry type] != 2)
  {
LABEL_14:
    LOBYTE(v10) = 0;
    return v10;
  }
  BOOL v10 = [(GEOPDAutocompleteEntry *)self->_entry hasAddress];
  if (v10)
  {
    v11 = [(GEOPDAutocompleteEntry *)self->_entry address];
    int v12 = [v11 hasCenter];

    if (v12)
    {
      if (a3)
      {
        v13 = [(GEOPDAutocompleteEntry *)self->_entry address];
        v14 = [v13 center];
        [v14 coordinate];
        a3->var0 = v15;
        a3->var1 = v16;
      }
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  return v10;
}

- (NSData)entryMetadata
{
  return 0;
}

- (NSData)metadata
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(GEOPDAutocompleteEntry *)self->_entry isEqual:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  return [(GEOPDAutocompleteEntry *)self->_entry hash];
}

- (GEOPDAutocompleteEntry)_placeDataAutocompleteEntry
{
  return self->_entry;
}

- (int64_t)type
{
  int v2 = [(GEOPDAutocompleteEntry *)self->_entry type] - 1;
  if (v2 > 8) {
    return 0;
  }
  else {
    return qword_18A632C70[v2];
  }
}

- (GEOMapItemIdentifier)identifier
{
  return (GEOMapItemIdentifier *)[(GEOMapItem *)self->_mapItem _identifier];
}

- (int)placeType
{
  if ([(GEOPDAutocompleteEntry *)self->_entry type] != 2) {
    return 0;
  }
  int v3 = [(GEOPDAutocompleteEntry *)self->_entry address];
  int v4 = _MapItemPlaceTypeForPDPlaceType([v3 placeType]);

  return v4;
}

- (BOOL)hasDisambiguationRadiusMeters
{
  if ([(GEOPDAutocompleteEntry *)self->_entry type] != 2) {
    return 0;
  }
  int v3 = [(GEOPDAutocompleteEntry *)self->_entry address];
  char v4 = [v3 hasDisambiguationRadiusMeters];

  return v4;
}

- (float)disambiguationRadiusMeters
{
  float v3 = 0.0;
  if ([(GEOPDAutocompleteEntry *)self->_entry type] == 2)
  {
    char v4 = [(GEOPDAutocompleteEntry *)self->_entry address];
    int v5 = [v4 hasDisambiguationRadiusMeters];

    if (v5)
    {
      double v6 = [(GEOPDAutocompleteEntry *)self->_entry address];
      [v6 disambiguationRadiusMeters];
      float v3 = v7;
    }
  }
  return v3;
}

- (GEOCollectionResult)collectionResult
{
  return self->_collectionResult;
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (NSArray)resultRefinements
{
  resultRefinements = self->_resultRefinements;
  if (resultRefinements) {
    goto LABEL_4;
  }
  char v4 = [(GEOPDAutocompleteEntry *)self->_entry query];
  uint64_t v5 = [v4 resultRefinementsCount];

  if (v5)
  {
    double v6 = [(GEOPDAutocompleteEntry *)self->_entry query];
    double v7 = [v6 resultRefinements];
    objc_msgSend(v7, "_geo_compactMap:", &__block_literal_global_828);
    double v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    double v9 = self->_resultRefinements;
    self->_resultRefinements = v8;

    resultRefinements = self->_resultRefinements;
LABEL_4:
    BOOL v10 = resultRefinements;
    goto LABEL_5;
  }
  BOOL v10 = 0;
LABEL_5:

  return v10;
}

- (GEOStyleAttributes)iconStyleAttributes
{
  int v2 = [(GEOPDAutocompleteEntry *)self->_entry query];
  float v3 = [v2 styleAttributes];

  return (GEOStyleAttributes *)v3;
}

- (NSArray)displayLines
{
  return self->_displayLines;
}

- (GEOPDAutocompleteEntry)entry
{
  return self->_entry;
}

- (BOOL)supportsOfflineDownload
{
  return self->_supportsOfflineDownload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRefinements, 0);
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_collectionResult, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_lineHighlights, 0);
  objc_storeStrong((id *)&self->_displayLines, 0);
  objc_storeStrong((id *)&self->_entry, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

@end