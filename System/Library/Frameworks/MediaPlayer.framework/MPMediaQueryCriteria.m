@interface MPMediaQueryCriteria
- (BOOL)excludesEntitiesWithBlankNames;
- (BOOL)ignoreRestrictionsPredicates;
- (BOOL)ignoreSystemFilterPredicates;
- (BOOL)includeEntitiesWithBlankNames;
- (BOOL)includeNonLibraryEntities;
- (BOOL)isEqual:(id)a3;
- (BOOL)specifiesPlaylistItems;
- (MPMediaQueryCriteria)init;
- (NSArray)orderingProperties;
- (NSDictionary)orderingDirectionMappings;
- (NSSet)collectionPropertiesToFetch;
- (NSSet)filterPredicates;
- (NSSet)itemPropertiesToFetch;
- (id)ML3CollectionsQueryInLibrary:(id)a3;
- (id)ML3ItemsQueryInLibrary:(id)a3;
- (id)ML3ItemsQueryInLibrary:(id)a3 orderingTerms:(id)a4 nameBlankProperty:(id)a5;
- (id)ML3OrderingTermsForGroupingType:(int64_t)a3;
- (id)ML3OrderingTermsForMPOrderingProperties:(id)a3 directionalityMapping:(id)a4 entityClass:(Class)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)predicateForProperty:(id)a3;
- (int64_t)groupingType;
- (unint64_t)entityLimit;
- (unint64_t)entityOrder;
- (unint64_t)hash;
- (void)addFilterPredicate:(id)a3;
- (void)addFilterPredicates:(id)a3;
- (void)removeFilterPredicate:(id)a3;
- (void)removePredicatesForProperty:(id)a3;
- (void)setCollectionPropertiesToFetch:(id)a3;
- (void)setEntityLimit:(unint64_t)a3;
- (void)setEntityOrder:(unint64_t)a3;
- (void)setFilterPredicates:(id)a3;
- (void)setGroupingType:(int64_t)a3;
- (void)setIgnoreRestrictionsPredicates:(BOOL)a3;
- (void)setIgnoreSystemFilterPredicates:(BOOL)a3;
- (void)setIncludeEntitiesWithBlankNames:(BOOL)a3;
- (void)setIncludeNonLibraryEntities:(BOOL)a3;
- (void)setItemPropertiesToFetch:(id)a3;
- (void)setOrderingDirectionMappings:(id)a3;
- (void)setOrderingProperties:(id)a3;
@end

@implementation MPMediaQueryCriteria

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  BOOL v9 = [v4 isMemberOfClass:objc_opt_class()]
    && *((void *)v4 + 2) == self->_entityOrder
    && *((void *)v4 + 3) == self->_groupingType
    && *((void *)v4 + 4) == self->_entityLimit
    && ((v5 = (NSArray *)*((void *)v4 + 5), v5 == self->_orderingProperties)
     || -[NSArray isEqualToArray:](v5, "isEqualToArray:"))
    && ((v6 = (NSMutableSet *)*((void *)v4 + 1), v6 == self->_filterPredicates)
     || -[NSMutableSet isEqualToSet:](v6, "isEqualToSet:"))
    && ((v7 = (NSSet *)*((void *)v4 + 6), v7 == self->_itemPropertiesToFetch)
     || -[NSSet isEqualToSet:](v7, "isEqualToSet:"))
    && ((v8 = (NSSet *)*((void *)v4 + 7), v8 == self->_collectionPropertiesToFetch)
     || -[NSSet isEqualToSet:](v8, "isEqualToSet:"))
    && v4[64] == self->_useSections
    && v4[65] == self->_ignoreSystemFilterPredicates
    && v4[66] == self->_ignoreRestrictionsPredicates
    && v4[67] == self->_includeNonLibraryEntities
    && v4[68] == self->_includeEntitiesWithBlankNames
    && (NSDictionary *)*((void *)v4 + 9) == self->_orderingDirectionMappings;

  return v9;
}

- (unint64_t)hash
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_entityLimit + 29 * self->_groupingType;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v4 = self->_orderingProperties;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 ^= [*(id *)(*((void *)&v37 + 1) + 8 * v8++) hash];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v6);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  BOOL v9 = self->_filterPredicates;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        v3 ^= [*(id *)(*((void *)&v33 + 1) + 8 * v13++) hash];
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v14 = self->_itemPropertiesToFetch;
  uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        v3 ^= [*(id *)(*((void *)&v29 + 1) + 8 * v18++) hash];
      }
      while (v16 != v18);
      uint64_t v16 = [(NSSet *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v16);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = self->_collectionPropertiesToFetch;
  uint64_t v20 = [(NSSet *)v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        v3 ^= objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v23++), "hash", (void)v25);
      }
      while (v21 != v23);
      uint64_t v21 = [(NSSet *)v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v21);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderingDirectionMappings, 0);
  objc_storeStrong((id *)&self->_collectionPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_itemPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_orderingProperties, 0);

  objc_storeStrong((id *)&self->_filterPredicates, 0);
}

- (id)ML3OrderingTermsForGroupingType:(int64_t)a3
{
  v41[6] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0;
  switch(a3)
  {
    case 0:
      v14 = [(MPMediaQueryCriteria *)self predicateForProperty:@"mediaType"];
      uint64_t v15 = [v14 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v17 = [(MPMediaQueryCriteria *)self predicateForProperty:@"mediaType"];
        uint64_t v18 = [v17 value];
        uint64_t v19 = [v18 integerValue];

        if ((v19 & 0xFFFFFFFFFFFFFEFFLL) == 0x200) {
          goto LABEL_7;
        }
        long long v27 = [(MPMediaQueryCriteria *)self predicateForProperty:@"isITunesU"];
        long long v28 = [v27 value];
        uint64_t v29 = [v28 integerValue];

        if (v29 || (v19 & 1) == 0 && (v19 & 0x140A) != 0 && (v19 & 0xFFFFFFFFFFFFEAF5) == 0)
        {
          uint64_t v4 = [MEMORY[0x1E4F79B50] podcastsEpisodesDefaultOrderingTerms];
          goto LABEL_37;
        }
      }
      long long v30 = [(MPMediaQueryCriteria *)self predicateForProperty:@"albumPID"];
      if (v30)
      {
      }
      else
      {
        long long v31 = [(MPMediaQueryCriteria *)self predicateForProperty:@"albumTitle"];

        if (!v31) {
          goto LABEL_36;
        }
      }
      uint64_t v4 = [MEMORY[0x1E4F79B50] albumAllArtistsDefaultOrderingTerms];
      goto LABEL_37;
    case 1:
    case 10:
      uint64_t v4 = [MEMORY[0x1E4F79B50] albumsDefaultOrderingTerms];
      goto LABEL_37;
    case 2:
      uint64_t v4 = [MEMORY[0x1E4F79B50] artistsDefaultOrderingTerms];
      goto LABEL_37;
    case 3:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F793E0]];
      v39[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F793E8]];
      v39[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79410]];
      v39[2] = v7;
      uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v21 = v39;
      goto LABEL_25;
    case 4:
      uint64_t v4 = [MEMORY[0x1E4F79B50] composersDefaultOrderingTerms];
      goto LABEL_37;
    case 5:
      uint64_t v4 = [MEMORY[0x1E4F79B50] genresDefaultOrderingTerms];
      goto LABEL_37;
    case 6:
      break;
    case 7:
      uint64_t v4 = [MEMORY[0x1E4F79B50] podcastsDefaultOrderingTerms];
      goto LABEL_37;
    case 8:
    case 9:
LABEL_7:
      uint64_t v4 = [MEMORY[0x1E4F79B50] TVShowEpisodesDefaultOrderingTerms];
      goto LABEL_37;
    case 12:
    case 21:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79418] direction:2];
      v41[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79408]];
      v41[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79410]];
      v41[2] = v7;
      uint64_t v8 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79548]];
      v41[3] = v8;
      BOOL v9 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79A18]];
      v41[4] = v9;
      uint64_t v10 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F799F8]];
      v41[5] = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = v41;
      goto LABEL_14;
    case 13:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79510] direction:2];
      v40[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79408]];
      v40[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79410]];
      v40[2] = v7;
      uint64_t v8 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79548]];
      v40[3] = v8;
      BOOL v9 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79A18]];
      v40[4] = v9;
      uint64_t v10 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F799F8]];
      v40[5] = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = v40;
LABEL_14:
      unint64_t v3 = [v11 arrayWithObjects:v12 count:6];
      goto LABEL_20;
    case 14:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79510] direction:2];
      v38[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F793E0]];
      v38[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F793E8]];
      v38[2] = v7;
      uint64_t v8 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79410]];
      v38[3] = v8;
      BOOL v9 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79548]];
      v38[4] = v9;
      uint64_t v10 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79A18]];
      v38[5] = v10;
      uint64_t v22 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F799F8]];
      v38[6] = v22;
      uint64_t v23 = (void *)MEMORY[0x1E4F1C978];
      v24 = v38;
      goto LABEL_19;
    case 15:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79510] direction:2];
      v36[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F794E8]];
      v36[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F794F0]];
      v36[2] = v7;
      uint64_t v8 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79408]];
      v36[3] = v8;
      BOOL v9 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F799F8]];
      v36[4] = v9;
      long long v25 = (void *)MEMORY[0x1E4F1C978];
      long long v26 = v36;
      goto LABEL_22;
    case 16:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79510] direction:2];
      v34[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F795F8]];
      v34[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F795E8]];
      v34[2] = v7;
      uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v21 = v34;
      goto LABEL_25;
    case 17:
    case 22:
      uint64_t v4 = [MEMORY[0x1E4F79B50] albumsByAlbumArtistDefaultOrderingTerms];
      goto LABEL_37;
    case 18:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79520] direction:2];
      v37[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F793E0]];
      v37[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F793E8]];
      v37[2] = v7;
      uint64_t v8 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79410]];
      v37[3] = v8;
      BOOL v9 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79548]];
      v37[4] = v9;
      uint64_t v10 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79A18]];
      v37[5] = v10;
      uint64_t v22 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F799F8]];
      v37[6] = v22;
      uint64_t v23 = (void *)MEMORY[0x1E4F1C978];
      v24 = v37;
LABEL_19:
      unint64_t v3 = [v23 arrayWithObjects:v24 count:7];

LABEL_20:
      goto LABEL_23;
    case 19:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79520] direction:2];
      v35[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F794E8]];
      v35[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F794F0]];
      v35[2] = v7;
      uint64_t v8 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79408]];
      v35[3] = v8;
      BOOL v9 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F799F8]];
      v35[4] = v9;
      long long v25 = (void *)MEMORY[0x1E4F1C978];
      long long v26 = v35;
LABEL_22:
      unint64_t v3 = [v25 arrayWithObjects:v26 count:5];
LABEL_23:

      goto LABEL_26;
    case 20:
      uint64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79520] direction:2];
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F79B10], "orderingTermWithProperty:", *MEMORY[0x1E4F795F8], v5);
      v33[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F795E8]];
      v33[2] = v7;
      uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v21 = v33;
LABEL_25:
      unint64_t v3 = [v20 arrayWithObjects:v21 count:3];
LABEL_26:

      break;
    default:
LABEL_36:
      uint64_t v4 = [MEMORY[0x1E4F79B50] defaultOrderingTerms];
LABEL_37:
      unint64_t v3 = (void *)v4;
      break;
  }

  return v3;
}

- (id)ML3ItemsQueryInLibrary:(id)a3 orderingTerms:(id)a4 nameBlankProperty:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v40 = a4;
  id v43 = a5;
  v48 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v42 = self;
  uint64_t v8 = [(MPMediaQueryCriteria *)self filterPredicates];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    char v12 = 0;
    uint64_t v13 = *(void *)v50;
    uint64_t v44 = *MEMORY[0x1E4F79150];
    uint64_t v45 = *MEMORY[0x1E4F79190];
    uint64_t v46 = *MEMORY[0x1E4F792D0];
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v15 property];
          if ([v16 isEqualToString:@"playlistPersistentID"])
          {
            uint64_t v17 = [v15 value];
            uint64_t v18 = [v17 longLongValue];
            goto LABEL_17;
          }
          if ([v16 isEqualToString:@"name"])
          {
            uint64_t v19 = (void *)MEMORY[0x1E4F79AB8];
            uint64_t v20 = (void *)MEMORY[0x1E4F79AA0];
            uint64_t v21 = [v15 value];
            uint64_t v22 = [v20 predicateWithProperty:v46 equalToValue:v21];
            uint64_t v17 = [v19 anyInLibrary:v47 predicate:v22];

            goto LABEL_16;
          }
          if ([v16 isEqualToString:@"cloudPlaylistUniversalLibraryID"])
          {
            uint64_t v23 = (void *)MEMORY[0x1E4F79AB8];
            v24 = (void *)MEMORY[0x1E4F79AA0];
            long long v25 = [v15 value];
            long long v26 = v24;
            uint64_t v27 = v45;
            goto LABEL_15;
          }
          if ([v16 isEqualToString:@"cloudGlobalID"])
          {
            uint64_t v23 = (void *)MEMORY[0x1E4F79AB8];
            long long v28 = (void *)MEMORY[0x1E4F79AA0];
            long long v25 = [v15 value];
            long long v26 = v28;
            uint64_t v27 = v44;
LABEL_15:
            uint64_t v29 = objc_msgSend(v26, "predicateWithProperty:equalToValue:", v27, v25, v40);
            uint64_t v17 = [v23 anyInLibrary:v47 predicate:v29];

LABEL_16:
            uint64_t v18 = objc_msgSend(v17, "persistentID", v40);
LABEL_17:
            uint64_t v11 = v18;

            char v12 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v16 = objc_msgSend(v15, "ML3PredicateForTrack", v40);
        if (v16) {
          [v48 addObject:v16];
        }
LABEL_21:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (!v10) {
        goto LABEL_25;
      }
    }
  }
  uint64_t v11 = 0;
  char v12 = 0;
LABEL_25:

  if (v43 && [(MPMediaQueryCriteria *)v42 excludesEntitiesWithBlankNames])
  {
    long long v30 = [MEMORY[0x1E4F79B20] predicateWithProperty:v43];
    [v48 addObject:v30];
  }
  long long v31 = objc_msgSend(MEMORY[0x1E4F79A60], "predicateMatchingPredicates:", v48, v40);
  uint64_t v32 = [(MPMediaQueryCriteria *)v42 groupingType];
  uint64_t v33 = v32;
  if (v12)
  {
    long long v34 = v41;
    if (!v41 && v32)
    {
      long long v34 = [(MPMediaQueryCriteria *)v42 ML3OrderingTermsForGroupingType:v32];
    }
    long long v35 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:v11 inLibrary:v47];
    long long v36 = [MEMORY[0x1E4F79B50] containerQueryWithContainer:v35 predicate:v31 orderingTerms:v34];

    if (!v36) {
      goto LABEL_48;
    }
LABEL_42:
    if ([(MPMediaQueryCriteria *)v42 ignoreSystemFilterPredicates]) {
      [v36 setIgnoreSystemFilterPredicates:1];
    }
    if ([(MPMediaQueryCriteria *)v42 ignoreRestrictionsPredicates]) {
      [v36 setIgnoreRestrictionsPredicates:1];
    }
    if (v42->_entityLimit) {
      objc_msgSend(v36, "setLimit:");
    }
    goto LABEL_48;
  }
  long long v34 = v41;
  if (!v41)
  {
    if ([(MPMediaQueryCriteria *)v42 entityOrder] == 2)
    {
      long long v34 = [(MPMediaQueryCriteria *)v42 ML3OrderingTermsForGroupingType:v33];
    }
    else
    {
      long long v34 = 0;
    }
  }
  BOOL v37 = [(MPMediaQueryCriteria *)v42 includeNonLibraryEntities];
  BOOL useSections = v42->_useSections;
  if (v37) {
    [MEMORY[0x1E4F79B50] allItemsQueryWithLibrary:v47 predicate:v31 orderingTerms:v34 usingSections:useSections];
  }
  else {
  long long v36 = [MEMORY[0x1E4F79B50] queryWithLibrary:v47 predicate:v31 orderingTerms:v34 usingSections:useSections];
  }
  if (v36) {
    goto LABEL_42;
  }
LABEL_48:

  return v36;
}

- (id)predicateForProperty:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_filterPredicates;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = objc_msgSend(v9, "property", (void)v13);
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (int64_t)groupingType
{
  return self->_groupingType;
}

- (NSSet)filterPredicates
{
  return &self->_filterPredicates->super;
}

- (BOOL)includeNonLibraryEntities
{
  return self->_includeNonLibraryEntities;
}

- (BOOL)ignoreSystemFilterPredicates
{
  return self->_ignoreSystemFilterPredicates;
}

- (BOOL)ignoreRestrictionsPredicates
{
  return self->_ignoreRestrictionsPredicates;
}

- (BOOL)excludesEntitiesWithBlankNames
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_includeEntitiesWithBlankNames) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v3 = self->_filterPredicates;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (excludesEntitiesWithBlankNames_once != -1) {
            dispatch_once(&excludesEntitiesWithBlankNames_once, &__block_literal_global_31531);
          }
          uint64_t v9 = objc_msgSend(v8, "property", (void)v15);
          if ([(id)excludesEntitiesWithBlankNames_allowedBlankNameProperties containsObject:v9]) {
            goto LABEL_21;
          }
          if ([v9 isEqualToString:@"mediaType"])
          {
            uint64_t v10 = [v8 value];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              char v12 = [v8 value];
              uint64_t v13 = [v12 integerValue];

              if (v13)
              {
                if (v13 == 4 || (v13 & 0xFFFFFFFFFFFF00FFLL) == 0)
                {
LABEL_21:

                  BOOL v2 = 0;
                  goto LABEL_22;
                }
              }
            }
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v2 = 1;
LABEL_22:

  return v2;
}

- (unint64_t)entityOrder
{
  return self->_entityOrder;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 16) = self->_entityOrder;
  *(void *)(v4 + 24) = self->_groupingType;
  *(void *)(v4 + 32) = self->_entityLimit;
  uint64_t v5 = [(NSArray *)self->_orderingProperties copy];
  uint64_t v6 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v5;

  uint64_t v7 = [(NSDictionary *)self->_orderingDirectionMappings copy];
  uint64_t v8 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v7;

  uint64_t v9 = [(NSMutableSet *)self->_filterPredicates mutableCopy];
  uint64_t v10 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v9;

  uint64_t v11 = [(NSSet *)self->_itemPropertiesToFetch copy];
  char v12 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v11;

  uint64_t v13 = [(NSSet *)self->_collectionPropertiesToFetch copy];
  long long v14 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v13;

  *(unsigned char *)(v4 + 64) = self->_useSections;
  *(unsigned char *)(v4 + 65) = self->_ignoreSystemFilterPredicates;
  *(unsigned char *)(v4 + 66) = self->_ignoreRestrictionsPredicates;
  *(unsigned char *)(v4 + 67) = self->_includeNonLibraryEntities;
  *(unsigned char *)(v4 + 68) = self->_includeEntitiesWithBlankNames;
  return (id)v4;
}

- (MPMediaQueryCriteria)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPMediaQueryCriteria;
  result = [(MPMediaQueryCriteria *)&v3 init];
  if (result)
  {
    result->_entityOrder = 2;
    result->_BOOL useSections = 1;
  }
  return result;
}

- (void)setFilterPredicates:(id)a3
{
  uint64_t v4 = (NSMutableSet *)a3;
  uint64_t v5 = v4;
  if (self->_filterPredicates != v4)
  {
    uint64_t v9 = v4;
    if (v4)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v5 = v9;
      if ((isKindOfClass & 1) == 0)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"filter predicates must be an NSSet"];
        uint64_t v5 = v9;
      }
    }
    uint64_t v7 = (NSMutableSet *)[(NSMutableSet *)v5 mutableCopy];
    filterPredicates = self->_filterPredicates;
    self->_filterPredicates = v7;

    uint64_t v5 = v9;
  }
}

- (void)setOrderingProperties:(id)a3
{
}

- (void)setGroupingType:(int64_t)a3
{
  self->_groupingType = a3;
}

- (void)setEntityLimit:(unint64_t)a3
{
  self->_entityLimit = a3;
}

- (void)addFilterPredicate:(id)a3
{
  filterPredicates = self->_filterPredicates;
  if (filterPredicates)
  {
    uint64_t v5 = filterPredicates;
    uint64_t v6 = self->_filterPredicates;
    self->_filterPredicates = v5;
    id v7 = a3;
  }
  else
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA80];
    id v9 = a3;
    uint64_t v10 = (NSMutableSet *)objc_alloc_init(v8);
    uint64_t v6 = self->_filterPredicates;
    self->_filterPredicates = v10;
  }

  [(NSMutableSet *)self->_filterPredicates addObject:a3];
}

- (id)ML3CollectionsQueryInLibrary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(MPMediaQueryCriteria *)self groupingType];
  id v6 = 0;
  id v7 = (id *)MEMORY[0x1E4F79408];
  switch(v5)
  {
    case 0:
    case 22:
      id v7 = (id *)MEMORY[0x1E4F799F8];
      goto LABEL_7;
    case 1:
    case 7:
    case 9:
    case 10:
    case 12:
    case 17:
    case 21:
      goto LABEL_7;
    case 2:
    case 8:
      id v7 = (id *)MEMORY[0x1E4F79430];
      goto LABEL_7;
    case 3:
    case 14:
    case 18:
      id v7 = (id *)MEMORY[0x1E4F793E0];
      goto LABEL_7;
    case 4:
    case 15:
    case 19:
      id v7 = (id *)MEMORY[0x1E4F794E8];
      goto LABEL_7;
    case 5:
    case 16:
    case 20:
      id v7 = (id *)MEMORY[0x1E4F795F8];
LABEL_7:
      id v6 = *v7;
      goto LABEL_8;
    case 6:
      id v6 = [MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v17 = [(MPMediaQueryCriteria *)self filterPredicates];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = [*(id *)(*((void *)&v33 + 1) + 8 * i) ML3PredicateForContainer];
            if (v22) {
              [v6 addObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v19);
      }

      uint64_t v13 = [MEMORY[0x1E4F79A60] predicateMatchingPredicates:v6];
      uint64_t v23 = [(MPMediaQueryCriteria *)self orderingProperties];
      v24 = [(MPMediaQueryCriteria *)self orderingDirectionMappings];
      long long v14 = [(MPMediaQueryCriteria *)self ML3OrderingTermsForMPOrderingProperties:v23 directionalityMapping:v24 entityClass:objc_opt_class()];

      if (!v14)
      {
        long long v14 = [MEMORY[0x1E4F79AB8] defaultOrderingTerms];
      }
      if ([(MPMediaQueryCriteria *)self includeNonLibraryEntities]) {
        [MEMORY[0x1E4F79AB8] unrestrictedAllItemsQueryWithlibrary:v4 predicate:v13 orderingTerms:v14];
      }
      else {
      long long v25 = [MEMORY[0x1E4F79AB8] queryWithLibrary:v4 predicate:v13 orderingTerms:v14];
      }
      long long v30 = v25;
      if (v25)
      {
        if (self->_entityLimit) {
          objc_msgSend(v25, "setLimit:");
        }
        if ([(MPMediaQueryCriteria *)self ignoreSystemFilterPredicates]) {
          [v30 setIgnoreSystemFilterPredicates:1];
        }
        if ([(MPMediaQueryCriteria *)self ignoreRestrictionsPredicates]) {
          [v30 setIgnoreRestrictionsPredicates:1];
        }
      }
      goto LABEL_38;
    default:
LABEL_8:
      uint64_t v8 = [(MPMediaQueryCriteria *)self orderingProperties];
      id v9 = [(MPMediaQueryCriteria *)self orderingDirectionMappings];
      uint64_t v10 = [(MPMediaQueryCriteria *)self ML3OrderingTermsForMPOrderingProperties:v8 directionalityMapping:v9 entityClass:objc_opt_class()];
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [(MPMediaQueryCriteria *)self ML3OrderingTermsForGroupingType:v5];
      }
      uint64_t v13 = v12;

      long long v14 = [(MPMediaQueryCriteria *)self ML3ItemsQueryInLibrary:v4 orderingTerms:v13 nameBlankProperty:v6];
      switch(v5)
      {
        case 0:
        case 22:
          goto LABEL_52;
        case 1:
        case 7:
        case 10:
        case 12:
        case 13:
        case 17:
        case 21:
          long long v15 = (void *)MEMORY[0x1E4F79A50];
          long long v16 = (void *)MEMORY[0x1E4F79410];
          goto LABEL_34;
        case 2:
        case 8:
          long long v15 = (void *)MEMORY[0x1E4F79A70];
          long long v16 = (void *)MEMORY[0x1E4F79440];
          goto LABEL_34;
        case 3:
        case 14:
        case 18:
          long long v15 = (void *)MEMORY[0x1E4F79A58];
          long long v16 = (void *)MEMORY[0x1E4F793E8];
          goto LABEL_34;
        case 4:
        case 15:
        case 19:
          long long v15 = (void *)MEMORY[0x1E4F79AA8];
          long long v16 = (void *)MEMORY[0x1E4F794F0];
          goto LABEL_34;
        case 5:
        case 16:
        case 20:
          long long v15 = (void *)MEMORY[0x1E4F79AE0];
          long long v16 = (void *)MEMORY[0x1E4F795E8];
          goto LABEL_34;
        case 9:
          long long v15 = (void *)MEMORY[0x1E4F79A50];
          long long v16 = (void *)MEMORY[0x1E4F79860];
LABEL_34:
          id v29 = [v15 aggregateQueryWithUnitQuery:v14 foreignPersistentIDProperty:*v16];
          break;
        default:
          long long v26 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            unint64_t v27 = [(MPMediaQueryCriteria *)self groupingType];
            if (v27 > 0x16) {
              long long v28 = @"(unknown grouping type)";
            }
            else {
              long long v28 = off_1E57EF798[v27];
            }
            uint64_t v32 = v28;
            *(_DWORD *)buf = 138412290;
            long long v38 = v32;
            _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_ERROR, "no ML3 collection query for grouping type %@, using items query", buf, 0xCu);
          }
LABEL_52:
          id v29 = v14;
          break;
      }
      long long v30 = v29;
      if (v29 && self->_entityLimit) {
        objc_msgSend(v29, "setLimit:");
      }
LABEL_38:

      return v30;
  }
}

- (id)ML3ItemsQueryInLibrary:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MPMediaQueryCriteria *)self orderingProperties];
  id v6 = [(MPMediaQueryCriteria *)self orderingDirectionMappings];
  id v7 = [(MPMediaQueryCriteria *)self ML3OrderingTermsForMPOrderingProperties:v5 directionalityMapping:v6 entityClass:objc_opt_class()];

  uint64_t v8 = [(MPMediaQueryCriteria *)self ML3ItemsQueryInLibrary:v4 orderingTerms:v7 nameBlankProperty:*MEMORY[0x1E4F799F8]];

  return v8;
}

- (id)ML3OrderingTermsForMPOrderingProperties:(id)a3 directionalityMapping:(id)a4 entityClass:(Class)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__onceToken != -1) {
    dispatch_once(&ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__onceToken, &__block_literal_global_22601);
  }
  if (![v6 count])
  {
    id v28 = 0;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v6;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v9) {
    goto LABEL_25;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v30;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
      long long v14 = [v7 objectForKeyedSubscript:v13];
      long long v15 = [(id)ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__orderingTermMap objectForKeyedSubscript:v13];
      long long v16 = v15;
      if (v14)
      {
        if (v15)
        {
          long long v17 = (void *)MEMORY[0x1E4F79B10];
          uint64_t v18 = [v15 property];
          uint64_t v19 = objc_msgSend(v17, "orderingTermWithProperty:direction:", v18, objc_msgSend(v14, "intValue"));

          long long v16 = (void *)v19;
          goto LABEL_18;
        }
        uint64_t v22 = [(objc_class *)a5 propertyForMPMediaEntityProperty:v13];
        if (!v22)
        {
LABEL_23:
          long long v16 = 0;
          goto LABEL_20;
        }
        uint64_t v18 = (void *)v22;
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F79B10], "orderingTermWithProperty:direction:", v22, objc_msgSend(v14, "intValue"));
LABEL_17:
        long long v16 = (void *)v21;
LABEL_18:

        if (!v16) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }
      if (!v15)
      {
        uint64_t v20 = [(objc_class *)a5 propertyForMPMediaEntityProperty:v13];
        if (!v20) {
          goto LABEL_23;
        }
        uint64_t v18 = (void *)v20;
        uint64_t v21 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:v20];
        goto LABEL_17;
      }
LABEL_19:
      [v28 addObject:v16];
LABEL_20:

LABEL_21:
      ++v12;
    }
    while (v10 != v12);
    uint64_t v23 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
    uint64_t v10 = v23;
  }
  while (v23);
LABEL_25:

  if (![v28 count])
  {
    v24 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v8;
      _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_ERROR, "Unable to create orderingTerms for properties: %@", buf, 0xCu);
    }

    id v28 = 0;
  }
  id v6 = v26;
LABEL_31:

  return v28;
}

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (NSDictionary)orderingDirectionMappings
{
  return self->_orderingDirectionMappings;
}

void __112__MPMediaQueryCriteria_ML3Additions__ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass___block_invoke()
{
  v15[12] = *MEMORY[0x1E4F143B8];
  v14[0] = @"albumArtist";
  uint64_t v13 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F793E0]];
  v15[0] = v13;
  v14[1] = @"albumTitle";
  uint64_t v12 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79408]];
  v15[1] = v12;
  v14[2] = @"artist";
  v0 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79430]];
  v15[2] = v0;
  v14[3] = @"composer";
  v1 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F794E8]];
  v15[3] = v1;
  v14[4] = @"genre";
  BOOL v2 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F795F8]];
  v15[4] = v2;
  v14[5] = @"seriesName";
  objc_super v3 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79870]];
  v15[5] = v3;
  v14[6] = @"title";
  id v4 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F799F8]];
  v15[6] = v4;
  v14[7] = @"albumTrackNumber";
  int64_t v5 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79A18]];
  v15[7] = v5;
  v14[8] = @"discNumber";
  id v6 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79548]];
  v15[8] = v6;
  v14[9] = @"playCount";
  id v7 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F797C8]];
  v15[9] = v7;
  v14[10] = @"seasonNumber";
  id v8 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F79860]];
  v15[10] = v8;
  v14[11] = @"name";
  uint64_t v9 = [MEMORY[0x1E4F79B10] orderingTermWithProperty:*MEMORY[0x1E4F792D8]];
  v15[11] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:12];
  uint64_t v11 = (void *)ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__orderingTermMap;
  ML3OrderingTermsForMPOrderingProperties_directionalityMapping_entityClass__orderingTermMap = v10;
}

void __54__MPMediaQueryCriteria_excludesEntitiesWithBlankNames__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"artist", @"artistPID", @"albumArtist", @"albumArtistPID", @"albumTitle", @"albumPID", @"composer", @"composerPID", @"seriesName", @"seasonName", @"podcastTitle", @"podcastPID", @"podcastURL", @"persistentID", 0);
  v1 = (void *)excludesEntitiesWithBlankNames_allowedBlankNameProperties;
  excludesEntitiesWithBlankNames_allowedBlankNameProperties = v0;
}

- (void)setEntityOrder:(unint64_t)a3
{
  self->_entityOrder = a3;
}

- (void)setOrderingDirectionMappings:(id)a3
{
}

- (void)setIncludeEntitiesWithBlankNames:(BOOL)a3
{
  self->_includeEntitiesWithBlankNames = a3;
}

- (BOOL)includeEntitiesWithBlankNames
{
  return self->_includeEntitiesWithBlankNames;
}

- (void)setIncludeNonLibraryEntities:(BOOL)a3
{
  self->_includeNonLibraryEntities = a3;
}

- (void)setIgnoreRestrictionsPredicates:(BOOL)a3
{
  self->_ignoreRestrictionsPredicates = a3;
}

- (void)setIgnoreSystemFilterPredicates:(BOOL)a3
{
  self->_ignoreSystemFilterPredicates = a3;
}

- (void)setItemPropertiesToFetch:(id)a3
{
}

- (NSSet)itemPropertiesToFetch
{
  return self->_itemPropertiesToFetch;
}

- (unint64_t)entityLimit
{
  return self->_entityLimit;
}

- (void)setCollectionPropertiesToFetch:(id)a3
{
}

- (NSSet)collectionPropertiesToFetch
{
  return self->_collectionPropertiesToFetch;
}

- (BOOL)specifiesPlaylistItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v2 = self->_filterPredicates;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = objc_msgSend(v7, "property", (void)v12);
          char v9 = [v8 isEqualToString:@"playlistPersistentID"];

          if (v9)
          {
            BOOL v10 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (void)removePredicatesForProperty:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = self->_filterPredicates;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 property];
          int v12 = [v11 isEqualToString:v18];

          if (v12)
          {
            if (!v7) {
              id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v7 addObject:v10];
          }
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [(MPMediaQueryCriteria *)self removeFilterPredicate:*(void *)(*((void *)&v19 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }
}

- (void)removeFilterPredicate:(id)a3
{
  [(NSMutableSet *)self->_filterPredicates removeObject:a3];
  if (![(NSMutableSet *)self->_filterPredicates count])
  {
    filterPredicates = self->_filterPredicates;
    self->_filterPredicates = 0;
  }
}

- (void)addFilterPredicates:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    filterPredicates = self->_filterPredicates;
    if (filterPredicates) {
      uint64_t v5 = filterPredicates;
    }
    else {
      uint64_t v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    uint64_t v6 = self->_filterPredicates;
    self->_filterPredicates = v5;

    [(NSMutableSet *)self->_filterPredicates addObjectsFromArray:v7];
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t groupingType = self->_groupingType;
  if (groupingType > 0x16) {
    uint64_t v6 = @"(unknown grouping type)";
  }
  else {
    uint64_t v6 = off_1E57EF798[groupingType];
  }
  id v7 = v6;
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p> %@, %@", v4, self, v7, self->_filterPredicates];

  if ([(NSArray *)self->_orderingProperties count])
  {
    char v9 = [(NSArray *)self->_orderingProperties componentsJoinedByString:@", "];
    uint64_t v10 = [v8 stringByAppendingFormat:@" ordered by %@", v9];

    uint64_t v8 = (void *)v10;
  }
  if (self->_orderingDirectionMappings)
  {
    uint64_t v11 = [v8 stringByAppendingFormat:@" with sort direction=%@", self->_orderingDirectionMappings];

    uint64_t v8 = (void *)v11;
  }

  return v8;
}

@end