@interface BMMomentsEventDataEventBundle
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataAction)bundleActionType;
- (BMMomentsEventDataEventBundle)initWithBundleIdentifier:(id)a3 bundleStartDate:(id)a4 bundleEndDate:(id)a5 bundleCreationDate:(id)a6 bundleExpirationDate:(id)a7 bundleInterfaceType:(int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(id)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(id)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(id)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(int)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(int)a18 bundleEventIDs:(id)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(id)a22 bundleTimeTag:(int)a23 isBundleResourceTypeUnknown:(id)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(id)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(id)a29 bundlEngagement:(int)a30 bundleVersion:(id)a31 rankingVersion:(id)a32;
- (BMMomentsEventDataEventBundle)initWithBundleIdentifier:(void *)a3 bundleStartDate:(void *)a4 bundleEndDate:(void *)a5 bundleCreationDate:(void *)a6 bundleExpirationDate:(void *)a7 bundleInterfaceType:(int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(id)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(id)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(id)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(int)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(int)a18 bundleEventIDs:(id)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(id)a22 bundleTimeTag:(int)a23 isBundleResourceTypeUnknown:(id)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(id)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(id)a29 bundlEngagement:(int)a30 bundleVersion:(id)a31 rankingVersion:(id)a32 suggestionType:(int)a33 suggestionTimestamp:(id)a34 suggestionClientIdentifier:(id)a35 suggestionViewContainerName:(id)a36 suggestionViewVisibleTime:(id)a37 appEntryEventType:(int)a38 appEntryEventClientIdentifier:(id)a39 appEntryEventTimestamp:(id)a40 appEntryEventStartTime:(id)a41 appEntryEventEndTime:(id)a42 appEntryEventTotalCharacters:(id)a43 appEntryEventAddedCharacters:(id)a44 clientActivityEventType:(int)a45 clientActivityEventClientIdentifier:(id)a46 clientActivityEventTimestamp:(id)a47 suggestionIdentifier:(id)a48 photoSourceType:(int)a49 photoLibraryType:(int)a50 bundleSourcePostAnalyticsExists:(id)a51 bundleSourcePDExists:(id)a52 bundleSourceMotionExists:(id)a53 bundleSourceBooksExists:(id)a54 bundleSourceScreenTimeExists:(id)a55 gaPRArray:(id)a56 bundlePCount:(id)a57 ranking:(int)a58 labelConfidenceScore:(int)a59 timeCorrelationScore:(int)a60 callDuration:(int)a61 interactionCount:(int)a62 interactionType:(int)a63 callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:;
- (BMMomentsEventDataEventBundle)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataEventBundleClusterMetadata)clusterMetadata;
- (BMMomentsEventDataEventBundleMetadataForRank)metadataForRank;
- (BMMomentsEventDataEventBundleOutlierMetadata)outlierMetadata;
- (BMMomentsEventDataEventBundlePlace)mainPlace;
- (BOOL)bundleIsFamilyIncluded;
- (BOOL)bundlePromptParametersAvailability;
- (BOOL)bundleSourceBooksExists;
- (BOOL)bundleSourceHealthExists;
- (BOOL)bundleSourceMotionExists;
- (BOOL)bundleSourcePDExists;
- (BOOL)bundleSourcePhotoExists;
- (BOOL)bundleSourcePostAnalyticsExists;
- (BOOL)bundleSourceProactiveExists;
- (BOOL)bundleSourceRoutineExists;
- (BOOL)bundleSourceScreenTimeExists;
- (BOOL)hasAppEntryEventAddedCharacters;
- (BOOL)hasAppEntryEventTotalCharacters;
- (BOOL)hasBundleGoodnessScore;
- (BOOL)hasBundleIsFamilyIncluded;
- (BOOL)hasBundlePCount;
- (BOOL)hasBundlePromptParametersAvailability;
- (BOOL)hasBundleSourceBooksExists;
- (BOOL)hasBundleSourceHealthExists;
- (BOOL)hasBundleSourceMotionExists;
- (BOOL)hasBundleSourcePDExists;
- (BOOL)hasBundleSourcePhotoExists;
- (BOOL)hasBundleSourcePostAnalyticsExists;
- (BOOL)hasBundleSourceProactiveExists;
- (BOOL)hasBundleSourceRoutineExists;
- (BOOL)hasBundleSourceScreenTimeExists;
- (BOOL)hasBundleVersion;
- (BOOL)hasDistinctnessScore;
- (BOOL)hasEngagementScore;
- (BOOL)hasHeuristicsScore;
- (BOOL)hasIncludedInSummaryBundleOnly;
- (BOOL)hasIsAggregatedAndSuppressed;
- (BOOL)hasIsBundleResourceTypeInterenceTagIncluded;
- (BOOL)hasIsBundleResourceTypeMediaIncluded;
- (BOOL)hasIsBundleResourceTypePhotoAssetsIncluded;
- (BOOL)hasIsBundleResourceTypeUnknown;
- (BOOL)hasIsBundleResourceTypeValueIncluded;
- (BOOL)hasIsBundleResourceTypeWebLinkIncluded;
- (BOOL)hasIsFiltered;
- (BOOL)hasRankingVersion;
- (BOOL)hasRichnessScore;
- (BOOL)hasSuggestionViewVisibleTime;
- (BOOL)includedInSummaryBundleOnly;
- (BOOL)isAggregatedAndSuppressed;
- (BOOL)isBundleResourceTypeInterenceTagIncluded;
- (BOOL)isBundleResourceTypeMediaIncluded;
- (BOOL)isBundleResourceTypePhotoAssetsIncluded;
- (BOOL)isBundleResourceTypeUnknown;
- (BOOL)isBundleResourceTypeValueIncluded;
- (BOOL)isBundleResourceTypeWebLinkIncluded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFiltered;
- (NSArray)backgroundActions;
- (NSArray)bundleEventIDs;
- (NSArray)gaPRArray;
- (NSArray)otherPlaces;
- (NSArray)persons;
- (NSArray)photoTraits;
- (NSArray)resources;
- (NSArray)subBundleIDs;
- (NSArray)subSuggestionIDs;
- (NSDate)appEntryEventEndTime;
- (NSDate)appEntryEventStartTime;
- (NSDate)appEntryEventTimestamp;
- (NSDate)bundleCreationDate;
- (NSDate)bundleEndDate;
- (NSDate)bundleExpirationDate;
- (NSDate)bundleStartDate;
- (NSDate)clientActivityEventTimestamp;
- (NSDate)firstCreationDate;
- (NSDate)suggestionTimestamp;
- (NSString)appEntryEventClientIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundlePromptLanguageFormat;
- (NSString)bundlePromptToneID;
- (NSString)clientActivityEventClientIdentifier;
- (NSString)description;
- (NSString)suggestionClientIdentifier;
- (NSString)suggestionIdentifier;
- (NSString)suggestionViewContainerName;
- (double)bundleGoodnessScore;
- (double)bundleVersion;
- (double)distinctnessScore;
- (double)engagementScore;
- (double)heuristicsScore;
- (double)rankingVersion;
- (double)richnessScore;
- (double)suggestionViewVisibleTime;
- (id)_backgroundActionsJSONArray;
- (id)_bundleEventIDsJSONArray;
- (id)_gaPRArrayJSONArray;
- (id)_otherPlacesJSONArray;
- (id)_personsJSONArray;
- (id)_photoTraitsJSONArray;
- (id)_resourcesJSONArray;
- (id)_subBundleIDsJSONArray;
- (id)_subSuggestionIDsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)appEntryEventAddedCharacters;
- (int)appEntryEventTotalCharacters;
- (int)appEntryEventType;
- (int)bundlEngagement;
- (int)bundleBaseEventCateory;
- (int)bundleIncludesAnomalousEvent;
- (int)bundleInterfaceType;
- (int)bundlePCount;
- (int)bundlePlaceType;
- (int)bundlePlaceUserType;
- (int)bundleSubType;
- (int)bundleSuperType;
- (int)bundleTimeTag;
- (int)bundleVisitMapItemSource;
- (int)bundleVisitPlaceLabelGranularity;
- (int)bundleVisitPlaceType;
- (int)callDuration;
- (int)callPlace;
- (int)clientActivityEventType;
- (int)distanceFromHome;
- (int)homeAvailability;
- (int)interactionCount;
- (int)interactionType;
- (int)labelConfidenceScore;
- (int)photoLibraryType;
- (int)photoSourceType;
- (int)ranking;
- (int)suggestionType;
- (int)summarizationGranularity;
- (int)timeCorrelationScore;
- (int)workAvailability;
- (uint64_t)initWithBundleIdentifier:(uint64_t)a3 bundleStartDate:(uint64_t)a4 bundleEndDate:(uint64_t)a5 bundleCreationDate:(uint64_t)a6 bundleExpirationDate:(uint64_t)a7 bundleInterfaceType:(unsigned int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(uint64_t)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(uint64_t)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(uint64_t)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(uint64_t)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(id)a18 bundleEventIDs:(uint64_t)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(int)a22 bundleTimeTag:(id)a23 isBundleResourceTypeUnknown:(uint64_t)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(uint64_t)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(int)a29 bundlEngagement:(id)a30 bundleVersion:(id)a31 rankingVersion:(int)a32 suggestionType:(id)a33 suggestionTimestamp:(uint64_t)a34 suggestionClientIdentifier:(id)a35 suggestionViewContainerName:(id)a36 suggestionViewVisibleTime:(int)a37 appEntryEventType:(id)a38 appEntryEventClientIdentifier:(uint64_t)a39 appEntryEventTimestamp:(uint64_t)a40 appEntryEventStartTime:(uint64_t)a41 appEntryEventEndTime:(id)a42 appEntryEventTotalCharacters:(id)a43 appEntryEventAddedCharacters:(int)a44 clientActivityEventType:(id)a45 clientActivityEventClientIdentifier:(uint64_t)a46 clientActivityEventTimestamp:(id)a47 suggestionIdentifier:(uint64_t)a48 photoSourceType:(id)a49 photoLibraryType:(uint64_t)a50 bundleSourcePostAnalyticsExists:(id)a51 bundleSourcePDExists:(uint64_t)a52 bundleSourceMotionExists:(id)a53 bundleSourceBooksExists:(uint64_t)a54 bundleSourceScreenTimeExists:(id)a55 gaPRArray:(uint64_t)a56 bundlePCount:(uint64_t)a57 ranking:(uint64_t)a58 labelConfidenceScore:(uint64_t)a59 timeCorrelationScore:(uint64_t)a60 callDuration:(uint64_t)a61 interactionCount:(uint64_t)a62 interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:;
- (unsigned)dataVersion;
- (void)setHasAppEntryEventAddedCharacters:(BOOL)a3;
- (void)setHasAppEntryEventTotalCharacters:(BOOL)a3;
- (void)setHasBundleGoodnessScore:(BOOL)a3;
- (void)setHasBundleIsFamilyIncluded:(BOOL)a3;
- (void)setHasBundlePCount:(BOOL)a3;
- (void)setHasBundlePromptParametersAvailability:(BOOL)a3;
- (void)setHasBundleSourceBooksExists:(BOOL)a3;
- (void)setHasBundleSourceHealthExists:(BOOL)a3;
- (void)setHasBundleSourceMotionExists:(BOOL)a3;
- (void)setHasBundleSourcePDExists:(BOOL)a3;
- (void)setHasBundleSourcePhotoExists:(BOOL)a3;
- (void)setHasBundleSourcePostAnalyticsExists:(BOOL)a3;
- (void)setHasBundleSourceProactiveExists:(BOOL)a3;
- (void)setHasBundleSourceRoutineExists:(BOOL)a3;
- (void)setHasBundleSourceScreenTimeExists:(BOOL)a3;
- (void)setHasBundleVersion:(BOOL)a3;
- (void)setHasDistinctnessScore:(BOOL)a3;
- (void)setHasEngagementScore:(BOOL)a3;
- (void)setHasHeuristicsScore:(BOOL)a3;
- (void)setHasIncludedInSummaryBundleOnly:(BOOL)a3;
- (void)setHasIsAggregatedAndSuppressed:(BOOL)a3;
- (void)setHasIsBundleResourceTypeInterenceTagIncluded:(BOOL)a3;
- (void)setHasIsBundleResourceTypeMediaIncluded:(BOOL)a3;
- (void)setHasIsBundleResourceTypePhotoAssetsIncluded:(BOOL)a3;
- (void)setHasIsBundleResourceTypeUnknown:(BOOL)a3;
- (void)setHasIsBundleResourceTypeValueIncluded:(BOOL)a3;
- (void)setHasIsBundleResourceTypeWebLinkIncluded:(BOOL)a3;
- (void)setHasIsFiltered:(BOOL)a3;
- (void)setHasRankingVersion:(BOOL)a3;
- (void)setHasRichnessScore:(BOOL)a3;
- (void)setHasSuggestionViewVisibleTime:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePromptToneID, 0);
  objc_storeStrong((id *)&self->_metadataForRank, 0);
  objc_storeStrong((id *)&self->_outlierMetadata, 0);
  objc_storeStrong((id *)&self->_clusterMetadata, 0);
  objc_storeStrong((id *)&self->_photoTraits, 0);
  objc_storeStrong((id *)&self->_otherPlaces, 0);
  objc_storeStrong((id *)&self->_mainPlace, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_subSuggestionIDs, 0);
  objc_storeStrong((id *)&self->_subBundleIDs, 0);
  objc_storeStrong((id *)&self->_gaPRArray, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientActivityEventClientIdentifier, 0);
  objc_storeStrong((id *)&self->_appEntryEventClientIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionViewContainerName, 0);
  objc_storeStrong((id *)&self->_suggestionClientIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundActions, 0);
  objc_storeStrong((id *)&self->_bundleActionType, 0);
  objc_storeStrong((id *)&self->_bundleEventIDs, 0);
  objc_storeStrong((id *)&self->_bundlePromptLanguageFormat, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (int)bundlEngagement
{
  return self->_bundlEngagement;
}

- (void)setHasIsBundleResourceTypeInterenceTagIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeInterenceTagIncluded = a3;
}

- (BOOL)hasIsBundleResourceTypeInterenceTagIncluded
{
  return self->_hasIsBundleResourceTypeInterenceTagIncluded;
}

- (BOOL)isBundleResourceTypeInterenceTagIncluded
{
  return self->_isBundleResourceTypeInterenceTagIncluded;
}

- (void)setHasIsBundleResourceTypeWebLinkIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeWebLinkIncluded = a3;
}

- (BOOL)hasIsBundleResourceTypeWebLinkIncluded
{
  return self->_hasIsBundleResourceTypeWebLinkIncluded;
}

- (BOOL)isBundleResourceTypeWebLinkIncluded
{
  return self->_isBundleResourceTypeWebLinkIncluded;
}

- (void)setHasIsBundleResourceTypeMediaIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeMediaIncluded = a3;
}

- (BOOL)hasIsBundleResourceTypeMediaIncluded
{
  return self->_hasIsBundleResourceTypeMediaIncluded;
}

- (BOOL)isBundleResourceTypeMediaIncluded
{
  return self->_isBundleResourceTypeMediaIncluded;
}

- (void)setHasIsBundleResourceTypePhotoAssetsIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypePhotoAssetsIncluded = a3;
}

- (BOOL)hasIsBundleResourceTypePhotoAssetsIncluded
{
  return self->_hasIsBundleResourceTypePhotoAssetsIncluded;
}

- (BOOL)isBundleResourceTypePhotoAssetsIncluded
{
  return self->_isBundleResourceTypePhotoAssetsIncluded;
}

- (void)setHasIsBundleResourceTypeValueIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeValueIncluded = a3;
}

- (BOOL)hasIsBundleResourceTypeValueIncluded
{
  return self->_hasIsBundleResourceTypeValueIncluded;
}

- (BOOL)isBundleResourceTypeValueIncluded
{
  return self->_isBundleResourceTypeValueIncluded;
}

- (void)setHasIsBundleResourceTypeUnknown:(BOOL)a3
{
  self->_hasIsBundleResourceTypeUnknown = a3;
}

- (BOOL)hasIsBundleResourceTypeUnknown
{
  return self->_hasIsBundleResourceTypeUnknown;
}

- (BOOL)isBundleResourceTypeUnknown
{
  return self->_isBundleResourceTypeUnknown;
}

- (int)bundleBaseEventCateory
{
  return self->_bundleBaseEventCateory;
}

- (int)bundlePlaceUserType
{
  return self->_bundlePlaceUserType;
}

- (int)bundlePlaceType
{
  return self->_bundlePlaceType;
}

- (void)setHasBundlePromptParametersAvailability:(BOOL)a3
{
  self->_hasBundlePromptParametersAvailability = a3;
}

- (BOOL)hasBundlePromptParametersAvailability
{
  return self->_hasBundlePromptParametersAvailability;
}

- (BOOL)bundlePromptParametersAvailability
{
  return self->_bundlePromptParametersAvailability;
}

- (NSString)bundlePromptToneID
{
  return self->_bundlePromptToneID;
}

- (BMMomentsEventDataEventBundleMetadataForRank)metadataForRank
{
  return self->_metadataForRank;
}

- (void)setHasHeuristicsScore:(BOOL)a3
{
  self->_hasHeuristicsScore = a3;
}

- (BOOL)hasHeuristicsScore
{
  return self->_hasHeuristicsScore;
}

- (double)heuristicsScore
{
  return self->_heuristicsScore;
}

- (void)setHasEngagementScore:(BOOL)a3
{
  self->_hasEngagementScore = a3;
}

- (BOOL)hasEngagementScore
{
  return self->_hasEngagementScore;
}

- (double)engagementScore
{
  return self->_engagementScore;
}

- (void)setHasRichnessScore:(BOOL)a3
{
  self->_hasRichnessScore = a3;
}

- (BOOL)hasRichnessScore
{
  return self->_hasRichnessScore;
}

- (double)richnessScore
{
  return self->_richnessScore;
}

- (void)setHasDistinctnessScore:(BOOL)a3
{
  self->_hasDistinctnessScore = a3;
}

- (BOOL)hasDistinctnessScore
{
  return self->_hasDistinctnessScore;
}

- (double)distinctnessScore
{
  return self->_distinctnessScore;
}

- (void)setHasBundleGoodnessScore:(BOOL)a3
{
  self->_hasBundleGoodnessScore = a3;
}

- (BOOL)hasBundleGoodnessScore
{
  return self->_hasBundleGoodnessScore;
}

- (double)bundleGoodnessScore
{
  return self->_bundleGoodnessScore;
}

- (BMMomentsEventDataEventBundleOutlierMetadata)outlierMetadata
{
  return self->_outlierMetadata;
}

- (BMMomentsEventDataEventBundleClusterMetadata)clusterMetadata
{
  return self->_clusterMetadata;
}

- (NSArray)photoTraits
{
  return self->_photoTraits;
}

- (NSArray)otherPlaces
{
  return self->_otherPlaces;
}

- (BMMomentsEventDataEventBundlePlace)mainPlace
{
  return self->_mainPlace;
}

- (NSArray)persons
{
  return self->_persons;
}

- (NSArray)resources
{
  return self->_resources;
}

- (NSArray)subSuggestionIDs
{
  return self->_subSuggestionIDs;
}

- (NSArray)subBundleIDs
{
  return self->_subBundleIDs;
}

- (void)setHasIncludedInSummaryBundleOnly:(BOOL)a3
{
  self->_hasIncludedInSummaryBundleOnly = a3;
}

- (BOOL)hasIncludedInSummaryBundleOnly
{
  return self->_hasIncludedInSummaryBundleOnly;
}

- (BOOL)includedInSummaryBundleOnly
{
  return self->_includedInSummaryBundleOnly;
}

- (int)summarizationGranularity
{
  return self->_summarizationGranularity;
}

- (void)setHasIsAggregatedAndSuppressed:(BOOL)a3
{
  self->_hasIsAggregatedAndSuppressed = a3;
}

- (BOOL)hasIsAggregatedAndSuppressed
{
  return self->_hasIsAggregatedAndSuppressed;
}

- (BOOL)isAggregatedAndSuppressed
{
  return self->_isAggregatedAndSuppressed;
}

- (int)bundleSubType
{
  return self->_bundleSubType;
}

- (int)bundleSuperType
{
  return self->_bundleSuperType;
}

- (void)setHasIsFiltered:(BOOL)a3
{
  self->_hasIsFiltered = a3;
}

- (BOOL)hasIsFiltered
{
  return self->_hasIsFiltered;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (int)bundleIncludesAnomalousEvent
{
  return self->_bundleIncludesAnomalousEvent;
}

- (int)bundleVisitPlaceLabelGranularity
{
  return self->_bundleVisitPlaceLabelGranularity;
}

- (int)bundleVisitPlaceType
{
  return self->_bundleVisitPlaceType;
}

- (int)bundleVisitMapItemSource
{
  return self->_bundleVisitMapItemSource;
}

- (int)workAvailability
{
  return self->_workAvailability;
}

- (int)homeAvailability
{
  return self->_homeAvailability;
}

- (int)distanceFromHome
{
  return self->_distanceFromHome;
}

- (int)callPlace
{
  return self->_callPlace;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (int)interactionCount
{
  return self->_interactionCount;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (int)timeCorrelationScore
{
  return self->_timeCorrelationScore;
}

- (int)labelConfidenceScore
{
  return self->_labelConfidenceScore;
}

- (int)ranking
{
  return self->_ranking;
}

- (void)setHasBundlePCount:(BOOL)a3
{
  self->_hasBundlePCount = a3;
}

- (BOOL)hasBundlePCount
{
  return self->_hasBundlePCount;
}

- (int)bundlePCount
{
  return self->_bundlePCount;
}

- (NSArray)gaPRArray
{
  return self->_gaPRArray;
}

- (void)setHasBundleSourceScreenTimeExists:(BOOL)a3
{
  self->_hasBundleSourceScreenTimeExists = a3;
}

- (BOOL)hasBundleSourceScreenTimeExists
{
  return self->_hasBundleSourceScreenTimeExists;
}

- (BOOL)bundleSourceScreenTimeExists
{
  return self->_bundleSourceScreenTimeExists;
}

- (void)setHasBundleSourceBooksExists:(BOOL)a3
{
  self->_hasBundleSourceBooksExists = a3;
}

- (BOOL)hasBundleSourceBooksExists
{
  return self->_hasBundleSourceBooksExists;
}

- (BOOL)bundleSourceBooksExists
{
  return self->_bundleSourceBooksExists;
}

- (void)setHasBundleSourceMotionExists:(BOOL)a3
{
  self->_hasBundleSourceMotionExists = a3;
}

- (BOOL)hasBundleSourceMotionExists
{
  return self->_hasBundleSourceMotionExists;
}

- (BOOL)bundleSourceMotionExists
{
  return self->_bundleSourceMotionExists;
}

- (void)setHasBundleSourcePDExists:(BOOL)a3
{
  self->_hasBundleSourcePDExists = a3;
}

- (BOOL)hasBundleSourcePDExists
{
  return self->_hasBundleSourcePDExists;
}

- (BOOL)bundleSourcePDExists
{
  return self->_bundleSourcePDExists;
}

- (void)setHasBundleSourcePostAnalyticsExists:(BOOL)a3
{
  self->_hasBundleSourcePostAnalyticsExists = a3;
}

- (BOOL)hasBundleSourcePostAnalyticsExists
{
  return self->_hasBundleSourcePostAnalyticsExists;
}

- (BOOL)bundleSourcePostAnalyticsExists
{
  return self->_bundleSourcePostAnalyticsExists;
}

- (int)photoLibraryType
{
  return self->_photoLibraryType;
}

- (int)photoSourceType
{
  return self->_photoSourceType;
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (NSString)clientActivityEventClientIdentifier
{
  return self->_clientActivityEventClientIdentifier;
}

- (int)clientActivityEventType
{
  return self->_clientActivityEventType;
}

- (void)setHasAppEntryEventAddedCharacters:(BOOL)a3
{
  self->_hasAppEntryEventAddedCharacters = a3;
}

- (BOOL)hasAppEntryEventAddedCharacters
{
  return self->_hasAppEntryEventAddedCharacters;
}

- (int)appEntryEventAddedCharacters
{
  return self->_appEntryEventAddedCharacters;
}

- (void)setHasAppEntryEventTotalCharacters:(BOOL)a3
{
  self->_hasAppEntryEventTotalCharacters = a3;
}

- (BOOL)hasAppEntryEventTotalCharacters
{
  return self->_hasAppEntryEventTotalCharacters;
}

- (int)appEntryEventTotalCharacters
{
  return self->_appEntryEventTotalCharacters;
}

- (NSString)appEntryEventClientIdentifier
{
  return self->_appEntryEventClientIdentifier;
}

- (int)appEntryEventType
{
  return self->_appEntryEventType;
}

- (void)setHasSuggestionViewVisibleTime:(BOOL)a3
{
  self->_hasSuggestionViewVisibleTime = a3;
}

- (BOOL)hasSuggestionViewVisibleTime
{
  return self->_hasSuggestionViewVisibleTime;
}

- (double)suggestionViewVisibleTime
{
  return self->_suggestionViewVisibleTime;
}

- (NSString)suggestionViewContainerName
{
  return self->_suggestionViewContainerName;
}

- (NSString)suggestionClientIdentifier
{
  return self->_suggestionClientIdentifier;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (void)setHasRankingVersion:(BOOL)a3
{
  self->_hasRankingVersion = a3;
}

- (BOOL)hasRankingVersion
{
  return self->_hasRankingVersion;
}

- (double)rankingVersion
{
  return self->_rankingVersion;
}

- (void)setHasBundleVersion:(BOOL)a3
{
  self->_hasBundleVersion = a3;
}

- (BOOL)hasBundleVersion
{
  return self->_hasBundleVersion;
}

- (double)bundleVersion
{
  return self->_bundleVersion;
}

- (int)bundleTimeTag
{
  return self->_bundleTimeTag;
}

- (void)setHasBundleIsFamilyIncluded:(BOOL)a3
{
  self->_hasBundleIsFamilyIncluded = a3;
}

- (BOOL)hasBundleIsFamilyIncluded
{
  return self->_hasBundleIsFamilyIncluded;
}

- (BOOL)bundleIsFamilyIncluded
{
  return self->_bundleIsFamilyIncluded;
}

- (NSArray)backgroundActions
{
  return self->_backgroundActions;
}

- (BMMomentsEventDataAction)bundleActionType
{
  return self->_bundleActionType;
}

- (NSArray)bundleEventIDs
{
  return self->_bundleEventIDs;
}

- (NSString)bundlePromptLanguageFormat
{
  return self->_bundlePromptLanguageFormat;
}

- (void)setHasBundleSourceRoutineExists:(BOOL)a3
{
  self->_hasBundleSourceRoutineExists = a3;
}

- (BOOL)hasBundleSourceRoutineExists
{
  return self->_hasBundleSourceRoutineExists;
}

- (BOOL)bundleSourceRoutineExists
{
  return self->_bundleSourceRoutineExists;
}

- (void)setHasBundleSourceProactiveExists:(BOOL)a3
{
  self->_hasBundleSourceProactiveExists = a3;
}

- (BOOL)hasBundleSourceProactiveExists
{
  return self->_hasBundleSourceProactiveExists;
}

- (BOOL)bundleSourceProactiveExists
{
  return self->_bundleSourceProactiveExists;
}

- (void)setHasBundleSourcePhotoExists:(BOOL)a3
{
  self->_hasBundleSourcePhotoExists = a3;
}

- (BOOL)hasBundleSourcePhotoExists
{
  return self->_hasBundleSourcePhotoExists;
}

- (BOOL)bundleSourcePhotoExists
{
  return self->_bundleSourcePhotoExists;
}

- (void)setHasBundleSourceHealthExists:(BOOL)a3
{
  self->_hasBundleSourceHealthExists = a3;
}

- (BOOL)hasBundleSourceHealthExists
{
  return self->_hasBundleSourceHealthExists;
}

- (BOOL)bundleSourceHealthExists
{
  return self->_bundleSourceHealthExists;
}

- (int)bundleInterfaceType
{
  return self->_bundleInterfaceType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMMomentsEventDataEventBundle *)self bundleIdentifier];
    uint64_t v7 = [v5 bundleIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEventDataEventBundle *)self bundleIdentifier];
      v10 = [v5 bundleIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_312;
      }
    }
    v13 = [(BMMomentsEventDataEventBundle *)self bundleStartDate];
    uint64_t v14 = [v5 bundleStartDate];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMomentsEventDataEventBundle *)self bundleStartDate];
      v17 = [v5 bundleStartDate];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_312;
      }
    }
    v19 = [(BMMomentsEventDataEventBundle *)self bundleEndDate];
    uint64_t v20 = [v5 bundleEndDate];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMomentsEventDataEventBundle *)self bundleEndDate];
      v23 = [v5 bundleEndDate];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_312;
      }
    }
    v25 = [(BMMomentsEventDataEventBundle *)self bundleCreationDate];
    uint64_t v26 = [v5 bundleCreationDate];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMMomentsEventDataEventBundle *)self bundleCreationDate];
      v29 = [v5 bundleCreationDate];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_312;
      }
    }
    v31 = [(BMMomentsEventDataEventBundle *)self bundleExpirationDate];
    uint64_t v32 = [v5 bundleExpirationDate];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMMomentsEventDataEventBundle *)self bundleExpirationDate];
      v35 = [v5 bundleExpirationDate];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_312;
      }
    }
    int v37 = [(BMMomentsEventDataEventBundle *)self bundleInterfaceType];
    if (v37 != [v5 bundleInterfaceType]) {
      goto LABEL_312;
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceHealthExists]
      || [v5 hasBundleSourceHealthExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourceHealthExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourceHealthExists]) {
        goto LABEL_312;
      }
      int v38 = [(BMMomentsEventDataEventBundle *)self bundleSourceHealthExists];
      if (v38 != [v5 bundleSourceHealthExists]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourcePhotoExists]
      || [v5 hasBundleSourcePhotoExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourcePhotoExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourcePhotoExists]) {
        goto LABEL_312;
      }
      int v39 = [(BMMomentsEventDataEventBundle *)self bundleSourcePhotoExists];
      if (v39 != [v5 bundleSourcePhotoExists]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceProactiveExists]
      || [v5 hasBundleSourceProactiveExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourceProactiveExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourceProactiveExists]) {
        goto LABEL_312;
      }
      int v40 = [(BMMomentsEventDataEventBundle *)self bundleSourceProactiveExists];
      if (v40 != [v5 bundleSourceProactiveExists]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceRoutineExists]
      || [v5 hasBundleSourceRoutineExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourceRoutineExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourceRoutineExists]) {
        goto LABEL_312;
      }
      int v41 = [(BMMomentsEventDataEventBundle *)self bundleSourceRoutineExists];
      if (v41 != [v5 bundleSourceRoutineExists]) {
        goto LABEL_312;
      }
    }
    v42 = [(BMMomentsEventDataEventBundle *)self bundlePromptLanguageFormat];
    uint64_t v43 = [v5 bundlePromptLanguageFormat];
    if (v42 == (void *)v43)
    {
    }
    else
    {
      v44 = (void *)v43;
      v45 = [(BMMomentsEventDataEventBundle *)self bundlePromptLanguageFormat];
      v46 = [v5 bundlePromptLanguageFormat];
      int v47 = [v45 isEqual:v46];

      if (!v47) {
        goto LABEL_312;
      }
    }
    v48 = [(BMMomentsEventDataEventBundle *)self bundlePromptToneID];
    uint64_t v49 = [v5 bundlePromptToneID];
    if (v48 == (void *)v49)
    {
    }
    else
    {
      v50 = (void *)v49;
      v51 = [(BMMomentsEventDataEventBundle *)self bundlePromptToneID];
      v52 = [v5 bundlePromptToneID];
      int v53 = [v51 isEqual:v52];

      if (!v53) {
        goto LABEL_312;
      }
    }
    if (-[BMMomentsEventDataEventBundle hasBundlePromptParametersAvailability](self, "hasBundlePromptParametersAvailability")|| [v5 hasBundlePromptParametersAvailability])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundlePromptParametersAvailability])goto LABEL_312; {
      if (![v5 hasBundlePromptParametersAvailability])
      }
        goto LABEL_312;
      int v54 = [(BMMomentsEventDataEventBundle *)self bundlePromptParametersAvailability];
      if (v54 != [v5 bundlePromptParametersAvailability]) {
        goto LABEL_312;
      }
    }
    int v55 = [(BMMomentsEventDataEventBundle *)self bundlePlaceType];
    if (v55 != [v5 bundlePlaceType]) {
      goto LABEL_312;
    }
    int v56 = [(BMMomentsEventDataEventBundle *)self bundlePlaceUserType];
    if (v56 != [v5 bundlePlaceUserType]) {
      goto LABEL_312;
    }
    int v57 = [(BMMomentsEventDataEventBundle *)self bundleBaseEventCateory];
    if (v57 != [v5 bundleBaseEventCateory]) {
      goto LABEL_312;
    }
    v58 = [(BMMomentsEventDataEventBundle *)self bundleEventIDs];
    uint64_t v59 = [v5 bundleEventIDs];
    if (v58 == (void *)v59)
    {
    }
    else
    {
      v60 = (void *)v59;
      v61 = [(BMMomentsEventDataEventBundle *)self bundleEventIDs];
      v62 = [v5 bundleEventIDs];
      int v63 = [v61 isEqual:v62];

      if (!v63) {
        goto LABEL_312;
      }
    }
    v64 = [(BMMomentsEventDataEventBundle *)self bundleActionType];
    uint64_t v65 = [v5 bundleActionType];
    if (v64 == (void *)v65)
    {
    }
    else
    {
      v66 = (void *)v65;
      v67 = [(BMMomentsEventDataEventBundle *)self bundleActionType];
      v68 = [v5 bundleActionType];
      int v69 = [v67 isEqual:v68];

      if (!v69) {
        goto LABEL_312;
      }
    }
    v70 = [(BMMomentsEventDataEventBundle *)self backgroundActions];
    uint64_t v71 = [v5 backgroundActions];
    if (v70 == (void *)v71)
    {
    }
    else
    {
      v72 = (void *)v71;
      v73 = [(BMMomentsEventDataEventBundle *)self backgroundActions];
      v74 = [v5 backgroundActions];
      int v75 = [v73 isEqual:v74];

      if (!v75) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleIsFamilyIncluded]
      || [v5 hasBundleIsFamilyIncluded])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleIsFamilyIncluded]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleIsFamilyIncluded]) {
        goto LABEL_312;
      }
      int v76 = [(BMMomentsEventDataEventBundle *)self bundleIsFamilyIncluded];
      if (v76 != [v5 bundleIsFamilyIncluded]) {
        goto LABEL_312;
      }
    }
    int v77 = [(BMMomentsEventDataEventBundle *)self bundleTimeTag];
    if (v77 != [v5 bundleTimeTag]) {
      goto LABEL_312;
    }
    if ([(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeUnknown]
      || [v5 hasIsBundleResourceTypeUnknown])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeUnknown]) {
        goto LABEL_312;
      }
      if (![v5 hasIsBundleResourceTypeUnknown]) {
        goto LABEL_312;
      }
      int v78 = [(BMMomentsEventDataEventBundle *)self isBundleResourceTypeUnknown];
      if (v78 != [v5 isBundleResourceTypeUnknown]) {
        goto LABEL_312;
      }
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeValueIncluded](self, "hasIsBundleResourceTypeValueIncluded")|| [v5 hasIsBundleResourceTypeValueIncluded])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeValueIncluded])goto LABEL_312; {
      if (![v5 hasIsBundleResourceTypeValueIncluded])
      }
        goto LABEL_312;
      int v79 = [(BMMomentsEventDataEventBundle *)self isBundleResourceTypeValueIncluded];
      if (v79 != [v5 isBundleResourceTypeValueIncluded]) {
        goto LABEL_312;
      }
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypePhotoAssetsIncluded](self, "hasIsBundleResourceTypePhotoAssetsIncluded")|| [v5 hasIsBundleResourceTypePhotoAssetsIncluded])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypePhotoAssetsIncluded])goto LABEL_312; {
      if (![v5 hasIsBundleResourceTypePhotoAssetsIncluded])
      }
        goto LABEL_312;
      int v80 = [(BMMomentsEventDataEventBundle *)self isBundleResourceTypePhotoAssetsIncluded];
      if (v80 != [v5 isBundleResourceTypePhotoAssetsIncluded]) {
        goto LABEL_312;
      }
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeMediaIncluded](self, "hasIsBundleResourceTypeMediaIncluded")|| [v5 hasIsBundleResourceTypeMediaIncluded])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeMediaIncluded])goto LABEL_312; {
      if (![v5 hasIsBundleResourceTypeMediaIncluded])
      }
        goto LABEL_312;
      int v81 = [(BMMomentsEventDataEventBundle *)self isBundleResourceTypeMediaIncluded];
      if (v81 != [v5 isBundleResourceTypeMediaIncluded]) {
        goto LABEL_312;
      }
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeWebLinkIncluded](self, "hasIsBundleResourceTypeWebLinkIncluded")|| [v5 hasIsBundleResourceTypeWebLinkIncluded])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeWebLinkIncluded])goto LABEL_312; {
      if (![v5 hasIsBundleResourceTypeWebLinkIncluded])
      }
        goto LABEL_312;
      int v82 = [(BMMomentsEventDataEventBundle *)self isBundleResourceTypeWebLinkIncluded];
      if (v82 != [v5 isBundleResourceTypeWebLinkIncluded]) {
        goto LABEL_312;
      }
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeInterenceTagIncluded](self, "hasIsBundleResourceTypeInterenceTagIncluded")|| [v5 hasIsBundleResourceTypeInterenceTagIncluded])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeInterenceTagIncluded])goto LABEL_312; {
      if (![v5 hasIsBundleResourceTypeInterenceTagIncluded])
      }
        goto LABEL_312;
      int v83 = [(BMMomentsEventDataEventBundle *)self isBundleResourceTypeInterenceTagIncluded];
      if (v83 != [v5 isBundleResourceTypeInterenceTagIncluded]) {
        goto LABEL_312;
      }
    }
    int v84 = [(BMMomentsEventDataEventBundle *)self bundlEngagement];
    if (v84 != [v5 bundlEngagement]) {
      goto LABEL_312;
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleVersion]
      || [v5 hasBundleVersion])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleVersion]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleVersion]) {
        goto LABEL_312;
      }
      [(BMMomentsEventDataEventBundle *)self bundleVersion];
      double v86 = v85;
      [v5 bundleVersion];
      if (v86 != v87) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasRankingVersion]
      || [v5 hasRankingVersion])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasRankingVersion]) {
        goto LABEL_312;
      }
      if (![v5 hasRankingVersion]) {
        goto LABEL_312;
      }
      [(BMMomentsEventDataEventBundle *)self rankingVersion];
      double v89 = v88;
      [v5 rankingVersion];
      if (v89 != v90) {
        goto LABEL_312;
      }
    }
    int v91 = [(BMMomentsEventDataEventBundle *)self suggestionType];
    if (v91 != [v5 suggestionType]) {
      goto LABEL_312;
    }
    v92 = [(BMMomentsEventDataEventBundle *)self suggestionTimestamp];
    uint64_t v93 = [v5 suggestionTimestamp];
    if (v92 == (void *)v93)
    {
    }
    else
    {
      v94 = (void *)v93;
      v95 = [(BMMomentsEventDataEventBundle *)self suggestionTimestamp];
      v96 = [v5 suggestionTimestamp];
      int v97 = [v95 isEqual:v96];

      if (!v97) {
        goto LABEL_312;
      }
    }
    v98 = [(BMMomentsEventDataEventBundle *)self suggestionClientIdentifier];
    uint64_t v99 = [v5 suggestionClientIdentifier];
    if (v98 == (void *)v99)
    {
    }
    else
    {
      v100 = (void *)v99;
      v101 = [(BMMomentsEventDataEventBundle *)self suggestionClientIdentifier];
      v102 = [v5 suggestionClientIdentifier];
      int v103 = [v101 isEqual:v102];

      if (!v103) {
        goto LABEL_312;
      }
    }
    v104 = [(BMMomentsEventDataEventBundle *)self suggestionViewContainerName];
    uint64_t v105 = [v5 suggestionViewContainerName];
    if (v104 == (void *)v105)
    {
    }
    else
    {
      v106 = (void *)v105;
      v107 = [(BMMomentsEventDataEventBundle *)self suggestionViewContainerName];
      v108 = [v5 suggestionViewContainerName];
      int v109 = [v107 isEqual:v108];

      if (!v109) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasSuggestionViewVisibleTime]
      || [v5 hasSuggestionViewVisibleTime])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasSuggestionViewVisibleTime]) {
        goto LABEL_312;
      }
      if (![v5 hasSuggestionViewVisibleTime]) {
        goto LABEL_312;
      }
      [(BMMomentsEventDataEventBundle *)self suggestionViewVisibleTime];
      double v111 = v110;
      [v5 suggestionViewVisibleTime];
      if (v111 != v112) {
        goto LABEL_312;
      }
    }
    int v113 = [(BMMomentsEventDataEventBundle *)self appEntryEventType];
    if (v113 != [v5 appEntryEventType]) {
      goto LABEL_312;
    }
    v114 = [(BMMomentsEventDataEventBundle *)self appEntryEventClientIdentifier];
    uint64_t v115 = [v5 appEntryEventClientIdentifier];
    if (v114 == (void *)v115)
    {
    }
    else
    {
      v116 = (void *)v115;
      v117 = [(BMMomentsEventDataEventBundle *)self appEntryEventClientIdentifier];
      v118 = [v5 appEntryEventClientIdentifier];
      int v119 = [v117 isEqual:v118];

      if (!v119) {
        goto LABEL_312;
      }
    }
    v120 = [(BMMomentsEventDataEventBundle *)self appEntryEventTimestamp];
    uint64_t v121 = [v5 appEntryEventTimestamp];
    if (v120 == (void *)v121)
    {
    }
    else
    {
      v122 = (void *)v121;
      v123 = [(BMMomentsEventDataEventBundle *)self appEntryEventTimestamp];
      v124 = [v5 appEntryEventTimestamp];
      int v125 = [v123 isEqual:v124];

      if (!v125) {
        goto LABEL_312;
      }
    }
    v126 = [(BMMomentsEventDataEventBundle *)self appEntryEventStartTime];
    uint64_t v127 = [v5 appEntryEventStartTime];
    if (v126 == (void *)v127)
    {
    }
    else
    {
      v128 = (void *)v127;
      v129 = [(BMMomentsEventDataEventBundle *)self appEntryEventStartTime];
      v130 = [v5 appEntryEventStartTime];
      int v131 = [v129 isEqual:v130];

      if (!v131) {
        goto LABEL_312;
      }
    }
    v132 = [(BMMomentsEventDataEventBundle *)self appEntryEventEndTime];
    uint64_t v133 = [v5 appEntryEventEndTime];
    if (v132 == (void *)v133)
    {
    }
    else
    {
      v134 = (void *)v133;
      v135 = [(BMMomentsEventDataEventBundle *)self appEntryEventEndTime];
      v136 = [v5 appEntryEventEndTime];
      int v137 = [v135 isEqual:v136];

      if (!v137) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasAppEntryEventTotalCharacters]
      || [v5 hasAppEntryEventTotalCharacters])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasAppEntryEventTotalCharacters]) {
        goto LABEL_312;
      }
      if (![v5 hasAppEntryEventTotalCharacters]) {
        goto LABEL_312;
      }
      int v138 = [(BMMomentsEventDataEventBundle *)self appEntryEventTotalCharacters];
      if (v138 != [v5 appEntryEventTotalCharacters]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasAppEntryEventAddedCharacters]
      || [v5 hasAppEntryEventAddedCharacters])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasAppEntryEventAddedCharacters]) {
        goto LABEL_312;
      }
      if (![v5 hasAppEntryEventAddedCharacters]) {
        goto LABEL_312;
      }
      int v139 = [(BMMomentsEventDataEventBundle *)self appEntryEventAddedCharacters];
      if (v139 != [v5 appEntryEventAddedCharacters]) {
        goto LABEL_312;
      }
    }
    int v140 = [(BMMomentsEventDataEventBundle *)self clientActivityEventType];
    if (v140 != [v5 clientActivityEventType]) {
      goto LABEL_312;
    }
    v141 = [(BMMomentsEventDataEventBundle *)self clientActivityEventClientIdentifier];
    uint64_t v142 = [v5 clientActivityEventClientIdentifier];
    if (v141 == (void *)v142)
    {
    }
    else
    {
      v143 = (void *)v142;
      v144 = [(BMMomentsEventDataEventBundle *)self clientActivityEventClientIdentifier];
      v145 = [v5 clientActivityEventClientIdentifier];
      int v146 = [v144 isEqual:v145];

      if (!v146) {
        goto LABEL_312;
      }
    }
    v147 = [(BMMomentsEventDataEventBundle *)self clientActivityEventTimestamp];
    uint64_t v148 = [v5 clientActivityEventTimestamp];
    if (v147 == (void *)v148)
    {
    }
    else
    {
      v149 = (void *)v148;
      v150 = [(BMMomentsEventDataEventBundle *)self clientActivityEventTimestamp];
      v151 = [v5 clientActivityEventTimestamp];
      int v152 = [v150 isEqual:v151];

      if (!v152) {
        goto LABEL_312;
      }
    }
    v153 = [(BMMomentsEventDataEventBundle *)self suggestionIdentifier];
    uint64_t v154 = [v5 suggestionIdentifier];
    if (v153 == (void *)v154)
    {
    }
    else
    {
      v155 = (void *)v154;
      v156 = [(BMMomentsEventDataEventBundle *)self suggestionIdentifier];
      v157 = [v5 suggestionIdentifier];
      int v158 = [v156 isEqual:v157];

      if (!v158) {
        goto LABEL_312;
      }
    }
    int v159 = [(BMMomentsEventDataEventBundle *)self photoSourceType];
    if (v159 != [v5 photoSourceType]) {
      goto LABEL_312;
    }
    int v160 = [(BMMomentsEventDataEventBundle *)self photoLibraryType];
    if (v160 != [v5 photoLibraryType]) {
      goto LABEL_312;
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourcePostAnalyticsExists]
      || [v5 hasBundleSourcePostAnalyticsExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourcePostAnalyticsExists])goto LABEL_312; {
      if (![v5 hasBundleSourcePostAnalyticsExists])
      }
        goto LABEL_312;
      int v161 = [(BMMomentsEventDataEventBundle *)self bundleSourcePostAnalyticsExists];
      if (v161 != [v5 bundleSourcePostAnalyticsExists]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourcePDExists]
      || [v5 hasBundleSourcePDExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourcePDExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourcePDExists]) {
        goto LABEL_312;
      }
      int v162 = [(BMMomentsEventDataEventBundle *)self bundleSourcePDExists];
      if (v162 != [v5 bundleSourcePDExists]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceMotionExists]
      || [v5 hasBundleSourceMotionExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourceMotionExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourceMotionExists]) {
        goto LABEL_312;
      }
      int v163 = [(BMMomentsEventDataEventBundle *)self bundleSourceMotionExists];
      if (v163 != [v5 bundleSourceMotionExists]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceBooksExists]
      || [v5 hasBundleSourceBooksExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourceBooksExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourceBooksExists]) {
        goto LABEL_312;
      }
      int v164 = [(BMMomentsEventDataEventBundle *)self bundleSourceBooksExists];
      if (v164 != [v5 bundleSourceBooksExists]) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceScreenTimeExists]
      || [v5 hasBundleSourceScreenTimeExists])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundleSourceScreenTimeExists]) {
        goto LABEL_312;
      }
      if (![v5 hasBundleSourceScreenTimeExists]) {
        goto LABEL_312;
      }
      int v165 = [(BMMomentsEventDataEventBundle *)self bundleSourceScreenTimeExists];
      if (v165 != [v5 bundleSourceScreenTimeExists]) {
        goto LABEL_312;
      }
    }
    v166 = [(BMMomentsEventDataEventBundle *)self gaPRArray];
    uint64_t v167 = [v5 gaPRArray];
    if (v166 == (void *)v167)
    {
    }
    else
    {
      v168 = (void *)v167;
      v169 = [(BMMomentsEventDataEventBundle *)self gaPRArray];
      v170 = [v5 gaPRArray];
      int v171 = [v169 isEqual:v170];

      if (!v171) {
        goto LABEL_312;
      }
    }
    if ([(BMMomentsEventDataEventBundle *)self hasBundlePCount]
      || [v5 hasBundlePCount])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasBundlePCount]) {
        goto LABEL_312;
      }
      if (![v5 hasBundlePCount]) {
        goto LABEL_312;
      }
      int v172 = [(BMMomentsEventDataEventBundle *)self bundlePCount];
      if (v172 != [v5 bundlePCount]) {
        goto LABEL_312;
      }
    }
    int v173 = [(BMMomentsEventDataEventBundle *)self ranking];
    if (v173 != [v5 ranking]) {
      goto LABEL_312;
    }
    int v174 = [(BMMomentsEventDataEventBundle *)self labelConfidenceScore];
    if (v174 != [v5 labelConfidenceScore]) {
      goto LABEL_312;
    }
    int v175 = [(BMMomentsEventDataEventBundle *)self timeCorrelationScore];
    if (v175 != [v5 timeCorrelationScore]) {
      goto LABEL_312;
    }
    int v176 = [(BMMomentsEventDataEventBundle *)self callDuration];
    if (v176 != [v5 callDuration]) {
      goto LABEL_312;
    }
    int v177 = [(BMMomentsEventDataEventBundle *)self interactionCount];
    if (v177 != [v5 interactionCount]) {
      goto LABEL_312;
    }
    int v178 = [(BMMomentsEventDataEventBundle *)self interactionType];
    if (v178 != [v5 interactionType]) {
      goto LABEL_312;
    }
    int v179 = [(BMMomentsEventDataEventBundle *)self callPlace];
    if (v179 != [v5 callPlace]) {
      goto LABEL_312;
    }
    int v180 = [(BMMomentsEventDataEventBundle *)self distanceFromHome];
    if (v180 != [v5 distanceFromHome]) {
      goto LABEL_312;
    }
    int v181 = [(BMMomentsEventDataEventBundle *)self homeAvailability];
    if (v181 != [v5 homeAvailability]) {
      goto LABEL_312;
    }
    int v182 = [(BMMomentsEventDataEventBundle *)self workAvailability];
    if (v182 != [v5 workAvailability]) {
      goto LABEL_312;
    }
    int v183 = [(BMMomentsEventDataEventBundle *)self bundleVisitMapItemSource];
    if (v183 != [v5 bundleVisitMapItemSource]) {
      goto LABEL_312;
    }
    int v184 = [(BMMomentsEventDataEventBundle *)self bundleVisitPlaceType];
    if (v184 != [v5 bundleVisitPlaceType]) {
      goto LABEL_312;
    }
    int v185 = [(BMMomentsEventDataEventBundle *)self bundleVisitPlaceLabelGranularity];
    if (v185 != [v5 bundleVisitPlaceLabelGranularity]) {
      goto LABEL_312;
    }
    int v186 = [(BMMomentsEventDataEventBundle *)self bundleIncludesAnomalousEvent];
    if (v186 != [v5 bundleIncludesAnomalousEvent]) {
      goto LABEL_312;
    }
    if ([(BMMomentsEventDataEventBundle *)self hasIsFiltered]
      || [v5 hasIsFiltered])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsFiltered]) {
        goto LABEL_312;
      }
      if (![v5 hasIsFiltered]) {
        goto LABEL_312;
      }
      int v187 = [(BMMomentsEventDataEventBundle *)self isFiltered];
      if (v187 != [v5 isFiltered]) {
        goto LABEL_312;
      }
    }
    int v188 = [(BMMomentsEventDataEventBundle *)self bundleSuperType];
    if (v188 != [v5 bundleSuperType]) {
      goto LABEL_312;
    }
    int v189 = [(BMMomentsEventDataEventBundle *)self bundleSubType];
    if (v189 != [v5 bundleSubType]) {
      goto LABEL_312;
    }
    if ([(BMMomentsEventDataEventBundle *)self hasIsAggregatedAndSuppressed]
      || [v5 hasIsAggregatedAndSuppressed])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIsAggregatedAndSuppressed]) {
        goto LABEL_312;
      }
      if (![v5 hasIsAggregatedAndSuppressed]) {
        goto LABEL_312;
      }
      int v190 = [(BMMomentsEventDataEventBundle *)self isAggregatedAndSuppressed];
      if (v190 != [v5 isAggregatedAndSuppressed]) {
        goto LABEL_312;
      }
    }
    int v191 = [(BMMomentsEventDataEventBundle *)self summarizationGranularity];
    if (v191 != [v5 summarizationGranularity]) {
      goto LABEL_312;
    }
    if ([(BMMomentsEventDataEventBundle *)self hasIncludedInSummaryBundleOnly]
      || [v5 hasIncludedInSummaryBundleOnly])
    {
      if (![(BMMomentsEventDataEventBundle *)self hasIncludedInSummaryBundleOnly]) {
        goto LABEL_312;
      }
      if (![v5 hasIncludedInSummaryBundleOnly]) {
        goto LABEL_312;
      }
      int v192 = [(BMMomentsEventDataEventBundle *)self includedInSummaryBundleOnly];
      if (v192 != [v5 includedInSummaryBundleOnly]) {
        goto LABEL_312;
      }
    }
    v193 = [(BMMomentsEventDataEventBundle *)self subBundleIDs];
    uint64_t v194 = [v5 subBundleIDs];
    if (v193 == (void *)v194)
    {
    }
    else
    {
      v195 = (void *)v194;
      v196 = [(BMMomentsEventDataEventBundle *)self subBundleIDs];
      v197 = [v5 subBundleIDs];
      int v198 = [v196 isEqual:v197];

      if (!v198) {
        goto LABEL_312;
      }
    }
    v199 = [(BMMomentsEventDataEventBundle *)self subSuggestionIDs];
    uint64_t v200 = [v5 subSuggestionIDs];
    if (v199 == (void *)v200)
    {
    }
    else
    {
      v201 = (void *)v200;
      v202 = [(BMMomentsEventDataEventBundle *)self subSuggestionIDs];
      v203 = [v5 subSuggestionIDs];
      int v204 = [v202 isEqual:v203];

      if (!v204) {
        goto LABEL_312;
      }
    }
    v205 = [(BMMomentsEventDataEventBundle *)self firstCreationDate];
    uint64_t v206 = [v5 firstCreationDate];
    if (v205 == (void *)v206)
    {
    }
    else
    {
      v207 = (void *)v206;
      v208 = [(BMMomentsEventDataEventBundle *)self firstCreationDate];
      v209 = [v5 firstCreationDate];
      int v210 = [v208 isEqual:v209];

      if (!v210) {
        goto LABEL_312;
      }
    }
    v211 = [(BMMomentsEventDataEventBundle *)self resources];
    uint64_t v212 = [v5 resources];
    if (v211 == (void *)v212)
    {
    }
    else
    {
      v213 = (void *)v212;
      v214 = [(BMMomentsEventDataEventBundle *)self resources];
      v215 = [v5 resources];
      int v216 = [v214 isEqual:v215];

      if (!v216) {
        goto LABEL_312;
      }
    }
    v217 = [(BMMomentsEventDataEventBundle *)self persons];
    uint64_t v218 = [v5 persons];
    if (v217 == (void *)v218)
    {
    }
    else
    {
      v219 = (void *)v218;
      v220 = [(BMMomentsEventDataEventBundle *)self persons];
      v221 = [v5 persons];
      int v222 = [v220 isEqual:v221];

      if (!v222) {
        goto LABEL_312;
      }
    }
    v223 = [(BMMomentsEventDataEventBundle *)self mainPlace];
    uint64_t v224 = [v5 mainPlace];
    if (v223 == (void *)v224)
    {
    }
    else
    {
      v225 = (void *)v224;
      v226 = [(BMMomentsEventDataEventBundle *)self mainPlace];
      v227 = [v5 mainPlace];
      int v228 = [v226 isEqual:v227];

      if (!v228) {
        goto LABEL_312;
      }
    }
    v229 = [(BMMomentsEventDataEventBundle *)self otherPlaces];
    uint64_t v230 = [v5 otherPlaces];
    if (v229 == (void *)v230)
    {
    }
    else
    {
      v231 = (void *)v230;
      v232 = [(BMMomentsEventDataEventBundle *)self otherPlaces];
      v233 = [v5 otherPlaces];
      int v234 = [v232 isEqual:v233];

      if (!v234) {
        goto LABEL_312;
      }
    }
    v235 = [(BMMomentsEventDataEventBundle *)self photoTraits];
    uint64_t v236 = [v5 photoTraits];
    if (v235 == (void *)v236)
    {
    }
    else
    {
      v237 = (void *)v236;
      v238 = [(BMMomentsEventDataEventBundle *)self photoTraits];
      v239 = [v5 photoTraits];
      int v240 = [v238 isEqual:v239];

      if (!v240) {
        goto LABEL_312;
      }
    }
    v241 = [(BMMomentsEventDataEventBundle *)self clusterMetadata];
    uint64_t v242 = [v5 clusterMetadata];
    if (v241 == (void *)v242)
    {
    }
    else
    {
      v243 = (void *)v242;
      v244 = [(BMMomentsEventDataEventBundle *)self clusterMetadata];
      v245 = [v5 clusterMetadata];
      int v246 = [v244 isEqual:v245];

      if (!v246) {
        goto LABEL_312;
      }
    }
    v247 = [(BMMomentsEventDataEventBundle *)self outlierMetadata];
    uint64_t v248 = [v5 outlierMetadata];
    if (v247 == (void *)v248)
    {
    }
    else
    {
      v249 = (void *)v248;
      v250 = [(BMMomentsEventDataEventBundle *)self outlierMetadata];
      v251 = [v5 outlierMetadata];
      int v252 = [v250 isEqual:v251];

      if (!v252) {
        goto LABEL_312;
      }
    }
    if (![(BMMomentsEventDataEventBundle *)self hasBundleGoodnessScore]
      && ![v5 hasBundleGoodnessScore]
      || [(BMMomentsEventDataEventBundle *)self hasBundleGoodnessScore]
      && [v5 hasBundleGoodnessScore]
      && ([(BMMomentsEventDataEventBundle *)self bundleGoodnessScore],
          double v254 = v253,
          [v5 bundleGoodnessScore],
          v254 == v255))
    {
      if (![(BMMomentsEventDataEventBundle *)self hasDistinctnessScore]
        && ![v5 hasDistinctnessScore]
        || [(BMMomentsEventDataEventBundle *)self hasDistinctnessScore]
        && [v5 hasDistinctnessScore]
        && ([(BMMomentsEventDataEventBundle *)self distinctnessScore],
            double v257 = v256,
            [v5 distinctnessScore],
            v257 == v258))
      {
        if (![(BMMomentsEventDataEventBundle *)self hasRichnessScore]
          && ![v5 hasRichnessScore]
          || [(BMMomentsEventDataEventBundle *)self hasRichnessScore]
          && [v5 hasRichnessScore]
          && ([(BMMomentsEventDataEventBundle *)self richnessScore],
              double v260 = v259,
              [v5 richnessScore],
              v260 == v261))
        {
          if (![(BMMomentsEventDataEventBundle *)self hasEngagementScore]
            && ![v5 hasEngagementScore]
            || [(BMMomentsEventDataEventBundle *)self hasEngagementScore]
            && [v5 hasEngagementScore]
            && ([(BMMomentsEventDataEventBundle *)self engagementScore],
                double v263 = v262,
                [v5 engagementScore],
                v263 == v264))
          {
            if (![(BMMomentsEventDataEventBundle *)self hasHeuristicsScore]
              && ![v5 hasHeuristicsScore]
              || [(BMMomentsEventDataEventBundle *)self hasHeuristicsScore]
              && [v5 hasHeuristicsScore]
              && ([(BMMomentsEventDataEventBundle *)self heuristicsScore],
                  double v266 = v265,
                  [v5 heuristicsScore],
                  v266 == v267))
            {
              v268 = [(BMMomentsEventDataEventBundle *)self metadataForRank];
              v269 = [v5 metadataForRank];
              if (v268 == v269)
              {
                char v12 = 1;
              }
              else
              {
                v270 = [(BMMomentsEventDataEventBundle *)self metadataForRank];
                v271 = [v5 metadataForRank];
                char v12 = [v270 isEqual:v271];
              }
              goto LABEL_313;
            }
          }
        }
      }
    }
LABEL_312:
    char v12 = 0;
LABEL_313:

    goto LABEL_314;
  }
  char v12 = 0;
LABEL_314:

  return v12;
}

- (NSDate)firstCreationDate
{
  if (self->_hasRaw_firstCreationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_firstCreationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)clientActivityEventTimestamp
{
  if (self->_hasRaw_clientActivityEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_clientActivityEventTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)appEntryEventEndTime
{
  if (self->_hasRaw_appEntryEventEndTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_appEntryEventEndTime];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)appEntryEventStartTime
{
  if (self->_hasRaw_appEntryEventStartTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_appEntryEventStartTime];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)appEntryEventTimestamp
{
  if (self->_hasRaw_appEntryEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_appEntryEventTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)suggestionTimestamp
{
  if (self->_hasRaw_suggestionTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_suggestionTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)bundleExpirationDate
{
  if (self->_hasRaw_bundleExpirationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bundleExpirationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)bundleCreationDate
{
  if (self->_hasRaw_bundleCreationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bundleCreationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)bundleEndDate
{
  if (self->_hasRaw_bundleEndDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bundleEndDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)bundleStartDate
{
  if (self->_hasRaw_bundleStartDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bundleStartDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v329[91] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMomentsEventDataEventBundle *)self bundleIdentifier];
  id v4 = [(BMMomentsEventDataEventBundle *)self bundleStartDate];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMMomentsEventDataEventBundle *)self bundleStartDate];
    [v6 timeIntervalSince1970];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  v8 = [(BMMomentsEventDataEventBundle *)self bundleEndDate];
  if (v8)
  {
    v9 = NSNumber;
    v10 = [(BMMomentsEventDataEventBundle *)self bundleEndDate];
    [v10 timeIntervalSince1970];
    objc_msgSend(v9, "numberWithDouble:");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  char v12 = [(BMMomentsEventDataEventBundle *)self bundleCreationDate];
  if (v12)
  {
    v13 = NSNumber;
    uint64_t v14 = [(BMMomentsEventDataEventBundle *)self bundleCreationDate];
    [v14 timeIntervalSince1970];
    objc_msgSend(v13, "numberWithDouble:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  v16 = [(BMMomentsEventDataEventBundle *)self bundleExpirationDate];
  if (v16)
  {
    v17 = NSNumber;
    int v18 = [(BMMomentsEventDataEventBundle *)self bundleExpirationDate];
    [v18 timeIntervalSince1970];
    objc_msgSend(v17, "numberWithDouble:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }

  v327 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleInterfaceType](self, "bundleInterfaceType"));
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceHealthExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceHealthExists](self, "bundleSourceHealthExists"));
    id v326 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v326 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourcePhotoExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePhotoExists](self, "bundleSourcePhotoExists"));
    id v325 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v325 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceProactiveExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceProactiveExists](self, "bundleSourceProactiveExists"));
    id v324 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v324 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceRoutineExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceRoutineExists](self, "bundleSourceRoutineExists"));
    id v323 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v323 = 0;
  }
  v322 = [(BMMomentsEventDataEventBundle *)self bundlePromptLanguageFormat];
  v321 = [(BMMomentsEventDataEventBundle *)self bundlePromptToneID];
  if ([(BMMomentsEventDataEventBundle *)self hasBundlePromptParametersAvailability])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundlePromptParametersAvailability](self, "bundlePromptParametersAvailability"));
    id v320 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v320 = 0;
  }
  v319 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePlaceType](self, "bundlePlaceType"));
  v318 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePlaceUserType](self, "bundlePlaceUserType"));
  v317 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleBaseEventCateory](self, "bundleBaseEventCateory"));
  v316 = [(BMMomentsEventDataEventBundle *)self _bundleEventIDsJSONArray];
  uint64_t v20 = [(BMMomentsEventDataEventBundle *)self bundleActionType];
  v315 = [v20 jsonDictionary];

  v314 = [(BMMomentsEventDataEventBundle *)self _backgroundActionsJSONArray];
  if ([(BMMomentsEventDataEventBundle *)self hasBundleIsFamilyIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleIsFamilyIncluded](self, "bundleIsFamilyIncluded"));
    id v313 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v313 = 0;
  }
  v312 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleTimeTag](self, "bundleTimeTag"));
  if ([(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeUnknown])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeUnknown](self, "isBundleResourceTypeUnknown"));
    id v311 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v311 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeValueIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeValueIncluded](self, "isBundleResourceTypeValueIncluded"));
    id v310 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v310 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypePhotoAssetsIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypePhotoAssetsIncluded](self, "isBundleResourceTypePhotoAssetsIncluded"));
    id v309 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v309 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeMediaIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeMediaIncluded](self, "isBundleResourceTypeMediaIncluded"));
    id v308 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v308 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeWebLinkIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeWebLinkIncluded](self, "isBundleResourceTypeWebLinkIncluded"));
    id v307 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v307 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasIsBundleResourceTypeInterenceTagIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeInterenceTagIncluded](self, "isBundleResourceTypeInterenceTagIncluded"));
    id v306 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v306 = 0;
  }
  v305 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundlEngagement](self, "bundlEngagement"));
  if (![(BMMomentsEventDataEventBundle *)self hasBundleVersion]
    || ([(BMMomentsEventDataEventBundle *)self bundleVersion], fabs(v21) == INFINITY))
  {
    id v304 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self bundleVersion];
    v22 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self bundleVersion];
    objc_msgSend(v22, "numberWithDouble:");
    id v304 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundle *)self hasRankingVersion]
    || ([(BMMomentsEventDataEventBundle *)self rankingVersion], fabs(v23) == INFINITY))
  {
    id v303 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self rankingVersion];
    int v24 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self rankingVersion];
    objc_msgSend(v24, "numberWithDouble:");
    id v303 = (id)objc_claimAutoreleasedReturnValue();
  }
  v302 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle suggestionType](self, "suggestionType"));
  v25 = [(BMMomentsEventDataEventBundle *)self suggestionTimestamp];
  if (v25)
  {
    uint64_t v26 = NSNumber;
    v27 = [(BMMomentsEventDataEventBundle *)self suggestionTimestamp];
    [v27 timeIntervalSince1970];
    objc_msgSend(v26, "numberWithDouble:");
    id v301 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v301 = 0;
  }

  v300 = [(BMMomentsEventDataEventBundle *)self suggestionClientIdentifier];
  v299 = [(BMMomentsEventDataEventBundle *)self suggestionViewContainerName];
  if (![(BMMomentsEventDataEventBundle *)self hasSuggestionViewVisibleTime]
    || ([(BMMomentsEventDataEventBundle *)self suggestionViewVisibleTime],
        fabs(v28) == INFINITY))
  {
    id v298 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self suggestionViewVisibleTime];
    v29 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self suggestionViewVisibleTime];
    objc_msgSend(v29, "numberWithDouble:");
    id v298 = (id)objc_claimAutoreleasedReturnValue();
  }
  v297 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventType](self, "appEntryEventType"));
  v296 = [(BMMomentsEventDataEventBundle *)self appEntryEventClientIdentifier];
  int v30 = [(BMMomentsEventDataEventBundle *)self appEntryEventTimestamp];
  if (v30)
  {
    v31 = NSNumber;
    uint64_t v32 = [(BMMomentsEventDataEventBundle *)self appEntryEventTimestamp];
    [v32 timeIntervalSince1970];
    objc_msgSend(v31, "numberWithDouble:");
    id v295 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v295 = 0;
  }

  v33 = [(BMMomentsEventDataEventBundle *)self appEntryEventStartTime];
  if (v33)
  {
    v34 = NSNumber;
    v35 = [(BMMomentsEventDataEventBundle *)self appEntryEventStartTime];
    [v35 timeIntervalSince1970];
    objc_msgSend(v34, "numberWithDouble:");
    id v294 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v294 = 0;
  }

  int v36 = [(BMMomentsEventDataEventBundle *)self appEntryEventEndTime];
  if (v36)
  {
    int v37 = NSNumber;
    int v38 = [(BMMomentsEventDataEventBundle *)self appEntryEventEndTime];
    [v38 timeIntervalSince1970];
    objc_msgSend(v37, "numberWithDouble:");
    id v293 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v293 = 0;
  }

  if ([(BMMomentsEventDataEventBundle *)self hasAppEntryEventTotalCharacters])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventTotalCharacters](self, "appEntryEventTotalCharacters"));
    id v292 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v292 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasAppEntryEventAddedCharacters])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventAddedCharacters](self, "appEntryEventAddedCharacters"));
    id v291 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v291 = 0;
  }
  v290 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle clientActivityEventType](self, "clientActivityEventType"));
  v289 = [(BMMomentsEventDataEventBundle *)self clientActivityEventClientIdentifier];
  int v39 = [(BMMomentsEventDataEventBundle *)self clientActivityEventTimestamp];
  if (v39)
  {
    int v40 = NSNumber;
    int v41 = [(BMMomentsEventDataEventBundle *)self clientActivityEventTimestamp];
    [v41 timeIntervalSince1970];
    objc_msgSend(v40, "numberWithDouble:");
    id v288 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v288 = 0;
  }

  v287 = [(BMMomentsEventDataEventBundle *)self suggestionIdentifier];
  v286 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle photoSourceType](self, "photoSourceType"));
  v285 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle photoLibraryType](self, "photoLibraryType"));
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourcePostAnalyticsExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePostAnalyticsExists](self, "bundleSourcePostAnalyticsExists"));
    id v284 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v284 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourcePDExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePDExists](self, "bundleSourcePDExists"));
    id v283 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v283 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceMotionExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceMotionExists](self, "bundleSourceMotionExists"));
    id v282 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v282 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceBooksExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceBooksExists](self, "bundleSourceBooksExists"));
    id v281 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v281 = 0;
  }
  if ([(BMMomentsEventDataEventBundle *)self hasBundleSourceScreenTimeExists])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceScreenTimeExists](self, "bundleSourceScreenTimeExists"));
    id v280 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v280 = 0;
  }
  v279 = [(BMMomentsEventDataEventBundle *)self _gaPRArrayJSONArray];
  if ([(BMMomentsEventDataEventBundle *)self hasBundlePCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePCount](self, "bundlePCount"));
    id v278 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v278 = 0;
  }
  v277 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle ranking](self, "ranking"));
  v276 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle labelConfidenceScore](self, "labelConfidenceScore"));
  v275 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle timeCorrelationScore](self, "timeCorrelationScore"));
  v274 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle callDuration](self, "callDuration"));
  v273 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle interactionCount](self, "interactionCount"));
  v272 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle interactionType](self, "interactionType"));
  v271 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle callPlace](self, "callPlace"));
  v270 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle distanceFromHome](self, "distanceFromHome"));
  v269 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle homeAvailability](self, "homeAvailability"));
  v268 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle workAvailability](self, "workAvailability"));
  double v267 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleVisitMapItemSource](self, "bundleVisitMapItemSource"));
  double v266 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleVisitPlaceType](self, "bundleVisitPlaceType"));
  double v265 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleVisitPlaceLabelGranularity](self, "bundleVisitPlaceLabelGranularity"));
  double v264 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleIncludesAnomalousEvent](self, "bundleIncludesAnomalousEvent"));
  if ([(BMMomentsEventDataEventBundle *)self hasIsFiltered])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isFiltered](self, "isFiltered"));
    id v263 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v263 = 0;
  }
  double v262 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleSuperType](self, "bundleSuperType"));
  double v261 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundleSubType](self, "bundleSubType"));
  if ([(BMMomentsEventDataEventBundle *)self hasIsAggregatedAndSuppressed])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed"));
    id v260 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v260 = 0;
  }
  double v259 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle summarizationGranularity](self, "summarizationGranularity"));
  if ([(BMMomentsEventDataEventBundle *)self hasIncludedInSummaryBundleOnly])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle includedInSummaryBundleOnly](self, "includedInSummaryBundleOnly"));
    id v258 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v258 = 0;
  }
  double v257 = [(BMMomentsEventDataEventBundle *)self _subBundleIDsJSONArray];
  double v256 = [(BMMomentsEventDataEventBundle *)self _subSuggestionIDsJSONArray];
  v42 = [(BMMomentsEventDataEventBundle *)self firstCreationDate];
  if (v42)
  {
    uint64_t v43 = NSNumber;
    v44 = [(BMMomentsEventDataEventBundle *)self firstCreationDate];
    [v44 timeIntervalSince1970];
    objc_msgSend(v43, "numberWithDouble:");
    id v255 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v255 = 0;
  }

  double v254 = [(BMMomentsEventDataEventBundle *)self _resourcesJSONArray];
  double v253 = [(BMMomentsEventDataEventBundle *)self _personsJSONArray];
  v45 = [(BMMomentsEventDataEventBundle *)self mainPlace];
  int v252 = [v45 jsonDictionary];

  v251 = [(BMMomentsEventDataEventBundle *)self _otherPlacesJSONArray];
  v250 = [(BMMomentsEventDataEventBundle *)self _photoTraitsJSONArray];
  v46 = [(BMMomentsEventDataEventBundle *)self clusterMetadata];
  v249 = [v46 jsonDictionary];

  int v47 = [(BMMomentsEventDataEventBundle *)self outlierMetadata];
  uint64_t v248 = [v47 jsonDictionary];

  if (![(BMMomentsEventDataEventBundle *)self hasBundleGoodnessScore]
    || ([(BMMomentsEventDataEventBundle *)self bundleGoodnessScore], fabs(v48) == INFINITY))
  {
    id v247 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self bundleGoodnessScore];
    uint64_t v49 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self bundleGoodnessScore];
    objc_msgSend(v49, "numberWithDouble:");
    id v247 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundle *)self hasDistinctnessScore]
    || ([(BMMomentsEventDataEventBundle *)self distinctnessScore], fabs(v50) == INFINITY))
  {
    id v246 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self distinctnessScore];
    v51 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self distinctnessScore];
    objc_msgSend(v51, "numberWithDouble:");
    id v246 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundle *)self hasRichnessScore]
    || ([(BMMomentsEventDataEventBundle *)self richnessScore], fabs(v52) == INFINITY))
  {
    id v245 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self richnessScore];
    int v53 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self richnessScore];
    objc_msgSend(v53, "numberWithDouble:");
    id v245 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundle *)self hasEngagementScore]
    || ([(BMMomentsEventDataEventBundle *)self engagementScore], fabs(v54) == INFINITY))
  {
    id v244 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self engagementScore];
    int v55 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self engagementScore];
    objc_msgSend(v55, "numberWithDouble:");
    id v244 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundle *)self hasHeuristicsScore]
    || ([(BMMomentsEventDataEventBundle *)self heuristicsScore], fabs(v56) == INFINITY))
  {
    id v243 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundle *)self heuristicsScore];
    int v57 = NSNumber;
    [(BMMomentsEventDataEventBundle *)self heuristicsScore];
    objc_msgSend(v57, "numberWithDouble:");
    id v243 = (id)objc_claimAutoreleasedReturnValue();
  }
  v58 = [(BMMomentsEventDataEventBundle *)self metadataForRank];
  uint64_t v59 = [v58 jsonDictionary];

  v328[0] = @"bundleIdentifier";
  uint64_t v60 = v3;
  if (!v3)
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v233 = (void *)v60;
  v329[0] = v60;
  v328[1] = @"bundleStartDate";
  uint64_t v61 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
  }
  v232 = (void *)v61;
  v329[1] = v61;
  v328[2] = @"bundleEndDate";
  uint64_t v62 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v62 = [MEMORY[0x1E4F1CA98] null];
  }
  v231 = (void *)v62;
  v329[2] = v62;
  v328[3] = @"bundleCreationDate";
  uint64_t v63 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v63 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v230 = (void *)v63;
  v329[3] = v63;
  v328[4] = @"bundleExpirationDate";
  uint64_t v64 = (uint64_t)v19;
  if (!v19)
  {
    uint64_t v64 = [MEMORY[0x1E4F1CA98] null];
  }
  v229 = (void *)v64;
  v329[4] = v64;
  v328[5] = @"bundleInterfaceType";
  uint64_t v65 = (uint64_t)v327;
  if (!v327)
  {
    uint64_t v65 = [MEMORY[0x1E4F1CA98] null];
  }
  v329[5] = v65;
  v328[6] = @"bundleSourceHealthExists";
  uint64_t v66 = (uint64_t)v326;
  if (!v326)
  {
    uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
  }
  v329[6] = v66;
  v328[7] = @"bundleSourcePhotoExists";
  v67 = v325;
  if (!v325)
  {
    v67 = [MEMORY[0x1E4F1CA98] null];
  }
  v329[7] = v67;
  v328[8] = @"bundleSourceProactiveExists";
  uint64_t v68 = (uint64_t)v324;
  if (!v324)
  {
    uint64_t v68 = [MEMORY[0x1E4F1CA98] null];
  }
  v329[8] = v68;
  v328[9] = @"bundleSourceRoutineExists";
  uint64_t v69 = (uint64_t)v323;
  if (!v323)
  {
    uint64_t v69 = [MEMORY[0x1E4F1CA98] null];
  }
  v239 = (void *)v69;
  v329[9] = v69;
  v328[10] = @"bundlePromptLanguageFormat";
  uint64_t v70 = (uint64_t)v322;
  if (!v322)
  {
    uint64_t v70 = [MEMORY[0x1E4F1CA98] null];
  }
  v238 = (void *)v70;
  v329[10] = v70;
  v328[11] = @"bundlePromptToneID";
  uint64_t v71 = (uint64_t)v321;
  if (!v321)
  {
    uint64_t v71 = [MEMORY[0x1E4F1CA98] null];
  }
  v235 = v11;
  v237 = (void *)v71;
  v329[11] = v71;
  v328[12] = @"bundlePromptParametersAvailability";
  uint64_t v72 = (uint64_t)v320;
  if (!v320)
  {
    uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v3;
  uint64_t v236 = (void *)v72;
  v329[12] = v72;
  v328[13] = @"bundlePlaceType";
  uint64_t v74 = (uint64_t)v319;
  if (!v319)
  {
    uint64_t v74 = [MEMORY[0x1E4F1CA98] null];
  }
  int v75 = (void *)v74;
  v329[13] = v74;
  v328[14] = @"bundlePlaceUserType";
  uint64_t v76 = (uint64_t)v318;
  if (!v318)
  {
    uint64_t v76 = [MEMORY[0x1E4F1CA98] null];
  }
  v225 = (void *)v76;
  v329[14] = v76;
  v328[15] = @"bundleBaseEventCateory";
  uint64_t v77 = (uint64_t)v317;
  if (!v317)
  {
    uint64_t v77 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v224 = (void *)v77;
  v329[15] = v77;
  v328[16] = @"bundleEventIDs";
  uint64_t v78 = (uint64_t)v316;
  if (!v316)
  {
    uint64_t v78 = [MEMORY[0x1E4F1CA98] null];
  }
  v223 = (void *)v78;
  v329[16] = v78;
  v328[17] = @"bundleActionType";
  uint64_t v79 = (uint64_t)v315;
  if (!v315)
  {
    uint64_t v79 = [MEMORY[0x1E4F1CA98] null];
  }
  int v222 = (void *)v79;
  v329[17] = v79;
  v328[18] = @"backgroundActions";
  uint64_t v80 = (uint64_t)v314;
  if (!v314)
  {
    uint64_t v80 = [MEMORY[0x1E4F1CA98] null];
  }
  v221 = (void *)v80;
  v329[18] = v80;
  v328[19] = @"bundleIsFamilyIncluded";
  uint64_t v81 = (uint64_t)v313;
  if (!v313)
  {
    uint64_t v81 = [MEMORY[0x1E4F1CA98] null];
  }
  v220 = (void *)v81;
  v329[19] = v81;
  v328[20] = @"bundleTimeTag";
  uint64_t v82 = (uint64_t)v312;
  if (!v312)
  {
    uint64_t v82 = [MEMORY[0x1E4F1CA98] null];
  }
  v219 = (void *)v82;
  v329[20] = v82;
  v328[21] = @"isBundleResourceTypeUnknown";
  uint64_t v83 = (uint64_t)v311;
  if (!v311)
  {
    uint64_t v83 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v218 = (void *)v83;
  v329[21] = v83;
  v328[22] = @"isBundleResourceTypeValueIncluded";
  uint64_t v84 = (uint64_t)v310;
  if (!v310)
  {
    uint64_t v84 = [MEMORY[0x1E4F1CA98] null];
  }
  v217 = (void *)v84;
  v329[22] = v84;
  v328[23] = @"isBundleResourceTypePhotoAssetsIncluded";
  uint64_t v85 = (uint64_t)v309;
  if (!v309)
  {
    uint64_t v85 = [MEMORY[0x1E4F1CA98] null];
  }
  int v216 = (void *)v85;
  v329[23] = v85;
  v328[24] = @"isBundleResourceTypeMediaIncluded";
  uint64_t v86 = (uint64_t)v308;
  if (!v308)
  {
    uint64_t v86 = [MEMORY[0x1E4F1CA98] null];
  }
  v215 = (void *)v86;
  v329[24] = v86;
  v328[25] = @"isBundleResourceTypeWebLinkIncluded";
  uint64_t v87 = (uint64_t)v307;
  if (!v307)
  {
    uint64_t v87 = [MEMORY[0x1E4F1CA98] null];
  }
  v214 = (void *)v87;
  v329[25] = v87;
  v328[26] = @"isBundleResourceTypeInterenceTagIncluded";
  uint64_t v88 = (uint64_t)v306;
  if (!v306)
  {
    uint64_t v88 = [MEMORY[0x1E4F1CA98] null];
  }
  v213 = (void *)v88;
  v329[26] = v88;
  v328[27] = @"bundlEngagement";
  uint64_t v89 = (uint64_t)v305;
  if (!v305)
  {
    uint64_t v89 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v212 = (void *)v89;
  v329[27] = v89;
  v328[28] = @"bundleVersion";
  uint64_t v90 = (uint64_t)v304;
  if (!v304)
  {
    uint64_t v90 = [MEMORY[0x1E4F1CA98] null];
  }
  v211 = (void *)v90;
  v329[28] = v90;
  v328[29] = @"rankingVersion";
  uint64_t v91 = (uint64_t)v303;
  if (!v303)
  {
    uint64_t v91 = [MEMORY[0x1E4F1CA98] null];
  }
  int v210 = (void *)v91;
  v329[29] = v91;
  v328[30] = @"suggestionType";
  uint64_t v92 = (uint64_t)v302;
  if (!v302)
  {
    uint64_t v92 = [MEMORY[0x1E4F1CA98] null];
  }
  v209 = (void *)v92;
  v329[30] = v92;
  v328[31] = @"suggestionTimestamp";
  uint64_t v93 = (uint64_t)v301;
  if (!v301)
  {
    uint64_t v93 = [MEMORY[0x1E4F1CA98] null];
  }
  v208 = (void *)v93;
  v329[31] = v93;
  v328[32] = @"suggestionClientIdentifier";
  uint64_t v94 = (uint64_t)v300;
  if (!v300)
  {
    uint64_t v94 = [MEMORY[0x1E4F1CA98] null];
  }
  v207 = (void *)v94;
  v329[32] = v94;
  v328[33] = @"suggestionViewContainerName";
  uint64_t v95 = (uint64_t)v299;
  if (!v299)
  {
    uint64_t v95 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v206 = (void *)v95;
  v329[33] = v95;
  v328[34] = @"suggestionViewVisibleTime";
  uint64_t v96 = (uint64_t)v298;
  if (!v298)
  {
    uint64_t v96 = [MEMORY[0x1E4F1CA98] null];
  }
  v205 = (void *)v96;
  v329[34] = v96;
  v328[35] = @"appEntryEventType";
  uint64_t v97 = (uint64_t)v297;
  if (!v297)
  {
    uint64_t v97 = [MEMORY[0x1E4F1CA98] null];
  }
  int v204 = (void *)v97;
  v329[35] = v97;
  v328[36] = @"appEntryEventClientIdentifier";
  uint64_t v98 = (uint64_t)v296;
  if (!v296)
  {
    uint64_t v98 = [MEMORY[0x1E4F1CA98] null];
  }
  v203 = (void *)v98;
  v329[36] = v98;
  v328[37] = @"appEntryEventTimestamp";
  uint64_t v99 = (uint64_t)v295;
  if (!v295)
  {
    uint64_t v99 = [MEMORY[0x1E4F1CA98] null];
  }
  v202 = (void *)v99;
  v329[37] = v99;
  v328[38] = @"appEntryEventStartTime";
  uint64_t v100 = (uint64_t)v294;
  if (!v294)
  {
    uint64_t v100 = [MEMORY[0x1E4F1CA98] null];
  }
  v201 = (void *)v100;
  v329[38] = v100;
  v328[39] = @"appEntryEventEndTime";
  uint64_t v101 = (uint64_t)v293;
  if (!v293)
  {
    uint64_t v101 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v200 = (void *)v101;
  v329[39] = v101;
  v328[40] = @"appEntryEventTotalCharacters";
  uint64_t v102 = (uint64_t)v292;
  if (!v292)
  {
    uint64_t v102 = [MEMORY[0x1E4F1CA98] null];
  }
  v199 = (void *)v102;
  v329[40] = v102;
  v328[41] = @"appEntryEventAddedCharacters";
  uint64_t v103 = (uint64_t)v291;
  if (!v291)
  {
    uint64_t v103 = [MEMORY[0x1E4F1CA98] null];
  }
  int v198 = (void *)v103;
  v329[41] = v103;
  v328[42] = @"clientActivityEventType";
  uint64_t v104 = (uint64_t)v290;
  if (!v290)
  {
    uint64_t v104 = [MEMORY[0x1E4F1CA98] null];
  }
  v197 = (void *)v104;
  v329[42] = v104;
  v328[43] = @"clientActivityEventClientIdentifier";
  uint64_t v105 = (uint64_t)v289;
  if (!v289)
  {
    uint64_t v105 = [MEMORY[0x1E4F1CA98] null];
  }
  v196 = (void *)v105;
  v329[43] = v105;
  v328[44] = @"clientActivityEventTimestamp";
  uint64_t v106 = (uint64_t)v288;
  if (!v288)
  {
    uint64_t v106 = [MEMORY[0x1E4F1CA98] null];
  }
  v195 = (void *)v106;
  v329[44] = v106;
  v328[45] = @"suggestionIdentifier";
  uint64_t v107 = (uint64_t)v287;
  if (!v287)
  {
    uint64_t v107 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v194 = (void *)v107;
  v329[45] = v107;
  v328[46] = @"photoSourceType";
  uint64_t v108 = (uint64_t)v286;
  if (!v286)
  {
    uint64_t v108 = [MEMORY[0x1E4F1CA98] null];
  }
  v193 = (void *)v108;
  v329[46] = v108;
  v328[47] = @"photoLibraryType";
  uint64_t v109 = (uint64_t)v285;
  if (!v285)
  {
    uint64_t v109 = [MEMORY[0x1E4F1CA98] null];
  }
  int v192 = (void *)v109;
  v329[47] = v109;
  v328[48] = @"bundleSourcePostAnalyticsExists";
  uint64_t v110 = (uint64_t)v284;
  if (!v284)
  {
    uint64_t v110 = [MEMORY[0x1E4F1CA98] null];
  }
  int v191 = (void *)v110;
  v329[48] = v110;
  v328[49] = @"bundleSourcePDExists";
  uint64_t v111 = (uint64_t)v283;
  if (!v283)
  {
    uint64_t v111 = [MEMORY[0x1E4F1CA98] null];
  }
  int v190 = (void *)v111;
  v329[49] = v111;
  v328[50] = @"bundleSourceMotionExists";
  uint64_t v112 = (uint64_t)v282;
  if (!v282)
  {
    uint64_t v112 = [MEMORY[0x1E4F1CA98] null];
  }
  int v189 = (void *)v112;
  v329[50] = v112;
  v328[51] = @"bundleSourceBooksExists";
  uint64_t v113 = (uint64_t)v281;
  if (!v281)
  {
    uint64_t v113 = [MEMORY[0x1E4F1CA98] null];
  }
  int v188 = (void *)v113;
  v329[51] = v113;
  v328[52] = @"bundleSourceScreenTimeExists";
  uint64_t v114 = (uint64_t)v280;
  if (!v280)
  {
    uint64_t v114 = [MEMORY[0x1E4F1CA98] null];
  }
  int v187 = (void *)v114;
  v329[52] = v114;
  v328[53] = @"gaPRArray";
  uint64_t v115 = (uint64_t)v279;
  if (!v279)
  {
    uint64_t v115 = [MEMORY[0x1E4F1CA98] null];
  }
  int v186 = (void *)v115;
  v329[53] = v115;
  v328[54] = @"bundlePCount";
  uint64_t v116 = (uint64_t)v278;
  if (!v278)
  {
    uint64_t v116 = [MEMORY[0x1E4F1CA98] null];
  }
  int v185 = (void *)v116;
  v329[54] = v116;
  v328[55] = @"ranking";
  uint64_t v117 = (uint64_t)v277;
  if (!v277)
  {
    uint64_t v117 = [MEMORY[0x1E4F1CA98] null];
  }
  int v184 = (void *)v117;
  v329[55] = v117;
  v328[56] = @"labelConfidenceScore";
  uint64_t v118 = (uint64_t)v276;
  if (!v276)
  {
    uint64_t v118 = [MEMORY[0x1E4F1CA98] null];
  }
  int v183 = (void *)v118;
  v329[56] = v118;
  v328[57] = @"timeCorrelationScore";
  uint64_t v119 = (uint64_t)v275;
  if (!v275)
  {
    uint64_t v119 = [MEMORY[0x1E4F1CA98] null];
  }
  int v182 = (void *)v119;
  v329[57] = v119;
  v328[58] = @"callDuration";
  uint64_t v120 = (uint64_t)v274;
  if (!v274)
  {
    uint64_t v120 = [MEMORY[0x1E4F1CA98] null];
  }
  int v181 = (void *)v120;
  v329[58] = v120;
  v328[59] = @"interactionCount";
  uint64_t v121 = (uint64_t)v273;
  if (!v273)
  {
    uint64_t v121 = [MEMORY[0x1E4F1CA98] null];
  }
  int v180 = (void *)v121;
  v329[59] = v121;
  v328[60] = @"interactionType";
  uint64_t v122 = (uint64_t)v272;
  if (!v272)
  {
    uint64_t v122 = [MEMORY[0x1E4F1CA98] null];
  }
  int v179 = (void *)v122;
  v329[60] = v122;
  v328[61] = @"callPlace";
  uint64_t v123 = (uint64_t)v271;
  if (!v271)
  {
    uint64_t v123 = [MEMORY[0x1E4F1CA98] null];
  }
  int v178 = (void *)v123;
  v329[61] = v123;
  v328[62] = @"distanceFromHome";
  uint64_t v124 = (uint64_t)v270;
  if (!v270)
  {
    uint64_t v124 = [MEMORY[0x1E4F1CA98] null];
  }
  int v177 = (void *)v124;
  v329[62] = v124;
  v328[63] = @"homeAvailability";
  uint64_t v125 = (uint64_t)v269;
  if (!v269)
  {
    uint64_t v125 = [MEMORY[0x1E4F1CA98] null];
  }
  int v176 = (void *)v125;
  v329[63] = v125;
  v328[64] = @"workAvailability";
  uint64_t v126 = (uint64_t)v268;
  if (!v268)
  {
    uint64_t v126 = [MEMORY[0x1E4F1CA98] null];
  }
  int v175 = (void *)v126;
  v329[64] = v126;
  v328[65] = @"bundleVisitMapItemSource";
  uint64_t v127 = (uint64_t)v267;
  if (!v267)
  {
    uint64_t v127 = [MEMORY[0x1E4F1CA98] null];
  }
  int v174 = (void *)v127;
  v329[65] = v127;
  v328[66] = @"bundleVisitPlaceType";
  uint64_t v128 = (uint64_t)v266;
  if (!v266)
  {
    uint64_t v128 = [MEMORY[0x1E4F1CA98] null];
  }
  int v173 = (void *)v128;
  v329[66] = v128;
  v328[67] = @"bundleVisitPlaceLabelGranularity";
  uint64_t v129 = (uint64_t)v265;
  if (!v265)
  {
    uint64_t v129 = [MEMORY[0x1E4F1CA98] null];
  }
  int v172 = (void *)v129;
  v329[67] = v129;
  v328[68] = @"bundleIncludesAnomalousEvent";
  uint64_t v130 = (uint64_t)v264;
  if (!v264)
  {
    uint64_t v130 = [MEMORY[0x1E4F1CA98] null];
  }
  int v171 = (void *)v130;
  v329[68] = v130;
  v328[69] = @"isFiltered";
  uint64_t v131 = (uint64_t)v263;
  if (!v263)
  {
    uint64_t v131 = [MEMORY[0x1E4F1CA98] null];
  }
  v170 = (void *)v131;
  v329[69] = v131;
  v328[70] = @"bundleSuperType";
  uint64_t v132 = (uint64_t)v262;
  if (!v262)
  {
    uint64_t v132 = [MEMORY[0x1E4F1CA98] null];
  }
  v169 = (void *)v132;
  v329[70] = v132;
  v328[71] = @"bundleSubType";
  uint64_t v133 = (uint64_t)v261;
  if (!v261)
  {
    uint64_t v133 = [MEMORY[0x1E4F1CA98] null];
  }
  v168 = (void *)v133;
  v329[71] = v133;
  v328[72] = @"isAggregatedAndSuppressed";
  uint64_t v134 = (uint64_t)v260;
  if (!v260)
  {
    uint64_t v134 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v167 = (void *)v134;
  v329[72] = v134;
  v328[73] = @"summarizationGranularity";
  uint64_t v135 = (uint64_t)v259;
  if (!v259)
  {
    uint64_t v135 = [MEMORY[0x1E4F1CA98] null];
  }
  v166 = (void *)v135;
  v329[73] = v135;
  v328[74] = @"includedInSummaryBundleOnly";
  uint64_t v136 = (uint64_t)v258;
  if (!v258)
  {
    uint64_t v136 = [MEMORY[0x1E4F1CA98] null];
  }
  int v165 = (void *)v136;
  v329[74] = v136;
  v328[75] = @"subBundleIDs";
  uint64_t v137 = (uint64_t)v257;
  if (!v257)
  {
    uint64_t v137 = [MEMORY[0x1E4F1CA98] null];
  }
  int v164 = (void *)v137;
  v329[75] = v137;
  v328[76] = @"subSuggestionIDs";
  uint64_t v138 = (uint64_t)v256;
  if (!v256)
  {
    uint64_t v138 = [MEMORY[0x1E4F1CA98] null];
  }
  int v163 = (void *)v138;
  v329[76] = v138;
  v328[77] = @"firstCreationDate";
  uint64_t v139 = (uint64_t)v255;
  if (!v255)
  {
    uint64_t v139 = [MEMORY[0x1E4F1CA98] null];
  }
  int v162 = (void *)v139;
  v329[77] = v139;
  v328[78] = @"resources";
  uint64_t v140 = (uint64_t)v254;
  if (!v254)
  {
    uint64_t v140 = [MEMORY[0x1E4F1CA98] null];
  }
  int v161 = (void *)v140;
  v329[78] = v140;
  v328[79] = @"persons";
  uint64_t v141 = (uint64_t)v253;
  if (!v253)
  {
    uint64_t v141 = [MEMORY[0x1E4F1CA98] null];
  }
  int v160 = (void *)v141;
  v329[79] = v141;
  v328[80] = @"mainPlace";
  uint64_t v142 = (uint64_t)v252;
  if (!v252)
  {
    uint64_t v142 = [MEMORY[0x1E4F1CA98] null];
  }
  int v159 = (void *)v142;
  v329[80] = v142;
  v328[81] = @"otherPlaces";
  uint64_t v143 = (uint64_t)v251;
  if (!v251)
  {
    uint64_t v143 = [MEMORY[0x1E4F1CA98] null];
  }
  v241 = v15;
  int v158 = (void *)v143;
  v329[81] = v143;
  v328[82] = @"photoTraits";
  uint64_t v144 = (uint64_t)v250;
  if (!v250)
  {
    uint64_t v144 = [MEMORY[0x1E4F1CA98] null];
  }
  v157 = (void *)v144;
  v329[82] = v144;
  v328[83] = @"clusterMetadata";
  uint64_t v145 = (uint64_t)v249;
  if (!v249)
  {
    uint64_t v145 = [MEMORY[0x1E4F1CA98] null];
  }
  int v240 = v19;
  v156 = (void *)v145;
  v329[83] = v145;
  v328[84] = @"outlierMetadata";
  uint64_t v146 = (uint64_t)v248;
  if (!v248)
  {
    uint64_t v146 = [MEMORY[0x1E4F1CA98] null];
  }
  v227 = (void *)v66;
  v155 = (void *)v146;
  v329[84] = v146;
  v328[85] = @"bundleGoodnessScore";
  v147 = v247;
  if (!v247)
  {
    v147 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v242 = (void *)v59;
  v329[85] = v147;
  v328[86] = @"distinctnessScore";
  uint64_t v148 = v246;
  if (!v246)
  {
    uint64_t v148 = [MEMORY[0x1E4F1CA98] null];
  }
  v226 = (void *)v68;
  v329[86] = v148;
  v328[87] = @"richnessScore";
  v149 = v245;
  if (!v245)
  {
    v149 = [MEMORY[0x1E4F1CA98] null];
  }
  int v228 = (void *)v65;
  v329[87] = v149;
  v328[88] = @"engagementScore";
  v150 = v244;
  if (!v244)
  {
    v150 = [MEMORY[0x1E4F1CA98] null];
  }
  v329[88] = v150;
  v328[89] = @"heuristicsScore";
  v151 = v243;
  if (!v243)
  {
    v151 = [MEMORY[0x1E4F1CA98] null];
  }
  v329[89] = v151;
  v328[90] = @"metadataForRank";
  int v152 = v242;
  if (!v242)
  {
    int v152 = [MEMORY[0x1E4F1CA98] null];
  }
  v329[90] = v152;
  id v234 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v329 forKeys:v328 count:91];
  if (!v242) {

  }
  v153 = v75;
  if (!v243)
  {

    v153 = v75;
  }
  if (!v244)
  {

    v153 = v75;
  }
  if (!v245)
  {

    v153 = v75;
  }
  if (!v246)
  {

    v153 = v75;
  }
  if (!v247)
  {

    v153 = v75;
  }
  if (!v248)
  {

    v153 = v75;
  }
  if (!v249)
  {

    v153 = v75;
  }
  if (!v250)
  {

    v153 = v75;
  }
  if (!v251)
  {

    v153 = v75;
  }
  if (!v252)
  {

    v153 = v75;
  }
  if (!v253)
  {

    v153 = v75;
  }
  if (!v254)
  {

    v153 = v75;
  }
  if (!v255)
  {

    v153 = v75;
  }
  if (!v256)
  {

    v153 = v75;
  }
  if (!v257)
  {

    v153 = v75;
  }
  if (!v258)
  {

    v153 = v75;
  }
  if (!v259)
  {

    v153 = v75;
  }
  if (!v260)
  {

    v153 = v75;
  }
  if (!v261)
  {

    v153 = v75;
  }
  if (!v262)
  {

    v153 = v75;
  }
  if (!v263)
  {

    v153 = v75;
  }
  if (!v264)
  {

    v153 = v75;
  }
  if (!v265)
  {

    v153 = v75;
  }
  if (!v266)
  {

    v153 = v75;
  }
  if (!v267)
  {

    v153 = v75;
  }
  if (!v268)
  {

    v153 = v75;
  }
  if (!v269)
  {

    v153 = v75;
  }
  if (!v270)
  {

    v153 = v75;
  }
  if (!v271)
  {

    v153 = v75;
  }
  if (!v272)
  {

    v153 = v75;
  }
  if (!v273)
  {

    v153 = v75;
  }
  if (!v274)
  {

    v153 = v75;
  }
  if (!v275)
  {

    v153 = v75;
  }
  if (!v276)
  {

    v153 = v75;
  }
  if (!v277)
  {

    v153 = v75;
  }
  if (!v278)
  {

    v153 = v75;
  }
  if (!v279)
  {

    v153 = v75;
  }
  if (!v280)
  {

    v153 = v75;
  }
  if (!v281)
  {

    v153 = v75;
  }
  if (!v282)
  {

    v153 = v75;
  }
  if (!v283)
  {

    v153 = v75;
  }
  if (!v284)
  {

    v153 = v75;
  }
  if (!v285)
  {

    v153 = v75;
  }
  if (!v286)
  {

    v153 = v75;
  }
  if (!v287)
  {

    v153 = v75;
  }
  if (!v288)
  {

    v153 = v75;
  }
  if (!v289)
  {

    v153 = v75;
  }
  if (!v290)
  {

    v153 = v75;
  }
  if (!v291)
  {

    v153 = v75;
  }
  if (!v292)
  {

    v153 = v75;
  }
  if (!v293)
  {

    v153 = v75;
  }
  if (!v294)
  {

    v153 = v75;
  }
  if (!v295)
  {

    v153 = v75;
  }
  if (!v296)
  {

    v153 = v75;
  }
  if (!v297)
  {

    v153 = v75;
  }
  if (!v298)
  {

    v153 = v75;
  }
  if (!v299)
  {

    v153 = v75;
  }
  if (!v300)
  {

    v153 = v75;
  }
  if (!v301)
  {

    v153 = v75;
  }
  if (!v302)
  {

    v153 = v75;
  }
  if (!v303)
  {

    v153 = v75;
  }
  if (!v304)
  {

    v153 = v75;
  }
  if (!v305)
  {

    v153 = v75;
  }
  if (!v306)
  {

    v153 = v75;
  }
  if (!v307)
  {

    v153 = v75;
  }
  if (!v308)
  {

    v153 = v75;
  }
  if (!v309)
  {

    v153 = v75;
  }
  if (!v310)
  {

    v153 = v75;
  }
  if (!v311)
  {

    v153 = v75;
  }
  if (!v312)
  {

    v153 = v75;
  }
  if (!v313)
  {

    v153 = v75;
  }
  if (!v314)
  {

    v153 = v75;
  }
  if (!v315)
  {

    v153 = v75;
  }
  if (!v316)
  {

    v153 = v75;
  }
  if (!v317)
  {

    v153 = v75;
  }
  if (!v318)
  {

    v153 = v75;
  }
  if (!v319) {

  }
  if (!v320) {
  if (!v321)
  }

  if (!v322) {
  if (!v323)
  }

  if (!v324) {
  if (!v325)
  }

  if (!v326) {
  if (v327)
  }
  {
    if (v240) {
      goto LABEL_486;
    }
  }
  else
  {

    if (v240)
    {
LABEL_486:
      if (v241) {
        goto LABEL_487;
      }
      goto LABEL_495;
    }
  }

  if (v241)
  {
LABEL_487:
    if (v235) {
      goto LABEL_488;
    }
    goto LABEL_496;
  }
LABEL_495:

  if (v235)
  {
LABEL_488:
    if (v7) {
      goto LABEL_489;
    }
LABEL_497:

    if (v73) {
      goto LABEL_490;
    }
    goto LABEL_498;
  }
LABEL_496:

  if (!v7) {
    goto LABEL_497;
  }
LABEL_489:
  if (v73) {
    goto LABEL_490;
  }
LABEL_498:

LABEL_490:

  return v234;
}

- (id)_photoTraitsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self photoTraits];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_otherPlacesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self otherPlaces];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_personsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self persons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_resourcesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self resources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_subSuggestionIDsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self subSuggestionIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_subBundleIDsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self subBundleIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_gaPRArrayJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self gaPRArray];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_backgroundActionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self backgroundActions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_bundleEventIDsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundle *)self bundleEventIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMMomentsEventDataEventBundle)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v1164[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
  v891 = (void *)v7;
  if (!v7 || (v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v888 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v888 = v8;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"bundleStartDate"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      id v12 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v11 doubleValue];
      id v10 = (id)objc_msgSend(v12, "initWithTimeIntervalSince1970:");
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      id v18 = v9;
      id v10 = [v11 dateFromString:v18];

      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
LABEL_16:
      uint64_t v19 = [v6 objectForKeyedSubscript:@"bundleEndDate"];
      v886 = (void *)v19;
      if (!v19 || (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v879 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        id v22 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v21 doubleValue];
        id v879 = (id)objc_msgSend(v22, "initWithTimeIntervalSince1970:");
LABEL_23:

        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v23 = v20;
        id v879 = [v21 dateFromString:v23];

        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v879 = v20;
LABEL_24:
        uint64_t v24 = [v6 objectForKeyedSubscript:@"bundleCreationDate"];
        v885 = v9;
        v887 = (void *)v24;
        if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v875 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = v25;
          id v27 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [v26 doubleValue];
          id v875 = (id)objc_msgSend(v27, "initWithTimeIntervalSince1970:");
LABEL_31:

          goto LABEL_32;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v28 = v25;
          id v875 = [v26 dateFromString:v28];

          goto LABEL_31;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v875 = v25;
LABEL_32:
          v29 = [v6 objectForKeyedSubscript:@"bundleExpirationDate"];
          v889 = v29;
          v874 = self;
          if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v873 = 0;
            goto LABEL_40;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = v29;
            id v31 = objc_alloc(MEMORY[0x1E4F1C9C8]);
            [v30 doubleValue];
            uint64_t v32 = v31;
            v29 = v889;
            id v873 = (id)objc_msgSend(v32, "initWithTimeIntervalSince1970:");
LABEL_39:

            goto LABEL_40;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            id v33 = v29;
            id v873 = [v30 dateFromString:v33];

            v29 = v889;
            goto LABEL_39;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v873 = v29;
LABEL_40:
            uint64_t v34 = [v6 objectForKeyedSubscript:@"bundleInterfaceType"];
            v876 = (void *)v34;
            if (!v34 || (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v36 = 0;
              goto LABEL_48;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v36 = v35;
LABEL_47:

              v29 = v889;
LABEL_48:
              int v39 = [v6 objectForKeyedSubscript:@"bundleSourceHealthExists"];
              if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v870 = 0;
                goto LABEL_51;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v870 = v39;
LABEL_51:
                uint64_t v40 = [v6 objectForKeyedSubscript:@"bundleSourcePhotoExists"];
                v872 = (void *)v40;
                if (!v40 || (int v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v871 = 0;
                  goto LABEL_54;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v871 = v41;
LABEL_54:
                  uint64_t v42 = [v6 objectForKeyedSubscript:@"bundleSourceProactiveExists"];
                  v869 = (void *)v42;
                  if (!v42 || (uint64_t v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v868 = 0;
                    goto LABEL_57;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v868 = v43;
LABEL_57:
                    uint64_t v44 = [v6 objectForKeyedSubscript:@"bundleSourceRoutineExists"];
                    v866 = (void *)v44;
                    if (!v44 || (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v865 = 0;
                      goto LABEL_60;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v865 = v45;
LABEL_60:
                      uint64_t v46 = [v6 objectForKeyedSubscript:@"bundlePromptLanguageFormat"];
                      id v857 = v10;
                      v861 = (void *)v46;
                      v862 = a4;
                      if (!v46 || (int v47 = (void *)v46, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v860 = 0;
                        goto LABEL_63;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v860 = v47;
LABEL_63:
                        uint64_t v48 = [v6 objectForKeyedSubscript:@"bundlePromptToneID"];
                        v859 = (void *)v48;
                        if (!v48 || (uint64_t v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v858 = 0;
                          goto LABEL_66;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v858 = v49;
LABEL_66:
                          uint64_t v50 = [v6 objectForKeyedSubscript:@"bundlePromptParametersAvailability"];
                          v855 = (void *)v50;
                          if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v856 = 0;
                            goto LABEL_69;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v856 = v51;
LABEL_69:
                            uint64_t v52 = [v6 objectForKeyedSubscript:@"bundlePlaceType"];
                            v853 = (void *)v52;
                            if (!v52 || (int v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v854 = 0;
                              goto LABEL_123;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v854 = v53;
LABEL_122:

LABEL_123:
                              uint64_t v125 = [v6 objectForKeyedSubscript:@"bundlePlaceUserType"];
                              v851 = (void *)v125;
                              if (!v125 || (uint64_t v126 = (void *)v125, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v852 = 0;
LABEL_135:
                                uint64_t v140 = [v6 objectForKeyedSubscript:@"bundleBaseEventCateory"];
                                id v849 = v6;
                                v850 = (void *)v140;
                                if (v140
                                  && (uint64_t v141 = (void *)v140, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v848 = v141;
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v862)
                                      {
                                        id v196 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v197 = *MEMORY[0x1E4F502C8];
                                        uint64_t v1133 = *MEMORY[0x1E4F28568];
                                        uint64_t v143 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleBaseEventCateory"];
                                        v1134 = v143;
                                        v884 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1134 forKeys:&v1133 count:1];
                                        id v848 = 0;
                                        v877 = 0;
                                        id *v862 = (id)objc_msgSend(v196, "initWithDomain:code:userInfo:", v197, 2);
                                        uint64_t v59 = v879;
                                        uint64_t v60 = v875;
                                        v29 = v889;
                                        uint64_t v61 = v873;
                                        uint64_t v98 = v859;
                                        uint64_t v16 = v888;
                                        goto LABEL_1111;
                                      }
                                      id v848 = 0;
                                      v877 = 0;
                                      uint64_t v59 = v879;
                                      uint64_t v60 = v875;
                                      v29 = v889;
                                      uint64_t v61 = v873;
                                      uint64_t v98 = v859;
                                      uint64_t v16 = v888;
                                      goto LABEL_1113;
                                    }
                                    id v142 = v141;
                                    id v848 = [NSNumber numberWithInt:BMMomentsEventDataEventCategoryTypeFromString(v142)];
                                  }
                                }
                                else
                                {
                                  id v848 = 0;
                                }
                                uint64_t v143 = [v6 objectForKeyedSubscript:@"bundleEventIDs"];
                                uint64_t v144 = [MEMORY[0x1E4F1CA98] null];
                                int v145 = [v143 isEqual:v144];

                                uint64_t v98 = v859;
                                if (v145)
                                {
                                  v847 = v36;

                                  uint64_t v143 = 0;
                                }
                                else
                                {
                                  if (v143)
                                  {
                                    objc_opt_class();
                                    v29 = v889;
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v862)
                                      {
                                        id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v166 = *MEMORY[0x1E4F502C8];
                                        uint64_t v1131 = *MEMORY[0x1E4F28568];
                                        v884 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"bundleEventIDs"];
                                        v1132 = v884;
                                        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1132 forKeys:&v1131 count:1];
                                        v168 = id v167 = v36;
                                        uint64_t v169 = v166;
                                        v29 = v889;
                                        v877 = 0;
                                        id *v862 = (id)[v165 initWithDomain:v169 code:2 userInfo:v168];
                                        int v164 = (void *)v168;
                                        id v36 = v167;
                                        uint64_t v59 = v879;
                                        uint64_t v60 = v875;
                                        uint64_t v61 = v873;
                                        uint64_t v16 = v888;
                                        goto LABEL_1110;
                                      }
                                      v877 = 0;
                                      uint64_t v59 = v879;
                                      uint64_t v60 = v875;
                                      uint64_t v61 = v873;
                                      uint64_t v16 = v888;
                                      goto LABEL_1112;
                                    }
                                    v847 = v36;
LABEL_151:
                                    v884 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v143, "count"));
                                    long long v934 = 0u;
                                    long long v935 = 0u;
                                    long long v936 = 0u;
                                    long long v937 = 0u;
                                    obuint64_t j = v143;
                                    uint64_t v146 = [obj countByEnumeratingWithState:&v934 objects:v1130 count:16];
                                    if (v146)
                                    {
                                      uint64_t v147 = v146;
                                      uint64_t v148 = *(void *)v935;
                                      uint64_t v98 = v859;
                                      do
                                      {
                                        for (uint64_t i = 0; i != v147; ++i)
                                        {
                                          if (*(void *)v935 != v148) {
                                            objc_enumerationMutation(obj);
                                          }
                                          v150 = *(void **)(*((void *)&v934 + 1) + 8 * i);
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            if (v862)
                                            {
                                              id v157 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v158 = *MEMORY[0x1E4F502C8];
                                              uint64_t v1128 = *MEMORY[0x1E4F28568];
                                              v843 = (BMMomentsEventDataAction *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"bundleEventIDs"];
                                              v1129 = v843;
                                              uint64_t v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1129 forKeys:&v1128 count:1];
                                              int v160 = v157;
                                              uint64_t v161 = v158;
LABEL_169:
                                              id v846 = (id)v159;
                                              uint64_t v59 = v879;
                                              uint64_t v60 = v875;
                                              uint64_t v61 = v873;
                                              v877 = 0;
                                              id *v862 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, 2);
                                              uint64_t v143 = obj;
                                              id v844 = obj;
                                              uint64_t v16 = v888;
                                              v29 = v889;
                                              id v36 = v847;
                                              uint64_t v98 = v859;
                                              goto LABEL_1109;
                                            }
LABEL_170:
                                            v877 = 0;
                                            uint64_t v143 = obj;
                                            int v164 = obj;
                                            uint64_t v16 = v888;
                                            uint64_t v59 = v879;
                                            uint64_t v60 = v875;
                                            v29 = v889;
                                            uint64_t v61 = v873;
                                            id v36 = v847;
                                            uint64_t v98 = v859;
                                            goto LABEL_1110;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (v862)
                                            {
                                              id v162 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v163 = *MEMORY[0x1E4F502C8];
                                              uint64_t v1126 = *MEMORY[0x1E4F28568];
                                              v843 = (BMMomentsEventDataAction *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleEventIDs"];
                                              v1127 = v843;
                                              uint64_t v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1127 forKeys:&v1126 count:1];
                                              int v160 = v162;
                                              uint64_t v161 = v163;
                                              goto LABEL_169;
                                            }
                                            goto LABEL_170;
                                          }
                                          id v151 = v150;
                                          [v884 addObject:v151];
                                        }
                                        uint64_t v147 = [obj countByEnumeratingWithState:&v934 objects:v1130 count:16];
                                        id v6 = v849;
                                        v29 = v889;
                                      }
                                      while (v147);
                                    }
                                    uint64_t v143 = obj;

                                    uint64_t v152 = [v6 objectForKeyedSubscript:@"bundleActionType"];
                                    id v844 = (id)v152;
                                    if (!v152
                                      || (v153 = (void *)v152, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v843 = 0;
LABEL_163:
                                      id v36 = v847;
                                      uint64_t v154 = [v6 objectForKeyedSubscript:@"backgroundActions"];
                                      v155 = [MEMORY[0x1E4F1CA98] null];
                                      int v156 = [v154 isEqual:v155];

                                      if (v156)
                                      {

                                        uint64_t v154 = 0;
                                      }
                                      else if (v154)
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          id v846 = v154;
                                          if (v862)
                                          {
                                            id v210 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v211 = *MEMORY[0x1E4F502C8];
                                            uint64_t v1122 = *MEMORY[0x1E4F28568];
                                            v845 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"backgroundActions"];
                                            v1123 = v845;
                                            uint64_t v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1123 forKeys:&v1122 count:1];
                                            v877 = 0;
                                            id *v862 = (id)[v210 initWithDomain:v211 code:2 userInfo:v212];
                                            v213 = (void *)v212;
                                            id v36 = v847;
                                            uint64_t v16 = v888;
                                            uint64_t v59 = v879;
                                            uint64_t v60 = v875;
                                            v29 = v889;
                                            uint64_t v61 = v873;
                                            goto LABEL_1108;
                                          }
                                          v877 = 0;
                                          uint64_t v16 = v888;
                                          uint64_t v59 = v879;
                                          uint64_t v60 = v875;
                                          v29 = v889;
                                          uint64_t v61 = v873;
                                          goto LABEL_1109;
                                        }
                                      }
                                      v845 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v154, "count"));
                                      long long v929 = 0u;
                                      long long v930 = 0u;
                                      long long v931 = 0u;
                                      long long v932 = 0u;
                                      id v170 = v154;
                                      uint64_t v171 = [v170 countByEnumeratingWithState:&v929 objects:v1121 count:16];
                                      id v846 = v170;
                                      if (!v171) {
                                        goto LABEL_189;
                                      }
                                      uint64_t v172 = v171;
                                      uint64_t v173 = *(void *)v930;
                                      while (1)
                                      {
                                        for (uint64_t j = 0; j != v172; ++j)
                                        {
                                          if (*(void *)v930 != v173) {
                                            objc_enumerationMutation(v846);
                                          }
                                          int v175 = *(void **)(*((void *)&v929 + 1) + 8 * j);
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            v202 = v862;
                                            if (v862)
                                            {
                                              id v203 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v204 = *MEMORY[0x1E4F502C8];
                                              uint64_t v1119 = *MEMORY[0x1E4F28568];
                                              v841 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"backgroundActions"];
                                              v1120 = v841;
                                              uint64_t v205 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1120 forKeys:&v1119 count:1];
                                              uint64_t v206 = v203;
                                              uint64_t v207 = v204;
                                              goto LABEL_220;
                                            }
LABEL_229:
                                            v877 = 0;
                                            v213 = v846;
                                            uint64_t v16 = v888;
                                            uint64_t v59 = v879;
                                            uint64_t v60 = v875;
                                            v29 = v889;
                                            uint64_t v61 = v873;
                                            uint64_t v98 = v859;
                                            uint64_t v143 = obj;
                                            id v36 = v847;
                                            goto LABEL_1108;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            v202 = v862;
                                            if (!v862) {
                                              goto LABEL_229;
                                            }
                                            id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v209 = *MEMORY[0x1E4F502C8];
                                            uint64_t v1117 = *MEMORY[0x1E4F28568];
                                            v841 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"backgroundActions"];
                                            v1118 = v841;
                                            uint64_t v205 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1118 forKeys:&v1117 count:1];
                                            uint64_t v206 = v208;
                                            uint64_t v207 = v209;
LABEL_220:
                                            id v842 = (id)v205;
                                            v877 = 0;
                                            id *v202 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v207, 2);
LABEL_224:
                                            id v840 = v846;
                                            uint64_t v16 = v888;
                                            uint64_t v59 = v879;
                                            uint64_t v60 = v875;
                                            v29 = v889;
                                            uint64_t v61 = v873;
                                            uint64_t v98 = v859;
                                            uint64_t v143 = obj;
                                            id v36 = v847;
                                            goto LABEL_1106;
                                          }
                                          id v176 = v175;
                                          int v177 = [BMMomentsEventDataAction alloc];
                                          id v928 = 0;
                                          int v178 = [(BMMomentsEventDataAction *)v177 initWithJSONDictionary:v176 error:&v928];
                                          id v179 = v928;
                                          if (v179)
                                          {
                                            id v842 = v179;
                                            v841 = v176;
                                            if (v862) {
                                              id *v862 = v179;
                                            }

                                            v877 = 0;
                                            goto LABEL_224;
                                          }
                                          [v845 addObject:v178];
                                        }
                                        id v170 = v846;
                                        uint64_t v172 = [v846 countByEnumeratingWithState:&v929 objects:v1121 count:16];
                                        if (!v172)
                                        {
LABEL_189:

                                          uint64_t v180 = [v6 objectForKeyedSubscript:@"bundleIsFamilyIncluded"];
                                          v841 = (void *)v180;
                                          if (v180)
                                          {
                                            int v181 = (void *)v180;
                                            objc_opt_class();
                                            uint64_t v98 = v859;
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v840 = 0;
                                              v29 = v889;
                                              goto LABEL_232;
                                            }
                                            objc_opt_class();
                                            uint64_t v143 = obj;
                                            id v36 = v847;
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v840 = v181;
                                              v29 = v889;
                                              goto LABEL_233;
                                            }
                                            uint64_t v16 = v888;
                                            if (v862)
                                            {
                                              id v216 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v217 = *MEMORY[0x1E4F502C8];
                                              uint64_t v1115 = *MEMORY[0x1E4F28568];
                                              id v218 = [NSString alloc];
                                              uint64_t v660 = objc_opt_class();
                                              v219 = v218;
                                              uint64_t v16 = v888;
                                              id v842 = (id)[v219 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v660, @"bundleIsFamilyIncluded"];
                                              id v1116 = v842;
                                              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1116 forKeys:&v1115 count:1];
                                              v835 = uint64_t v98 = v859;
                                              id v840 = 0;
                                              v877 = 0;
                                              id *v862 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v217, 2);
                                              uint64_t v59 = v879;
                                              uint64_t v60 = v875;
                                              v29 = v889;
                                              uint64_t v61 = v873;

                                              goto LABEL_1106;
                                            }
                                            id v840 = 0;
                                            v877 = 0;
                                            uint64_t v59 = v879;
                                            uint64_t v60 = v875;
                                            v29 = v889;
                                            uint64_t v61 = v873;
LABEL_1107:

                                            v213 = v840;
LABEL_1108:

LABEL_1109:
                                            int v164 = v844;
LABEL_1110:

LABEL_1111:
                                            id v6 = v849;
LABEL_1112:

LABEL_1113:
                                            a4 = v870;
LABEL_1114:

                                            goto LABEL_1115;
                                          }
                                          id v840 = 0;
                                          v29 = v889;
                                          uint64_t v98 = v859;
LABEL_232:
                                          uint64_t v143 = obj;
                                          id v36 = v847;
LABEL_233:
                                          uint64_t v214 = [v6 objectForKeyedSubscript:@"bundleTimeTag"];
                                          v834 = (void *)v214;
                                          if (!v214
                                            || (v215 = (void *)v214,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v842 = 0;
LABEL_248:
                                            uint64_t v221 = [v6 objectForKeyedSubscript:@"isBundleResourceTypeUnknown"];
                                            v832 = (void *)v221;
                                            if (!v221
                                              || (int v222 = (void *)v221,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v833 = 0;
LABEL_251:
                                              uint64_t v223 = [v6 objectForKeyedSubscript:@"isBundleResourceTypeValueIncluded"];
                                              v831 = (void *)v223;
                                              if (!v223
                                                || (uint64_t v224 = (void *)v223,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v830 = 0;
LABEL_254:
                                                uint64_t v225 = [v6 objectForKeyedSubscript:@"isBundleResourceTypePhotoAssetsIncluded"];
                                                v829 = (void *)v225;
                                                if (!v225
                                                  || (v226 = (void *)v225,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v828 = 0;
LABEL_257:
                                                  uint64_t v227 = [v6 objectForKeyedSubscript:@"isBundleResourceTypeMediaIncluded"];
                                                  v827 = (void *)v227;
                                                  if (!v227
                                                    || (int v228 = (void *)v227,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v826 = 0;
LABEL_260:
                                                    uint64_t v229 = [v6 objectForKeyedSubscript:@"isBundleResourceTypeWebLinkIncluded"];
                                                    v825 = (void *)v229;
                                                    if (!v229
                                                      || (uint64_t v230 = (void *)v229,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v824 = 0;
LABEL_263:
                                                      uint64_t v231 = [v6 objectForKeyedSubscript:@"isBundleResourceTypeInterenceTagIncluded"];
                                                      v823 = (void *)v231;
                                                      if (!v231
                                                        || (v232 = (void *)v231,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v822 = 0;
LABEL_266:
                                                        uint64_t v233 = [v6 objectForKeyedSubscript:@"bundlEngagement"];
                                                        v821 = (void *)v233;
                                                        if (!v233
                                                          || (id v234 = (void *)v233,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v820 = 0;
LABEL_303:
                                                          uint64_t v267 = [v6 objectForKeyedSubscript:@"bundleVersion"];
                                                          v818 = (void *)v267;
                                                          if (!v267
                                                            || (v268 = (void *)v267,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v819 = 0;
LABEL_306:
                                                            uint64_t v269 = [v6 objectForKeyedSubscript:@"rankingVersion"];
                                                            v816 = (void *)v269;
                                                            if (!v269
                                                              || (v270 = (void *)v269,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v817 = 0;
LABEL_309:
                                                              uint64_t v271 = [v6 objectForKeyedSubscript:@"suggestionType"];
                                                              v815 = (void *)v271;
                                                              if (!v271
                                                                || (v272 = (void *)v271,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v811 = 0;
LABEL_329:
                                                                uint64_t v286 = [v6 objectForKeyedSubscript:@"suggestionTimestamp"];
                                                                v814 = (void *)v286;
                                                                if (!v286
                                                                  || (v287 = (void *)v286,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v813 = 0;
LABEL_339:
                                                                  uint64_t v294 = [v6 objectForKeyedSubscript:@"suggestionClientIdentifier"];
                                                                  v812 = (void *)v294;
                                                                  if (!v294
                                                                    || (id v295 = (void *)v294,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v810 = 0;
LABEL_342:
                                                                    uint64_t v296 = [v6 objectForKeyedSubscript:@"suggestionViewContainerName"];
                                                                    v809 = (void *)v296;
                                                                    if (!v296
                                                                      || (v297 = (void *)v296,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v808 = 0;
LABEL_345:
                                                                      uint64_t v298 = [v6 objectForKeyedSubscript:@"suggestionViewVisibleTime"];
                                                                      v807 = (void *)v298;
                                                                      if (!v298
                                                                        || (v299 = (void *)v298,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v806 = 0;
LABEL_348:
                                                                        uint64_t v300 = [v6 objectForKeyedSubscript:@"appEntryEventType"];
                                                                        v805 = (void *)v300;
                                                                        if (!v300
                                                                          || (id v301 = (void *)v300,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v804 = 0;
LABEL_375:
                                                                          uint64_t v322 = [v6 objectForKeyedSubscript:@"appEntryEventClientIdentifier"];
                                                                          v803 = (void *)v322;
                                                                          if (!v322
                                                                            || (id v323 = (void *)v322,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            id v802 = 0;
LABEL_378:
                                                                            uint64_t v324 = [v6 objectForKeyedSubscript:@"appEntryEventTimestamp"];
                                                                            v801 = (void *)v324;
                                                                            v847 = v36;
                                                                            if (!v324
                                                                              || (id v325 = (void *)v324,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              id v800 = 0;
LABEL_398:
                                                                              uint64_t v338 = [v6 objectForKeyedSubscript:@"appEntryEventStartTime"];
                                                                              v799 = (void *)v338;
                                                                              if (!v338
                                                                                || (v339 = (void *)v338,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                id v798 = 0;
LABEL_401:
                                                                                uint64_t v340 = [v6 objectForKeyedSubscript:@"appEntryEventEndTime"];
                                                                                v797 = (void *)v340;
                                                                                if (!v340
                                                                                  || (v341 = (void *)v340,
                                                                                      objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  id v795 = 0;
LABEL_404:
                                                                                  uint64_t v342 = [v6 objectForKeyedSubscript:@"appEntryEventTotalCharacters"];
                                                                                  v796 = (void *)v342;
                                                                                  if (v342
                                                                                    && (v343 = (void *)v342,
                                                                                        objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v794 = v343;
                                                                                      goto LABEL_407;
                                                                                    }
                                                                                    if (!v862)
                                                                                    {
                                                                                      id v794 = 0;
                                                                                      v877 = 0;
                                                                                      uint64_t v59 = v879;
                                                                                      uint64_t v60 = v875;
                                                                                      v29 = v889;
                                                                                      uint64_t v61 = v873;
                                                                                      uint64_t v98 = v859;
                                                                                      id v284 = v811;
                                                                                      uint64_t v16 = v888;
                                                                                      goto LABEL_1085;
                                                                                    }
                                                                                    id v356 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v357 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v1073 = *MEMORY[0x1E4F28568];
                                                                                    id v792 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"appEntryEventTotalCharacters"];
                                                                                    id v1074 = v792;
                                                                                    v793 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1074 forKeys:&v1073 count:1];
                                                                                    id v794 = 0;
                                                                                    v877 = 0;
                                                                                    id *v862 = (id)objc_msgSend(v356, "initWithDomain:code:userInfo:", v357, 2);
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    id v794 = 0;
LABEL_407:
                                                                                    uint64_t v344 = [v6 objectForKeyedSubscript:@"appEntryEventAddedCharacters"];
                                                                                    v793 = (void *)v344;
                                                                                    if (!v344
                                                                                      || (v345 = (void *)v344,
                                                                                          objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      id v792 = 0;
LABEL_410:
                                                                                      uint64_t v346 = [v6 objectForKeyedSubscript:@"clientActivityEventType"];
                                                                                      v791 = (void *)v346;
                                                                                      if (v346
                                                                                        && (v347 = (void *)v346,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v790 = v347;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                          {
                                                                                            if (v862)
                                                                                            {
                                                                                              id v404 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                              uint64_t v405 = *MEMORY[0x1E4F502C8];
                                                                                              uint64_t v1069 = *MEMORY[0x1E4F28568];
                                                                                              id v788 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"clientActivityEventType"];
                                                                                              id v1070 = v788;
                                                                                              v789 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1070 forKeys:&v1069 count:1];
                                                                                              id v790 = 0;
                                                                                              v877 = 0;
                                                                                              id *v862 = (id)objc_msgSend(v404, "initWithDomain:code:userInfo:", v405, 2);
                                                                                              uint64_t v16 = v888;
                                                                                              uint64_t v59 = v879;
                                                                                              uint64_t v60 = v875;
                                                                                              v29 = v889;
                                                                                              uint64_t v61 = v873;
                                                                                              uint64_t v98 = v859;
                                                                                              uint64_t v143 = obj;
                                                                                              id v284 = v811;
                                                                                              goto LABEL_1082;
                                                                                            }
                                                                                            id v790 = 0;
                                                                                            v877 = 0;
                                                                                            uint64_t v16 = v888;
                                                                                            uint64_t v59 = v879;
                                                                                            uint64_t v60 = v875;
                                                                                            v29 = v889;
                                                                                            uint64_t v61 = v873;
                                                                                            uint64_t v98 = v859;
                                                                                            uint64_t v143 = obj;
                                                                                            id v284 = v811;
                                                                                            goto LABEL_1083;
                                                                                          }
                                                                                          v347 = v791;
                                                                                          id v362 = v791;
                                                                                          id v790 = [NSNumber numberWithInt:BMMomentsEventDataClientActivityEventTypeFromString(v362)];

                                                                                          uint64_t v143 = obj;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        id v790 = 0;
                                                                                      }
                                                                                      uint64_t v363 = [v6 objectForKeyedSubscript:@"clientActivityEventClientIdentifier"];
                                                                                      v789 = (void *)v363;
                                                                                      if (v363
                                                                                        && (v364 = (void *)v363,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                        {
                                                                                          if (v862)
                                                                                          {
                                                                                            id v373 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v374 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v1067 = *MEMORY[0x1E4F28568];
                                                                                            id v786 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientActivityEventClientIdentifier"];
                                                                                            id v1068 = v786;
                                                                                            v787 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1068 forKeys:&v1067 count:1];
                                                                                            id v788 = 0;
                                                                                            v877 = 0;
                                                                                            id *v862 = (id)objc_msgSend(v373, "initWithDomain:code:userInfo:", v374, 2);
                                                                                            uint64_t v59 = v879;
                                                                                            uint64_t v60 = v875;
                                                                                            v29 = v889;
                                                                                            uint64_t v61 = v873;
                                                                                            uint64_t v98 = v859;
                                                                                            id v284 = v811;
                                                                                            uint64_t v16 = v888;
                                                                                            goto LABEL_1081;
                                                                                          }
                                                                                          id v788 = 0;
                                                                                          v877 = 0;
                                                                                          uint64_t v59 = v879;
                                                                                          uint64_t v60 = v875;
                                                                                          v29 = v889;
                                                                                          uint64_t v61 = v873;
                                                                                          uint64_t v98 = v859;
                                                                                          id v284 = v811;
                                                                                          uint64_t v16 = v888;
                                                                                          goto LABEL_1082;
                                                                                        }
                                                                                        id v788 = v364;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        id v788 = 0;
                                                                                      }
                                                                                      uint64_t v365 = [v6 objectForKeyedSubscript:@"clientActivityEventTimestamp"];
                                                                                      v838 = v39;
                                                                                      v787 = (void *)v365;
                                                                                      if (v365
                                                                                        && (v366 = (void *)v365,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v369 = v366;
                                                                                          id v370 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                                                                          [v369 doubleValue];
                                                                                          id v786 = (id)objc_msgSend(v370, "initWithTimeIntervalSince1970:");
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            id v377 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                                                                            id v378 = v366;
                                                                                            id v786 = [v377 dateFromString:v378];
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                            {
                                                                                              if (v862)
                                                                                              {
                                                                                                id v433 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v434 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v1065 = *MEMORY[0x1E4F28568];
                                                                                                id v780 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"clientActivityEventTimestamp"];
                                                                                                id v1066 = v780;
                                                                                                v782 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1066 forKeys:&v1065 count:1];
                                                                                                id v786 = 0;
                                                                                                v877 = 0;
                                                                                                id *v862 = (id)objc_msgSend(v433, "initWithDomain:code:userInfo:", v434, 2);
                                                                                                uint64_t v16 = v888;
                                                                                                uint64_t v59 = v879;
                                                                                                uint64_t v60 = v875;
                                                                                                v29 = v889;
                                                                                                uint64_t v61 = v873;
                                                                                                uint64_t v98 = v859;
                                                                                                uint64_t v143 = obj;
                                                                                                id v284 = v811;
                                                                                                goto LABEL_1080;
                                                                                              }
                                                                                              id v786 = 0;
                                                                                              v877 = 0;
                                                                                              uint64_t v16 = v888;
                                                                                              uint64_t v59 = v879;
                                                                                              uint64_t v60 = v875;
                                                                                              v29 = v889;
                                                                                              uint64_t v61 = v873;
                                                                                              uint64_t v98 = v859;
                                                                                              uint64_t v143 = obj;
                                                                                              id v284 = v811;
                                                                                              goto LABEL_1081;
                                                                                            }
                                                                                            id v786 = v787;
                                                                                          }
                                                                                          id v6 = v849;
                                                                                          uint64_t v143 = obj;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        id v786 = 0;
                                                                                      }
                                                                                      uint64_t v367 = [v6 objectForKeyedSubscript:@"suggestionIdentifier"];
                                                                                      v782 = (void *)v367;
                                                                                      if (v367
                                                                                        && (v368 = (void *)v367,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                        {
                                                                                          if (v862)
                                                                                          {
                                                                                            id v380 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v381 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v1063 = *MEMORY[0x1E4F28568];
                                                                                            id v778 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestionIdentifier"];
                                                                                            id v1064 = v778;
                                                                                            v785 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1064 forKeys:&v1063 count:1];
                                                                                            id v780 = 0;
                                                                                            v877 = 0;
                                                                                            id *v862 = (id)objc_msgSend(v380, "initWithDomain:code:userInfo:", v381, 2);
                                                                                            uint64_t v59 = v879;
                                                                                            uint64_t v60 = v875;
                                                                                            v29 = v889;
                                                                                            uint64_t v61 = v873;
                                                                                            uint64_t v98 = v859;
                                                                                            id v284 = v811;
                                                                                            uint64_t v16 = v888;
                                                                                            goto LABEL_1079;
                                                                                          }
                                                                                          id v780 = 0;
                                                                                          v877 = 0;
                                                                                          uint64_t v59 = v879;
                                                                                          uint64_t v60 = v875;
                                                                                          v29 = v889;
                                                                                          uint64_t v61 = v873;
                                                                                          uint64_t v98 = v859;
                                                                                          id v284 = v811;
                                                                                          uint64_t v16 = v888;
                                                                                          goto LABEL_1080;
                                                                                        }
                                                                                        id v780 = v368;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        id v780 = 0;
                                                                                      }
                                                                                      v785 = [v6 objectForKeyedSubscript:@"photoSourceType"];
                                                                                      if (!v785
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        id v778 = 0;
LABEL_485:
                                                                                        v779 = [v6 objectForKeyedSubscript:@"photoLibraryType"];
                                                                                        if (!v779
                                                                                          || (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          id v776 = 0;
LABEL_493:
                                                                                          v777 = [v6 objectForKeyedSubscript:@"bundleSourcePostAnalyticsExists"];
                                                                                          if (!v777
                                                                                            || (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            id v775 = 0;
LABEL_496:
                                                                                            v774 = [v6 objectForKeyedSubscript:@"bundleSourcePDExists"];
                                                                                            if (!v774
                                                                                              || (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                                            {
                                                                                              id v772 = 0;
LABEL_499:
                                                                                              v773 = [v6 objectForKeyedSubscript:@"bundleSourceMotionExists"];
                                                                                              if (!v773
                                                                                                || (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                                              {
                                                                                                id v771 = 0;
LABEL_502:
                                                                                                v770 = [v6 objectForKeyedSubscript:@"bundleSourceBooksExists"];
                                                                                                if (!v770 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                {
                                                                                                  id v769 = 0;
LABEL_505:
                                                                                                  v768 = [v6 objectForKeyedSubscript:@"bundleSourceScreenTimeExists"];
                                                                                                  if (!v768 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                  {
                                                                                                    id v767 = 0;
                                                                                                    goto LABEL_508;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v767 = v768;
LABEL_508:
                                                                                                    v385 = objc_msgSend(v6, "objectForKeyedSubscript:");
                                                                                                    v386 = [MEMORY[0x1E4F1CA98] null];
                                                                                                    int v387 = [v385 isEqual:v386];

                                                                                                    v388 = v6;
                                                                                                    if (v387)
                                                                                                    {

                                                                                                      goto LABEL_519;
                                                                                                    }
                                                                                                    id v781 = v385;
                                                                                                    if (v385)
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          id v431 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v432 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v1047 = *MEMORY[0x1E4F28568];
                                                                                                          v783 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"gaPRArray"];
                                                                                                          v1048 = v783;
                                                                                                          id v400 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1048 forKeys:&v1047 count:1];
                                                                                                          v877 = 0;
                                                                                                          id *v862 = (id)[v431 initWithDomain:v432 code:2 userInfo:v400];
                                                                                                          goto LABEL_1070;
                                                                                                        }
                                                                                                        v877 = 0;
                                                                                                        uint64_t v59 = v879;
                                                                                                        uint64_t v60 = v875;
                                                                                                        v29 = v889;
                                                                                                        uint64_t v61 = v873;
                                                                                                        int v39 = v838;
                                                                                                        uint64_t v98 = v859;
                                                                                                        uint64_t v143 = obj;
                                                                                                        id v284 = v811;
                                                                                                        goto LABEL_1072;
                                                                                                      }
                                                                                                      v390 = v385;
                                                                                                    }
                                                                                                    else
                                                                                                    {
LABEL_519:
                                                                                                      v390 = 0;
                                                                                                    }
                                                                                                    v783 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v390, "count"));
                                                                                                    long long v924 = 0u;
                                                                                                    long long v925 = 0u;
                                                                                                    long long v926 = 0u;
                                                                                                    long long v927 = 0u;
                                                                                                    id v781 = v390;
                                                                                                    uint64_t v391 = [v781 countByEnumeratingWithState:&v924 objects:v1046 count:16];
                                                                                                    if (v391)
                                                                                                    {
                                                                                                      uint64_t v392 = v391;
                                                                                                      uint64_t v393 = *(void *)v925;
                                                                                                      do
                                                                                                      {
                                                                                                        for (uint64_t k = 0;
                                                                                                              k != v392;
                                                                                                              ++k)
                                                                                                        {
                                                                                                          if (*(void *)v925 != v393) {
                                                                                                            objc_enumerationMutation(v781);
                                                                                                          }
                                                                                                          v395 = *(void **)(*((void *)&v924 + 1) + 8 * k);
                                                                                                          objc_opt_class();
                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              id v424 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                              uint64_t v425 = *MEMORY[0x1E4F502C8];
                                                                                                              uint64_t v1044 = *MEMORY[0x1E4F28568];
                                                                                                              v766 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"gaPRArray"];
                                                                                                              v1045 = v766;
                                                                                                              uint64_t v426 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1045 forKeys:&v1044 count:1];
                                                                                                              v427 = v424;
                                                                                                              uint64_t v428 = v425;
                                                                                                              goto LABEL_578;
                                                                                                            }
LABEL_587:
                                                                                                            v877 = 0;
                                                                                                            id v400 = v781;
LABEL_1070:
                                                                                                            uint64_t v59 = v879;
                                                                                                            uint64_t v60 = v875;
                                                                                                            uint64_t v61 = v873;
                                                                                                            uint64_t v98 = v859;
                                                                                                            uint64_t v143 = obj;
                                                                                                            id v284 = v811;

                                                                                                            v29 = v889;
                                                                                                            int v39 = v838;

LABEL_1072:
                                                                                                            uint64_t v16 = v888;
LABEL_1073:

LABEL_1074:
LABEL_1075:

LABEL_1076:
LABEL_1077:

LABEL_1078:
LABEL_1079:

LABEL_1080:
LABEL_1081:

LABEL_1082:
LABEL_1083:

LABEL_1084:
LABEL_1085:

LABEL_1086:
LABEL_1087:

LABEL_1088:
LABEL_1089:

LABEL_1090:
LABEL_1091:

LABEL_1092:
LABEL_1093:

LABEL_1094:
LABEL_1095:

                                                                                                            v277 = v816;
                                                                                                            id v36 = v847;
LABEL_1096:

LABEL_1097:
LABEL_1098:

LABEL_1099:
LABEL_1100:

LABEL_1101:
LABEL_1102:

LABEL_1103:
LABEL_1104:

LABEL_1105:
LABEL_1106:

                                                                                                            goto LABEL_1107;
                                                                                                          }
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (!v862) {
                                                                                                              goto LABEL_587;
                                                                                                            }
                                                                                                            id v429 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v430 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1042 = *MEMORY[0x1E4F28568];
                                                                                                            v766 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"gaPRArray"];
                                                                                                            v1043 = v766;
                                                                                                            uint64_t v426 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1043 forKeys:&v1042 count:1];
                                                                                                            v427 = v429;
                                                                                                            uint64_t v428 = v430;
LABEL_578:
                                                                                                            id v765 = (id)v426;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v427, "initWithDomain:code:userInfo:", v428, 2);
LABEL_582:
                                                                                                            id v400 = v781;
                                                                                                            goto LABEL_1068;
                                                                                                          }
                                                                                                          id v396 = v395;
                                                                                                          v397 = [BMMomentsEventDataPR alloc];
                                                                                                          id v923 = 0;
                                                                                                          v398 = [(BMMomentsEventDataPR *)v397 initWithJSONDictionary:v396 error:&v923];
                                                                                                          id v399 = v923;
                                                                                                          if (v399)
                                                                                                          {
                                                                                                            id v765 = v399;
                                                                                                            v766 = v396;
                                                                                                            if (v862) {
                                                                                                              id *v862 = v399;
                                                                                                            }

                                                                                                            v877 = 0;
                                                                                                            goto LABEL_582;
                                                                                                          }
                                                                                                          [v783 addObject:v398];
                                                                                                        }
                                                                                                        uint64_t v392 = [v781 countByEnumeratingWithState:&v924 objects:v1046 count:16];
                                                                                                      }
                                                                                                      while (v392);
                                                                                                    }

                                                                                                    v766 = [v6 objectForKeyedSubscript:@"bundlePCount"];
                                                                                                    if (v766 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          id v435 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v436 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v1040 = *MEMORY[0x1E4F28568];
                                                                                                          id v765 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundlePCount"];
                                                                                                          id v1041 = v765;
                                                                                                          v764 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1041 forKeys:&v1040 count:1];
                                                                                                          id v400 = 0;
                                                                                                          v877 = 0;
                                                                                                          id *v862 = (id)objc_msgSend(v435, "initWithDomain:code:userInfo:", v436, 2);

                                                                                                          goto LABEL_1068;
                                                                                                        }
                                                                                                        id v400 = 0;
                                                                                                        v877 = 0;
LABEL_1069:

                                                                                                        goto LABEL_1070;
                                                                                                      }
                                                                                                      id v400 = v766;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v400 = 0;
                                                                                                    }
                                                                                                    v763 = [v6 objectForKeyedSubscript:@"ranking"];
                                                                                                    if (v763 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v765 = v763;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v446 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v447 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1038 = *MEMORY[0x1E4F28568];
                                                                                                            id v755 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"ranking"];
                                                                                                            id v1039 = v755;
                                                                                                            v762 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1039 forKeys:&v1038 count:1];
                                                                                                            id v765 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v446, "initWithDomain:code:userInfo:", v447, 2);
                                                                                                            goto LABEL_1066;
                                                                                                          }
                                                                                                          id v765 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1067;
                                                                                                        }
                                                                                                        id v437 = v763;
                                                                                                        id v765 = [NSNumber numberWithInt:BMMomentsEventDataRankingTypeFromString(v437)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v765 = 0;
                                                                                                    }
                                                                                                    v762 = [v6 objectForKeyedSubscript:@"labelConfidenceScore"];
                                                                                                    if (v762 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v755 = v762;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v449 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v450 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1036 = *MEMORY[0x1E4F28568];
                                                                                                            id v753 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"labelConfidenceScore"];
                                                                                                            id v1037 = v753;
                                                                                                            v761 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1037 forKeys:&v1036 count:1];
                                                                                                            id v755 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v449, "initWithDomain:code:userInfo:", v450, 2);
                                                                                                            goto LABEL_1065;
                                                                                                          }
                                                                                                          id v755 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1066;
                                                                                                        }
                                                                                                        id v438 = v762;
                                                                                                        id v755 = [NSNumber numberWithInt:BMMomentsEventDataLabelConfidenceScoreTypeFromString(v438)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v755 = 0;
                                                                                                    }
                                                                                                    v761 = [v6 objectForKeyedSubscript:@"timeCorrelationScore"];
                                                                                                    if (v761 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v753 = v761;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v452 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v453 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1034 = *MEMORY[0x1E4F28568];
                                                                                                            id v750 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"timeCorrelationScore"];
                                                                                                            id v1035 = v750;
                                                                                                            v760 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1035 forKeys:&v1034 count:1];
                                                                                                            id v753 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v452, "initWithDomain:code:userInfo:", v453, 2);
                                                                                                            goto LABEL_1064;
                                                                                                          }
                                                                                                          id v753 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1065;
                                                                                                        }
                                                                                                        id v439 = v761;
                                                                                                        id v753 = [NSNumber numberWithInt:BMMomentsEventDataTimeCorrelationScoreTypeFromString(v439)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v753 = 0;
                                                                                                    }
                                                                                                    v760 = [v6 objectForKeyedSubscript:@"callDuration"];
                                                                                                    if (v760 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v750 = v760;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v455 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v456 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1032 = *MEMORY[0x1E4F28568];
                                                                                                            id v748 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"callDuration"];
                                                                                                            id v1033 = v748;
                                                                                                            v759 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1033 forKeys:&v1032 count:1];
                                                                                                            id v750 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v455, "initWithDomain:code:userInfo:", v456, 2);
                                                                                                            goto LABEL_1063;
                                                                                                          }
                                                                                                          id v750 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1064;
                                                                                                        }
                                                                                                        id v440 = v760;
                                                                                                        id v750 = [NSNumber numberWithInt:BMMomentsEventDataCallDurationTypesFromString(v440)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v750 = 0;
                                                                                                    }
                                                                                                    v759 = [v6 objectForKeyedSubscript:@"interactionCount"];
                                                                                                    if (v759 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v748 = v759;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v458 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v459 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1030 = *MEMORY[0x1E4F28568];
                                                                                                            id v744 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"interactionCount"];
                                                                                                            id v1031 = v744;
                                                                                                            v758 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1031 forKeys:&v1030 count:1];
                                                                                                            id v748 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v458, "initWithDomain:code:userInfo:", v459, 2);
                                                                                                            goto LABEL_1062;
                                                                                                          }
                                                                                                          id v748 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1063;
                                                                                                        }
                                                                                                        id v441 = v759;
                                                                                                        id v748 = [NSNumber numberWithInt:BMMomentsEventDataInteractionCountTypesFromString(v441)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v748 = 0;
                                                                                                    }
                                                                                                    v758 = [v6 objectForKeyedSubscript:@"interactionType"];
                                                                                                    if (v758 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v744 = v758;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v461 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v462 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1028 = *MEMORY[0x1E4F28568];
                                                                                                            id v742 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"interactionType"];
                                                                                                            id v1029 = v742;
                                                                                                            v757 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1029 forKeys:&v1028 count:1];
                                                                                                            id v744 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v461, "initWithDomain:code:userInfo:", v462, 2);
                                                                                                            goto LABEL_1061;
                                                                                                          }
                                                                                                          id v744 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1062;
                                                                                                        }
                                                                                                        id v442 = v758;
                                                                                                        id v744 = [NSNumber numberWithInt:BMMomentsEventDataBundleInteractionTypesFromString(v442)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v744 = 0;
                                                                                                    }
                                                                                                    v757 = [v6 objectForKeyedSubscript:@"callPlace"];
                                                                                                    if (v757 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v742 = v757;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v465 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v466 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1026 = *MEMORY[0x1E4F28568];
                                                                                                            id v740 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"callPlace"];
                                                                                                            id v1027 = v740;
                                                                                                            v756 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1027 forKeys:&v1026 count:1];
                                                                                                            id v742 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v465, "initWithDomain:code:userInfo:", v466, 2);
                                                                                                            goto LABEL_1060;
                                                                                                          }
                                                                                                          id v742 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1061;
                                                                                                        }
                                                                                                        id v443 = v757;
                                                                                                        id v742 = [NSNumber numberWithInt:BMMomentsEventDataCallPlaceTypeFromString(v443)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v742 = 0;
                                                                                                    }
                                                                                                    v756 = [v6 objectForKeyedSubscript:@"distanceFromHome"];
                                                                                                    if (v756 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v740 = v756;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v467 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v468 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1024 = *MEMORY[0x1E4F28568];
                                                                                                            id v739 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"distanceFromHome"];
                                                                                                            id v1025 = v739;
                                                                                                            v754 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1025 forKeys:&v1024 count:1];
                                                                                                            id v740 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v467, "initWithDomain:code:userInfo:", v468, 2);
                                                                                                            goto LABEL_1059;
                                                                                                          }
                                                                                                          id v740 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1060;
                                                                                                        }
                                                                                                        id v444 = v756;
                                                                                                        id v740 = [NSNumber numberWithInt:BMMomentsEventDataDistanceFromHomeTypeFromString(v444)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v740 = 0;
                                                                                                    }
                                                                                                    v754 = [v6 objectForKeyedSubscript:@"homeAvailability"];
                                                                                                    if (v754 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v739 = v754;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v470 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v471 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1022 = *MEMORY[0x1E4F28568];
                                                                                                            id v736 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"homeAvailability"];
                                                                                                            id v1023 = v736;
                                                                                                            v752 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1023 forKeys:&v1022 count:1];
                                                                                                            id v739 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v470, "initWithDomain:code:userInfo:", v471, 2);
                                                                                                            goto LABEL_1058;
                                                                                                          }
                                                                                                          id v739 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1059;
                                                                                                        }
                                                                                                        id v445 = v754;
                                                                                                        id v739 = [NSNumber numberWithInt:BMMomentsEventDataAvailabilityTypeFromString(v445)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v739 = 0;
                                                                                                    }
                                                                                                    v752 = [v6 objectForKeyedSubscript:@"workAvailability"];
                                                                                                    if (v752 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v736 = v752;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v473 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v474 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1020 = *MEMORY[0x1E4F28568];
                                                                                                            id v735 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"workAvailability"];
                                                                                                            id v1021 = v735;
                                                                                                            v749 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1021 forKeys:&v1020 count:1];
                                                                                                            id v736 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v473, "initWithDomain:code:userInfo:", v474, 2);
                                                                                                            goto LABEL_1057;
                                                                                                          }
                                                                                                          id v736 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1058;
                                                                                                        }
                                                                                                        id v448 = v752;
                                                                                                        id v736 = [NSNumber numberWithInt:BMMomentsEventDataAvailabilityTypeFromString(v448)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v736 = 0;
                                                                                                    }
                                                                                                    v749 = [v6 objectForKeyedSubscript:@"bundleVisitMapItemSource"];
                                                                                                    if (v749 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v735 = v749;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v477 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v478 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1018 = *MEMORY[0x1E4F28568];
                                                                                                            id v733 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleVisitMapItemSource"];
                                                                                                            id v1019 = v733;
                                                                                                            v747 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1019 forKeys:&v1018 count:1];
                                                                                                            id v735 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v477, "initWithDomain:code:userInfo:", v478, 2);
                                                                                                            goto LABEL_1056;
                                                                                                          }
                                                                                                          id v735 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1057;
                                                                                                        }
                                                                                                        id v451 = v749;
                                                                                                        id v735 = [NSNumber numberWithInt:BMMomentsEventDataMapItemSourceTypeFromString(v451)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v735 = 0;
                                                                                                    }
                                                                                                    v747 = [v6 objectForKeyedSubscript:@"bundleVisitPlaceType"];
                                                                                                    if (v747 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v733 = v747;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v479 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v480 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1016 = *MEMORY[0x1E4F28568];
                                                                                                            id v732 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleVisitPlaceType"];
                                                                                                            id v1017 = v732;
                                                                                                            v743 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1017 forKeys:&v1016 count:1];
                                                                                                            id v733 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v479, "initWithDomain:code:userInfo:", v480, 2);
                                                                                                            goto LABEL_1055;
                                                                                                          }
                                                                                                          id v733 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1056;
                                                                                                        }
                                                                                                        id v454 = v747;
                                                                                                        id v733 = [NSNumber numberWithInt:BMMomentsEventDataVisitPlaceTypesFromString(v454)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v733 = 0;
                                                                                                    }
                                                                                                    v743 = [v6 objectForKeyedSubscript:@"bundleVisitPlaceLabelGranularity"];
                                                                                                    if (v743 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v732 = v743;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v501 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v502 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1014 = *MEMORY[0x1E4F28568];
                                                                                                            id v729 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleVisitPlaceLabelGranularity"];
                                                                                                            id v1015 = v729;
                                                                                                            v741 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1015 forKeys:&v1014 count:1];
                                                                                                            id v732 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v501, "initWithDomain:code:userInfo:", v502, 2);
                                                                                                            goto LABEL_1054;
                                                                                                          }
                                                                                                          id v732 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1055;
                                                                                                        }
                                                                                                        id v457 = v743;
                                                                                                        id v732 = [NSNumber numberWithInt:BMMomentsEventDataPlaceInferenceGranularityTypeFromString(v457)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v732 = 0;
                                                                                                    }
                                                                                                    v741 = [v6 objectForKeyedSubscript:@"bundleIncludesAnomalousEvent"];
                                                                                                    if (v741 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v729 = v741;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v505 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v506 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1012 = *MEMORY[0x1E4F28568];
                                                                                                            id v726 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleIncludesAnomalousEvent"];
                                                                                                            id v1013 = v726;
                                                                                                            v738 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1013 forKeys:&v1012 count:1];
                                                                                                            id v729 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v505, "initWithDomain:code:userInfo:", v506, 2);
                                                                                                            goto LABEL_1053;
                                                                                                          }
                                                                                                          id v729 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1054;
                                                                                                        }
                                                                                                        id v460 = v741;
                                                                                                        id v729 = [NSNumber numberWithInt:BMMomentsEventDataAnomalousTypeFromString(v460)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v729 = 0;
                                                                                                    }
                                                                                                    v738 = [v6 objectForKeyedSubscript:@"isFiltered"];
                                                                                                    if (v738 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          id v463 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v464 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v1010 = *MEMORY[0x1E4F28568];
                                                                                                          id v725 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFiltered"];
                                                                                                          id v1011 = v725;
                                                                                                          v737 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1011 forKeys:&v1010 count:1];
                                                                                                          id v726 = 0;
                                                                                                          v877 = 0;
                                                                                                          id *v862 = (id)objc_msgSend(v463, "initWithDomain:code:userInfo:", v464, 2);
                                                                                                          goto LABEL_1052;
                                                                                                        }
                                                                                                        id v726 = 0;
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1053;
                                                                                                      }
                                                                                                      id v726 = v738;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v726 = 0;
                                                                                                    }
                                                                                                    v737 = [v6 objectForKeyedSubscript:@"bundleSuperType"];
                                                                                                    if (v737 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v725 = v737;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v515 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v516 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1008 = *MEMORY[0x1E4F28568];
                                                                                                            id v722 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleSuperType"];
                                                                                                            id v1009 = v722;
                                                                                                            v734 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1009 forKeys:&v1008 count:1];
                                                                                                            id v725 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v515, "initWithDomain:code:userInfo:", v516, 2);
                                                                                                            goto LABEL_1051;
                                                                                                          }
                                                                                                          id v725 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1052;
                                                                                                        }
                                                                                                        id v469 = v737;
                                                                                                        id v725 = [NSNumber numberWithInt:BMMomentsEventDataEventBundleBundleSuperTypeFromString(v469)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v725 = 0;
                                                                                                    }
                                                                                                    v734 = [v6 objectForKeyedSubscript:@"bundleSubType"];
                                                                                                    if (v734 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v722 = v734;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v517 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v518 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1006 = *MEMORY[0x1E4F28568];
                                                                                                            id v721 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleSubType"];
                                                                                                            id v1007 = v721;
                                                                                                            v731 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1007 forKeys:&v1006 count:1];
                                                                                                            id v722 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v517, "initWithDomain:code:userInfo:", v518, 2);
                                                                                                            goto LABEL_1050;
                                                                                                          }
                                                                                                          id v722 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1051;
                                                                                                        }
                                                                                                        id v472 = v734;
                                                                                                        id v722 = [NSNumber numberWithInt:BMMomentsEventDataEventBundleBundleSubTypeFromString(v472)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v722 = 0;
                                                                                                    }
                                                                                                    v731 = [v6 objectForKeyedSubscript:@"isAggregatedAndSuppressed"];
                                                                                                    if (v731 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          id v475 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v476 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v1004 = *MEMORY[0x1E4F28568];
                                                                                                          id v720 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isAggregatedAndSuppressed"];
                                                                                                          id v1005 = v720;
                                                                                                          v730 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1005 forKeys:&v1004 count:1];
                                                                                                          id v721 = 0;
                                                                                                          v877 = 0;
                                                                                                          id *v862 = (id)objc_msgSend(v475, "initWithDomain:code:userInfo:", v476, 2);
                                                                                                          goto LABEL_1049;
                                                                                                        }
                                                                                                        id v721 = 0;
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1050;
                                                                                                      }
                                                                                                      id v721 = v731;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v721 = 0;
                                                                                                    }
                                                                                                    v730 = [v6 objectForKeyedSubscript:@"summarizationGranularity"];
                                                                                                    if (v730 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v720 = v730;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v519 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v520 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v1002 = *MEMORY[0x1E4F28568];
                                                                                                            id v719 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"summarizationGranularity"];
                                                                                                            id v1003 = v719;
                                                                                                            v724 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1003 forKeys:&v1002 count:1];
                                                                                                            id v720 = 0;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v519, "initWithDomain:code:userInfo:", v520, 2);
                                                                                                            goto LABEL_1048;
                                                                                                          }
                                                                                                          id v720 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1049;
                                                                                                        }
                                                                                                        id v481 = v730;
                                                                                                        id v720 = [NSNumber numberWithInt:BMMomentsEventDataEventBundleSummarizationGranularityFromString(v481)];
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v720 = 0;
                                                                                                    }
                                                                                                    v724 = [v6 objectForKeyedSubscript:@"includedInSummaryBundleOnly"];
                                                                                                    if (v724 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          id v503 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v504 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v1000 = *MEMORY[0x1E4F28568];
                                                                                                          id v751 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"includedInSummaryBundleOnly"];
                                                                                                          id v1001 = v751;
                                                                                                          v746 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1001 forKeys:&v1000 count:1];
                                                                                                          id v719 = 0;
                                                                                                          v877 = 0;
                                                                                                          id *v862 = (id)objc_msgSend(v503, "initWithDomain:code:userInfo:", v504, 2);

                                                                                                          goto LABEL_1047;
                                                                                                        }
                                                                                                        id v719 = 0;
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1048;
                                                                                                      }
                                                                                                      id v719 = v724;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v719 = 0;
                                                                                                    }
                                                                                                    v482 = [v6 objectForKeyedSubscript:@"subBundleIDs"];
                                                                                                    v483 = [MEMORY[0x1E4F1CA98] null];
                                                                                                    id v751 = v482;
                                                                                                    LODWORD(v482) = [v482 isEqual:v483];

                                                                                                    if (v482)
                                                                                                    {

                                                                                                      goto LABEL_794;
                                                                                                    }
                                                                                                    if (v751)
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          id v484 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v485 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v998 = *MEMORY[0x1E4F28568];
                                                                                                          v745 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"subBundleIDs"];
                                                                                                          v999 = v745;
                                                                                                          id v727 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v999 forKeys:&v998 count:1];
                                                                                                          v877 = 0;
                                                                                                          id *v862 = (id)objc_msgSend(v484, "initWithDomain:code:userInfo:", v485, 2);

                                                                                                          goto LABEL_1046;
                                                                                                        }
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1047;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
LABEL_794:
                                                                                                      id v751 = 0;
                                                                                                    }
                                                                                                    v745 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v751, "count"));
                                                                                                    long long v919 = 0u;
                                                                                                    long long v920 = 0u;
                                                                                                    long long v921 = 0u;
                                                                                                    long long v922 = 0u;
                                                                                                    id v751 = v751;
                                                                                                    uint64_t v486 = [v751 countByEnumeratingWithState:&v919 objects:v997 count:16];
                                                                                                    if (!v486) {
                                                                                                      goto LABEL_804;
                                                                                                    }
                                                                                                    uint64_t v487 = v486;
                                                                                                    uint64_t v488 = *(void *)v920;
                                                                                                    while (1)
                                                                                                    {
                                                                                                      for (uint64_t m = 0;
                                                                                                            m != v487;
                                                                                                            ++m)
                                                                                                      {
                                                                                                        if (*(void *)v920 != v488) {
                                                                                                          objc_enumerationMutation(v751);
                                                                                                        }
                                                                                                        v490 = *(void **)(*((void *)&v919 + 1) + 8 * m);
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v494 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v495 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v995 = *MEMORY[0x1E4F28568];
                                                                                                            v723 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"subBundleIDs"];
                                                                                                            v996 = v723;
                                                                                                            uint64_t v496 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v996 forKeys:&v995 count:1];
                                                                                                            v497 = v494;
                                                                                                            uint64_t v498 = v495;
LABEL_812:
                                                                                                            v715 = (void *)v496;
                                                                                                            v877 = 0;
                                                                                                            id *v862 = (id)objc_msgSend(v497, "initWithDomain:code:userInfo:", v498, 2);
                                                                                                            id v728 = v751;

                                                                                                            goto LABEL_1044;
                                                                                                          }
LABEL_815:
                                                                                                          v877 = 0;

                                                                                                          goto LABEL_1046;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            id v499 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v500 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v993 = *MEMORY[0x1E4F28568];
                                                                                                            v723 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subBundleIDs"];
                                                                                                            v994 = v723;
                                                                                                            uint64_t v496 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v994 forKeys:&v993 count:1];
                                                                                                            v497 = v499;
                                                                                                            uint64_t v498 = v500;
                                                                                                            goto LABEL_812;
                                                                                                          }
                                                                                                          goto LABEL_815;
                                                                                                        }
                                                                                                        id v491 = v490;
                                                                                                        [v745 addObject:v491];
                                                                                                      }
                                                                                                      uint64_t v487 = [v751 countByEnumeratingWithState:&v919 objects:v997 count:16];
                                                                                                      if (!v487)
                                                                                                      {
LABEL_804:

                                                                                                        v492 = [v388 objectForKeyedSubscript:@"subSuggestionIDs"];
                                                                                                        v493 = [MEMORY[0x1E4F1CA98] null];
                                                                                                        id v728 = v492;
                                                                                                        LODWORD(v492) = [v492 isEqual:v493];

                                                                                                        if (v492)
                                                                                                        {

                                                                                                          goto LABEL_827;
                                                                                                        }
                                                                                                        if (v728)
                                                                                                        {
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              id v507 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                              uint64_t v508 = *MEMORY[0x1E4F502C8];
                                                                                                              uint64_t v991 = *MEMORY[0x1E4F28568];
                                                                                                              v723 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"subSuggestionIDs"];
                                                                                                              v992 = v723;
                                                                                                              v716 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v992 forKeys:&v991 count:1];
                                                                                                              v877 = 0;
                                                                                                              id *v862 = (id)objc_msgSend(v507, "initWithDomain:code:userInfo:", v508, 2);

                                                                                                              goto LABEL_1044;
                                                                                                            }
                                                                                                            v877 = 0;
                                                                                                            goto LABEL_1045;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
LABEL_827:
                                                                                                          id v728 = 0;
                                                                                                        }
                                                                                                        v723 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v728, "count"));
                                                                                                        long long v915 = 0u;
                                                                                                        long long v916 = 0u;
                                                                                                        long long v917 = 0u;
                                                                                                        long long v918 = 0u;
                                                                                                        id v728 = v728;
                                                                                                        uint64_t v509 = [v728 countByEnumeratingWithState:&v915 objects:v990 count:16];
                                                                                                        if (v509)
                                                                                                        {
                                                                                                          uint64_t v510 = v509;
                                                                                                          uint64_t v511 = *(void *)v916;
                                                                                                          do
                                                                                                          {
                                                                                                            for (uint64_t n = 0;
                                                                                                                  n != v510;
                                                                                                                  ++n)
                                                                                                            {
                                                                                                              if (*(void *)v916 != v511) {
                                                                                                                objc_enumerationMutation(v728);
                                                                                                              }
                                                                                                              v513 = *(void **)(*((void *)&v915 + 1) + 8 * n);
                                                                                                              objc_opt_class();
                                                                                                              if (objc_opt_isKindOfClass())
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  id v521 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v522 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v988 = *MEMORY[0x1E4F28568];
                                                                                                                  v708 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"subSuggestionIDs"];
                                                                                                                  v989 = v708;
                                                                                                                  uint64_t v523 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v989 forKeys:&v988 count:1];
                                                                                                                  v524 = v521;
                                                                                                                  uint64_t v525 = v522;
LABEL_860:
                                                                                                                  id v713 = (id)v523;
                                                                                                                  v877 = 0;
                                                                                                                  id *v862 = (id)objc_msgSend(v524, "initWithDomain:code:userInfo:", v525, 2);
                                                                                                                  id v717 = v728;

                                                                                                                  goto LABEL_1042;
                                                                                                                }
LABEL_865:
                                                                                                                v877 = 0;

                                                                                                                goto LABEL_1044;
                                                                                                              }
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  id v526 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v527 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v986 = *MEMORY[0x1E4F28568];
                                                                                                                  v708 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subSuggestionIDs"];
                                                                                                                  v987 = v708;
                                                                                                                  uint64_t v523 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v987 forKeys:&v986 count:1];
                                                                                                                  v524 = v526;
                                                                                                                  uint64_t v525 = v527;
                                                                                                                  goto LABEL_860;
                                                                                                                }
                                                                                                                goto LABEL_865;
                                                                                                              }
                                                                                                              id v514 = v513;
                                                                                                              [v723 addObject:v514];
                                                                                                            }
                                                                                                            uint64_t v510 = [v728 countByEnumeratingWithState:&v915 objects:v990 count:16];
                                                                                                          }
                                                                                                          while (v510);
                                                                                                        }

                                                                                                        v708 = [v388 objectForKeyedSubscript:@"firstCreationDate"];
                                                                                                        if (!v708 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          id v717 = 0;
                                                                                                          goto LABEL_876;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v528 = v708;
                                                                                                          id v529 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                                                                                          [v528 doubleValue];
                                                                                                          id v717 = (id)objc_msgSend(v529, "initWithTimeIntervalSince1970:");
                                                                                                          goto LABEL_875;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v528 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                                                                                          id v530 = v708;
                                                                                                          id v717 = [v528 dateFromString:v530];

LABEL_875:
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              id v572 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                              uint64_t v573 = *MEMORY[0x1E4F502C8];
                                                                                                              uint64_t v984 = *MEMORY[0x1E4F28568];
                                                                                                              id v714 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"firstCreationDate"];
                                                                                                              id v985 = v714;
                                                                                                              v712 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v985 forKeys:&v984 count:1];
                                                                                                              id v717 = 0;
                                                                                                              v877 = 0;
                                                                                                              id *v862 = (id)objc_msgSend(v572, "initWithDomain:code:userInfo:", v573, 2);

                                                                                                              goto LABEL_1041;
                                                                                                            }
                                                                                                            id v717 = 0;
                                                                                                            v877 = 0;
                                                                                                            goto LABEL_1042;
                                                                                                          }
                                                                                                          id v717 = v708;
                                                                                                        }
LABEL_876:
                                                                                                        v531 = [v388 objectForKeyedSubscript:@"resources"];
                                                                                                        v532 = [MEMORY[0x1E4F1CA98] null];
                                                                                                        id v714 = v531;
                                                                                                        LODWORD(v531) = [v531 isEqual:v532];

                                                                                                        if (v531)
                                                                                                        {

                                                                                                          goto LABEL_882;
                                                                                                        }
                                                                                                        if (v714)
                                                                                                        {
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              id v533 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                              uint64_t v534 = *MEMORY[0x1E4F502C8];
                                                                                                              uint64_t v982 = *MEMORY[0x1E4F28568];
                                                                                                              v711 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"resources"];
                                                                                                              v983 = v711;
                                                                                                              id v706 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v983 forKeys:&v982 count:1];
                                                                                                              v877 = 0;
                                                                                                              id *v862 = (id)objc_msgSend(v533, "initWithDomain:code:userInfo:", v534, 2);

                                                                                                              goto LABEL_1040;
                                                                                                            }
                                                                                                            v877 = 0;
                                                                                                            goto LABEL_1041;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
LABEL_882:
                                                                                                          id v714 = 0;
                                                                                                        }
                                                                                                        v711 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v714, "count"));
                                                                                                        long long v911 = 0u;
                                                                                                        long long v912 = 0u;
                                                                                                        long long v913 = 0u;
                                                                                                        long long v914 = 0u;
                                                                                                        id v714 = v714;
                                                                                                        uint64_t v535 = [v714 countByEnumeratingWithState:&v911 objects:v981 count:16];
                                                                                                        if (!v535) {
                                                                                                          goto LABEL_893;
                                                                                                        }
                                                                                                        uint64_t v536 = v535;
                                                                                                        uint64_t v537 = *(void *)v912;
                                                                                                        while (1)
                                                                                                        {
                                                                                                          for (iuint64_t i = 0;
                                                                                                                ii != v536;
                                                                                                                ++ii)
                                                                                                          {
                                                                                                            if (*(void *)v912 != v537) {
                                                                                                              objc_enumerationMutation(v714);
                                                                                                            }
                                                                                                            v539 = *(void **)(*((void *)&v911 + 1) + 8 * ii);
                                                                                                            objc_opt_class();
                                                                                                            if (objc_opt_isKindOfClass())
                                                                                                            {
                                                                                                              if (v862)
                                                                                                              {
                                                                                                                id v545 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                uint64_t v546 = *MEMORY[0x1E4F502C8];
                                                                                                                uint64_t v979 = *MEMORY[0x1E4F28568];
                                                                                                                v718 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"resources"];
                                                                                                                v980 = v718;
                                                                                                                uint64_t v547 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v980 forKeys:&v979 count:1];
                                                                                                                v548 = v545;
                                                                                                                uint64_t v549 = v546;
                                                                                                                goto LABEL_899;
                                                                                                              }
LABEL_924:
                                                                                                              v877 = 0;

                                                                                                              goto LABEL_1040;
                                                                                                            }
                                                                                                            objc_opt_class();
                                                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                            {
                                                                                                              if (!v862) {
                                                                                                                goto LABEL_924;
                                                                                                              }
                                                                                                              id v550 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                              uint64_t v551 = *MEMORY[0x1E4F502C8];
                                                                                                              uint64_t v977 = *MEMORY[0x1E4F28568];
                                                                                                              v718 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"resources"];
                                                                                                              v978 = v718;
                                                                                                              uint64_t v547 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v978 forKeys:&v977 count:1];
                                                                                                              v548 = v550;
                                                                                                              uint64_t v549 = v551;
LABEL_899:
                                                                                                              id v709 = (id)v547;
                                                                                                              v877 = 0;
                                                                                                              id *v862 = (id)objc_msgSend(v548, "initWithDomain:code:userInfo:", v549, 2);
LABEL_903:
                                                                                                              id v707 = v714;
                                                                                                              goto LABEL_1037;
                                                                                                            }
                                                                                                            id v540 = v539;
                                                                                                            v541 = [BMMomentsEventDataEventBundleResource alloc];
                                                                                                            id v910 = 0;
                                                                                                            v718 = v540;
                                                                                                            v542 = [(BMMomentsEventDataEventBundleResource *)v541 initWithJSONDictionary:v540 error:&v910];
                                                                                                            id v709 = v910;
                                                                                                            if (v709)
                                                                                                            {
                                                                                                              if (v862) {
                                                                                                                id *v862 = v709;
                                                                                                              }

                                                                                                              v877 = 0;
                                                                                                              goto LABEL_903;
                                                                                                            }
                                                                                                            [v711 addObject:v542];
                                                                                                          }
                                                                                                          uint64_t v536 = [v714 countByEnumeratingWithState:&v911 objects:v981 count:16];
                                                                                                          if (!v536)
                                                                                                          {
LABEL_893:

                                                                                                            v543 = [v388 objectForKeyedSubscript:@"persons"];
                                                                                                            v544 = [MEMORY[0x1E4F1CA98] null];
                                                                                                            id v707 = v543;
                                                                                                            LODWORD(v543) = [v543 isEqual:v544];

                                                                                                            if (v543)
                                                                                                            {

                                                                                                              goto LABEL_908;
                                                                                                            }
                                                                                                            if (v707)
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  id v552 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v553 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v975 = *MEMORY[0x1E4F28568];
                                                                                                                  v718 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"persons"];
                                                                                                                  v976 = v718;
                                                                                                                  id v710 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v976 forKeys:&v975 count:1];
                                                                                                                  v877 = 0;
                                                                                                                  id *v862 = (id)objc_msgSend(v552, "initWithDomain:code:userInfo:", v553, 2);

                                                                                                                  goto LABEL_1038;
                                                                                                                }
                                                                                                                v877 = 0;
                                                                                                                goto LABEL_1039;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
LABEL_908:
                                                                                                              id v707 = 0;
                                                                                                            }
                                                                                                            v718 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v707, "count"));
                                                                                                            long long v906 = 0u;
                                                                                                            long long v907 = 0u;
                                                                                                            long long v908 = 0u;
                                                                                                            long long v909 = 0u;
                                                                                                            id v707 = v707;
                                                                                                            uint64_t v554 = [v707 countByEnumeratingWithState:&v906 objects:v974 count:16];
                                                                                                            if (v554)
                                                                                                            {
                                                                                                              uint64_t v555 = v554;
                                                                                                              uint64_t v556 = *(void *)v907;
                                                                                                              do
                                                                                                              {
                                                                                                                for (juint64_t j = 0;
                                                                                                                      jj != v555;
                                                                                                                      ++jj)
                                                                                                                {
                                                                                                                  if (*(void *)v907 != v556) {
                                                                                                                    objc_enumerationMutation(v707);
                                                                                                                  }
                                                                                                                  v558 = *(void **)(*((void *)&v906 + 1) + 8 * jj);
                                                                                                                  objc_opt_class();
                                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                                  {
                                                                                                                    if (v862)
                                                                                                                    {
                                                                                                                      id v564 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                      uint64_t v565 = *MEMORY[0x1E4F502C8];
                                                                                                                      uint64_t v972 = *MEMORY[0x1E4F28568];
                                                                                                                      v705 = (BMMomentsEventDataEventBundlePlace *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"persons"];
                                                                                                                      v973 = v705;
                                                                                                                      uint64_t v566 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v973 forKeys:&v972 count:1];
                                                                                                                      v567 = v564;
                                                                                                                      uint64_t v568 = v565;
                                                                                                                      goto LABEL_932;
                                                                                                                    }
LABEL_938:
                                                                                                                    v877 = 0;

                                                                                                                    goto LABEL_1038;
                                                                                                                  }
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                  {
                                                                                                                    if (!v862) {
                                                                                                                      goto LABEL_938;
                                                                                                                    }
                                                                                                                    id v569 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                    uint64_t v570 = *MEMORY[0x1E4F502C8];
                                                                                                                    uint64_t v970 = *MEMORY[0x1E4F28568];
                                                                                                                    v705 = (BMMomentsEventDataEventBundlePlace *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"persons"];
                                                                                                                    v971 = v705;
                                                                                                                    uint64_t v566 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v971 forKeys:&v970 count:1];
                                                                                                                    v567 = v569;
                                                                                                                    uint64_t v568 = v570;
LABEL_932:
                                                                                                                    id v704 = (id)v566;
                                                                                                                    v877 = 0;
                                                                                                                    id *v862 = (id)objc_msgSend(v567, "initWithDomain:code:userInfo:", v568, 2);
LABEL_936:
                                                                                                                    id v571 = v707;
LABEL_937:
                                                                                                                    id v709 = v571;
                                                                                                                    goto LABEL_1036;
                                                                                                                  }
                                                                                                                  v559 = v558;
                                                                                                                  v560 = [BMMomentsEventDataEventBundlePerson alloc];
                                                                                                                  id v905 = 0;
                                                                                                                  v705 = v559;
                                                                                                                  v561 = [(BMMomentsEventDataEventBundlePerson *)v560 initWithJSONDictionary:v559 error:&v905];
                                                                                                                  id v704 = v905;
                                                                                                                  if (v704)
                                                                                                                  {
                                                                                                                    if (v862) {
                                                                                                                      id *v862 = v704;
                                                                                                                    }

                                                                                                                    v877 = 0;
                                                                                                                    goto LABEL_936;
                                                                                                                  }
                                                                                                                  [v718 addObject:v561];
                                                                                                                }
                                                                                                                uint64_t v555 = [v707 countByEnumeratingWithState:&v906 objects:v974 count:16];
                                                                                                              }
                                                                                                              while (v555);
                                                                                                            }

                                                                                                            id v709 = [v388 objectForKeyedSubscript:@"mainPlace"];
                                                                                                            if (v709 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  id v590 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v591 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v968 = *MEMORY[0x1E4F28568];
                                                                                                                  v705 = (BMMomentsEventDataEventBundlePlace *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"mainPlace"];
                                                                                                                  v969 = v705;
                                                                                                                  id v704 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v969 forKeys:&v968 count:1];
                                                                                                                  v877 = 0;
                                                                                                                  id *v862 = (id)objc_msgSend(v590, "initWithDomain:code:userInfo:", v591, 2);
                                                                                                                  goto LABEL_1036;
                                                                                                                }
                                                                                                                v877 = 0;
                                                                                                                goto LABEL_1037;
                                                                                                              }
                                                                                                              id v586 = v709;
                                                                                                              v587 = [BMMomentsEventDataEventBundlePlace alloc];
                                                                                                              id v904 = 0;
                                                                                                              id v704 = v586;
                                                                                                              v705 = [(BMMomentsEventDataEventBundlePlace *)v587 initWithJSONDictionary:v586 error:&v904];
                                                                                                              id v588 = v904;
                                                                                                              if (v588)
                                                                                                              {
                                                                                                                v589 = v588;
                                                                                                                if (v862) {
                                                                                                                  id *v862 = v588;
                                                                                                                }

                                                                                                                v877 = 0;
                                                                                                                id v571 = v704;
                                                                                                                goto LABEL_937;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v705 = 0;
                                                                                                            }
                                                                                                            v562 = [v388 objectForKeyedSubscript:@"otherPlaces"];
                                                                                                            v563 = [MEMORY[0x1E4F1CA98] null];
                                                                                                            id v704 = v562;
                                                                                                            LODWORD(v562) = [v562 isEqual:v563];

                                                                                                            if (v562)
                                                                                                            {

                                                                                                              goto LABEL_945;
                                                                                                            }
                                                                                                            if (v704)
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  id v574 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v575 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v966 = *MEMORY[0x1E4F28568];
                                                                                                                  v702 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"otherPlaces"];
                                                                                                                  v967 = v702;
                                                                                                                  id v699 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v967 forKeys:&v966 count:1];
                                                                                                                  v877 = 0;
                                                                                                                  id *v862 = (id)objc_msgSend(v574, "initWithDomain:code:userInfo:", v575, 2);

                                                                                                                  goto LABEL_1035;
                                                                                                                }
                                                                                                                v877 = 0;
                                                                                                                goto LABEL_1036;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
LABEL_945:
                                                                                                              id v704 = 0;
                                                                                                            }
                                                                                                            v702 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v704, "count"));
                                                                                                            long long v900 = 0u;
                                                                                                            long long v901 = 0u;
                                                                                                            long long v902 = 0u;
                                                                                                            long long v903 = 0u;
                                                                                                            id v704 = v704;
                                                                                                            uint64_t v576 = [v704 countByEnumeratingWithState:&v900 objects:v965 count:16];
                                                                                                            if (!v576) {
                                                                                                              goto LABEL_956;
                                                                                                            }
                                                                                                            uint64_t v577 = v576;
                                                                                                            uint64_t v578 = *(void *)v901;
                                                                                                            while (1)
                                                                                                            {
                                                                                                              for (kuint64_t k = 0;
                                                                                                                    kk != v577;
                                                                                                                    ++kk)
                                                                                                              {
                                                                                                                if (*(void *)v901 != v578) {
                                                                                                                  objc_enumerationMutation(v704);
                                                                                                                }
                                                                                                                v580 = *(void **)(*((void *)&v900 + 1) + 8 * kk);
                                                                                                                objc_opt_class();
                                                                                                                if (objc_opt_isKindOfClass())
                                                                                                                {
                                                                                                                  if (v862)
                                                                                                                  {
                                                                                                                    id v592 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                    uint64_t v593 = *MEMORY[0x1E4F502C8];
                                                                                                                    uint64_t v963 = *MEMORY[0x1E4F28568];
                                                                                                                    v703 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"otherPlaces"];
                                                                                                                    v964 = v703;
                                                                                                                    uint64_t v594 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v964 forKeys:&v963 count:1];
                                                                                                                    v595 = v592;
                                                                                                                    uint64_t v596 = v593;
                                                                                                                    goto LABEL_971;
                                                                                                                  }
LABEL_1023:
                                                                                                                  v877 = 0;

                                                                                                                  goto LABEL_1035;
                                                                                                                }
                                                                                                                objc_opt_class();
                                                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                {
                                                                                                                  if (!v862) {
                                                                                                                    goto LABEL_1023;
                                                                                                                  }
                                                                                                                  id v597 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v598 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v961 = *MEMORY[0x1E4F28568];
                                                                                                                  v703 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"otherPlaces"];
                                                                                                                  v962 = v703;
                                                                                                                  uint64_t v594 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v962 forKeys:&v961 count:1];
                                                                                                                  v595 = v597;
                                                                                                                  uint64_t v596 = v598;
LABEL_971:
                                                                                                                  id v701 = (id)v594;
                                                                                                                  v877 = 0;
                                                                                                                  id *v862 = (id)objc_msgSend(v595, "initWithDomain:code:userInfo:", v596, 2);
LABEL_975:
                                                                                                                  id v700 = v704;
                                                                                                                  goto LABEL_1033;
                                                                                                                }
                                                                                                                id v581 = v580;
                                                                                                                v582 = [BMMomentsEventDataEventBundlePlace alloc];
                                                                                                                id v899 = 0;
                                                                                                                v703 = v581;
                                                                                                                v583 = [(BMMomentsEventDataEventBundlePlace *)v582 initWithJSONDictionary:v581 error:&v899];
                                                                                                                id v701 = v899;
                                                                                                                if (v701)
                                                                                                                {
                                                                                                                  if (v862) {
                                                                                                                    id *v862 = v701;
                                                                                                                  }

                                                                                                                  v877 = 0;
                                                                                                                  goto LABEL_975;
                                                                                                                }
                                                                                                                [v702 addObject:v583];
                                                                                                              }
                                                                                                              uint64_t v577 = [v704 countByEnumeratingWithState:&v900 objects:v965 count:16];
                                                                                                              if (!v577)
                                                                                                              {
LABEL_956:

                                                                                                                v584 = [v388 objectForKeyedSubscript:@"photoTraits"];
                                                                                                                v585 = [MEMORY[0x1E4F1CA98] null];
                                                                                                                id v700 = v584;
                                                                                                                LODWORD(v584) = [v584 isEqual:v585];

                                                                                                                if (v584)
                                                                                                                {

                                                                                                                  goto LABEL_980;
                                                                                                                }
                                                                                                                if (v700)
                                                                                                                {
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                  {
                                                                                                                    if (v862)
                                                                                                                    {
                                                                                                                      id v599 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                      uint64_t v600 = *MEMORY[0x1E4F502C8];
                                                                                                                      uint64_t v959 = *MEMORY[0x1E4F28568];
                                                                                                                      v703 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"photoTraits"];
                                                                                                                      v960 = v703;
                                                                                                                      id v701 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v960 forKeys:&v959 count:1];
                                                                                                                      v877 = 0;
                                                                                                                      id *v862 = (id)objc_msgSend(v599, "initWithDomain:code:userInfo:", v600, 2);
                                                                                                                      goto LABEL_1033;
                                                                                                                    }
                                                                                                                    v877 = 0;
                                                                                                                    goto LABEL_1034;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
LABEL_980:
                                                                                                                  id v700 = 0;
                                                                                                                }
                                                                                                                v703 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v700, "count"));
                                                                                                                long long v895 = 0u;
                                                                                                                long long v896 = 0u;
                                                                                                                long long v897 = 0u;
                                                                                                                long long v898 = 0u;
                                                                                                                id v700 = v700;
                                                                                                                uint64_t v601 = [v700 countByEnumeratingWithState:&v895 objects:v958 count:16];
                                                                                                                if (!v601) {
                                                                                                                  goto LABEL_990;
                                                                                                                }
                                                                                                                uint64_t v602 = v601;
                                                                                                                uint64_t v603 = *(void *)v896;
LABEL_983:
                                                                                                                uint64_t v604 = 0;
                                                                                                                while (1)
                                                                                                                {
                                                                                                                  if (*(void *)v896 != v603) {
                                                                                                                    objc_enumerationMutation(v700);
                                                                                                                  }
                                                                                                                  v605 = *(void **)(*((void *)&v895 + 1) + 8 * v604);
                                                                                                                  objc_opt_class();
                                                                                                                  if (objc_opt_isKindOfClass()) {
                                                                                                                    break;
                                                                                                                  }
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                  {
                                                                                                                    if (v862)
                                                                                                                    {
                                                                                                                      id v618 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                      uint64_t v619 = *MEMORY[0x1E4F502C8];
                                                                                                                      uint64_t v954 = *MEMORY[0x1E4F28568];
                                                                                                                      v698 = (BMMomentsEventDataEventBundleClusterMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"photoTraits"];
                                                                                                                      v955 = v698;
                                                                                                                      uint64_t v615 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v955 forKeys:&v954 count:1];
                                                                                                                      v616 = v618;
                                                                                                                      uint64_t v617 = v619;
                                                                                                                      goto LABEL_1028;
                                                                                                                    }
                                                                                                                    goto LABEL_1032;
                                                                                                                  }
                                                                                                                  id v606 = v605;
                                                                                                                  [v703 addObject:v606];

                                                                                                                  if (v602 == ++v604)
                                                                                                                  {
                                                                                                                    uint64_t v602 = [v700 countByEnumeratingWithState:&v895 objects:v958 count:16];
                                                                                                                    if (v602) {
                                                                                                                      goto LABEL_983;
                                                                                                                    }
LABEL_990:

                                                                                                                    id v701 = [v388 objectForKeyedSubscript:@"clusterMetadata"];
                                                                                                                    if (v701 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                    {
                                                                                                                      objc_opt_class();
                                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                                      {
                                                                                                                        id v621 = v701;
                                                                                                                        v622 = [BMMomentsEventDataEventBundleClusterMetadata alloc];
                                                                                                                        id v894 = 0;
                                                                                                                        v607 = v621;
                                                                                                                        v698 = [(BMMomentsEventDataEventBundleClusterMetadata *)v622 initWithJSONDictionary:v621 error:&v894];
                                                                                                                        id v623 = v894;
                                                                                                                        if (!v623)
                                                                                                                        {

                                                                                                                          goto LABEL_993;
                                                                                                                        }
                                                                                                                        v624 = v623;
                                                                                                                        if (v862) {
                                                                                                                          id *v862 = v623;
                                                                                                                        }

                                                                                                                        v877 = 0;
                                                                                                                        id v701 = v607;
                                                                                                                        goto LABEL_1029;
                                                                                                                      }
                                                                                                                      if (v862)
                                                                                                                      {
                                                                                                                        id v629 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                        uint64_t v630 = *MEMORY[0x1E4F502C8];
                                                                                                                        uint64_t v952 = *MEMORY[0x1E4F28568];
                                                                                                                        v698 = (BMMomentsEventDataEventBundleClusterMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"clusterMetadata"];
                                                                                                                        v953 = v698;
                                                                                                                        v607 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v953 forKeys:&v952 count:1];
                                                                                                                        v877 = 0;
                                                                                                                        id *v862 = (id)objc_msgSend(v629, "initWithDomain:code:userInfo:", v630, 2);
                                                                                                                        goto LABEL_1029;
                                                                                                                      }
                                                                                                                      v877 = 0;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v698 = 0;
LABEL_993:
                                                                                                                      v607 = [v388 objectForKeyedSubscript:@"outlierMetadata"];
                                                                                                                      if (v607 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                      {
                                                                                                                        objc_opt_class();
                                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                                        {
                                                                                                                          id v625 = v607;
                                                                                                                          v626 = [BMMomentsEventDataEventBundleOutlierMetadata alloc];
                                                                                                                          id v893 = 0;
                                                                                                                          id v696 = v625;
                                                                                                                          v694 = [(BMMomentsEventDataEventBundleOutlierMetadata *)v626 initWithJSONDictionary:v625 error:&v893];
                                                                                                                          id v627 = v893;
                                                                                                                          if (!v627)
                                                                                                                          {

                                                                                                                            goto LABEL_996;
                                                                                                                          }
                                                                                                                          v628 = v627;
                                                                                                                          if (v862) {
                                                                                                                            id *v862 = v627;
                                                                                                                          }

                                                                                                                          v877 = 0;
                                                                                                                          goto LABEL_1022;
                                                                                                                        }
                                                                                                                        if (v862)
                                                                                                                        {
                                                                                                                          id v631 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                          uint64_t v632 = *MEMORY[0x1E4F502C8];
                                                                                                                          uint64_t v950 = *MEMORY[0x1E4F28568];
                                                                                                                          v694 = (BMMomentsEventDataEventBundleOutlierMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"outlierMetadata"];
                                                                                                                          v951 = v694;
                                                                                                                          id v696 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v951 forKeys:&v950 count:1];
                                                                                                                          v877 = 0;
                                                                                                                          id *v862 = (id)objc_msgSend(v631, "initWithDomain:code:userInfo:", v632, 2);
                                                                                                                          goto LABEL_1022;
                                                                                                                        }
                                                                                                                        v877 = 0;
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v694 = 0;
LABEL_996:
                                                                                                                        v697 = [v388 objectForKeyedSubscript:@"bundleGoodnessScore"];
                                                                                                                        if (v697 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                        {
                                                                                                                          objc_opt_class();
                                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                                          {
                                                                                                                            id v696 = v697;
                                                                                                                            goto LABEL_999;
                                                                                                                          }
                                                                                                                          if (v862)
                                                                                                                          {
                                                                                                                            id v633 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                            uint64_t v634 = *MEMORY[0x1E4F502C8];
                                                                                                                            uint64_t v948 = *MEMORY[0x1E4F28568];
                                                                                                                            id v692 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleGoodnessScore"];
                                                                                                                            id v949 = v692;
                                                                                                                            v695 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v949 forKeys:&v948 count:1];
                                                                                                                            v877 = 0;
                                                                                                                            id v696 = 0;
                                                                                                                            id *v862 = (id)objc_msgSend(v633, "initWithDomain:code:userInfo:", v634, 2);
                                                                                                                            goto LABEL_1020;
                                                                                                                          }
                                                                                                                          v877 = 0;
                                                                                                                          id v696 = 0;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          id v696 = 0;
LABEL_999:
                                                                                                                          v695 = [v388 objectForKeyedSubscript:@"distinctnessScore"];
                                                                                                                          if (v695 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                          {
                                                                                                                            objc_opt_class();
                                                                                                                            if (objc_opt_isKindOfClass())
                                                                                                                            {
                                                                                                                              id v692 = v695;
                                                                                                                              goto LABEL_1002;
                                                                                                                            }
                                                                                                                            if (v862)
                                                                                                                            {
                                                                                                                              id v639 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                              uint64_t v640 = *MEMORY[0x1E4F502C8];
                                                                                                                              uint64_t v946 = *MEMORY[0x1E4F28568];
                                                                                                                              id v690 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"distinctnessScore"];
                                                                                                                              id v947 = v690;
                                                                                                                              v693 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v947 forKeys:&v946 count:1];
                                                                                                                              v877 = 0;
                                                                                                                              id v692 = 0;
                                                                                                                              id *v862 = (id)objc_msgSend(v639, "initWithDomain:code:userInfo:", v640, 2);
                                                                                                                              goto LABEL_1019;
                                                                                                                            }
                                                                                                                            id v692 = 0;
                                                                                                                            v877 = 0;
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            id v692 = 0;
LABEL_1002:
                                                                                                                            v693 = [v388 objectForKeyedSubscript:@"richnessScore"];
                                                                                                                            if (v693 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                            {
                                                                                                                              objc_opt_class();
                                                                                                                              if (objc_opt_isKindOfClass())
                                                                                                                              {
                                                                                                                                id v690 = v693;
                                                                                                                                goto LABEL_1005;
                                                                                                                              }
                                                                                                                              if (v862)
                                                                                                                              {
                                                                                                                                id v641 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                                uint64_t v642 = *MEMORY[0x1E4F502C8];
                                                                                                                                uint64_t v944 = *MEMORY[0x1E4F28568];
                                                                                                                                id v688 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"richnessScore"];
                                                                                                                                id v945 = v688;
                                                                                                                                v691 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v945 forKeys:&v944 count:1];
                                                                                                                                v877 = 0;
                                                                                                                                id v690 = 0;
                                                                                                                                id *v862 = (id)objc_msgSend(v641, "initWithDomain:code:userInfo:", v642, 2);
                                                                                                                                goto LABEL_1018;
                                                                                                                              }
                                                                                                                              id v690 = 0;
                                                                                                                              v877 = 0;
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              id v690 = 0;
LABEL_1005:
                                                                                                                              v691 = [v388 objectForKeyedSubscript:@"engagementScore"];
                                                                                                                              if (v691 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                              {
                                                                                                                                objc_opt_class();
                                                                                                                                if (objc_opt_isKindOfClass())
                                                                                                                                {
                                                                                                                                  id v688 = v691;
                                                                                                                                  goto LABEL_1008;
                                                                                                                                }
                                                                                                                                if (v862)
                                                                                                                                {
                                                                                                                                  id v643 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                                  uint64_t v644 = *MEMORY[0x1E4F502C8];
                                                                                                                                  uint64_t v942 = *MEMORY[0x1E4F28568];
                                                                                                                                  id v686 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"engagementScore"];
                                                                                                                                  id v943 = v686;
                                                                                                                                  v689 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v943 forKeys:&v942 count:1];
                                                                                                                                  v877 = 0;
                                                                                                                                  id v688 = 0;
                                                                                                                                  id *v862 = (id)objc_msgSend(v643, "initWithDomain:code:userInfo:", v644, 2);
                                                                                                                                  goto LABEL_1017;
                                                                                                                                }
                                                                                                                                id v688 = 0;
                                                                                                                                v877 = 0;
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                id v688 = 0;
LABEL_1008:
                                                                                                                                v689 = [v388 objectForKeyedSubscript:@"heuristicsScore"];
                                                                                                                                if (v689 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                                {
                                                                                                                                  objc_opt_class();
                                                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                                                  {
                                                                                                                                    id v686 = v689;
                                                                                                                                    goto LABEL_1011;
                                                                                                                                  }
                                                                                                                                  if (v862)
                                                                                                                                  {
                                                                                                                                    id v645 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                                    uint64_t v646 = *MEMORY[0x1E4F502C8];
                                                                                                                                    uint64_t v940 = *MEMORY[0x1E4F28568];
                                                                                                                                    v687 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"heuristicsScore"];
                                                                                                                                    v941 = v687;
                                                                                                                                    v608 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v941 forKeys:&v940 count:1];
                                                                                                                                    v877 = 0;
                                                                                                                                    id v686 = 0;
                                                                                                                                    id *v862 = (id)objc_msgSend(v645, "initWithDomain:code:userInfo:", v646, 2);
                                                                                                                                    goto LABEL_1015;
                                                                                                                                  }
                                                                                                                                  id v686 = 0;
                                                                                                                                  v877 = 0;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  id v686 = 0;
LABEL_1011:
                                                                                                                                  v687 = [v388 objectForKeyedSubscript:@"metadataForRank"];
                                                                                                                                  if (!v687 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                                                  {
                                                                                                                                    v608 = 0;
                                                                                                                                    goto LABEL_1014;
                                                                                                                                  }
                                                                                                                                  objc_opt_class();
                                                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                                                  {
                                                                                                                                    id v635 = v687;
                                                                                                                                    v636 = [BMMomentsEventDataEventBundleMetadataForRank alloc];
                                                                                                                                    id v892 = 0;
                                                                                                                                    v608 = [(BMMomentsEventDataEventBundleMetadataForRank *)v636 initWithJSONDictionary:v635 error:&v892];
                                                                                                                                    id v637 = v892;
                                                                                                                                    if (v637)
                                                                                                                                    {
                                                                                                                                      v638 = v637;
                                                                                                                                      if (v862) {
                                                                                                                                        id *v862 = v637;
                                                                                                                                      }

                                                                                                                                      v877 = 0;
                                                                                                                                      v687 = v635;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {

LABEL_1014:
                                                                                                                                      uint64_t v609 = [v847 intValue];
                                                                                                                                      unsigned int v878 = [v854 intValue];
                                                                                                                                      unsigned int v864 = [v852 intValue];
                                                                                                                                      int v685 = [v848 intValue];
                                                                                                                                      int v684 = [v842 intValue];
                                                                                                                                      int v683 = [v820 intValue];
                                                                                                                                      int v682 = [v811 intValue];
                                                                                                                                      int v681 = [v804 intValue];
                                                                                                                                      int v680 = [v790 intValue];
                                                                                                                                      unsigned int v679 = [v778 intValue];
                                                                                                                                      unsigned int v678 = [v776 intValue];
                                                                                                                                      unsigned int v677 = [v765 intValue];
                                                                                                                                      unsigned int v676 = [v755 intValue];
                                                                                                                                      unsigned int v675 = [v753 intValue];
                                                                                                                                      unsigned int v674 = [v750 intValue];
                                                                                                                                      unsigned int v673 = [v748 intValue];
                                                                                                                                      unsigned int v672 = [v744 intValue];
                                                                                                                                      unsigned int v671 = [v742 intValue];
                                                                                                                                      unsigned int v670 = [v740 intValue];
                                                                                                                                      unsigned int v669 = [v739 intValue];
                                                                                                                                      unsigned int v668 = [v736 intValue];
                                                                                                                                      unsigned int v667 = [v735 intValue];
                                                                                                                                      unsigned int v610 = [v733 intValue];
                                                                                                                                      unsigned int v611 = [v732 intValue];
                                                                                                                                      unsigned int v612 = [v729 intValue];
                                                                                                                                      [v725 intValue];
                                                                                                                                      [v722 intValue];
                                                                                                                                      [v720 intValue];
                                                                                                                                      LODWORD(v666) = v680;
                                                                                                                                      LODWORD(v665) = v681;
                                                                                                                                      LODWORD(v664) = v682;
                                                                                                                                      LODWORD(v663) = v683;
                                                                                                                                      LODWORD(v662) = v684;
                                                                                                                                      LODWORD(v661) = v685;
                                                                                                                                      v874 = -[BMMomentsEventDataEventBundle initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:](v874, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:", v888, v857, v879, v875, v873, v609, v870, v871, v868, v865, v860, v858, v856, __PAIR64__(v864, v878), v661, v884, v843, v845, v840, v662, v833, v830, v828, v826, v824, v822, v663, v819, v817, v664, v813, v810, v808, v806, v665, v802, v800, v798, v795, v794, v792, v666, v788, v786, v780, __PAIR64__(v678, v679), v775, v772, v771, v769, v767, v783, v400, __PAIR64__(v676, v677), __PAIR64__(v674, v675), __PAIR64__(v672, v673), __PAIR64__(v670, v671), __PAIR64__(v668, v669), __PAIR64__(v610, v667), __PAIR64__(v612, v611), v726);
                                                                                                                                      v877 = v874;
                                                                                                                                    }
LABEL_1015:
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    if (v862)
                                                                                                                                    {
                                                                                                                                      id v647 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                                      uint64_t v648 = *MEMORY[0x1E4F502C8];
                                                                                                                                      uint64_t v938 = *MEMORY[0x1E4F28568];
                                                                                                                                      v608 = (BMMomentsEventDataEventBundleMetadataForRank *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadataForRank"];
                                                                                                                                      v939 = v608;
                                                                                                                                      v649 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v939 forKeys:&v938 count:1];
                                                                                                                                      id *v862 = (id)[v647 initWithDomain:v648 code:2 userInfo:v649];

                                                                                                                                      v877 = 0;
                                                                                                                                      goto LABEL_1015;
                                                                                                                                    }
                                                                                                                                    v877 = 0;
                                                                                                                                  }
                                                                                                                                }
LABEL_1017:
                                                                                                                              }
LABEL_1018:
                                                                                                                            }
LABEL_1019:
                                                                                                                          }
LABEL_1020:
                                                                                                                        }
LABEL_1022:
                                                                                                                      }
LABEL_1029:
                                                                                                                    }
LABEL_1033:

LABEL_1034:
LABEL_1035:

LABEL_1036:
LABEL_1037:

LABEL_1038:
LABEL_1039:

LABEL_1040:
LABEL_1041:

LABEL_1042:
LABEL_1044:

LABEL_1045:
LABEL_1046:

LABEL_1047:
LABEL_1048:

LABEL_1049:
LABEL_1050:

LABEL_1051:
LABEL_1052:

LABEL_1053:
LABEL_1054:

LABEL_1055:
LABEL_1056:

LABEL_1057:
LABEL_1058:

LABEL_1059:
LABEL_1060:

LABEL_1061:
LABEL_1062:

LABEL_1063:
LABEL_1064:

LABEL_1065:
LABEL_1066:

LABEL_1067:
LABEL_1068:

                                                                                                                    goto LABEL_1069;
                                                                                                                  }
                                                                                                                }
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  id v613 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v614 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v956 = *MEMORY[0x1E4F28568];
                                                                                                                  v698 = (BMMomentsEventDataEventBundleClusterMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"photoTraits"];
                                                                                                                  v957 = v698;
                                                                                                                  uint64_t v615 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v957 forKeys:&v956 count:1];
                                                                                                                  v616 = v613;
                                                                                                                  uint64_t v617 = v614;
LABEL_1028:
                                                                                                                  v607 = (void *)v615;
                                                                                                                  v877 = 0;
                                                                                                                  id *v862 = (id)objc_msgSend(v616, "initWithDomain:code:userInfo:", v617, 2);
                                                                                                                  id v701 = v700;
                                                                                                                  goto LABEL_1029;
                                                                                                                }
LABEL_1032:
                                                                                                                v877 = 0;
                                                                                                                id v701 = v700;
                                                                                                                goto LABEL_1033;
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                  if (v862)
                                                                                                  {
                                                                                                    id v422 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                    uint64_t v423 = *MEMORY[0x1E4F502C8];
                                                                                                    uint64_t v1049 = *MEMORY[0x1E4F28568];
                                                                                                    id v781 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleSourceScreenTimeExists"];
                                                                                                    id v1050 = v781;
                                                                                                    v784 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1050 forKeys:&v1049 count:1];
                                                                                                    id v767 = 0;
                                                                                                    v877 = 0;
                                                                                                    id *v862 = (id)objc_msgSend(v422, "initWithDomain:code:userInfo:", v423, 2);
                                                                                                    uint64_t v59 = v879;
                                                                                                    uint64_t v60 = v875;
                                                                                                    v29 = v889;
                                                                                                    uint64_t v61 = v873;
                                                                                                    int v39 = v838;
                                                                                                    uint64_t v98 = v859;
                                                                                                    uint64_t v143 = obj;
                                                                                                    id v284 = v811;

                                                                                                    goto LABEL_1072;
                                                                                                  }
                                                                                                  id v767 = 0;
                                                                                                  v877 = 0;
LABEL_610:
                                                                                                  uint64_t v16 = v888;
                                                                                                  uint64_t v59 = v879;
                                                                                                  uint64_t v60 = v875;
                                                                                                  v29 = v889;
                                                                                                  uint64_t v61 = v873;
                                                                                                  int v39 = v838;
                                                                                                  uint64_t v98 = v859;
                                                                                                  uint64_t v143 = obj;
                                                                                                  id v284 = v811;
                                                                                                  goto LABEL_1073;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  id v769 = v770;
                                                                                                  goto LABEL_505;
                                                                                                }
                                                                                                if (v862)
                                                                                                {
                                                                                                  id v416 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                  uint64_t v417 = *MEMORY[0x1E4F502C8];
                                                                                                  uint64_t v1051 = *MEMORY[0x1E4F28568];
                                                                                                  id v767 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleSourceBooksExists"];
                                                                                                  id v1052 = v767;
                                                                                                  v768 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1052 forKeys:&v1051 count:1];
                                                                                                  id v769 = 0;
                                                                                                  v877 = 0;
                                                                                                  id *v862 = (id)objc_msgSend(v416, "initWithDomain:code:userInfo:", v417, 2);
                                                                                                  goto LABEL_610;
                                                                                                }
                                                                                                id v769 = 0;
                                                                                                v877 = 0;
                                                                                                uint64_t v16 = v888;
LABEL_605:
                                                                                                uint64_t v59 = v879;
                                                                                                uint64_t v60 = v875;
                                                                                                v29 = v889;
                                                                                                uint64_t v61 = v873;
                                                                                                int v39 = v838;
                                                                                                uint64_t v98 = v859;
                                                                                                uint64_t v143 = obj;
                                                                                                id v284 = v811;
                                                                                                goto LABEL_1074;
                                                                                              }
                                                                                              objc_opt_class();
                                                                                              if (objc_opt_isKindOfClass())
                                                                                              {
                                                                                                id v771 = v773;
                                                                                                goto LABEL_502;
                                                                                              }
                                                                                              if (v862)
                                                                                              {
                                                                                                id v410 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v411 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v1053 = *MEMORY[0x1E4F28568];
                                                                                                id v769 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleSourceMotionExists"];
                                                                                                id v1054 = v769;
                                                                                                v770 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1054 forKeys:&v1053 count:1];
                                                                                                id v771 = 0;
                                                                                                v877 = 0;
                                                                                                id *v862 = (id)objc_msgSend(v410, "initWithDomain:code:userInfo:", v411, 2);
                                                                                                uint64_t v16 = v888;
                                                                                                goto LABEL_605;
                                                                                              }
                                                                                              id v771 = 0;
                                                                                              v877 = 0;
                                                                                              uint64_t v16 = v888;
                                                                                              uint64_t v59 = v879;
                                                                                              uint64_t v60 = v875;
                                                                                              v29 = v889;
                                                                                              uint64_t v61 = v873;
                                                                                              int v39 = v838;
LABEL_597:
                                                                                              uint64_t v98 = v859;
                                                                                              uint64_t v143 = obj;
                                                                                              id v284 = v811;
                                                                                              goto LABEL_1075;
                                                                                            }
                                                                                            v389 = v39;
                                                                                            objc_opt_class();
                                                                                            if (objc_opt_isKindOfClass())
                                                                                            {
                                                                                              id v772 = v774;
                                                                                              goto LABEL_499;
                                                                                            }
                                                                                            id v401 = v888;
                                                                                            if (v862)
                                                                                            {
                                                                                              id v406 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                              uint64_t v407 = *MEMORY[0x1E4F502C8];
                                                                                              uint64_t v1055 = *MEMORY[0x1E4F28568];
                                                                                              id v771 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleSourcePDExists"];
                                                                                              id v1056 = v771;
                                                                                              v773 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1056 forKeys:&v1055 count:1];
                                                                                              id v772 = 0;
                                                                                              v877 = 0;
                                                                                              id *v862 = (id)objc_msgSend(v406, "initWithDomain:code:userInfo:", v407, 2);
                                                                                              uint64_t v16 = v888;
                                                                                              uint64_t v59 = v879;
                                                                                              uint64_t v60 = v875;
                                                                                              v29 = v889;
                                                                                              uint64_t v61 = v873;
                                                                                              int v39 = v389;
                                                                                              goto LABEL_597;
                                                                                            }
                                                                                            id v772 = 0;
                                                                                            v877 = 0;
LABEL_592:
                                                                                            uint64_t v16 = v401;
                                                                                            uint64_t v59 = v879;
                                                                                            uint64_t v60 = v875;
                                                                                            v29 = v889;
                                                                                            uint64_t v61 = v873;
                                                                                            int v39 = v389;
                                                                                            uint64_t v98 = v859;
                                                                                            uint64_t v143 = obj;
                                                                                            id v284 = v811;
                                                                                            goto LABEL_1076;
                                                                                          }
                                                                                          v389 = v39;
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            id v775 = v777;
                                                                                            goto LABEL_496;
                                                                                          }
                                                                                          id v401 = v888;
                                                                                          if (v862)
                                                                                          {
                                                                                            id v402 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v403 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v1057 = *MEMORY[0x1E4F28568];
                                                                                            id v772 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleSourcePostAnalyticsExists"];
                                                                                            id v1058 = v772;
                                                                                            v774 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1058 forKeys:&v1057 count:1];
                                                                                            id v775 = 0;
                                                                                            v877 = 0;
                                                                                            id *v862 = (id)objc_msgSend(v402, "initWithDomain:code:userInfo:", v403, 2);
                                                                                            goto LABEL_592;
                                                                                          }
                                                                                          id v775 = 0;
                                                                                          v877 = 0;
                                                                                          uint64_t v16 = v888;
                                                                                          uint64_t v59 = v879;
                                                                                          uint64_t v60 = v875;
                                                                                          v29 = v889;
                                                                                          uint64_t v61 = v873;
LABEL_586:
                                                                                          uint64_t v98 = v859;
                                                                                          uint64_t v143 = obj;
                                                                                          id v284 = v811;
                                                                                          goto LABEL_1077;
                                                                                        }
                                                                                        id v371 = v888;
                                                                                        objc_opt_class();
                                                                                        v383 = v779;
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v776 = v779;
LABEL_492:

                                                                                          id v6 = v849;
                                                                                          int v39 = v838;
                                                                                          goto LABEL_493;
                                                                                        }
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          v383 = v779;
                                                                                          id v384 = v779;
                                                                                          id v776 = [NSNumber numberWithInt:BMMomentsEventDataPhotoLibraryTypeFromString(v384)];

                                                                                          goto LABEL_492;
                                                                                        }
                                                                                        if (v862)
                                                                                        {
                                                                                          id v420 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                          uint64_t v421 = *MEMORY[0x1E4F502C8];
                                                                                          uint64_t v1059 = *MEMORY[0x1E4F28568];
                                                                                          id v775 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"photoLibraryType"];
                                                                                          id v1060 = v775;
                                                                                          v777 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1060 forKeys:&v1059 count:1];
                                                                                          id v776 = 0;
                                                                                          v877 = 0;
                                                                                          id *v862 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                                          uint64_t v16 = v888;
                                                                                          uint64_t v59 = v879;
                                                                                          uint64_t v60 = v875;
                                                                                          v29 = v889;
                                                                                          uint64_t v61 = v873;
                                                                                          int v39 = v838;
                                                                                          goto LABEL_586;
                                                                                        }
                                                                                        id v776 = 0;
                                                                                        v877 = 0;
LABEL_608:
                                                                                        uint64_t v16 = v371;
                                                                                        uint64_t v59 = v879;
                                                                                        uint64_t v60 = v875;
                                                                                        v29 = v889;
                                                                                        uint64_t v61 = v873;
                                                                                        int v39 = v838;
                                                                                        uint64_t v98 = v859;
                                                                                        uint64_t v143 = obj;
                                                                                        id v284 = v811;
                                                                                        goto LABEL_1078;
                                                                                      }
                                                                                      id v371 = v888;
                                                                                      objc_opt_class();
                                                                                      v372 = v785;
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        id v778 = v785;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                        {
                                                                                          if (!v862)
                                                                                          {
                                                                                            id v778 = 0;
                                                                                            v877 = 0;
                                                                                            uint64_t v16 = v888;
                                                                                            uint64_t v59 = v879;
                                                                                            uint64_t v60 = v875;
                                                                                            v29 = v889;
                                                                                            uint64_t v61 = v873;
                                                                                            int v39 = v838;
                                                                                            uint64_t v98 = v859;
                                                                                            uint64_t v143 = obj;
                                                                                            id v284 = v811;
                                                                                            goto LABEL_1079;
                                                                                          }
                                                                                          id v418 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                          uint64_t v419 = *MEMORY[0x1E4F502C8];
                                                                                          uint64_t v1061 = *MEMORY[0x1E4F28568];
                                                                                          id v776 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"photoSourceType"];
                                                                                          id v1062 = v776;
                                                                                          v779 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1062 forKeys:&v1061 count:1];
                                                                                          id v778 = 0;
                                                                                          v877 = 0;
                                                                                          id *v862 = (id)objc_msgSend(v418, "initWithDomain:code:userInfo:", v419, 2);
                                                                                          goto LABEL_608;
                                                                                        }
                                                                                        v372 = v785;
                                                                                        id v382 = v785;
                                                                                        id v778 = [NSNumber numberWithInt:BMMomentsEventDataPhotoSourceTypeFromString(v382)];
                                                                                      }
                                                                                      id v6 = v849;
                                                                                      int v39 = v838;
                                                                                      goto LABEL_485;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v792 = v345;
                                                                                      goto LABEL_410;
                                                                                    }
                                                                                    if (v862)
                                                                                    {
                                                                                      id v358 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v359 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v1071 = *MEMORY[0x1E4F28568];
                                                                                      id v790 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"appEntryEventAddedCharacters"];
                                                                                      id v1072 = v790;
                                                                                      v791 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1072 forKeys:&v1071 count:1];
                                                                                      id v792 = 0;
                                                                                      v877 = 0;
                                                                                      id *v862 = (id)objc_msgSend(v358, "initWithDomain:code:userInfo:", v359, 2);
                                                                                      uint64_t v59 = v879;
                                                                                      uint64_t v60 = v875;
                                                                                      v29 = v889;
                                                                                      uint64_t v61 = v873;
                                                                                      uint64_t v98 = v859;
                                                                                      id v284 = v811;
                                                                                      uint64_t v16 = v888;
                                                                                      goto LABEL_1083;
                                                                                    }
                                                                                    id v792 = 0;
                                                                                    v877 = 0;
                                                                                  }
                                                                                  uint64_t v59 = v879;
                                                                                  uint64_t v60 = v875;
                                                                                  v29 = v889;
                                                                                  uint64_t v61 = v873;
                                                                                  uint64_t v98 = v859;
                                                                                  id v284 = v811;
                                                                                  uint64_t v16 = v888;
                                                                                  goto LABEL_1084;
                                                                                }
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v350 = v341;
                                                                                  id v351 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                                                                  [v350 doubleValue];
                                                                                  id v795 = (id)objc_msgSend(v351, "initWithTimeIntervalSince1970:");

                                                                                  goto LABEL_404;
                                                                                }
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v354 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                                                                  id v355 = v341;
                                                                                  id v795 = [v354 dateFromString:v355];

                                                                                  goto LABEL_404;
                                                                                }
                                                                                v839 = v39;
                                                                                id v379 = v888;
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v795 = v797;
                                                                                  id v6 = v849;
                                                                                  int v39 = v839;
                                                                                  uint64_t v143 = obj;
                                                                                  goto LABEL_404;
                                                                                }
                                                                                if (v862)
                                                                                {
                                                                                  id v414 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                  uint64_t v415 = *MEMORY[0x1E4F502C8];
                                                                                  uint64_t v1075 = *MEMORY[0x1E4F28568];
                                                                                  id v794 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"appEntryEventEndTime"];
                                                                                  id v1076 = v794;
                                                                                  v796 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1076 forKeys:&v1075 count:1];
                                                                                  id v795 = 0;
                                                                                  v877 = 0;
                                                                                  id *v862 = (id)objc_msgSend(v414, "initWithDomain:code:userInfo:", v415, 2);
                                                                                  uint64_t v16 = v888;
                                                                                  uint64_t v59 = v879;
                                                                                  uint64_t v60 = v875;
                                                                                  v29 = v889;
                                                                                  uint64_t v61 = v873;
                                                                                  int v39 = v839;
                                                                                  uint64_t v98 = v859;
                                                                                  uint64_t v143 = obj;
                                                                                  id v284 = v811;
                                                                                  goto LABEL_1085;
                                                                                }
                                                                                id v795 = 0;
                                                                                v877 = 0;
LABEL_601:
                                                                                uint64_t v16 = v379;
                                                                                uint64_t v59 = v879;
                                                                                uint64_t v60 = v875;
                                                                                v29 = v889;
                                                                                uint64_t v61 = v873;
                                                                                int v39 = v839;
                                                                                uint64_t v98 = v859;
                                                                                uint64_t v143 = obj;
                                                                                id v284 = v811;
                                                                                goto LABEL_1086;
                                                                              }
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v348 = v339;
                                                                                id v349 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                                                                [v348 doubleValue];
                                                                                id v798 = (id)objc_msgSend(v349, "initWithTimeIntervalSince1970:");

                                                                                goto LABEL_401;
                                                                              }
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v352 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                                                                id v353 = v339;
                                                                                id v798 = [v352 dateFromString:v353];

                                                                                goto LABEL_401;
                                                                              }
                                                                              v839 = v39;
                                                                              id v379 = v888;
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v798 = v799;
                                                                                id v6 = v849;
                                                                                int v39 = v839;
                                                                                uint64_t v143 = obj;
                                                                                goto LABEL_401;
                                                                              }
                                                                              if (v862)
                                                                              {
                                                                                id v412 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v413 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v1077 = *MEMORY[0x1E4F28568];
                                                                                id v795 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"appEntryEventStartTime"];
                                                                                id v1078 = v795;
                                                                                v797 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1078 forKeys:&v1077 count:1];
                                                                                id v798 = 0;
                                                                                v877 = 0;
                                                                                id *v862 = (id)objc_msgSend(v412, "initWithDomain:code:userInfo:", v413, 2);
                                                                                goto LABEL_601;
                                                                              }
                                                                              id v798 = 0;
                                                                              v877 = 0;
                                                                              uint64_t v16 = v888;
LABEL_599:
                                                                              uint64_t v59 = v879;
                                                                              uint64_t v60 = v875;
                                                                              v29 = v889;
                                                                              uint64_t v61 = v873;
                                                                              int v39 = v839;
                                                                              uint64_t v98 = v859;
                                                                              uint64_t v143 = obj;
                                                                              id v284 = v811;
                                                                              goto LABEL_1087;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v326 = v325;
                                                                              id v327 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                                                              [v326 doubleValue];
                                                                              id v800 = (id)objc_msgSend(v327, "initWithTimeIntervalSince1970:");
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                              {
                                                                                v839 = v39;
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v800 = v801;
                                                                                  id v6 = v849;
                                                                                  uint64_t v143 = obj;
                                                                                  goto LABEL_398;
                                                                                }
                                                                                if (!v862)
                                                                                {
                                                                                  id v800 = 0;
                                                                                  v877 = 0;
                                                                                  uint64_t v16 = v888;
                                                                                  uint64_t v59 = v879;
                                                                                  uint64_t v60 = v875;
                                                                                  v29 = v889;
                                                                                  uint64_t v61 = v873;
                                                                                  uint64_t v98 = v859;
                                                                                  uint64_t v143 = obj;
                                                                                  id v284 = v811;
                                                                                  goto LABEL_1088;
                                                                                }
                                                                                id v408 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v409 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v1079 = *MEMORY[0x1E4F28568];
                                                                                id v798 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"appEntryEventTimestamp"];
                                                                                id v1080 = v798;
                                                                                v799 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1080 forKeys:&v1079 count:1];
                                                                                id v800 = 0;
                                                                                v877 = 0;
                                                                                id *v862 = (id)objc_msgSend(v408, "initWithDomain:code:userInfo:", v409, 2);
                                                                                uint64_t v16 = v888;
                                                                                goto LABEL_599;
                                                                              }
                                                                              id v326 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                                                              id v337 = v325;
                                                                              id v800 = [v326 dateFromString:v337];
                                                                            }
                                                                            goto LABEL_398;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v802 = v323;
                                                                            goto LABEL_378;
                                                                          }
                                                                          if (v862)
                                                                          {
                                                                            id v333 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v334 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v1081 = *MEMORY[0x1E4F28568];
                                                                            id v800 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appEntryEventClientIdentifier"];
                                                                            id v1082 = v800;
                                                                            uint64_t v335 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1082 forKeys:&v1081 count:1];
                                                                            v336 = v333;
                                                                            v29 = v889;
                                                                            v801 = (void *)v335;
                                                                            id v802 = 0;
                                                                            v877 = 0;
                                                                            id *v862 = (id)objc_msgSend(v336, "initWithDomain:code:userInfo:", v334, 2);
                                                                            uint64_t v59 = v879;
                                                                            uint64_t v60 = v875;
                                                                            uint64_t v61 = v873;
                                                                            uint64_t v98 = v859;
                                                                            id v284 = v811;
                                                                            uint64_t v16 = v888;
                                                                            goto LABEL_1088;
                                                                          }
                                                                          id v802 = 0;
                                                                          v877 = 0;
                                                                          uint64_t v59 = v879;
                                                                          uint64_t v60 = v875;
LABEL_481:
                                                                          uint64_t v61 = v873;
                                                                          uint64_t v98 = v859;
                                                                          id v284 = v811;
                                                                          uint64_t v16 = v888;
                                                                          goto LABEL_1089;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v804 = v301;
LABEL_374:

                                                                          v29 = v889;
                                                                          goto LABEL_375;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v318 = v805;
                                                                          v319 = NSNumber;
                                                                          id v320 = BMMomentsEventDataAppEntryEventTypeFromString(v318);
                                                                          v321 = v319;
                                                                          id v301 = v805;
                                                                          id v804 = [v321 numberWithInt:v320];

                                                                          goto LABEL_374;
                                                                        }
                                                                        if (v862)
                                                                        {
                                                                          id v360 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v361 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v1083 = *MEMORY[0x1E4F28568];
                                                                          id v802 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"appEntryEventType"];
                                                                          id v1084 = v802;
                                                                          v803 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1084 forKeys:&v1083 count:1];
                                                                          id v804 = 0;
                                                                          v877 = 0;
                                                                          id *v862 = (id)objc_msgSend(v360, "initWithDomain:code:userInfo:", v361, 2);
                                                                          uint64_t v59 = v879;
                                                                          uint64_t v60 = v875;
                                                                          v29 = v889;
                                                                          goto LABEL_481;
                                                                        }
                                                                        id v804 = 0;
                                                                        v877 = 0;
                                                                        uint64_t v59 = v879;
                                                                        uint64_t v60 = v875;
                                                                        v29 = v889;
LABEL_555:
                                                                        uint64_t v61 = v873;
                                                                        uint64_t v98 = v859;
                                                                        id v284 = v811;
                                                                        uint64_t v16 = v888;
                                                                        goto LABEL_1090;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v806 = v299;
                                                                        goto LABEL_348;
                                                                      }
                                                                      if (v862)
                                                                      {
                                                                        id v314 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v315 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v1085 = *MEMORY[0x1E4F28568];
                                                                        id v804 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"suggestionViewVisibleTime"];
                                                                        id v1086 = v804;
                                                                        uint64_t v316 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1086 forKeys:&v1085 count:1];
                                                                        v317 = v314;
                                                                        v29 = v889;
                                                                        v805 = (void *)v316;
                                                                        id v806 = 0;
                                                                        v877 = 0;
                                                                        id *v862 = (id)objc_msgSend(v317, "initWithDomain:code:userInfo:", v315, 2);
                                                                        uint64_t v59 = v879;
                                                                        uint64_t v60 = v875;
                                                                        goto LABEL_555;
                                                                      }
                                                                      id v806 = 0;
                                                                      v877 = 0;
LABEL_464:
                                                                      uint64_t v59 = v879;
                                                                      uint64_t v60 = v875;
                                                                      uint64_t v61 = v873;
                                                                      uint64_t v98 = v859;
                                                                      id v284 = v811;
                                                                      uint64_t v16 = v888;
                                                                      goto LABEL_1091;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v808 = v297;
                                                                      goto LABEL_345;
                                                                    }
                                                                    if (v862)
                                                                    {
                                                                      id v310 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v311 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v1087 = *MEMORY[0x1E4F28568];
                                                                      id v806 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestionViewContainerName"];
                                                                      id v1088 = v806;
                                                                      uint64_t v312 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1088 forKeys:&v1087 count:1];
                                                                      id v313 = v310;
                                                                      v29 = v889;
                                                                      v807 = (void *)v312;
                                                                      id v808 = 0;
                                                                      v877 = 0;
                                                                      id *v862 = (id)objc_msgSend(v313, "initWithDomain:code:userInfo:", v311, 2);
                                                                      goto LABEL_464;
                                                                    }
                                                                    id v808 = 0;
                                                                    v877 = 0;
LABEL_435:
                                                                    uint64_t v59 = v879;
                                                                    uint64_t v60 = v875;
                                                                    uint64_t v61 = v873;
                                                                    uint64_t v98 = v859;
                                                                    id v284 = v811;
                                                                    uint64_t v16 = v888;
                                                                    goto LABEL_1092;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v810 = v295;
                                                                    goto LABEL_342;
                                                                  }
                                                                  if (v862)
                                                                  {
                                                                    id v302 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v303 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v1089 = *MEMORY[0x1E4F28568];
                                                                    id v808 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestionClientIdentifier"];
                                                                    id v1090 = v808;
                                                                    uint64_t v304 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1090 forKeys:&v1089 count:1];
                                                                    v305 = v302;
                                                                    v29 = v889;
                                                                    v809 = (void *)v304;
                                                                    id v810 = 0;
                                                                    v877 = 0;
                                                                    id *v862 = (id)objc_msgSend(v305, "initWithDomain:code:userInfo:", v303, 2);
                                                                    goto LABEL_435;
                                                                  }
                                                                  id v810 = 0;
                                                                  v877 = 0;
                                                                  uint64_t v59 = v879;
                                                                  uint64_t v60 = v875;
LABEL_467:
                                                                  uint64_t v61 = v873;
                                                                  uint64_t v98 = v859;
                                                                  id v284 = v811;
                                                                  uint64_t v16 = v888;
                                                                  goto LABEL_1093;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v288 = v287;
                                                                  id v289 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                                                  [v288 doubleValue];
                                                                  v290 = v289;
                                                                  v29 = v889;
                                                                  id v813 = (id)objc_msgSend(v290, "initWithTimeIntervalSince1970:");
LABEL_338:

                                                                  goto LABEL_339;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v291 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                                                  id v292 = v287;
                                                                  id v288 = v291;
                                                                  id v293 = v292;
                                                                  id v813 = [v288 dateFromString:v293];

                                                                  v29 = v889;
                                                                  goto LABEL_338;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v813 = v287;
                                                                  goto LABEL_339;
                                                                }
                                                                if (v862)
                                                                {
                                                                  id v375 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v376 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v1091 = *MEMORY[0x1E4F28568];
                                                                  id v810 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"suggestionTimestamp"];
                                                                  id v1092 = v810;
                                                                  v812 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1092 forKeys:&v1091 count:1];
                                                                  id v813 = 0;
                                                                  v877 = 0;
                                                                  id *v862 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v376, 2);
                                                                  uint64_t v59 = v879;
                                                                  uint64_t v60 = v875;
                                                                  v29 = v889;
                                                                  goto LABEL_467;
                                                                }
                                                                id v813 = 0;
                                                                v877 = 0;
                                                                uint64_t v59 = v879;
                                                                uint64_t v60 = v875;
                                                                v29 = v889;
                                                                uint64_t v61 = v873;
                                                                uint64_t v98 = v859;
                                                                id v284 = v811;
LABEL_564:
                                                                uint64_t v16 = v888;
                                                                goto LABEL_1094;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v811 = v272;
LABEL_328:

                                                                v29 = v889;
                                                                goto LABEL_329;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v285 = v272;
                                                                id v811 = [NSNumber numberWithInt:BMMomentsEventDataSuggestionTypeFromString(v285)];

                                                                goto LABEL_328;
                                                              }
                                                              if (v862)
                                                              {
                                                                id v328 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v329 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v1093 = *MEMORY[0x1E4F28568];
                                                                id v813 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"suggestionType"];
                                                                id v1094 = v813;
                                                                uint64_t v330 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1094 forKeys:&v1093 count:1];
                                                                uint64_t v331 = v329;
                                                                uint64_t v98 = v859;
                                                                v814 = (void *)v330;
                                                                id v332 = (id)objc_msgSend(v328, "initWithDomain:code:userInfo:", v331, 2);
                                                                id v284 = 0;
                                                                v877 = 0;
                                                                id *v862 = v332;
                                                                uint64_t v59 = v879;
                                                                uint64_t v60 = v875;
                                                                v29 = v889;
                                                                uint64_t v61 = v873;
                                                                goto LABEL_564;
                                                              }
                                                              id v284 = 0;
                                                              v877 = 0;
                                                              uint64_t v59 = v879;
                                                              uint64_t v60 = v875;
                                                              v29 = v889;
LABEL_479:
                                                              uint64_t v61 = v873;
                                                              uint64_t v16 = v888;
                                                              goto LABEL_1095;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v817 = v270;
                                                              goto LABEL_309;
                                                            }
                                                            if (v862)
                                                            {
                                                              id v278 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v279 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v1095 = *MEMORY[0x1E4F28568];
                                                              uint64_t v280 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rankingVersion"];
                                                              uint64_t v1096 = v280;
                                                              uint64_t v281 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1096 forKeys:&v1095 count:1];
                                                              id v282 = v278;
                                                              v29 = v889;
                                                              uint64_t v283 = v279;
                                                              id v284 = (void *)v280;
                                                              uint64_t v98 = v859;
                                                              v815 = (void *)v281;
                                                              id v817 = 0;
                                                              v877 = 0;
                                                              id *v862 = (id)objc_msgSend(v282, "initWithDomain:code:userInfo:", v283, 2);
                                                              uint64_t v59 = v879;
                                                              uint64_t v60 = v875;
                                                              goto LABEL_479;
                                                            }
                                                            id v817 = 0;
                                                            v877 = 0;
                                                            uint64_t v59 = v879;
                                                            uint64_t v60 = v875;
                                                            uint64_t v61 = v873;
                                                            v277 = v816;
LABEL_394:
                                                            uint64_t v16 = v888;
                                                            goto LABEL_1096;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v819 = v268;
                                                            goto LABEL_306;
                                                          }
                                                          if (v862)
                                                          {
                                                            id v273 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v274 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v1097 = *MEMORY[0x1E4F28568];
                                                            id v817 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleVersion"];
                                                            id v1098 = v817;
                                                            uint64_t v275 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1098 forKeys:&v1097 count:1];
                                                            v276 = v273;
                                                            v29 = v889;
                                                            uint64_t v98 = v859;
                                                            id v819 = 0;
                                                            v877 = 0;
                                                            id *v862 = (id)[v276 initWithDomain:v274 code:2 userInfo:v275];
                                                            v277 = (void *)v275;
                                                            uint64_t v59 = v879;
                                                            uint64_t v60 = v875;
                                                            uint64_t v61 = v873;
                                                            goto LABEL_394;
                                                          }
                                                          id v819 = 0;
                                                          v877 = 0;
                                                          uint64_t v59 = v879;
                                                          uint64_t v60 = v875;
LABEL_386:
                                                          uint64_t v61 = v873;
                                                          uint64_t v16 = v888;
                                                          goto LABEL_1097;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v820 = v234;
LABEL_302:

                                                          v29 = v889;
                                                          goto LABEL_303;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v266 = v234;
                                                          id v820 = [NSNumber numberWithInt:BMMomentsEventDataBundleEngagementTypeFromString(v266)];

                                                          goto LABEL_302;
                                                        }
                                                        if (v862)
                                                        {
                                                          id v306 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          uint64_t v307 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v1099 = *MEMORY[0x1E4F28568];
                                                          id v819 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundlEngagement"];
                                                          id v1100 = v819;
                                                          uint64_t v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1100 forKeys:&v1099 count:1];
                                                          id v309 = v306;
                                                          uint64_t v98 = v859;
                                                          v818 = (void *)v308;
                                                          id v820 = 0;
                                                          v877 = 0;
                                                          id *v862 = (id)[v309 initWithDomain:v307 code:2 userInfo:v308];
                                                          uint64_t v59 = v879;
                                                          uint64_t v60 = v875;
                                                          v29 = v889;
                                                          goto LABEL_386;
                                                        }
                                                        id v820 = 0;
                                                        v877 = 0;
                                                        uint64_t v59 = v879;
                                                        uint64_t v60 = v875;
                                                        v29 = v889;
LABEL_433:
                                                        uint64_t v61 = v873;
                                                        uint64_t v16 = v888;
                                                        goto LABEL_1098;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v822 = v232;
                                                        goto LABEL_266;
                                                      }
                                                      if (v862)
                                                      {
                                                        id v261 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v262 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v1101 = *MEMORY[0x1E4F28568];
                                                        id v820 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBundleResourceTypeInterenceTagIncluded"];
                                                        id v1102 = v820;
                                                        uint64_t v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1102 forKeys:&v1101 count:1];
                                                        double v264 = v261;
                                                        v29 = v889;
                                                        uint64_t v265 = v262;
                                                        uint64_t v98 = v859;
                                                        v821 = (void *)v263;
                                                        id v822 = 0;
                                                        v877 = 0;
                                                        id *v862 = (id)objc_msgSend(v264, "initWithDomain:code:userInfo:", v265, 2);
                                                        uint64_t v59 = v879;
                                                        uint64_t v60 = v875;
                                                        goto LABEL_433;
                                                      }
                                                      id v822 = 0;
                                                      v877 = 0;
LABEL_369:
                                                      uint64_t v59 = v879;
                                                      uint64_t v60 = v875;
                                                      uint64_t v61 = v873;
                                                      uint64_t v16 = v888;
                                                      goto LABEL_1099;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v824 = v230;
                                                      goto LABEL_263;
                                                    }
                                                    if (v862)
                                                    {
                                                      id v256 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v257 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v1103 = *MEMORY[0x1E4F28568];
                                                      id v822 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBundleResourceTypeWebLinkIncluded"];
                                                      id v1104 = v822;
                                                      uint64_t v258 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1104 forKeys:&v1103 count:1];
                                                      double v259 = v256;
                                                      v29 = v889;
                                                      uint64_t v260 = v257;
                                                      uint64_t v98 = v859;
                                                      v823 = (void *)v258;
                                                      id v824 = 0;
                                                      v877 = 0;
                                                      id *v862 = (id)objc_msgSend(v259, "initWithDomain:code:userInfo:", v260, 2);
                                                      goto LABEL_369;
                                                    }
                                                    id v824 = 0;
                                                    v877 = 0;
LABEL_363:
                                                    uint64_t v59 = v879;
                                                    uint64_t v60 = v875;
                                                    uint64_t v61 = v873;
                                                    uint64_t v16 = v888;
                                                    goto LABEL_1100;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v826 = v228;
                                                    goto LABEL_260;
                                                  }
                                                  if (v862)
                                                  {
                                                    id v248 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v249 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v1105 = *MEMORY[0x1E4F28568];
                                                    id v824 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBundleResourceTypeMediaIncluded"];
                                                    id v1106 = v824;
                                                    uint64_t v250 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1106 forKeys:&v1105 count:1];
                                                    v251 = v248;
                                                    v29 = v889;
                                                    uint64_t v98 = v859;
                                                    v825 = (void *)v250;
                                                    id v826 = 0;
                                                    v877 = 0;
                                                    id *v862 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v249, 2);
                                                    goto LABEL_363;
                                                  }
                                                  id v826 = 0;
                                                  v877 = 0;
LABEL_335:
                                                  uint64_t v59 = v879;
                                                  uint64_t v60 = v875;
                                                  uint64_t v61 = v873;
                                                  uint64_t v16 = v888;
                                                  goto LABEL_1101;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v828 = v226;
                                                  goto LABEL_257;
                                                }
                                                if (v862)
                                                {
                                                  id v244 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v245 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v1107 = *MEMORY[0x1E4F28568];
                                                  id v826 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBundleResourceTypePhotoAssetsIncluded"];
                                                  id v1108 = v826;
                                                  uint64_t v246 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1108 forKeys:&v1107 count:1];
                                                  id v247 = v244;
                                                  v29 = v889;
                                                  uint64_t v98 = v859;
                                                  v827 = (void *)v246;
                                                  id v828 = 0;
                                                  v877 = 0;
                                                  id *v862 = (id)objc_msgSend(v247, "initWithDomain:code:userInfo:", v245, 2);
                                                  goto LABEL_335;
                                                }
                                                id v828 = 0;
                                                v877 = 0;
LABEL_325:
                                                uint64_t v59 = v879;
                                                uint64_t v60 = v875;
                                                uint64_t v61 = v873;
                                                uint64_t v16 = v888;
                                                goto LABEL_1102;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v830 = v224;
                                                goto LABEL_254;
                                              }
                                              if (v862)
                                              {
                                                id v240 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v241 = *MEMORY[0x1E4F502C8];
                                                uint64_t v1109 = *MEMORY[0x1E4F28568];
                                                id v828 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBundleResourceTypeValueIncluded"];
                                                id v1110 = v828;
                                                uint64_t v242 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1110 forKeys:&v1109 count:1];
                                                id v243 = v240;
                                                v29 = v889;
                                                uint64_t v98 = v859;
                                                v829 = (void *)v242;
                                                id v830 = 0;
                                                v877 = 0;
                                                id *v862 = (id)objc_msgSend(v243, "initWithDomain:code:userInfo:", v241, 2);
                                                goto LABEL_325;
                                              }
                                              id v830 = 0;
                                              v877 = 0;
LABEL_321:
                                              uint64_t v59 = v879;
                                              uint64_t v60 = v875;
                                              uint64_t v61 = v873;
                                              uint64_t v16 = v888;
                                              goto LABEL_1103;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v833 = v222;
                                              goto LABEL_251;
                                            }
                                            if (v862)
                                            {
                                              id v235 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v236 = *MEMORY[0x1E4F502C8];
                                              uint64_t v1111 = *MEMORY[0x1E4F28568];
                                              id v830 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBundleResourceTypeUnknown"];
                                              id v1112 = v830;
                                              uint64_t v237 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1112 forKeys:&v1111 count:1];
                                              v238 = v235;
                                              v29 = v889;
                                              uint64_t v239 = v236;
                                              uint64_t v98 = v859;
                                              v831 = (void *)v237;
                                              id v833 = 0;
                                              v877 = 0;
                                              id *v862 = (id)objc_msgSend(v238, "initWithDomain:code:userInfo:", v239, 2);
                                              goto LABEL_321;
                                            }
                                            id v833 = 0;
                                            v877 = 0;
                                            uint64_t v59 = v879;
                                            uint64_t v60 = v875;
LABEL_299:
                                            uint64_t v61 = v873;
                                            uint64_t v16 = v888;
                                            goto LABEL_1104;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v842 = v215;
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v862)
                                              {
                                                id v842 = 0;
                                                v877 = 0;
                                                uint64_t v59 = v879;
                                                uint64_t v60 = v875;
                                                v29 = v889;
                                                uint64_t v61 = v873;
                                                uint64_t v16 = v888;
                                                goto LABEL_1105;
                                              }
                                              id v252 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v253 = *MEMORY[0x1E4F502C8];
                                              uint64_t v1113 = *MEMORY[0x1E4F28568];
                                              id v833 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleTimeTag"];
                                              id v1114 = v833;
                                              uint64_t v254 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1114 forKeys:&v1113 count:1];
                                              id v255 = v252;
                                              uint64_t v98 = v859;
                                              v832 = (void *)v254;
                                              id v842 = 0;
                                              v877 = 0;
                                              id *v862 = (id)[v255 initWithDomain:v253 code:2 userInfo:v254];
                                              uint64_t v59 = v879;
                                              uint64_t v60 = v875;
                                              v29 = v889;
                                              goto LABEL_299;
                                            }
                                            id v220 = v215;
                                            id v842 = [NSNumber numberWithInt:BMMomentsEventDataTimeTagTypeFromString(v220)];
                                          }
                                          v29 = v889;
                                          goto LABEL_248;
                                        }
                                      }
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v182 = v153;
                                      int v183 = [BMMomentsEventDataAction alloc];
                                      id v933 = 0;
                                      v843 = [(BMMomentsEventDataAction *)v183 initWithJSONDictionary:v182 error:&v933];
                                      id v184 = v933;
                                      if (!v184)
                                      {

                                        uint64_t v98 = v859;
                                        goto LABEL_163;
                                      }
                                      int v185 = v184;
                                      id v846 = v182;
                                      if (v862) {
                                        id *v862 = v184;
                                      }

                                      v877 = 0;
                                      id v844 = v182;
                                    }
                                    else
                                    {
                                      if (!v862)
                                      {
                                        v877 = 0;
                                        uint64_t v16 = v888;
                                        uint64_t v59 = v879;
                                        uint64_t v60 = v875;
                                        uint64_t v61 = v873;
                                        uint64_t v98 = v859;
                                        int v164 = v844;
                                        id v36 = v847;
                                        goto LABEL_1110;
                                      }
                                      id v198 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v199 = *MEMORY[0x1E4F502C8];
                                      uint64_t v1124 = *MEMORY[0x1E4F28568];
                                      v843 = (BMMomentsEventDataAction *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bundleActionType"];
                                      v1125 = v843;
                                      uint64_t v200 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1125 forKeys:&v1124 count:1];
                                      v201 = v198;
                                      v29 = v889;
                                      id v846 = (id)v200;
                                      v877 = 0;
                                      id *v862 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v199, 2);
                                    }
                                    uint64_t v16 = v888;
                                    uint64_t v59 = v879;
                                    uint64_t v60 = v875;
                                    uint64_t v61 = v873;
                                    uint64_t v98 = v859;
                                    id v36 = v847;
                                    goto LABEL_1109;
                                  }
                                  v847 = v36;
                                }
                                v29 = v889;
                                goto LABEL_151;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v127 = v126;
LABEL_134:
                                v852 = v127;

                                goto LABEL_135;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v139 = v126;
                                id v127 = [NSNumber numberWithInt:BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString(v139)];

                                goto LABEL_134;
                              }
                              if (v862)
                              {
                                id v191 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v192 = *MEMORY[0x1E4F502C8];
                                uint64_t v1135 = *MEMORY[0x1E4F28568];
                                v837 = v39;
                                id v193 = v6;
                                id v194 = [NSString alloc];
                                uint64_t v659 = objc_opt_class();
                                v195 = v194;
                                id v6 = v193;
                                int v39 = v837;
                                a4 = v870;
                                id v848 = (id)[v195 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v659, @"bundlePlaceUserType"];
                                id v1136 = v848;
                                v850 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1136 forKeys:&v1135 count:1];
                                v852 = 0;
                                v877 = 0;
                                id *v862 = (id)objc_msgSend(v191, "initWithDomain:code:userInfo:", v192, 2);
                                uint64_t v59 = v879;
                                uint64_t v60 = v875;
                                v29 = v889;
                                uint64_t v61 = v873;
                                uint64_t v98 = v859;
                                uint64_t v16 = v888;
                                goto LABEL_1114;
                              }
                              v852 = 0;
                              v877 = 0;
                              uint64_t v59 = v879;
                              uint64_t v60 = v875;
                              v29 = v889;
                              uint64_t v61 = v873;
                              uint64_t v98 = v859;
                              uint64_t v16 = v888;
                              a4 = v870;
LABEL_1115:

                              goto LABEL_1116;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v124 = v53;
                              id v854 = [NSNumber numberWithInt:BMMomentsEventDataPlaceInferencePlaceTypeFromString(v124)];

                              goto LABEL_122;
                            }
                            if (v862)
                            {
                              id v186 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v187 = *MEMORY[0x1E4F502C8];
                              uint64_t v1137 = *MEMORY[0x1E4F28568];
                              v836 = v39;
                              id v188 = v6;
                              id v189 = [NSString alloc];
                              uint64_t v658 = objc_opt_class();
                              int v190 = v189;
                              id v6 = v188;
                              int v39 = v836;
                              a4 = v870;
                              v852 = (void *)[v190 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v658, @"bundlePlaceType"];
                              v1138 = v852;
                              v851 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1138 forKeys:&v1137 count:1];
                              id v854 = 0;
                              v877 = 0;
                              id *v862 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v187, 2);
                              uint64_t v59 = v879;
                              uint64_t v60 = v875;
                              v29 = v889;
                              uint64_t v61 = v873;
                              uint64_t v98 = v859;
                              uint64_t v16 = v888;
                              goto LABEL_1115;
                            }
                            id v854 = 0;
                            v877 = 0;
                            uint64_t v59 = v879;
                            uint64_t v60 = v875;
                            v29 = v889;
                            uint64_t v61 = v873;
                            uint64_t v98 = v859;
                            uint64_t v16 = v888;
                            a4 = v870;
LABEL_1116:

                            goto LABEL_1117;
                          }
                          if (v862)
                          {
                            id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v108 = *MEMORY[0x1E4F502C8];
                            uint64_t v1139 = *MEMORY[0x1E4F28568];
                            uint64_t v109 = v39;
                            id v110 = v6;
                            id v111 = [NSString alloc];
                            uint64_t v657 = objc_opt_class();
                            uint64_t v112 = v111;
                            id v6 = v110;
                            int v39 = v109;
                            a4 = v870;
                            id v854 = (id)[v112 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v657, @"bundlePromptParametersAvailability"];
                            id v1140 = v854;
                            uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1140 forKeys:&v1139 count:1];
                            uint64_t v114 = v107;
                            v29 = v889;
                            v853 = (void *)v113;
                            id v856 = 0;
                            v877 = 0;
                            id *v862 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v108, 2);
                            uint64_t v59 = v879;
                            uint64_t v60 = v875;
                            uint64_t v61 = v873;
                            uint64_t v98 = v859;
                            uint64_t v16 = v888;
                            goto LABEL_1116;
                          }
                          id v856 = 0;
                          v877 = 0;
                          uint64_t v59 = v879;
                          uint64_t v60 = v875;
                          uint64_t v61 = v873;
                          uint64_t v98 = v859;
                          uint64_t v16 = v888;
                          a4 = v870;
LABEL_1117:

                          goto LABEL_1118;
                        }
                        if (v862)
                        {
                          id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v883 = *MEMORY[0x1E4F502C8];
                          uint64_t v1141 = *MEMORY[0x1E4F28568];
                          uint64_t v101 = v39;
                          id v102 = v6;
                          id v103 = [NSString alloc];
                          uint64_t v98 = v859;
                          uint64_t v656 = objc_opt_class();
                          uint64_t v104 = v103;
                          id v6 = v102;
                          int v39 = v101;
                          a4 = v870;
                          id v856 = (id)[v104 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v656, @"bundlePromptToneID"];
                          id v1142 = v856;
                          uint64_t v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1142 forKeys:&v1141 count:1];
                          uint64_t v106 = v100;
                          v29 = v889;
                          v855 = (void *)v105;
                          id v858 = 0;
                          v877 = 0;
                          id *v862 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v883, 2);
                          uint64_t v59 = v879;
                          uint64_t v60 = v875;
                          uint64_t v61 = v873;
                          uint64_t v16 = v888;
                          goto LABEL_1117;
                        }
                        id v858 = 0;
                        v877 = 0;
                        uint64_t v59 = v879;
                        uint64_t v60 = v875;
                        uint64_t v61 = v873;
                        uint64_t v98 = v859;
                        uint64_t v16 = v888;
                        a4 = v870;
LABEL_1118:

                        id v10 = v857;
                        goto LABEL_1119;
                      }
                      if (a4)
                      {
                        id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v93 = *MEMORY[0x1E4F502C8];
                        uint64_t v1143 = *MEMORY[0x1E4F28568];
                        uint64_t v94 = v39;
                        id v95 = v6;
                        id v96 = [NSString alloc];
                        uint64_t v655 = objc_opt_class();
                        uint64_t v97 = v96;
                        id v6 = v95;
                        int v39 = v94;
                        a4 = v870;
                        id v858 = (id)[v97 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v655, @"bundlePromptLanguageFormat"];
                        id v1144 = v858;
                        uint64_t v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1144 forKeys:&v1143 count:1];
                        uint64_t v99 = v92;
                        v29 = v889;
                        id v860 = 0;
                        v877 = 0;
                        id *v862 = (id)[v99 initWithDomain:v93 code:2 userInfo:v98];
                        uint64_t v59 = v879;
                        uint64_t v60 = v875;
                        uint64_t v61 = v873;
                        uint64_t v16 = v888;
                        goto LABEL_1118;
                      }
                      id v860 = 0;
                      v877 = 0;
                      uint64_t v59 = v879;
                      uint64_t v60 = v875;
                      uint64_t v61 = v873;
                      uint64_t v16 = v888;
                      a4 = v870;
LABEL_1119:

                      goto LABEL_1120;
                    }
                    if (a4)
                    {
                      id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v882 = *MEMORY[0x1E4F502C8];
                      uint64_t v1145 = *MEMORY[0x1E4F28568];
                      uint64_t v79 = a4;
                      uint64_t v80 = v39;
                      id v81 = v6;
                      id v82 = [NSString alloc];
                      uint64_t v653 = objc_opt_class();
                      uint64_t v83 = v82;
                      id v6 = v81;
                      int v39 = v80;
                      a4 = v870;
                      id v860 = (id)[v83 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v653, @"bundleSourceRoutineExists"];
                      id v1146 = v860;
                      uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1146 forKeys:&v1145 count:1];
                      uint64_t v85 = v78;
                      v29 = v889;
                      v861 = (void *)v84;
                      id v865 = 0;
                      v877 = 0;
                      *uint64_t v79 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v882, 2);
                      uint64_t v59 = v879;
                      uint64_t v60 = v875;
                      uint64_t v61 = v873;
                      uint64_t v16 = v888;
                      goto LABEL_1119;
                    }
                    id v865 = 0;
                    v877 = 0;
                    uint64_t v59 = v879;
                    uint64_t v60 = v875;
                    uint64_t v61 = v873;
                    uint64_t v16 = v888;
                    a4 = v870;
LABEL_1120:

                    goto LABEL_1121;
                  }
                  if (a4)
                  {
                    id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v881 = *MEMORY[0x1E4F502C8];
                    uint64_t v1147 = *MEMORY[0x1E4F28568];
                    uint64_t v71 = a4;
                    uint64_t v72 = v39;
                    id v73 = v6;
                    id v74 = [NSString alloc];
                    uint64_t v652 = objc_opt_class();
                    int v75 = v74;
                    id v6 = v73;
                    int v39 = v72;
                    a4 = v870;
                    id v865 = (id)[v75 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v652, @"bundleSourceProactiveExists"];
                    id v1148 = v865;
                    uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1148 forKeys:&v1147 count:1];
                    uint64_t v77 = v70;
                    v29 = v889;
                    v866 = (void *)v76;
                    id v868 = 0;
                    v877 = 0;
                    *uint64_t v71 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v881, 2);
                    uint64_t v59 = v879;
                    uint64_t v60 = v875;
                    uint64_t v61 = v873;
                    uint64_t v16 = v888;
                    goto LABEL_1120;
                  }
                  id v868 = 0;
                  v877 = 0;
                  uint64_t v59 = v879;
                  uint64_t v60 = v875;
                  uint64_t v61 = v873;
                  uint64_t v16 = v888;
                  a4 = v870;
LABEL_1121:

                  goto LABEL_1122;
                }
                if (a4)
                {
                  id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v880 = *MEMORY[0x1E4F502C8];
                  uint64_t v1149 = *MEMORY[0x1E4F28568];
                  uint64_t v63 = a4;
                  uint64_t v64 = v39;
                  id v65 = v6;
                  id v66 = [NSString alloc];
                  uint64_t v651 = objc_opt_class();
                  v67 = v66;
                  id v6 = v65;
                  int v39 = v64;
                  a4 = v870;
                  id v868 = (id)[v67 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v651, @"bundleSourcePhotoExists"];
                  id v1150 = v868;
                  uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1150 forKeys:&v1149 count:1];
                  uint64_t v69 = v62;
                  v29 = v889;
                  v869 = (void *)v68;
                  id v871 = 0;
                  v877 = 0;
                  *uint64_t v63 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v880, 2);
                  uint64_t v59 = v879;
                  uint64_t v60 = v875;
                  uint64_t v61 = v873;
                  uint64_t v16 = v888;
                  goto LABEL_1121;
                }
                id v871 = 0;
                v877 = 0;
                uint64_t v59 = v879;
                uint64_t v60 = v875;
                uint64_t v61 = v873;
                uint64_t v16 = v888;
                a4 = v870;
LABEL_1122:

                goto LABEL_1123;
              }
              if (a4)
              {
                id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v55 = *MEMORY[0x1E4F502C8];
                uint64_t v1151 = *MEMORY[0x1E4F28568];
                v863 = a4;
                id v56 = v6;
                id v57 = [NSString alloc];
                uint64_t v650 = objc_opt_class();
                v58 = v57;
                id v6 = v56;
                id v871 = (id)[v58 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v650, @"bundleSourceHealthExists"];
                id v1152 = v871;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1152 forKeys:&v1151 count:1];
                v872 = v29 = v889;
                a4 = 0;
                v877 = 0;
                id *v863 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2);
                uint64_t v59 = v879;
                uint64_t v60 = v875;
                uint64_t v61 = v873;
                uint64_t v16 = v888;
                goto LABEL_1122;
              }
              v877 = 0;
              uint64_t v59 = v879;
              uint64_t v60 = v875;
LABEL_112:
              uint64_t v61 = v873;
              uint64_t v16 = v888;
LABEL_1123:

              v9 = v885;
              goto LABEL_1124;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v37 = v35;
              id v38 = [NSNumber numberWithInt:BMMomentsEventDataBundleInterfaceTypeFromString(v37)];

              id v36 = v38;
              goto LABEL_47;
            }
            if (a4)
            {
              id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v87 = *MEMORY[0x1E4F502C8];
              uint64_t v1153 = *MEMORY[0x1E4F28568];
              id v88 = v6;
              id v89 = [NSString alloc];
              uint64_t v654 = objc_opt_class();
              uint64_t v90 = v89;
              id v6 = v88;
              uint64_t v91 = (id *)[v90 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v654, @"bundleInterfaceType"];
              v1154 = v91;
              int v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1154 forKeys:&v1153 count:1];
              id v36 = 0;
              v877 = 0;
              *a4 = (id)[v86 initWithDomain:v87 code:2 userInfo:v39];
              a4 = v91;
              uint64_t v59 = v879;
              uint64_t v60 = v875;
              v29 = v889;
              goto LABEL_112;
            }
            v877 = 0;
            uint64_t v59 = v879;
            uint64_t v60 = v875;
            v29 = v889;
            uint64_t v61 = v873;
            id v36 = 0;
LABEL_175:
            uint64_t v16 = v888;
LABEL_1124:

            self = v874;
            goto LABEL_1125;
          }
          if (a4)
          {
            id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v135 = *MEMORY[0x1E4F502C8];
            uint64_t v1155 = *MEMORY[0x1E4F28568];
            id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bundleExpirationDate"];
            id v1156 = v36;
            uint64_t v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1156 forKeys:&v1155 count:1];
            uint64_t v137 = v134;
            v29 = v889;
            v876 = (void *)v136;
            id v138 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v135, 2);
            uint64_t v61 = 0;
            v877 = 0;
            *a4 = v138;
            uint64_t v59 = v879;
            uint64_t v60 = v875;
            goto LABEL_175;
          }
          uint64_t v61 = 0;
          v877 = 0;
          uint64_t v59 = v879;
          uint64_t v60 = v875;
LABEL_211:
          uint64_t v16 = v888;
LABEL_1125:

          v17 = v877;
          goto LABEL_1126;
        }
        if (a4)
        {
          id v128 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v129 = self;
          uint64_t v130 = *MEMORY[0x1E4F502C8];
          uint64_t v1157 = *MEMORY[0x1E4F28568];
          uint64_t v61 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bundleCreationDate"];
          v1158 = v61;
          uint64_t v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1158 forKeys:&v1157 count:1];
          uint64_t v132 = v128;
          v29 = (void *)v131;
          uint64_t v133 = v130;
          self = v129;
          v9 = v885;
          uint64_t v60 = 0;
          v877 = 0;
          *a4 = (id)[v132 initWithDomain:v133 code:2 userInfo:v131];
          uint64_t v59 = v879;
          goto LABEL_211;
        }
        uint64_t v60 = 0;
        v17 = 0;
        uint64_t v59 = v879;
LABEL_209:
        uint64_t v16 = v888;
LABEL_1126:

        uint64_t v20 = v886;
        goto LABEL_1127;
      }
      if (a4)
      {
        id v890 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v120 = self;
        uint64_t v121 = *MEMORY[0x1E4F502C8];
        uint64_t v1159 = *MEMORY[0x1E4F28568];
        uint64_t v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bundleEndDate"];
        v1160 = v60;
        uint64_t v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1160 forKeys:&v1159 count:1];
        uint64_t v123 = v121;
        self = v120;
        v887 = (void *)v122;
        uint64_t v59 = 0;
        v17 = 0;
        *a4 = (id)objc_msgSend(v890, "initWithDomain:code:userInfo:", v123, 2);
        goto LABEL_209;
      }
      uint64_t v59 = 0;
      v17 = 0;
LABEL_207:
      uint64_t v16 = v888;
LABEL_1127:

      goto LABEL_1128;
    }
    if (a4)
    {
      id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v116 = *MEMORY[0x1E4F502C8];
      uint64_t v1161 = *MEMORY[0x1E4F28568];
      uint64_t v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bundleStartDate"];
      v1162 = v59;
      uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1162 forKeys:&v1161 count:1];
      uint64_t v118 = v116;
      uint64_t v20 = (void *)v117;
      id v119 = (id)[v115 initWithDomain:v118 code:2 userInfo:v117];
      id v10 = 0;
      v17 = 0;
      *a4 = v119;
      goto LABEL_207;
    }
    id v10 = 0;
    v17 = 0;
    uint64_t v16 = v888;
LABEL_1128:

    v8 = v891;
    goto LABEL_1129;
  }
  if (a4)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F502C8];
    uint64_t v1163 = *MEMORY[0x1E4F28568];
    id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleIdentifier"];
    v1164[0] = v10;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v1164 forKeys:&v1163 count:1];
    id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
    uint64_t v16 = 0;
    v17 = 0;
    *a4 = v15;
    goto LABEL_1128;
  }
  uint64_t v16 = 0;
  v17 = 0;
LABEL_1129:

  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundle *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_bundleStartDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_bundleEndDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_bundleCreationDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_bundleExpirationDate) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleSourceHealthExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasBundleSourcePhotoExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasBundleSourceProactiveExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasBundleSourceRoutineExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_bundlePromptLanguageFormat) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundlePromptToneID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasBundlePromptParametersAvailability) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v5 = self->_bundleEventIDs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v88 objects:v100 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v89;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v89 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v88 objects:v100 count:16];
    }
    while (v7);
  }

  if (self->_bundleActionType)
  {
    uint64_t v87 = 0;
    PBDataWriterPlaceMark();
    [(BMMomentsEventDataAction *)self->_bundleActionType writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v10 = self->_backgroundActions;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v83 objects:v99 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v84;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v84 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v83 + 1) + 8 * v14);
        uint64_t v87 = 0;
        PBDataWriterPlaceMark();
        [v15 writeTo:v4];
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v83 objects:v99 count:16];
    }
    while (v12);
  }

  if (self->_hasBundleIsFamilyIncluded) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIsBundleResourceTypeUnknown) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBundleResourceTypeValueIncluded) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBundleResourceTypePhotoAssetsIncluded) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBundleResourceTypeMediaIncluded) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBundleResourceTypeWebLinkIncluded) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBundleResourceTypeInterenceTagIncluded) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleVersion) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRankingVersion) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_suggestionTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_suggestionClientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_suggestionViewContainerName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasSuggestionViewVisibleTime) {
    PBDataWriterWriteFloatField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_appEntryEventClientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_appEntryEventTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_appEntryEventStartTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_appEntryEventEndTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasAppEntryEventTotalCharacters) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasAppEntryEventAddedCharacters) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_clientActivityEventClientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_clientActivityEventTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_suggestionIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleSourcePostAnalyticsExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasBundleSourcePDExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasBundleSourceMotionExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasBundleSourceBooksExists) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasBundleSourceScreenTimeExists) {
    PBDataWriterWriteBOOLField();
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v16 = self->_gaPRArray;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v79 objects:v98 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v80;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v80 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v79 + 1) + 8 * v20);
        uint64_t v87 = 0;
        PBDataWriterPlaceMark();
        [v21 writeTo:v4];
        PBDataWriterRecallMark();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v79 objects:v98 count:16];
    }
    while (v18);
  }

  if (self->_hasBundlePCount) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsFiltered) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsAggregatedAndSuppressed) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIncludedInSummaryBundleOnly) {
    PBDataWriterWriteBOOLField();
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v22 = self->_subBundleIDs;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v75 objects:v97 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v76;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v76 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteStringField();
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v75 objects:v97 count:16];
    }
    while (v24);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v27 = self->_subSuggestionIDs;
  uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v71 objects:v96 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v72;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v72 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteStringField();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v71 objects:v96 count:16];
    }
    while (v29);
  }

  if (self->_hasRaw_firstCreationDate) {
    PBDataWriterWriteDoubleField();
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v32 = self->_resources;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v67 objects:v95 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v68;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v68 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = *(void **)(*((void *)&v67 + 1) + 8 * v36);
        uint64_t v87 = 0;
        PBDataWriterPlaceMark();
        [v37 writeTo:v4];
        PBDataWriterRecallMark();
        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v67 objects:v95 count:16];
    }
    while (v34);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v38 = self->_persons;
  uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v63 objects:v94 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v64;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v64 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void **)(*((void *)&v63 + 1) + 8 * v42);
        uint64_t v87 = 0;
        PBDataWriterPlaceMark();
        [v43 writeTo:v4];
        PBDataWriterRecallMark();
        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v63 objects:v94 count:16];
    }
    while (v40);
  }

  if (self->_mainPlace)
  {
    uint64_t v87 = 0;
    PBDataWriterPlaceMark();
    [(BMMomentsEventDataEventBundlePlace *)self->_mainPlace writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v44 = self->_otherPlaces;
  uint64_t v45 = [(NSArray *)v44 countByEnumeratingWithState:&v59 objects:v93 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v60;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v60 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = *(void **)(*((void *)&v59 + 1) + 8 * v48);
        uint64_t v87 = 0;
        PBDataWriterPlaceMark();
        [v49 writeTo:v4];
        PBDataWriterRecallMark();
        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = [(NSArray *)v44 countByEnumeratingWithState:&v59 objects:v93 count:16];
    }
    while (v46);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v50 = self->_photoTraits;
  uint64_t v51 = [(NSArray *)v50 countByEnumeratingWithState:&v55 objects:v92 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v56;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v56 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteStringField();
        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSArray *)v50 countByEnumeratingWithState:&v55 objects:v92 count:16];
    }
    while (v52);
  }

  if (self->_clusterMetadata)
  {
    uint64_t v87 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataEventBundleClusterMetadata writeTo:](self->_clusterMetadata, "writeTo:", v4, v55);
    PBDataWriterRecallMark();
  }
  if (self->_outlierMetadata)
  {
    uint64_t v87 = 0;
    PBDataWriterPlaceMark();
    [(BMMomentsEventDataEventBundleOutlierMetadata *)self->_outlierMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasBundleGoodnessScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasDistinctnessScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRichnessScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasEngagementScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasHeuristicsScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_metadataForRank)
  {
    uint64_t v87 = 0;
    PBDataWriterPlaceMark();
    [(BMMomentsEventDataEventBundleMetadataForRank *)self->_metadataForRank writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMMomentsEventDataEventBundle;
  uint64_t v5 = [(BMEventBase *)&v9 init];
  uint64_t v6 = v5;
  if (v5 && !BMMomentsEventDataEventBundleReadFrom((uint64_t)v5, (uint64_t)v4)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }

  return v7;
}

- (NSString)description
{
  id v27 = [NSString alloc];
  uint64_t v104 = [(BMMomentsEventDataEventBundle *)self bundleIdentifier];
  id v103 = [(BMMomentsEventDataEventBundle *)self bundleStartDate];
  id v102 = [(BMMomentsEventDataEventBundle *)self bundleEndDate];
  uint64_t v101 = [(BMMomentsEventDataEventBundle *)self bundleCreationDate];
  id v100 = [(BMMomentsEventDataEventBundle *)self bundleExpirationDate];
  uint64_t v99 = BMMomentsEventDataBundleInterfaceTypeAsString([(BMMomentsEventDataEventBundle *)self bundleInterfaceType]);
  uint64_t v98 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceHealthExists](self, "bundleSourceHealthExists"));
  uint64_t v97 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePhotoExists](self, "bundleSourcePhotoExists"));
  id v96 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceProactiveExists](self, "bundleSourceProactiveExists"));
  id v95 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceRoutineExists](self, "bundleSourceRoutineExists"));
  uint64_t v94 = [(BMMomentsEventDataEventBundle *)self bundlePromptLanguageFormat];
  uint64_t v93 = [(BMMomentsEventDataEventBundle *)self bundlePromptToneID];
  id v92 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundlePromptParametersAvailability](self, "bundlePromptParametersAvailability"));
  long long v91 = BMMomentsEventDataPlaceInferencePlaceTypeAsString([(BMMomentsEventDataEventBundle *)self bundlePlaceType]);
  long long v90 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeAsString([(BMMomentsEventDataEventBundle *)self bundlePlaceUserType]);
  long long v89 = BMMomentsEventDataEventCategoryTypeAsString([(BMMomentsEventDataEventBundle *)self bundleBaseEventCateory]);
  long long v88 = [(BMMomentsEventDataEventBundle *)self bundleEventIDs];
  uint64_t v87 = [(BMMomentsEventDataEventBundle *)self bundleActionType];
  long long v86 = [(BMMomentsEventDataEventBundle *)self backgroundActions];
  long long v85 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleIsFamilyIncluded](self, "bundleIsFamilyIncluded"));
  long long v84 = BMMomentsEventDataTimeTagTypeAsString([(BMMomentsEventDataEventBundle *)self bundleTimeTag]);
  long long v83 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeUnknown](self, "isBundleResourceTypeUnknown"));
  long long v82 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeValueIncluded](self, "isBundleResourceTypeValueIncluded"));
  long long v81 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypePhotoAssetsIncluded](self, "isBundleResourceTypePhotoAssetsIncluded"));
  long long v80 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeMediaIncluded](self, "isBundleResourceTypeMediaIncluded"));
  long long v79 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeWebLinkIncluded](self, "isBundleResourceTypeWebLinkIncluded"));
  long long v78 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeInterenceTagIncluded](self, "isBundleResourceTypeInterenceTagIncluded"));
  long long v77 = BMMomentsEventDataBundleEngagementTypeAsString([(BMMomentsEventDataEventBundle *)self bundlEngagement]);
  uint64_t v3 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self bundleVersion];
  long long v76 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self rankingVersion];
  long long v75 = objc_msgSend(v4, "numberWithDouble:");
  long long v74 = BMMomentsEventDataSuggestionTypeAsString([(BMMomentsEventDataEventBundle *)self suggestionType]);
  long long v73 = [(BMMomentsEventDataEventBundle *)self suggestionTimestamp];
  long long v72 = [(BMMomentsEventDataEventBundle *)self suggestionClientIdentifier];
  long long v71 = [(BMMomentsEventDataEventBundle *)self suggestionViewContainerName];
  uint64_t v5 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self suggestionViewVisibleTime];
  long long v70 = objc_msgSend(v5, "numberWithDouble:");
  long long v69 = BMMomentsEventDataAppEntryEventTypeAsString([(BMMomentsEventDataEventBundle *)self appEntryEventType]);
  long long v68 = [(BMMomentsEventDataEventBundle *)self appEntryEventClientIdentifier];
  long long v67 = [(BMMomentsEventDataEventBundle *)self appEntryEventTimestamp];
  long long v66 = [(BMMomentsEventDataEventBundle *)self appEntryEventStartTime];
  long long v65 = [(BMMomentsEventDataEventBundle *)self appEntryEventEndTime];
  long long v64 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventTotalCharacters](self, "appEntryEventTotalCharacters"));
  long long v63 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventAddedCharacters](self, "appEntryEventAddedCharacters"));
  long long v62 = BMMomentsEventDataClientActivityEventTypeAsString([(BMMomentsEventDataEventBundle *)self clientActivityEventType]);
  long long v61 = [(BMMomentsEventDataEventBundle *)self clientActivityEventClientIdentifier];
  long long v60 = [(BMMomentsEventDataEventBundle *)self clientActivityEventTimestamp];
  long long v59 = [(BMMomentsEventDataEventBundle *)self suggestionIdentifier];
  long long v58 = BMMomentsEventDataPhotoSourceTypeAsString([(BMMomentsEventDataEventBundle *)self photoSourceType]);
  long long v57 = BMMomentsEventDataPhotoLibraryTypeAsString([(BMMomentsEventDataEventBundle *)self photoLibraryType]);
  long long v56 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePostAnalyticsExists](self, "bundleSourcePostAnalyticsExists"));
  long long v55 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePDExists](self, "bundleSourcePDExists"));
  uint64_t v54 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceMotionExists](self, "bundleSourceMotionExists"));
  uint64_t v53 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceBooksExists](self, "bundleSourceBooksExists"));
  uint64_t v52 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceScreenTimeExists](self, "bundleSourceScreenTimeExists"));
  uint64_t v51 = [(BMMomentsEventDataEventBundle *)self gaPRArray];
  uint64_t v46 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePCount](self, "bundlePCount"));
  uint64_t v50 = BMMomentsEventDataRankingTypeAsString([(BMMomentsEventDataEventBundle *)self ranking]);
  uint64_t v44 = BMMomentsEventDataLabelConfidenceScoreTypeAsString([(BMMomentsEventDataEventBundle *)self labelConfidenceScore]);
  uint64_t v49 = BMMomentsEventDataTimeCorrelationScoreTypeAsString([(BMMomentsEventDataEventBundle *)self timeCorrelationScore]);
  uint64_t v48 = BMMomentsEventDataCallDurationTypesAsString([(BMMomentsEventDataEventBundle *)self callDuration]);
  uint64_t v47 = BMMomentsEventDataInteractionCountTypesAsString([(BMMomentsEventDataEventBundle *)self interactionCount]);
  uint64_t v45 = BMMomentsEventDataBundleInteractionTypesAsString([(BMMomentsEventDataEventBundle *)self interactionType]);
  uint64_t v26 = BMMomentsEventDataCallPlaceTypeAsString([(BMMomentsEventDataEventBundle *)self callPlace]);
  uint64_t v43 = BMMomentsEventDataDistanceFromHomeTypeAsString([(BMMomentsEventDataEventBundle *)self distanceFromHome]);
  uint64_t v25 = BMMomentsEventDataAvailabilityTypeAsString([(BMMomentsEventDataEventBundle *)self homeAvailability]);
  uint64_t v42 = BMMomentsEventDataAvailabilityTypeAsString([(BMMomentsEventDataEventBundle *)self workAvailability]);
  uint64_t v24 = BMMomentsEventDataMapItemSourceTypeAsString([(BMMomentsEventDataEventBundle *)self bundleVisitMapItemSource]);
  uint64_t v41 = BMMomentsEventDataVisitPlaceTypesAsString([(BMMomentsEventDataEventBundle *)self bundleVisitPlaceType]);
  uint64_t v40 = BMMomentsEventDataPlaceInferenceGranularityTypeAsString([(BMMomentsEventDataEventBundle *)self bundleVisitPlaceLabelGranularity]);
  uint64_t v39 = BMMomentsEventDataAnomalousTypeAsString([(BMMomentsEventDataEventBundle *)self bundleIncludesAnomalousEvent]);
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isFiltered](self, "isFiltered"));
  id v38 = BMMomentsEventDataEventBundleBundleSuperTypeAsString([(BMMomentsEventDataEventBundle *)self bundleSuperType]);
  id v37 = BMMomentsEventDataEventBundleBundleSubTypeAsString([(BMMomentsEventDataEventBundle *)self bundleSubType]);
  uint64_t v36 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed"));
  uint64_t v35 = BMMomentsEventDataEventBundleSummarizationGranularityAsString([(BMMomentsEventDataEventBundle *)self summarizationGranularity]);
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundle includedInSummaryBundleOnly](self, "includedInSummaryBundleOnly"));
  uint64_t v33 = [(BMMomentsEventDataEventBundle *)self subBundleIDs];
  uint64_t v32 = [(BMMomentsEventDataEventBundle *)self subSuggestionIDs];
  uint64_t v31 = [(BMMomentsEventDataEventBundle *)self firstCreationDate];
  uint64_t v17 = [(BMMomentsEventDataEventBundle *)self resources];
  uint64_t v30 = [(BMMomentsEventDataEventBundle *)self persons];
  uint64_t v29 = [(BMMomentsEventDataEventBundle *)self mainPlace];
  id v22 = [(BMMomentsEventDataEventBundle *)self otherPlaces];
  id v21 = [(BMMomentsEventDataEventBundle *)self photoTraits];
  uint64_t v20 = [(BMMomentsEventDataEventBundle *)self clusterMetadata];
  uint64_t v19 = [(BMMomentsEventDataEventBundle *)self outlierMetadata];
  uint64_t v6 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self bundleGoodnessScore];
  uint64_t v18 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self distinctnessScore];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  objc_super v9 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self richnessScore];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v11 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self engagementScore];
  uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v13 = NSNumber;
  [(BMMomentsEventDataEventBundle *)self heuristicsScore];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  uint64_t v16 = [(BMMomentsEventDataEventBundle *)self metadataForRank];
  id v28 = (id)objc_msgSend(v27, "initWithFormat:", @"BMMomentsEventDataEventBundle with bundleIdentifier: %@, bundleStartDate: %@, bundleEndDate: %@, bundleCreationDate: %@, bundleExpirationDate: %@, bundleInterfaceType: %@, bundleSourceHealthExists: %@, bundleSourcePhotoExists: %@, bundleSourceProactiveExists: %@, bundleSourceRoutineExists: %@, bundlePromptLanguageFormat: %@, bundlePromptToneID: %@, bundlePromptParametersAvailability: %@, bundlePlaceType: %@, bundlePlaceUserType: %@, bundleBaseEventCateory: %@, bundleEventIDs: %@, bundleActionType: %@, backgroundActions: %@, bundleIsFamilyIncluded: %@, bundleTimeTag: %@, isBundleResourceTypeUnknown: %@, isBundleResourceTypeValueIncluded: %@, isBundleResourceTypePhotoAssetsIncluded: %@, isBundleResourceTypeMediaIncluded: %@, isBundleResourceTypeWebLinkIncluded: %@, isBundleResourceTypeInterenceTagIncluded: %@, bundlEngagement: %@, bundleVersion: %@, rankingVersion: %@, suggestionType: %@, suggestionTimestamp: %@, suggestionClientIdentifier: %@, suggestionViewContainerName: %@, suggestionViewVisibleTime: %@, appEntryEventType: %@, appEntryEventClientIdentifier: %@, appEntryEventTimestamp: %@, appEntryEventStartTime: %@, appEntryEventEndTime: %@, appEntryEventTotalCharacters: %@, appEntryEventAddedCharacters: %@, clientActivityEventType: %@, clientActivityEventClientIdentifier: %@, clientActivityEventTimestamp: %@, suggestionIdentifier: %@, photoSourceType: %@, photoLibraryType: %@, bundleSourcePostAnalyticsExists: %@, bundleSourcePDExists: %@, bundleSourceMotionExists: %@, bundleSourceBooksExists: %@, bundleSourceScreenTimeExists: %@, gaPRArray: %@, bundlePCount: %@, ranking: %@, labelConfidenceScore: %@, timeCorrelationScore: %@, callDuration: %@, interactionCount: %@, interactionType: %@, callPlace: %@, distanceFromHome: %@, homeAvailability: %@, workAvailability: %@, bundleVisitMapItemSource: %@, bundleVisitPlaceType: %@, bundleVisitPlaceLabelGranularity: %@, bundleIncludesAnomalousEvent: %@, isFiltered: %@, bundleSuperType: %@, bundleSubType: %@, isAggregatedAndSuppressed: %@, summarizationGranularity: %@, includedInSummaryBundleOnly: %@, subBundleIDs: %@, subSuggestionIDs: %@, firstCreationDate: %@, resources: %@, persons: %@, mainPlace: %@, otherPlaces: %@, photoTraits: %@, clusterMetadata: %@, outlierMetadata: %@, bundleGoodnessScore: %@, distinctnessScore: %@, richnessScore: %@, engagementScore: %@, heuristicsScore: %@, metadataForRank: %@", v104, v103, v102, v101, v100, v99, v98, v97, v96, v95, v94, v93, v92, v91, v90, v89,
              v88,
              v87,
              v86,
              v85,
              v84,
              v83,
              v82,
              v81,
              v80,
              v79,
              v78,
              v77,
              v76,
              v75,
              v74,
              v73,
              v72,
              v71,
              v70,
              v69,
              v68,
              v67,
              v66,
              v65,
              v64,
              v63,
              v62,
              v61,
              v60,
              v59,
              v58,
              v57,
              v56,
              v55,
              v54,
              v53,
              v52,
              v51,
              v46,
              v50,
              v44,
              v49,
              v48,
              v47);

  return (NSString *)v28;
}

- (BMMomentsEventDataEventBundle)initWithBundleIdentifier:(void *)a3 bundleStartDate:(void *)a4 bundleEndDate:(void *)a5 bundleCreationDate:(void *)a6 bundleExpirationDate:(void *)a7 bundleInterfaceType:(int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(id)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(id)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(id)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(int)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(int)a18 bundleEventIDs:(id)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(id)a22 bundleTimeTag:(int)a23 isBundleResourceTypeUnknown:(id)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(id)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(id)a29 bundlEngagement:(int)a30 bundleVersion:(id)a31 rankingVersion:(id)a32 suggestionType:(int)a33 suggestionTimestamp:(id)a34 suggestionClientIdentifier:(id)a35 suggestionViewContainerName:(id)a36 suggestionViewVisibleTime:(id)a37 appEntryEventType:(int)a38 appEntryEventClientIdentifier:(id)a39 appEntryEventTimestamp:(id)a40 appEntryEventStartTime:(id)a41 appEntryEventEndTime:(id)a42 appEntryEventTotalCharacters:(id)a43 appEntryEventAddedCharacters:(id)a44 clientActivityEventType:(int)a45 clientActivityEventClientIdentifier:(id)a46 clientActivityEventTimestamp:(id)a47 suggestionIdentifier:(id)a48 photoSourceType:(int)a49 photoLibraryType:(int)a50 bundleSourcePostAnalyticsExists:(id)a51 bundleSourcePDExists:(id)a52 bundleSourceMotionExists:(id)a53 bundleSourceBooksExists:(id)a54 bundleSourceScreenTimeExists:(id)a55 gaPRArray:(id)a56 bundlePCount:(id)a57 ranking:(int)a58 labelConfidenceScore:(int)a59 timeCorrelationScore:(int)a60 callDuration:(int)a61 interactionCount:(int)a62 interactionType:(int)a63 callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:
{
  id v182 = (void *)STACK[0x580];
  id v170 = (id)STACK[0x548];
  id v169 = (id)STACK[0x540];
  id v166 = (id)STACK[0x538];
  id v165 = (id)STACK[0x530];
  int v145 = (void *)STACK[0x578];
  uint64_t v147 = (void *)STACK[0x570];
  v149 = (void *)STACK[0x568];
  id v151 = (void *)STACK[0x560];
  id v167 = (id)STACK[0x550];
  v153 = (void *)STACK[0x558];
  id v143 = a3;
  id v144 = a4;
  id v192 = a5;
  id v191 = a6;
  id v85 = a7;
  id v86 = a9;
  id v87 = a10;
  id v88 = a11;
  id v189 = a12;
  id v142 = a13;
  id v141 = a14;
  id v188 = a15;
  id v89 = a19;
  id v140 = a20;
  long long v90 = v85;
  long long v91 = v144;
  id v139 = a21;
  id v187 = a22;
  id v186 = a24;
  id v185 = a25;
  id v184 = a26;
  id v183 = a27;
  id v181 = a28;
  id v180 = a29;
  id v179 = a31;
  id v178 = a32;
  id v177 = a34;
  id v138 = a35;
  id v137 = a36;
  id v176 = a37;
  id v136 = a39;
  id v175 = a40;
  id v174 = a41;
  id v173 = a42;
  id v172 = a43;
  id v171 = a44;
  id v135 = a46;
  id v168 = a47;
  id v134 = a48;
  id v164 = a51;
  id v163 = a52;
  id v162 = a53;
  id v161 = a54;
  id v160 = a55;
  id v133 = a56;
  id v159 = a57;
  id v158 = a72;
  id v157 = a75;
  id v156 = a77;
  id v132 = a78;
  id v131 = a79;
  id v155 = a80;
  id v130 = a81;
  id v129 = a82;
  id v128 = v165;
  id v127 = v166;
  id v126 = v169;
  id v125 = v170;
  id v124 = v167;
  id v154 = v153;
  id v152 = v151;
  id v150 = v149;
  id v148 = v147;
  id v146 = v145;
  id v123 = v182;
  v193.receiver = a1;
  v193.super_class = (Class)BMMomentsEventDataEventBundle;
  id v92 = [(BMEventBase *)&v193 init];

  if (v92)
  {
    v92->_dataVersiouint64_t n = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v92->_bundleIdentifier, a3);
    if (v144)
    {
      v92->_hasRaw_bundleStartDate = 1;
      [v144 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_bundleStartDate = 0;
      double v93 = -1.0;
    }
    v92->_raw_bundleStartDate = v93;
    if (v192)
    {
      v92->_hasRaw_bundleEndDate = 1;
      [v192 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_bundleEndDate = 0;
      double v94 = -1.0;
    }
    v92->_raw_bundleEndDate = v94;
    if (v191)
    {
      v92->_hasRaw_bundleCreationDate = 1;
      [v191 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_bundleCreationDate = 0;
      double v95 = -1.0;
    }
    v92->_raw_bundleCreationDate = v95;
    if (v90)
    {
      v92->_hasRaw_bundleExpirationDate = 1;
      [v90 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_bundleExpirationDate = 0;
      double v96 = -1.0;
    }
    v92->_raw_bundleExpirationDate = v96;
    v92->_bundleInterfaceType = a8;
    if (v86)
    {
      v92->_hasBundleSourceHealthExists = 1;
      v92->_bundleSourceHealthExists = [v86 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourceHealthExists = 0;
      v92->_bundleSourceHealthExists = 0;
    }
    if (v87)
    {
      v92->_hasBundleSourcePhotoExists = 1;
      v92->_bundleSourcePhotoExists = [v87 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourcePhotoExists = 0;
      v92->_bundleSourcePhotoExists = 0;
    }
    if (v88)
    {
      v92->_hasBundleSourceProactiveExists = 1;
      v92->_bundleSourceProactiveExists = [v88 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourceProactiveExists = 0;
      v92->_bundleSourceProactiveExists = 0;
    }
    if (v189)
    {
      v92->_hasBundleSourceRoutineExists = 1;
      v92->_bundleSourceRoutineExists = [v189 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourceRoutineExists = 0;
      v92->_bundleSourceRoutineExists = 0;
    }
    objc_storeStrong((id *)&v92->_bundlePromptLanguageFormat, a13);
    objc_storeStrong((id *)&v92->_bundlePromptToneID, a14);
    if (v188)
    {
      v92->_hasBundlePromptParametersAvailability = 1;
      v92->_bundlePromptParametersAvailability = [v188 BOOLValue];
    }
    else
    {
      v92->_hasBundlePromptParametersAvailability = 0;
      v92->_bundlePromptParametersAvailability = 0;
    }
    v92->_bundlePlaceType = a16;
    v92->_bundlePlaceUserType = a17;
    v92->_bundleBaseEventCateory = a18;
    objc_storeStrong((id *)&v92->_bundleEventIDs, a19);
    objc_storeStrong((id *)&v92->_bundleActionType, a20);
    objc_storeStrong((id *)&v92->_backgroundActions, a21);
    if (v187)
    {
      v92->_hasBundleIsFamilyIncluded = 1;
      v92->_bundleIsFamilyIncluded = [v187 BOOLValue];
    }
    else
    {
      v92->_hasBundleIsFamilyIncluded = 0;
      v92->_bundleIsFamilyIncluded = 0;
    }
    v92->_bundleTimeTag = a23;
    if (v186)
    {
      v92->_hasIsBundleResourceTypeUnknowuint64_t n = 1;
      v92->_isBundleResourceTypeUnknowuint64_t n = [v186 BOOLValue];
    }
    else
    {
      v92->_hasIsBundleResourceTypeUnknowuint64_t n = 0;
      v92->_isBundleResourceTypeUnknowuint64_t n = 0;
    }
    if (v185)
    {
      v92->_hasIsBundleResourceTypeValueIncluded = 1;
      v92->_isBundleResourceTypeValueIncluded = [v185 BOOLValue];
    }
    else
    {
      v92->_hasIsBundleResourceTypeValueIncluded = 0;
      v92->_isBundleResourceTypeValueIncluded = 0;
    }
    if (v184)
    {
      v92->_hasIsBundleResourceTypePhotoAssetsIncluded = 1;
      v92->_isBundleResourceTypePhotoAssetsIncluded = [v184 BOOLValue];
    }
    else
    {
      v92->_hasIsBundleResourceTypePhotoAssetsIncluded = 0;
      v92->_isBundleResourceTypePhotoAssetsIncluded = 0;
    }
    if (v183)
    {
      v92->_hasIsBundleResourceTypeMediaIncluded = 1;
      v92->_isBundleResourceTypeMediaIncluded = [v183 BOOLValue];
    }
    else
    {
      v92->_hasIsBundleResourceTypeMediaIncluded = 0;
      v92->_isBundleResourceTypeMediaIncluded = 0;
    }
    if (v181)
    {
      v92->_hasIsBundleResourceTypeWebLinkIncluded = 1;
      v92->_isBundleResourceTypeWebLinkIncluded = [v181 BOOLValue];
    }
    else
    {
      v92->_hasIsBundleResourceTypeWebLinkIncluded = 0;
      v92->_isBundleResourceTypeWebLinkIncluded = 0;
    }
    if (v180)
    {
      v92->_hasIsBundleResourceTypeInterenceTagIncluded = 1;
      v92->_isBundleResourceTypeInterenceTagIncluded = [v180 BOOLValue];
    }
    else
    {
      v92->_hasIsBundleResourceTypeInterenceTagIncluded = 0;
      v92->_isBundleResourceTypeInterenceTagIncluded = 0;
    }
    v92->_bundlEngagement = a30;
    if (v179)
    {
      v92->_hasBundleVersiouint64_t n = 1;
      [v179 doubleValue];
    }
    else
    {
      v92->_hasBundleVersiouint64_t n = 0;
      double v97 = -1.0;
    }
    v92->_bundleVersiouint64_t n = v97;
    if (v178)
    {
      v92->_hasRankingVersiouint64_t n = 1;
      [v178 doubleValue];
    }
    else
    {
      v92->_hasRankingVersiouint64_t n = 0;
      double v98 = -1.0;
    }
    v92->_rankingVersiouint64_t n = v98;
    v92->_suggestionType = a33;
    if (v177)
    {
      v92->_hasRaw_suggestionTimestamp = 1;
      [v177 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_suggestionTimestamp = 0;
      double v99 = -1.0;
    }
    v92->_raw_suggestionTimestamp = v99;
    objc_storeStrong((id *)&v92->_suggestionClientIdentifier, a35);
    objc_storeStrong((id *)&v92->_suggestionViewContainerName, a36);
    if (v176)
    {
      v92->_hasSuggestionViewVisibleTime = 1;
      [v176 floatValue];
      double v101 = v100;
    }
    else
    {
      v92->_hasSuggestionViewVisibleTime = 0;
      double v101 = -1.0;
    }
    v92->_suggestionViewVisibleTime = v101;
    v92->_appEntryEventType = a38;
    objc_storeStrong((id *)&v92->_appEntryEventClientIdentifier, a39);
    if (v175)
    {
      v92->_hasRaw_appEntryEventTimestamp = 1;
      [v175 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_appEntryEventTimestamp = 0;
      double v102 = -1.0;
    }
    v92->_raw_appEntryEventTimestamp = v102;
    if (v174)
    {
      v92->_hasRaw_appEntryEventStartTime = 1;
      [v174 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_appEntryEventStartTime = 0;
      double v103 = -1.0;
    }
    v92->_raw_appEntryEventStartTime = v103;
    if (v173)
    {
      v92->_hasRaw_appEntryEventEndTime = 1;
      [v173 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_appEntryEventEndTime = 0;
      double v104 = -1.0;
    }
    v92->_raw_appEntryEventEndTime = v104;
    if (v172)
    {
      v92->_hasAppEntryEventTotalCharacters = 1;
      int v105 = [v172 intValue];
    }
    else
    {
      v92->_hasAppEntryEventTotalCharacters = 0;
      int v105 = -1;
    }
    v92->_appEntryEventTotalCharacters = v105;
    if (v171)
    {
      v92->_hasAppEntryEventAddedCharacters = 1;
      int v106 = [v171 intValue];
    }
    else
    {
      v92->_hasAppEntryEventAddedCharacters = 0;
      int v106 = -1;
    }
    v92->_appEntryEventAddedCharacters = v106;
    v92->_clientActivityEventType = a45;
    objc_storeStrong((id *)&v92->_clientActivityEventClientIdentifier, a46);
    if (v168)
    {
      v92->_hasRaw_clientActivityEventTimestamp = 1;
      [v168 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_clientActivityEventTimestamp = 0;
      double v107 = -1.0;
    }
    v92->_raw_clientActivityEventTimestamp = v107;
    objc_storeStrong((id *)&v92->_suggestionIdentifier, a48);
    v92->_photoSourceType = a49;
    v92->_photoLibraryType = a50;
    if (v164)
    {
      v92->_hasBundleSourcePostAnalyticsExists = 1;
      v92->_bundleSourcePostAnalyticsExists = [v164 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourcePostAnalyticsExists = 0;
      v92->_bundleSourcePostAnalyticsExists = 0;
    }
    if (v163)
    {
      v92->_hasBundleSourcePDExists = 1;
      v92->_bundleSourcePDExists = [v163 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourcePDExists = 0;
      v92->_bundleSourcePDExists = 0;
    }
    if (v162)
    {
      v92->_hasBundleSourceMotionExists = 1;
      v92->_bundleSourceMotionExists = [v162 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourceMotionExists = 0;
      v92->_bundleSourceMotionExists = 0;
    }
    if (v161)
    {
      v92->_hasBundleSourceBooksExists = 1;
      v92->_bundleSourceBooksExists = [v161 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourceBooksExists = 0;
      v92->_bundleSourceBooksExists = 0;
    }
    if (v160)
    {
      v92->_hasBundleSourceScreenTimeExists = 1;
      v92->_bundleSourceScreenTimeExists = [v160 BOOLValue];
    }
    else
    {
      v92->_hasBundleSourceScreenTimeExists = 0;
      v92->_bundleSourceScreenTimeExists = 0;
    }
    objc_storeStrong((id *)&v92->_gaPRArray, a56);
    if (v159)
    {
      v92->_hasBundlePCount = 1;
      int v108 = [v159 intValue];
    }
    else
    {
      v92->_hasBundlePCount = 0;
      int v108 = -1;
    }
    int v109 = a74;
    int v110 = a73;
    v92->_bundlePCount = v108;
    v92->_ranking = a58;
    v92->_labelConfidenceScore = a59;
    v92->_timeCorrelationScore = a60;
    v92->_callDuratiouint64_t n = a61;
    v92->_interactionCount = a62;
    v92->_interactionType = a63;
    v92->_callPlace = a64;
    v92->_distanceFromHome = a65;
    v92->_homeAvailability = a66;
    v92->_workAvailability = a67;
    v92->_bundleVisitMapItemSource = a68;
    v92->_bundleVisitPlaceType = a69;
    v92->_bundleVisitPlaceLabelGranularity = a70;
    v92->_bundleIncludesAnomalousEvent = a71;
    if (v158)
    {
      v92->_hasIsFiltered = 1;
      char v111 = [v158 BOOLValue];
      int v110 = a73;
      int v109 = a74;
      v92->_isFiltered = v111;
    }
    else
    {
      v92->_hasIsFiltered = 0;
      v92->_isFiltered = 0;
    }
    long long v91 = v144;
    v92->_bundleSuperType = v110;
    v92->_bundleSubType = v109;
    if (v157)
    {
      v92->_hasIsAggregatedAndSuppressed = 1;
      v92->_isAggregatedAndSuppressed = [v157 BOOLValue];
    }
    else
    {
      v92->_hasIsAggregatedAndSuppressed = 0;
      v92->_isAggregatedAndSuppressed = 0;
    }
    v92->_summarizationGranularity = a76;
    if (v156)
    {
      v92->_hasIncludedInSummaryBundleOnly = 1;
      v92->_includedInSummaryBundleOnly = [v156 BOOLValue];
    }
    else
    {
      v92->_hasIncludedInSummaryBundleOnly = 0;
      v92->_includedInSummaryBundleOnly = 0;
    }
    objc_storeStrong((id *)&v92->_subBundleIDs, a78);
    objc_storeStrong((id *)&v92->_subSuggestionIDs, a79);
    if (v155)
    {
      v92->_hasRaw_firstCreationDate = 1;
      [v155 timeIntervalSince1970];
    }
    else
    {
      v92->_hasRaw_firstCreationDate = 0;
      double v112 = -1.0;
    }
    v92->_raw_firstCreationDate = v112;
    objc_storeStrong((id *)&v92->_resources, a81);
    objc_storeStrong((id *)&v92->_persons, a82);
    objc_storeStrong((id *)&v92->_mainPlace, v165);
    objc_storeStrong((id *)&v92->_otherPlaces, v166);
    objc_storeStrong((id *)&v92->_photoTraits, v169);
    objc_storeStrong((id *)&v92->_clusterMetadata, v170);
    objc_storeStrong((id *)&v92->_outlierMetadata, v167);
    if (v154)
    {
      v92->_hasBundleGoodnessScore = 1;
      [v154 doubleValue];
    }
    else
    {
      v92->_hasBundleGoodnessScore = 0;
      double v113 = -1.0;
    }
    v92->_bundleGoodnessScore = v113;
    if (v152)
    {
      v92->_hasDistinctnessScore = 1;
      [v152 doubleValue];
    }
    else
    {
      v92->_hasDistinctnessScore = 0;
      double v114 = -1.0;
    }
    v92->_distinctnessScore = v114;
    if (v150)
    {
      v92->_hasRichnessScore = 1;
      [v150 doubleValue];
    }
    else
    {
      v92->_hasRichnessScore = 0;
      double v115 = -1.0;
    }
    v92->_richnessScore = v115;
    if (v148)
    {
      v92->_hasEngagementScore = 1;
      [v148 doubleValue];
    }
    else
    {
      v92->_hasEngagementScore = 0;
      double v116 = -1.0;
    }
    v92->_engagementScore = v116;
    if (v146)
    {
      v92->_hasHeuristicsScore = 1;
      [v146 doubleValue];
    }
    else
    {
      v92->_hasHeuristicsScore = 0;
      double v117 = -1.0;
    }
    v92->_heuristicsScore = v117;
    objc_storeStrong((id *)&v92->_metadataForRank, v182);
  }
  uint64_t v118 = v92;

  return v118;
}

+ (id)protoFields
{
  v95[91] = *MEMORY[0x1E4F143B8];
  double v94 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleIdentifier" number:1 type:13 subMessageClass:0];
  v95[0] = v94;
  double v93 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleStartDate" number:2 type:0 subMessageClass:0];
  v95[1] = v93;
  id v92 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleEndDate" number:3 type:0 subMessageClass:0];
  v95[2] = v92;
  long long v91 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleCreationDate" number:4 type:0 subMessageClass:0];
  v95[3] = v91;
  long long v90 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleExpirationDate" number:5 type:0 subMessageClass:0];
  v95[4] = v90;
  id v89 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleInterfaceType" number:6 type:4 subMessageClass:0];
  v95[5] = v89;
  id v88 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourceHealthExists" number:7 type:12 subMessageClass:0];
  v95[6] = v88;
  id v87 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourcePhotoExists" number:8 type:12 subMessageClass:0];
  v95[7] = v87;
  id v86 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourceProactiveExists" number:9 type:12 subMessageClass:0];
  v95[8] = v86;
  id v85 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourceRoutineExists" number:10 type:12 subMessageClass:0];
  v95[9] = v85;
  long long v84 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundlePromptLanguageFormat" number:11 type:13 subMessageClass:0];
  v95[10] = v84;
  long long v83 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundlePromptToneID" number:12 type:13 subMessageClass:0];
  v95[11] = v83;
  long long v82 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundlePromptParametersAvailability" number:13 type:12 subMessageClass:0];
  v95[12] = v82;
  long long v81 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundlePlaceType" number:14 type:4 subMessageClass:0];
  v95[13] = v81;
  long long v80 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundlePlaceUserType" number:15 type:4 subMessageClass:0];
  v95[14] = v80;
  long long v79 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleBaseEventCateory" number:16 type:4 subMessageClass:0];
  v95[15] = v79;
  long long v78 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleEventIDs" number:17 type:13 subMessageClass:0];
  v95[16] = v78;
  long long v77 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleActionType" number:18 type:14 subMessageClass:objc_opt_class()];
  v95[17] = v77;
  long long v76 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"backgroundActions" number:19 type:14 subMessageClass:objc_opt_class()];
  v95[18] = v76;
  long long v75 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleIsFamilyIncluded" number:20 type:12 subMessageClass:0];
  v95[19] = v75;
  long long v74 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleTimeTag" number:21 type:4 subMessageClass:0];
  v95[20] = v74;
  long long v73 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBundleResourceTypeUnknown" number:22 type:12 subMessageClass:0];
  v95[21] = v73;
  long long v72 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBundleResourceTypeValueIncluded" number:23 type:12 subMessageClass:0];
  v95[22] = v72;
  long long v71 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBundleResourceTypePhotoAssetsIncluded" number:24 type:12 subMessageClass:0];
  v95[23] = v71;
  long long v70 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBundleResourceTypeMediaIncluded" number:25 type:12 subMessageClass:0];
  v95[24] = v70;
  long long v69 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBundleResourceTypeWebLinkIncluded" number:26 type:12 subMessageClass:0];
  v95[25] = v69;
  long long v68 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBundleResourceTypeInterenceTagIncluded" number:27 type:12 subMessageClass:0];
  v95[26] = v68;
  long long v67 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundlEngagement" number:28 type:4 subMessageClass:0];
  v95[27] = v67;
  long long v66 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleVersion" number:29 type:0 subMessageClass:0];
  v95[28] = v66;
  long long v65 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rankingVersion" number:30 type:0 subMessageClass:0];
  v95[29] = v65;
  long long v64 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionType" number:31 type:4 subMessageClass:0];
  v95[30] = v64;
  long long v63 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionTimestamp" number:32 type:0 subMessageClass:0];
  v95[31] = v63;
  long long v62 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionClientIdentifier" number:33 type:13 subMessageClass:0];
  v95[32] = v62;
  long long v61 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionViewContainerName" number:34 type:13 subMessageClass:0];
  v95[33] = v61;
  long long v60 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionViewVisibleTime" number:35 type:1 subMessageClass:0];
  v95[34] = v60;
  long long v59 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventType" number:36 type:4 subMessageClass:0];
  v95[35] = v59;
  long long v58 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventClientIdentifier" number:37 type:13 subMessageClass:0];
  v95[36] = v58;
  long long v57 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventTimestamp" number:38 type:0 subMessageClass:0];
  v95[37] = v57;
  long long v56 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventStartTime" number:39 type:0 subMessageClass:0];
  v95[38] = v56;
  long long v55 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventEndTime" number:40 type:0 subMessageClass:0];
  v95[39] = v55;
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventTotalCharacters" number:41 type:2 subMessageClass:0];
  v95[40] = v54;
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventAddedCharacters" number:42 type:2 subMessageClass:0];
  v95[41] = v53;
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientActivityEventType" number:43 type:4 subMessageClass:0];
  v95[42] = v52;
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientActivityEventClientIdentifier" number:44 type:13 subMessageClass:0];
  v95[43] = v51;
  uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientActivityEventTimestamp" number:45 type:0 subMessageClass:0];
  v95[44] = v50;
  uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionIdentifier" number:46 type:13 subMessageClass:0];
  v95[45] = v49;
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoSourceType" number:47 type:4 subMessageClass:0];
  v95[46] = v48;
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoLibraryType" number:48 type:4 subMessageClass:0];
  v95[47] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourcePostAnalyticsExists" number:49 type:12 subMessageClass:0];
  v95[48] = v46;
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourcePDExists" number:50 type:12 subMessageClass:0];
  v95[49] = v45;
  uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourceMotionExists" number:51 type:12 subMessageClass:0];
  v95[50] = v44;
  uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourceBooksExists" number:52 type:12 subMessageClass:0];
  v95[51] = v43;
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSourceScreenTimeExists" number:53 type:12 subMessageClass:0];
  v95[52] = v42;
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"gaPRArray" number:54 type:14 subMessageClass:objc_opt_class()];
  v95[53] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundlePCount" number:55 type:2 subMessageClass:0];
  v95[54] = v40;
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ranking" number:56 type:4 subMessageClass:0];
  v95[55] = v39;
  id v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"labelConfidenceScore" number:57 type:4 subMessageClass:0];
  v95[56] = v38;
  id v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeCorrelationScore" number:58 type:4 subMessageClass:0];
  v95[57] = v37;
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"callDuration" number:59 type:4 subMessageClass:0];
  v95[58] = v36;
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionCount" number:60 type:4 subMessageClass:0];
  v95[59] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionType" number:61 type:4 subMessageClass:0];
  v95[60] = v34;
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"callPlace" number:62 type:4 subMessageClass:0];
  v95[61] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceFromHome" number:63 type:4 subMessageClass:0];
  v95[62] = v32;
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeAvailability" number:64 type:4 subMessageClass:0];
  v95[63] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"workAvailability" number:65 type:4 subMessageClass:0];
  v95[64] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleVisitMapItemSource" number:66 type:4 subMessageClass:0];
  v95[65] = v29;
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleVisitPlaceType" number:67 type:4 subMessageClass:0];
  v95[66] = v28;
  id v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleVisitPlaceLabelGranularity" number:68 type:4 subMessageClass:0];
  v95[67] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleIncludesAnomalousEvent" number:69 type:4 subMessageClass:0];
  v95[68] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFiltered" number:70 type:12 subMessageClass:0];
  v95[69] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSuperType" number:71 type:4 subMessageClass:0];
  v95[70] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSubType" number:72 type:4 subMessageClass:0];
  v95[71] = v23;
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAggregatedAndSuppressed" number:73 type:12 subMessageClass:0];
  v95[72] = v22;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"summarizationGranularity" number:74 type:4 subMessageClass:0];
  v95[73] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"includedInSummaryBundleOnly" number:75 type:12 subMessageClass:0];
  v95[74] = v20;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subBundleIDs" number:76 type:13 subMessageClass:0];
  v95[75] = v19;
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subSuggestionIDs" number:77 type:13 subMessageClass:0];
  v95[76] = v18;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"firstCreationDate" number:78 type:0 subMessageClass:0];
  v95[77] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resources" number:79 type:14 subMessageClass:objc_opt_class()];
  v95[78] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"persons" number:80 type:14 subMessageClass:objc_opt_class()];
  v95[79] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mainPlace" number:81 type:14 subMessageClass:objc_opt_class()];
  v95[80] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"otherPlaces" number:82 type:14 subMessageClass:objc_opt_class()];
  v95[81] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoTraits" number:83 type:13 subMessageClass:0];
  v95[82] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clusterMetadata" number:84 type:14 subMessageClass:objc_opt_class()];
  v95[83] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"outlierMetadata" number:85 type:14 subMessageClass:objc_opt_class()];
  v95[84] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleGoodnessScore" number:86 type:0 subMessageClass:0];
  v95[85] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distinctnessScore" number:87 type:0 subMessageClass:0];
  v95[86] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"richnessScore" number:88 type:0 subMessageClass:0];
  v95[87] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"engagementScore" number:89 type:0 subMessageClass:0];
  v95[88] = v8;
  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"heuristicsScore" number:90 type:0 subMessageClass:0];
  v95[89] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadataForRank" number:91 type:14 subMessageClass:objc_opt_class()];
  v95[90] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:91];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3360;
}

+ (id)columns
{
  v95[91] = *MEMORY[0x1E4F143B8];
  double v94 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  double v93 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleStartDate" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v92 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleEndDate" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  long long v91 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleCreationDate" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
  long long v90 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleExpirationDate" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  id v89 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleInterfaceType" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  id v88 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourceHealthExists" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  id v87 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourcePhotoExists" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  id v86 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourceProactiveExists" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  id v85 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourceRoutineExists" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  long long v84 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundlePromptLanguageFormat" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  long long v83 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundlePromptToneID" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  long long v82 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundlePromptParametersAvailability" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  long long v81 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundlePlaceType" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:4 convertedType:0];
  long long v80 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundlePlaceUserType" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:4 convertedType:0];
  long long v79 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleBaseEventCateory" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  long long v78 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bundleEventIDs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3902];
  long long v77 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bundleActionType_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3904];
  long long v76 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"backgroundActions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3906];
  long long v75 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleIsFamilyIncluded" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:12 convertedType:0];
  long long v74 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleTimeTag" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:4 convertedType:0];
  long long v73 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBundleResourceTypeUnknown" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:12 convertedType:0];
  long long v72 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBundleResourceTypeValueIncluded" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:12 convertedType:0];
  long long v71 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBundleResourceTypePhotoAssetsIncluded" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:12 convertedType:0];
  long long v70 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBundleResourceTypeMediaIncluded" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:12 convertedType:0];
  long long v69 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBundleResourceTypeWebLinkIncluded" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:12 convertedType:0];
  long long v68 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBundleResourceTypeInterenceTagIncluded" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:12 convertedType:0];
  long long v67 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundlEngagement" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:4 convertedType:0];
  long long v66 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleVersion" dataType:1 requestOnly:0 fieldNumber:29 protoDataType:0 convertedType:0];
  long long v65 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rankingVersion" dataType:1 requestOnly:0 fieldNumber:30 protoDataType:0 convertedType:0];
  long long v64 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionType" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:4 convertedType:0];
  long long v63 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionTimestamp" dataType:3 requestOnly:0 fieldNumber:32 protoDataType:0 convertedType:2];
  long long v62 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionClientIdentifier" dataType:2 requestOnly:0 fieldNumber:33 protoDataType:13 convertedType:0];
  long long v61 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionViewContainerName" dataType:2 requestOnly:0 fieldNumber:34 protoDataType:13 convertedType:0];
  long long v58 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionViewVisibleTime" dataType:1 requestOnly:0 fieldNumber:35 protoDataType:1 convertedType:0];
  long long v60 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventType" dataType:0 requestOnly:0 fieldNumber:36 protoDataType:4 convertedType:0];
  long long v59 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventClientIdentifier" dataType:2 requestOnly:0 fieldNumber:37 protoDataType:13 convertedType:0];
  long long v57 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventTimestamp" dataType:3 requestOnly:0 fieldNumber:38 protoDataType:0 convertedType:2];
  long long v56 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventStartTime" dataType:3 requestOnly:0 fieldNumber:39 protoDataType:0 convertedType:2];
  long long v55 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventEndTime" dataType:3 requestOnly:0 fieldNumber:40 protoDataType:0 convertedType:2];
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventTotalCharacters" dataType:0 requestOnly:0 fieldNumber:41 protoDataType:2 convertedType:0];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventAddedCharacters" dataType:0 requestOnly:0 fieldNumber:42 protoDataType:2 convertedType:0];
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientActivityEventType" dataType:0 requestOnly:0 fieldNumber:43 protoDataType:4 convertedType:0];
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientActivityEventClientIdentifier" dataType:2 requestOnly:0 fieldNumber:44 protoDataType:13 convertedType:0];
  uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientActivityEventTimestamp" dataType:3 requestOnly:0 fieldNumber:45 protoDataType:0 convertedType:2];
  uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionIdentifier" dataType:2 requestOnly:0 fieldNumber:46 protoDataType:13 convertedType:0];
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoSourceType" dataType:0 requestOnly:0 fieldNumber:47 protoDataType:4 convertedType:0];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoLibraryType" dataType:0 requestOnly:0 fieldNumber:48 protoDataType:4 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourcePostAnalyticsExists" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:12 convertedType:0];
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourcePDExists" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:12 convertedType:0];
  uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourceMotionExists" dataType:0 requestOnly:0 fieldNumber:51 protoDataType:12 convertedType:0];
  uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourceBooksExists" dataType:0 requestOnly:0 fieldNumber:52 protoDataType:12 convertedType:0];
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSourceScreenTimeExists" dataType:0 requestOnly:0 fieldNumber:53 protoDataType:12 convertedType:0];
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"gaPRArray_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3908];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundlePCount" dataType:0 requestOnly:0 fieldNumber:55 protoDataType:2 convertedType:0];
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ranking" dataType:0 requestOnly:0 fieldNumber:56 protoDataType:4 convertedType:0];
  id v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"labelConfidenceScore" dataType:0 requestOnly:0 fieldNumber:57 protoDataType:4 convertedType:0];
  id v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeCorrelationScore" dataType:0 requestOnly:0 fieldNumber:58 protoDataType:4 convertedType:0];
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"callDuration" dataType:0 requestOnly:0 fieldNumber:59 protoDataType:4 convertedType:0];
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionCount" dataType:0 requestOnly:0 fieldNumber:60 protoDataType:4 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionType" dataType:0 requestOnly:0 fieldNumber:61 protoDataType:4 convertedType:0];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"callPlace" dataType:0 requestOnly:0 fieldNumber:62 protoDataType:4 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceFromHome" dataType:0 requestOnly:0 fieldNumber:63 protoDataType:4 convertedType:0];
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"homeAvailability" dataType:0 requestOnly:0 fieldNumber:64 protoDataType:4 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"workAvailability" dataType:0 requestOnly:0 fieldNumber:65 protoDataType:4 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleVisitMapItemSource" dataType:0 requestOnly:0 fieldNumber:66 protoDataType:4 convertedType:0];
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleVisitPlaceType" dataType:0 requestOnly:0 fieldNumber:67 protoDataType:4 convertedType:0];
  id v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleVisitPlaceLabelGranularity" dataType:0 requestOnly:0 fieldNumber:68 protoDataType:4 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleIncludesAnomalousEvent" dataType:0 requestOnly:0 fieldNumber:69 protoDataType:4 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFiltered" dataType:0 requestOnly:0 fieldNumber:70 protoDataType:12 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSuperType" dataType:0 requestOnly:0 fieldNumber:71 protoDataType:4 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSubType" dataType:0 requestOnly:0 fieldNumber:72 protoDataType:4 convertedType:0];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAggregatedAndSuppressed" dataType:0 requestOnly:0 fieldNumber:73 protoDataType:12 convertedType:0];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"summarizationGranularity" dataType:0 requestOnly:0 fieldNumber:74 protoDataType:4 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"includedInSummaryBundleOnly" dataType:0 requestOnly:0 fieldNumber:75 protoDataType:12 convertedType:0];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"subBundleIDs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3910];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"subSuggestionIDs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3912];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstCreationDate" dataType:3 requestOnly:0 fieldNumber:78 protoDataType:0 convertedType:2];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"resources_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3914];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"persons_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3916];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"mainPlace_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3918];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"otherPlaces_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3920];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"photoTraits_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3922];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"clusterMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3924];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"outlierMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3926];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleGoodnessScore" dataType:1 requestOnly:0 fieldNumber:86 protoDataType:0 convertedType:0];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distinctnessScore" dataType:1 requestOnly:0 fieldNumber:87 protoDataType:0 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"richnessScore" dataType:1 requestOnly:0 fieldNumber:88 protoDataType:0 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"engagementScore" dataType:1 requestOnly:0 fieldNumber:89 protoDataType:0 convertedType:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"heuristicsScore" dataType:1 requestOnly:0 fieldNumber:90 protoDataType:0 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadataForRank_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3928];
  v95[0] = v94;
  v95[1] = v93;
  v95[2] = v92;
  v95[3] = v91;
  v95[4] = v90;
  v95[5] = v89;
  v95[6] = v88;
  v95[7] = v87;
  v95[8] = v86;
  v95[9] = v85;
  v95[10] = v84;
  v95[11] = v83;
  v95[12] = v82;
  v95[13] = v81;
  v95[14] = v80;
  v95[15] = v79;
  v95[16] = v78;
  v95[17] = v77;
  v95[18] = v76;
  v95[19] = v75;
  v95[20] = v74;
  v95[21] = v73;
  v95[22] = v72;
  v95[23] = v71;
  v95[24] = v70;
  v95[25] = v69;
  v95[26] = v68;
  v95[27] = v67;
  v95[28] = v66;
  v95[29] = v65;
  v95[30] = v64;
  v95[31] = v63;
  v95[32] = v62;
  v95[33] = v61;
  v95[34] = v58;
  v95[35] = v60;
  v95[36] = v59;
  v95[37] = v57;
  v95[38] = v56;
  v95[39] = v55;
  v95[40] = v54;
  v95[41] = v53;
  v95[42] = v52;
  v95[43] = v51;
  v95[44] = v50;
  v95[45] = v49;
  v95[46] = v48;
  v95[47] = v47;
  v95[48] = v46;
  v95[49] = v45;
  v95[50] = v44;
  v95[51] = v43;
  v95[52] = v42;
  v95[53] = v41;
  v95[54] = v40;
  v95[55] = v39;
  v95[56] = v38;
  v95[57] = v37;
  v95[58] = v36;
  v95[59] = v35;
  v95[60] = v34;
  v95[61] = v33;
  v95[62] = v32;
  v95[63] = v31;
  v95[64] = v30;
  v95[65] = v29;
  v95[66] = v28;
  v95[67] = v27;
  v95[68] = v26;
  v95[69] = v25;
  v95[70] = v24;
  v95[71] = v23;
  v95[72] = v22;
  v95[73] = v21;
  v95[74] = v20;
  v95[75] = v19;
  v95[76] = v18;
  v95[77] = v17;
  v95[78] = v16;
  v95[79] = v15;
  v95[80] = v14;
  v95[81] = v13;
  v95[82] = v2;
  v95[83] = v3;
  v95[84] = v12;
  v95[85] = v4;
  v95[86] = v11;
  v95[87] = v5;
  v95[88] = v6;
  v95[89] = v10;
  v95[90] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:91];

  return v9;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_14(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 metadataForRank];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_13(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 outlierMetadata];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_12(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 clusterMetadata];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_11(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _photoTraitsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_10(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _otherPlacesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 mainPlace];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _personsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _resourcesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _subSuggestionIDsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _subBundleIDsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _gaPRArrayJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _backgroundActionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 bundleActionType];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _bundleEventIDsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMomentsEventDataEventBundle alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[57] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (uint64_t)initWithBundleIdentifier:(uint64_t)a3 bundleStartDate:(uint64_t)a4 bundleEndDate:(uint64_t)a5 bundleCreationDate:(uint64_t)a6 bundleExpirationDate:(uint64_t)a7 bundleInterfaceType:(unsigned int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(uint64_t)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(uint64_t)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(uint64_t)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(uint64_t)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(id)a18 bundleEventIDs:(uint64_t)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(int)a22 bundleTimeTag:(id)a23 isBundleResourceTypeUnknown:(uint64_t)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(uint64_t)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(int)a29 bundlEngagement:(id)a30 bundleVersion:(id)a31 rankingVersion:(int)a32 suggestionType:(id)a33 suggestionTimestamp:(uint64_t)a34 suggestionClientIdentifier:(id)a35 suggestionViewContainerName:(id)a36 suggestionViewVisibleTime:(int)a37 appEntryEventType:(id)a38 appEntryEventClientIdentifier:(uint64_t)a39 appEntryEventTimestamp:(uint64_t)a40 appEntryEventStartTime:(uint64_t)a41 appEntryEventEndTime:(id)a42 appEntryEventTotalCharacters:(id)a43 appEntryEventAddedCharacters:(int)a44 clientActivityEventType:(id)a45 clientActivityEventClientIdentifier:(uint64_t)a46 clientActivityEventTimestamp:(id)a47 suggestionIdentifier:(uint64_t)a48 photoSourceType:(id)a49 photoLibraryType:(uint64_t)a50 bundleSourcePostAnalyticsExists:(id)a51 bundleSourcePDExists:(uint64_t)a52 bundleSourceMotionExists:(id)a53 bundleSourceBooksExists:(uint64_t)a54 bundleSourceScreenTimeExists:(id)a55 gaPRArray:(uint64_t)a56 bundlePCount:(uint64_t)a57 ranking:(uint64_t)a58 labelConfidenceScore:(uint64_t)a59 timeCorrelationScore:(uint64_t)a60 callDuration:(uint64_t)a61 interactionCount:(uint64_t)a62 interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:
{
  unsigned int v86 = a8;
  uint64_t v85 = a7;
  LODWORD(v68) = a44;
  LODWORD(v67) = a37;
  LODWORD(v66) = a32;
  LODWORD(v65) = a29;
  LODWORD(v64) = a22;
  LODWORD(v63) = a17;
  uint64_t v80 = MEMORY[0x1E4F1CBF0];
  uint64_t v79 = MEMORY[0x1E4F1CBF0];
  uint64_t v76 = MEMORY[0x1E4F1CBF0];
  uint64_t v77 = MEMORY[0x1E4F1CBF0];
  uint64_t v73 = MEMORY[0x1E4F1CBF0];
  uint64_t v74 = MEMORY[0x1E4F1CBF0];
  uint64_t v75 = 0;
  uint64_t v78 = 0;
  uint64_t v72 = 0;
  int v71 = 0;
  uint64_t v70 = 0;
  long long v69 = 0u;
  long long v84 = 0u;
  long long v83 = 0u;
  long long v82 = 0u;
  long long v81 = 0u;
  return objc_msgSend(a1, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:",
           a3,
           a4,
           a5,
           a6,
           a7,
           a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           v63,
           a18,
           a19,
           a20,
           a21,
           v64,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           v65,
           a30,
           a31,
           v66,
           a33,
           a34,
           a35,
           a36,
           v67,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           v68,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           0);
}

- (BMMomentsEventDataEventBundle)initWithBundleIdentifier:(id)a3 bundleStartDate:(id)a4 bundleEndDate:(id)a5 bundleCreationDate:(id)a6 bundleExpirationDate:(id)a7 bundleInterfaceType:(int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(id)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(id)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(id)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(int)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(int)a18 bundleEventIDs:(id)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(id)a22 bundleTimeTag:(int)a23 isBundleResourceTypeUnknown:(id)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(id)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(id)a29 bundlEngagement:(int)a30 bundleVersion:(id)a31 rankingVersion:(id)a32
{
  LODWORD(v38) = 0;
  LODWORD(v37) = 0;
  LODWORD(v36) = 0;
  LODWORD(v35) = a30;
  LODWORD(v34) = a23;
  LODWORD(v33) = a18;
  return -[BMMomentsEventDataEventBundle initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:](self, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:", a3, a4, a5,
           a6,
           a7,
           *(void *)&a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           *(void *)&a16,
           v33,
           a19,
           a20,
           a21,
           a22,
           v34,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           v35,
           a31,
           a32,
           v36,
           0,
           0,
           0,
           0,
           v37,
           0,
           0,
           0,
           0,
           0,
           0,
           v38,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E4F1CBF0],
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

@end