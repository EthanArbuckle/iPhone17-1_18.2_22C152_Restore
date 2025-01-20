@interface PHPhotosHighlight
+ (BOOL)cleanupEmptyHighlights;
+ (BOOL)invalidateHighlightSubtitlesAndRegenerateHighlightTitles;
+ (BOOL)locationOfInterestUpdate;
+ (BOOL)managedObjectSupportsSharingComposition;
+ (BOOL)managedObjectSupportsTrashedState;
+ (BOOL)processRecentHighlights;
+ (BOOL)processUnprocessedMomentLocations;
+ (BOOL)updateHighlightTitles;
+ (Class)propertySetClassForPropertySet:(id)a3;
+ (id)_choosePrivateOrSharedRelationshipForHighlight:(id)a3 givenFilter:(unsigned __int16)a4 privateHandler:(id)a5 sharedHandler:(id)a6;
+ (id)_fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4;
+ (id)_fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4;
+ (id)_keyAssetObjectIDForHighlight:(id)a3 filter:(unsigned __int16)a4;
+ (id)collageAssetsInverseRelationshipPredicateForDayHighlight:(id)a3 forHighlightFilter:(unsigned __int16)a4;
+ (id)dateRangeTitleGenerator;
+ (id)entityKeyMap;
+ (id)fetchAllSharedLibrarySharingSuggestionHighlightsWithOptions:(id)a3;
+ (id)fetchChildDayGroupHighlightsForHighlight:(id)a3 options:(id)a4;
+ (id)fetchChildHighlightsForHighlight:(id)a3 options:(id)a4;
+ (id)fetchHighlightsInSharedLibrarySharingSuggestions:(id)a3;
+ (id)fetchHighlightsWithOptions:(id)a3;
+ (id)fetchParentDayGroupHighlightForHighlight:(id)a3 options:(id)a4;
+ (id)fetchParentHighlightForHighlight:(id)a3 options:(id)a4;
+ (id)fetchParentHighlightsForHighlights:(id)a3 options:(id)a4;
+ (id)fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4;
+ (id)fetchPhotosHighlightUUIDByAssetUUIDForAssets:(id)a3 options:(id)a4;
+ (id)fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs:(id)a3 options:(id)a4;
+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchSharedLibrarySharingSuggestionsWithOptions:(id)a3;
+ (id)fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)keyAssetInverseRelationshipPredicateForHighlight:(id)a3 forHighlightFilter:(unsigned __int16)a4;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)propertySetAccessorsByPropertySet;
+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3;
- (BOOL)canContainCustomKeyAssets;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)isEnriched;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isRecent;
- (BOOL)isSharingSuggestion;
- (NSDate)lastEnrichmentDate;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSManagedObjectID)dayGroupKeyAssetPrivate;
- (NSManagedObjectID)dayGroupKeyAssetShared;
- (NSManagedObjectID)keyAssetObjectIDForKind;
- (NSManagedObjectID)keyAssetPrivate;
- (NSManagedObjectID)keyAssetShared;
- (NSManagedObjectID)monthKeyAssetPrivate;
- (NSManagedObjectID)monthKeyAssetShared;
- (NSManagedObjectID)parentPhotosHighlight;
- (NSManagedObjectID)yearKeyAssetPrivate;
- (NSManagedObjectID)yearKeyAssetShared;
- (NSString)dateDescriptionMixed;
- (NSString)dateDescriptionPrivate;
- (NSString)dateDescriptionShared;
- (NSString)shortDateDescription;
- (NSString)shortDateDescriptionMixed;
- (NSString)shortDateDescriptionPrivate;
- (NSString)shortDateDescriptionShared;
- (NSString)subtitle;
- (NSString)subtitleMixed;
- (NSString)subtitlePrivate;
- (NSString)subtitleShared;
- (NSString)titleMixed;
- (NSString)titleShared;
- (NSString)verboseSmartDescription;
- (NSString)verboseSmartDescriptionMixed;
- (NSString)verboseSmartDescriptionPrivate;
- (NSString)verboseSmartDescriptionShared;
- (NSString)verboseSmartDescriptionUserEdited;
- (PHPhotosHighlight)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (double)promotionScore;
- (id)dateDescriptionWithOptions:(unint64_t)a3;
- (id)description;
- (id)keyAssetObjectIDForKindWithFilter:(unsigned __int16)a3;
- (id)localizedSubtitle;
- (id)localizedTitle;
- (id)title;
- (int64_t)assetCollectionSubtype;
- (int64_t)endTimeZoneOffset;
- (int64_t)startTimeZoneOffset;
- (signed)enrichmentVersion;
- (signed)highlightVersion;
- (unint64_t)assetsCount;
- (unint64_t)assetsCountMixed;
- (unint64_t)assetsCountPrivate;
- (unint64_t)assetsCountShared;
- (unint64_t)countForCurationType:(unsigned __int16)a3;
- (unint64_t)dayGroupAssetsCount;
- (unint64_t)dayGroupAssetsCountMixed;
- (unint64_t)dayGroupAssetsCountPrivate;
- (unint64_t)dayGroupAssetsCountShared;
- (unint64_t)dayGroupExtendedAssetsCount;
- (unint64_t)dayGroupExtendedAssetsCountMixed;
- (unint64_t)dayGroupExtendedAssetsCountPrivate;
- (unint64_t)dayGroupExtendedAssetsCountShared;
- (unint64_t)dayGroupSummaryAssetsCount;
- (unint64_t)dayGroupSummaryAssetsCountMixed;
- (unint64_t)dayGroupSummaryAssetsCountPrivate;
- (unint64_t)dayGroupSummaryAssetsCountShared;
- (unint64_t)estimatedPhotosCount;
- (unint64_t)estimatedVideosCount;
- (unint64_t)extendedCount;
- (unint64_t)extendedCountMixed;
- (unint64_t)extendedCountPrivate;
- (unint64_t)extendedCountShared;
- (unint64_t)mood;
- (unint64_t)photoAssetsSuggestedByPhotosCount;
- (unint64_t)summaryCount;
- (unint64_t)summaryCountMixed;
- (unint64_t)summaryCountPrivate;
- (unint64_t)summaryCountShared;
- (unint64_t)videoAssetsSuggestedByPhotosCount;
- (unsigned)category;
- (unsigned)enrichmentState;
- (unsigned)kind;
- (unsigned)mixedSharingCompositionKeyAssetRelationship;
- (unsigned)preferredCurationType;
- (unsigned)sharingComposition;
- (unsigned)sharingFilter;
- (unsigned)type;
- (unsigned)visibilityState;
- (unsigned)visibilityStateMixed;
- (unsigned)visibilityStatePrivate;
- (unsigned)visibilityStateShared;
- (void)setEnriched:(BOOL)a3;
- (void)setLastEnrichmentDate:(id)a3;
- (void)setLocalEndDate:(id)a3;
- (void)setLocalStartDate:(id)a3;
- (void)setRecent:(BOOL)a3;
@end

@implementation PHPhotosHighlight

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHPhotosHighlight;
  if ([(PHObject *)&v8 isEqual:v4])
  {
    int v5 = [v4 isSharingSuggestion];
    int v6 = v5 ^ [(PHPhotosHighlight *)self isSharingSuggestion] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (PHPhotosHighlight)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v9 = a3;
  v101.receiver = self;
  v101.super_class = (Class)PHPhotosHighlight;
  v10 = [(PHAssetCollection *)&v101 initWithFetchDictionary:v9 propertyHint:a4 photoLibrary:a5];
  if (v10)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"startDate"];
    startDate = v10->super._startDate;
    v10->super._startDate = (NSDate *)v11;

    uint64_t v13 = [v9 objectForKeyedSubscript:@"endDate"];
    endDate = v10->super._endDate;
    v10->super._endDate = (NSDate *)v13;

    uint64_t v15 = [v9 objectForKeyedSubscript:@"subtitle"];
    subtitle = v10->_subtitle;
    v10->_subtitle = (NSString *)v15;

    uint64_t v17 = [v9 objectForKeyedSubscript:@"verboseSmartDescription"];
    verboseSmartDescription = v10->_verboseSmartDescription;
    v10->_verboseSmartDescription = (NSString *)v17;

    v10->super._assetCollectionType = 6;
    v19 = [v9 objectForKeyedSubscript:@"visibilityState"];
    v10->_visibilityState = [v19 unsignedShortValue];

    v20 = [v9 objectForKeyedSubscript:@"kind"];
    v10->_kind = [v20 integerValue];

    v21 = [v9 objectForKeyedSubscript:@"type"];
    v10->_type = [v21 integerValue];

    v22 = [v9 objectForKeyedSubscript:@"category"];
    v10->_category = [v22 integerValue];

    v23 = [v9 objectForKeyedSubscript:@"promotionScore"];
    [v23 doubleValue];
    v10->_promotionScore = v24;

    v25 = [v9 objectForKeyedSubscript:@"startTimeZoneOffset"];
    v10->_startTimeZoneOffset = [v25 integerValue];

    v26 = [v9 objectForKeyedSubscript:@"endTimeZoneOffset"];
    v10->_endTimeZoneOffset = [v26 integerValue];

    v27 = [v9 objectForKeyedSubscript:@"category"];
    LOWORD(v26) = [v27 integerValue];

    v10->_recent = (unsigned __int16)v26 == 1;
    v28 = [v9 objectForKeyedSubscript:@"enrichmentState"];
    v10->_enrichmentState = [v28 shortValue];

    uint64_t v29 = [v9 objectForKeyedSubscript:@"lastEnrichmentDate"];
    lastEnrichmentDate = v10->_lastEnrichmentDate;
    v10->_lastEnrichmentDate = (NSDate *)v29;

    v10->_enriched = v10->_enrichmentState != 0;
    v31 = [v9 objectForKeyedSubscript:@"mood"];
    v10->_mood = [v31 integerValue];

    v32 = [v9 objectForKeyedSubscript:@"assetsCount"];
    v10->_assetsCount = [v32 integerValue];

    v33 = [v9 objectForKeyedSubscript:@"dayGroupAssetsCount"];
    v10->_dayGroupAssetsCount = [v33 integerValue];

    v34 = [v9 objectForKeyedSubscript:@"dayGroupExtendedAssetsCount"];
    v10->_dayGroupExtendedAssetsCount = [v34 integerValue];

    v35 = [v9 objectForKeyedSubscript:@"dayGroupSummaryAssetsCount"];
    v10->_dayGroupSummaryAssetsCount = [v35 integerValue];

    v36 = [v9 objectForKeyedSubscript:@"extendedCount"];
    v10->_extendedCount = [v36 integerValue];

    v37 = [v9 objectForKeyedSubscript:@"summaryCount"];
    v10->_summaryCount = [v37 integerValue];

    v38 = [v9 objectForKeyedSubscript:@"highlightVersion"];
    v10->_highlightVersion = [v38 intValue];

    v39 = [v9 objectForKeyedSubscript:@"enrichmentVersion"];
    v10->_enrichmentVersion = [v39 intValue];

    uint64_t v40 = [v9 objectForKeyedSubscript:@"keyAssetPrivate"];
    keyAssetPrivate = v10->_keyAssetPrivate;
    v10->_keyAssetPrivate = (NSManagedObjectID *)v40;

    uint64_t v42 = [v9 objectForKeyedSubscript:@"dayGroupKeyAssetPrivate"];
    dayGroupKeyAssetPrivate = v10->_dayGroupKeyAssetPrivate;
    v10->_dayGroupKeyAssetPrivate = (NSManagedObjectID *)v42;

    uint64_t v44 = [v9 objectForKeyedSubscript:@"monthKeyAssetPrivate"];
    monthKeyAssetPrivate = v10->_monthKeyAssetPrivate;
    v10->_monthKeyAssetPrivate = (NSManagedObjectID *)v44;

    uint64_t v46 = [v9 objectForKeyedSubscript:@"yearKeyAssetPrivate"];
    yearKeyAssetPrivate = v10->_yearKeyAssetPrivate;
    v10->_yearKeyAssetPrivate = (NSManagedObjectID *)v46;

    uint64_t v48 = [v9 objectForKeyedSubscript:@"parentPhotosHighlight"];
    parentPhotosHighlight = v10->_parentPhotosHighlight;
    v10->_parentPhotosHighlight = (NSManagedObjectID *)v48;

    if (a4 & 0x1C) < 0x14 && ((0x17u >> ((a4 & 0x1C) >> 2)))
    {
      unsigned __int16 v51 = word_19B2CC808[(a4 >> 2) & 7];
    }
    else
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"PHPhotosHighlight.m", 557, @"Private/Shared property hints are mutually exclusive %lu", a4 & 0x1C);

      unsigned __int16 v51 = 0;
    }
    v10->_sharingFilter = v51;
    v10->_isSharingSuggestion = (a4 & 0x20) != 0;
    uint64_t v52 = [v9 objectForKeyedSubscript:@"subtitleShared"];
    subtitleShared = v10->_subtitleShared;
    v10->_subtitleShared = (NSString *)v52;

    uint64_t v54 = [v9 objectForKeyedSubscript:@"subtitleMixed"];
    subtitleMixed = v10->_subtitleMixed;
    v10->_subtitleMixed = (NSString *)v54;

    uint64_t v56 = [v9 objectForKeyedSubscript:@"verboseSmartDescriptionShared"];
    verboseSmartDescriptionShared = v10->_verboseSmartDescriptionShared;
    v10->_verboseSmartDescriptionShared = (NSString *)v56;

    uint64_t v58 = [v9 objectForKeyedSubscript:@"verboseSmartDescriptionMixed"];
    verboseSmartDescriptionMixed = v10->_verboseSmartDescriptionMixed;
    v10->_verboseSmartDescriptionMixed = (NSString *)v58;

    uint64_t v60 = [v9 objectForKeyedSubscript:@"keyAssetShared"];
    keyAssetShared = v10->_keyAssetShared;
    v10->_keyAssetShared = (NSManagedObjectID *)v60;

    uint64_t v62 = [v9 objectForKeyedSubscript:@"monthKeyAssetShared"];
    monthKeyAssetShared = v10->_monthKeyAssetShared;
    v10->_monthKeyAssetShared = (NSManagedObjectID *)v62;

    uint64_t v64 = [v9 objectForKeyedSubscript:@"yearKeyAssetShared"];
    yearKeyAssetShared = v10->_yearKeyAssetShared;
    v10->_yearKeyAssetShared = (NSManagedObjectID *)v64;

    uint64_t v66 = [v9 objectForKeyedSubscript:@"dayGroupKeyAssetShared"];
    dayGroupKeyAssetShared = v10->_dayGroupKeyAssetShared;
    v10->_dayGroupKeyAssetShared = (NSManagedObjectID *)v66;

    v68 = [v9 objectForKeyedSubscript:@"sharingComposition"];
    v10->_sharingComposition = [v68 integerValue];

    v69 = [v9 objectForKeyedSubscript:@"mixedSharingCompositionKeyAssetRelationship"];
    v10->_mixedSharingCompositionKeyAssetRelationship = [v69 unsignedShortValue];

    v70 = [v9 objectForKeyedSubscript:@"assetsCountShared"];
    v10->_assetsCountShared = [v70 integerValue];

    v71 = [v9 objectForKeyedSubscript:@"extendedCountShared"];
    v10->_extendedCountShared = [v71 integerValue];

    v72 = [v9 objectForKeyedSubscript:@"summaryCountShared"];
    v10->_summaryCountShared = [v72 integerValue];

    v73 = [v9 objectForKeyedSubscript:@"dayGroupAssetsCountShared"];
    v10->_dayGroupAssetsCountShared = [v73 integerValue];

    v74 = [v9 objectForKeyedSubscript:@"dayGroupExtendedAssetsCountShared"];
    v10->_dayGroupExtendedAssetsCountShared = [v74 integerValue];

    v75 = [v9 objectForKeyedSubscript:@"dayGroupSummaryAssetsCountShared"];
    v10->_dayGroupSummaryAssetsCountShared = [v75 integerValue];

    v76 = [v9 objectForKeyedSubscript:@"visibilityStateShared"];
    v10->_visibilityStateShared = [v76 unsignedShortValue];

    v77 = [v9 objectForKeyedSubscript:@"visibilityStateMixed"];
    v10->_visibilityStateMixed = [v77 unsignedShortValue];

    v78 = [v9 objectForKeyedSubscript:@"photoAssetsSuggestedByPhotosCount"];
    v10->_photoAssetsSuggestedByPhotosCount = [v78 integerValue];

    v79 = [v9 objectForKeyedSubscript:@"videoAssetsSuggestedByPhotosCount"];
    v10->_videoAssetsSuggestedByPhotosCount = [v79 integerValue];

    v80 = [v9 objectForKeyedSubscript:@"title"];
    v81 = [v9 objectForKeyedSubscript:@"titleShared"];
    v82 = [v9 objectForKeyedSubscript:@"titleMixed"];
    if (_os_feature_enabled_impl() && PLPhotosHighlightTypeIsConsideredTrip())
    {
      uint64_t v83 = *MEMORY[0x1E4F8B2A8];
      v84 = [v80 componentsSeparatedByString:*MEMORY[0x1E4F8B2A8]];
      v85 = [v81 componentsSeparatedByString:v83];
      v86 = [v82 componentsSeparatedByString:v83];
      if ([v84 count])
      {
        uint64_t v87 = [v84 objectAtIndexedSubscript:0];
        localizedTitle = v10->super._localizedTitle;
        v10->super._localizedTitle = (NSString *)v87;

        if ([v84 count] == 2)
        {
          uint64_t v89 = [v84 objectAtIndexedSubscript:1];
          shortDateDescriptionPrivate = v10->_shortDateDescriptionPrivate;
          v10->_shortDateDescriptionPrivate = (NSString *)v89;
        }
      }
      if ([v85 count])
      {
        uint64_t v91 = [v85 objectAtIndexedSubscript:0];
        titleShared = v10->_titleShared;
        v10->_titleShared = (NSString *)v91;

        if ([v85 count] == 2)
        {
          uint64_t v93 = [v85 objectAtIndexedSubscript:1];
          shortDateDescriptionShared = v10->_shortDateDescriptionShared;
          v10->_shortDateDescriptionShared = (NSString *)v93;
        }
      }
      if ([v86 count])
      {
        uint64_t v95 = [v86 objectAtIndexedSubscript:0];
        titleMixed = v10->_titleMixed;
        v10->_titleMixed = (NSString *)v95;

        if ([v86 count] == 2)
        {
          uint64_t v97 = [v86 objectAtIndexedSubscript:1];
          shortDateDescriptionMixed = v10->_shortDateDescriptionMixed;
          v10->_shortDateDescriptionMixed = (NSString *)v97;
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&v10->super._localizedTitle, v80);
      objc_storeStrong((id *)&v10->_titleShared, v81);
      v99 = v82;
      v84 = v10->_titleMixed;
      v10->_titleMixed = v99;
    }
  }
  return v10;
}

+ (id)managedEntityName
{
  return @"PhotosHighlight";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PHPhotosHighlight_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_10742 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_10742, block);
  }
  v3 = (void *)propertiesToFetchWithHint__array_10743;

  return v3;
}

- (BOOL)isRecent
{
  return self->_recent;
}

- (unsigned)enrichmentState
{
  return self->_enrichmentState;
}

- (unint64_t)assetsCountPrivate
{
  unint64_t assetsCount = self->_assetsCount;
  return assetsCount - [(PHPhotosHighlight *)self assetsCountShared];
}

- (unint64_t)assetsCountShared
{
  return self->_assetsCountShared;
}

- (unint64_t)estimatedPhotosCount
{
  if ([(PHPhotosHighlight *)self isSharingSuggestion])
  {
    return [(PHPhotosHighlight *)self photoAssetsSuggestedByPhotosCount];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PHPhotosHighlight;
    return [(PHAssetCollection *)&v4 estimatedPhotosCount];
  }
}

- (unint64_t)assetsCount
{
  unint64_t result = [(PHPhotosHighlight *)self isSharingSuggestion];
  if (result)
  {
    unint64_t v4 = [(PHPhotosHighlight *)self photoAssetsSuggestedByPhotosCount];
    unint64_t v5 = [(PHPhotosHighlight *)self videoAssetsSuggestedByPhotosCount];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      return v5 + v4;
    }
  }
  unsigned int kind = self->_kind;
  if (kind >= 3)
  {
    if (kind != 3) {
      return result;
    }
    int sharingComposition = self->_sharingComposition;
    if (!self->_sharingComposition)
    {
LABEL_31:
      return [(PHPhotosHighlight *)self dayGroupAssetsCountPrivate];
    }
    goto LABEL_16;
  }
  int sharingComposition = self->_sharingComposition;
  if (sharingComposition != 2)
  {
    if (sharingComposition != 1)
    {
      if (self->_sharingComposition)
      {
LABEL_16:
        if (sharingComposition == 1)
        {
LABEL_34:
          return [(PHPhotosHighlight *)self dayGroupAssetsCountShared];
        }
        if (sharingComposition != 2) {
          return result;
        }
        int sharingFilter = self->_sharingFilter;
        goto LABEL_28;
      }
LABEL_22:
      return [(PHPhotosHighlight *)self assetsCountPrivate];
    }
LABEL_25:
    return [(PHPhotosHighlight *)self assetsCountShared];
  }
  int sharingFilter = self->_sharingFilter;
  if (sharingFilter == 2)
  {
    return [(PHPhotosHighlight *)self assetsCountMixed];
  }
  if (sharingFilter == 1) {
    goto LABEL_25;
  }
  if (!self->_sharingFilter) {
    goto LABEL_22;
  }
LABEL_28:
  if (sharingFilter != 2)
  {
    if (sharingFilter != 1)
    {
      if (sharingFilter) {
        return result;
      }
      goto LABEL_31;
    }
    goto LABEL_34;
  }

  return [(PHPhotosHighlight *)self dayGroupAssetsCountMixed];
}

- (unint64_t)estimatedVideosCount
{
  if ([(PHPhotosHighlight *)self isSharingSuggestion])
  {
    return [(PHPhotosHighlight *)self videoAssetsSuggestedByPhotosCount];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PHPhotosHighlight;
    return [(PHAssetCollection *)&v4 estimatedVideosCount];
  }
}

- (BOOL)isSharingSuggestion
{
  return self->_isSharingSuggestion;
}

- (unint64_t)dayGroupAssetsCountPrivate
{
  unint64_t dayGroupAssetsCount = self->_dayGroupAssetsCount;
  return dayGroupAssetsCount - [(PHPhotosHighlight *)self dayGroupAssetsCountShared];
}

- (unint64_t)dayGroupAssetsCountShared
{
  return self->_dayGroupAssetsCountShared;
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3 = a3;
  if ([@"PHPhotosHighlightPropertySetIdentifier" length]) {
    unint64_t v4 = [v3 containsObject:@"PHPhotosHighlightPropertySetIdentifier"];
  }
  else {
    unint64_t v4 = 0;
  }
  if ([@"PHPhotosHighlightPropertySetCore" length]
    && [v3 containsObject:@"PHPhotosHighlightPropertySetCore"])
  {
    v4 |= 2uLL;
  }
  if ([@"PHPhotosHighlightPropertySetOnlyPrivate" length]
    && [v3 containsObject:@"PHPhotosHighlightPropertySetOnlyPrivate"])
  {
    v4 |= 4uLL;
  }
  if ([@"PHPhotosHighlightPropertySetOnlyShared" length]
    && [v3 containsObject:@"PHPhotosHighlightPropertySetOnlyShared"])
  {
    v4 |= 8uLL;
  }
  if ([@"PHPhotosHighlightPropertySetPrivateOrShared" length]
    && [v3 containsObject:@"PHPhotosHighlightPropertySetPrivateOrShared"])
  {
    v4 |= 0x10uLL;
  }
  if ([@"PHPhotosHighlightPropertySetSharingSuggestions" length]
    && [v3 containsObject:@"PHPhotosHighlightPropertySetSharingSuggestions"])
  {
    v4 |= 0x20uLL;
  }
  if (![v3 containsObject:@"PHPhotosHighlightPropertySetIdentifier"]) {
    v4 |= 2uLL;
  }

  return v4;
}

+ (id)keyAssetInverseRelationshipPredicateForHighlight:(id)a3 forHighlightFilter:(unsigned __int16)a4
{
  unint64_t v4 = [a1 _choosePrivateOrSharedRelationshipForHighlight:a3 givenFilter:a4 privateHandler:&__block_literal_global_285 sharedHandler:&__block_literal_global_303];
  if (!v4)
  {
    unint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }

  return v4;
}

+ (id)_choosePrivateOrSharedRelationshipForHighlight:(id)a3 givenFilter:(unsigned __int16)a4 privateHandler:(id)a5 sharedHandler:(id)a6
{
  int v8 = a4;
  id v9 = a3;
  v10 = (void (**)(id, id))a5;
  uint64_t v11 = (void (**)(id, id))a6;
  int v12 = [v9 sharingComposition];
  switch(v12)
  {
    case 2:
      uint64_t v13 = v10;
      if (v8)
      {
        if (v8 == 2)
        {
          unsigned int v15 = [v9 mixedSharingCompositionKeyAssetRelationship];
          uint64_t v13 = v10;
          if (v15 >= 2)
          {
            if (v15 != 2) {
              break;
            }
            uint64_t v13 = v11;
          }
        }
        else
        {
          uint64_t v13 = v11;
          if (v8 != 1) {
            break;
          }
        }
      }
      goto LABEL_11;
    case 1:
      uint64_t v13 = v11;
      if ((v8 - 1) >= 2) {
        break;
      }
LABEL_11:
      v14 = v13[2](v13, v9);
      goto LABEL_16;
    case 0:
      uint64_t v13 = v10;
      if ((v8 & 0xFFFFFFFD) == 0) {
        goto LABEL_11;
      }
      break;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

id __89__PHPhotosHighlight_keyAssetInverseRelationshipPredicateForHighlight_forHighlightFilter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  switch([v2 kind])
  {
    case 0u:
      id v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      unint64_t v5 = (void *)v4;
      int v6 = @"highlightBeingKeyAssetPrivate";
      goto LABEL_9;
    case 1u:
      id v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      unint64_t v5 = (void *)v4;
      int v6 = @"monthHighlightBeingKeyAssetPrivate";
      goto LABEL_9;
    case 2u:
      id v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      unint64_t v5 = (void *)v4;
      int v6 = @"yearHighlightBeingKeyAssetPrivate";
      goto LABEL_9;
    case 3u:
      id v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      unint64_t v5 = (void *)v4;
      int v6 = @"dayGroupHighlightBeingKeyAssetPrivate";
LABEL_9:
      int v8 = [v3 predicateWithFormat:@"%K = %@", v6, v4];

      break;
    default:
      v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = [v2 kind];
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "keyAssetInverseRelationshipPredicateForHighlight (privateHandler): Unhandled highlight kind: %ld", buf, 0xCu);
      }

      int v8 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
      break;
  }

  return v8;
}

- (int64_t)assetCollectionSubtype
{
  unsigned int v3 = [(PHPhotosHighlight *)self kind];
  if (v3 < 4) {
    return v3 + 1000000301;
  }
  v5.receiver = self;
  v5.super_class = (Class)PHPhotosHighlight;
  return [(PHAssetCollection *)&v5 assetCollectionSubtype];
}

- (unsigned)kind
{
  return self->_kind;
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 1;
}

+ (id)identifierCode
{
  return @"120";
}

+ (id)collageAssetsInverseRelationshipPredicateForDayHighlight:(id)a3 forHighlightFilter:(unsigned __int16)a4
{
  int v5 = a4;
  id v6 = a3;
  v7 = v6;
  if (v5 == 2)
  {
    int v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v6 objectID];
    v10 = (void *)v9;
    uint64_t v11 = @"dayHighlightBeingCollageAssetsMixed";
  }
  else if (v5 == 1)
  {
    int v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v6 objectID];
    v10 = (void *)v9;
    uint64_t v11 = @"dayHighlightBeingCollageAssetsShared";
  }
  else
  {
    if (v5) {
      goto LABEL_8;
    }
    int v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v6 objectID];
    v10 = (void *)v9;
    uint64_t v11 = @"dayHighlightBeingCollageAssetsPrivate";
  }
  uint64_t v4 = [v8 predicateWithFormat:@"%K = %@", v11, v9];

LABEL_8:

  return v4;
}

- (id)title
{
  int v3 = [(PHPhotosHighlight *)self category];
  if ([(PHPhotosHighlight *)self kind] && [(PHPhotosHighlight *)self kind] != 3)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v4 = [(PHAssetCollection *)self startDate];
    [v4 timeIntervalSinceNow];
    double v6 = v5;

    double v7 = -v6;
    if (v6 >= 0.0) {
      double v7 = v6;
    }
    BOOL v8 = v7 < 604800.0;
  }
  if (v3 == 1 || v8)
  {
    if (_os_feature_enabled_impl()) {
      uint64_t v10 = 8;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [(id)objc_opt_class() dateRangeTitleGenerator];
    uint64_t v12 = [(PHPhotosHighlight *)self localStartDate];
    uint64_t v13 = [(PHPhotosHighlight *)self localEndDate];
    uint64_t v9 = objc_msgSend(v11, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", v12, v13, -[PHPhotosHighlight category](self, "category"), -[PHPhotosHighlight kind](self, "kind"), -[PHPhotosHighlight type](self, "type"), v10);
  }
  else
  {
    uint64_t v9 = [(PHPhotosHighlight *)self localizedTitle];
  }

  return v9;
}

- (id)localizedTitle
{
  int v3 = [(PHPhotosHighlight *)self kind];
  if (v3 != 3 && v3)
  {
    double v5 = &OBJC_IVAR___PHAssetCollection__localizedTitle;
  }
  else
  {
    int sharingComposition = self->_sharingComposition;
    double v5 = &OBJC_IVAR___PHAssetCollection__localizedTitle;
    if (sharingComposition == 2)
    {
      int sharingFilter = self->_sharingFilter;
      if (sharingFilter == 1) {
        double v5 = &OBJC_IVAR___PHPhotosHighlight__titleShared;
      }
      if (sharingFilter == 2) {
        double v5 = &OBJC_IVAR___PHPhotosHighlight__titleMixed;
      }
    }
    else if (sharingComposition == 1)
    {
      double v5 = &OBJC_IVAR___PHPhotosHighlight__titleShared;
    }
  }
  double v7 = *(Class *)((char *)&self->super.super.super.super.isa + *v5);

  return v7;
}

- (unsigned)category
{
  return self->_category;
}

- (id)localizedSubtitle
{
  int v3 = [(PHPhotosHighlight *)self kind];
  if (v3 != 3 && v3)
  {
    double v5 = &OBJC_IVAR___PHPhotosHighlight__subtitle;
  }
  else
  {
    int sharingComposition = self->_sharingComposition;
    double v5 = &OBJC_IVAR___PHPhotosHighlight__subtitle;
    if (sharingComposition == 2)
    {
      int sharingFilter = self->_sharingFilter;
      if (sharingFilter == 1) {
        double v5 = &OBJC_IVAR___PHPhotosHighlight__subtitleShared;
      }
      if (sharingFilter == 2) {
        double v5 = &OBJC_IVAR___PHPhotosHighlight__subtitleMixed;
      }
    }
    else if (sharingComposition == 1)
    {
      double v5 = &OBJC_IVAR___PHPhotosHighlight__subtitleShared;
    }
  }
  double v7 = *(Class *)((char *)&self->super.super.super.super.isa + *v5);

  return v7;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  id v2 = (void *)entityKeyMap_pl_once_object_15_10731;

  return v2;
}

+ (id)fetchType
{
  id v2 = @"PHPhotosHighlight";
  return @"PHPhotosHighlight";
}

+ (id)fetchHighlightsWithOptions:(id)a3
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:a3];
}

void __33__PHPhotosHighlight_entityKeyMap__block_invoke()
{
  v109[52] = *MEMORY[0x1E4F143B8];
  v43 = [PHEntityKeyMap alloc];
  v108[0] = @"objectID";
  v107 = @"objectID";
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  v109[0] = v55;
  v108[1] = @"uuid";
  v106 = @"uuid";
  uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
  v109[1] = v54;
  v108[2] = @"title";
  v105[0] = @"localizedTitle";
  v105[1] = @"title";
  v105[2] = @"dateDescription";
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:3];
  v109[2] = v53;
  v108[3] = @"subtitle";
  v104[0] = @"subtitle";
  v104[1] = @"smartDescription";
  uint64_t v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
  v109[3] = v52;
  v108[4] = @"verboseSmartDescription";
  v103 = @"verboseSmartDescription";
  unsigned __int16 v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
  v109[4] = v51;
  v108[5] = @"endDate";
  v102 = @"endDate";
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  v109[5] = v50;
  v108[6] = @"startDate";
  objc_super v101 = @"startDate";
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
  v109[6] = v49;
  v108[7] = @"visibilityState";
  v100 = @"visibilityState";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
  v109[7] = v48;
  v108[8] = @"kind";
  v99 = @"kind";
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
  v109[8] = v47;
  v108[9] = @"type";
  v98 = @"type";
  uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
  v109[9] = v46;
  v108[10] = @"category";
  uint64_t v97 = @"category";
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
  v109[10] = v45;
  v108[11] = @"startTimeZoneOffset";
  v96 = @"startTimeZoneOffset";
  uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v109[11] = v44;
  v108[12] = @"endTimeZoneOffset";
  uint64_t v95 = @"endTimeZoneOffset";
  uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
  v109[12] = v42;
  v108[13] = @"promotionScore";
  v94 = @"promotionScore";
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
  v109[13] = v41;
  v108[14] = @"mood";
  uint64_t v93 = @"mood";
  uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  v109[14] = v40;
  v108[15] = @"assetsCount";
  v92[0] = @"estimatedAssetCount";
  v92[1] = @"assetsCount";
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  v109[15] = v39;
  v108[16] = @"dayGroupAssetsCount";
  uint64_t v91 = @"dayGroupAssetsCount";
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  v109[16] = v38;
  v108[17] = @"dayGroupExtendedAssetsCount";
  v90 = @"dayGroupExtendedAssetsCount";
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  v109[17] = v37;
  v108[18] = @"dayGroupSummaryAssetsCount";
  uint64_t v89 = @"dayGroupSummaryAssetsCount";
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v109[18] = v36;
  v108[19] = @"extendedCount";
  v88 = @"extendedCount";
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  v109[19] = v35;
  v108[20] = @"enrichmentState";
  uint64_t v87 = @"enrichmentState";
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v109[20] = v34;
  v108[21] = @"lastEnrichmentDate";
  v86 = @"lastEnrichmentDate";
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  v109[21] = v33;
  v108[22] = @"highlightVersion";
  v85 = @"highlightVersion";
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v109[22] = v32;
  v108[23] = @"enrichmentVersion";
  v84 = @"enrichmentVersion";
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v109[23] = v31;
  v108[24] = @"keyAssetPrivate";
  uint64_t v83 = @"keyAssetPrivate";
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v109[24] = v30;
  v108[25] = @"dayGroupKeyAssetPrivate";
  v82 = @"dayGroupKeyAssetPrivate";
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  v109[25] = v29;
  v108[26] = @"monthKeyAssetPrivate";
  v81 = @"monthKeyAssetPrivate";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  v109[26] = v28;
  v108[27] = @"yearKeyAssetPrivate";
  v80 = @"yearKeyAssetPrivate";
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  v109[27] = v27;
  v108[28] = @"parentPhotosHighlight";
  v79 = @"parentPhotosHighlight";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v109[28] = v26;
  v108[29] = @"verboseSmartDescriptionShared";
  v78 = @"verboseSmartDescriptionShared";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
  v109[29] = v25;
  v108[30] = @"verboseSmartDescriptionMixed";
  v77 = @"verboseSmartDescriptionMixed";
  double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  v109[30] = v24;
  v108[31] = @"subtitleShared";
  v76[0] = @"subtitleShared";
  v76[1] = @"smartDescriptionShared";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v109[31] = v23;
  v108[32] = @"subtitleMixed";
  v75[0] = @"subtitleMixed";
  v75[1] = @"smartDescriptionMixed";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
  v109[32] = v22;
  v108[33] = @"titleShared";
  v74[0] = @"titleShared";
  v74[1] = @"dateDescriptionShared";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  v109[33] = v21;
  v108[34] = @"titleMixed";
  v73[0] = @"titleMixed";
  v73[1] = @"dateDescriptionMixed";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  v109[34] = v20;
  v108[35] = @"dayGroupAssetsCountShared";
  v72 = @"dayGroupAssetsCountShared";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  v109[35] = v19;
  v108[36] = @"dayGroupExtendedAssetsCountShared";
  v71 = @"dayGroupExtendedAssetsCountShared";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  v109[36] = v18;
  v108[37] = @"dayGroupSummaryAssetsCountShared";
  v70 = @"dayGroupSummaryAssetsCountShared";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  v109[37] = v17;
  v108[38] = @"extendedCountShared";
  v69 = @"extendedCountShared";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v109[38] = v16;
  v108[39] = @"summaryCount";
  v68 = @"summaryCount";
  unsigned int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  v109[39] = v15;
  v108[40] = @"summaryCountShared";
  v67 = @"summaryCountShared";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  v109[40] = v14;
  v108[41] = @"keyAssetShared";
  uint64_t v66 = @"keyAssetShared";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  v109[41] = v13;
  v108[42] = @"dayGroupKeyAssetShared";
  v65 = @"dayGroupKeyAssetShared";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  v109[42] = v12;
  v108[43] = @"monthKeyAssetShared";
  uint64_t v64 = @"monthKeyAssetShared";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v109[43] = v0;
  v108[44] = @"yearKeyAssetShared";
  v63 = @"yearKeyAssetShared";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v109[44] = v1;
  v108[45] = @"mixedSharingCompositionKeyAssetRelationship";
  uint64_t v62 = @"mixedSharingCompositionKeyAssetRelationship";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v109[45] = v2;
  v108[46] = @"assetsCountShared";
  v61 = @"assetsCountShared";
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v109[46] = v3;
  v108[47] = @"sharingComposition";
  uint64_t v60 = @"sharingComposition";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  v109[47] = v4;
  v108[48] = @"visibilityStateShared";
  v59 = @"visibilityStateShared";
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  v109[48] = v5;
  v108[49] = @"visibilityStateMixed";
  uint64_t v58 = @"visibilityStateMixed";
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  v109[49] = v6;
  v108[50] = @"photoAssetsSuggestedByPhotosCount";
  v57 = @"photoAssetsSuggestedByPhotosCount";
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  v109[50] = v7;
  v108[51] = @"videoAssetsSuggestedByPhotosCount";
  uint64_t v56 = @"videoAssetsSuggestedByPhotosCount";
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  v109[51] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:52];
  uint64_t v10 = [(PHEntityKeyMap *)v43 initWithPropertyKeysByEntityKey:v9];
  uint64_t v11 = (void *)entityKeyMap_pl_once_object_15_10731;
  entityKeyMap_pl_once_object_15_10731 = v10;
}

void __47__PHPhotosHighlight_propertiesToFetchWithHint___block_invoke()
{
  v4[53] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"uuid";
  v4[2] = @"title";
  v4[3] = @"subtitle";
  v4[4] = @"verboseSmartDescription";
  v4[5] = @"startDate";
  v4[6] = @"endDate";
  v4[7] = @"visibilityState";
  v4[8] = @"kind";
  v4[9] = @"type";
  v4[10] = @"category";
  v4[11] = @"startTimeZoneOffset";
  v4[12] = @"endTimeZoneOffset";
  v4[13] = @"promotionScore";
  v4[14] = @"enrichmentState";
  v4[15] = @"lastEnrichmentDate";
  v4[16] = @"mood";
  v4[17] = @"assetsCount";
  v4[18] = @"assetsCountShared";
  v4[19] = @"dayGroupAssetsCount";
  v4[20] = @"dayGroupExtendedAssetsCount";
  v4[21] = @"dayGroupSummaryAssetsCount";
  v4[22] = @"extendedCount";
  v4[23] = @"summaryCount";
  v4[24] = @"highlightVersion";
  v4[25] = @"enrichmentVersion";
  v4[26] = @"keyAssetPrivate";
  v4[27] = @"dayGroupKeyAssetPrivate";
  v4[28] = @"monthKeyAssetPrivate";
  v4[29] = @"yearKeyAssetPrivate";
  v4[30] = @"parentPhotosHighlight";
  v4[31] = @"assetsCountShared";
  v4[32] = @"dayGroupAssetsCountShared";
  v4[33] = @"dayGroupExtendedAssetsCountShared";
  v4[34] = @"dayGroupSummaryAssetsCountShared";
  v4[35] = @"extendedCountShared";
  v4[36] = @"summaryCountShared";
  v4[37] = @"keyAssetShared";
  v4[38] = @"dayGroupKeyAssetShared";
  v4[39] = @"monthKeyAssetShared";
  v4[40] = @"yearKeyAssetShared";
  v4[41] = @"titleShared";
  v4[42] = @"titleMixed";
  v4[43] = @"subtitleShared";
  v4[44] = @"subtitleMixed";
  v4[45] = @"verboseSmartDescriptionShared";
  v4[46] = @"verboseSmartDescriptionMixed";
  v4[47] = @"mixedSharingCompositionKeyAssetRelationship";
  v4[48] = @"sharingComposition";
  v4[49] = @"visibilityStateShared";
  v4[50] = @"visibilityStateMixed";
  v4[51] = @"photoAssetsSuggestedByPhotosCount";
  v4[52] = @"videoAssetsSuggestedByPhotosCount";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:53];
  int v3 = (void *)propertiesToFetchWithHint__array_10743;
  propertiesToFetchWithHint__array_10743 = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentPhotosHighlight, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetShared, 0);
  objc_storeStrong((id *)&self->_yearKeyAssetShared, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_yearKeyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionUserEdited, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionShared, 0);
  objc_storeStrong((id *)&self->_shortDateDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_shortDateDescriptionShared, 0);
  objc_storeStrong((id *)&self->_shortDateDescriptionPrivate, 0);
  objc_storeStrong((id *)&self->_dateDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_dateDescriptionShared, 0);
  objc_storeStrong((id *)&self->_titleMixed, 0);
  objc_storeStrong((id *)&self->_titleShared, 0);
  objc_storeStrong((id *)&self->_subtitleMixed, 0);
  objc_storeStrong((id *)&self->_subtitleShared, 0);
  objc_storeStrong((id *)&self->_lastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescription, 0);

  objc_storeStrong((id *)&self->_subtitle, 0);
}

- (unsigned)mixedSharingCompositionKeyAssetRelationship
{
  return self->_mixedSharingCompositionKeyAssetRelationship;
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (NSManagedObjectID)parentPhotosHighlight
{
  return self->_parentPhotosHighlight;
}

- (signed)enrichmentVersion
{
  return self->_enrichmentVersion;
}

- (signed)highlightVersion
{
  return self->_highlightVersion;
}

- (unint64_t)dayGroupSummaryAssetsCountShared
{
  return self->_dayGroupSummaryAssetsCountShared;
}

- (unint64_t)dayGroupExtendedAssetsCountShared
{
  return self->_dayGroupExtendedAssetsCountShared;
}

- (NSManagedObjectID)dayGroupKeyAssetShared
{
  return self->_dayGroupKeyAssetShared;
}

- (NSManagedObjectID)yearKeyAssetShared
{
  return self->_yearKeyAssetShared;
}

- (NSManagedObjectID)monthKeyAssetShared
{
  return self->_monthKeyAssetShared;
}

- (NSManagedObjectID)keyAssetShared
{
  return self->_keyAssetShared;
}

- (unsigned)visibilityStateMixed
{
  return self->_visibilityStateMixed;
}

- (unsigned)visibilityStateShared
{
  return self->_visibilityStateShared;
}

- (NSManagedObjectID)dayGroupKeyAssetPrivate
{
  return self->_dayGroupKeyAssetPrivate;
}

- (NSManagedObjectID)yearKeyAssetPrivate
{
  return self->_yearKeyAssetPrivate;
}

- (NSManagedObjectID)monthKeyAssetPrivate
{
  return self->_monthKeyAssetPrivate;
}

- (NSManagedObjectID)keyAssetPrivate
{
  return self->_keyAssetPrivate;
}

- (NSString)verboseSmartDescriptionUserEdited
{
  return self->_verboseSmartDescriptionUserEdited;
}

- (NSString)verboseSmartDescriptionMixed
{
  return self->_verboseSmartDescriptionMixed;
}

- (NSString)verboseSmartDescriptionShared
{
  return self->_verboseSmartDescriptionShared;
}

- (NSString)shortDateDescriptionMixed
{
  return self->_shortDateDescriptionMixed;
}

- (NSString)shortDateDescriptionShared
{
  return self->_shortDateDescriptionShared;
}

- (NSString)shortDateDescriptionPrivate
{
  return self->_shortDateDescriptionPrivate;
}

- (NSString)dateDescriptionMixed
{
  return self->_dateDescriptionMixed;
}

- (NSString)dateDescriptionShared
{
  return self->_dateDescriptionShared;
}

- (NSString)titleMixed
{
  return self->_titleMixed;
}

- (NSString)titleShared
{
  return self->_titleShared;
}

- (NSString)subtitleMixed
{
  return self->_subtitleMixed;
}

- (NSString)subtitleShared
{
  return self->_subtitleShared;
}

- (unint64_t)dayGroupSummaryAssetsCount
{
  return self->_dayGroupSummaryAssetsCount;
}

- (unint64_t)dayGroupExtendedAssetsCount
{
  return self->_dayGroupExtendedAssetsCount;
}

- (unint64_t)dayGroupAssetsCount
{
  return self->_dayGroupAssetsCount;
}

- (unint64_t)mood
{
  return self->_mood;
}

- (void)setLastEnrichmentDate:(id)a3
{
}

- (NSDate)lastEnrichmentDate
{
  return self->_lastEnrichmentDate;
}

- (void)setRecent:(BOOL)a3
{
  self->_recent = a3;
}

- (void)setEnriched:(BOOL)a3
{
  self->_enriched = a3;
}

- (BOOL)isEnriched
{
  return self->_enriched;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (int64_t)endTimeZoneOffset
{
  return self->_endTimeZoneOffset;
}

- (int64_t)startTimeZoneOffset
{
  return self->_startTimeZoneOffset;
}

- (void)setLocalEndDate:(id)a3
{
}

- (void)setLocalStartDate:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (unint64_t)videoAssetsSuggestedByPhotosCount
{
  return self->_videoAssetsSuggestedByPhotosCount;
}

- (unint64_t)photoAssetsSuggestedByPhotosCount
{
  return self->_photoAssetsSuggestedByPhotosCount;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)PHPhotosHighlight;
  int v3 = [(PHAssetCollection *)&v15 description];
  uint64_t v4 = [(PHPhotosHighlight *)self dateDescription];
  double v5 = [(PHPhotosHighlight *)self smartDescription];
  double v6 = [(PHPhotosHighlight *)self verboseSmartDescription];
  double v7 = [(PHAssetCollection *)self startDate];
  BOOL v8 = [(PHAssetCollection *)self endDate];
  [(PHPhotosHighlight *)self kind];
  uint64_t v9 = PLDescriptionForPhotosHighlightKind();
  [(PHPhotosHighlight *)self type];
  uint64_t v10 = PLDescriptionForPhotosHighlightType();
  BOOL v11 = [(PHPhotosHighlight *)self isRecent];
  uint64_t v12 = @"NO";
  if (v11) {
    uint64_t v12 = @"YES";
  }
  uint64_t v13 = [v3 stringByAppendingFormat:@"%@ - %@, verboseSmartDescription: %@, [%@ - %@], kind: %@, type: %@, isRecent: %@", v4, v5, v6, v7, v8, v9, v10, v12];

  return v13;
}

- (unsigned)preferredCurationType
{
  if (self->_kind) {
    BOOL v2 = self->_kind == 3;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 2;
  }
  else {
    return 0;
  }
}

- (NSManagedObjectID)keyAssetObjectIDForKind
{
  return (NSManagedObjectID *)[(PHPhotosHighlight *)self keyAssetObjectIDForKindWithFilter:self->_sharingFilter];
}

- (id)keyAssetObjectIDForKindWithFilter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  double v5 = objc_opt_class();

  return (id)[v5 _keyAssetObjectIDForHighlight:self filter:v3];
}

- (NSDate)localEndDate
{
  localEndDate = self->_localEndDate;
  if (!localEndDate)
  {
    uint64_t v4 = [(NSDate *)self->super._endDate dateByAddingTimeInterval:(double)self->_endTimeZoneOffset];
    double v5 = self->_localEndDate;
    self->_localEndDate = v4;

    localEndDate = self->_localEndDate;
  }

  return localEndDate;
}

- (NSDate)localStartDate
{
  localStartDate = self->_localStartDate;
  if (!localStartDate)
  {
    uint64_t v4 = [(NSDate *)self->super._startDate dateByAddingTimeInterval:(double)self->_startTimeZoneOffset];
    double v5 = self->_localStartDate;
    self->_localStartDate = v4;

    localStartDate = self->_localStartDate;
  }

  return localStartDate;
}

- (NSString)subtitlePrivate
{
  return self->_subtitle;
}

- (id)dateDescriptionWithOptions:(unint64_t)a3
{
  char v3 = a3;
  double v5 = [(PHPhotosHighlight *)self localStartDate];
  double v6 = [(PHPhotosHighlight *)self localEndDate];
  if ([(PHPhotosHighlight *)self kind] == 1)
  {
    [v6 timeIntervalSinceDate:v5];
    id v8 = [v5 dateByAddingTimeInterval:v7 * 0.5];

    double v6 = v8;
    double v5 = v8;
  }
  uint64_t v9 = [(id)objc_opt_class() dateRangeTitleGenerator];
  uint64_t v10 = objc_msgSend(v9, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", v5, v6, -[PHPhotosHighlight category](self, "category"), -[PHPhotosHighlight kind](self, "kind"), -[PHPhotosHighlight type](self, "type"), 2 * (v3 & 3));

  return v10;
}

- (NSString)subtitle
{
  subtitle = [(PHPhotosHighlight *)self verboseSmartDescriptionUserEdited];
  uint64_t v4 = subtitle;
  if (!subtitle) {
    subtitle = self->_subtitle;
  }
  double v5 = subtitle;

  return v5;
}

- (NSString)dateDescriptionPrivate
{
  return self->super._localizedTitle;
}

- (NSString)shortDateDescription
{
  int v3 = [(PHPhotosHighlight *)self kind];
  if (v3 != 3 && v3)
  {
    double v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionPrivate;
  }
  else
  {
    int sharingComposition = self->_sharingComposition;
    double v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionPrivate;
    if (sharingComposition == 2)
    {
      int sharingFilter = self->_sharingFilter;
      if (sharingFilter == 1) {
        double v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionShared;
      }
      if (sharingFilter == 2) {
        double v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionMixed;
      }
    }
    else if (sharingComposition == 1)
    {
      double v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionShared;
    }
  }
  double v7 = *(Class *)((char *)&self->super.super.super.super.isa + *v5);

  return (NSString *)v7;
}

- (unint64_t)countForCurationType:(unsigned __int16)a3
{
  if (a3 == 2) {
    return [(PHPhotosHighlight *)self extendedCount];
  }
  if (a3 == 1) {
    return [(PHPhotosHighlight *)self summaryCount];
  }
  return 0;
}

- (unint64_t)dayGroupSummaryAssetsCountMixed
{
  return self->_dayGroupSummaryAssetsCount;
}

- (unint64_t)dayGroupExtendedAssetsCountMixed
{
  return self->_dayGroupExtendedAssetsCount;
}

- (unint64_t)dayGroupAssetsCountMixed
{
  return self->_dayGroupAssetsCount;
}

- (unint64_t)dayGroupSummaryAssetsCountPrivate
{
  unint64_t dayGroupSummaryAssetsCount = self->_dayGroupSummaryAssetsCount;
  return dayGroupSummaryAssetsCount
       - [(PHPhotosHighlight *)self dayGroupSummaryAssetsCountShared];
}

- (unint64_t)dayGroupExtendedAssetsCountPrivate
{
  unint64_t dayGroupExtendedAssetsCount = self->_dayGroupExtendedAssetsCount;
  return dayGroupExtendedAssetsCount
       - [(PHPhotosHighlight *)self dayGroupExtendedAssetsCountShared];
}

- (unint64_t)summaryCountMixed
{
  return self->_summaryCount;
}

- (unint64_t)extendedCountMixed
{
  return self->_extendedCount;
}

- (unint64_t)assetsCountMixed
{
  return self->_assetsCount;
}

- (unint64_t)summaryCountPrivate
{
  unint64_t summaryCount = self->_summaryCount;
  return summaryCount - [(PHPhotosHighlight *)self summaryCountShared];
}

- (unint64_t)extendedCountPrivate
{
  unint64_t extendedCount = self->_extendedCount;
  return extendedCount - [(PHPhotosHighlight *)self extendedCountShared];
}

- (unint64_t)summaryCountShared
{
  return self->_summaryCountShared;
}

- (unint64_t)extendedCountShared
{
  return self->_extendedCountShared;
}

- (unsigned)visibilityState
{
  int sharingComposition = self->_sharingComposition;
  if (sharingComposition != 2)
  {
    if (sharingComposition != 1)
    {
      if (!self->_sharingComposition) {
        return [(PHPhotosHighlight *)self visibilityStatePrivate];
      }
      return 0;
    }
    return [(PHPhotosHighlight *)self visibilityStateShared];
  }
  int sharingFilter = self->_sharingFilter;
  if (sharingFilter != 2)
  {
    if (sharingFilter != 1)
    {
      if (!self->_sharingFilter) {
        return [(PHPhotosHighlight *)self visibilityStatePrivate];
      }
      return 0;
    }
    return [(PHPhotosHighlight *)self visibilityStateShared];
  }
  return [(PHPhotosHighlight *)self visibilityStateMixed];
}

- (unsigned)visibilityStatePrivate
{
  return self->_visibilityState;
}

- (unint64_t)summaryCount
{
  if (!self->_kind)
  {
    int sharingComposition = self->_sharingComposition;
    if (sharingComposition == 2)
    {
      int sharingFilter = self->_sharingFilter;
      if (sharingFilter == 2) {
        return [(PHPhotosHighlight *)self summaryCountMixed];
      }
      if (sharingFilter != 1)
      {
        if (self->_sharingFilter) {
          goto LABEL_8;
        }
        return [(PHPhotosHighlight *)self summaryCountPrivate];
      }
    }
    else if (sharingComposition != 1)
    {
      if (self->_sharingComposition) {
        goto LABEL_4;
      }
      return [(PHPhotosHighlight *)self summaryCountPrivate];
    }
    return [(PHPhotosHighlight *)self summaryCountShared];
  }
  if (self->_kind != 3) {
    return 0;
  }
  int sharingComposition = self->_sharingComposition;
LABEL_4:
  if (!sharingComposition) {
    return [(PHPhotosHighlight *)self dayGroupSummaryAssetsCountPrivate];
  }
  if (sharingComposition == 1) {
    return [(PHPhotosHighlight *)self dayGroupSummaryAssetsCountShared];
  }
  if (sharingComposition != 2) {
    return 0;
  }
  int sharingFilter = self->_sharingFilter;
LABEL_8:
  if (sharingFilter != 2)
  {
    if (sharingFilter != 1)
    {
      if (!sharingFilter) {
        return [(PHPhotosHighlight *)self dayGroupSummaryAssetsCountPrivate];
      }
      return 0;
    }
    return [(PHPhotosHighlight *)self dayGroupSummaryAssetsCountShared];
  }
  return [(PHPhotosHighlight *)self dayGroupSummaryAssetsCountMixed];
}

- (unint64_t)extendedCount
{
  unsigned int v2 = *(unsigned __int16 *)(self + 368);
  if (v2 >= 3)
  {
    if (v2 != 3) {
      return self;
    }
    int v3 = *(unsigned __int16 *)(self + 366);
    goto LABEL_8;
  }
  int v3 = *(unsigned __int16 *)(self + 366);
  if (v3 == 2)
  {
    int v4 = *(unsigned __int16 *)(self + 384);
    if (v4 == 2) {
      return [self extendedCountMixed];
    }
    if (v4 != 1)
    {
      if (!*(_WORD *)(self + 384)) {
        return [self extendedCountPrivate];
      }
      goto LABEL_17;
    }
    return [self extendedCountShared];
  }
  if (v3 == 1) {
    return [self extendedCountShared];
  }
  if (!*(_WORD *)(self + 366)) {
    return [self extendedCountPrivate];
  }
LABEL_8:
  if (!v3) {
    return [self dayGroupExtendedAssetsCountPrivate];
  }
  if (v3 == 1) {
    return [self dayGroupExtendedAssetsCountShared];
  }
  if (v3 != 2) {
    return self;
  }
  int v4 = *(unsigned __int16 *)(self + 384);
LABEL_17:
  switch(v4)
  {
    case 2:
      return [self dayGroupExtendedAssetsCountMixed];
    case 1:
      return [self dayGroupExtendedAssetsCountShared];
    case 0:
      return [self dayGroupExtendedAssetsCountPrivate];
  }
  return self;
}

- (NSString)verboseSmartDescriptionPrivate
{
  return self->_verboseSmartDescription;
}

- (NSString)verboseSmartDescription
{
  int sharingComposition = self->_sharingComposition;
  if (self->_sharingComposition)
  {
    if (sharingComposition == 2)
    {
      unint64_t sharingFilter = self->_sharingFilter;
      if (sharingFilter > 2) {
        goto LABEL_9;
      }
      int v3 = off_1E5843460[sharingFilter];
    }
    else
    {
      if (sharingComposition != 1) {
        goto LABEL_9;
      }
      int v3 = &OBJC_IVAR___PHPhotosHighlight__verboseSmartDescriptionShared;
    }
  }
  else
  {
    int v3 = &OBJC_IVAR___PHPhotosHighlight__verboseSmartDescription;
  }
  a2 = (SEL)*(id *)((char *)&self->super.super.super.super.isa + *v3);
LABEL_9:

  return (NSString *)(id)a2;
}

- (BOOL)canShowAvalancheStacks
{
  return 1;
}

- (BOOL)canContainCustomKeyAssets
{
  return 0;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 == 1;
}

+ (BOOL)locationOfInterestUpdate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F8AA90];
  int v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  int v4 = [v2 sharedAssetsdClientForPhotoLibraryURL:v3];

  double v5 = [v4 debugClient];
  id v10 = 0;
  char v6 = [v5 locationOfInterestUpdateWithError:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Failed to update location of interests with Error \"%@\".", buf, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)invalidateHighlightSubtitlesAndRegenerateHighlightTitles
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F8AA90];
  int v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  int v4 = [v2 sharedAssetsdClientForPhotoLibraryURL:v3];

  double v5 = [v4 debugClient];
  id v10 = 0;
  char v6 = [v5 invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Failed to regenerate highlight titles with Error \"%@\".", buf, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)cleanupEmptyHighlights
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F8AA90];
  int v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  int v4 = [v2 sharedAssetsdClientForPhotoLibraryURL:v3];

  double v5 = [v4 debugClient];
  id v10 = 0;
  char v6 = [v5 cleanupEmptyHighlightsWithError:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Failed to clean up empty highlights with Error \"%@\".", buf, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)updateHighlightTitles
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F8AA90];
  int v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  int v4 = [v2 sharedAssetsdClientForPhotoLibraryURL:v3];

  double v5 = [v4 debugClient];
  id v10 = 0;
  char v6 = [v5 updateHighlightTitlesWithError:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Failed to update highlight titles with Error \"%@\".", buf, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)processUnprocessedMomentLocations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F8AA90];
  int v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  int v4 = [v2 sharedAssetsdClientForPhotoLibraryURL:v3];

  double v5 = [v4 debugClient];
  id v10 = 0;
  char v6 = [v5 processUnprocessedMomentLocationsWithError:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Failed to process moments with unprocessed location with Error \"%@\".", buf, 0xCu);
    }
  }
  return v6;
}

+ (BOOL)processRecentHighlights
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F8AA90];
  int v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  int v4 = [v2 sharedAssetsdClientForPhotoLibraryURL:v3];

  double v5 = [v4 debugClient];
  id v10 = 0;
  char v6 = [v5 processRecentHighlightsWithError:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Failed to process recent highlights with Error \"%@\".", buf, 0xCu);
    }
  }
  return v6;
}

+ (id)fetchAllSharedLibrarySharingSuggestionHighlightsWithOptions:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  double v5 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v3 photoLibrary:v4];

  char v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
  [v6 addObject:v7];

  id v8 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0 || %K > 0", @"photoAssetsSuggestedByPhotosCount", @"videoAssetsSuggestedByPhotosCount");
  id v10 = (void *)MEMORY[0x1E4F28BA0];
  v21[0] = v8;
  v21[1] = v9;
  BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v12 = [v10 andPredicateWithSubpredicates:v11];
  [v5 setInternalPredicate:v12];

  uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v20[0] = v13;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v20[1] = v14;
  objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v5 setInternalSortDescriptors:v15];

  [v5 setSharingFilter:0];
  v19 = @"PHPhotosHighlightPropertySetSharingSuggestions";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  [v5 addFetchPropertySets:v16];

  uint64_t v17 = +[PHPhotosHighlight fetchHighlightsWithOptions:v5];

  return v17;
}

+ (id)fetchHighlightsInSharedLibrarySharingSuggestions:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PHPhotosHighlight.m", 1208, @"Invalid parameter not satisfying: %@", @"sharingSuggestions != nil" object file lineNumber description];
  }
  char v6 = [v5 firstObject];
  double v24 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:0 object:v6];

  id v7 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:0 photoLibrary:v24];
  id v8 = [v5 valueForKeyPath:@"objectID"];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"parentPhotosHighlight IN (%@)", v8];
  [v9 addObject:v10];

  BOOL v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
  [v9 addObject:v11];

  id v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v9];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0 || %K > 0", @"photoAssetsSuggestedByPhotosCount", @"videoAssetsSuggestedByPhotosCount");
  v14 = (void *)MEMORY[0x1E4F28BA0];
  v27[0] = v12;
  v27[1] = v13;
  objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v16 = [v14 andPredicateWithSubpredicates:v15];
  [v7 setInternalPredicate:v16];

  uint64_t v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v26[0] = v17;
  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v26[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v7 setInternalSortDescriptors:v19];

  [v7 setSharingFilter:0];
  v25 = @"PHPhotosHighlightPropertySetSharingSuggestions";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v7 addFetchPropertySets:v20];

  v21 = +[PHPhotosHighlight fetchHighlightsWithOptions:v7];

  return v21;
}

+ (id)fetchSharedLibrarySharingSuggestionsWithOptions:(id)a3
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v22 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  int v4 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v3);

  v21 = v4;
  id v5 = (void *)[v4 copy];
  [v5 setSharingFilter:0];
  char v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [v5 internalPredicate];

  if (v7)
  {
    id v8 = [v5 internalPredicate];
    [v6 addObject:v8];
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1);
  [v6 addObject:v9];

  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0 || %K > 0", @"photoAssetsSuggestedByPhotosCount", @"videoAssetsSuggestedByPhotosCount");
  [v6 addObject:v10];
  BOOL v11 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  [v5 setInternalPredicate:v11];

  id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v24[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
  v24[1] = v13;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"type" ascending:0];
  v24[2] = v14;
  objc_super v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"kind" ascending:1];
  v24[3] = v15;
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  v24[4] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
  [v5 setInternalSortDescriptors:v17];

  v23 = @"PHPhotosHighlightPropertySetSharingSuggestions";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [v5 addFetchPropertySets:v18];

  v19 = +[PHPhotosHighlight fetchHighlightsWithOptions:v5];

  return v19;
}

+ (id)fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 photoLibrary];
  id v8 = v7;
  if (v7)
  {
    *(void *)buf = 0;
    v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__10661;
    v21 = __Block_byref_object_dispose__10662;
    id v22 = 0;
    uint64_t v9 = [v7 photoLibraryForCurrentQueueQoS];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__PHPhotosHighlight_fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs_options___block_invoke;
    v13[3] = &unk_1E5848318;
    id v14 = v5;
    id v15 = v8;
    v16 = buf;
    [v9 performBlockAndWait:v13];
    id v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_FAULT, "Can't fetch PhotosHighlight using moment uuids because no PHPhotoLibrary specified", buf, 2u);
    }

    id v10 = (id)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

void __80__PHPhotosHighlight_fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs_options___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F8AAB8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) photoLibraryForCurrentQueueQoS];
  id v10 = 0;
  id v5 = [v2 batchFetchPhotosHighlightUUIDsByMomentUUIDsWithMomentUUIDs:v3 library:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v5;
    uint64_t v9 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    uint64_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching highlight uuid by moment uuid: %@", buf, 0xCu);
    }
  }
}

+ (id)_fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    *(void *)buf = 0;
    v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__10661;
    v21 = __Block_byref_object_dispose__10662;
    id v22 = 0;
    id v8 = [v6 photoLibraryForCurrentQueueQoS];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__PHPhotosHighlight__fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke;
    v13[3] = &unk_1E5848318;
    id v14 = v5;
    id v9 = v8;
    id v15 = v9;
    v16 = buf;
    [v9 performBlockAndWait:v13];
    id v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_FAULT, "Can't fetch trip highlights using assets uuids because no PHPhotoLibrary specified", buf, 2u);
    }

    id v10 = (id)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

void __82__PHPhotosHighlight__fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  int v4 = [MEMORY[0x1E4F8AAB8] batchFetchTripHighlightUUIDsByAssetUUIDsWithAssetUUIDs:v2 library:v3 error:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = v4;
    id v8 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Error batch fetching trip highlights by asset: %@", buf, 0xCu);
    }
  }
}

+ (id)fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = [a4 photoLibrary];
  id v8 = [a1 _fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:v6 photoLibrary:v7];

  return v8;
}

+ (id)_fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    *(void *)buf = 0;
    uint64_t v17 = buf;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__10661;
    v20 = __Block_byref_object_dispose__10662;
    id v21 = 0;
    id v8 = [v6 photoLibraryForCurrentQueueQoS];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__PHPhotosHighlight__fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke;
    v12[3] = &unk_1E5848318;
    id v13 = v5;
    id v14 = v7;
    id v15 = buf;
    [v8 performBlockAndWait:v12];
    id v9 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_FAULT, "Can't fetch PhotosHighlight using assets uuids because no PHPhotoLibrary specified", buf, 2u);
    }

    id v9 = (id)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

void __84__PHPhotosHighlight__fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F8AAB8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) photoLibraryForCurrentQueueQoS];
  id v10 = 0;
  id v5 = [v2 batchFetchPhotosHighlightUUIDsByAssetUUIDsWithAssetUUIDs:v3 library:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v5;
    id v9 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching person groups by asset: %@", buf, 0xCu);
    }
  }
}

+ (id)fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 photoLibrary];
  id v8 = [a1 _fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:v6 photoLibrary:v7];

  return v8;
}

+ (id)fetchPhotosHighlightUUIDByAssetUUIDForAssets:(id)a3 options:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 photoLibrary];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "uuid", (void)v19);
        [v9 addObject:v16];

        if (!v8)
        {
          id v8 = [v15 photoLibrary];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  if (v8)
  {
    uint64_t v17 = [a1 _fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:v9 photoLibrary:v8];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v17;
}

+ (id)fetchChildDayGroupHighlightsForHighlight:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PHPhotosHighlight_fetchChildDayGroupHighlightsForHighlight_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __70__PHPhotosHighlight_fetchChildDayGroupHighlightsForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForChildrenDayGroupHighlightsForPhotosHighlight:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchParentDayGroupHighlightForHighlight:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PHPhotosHighlight_fetchParentDayGroupHighlightForHighlight_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __70__PHPhotosHighlight_fetchParentDayGroupHighlightForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForParentDayGroupHighlightForPhotosHighlight:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchChildHighlightsForHighlight:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PHPhotosHighlight_fetchChildHighlightsForHighlight_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __62__PHPhotosHighlight_fetchChildHighlightsForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForChildrenHighlightsForPhotosHighlight:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchParentHighlightsForHighlights:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PHPhotosHighlight_fetchParentHighlightsForHighlights_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __64__PHPhotosHighlight_fetchParentHighlightsForHighlights_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForParentHighlightsForPhotosHighlights:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchParentHighlightForHighlight:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PHPhotosHighlight_fetchParentHighlightForHighlight_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __62__PHPhotosHighlight_fetchParentHighlightForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForParentHighlightForPhotosHighlight:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

id __89__PHPhotosHighlight_keyAssetInverseRelationshipPredicateForHighlight_forHighlightFilter___block_invoke_301(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  switch([v2 kind])
  {
    case 0u:
      uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      id v5 = (void *)v4;
      id v6 = @"highlightBeingKeyAssetShared";
      goto LABEL_9;
    case 1u:
      uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      id v5 = (void *)v4;
      id v6 = @"monthHighlightBeingKeyAssetShared";
      goto LABEL_9;
    case 2u:
      uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      id v5 = (void *)v4;
      id v6 = @"yearHighlightBeingKeyAssetShared";
      goto LABEL_9;
    case 3u:
      uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v4 = [v2 objectID];
      id v5 = (void *)v4;
      id v6 = @"dayGroupHighlightBeingKeyAssetShared";
LABEL_9:
      id v8 = [v3 predicateWithFormat:@"%K = %@", v6, v4];

      break;
    default:
      id v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = [v2 kind];
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "keyAssetInverseRelationshipPredicateForHighlight (sharedHandler): Unhandled highlight kind: %ld", buf, 0xCu);
      }

      id v8 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
      break;
  }

  return v8;
}

+ (id)dateRangeTitleGenerator
{
  pl_dispatch_once();
  id v2 = (void *)dateRangeTitleGenerator_pl_once_object_17;

  return v2;
}

void __44__PHPhotosHighlight_dateRangeTitleGenerator__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F8A7A0]);
  v1 = (void *)dateRangeTitleGenerator_pl_once_object_17;
  dateRangeTitleGenerator_pl_once_object_17 = (uint64_t)v0;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___PHPhotosHighlight;
  id v7 = objc_msgSendSuper2(&v14, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  if (!v7)
  {
    id v8 = [v6 leftExpression];
    id v9 = [v6 rightExpression];
    if ([v8 expressionType] == 3)
    {
      id v10 = [v8 keyPath];
    }
    else
    {
      id v10 = 0;
    }
    if ([v10 isEqualToString:@"enriched"] && !objc_msgSend(v9, "expressionType"))
    {
      uint64_t v11 = [v9 constantValue];
      if ([v11 BOOLValue]) {
        uint64_t v12 = @"enrichmentState > %d";
      }
      else {
        uint64_t v12 = @"enrichmentState == %d";
      }
      id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v12, 0);
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PHPhotosHighlight_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_10703 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_10703, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_10704 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __57__PHPhotosHighlight_transformValueExpression_forKeyPath___block_invoke()
{
  v4[47] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"localizedTitle";
  v4[1] = @"title";
  v4[2] = @"subtitle";
  v4[3] = @"dateDescription";
  v4[4] = @"smartDescription";
  v4[5] = @"verboseSmartDescription";
  v4[6] = @"endDate";
  v4[7] = @"startDate";
  v4[8] = @"visibilityState";
  v4[9] = @"kind";
  v4[10] = @"type";
  v4[11] = @"category";
  v4[12] = @"startTimeZoneOffset";
  v4[13] = @"endTimeZoneOffset";
  v4[14] = @"promotionScore";
  v4[15] = @"mood";
  v4[16] = @"estimatedAssetCount";
  v4[17] = @"assetsCount";
  v4[18] = @"extendedCount";
  v4[19] = @"summaryCount";
  v4[20] = @"enrichmentState";
  v4[21] = @"keyAssetPrivate";
  v4[22] = @"dayGroupKeyAssetPrivate";
  v4[23] = @"monthKeyAssetPrivate";
  v4[24] = @"yearKeyAssetPrivate";
  v4[25] = @"parentPhotosHighlight";
  v4[26] = @"titleShared";
  v4[27] = @"titleMixed";
  v4[28] = @"subtitleShared";
  v4[29] = @"subtitleMixed";
  v4[30] = @"dateDescriptionShared";
  v4[31] = @"dateDescriptionMixed";
  v4[32] = @"smartDescriptionShared";
  v4[33] = @"smartDescriptionMixed";
  v4[34] = @"assetsCountShared";
  v4[35] = @"extendedCountShared";
  v4[36] = @"summaryCountShared";
  v4[37] = @"keyAssetShared";
  v4[38] = @"dayGroupKeyAssetShared";
  v4[39] = @"monthKeyAssetShared";
  v4[40] = @"yearKeyAssetShared";
  v4[41] = @"verboseSmartDescriptionShared";
  v4[42] = @"verboseSmartDescriptionMixed";
  v4[43] = @"mixedSharingCompositionKeyAssetRelationship";
  v4[44] = @"sharingComposition";
  v4[45] = @"photoAssetsSuggestedByPhotosCount";
  v4[46] = @"videoAssetsSuggestedByPhotosCount";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:47];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_10704;
  transformValueExpression_forKeyPath___passThroughSet_10704 = v2;
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  if (!a3)
  {
    uint64_t v5 = 1;
LABEL_5:
    id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"sharingComposition", v5, v3);
    return v6;
  }
  if (a3 == 1)
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [@"PHPhotosHighlightPropertySetIdentifier" length];
  if ((v3 & 1) != 0 && v5) {
    [v4 addObject:@"PHPhotosHighlightPropertySetIdentifier"];
  }
  uint64_t v6 = [@"PHPhotosHighlightPropertySetCore" length];
  if ((v3 & 2) != 0 && v6) {
    [v4 addObject:@"PHPhotosHighlightPropertySetCore"];
  }
  uint64_t v7 = [@"PHPhotosHighlightPropertySetOnlyPrivate" length];
  if ((v3 & 4) != 0 && v7) {
    [v4 addObject:@"PHPhotosHighlightPropertySetOnlyPrivate"];
  }
  uint64_t v8 = [@"PHPhotosHighlightPropertySetOnlyShared" length];
  if ((v3 & 8) != 0 && v8) {
    [v4 addObject:@"PHPhotosHighlightPropertySetOnlyShared"];
  }
  uint64_t v9 = [@"PHPhotosHighlightPropertySetPrivateOrShared" length];
  if ((v3 & 0x10) != 0 && v9) {
    [v4 addObject:@"PHPhotosHighlightPropertySetPrivateOrShared"];
  }
  uint64_t v10 = [@"PHPhotosHighlightPropertySetSharingSuggestions" length];
  if ((v3 & 0x20) != 0 && v10) {
    [v4 addObject:@"PHPhotosHighlightPropertySetSharingSuggestions"];
  }
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];

  return v11;
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken != -1) {
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken, &__block_literal_global_51);
  }
  uint64_t v2 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName;

  return v2;
}

void __54__PHPhotosHighlight_propertySetAccessorsByPropertySet__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHPhotosHighlightPropertySetIdentifier";
  v2[1] = @"PHPhotosHighlightPropertySetCore";
  v3[0] = @"self";
  v3[1] = @"self";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName;
  propertySetAccessorsByPropertySet_accessorByPropertySetName = v0;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3 = propertySetClassForPropertySet__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&propertySetClassForPropertySet__onceToken, &__block_literal_global_48);
  }
  uint64_t v5 = [(id)propertySetClassForPropertySet__propertySetClassByPropertySetName objectForKey:v4];

  return (Class)v5;
}

void __52__PHPhotosHighlight_propertySetClassForPropertySet___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHPhotosHighlightPropertySetIdentifier";
  v2[1] = @"PHPhotosHighlightPropertySetCore";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName;
  propertySetClassForPropertySet__propertySetClassByPropertySetName = v0;
}

+ (id)_keyAssetObjectIDForHighlight:(id)a3 filter:(unsigned __int16)a4
{
  return (id)[a1 _choosePrivateOrSharedRelationshipForHighlight:a3 givenFilter:a4 privateHandler:&__block_literal_global_10747 sharedHandler:&__block_literal_global_45];
}

id __58__PHPhotosHighlight__keyAssetObjectIDForHighlight_filter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch([v3 kind])
  {
    case 0u:
      uint64_t v4 = [v3 keyAssetShared];
      goto LABEL_6;
    case 1u:
      uint64_t v4 = [v3 monthKeyAssetShared];
      goto LABEL_6;
    case 2u:
      uint64_t v4 = [v3 yearKeyAssetShared];
      goto LABEL_6;
    case 3u:
      uint64_t v4 = [v3 dayGroupKeyAssetShared];
LABEL_6:
      uint64_t v2 = (void *)v4;
      break;
    default:
      break;
  }

  return v2;
}

id __58__PHPhotosHighlight__keyAssetObjectIDForHighlight_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch([v3 kind])
  {
    case 0u:
      uint64_t v4 = [v3 keyAssetPrivate];
      goto LABEL_6;
    case 1u:
      uint64_t v4 = [v3 monthKeyAssetPrivate];
      goto LABEL_6;
    case 2u:
      uint64_t v4 = [v3 yearKeyAssetPrivate];
      goto LABEL_6;
    case 3u:
      uint64_t v4 = [v3 dayGroupKeyAssetPrivate];
LABEL_6:
      uint64_t v2 = (void *)v4;
      break;
    default:
      break;
  }

  return v2;
}

@end