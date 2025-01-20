@interface PHAsset
+ (BOOL)_isLibraryScopeExiting:(id)a3;
+ (BOOL)_isLivePhotoWithPhotoIris:(BOOL)a3 hasAdjustments:(BOOL)a4 videoCpDuration:(int64_t)a5 videoCPVisibility:(unsigned __int16)a6 sourceType:(unint64_t)a7;
+ (BOOL)_libraryScopeAssetContributedByCurrentUser:(id)a3;
+ (BOOL)isOriginalKnownUnsupportedFormatForAsset:(id)a3 failureInfo:(id *)a4;
+ (BOOL)isOriginalVideoComplementKnownUnsupportedFormatForAsset:(id)a3 failureInfo:(id *)a4;
+ (BOOL)managedObjectSupportsAdjustments;
+ (BOOL)managedObjectSupportsAllowedForAnalysis;
+ (BOOL)managedObjectSupportsAssetStacks;
+ (BOOL)managedObjectSupportsBursts;
+ (BOOL)managedObjectSupportsContributor;
+ (BOOL)managedObjectSupportsDuplicateVisibilityState;
+ (BOOL)managedObjectSupportsHiddenState;
+ (BOOL)managedObjectSupportsMontage;
+ (BOOL)managedObjectSupportsSavedAssetType;
+ (BOOL)managedObjectSupportsScreenshot;
+ (BOOL)managedObjectSupportsTrashedState;
+ (BOOL)managedObjectSupportsVisibilityState;
+ (Class)propertySetClassForPropertySet:(id)a3;
+ (PHFetchResult)fetchAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetsWithALAssetURLs:(NSArray *)assetURLs options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetsWithBurstIdentifier:(NSString *)burstIdentifier options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetsWithMediaType:(PHAssetMediaType)mediaType options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetsWithOptions:(PHFetchOptions *)options;
+ (PHFetchResult)fetchKeyAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options;
+ (id)_assetFetchResultFromAssets:(id)a3 options:(id)a4;
+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3;
+ (id)_currentTimestampString;
+ (id)_descriptionForMediaSubtype:(unint64_t)a3;
+ (id)_descriptionForVariationSuggestionStates:(unint64_t)a3;
+ (id)_descriptionForVariationSuggestionType:(unint64_t)a3;
+ (id)_fetchRepresentativeAssetInAssetCollection:(id)a3;
+ (id)_imageManagerRequestLoggingQueue;
+ (id)_inq_highestImageManagerRequestIDsObserved;
+ (id)_inq_imageManagerRequestLogsByAssetUUID;
+ (id)_inq_imageManagerRequestMessagesByRequestIDForAssetUUID:(id)a3 requestID:(int64_t)a4;
+ (id)_requestCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 fetchOptions:(id)a6 onlyKey:(BOOL)a7;
+ (id)_transformMediaSubtypeReferences:(id)a3 inComparisonPredicate:(id)a4 options:(id)a5;
+ (id)_unfetchedPropertySetsForAssets:(id)a3 fromPropertySets:(id)a4;
+ (id)composabilityScoresOfAssets:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)corePropertiesToFetch;
+ (id)descriptionForMediaSubtypes:(unint64_t)a3;
+ (id)descriptionForMediaType:(int64_t)a3;
+ (id)descriptionForPlaybackStyle:(int64_t)a3;
+ (id)entityKeyMap;
+ (id)faceWorkerPropertiesToFetch;
+ (id)fetchAllAssetsInYearRepresentedByYearHighlight:(id)a3 options:(id)a4;
+ (id)fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions:(id)a3;
+ (id)fetchAssetsAssociatedWithMomentsOfMemory:(id)a3 options:(id)a4;
+ (id)fetchAssetsCapturedOrEdited:(BOOL)a3 onThisCameraSinceDate:(id)a4 options:(id)a5;
+ (id)fetchAssetsContainingAllPersons:(id)a3 options:(id)a4;
+ (id)fetchAssetsForBehavioralCurationWithOptions:(id)a3;
+ (id)fetchAssetsForComment:(id)a3 options:(id)a4;
+ (id)fetchAssetsForFaceGroups:(id)a3 options:(id)a4;
+ (id)fetchAssetsForFaces:(id)a3 options:(id)a4;
+ (id)fetchAssetsForKeywords:(id)a3 options:(id)a4;
+ (id)fetchAssetsForPTPWithOptions:(id)a3;
+ (id)fetchAssetsForPerson:(id)a3 faceCount:(unint64_t)a4 options:(id)a5;
+ (id)fetchAssetsForPerson:(id)a3 options:(id)a4;
+ (id)fetchAssetsForPersons:(id)a3 options:(id)a4;
+ (id)fetchAssetsForReferences:(id)a3 photoLibrary:(id)a4;
+ (id)fetchAssetsForSearchLookupIdentifier:(id)a3 options:(id)a4;
+ (id)fetchAssetsForStyleablePhotoSuggestionsWithOptions:(id)a3;
+ (id)fetchAssetsFromCameraSinceDate:(id)a3 options:(id)a4;
+ (id)fetchAssetsGroupedByFaceUUIDForFaces:(id)a3;
+ (id)fetchAssetsGroupedByFaceUUIDForFaces:(id)a3 fetchPropertySets:(id)a4;
+ (id)fetchAssetsInAssetCollections:(id)a3 options:(id)a4;
+ (id)fetchAssetsInBoundingBoxWithTopLeftLocation:(id)a3 bottomRightLocation:(id)a4 options:(id)a5;
+ (id)fetchAssetsInImportSessions:(id)a3 options:(id)a4;
+ (id)fetchAssetsInLibraryScope:(id)a3 fromAssets:(id)a4;
+ (id)fetchAssetsInLibraryScope:(id)a3 options:(id)a4;
+ (id)fetchAssetsInPreviewStateInLibraryScope:(id)a3 options:(id)a4;
+ (id)fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions:(id)a3;
+ (id)fetchAssetsInPreviewStateWithSuggestedByClientType:(signed __int16)a3 options:(id)a4;
+ (id)fetchAssetsMatchingAdjustedFingerPrint:(id)a3 photoLibrary:(id)a4;
+ (id)fetchAssetsMatchingMasterFingerPrint:(id)a3 photoLibrary:(id)a4;
+ (id)fetchAssetsThroughGraphEdgesForPerson:(id)a3 options:(id)a4;
+ (id)fetchAssetsWithCloudIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchAssetsWithCurrentUserAsLibraryScopeContributor:(BOOL)a3 inLibraryScope:(id)a4 options:(id)a5;
+ (id)fetchAssetsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)fetchAssetsWithSyndicationIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchAssetsWithSyndicationIdentifiers:(id)a3 options:(id)a4 includeRejected:(BOOL)a5;
+ (id)fetchAssetsWithUUIDs:(id)a3 options:(id)a4;
+ (id)fetchAssetsWithoutOriginalsInAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchCollageAssetsForDayHighlight:(id)a3 options:(id)a4;
+ (id)fetchCuratedAssetsForMomentShareCreationWithAssets:(id)a3 options:(id)a4;
+ (id)fetchCuratedAssetsInAssetCollection:(id)a3;
+ (id)fetchCuratedAssetsInAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchCustomUserAssetsInMemory:(id)a3 options:(id)a4;
+ (id)fetchExclusiveAssetsForSocialGroup:(id)a3 options:(id)a4;
+ (id)fetchExclusiveSocialGroupAssetsForPersons:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)fetchExtendedCuratedAndRepresentativeAssetsAssociatedWithMemory:(id)a3 options:(id)a4;
+ (id)fetchExtendedCuratedAssetsInAssetCollection:(id)a3 options:(id)a4;
+ (id)fetchGuestAssetsInCollectionContainingAsset:(id)a3 options:(id)a4;
+ (id)fetchGuestAssetsWithOptions:(id)a3;
+ (id)fetchInclusiveAssetsForSocialGroup:(id)a3 options:(id)a4;
+ (id)fetchKeyAssetByHighlightUUIDForHighlights:(id)a3 options:(id)a4;
+ (id)fetchKeyAssetByMemoryUUIDForMemories:(id)a3 options:(id)a4;
+ (id)fetchKeyAssetBySuggestionUUIDForSuggestions:(id)a3 options:(id)a4;
+ (id)fetchKeyAssetForEachSuggestion:(id)a3 options:(id)a4;
+ (id)fetchKeyAssetForEachSuggestion:(id)a3 options:(id)a4 useSuggestionsSortOrder:(BOOL)a5;
+ (id)fetchKeyAssetForExtendedSceneIdentifier:(unint64_t)a3 aboveConfidenceThreshold:(double)a4 minimumSceneAnalysisVersion:(signed __int16)a5 options:(id)a6;
+ (id)fetchKeyAssetForPerson:(id)a3 options:(id)a4;
+ (id)fetchKeyAssetForSceneIdentifier:(unsigned int)a3 aboveConfidenceThreshold:(double)a4 minimumSceneAnalysisVersion:(signed __int16)a5 options:(id)a6;
+ (id)fetchKeyAssetForSocialGroup:(id)a3 createIfNeeded:(BOOL)a4 options:(id)a5;
+ (id)fetchKeyAssetForSocialGroup:(id)a3 options:(id)a4;
+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4;
+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4 options:(id)a5;
+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referencePersons:(id)a4;
+ (id)fetchMovieCuratedAssetsInMemory:(id)a3;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchPreviewAssetsForMomentShareCreationWithAssets:(id)a3 options:(id)a4;
+ (id)fetchReducedCuratedAssetsInMemory:(id)a3 options:(id)a4;
+ (id)fetchReferencedAssetsWithOptions:(id)a3;
+ (id)fetchRepresentativeAssetsInAssetCollection:(id)a3;
+ (id)fetchSummaryCurationForHighlight:(id)a3 fetchOptions:(id)a4 allowsOnDemand:(BOOL)a5 error:(id *)a6;
+ (id)fetchSyndicatedAssetsWithOptions:(id)a3;
+ (id)fetchSyndicatedAssetsWithOptions:(id)a3 includeRejected:(BOOL)a4;
+ (id)fetchType;
+ (id)fetchUserCuratedAssetsInMemory:(id)a3;
+ (id)fetchUserCuratedAssetsInMemory:(id)a3 options:(id)a4;
+ (id)fetchVisibleAssetsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)filterPredicateForSavedSyndicationAssetsOnly;
+ (id)filterPredicateForUnsavedSyndicationAssets;
+ (id)filterPredicateToExcludeNoSyndicationAssets;
+ (id)filterPredicateToIncludeOnlyReceivedSyndicatedAssets;
+ (id)identifierCode;
+ (id)imageManagerPropertiesToFetch;
+ (id)internalSortDescriptorsWithCreationDateAscending:(BOOL)a3;
+ (id)locationPropertiesToFetch;
+ (id)managedEntityName;
+ (id)originalUniformTypeIdentifierForAsset:(id)a3;
+ (id)pl_managedAssetsForAssets:(id)a3;
+ (id)predicateForSyndicatedAssetIdentifiers:(id)a3;
+ (id)predicateForSyndicatedAssetIdentifiers:(id)a3 includeRejected:(BOOL)a4;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)propertySetAccessorsByPropertySet;
+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3;
+ (id)quickClassificationFaceAdjustmentVersion;
+ (id)requestCuratedAssetsInAssetCollection:(id)a3 options:(id)a4;
+ (id)requestCuratedAssetsInAssetCollection:(id)a3 referencePersons:(id)a4 options:(id)a5;
+ (id)senderIdentifierByAssetUUIDForAssets:(id)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (int64_t)countOfAssetsWithLocationFromUUIDs:(id)a3 photoLibrary:(id)a4;
+ (unint64_t)_extendedPropertyFetchHintsForPropertySets:(id)a3;
+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3;
+ (void)_batchFetchAdditionalPropertySetsIfNeeded:(id)a3 forAssets:(id)a4;
+ (void)_computeFingerPrintsOfAsset:(id)a3 completionHandler:(id)a4;
+ (void)_inq_recordRequestID:(int64_t)a3;
+ (void)_inq_trimToMostRecentImageManagerMessages;
- (BOOL)_canHandleAdjustmentData:(id)a3 withOptions:(id)a4;
- (BOOL)_isPartOfAvalancheWithKind:(unsigned __int16)a3;
- (BOOL)assetDescriptionWasSet;
- (BOOL)canPerformEditOperation:(PHAssetEditOperation)editOperation;
- (BOOL)canPerformSharingAction;
- (BOOL)canPlayAutoloop;
- (BOOL)canPlayLongExposure;
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayMirror;
- (BOOL)canPlayPhotoIris;
- (BOOL)canUseLocationCoordinateForLocation;
- (BOOL)cloudIsDeletable;
- (BOOL)complete;
- (BOOL)faceAnalysisVersionWasFetched;
- (BOOL)hasAdjustments;
- (BOOL)hasContentEqualTo:(id)a3;
- (BOOL)hasEditableDepth;
- (BOOL)hasKeywords;
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)hasPhotoColorAdjustments;
- (BOOL)hasPhotoStreamTagID;
- (BOOL)hasSpatialAudio;
- (BOOL)is60PlusFPS;
- (BOOL)isAnimatedGIF;
- (BOOL)isAudio;
- (BOOL)isCinematicVideo;
- (BOOL)isCloudPhotoLibraryAsset;
- (BOOL)isCloudPlaceholder;
- (BOOL)isCloudSharedAsset;
- (BOOL)isDeleted;
- (BOOL)isFavorite;
- (BOOL)isGuestAsset;
- (BOOL)isHDR;
- (BOOL)isHDRVideo;
- (BOOL)isHDVideo;
- (BOOL)isHEICSequence;
- (BOOL)isHEIF;
- (BOOL)isHidden;
- (BOOL)isHighFrameRateVideo;
- (BOOL)isInFlight;
- (BOOL)isIncludedInCloudFeeds;
- (BOOL)isIncludedInMoments;
- (BOOL)isIncompleteLivePhotoMissingVideoComplement;
- (BOOL)isJPEG;
- (BOOL)isJPEG2000;
- (BOOL)isLocalVideoKeyFrameValid;
- (BOOL)isLocatedAtCoordinates:(CLLocationCoordinate2D)a3;
- (BOOL)isLoopingVideo;
- (BOOL)isMediaSubtype:(unint64_t)a3;
- (BOOL)isMomentSharedAsset;
- (BOOL)isOffline;
- (BOOL)isOriginalRaw;
- (BOOL)isOriginalSRGB;
- (BOOL)isPDF;
- (BOOL)isPNG;
- (BOOL)isPSD;
- (BOOL)isPartOfBurst;
- (BOOL)isPhoto;
- (BOOL)isPhotoIris;
- (BOOL)isPhotoIrisPlaceholder;
- (BOOL)isPhotoStreamPhoto;
- (BOOL)isPrimaryImageFormat;
- (BOOL)isProRes;
- (BOOL)isRAW;
- (BOOL)isRAWPlusJPEG;
- (BOOL)isRecoveredAsset;
- (BOOL)isReferencedAsset;
- (BOOL)isScreenRecording;
- (BOOL)isSpatialMedia;
- (BOOL)isSpatialPresentation;
- (BOOL)isStreamedVideo;
- (BOOL)isStyleable;
- (BOOL)isSyncFailureHidden;
- (BOOL)isSyndicatedAssetSavedToUserLibrary;
- (BOOL)isTIFF;
- (BOOL)isTimelapsePlaceholder;
- (BOOL)isTrashed;
- (BOOL)isVariationSuggestionStatesUnknown;
- (BOOL)isVideo;
- (BOOL)isWalrusEnabled;
- (BOOL)needsDeferredProcessing;
- (BOOL)participatesInLibraryScope;
- (BOOL)representsBurst;
- (BOOL)shouldUseRAWResourceAsUnadjustedEditBase;
- (BOOL)shouldUseRAWResourceWithOriginalResourceChoice:(unint64_t)a3;
- (CGRect)acceptableCropRect;
- (CGRect)normalizedFaceAreaRect;
- (CGRect)originalFaceAreaRect;
- (CGRect)preferredCropRect;
- (CGRect)suggestedCropForAspectRatio:(double)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5;
- (CGSize)imageSize;
- (CGSize)originalImageSize;
- (CGSize)originalUnorientedSize;
- (CGSize)unorientedSize;
- (CLLocation)location;
- (CLLocationCoordinate2D)locationCoordinate;
- (Class)changeRequestClass;
- (NSArray)faceRegions;
- (NSData)distanceIdentity;
- (NSData)imageRequestHints;
- (NSData)locationData;
- (NSDate)adjustmentTimestamp;
- (NSDate)analysisStateModificationDate;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSDate)modificationDate;
- (NSDate)trashedDate;
- (NSManagedObjectContext)managedObjectContextForFetchingResources;
- (NSNumber)hdrGain;
- (NSNumber)livePhotoSRLCompensationAmount;
- (NSSet)allSceneClassifications;
- (NSSet)sceneClassifications;
- (NSSet)temporalSceneClassifications;
- (NSString)adjustmentFormatIdentifier;
- (NSString)burstIdentifier;
- (NSString)cloudIdentifier;
- (NSString)croppingDebugDescription;
- (NSString)description;
- (NSString)directory;
- (NSString)filename;
- (NSString)metadataDebugDescription;
- (NSString)originalColorSpace;
- (NSString)originalFilename;
- (NSString)resourcesDebugDescription;
- (NSString)syndicatedAppDisplayName;
- (NSString)thumbnailIdentifier;
- (NSString)title;
- (NSString)uniformTypeIdentifier;
- (NSString)variationSuggestionStatesDetails;
- (NSTimeInterval)duration;
- (NSUInteger)pixelHeight;
- (NSUInteger)pixelWidth;
- (NSURL)ALAssetURL;
- (NSValue)originalFaceAreaRectValue;
- (PHAsset)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (PHAssetBurstSelectionType)burstSelectionTypes;
- (PHAssetMediaSubtype)mediaSubtypes;
- (PHAssetMediaType)mediaType;
- (PHAssetPhotosSmartStyleExtendedProperties)fetchSmartStyleExtendedProperties;
- (PHAssetPlaybackStyle)playbackStyle;
- (PHAssetSourceType)sourceType;
- (PHContentEditingInputRequestID)requestContentEditingInputWithOptions:(PHContentEditingInputRequestOptions *)options completionHandler:(void *)completionHandler;
- (double)aspectRatio;
- (double)curationScore;
- (double)faceAreaMaxX;
- (double)faceAreaMaxY;
- (double)faceAreaMinX;
- (double)faceAreaMinY;
- (double)highlightPromotionScore;
- (double)highlightVisibilityScore;
- (float)overallAestheticScore;
- (id)StoryPlaybackProperties;
- (id)__dictionaryWithContentsOfData:(id)a3;
- (id)_createAnalysisStatePropertyObject;
- (id)_createCommentPropertyObject;
- (id)_createKeywordPropertyObject;
- (id)_createPropertyObjectOfClass:(Class)a3;
- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4;
- (id)_imageRequestOptionsForBaseVersion:(int64_t)a3 options:(id)a4 progressEstimateForImageProgress:(id)a5;
- (id)_sceneClassificationsWithPredicate:(id)a3;
- (id)_uncachedLocation;
- (id)_unfetchedPropertySetsFromPropertySets:(id)a3;
- (id)_videoRequestOptionsForBaseVersion:(int64_t)a3 options:(id)a4 progressEstimateForVideoProgress:(id)a5;
- (id)adjustmentProperties;
- (id)adjustmentVersion;
- (id)adjustmentsDebugMetadata;
- (id)aestheticProperties;
- (id)assetAnalysisStateProperties;
- (id)assetUserActivityProperties;
- (id)cameraCaptureDeviceProperties;
- (id)characterRecognitionProperties;
- (id)cloudAssetGUID;
- (id)cloudLocalStateProperties;
- (id)cloudSharedProperties;
- (id)coarseLocationProperties;
- (id)commentProperties;
- (id)creationDateAdjustedForTimeZone;
- (id)curationProperties;
- (id)descriptionForAestheticsWithManagedAsset:(id)a3;
- (id)descriptionForMediaAnalysisWithManagedAsset:(id)a3;
- (id)descriptionForPhotoAnanlysisWallpaperProeprtiesWithManagedAsset:(id)a3;
- (id)descriptionProperties;
- (id)destinationAssetCopyProperties;
- (id)detailedDebugDescriptionInLibrary:(id)a3;
- (id)evaluationDebugMetadata;
- (id)faceAdjustmentVersion;
- (id)fileURLForFullsizeRenderImage;
- (id)fileURLForVideoComplementFile;
- (id)fileURLsForDiagnosticFiles;
- (id)gatingDebugMetadata;
- (id)gridMetadataProperties;
- (id)iconicScoreProperties;
- (id)importProperties;
- (id)keywordProperties;
- (id)libraryID;
- (id)libraryScopeProperties;
- (id)localDateProperties;
- (id)locationDataProperties;
- (id)mainFileURL;
- (id)managedAssetForPhotoLibrary:(id)a3;
- (id)mediaAnalysisProperties;
- (id)messagesForRecentImageManagerRequests;
- (id)montageProperties;
- (id)objectReference;
- (id)originalAVAssetCommonMetadata;
- (id)originalAVAssetOrProxy;
- (id)originalCreationDateWithTimeZone:(id *)a3;
- (id)originalImageProperties;
- (id)originalMetadataProperties;
- (id)originalUTI;
- (id)pathForAdjustmentDataFile;
- (id)pathForAdjustmentFile;
- (id)pathForOriginalFile;
- (id)photoAnalysisWallpaperProperties;
- (id)photoIrisProperties;
- (id)photosInfoPanelExtendedProperties;
- (id)photosInfoPanelLocationProperties;
- (id)photosOneUpProperties;
- (id)photosSmartStyleExtendedProperties;
- (id)pl_managedAsset;
- (id)pl_managedAssetFromPhotoLibrary:(id)a3;
- (id)pl_photoLibrary;
- (id)ptpProperties;
- (id)sceneAnalysisProperties;
- (id)sceneClassificationsOfTypes:(id)a3;
- (id)sceneprintProperties;
- (id)spatialMediaProperties;
- (id)visualSearchProperties;
- (id)wallpaperCroppingDebugKeyValuePairs;
- (int)analysisStateForWorkerType:(signed __int16)a3 outLastIgnoreDate:(id *)a4 outIgnoreUntilDate:(id *)a5;
- (int)avalanchePickType;
- (int)exifOrientation;
- (int)orientation;
- (int64_t)RAWBadgeAttributes;
- (int64_t)_baseVersionForAdjustmentData:(id)a3 canHandleAdjustmentData:(BOOL)a4;
- (int64_t)cloudPlaceholderKind;
- (int64_t)cloudSharedAssetPlaceholderKind;
- (int64_t)creationDateSource;
- (int64_t)imageOrientation;
- (int64_t)originalImageOrientation;
- (int64_t)syndicationEligibility;
- (int64_t)videoCpDurationValue;
- (signed)assetSource;
- (signed)currentSmartStyleCast;
- (signed)faceAnalysisVersion;
- (signed)generativeMemoryCreationEligibilityState;
- (signed)kind;
- (signed)kindSubtype;
- (signed)savedAssetType;
- (unint64_t)contentChangeFromAsset:(id)a3;
- (unint64_t)effectiveThumbnailIndex;
- (unint64_t)originalChoiceToFallbackForUnsupportRAW;
- (unint64_t)originalResourceChoice;
- (unint64_t)persistenceState;
- (unint64_t)thumbnailIndex;
- (unint64_t)variationSuggestionStatesForVariationType:(unint64_t)a3;
- (unsigned)adjustmentsState;
- (unsigned)avalancheKind;
- (unsigned)bundleScope;
- (unsigned)deferredProcessingNeeded;
- (unsigned)playbackVariation;
- (unsigned)syndicationState;
- (unsigned)videoCpVisibilityState;
- (unsigned)videoDeferredProcessingNeeded;
- (void)_attachPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4;
- (void)_createExtendedPropertySetsIfNeededWithPropertyHint:(unint64_t)a3 fetchDictionary:(id)a4;
- (void)_initializeCachedLocation;
- (void)_invalidateCachedLocation;
- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4;
- (void)_requestRenderedVideoForVideoURL:(id)a3 adjustmentData:(id)a4 canHandleAdjustmentData:(BOOL)a5 resultHandler:(id)a6;
- (void)_setupAdjustmentAndDeferredProcessingAttributesFromFetchDictionary:(id)a3;
- (void)_setupAnalysisScoreAttributesFromFetchDictionary:(id)a3;
- (void)_setupAuxiliaryIdentifierAttributesFromFetchDictionary:(id)a3;
- (void)_setupBadgeAttributesFromFetchDictionary:(id)a3;
- (void)_setupFaceAttributesFromFetchDictionary:(id)a3;
- (void)_setupFileSystemAttributesFromFetchDictionary:(id)a3;
- (void)_setupGeometryAttributesFromFetchDictionary:(id)a3;
- (void)_setupHDRAndDepthMediaSubtypesFromFetchDictionary:(id)a3;
- (void)_setupKindSubtypeFromFetchDictionary:(id)a3;
- (void)_setupLocationAndCreationDateAttributesFromFetchDictionary:(id)a3;
- (void)_setupSmartStyleFromFetchDictionary:(id)a3;
- (void)_setupSpatialTypeFromFetchDictionary:(id)a3;
- (void)_setupTypeAndPersistenceStateAttributesFromFetchDictionary:(id)a3;
- (void)_setupUIStateAndTrashAttributesFromFetchDictionary:(id)a3;
- (void)cancelContentEditingInputRequest:(PHContentEditingInputRequestID)requestID;
- (void)generateLargeThumbnailFileIfNecessary;
- (void)getFingerPrintForAssetType:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)getMasterFingerPrintWithCompletionHandler:(id)a3;
- (void)recordImageManagerMessageForRequestID:(int)a3 message:(id)a4;
- (void)setAssetDescriptionWasSet:(BOOL)a3;
- (void)setCanUseLocationCoordinateForLocation:(BOOL)a3;
@end

@implementation PHAsset

- (void)_setupTypeAndPersistenceStateAttributesFromFetchDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kind"];
  unsigned int v6 = [v5 shortValue];

  if (v6 < 3) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  self->_mediaType = v7;
  v8 = [v4 objectForKeyedSubscript:@"uniformTypeIdentifier"];
  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  self->_uniformTypeIdentifier = v8;

  v10 = [v4 objectForKeyedSubscript:@"savedAssetType"];
  self->_savedAssetType = [v10 shortValue];

  v11 = [v4 objectForKeyedSubscript:@"bundleScope"];
  self->_bundleScope = [v11 shortValue];

  v12 = [v4 objectForKeyedSubscript:@"cloudPlaceholderKind"];
  self->_cloudPlaceholderKind = (int)[v12 shortValue];

  v13 = [v4 objectForKeyedSubscript:@"complete"];

  self->_complete = [v13 BOOLValue];
  self->_persistenceState = 1;
  [MEMORY[0x1E4F8BA10] maskForCloudSharedAsset];
  if (PLValidatedSavedAssetTypeApplies())
  {
    unint64_t v14 = self->_cloudPlaceholderKind - 3;
    if (v14 >= 5) {
      return;
    }
    unint64_t v15 = self->_persistenceState | qword_19B2CCB48[v14];
  }
  else
  {
    if (!self->_complete) {
      return;
    }
    unint64_t v15 = -1;
  }
  self->_persistenceState = v15;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_21547 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_21547, &__block_literal_global_424);
  }
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21007;
  v9 = __Block_byref_object_dispose__21008;
  id v10 = 0;
  pl_dispatch_sync();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

+ (id)fetchType
{
  v2 = @"PHAsset";
  return @"PHAsset";
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (PHAssetPlaybackStyle)playbackStyle
{
  return self->_playbackStyle;
}

- (BOOL)participatesInLibraryScope
{
  return self->_participatesInLibraryScope;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8A950] entityName];
}

- (BOOL)representsBurst
{
  if (([(PHAsset *)self avalanchePickType] & 0x10) == 0) {
    return 0;
  }

  return [(PHAsset *)self isPartOfBurst];
}

- (PHAsset)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PHAsset;
  v9 = [(PHObject *)&v35 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  id v10 = v9;
  if (v9)
  {
    if ((a4 & 6) == 4)
    {
      [(PHAsset *)v9 _setupLocationAndCreationDateAttributesFromFetchDictionary:v8];
    }
    else
    {
      v11 = [v8 objectForKeyedSubscript:@"avalanchePickType"];
      v10->_avalanchePickType = [v11 intValue];

      v12 = [v8 objectForKeyedSubscript:@"avalancheKind"];
      v10->_avalancheKind = [v12 intValue];

      v13 = [v8 objectForKeyedSubscript:@"thumbnailIndex"];
      int v14 = [v13 intValue];

      BOOL v15 = v14 > *MEMORY[0x1E4F8ADE8] || v14 < *MEMORY[0x1E4F8ADE0];
      uint64_t v16 = v14;
      if (v15) {
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v10->_thumbnailIndex = v16;
      v17 = [v8 objectForKeyedSubscript:@"duration"];
      [v17 doubleValue];
      v10->_duration = v18;

      v19 = [v8 objectForKeyedSubscript:@"videoCpDurationValue"];
      v10->_videoCpDurationValue = [v19 integerValue];

      v20 = [v8 objectForKeyedSubscript:@"videoCpVisibilityState"];
      v10->_videoCpVisibilityState = [v20 integerValue];

      v21 = [v8 objectForKeyedSubscript:@"playbackStyle"];
      v10->_playbackStyle = (int)[v21 shortValue];

      v22 = [v8 objectForKeyedSubscript:@"playbackVariation"];
      v10->_playbackVariation = [v22 shortValue];

      uint64_t v23 = [v8 objectForKeyedSubscript:@"modificationDate"];
      modificationDate = v10->_modificationDate;
      v10->_modificationDate = (NSDate *)v23;

      v25 = [v8 objectForKeyedSubscript:@"cloudIsDeletable"];
      v10->_cloudIsDeletable = [v25 BOOLValue];

      uint64_t v26 = [v8 objectForKeyedSubscript:@"originalColorSpace"];
      originalColorSpace = v10->_originalColorSpace;
      v10->_originalColorSpace = (NSString *)v26;

      uint64_t v28 = [v8 objectForKeyedSubscript:@"imageRequestHints"];
      imageRequestHints = v10->_imageRequestHints;
      v10->_imageRequestHints = (NSData *)v28;

      v30 = [v8 objectForKeyedSubscript:@"generativeMemoryCreationEligibilityState"];
      v10->_generativeMemoryCreationEligibilityState = [v30 intValue];

      uint64_t v31 = [v8 objectForKeyedSubscript:@"locationData"];
      locationData = v10->_locationData;
      v10->_locationData = (NSData *)v31;

      [(PHAsset *)v10 _setupLocationAndCreationDateAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupAuxiliaryIdentifierAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupFileSystemAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupUIStateAndTrashAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupAdjustmentAndDeferredProcessingAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupTypeAndPersistenceStateAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupGeometryAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupFaceAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupKindSubtypeFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupSpatialTypeFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupHDRAndDepthMediaSubtypesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupAnalysisScoreAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupBadgeAttributesFromFetchDictionary:v8];
      [(PHAsset *)v10 _setupSmartStyleFromFetchDictionary:v8];
      [(PHAsset *)v10 _createExtendedPropertySetsIfNeededWithPropertyHint:a4 fetchDictionary:v8];
      if (v10->_mediaType == 1 && ![(PHAsset *)v10 isMediaSubtype:8] && v10->_playbackStyle == 3) {
        v10->_playbackStyle = 1;
      }
    }
    v33 = v10;
  }

  return v10;
}

- (void)_setupLocationAndCreationDateAttributesFromFetchDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"dateCreated"];
  creationDate = self->_creationDate;
  self->_creationDate = v5;

  id v11 = [v4 objectForKeyedSubscript:@"latitude"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"longitude"];

  if (v11 && v7)
  {
    [v11 doubleValue];
    CLLocationDegrees v9 = v8;
    [v7 doubleValue];
    self->_locationCoordinate = CLLocationCoordinate2DMake(v9, v10);
  }
  else
  {
    self->_locationCoordinate = (CLLocationCoordinate2D)*MEMORY[0x1E4F1E750];
  }
  [(PHAsset *)self _initializeCachedLocation];
}

- (void)_setupAuxiliaryIdentifierAttributesFromFetchDictionary:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(PHAsset *)self isPartOfBurst];
  if (v4)
  {
    uint64_t v5 = [v7 objectForKeyedSubscript:@"avalancheUUID"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_storeStrong((id *)&self->_burstIdentifier, v5);
  if (v4) {

  }
  unsigned int v6 = [v7 objectForKeyedSubscript:@"cloudAssetGUID"];
  if ([v6 length]) {
    objc_storeStrong((id *)&self->_cloudAssetGUID, v6);
  }
}

- (void)_initializeCachedLocation
{
  id v3 = objc_initWeak(&location, self);

  id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PHAsset__initializeCachedLocation__block_invoke;
  v7[3] = &unk_1E5847760;
  objc_copyWeak(&v8, &location);
  uint64_t v5 = (PLLazyObject *)[v4 initWithRetriableBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  lazyCachedLocation = self->_lazyCachedLocation;
  self->_lazyCachedLocation = v5;
}

- (BOOL)isPartOfBurst
{
  return [(PHAsset *)self _isPartOfAvalancheWithKind:1];
}

- (void)_setupUIStateAndTrashAttributesFromFetchDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"favorite"];
  self->_favorite = [v5 BOOLValue];

  unsigned int v6 = [v4 objectForKeyedSubscript:@"hidden"];
  self->_hidden = [v6 BOOLValue];

  id v7 = [v4 objectForKeyedSubscript:@"trashedState"];
  self->_trashed = [v7 intValue] != 0;

  id v8 = [v4 objectForKeyedSubscript:@"trashedDate"];

  trashedDate = self->_trashedDate;
  self->_trashedDate = v8;
}

- (void)_setupSpatialTypeFromFetchDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"spatialType"];
  int v5 = [v4 shortValue];

  if ((v5 - 1) <= 1) {
    self->_mediaSubtypes |= 0x400uLL;
  }
}

- (void)_setupSmartStyleFromFetchDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"currentSleetCast"];
  int v5 = [v4 shortValue];

  if (v5 >= 1 && (unsigned __int16)self->_currentSmartStyleCast != (unsigned __int16)v5) {
    self->_currentSmartStyleCast = v5;
  }
}

- (void)_setupKindSubtypeFromFetchDictionary:(id)a3
{
  id v9 = a3;
  id v4 = [v9 objectForKeyedSubscript:@"kindSubtype"];
  int v5 = [v4 shortValue];

  if (v5 > 9)
  {
    switch(v5)
    {
      case 'd':
        unint64_t v6 = 0x10000;
        goto LABEL_18;
      case 'e':
        id v7 = [v9 objectForKeyedSubscript:@"highFrameRateState"];
        char v8 = [v7 integerValue];

        if ((v8 & 2) == 0) {
          goto LABEL_19;
        }
        unint64_t v6 = 0x20000;
        break;
      case 'f':
        unint64_t v6 = 0x40000;
        goto LABEL_18;
      case 'g':
        unint64_t v6 = 0x80000;
        goto LABEL_18;
      case 'h':
        unint64_t v6 = 0x400000;
        goto LABEL_18;
      default:
        if (v5 != 10) {
          goto LABEL_19;
        }
        unint64_t v6 = 4;
        break;
    }
    goto LABEL_18;
  }
  switch(v5)
  {
    case 0:
      unint64_t v6 = 0;
      goto LABEL_18;
    case 1:
      unint64_t v6 = 1;
      goto LABEL_18;
    case 2:
      self->_isPhotoIris = 1;
      if (objc_msgSend((id)objc_opt_class(), "_isLivePhotoWithPhotoIris:hasAdjustments:videoCpDuration:videoCPVisibility:sourceType:", self->_isPhotoIris, -[PHAsset hasAdjustments](self, "hasAdjustments"), self->_videoCpDurationValue, self->_videoCpVisibilityState, -[PHAsset sourceType](self, "sourceType")))
      {
        unint64_t v6 = 8;
LABEL_18:
        self->_mediaSubtypes = v6;
      }
      break;
  }
LABEL_19:
}

- (void)_setupHDRAndDepthMediaSubtypesFromFetchDictionary:(id)a3
{
  id v18 = a3;
  id v4 = [v18 objectForKeyedSubscript:@"hdrType"];
  int v5 = [v4 shortValue];

  int64_t mediaType = self->_mediaType;
  if (mediaType != 2)
  {
    id v7 = v18;
    if (mediaType != 1) {
      goto LABEL_19;
    }
    if ((unsigned __int16)v5 - 2 < 2)
    {
      self->_mediaSubtypes |= 2uLL;
      if (v5 != 10) {
        goto LABEL_5;
      }
    }
    else if ((unsigned __int16)v5 != 10)
    {
LABEL_5:
      if ((unsigned __int16)v5 != 11) {
        goto LABEL_14;
      }
      uint64_t v8 = 0x800000;
LABEL_13:
      self->_mediaSubtypes |= v8;
LABEL_14:
      v12 = [v18 objectForKeyedSubscript:@"depthType"];
      int v13 = [v12 unsignedShortValue];

      if (v13 == 1) {
        self->_mediaSubtypes |= 0x10uLL;
      }
      int v14 = [v18 objectForKeyedSubscript:@"playbackStyle"];
      int v15 = [v14 shortValue];

      id v7 = v18;
      if (v15 == 2)
      {
        uint64_t v11 = 64;
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    uint64_t v8 = 512;
    goto LABEL_13;
  }
  if (v5 == 5) {
    self->_mediaSubtypes |= 0x100000uLL;
  }
  id v9 = [v18 objectForKeyedSubscript:@"depthType"];
  int v10 = [v9 unsignedShortValue];

  id v7 = v18;
  if (v10 == 2)
  {
    uint64_t v11 = 0x200000;
LABEL_18:
    self->_mediaSubtypes |= v11;
  }
LABEL_19:
  uint64_t v16 = [v7 objectForKeyedSubscript:@"hdrGain"];
  hdrGain = self->_hdrGain;
  self->_hdrGain = v16;
}

- (void)_setupGeometryAttributesFromFetchDictionary:(id)a3
{
  id v13 = a3;
  id v4 = [v13 objectForKeyedSubscript:@"height"];
  self->_pixelHeight = [v4 unsignedIntegerValue];

  int v5 = [v13 objectForKeyedSubscript:@"width"];
  self->_pixelWidth = [v5 unsignedIntegerValue];

  unint64_t v6 = [v13 objectForKeyedSubscript:@"orientation"];
  self->_exifOrientation = [v6 intValue];

  id v7 = [v13 objectForKeyedSubscript:@"packedPreferredCropRect"];
  uint64_t v8 = [v7 longLongValue];

  if (v8)
  {
    PLSplitToCGRectFromInt64();
  }
  else
  {
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_preferredCropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_preferredCropRect.size = v9;
  }
  int v10 = [v13 objectForKeyedSubscript:@"packedAcceptableCropRect"];
  uint64_t v11 = [v10 longLongValue];

  if (v11)
  {
    PLSplitToCGRectFromInt64();
  }
  else
  {
    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_acceptableCropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_acceptableCropRect.size = v12;
  }
}

- (void)_setupFileSystemAttributesFromFetchDictionary:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"directory"];
  directory = self->_directory;
  self->_directory = v5;

  id v7 = [v4 objectForKeyedSubscript:@"filename"];

  filename = self->_filename;
  self->_filename = v7;
}

- (void)_setupFaceAttributesFromFetchDictionary:(id)a3
{
  id v12 = a3;
  if (PLPlatformEagerlyFetchFaceRegions())
  {
    id v4 = [v12 objectForKeyedSubscript:@"additionalAttributes.faceRegions"];
    PLManagedAssetDecodeFaceRegions();
    int v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    faceRegions = self->_faceRegions;
    self->_faceRegions = v5;
  }
  id v7 = [v12 objectForKeyedSubscript:@"faceAdjustmentVersion"];
  id faceAdjustmentVersion = self->_faceAdjustmentVersion;
  self->_id faceAdjustmentVersion = v7;

  CGSize v9 = [v12 objectForKeyedSubscript:@"additionalAttributes.faceAnalysisVersion"];
  self->_faceAnalysisVersion = [v9 intValue];

  int v10 = [v12 objectForKeyedSubscript:@"faceAreaPoints"];
  uint64_t v11 = [v10 longLongValue];

  if ((v11 & 0x8000000000000000) == 0) {
    PLSplitToDoubleFromInt64();
  }
}

- (void)_setupBadgeAttributesFromFetchDictionary:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"packedBadgeAttributes"];
  self->_packedBadgeAttributes = [v5 intValue];

  unint64_t v6 = [v4 objectForKeyedSubscript:@"syndicationState"];
  self->_syndicationState = [v6 unsignedShortValue];

  id v7 = [v4 objectForKeyedSubscript:@"activeLibraryScopeParticipationState"];

  self->_participatesInLibraryScope = [v7 integerValue] == 1;
}

- (void)_setupAnalysisScoreAttributesFromFetchDictionary:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"curationScore"];
  [v5 doubleValue];
  self->_curationScore = v6;

  id v7 = [v4 objectForKeyedSubscript:@"overallAestheticScore"];
  [v7 floatValue];
  self->_overallAestheticScore = v8;

  id v10 = [v4 objectForKeyedSubscript:@"highlightVisibilityScore"];

  [v10 doubleValue];
  self->_highlightVisibilityScore = v9;
}

- (void)_setupAdjustmentAndDeferredProcessingAttributesFromFetchDictionary:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"adjustmentTimestamp"];
  adjustmentTimestamp = self->_adjustmentTimestamp;
  self->_adjustmentTimestamp = v5;

  id v7 = [v4 objectForKeyedSubscript:@"adjustmentsState"];
  self->_adjustmentsState = [v7 unsignedShortValue];

  float v8 = [v4 objectForKeyedSubscript:@"deferredProcessingNeeded"];
  self->_deferredProcessingNeeded = [v8 intValue];

  id v9 = [v4 objectForKeyedSubscript:@"videoDeferredProcessingNeeded"];

  self->_videoDeferredProcessingNeeded = [v9 intValue];
}

- (BOOL)_isPartOfAvalancheWithKind:(unsigned __int16)a3
{
  int v3 = a3;
  int v5 = [(PHAsset *)self avalanchePickType];
  if (v5) {
    LOBYTE(v5) = [(PHAsset *)self avalancheKind] == v3;
  }
  return v5;
}

- (int)avalanchePickType
{
  return self->_avalanchePickType;
}

- (void)_createExtendedPropertySetsIfNeededWithPropertyHint:(unint64_t)a3 fetchDictionary:(id)a4
{
  id v6 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFD78) == 0) {
    goto LABEL_37;
  }
  id v7 = v6;
  if ((a3 & 0x4000000) != 0)
  {
    [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v6];
    if ((a3 & 8) == 0)
    {
LABEL_4:
      if ((a3 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_42;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_4;
  }
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x10) == 0)
  {
LABEL_5:
    if ((a3 & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x200000) == 0)
  {
LABEL_6:
    if ((a3 & 0x100000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x100000) == 0)
  {
LABEL_7:
    if ((a3 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x1000000) == 0)
  {
LABEL_8:
    if ((a3 & 0x8000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x8000000000) == 0)
  {
LABEL_9:
    if ((a3 & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x10000000) == 0)
  {
LABEL_10:
    if ((a3 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x20) == 0)
  {
LABEL_11:
    if ((a3 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x40) == 0)
  {
LABEL_12:
    if ((a3 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x400) == 0)
  {
LABEL_13:
    if ((a3 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x100) == 0)
  {
LABEL_14:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x2000) == 0)
  {
LABEL_15:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x4000) == 0)
  {
LABEL_16:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x8000) == 0)
  {
LABEL_17:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x10000) == 0)
  {
LABEL_18:
    if ((a3 & 0x200000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x200000000) == 0)
  {
LABEL_19:
    if ((a3 & 0x8000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_57;
  }
LABEL_56:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x8000000) == 0)
  {
LABEL_20:
    if ((a3 & 0x40000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_58;
  }
LABEL_57:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x40000000) == 0)
  {
LABEL_21:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_59;
  }
LABEL_58:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x20000) == 0)
  {
LABEL_22:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_60;
  }
LABEL_59:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x40000) == 0)
  {
LABEL_23:
    if ((a3 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_61;
  }
LABEL_60:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x80000) == 0)
  {
LABEL_24:
    if ((a3 & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_62;
  }
LABEL_61:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x800000) == 0)
  {
LABEL_25:
    if ((a3 & 0x2000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_63;
  }
LABEL_62:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x2000000) == 0)
  {
LABEL_26:
    if ((a3 & 0x20000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_63:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x20000000) != 0) {
LABEL_27:
  }
    [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
LABEL_28:
  if (a3 >= 0xFFFFFFFF80000000)
  {
    [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  }
  else if ((a3 & 0x100000000) == 0)
  {
    if ((a3 & 0x400000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x400000000) == 0)
  {
LABEL_31:
    if ((a3 & 0x2000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_67:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x2000000000) == 0)
  {
LABEL_32:
    if ((a3 & 0x800000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_69;
  }
LABEL_68:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x800000000) == 0)
  {
LABEL_33:
    if ((a3 & 0x4000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_69:
  [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
  if ((a3 & 0x4000000000) != 0) {
LABEL_34:
  }
    [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
LABEL_35:
  id v6 = v7;
  if ((a3 & 0x10000000000) != 0)
  {
    [(PHAsset *)self _attachPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v7];
    id v6 = v7;
  }
LABEL_37:
}

- (BOOL)isMediaSubtype:(unint64_t)a3
{
  if ((a3 & 0x400) != 0)
  {
    int v5 = [(PHAsset *)self spatialMediaProperties];
    int v6 = [v5 spatialMediaType];

    if ((unsigned __int16)(v6 - 1) > 1u)
    {
      if (!v6)
      {
        unint64_t mediaSubtypes = self->_mediaSubtypes;
        if ((mediaSubtypes & 0x400) != 0) {
          self->_unint64_t mediaSubtypes = mediaSubtypes & 0xFFFFFFFFFFFFFBFFLL;
        }
      }
    }
    else
    {
      unint64_t v7 = self->_mediaSubtypes;
      if ((v7 & 0x400) == 0) {
        self->_unint64_t mediaSubtypes = v7 | 0x400;
      }
    }
  }
  return (a3 & ~self->_mediaSubtypes) == 0;
}

- (void)_attachPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  id v8 = a4;
  int v6 = (void *)MEMORY[0x19F389B10]();
  id v7 = [(PHAsset *)self _createPropertyObjectOfClass:a3 preFetchedProperties:v8];
}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v45 = a4;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__21007;
  v64 = __Block_byref_object_dispose__21008;
  Class aClass = a3;
  ph_objc_getAssociatedObject(self, a3);
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  int v6 = (void *)v61[5];
  if (!v6)
  {
    if (v45)
    {
      uint64_t v7 = [[a3 alloc] initWithFetchDictionary:v45 asset:self prefetched:1];
      id v8 = (id)v61[5];
      v61[5] = v7;
LABEL_26:

      uint64_t v31 = ph_objc_setAssociatedObjectIfNotSet(self, aClass, (void *)v61[5]);
      v32 = (void *)v61[5];
      v61[5] = v31;

      int v6 = (void *)v61[5];
      goto LABEL_27;
    }
    if ([(objc_class *)a3 inverseIsToMany])
    {
      uint64_t v9 = [MEMORY[0x1E4F8A950] entityName];
      id v10 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v11 = [(PHObject *)self objectID];
      v43 = [v10 predicateWithFormat:@"self == %@", v11];
      v44 = (void *)v9;
    }
    else
    {
      id v12 = [(objc_class *)a3 entityName];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F8A950] entityName];
      }
      v44 = v14;

      uint64_t v11 = [(objc_class *)a3 keyPathToPrimaryObject];
      int v15 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v16 = [(PHObject *)self objectID];
      if (v11) {
        [v15 predicateWithFormat:@"%K == %@", v11, v16];
      }
      else {
      v43 = [v15 predicateWithFormat:@"self == %@", v16];
      }
    }
    v17 = [(objc_class *)a3 propertiesToFetch];
    id v18 = (void *)[v17 mutableCopy];

    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = NSStringFromClass(a3);
        *(_DWORD *)buf = 138412546;
        v68 = v20;
        __int16 v69 = 2112;
        v70 = self;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Missing prefetched properties for %@ on %@. Fetching on demand on the main queue, which may degrade performance.", buf, 0x16u);
      }
    }
    else
    {
      v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = NSStringFromClass(a3);
        *(_DWORD *)buf = 138412546;
        v68 = v21;
        __int16 v69 = 2112;
        v70 = self;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "Missing prefetched properties for %@ on %@. Fetching on demand.", buf, 0x16u);
      }
    }

    if ([(objc_class *)a3 inverseIsToMany])
    {
      [(id)objc_opt_class() extendPropertiesToFetch:v18 withPropertySetClass:a3];
    }
    else if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v22 = [(objc_class *)a3 keyPathToPrimaryObject];
      v42 = v22;
      if (v22)
      {
        uint64_t v23 = [v22 stringByAppendingString:@"."];
      }
      else
      {
        uint64_t v23 = 0;
      }
      [(objc_class *)a3 additionalPropertiesToFetchOnPrimaryObject];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = [v35 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v57 != v37) {
              objc_enumerationMutation(v35);
            }
            id v39 = *(id *)(*((void *)&v56 + 1) + 8 * i);
            if (v23)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                [NSString stringWithFormat:@"Trying to create a property path '%@' on '%@' with an unexpected property type: %@", v39, self, objc_opt_class()];
                id v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
                objc_exception_throw(v41);
              }
              uint64_t v40 = [v23 stringByAppendingString:v39];

              id v39 = (id)v40;
            }
            if ([v18 indexOfObject:v39] == 0x7FFFFFFFFFFFFFFFLL) {
              [v18 addObject:v39];
            }
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v36);
      }

      char v24 = 1;
      goto LABEL_25;
    }
    char v24 = 0;
LABEL_25:
    v25 = [(PHObject *)self photoLibrary];
    uint64_t v26 = [(objc_class *)aClass propertySetName];
    v27 = [v25 objectFetchingManagedObjectContextForObject:self propertySet:v26];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __61__PHAsset__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
    v47[3] = &unk_1E5845158;
    id v8 = v44;
    id v48 = v8;
    id v28 = v43;
    id v49 = v28;
    id v29 = v18;
    id v50 = v29;
    id v30 = v27;
    id v51 = v30;
    v52 = self;
    char v55 = v24;
    v53 = &v60;
    Class v54 = aClass;
    [v30 performBlockAndWait:v47];

    goto LABEL_26;
  }
LABEL_27:
  id v33 = v6;
  _Block_object_dispose(&v60, 8);

  return v33;
}

+ (BOOL)_isLivePhotoWithPhotoIris:(BOOL)a3 hasAdjustments:(BOOL)a4 videoCpDuration:(int64_t)a5 videoCPVisibility:(unsigned __int16)a6 sourceType:(unint64_t)a7
{
  uint64_t v7 = a6;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v10 = [MEMORY[0x1E4F8A950] isPhotoIrisPlaceholderWithPhotoIris:a3 videoCpDuration:a5 isCloudShared:a7 == 2 videoCpFilePath:0];
  uint64_t v11 = (void *)MEMORY[0x1E4F8A950];

  return [v11 canPlayPhotoIrisWithPhotoIris:v9 photoIrisPlaceholder:v10 hasAdjustments:v8 videoCpVisibilityState:v7];
}

+ (BOOL)managedObjectSupportsSavedAssetType
{
  return 1;
}

+ (BOOL)managedObjectSupportsDuplicateVisibilityState
{
  return 1;
}

+ (BOOL)managedObjectSupportsVisibilityState
{
  return 1;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsHiddenState
{
  return 1;
}

+ (BOOL)managedObjectSupportsContributor
{
  return 1;
}

+ (BOOL)managedObjectSupportsAllowedForAnalysis
{
  return 1;
}

+ (BOOL)managedObjectSupportsScreenshot
{
  return 1;
}

+ (BOOL)managedObjectSupportsMontage
{
  return 1;
}

+ (BOOL)managedObjectSupportsBursts
{
  return 1;
}

+ (BOOL)managedObjectSupportsAssetStacks
{
  return 1;
}

+ (BOOL)managedObjectSupportsAdjustments
{
  return 1;
}

- (BOOL)isCloudPlaceholder
{
  return ([(PHAsset *)self cloudPlaceholderKind] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (int64_t)cloudPlaceholderKind
{
  return self->_cloudPlaceholderKind;
}

- (unint64_t)effectiveThumbnailIndex
{
  return self->_thumbnailIndex;
}

- (BOOL)complete
{
  return self->_complete;
}

- (CGSize)unorientedSize
{
  [(PHAsset *)self pixelWidth];
  [(PHAsset *)self pixelHeight];
  PLOrientationInverse();

  PLOrientationTransformImageSize();
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSUInteger)pixelWidth
{
  return self->_pixelWidth;
}

- (NSUInteger)pixelHeight
{
  return self->_pixelHeight;
}

- (id)libraryID
{
  v2 = [(PHObject *)self photoLibrary];
  double v3 = [v2 libraryID];

  return v3;
}

- (BOOL)hasAdjustments
{
  return self->_adjustmentsState != 0;
}

- (NSData)imageRequestHints
{
  return self->_imageRequestHints;
}

- (PHAssetMediaSubtype)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)directory
{
  return self->_directory;
}

- (NSNumber)hdrGain
{
  return self->_hdrGain;
}

- (BOOL)isRAWPlusJPEG
{
  return (unint64_t)([(PHAsset *)self RAWBadgeAttributes] - 1) < 2;
}

- (int64_t)RAWBadgeAttributes
{
  return ((unint64_t)self->_packedBadgeAttributes >> 1) & 3;
}

- (unsigned)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (id)adjustmentVersion
{
  double v3 = [(PHAsset *)self adjustmentTimestamp];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PHAsset *)self creationDate];
  }
  int v6 = v5;

  return v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)adjustmentTimestamp
{
  return self->_adjustmentTimestamp;
}

- (BOOL)isVideo
{
  return [(PHAsset *)self mediaType] == PHAssetMediaTypeVideo;
}

- (PHAssetMediaType)mediaType
{
  return self->_mediaType;
}

- (PHAssetSourceType)sourceType
{
  return objc_msgSend(MEMORY[0x1E4F8BA10], "mapSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", -[PHAsset savedAssetType](self, "savedAssetType"), 1, 1, 1, 1, 2, 1, 1, 1, 8, 1, 1, 16, 32, 64, 1,
           4,
           1);
}

- (BOOL)isCloudSharedAsset
{
  [MEMORY[0x1E4F8BA10] maskForCloudSharedAsset];
  [(PHAsset *)self savedAssetType];

  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isGuestAsset
{
  [MEMORY[0x1E4F8BA10] maskForGuestAsset];
  [(PHAsset *)self savedAssetType];

  return PLValidatedSavedAssetTypeApplies();
}

- (signed)savedAssetType
{
  return self->_savedAssetType;
}

+ (id)identifierCode
{
  return @"001";
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

+ (id)fetchKeyAssetForPerson:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 photoLibrary];
  BOOL v8 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v5 photoLibrary:v7];

  BOOL v9 = +[PHQuery queryForKeyAssetForPerson:v6 options:v8];

  uint64_t v10 = [v9 executeQuery];

  return v10;
}

+ (id)fetchCollageAssetsForDayHighlight:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PHAsset_fetchCollageAssetsForDayHighlight_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  BOOL v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

+ (PHFetchResult)fetchKeyAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options
{
  id v5 = assetCollection;
  id v6 = options;
  if (!v5
    || [(PHObject *)v5 isTransient]
    || [(PHAssetCollection *)v5 isPrivacySensitiveAlbum])
  {
    id v7 = 0;
  }
  else
  {
    BOOL v9 = +[PHQuery queryForKeyAssetsInAssetCollection:v5 options:v6];
    id v7 = [v9 executeQuery];
    if (!v7)
    {
      uint64_t v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
      uint64_t v11 = +[PHAssetCollection transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:@"keys" identifier:@"transientkeyassets" photoLibrary:v10];
      id v7 = +[PHAsset fetchAssetsInAssetCollection:v11 options:v6];
    }
  }

  return (PHFetchResult *)v7;
}

+ (PHFetchResult)fetchAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options
{
  id v5 = assetCollection;
  id v6 = options;
  id v7 = v6;
  if (v5)
  {
    id v8 = [(PHFetchOptions *)v6 photoLibrary];

    if (!v8)
    {
      BOOL v9 = [(PHObject *)v5 photoLibrary];
      uint64_t v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v9];

      id v7 = (void *)v10;
    }
    if (![(PHObject *)v5 isTransient]) {
      goto LABEL_17;
    }
    uint64_t v11 = [(PHAssetCollection *)v5 query];
    if (v11)
    {
      id v12 = v11;
      if (v7)
      {
        id v13 = (void *)[v11 copy];

        id v14 = [v13 fetchOptions];
        int v15 = v14;
        if (v14) {
          [v14 mergeWithFetchOptions:v7];
        }
        else {
          [v13 setFetchOptions:v7];
        }
      }
      else
      {
        id v13 = v11;
      }
      uint64_t v16 = [v13 executeQuery];
    }
    else
    {
      uint64_t v17 = [(PHAssetCollection *)v5 assetOids];
      if (v17)
      {
        id v13 = (void *)v17;
        id v18 = [PHManualFetchResult alloc];
        v19 = [v7 photoLibrary];
        v20 = [v7 fetchPropertySetsAsSet];
        uint64_t v16 = [(PHManualFetchResult *)v18 initWithOids:v13 photoLibrary:v19 fetchType:@"PHAsset" fetchPropertySets:v20 identifier:0 registerIfNeeded:1];
      }
      else
      {
        uint64_t v23 = [(PHAssetCollection *)v5 assets];
        char v24 = (void *)v23;
        v25 = (void *)MEMORY[0x1E4F1CBF0];
        if (v23) {
          v25 = (void *)v23;
        }
        id v26 = v25;

        v27 = objc_opt_class();
        id v28 = [v7 fetchPropertySetsAsSet];
        [v27 _batchFetchAdditionalPropertySetsIfNeeded:v28 forAssets:v26];

        id v29 = [PHManualFetchResult alloc];
        id v13 = [v7 photoLibrary];
        id v30 = [v7 fetchPropertySetsAsSet];
        uint64_t v16 = [(PHManualFetchResult *)v29 initWithObjects:v26 photoLibrary:v13 fetchType:@"PHAsset" fetchPropertySets:v30 identifier:0 registerIfNeeded:1];
      }
    }

    if (!v16)
    {
LABEL_17:
      v21 = +[PHQuery queryForAssetsInAssetCollection:v5 options:v7];
      uint64_t v16 = [v21 executeQuery];
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return (PHFetchResult *)v16;
}

+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4 options:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 photoLibrary];

  if (!v11)
  {
    id v12 = [v8 photoLibrary];
    uint64_t v13 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v12];

    id v10 = (id)v13;
  }
  [v10 setIncludeGuestAssets:1];
  if ([v8 assetCollectionType] == 4)
  {
    id v14 = [v8 photoLibrary];
    int v15 = [v14 librarySpecificFetchOptions];

    v28[0] = @"PHAssetPropertySetOriginalMetadata";
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [v15 addFetchPropertySets:v16];

    [v15 mergeWithFetchOptions:v10];
    if ([v8 isTransient]) {
      [v8 queryForKeyAssetWithOptions:v15];
    }
    else {
    v21 = +[PHQuery queryForKeyAssetInMemory:v8 options:v15];
    }
    v20 = [v21 executeQuery];

    goto LABEL_18;
  }
  if ([v8 assetCollectionType] == 6)
  {
    uint64_t v17 = [v8 photoLibrary];
    id v18 = [v17 librarySpecificFetchOptions];

    [v18 mergeWithFetchOptions:v10];
    v19 = +[PHQuery queryForKeyAssetInPhotosHighlight:v8 options:v18];
    v20 = [v19 executeQuery];
  }
  else
  {
    if ([v8 assetCollectionType] != 5
      || ([v8 highlightLocalIdentifier],
          v22 = objc_claimAutoreleasedReturnValue(),
          v22,
          !v22))
    {
      v20 = [(id)objc_opt_class() _requestCuratedAssetInAssetCollection:v8 referenceAsset:v9 referencePersons:0 fetchOptions:0 onlyKey:1];
      goto LABEL_18;
    }
    id v18 = [v8 highlightLocalIdentifier];
    v27 = v18;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    char v24 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v23 options:v10];
    v25 = [v24 firstObject];

    if (v25)
    {
      v20 = [a1 fetchKeyCuratedAssetInAssetCollection:v25 referenceAsset:v9 options:v10];
    }
    else
    {
      v20 = 0;
    }
  }
LABEL_18:

  return v20;
}

id __53__PHAsset_fetchCollageAssetsForDayHighlight_options___block_invoke(uint64_t a1)
{
  v1 = +[PHQuery queryForCollageAssetsInDayHighlight:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  v2 = [v1 executeQuery];

  return v2;
}

id __44__PHAsset_fetchAssetsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForAssetsWithObjectIDs:*(void *)(a1 + 32) options:a2];
  double v3 = [v2 executeQuery];

  return v3;
}

id __51__PHAsset_fetchAssetsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForAssetsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  double v3 = [v2 executeQuery];

  return v3;
}

id __40__PHAsset_fetchAssetsWithUUIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForAssetsWithUUIDs:*(void *)(a1 + 32) options:a2];
  double v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetsForSearchLookupIdentifier:(id)a3 options:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    char v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"PHAsset.m", 3978, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_10:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PHAsset.m", 3979, @"Invalid parameter not satisfying: %@", @"lookupIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  id v9 = PLPhotoKitGetLog();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, a1);
  uint64_t v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v7;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UtilityCollectionFetch", "LookupIdentifier=%@", buf, 0xCu);
  }

  uint64_t v13 = [v8 photoLibrary];
  id v14 = [v13 photoLibrary];
  int v15 = [v13 searchIndex];
  uint64_t v16 = [v15 unverifiedPsiSearchIndex];

  uint64_t v17 = [MEMORY[0x1E4F8ABC0] searchResultForLookupIdentifier:v7 searchResultTypes:1 plPhotoLibrary:v14 searchIndex:v16];
  id v18 = [v8 photoLibrary];
  v19 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v18 orObject:0];

  [v19 setIncludeHiddenAssets:0];
  [v19 setIncludeTrashedAssets:0];
  [v19 mergeWithFetchOptions:v8];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__PHAsset_fetchAssetsForSearchLookupIdentifier_options___block_invoke;
  v26[3] = &unk_1E5845338;
  id v27 = v17;
  id v28 = v12;
  os_signpost_id_t v29 = v10;
  v20 = v12;
  id v21 = v17;
  v22 = +[PHObject authorizationAwareFetchResultWithOptions:v19 fetchBlock:v26];

  return v22;
}

- (unint64_t)thumbnailIndex
{
  return self->_thumbnailIndex;
}

+ (PHFetchResult)fetchAssetsWithOptions:(PHFetchOptions *)options
{
  return (PHFetchResult *)+[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:&__block_literal_global_834];
}

- (CLLocationCoordinate2D)locationCoordinate
{
  double latitude = self->_locationCoordinate.latitude;
  double longitude = self->_locationCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

void __32__PHAsset_corePropertiesToFetch__block_invoke(uint64_t a1)
{
  v10[54] = *MEMORY[0x1E4F143B8];
  v10[0] = @"avalanchePickType";
  v10[1] = @"avalancheUUID";
  v10[2] = @"avalancheKind";
  v10[3] = @"cloudPlaceholderKind";
  v10[4] = @"complete";
  v10[5] = @"directory";
  v10[6] = @"filename";
  v10[7] = @"kind";
  v10[8] = @"kindSubtype";
  v10[9] = @"playbackStyle";
  v10[10] = @"playbackVariation";
  v10[11] = @"cameraProcessingAdjustmentState";
  v10[12] = @"depthType";
  v10[13] = @"savedAssetType";
  v10[14] = @"bundleScope";
  v10[15] = @"thumbnailIndex";
  v10[16] = @"width";
  v10[17] = @"height";
  v10[18] = @"duration";
  v10[19] = @"hdrType";
  v10[20] = @"favorite";
  v10[21] = @"hidden";
  v10[22] = @"adjustmentsState";
  v10[23] = @"trashedState";
  v10[24] = @"trashedDate";
  v10[25] = @"adjustmentTimestamp";
  v10[26] = @"curationScore";
  v10[27] = @"overallAestheticScore";
  v10[28] = @"highlightVisibilityScore";
  v10[29] = @"originalColorSpace";
  v10[30] = @"imageRequestHints";
  v10[31] = @"deferredProcessingNeeded";
  v10[32] = @"videoDeferredProcessingNeeded";
  v10[33] = @"dateCreated";
  v10[34] = @"locationData";
  v10[35] = @"modificationDate";
  v10[36] = @"orientation";
  v10[37] = @"uniformTypeIdentifier";
  v10[38] = @"hdrGain";
  v10[39] = @"highFrameRateState";
  v10[40] = @"cloudAssetGUID";
  v10[41] = @"videoCpDurationValue";
  v10[42] = @"videoCpVisibilityState";
  v10[43] = @"cloudIsDeletable";
  v10[44] = @"faceAdjustmentVersion";
  v10[45] = @"faceAreaPoints";
  v10[46] = @"packedPreferredCropRect";
  v10[47] = @"packedAcceptableCropRect";
  v10[48] = @"packedBadgeAttributes";
  v10[49] = @"syndicationState";
  v10[50] = @"activeLibraryScopeParticipationState";
  v10[51] = @"currentSleetCast";
  v10[52] = @"spatialType";
  v10[53] = @"generativeMemoryCreationEligibilityState";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:54];
  double v3 = (void *)corePropertiesToFetch_array_21554;
  corePropertiesToFetch_array_21554 = v2;

  double v4 = (void *)corePropertiesToFetch_array_21554;
  id v5 = [*(id *)(a1 + 32) locationPropertiesToFetch];
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];
  id v7 = (void *)corePropertiesToFetch_array_21554;
  corePropertiesToFetch_array_21554 = v6;

  if (PLPlatformEagerlyFetchFaceRegions())
  {
    uint64_t v8 = [(id)corePropertiesToFetch_array_21554 arrayByAddingObject:@"additionalAttributes.faceRegions"];
    id v9 = (void *)corePropertiesToFetch_array_21554;
    corePropertiesToFetch_array_21554 = v8;
  }
}

void __37__PHAsset_propertiesToFetchWithHint___block_invoke_427(uint64_t a1)
{
  uint64_t v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_21549;
  double v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 48) _composePropertiesToFetchWithHint:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    os_signpost_id_t v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_21549;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v10 setObject:v12 forKey:v11];
  }
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    uint64_t v8 = [a1 identifierPropertiesToFetch];
    [a1 extendPropertiesToFetch:v5 withProperties:v8];

    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_46;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  id v9 = [a1 corePropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v9];

  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }
LABEL_46:
  os_signpost_id_t v10 = [a1 locationPropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v10];

  if ((a3 & 0x1000) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v11 = [a1 imageManagerPropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v11];

  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_49;
  }
LABEL_48:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x200000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_50;
  }
LABEL_49:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x200000) == 0)
  {
LABEL_8:
    if ((a3 & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_51;
  }
LABEL_50:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x100000) == 0)
  {
LABEL_9:
    if ((a3 & 0x8000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_52;
  }
LABEL_51:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x8000000000) == 0)
  {
LABEL_10:
    if ((a3 & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_53;
  }
LABEL_52:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x1000000) == 0)
  {
LABEL_11:
    if ((a3 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_54;
  }
LABEL_53:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x20) == 0)
  {
LABEL_12:
    if ((a3 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_55;
  }
LABEL_54:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x40) == 0)
  {
LABEL_13:
    if ((a3 & 0x10000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_56;
  }
LABEL_55:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x10000000000) == 0)
  {
LABEL_14:
    if ((a3 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_57;
  }
LABEL_56:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x80) == 0)
  {
LABEL_15:
    if ((a3 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_58;
  }
LABEL_57:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x100) == 0)
  {
LABEL_16:
    if ((a3 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_59;
  }
LABEL_58:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x200) == 0)
  {
LABEL_17:
    if ((a3 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_60;
  }
LABEL_59:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x400) == 0)
  {
LABEL_18:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_61;
  }
LABEL_60:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x2000) == 0)
  {
LABEL_19:
    if ((a3 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_62;
  }
LABEL_61:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x800) == 0)
  {
LABEL_20:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_63;
  }
LABEL_62:
  id v12 = [a1 faceWorkerPropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v12];

  if ((a3 & 0x4000) == 0)
  {
LABEL_21:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_64;
  }
LABEL_63:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x8000) == 0)
  {
LABEL_22:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_65;
  }
LABEL_64:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x10000) == 0)
  {
LABEL_23:
    if ((a3 & 0x200000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_66;
  }
LABEL_65:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x200000000) == 0)
  {
LABEL_24:
    if ((a3 & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_67;
  }
LABEL_66:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x8000000) == 0)
  {
LABEL_25:
    if ((a3 & 0x40000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_68;
  }
LABEL_67:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x40000000) == 0)
  {
LABEL_26:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_69;
  }
LABEL_68:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x20000) == 0)
  {
LABEL_27:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_70;
  }
LABEL_69:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x40000) == 0)
  {
LABEL_28:
    if ((a3 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_71;
  }
LABEL_70:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x80000) == 0)
  {
LABEL_29:
    if ((a3 & 0x400000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_72;
  }
LABEL_71:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x400000) == 0)
  {
LABEL_30:
    if ((a3 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_73;
  }
LABEL_72:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x800000) == 0)
  {
LABEL_31:
    if ((a3 & 0x2000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_74;
  }
LABEL_73:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x2000000) == 0)
  {
LABEL_32:
    if ((a3 & 0x4000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_75;
  }
LABEL_74:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x4000000) == 0)
  {
LABEL_33:
    if ((a3 & 0x10000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_76;
  }
LABEL_75:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x10000000) == 0)
  {
LABEL_34:
    if ((a3 & 0x20000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_76:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x20000000) != 0) {
LABEL_35:
  }
    [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
LABEL_36:
  if (a3 >= 0xFFFFFFFF80000000)
  {
    [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  }
  else if ((a3 & 0x100000000) == 0)
  {
    if ((a3 & 0x400000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_80;
  }
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x400000000) == 0)
  {
LABEL_39:
    if ((a3 & 0x2000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_81;
  }
LABEL_80:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x2000000000) == 0)
  {
LABEL_40:
    if ((a3 & 0x800000000) == 0) {
      goto LABEL_41;
    }
LABEL_82:
    [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
    if ((a3 & 0x4000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_81:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((a3 & 0x800000000) != 0) {
    goto LABEL_82;
  }
LABEL_41:
  if ((a3 & 0x4000000000) != 0) {
LABEL_42:
  }
    [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
LABEL_43:
  id v6 = v5;

  return v6;
}

+ (id)corePropertiesToFetch
{
  pl_dispatch_once();
  uint64_t v2 = (void *)corePropertiesToFetch_array_21554;

  return v2;
}

+ (id)locationPropertiesToFetch
{
  pl_dispatch_once();
  uint64_t v2 = (void *)locationPropertiesToFetch_pl_once_object_15;

  return v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_18;

  return v2;
}

id __34__PHAsset_fetchAssetsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAssetsWithOptions:a2];
  double v3 = [v2 executeQuery];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisStateModificationDate, 0);
  objc_storeStrong(&self->_faceAdjustmentVersion, 0);
  objc_storeStrong((id *)&self->_faceRegions, 0);
  objc_storeStrong((id *)&self->_hdrGain, 0);
  objc_storeStrong((id *)&self->_imageRequestHints, 0);
  objc_storeStrong((id *)&self->_originalColorSpace, 0);
  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
  objc_storeStrong((id *)&self->_trashedDate, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_locationData, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_cloudAssetGUID, 0);

  objc_storeStrong((id *)&self->_lazyCachedLocation, 0);
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 _extendedPropertyFetchHintsForPropertySets:v4];
  int v6 = [v4 containsObject:@"PHAssetPropertySetIdentifier"];

  if (v6) {
    return v5;
  }
  else {
    return v5 | 2;
  }
}

+ (unint64_t)_extendedPropertyFetchHintsForPropertySets:(id)a3
{
  id v3 = a3;
  if ([@"PHAssetPropertySetIdentifier" length]) {
    unint64_t v4 = [v3 containsObject:@"PHAssetPropertySetIdentifier"];
  }
  else {
    unint64_t v4 = 0;
  }
  if ([@"PHAssetPropertySetCore" length]
    && [v3 containsObject:@"PHAssetPropertySetCore"])
  {
    v4 |= 2uLL;
  }
  if ([@"PHAssetPropertySetLocalDate" length]
    && [v3 containsObject:@"PHAssetPropertySetLocalDate"])
  {
    v4 |= 0x200000uLL;
  }
  if ([@"PHAssetPropertySetPlacesCore" length]
    && [v3 containsObject:@"PHAssetPropertySetPlacesCore"])
  {
    v4 |= 4uLL;
  }
  if ([@"PHAssetPropertySetOriginalMetadata" length]
    && [v3 containsObject:@"PHAssetPropertySetOriginalMetadata"])
  {
    v4 |= 8uLL;
  }
  if ([@"PHAssetPropertySetPhotosOneUp" length]
    && [v3 containsObject:@"PHAssetPropertySetPhotosOneUp"])
  {
    v4 |= 0x10uLL;
  }
  if ([@"PHAssetPropertySetPhotosInfoPanelExtended" length]
    && [v3 containsObject:@"PHAssetPropertySetPhotosInfoPanelExtended"])
  {
    v4 |= 0x100000uLL;
  }
  if ([@"PHAssetPropertySetPhotosSmartStyleExtended" length]
    && [v3 containsObject:@"PHAssetPropertySetPhotosSmartStyleExtended"])
  {
    v4 |= 0x8000000000uLL;
  }
  if ([@"PHAssetPropertySetPhotosInfoPanelLocation" length]
    && [v3 containsObject:@"PHAssetPropertySetPhotosInfoPanelLocation"])
  {
    v4 |= 0x1000000uLL;
  }
  if ([@"PHAssetPropertySetPhotoIris" length]
    && [v3 containsObject:@"PHAssetPropertySetPhotoIris"])
  {
    v4 |= 0x20uLL;
  }
  if ([@"PHAssetPropertySetDescription" length]
    && [v3 containsObject:@"PHAssetPropertySetDescription"])
  {
    v4 |= 0x40uLL;
  }
  if ([@"PHAssetPropertySetCloudShared" length]
    && [v3 containsObject:@"PHAssetPropertySetCloudShared"])
  {
    v4 |= 0x10000000000uLL;
  }
  if ([@"PHAssetPropertySetComments" length]
    && [v3 containsObject:@"PHAssetPropertySetComments"])
  {
    v4 |= 0x80uLL;
  }
  if ([@"PHAssetPropertySetSceneAnalysis" length]
    && [v3 containsObject:@"PHAssetPropertySetSceneAnalysis"])
  {
    v4 |= 0x100uLL;
  }
  if ([@"PHAssetPropertySetAnalysisState" length]
    && [v3 containsObject:@"PHAssetPropertySetAnalysisState"])
  {
    v4 |= 0x200uLL;
  }
  if ([@"PHAssetPropertySetUserActivity" length]
    && [v3 containsObject:@"PHAssetPropertySetUserActivity"])
  {
    v4 |= 0x400uLL;
  }
  if ([@"PHAssetPropertySetFaceWorker" length]
    && [v3 containsObject:@"PHAssetPropertySetFaceWorker"])
  {
    v4 |= 0x800uLL;
  }
  if ([@"PHAssetPropertySetImageManager" length]
    && [v3 containsObject:@"PHAssetPropertySetImageManager"])
  {
    v4 |= 0x1000uLL;
  }
  if ([@"PHAssetPropertySetAdjustment" length]
    && [v3 containsObject:@"PHAssetPropertySetAdjustment"])
  {
    v4 |= 0x2000uLL;
  }
  if ([@"PHAssetPropertySetCuration" length]
    && [v3 containsObject:@"PHAssetPropertySetCuration"])
  {
    v4 |= 0x4000uLL;
  }
  if ([@"PHAssetPropertySetAesthetic" length]
    && [v3 containsObject:@"PHAssetPropertySetAesthetic"])
  {
    v4 |= 0x8000uLL;
  }
  if ([@"PHAssetPropertySetMediaAnalysis" length]
    && [v3 containsObject:@"PHAssetPropertySetMediaAnalysis"])
  {
    v4 |= 0x10000uLL;
  }
  if ([@"PHAssetPropertySetPhotoAnalysisWallpaperProperties" length]
    && [v3 containsObject:@"PHAssetPropertySetPhotoAnalysisWallpaperProperties"])
  {
    v4 |= 0x200000000uLL;
  }
  if ([@"PHAssetPropertySetCharacterRecognition" length]
    && [v3 containsObject:@"PHAssetPropertySetCharacterRecognition"])
  {
    v4 |= 0x8000000uLL;
  }
  if ([@"PHAssetPropertySetVisualSearch" length]
    && [v3 containsObject:@"PHAssetPropertySetVisualSearch"])
  {
    v4 |= 0x40000000uLL;
  }
  if ([@"PHAssetPropertySetImport" length]
    && [v3 containsObject:@"PHAssetPropertySetImport"])
  {
    v4 |= 0x20000uLL;
  }
  if ([@"PHAssetPropertySetSceneprint" length]
    && [v3 containsObject:@"PHAssetPropertySetSceneprint"])
  {
    v4 |= 0x40000uLL;
  }
  if ([@"PHAssetPropertySetDestinationAssetCopy" length]
    && [v3 containsObject:@"PHAssetPropertySetDestinationAssetCopy"])
  {
    v4 |= 0x80000uLL;
  }
  if ([@"PHAssetPropertySetKeywords" length]
    && [v3 containsObject:@"PHAssetPropertySetKeywords"])
  {
    v4 |= 0x400000uLL;
  }
  if ([@"PHAssetPropertySetGridMetadata" length]
    && [v3 containsObject:@"PHAssetPropertySetGridMetadata"])
  {
    v4 |= 0x800000uLL;
  }
  if ([@"PHAssetPropertySetCoarseLocation" length]
    && [v3 containsObject:@"PHAssetPropertySetCoarseLocation"])
  {
    v4 |= 0x2000000uLL;
  }
  if ([@"PHAssetPropertySetLibraryScope" length]
    && [v3 containsObject:@"PHAssetPropertySetLibraryScope"])
  {
    v4 |= 0x4000000uLL;
  }
  if ([@"PHAssetPropertySetCameraCaptureDevice" length]
    && [v3 containsObject:@"PHAssetPropertySetCameraCaptureDevice"])
  {
    v4 |= 0x10000000uLL;
  }
  if ([@"PHAssetPropertySetCloudLocalState" length]
    && [v3 containsObject:@"PHAssetPropertySetCloudLocalState"])
  {
    v4 |= 0x20000000uLL;
  }
  if ([@"PHAssetPropertySetMontage" length]
    && [v3 containsObject:@"PHAssetPropertySetMontage"])
  {
    v4 |= 0xFFFFFFFF80000000;
  }
  if ([@"PHAssetPropertySetSpatialMedia" length]
    && [v3 containsObject:@"PHAssetPropertySetSpatialMedia"])
  {
    v4 |= 0x100000000uLL;
  }
  if ([@"PHAssetPropertySetLocationData" length]
    && [v3 containsObject:@"PHAssetPropertySetLocationData"])
  {
    v4 |= 0x400000000uLL;
  }
  if ([@"PHAssetPropertySetPTP" length]
    && [v3 containsObject:@"PHAssetPropertySetPTP"])
  {
    v4 |= 0x2000000000uLL;
  }
  if ([@"PHAssetPropertySetIconicScore" length]
    && [v3 containsObject:@"PHAssetPropertySetIconicScore"])
  {
    v4 |= 0x800000000uLL;
  }
  if ([@"PHAssetPropertySetStoryPlayback" length]
    && [v3 containsObject:@"PHAssetPropertySetStoryPlayback"])
  {
    v4 |= 0x4000000000uLL;
  }

  return v4;
}

+ (id)filterPredicateForUnsavedSyndicationAssets
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %d", @"syndicationState", 2);
}

void __37__PHAsset_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_21549;
  propertiesToFetchWithHint__propertiesToFetchByHint_21549 = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.assetpropertyhints", 0);
  id v3 = (void *)propertiesToFetchWithHint__propertyQueue_21548;
  propertiesToFetchWithHint__propertyQueue_21548 = (uint64_t)v2;
}

+ (id)fetchAssetsForFaces:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PHAsset_fetchAssetsForFaces_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __39__PHAsset_fetchAssetsForFaces_options___block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v2 = +[PHQuery queryForAssetsForFaces:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

id __56__PHAsset_fetchAssetsForSearchLookupIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 assetUUIDs];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v8 = +[PHAsset fetchAssetsWithUUIDs:v7 options:v4];

  id v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v13 = 134217984;
    uint64_t v14 = [v8 count];
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_END, v11, "UtilityCollectionFetch", "Count=%lu", (uint8_t *)&v13, 0xCu);
  }

  return v8;
}

+ (id)fetchAssetsWithUUIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__PHAsset_fetchAssetsWithUUIDs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

void __23__PHAsset_entityKeyMap__block_invoke()
{
  v55[25] = *MEMORY[0x1E4F143B8];
  v22 = [PHEntityKeyMap alloc];
  v53 = @"uuid";
  v54[0] = @"uuid";
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v55[0] = v28;
  v54[1] = @"dateCreated";
  v52 = @"creationDate";
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  v55[1] = v27;
  v54[2] = @"modificationDate";
  id v51 = @"modificationDate";
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v55[2] = v26;
  v54[3] = @"kind";
  id v50 = @"mediaType";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v55[3] = v25;
  v54[4] = @"kindSubtype";
  id v49 = @"mediaSubtypes";
  char v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v55[4] = v24;
  v54[5] = @"duration";
  id v48 = @"duration";
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v55[5] = v23;
  v54[6] = @"width";
  v47 = @"pixelWidth";
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v55[6] = v21;
  v54[7] = @"height";
  v46 = @"pixelHeight";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v55[7] = v20;
  v54[8] = @"favorite";
  v45[0] = @"favorite";
  v45[1] = @"isFavorite";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v55[8] = v19;
  v54[9] = @"hidden";
  v44[0] = @"hidden";
  v44[1] = @"isHidden";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  v55[9] = v18;
  v54[10] = @"originalColorSpace";
  v43 = @"originalColorSpace";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v55[10] = v17;
  v54[11] = @"curationScore";
  v42 = @"curationScore";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v55[11] = v16;
  v54[12] = @"overallAestheticScore";
  id v41 = @"overallAestheticScore";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v55[12] = v15;
  v54[13] = @"highlightVisibilityScore";
  uint64_t v40 = @"highlightVisibilityScore";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v55[13] = v14;
  v54[14] = @"avalancheUUID";
  id v39 = @"burstIdentifier";
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v55[14] = v13;
  v54[15] = @"playbackStyle";
  v38 = @"playbackStyle";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v55[15] = v12;
  v54[16] = @"playbackVariation";
  uint64_t v37 = @"playbackVariation";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v55[16] = v0;
  v54[17] = @"imageRequestHints";
  uint64_t v36 = @"imageRequestHints";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v55[17] = v1;
  v54[18] = @"hdrGain";
  id v35 = @"hdrGain";
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v55[18] = v2;
  v54[19] = @"analysisStateModificationDate";
  v34 = @"analysisStateModificationDate";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v55[19] = v3;
  v54[20] = @"packedBadgeAttributes";
  v33[0] = @"RAWBadgeAttributes";
  v33[1] = @"hasKeywords";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v55[20] = v4;
  v54[21] = @"adjustmentTimestamp";
  uint64_t v32 = @"adjustmentTimestamp";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v55[21] = v5;
  v54[22] = @"additionalAttributes.importedByBundleIdentifier";
  id v31 = @"curationProperties.importedByBundleIdentifier";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v55[22] = v6;
  v54[23] = @"syndicationState";
  id v30 = @"syndicationState";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v55[23] = v7;
  v54[24] = @"cloudLocalState";
  os_signpost_id_t v29 = @"cloudLocalStateProperties.assetCloudLocalState";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v55[24] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:25];
  uint64_t v10 = [(PHEntityKeyMap *)v22 initWithPropertyKeysByEntityKey:v9];
  os_signpost_id_t v11 = (void *)entityKeyMap_pl_once_object_18;
  entityKeyMap_pl_once_object_18 = v10;
}

void __36__PHAsset_locationPropertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"latitude";
  v3[1] = @"longitude";
  v3[2] = @"dateCreated";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  dispatch_queue_t v2 = (void *)locationPropertiesToFetch_pl_once_object_15;
  locationPropertiesToFetch_pl_once_object_15 = v1;
}

+ (id)fetchAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PHAsset_fetchAssetsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

+ (PHFetchResult)fetchAssetsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options
{
  id v5 = identifiers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PHAsset_fetchAssetsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v9];

  return (PHFetchResult *)v7;
}

void __61__PHAsset__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setPredicate:*(void *)(a1 + 40)];
  [v2 setPropertiesToFetch:*(void *)(a1 + 48)];
  [v2 setResultType:2];
  id v3 = *(void **)(a1 + 56);
  id v48 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v48];
  id v5 = v48;
  if (!v4)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 80) description];
      uint64_t v8 = [*(id *)(a1 + 64) uuid];
      *(_DWORD *)buf = 138412802;
      id v51 = v7;
      __int16 v52 = 2112;
      v53 = v8;
      __int16 v54 = 2112;
      id v55 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);
    }
  }
  id v9 = [v4 firstObject];
  if (v9) {
    goto LABEL_24;
  }
  if (!*(unsigned char *)(a1 + 88))
  {
LABEL_23:
    id v9 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_24;
  }
  id v10 = [*(id *)(a1 + 80) additionalPropertiesToFetchOnPrimaryObject];
  if (![v10 count]
    || ([*(id *)(a1 + 80) keyPathToPrimaryObject],
        (v42 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_23;
  }
  os_signpost_id_t v11 = (void *)MEMORY[0x1E4F1C0D0];
  id v12 = [MEMORY[0x1E4F8A950] entityName];
  int v13 = [v11 fetchRequestWithEntityName:v12];

  uint64_t v14 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v15 = [*(id *)(a1 + 64) objectID];
  uint64_t v16 = [v14 predicateWithFormat:@"self == %@", v15];
  [v13 setPredicate:v16];

  [v13 setPropertiesToFetch:v10];
  [v13 setResultType:2];
  uint64_t v17 = *(void **)(a1 + 56);
  id v47 = 0;
  id v18 = [v17 executeFetchRequest:v13 error:&v47];
  id v41 = v47;
  if (!v18)
  {
    v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [*(id *)(a1 + 80) description];
      [*(id *)(a1 + 64) uuid];
      id v21 = v13;
      uint64_t v23 = v22 = v4;
      *(_DWORD *)buf = 138412802;
      id v51 = v20;
      __int16 v52 = 2112;
      v53 = v23;
      __int16 v54 = 2112;
      id v55 = v41;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch primary object for property set %@ data for %@: %@", buf, 0x20u);

      id v4 = v22;
      int v13 = v21;

      id v18 = 0;
    }
  }
  id v40 = v5;
  char v24 = [v18 firstObject];
  if (v24)
  {
    id v39 = v2;
    uint64_t v36 = v13;
    uint64_t v37 = v10;
    v38 = v4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v25 = [v24 allKeys];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          id v31 = [v24 objectForKeyedSubscript:v30];
          uint64_t v32 = [NSString stringWithFormat:@"%@.%@", v42, v30];
          [v9 setObject:v31 forKeyedSubscript:v32];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v27);
    }

    dispatch_queue_t v2 = v39;
    id v10 = v37;
    id v4 = v38;
    int v13 = v36;
  }
  else
  {
    id v9 = 0;
  }

  id v5 = v40;
  if (!v9) {
    goto LABEL_23;
  }
LABEL_24:
  uint64_t v33 = objc_msgSend(objc_alloc(*(Class *)(a1 + 80)), "initWithFetchDictionary:asset:prefetched:", v9, *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 80), "inverseIsToMany"));
  uint64_t v34 = *(void *)(*(void *)(a1 + 72) + 8);
  id v35 = *(void **)(v34 + 40);
  *(void *)(v34 + 40) = v33;
}

- (id)curationProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x4000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return [(PHAsset *)self _createPropertyObjectOfClass:a3 preFetchedProperties:0];
}

+ (id)fetchAssetsMatchingAdjustedFingerPrint:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:a4];
  [v6 setIncludeAssetSourceTypes:15];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"additionalAttributes.adjustedStableHash", v5];

  [v6 setInternalPredicate:v7];
  uint64_t v8 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:&__block_literal_global_42];

  return v8;
}

id __76__PHAsset_FingerPrint__fetchAssetsMatchingAdjustedFingerPrint_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v2 = +[PHQuery queryForAssetsWithOptions:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetsMatchingMasterFingerPrint:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:a4];
  [v6 setIncludeAssetSourceTypes:15];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"additionalAttributes.originalStableHash", v5];

  [v6 setInternalPredicate:v7];
  uint64_t v8 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:&__block_literal_global_194];

  return v8;
}

id __74__PHAsset_FingerPrint__fetchAssetsMatchingMasterFingerPrint_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v2 = +[PHQuery queryForAssetsWithOptions:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (void)_computeFingerPrintsOfAsset:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 objectID];
  uint64_t v8 = objc_msgSend(v6, "pl_photoLibrary");

  id v9 = [v8 assetsdClient];
  id v10 = [v9 cloudClient];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PHAsset_FingerPrint___computeFingerPrintsOfAsset_completionHandler___block_invoke;
  v12[3] = &unk_1E5841BA8;
  id v13 = v5;
  id v11 = v5;
  [v10 computeFingerPrintsOfAsset:v7 synchronously:0 completionHandler:v12];
}

void __70__PHAsset_FingerPrint___computeFingerPrintsOfAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    if (v9)
    {
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v15[0] = v9;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    }
    else
    {
      id v13 = 0;
    }
    id v11 = [v12 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v13];

    if (v10) {
  }
    }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)pl_managedAsset
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PHAdoptionUtilities.m" lineNumber:50 description:@"This is only callable on the main thread"];
  }
  id v4 = [(PHObject *)self photoLibrary];
  id v5 = [v4 mainQueueConcurrencyPhotoLibrary];
  id v6 = [(PHAsset *)self managedAssetForPhotoLibrary:v5];

  return v6;
}

- (id)pl_managedAssetFromPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PHAdoptionUtilities.m" lineNumber:44 description:@"This is only callable on the main thread"];
  }
  id v6 = [(PHAsset *)self managedAssetForPhotoLibrary:v5];

  return v6;
}

+ (id)pl_managedAssetsForAssets:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"PHAdoptionUtilities.m" lineNumber:56 description:@"This is only callable on the main thread"];
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "pl_managedAsset", (void)v15);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (CGRect)suggestedCropForAspectRatio:(double)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  [(PHAsset *)self faceAreaMinX];
  double v8 = v7;
  [(PHAsset *)self faceAreaMinY];
  double v10 = v9;
  [(PHAsset *)self faceAreaMaxX];
  double v12 = v11;
  [(PHAsset *)self faceAreaMaxY];
  double v13 = v12 - v8;
  double v15 = v14 - v10;
  double v16 = 1.0 - (v10 + v14 - v10);
  long long v17 = (void *)MEMORY[0x1E4F8CBF8];
  NSUInteger v18 = [(PHAsset *)self pixelWidth];
  NSUInteger v19 = [(PHAsset *)self pixelHeight];
  [(PHAsset *)self preferredCropRect];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  [(PHAsset *)self acceptableCropRect];
  objc_msgSend(v17, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v18, v19, a5, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v21, v23, v25, v27, v28, v29, v30, v31,
    *(void *)&v8,
    *(void *)&v16,
    *(void *)&v13,
    *(void *)&v15);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v40 = (double)[(PHAsset *)self pixelWidth];
  unint64_t v41 = [(PHAsset *)self pixelHeight];
  double v42 = v33 * v40 + 0.0;
  double v43 = v35 * (double)v41 + 0.0;
  double v44 = v37 * v40;
  double v45 = v39 * (double)v41;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    double v10 = (double)[(PHAsset *)self pixelWidth];
    double v8 = (double)[(PHAsset *)self pixelHeight];
    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    -[PHAsset suggestedCropForAspectRatio:withFocusRegion:andOutputCropScore:](self, "suggestedCropForAspectRatio:withFocusRegion:andOutputCropScore:", a5, a3.width / a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    double v10 = v9;
  }
  double v11 = v10;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  if (!CGRectIsNull(a4) && ((v13 = x + width, double v14 = y + height, v13 <= 1.0) ? (v15 = v14 <= 1.0) : (v15 = 0), v15))
  {
    double v41 = (double)[(PHAsset *)self pixelWidth];
    double v20 = (double)[(PHAsset *)self pixelHeight];
    double v45 = 0.0;
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, 0.0, v14, 1.0, 1.0 - v14);
    if (v45 > 0.0)
    {
      double v20 = v24;
    }
    else
    {
      double v23 = v41;
      double v21 = 0.0;
    }
    double v40 = v21;
    double v42 = v23;
    if (v45 <= 0.0) {
      double v25 = 0.0;
    }
    else {
      double v25 = v22;
    }
    double v26 = fmax(v45, 0.0);
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, 0.0, 0.0, 1.0, y);
    if (v45 <= v26) {
      double v30 = v20;
    }
    double v44 = v30;
    if (v45 <= v26) {
      double v31 = v42;
    }
    else {
      double v31 = v29;
    }
    if (v45 <= v26)
    {
      double v32 = v40;
    }
    else
    {
      double v25 = v28;
      double v32 = v27;
    }
    if (v45 > v26) {
      double v26 = v45;
    }
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, 0.0, 0.0, x, 1.0);
    if (v45 <= v26) {
      double v33 = v32;
    }
    double v43 = v33;
    if (v45 <= v26)
    {
      double v37 = v44;
    }
    else
    {
      double v25 = v34;
      double v31 = v35;
      double v37 = v36;
    }
    if (v45 <= v26) {
      double v38 = v26;
    }
    else {
      double v38 = v45;
    }
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, v13, 0.0, 1.0 - v13, 1.0);
    double v39 = v45;
    if (v45 <= v38)
    {
      double v19 = v37;
      double v18 = v31;
      double v17 = v25;
      double v16 = v43;
    }
    if (a5)
    {
      if (v45 <= v38) {
        double v39 = v38;
      }
      *a5 = v39;
    }
  }
  else
  {
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", a5, v11, v10, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4
{
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", 0, a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3
{
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:](self, "suggestedCropForTargetSize:withFocusRegion:", a3.width, a3.height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (id)internalSortDescriptorsWithCreationDateAscending:(BOOL)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"dateCreated" ascending:a3];
  v7[0] = v3;
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"objectID" ascending:0];
  v7[1] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)fetchAssetsForStyleablePhotoSuggestionsWithOptions:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[a3 copy];
  double v4 = (void *)MEMORY[0x1E4F28BA0];
  double v5 = [MEMORY[0x1E4F8A950] predicateForStyleableAssets];
  v17[0] = v5;
  double v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %f", @"highlightBeingExtendedAssets.promotionScore", *MEMORY[0x1E4F8B2A0]);
  v17[1] = v6;
  double v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"highlightBeingExtendedAssets.enrichmentState", 3);
  v17[2] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  double v9 = [v4 andPredicateWithSubpredicates:v8];
  [v3 setInternalPredicate:v9];

  [v3 setPredicate:0];
  double v10 = [v3 sortDescriptors];

  if (!v10)
  {
    double v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v16[0] = v11;
    double v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v16[1] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v3 setSortDescriptors:v13];
  }
  double v14 = +[PHAsset fetchAssetsWithOptions:v3];

  return v14;
}

+ (id)fetchSummaryCurationForHighlight:(id)a3 fetchOptions:(id)a4 allowsOnDemand:(BOOL)a5 error:(id *)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  double v11 = [v9 photoLibrary];
  if ([v9 enrichmentState] == 4)
  {
    int v12 = [v9 enrichmentVersion];
    if (v12 == [v9 highlightVersion])
    {
      double v13 = (void *)[v10 copy];
      double v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [v11 librarySpecificFetchOptions];
      }
      double v18 = v15;

      [v18 setHighlightCurationType:1];
      double v19 = +[PHAsset fetchCuratedAssetsInAssetCollection:v9 options:v18];
      goto LABEL_13;
    }
  }
  if (a5)
  {
    double v16 = [v11 photoAnalysisClient];
    double v17 = [v9 localIdentifier];
    double v18 = [v16 requestSummaryCurationForHighlightLocalIdentifier:v17 options:MEMORY[0x1E4F1CC08] error:a6];

    if (!v18)
    {
      a6 = 0;
LABEL_14:

      goto LABEL_15;
    }
    double v19 = +[PHAsset fetchAssetsWithUUIDs:v18 options:v10];
LABEL_13:
    a6 = v19;
    goto LABEL_14;
  }
  if (a6)
  {
    double v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    double v21 = NSString;
    double v22 = [v9 uuid];
    double v23 = [v21 stringWithFormat:@"No summary curation available for highlight %@, on-demand not allowed", v22];
    v27[0] = v23;
    double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    *a6 = [v20 errorWithDomain:@"PHPhotosErrorDomain" code:3303 userInfo:v24];

    a6 = 0;
  }
LABEL_15:

  return a6;
}

+ (id)fetchKeyAssetByMemoryUUIDForMemories:(id)a3 options:(id)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v10 = [v9 photoLibrary];
  double v11 = [v7 fetchedObjectIDsSet];

  int v12 = [v6 fetchPropertySets];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke;
  v21[3] = &unk_1E5848078;
  id v22 = v11;
  id v23 = v10;
  id v24 = v9;
  id v25 = v12;
  id v13 = v8;
  id v26 = v13;
  id v14 = v12;
  id v15 = v9;
  id v16 = v10;
  id v17 = v11;
  [v16 performBlockAndWait:v21];
  double v18 = v26;
  id v19 = v13;

  return v19;
}

void __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke(id *a1)
{
  dispatch_queue_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  double v3 = [MEMORY[0x1E4F8A950] entityName];
  double v4 = [v2 fetchRequestWithEntityName:v3];

  double v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY memoriesBeingKeyAsset IN %@", a1[4]];
  [v4 setPredicate:v5];

  id v6 = [a1[5] managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke_2;
  v8[3] = &unk_1E58446B0;
  id v9 = a1[4];
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = a1[8];
  id v7 = (id)[v6 enumerateObjectsFromFetchRequest:v4 usingDefaultBatchSizeWithBlock:v8];
}

void __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke_2(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v21 = a2;
  double v3 = [v21 memoriesBeingKeyAsset];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&long long v5 = 138543362;
    long long v20 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v10 = (void *)a1[4];
        id v11 = objc_msgSend(v9, "objectID", v20);
        LODWORD(v10) = [v10 containsObject:v11];

        if (v10)
        {
          id v12 = [(PHObjectPLAdapter *)[PHAssetPLAdapter alloc] initWithPLManagedObject:v21 photoLibrary:a1[5]];
          id v13 = [(PHAssetPLAdapter *)v12 newObjectWithPropertySets:a1[6]];
          id v14 = (void *)a1[7];
          id v15 = [v9 uuid];
          id v16 = [v14 objectForKeyedSubscript:v15];

          if (v16)
          {
            id v17 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              double v18 = [v9 uuid];
              *(_DWORD *)buf = v20;
              double v27 = v18;
              _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "fetchKeyAssetByMemoryUUIDForMemories encountered multiple key assets for memory %{public}@, only taking one", buf, 0xCu);
            }
          }
          else
          {
            id v19 = (void *)a1[7];
            id v17 = [v9 uuid];
            [v19 setObject:v13 forKeyedSubscript:v17];
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v6);
  }
}

+ (id)fetchKeyAssetBySuggestionUUIDForSuggestions:(id)a3 options:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [v7 fetchedObjectIDsSet];

  id v10 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  id v11 = [v10 photoLibrary];
  id v12 = [v5 fetchPropertySets];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke;
  v22[3] = &unk_1E58451D0;
  id v23 = v9;
  id v24 = v5;
  id v25 = v11;
  id v26 = v10;
  id v27 = v12;
  id v13 = v8;
  id v28 = v13;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  id v17 = v5;
  id v18 = v9;
  [v16 performBlockAndWait:v22];
  id v19 = v28;
  id v20 = v13;

  return v20;
}

void __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke(id *a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  double v3 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY suggestionsBeingKeyAssets IN %@", a1[4]];
  [v4 setPredicate:v5];

  uint64_t v6 = [a1[5] internalPredicate];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28BA0];
    id v8 = [a1[5] internalPredicate];
    v19[0] = v8;
    id v9 = [v4 predicate];
    v19[1] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v11 = [v7 andPredicateWithSubpredicates:v10];
    [v4 setPredicate:v11];
  }
  id v12 = [a1[6] managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke_2;
  v14[3] = &unk_1E5844688;
  id v15 = a1[4];
  id v16 = a1[7];
  id v17 = a1[8];
  id v18 = a1[9];
  id v13 = (id)[v12 enumerateObjectsFromFetchRequest:v4 count:0 usingDefaultBatchSizeWithBlock:v14];
}

void __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 suggestionsBeingKeyAssets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412290;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = *(void **)(a1 + 32);
        id v12 = objc_msgSend(v10, "objectID", v18);
        LODWORD(v11) = [v11 containsObject:v12];

        if (v11)
        {
          id v13 = [v10 uuid];
          id v14 = [(PHObjectPLAdapter *)[PHAssetPLAdapter alloc] initWithPLManagedObject:v3 photoLibrary:*(void *)(a1 + 40)];
          id v15 = [(PHAssetPLAdapter *)v14 newObjectWithPropertySets:*(void *)(a1 + 48)];
          id v16 = [*(id *)(a1 + 56) objectForKey:v13];

          if (v16)
          {
            id v17 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              id v24 = v13;
              _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "fetchKeyAssetBySuggestionUUIDForSuggestions encountered multiple key assets for suggestion, only taking one: %@", buf, 0xCu);
            }
          }
          else
          {
            [*(id *)(a1 + 56) setObject:v15 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }
}

+ (id)fetchKeyAssetByHighlightUUIDForHighlights:(id)a3 options:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v32 = v6;
  uint64_t v7 = [v6 photoLibrary];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v16 = [v15 uuid];
        id v17 = [v15 objectID];
        [v8 addObject:v17];

        [v9 addObject:v16];
        [v10 setObject:v15 forKeyedSubscript:v16];
        if (!v7)
        {
          uint64_t v7 = [v15 photoLibrary];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v12);
  }

  long long v18 = [v7 photoLibrary];
  long long v19 = [v32 fetchPropertySets];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke;
  v34[3] = &unk_1E5844660;
  id v35 = v18;
  id v36 = v32;
  id v37 = v8;
  id v38 = v9;
  id v39 = v10;
  id v20 = v31;
  id v40 = v20;
  id v41 = v7;
  double v42 = v19;
  id v21 = v19;
  id v22 = v7;
  id v23 = v10;
  id v24 = v9;
  id v25 = v8;
  id v26 = v32;
  id v27 = v18;
  [v27 performBlockAndWait:v34];
  id v28 = v42;
  id v29 = v20;

  return v29;
}

void __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke(uint64_t a1)
{
  void v27[2] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v4 = [MEMORY[0x1E4F8A950] entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  id v6 = *(void **)(a1 + 40);
  if (!v6 || (int v7 = [v6 sharingFilter], v7 == 2))
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ || %K IN %@ || %K IN %@ || %K IN %@", @"highlightBeingKeyAssetPrivate", *(void *)(a1 + 48), @"dayGroupHighlightBeingKeyAssetPrivate", *(void *)(a1 + 48), @"highlightBeingKeyAssetShared", *(void *)(a1 + 48), @"dayGroupHighlightBeingKeyAssetShared", *(void *)(a1 + 48)];
    v25[0] = @"highlightBeingKeyAssetPrivate";
    v25[1] = @"dayGroupHighlightBeingKeyAssetPrivate";
    v25[2] = @"highlightBeingKeyAssetShared";
    v25[3] = @"dayGroupHighlightBeingKeyAssetShared";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    __int16 v8 = 2;
  }
  else
  {
    __int16 v8 = v7;
    if (v7 == 1)
    {
      id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ || %K IN %@", @"highlightBeingKeyAssetShared", *(void *)(a1 + 48), @"dayGroupHighlightBeingKeyAssetShared", *(void *)(a1 + 48)];
      v26[0] = @"highlightBeingKeyAssetShared";
      v26[1] = @"dayGroupHighlightBeingKeyAssetShared";
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      __int16 v8 = 1;
    }
    else
    {
      if (v7)
      {
        id v9 = 0;
        goto LABEL_9;
      }
      id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ || %K IN %@", @"highlightBeingKeyAssetPrivate", *(void *)(a1 + 48), @"dayGroupHighlightBeingKeyAssetPrivate", *(void *)(a1 + 48)];
      v27[0] = @"highlightBeingKeyAssetPrivate";
      v27[1] = @"dayGroupHighlightBeingKeyAssetPrivate";
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      __int16 v8 = 0;
    }
  }
  [v5 setRelationshipKeyPathsForPrefetching:v10];

LABEL_9:
  [v5 setPredicate:v9];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_2;
  aBlock[3] = &unk_1E5844610;
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 64);
  __int16 v24 = v8;
  id v23 = *(id *)(a1 + 72);
  uint64_t v11 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_115;
  v15[3] = &unk_1E5844638;
  id v16 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  __int16 v19 = v8;
  id v17 = v12;
  id v18 = v11;
  id v13 = v11;
  id v14 = (id)[v2 enumerateObjectsFromFetchRequest:v5 count:0 usingDefaultBatchSizeWithBlock:v15];
}

void __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && [*(id *)(a1 + 32) containsObject:v7])
  {
    id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
    if ([v10 sharingComposition] == 2 && *(_WORD *)(a1 + 56) == 2)
    {
      int v11 = [v10 mixedSharingCompositionKeyAssetRelationship];
      if (!v11)
      {
        [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v7];
        id v12 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138412290;
          id v14 = v7;
        }

        goto LABEL_15;
      }
      if (v11 == 2)
      {
        if (![v8 hasLibraryScope])
        {
LABEL_15:

          goto LABEL_16;
        }
      }
      else if (v11 != 1 || ([v8 hasLibraryScope] & 1) != 0)
      {
        goto LABEL_15;
      }
    }
    [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v7];
    goto LABEL_15;
  }
LABEL_16:
}

void __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_115(uint64_t a1, void *a2)
{
  id v22 = a2;
  id v3 = [(PHObjectPLAdapter *)[PHAssetPLAdapter alloc] initWithPLManagedObject:v22 photoLibrary:*(void *)(a1 + 32)];
  id v4 = [(PHAssetPLAdapter *)v3 newObjectWithPropertySets:*(void *)(a1 + 40)];
  int v5 = *(unsigned __int16 *)(a1 + 56);
  if (v5 == 2)
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = [v22 highlightBeingKeyAssetPrivate];
    int v13 = [v12 uuid];
    (*(void (**)(uint64_t, void *, id, id))(v11 + 16))(v11, v13, v22, v4);

    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [v22 dayGroupHighlightBeingKeyAssetPrivate];
    id v16 = [v15 uuid];
    (*(void (**)(uint64_t, void *, id, id))(v14 + 16))(v14, v16, v22, v4);

    goto LABEL_6;
  }
  if (v5 == 1)
  {
LABEL_6:
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = [v22 highlightBeingKeyAssetShared];
    __int16 v19 = [v18 uuid];
    (*(void (**)(uint64_t, void *, id, id))(v17 + 16))(v17, v19, v22, v4);

    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [v22 dayGroupHighlightBeingKeyAssetShared];
    goto LABEL_7;
  }
  if (*(_WORD *)(a1 + 56)) {
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [v22 highlightBeingKeyAssetPrivate];
  id v8 = [v7 uuid];
  (*(void (**)(uint64_t, void *, id, id))(v6 + 16))(v6, v8, v22, v4);

  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [v22 dayGroupHighlightBeingKeyAssetPrivate];
LABEL_7:
  id v20 = v10;
  id v21 = [v10 uuid];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v21, v22, v4);

LABEL_8:
}

+ (id)fetchAssetsForBehavioralCurationWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_92];
}

id __64__PHAsset_Curated__fetchAssetsForBehavioralCurationWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v2 = +[PHQuery queryForAssetsForBehavioralCurationWithOptions:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchKeyAssetForEachSuggestion:(id)a3 options:(id)a4 useSuggestionsSortOrder:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v27 = [v8 photoLibrary];
    id v26 = +[PHManualFetchResult emptyFetchResultWithPhotoLibrary:v27];

    goto LABEL_22;
  }
  BOOL v29 = v5;
  double v30 = v8;
  uint64_t v9 = +[PHAsset fetchKeyAssetBySuggestionUUIDForSuggestions:v7 options:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v31 = v7;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (!v13) {
    goto LABEL_18;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v33 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v18 = [v17 uuid];
      __int16 v19 = [v9 objectForKeyedSubscript:v18];

      if (!v19)
      {
        id v20 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        id v21 = [v17 uuid];
        *(_DWORD *)buf = 138412290;
        id v37 = v21;
        id v22 = v20;
        id v23 = "Suggestion UUID %@ not found in suggestionsKeyAssetBySuggestionUUID.";
LABEL_13:
        _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
LABEL_14:

        goto LABEL_16;
      }
      id v20 = [v19 objectID];
      if ([v10 containsObject:v20])
      {
        id v21 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v19;
          id v22 = v21;
          id v23 = "Duplicated suggestionKeyAsset: %@";
          goto LABEL_13;
        }
        goto LABEL_14;
      }
      [v10 addObject:v20];
      [v11 addObject:v19];
LABEL_16:
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
  }
  while (v14);
LABEL_18:

  id v8 = v30;
  __int16 v24 = (void *)[v30 copy];
  if (v29)
  {
    id v25 = [v10 array];
    [v24 setCustomObjectIDSortOrder:v25];
  }
  id v26 = +[PHAsset _assetFetchResultFromAssets:v11 options:v24];

  id v7 = v31;
LABEL_22:

  return v26;
}

+ (id)fetchKeyAssetForEachSuggestion:(id)a3 options:(id)a4
{
  return (id)[a1 fetchKeyAssetForEachSuggestion:a3 options:a4 useSuggestionsSortOrder:1];
}

+ (id)requestCuratedAssetsInAssetCollection:(id)a3 options:(id)a4
{
  return (id)[a1 _requestCuratedAssetInAssetCollection:a3 referenceAsset:0 referencePersons:0 fetchOptions:a4 onlyKey:0];
}

+ (id)fetchReducedCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 assetCollectionType] != 4 && objc_msgSend(v7, "assetCollectionType") != 8)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:a1 file:@"PHAsset_Curated.m" lineNumber:442 description:@"Only memories and suggestions are supported"];
  }
  if ([v7 assetCollectionType] == 8)
  {
    id v9 = +[PHAsset fetchKeyAssetsInAssetCollection:v7 options:v8];
  }
  else
  {
    if ([v8 fetchLimit]) {
      unint64_t v10 = [v8 fetchLimit];
    }
    else {
      unint64_t v10 = 15;
    }
    id v11 = [v7 photoLibrary];
    id v12 = [v11 librarySpecificFetchOptions];

    if (v8) {
      [v12 mergeWithFetchOptions:v8];
    }
    uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v41[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    [v12 setSortDescriptors:v14];

    [v12 setFetchLimit:0];
    uint64_t v15 = +[PHQuery queryForCuratedAssetsInMemory:v7 options:v12];
    id v16 = [v15 executeQuery];
    unint64_t v17 = [v16 count];
    if (v17 <= v10)
    {
      id v9 = v16;
    }
    else
    {
      id v18 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:v7 referenceAsset:0];
      __int16 v19 = [v18 firstObject];
      id v20 = [v19 localIdentifier];

      id v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
      uint64_t v35 = 0;
      id v36 = &v35;
      uint64_t v37 = 0x3032000000;
      id v38 = __Block_byref_object_copy__17175;
      uint64_t v39 = __Block_byref_object_dispose__17176;
      id v40 = [v16 firstObject];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __62__PHAsset_Curated__fetchReducedCuratedAssetsInMemory_options___block_invoke;
      v29[3] = &unk_1E58445E8;
      unint64_t v33 = v10;
      unint64_t v34 = v17;
      id v22 = v21;
      id v30 = v22;
      long long v32 = &v35;
      id v23 = v20;
      id v31 = v23;
      [v16 enumerateObjectsUsingBlock:v29];
      if ([v22 count] < v10)
      {
        __int16 v24 = [(id)v36[5] localIdentifier];
        [v22 addObject:v24];
      }
      id v25 = +[PHQuery queryForAssetsWithLocalIdentifiers:v22 options:v8];

      id v26 = [v25 executeQuery];

      id v9 = v26;
      _Block_object_dispose(&v35, 8);

      uint64_t v15 = v25;
    }
  }

  return v9;
}

void __62__PHAsset_Curated__fetchReducedCuratedAssetsInMemory_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v27 = a2;
  uint64_t v6 = (unint64_t)(*(void *)(a1 + 56) * a3) / *(void *)(a1 + 64) - 1;
  if (v6 == [*(id *)(a1 + 32) count])
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v7 = a1 + 48;
    id v9 = *(void **)(v7 - 16);
    unint64_t v10 = [*(id *)(*(void *)(v8 + 8) + 40) localIdentifier];
    [v9 addObject:v10];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v7 = a1 + 48;
    int v12 = [*(id *)(*(void *)(v11 + 8) + 40) isFavorite];
    uint64_t v26 = [*(id *)(*(void *)(*(void *)v7 + 8) + 40) mediaType];
    uint64_t v13 = [*(id *)(*(void *)(*(void *)v7 + 8) + 40) localIdentifier];
    int v14 = [v13 isEqualToString:*(void *)(v7 - 8)];

    int v15 = [v27 isFavorite];
    uint64_t v16 = [v27 mediaType];
    [*(id *)(*(void *)(*(void *)v7 + 8) + 40) curationScore];
    double v18 = v17;
    [v27 curationScore];
    double v20 = v19;
    id v21 = [v27 localIdentifier];
    int v22 = [v21 isEqualToString:*(void *)(v7 - 8)];

    BOOL v23 = v12 == v15 && v18 < v20;
    if ((!v23 || (v26 == 2) != (v16 == 2) || v14) && (v15 ^ 1 | v12 | v14 | (v26 == 2) ^ (v16 == 2)) == 1)
    {
      BOOL v24 = v26 != 2 || v16 == 2;
      int v25 = v24 ? 1 : v14;
      if ((v25 ^ 1 | v22) != 1) {
        goto LABEL_19;
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v7 + 8) + 40), a2);
LABEL_19:
}

+ (id)fetchAssetsAssociatedWithMomentsOfMemory:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = [v5 photoLibrary];
    id v6 = [v7 librarySpecificFetchOptions];
  }
  uint64_t v8 = +[PHQuery queryForAssetsAssociatedWithMomentsOfMemory:v5 options:v6];
  id v9 = [v8 executeQuery];

  return v9;
}

+ (id)fetchExtendedCuratedAndRepresentativeAssetsAssociatedWithMemory:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = [v5 photoLibrary];
    id v6 = [v7 librarySpecificFetchOptions];
  }
  [v6 setIncludeHiddenAssets:1];
  [v6 setIncludeAllBurstAssets:1];
  [v6 setIncludeGuestAssets:1];
  uint64_t v8 = +[PHQuery queryForAllAssetsAssociatedWithMemory:v5 options:v6];
  id v9 = [v8 executeQuery];

  return v9;
}

+ (id)fetchRepresentativeAssetsInAssetCollection:(id)a3
{
  id v5 = a3;
  if ([v5 assetCollectionType] == 4)
  {
    if ([v5 isTransient])
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:a1 file:@"PHAsset_Curated.m" lineNumber:399 description:@"Transient memories aren't supported"];
    }
    id v6 = [v5 photoLibrary];
    uint64_t v7 = [v6 librarySpecificFetchOptions];

    [v7 setIncludeHiddenAssets:1];
    [v7 setIncludeAllBurstAssets:1];
    [v7 setIncludeGuestAssets:1];
    uint64_t v8 = +[PHQuery queryForRepresentativeAssetsInMemory:v5 options:v7];
LABEL_9:
    unint64_t v10 = v8;
    uint64_t v11 = [v8 executeQuery];

    goto LABEL_11;
  }
  if ([v5 assetCollectionType] == 8)
  {
    if ([v5 isTransient])
    {
      int v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:a1 file:@"PHAsset_Curated.m" lineNumber:408 description:@"Transient suggestions aren't supported"];
    }
    id v9 = [v5 photoLibrary];
    uint64_t v7 = [v9 librarySpecificFetchOptions];

    [v7 setIncludeHiddenAssets:1];
    [v7 setIncludeAllBurstAssets:1];
    uint64_t v8 = +[PHQuery queryForRepresentativeAssetsInSuggestion:v5 options:v7];
    goto LABEL_9;
  }
  uint64_t v11 = [(id)objc_opt_class() _fetchRepresentativeAssetInAssetCollection:v5];
LABEL_11:

  return v11;
}

+ (id)fetchCustomUserAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 assetCollectionType] == 4)
  {
    id v9 = +[PHQuery queryForCustomUserAssetsInMemory:v7 options:v8];
    unint64_t v10 = [v9 executeQuery];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHAsset_Curated.m" lineNumber:390 description:@"fetchCustomUserAssetsInMemory only supports memory"];
    unint64_t v10 = 0;
  }

  return v10;
}

+ (id)fetchUserCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 assetCollectionType] == 4)
  {
    if ([v7 isTransient]) {
      [v7 queryForCuratedAssetsWithOptions:v8];
    }
    else {
    id v9 = +[PHQuery queryForUserCuratedAssetsInMemory:v7 options:v8];
    }
    unint64_t v10 = [v9 executeQuery];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHAsset_Curated.m" lineNumber:379 description:@"fetchUserCuratedAssetsInMemory only supports memory"];
    unint64_t v10 = 0;
  }

  return v10;
}

+ (id)fetchUserCuratedAssetsInMemory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  id v7 = [a1 fetchUserCuratedAssetsInMemory:v4 options:v6];

  return v7;
}

+ (id)fetchMovieCuratedAssetsInMemory:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 assetCollectionType] == 4)
  {
    id v6 = [v5 photoLibrary];
    id v7 = [v6 librarySpecificFetchOptions];

    v13[0] = @"PHAssetPropertySetOriginalMetadata";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v7 addFetchPropertySets:v8];

    if ([v5 isTransient]) {
      [v5 queryForCuratedAssetsWithOptions:v7];
    }
    else {
    uint64_t v11 = +[PHQuery queryForMovieCuratedAssetsInMemory:v5 options:v7];
    }
    unint64_t v10 = [v11 executeQuery];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHAsset_Curated.m" lineNumber:358 description:@"fetchMovieCuratedAssetsInMemory only supports memory"];

    unint64_t v10 = 0;
  }

  return v10;
}

+ (id)requestCuratedAssetsInAssetCollection:(id)a3 referencePersons:(id)a4 options:(id)a5
{
  return (id)[a1 _requestCuratedAssetInAssetCollection:a3 referenceAsset:0 referencePersons:a4 fetchOptions:a5 onlyKey:0];
}

+ (id)fetchExtendedCuratedAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = [v6 photoLibrary];
    id v7 = [v8 librarySpecificFetchOptions];
  }
  if ([v6 assetCollectionType] == 4)
  {
    id v9 = +[PHQuery queryForExtendedCuratedAssetsInMemory:v6 options:v7];
LABEL_7:
    unint64_t v10 = v9;
    uint64_t v11 = [v9 executeQuery];

    goto LABEL_9;
  }
  if ([v6 assetCollectionType] == 6)
  {
    [v7 setHighlightCurationType:2];
    id v9 = +[PHQuery queryForCuratedAssetsInPhotosHighlight:v6 options:v7];
    goto LABEL_7;
  }
  uint64_t v11 = [a1 _requestCuratedAssetInAssetCollection:v6 referenceAsset:0 referencePersons:0 fetchOptions:0 onlyKey:0];
LABEL_9:

  return v11;
}

+ (id)fetchCuratedAssetsInAssetCollection:(id)a3 options:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = [v6 photoLibrary];
    id v7 = [v8 librarySpecificFetchOptions];
  }
  if ([v6 assetCollectionType] == 4)
  {
    v19[0] = @"PHAssetPropertySetOriginalMetadata";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v7 addFetchPropertySets:v9];

    unint64_t v10 = +[PHQuery queryForCuratedAssetsInMemory:v6 options:v7];
LABEL_15:
    int v12 = v10;
    uint64_t v16 = [v10 executeQuery];
LABEL_16:

    goto LABEL_17;
  }
  if ([v6 assetCollectionType] == 6)
  {
    if (![v7 highlightCurationType]) {
      objc_msgSend(v7, "setHighlightCurationType:", objc_msgSend(v6, "preferredCurationType"));
    }
    unint64_t v10 = +[PHQuery queryForCuratedAssetsInPhotosHighlight:v6 options:v7];
    goto LABEL_15;
  }
  if ([v6 assetCollectionType] == 5)
  {
    uint64_t v11 = [v6 highlightLocalIdentifier];

    if (v11)
    {
      int v12 = [v6 highlightLocalIdentifier];
      double v18 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      int v14 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v13 options:v7];
      int v15 = [v14 firstObject];

      if (v15)
      {
        uint64_t v16 = [a1 fetchCuratedAssetsInAssetCollection:v15 options:v7];
      }
      else
      {
        uint64_t v16 = 0;
      }

      goto LABEL_16;
    }
  }
  if ([v6 assetCollectionType] == 7)
  {
    unint64_t v10 = +[PHQuery queryForCuratedAssetsInMomentShare:v6 options:v7];
    goto LABEL_15;
  }
  uint64_t v16 = [a1 _requestCuratedAssetInAssetCollection:v6 referenceAsset:0 referencePersons:0 fetchOptions:v7 onlyKey:0];
LABEL_17:

  return v16;
}

+ (id)fetchCuratedAssetsInAssetCollection:(id)a3
{
  return (id)[a1 fetchCuratedAssetsInAssetCollection:a3 options:0];
}

+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referencePersons:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 assetCollectionType];
  id v8 = objc_opt_class();
  if (v7 == 4) {
    [v8 fetchKeyCuratedAssetInAssetCollection:v6 referenceAsset:0];
  }
  else {
  id v9 = [v8 _requestCuratedAssetInAssetCollection:v6 referenceAsset:0 referencePersons:v5 fetchOptions:0 onlyKey:1];
  }

  return v9;
}

+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4
{
  return (id)[a1 fetchKeyCuratedAssetInAssetCollection:a3 referenceAsset:a4 options:0];
}

+ (id)_assetFetchResultFromAssets:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[v5 copy];
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v5 object:0];
  [v7 setPhotoLibrary:v8];

  [v7 setIncludeHiddenAssets:0];
  id v9 = [v5 fetchPropertySets];
  [v7 setFetchPropertySets:v9];

  unint64_t v10 = [v5 customObjectIDSortOrder];

  [v7 setCustomObjectIDSortOrder:v10];
  uint64_t v11 = [v6 valueForKey:@"localIdentifier"];

  int v12 = +[PHAsset fetchAssetsWithLocalIdentifiers:v11 options:v7];

  return v12;
}

+ (id)_fetchRepresentativeAssetInAssetCollection:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 photoLibrary];
  id v5 = [v4 photoLibrary];
  id v6 = [v5 photoAnalysisClient];

  if (v6)
  {
    if ([v3 assetCollectionType] == 5)
    {
      uint64_t v7 = [v3 highlightLocalIdentifier];
      if (v7)
      {

LABEL_9:
        id v12 = v3;
        uint64_t v13 = [v12 highlightLocalIdentifier];
        int v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          uint64_t v16 = [v12 momentLocalIdentifiers];
          id v15 = [v16 firstObject];
        }
        goto LABEL_20;
      }
      unint64_t v10 = [v3 momentLocalIdentifiers];
      uint64_t v11 = [v10 count];

      if (v11 == 1) {
        goto LABEL_9;
      }
    }
    if (([v3 isTransient] & 1) != 0
      || [v3 assetCollectionType] != 4
      && [v3 assetCollectionType] != 3
      && [v3 assetCollectionType] != 7
      && [v3 assetCollectionType] != 1
      && ([v3 assetCollectionType] != 2 || objc_msgSend(v3, "assetCollectionSubtype") == 200))
    {
      id v8 = +[PHAssetCollection graphOptionsForTransientAssetCollection:v3 needsCompleteMomentsInfo:0 options:0];
      id v15 = 0;
LABEL_21:
      id v38 = 0;
      double v17 = [v6 requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:v15 options:v8 error:&v38];
      id v18 = v38;
      if (v18)
      {
        double v19 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v18;
          _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "_fetchRepresentativeAssetInAssetCollection encountered error:%@", buf, 0xCu);
        }
      }
      if (v17)
      {
        id v31 = v18;
        id v32 = v15;
        unint64_t v33 = v6;
        double v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v21 = v17;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = [*(id *)(*((void *)&v34 + 1) + 8 * i) objectForKeyedSubscript:@"PHRelatedAssetIdentifierKey"];
              [v20 addObject:v26];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v40 count:16];
          }
          while (v23);
        }

        id v27 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v3];
        [v27 setIncludeHiddenAssets:1];
        [v27 setIncludeAllBurstAssets:1];
        id v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
        uint64_t v39 = v28;
        BOOL v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        [v27 setSortDescriptors:v29];

        id v9 = +[PHAsset fetchAssetsWithLocalIdentifiers:v20 options:v27];

        id v15 = v32;
        id v6 = v33;
        id v18 = v31;
      }
      else
      {
        id v9 = 0;
      }

      goto LABEL_36;
    }
    id v15 = [v3 localIdentifier];
LABEL_20:
    id v8 = 0;
    goto LABEL_21;
  }
  id v8 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Photo Analysis Client is nil", buf, 2u);
  }
  id v9 = 0;
LABEL_36:

  return v9;
}

+ (id)_requestCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 fetchOptions:(id)a6 onlyKey:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v72 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [v11 photoLibrary];
  id v15 = [v14 photoLibrary];
  uint64_t v16 = [v15 photoAnalysisClient];

  if (v16)
  {
    double v17 = objc_opt_new();
    uint64_t v18 = [v12 count];
    if (v18)
    {
      double v19 = objc_msgSend(v12, "_pl_map:", &__block_literal_global_17206);
      [v17 setObject:v19 forKeyedSubscript:@"PHPhotosGraphOptionPersonLocalIdentifiersToFocus"];
    }
    if ([v13 curationType] == 2) {
      [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHPhotosGraphOptionCurationTypeDedupe"];
    }
    if ([v11 assetCollectionType] == 5)
    {
      double v20 = [v11 highlightLocalIdentifier];
      if (v20)
      {

LABEL_13:
        BOOL v24 = v7;
        id v25 = v11;
        id v26 = v11;
        id v27 = [v26 highlightLocalIdentifier];
        id v28 = v27;
        if (v27)
        {
          id v29 = v27;
        }
        else
        {
          [v26 momentLocalIdentifiers];
          uint64_t v66 = v18;
          unint64_t v33 = v17;
          long long v35 = v34 = v16;
          id v29 = [v35 firstObject];

          uint64_t v16 = v34;
          double v17 = v33;
          uint64_t v18 = v66;
        }

        id v30 = v29;
        id v11 = v25;
        BOOL v7 = v24;
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v22 = [v11 momentLocalIdentifiers];
      uint64_t v23 = [v22 count];

      if (v23 == 1) {
        goto LABEL_13;
      }
    }
    if (v13
      || (unint64_t v31 = [v11 assetCollectionType], v31 > 8)
      || ((1 << v31) & 0x1DA) == 0 && (v31 != 2 || [v11 assetCollectionSubtype] == 200))
    {
      if (v18 != 1)
      {
        if ([v11 isTransient] && objc_msgSend(v11, "assetCollectionType") == 1) {
          [v13 setFetchLimit:0];
        }
        id v26 = +[PHAssetCollection graphOptionsForTransientAssetCollection:v11 needsCompleteMomentsInfo:1 options:v13];
        [v17 addEntriesFromDictionary:v26];
        id v30 = 0;
        goto LABEL_30;
      }
      id v30 = 0;
    }
    else
    {
      id v30 = [v11 localIdentifier];
      if (!v30)
      {
        id v32 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v89 = v11;
          _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "no collection identifier found for %@", buf, 0xCu);
        }
        id v21 = 0;
        goto LABEL_63;
      }
    }
LABEL_31:
    v70 = v17;
    if (v7)
    {
      long long v36 = [v72 localIdentifier];
      id v82 = 0;
      long long v37 = [v16 requestCuratedAssetForAssetCollectionWithLocalIdentifier:v30 referenceAssetLocalIdentifier:v36 options:v17 error:&v82];
      id v38 = v82;

      if (v37)
      {
        v87 = v37;
        uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
      }
      else
      {
        uint64_t v39 = 0;
      }

      id v40 = v38;
    }
    else
    {
      id v81 = 0;
      uint64_t v39 = [v16 requestCuratedAssetsForAssetCollectionWithLocalIdentifier:v30 duration:2 options:v17 error:&v81];
      id v40 = v81;
    }
    uint64_t v71 = v13;
    if (v40)
    {
      id v41 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v89 = v40;
        _os_log_impl(&dword_19B043000, v41, OS_LOG_TYPE_ERROR, "_requestCuratedAssetInAssetCollection encountered error:%@", buf, 0xCu);
      }
    }
    __int16 v69 = v40;
    if (v39)
    {
      v64 = v30;
      id v65 = v16;
      uint64_t v67 = v18;
      v68 = v12;
      id v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v39, "count"));
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v43 = v39;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v77 objects:v86 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v78 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = [*(id *)(*((void *)&v77 + 1) + 8 * i) objectForKeyedSubscript:@"PHRelatedAssetIdentifierKey"];
            [v42 addObject:v48];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v77 objects:v86 count:16];
        }
        while (v45);
      }

      id v13 = v71;
      id v49 = (void *)[v71 copy];
      if (!v49)
      {
        id v49 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v11];
        [v49 setIncludeHiddenAssets:0];
        id v50 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
        v85[0] = v50;
        id v51 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
        v85[1] = v51;
        __int16 v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
        [v49 setSortDescriptors:v52];

        v84 = @"PHAssetPropertySetOriginalMetadata";
        v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
        [v49 addFetchPropertySets:v53];
      }
      if (v67)
      {
        __int16 v54 = [MEMORY[0x1E4F1CA48] array];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v55 = v68;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v73 objects:v83 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v74;
          do
          {
            for (uint64_t j = 0; j != v57; ++j)
            {
              if (*(void *)v74 != v58) {
                objc_enumerationMutation(v55);
              }
              uint64_t v60 = [*(id *)(*((void *)&v73 + 1) + 8 * j) objectID];
              [v54 addObject:v60];
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v73 objects:v83 count:16];
          }
          while (v57);
        }

        v61 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K IN %@", @"detectedFaces", @"personForFace", v54];
        [v49 setInternalPredicate:v61];
        [v49 setPredicate:0];

        id v13 = v71;
      }
      uint64_t v62 = +[PHAsset fetchAssetsWithLocalIdentifiers:v42 options:v49];

      id v12 = v68;
      id v30 = v64;
      uint64_t v16 = v65;
    }
    else
    {
      uint64_t v62 = 0;
    }
    id v32 = v62;

    id v21 = v32;
    double v17 = v70;
LABEL_63:

    goto LABEL_64;
  }
  double v17 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Photo Analysis Client is nil", buf, 2u);
  }
  id v21 = 0;
LABEL_64:

  return v21;
}

uint64_t __111__PHAsset_Curated___requestCuratedAssetInAssetCollection_referenceAsset_referencePersons_fetchOptions_onlyKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (BOOL)isOriginalRaw
{
  dispatch_queue_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  id v3 = [(PHAsset *)self originalUTI];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F44498]];

  return v5;
}

- (id)originalUTI
{
  id v3 = [(PHAsset *)self pathForOriginalFile];
  id v4 = [v3 pathExtension];

  char v5 = objc_msgSend(MEMORY[0x1E4F8A950], "uniformTypeIdentifierFromPathExtension:assetType:", v4, -[PHAsset kind](self, "kind"));

  return v5;
}

- (BOOL)shouldUseRAWResourceWithOriginalResourceChoice:(unint64_t)a3
{
  if (a3 == 1)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(PHAsset *)self isOriginalRaw];
    if (v3)
    {
      int v6 = ![(PHAsset *)self hasAdjustments];
      if (a3 == 3) {
        LOBYTE(v3) = v6;
      }
      else {
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (BOOL)shouldUseRAWResourceAsUnadjustedEditBase
{
  if (PHDeviceSupportsRAW_onceToken != -1) {
    dispatch_once(&PHDeviceSupportsRAW_onceToken, &__block_literal_global_18412);
  }
  if (!PHDeviceSupportsRAW_deviceSupportsRAW) {
    return 0;
  }
  unint64_t v3 = [(PHAsset *)self originalResourceChoice];

  return [(PHAsset *)self shouldUseRAWResourceWithOriginalResourceChoice:v3];
}

- (unint64_t)originalChoiceToFallbackForUnsupportRAW
{
  unint64_t v3 = [(PHAsset *)self originalResourceChoice];
  if (v3 == 1) {
    return 0;
  }
  unint64_t v5 = v3;
  if (((v3 == 0) & [(PHAsset *)self isOriginalRaw]) != 0) {
    return 3;
  }
  else {
    return v5;
  }
}

- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F15758];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke;
  v8[3] = &unk_1E5847258;
  id v9 = v5;
  id v7 = v5;
  [a3 requestExportSessionWithExportPreset:v6 resultHandler:v8];
}

void __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];

    uint64_t v6 = [NSString stringWithFormat:@"RenderedContent-%@.MOV", v5];
    id v7 = NSTemporaryDirectory();
    id v8 = [v7 stringByAppendingPathComponent:v6];

    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    [v3 setOutputFileType:*MEMORY[0x1E4F15AB0]];
    [v3 setOutputURL:v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2;
    v12[3] = &unk_1E58487E0;
    id v13 = v3;
    id v10 = *(id *)(a1 + 32);
    id v14 = v9;
    id v15 = v10;
    id v11 = v9;
    [v13 exportAsynchronouslyWithCompletionHandler:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) status] == 4)
  {
    dispatch_queue_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Rendering video failed";
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = (__CFString **)v11;
    id v5 = &v10;
  }
  else
  {
    if ([*(id *)(a1 + 32) status] != 5) {
      goto LABEL_7;
    }
    dispatch_queue_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    id v9 = @"Rendering video cancelled";
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = &v9;
    id v5 = &v8;
  }
  uint64_t v6 = [v3 dictionaryWithObjects:v4 forKeys:v5 count:1];
  id v7 = objc_msgSend(v2, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v6);

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    return;
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_requestRenderedVideoForVideoURL:(id)a3 adjustmentData:(id)a4 canHandleAdjustmentData:(BOOL)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, id, void))a6;
  id v12 = (objc_class *)MEMORY[0x1E4F8CE18];
  id v13 = a4;
  id v14 = [v12 alloc];
  id v15 = [v13 formatIdentifier];
  uint64_t v16 = [v13 formatVersion];
  double v17 = [v13 data];

  uint64_t v18 = (void *)[v14 initWithFormatIdentifier:v15 formatVersion:v16 data:v17 baseVersion:0 editorBundleID:0 renderTypes:0];
  if (-[PHAsset isPhotoIris](self, "isPhotoIris") || a5 || ([v18 isRecognizedFormat] & 1) == 0)
  {
    v11[2](v11, v10, 0);
  }
  else
  {
    double v19 = [MEMORY[0x1E4F166C8] assetWithURL:v10];
    double v20 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v19 videoAdjustments:v18];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __120__PHAsset_PHContentEditingInput___requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke;
    v21[3] = &unk_1E5847230;
    uint64_t v22 = v11;
    [(PHAsset *)self _renderTemporaryVideoForObjectBuilder:v20 resultHandler:v21];
  }
}

uint64_t __120__PHAsset_PHContentEditingInput___requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelContentEditingInputRequest:(PHContentEditingInputRequestID)requestID
{
  id v4 = +[PHImageManager defaultManager];
  [v4 cancelImageRequest:requestID];
}

- (PHContentEditingInputRequestID)requestContentEditingInputWithOptions:(PHContentEditingInputRequestOptions *)options completionHandler:(void *)completionHandler
{
  id v7 = options;
  uint64_t v8 = completionHandler;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    id v14 = NSString;
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 stringWithFormat:@"%@ cannot be used on a non-existing asset", v15];
    id v17 = [v12 exceptionWithName:v13 reason:v16 userInfo:0];

    objc_exception_throw(v17);
  }
  id v9 = +[PHImageManager defaultManager];
  PHContentEditingInputRequestID v10 = (int)[v9 requestContentEditingInputForAsset:self withOptions:v7 completionHandler:v8];

  return v10;
}

- (id)_imageRequestOptionsForBaseVersion:(int64_t)a3 options:(id)a4 progressEstimateForImageProgress:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  PHContentEditingInputRequestID v10 = objc_opt_new();
  [v10 setDeliveryMode:1];
  [v10 setLoadingMode:65537];
  objc_msgSend(v10, "setNetworkAccessAllowed:", objc_msgSend(v8, "isNetworkAccessAllowed"));
  id v11 = [v8 progressHandler];

  if (v11)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __110__PHAsset_PHContentEditingInput___imageRequestOptionsForBaseVersion_options_progressEstimateForImageProgress___block_invoke;
    id v17 = &unk_1E58447F0;
    id v19 = v9;
    id v18 = v8;
    [v10 setProgressHandler:&v14];
  }
  int64_t v12 = +[PHAdjustmentData imageRequestVersionFromAdjustmentBaseVersion:](PHAdjustmentData, "imageRequestVersionFromAdjustmentBaseVersion:", a3, v14, v15, v16, v17);
  if (([v8 dontAllowRAW] & 1) == 0 && v12 == 1)
  {
    if ([(PHAsset *)self shouldUseRAWResourceAsUnadjustedEditBase]) {
      int64_t v12 = 2;
    }
    else {
      int64_t v12 = 1;
    }
  }
  [v10 setVersion:v12];

  return v10;
}

void __110__PHAsset_PHContentEditingInput___imageRequestOptionsForBaseVersion_options_progressEstimateForImageProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = [*(id *)(a1 + 32) progressHandler];
  v6[2](v6, a3, v5);
}

- (id)_videoRequestOptionsForBaseVersion:(int64_t)a3 options:(id)a4 progressEstimateForVideoProgress:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  PHContentEditingInputRequestID v10 = objc_opt_new();
  [v10 setDeliveryMode:1];
  objc_msgSend(v10, "setNetworkAccessAllowed:", objc_msgSend(v8, "isNetworkAccessAllowed"));
  objc_msgSend(v10, "setVideoComplementAllowed:", -[PHAsset isPhotoIris](self, "isPhotoIris"));
  id v11 = [v8 progressHandler];

  if (v11)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __110__PHAsset_PHContentEditingInput___videoRequestOptionsForBaseVersion_options_progressEstimateForVideoProgress___block_invoke;
    uint64_t v16 = &unk_1E58447F0;
    id v18 = v9;
    id v17 = v8;
    [v10 setProgressHandler:&v13];
  }
  objc_msgSend(v10, "setVersion:", +[PHAdjustmentData videoRequestVersionFromAdjustmentBaseVersion:](PHAdjustmentData, "videoRequestVersionFromAdjustmentBaseVersion:", a3, v13, v14, v15, v16));

  return v10;
}

void __110__PHAsset_PHContentEditingInput___videoRequestOptionsForBaseVersion_options_progressEstimateForVideoProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = [*(id *)(a1 + 32) progressHandler];
  v6[2](v6, a3, v5);
}

- (int64_t)_baseVersionForAdjustmentData:(id)a3 canHandleAdjustmentData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [v6 _hasAdjustments];
  if (v7) {
    int64_t v8 = 2;
  }
  else {
    int64_t v8 = 0;
  }
  if (v7 && v4)
  {
    if ([v6 baseVersion])
    {
      if ([(PHAsset *)self isVideo]) {
        int64_t v8 = 2;
      }
      else {
        int64_t v8 = 1;
      }
    }
    else
    {
      int64_t v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_canHandleAdjustmentData:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isOpaque] & 1) != 0 || !objc_msgSend(v5, "_hasAdjustments"))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = [v6 canHandleAdjustmentData];

    if (v7)
    {
      int64_t v8 = [v6 canHandleAdjustmentData];
      LOBYTE(v7) = ((uint64_t (**)(void, id))v8)[2](v8, v5);
    }
  }

  return (char)v7;
}

- (unsigned)videoCpVisibilityState
{
  return self->_videoCpVisibilityState;
}

- (double)highlightVisibilityScore
{
  return self->_highlightVisibilityScore;
}

- (double)highlightPromotionScore
{
  return self->_highlightPromotionScore;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (BOOL)isPhotoIris
{
  return self->_isPhotoIris;
}

- (BOOL)isStyleable
{
  return self->_isStyleable;
}

- (unsigned)videoDeferredProcessingNeeded
{
  return self->_videoDeferredProcessingNeeded;
}

- (NSDate)analysisStateModificationDate
{
  return self->_analysisStateModificationDate;
}

- (void)setAssetDescriptionWasSet:(BOOL)a3
{
  self->_assetDescriptionWasSet = a3;
}

- (BOOL)assetDescriptionWasSet
{
  return self->_assetDescriptionWasSet;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (id)faceAdjustmentVersion
{
  return self->_faceAdjustmentVersion;
}

- (double)faceAreaMaxY
{
  return self->_faceAreaMaxY;
}

- (double)faceAreaMinY
{
  return self->_faceAreaMinY;
}

- (double)faceAreaMaxX
{
  return self->_faceAreaMaxX;
}

- (double)faceAreaMinX
{
  return self->_faceAreaMinX;
}

- (NSArray)faceRegions
{
  return self->_faceRegions;
}

- (CGRect)acceptableCropRect
{
  double x = self->_acceptableCropRect.origin.x;
  double y = self->_acceptableCropRect.origin.y;
  double width = self->_acceptableCropRect.size.width;
  double height = self->_acceptableCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredCropRect.origin.x;
  double y = self->_preferredCropRect.origin.y;
  double width = self->_preferredCropRect.size.width;
  double height = self->_preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)creationDateSource
{
  return self->_creationDateSource;
}

- (signed)generativeMemoryCreationEligibilityState
{
  return self->_generativeMemoryCreationEligibilityState;
}

- (signed)currentSmartStyleCast
{
  return self->_currentSmartStyleCast;
}

- (unsigned)syndicationState
{
  return self->_syndicationState;
}

- (int64_t)videoCpDurationValue
{
  return self->_videoCpDurationValue;
}

- (float)overallAestheticScore
{
  return self->_overallAestheticScore;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (NSString)originalColorSpace
{
  return self->_originalColorSpace;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (unsigned)adjustmentsState
{
  return self->_adjustmentsState;
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (unint64_t)persistenceState
{
  return self->_persistenceState;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (BOOL)cloudIsDeletable
{
  return self->_cloudIsDeletable;
}

- (NSData)locationData
{
  return self->_locationData;
}

- (unsigned)avalancheKind
{
  return self->_avalancheKind;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (BOOL)isSyncFailureHidden
{
  return self->_syncFailureHidden;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (CGRect)normalizedFaceAreaRect
{
  [(PHAsset *)self originalFaceAreaRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PHAsset *)self faceAreaMinY];
  double v12 = v11;
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  CGFloat Height = CGRectGetHeight(v18);
  double v14 = 1.0 - (v12 + Height * 0.5) - Height * 0.5;
  double v15 = v4;
  double v16 = v8;
  double v17 = v10;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v14;
  result.origin.double x = v15;
  return result;
}

- (NSValue)originalFaceAreaRectValue
{
  [(PHAsset *)self originalFaceAreaRect];
  CGRect v4 = v6;
  if (CGRectIsEmpty(v6))
  {
    dispatch_queue_t v2 = 0;
  }
  else
  {
    dispatch_queue_t v2 = [MEMORY[0x1E4F29238] valueWithBytes:&v4 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  }

  return (NSValue *)v2;
}

- (CGRect)originalFaceAreaRect
{
  [(PHAsset *)self faceAreaMinX];
  double v4 = v3;
  [(PHAsset *)self faceAreaMinY];
  double v6 = v5;
  [(PHAsset *)self faceAreaMaxX];
  double v8 = v7;
  [(PHAsset *)self faceAreaMaxY];
  double v9 = v8 - v4;
  double v11 = v10 - v6;
  double v12 = v4;
  double v13 = v6;
  result.size.double height = v11;
  result.size.double width = v9;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (NSManagedObjectContext)managedObjectContextForFetchingResources
{
  double v3 = [(PHObject *)self photoLibrary];
  double v4 = [v3 objectFetchingManagedObjectContextForObject:self propertySet:@"PHAssetPropertySetCore"];

  return (NSManagedObjectContext *)v4;
}

- (NSString)croppingDebugDescription
{
  v38[5] = *MEMORY[0x1E4F143B8];
  if ([(PHAsset *)self pixelWidth] && [(PHAsset *)self pixelHeight])
  {
    PFDeviceScreenSize();
    v37[0] = @"square";
    double v3 = DCIM_NSValueFromCGSize();
    v38[0] = v3;
    v37[1] = @"standard4x3";
    double v4 = DCIM_NSValueFromCGSize();
    v38[1] = v4;
    v37[2] = @"wide16x9";
    double v5 = DCIM_NSValueFromCGSize();
    v38[2] = v5;
    v37[3] = @"screenDefault";
    double v6 = DCIM_NSValueFromCGSize();
    v38[3] = v6;
    v37[4] = @"screenTranspose";
    double v7 = DCIM_NSValueFromCGSize();
    v38[4] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];

    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v30 = *MEMORY[0x1E4F1DB20];
      double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v31 = 0;
          id v19 = [v10 objectForKey:v18];
          double v20 = MEMORY[0x19F388460]();
          double v22 = v21;

          -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v31, v20, v22, v30, v14, v15, v16);
          uint64_t v23 = v31;
          id v28 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v24, v25, v26, v27];
          [v9 appendFormat:@"\n%@=%f,%@", v18, v23, v28];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v9 = 0;
  }

  return (NSString *)v9;
}

- (NSString)variationSuggestionStatesDetails
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(PHObject *)self addFetchPropertyHint:16];
  double v3 = (void *)MEMORY[0x1E4F28E78];
  double v4 = [(PHAsset *)self photosOneUpProperties];
  double v5 = objc_msgSend(v3, "stringWithFormat:", @"[variationSuggestionState = %llu] ", objc_msgSend(v4, "variationSuggestionStates"));

  double v6 = [(PHObject *)self photoLibrary];
  id v19 = [v6 variationCache];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [&unk_1EEB26A48 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(&unk_1EEB26A48);
        }
        uint64_t v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) integerValue];
        unint64_t v12 = [(PHAsset *)self variationSuggestionStatesForVariationType:v11];
        uint64_t v13 = [(id)objc_opt_class() _descriptionForVariationSuggestionType:v11];
        double v14 = [(id)objc_opt_class() _descriptionForVariationSuggestionStates:v12];
        [v5 appendFormat:@"\n\t%@: [%llu] %@", v13, v12, v14];
        if ((v12 & 2) != 0)
        {
          if ((unint64_t)(v11 - 1) >= 3) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = v11;
          }
          double v16 = [(PHObject *)self uuid];
          double v17 = [v19 gatingResultForVariationType:v15 assetIdentifier:v16];

          [v5 appendFormat:@" %@", v17];
        }
      }
      uint64_t v8 = [&unk_1EEB26A48 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSString)metadataDebugDescription
{
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__21007;
  long long v37 = __Block_byref_object_dispose__21008;
  id v38 = &stru_1EEAC1950;
  PHAssetMediaType v3 = [(PHAsset *)self mediaType];
  BOOL v4 = [(PHAsset *)self mediaType] == PHAssetMediaTypeVideo || [(PHAsset *)self isPhotoIris];
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  double v5 = dispatch_group_create();
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.photos.metadatadebugdescription", 0);
  if (v3 == PHAssetMediaTypeImage)
  {
    dispatch_group_enter(v5);
    uint64_t v7 = (void *)v34[5];
    v34[5] = @"==========================\nImage Metadata:\n\n";

    uint64_t v8 = objc_opt_new();
    [v8 setDeliveryMode:1];
    [v8 setLoadingMode:1];
    if ([(PHAsset *)self hasAdjustments]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
    [v8 setVersion:v9];
    [v8 setNetworkAccessAllowed:1];
    [v8 setSynchronous:0];
    [v8 setResultHandlerQueue:v6];
    id v10 = +[PHImageManager defaultManager];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __35__PHAsset_metadataDebugDescription__block_invoke;
    v26[3] = &unk_1E58453B0;
    id v28 = &v33;
    uint64_t v27 = v5;
    [v10 requestImageDataAndOrientationForAsset:self options:v8 resultHandler:v26];
  }
  if (v4)
  {
    dispatch_group_enter(v5);
    uint64_t v11 = [(id)v34[5] stringByAppendingString:@"==========================\nVideo Metadata:\n\n"];
    unint64_t v12 = (void *)v34[5];
    v34[5] = v11;

    uint64_t v13 = objc_opt_new();
    [v13 setNetworkAccessAllowed:1];
    [v13 setDeliveryMode:1];
    [v13 setResultHandlerQueue:v6];
    double v14 = +[PHImageManager defaultManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __35__PHAsset_metadataDebugDescription__block_invoke_2;
    v22[3] = &unk_1E58453D8;
    uint64_t v24 = &v33;
    uint64_t v25 = &v29;
    uint64_t v15 = v5;
    long long v23 = v15;
    [v14 requestURLForVideo:self options:v13 resultHandler:v22];

    dispatch_time_t v16 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v15, v16);
    if (*((unsigned char *)v30 + 24)) {
      goto LABEL_15;
    }
    uint64_t v17 = [(id)v34[5] stringByAppendingString:@"Request Timed out."];
    uint64_t v18 = (void *)v34[5];
    v34[5] = v17;
  }
  else
  {
    dispatch_time_t v19 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v5, v19);
    if (v3 == PHAssetMediaTypeImage) {
      goto LABEL_15;
    }
    uint64_t v18 = (void *)v34[5];
    v34[5] = @"Can only print metadata for photos and videos";
  }

LABEL_15:
  id v20 = (id)v34[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return (NSString *)v20;
}

void __35__PHAsset_metadataDebugDescription__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  CFDataRef data = a2;
  id v8 = a3;
  id v9 = a5;
  if (v8
    && ([MEMORY[0x1E4F442D8] typeWithIdentifier:v8],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 conformsToType:*MEMORY[0x1E4F44400]],
        v10,
        data)
    && v11)
  {
    unint64_t v12 = CGImageSourceCreateWithData(data, 0);
    uint64_t v13 = CGImageSourceCopyProperties(v12, 0);
    int64_t Count = CGImageSourceGetCount(v12);
    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@"%@\nImage Count: %lu\n\n", v13, Count];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (Count >= 1)
    {
      for (uint64_t i = 0; i != Count; ++i)
      {
        dispatch_time_t v19 = [MEMORY[0x1E4F8CC38] imagePropertiesFromImageSource:v12 atIndex:i];
        uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@"==========================\nImage at index %lu:\n\n%@\n\n", i, v19];
        uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
        long long v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;
      }
    }
    CFRelease(v12);
  }
  else
  {
    long long v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v13 = [v9 objectForKey:@"PHImageErrorKey"];
    uint64_t v24 = [v23 stringByAppendingFormat:@"There was an error getting the maximum size image: %@\n\n", v13];
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __35__PHAsset_metadataDebugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v23 = [MEMORY[0x1E4F16330] assetWithURL:a2];
    BOOL v4 = [v23 metadata];
    double v5 = [MEMORY[0x1E4F28E78] stringWithFormat:&stru_1EEAC1950];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v11 = [v10 commonKey];
          unint64_t v12 = [v10 key];
          uint64_t v13 = [v10 keySpace];
          [v5 appendFormat:@"%@ (%@, %@): \n", v11, v12, v13];

          double v14 = [v10 stringValue];
          [v5 appendFormat:@"\t%@\n\n", v14];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }

    uint64_t v3 = a1;
    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingString:v5];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    dispatch_time_t v19 = [a3 objectForKeyedSubscript:@"PHImageErrorKey"];
    uint64_t v20 = [v18 stringByAppendingFormat:@"There was en error getting the video: %@", v19];
    uint64_t v21 = *(void *)(*(void *)(v3 + 40) + 8);
    long long v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  *(unsigned char *)(*(void *)(*(void *)(v3 + 48) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(v3 + 32));
}

- (NSString)resourcesDebugDescription
{
  uint64_t v3 = [(PHAsset *)self pl_photoLibrary];
  BOOL v4 = [(PHAsset *)self description];
  double v5 = (void *)[v4 mutableCopy];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__21007;
  dispatch_time_t v19 = __Block_byref_object_dispose__21008;
  id v20 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __36__PHAsset_resourcesDebugDescription__block_invoke;
  int v11 = &unk_1E5848318;
  unint64_t v12 = self;
  id v6 = v3;
  id v13 = v6;
  double v14 = &v15;
  [v6 performBlockAndWait:&v8 completionHandler:0];
  [v5 appendFormat:@"\n'modern' resources: %@\n", v16[5], v8, v9, v10, v11, v12];

  _Block_object_dispose(&v15, 8);

  return (NSString *)v5;
}

void __36__PHAsset_resourcesDebugDescription__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 descriptionForModernResources];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    double v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    dispatch_queue_t v2 = v6;
  }
}

- (id)descriptionForPhotoAnanlysisWallpaperProeprtiesWithManagedAsset:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v5 = [(PHAsset *)self _createPropertyObjectOfClass:objc_opt_class()];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 wallpaperPropertiesData];
    objc_msgSend(v4, "appendFormat:", @"wallpaperPropertiesData: %p (size: %lu)\n", v7, objc_msgSend(v7, "length"));
    uint64_t v8 = [v6 wallpaperPropertiesTimestamp];
    [v4 appendFormat:@"wallpaperPropertiesTimestamp: %@\n", v8];

    objc_msgSend(v4, "appendFormat:", @"wallpaperPropertiesVersion: %llu\n", objc_msgSend(v6, "wallpaperPropertiesVersion"));
    if (v7)
    {
      uint64_t v12 = 0;
      uint64_t v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v12];
      id v10 = (void *)v9;
      if (v9) {
        [v4 appendFormat:@"wallpaperProperties: %@\n", v9];
      }
      else {
        [v4 appendFormat:@"wallpaperProperties error: %@\n", v12];
      }
    }
  }
  else
  {
    [v4 appendString:@"nil"];
  }

  return v4;
}

- (id)descriptionForAestheticsWithManagedAsset:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v5 = [(PHAsset *)self _createPropertyObjectOfClass:objc_opt_class()];
  [v4 appendString:@"\n"];
  [v5 wellFramedSubjectScore];
  objc_msgSend(v4, "appendFormat:", @"wellFramedSubjectScore = %f\n", v6);
  [v5 wellChosenSubjectScore];
  objc_msgSend(v4, "appendFormat:", @"wellChosenSubjectScore = %f\n", v7);
  [v5 tastefullyBlurredScore];
  objc_msgSend(v4, "appendFormat:", @"tastefullyBlurredScore = %f\n", v8);
  [v5 sharplyFocusedSubjectScore];
  objc_msgSend(v4, "appendFormat:", @"sharplyFocusedSubjectScore = %f\n", v9);
  [v5 wellTimedShotScore];
  objc_msgSend(v4, "appendFormat:", @"wellTimedShotScore = %f\n", v10);
  [v5 pleasantLightingScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantLightingScore = %f\n", v11);
  [v5 pleasantReflectionsScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantReflectionsScore = %f\n", v12);
  [v5 harmoniousColorScore];
  objc_msgSend(v4, "appendFormat:", @"harmoniousColorScore = %f\n", v13);
  [v5 livelyColorScore];
  objc_msgSend(v4, "appendFormat:", @"livelyColorScore = %f\n", v14);
  [v5 pleasantSymmetryScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantSymmetryScore = %f\n", v15);
  [v5 pleasantPatternScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantPatternScore = %f\n", v16);
  [v5 immersivenessScore];
  objc_msgSend(v4, "appendFormat:", @"immersivenessScore = %f\n", v17);
  [v5 pleasantPerspectiveScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantPerspectiveScore = %f\n", v18);
  [v5 pleasantPostProcessingScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantPostProcessingScore = %f\n", v19);
  [v5 noiseScore];
  objc_msgSend(v4, "appendFormat:", @"noiseScore = %f\n", v20);
  [v5 failureScore];
  objc_msgSend(v4, "appendFormat:", @"failureScore = %f\n", v21);
  [v5 pleasantCompositionScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantCompositionScore = %f\n", v22);
  [v5 interestingSubjectScore];
  objc_msgSend(v4, "appendFormat:", @"interestingSubjectScore = %f\n", v23);
  [v5 intrusiveObjectPresenceScore];
  objc_msgSend(v4, "appendFormat:", @"intrusiveObjectPresenceScore = %f\n", v24);
  [v5 pleasantCameraTiltScore];
  objc_msgSend(v4, "appendFormat:", @"pleasantCameraTiltScore = %f\n", v25);
  [v5 lowLight];
  objc_msgSend(v4, "appendFormat:", @"lowLight = %f\n", v26);

  return v4;
}

- (id)descriptionForMediaAnalysisWithManagedAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  float v6 = [(PHAsset *)self _createPropertyObjectOfClass:objc_opt_class()];
  float v7 = [v6 mediaAnalysisTimeStamp];
  [v5 appendFormat:@"mediaAnalysisTimeStamp = %@\n", v7];

  objc_msgSend(v5, "appendFormat:", @"mediaAnalysisVersion = %llu\n", objc_msgSend(v6, "mediaAnalysisVersion"));
  objc_msgSend(v5, "appendFormat:", @"mediaAnalysisImageVersion = %hd\n", (int)objc_msgSend(v6, "mediaAnalysisImageVersion"));
  objc_msgSend(v5, "appendFormat:", @"imageCaptionVersion = %hd\n", (int)objc_msgSend(v6, "imageCaptionVersion"));
  objc_msgSend(v5, "appendFormat:", @"videoCaptionVersion = %hd\n", (int)objc_msgSend(v6, "videoCaptionVersion"));
  long long v47 = 0uLL;
  CMTimeEpoch v48 = 0;
  if (v4 && ([v4 videoKeyFrameTime], (BYTE12(v47) & 0x1D) == 1))
  {
    *(_OWORD *)&time.start.value = v47;
    time.start.epoch = v48;
    objc_msgSend(v5, "appendFormat:", @"bestKeyFrameTime = %0.3f sec\n", CMTimeGetSeconds(&time.start));
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", @"bestKeyFrameTime not set\n", v39);
  }
  memset(&time, 0, sizeof(time));
  if (!v6)
  {
    [v5 appendFormat:@"bestVideoTimeRange not set\n"];
    memset(&v44, 0, sizeof(v44));
LABEL_16:
    objc_msgSend(v5, "appendFormat:", @"animatedStickerTimeRange not set\n", *(void *)&v40, *(void *)&v41);
    goto LABEL_17;
  }
  [v6 bestVideoTimeRange];
  if ((time.start.flags & 1) == 0
    || (~time.duration.flags & 0x11) == 0
    || (time.start.flags & 0x11) == 0x11
    || (time.duration.flags & 1) == 0
    || time.duration.epoch
    || time.duration.value < 0)
  {
    float v8 = @"bestVideoTimeRange not set\n";
  }
  else
  {
    *(_OWORD *)&v44.start.value = *(_OWORD *)&time.start.value;
    v44.start.epoch = time.start.epoch;
    Float64 Seconds = CMTimeGetSeconds(&v44.start);
    CMTimeRange v44 = time;
    CMTimeRangeGetEnd(&v45, &v44);
    Float64 v40 = Seconds;
    Float64 v41 = CMTimeGetSeconds(&v45);
    float v8 = @"bestVideoTimeRange = [ %0.3f .. %0.3f ] sec\n";
  }
  objc_msgSend(v5, "appendFormat:", v8, *(void *)&v40, *(void *)&v41);
  memset(&v44, 0, sizeof(v44));
  [v6 animatedStickerTimeRange];
  if ((v44.start.flags & 1) == 0
    || (~v44.duration.flags & 0x11) == 0
    || (v44.start.flags & 0x11) == 0x11
    || (v44.duration.flags & 1) == 0
    || v44.duration.epoch
    || v44.duration.value < 0)
  {
    goto LABEL_16;
  }
  *(_OWORD *)&v42.start.value = *(_OWORD *)&v44.start.value;
  v42.start.epoch = v44.start.epoch;
  Float64 v38 = CMTimeGetSeconds(&v42.start);
  CMTimeRange v42 = v44;
  CMTimeRangeGetEnd(&v43, &v42);
  objc_msgSend(v5, "appendFormat:", @"animatedStickerTimeRange = [ %0.3f .. %0.3f ] sec\n", *(void *)&v38, CMTimeGetSeconds(&v43));
LABEL_17:
  [v6 bestPlaybackRect];
  float v10 = DCIM_NSStringFromCGRect();
  [v5 appendFormat:@"bestPlaybackRect = %@\n", v10];

  [v6 blurrinessScore];
  objc_msgSend(v5, "appendFormat:", @"blurrinessScore = %0.3f\n", v11);
  [v6 exposureScore];
  objc_msgSend(v5, "appendFormat:", @"exposureScore = %0.3f\n", v12);
  [v6 wallpaperScore];
  objc_msgSend(v5, "appendFormat:", @"wallpaperScore = %0.3f\n", v13);
  [v6 autoplaySuggestionScore];
  objc_msgSend(v5, "appendFormat:", @"autoplaySuggestionScore = %0.3f\n", v14);
  [v6 videoStickerSuggestionScore];
  objc_msgSend(v5, "appendFormat:", @"videoStickerSuggestionScore = %0.3f\n", v15);
  [v6 videoScore];
  objc_msgSend(v5, "appendFormat:", @"videoScore = %0.3f\n", v16);
  [v6 activityScore];
  objc_msgSend(v5, "appendFormat:", @"activityScore = %0.3f\n", v17);
  [v6 audioScore];
  objc_msgSend(v5, "appendFormat:", @"audioScore = %0.3f\n", v18);
  [v6 settlingEffectScore];
  objc_msgSend(v5, "appendFormat:", @"settlingEffectScore = %0.3f\n", v19);
  objc_msgSend(v5, "appendFormat:", @"faceint64_t Count = %llu\n", objc_msgSend(v6, "faceCount"));
  float v20 = PHAssetMediaAnalysisStringsWithMultipleAudioClassifications([v6 audioClassification]);
  float v21 = [v20 componentsJoinedByString:@" | "];
  [v5 appendFormat:@"audioClassification = %@\n", v21];

  objc_msgSend(v5, "appendFormat:", @"probableRotationDirection = %hd\n", (int)objc_msgSend(v6, "probableRotationDirection"));
  [v6 probableRotationDirectionConfidence];
  objc_msgSend(v5, "appendFormat:", @"probableRotationDirectionConfidence = %g\n", v22);
  float v23 = [v6 colorNormalizationData];
  [v5 appendFormat:@"colorNormalizationData = %@\n", v23];

  float v24 = [(PHAsset *)self _createPropertyObjectOfClass:objc_opt_class()];
  objc_msgSend(v5, "appendFormat:", @"characterRecognitionAlgorithmVersion = %ld\n", objc_msgSend(v24, "algorithmVersion"));
  float v25 = [v24 adjustmentVersion];
  [v5 appendFormat:@"characterRecognitionAdjustmentVersion = %@\n", v25];

  float v26 = [v24 characterRecognitionData];
  long long v27 = [v24 characterRecognitionData];
  objc_msgSend(v5, "appendFormat:", @"characterRecognitionData = %p(.characterRecognitionData.length = %lu)\n", v26, objc_msgSend(v27, "length"));

  long long v28 = [v24 machineReadableCodeData];
  long long v29 = [v24 machineReadableCodeData];
  objc_msgSend(v5, "appendFormat:", @"machineReadableCodeData = %p(.machineReadableCodeData.length = %lu)\n", v28, objc_msgSend(v29, "length"));

  objc_msgSend(v5, "appendFormat:", @"screenTimeDeviceImageSensitivitdouble y = %hd\n", (int)objc_msgSend(v6, "screenTimeDeviceImageSensitivity"));
  double v30 = [(PHAsset *)self _createPropertyObjectOfClass:objc_opt_class()];
  objc_msgSend(v5, "appendFormat:", @"visualSearchAlgorithmVersion = %ld\n", objc_msgSend(v30, "algorithmVersion"));
  uint64_t v31 = [v30 adjustmentVersion];
  [v5 appendFormat:@"visualSearchAdjustmentVersion = %@\n", v31];

  char v32 = [v30 visualSearchData];
  uint64_t v33 = [v30 visualSearchData];
  objc_msgSend(v5, "appendFormat:", @"visualSearchData = %p(.visualSearchData.length = %lu)\n", v32, objc_msgSend(v33, "length"));

  [v30 stickerConfidenceScore];
  objc_msgSend(v5, "appendFormat:", @"stickerConfidenceScore = %0.3f\n", v34);
  objc_msgSend(v5, "appendFormat:", @"stickerAlgorithmVersion = %ld\n", objc_msgSend(v30, "stickerAlgorithmVersion"));
  objc_msgSend(v5, "appendFormat:", @"syndicationProcessingValue = %hu\n", objc_msgSend(v6, "syndicationProcessingValue"));
  uint64_t v35 = PHAssetSyndicationProcessingVersionDescription([v6 syndicationProcessingVersion]);
  [v5 appendFormat:@"syndicationProcessingVersion = %@\n", v35];

  objc_msgSend(v5, "appendFormat:", @"privateEncryptedComputeAnalysisVersion = %d", (int)objc_msgSend(v6, "privateEncryptedComputeAnalysisVersion"));
  long long v36 = [v6 privateEncryptedComputeAnalysisTimestamp];
  [v5 appendFormat:@"privateEncryptedComputeAnalysisTimestamp = %@", v36];

  return v5;
}

- (id)detailedDebugDescriptionInLibrary:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    float v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PHAsset.m", 4395, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  float v6 = [(PHAsset *)self description];
  float v7 = (void *)[v6 mutableCopy];

  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__21007;
  v104 = __Block_byref_object_dispose__21008;
  id v105 = 0;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__21007;
  v98 = __Block_byref_object_dispose__21008;
  id v99 = 0;
  uint64_t v88 = 0;
  id v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__21007;
  v92 = __Block_byref_object_dispose__21008;
  id v93 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__21007;
  v86 = __Block_byref_object_dispose__21008;
  id v87 = 0;
  id v79 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__21007;
  v80[4] = __Block_byref_object_dispose__21008;
  id v81 = 0;
  uint64_t v74 = 0;
  long long v75 = &v74;
  uint64_t v76 = 0x3032000000;
  long long v77 = __Block_byref_object_copy__21007;
  long long v78 = __Block_byref_object_dispose__21008;
  uint64_t v68 = 0;
  __int16 v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = __Block_byref_object_copy__21007;
  id v72 = __Block_byref_object_dispose__21008;
  id v73 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  id v65 = __Block_byref_object_copy__21007;
  uint64_t v66 = __Block_byref_object_dispose__21008;
  id v67 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  long long v59 = __Block_byref_object_copy__21007;
  uint64_t v60 = __Block_byref_object_dispose__21008;
  id v61 = 0;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__21007;
  __int16 v54 = __Block_byref_object_dispose__21008;
  id v55 = 0;
  uint64_t v44 = 0;
  CMTime v45 = &v44;
  uint64_t v46 = 0x3032000000;
  long long v47 = __Block_byref_object_copy__21007;
  CMTimeEpoch v48 = __Block_byref_object_dispose__21008;
  id v49 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __45__PHAsset_detailedDebugDescriptionInLibrary___block_invoke;
  v30[3] = &unk_1E5845388;
  v30[4] = self;
  id v31 = v5;
  id v8 = v7;
  id v32 = v8;
  uint64_t v33 = &v88;
  float v34 = &v100;
  uint64_t v35 = &v94;
  long long v36 = v80;
  long long v37 = &v74;
  Float64 v38 = &v68;
  uint64_t v39 = &v62;
  Float64 v40 = &v56;
  Float64 v41 = &v50;
  CMTimeRange v42 = &v44;
  CMTime v43 = &v82;
  id v25 = v31;
  [v31 performBlockAndWait:v30 completionHandler:0];
  [v8 appendFormat:@"\n\nDate Details: %@", v89[5]];
  [v8 appendFormat:@"\n\nAdjustments Details: %@", v101[5]];
  float v9 = [(PHAsset *)self adjustmentsDebugMetadata];
  float v10 = v9;
  if (v9)
  {
    float v11 = [v9 description];
  }
  else
  {
    float v11 = @"<Unsupported Data>";
  }
  if ((unint64_t)[(__CFString *)v11 length] >= 0x201)
  {
    float v12 = [(__CFString *)v11 substringToIndex:512];
    uint64_t v13 = objc_msgSend(v12, "stringByAppendingFormat:", @"... [truncated from total length %lu]", -[__CFString length](v11, "length"));

    float v11 = (__CFString *)v13;
  }
  [v8 appendFormat:@"\n\nAdjustments Data: %@", v11];
  [v8 appendFormat:@"\n\nAdditional Details: %@", v95[5]];
  [v8 appendFormat:@"\n\nAnalysis State Details:\n%@", v75[5]];
  float v14 = [(PHAsset *)self variationSuggestionStatesDetails];
  [v8 appendFormat:@"\n\nVariation Suggestion State Details:\n%@", v14];
  [v8 appendFormat:@"\n\nScene Analysis Details: %@", v69[5]];
  [v8 appendFormat:@"\n\nFace Analysis Details: %@", v63[5]];
  [v8 appendFormat:@"\n\nMedia Analysis Details: %@", v57[5]];
  [v8 appendFormat:@"\n\nAesthetics Details: %@", v51[5]];
  [v8 appendFormat:@"\n\nPhotoAnalysis Wallpaper Properties Details: %@", v45[5]];
  float v15 = [(PHAsset *)self croppingDebugDescription];
  [v8 appendFormat:@"\n\nCropping Details: %@", v15];
  float v16 = [(PHObject *)self uuid];
  float v17 = +[PHImageManagerRequestTracer recentMessagesSummaryForAssetUUID:v16];
  [v8 appendFormat:@"\n\nRecent Image Manager Requests:\n%@", v17];

  if (v83[5]) {
    [v8 appendFormat:@"\n\nResources Details: %@", v83[5]];
  }
  [v8 appendFormat:@"\n\nAsset resources: "];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  float v18 = +[PHAssetResource assetResourcesForAsset:self includeDerivatives:1];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v106 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v18);
        }
        [v8 appendFormat:@"%@\n", *(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v106 count:16];
    }
    while (v19);
  }

  id v22 = v8;
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(v80, 8);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  return v22;
}

void __45__PHAsset_detailedDebugDescriptionInLibrary___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    id v73 = v2;
    [v2 willAccessValueForKey:0];
    uint64_t v3 = [v73 additionalAttributes];
    [v3 willAccessValueForKey:0];

    id v4 = [v73 additionalAttributes];
    id v5 = [v4 unmanagedAdjustment];
    [v5 willAccessValueForKey:0];

    float v6 = *(void **)(a1 + 48);
    float v7 = [v73 description];
    [v6 appendFormat:@"\n\nBacked by: %@", v7];

    id v8 = (void *)MEMORY[0x1E4F28E78];
    float v9 = PLMillisecondDateFormatter();
    float v10 = [v73 dateCreated];
    float v11 = [v9 stringFromDate:v10];
    uint64_t v12 = [v8 stringWithFormat:@"\n\tdateCreated(+ms) = %@", v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    float v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    float v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    float v16 = PLMillisecondDateFormatter();
    float v17 = [v73 localDateCreated];
    float v18 = [v16 stringFromDate:v17];
    [v15 appendFormat:@"\n\tlocalDateCreated(+ms) = %@", v18];

    uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v20 = PLMillisecondDateFormatter();
    float v21 = [v73 addedDate];
    id v22 = [v20 stringFromDate:v21];
    [v19 appendFormat:@"\n\taddedDate(+ms) = %@", v22];

    float v23 = [v73 additionalAttributes];
    float v24 = [v23 unmanagedAdjustment];
    uint64_t v25 = [v24 description];
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    long long v28 = [v73 additionalAttributes];
    long long v29 = [v28 description];
    uint64_t v30 = [v29 mutableCopy];
    uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
    id v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    uint64_t v33 = [v73 location];

    if (v33)
    {
      float v34 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v35 = [v73 location];
      [v34 appendFormat:@"\nid location = %@", v35];
    }
    long long v36 = [v73 title];

    if (v36)
    {
      long long v37 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      Float64 v38 = [v73 title];
      [v37 appendFormat:@"\ntitle = %@", v38];
    }
    uint64_t v39 = [v73 longDescription];

    if (v39)
    {
      Float64 v40 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      Float64 v41 = [v73 longDescription];
      [v40 appendFormat:@"\nlongDescription = %@", v41];
    }
    uint64_t v42 = [v73 descriptionForSidecarFiles];
    uint64_t v43 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v42;

    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) {
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) appendFormat:@"\n%@", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    }
    uint64_t v45 = [v73 descriptionForAnalysisStates];
    uint64_t v46 = *(void *)(*(void *)(a1 + 88) + 8);
    long long v47 = *(void **)(v46 + 40);
    *(void *)(v46 + 40) = v45;

    uint64_t v48 = [v73 descriptionForSceneAnalysis];
    uint64_t v49 = *(void *)(*(void *)(a1 + 96) + 8);
    uint64_t v50 = *(void **)(v49 + 40);
    *(void *)(v49 + 40) = v48;

    uint64_t v51 = [v73 faceDescription];
    uint64_t v52 = *(void *)(*(void *)(a1 + 104) + 8);
    v53 = *(void **)(v52 + 40);
    *(void *)(v52 + 40) = v51;

    uint64_t v54 = [*(id *)(a1 + 32) descriptionForMediaAnalysisWithManagedAsset:v73];
    uint64_t v55 = *(void *)(*(void *)(a1 + 112) + 8);
    uint64_t v56 = *(void **)(v55 + 40);
    *(void *)(v55 + 40) = v54;

    uint64_t v57 = [*(id *)(a1 + 32) descriptionForAestheticsWithManagedAsset:v73];
    uint64_t v58 = *(void *)(*(void *)(a1 + 120) + 8);
    long long v59 = *(void **)(v58 + 40);
    *(void *)(v58 + 40) = v57;

    uint64_t v60 = [*(id *)(a1 + 32) descriptionForPhotoAnanlysisWallpaperProeprtiesWithManagedAsset:v73];
    uint64_t v61 = *(void *)(*(void *)(a1 + 128) + 8);
    uint64_t v62 = *(void **)(v61 + 40);
    *(void *)(v61 + 40) = v60;

    v63 = [*(id *)(a1 + 32) photoLibrary];
    int v64 = [v63 isCloudPhotoLibraryEnabled];

    id v65 = NSString;
    if (v64) {
      [v73 descriptionForResources];
    }
    else {
    uint64_t v66 = [v73 descriptionForNonCloudResources];
    }
    uint64_t v67 = [v65 stringWithFormat:@"\n%@", v66];
    uint64_t v68 = *(void *)(*(void *)(a1 + 136) + 8);
    __int16 v69 = *(void **)(v68 + 40);
    *(void *)(v68 + 40) = v67;

    uint64_t v70 = [v73 additionalAttributes];
    uint64_t v71 = [v70 unmanagedAdjustment];
    [v71 didAccessValueForKey:0];

    id v72 = [v73 additionalAttributes];
    [v72 didAccessValueForKey:0];

    [v73 didAccessValueForKey:0];
    dispatch_queue_t v2 = v73;
  }
}

- (id)wallpaperCroppingDebugKeyValuePairs
{
  v193[34] = *MEMORY[0x1E4F143B8];
  PFDeviceScreenSize();
  double v4 = v3;
  double v6 = v5;
  PFSizeWithAspectRatioFittingSize();
  double v8 = v7;
  double v10 = v9;
  PFSizeWithAspectRatioFittingSize();
  double v179 = v12;
  double v181 = v11;
  double v116 = (double)[(PHAsset *)self pixelWidth];
  double v115 = (double)[(PHAsset *)self pixelHeight];
  uint64_t v191 = 0;
  uint64_t v190 = 0;
  uint64_t v189 = 0;
  double v14 = *MEMORY[0x1E4F1DB20];
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v191, v4, v6, *MEMORY[0x1E4F1DB20], v13, v15, v16);
  uint64_t v164 = v18;
  uint64_t v166 = v17;
  double v162 = v20;
  double v163 = v19;
  PFDeviceLockScreenFocusAreaRectNormalized();
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v190, v4, v6, v21, v22, v23, v24);
  uint64_t v160 = v25;
  uint64_t v156 = v26;
  double v151 = v27;
  double v146 = v28;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v189, v6, v4, v14, v13, v15, v16);
  uint64_t v158 = v29;
  uint64_t v152 = v31;
  uint64_t v154 = v30;
  uint64_t v147 = v32;
  uint64_t v188 = 0;
  uint64_t v187 = 0;
  uint64_t v186 = 0;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v188, v8, v10, v14, v13, v15, v16);
  uint64_t v149 = v33;
  uint64_t v142 = v35;
  uint64_t v144 = v34;
  uint64_t v138 = v36;
  PFDeviceLockScreenFocusAreaRectNormalized();
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v187, v8, v10, v37, v38, v39, v40);
  uint64_t v136 = v41;
  uint64_t v134 = v42;
  uint64_t v132 = v43;
  uint64_t v130 = v44;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v186, v10, v8, v14, v13, v15, v16);
  uint64_t v135 = v45;
  uint64_t v133 = v46;
  uint64_t v131 = v47;
  uint64_t v128 = v48;
  uint64_t v185 = 0;
  uint64_t v183 = 0;
  uint64_t v184 = 0;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v185, v181, v179, v14, v13, v15, v16);
  uint64_t v129 = v49;
  uint64_t v126 = v51;
  uint64_t v127 = v50;
  uint64_t v125 = v52;
  PFDeviceLockScreenFocusAreaRectNormalized();
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v184, v181, v179, v53, v54, v55, v56);
  uint64_t v124 = v57;
  uint64_t v122 = v58;
  uint64_t v120 = v59;
  uint64_t v118 = v60;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v183, v179, v181, v14, v13, v15, v16);
  uint64_t v123 = v61;
  uint64_t v121 = v62;
  uint64_t v119 = v63;
  uint64_t v117 = v64;
  id v65 = NSString;
  [(PHAsset *)self faceAreaMinX];
  uint64_t v67 = v66;
  [(PHAsset *)self faceAreaMaxX];
  uint64_t v69 = v68;
  [(PHAsset *)self faceAreaMinY];
  uint64_t v71 = v70;
  [(PHAsset *)self faceAreaMaxY];
  v174 = [v65 stringWithFormat:@"(minX: %.2f, maxX: %.2f, minY: %.2f, maxY: %.2f)", v67, v69, v71, v72];
  [(PHAsset *)self acceptableCropRect];
  double v168 = v75 * v116 + 0.0;
  double v140 = (1.0 - (v73 + v74)) * v115 + 0.0;
  double v113 = v74 * v115;
  double v114 = v76 * v116;
  [(PHAsset *)self preferredCropRect];
  double v170 = v79 * v116 + 0.0;
  double v111 = v80 * v116;
  double v112 = (1.0 - (v77 + v78)) * v115 + 0.0;
  double v110 = v78 * v115;
  [(PHAsset *)self faceAreaMinX];
  double v82 = v81;
  [(PHAsset *)self faceAreaMinY];
  double v84 = v83;
  [(PHAsset *)self faceAreaMaxX];
  double v86 = v85;
  [(PHAsset *)self faceAreaMaxY];
  double v87 = v86 - v82;
  double v89 = v88 - v84;
  double v90 = 1.0 - (v84 + v88 - v84);
  v192[0] = @"uuid";
  v182 = [(PHObject *)self uuid];
  v193[0] = v182;
  v192[1] = @"width";
  v180 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAsset pixelWidth](self, "pixelWidth"));
  v193[1] = v180;
  v192[2] = @"height";
  v178 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAsset pixelHeight](self, "pixelHeight"));
  v193[2] = v178;
  v192[3] = @"screenWidth";
  v177 = [NSNumber numberWithDouble:v4];
  v193[3] = v177;
  v192[4] = @"screenHeight";
  v176 = [NSNumber numberWithDouble:v6];
  v193[4] = v176;
  v192[5] = @"preferredCrop";
  [(PHAsset *)self preferredCropRect];
  v175 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v91, v92, v93, v94];
  v193[5] = v175;
  v192[6] = @"acceptableCrop";
  [(PHAsset *)self acceptableCropRect];
  v173 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v95, v96, v97, v98];
  v193[6] = v173;
  v193[7] = v174;
  v192[7] = @"faceAreaEdges";
  v192[8] = @"faceAreaRect";
  v172 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", *(void *)&v82, *(void *)&v90, *(void *)&v87, *(void *)&v89];
  v193[8] = v172;
  v192[9] = @"preferredCropPixels";
  v171 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", *(void *)&v170, *(void *)&v112, *(void *)&v111, *(void *)&v110];
  v193[9] = v171;
  v192[10] = @"acceptableCropPixels";
  v169 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", *(void *)&v168, *(void *)&v140, *(void *)&v114, *(void *)&v113];
  v193[10] = v169;
  v192[11] = @"faceAreaPixels";
  v141 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v82 * v116 + 0.0, v90 * v115 + 0.0, v87 * v116, v89 * v115];
  v193[11] = v141;
  v192[12] = @"suggestedCrop";
  v167 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v166, v164, *(void *)&v163, *(void *)&v162];
  v193[12] = v167;
  v192[13] = @"suggestedCropWithFocusArea";
  v165 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v160, v156, *(void *)&v151, *(void *)&v146];
  v193[13] = v165;
  v192[14] = @"suggestedCropWithScreenTranspose";
  v161 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v158, v154, v152, v147];
  v193[14] = v161;
  v192[15] = @"estimatedSuggestedCropPad";
  v159 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v149, v144, v142, v138];
  v193[15] = v159;
  v192[16] = @"estimatedSuggestedCropPadWithFocusArea";
  v157 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v136, v134, v132, v130];
  v193[16] = v157;
  v192[17] = @"estimatedSuggestedCropPadWithScreenTranspose";
  v155 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v135, v133, v131, v128];
  v193[17] = v155;
  v192[18] = @"estimatedSuggestedCropPhone";
  v153 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v129, v127, v126, v125];
  v193[18] = v153;
  v192[19] = @"estimatedSuggestedCropPhoneWithFocusArea";
  v150 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v124, v122, v120, v118];
  v193[19] = v150;
  v192[20] = @"estimatedSuggestedCropPhoneWithScreenTranspose";
  v148 = [NSString stringWithFormat:@"{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}", v123, v121, v119, v117];
  v193[20] = v148;
  v192[21] = @"cropQualityScore";
  v145 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v191);
  v193[21] = v145;
  v192[22] = @"cropQualityScoreWithFocusArea";
  v143 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v190);
  v193[22] = v143;
  v192[23] = @"cropQualityScoreWithScreenTranspose";
  v139 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v189);
  v193[23] = v139;
  v192[24] = @"estimatedCropQualityScorePad";
  v137 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v188);
  v193[24] = v137;
  v192[25] = @"estimatedCropQualityScorePadWithFocusArea";
  id v99 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v187);
  v193[25] = v99;
  v192[26] = @"estimatedCropQualityScorePadWithScreenTranspose";
  uint64_t v100 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v186);
  v193[26] = v100;
  v192[27] = @"estimatedCropQualityScorePhone";
  v101 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v185);
  v193[27] = v101;
  v192[28] = @"estimatedCropQualityScorePhoneWithFocusArea";
  uint64_t v102 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v184);
  v193[28] = v102;
  v192[29] = @"estimatedCropQualityScorePhoneWithScreenTranspose";
  v103 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v183);
  v193[29] = v103;
  v192[30] = @"imageAspectRatio";
  v104 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v116 / v115);
  v193[30] = v104;
  v192[31] = @"screenAspectRatio";
  id v105 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v4 / v6);
  v193[31] = v105;
  v192[32] = @"cropAspectRatio";
  v106 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v163 / v162);
  v193[32] = v106;
  v192[33] = @"cropAspectRatioWithFocusArea";
  uint64_t v107 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v151 / v146);
  v193[33] = v107;
  v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:34];

  return v108;
}

- (id)adjustmentsDebugMetadata
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__21007;
  double v20 = __Block_byref_object_dispose__21008;
  id v21 = 0;
  double v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  double v4 = objc_alloc_init(PHImageRequestOptions);
  [(PHImageRequestOptions *)v4 setVersion:16];
  [(PHImageRequestOptions *)v4 setSynchronous:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PHAsset_adjustmentsDebugMetadata__block_invoke;
  aBlock[3] = &unk_1E5845360;
  void aBlock[4] = self;
  double v15 = &v16;
  double v5 = v3;
  double v14 = v5;
  double v6 = _Block_copy(aBlock);
  double v7 = +[PHImageManager defaultManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __35__PHAsset_adjustmentsDebugMetadata__block_invoke_2;
  v11[3] = &unk_1E58460D8;
  id v8 = v6;
  id v12 = v8;
  objc_msgSend(v7, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", self, 0, v4, v11, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __35__PHAsset_adjustmentsDebugMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v22 = [a2 objectForKeyedSubscript:@"PHAdjustmentDataKey"];
  if (v22)
  {
    if ([*(id *)(a1 + 32) isPhoto])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F8AA58]);
      double v4 = [v22 data];
      double v5 = [v22 formatIdentifier];
      double v6 = [v22 formatVersion];
      uint64_t v7 = [v3 debugDescriptionForPhotoEditData:v4 formatIdentifier:v5 formatVersion:v6];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      if (![*(id *)(a1 + 32) isVideo]) {
        goto LABEL_7;
      }
      double v10 = *(void **)(a1 + 32);
      double v11 = [v22 data];
      uint64_t v12 = objc_msgSend(v10, "__dictionaryWithContentsOfData:", v11);
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      double v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        goto LABEL_7;
      }
      id v3 = objc_alloc_init(MEMORY[0x1E4F8AA58]);
      double v4 = [v22 data];
      uint64_t v20 = [v3 debugDescriptionForAdjustmentData:v4];
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      double v5 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;
    }

LABEL_7:
    double v15 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutableCopy];
    uint64_t v16 = [v22 formatVersion];
    [v15 setObject:v16 forKeyedSubscript:@"formatVersion"];

    uint64_t v17 = [v22 formatIdentifier];
    [v15 setObject:v17 forKeyedSubscript:@"formatIdentifier"];

    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    double v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v15;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __35__PHAsset_adjustmentsDebugMetadata__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)evaluationDebugMetadata
{
  if (MEMORY[0x19F388B10](self, a2))
  {
    id v3 = objc_opt_new();
    double v4 = [(PHAsset *)self mainFileURL];
    double v5 = [v4 lastPathComponent];

    double v6 = (void *)MEMORY[0x1E4F8A950];
    uint64_t v7 = [(PHObject *)self photoLibrary];
    uint64_t v8 = [v7 photoLibrary];
    id v9 = [v5 stringByDeletingPathExtension];
    double v10 = [v9 stringByAppendingPathComponent:@"ReframeEvaluation"];
    uint64_t v11 = [v6 diagnosticFilePathForLibrary:v8 mainFilename:v10 createIfNeeded:0];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v11];
      if (v12) {
        [v3 setObject:v12 forKeyedSubscript:@"ReframeEvaluation"];
      }
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F8A950];
    double v14 = [(PHObject *)self photoLibrary];
    double v15 = [v14 photoLibrary];
    uint64_t v16 = [v5 stringByDeletingPathExtension];
    uint64_t v17 = [v16 stringByAppendingPathComponent:@"ReframeSubjects"];
    uint64_t v18 = [v13 diagnosticFilePathForLibrary:v15 mainFilename:v17 createIfNeeded:0];

    if (v18)
    {
      double v19 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v18];
      if (v19) {
        [v3 setObject:v19 forKeyedSubscript:@"ReframeSubjects"];
      }
    }
    uint64_t v35 = (void *)v11;
    uint64_t v20 = (void *)MEMORY[0x1E4F8A950];
    uint64_t v21 = [(PHObject *)self photoLibrary];
    id v22 = [v21 photoLibrary];
    double v23 = [v5 stringByDeletingPathExtension];
    double v24 = [v23 stringByAppendingPathComponent:@"CapturePerspectiveEvaluation-txt"];
    uint64_t v25 = [v20 diagnosticFilePathForLibrary:v22 mainFilename:v24 createIfNeeded:0];

    if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v25];
      if (v26) {
        [v3 setObject:v26 forKeyedSubscript:@"CapturePerspectiveEvaluation-txt"];
      }
    }
    double v27 = (void *)MEMORY[0x1E4F8A950];
    double v28 = [(PHObject *)self photoLibrary];
    uint64_t v29 = [v28 photoLibrary];
    uint64_t v30 = [v5 stringByDeletingPathExtension];
    uint64_t v31 = [v30 stringByAppendingPathComponent:@"CaptureAutoCropEvaluation-txt"];
    uint64_t v32 = [v27 diagnosticFilePathForLibrary:v29 mainFilename:v31 createIfNeeded:0];

    if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v32];
      if (v33) {
        [v3 setObject:v33 forKeyedSubscript:@"CaptureAutoCropEvaluation-txt"];
      }
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  }

  return v3;
}

- (id)gatingDebugMetadata
{
  if (MEMORY[0x19F388B10](self, a2))
  {
    id v3 = [(PHAsset *)self pl_managedAsset];
    double v4 = [v3 pathForReframeDiagnosticFile];

    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4];
      if (v5)
      {
        double v6 = (void *)v5;
        uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];

        goto LABEL_7;
      }
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F1C978] array];
LABEL_7:

  return v7;
}

- (id)__dictionaryWithContentsOfData:(id)a3
{
  id v3 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDataRef)a3, 0, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v3)
  {
    CFRelease(v3);
    id v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  v20.receiver = self;
  v20.super_class = (Class)PHAsset;
  double v19 = [(PHObject *)&v20 description];
  id v3 = [(PHAsset *)self burstIdentifier];
  double v4 = &stru_1EEAC1950;
  if (v3)
  {
    uint64_t v5 = NSString;
    double v6 = [(PHAsset *)self burstIdentifier];
    PHAssetBurstSelectionType v7 = [(PHAsset *)self burstSelectionTypes];
    BOOL v8 = [(PHAsset *)self representsBurst];
    id v9 = @"(*)";
    if (!v8) {
      id v9 = &stru_1EEAC1950;
    }
    [v5 stringWithFormat:@" burst=%@/%lu%@", v6, v7, v9];
    double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  PHAssetMediaType v18 = [(PHAsset *)self mediaType];
  PHAssetMediaSubtype v17 = [(PHAsset *)self mediaSubtypes];
  PHAssetSourceType v10 = [(PHAsset *)self sourceType];
  NSUInteger v11 = [(PHAsset *)self pixelWidth];
  NSUInteger v12 = [(PHAsset *)self pixelHeight];
  uint64_t v13 = [(PHAsset *)self creationDate];
  double v14 = [(PHAsset *)self location];
  double v15 = [v19 stringByAppendingFormat:@" mediaType=%ld/%ld, sourceType=%ld, (%lux%lu), creationDate=%@, location=%d, hidden=%d, favorite=%d, adjusted=%d %@", v18, v17, v10, v11, v12, v13, v14 != 0, -[PHAsset isHidden](self, "isHidden"), -[PHAsset isFavorite](self, "isFavorite"), -[PHAsset hasAdjustments](self, "hasAdjustments"), v4];

  return (NSString *)v15;
}

- (id)fileURLForVideoComplementFile
{
  id v3 = [(PHAsset *)self pl_photoLibrary];
  double v4 = [v3 pathManager];

  if (objc_msgSend(v4, "shouldUseFileIdentifierForBundleScope:", -[PHAsset bundleScope](self, "bundleScope"))&& !-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F8B978]);
    id v9 = [(PHObject *)self uuid];
    uint64_t v10 = [(PHAsset *)self bundleScope];
    NSUInteger v11 = [(id)*MEMORY[0x1E4F44490] identifier];
    double v6 = (void *)[v8 initWithAssetUuid:v9 bundleScope:v10 uti:v11 resourceVersion:0 resourceType:3];

    PHAssetBurstSelectionType v7 = [v4 readOnlyUrlWithIdentifier:v6];
  }
  else
  {
    uint64_t v5 = [(PHAsset *)self mainFileURL];
    double v6 = [v5 URLByDeletingPathExtension];
    PHAssetBurstSelectionType v7 = [v6 URLByAppendingPathExtension:@"MOV"];
  }

  return v7;
}

- (id)fileURLForFullsizeRenderImage
{
  if ([(PHAsset *)self isCloudSharedAsset])
  {
    id v3 = 0;
  }
  else
  {
    double v4 = [(PHAsset *)self pl_photoLibrary];
    uint64_t v5 = [v4 pathManager];

    if (objc_msgSend(v5, "shouldUseFileIdentifierForBundleScope:", -[PHAsset bundleScope](self, "bundleScope")))
    {
      id v6 = objc_alloc(MEMORY[0x1E4F8B978]);
      PHAssetBurstSelectionType v7 = [(PHObject *)self uuid];
      uint64_t v8 = [(PHAsset *)self bundleScope];
      id v9 = [(id)*MEMORY[0x1E4F44410] identifier];
      uint64_t v10 = (void *)[v6 initWithAssetUuid:v7 bundleScope:v8 uti:v9 resourceVersion:2 recipeID:65938];

      id v3 = [v5 readOnlyUrlWithIdentifier:v10];
    }
    else
    {
      NSUInteger v11 = [(PHAsset *)self directory];
      NSUInteger v12 = [(PHAsset *)self filename];
      uint64_t v10 = [v5 assetPathForMutationsDirectoryWithDirectory:v11 filename:v12];

      uint64_t v13 = [MEMORY[0x1E4F8A950] pathForAdjustmentDirectoryWithMutationsDirectory:v10];
      if (v13)
      {
        double v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1];
      }
      else
      {
        double v14 = 0;
      }
      id v3 = [v14 URLByAppendingPathComponent:@"FullSizeRender.jpg" isDirectory:0];
    }
  }

  return v3;
}

- (id)fileURLsForDiagnosticFiles
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  if ([(PHAsset *)self isCloudSharedAsset])
  {
    id v105 = 0;
  }
  else
  {
    id v3 = objc_opt_new();
    double v4 = [(PHAsset *)self mainFileURL];
    uint64_t v5 = [v4 lastPathComponent];

    id v6 = (void *)MEMORY[0x1E4F8A950];
    PHAssetBurstSelectionType v7 = [(PHObject *)self photoLibrary];
    uint64_t v8 = [v7 photoLibrary];
    uint64_t v9 = [v6 diagnosticFilePathForLibrary:v8 mainFilename:v5 createIfNeeded:0];

    v104 = (void *)v9;
    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    id v105 = v3;
    [v3 addObject:v10];

    if (MEMORY[0x19F388B10]())
    {
      NSUInteger v11 = [(PHAsset *)self pl_managedAsset];
      uint64_t v12 = [v11 pathForSpatialOverCaptureDiagnosticFile];

      if (v12)
      {
        uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
        [v3 addObject:v13];
      }
      double v14 = [(PHAsset *)self pl_managedAsset];
      uint64_t v15 = [v14 pathForReframeDiagnosticFile];

      if (v15)
      {
        uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0];
        [v3 addObject:v16];
      }
      v101 = (void *)v15;
      PHAssetMediaSubtype v17 = (void *)MEMORY[0x1E4F8A950];
      PHAssetMediaType v18 = [(PHObject *)self photoLibrary];
      double v19 = [v18 photoLibrary];
      objc_super v20 = [v5 stringByDeletingPathExtension];
      uint64_t v21 = [v20 stringByAppendingPathComponent:@"ReframeEvaluation"];
      uint64_t v22 = [v17 diagnosticFilePathForLibrary:v19 mainFilename:v21 createIfNeeded:0];

      if (v22)
      {
        double v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22 isDirectory:0];
        [v105 addObject:v23];
      }
      double v24 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v25 = [(PHObject *)self photoLibrary];
      uint64_t v26 = [v25 photoLibrary];
      double v27 = [v5 stringByDeletingPathExtension];
      double v28 = [v27 stringByAppendingPathComponent:@"EditPerspectiveEvaluation-txt"];
      uint64_t v29 = [v24 diagnosticFilePathForLibrary:v26 mainFilename:v28 createIfNeeded:0];

      uint64_t v30 = (void *)v29;
      if (v29)
      {
        uint64_t v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v29 isDirectory:0];
        [v105 addObject:v31];
      }
      id v99 = v30;
      uint64_t v32 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v33 = [(PHObject *)self photoLibrary];
      uint64_t v34 = [v33 photoLibrary];
      uint64_t v35 = [v5 stringByDeletingPathExtension];
      uint64_t v36 = [v35 stringByAppendingPathComponent:@"EditPerspectiveLineDetection-png"];
      uint64_t v37 = [v32 diagnosticFilePathForLibrary:v34 mainFilename:v36 createIfNeeded:0];

      double v38 = (void *)v37;
      if (v37)
      {
        double v39 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v37 isDirectory:0];
        [v105 addObject:v39];
      }
      uint64_t v98 = v38;
      uint64_t v100 = (void *)v22;
      double v40 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v41 = [(PHObject *)self photoLibrary];
      uint64_t v42 = [v41 photoLibrary];
      uint64_t v43 = [v5 stringByDeletingPathExtension];
      uint64_t v44 = [v43 stringByAppendingPathComponent:@"CapturePerspectiveEvaluation-txt"];
      uint64_t v45 = [v40 diagnosticFilePathForLibrary:v42 mainFilename:v44 createIfNeeded:0];

      if (v45)
      {
        uint64_t v46 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v45 isDirectory:0];
        [v105 addObject:v46];
      }
      uint64_t v97 = (void *)v45;
      uint64_t v47 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v48 = [(PHObject *)self photoLibrary];
      uint64_t v49 = [v48 photoLibrary];
      uint64_t v50 = [v5 stringByDeletingPathExtension];
      uint64_t v51 = [v50 stringByAppendingPathComponent:@"CapturePerspectiveLineDetection-png"];
      uint64_t v52 = [v47 diagnosticFilePathForLibrary:v49 mainFilename:v51 createIfNeeded:0];

      if (v52)
      {
        double v53 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v52 isDirectory:0];
        [v105 addObject:v53];
      }
      uint64_t v96 = (void *)v52;
      v103 = (void *)v12;
      double v54 = (void *)MEMORY[0x1E4F8A950];
      double v55 = [(PHObject *)self photoLibrary];
      double v56 = [v55 photoLibrary];
      uint64_t v57 = [v5 stringByDeletingPathExtension];
      uint64_t v58 = [v57 stringByAppendingPathComponent:@"CaptureAutoCropEvaluation-txt"];
      uint64_t v59 = [v54 diagnosticFilePathForLibrary:v56 mainFilename:v58 createIfNeeded:0];

      if (v59)
      {
        uint64_t v60 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v59 isDirectory:0];
        [v105 addObject:v60];
      }
      uint64_t v61 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v62 = [(PHObject *)self photoLibrary];
      uint64_t v63 = [v62 photoLibrary];
      uint64_t v64 = v5;
      id v65 = [v5 stringByDeletingPathExtension];
      uint64_t v66 = [v65 stringByAppendingPathComponent:@"ReframeSubjects"];
      uint64_t v67 = [v61 diagnosticFilePathForLibrary:v63 mainFilename:v66 createIfNeeded:0];

      if (v67)
      {
        uint64_t v68 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v67 isDirectory:0];
        [v105 addObject:v68];
      }
      uint64_t v69 = (void *)MEMORY[0x1E4F8A950];
      uint64_t v70 = [(PHObject *)self photoLibrary];
      uint64_t v71 = [v70 photoLibrary];
      uint64_t v72 = [v64 stringByDeletingPathExtension];
      double v73 = [v72 stringByAppendingPathComponent:@"ReframeRects"];
      double v74 = [v69 diagnosticFilePathForLibrary:v71 mainFilename:v73 createIfNeeded:0];

      if (v74)
      {
        double v75 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v74 isDirectory:0];
        [v105 addObject:v75];
      }
      double v76 = [(PHAsset *)self pl_managedAsset];
      double v77 = [v76 pathForCameraMetadataDiagnosticFile];

      if (v77)
      {
        double v78 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v77 isDirectory:0];
        [v105 addObject:v78];
      }
      double v79 = [(PHAsset *)self pl_managedAsset];
      double v80 = [v79 pathForCameraSpatialOverCaptureMetadataDiagnosticFile];

      uint64_t v5 = v64;
      if (v80)
      {
        double v81 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v80 isDirectory:0];
        [v105 addObject:v81];
      }
    }
    if (MEMORY[0x19F388B10]())
    {
      double v82 = [MEMORY[0x1E4F28CB8] defaultManager];
      double v83 = [(PHObject *)self uuid];
      uint64_t v102 = v82;
      double v84 = [v82 contentsOfDirectoryAtPath:@"/var/mobile/Media/DCIM/" error:0];
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      uint64_t v85 = [v84 countByEnumeratingWithState:&v106 objects:v110 count:16];
      if (v85)
      {
        uint64_t v86 = v85;
        uint64_t v87 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v86; ++i)
          {
            if (*(void *)v107 != v87) {
              objc_enumerationMutation(v84);
            }
            double v89 = *(void **)(*((void *)&v106 + 1) + 8 * i);
            if ([v89 containsString:v83])
            {
              double v90 = [@"/var/mobile/Media/DCIM/" stringByAppendingPathComponent:v89];
              uint64_t v91 = [v90 stringByAppendingPathComponent:@"Misc"];
              uint64_t v92 = [v91 stringByAppendingPathComponent:@"CVSInput"];
              uint64_t v93 = [v92 stringByAppendingPathComponent:@"dump.MOV"];

              uint64_t v94 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v93 isDirectory:0];
              [v105 addObject:v94];
            }
          }
          uint64_t v86 = [v84 countByEnumeratingWithState:&v106 objects:v110 count:16];
        }
        while (v86);
      }
    }
  }

  return v105;
}

- (id)mainFileURL
{
  id v3 = [(PHAsset *)self directory];
  if (v3)
  {
    double v4 = [(PHAsset *)self pl_photoLibrary];
    uint64_t v5 = [v4 pathManager];

    id v6 = [(PHAsset *)self filename];
    PHAssetBurstSelectionType v7 = objc_msgSend(v5, "assetMainFilePathWithDirectory:filename:bundleScope:", v3, v6, -[PHAsset bundleScope](self, "bundleScope"));

    if ([v5 isUBF])
    {
      if ([(PHAsset *)self isStreamedVideo])
      {
        uint64_t v8 = [v7 pathExtension];
        char v9 = [v8 isEqualToString:@"medium.MP4"];

        if ((v9 & 1) == 0)
        {
          uint64_t v10 = [v7 stringByDeletingPathExtension];
          uint64_t v11 = [v10 stringByAppendingPathExtension:@"medium.MP4"];

          PHAssetBurstSelectionType v7 = (void *)v11;
        }
      }
    }
    uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)canPerformSharingAction
{
  BOOL v3 = [(PHAsset *)self complete];
  if (v3)
  {
    if ([(PHAsset *)self isTimelapsePlaceholder]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(PHAsset *)self isPhotoIrisPlaceholder];
    }
  }
  return v3;
}

- (BOOL)canPerformEditOperation:(PHAssetEditOperation)editOperation
{
  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  if (editOperation != 100)
  {
    PHAssetBurstSelectionType v7 = [(PHObject *)self photoLibrary];
    uint64_t v8 = [v7 wellKnownPhotoLibraryIdentifier];

    if (v8 == 3)
    {
      char v5 = editOperation == PHAssetEditOperationDelete;
      goto LABEL_10;
    }
    if (editOperation == 102)
    {
      [MEMORY[0x1E4F8BA10] maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders];
      [(PHAsset *)self savedAssetType];
      int v14 = PLValidatedSavedAssetTypeApplies();
      *((unsigned char *)v40 + 24) = v14;
      if (!v14) {
        goto LABEL_11;
      }
      [(PHObject *)self fetchPropertySetsIfNeeded];
      if (![(PHAsset *)self participatesInLibraryScope])
      {
        char v9 = [(id)objc_opt_class() _isLibraryScopeExiting:self];
        goto LABEL_9;
      }
    }
    else
    {
      if (editOperation != 103)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __35__PHAsset_canPerformEditOperation___block_invoke;
        aBlock[3] = &unk_1E5845220;
        void aBlock[4] = self;
        uint64_t v15 = _Block_copy(aBlock);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __35__PHAsset_canPerformEditOperation___block_invoke_2;
        v37[3] = &unk_1E5847E80;
        v37[4] = self;
        void v37[5] = &v39;
        v37[6] = editOperation;
        uint64_t v16 = _Block_copy(v37);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        void v33[2] = __35__PHAsset_canPerformEditOperation___block_invoke_3;
        v33[3] = &unk_1E5845248;
        uint64_t v35 = &v39;
        PHAssetEditOperation v36 = editOperation;
        id v17 = v15;
        id v34 = v17;
        PHAssetMediaType v18 = _Block_copy(v33);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __35__PHAsset_canPerformEditOperation___block_invoke_4;
        v29[3] = &unk_1E5845248;
        uint64_t v31 = &v39;
        PHAssetEditOperation v32 = editOperation;
        id v19 = v17;
        id v30 = v19;
        objc_super v20 = _Block_copy(v29);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __35__PHAsset_canPerformEditOperation___block_invoke_5;
        v25[3] = &unk_1E5845248;
        double v27 = &v39;
        PHAssetEditOperation v28 = editOperation;
        id v21 = v19;
        id v26 = v21;
        uint64_t v22 = _Block_copy(v25);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __35__PHAsset_canPerformEditOperation___block_invoke_6;
        v24[3] = &unk_1E58463A8;
        v24[4] = &v39;
        double v23 = _Block_copy(v24);
        objc_msgSend(MEMORY[0x1E4F8BA10], "executeBlockForSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", -[PHAsset savedAssetType](self, "savedAssetType"), v18, v18, v20, v18, v16, v18, v18, v23, v23, v23, v18, v18, v20, v18,
          v22,
          v23,
          v23);

        goto LABEL_11;
      }
      [MEMORY[0x1E4F8BA10] maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders];
      [(PHAsset *)self savedAssetType];
      int v12 = PLValidatedSavedAssetTypeApplies();
      *((unsigned char *)v40 + 24) = v12;
      if (!v12) {
        goto LABEL_11;
      }
      [(PHObject *)self fetchPropertySetsIfNeeded];
      if ([(PHAsset *)self participatesInLibraryScope])
      {
        if ([(id)objc_opt_class() _isLibraryScopeExiting:self]) {
          char v13 = 0;
        }
        else {
          char v13 = [(id)objc_opt_class() _libraryScopeAssetContributedByCurrentUser:self];
        }
        *((unsigned char *)v40 + 24) = v13;
        goto LABEL_11;
      }
    }
    *((unsigned char *)v40 + 24) = 0;
    goto LABEL_11;
  }
  if ([(PHAsset *)self isPhotoIris])
  {
    char v4 = [(id)objc_opt_class() isOriginalKnownUnsupportedFormatForAsset:self failureInfo:0];
    char v5 = (v4 | [(id)objc_opt_class() isOriginalVideoComplementKnownUnsupportedFormatForAsset:self failureInfo:0]) ^ 1;
LABEL_10:
    *((unsigned char *)v40 + 24) = v5;
    goto LABEL_11;
  }
  if ([(PHAsset *)self isPhoto] || [(PHAsset *)self isVideo])
  {
    char v9 = [(id)objc_opt_class() isOriginalKnownUnsupportedFormatForAsset:self failureInfo:0];
LABEL_9:
    char v5 = v9 ^ 1;
    goto LABEL_10;
  }
LABEL_11:
  char v10 = *((unsigned char *)v40 + 24);
  _Block_object_dispose(&v39, 8);
  return v10;
}

uint64_t __35__PHAsset_canPerformEditOperation___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) participatesInLibraryScope]) {
    return 1;
  }
  if ([(id)objc_opt_class() _isLibraryScopeExiting:*(void *)(a1 + 32)]) {
    return 0;
  }
  BOOL v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 _libraryScopeAssetContributedByCurrentUser:v4];
}

uint64_t __35__PHAsset_canPerformEditOperation___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cloudIsDeletable];
  if (result)
  {
    uint64_t result = [MEMORY[0x1E4F8B9D8] isEntitledForPhotoKit];
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a1 + 48) == 1;
    }
  }
  return result;
}

void *__35__PHAsset_canPerformEditOperation___block_invoke_3(void *result)
{
  uint64_t v1 = result[6];
  unint64_t v2 = v1 - 1;
  BOOL v3 = v1 == 101;
  char v4 = v2 < 3 || v3;
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v4;
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    char v5 = result;
    if (result[6] == 101)
    {
      uint64_t result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
      *(unsigned char *)(*(void *)(v5[5] + 8) + 24) = (_BYTE)result;
    }
  }
  return result;
}

void *__35__PHAsset_canPerformEditOperation___block_invoke_4(void *result)
{
  uint64_t v1 = result[6];
  BOOL v3 = v1 == 1 || v1 == 101;
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    char v4 = result;
    if (result[6] == 101)
    {
      uint64_t result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
      *(unsigned char *)(*(void *)(v4[5] + 8) + 24) = (_BYTE)result;
    }
  }
  return result;
}

void *__35__PHAsset_canPerformEditOperation___block_invoke_5(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = result[6] == 101;
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    uint64_t v1 = result;
    if (result[6] == 101)
    {
      uint64_t result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
      *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = (_BYTE)result;
    }
  }
  return result;
}

uint64_t __35__PHAsset_canPerformEditOperation___block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  [(PHObject *)self addFetchPropertyHint:0x4000000000];
  BOOL v3 = [(PHAsset *)self StoryPlaybackProperties];
  char v4 = [v3 hasPeopleSceneMidOrGreaterConfidence];

  return v4;
}

- (BOOL)hasSpatialAudio
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 6) & 1;
}

- (BOOL)is60PlusFPS
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 5) & 1;
}

- (BOOL)hasEditableDepth
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 4) & 1;
}

- (BOOL)isProRes
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 3) & 1;
}

- (BOOL)hasKeywords
{
  return self->_packedBadgeAttributes & 1;
}

- (BOOL)isLocalVideoKeyFrameValid
{
  if ([(PHAsset *)self hasAdjustments] || [(PHAsset *)self bundleScope] == 3) {
    return 0;
  }
  [MEMORY[0x1E4F8BA10] maskForGuestAsset];
  [(PHAsset *)self savedAssetType];
  return PLValidatedSavedAssetTypeApplies() ^ 1;
}

- (BOOL)isWalrusEnabled
{
  unint64_t v2 = [(PHObject *)self photoLibrary];
  char v3 = [v2 isWalrusEnabled];

  return v3;
}

- (BOOL)isIncompleteLivePhotoMissingVideoComplement
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(PHAsset *)self isPhotoIris]) {
    return 0;
  }
  char v3 = +[PHAssetResource assetResourcesForAsset:self includeDerivatives:1];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_806];
  BOOL v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      PHAssetBurstSelectionType v7 = [(PHObject *)self uuid];
      int v9 = 138543362;
      char v10 = v7;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_FAULT, "Live photo asset %{public}@ is missing its video complement", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5;
}

BOOL __54__PHAsset_isIncompleteLivePhotoMissingVideoComplement__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 backingResourceIdentity];
  BOOL v3 = [v2 resourceType] == 3;

  return v3;
}

- (unint64_t)contentChangeFromAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = !v4 || ![(PHObject *)self isEqual:v4];
  uint64_t v6 = [v4 adjustmentTimestamp];
  uint64_t v7 = [(PHAsset *)self adjustmentTimestamp];
  uint64_t v8 = (void *)v7;
  if (v7 | v6)
  {
    if (!v6 || !v7 || ([(id)v6 timeIntervalSinceDate:v7], fabs(v9) > 2.22044605e-16)) {
      v5 |= 0x10uLL;
    }
  }
  uint64_t v10 = [v4 thumbnailIndex];
  if (v10 == [(PHAsset *)self thumbnailIndex]) {
    uint64_t v11 = v5;
  }
  else {
    uint64_t v11 = v5 | 1;
  }
  [v4 duration];
  double v13 = v12;
  [(PHAsset *)self duration];
  if (v13 == v14) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = v5 | 1;
  }
  int v16 = [v4 canPlayPhotoIris];
  if (v16 != [(PHAsset *)self canPlayPhotoIris]) {
    v15 |= 4uLL;
  }
  int v17 = [(PHAsset *)self deferredProcessingNeeded];
  int v18 = [v4 deferredProcessingNeeded];
  uint64_t v19 = v15 | 2;
  if (v18 == 11) {
    uint64_t v19 = v15;
  }
  if ((v18 - 4) >= 6) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v15;
  }
  if (!v18) {
    uint64_t v20 = v15;
  }
  if (!v17) {
    uint64_t v15 = v20;
  }
  int v21 = [(PHAsset *)self videoDeferredProcessingNeeded];
  if ([v4 videoDeferredProcessingNeeded] == 1 && v21 == 0) {
    v15 |= 8uLL;
  }
  PHAssetPlaybackStyle v23 = [(PHAsset *)self playbackStyle];
  if (v23 == [v4 playbackStyle]) {
    uint64_t v24 = v15;
  }
  else {
    uint64_t v24 = v15 | 0x20;
  }
  int v25 = [(PHAsset *)self burstSelectionTypes];
  unint64_t v26 = ((unint64_t)([v4 burstSelectionTypes] ^ v25) >> 1) & 1;
  uint64_t v27 = [v4 RAWBadgeAttributes];
  int64_t v28 = [(PHAsset *)self RAWBadgeAttributes];
  int v29 = [v4 syndicationState];
  int v30 = [(PHAsset *)self syndicationState];
  if (v27 == v28 && v29 == v30) {
    uint64_t v32 = v26;
  }
  else {
    uint64_t v32 = 1;
  }
  unint64_t v33 = v32 | v24;

  return v33;
}

- (BOOL)hasContentEqualTo:(id)a3
{
  return [(PHAsset *)self contentChangeFromAsset:a3] == 0;
}

- (void)getFingerPrintForAssetType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PHObject *)self photoLibrary];
  char v8 = [v7 isCloudPhotoLibraryEnabled];

  if (v8)
  {
    double v9 = [(PHAsset *)self pl_photoLibrary];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __60__PHAsset_getFingerPrintForAssetType_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E5848A60;
    void v11[4] = self;
    id v12 = v9;
    int64_t v14 = a3;
    id v13 = v6;
    id v10 = v9;
    [v10 performBlock:v11];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.pkphotosctl" code:200 userInfo:&unk_1EEB27010];
    if (v6) {
      (*((void (**)(id, void, id))v6 + 2))(v6, 0, v10);
    }
  }
}

void __60__PHAsset_getFingerPrintForAssetType_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  unint64_t v2 = +[PHExternalAssetResource probableCPLResourceTypeFromAssetResourceType:*(void *)(a1 + 56)];
  BOOL v3 = [v8 master];
  id v4 = objc_msgSend(v3, "rm_cloudResourcesForResourceType:", v2);
  uint64_t v5 = [v4 firstObject];

  id v6 = [v5 fingerprint];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v6, 0);
  }
}

- (void)getMasterFingerPrintWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__21007;
  void v12[4] = __Block_byref_object_dispose__21008;
  id v13 = 0;
  uint64_t v5 = [(PHAsset *)self pl_photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PHAsset_getMasterFingerPrintWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E58451F8;
  void v8[4] = self;
  id v6 = v5;
  id v9 = v6;
  uint64_t v11 = v12;
  id v7 = v4;
  id v10 = v7;
  [v6 performBlock:v8];

  _Block_object_dispose(v12, 8);
}

void __53__PHAsset_getMasterFingerPrintWithCompletionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  id v7 = 0;
  uint64_t v3 = [v2 masterFingerPrintCacheIfNecessaryAndAdjustedFingerPrint:0 error:&v7];
  id v4 = v7;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)isDeleted
{
  v4.receiver = self;
  v4.super_class = (Class)PHAsset;
  return [(PHObject *)&v4 isDeleted] || self->_trashed;
}

- (BOOL)isTimelapsePlaceholder
{
  if ([(PHAsset *)self isMediaSubtype:0x40000]
    && ([(PHAsset *)self duration], v3 == 0.0))
  {
    objc_super v4 = [(PHAsset *)self pathForOriginalFile];
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v5 fileExistsAtPath:v4] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isIncludedInCloudFeeds
{
  return [(PHAsset *)self sourceType] == 2;
}

- (BOOL)isIncludedInMoments
{
  return [(PHAsset *)self sourceType] != 2;
}

- (BOOL)isHighFrameRateVideo
{
  BOOL v3 = [(PHAsset *)self isVideo];
  if (v3)
  {
    LOBYTE(v3) = [(PHAsset *)self isMediaSubtype:0x20000];
  }
  return v3;
}

- (BOOL)isStreamedVideo
{
  BOOL v3 = [(PHAsset *)self isVideo];
  if (v3)
  {
    LOBYTE(v3) = [(PHAsset *)self isMediaSubtype:0x10000];
  }
  return v3;
}

- (NSString)cloudIdentifier
{
  cloudAssetGUID = self->_cloudAssetGUID;
  if (cloudAssetGUID)
  {
    BOOL v3 = [(NSString *)cloudAssetGUID stringByAppendingString:@"/G0/"];
    objc_super v4 = [(id)objc_opt_class() identifierCode];
    uint64_t v5 = [v3 stringByAppendingString:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isCloudPhotoLibraryAsset
{
  [MEMORY[0x1E4F8BA10] maskForCloudPhotoLibraryAsset];
  [(PHAsset *)self savedAssetType];

  return PLValidatedSavedAssetTypeApplies();
}

- (int64_t)cloudSharedAssetPlaceholderKind
{
  if (![(PHAsset *)self isCloudSharedAsset]) {
    return 0;
  }

  return [(PHAsset *)self cloudPlaceholderKind];
}

- (BOOL)isOffline
{
  if (![(PHAsset *)self isReferencedAsset]) {
    return 0;
  }
  uint64_t v13 = 0;
  int64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  BOOL v3 = [(PHAsset *)self mainFileURL];
  objc_super v4 = [(PHAsset *)self pl_photoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __20__PHAsset_isOffline__block_invoke;
  v9[3] = &unk_1E5848318;
  id v5 = v3;
  id v10 = v5;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [v6 performBlockAndWait:v9];
  BOOL v7 = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __20__PHAsset_isOffline__block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x1E4F8A820];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v6 = [v2 volumeForURL:v3 context:v4];

  id v5 = v6;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 isOffline];
    id v5 = v6;
  }
}

- (BOOL)isSyndicatedAssetSavedToUserLibrary
{
  uint64_t v3 = [(PHAsset *)self curationProperties];
  objc_super v4 = [v3 syndicationIdentifier];

  if (v4)
  {
    id v5 = [(PHObject *)self photoLibrary];
    uint64_t v6 = [v5 wellKnownPhotoLibraryIdentifier];

    if (v6 == 3)
    {
      return ([(PHAsset *)self syndicationState] >> 1) & 1;
    }
    else
    {
      [MEMORY[0x1E4F8BA10] maskForUserLibrary];
      [(PHAsset *)self savedAssetType];
      LOBYTE(v7) = PLValidatedSavedAssetTypeApplies();
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)isRecoveredAsset
{
  [MEMORY[0x1E4F8BA10] maskForRecoveredAlbum];
  [(PHAsset *)self savedAssetType];

  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isReferencedAsset
{
  [MEMORY[0x1E4F8BA10] maskForReferencedAsset];
  [(PHAsset *)self savedAssetType];

  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isMomentSharedAsset
{
  [MEMORY[0x1E4F8BA10] maskForMomentSharedAsset];
  [(PHAsset *)self savedAssetType];

  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)hasPhotoStreamTagID
{
  unint64_t v2 = [(PHAsset *)self pl_managedAsset];
  uint64_t v3 = [v2 additionalAttributes];
  objc_super v4 = [v3 photoStreamTagId];
  id v5 = v4;
  if (v4) {
    BOOL v6 = [v4 length] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (PHAssetPhotosSmartStyleExtendedProperties)fetchSmartStyleExtendedProperties
{
  [(PHObject *)self addFetchPropertyHint:0x8000000000];

  return (PHAssetPhotosSmartStyleExtendedProperties *)[(PHAsset *)self photosSmartStyleExtendedProperties];
}

- (BOOL)isSpatialPresentation
{
  [(PHObject *)self addFetchPropertyHint:16];
  uint64_t v3 = [(PHAsset *)self photosOneUpProperties];
  if ([v3 viewPresentation]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(PHAsset *)self isSpatialMedia];
  }

  return v4;
}

- (BOOL)isSpatialMedia
{
  [(PHObject *)self addFetchPropertyHint:0x100000000];
  uint64_t v3 = [(PHAsset *)self spatialMediaProperties];
  BOOL v4 = [v3 spatialMediaType] != 0;

  return v4;
}

- (BOOL)isCinematicVideo
{
  if ([(PHAsset *)self mediaType] != PHAssetMediaTypeVideo) {
    return 0;
  }

  return [(PHAsset *)self isMediaSubtype:0x200000];
}

- (BOOL)isPhotoStreamPhoto
{
  [MEMORY[0x1E4F8BA10] maskForPhotoStreamAsset];
  [(PHAsset *)self savedAssetType];

  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isAudio
{
  return [(PHAsset *)self mediaType] == PHAssetMediaTypeAudio;
}

- (BOOL)isPhoto
{
  return [(PHAsset *)self mediaType] == PHAssetMediaTypeImage;
}

- (BOOL)isLoopingVideo
{
  return [(PHAsset *)self playbackStyle] == 5;
}

- (BOOL)isHDR
{
  if ([(PHAsset *)self isMediaSubtype:2]) {
    return 1;
  }

  return [(PHAsset *)self isMediaSubtype:0x100000];
}

- (BOOL)isHDRVideo
{
  if ([(PHAsset *)self mediaType] != PHAssetMediaTypeVideo) {
    return 0;
  }

  return [(PHAsset *)self isMediaSubtype:0x100000];
}

- (NSString)adjustmentFormatIdentifier
{
  [(PHObject *)self addFetchPropertyHint:0x2000];
  uint64_t v3 = [(PHAsset *)self adjustmentProperties];
  BOOL v4 = [v3 formatIdentifier];

  return (NSString *)v4;
}

- (BOOL)hasPhotoColorAdjustments
{
  BOOL v3 = [(PHAsset *)self isPhotoIris];
  if (v3)
  {
    LOBYTE(v3) = [(PHAsset *)self isMediaSubtype:2];
  }
  return v3;
}

- (BOOL)canPlayLoopingVideo
{
  return [(PHAsset *)self playbackStyle] == 5;
}

- (BOOL)canPlayMirror
{
  return [(PHAsset *)self playbackVariation] == 2;
}

- (BOOL)canPlayLongExposure
{
  return [(PHAsset *)self playbackVariation] == 3;
}

- (BOOL)canPlayAutoloop
{
  return [(PHAsset *)self playbackVariation] == 1;
}

- (BOOL)canPlayPhotoIris
{
  return [(PHAsset *)self isMediaSubtype:8];
}

- (BOOL)isPhotoIrisPlaceholder
{
  BOOL v3 = [(PHAsset *)self isPhotoIris];
  int64_t v4 = [(PHAsset *)self videoCpDurationValue];
  BOOL v5 = [(PHAsset *)self isCloudSharedAsset];
  BOOL v6 = (void *)MEMORY[0x1E4F8A950];

  return [v6 isPhotoIrisPlaceholderWithPhotoIris:v3 videoCpDuration:v4 isCloudShared:v5 videoCpFilePath:0];
}

- (PHAssetBurstSelectionType)burstSelectionTypes
{
  unsigned int v3 = [(PHAsset *)self avalanchePickType];
  return ([(PHAsset *)self avalanchePickType] >> 2) & 2 | (v3 >> 2) & 1;
}

- (id)cloudAssetGUID
{
  return self->_cloudAssetGUID;
}

- (id)_uncachedLocation
{
  locationData = self->_locationData;
  if (locationData)
  {
    unsigned int v3 = (void *)[MEMORY[0x1E4F8A950] newLocationFromLocationData:locationData timestampIfMissing:self->_creationDate];
  }
  else
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_canUseLocationCoordinateForLocation);
    if ((v4 & 1) != 0
      && (p_locationCoordinate = &self->_locationCoordinate, CLLocationCoordinate2DIsValid(self->_locationCoordinate)))
    {
      unsigned int v3 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:p_locationCoordinate->latitude longitude:p_locationCoordinate->longitude];
    }
    else
    {
      unsigned int v3 = 0;
    }
  }

  return v3;
}

- (void)_invalidateCachedLocation
{
}

id __36__PHAsset__initializeCachedLocation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v3 = [WeakRetained _uncachedLocation];
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

- (CLLocation)location
{
  return (CLLocation *)[(PLLazyObject *)self->_lazyCachedLocation objectValue];
}

- (void)setCanUseLocationCoordinateForLocation:(BOOL)a3
{
}

- (BOOL)canUseLocationCoordinateForLocation
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canUseLocationCoordinateForLocation);
  return v2 & 1;
}

- (NSString)thumbnailIdentifier
{
  unsigned int v3 = (void *)MEMORY[0x1E4F8AC48];
  unsigned __int8 v4 = [(PHObject *)self uuid];
  BOOL v5 = [(PHAsset *)self directory];
  BOOL v6 = [(PHAsset *)self filename];
  uint64_t v7 = [(PHAsset *)self bundleScope];
  id v8 = [(PHAsset *)self pl_photoLibrary];
  id v9 = [v8 pathManager];
  id v10 = [v3 thumbnailIdentifierWithAssetUUID:v4 directory:v5 filename:v6 bundleScope:v7 pathManager:v9];

  return (NSString *)v10;
}

- (void)generateLargeThumbnailFileIfNecessary
{
  unsigned int v3 = [(PHObject *)self photoLibrary];
  unsigned __int8 v4 = [v3 photoLibrary];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PHAsset_generateLargeThumbnailFileIfNecessary__block_invoke;
  v6[3] = &unk_1E5848DF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6 completionHandler:0];
}

void __48__PHAsset_generateLargeThumbnailFileIfNecessary__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = (void *)MEMORY[0x1E4F8A950];
  unsigned int v3 = [*(id *)(a1 + 32) objectID];
  id v4 = [v2 assetWithObjectID:v3 inLibrary:*(void *)(a1 + 40)];

  [v4 generateLargeThumbnailFileIfNecessary];
}

- (id)managedAssetForPhotoLibrary:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F8A950];
  id v5 = a3;
  BOOL v6 = [(PHObject *)self objectID];
  id v7 = [v4 assetWithObjectID:v6 inLibrary:v5];

  return v7;
}

- (BOOL)isInFlight
{
  return 0;
}

- (id)pathForAdjustmentDataFile
{
  if ([(PHAsset *)self isCloudSharedAsset])
  {
    unsigned int v3 = 0;
  }
  else
  {
    id v4 = [(PHAsset *)self pl_photoLibrary];
    id v5 = [v4 pathManager];

    if ([v5 isUBF])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F8B978]);
      id v7 = [(PHObject *)self uuid];
      uint64_t v8 = [(PHAsset *)self bundleScope];
      id v9 = [(id)*MEMORY[0x1E4F44378] identifier];
      id v10 = (void *)[v6 initWithAssetUuid:v7 bundleScope:v8 uti:v9 resourceVersion:2 resourceType:6];

      id v11 = [v5 readOnlyUrlWithIdentifier:v10];
      [v11 path];
    }
    else
    {
      id v12 = [(PHAsset *)self directory];
      uint64_t v13 = [(PHAsset *)self filename];
      id v10 = [v5 assetPathForMutationsDirectoryWithDirectory:v12 filename:v13];

      id v11 = [MEMORY[0x1E4F8A950] pathForAdjustmentDirectoryWithMutationsDirectory:v10];
      [v11 stringByAppendingPathComponent:@"Adjustments.data"];
    unsigned int v3 = };
  }

  return v3;
}

- (id)pathForAdjustmentFile
{
  if ([(PHAsset *)self isCloudSharedAsset])
  {
    unsigned int v3 = 0;
  }
  else
  {
    id v4 = [(PHAsset *)self pl_photoLibrary];
    id v5 = [v4 pathManager];

    if ([v5 isUBF])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F8B978]);
      id v7 = [(PHObject *)self uuid];
      uint64_t v8 = [(PHAsset *)self bundleScope];
      id v9 = [(id)*MEMORY[0x1E4F44488] identifier];
      id v10 = (void *)[v6 initWithAssetUuid:v7 bundleScope:v8 uti:v9 resourceVersion:2 recipeID:0];

      id v11 = [v5 readOnlyUrlWithIdentifier:v10];
      [v11 path];
    }
    else
    {
      id v12 = [(PHAsset *)self directory];
      uint64_t v13 = [(PHAsset *)self filename];
      id v10 = [v5 assetPathForMutationsDirectoryWithDirectory:v12 filename:v13];

      id v11 = [MEMORY[0x1E4F8A950] pathForAdjustmentDirectoryWithMutationsDirectory:v10];
      [v11 stringByAppendingPathComponent:@"Adjustments.plist"];
    unsigned int v3 = };
  }

  return v3;
}

- (id)pathForOriginalFile
{
  unsigned __int8 v2 = [(PHAsset *)self mainFileURL];
  unsigned int v3 = [v2 path];

  return v3;
}

- (NSString)title
{
  if (([(PHObject *)self propertyHint] & 0x800000) != 0)
  {
    [(PHAsset *)self gridMetadataProperties];
  }
  else
  {
    [(PHObject *)self addFetchPropertyHint:64];
    [(PHAsset *)self descriptionProperties];
  unsigned int v3 = };
  id v4 = [v3 title];

  return (NSString *)v4;
}

- (NSString)originalFilename
{
  if (([(PHObject *)self propertyHint] & 0x800000) != 0)
  {
    [(PHAsset *)self gridMetadataProperties];
  }
  else
  {
    [(PHObject *)self addFetchPropertyHint:8];
    [(PHAsset *)self originalMetadataProperties];
  unsigned int v3 = };
  id v4 = [v3 originalFilename];

  return (NSString *)v4;
}

- (CGSize)imageSize
{
  double pixelWidth = (double)self->_pixelWidth;
  pixelCGFloat Height = (double)self->_pixelHeight;
  result.double height = pixelHeight;
  result.double width = pixelWidth;
  return result;
}

- (signed)kindSubtype
{
  return _assetSubtypeForMediaSubtypes(self->_mediaSubtypes);
}

- (signed)kind
{
  unint64_t mediaType = self->_mediaType;
  if (mediaType >= 4) {
    char v3 = 3;
  }
  else {
    char v3 = 0x2000100000003uLL >> (16 * mediaType);
  }
  return v3 & 3;
}

- (BOOL)isOriginalSRGB
{
  unsigned __int8 v2 = [(PHAsset *)self originalColorSpace];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F1DC98]];

  return v3;
}

- (CGSize)originalUnorientedSize
{
  if ([(PHAsset *)self hasAdjustments])
  {
    [(PHAsset *)self originalImageSize];
    [(PHAsset *)self originalImageOrientation];
    PLExifOrientationFromImageOrientation();
    PLOrientationInverse();
    PLOrientationTransformImageSize();
  }
  else
  {
    [(PHAsset *)self unorientedSize];
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)originalImageSize
{
  [(PHObject *)self addFetchPropertyHint:8];
  double v3 = [(PHAsset *)self originalMetadataProperties];
  double v4 = (double)[v3 originalWidth];
  id v5 = [(PHAsset *)self originalMetadataProperties];
  double v6 = (double)[v5 originalHeight];

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (int64_t)originalImageOrientation
{
  [(PHObject *)self addFetchPropertyHint:8];
  double v3 = [(PHAsset *)self originalMetadataProperties];
  [v3 originalExifOrientation];
  int64_t v4 = PLImageOrientationFromExifOrientation();

  return v4;
}

- (NSURL)ALAssetURL
{
  double v3 = (void *)MEMORY[0x1E4F8A950];
  int64_t v4 = [(PHObject *)self uuid];
  id v5 = [(PHAsset *)self filename];
  double v6 = [v5 pathExtension];
  double v7 = [v3 assetsLibraryURLWithUUID:v4 extension:v6];

  return (NSURL *)v7;
}

- (double)aspectRatio
{
  if (![(PHAsset *)self pixelHeight]) {
    return 1.0;
  }
  double v3 = (double)[(PHAsset *)self pixelWidth];
  return v3 / (double)[(PHAsset *)self pixelHeight];
}

- (id)pl_photoLibrary
{
  unsigned __int8 v2 = [(PHObject *)self photoLibrary];
  double v3 = [v2 photoLibrary];

  return v3;
}

- (BOOL)faceAnalysisVersionWasFetched
{
  return ([(PHObject *)self propertyHint] >> 11) & 1;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (id)originalCreationDateWithTimeZone:(id *)a3
{
  id v5 = [(PHAsset *)self photosInfoPanelExtendedProperties];
  double v6 = [v5 dateCreated];
  if (a3)
  {
    double v7 = [v5 timezoneOffset];

    if (v7)
    {
      double v8 = (void *)MEMORY[0x1E4F1CAF0];
      id v9 = [v5 timezoneOffset];
      objc_msgSend(v8, "timeZoneForSecondsFromGMT:", objc_msgSend(v9, "integerValue"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (!v6)
  {
    id v10 = [(PHObject *)self photoLibrary];
    id v11 = [v10 photoLibraryBundle];
    id v12 = [v11 timeZoneLookup];

    if ([(PHAsset *)self isVideo])
    {
      uint64_t v13 = [(PHAsset *)self originalAVAssetOrProxy];
      if (v13)
      {
        int64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v13 timeZoneLookup:v12];
LABEL_11:

        double v6 = [v14 utcCreationDate];
        int v18 = [v14 timeZone];
        uint64_t v19 = v18;
        if (a3) {
          *a3 = v18;
        }

        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v13 = [(PHAsset *)self originalImageProperties];
      if (v13)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F8CDF8];
        char v16 = [(PHAsset *)self uniformTypeIdentifier];
        int v17 = [v15 typeWithIdentifier:v16];

        int64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithImageProperties:v13 contentType:v17 timeZoneLookup:v12];
        goto LABEL_11;
      }
    }
    int64_t v14 = 0;
    goto LABEL_11;
  }
LABEL_14:

  return v6;
}

- (id)originalAVAssetCommonMetadata
{
  unsigned __int8 v2 = [(PHAsset *)self originalAVAssetOrProxy];
  double v3 = [v2 commonMetadata];

  return v3;
}

- (id)originalAVAssetOrProxy
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__21007;
  int64_t v14 = __Block_byref_object_dispose__21008;
  id v15 = 0;
  double v3 = [(PHAsset *)self pl_photoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__PHAsset_originalAVAssetOrProxy__block_invoke;
  void v7[3] = &unk_1E5848318;
  void v7[4] = self;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

void __33__PHAsset_originalAVAssetOrProxy__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 avAssetProxyForOriginalAllowReadFromFile:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)originalImageProperties
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__21007;
  int64_t v14 = __Block_byref_object_dispose__21008;
  id v15 = 0;
  uint64_t v3 = [(PHAsset *)self pl_photoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__PHAsset_originalImageProperties__block_invoke;
  void v7[3] = &unk_1E5848318;
  void v7[4] = self;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

void __34__PHAsset_originalImageProperties__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 imageProperties];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isLocatedAtCoordinates:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = [(PHAsset *)self location];
  double v6 = v5;
  if (v5)
  {
    [v5 coordinate];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1E750];
    double v10 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  if (objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:", latitude, longitude))
  {
    BOOL v11 = vabdd_f64(latitude, v8) < 2.22044605e-16;
    LOBYTE(v12) = vabdd_f64(longitude, v10) < 2.22044605e-16 && v11;
  }
  else
  {
    int v12 = objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:", v8, v10) ^ 1;
  }

  return v12;
}

- (BOOL)isScreenRecording
{
  if ([(PHAsset *)self isMediaSubtype:0x80000])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(PHAsset *)self isVideo];
    if (v3)
    {
      id v4 = [(PHAsset *)self originalFilename];
      char v5 = [MEMORY[0x1E4F8A950] isScreenRecordingFileName:v4];

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)isPrimaryImageFormat
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8A950];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  LOBYTE(v2) = [v2 isPrimaryImageFormatForUTI:v3];

  return (char)v2;
}

- (BOOL)isHEICSequence
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [MEMORY[0x1E4F8CDF8] heicSequenceType];
  char v6 = [v4 conformsToType:v5];

  return v6;
}

- (BOOL)isAnimatedGIF
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 isEqual:*MEMORY[0x1E4F443D0]];

  return v5;
}

- (BOOL)isRAW
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F44498]];

  return v5;
}

- (BOOL)isPSD
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [MEMORY[0x1E4F8CDF8] adobePhotoshopType];
  char v6 = [v4 conformsToType:v5];

  return v6;
}

- (BOOL)isPDF
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F44450]];

  return v5;
}

- (BOOL)isPNG
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F44460]];

  return v5;
}

- (BOOL)isTIFF
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F444E0]];

  return v5;
}

- (BOOL)isHEIF
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F44568]];

  return v5;
}

- (BOOL)isJPEG2000
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [MEMORY[0x1E4F8CDF8] jpeg2000Type];
  char v6 = [v4 conformsToType:v5];

  return v6;
}

- (BOOL)isJPEG
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CDF8];
  BOOL v3 = [(PHAsset *)self uniformTypeIdentifier];
  id v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F44410]];

  return v5;
}

- (BOOL)isHDVideo
{
  BOOL v3 = [(PHAsset *)self isVideo];
  if (v3)
  {
    NSUInteger v4 = [(PHAsset *)self pixelWidth];
    NSUInteger v5 = [(PHAsset *)self pixelHeight];
    LOBYTE(v3) = v4 >= 0x2D0 && v5 > 0x4FF || v4 > 0x4FF && v5 > 0x2CF;
  }
  return v3;
}

- (int64_t)imageOrientation
{
  return PLImageOrientationFromExifOrientation();
}

- (int)orientation
{
  if (dyld_program_sdk_at_least())
  {
    NSUInteger v4 = self;
    PFMethodNotImplementedException();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  return self->_exifOrientation;
}

- (id)_unfetchedPropertySetsFromPropertySets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (!-[PHObject hasLoadedPropertySet:](self, "hasLoadedPropertySet:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isVariationSuggestionStatesUnknown
{
  [(PHObject *)self addFetchPropertyHint:16];
  BOOL v3 = [(PHAsset *)self photosOneUpProperties];
  uint64_t v4 = [v3 variationSuggestionStates];

  return v4 == 0;
}

- (unint64_t)variationSuggestionStatesForVariationType:(unint64_t)a3
{
  [(PHObject *)self addFetchPropertyHint:16];
  id v5 = [(PHAsset *)self photosOneUpProperties];
  unint64_t v6 = [v5 variationSuggestionStates];

  if (a3) {
    return (v6 >> (6 * a3 - 6)) & 0x3F;
  }
  else {
    return 0;
  }
}

- (int)analysisStateForWorkerType:(signed __int16)a3 outLastIgnoreDate:(id *)a4 outIgnoreUntilDate:(id *)a5
{
  uint64_t v7 = a3;
  [(PHObject *)self fetchPropertySetsIfNeeded];
  uint64_t v9 = [(PHAsset *)self assetAnalysisStateProperties];
  LODWORD(a5) = [v9 analysisStateForWorkerType:v7 outLastIgnoreDate:a4 outIgnoreUntilDate:a5];

  return (int)a5;
}

- (NSData)distanceIdentity
{
  [(PHObject *)self fetchPropertySetsIfNeeded];
  BOOL v3 = [(PHAsset *)self sceneAnalysisProperties];
  uint64_t v4 = [v3 distanceIdentity];

  return (NSData *)v4;
}

- (id)_sceneClassificationsWithPredicate:(id)a3
{
  v42[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42[0] = @"sceneIdentifier";
  v42[1] = @"confidence";
  v42[2] = @"packedBoundingBoxRect";
  v42[3] = @"startTime";
  v42[4] = @"duration";
  v42[5] = @"classificationType";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:6];
  unint64_t v6 = [MEMORY[0x1E4F8AB80] entityName];
  uint64_t v7 = [(PHObject *)self photoLibrary];
  uint64_t v8 = +[PHAssetSceneAnalysisProperties propertySetName];
  uint64_t v9 = [v7 objectFetchingManagedObjectContextForObject:self propertySet:v8];

  double v10 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __46__PHAsset__sceneClassificationsWithPredicate___block_invoke;
  v34[3] = &unk_1E58451D0;
  id v28 = v6;
  id v35 = v28;
  id v29 = v4;
  id v36 = v29;
  id v27 = v5;
  id v37 = v27;
  id v12 = v9;
  id v38 = v12;
  id v13 = v10;
  id v39 = v13;
  id v14 = v11;
  id v40 = v14;
  [v12 performBlockAndWait:v34];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        int v21 = [v15 objectForKeyedSubscript:v20];
        uint64_t v22 = (void *)[v21 copy];
        id v23 = ph_objc_setAssociatedObjectIfNotSet(self, v20, v22);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
    }
    while (v17);
  }

  uint64_t v24 = v40;
  id v25 = v13;

  return v25;
}

void __46__PHAsset__sceneClassificationsWithPredicate___block_invoke(uint64_t a1)
{
  void v45[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setPredicate:*(void *)(a1 + 40)];
  [v2 setPropertiesToFetch:*(void *)(a1 + 48)];
  v45[0] = @"assetAttributes";
  v45[1] = @"assetAttributesForTemporalSceneClassifications";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v2 setRelationshipKeyPathsForPrefetching:v3];

  [v2 setResultType:2];
  id v4 = *(void **)(a1 + 56);
  id v42 = 0;
  id v36 = v2;
  id v5 = [v4 executeFetchRequest:v2 error:&v42];
  id v6 = v42;
  if (!v5)
  {
    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Error fetching scene classifications, entity: %@, error: %@", buf, 0x16u);
    }
  }
  id v35 = v6;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 objectForKeyedSubscript:@"sceneIdentifier"];
        uint64_t v15 = [v14 unsignedLongLongValue];

        uint64_t v16 = [v13 objectForKeyedSubscript:@"confidence"];
        [v16 doubleValue];
        double v18 = v17;

        uint64_t v19 = [v13 objectForKeyedSubscript:@"startTime"];
        [v19 doubleValue];
        double v21 = v20;

        uint64_t v22 = [v13 objectForKeyedSubscript:@"duration"];
        [v22 doubleValue];
        double v24 = v23;

        id v25 = [v13 objectForKeyedSubscript:@"classificationType"];
        uint64_t v26 = [v25 integerValue];

        id v27 = [v13 objectForKeyedSubscript:@"packedBoundingBoxRect"];
        [v27 longLongValue];

        memset(buf, 0, sizeof(buf));
        PLSplitToCGRectFromInt64();
        id v28 = [PHSceneClassification alloc];
        id v29 = -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](v28, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v15, v26, v18, *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16], v21, v24);
        [*(id *)(a1 + 64) addObject:v29];
        long long v30 = *(void **)(a1 + 72);
        long long v31 = [NSNumber numberWithInteger:v26];
        long long v32 = [v30 objectForKeyedSubscript:v31];

        if (!v32)
        {
          long long v32 = [MEMORY[0x1E4F1CA80] set];
          long long v33 = *(void **)(a1 + 72);
          id v34 = [NSNumber numberWithInteger:v26];
          [v33 setObject:v32 forKeyedSubscript:v34];
        }
        [v32 addObject:v29];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v10);
  }
}

- (NSSet)temporalSceneClassifications
{
  return (NSSet *)[(PHAsset *)self sceneClassificationsOfTypes:&unk_1EEB26A18];
}

- (NSSet)allSceneClassifications
{
  return (NSSet *)[(PHAsset *)self sceneClassificationsOfTypes:&unk_1EEB26A00];
}

- (NSSet)sceneClassifications
{
  return (NSSet *)[(PHAsset *)self sceneClassificationsOfTypes:&unk_1EEB269E8];
}

- (id)sceneClassificationsOfTypes:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  id v42 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (!v8)
  {
    uint64_t v43 = 0;
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  SEL v40 = a2;
  uint64_t v43 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v45;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v45 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
      id v14 = ph_objc_getAssociatedObject(self, v13);
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = [v14 allObjects];
        [v6 addObjectsFromArray:v16];
LABEL_8:

        goto LABEL_9;
      }
      unint64_t v17 = [v13 integerValue];
      if (v17 > 7) {
        goto LABEL_16;
      }
      long long v39 = v10;
      if (((1 << v17) & 0xF1) != 0)
      {
        double v18 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v19 = [(PHObject *)self objectID];
        uint64_t v10 = [v18 predicateWithFormat:@"%K == %@", @"assetAttributes.asset", v19];

        [v42 addObject:v13];
      }
      else
      {
        if (((1 << v17) & 0xC) == 0)
        {
LABEL_16:
          uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:v40, self, @"PHAsset.m", 2246, @"Invalid parameter not satisfying: %@", @"knownSceneIdentifier" object file lineNumber description];
          goto LABEL_8;
        }
        double v20 = (void *)MEMORY[0x1E4F28F60];
        double v21 = [(PHObject *)self objectID];
        uint64_t v22 = [v20 predicateWithFormat:@"%K == %@", @"assetAttributesForTemporalSceneClassifications.asset", v21];

        uint64_t v10 = v39;
        [v41 addObject:v13];
        uint64_t v43 = (void *)v22;
      }
LABEL_9:

      ++v12;
    }
    while (v9 != v12);
    uint64_t v23 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
    uint64_t v9 = v23;
  }
  while (v23);
LABEL_20:

  double v24 = [MEMORY[0x1E4F1CA48] array];
  if (v10)
  {
    id v25 = (void *)MEMORY[0x1E4F28BA0];
    v49[0] = v10;
    uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"classificationType", v42];
    v49[1] = v26;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    id v28 = [v25 andPredicateWithSubpredicates:v27];
    [v24 addObject:v28];
  }
  id v29 = v43;
  if (v43)
  {
    long long v30 = (void *)MEMORY[0x1E4F28BA0];
    v48[0] = v43;
    long long v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"classificationType", v41];
    v48[1] = v31;
    long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    long long v33 = [v30 andPredicateWithSubpredicates:v32];
    [v24 addObject:v33];

    id v29 = v43;
  }
  if ([v24 count])
  {
    id v34 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v24];
    id v35 = [(PHAsset *)self _sceneClassificationsWithPredicate:v34];
    id v36 = [v35 allObjects];
    [v6 addObjectsFromArray:v36];

    id v29 = v43;
  }
  id v37 = v6;

  return v37;
}

- (unint64_t)originalResourceChoice
{
  [(PHObject *)self addFetchPropertyHint:0x2000];
  BOOL v3 = [(PHAsset *)self adjustmentProperties];
  unint64_t v4 = [v3 originalResourceChoice];

  return v4;
}

- (id)iconicScoreProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x800000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)ptpProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x2000000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)locationDataProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x400000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)StoryPlaybackProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x4000000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)spatialMediaProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x100000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)montageProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0xFFFFFFFF80000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)cloudLocalStateProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x20000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)libraryScopeProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x4000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)coarseLocationProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x2000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)gridMetadataProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x800000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)keywordProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x400000];

  return [(PHAsset *)self _createKeywordPropertyObject];
}

- (id)destinationAssetCopyProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x80000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)sceneprintProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x40000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)importProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x20000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)visualSearchProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x40000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)characterRecognitionProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x8000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)photoAnalysisWallpaperProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x200000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)mediaAnalysisProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x10000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)aestheticProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x8000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)adjustmentProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x2000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)assetUserActivityProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:1024];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)assetAnalysisStateProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:512];

  return [(PHAsset *)self _createAnalysisStatePropertyObject];
}

- (id)sceneAnalysisProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:256];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)commentProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:128];
  if ([(PHAsset *)self isCloudSharedAsset])
  {
    uint64_t v3 = [(PHAsset *)self _createCommentPropertyObject];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)cloudSharedProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x10000000000];
  if ([(PHAsset *)self isCloudSharedAsset])
  {
    uint64_t v3 = [(PHAsset *)self _createPropertyObjectOfClass:objc_opt_class()];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)descriptionProperties
{
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)photoIrisProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:32];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)cameraCaptureDeviceProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x10000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)photosSmartStyleExtendedProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x8000000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)photosInfoPanelLocationProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x1000000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)photosInfoPanelExtendedProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x100000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)localDateProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:0x200000];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)photosOneUpProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:16];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)originalMetadataProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:8];
  uint64_t v3 = objc_opt_class();

  return [(PHAsset *)self _createPropertyObjectOfClass:v3];
}

- (id)_createKeywordPropertyObject
{
  uint64_t v3 = objc_opt_class();
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__21007;
  double v21 = __Block_byref_object_dispose__21008;
  ph_objc_getAssociatedObject(self, v3);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = (void *)v18[5];
  if (!v4)
  {
    id v5 = [(PHObject *)self photoLibrary];
    id v6 = [v3 propertySetName];
    id v7 = [v5 objectFetchingManagedObjectContextForObject:self propertySet:v6];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __39__PHAsset__createKeywordPropertyObject__block_invoke;
    v13[3] = &unk_1E58451A8;
    v13[4] = self;
    id v8 = v7;
    id v14 = v8;
    uint64_t v15 = &v17;
    uint64_t v16 = v3;
    [v8 performBlockAndWait:v13];
    uint64_t v9 = ph_objc_setAssociatedObjectIfNotSet(self, v3, (void *)v18[5]);
    uint64_t v10 = (void *)v18[5];
    v18[5] = v9;

    unint64_t v4 = (void *)v18[5];
  }
  id v11 = v4;
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __39__PHAsset__createKeywordPropertyObject__block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = [MEMORY[0x1E4F8A970] entityName];
  unint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) objectID];
  v28[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v8 = [v5 predicateWithFormat:@"ANY assetAttributes.asset IN %@", v7];
  [v4 setPredicate:v8];

  [v4 setPropertiesToFetch:&unk_1EEB269D0];
  [v4 setResultType:2];
  uint64_t v9 = *(void **)(a1 + 40);
  id v19 = 0;
  uint64_t v10 = [v9 executeFetchRequest:v4 error:&v19];
  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v10, "_pl_map:", &__block_literal_global_710);
    double v20 = @"keywordTitles";
    double v21 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v14 = [objc_alloc(*(Class *)(a1 + 56)) initWithFetchDictionary:v13 asset:*(void *)(a1 + 32) prefetched:0];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 56);
      double v18 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch propert set %@ data for %@: %@", buf, 0x20u);
    }
  }
}

uint64_t __39__PHAsset__createKeywordPropertyObject__block_invoke_707(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"title"];
}

- (id)_createAnalysisStatePropertyObject
{
  uint64_t v3 = objc_opt_class();
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy__21007;
  id v22 = __Block_byref_object_dispose__21008;
  ph_objc_getAssociatedObject(self, v3);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = (void *)v19[5];
  if (!v4)
  {
    id v5 = [(PHObject *)self photoLibrary];
    id v6 = [v3 propertySetName];
    id v7 = [v5 objectFetchingManagedObjectContextForObject:self propertySet:v6];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __45__PHAsset__createAnalysisStatePropertyObject__block_invoke;
    v13[3] = &unk_1E5845180;
    v13[4] = self;
    uint64_t v14 = @"AssetAnalysisState";
    id v8 = v7;
    id v15 = v8;
    uint64_t v16 = &v18;
    uint64_t v17 = v3;
    [v8 performBlockAndWait:v13];
    uint64_t v9 = ph_objc_setAssociatedObjectIfNotSet(self, v3, (void *)v19[5]);
    uint64_t v10 = (void *)v19[5];
    v19[5] = v9;

    unint64_t v4 = (void *)v19[5];
  }
  id v11 = v4;
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __45__PHAsset__createAnalysisStatePropertyObject__block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v3 = [*(id *)(a1 + 32) objectID];
  unint64_t v4 = [v2 predicateWithFormat:@"asset == %@", v3];

  id v5 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 40)];
  [v5 setPredicate:v4];
  [v5 setResultType:2];
  id v6 = *(void **)(a1 + 48);
  id v15 = 0;
  id v7 = [v6 executeFetchRequest:v5 error:&v15];
  id v8 = v15;
  if (v7)
  {
    id v22 = @"assetAnalysisStates";
    v23[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v10 = [objc_alloc(*(Class *)(a1 + 64)) initWithFetchDictionary:v9 asset:*(void *)(a1 + 32) prefetched:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 64) description];
      uint64_t v14 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);
    }
  }
}

- (id)_createCommentPropertyObject
{
  v34[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__21007;
  long long v32 = __Block_byref_object_dispose__21008;
  ph_objc_getAssociatedObject(self, v3);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = (void *)v29[5];
  if (!v4)
  {
    v34[0] = @"commentDate";
    v34[1] = @"isLike";
    v34[2] = @"isMyComment";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    id v6 = (void *)MEMORY[0x1E4F28F60];
    id v7 = [(PHObject *)self objectID];
    id v8 = [(PHObject *)self objectID];
    uint64_t v9 = [v6 predicateWithFormat:@"likedAsset == %@ OR commentedAsset == %@", v7, v8];

    uint64_t v10 = [(PHObject *)self photoLibrary];
    uint64_t v11 = [v3 propertySetName];
    uint64_t v12 = [v10 objectFetchingManagedObjectContextForObject:self propertySet:v11];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__PHAsset__createCommentPropertyObject__block_invoke;
    v20[3] = &unk_1E58468D0;
    id v21 = @"CloudSharedComment";
    id v13 = v9;
    id v22 = v13;
    id v14 = v5;
    id v23 = v14;
    id v15 = v12;
    __int16 v26 = &v28;
    id v27 = v3;
    id v24 = v15;
    id v25 = self;
    [v15 performBlockAndWait:v20];
    uint64_t v16 = ph_objc_setAssociatedObjectIfNotSet(self, v3, (void *)v29[5]);
    uint64_t v17 = (void *)v29[5];
    v29[5] = v16;

    unint64_t v4 = (void *)v29[5];
  }
  id v18 = v4;
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __39__PHAsset__createCommentPropertyObject__block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setPredicate:*(void *)(a1 + 40)];
  [v2 setPropertiesToFetch:*(void *)(a1 + 48)];
  [v2 setResultType:2];
  uint64_t v3 = *(void **)(a1 + 56);
  id v12 = 0;
  unint64_t v4 = [v3 executeFetchRequest:v2 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v19 = @"comments";
    v20[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v7 = [objc_alloc(*(Class *)(a1 + 80)) initWithFetchDictionary:v6 asset:*(void *)(a1 + 64) prefetched:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [*(id *)(a1 + 80) description];
      uint64_t v11 = [*(id *)(a1 + 64) uuid];
      *(_DWORD *)buf = 138412802;
      id v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);
    }
  }
}

- (BOOL)needsDeferredProcessing
{
  unsigned int v3 = [(PHAsset *)self deferredProcessingNeeded] - 1;
  return v3 < 0xA && ((0x243u >> v3) & 1) != 0
      || [(PHAsset *)self videoDeferredProcessingNeeded] == 1;
}

- (NSDate)localCreationDate
{
  localCreationDate = self->_localCreationDate;
  if (!localCreationDate)
  {
    [(PHObject *)self fetchPropertySetsIfNeeded];
    unint64_t v4 = [(PHAsset *)self creationDate];
    id v5 = [(PHAsset *)self localDateProperties];
    id v6 = [v5 inferredTimeZoneOffset];

    if (v6)
    {
      int v7 = [v6 integerValue];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      int v7 = [v8 secondsFromGMTForDate:v4];
    }
    uint64_t v9 = [v4 dateByAddingTimeInterval:(double)v7];
    uint64_t v10 = self->_localCreationDate;
    self->_localCreationDate = v9;

    localCreationDate = self->_localCreationDate;
  }

  return localCreationDate;
}

- (id)creationDateAdjustedForTimeZone
{
  [(PHObject *)self fetchPropertySetsIfNeeded];
  unsigned int v3 = [(PHAsset *)self creationDate];
  unint64_t v4 = [(PHAsset *)self originalMetadataProperties];
  id v5 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v4, "timeZoneOffset"));

  return v5;
}

- (signed)assetSource
{
  signed __int16 v4 = [(PHAsset *)self savedAssetType];
  if (assetSource_onceToken != -1) {
    dispatch_once(&assetSource_onceToken, &__block_literal_global_555);
  }
  if (!assetSource_linkedBefore11_0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PHAsset.m", 1414, @"assetSource is not a supported property, use sourceType" object file lineNumber description];
  }
  return v4;
}

uint64_t __22__PHAsset_assetSource__block_invoke()
{
  uint64_t result = dyld_get_program_sdk_version();
  assetSource_linkedBefore11_0 = result < 0xB0000;
  return result;
}

+ (BOOL)isOriginalVideoComplementKnownUnsupportedFormatForAsset:(id)a3 failureInfo:(id *)a4
{
  return _IsOriginalKnownUnsupportedFormatForAsset(a3, 1, a4);
}

+ (BOOL)isOriginalKnownUnsupportedFormatForAsset:(id)a3 failureInfo:(id *)a4
{
  return _IsOriginalKnownUnsupportedFormatForAsset(a3, 0, a4);
}

+ (BOOL)_libraryScopeAssetContributedByCurrentUser:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  signed __int16 v4 = objc_msgSend(v3, "pl_photoLibrary");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PHAsset__libraryScopeAssetContributedByCurrentUser___block_invoke;
  void v7[3] = &unk_1E5848D28;
  id v5 = v3;
  id v8 = v5;
  uint64_t v9 = &v10;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

void __54__PHAsset__libraryScopeAssetContributedByCurrentUser___block_invoke(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = [MEMORY[0x1E4F8A950] entityName];
  signed __int16 v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  int v7 = [*(id *)(a1 + 32) objectID];
  id v8 = [v6 predicateWithFormat:@"self == %@", v7];
  v25[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyContentContributedByCurrentUser];
  v25[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v11 = [v5 andPredicateWithSubpredicates:v10];
  [v4 setPredicate:v11];

  [v4 setResultType:4];
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "pl_photoLibrary");
  char v13 = [v12 managedObjectContext];
  id v18 = 0;
  uint64_t v14 = [v13 countForFetchRequest:v4 error:&v18];
  id v15 = v18;

  if (v14 == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138412802;
      __int16 v20 = v17;
      __int16 v21 = 2080;
      id v22 = "+[PHAsset _libraryScopeAssetContributedByCurrentUser:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch asset %@ for %s: %@", buf, 0x20u);
    }
  }
}

+ (BOOL)_isLibraryScopeExiting:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  signed __int16 v4 = objc_msgSend(v3, "pl_photoLibrary");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__PHAsset__isLibraryScopeExiting___block_invoke;
  v9[3] = &unk_1E5848318;
  id v5 = v4;
  id v10 = v5;
  id v6 = v3;
  id v11 = v6;
  uint64_t v12 = &v13;
  [v5 performBlockAndWait:v9];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __34__PHAsset__isLibraryScopeExiting___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uuid];
  signed __int16 v4 = [v2 assetWithUUID:v3];

  if (v4)
  {
    id v5 = [v4 libraryScope];
    if (v5)
    {
      id v6 = v5;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 exitState] != 0;
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F1C0D0];
      uint64_t v9 = [MEMORY[0x1E4F8A8D8] entityName];
      id v10 = [v8 fetchRequestWithEntityName:v9];

      id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"exitState", 0);
      [v10 setPredicate:v11];

      [v10 setResultType:4];
      uint64_t v12 = [*(id *)(a1 + 32) managedObjectContext];
      id v16 = 0;
      uint64_t v13 = [v12 countForFetchRequest:v10 error:&v16];
      uint64_t v14 = (char *)v16;

      if (v13 == 1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      else if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v18 = "+[PHAsset _isLibraryScopeExiting:]_block_invoke";
          __int16 v19 = 2112;
          __int16 v20 = v14;
          _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch exit library scope for %s: %@", buf, 0x16u);
        }
      }
      id v6 = 0;
    }
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)buf = 138412546;
      id v18 = v7;
      __int16 v19 = 2080;
      __int16 v20 = "+[PHAsset _isLibraryScopeExiting:]_block_invoke";
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch asset %@ for %s", buf, 0x16u);
    }
  }
}

+ (id)originalUniformTypeIdentifierForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__21007;
  __int16 v17 = __Block_byref_object_dispose__21008;
  id v18 = 0;
  signed __int16 v4 = objc_msgSend(v3, "pl_photoLibrary");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PHAsset_originalUniformTypeIdentifierForAsset___block_invoke;
  v9[3] = &unk_1E5848318;
  id v5 = v3;
  id v10 = v5;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = &v13;
  [v6 performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __49__PHAsset_originalUniformTypeIdentifierForAsset___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 originalUniformTypeIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  signed __int16 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___PHAsset;
  id v8 = objc_msgSendSuper2(&v23, sel_fetchPredicateFromComparisonPredicate_options_, v6, v7);
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  if (v8) {
    goto LABEL_24;
  }
  id v10 = [v6 leftExpression];
  id v11 = [v6 rightExpression];
  if ([v10 expressionType] == 3)
  {
    uint64_t v12 = [v10 keyPath];
    id v13 = v11;
LABEL_6:
    uint64_t v14 = v13;
    goto LABEL_14;
  }
  if ([v11 expressionType] == 3)
  {
    uint64_t v12 = [v11 keyPath];
    id v13 = v10;
    goto LABEL_6;
  }
  if ([v10 expressionType] == 4 || objc_msgSend(v11, "expressionType") == 4)
  {
    uint64_t v15 = [v6 predicateFormat];
    int v16 = [v15 containsString:@"mediaSubtypes"];

    if (v16)
    {
      [v9 addObject:@"mediaSubtypes"];
    }
    else
    {
      __int16 v17 = [v6 predicateFormat];
      int v18 = [v17 containsString:@"mediaSubtype"];

      if (v18) {
        [v9 addObject:@"mediaSubtype"];
      }
    }
  }
  uint64_t v14 = 0;
  uint64_t v12 = 0;
LABEL_14:
  if ([v12 isEqualToString:@"mediaSubtypes"])
  {
    [v9 addObject:@"mediaSubtypes"];
  }
  else if ([v12 isEqualToString:@"mediaSubtype"])
  {
    [v9 addObject:@"mediaSubtype"];
  }
  else if ([v12 isEqualToString:@"adjustmentFormatIdentifier"] {
         && ![v14 expressionType])
  }
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28F60];
    id v22 = [v14 constantValue];
    id v8 = [v21 predicateWithFormat:@"%K = %@", @"additionalAttributes.unmanagedAdjustment.adjustmentFormatIdentifier", v22];

    goto LABEL_21;
  }
  id v8 = 0;
LABEL_21:
  if ([v9 count])
  {
    uint64_t v19 = [a1 _transformMediaSubtypeReferences:v9 inComparisonPredicate:v6 options:v7];

    id v8 = (void *)v19;
  }

LABEL_24:

  return v8;
}

+ (id)descriptionForMediaSubtypes:(unint64_t)a3
{
  signed __int16 v4 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 64; ++i)
  {
    if (((1 << i) & 0x1FF075F) != 0 && ((1 << i) & a3) != 0)
    {
      id v7 = +[PHAsset _descriptionForMediaSubtype:](PHAsset, "_descriptionForMediaSubtype:");
      [v4 addObject:v7];
    }
  }
  if ([v4 count])
  {
    id v8 = [v4 componentsJoinedByString:@","];
  }
  else
  {
    id v8 = @"none";
  }

  return v8;
}

+ (id)_descriptionForMediaSubtype:(unint64_t)a3
{
  id result = @"unknown";
  if ((uint64_t)a3 <= 1023)
  {
    if ((uint64_t)a3 > 15)
    {
      uint64_t v14 = @"semantic enhance";
      uint64_t v15 = @"HDR gain map";
      if (a3 != 512) {
        uint64_t v15 = @"unknown";
      }
      if (a3 != 256) {
        uint64_t v14 = v15;
      }
      int v16 = @"deptheffect";
      __int16 v17 = @"animated";
      if (a3 != 64) {
        __int16 v17 = @"unknown";
      }
      if (a3 != 16) {
        int v16 = v17;
      }
      if ((uint64_t)a3 <= 255) {
        return v16;
      }
      else {
        return v14;
      }
    }
    else
    {
      switch(a3)
      {
        case 0uLL:
          id result = @"none";
          break;
        case 1uLL:
          id result = @"panorama";
          break;
        case 2uLL:
          id result = @"HDR";
          break;
        case 4uLL:
          id result = @"screenshot";
          break;
        case 8uLL:
          id result = @"livephoto";
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    signed __int16 v4 = @"actioncam";
    id v5 = @"high or extended dynamic range";
    id v6 = @"smart style";
    if (a3 != 0x1000000) {
      id v6 = @"unknown";
    }
    if (a3 != 0x800000) {
      id v5 = v6;
    }
    if (a3 != 0x400000) {
      signed __int16 v4 = v5;
    }
    id v7 = @"video HDR";
    id v8 = @"cinematic video";
    if (a3 != 0x200000) {
      id v8 = @"unknown";
    }
    if (a3 != 0x100000) {
      id v7 = v8;
    }
    if ((uint64_t)a3 < 0x400000) {
      signed __int16 v4 = v7;
    }
    uint64_t v9 = @"highframerate";
    id v10 = @"timelapse";
    id v11 = @"screenrecording";
    if (a3 != 0x80000) {
      id v11 = @"unknown";
    }
    if (a3 != 0x40000) {
      id v10 = v11;
    }
    if (a3 != 0x20000) {
      uint64_t v9 = v10;
    }
    uint64_t v12 = @"spatial media";
    id v13 = @"streamedvideo";
    if (a3 != 0x10000) {
      id v13 = @"unknown";
    }
    if (a3 != 1024) {
      uint64_t v12 = v13;
    }
    if ((uint64_t)a3 < 0x20000) {
      uint64_t v9 = v12;
    }
    if ((uint64_t)a3 < 0x100000) {
      return v9;
    }
    else {
      return v4;
    }
  }
  return result;
}

+ (id)descriptionForMediaType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E58454F0[a3 - 1];
  }
}

+ (id)descriptionForPlaybackStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"unknown";
  }
  else {
    return off_1E58454C0[a3];
  }
}

+ (id)_descriptionForVariationSuggestionStates:(unint64_t)a3
{
  char v3 = a3;
  signed __int16 v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = v4;
  if (v3)
  {
    [v4 addObject:@"suggested"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"poor"];
  if ((v3 & 0x20) != 0) {
LABEL_4:
  }
    [v5 addObject:@"seen"];
LABEL_5:
  if ([v5 count])
  {
    id v6 = [v5 componentsJoinedByString:@","];
  }
  else
  {
    id v6 = @"Unknown";
  }

  return v6;
}

+ (id)_descriptionForVariationSuggestionType:(unint64_t)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_1E58454A0[a3];
  }
}

+ (id)fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PHAsset.m", 4027, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PHAsset_fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions___block_invoke;
  v10[3] = &unk_1E5849048;
  id v11 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v10];

  return v7;
}

id __70__PHAsset_fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAnyCinematicVideosNeedingDeferredProcessingWithOtions:*(void *)(a1 + 32)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchAssetsForPTPWithOptions:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PHAsset.m", 4019, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__PHAsset_fetchAssetsForPTPWithOptions___block_invoke;
  v10[3] = &unk_1E5849048;
  id v11 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v10];

  return v7;
}

id __40__PHAsset_fetchAssetsForPTPWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAssetsForPTPWithOptions:*(void *)(a1 + 32)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchAssetsThroughGraphEdgesForPerson:(id)a3 options:(id)a4
{
  signed __int16 v4 = +[PHGraphQuery graphQueryForAssetsForPerson:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PHAsset_fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions___block_invoke;
  void v7[3] = &unk_1E5849048;
  id v8 = v3;
  id v4 = v3;
  id v5 = +[PHObject authorizationAwareFetchResultWithOptions:v4 fetchBlock:v7];

  return v5;
}

id __95__PHAsset_fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAssetsInPreviewStateWithSuggestedByClientTypes:&unk_1EEB26A30 options:*(void *)(a1 + 32)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchAssetsInPreviewStateWithSuggestedByClientType:(signed __int16)a3 options:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PHAsset_fetchAssetsInPreviewStateWithSuggestedByClientType_options___block_invoke;
  v9[3] = &unk_1E5845310;
  signed __int16 v11 = a3;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v9];

  return v7;
}

id __70__PHAsset_fetchAssetsInPreviewStateWithSuggestedByClientType_options___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSNumber numberWithShort:*(__int16 *)(a1 + 40)];
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = +[PHQuery queryForAssetsInPreviewStateWithSuggestedByClientTypes:v3 options:*(void *)(a1 + 32)];

  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchAssetsInPreviewStateInLibraryScope:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __59__PHAsset_fetchAssetsInPreviewStateInLibraryScope_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  uint64_t v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

id __59__PHAsset_fetchAssetsInPreviewStateInLibraryScope_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAssetsInPreviewStateInLibraryScope:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchAssetsWithCurrentUserAsLibraryScopeContributor:(BOOL)a3 inLibraryScope:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __86__PHAsset_fetchAssetsWithCurrentUserAsLibraryScopeContributor_inLibraryScope_options___block_invoke;
  v13[3] = &unk_1E58452E8;
  BOOL v16 = a3;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  signed __int16 v11 = +[PHObject authorizationAwareFetchResultWithOptions:v9 fetchBlock:v13];

  return v11;
}

id __86__PHAsset_fetchAssetsWithCurrentUserAsLibraryScopeContributor_inLibraryScope_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAssetsWithCurrentUserAsLibraryScopeContributor:*(unsigned __int8 *)(a1 + 48) inLibraryScope:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchAssetsInLibraryScope:(id)a3 fromAssets:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __48__PHAsset_fetchAssetsInLibraryScope_fromAssets___block_invoke;
  uint64_t v19 = &unk_1E58452C0;
  id v20 = v8;
  id v9 = v8;
  [v6 enumerateObjectsUsingBlock:&v16];
  id v10 = [v6 firstObject];

  signed __int16 v11 = [v10 photoLibrary];
  id v12 = [v11 librarySpecificFetchOptions];

  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v9, v16, v17, v18, v19];
  [v12 setInternalPredicate:v13];

  id v14 = +[PHAsset fetchAssetsInLibraryScope:v7 options:v12];

  return v14;
}

void __48__PHAsset_fetchAssetsInLibraryScope_fromAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectID];
  [v2 addObject:v3];
}

+ (id)fetchAssetsInLibraryScope:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __45__PHAsset_fetchAssetsInLibraryScope_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

id __45__PHAsset_fetchAssetsInLibraryScope_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAssetsInLibraryScope:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchAssetsCapturedOrEdited:(BOOL)a3 onThisCameraSinceDate:(id)a4 options:(id)a5
{
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __69__PHAsset_fetchAssetsCapturedOrEdited_onThisCameraSinceDate_options___block_invoke;
  v11[3] = &unk_1E5845298;
  BOOL v13 = a3;
  id v12 = v7;
  id v8 = v7;
  id v9 = +[PHObject authorizationAwareFetchResultWithOptions:a5 fetchBlock:v11];

  return v9;
}

id __69__PHAsset_fetchAssetsCapturedOrEdited_onThisCameraSinceDate_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    +[PHQuery queryForAssetsEditedOnThisCameraSinceDate:v2 options:a2];
  }
  else {
  id v3 = +[PHQuery queryForAssetsCapturedOnThisCameraSinceDate:v2 options:a2];
  }
  id v4 = [v3 executeQuery];

  return v4;
}

+ (id)fetchAssetsFromCameraSinceDate:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-300.0];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __50__PHAsset_fetchAssetsFromCameraSinceDate_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

id __50__PHAsset_fetchAssetsFromCameraSinceDate_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAssetsFromCameraSinceDate:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchAllAssetsInYearRepresentedByYearHighlight:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __66__PHAsset_fetchAllAssetsInYearRepresentedByYearHighlight_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

id __66__PHAsset_fetchAllAssetsInYearRepresentedByYearHighlight_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[PHQuery queryForAllAssetsInYearRepresentedByYearHighlight:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  uint64_t v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchReferencedAssetsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_863];
}

id __44__PHAsset_fetchReferencedAssetsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForReferencedAssetsWithOptions:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetsForKeywords:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__PHAsset_fetchAssetsForKeywords_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __42__PHAsset_fetchAssetsForKeywords_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAssetsForKeywords:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetsInAssetCollections:(id)a3 options:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = v8;
  if (v8 && [v8 count] == 1)
  {
    id v10 = [v9 firstObject];
    signed __int16 v11 = +[PHAsset fetchAssetsInAssetCollection:v10 options:v6];

    goto LABEL_22;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v5;
  signed __int16 v11 = (void *)[v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v24 = v9;
    id v25 = v5;
    id v14 = 0;
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = v14;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v16);
        uint64_t v19 = +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v18, v6, v24);
        id v20 = [v19 fetchedObjectIDs];
        [v12 addObjectsFromArray:v20];

        id v14 = [v18 photoLibrary];

        uint64_t v16 = (char *)v16 + 1;
        uint64_t v17 = v14;
      }
      while (v11 != v16);
      signed __int16 v11 = (void *)[v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);

    if (!v14)
    {
      signed __int16 v11 = 0;
      id v9 = v24;
      id v5 = v25;
      goto LABEL_21;
    }
    uint64_t v21 = [v6 photoLibrary];

    id v9 = v24;
    if (v21 != v14)
    {
      uint64_t v22 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v14];

      id v6 = (id)v22;
    }
    id v5 = v25;
    signed __int16 v11 = +[PHAsset fetchAssetsWithObjectIDs:v12 options:v6];
  }
  else
  {
    id v14 = v13;
  }

LABEL_21:
LABEL_22:

  return v11;
}

+ (id)fetchVisibleAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PHAsset_fetchVisibleAssetsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __51__PHAsset_fetchVisibleAssetsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForVisibleAssetsWithObjectIDs:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchKeyAssetForExtendedSceneIdentifier:(unint64_t)a3 aboveConfidenceThreshold:(double)a4 minimumSceneAnalysisVersion:(signed __int16)a5 options:(id)a6
{
  int v6 = a5;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = [v11 photoLibrary];
  id v13 = [v12 photoLibrary];

  if (!v13)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PHAsset.m", 3807, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  id v14 = [v13 managedObjectContext];
  uint64_t v15 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v16 = [MEMORY[0x1E4F8AB80] entityName];
  uint64_t v17 = [v15 fetchRequestWithEntityName:v16];

  int v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v41[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  [v17 setSortDescriptors:v19];

  [v17 setFetchLimit:1];
  id v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"sceneIdentifier == %lld && confidence > %f && assetAttributes.asset.additionalAttributes.sceneAnalysisVersion >= %i && assetAttributes.asset.hidden == NO && assetAttributes.asset.trashedState == %d", a3, *(void *)&a4, v6, 0);
  [v17 setPredicate:v20];

  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__21007;
  long long v39 = __Block_byref_object_dispose__21008;
  id v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  void v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__21007;
  void v33[4] = __Block_byref_object_dispose__21008;
  id v34 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  void v28[2] = __112__PHAsset_fetchKeyAssetForExtendedSceneIdentifier_aboveConfidenceThreshold_minimumSceneAnalysisVersion_options___block_invoke;
  v28[3] = &unk_1E5847CB0;
  id v21 = v14;
  id v29 = v21;
  id v22 = v17;
  id v30 = v22;
  uint64_t v31 = v33;
  long long v32 = &v35;
  [v21 performBlockAndWait:v28];
  objc_super v23 = (void *)v36[5];
  uint64_t v24 = [v11 photoLibrary];
  id v25 = objc_msgSend(v23, "pl_PHAssetFromPhotoLibrary:", v24);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v25;
}

void __112__PHAsset_fetchKeyAssetForExtendedSceneIdentifier_aboveConfidenceThreshold_minimumSceneAnalysisVersion_options___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  int v6 = [v5 firstObject];
  id v7 = [v6 assetAttributes];

  uint64_t v8 = [v7 asset];
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)fetchKeyAssetForSceneIdentifier:(unsigned int)a3 aboveConfidenceThreshold:(double)a4 minimumSceneAnalysisVersion:(signed __int16)a5 options:(id)a6
{
  return (id)[a1 fetchKeyAssetForExtendedSceneIdentifier:a3 aboveConfidenceThreshold:a5 minimumSceneAnalysisVersion:a6 options:a4];
}

+ (id)fetchAssetsForComment:(id)a3 options:(id)a4
{
  uint64_t v4 = +[PHQuery queryForAssetsForComment:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchAssetsForFaceGroups:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PHAsset_fetchAssetsForFaceGroups_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __44__PHAsset_fetchAssetsForFaceGroups_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAssetsForFaceGroups:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchKeyAssetForSocialGroup:(id)a3 createIfNeeded:(BOOL)a4 options:(id)a5
{
  id v5 = +[PHGraphQuery graphQueryForKeyAssetForSocialGroup:a3 createIfNeeded:a4 options:a5];
  id v6 = [v5 executeQuery];

  return v6;
}

+ (id)fetchKeyAssetForSocialGroup:(id)a3 options:(id)a4
{
  return (id)[a1 fetchKeyAssetForSocialGroup:a3 createIfNeeded:0 options:a4];
}

+ (id)fetchInclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  uint64_t v4 = +[PHGraphQuery graphQueryForInclusiveAssetsForSocialGroup:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchExclusiveSocialGroupAssetsForPersons:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ((unint64_t)[v9 count] <= 1)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PHAsset.m", 3726, @"Invalid parameter not satisfying: %@", @"personUUIDs.count > 1" object file lineNumber description];
  }
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__21007;
  uint64_t v35 = __Block_byref_object_dispose__21008;
  id v36 = 0;
  id v11 = [v10 photoLibrary];
  id v12 = [v11 photoLibraryForCurrentQueueQoS];

  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__21007;
  id v29 = __Block_byref_object_dispose__21008;
  id v30 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __67__PHAsset_fetchExclusiveSocialGroupAssetsForPersons_options_error___block_invoke;
  v20[3] = &unk_1E5847CB0;
  id v13 = v9;
  id v21 = v13;
  id v14 = v12;
  id v22 = v14;
  objc_super v23 = &v25;
  uint64_t v24 = &v31;
  [v14 performBlockAndWait:v20];
  uint64_t v15 = (void *)v32[5];
  if (v15)
  {
    uint64_t v16 = [v15 allObjects];
    uint64_t v17 = +[PHAsset fetchVisibleAssetsWithObjectIDs:v16 options:v10];
  }
  else
  {
    uint64_t v17 = 0;
    if (a5) {
      *a5 = (id) v26[5];
    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __67__PHAsset_fetchExclusiveSocialGroupAssetsForPersons_options_error___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = [MEMORY[0x1E4F8AA10] entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"personUUID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [*(id *)(a1 + 40) managedObjectContext];
  id v33 = 0;
  uint64_t v8 = [v7 executeFetchRequest:v4 error:&v33];
  id v9 = v33;
  id v10 = [v6 setWithArray:v8];

  if (v10)
  {
    unint64_t v11 = [v10 count];
    if (v11 >= [*(id *)(a1 + 32) count])
    {
      id v23 = objc_alloc(MEMORY[0x1E4F8AC00]);
      uint64_t v24 = [*(id *)(a1 + 40) managedObjectContext];
      id v12 = (void *)[v23 initWithPersons:v10 inContext:v24];

      id v32 = 0;
      uint64_t v25 = [v12 runAssetContainment:&v32];
      id v26 = v32;
      uint64_t v27 = [v25 exclusiveAssetIDs];
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
      id v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;

      uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v26;
    }
    else
    {
      id v12 = (void *)[*(id *)(a1 + 32) mutableCopy];
      id v13 = [v10 valueForKey:@"personUUID"];
      [v12 minusSet:v13];

      id v14 = [NSString stringWithFormat:@"fetchAssetsPassingExclusiveContainmentForPersons: persons with these UUIDs not found: %@", v12];
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F8C500];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35[0] = v14;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:3072 userInfo:v17];
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
  else
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    id v22 = v9;
    id v12 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v22;
  }
}

+ (id)fetchExclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  uint64_t v4 = +[PHGraphQuery graphQueryForExclusiveAssetsForSocialGroup:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchAssetsForPersons:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__PHAsset_fetchAssetsForPersons_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __41__PHAsset_fetchAssetsForPersons_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAssetsForPersons:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetsForPerson:(id)a3 options:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = objc_msgSend(a1, "fetchAssetsForPersons:options:", v9, v7, v12, v13);

  return v10;
}

+ (id)fetchAssetsForPerson:(id)a3 faceCount:(unint64_t)a4 options:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = a5;
  unint64_t v11 = objc_msgSend(v9, "predicateWithFormat:", @"%K.@count == %lu", @"detectedFaces", a4);
  id v12 = [v8 photoLibrary];
  uint64_t v13 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v12];

  uint64_t v14 = [v13 internalPredicate];
  uint64_t v15 = (void *)v14;
  if (v14)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28BA0];
    v21[0] = v14;
    v21[1] = v11;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    uint64_t v18 = [v16 andPredicateWithSubpredicates:v17];
    [v13 setInternalPredicate:v18];
  }
  else
  {
    [v13 setInternalPredicate:v11];
  }
  uint64_t v19 = [a1 fetchAssetsForPerson:v8 options:v13];

  return v19;
}

+ (id)fetchGuestAssetsInCollectionContainingAsset:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PHAsset_fetchGuestAssetsInCollectionContainingAsset_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __63__PHAsset_fetchGuestAssetsInCollectionContainingAsset_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForGuestAssetsInCollectionContainingAsset:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchGuestAssetsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_836];
}

id __39__PHAsset_fetchGuestAssetsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForGuestAssetsWithOptions:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchAssetsWithBurstIdentifier:(NSString *)burstIdentifier options:(PHFetchOptions *)options
{
  id v5 = burstIdentifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PHAsset_fetchAssetsWithBurstIdentifier_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v9];

  return (PHFetchResult *)v7;
}

id __50__PHAsset_fetchAssetsWithBurstIdentifier_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAssetsWithBurstIdentifier:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchAssetsWithALAssetURLs:(NSArray *)assetURLs options:(PHFetchOptions *)options
{
  id v5 = assetURLs;
  id v6 = options;
  if (![(NSArray *)v5 count]) {
    goto LABEL_3;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PHAsset_fetchAssetsWithALAssetURLs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v9];

  if (!v7) {
LABEL_3:
  }
    id v7 = objc_alloc_init(PHFetchResult);

  return v7;
}

id __46__PHAsset_fetchAssetsWithALAssetURLs_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(MEMORY[0x1E4F8A950], "uuidFromAssetURL:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    unint64_t v11 = +[PHAsset fetchAssetsWithLocalIdentifiers:v4 options:v3];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (id)fetchAssetsWithCloudIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PHAsset_fetchAssetsWithCloudIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __51__PHAsset_fetchAssetsWithCloudIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAssetsWithCloudIdentifiers:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchAssetsWithMediaType:(PHAssetMediaType)mediaType options:(PHFetchOptions *)options
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PHAsset_fetchAssetsWithMediaType_options___block_invoke;
  v6[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6[4] = mediaType;
  uint64_t v4 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v6];

  return (PHFetchResult *)v4;
}

id __44__PHAsset_fetchAssetsWithMediaType_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAssetsWithMediaType:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetsWithoutOriginalsInAssetCollection:(id)a3 options:(id)a4
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v6];
  }
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"master != nil && (SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == NO).@count != 0)", 1];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 internalPredicate];
  id v10 = (void *)v9;
  unint64_t v11 = v8;
  if (v9)
  {
    id v12 = (void *)MEMORY[0x1E4F28BA0];
    v16[0] = v9;
    v16[1] = v8;
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    unint64_t v11 = [v12 andPredicateWithSubpredicates:v13];
  }
  [v7 setInternalPredicate:v11];
  long long v14 = [a1 fetchAssetsInAssetCollection:v6 options:v7];

  return v14;
}

+ (id)fetchAssetsInImportSessions:(id)a3 options:(id)a4
{
  uint64_t v4 = +[PHQuery queryForAssetsInImportSessions:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchAssetsInBoundingBoxWithTopLeftLocation:(id)a3 bottomRightLocation:(id)a4 options:(id)a5
{
  id v5 = +[PHQuery queryForAssetsInBoundingBoxWithTopLeftLocation:a3 bottomRightLocation:a4 options:a5];
  id v6 = [v5 executeQuery];

  return v6;
}

+ (id)fetchAssetsContainingAllPersons:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 firstObject];
    id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v7];

    uint64_t v9 = [v8 managedObjectContext];
    id v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke;
    v14[3] = &unk_1E58481C0;
    id v15 = v5;
    id v16 = v9;
    id v11 = v9;
    id v12 = +[PHObject authorizationAwareFetchResultWithOptions:v10 fetchBlock:v14];
  }
  else
  {
    id v12 = objc_alloc_init(PHFetchResult);
  }

  return v12;
}

PHFetchResult *__51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) objectID];
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__21007;
  uint64_t v24 = __Block_byref_object_dispose__21008;
  id v25 = 0;
  id v10 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke_2;
  void v16[3] = &unk_1E5848318;
  uint64_t v19 = &v20;
  id v11 = v4;
  id v17 = v11;
  id v18 = *(id *)(a1 + 40);
  [v10 performBlockAndWait:v16];
  uint64_t v12 = v21[5];
  if (v12)
  {
    long long v13 = +[PHAsset fetchVisibleAssetsWithObjectIDs:v12 options:v3];
  }
  else
  {
    long long v13 = objc_alloc_init(PHFetchResult);
  }
  long long v14 = v13;

  _Block_object_dispose(&v20, 8);

  return v14;
}

void __51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke_2(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F8A7B0] assetIDsWithAllPersonsFromPersonIDs:a1[4] inContext:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)fetchAssetsGroupedByFaceUUIDForFaces:(id)a3 fetchPropertySets:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__21007;
  uint64_t v34 = __Block_byref_object_dispose__21008;
  id v35 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = 0;
  id v10 = 0;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v15 = [v14 uuid];
        [v7 addObject:v15];

        if (!v9)
        {
          id v16 = [v14 photoLibrary];

          uint64_t v9 = [v16 photoLibrary];
          id v10 = v16;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v11);
  }

  id v17 = (void *)MEMORY[0x1E4F8A950];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke;
  v22[3] = &unk_1E5846920;
  id v18 = v10;
  id v23 = v18;
  id v19 = v6;
  id v24 = v19;
  id v25 = &v30;
  if (MEMORY[0x19F38A090]([v17 batchFetchAssetsByFaceUUIDWithFaceUUIDs:v7 library:v9 completion:v22])) {
    plslogGreenTeaReadingPhotosOrVideos();
  }
  id v20 = (id)v31[5];

  _Block_object_dispose(&v30, 8);

  return v20;
}

void __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke_2;
  v10[3] = &unk_1E5845270;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v8 = [(PHObjectPLAdapter *)[PHAssetPLAdapter alloc] initWithPLManagedObject:v5 photoLibrary:*(void *)(a1 + 32)];

  id v7 = [(PHAssetPLAdapter *)v8 newObjectWithPropertySets:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v6];
}

+ (id)fetchAssetsGroupedByFaceUUIDForFaces:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"PHAssetPropertySetCore";
  v9[1] = @"PHAssetPropertySetOriginalMetadata";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:2];
  id v7 = [a1 fetchAssetsGroupedByFaceUUIDForFaces:v5 fetchPropertySets:v6];

  return v7;
}

+ (int64_t)countOfAssetsWithLocationFromUUIDs:(id)a3 photoLibrary:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  id v6 = [a4 librarySpecificFetchOptions];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"locationData != nil && uuid in %@", v5];

  [v6 setInternalPredicate:v7];
  [v6 setInternalSortDescriptors:MEMORY[0x1E4F1CBF0]];
  [v6 setShouldPrefetchCount:1];
  [v6 setWantsIncrementalChangeDetails:0];
  uint64_t v8 = +[PHAsset fetchAssetsWithOptions:v6];
  int64_t v9 = [v8 count];

  return v9;
}

+ (id)quickClassificationFaceAdjustmentVersion
{
  return (id)[MEMORY[0x1E4F1C9C8] distantPast];
}

+ (void)_batchFetchAdditionalPropertySetsIfNeeded:(id)a3 forAssets:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() _unfetchedPropertySetsForAssets:v6 fromPropertySets:v5];
  if ([v7 count])
  {
    id v30 = v5;
    uint64_t v8 = [(id)objc_opt_class() _extendedPropertyFetchHintsForPropertySets:v5];
    uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
    int64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v29 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    long long v28 = v7;
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v38;
      id v15 = v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v10);
          }
          id v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (!v13)
          {
            id v13 = [*(id *)(*((void *)&v37 + 1) + 8 * i) photoLibrary];
          }
          id v18 = [v17 objectID];
          [v31 addObject:v18];

          id v19 = [v17 uuid];
          [v9 setObject:v17 forKeyedSubscript:v19];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v12);
    }
    else
    {
      id v13 = 0;
      id v15 = v31;
    }

    long long v27 = [v13 fetchDictionariesByPHClassForOIDs:v15 propertyHint:v8 includeTrash:1 overrideWithPHClass:0];
    [v27 objectForKey:objc_opt_class()];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(obj);
          }
          id v24 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          id v25 = [v24 objectForKeyedSubscript:@"uuid"];
          long long v26 = [v9 objectForKeyedSubscript:v25];
          [v26 _createExtendedPropertySetsIfNeededWithPropertyHint:v8 fetchDictionary:v24];
          [v26 addFetchPropertyHint:v8];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);
    }

    id v6 = v29;
    id v5 = v30;
    id v7 = v28;
  }
}

+ (id)_unfetchedPropertySetsForAssets:(id)a3 fromPropertySets:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_unfetchedPropertySetsFromPropertySets:", v6, (void)v15);
        [v7 unionSet:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)propertySetAccessorsByPropertySet
{
  pl_dispatch_once();
  uint64_t v2 = (void *)propertySetAccessorsByPropertySet_pl_once_object_21;

  return v2;
}

void __44__PHAsset_propertySetAccessorsByPropertySet__block_invoke()
{
  v4[32] = *MEMORY[0x1E4F143B8];
  v3[0] = @"PHAssetPropertySetIdentifier";
  v3[1] = @"PHAssetPropertySetCore";
  v4[0] = @"self";
  v4[1] = @"self";
  v3[2] = @"PHAssetPropertySetPlacesCore";
  v3[3] = @"PHAssetPropertySetOriginalMetadata";
  v4[2] = @"self";
  v4[3] = @"originalMetadataProperties";
  void v3[4] = @"PHAssetPropertySetPhotosOneUp";
  v3[5] = @"PHAssetPropertySetLocalDate";
  v4[4] = @"photosOneUpProperties";
  v4[5] = @"localDateProperties";
  v3[6] = @"PHAssetPropertySetPhotosInfoPanelExtended";
  v3[7] = @"PHAssetPropertySetPhotosSmartStyleExtended";
  v4[6] = @"photosInfoPanelExtendedProperties";
  v4[7] = @"photosSmartStyleExtendedProperties";
  v3[8] = @"PHAssetPropertySetPhotoIris";
  v3[9] = @"PHAssetPropertySetDescription";
  v4[8] = @"photoIrisProperties";
  v4[9] = @"descriptionProperties";
  v3[10] = @"PHAssetPropertySetCloudShared";
  v3[11] = @"PHAssetPropertySetComments";
  v4[10] = @"cloudSharedProperties";
  v4[11] = @"commentProperties";
  v3[12] = @"PHAssetPropertySetSceneAnalysis";
  v3[13] = @"PHAssetPropertySetAnalysisState";
  v4[12] = @"sceneAnalysisProperties";
  v4[13] = @"assetAnalysisStateProperties";
  v3[14] = @"PHAssetPropertySetUserActivity";
  v3[15] = @"PHAssetPropertySetFaceWorker";
  v4[14] = @"assetUserActivityProperties";
  v4[15] = @"self";
  v3[16] = @"PHAssetPropertySetImageManager";
  v3[17] = @"PHAssetPropertySetCuration";
  v4[16] = @"self";
  v4[17] = @"curationProperties";
  v3[18] = @"PHAssetPropertySetAesthetic";
  v3[19] = @"PHAssetPropertySetMediaAnalysis";
  v4[18] = @"aestheticProperties";
  v4[19] = @"mediaAnalysisProperties";
  v3[20] = @"PHAssetPropertySetCharacterRecognition";
  v3[21] = @"PHAssetPropertySetVisualSearch";
  v4[20] = @"characterRecognitionProperties";
  v4[21] = @"visualSearchProperties";
  v3[22] = @"PHAssetPropertySetImport";
  v3[23] = @"PHAssetPropertySetSceneprint";
  v4[22] = @"importProperties";
  v4[23] = @"sceneprintProperties";
  v3[24] = @"PHAssetPropertySetDestinationAssetCopy";
  v3[25] = @"PHAssetPropertySetKeywords";
  v4[24] = @"destinationAssetCopyProperties";
  v4[25] = @"keywordProperties";
  v3[26] = @"PHAssetPropertySetGridMetadata";
  v3[27] = @"PHAssetPropertySetCoarseLocation";
  v4[26] = @"gridMetadataProperties";
  v4[27] = @"coarseLocationProperties";
  v3[28] = @"PHAssetPropertySetLibraryScope";
  v3[29] = @"PHAssetPropertySetCloudLocalState";
  v4[28] = @"libraryScopeProperties";
  v4[29] = @"cloudLocalStateProperties";
  v3[30] = @"PHAssetPropertySetStoryPlayback";
  v3[31] = @"PHAssetPropertySetIconicScore";
  v4[30] = @"StoryPlaybackProperties";
  v4[31] = @"iconicScoreProperties";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:32];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)propertySetAccessorsByPropertySet_pl_once_object_21;
  propertySetAccessorsByPropertySet_pl_once_object_21 = v1;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  id v3 = a3;
  pl_dispatch_once();
  id v4 = [(id)propertySetClassForPropertySet__pl_once_object_20 objectForKey:v3];

  return (Class)v4;
}

void __42__PHAsset_propertySetClassForPropertySet___block_invoke()
{
  v4[38] = *MEMORY[0x1E4F143B8];
  v3[0] = @"PHAssetPropertySetIdentifier";
  v4[0] = objc_opt_class();
  v3[1] = @"PHAssetPropertySetCore";
  v4[1] = objc_opt_class();
  v3[2] = @"PHAssetPropertySetPlacesCore";
  v4[2] = objc_opt_class();
  v3[3] = @"PHAssetPropertySetOriginalMetadata";
  v4[3] = objc_opt_class();
  void v3[4] = @"PHAssetPropertySetPhotosOneUp";
  v4[4] = objc_opt_class();
  v3[5] = @"PHAssetPropertySetLocalDate";
  v4[5] = objc_opt_class();
  v3[6] = @"PHAssetPropertySetPhotosInfoPanelExtended";
  v4[6] = objc_opt_class();
  v3[7] = @"PHAssetPropertySetPhotosSmartStyleExtended";
  v4[7] = objc_opt_class();
  v3[8] = @"PHAssetPropertySetPhotosInfoPanelLocation";
  v4[8] = objc_opt_class();
  v3[9] = @"PHAssetPropertySetPhotoIris";
  v4[9] = objc_opt_class();
  v3[10] = @"PHAssetPropertySetDescription";
  v4[10] = objc_opt_class();
  v3[11] = @"PHAssetPropertySetCloudShared";
  v4[11] = objc_opt_class();
  v3[12] = @"PHAssetPropertySetComments";
  v4[12] = objc_opt_class();
  v3[13] = @"PHAssetPropertySetSceneAnalysis";
  v4[13] = objc_opt_class();
  v3[14] = @"PHAssetPropertySetAnalysisState";
  v4[14] = objc_opt_class();
  v3[15] = @"PHAssetPropertySetUserActivity";
  v4[15] = objc_opt_class();
  v3[16] = @"PHAssetPropertySetFaceWorker";
  v4[16] = objc_opt_class();
  v3[17] = @"PHAssetPropertySetImageManager";
  v4[17] = objc_opt_class();
  v3[18] = @"PHAssetPropertySetCuration";
  v4[18] = objc_opt_class();
  v3[19] = @"PHAssetPropertySetAesthetic";
  v4[19] = objc_opt_class();
  v3[20] = @"PHAssetPropertySetMediaAnalysis";
  v4[20] = objc_opt_class();
  v3[21] = @"PHAssetPropertySetPhotoAnalysisWallpaperProperties";
  v4[21] = objc_opt_class();
  v3[22] = @"PHAssetPropertySetCharacterRecognition";
  v4[22] = objc_opt_class();
  v3[23] = @"PHAssetPropertySetVisualSearch";
  v4[23] = objc_opt_class();
  v3[24] = @"PHAssetPropertySetImport";
  v4[24] = objc_opt_class();
  v3[25] = @"PHAssetPropertySetSceneprint";
  v4[25] = objc_opt_class();
  v3[26] = @"PHAssetPropertySetDestinationAssetCopy";
  v4[26] = objc_opt_class();
  v3[27] = @"PHAssetPropertySetKeywords";
  v4[27] = objc_opt_class();
  v3[28] = @"PHAssetPropertySetGridMetadata";
  v4[28] = objc_opt_class();
  v3[29] = @"PHAssetPropertySetCoarseLocation";
  v4[29] = objc_opt_class();
  v3[30] = @"PHAssetPropertySetLibraryScope";
  v4[30] = objc_opt_class();
  v3[31] = @"PHAssetPropertySetCameraCaptureDevice";
  v4[31] = objc_opt_class();
  void v3[32] = @"PHAssetPropertySetCloudLocalState";
  v4[32] = objc_opt_class();
  v3[33] = @"PHAssetPropertySetMontage";
  void v4[33] = objc_opt_class();
  v3[34] = @"PHAssetPropertySetLocationData";
  v4[34] = objc_opt_class();
  v3[35] = @"PHAssetPropertySetPTP";
  v4[35] = objc_opt_class();
  v3[36] = @"PHAssetPropertySetIconicScore";
  v4[36] = objc_opt_class();
  v3[37] = @"PHAssetPropertySetStoryPlayback";
  v4[37] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:38];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)propertySetClassForPropertySet__pl_once_object_20;
  propertySetClassForPropertySet__pl_once_object_20 = v1;
}

+ (id)_transformMediaSubtypeReferences:(id)a3 inComparisonPredicate:(id)a4 options:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v52 = a4;
  id v49 = a5;
  if (_transformMediaSubtypeReferences_inComparisonPredicate_options__onceToken != -1) {
    dispatch_once(&_transformMediaSubtypeReferences_inComparisonPredicate_options__onceToken, &__block_literal_global_518);
  }
  uint64_t v57 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v7;
  unint64_t v8 = 0x1E4F28000;
  uint64_t v53 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v53)
  {
    uint64_t v51 = *(void *)v63;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v63 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = v9;
        uint64_t v10 = [(id)_transformMediaSubtypeReferences_inComparisonPredicate_options___allSubtypesByMediaSubtypeKey objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * v9)];
        uint64_t v11 = [v10 filteredArrayUsingPredicate:v52];

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v69 count:16];
        unint64_t v8 = 0x1E4F28000uLL;
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v59;
          id v55 = v12;
          uint64_t v56 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v59 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              long long v18 = [v17 objectForKeyedSubscript:@"mediaSubtypes"];
              if (!v18)
              {
                long long v18 = [v17 objectForKeyedSubscript:@"mediaSubtype"];
              }
              uint64_t v19 = [v18 integerValue];
              if (v19 >= 0x20000)
              {
                if (v19 < 0x200000)
                {
                  if (v19 < 0x80000)
                  {
                    if (v19 != 0x20000)
                    {
                      if (v19 != 0x40000) {
                        goto LABEL_60;
                      }
                      uint64_t v20 = *(void **)(v8 + 3936);
                      uint64_t v21 = 102;
                      goto LABEL_51;
                    }
                    objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"%K = %d OR %K = %d", @"highFrameRateState", 2, @"highFrameRateState", 3);
                    uint64_t v25 = LABEL_56:;
LABEL_57:
                    long long v26 = (void *)v25;
                    long long v33 = v57;
LABEL_58:
                    [v33 addObject:v26];
                    goto LABEL_59;
                  }
                  if (v19 == 0x80000)
                  {
                    uint64_t v20 = *(void **)(v8 + 3936);
                    uint64_t v21 = 103;
                    goto LABEL_51;
                  }
                  if (v19 != 0x100000) {
                    goto LABEL_60;
                  }
                  uint64_t v22 = *(void **)(v8 + 3936);
                  uint64_t v23 = 5;
LABEL_53:
                  uint64_t v46 = v23;
                  id v42 = @"hdrType";
                  goto LABEL_54;
                }
                if (v19 >= 0x800000)
                {
                  if (v19 == 0x800000)
                  {
                    uint64_t v22 = *(void **)(v8 + 3936);
                    uint64_t v23 = 11;
                    goto LABEL_53;
                  }
                  if (v19 != 0x1000000) {
                    goto LABEL_60;
                  }
                  uint64_t v22 = *(void **)(v8 + 3936);
                  id v24 = @"currentSleetCast > 0";
                }
                else
                {
                  if (v19 != 0x200000)
                  {
                    if (v19 != 0x400000) {
                      goto LABEL_60;
                    }
                    uint64_t v20 = *(void **)(v8 + 3936);
                    uint64_t v21 = 104;
LABEL_51:
                    objc_msgSend(v20, "predicateWithFormat:", @"kindSubtype = %d", v21, v46, v47, v48);
                    goto LABEL_56;
                  }
                  uint64_t v22 = *(void **)(v8 + 3936);
                  uint64_t v46 = 2;
                  id v42 = @"depthType";
LABEL_54:
                  long long v45 = v42;
                  id v24 = @"%K = %d";
                }
                objc_msgSend(v22, "predicateWithFormat:", v24, v45, v46, v47, v48);
                goto LABEL_56;
              }
              if (v19 <= 63)
              {
                switch(v19)
                {
                  case 1:
                    uint64_t v20 = *(void **)(v8 + 3936);
                    uint64_t v21 = 1;
                    goto LABEL_51;
                  case 2:
                    uint64_t v32 = objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"%K = %d", @"hdrType", 2);
                    [v57 addObject:v32];

                    uint64_t v15 = v56;
                    long long v26 = objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"%K = %d", @"hdrType", 3);
                    long long v33 = v57;
                    id v12 = v55;
                    goto LABEL_58;
                  case 3:
                  case 5:
                  case 6:
                  case 7:
                    goto LABEL_60;
                  case 4:
                    uint64_t v20 = *(void **)(v8 + 3936);
                    uint64_t v21 = 10;
                    goto LABEL_51;
                  case 8:
                    long long v26 = objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"%K = %d", @"kindSubtype", 2);
                    long long v27 = objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"%K != %d", @"videoCpDurationValue", 0);
                    long long v28 = [MEMORY[0x1E4F8A950] videoComplementVisibilityStatePlayablePredicate];
                    id v29 = (void *)MEMORY[0x1E4F28BA0];
                    v68[0] = v26;
                    v68[1] = v27;
                    v68[2] = v28;
                    id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
                    uint64_t v31 = [v29 andPredicateWithSubpredicates:v30];

                    uint64_t v15 = v56;
                    [v57 addObject:v31];

                    goto LABEL_59;
                  default:
                    if (v19 != 16) {
                      goto LABEL_60;
                    }
                    uint64_t v25 = [MEMORY[0x1E4F8A950] predicateForDepthEffectPhotos];
                    break;
                }
                goto LABEL_57;
              }
              if (v19 <= 1023)
              {
                if (v19 == 64)
                {
                  objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"playbackStyle = %d", 2, v46, v47, v48);
                  goto LABEL_56;
                }
                if (v19 != 512) {
                  goto LABEL_60;
                }
                uint64_t v22 = *(void **)(v8 + 3936);
                uint64_t v23 = 10;
                goto LABEL_53;
              }
              if (v19 != 1024)
              {
                if (v19 != 0x10000) {
                  goto LABEL_60;
                }
                uint64_t v20 = *(void **)(v8 + 3936);
                uint64_t v21 = 100;
                goto LABEL_51;
              }
              long long v26 = objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"%K != %d", @"spatialType", 0);
              long long v34 = [MEMORY[0x1E4F8A950] predicateForUnadjustedAssetsWithKeyPathToAsset:0];
              long long v35 = objc_msgSend(*(id *)(v8 + 3936), "predicateWithFormat:", @"(%K & %d) != 0", @"additionalAttributes.unmanagedAdjustment.adjustmentRenderTypes", 4096);
              long long v36 = (void *)MEMORY[0x1E4F28BA0];
              v67[0] = v34;
              v67[1] = v35;
              long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
              long long v38 = [v36 orPredicateWithSubpredicates:v37];

              long long v39 = (void *)MEMORY[0x1E4F28BA0];
              v66[0] = v26;
              v66[1] = v38;
              long long v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
              long long v41 = [v39 andPredicateWithSubpredicates:v40];

              id v12 = v55;
              unint64_t v8 = 0x1E4F28000;
              [v57 addObject:v41];

              uint64_t v15 = v56;
LABEL_59:

LABEL_60:
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v58 objects:v69 count:16];
          }
          while (v14);
        }

        uint64_t v9 = v54 + 1;
      }
      while (v54 + 1 != v53);
      uint64_t v53 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v53);
  }

  if ([v57 count]) {
    [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v57];
  }
  else {
  uint64_t v43 = [*(id *)(v8 + 3936) predicateWithValue:0];
  }

  return v43;
}

void __74__PHAsset__transformMediaSubtypeReferences_inComparisonPredicate_options___block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v1 = [MEMORY[0x1E4F1CA48] array];
  _PHAllAssetMediaSubtypes();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * v5);
        uint64_t v22 = @"mediaSubtypes";
        uint64_t v23 = v6;
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        [v1 addObject:v7];

        uint64_t v20 = @"mediaSubtype";
        uint64_t v21 = v6;
        unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        [v0 addObject:v8];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v3);
  }
  v18[0] = @"mediaSubtype";
  uint64_t v9 = (void *)[v0 copy];
  v18[1] = @"mediaSubtypes";
  v19[0] = v9;
  uint64_t v10 = (void *)[v1 copy];
  v19[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v12 = (void *)_transformMediaSubtypeReferences_inComparisonPredicate_options___allSubtypesByMediaSubtypeKey;
  _transformMediaSubtypeReferences_inComparisonPredicate_options___allSubtypesByMediaSubtypeKedouble y = v11;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PHAsset_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_21504 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_21504, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_21505 containsObject:v7])
  {
    id v8 = v6;
  }
  else if ([v6 expressionType])
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [v6 constantValue];
    if (v9 && [v7 isEqualToString:@"mediaType"])
    {
      uint64_t v10 = PHQueryTransformExpressionConstantValue(v9, &__block_literal_global_482);
      id v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v10];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

void __47__PHAsset_transformValueExpression_forKeyPath___block_invoke()
{
  v4[15] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"creationDate";
  v4[1] = @"modificationDate";
  v4[2] = @"pixelWidth";
  v4[3] = @"pixelHeight";
  v4[4] = @"duration";
  v4[5] = @"favorite";
  v4[6] = @"isFavorite";
  v4[7] = @"hidden";
  v4[8] = @"isHidden";
  v4[9] = @"burstIdentifier";
  v4[10] = @"playbackStyle";
  v4[11] = @"playbackVariation";
  v4[12] = @"hdrGain";
  v4[13] = @"analysisStateModificationDate";
  v4[14] = @"curationProperties.importedByBundleIdentifier";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:15];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_21505;
  transformValueExpression_forKeyPath___passThroughSet_21505 = v2;
}

id __47__PHAsset_transformValueExpression_forKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v3 = [v2 integerValue];
    unint64_t v4 = 0x2000100000003uLL >> (16 * v3);
    if (v3 >= 4) {
      LOBYTE(v4) = 3;
    }
    uint64_t v5 = [NSNumber numberWithShort:v4 & 3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)imageManagerPropertiesToFetch
{
  pl_dispatch_once();
  id v2 = (void *)imageManagerPropertiesToFetch_pl_once_object_17;

  return v2;
}

void __40__PHAsset_imageManagerPropertiesToFetch__block_invoke()
{
  v3[18] = *MEMORY[0x1E4F143B8];
  v3[0] = @"savedAssetType";
  v3[1] = @"bundleScope";
  v3[2] = @"cloudPlaceholderKind";
  v3[3] = @"avalanchePickType";
  void v3[4] = @"avalancheKind";
  v3[5] = @"filename";
  v3[6] = @"adjustmentsState";
  v3[7] = @"width";
  v3[8] = @"height";
  v3[9] = @"uniformTypeIdentifier";
  v3[10] = @"thumbnailIndex";
  v3[11] = @"kind";
  v3[12] = @"kindSubtype";
  v3[13] = @"directory";
  v3[14] = @"complete";
  v3[15] = @"dateCreated";
  v3[16] = @"originalColorSpace";
  v3[17] = @"imageRequestHints";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:18];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)imageManagerPropertiesToFetch_pl_once_object_17;
  imageManagerPropertiesToFetch_pl_once_object_17 = v1;
}

+ (id)faceWorkerPropertiesToFetch
{
  pl_dispatch_once();
  id v2 = (void *)faceWorkerPropertiesToFetch_pl_once_object_16;

  return v2;
}

void __38__PHAsset_faceWorkerPropertiesToFetch__block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v3[0] = @"width";
  v3[1] = @"height";
  v3[2] = @"adjustmentTimestamp";
  v3[3] = @"dateCreated";
  void v3[4] = @"faceAdjustmentVersion";
  v3[5] = @"additionalAttributes.faceAnalysisVersion";
  v3[6] = @"kind";
  v3[7] = @"uniformTypeIdentifier";
  v3[8] = @"filename";
  v3[9] = @"directory";
  v3[10] = @"adjustmentsState";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:11];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)faceWorkerPropertiesToFetch_pl_once_object_16;
  faceWorkerPropertiesToFetch_pl_once_object_16 = v1;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  unint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [@"PHAssetPropertySetIdentifier" length];
  if ((a3 & 1) != 0 && v5) {
    [v4 addObject:@"PHAssetPropertySetIdentifier"];
  }
  uint64_t v6 = [@"PHAssetPropertySetCore" length];
  if ((a3 & 2) != 0 && v6) {
    [v4 addObject:@"PHAssetPropertySetCore"];
  }
  uint64_t v7 = [@"PHAssetPropertySetLocalDate" length];
  if ((a3 & 0x200000) != 0 && v7) {
    [v4 addObject:@"PHAssetPropertySetLocalDate"];
  }
  uint64_t v8 = [@"PHAssetPropertySetPlacesCore" length];
  if ((a3 & 4) != 0 && v8) {
    [v4 addObject:@"PHAssetPropertySetPlacesCore"];
  }
  uint64_t v9 = [@"PHAssetPropertySetOriginalMetadata" length];
  if ((a3 & 8) != 0 && v9) {
    [v4 addObject:@"PHAssetPropertySetOriginalMetadata"];
  }
  uint64_t v10 = [@"PHAssetPropertySetPhotosOneUp" length];
  if ((a3 & 0x10) != 0 && v10) {
    [v4 addObject:@"PHAssetPropertySetPhotosOneUp"];
  }
  uint64_t v11 = [@"PHAssetPropertySetPhotosInfoPanelExtended" length];
  if ((a3 & 0x100000) != 0 && v11) {
    [v4 addObject:@"PHAssetPropertySetPhotosInfoPanelExtended"];
  }
  uint64_t v12 = [@"PHAssetPropertySetPhotosSmartStyleExtended" length];
  if ((a3 & 0x8000000000) != 0 && v12) {
    [v4 addObject:@"PHAssetPropertySetPhotosSmartStyleExtended"];
  }
  uint64_t v13 = [@"PHAssetPropertySetPhotosInfoPanelLocation" length];
  if ((a3 & 0x1000000) != 0 && v13) {
    [v4 addObject:@"PHAssetPropertySetPhotosInfoPanelLocation"];
  }
  uint64_t v14 = [@"PHAssetPropertySetPhotoIris" length];
  if ((a3 & 0x20) != 0 && v14) {
    [v4 addObject:@"PHAssetPropertySetPhotoIris"];
  }
  uint64_t v15 = [@"PHAssetPropertySetDescription" length];
  if ((a3 & 0x40) != 0 && v15) {
    [v4 addObject:@"PHAssetPropertySetDescription"];
  }
  uint64_t v16 = [@"PHAssetPropertySetCloudShared" length];
  if ((a3 & 0x10000000000) != 0 && v16) {
    [v4 addObject:@"PHAssetPropertySetCloudShared"];
  }
  uint64_t v17 = [@"PHAssetPropertySetComments" length];
  if ((a3 & 0x80) != 0 && v17) {
    [v4 addObject:@"PHAssetPropertySetComments"];
  }
  uint64_t v18 = [@"PHAssetPropertySetSceneAnalysis" length];
  if ((a3 & 0x100) != 0 && v18) {
    [v4 addObject:@"PHAssetPropertySetSceneAnalysis"];
  }
  uint64_t v19 = [@"PHAssetPropertySetAnalysisState" length];
  if ((a3 & 0x200) != 0 && v19) {
    [v4 addObject:@"PHAssetPropertySetAnalysisState"];
  }
  uint64_t v20 = [@"PHAssetPropertySetUserActivity" length];
  if ((a3 & 0x400) != 0 && v20) {
    [v4 addObject:@"PHAssetPropertySetUserActivity"];
  }
  uint64_t v21 = [@"PHAssetPropertySetFaceWorker" length];
  if ((a3 & 0x800) != 0 && v21) {
    [v4 addObject:@"PHAssetPropertySetFaceWorker"];
  }
  uint64_t v22 = [@"PHAssetPropertySetImageManager" length];
  if ((a3 & 0x1000) != 0 && v22) {
    [v4 addObject:@"PHAssetPropertySetImageManager"];
  }
  uint64_t v23 = [@"PHAssetPropertySetAdjustment" length];
  if ((a3 & 0x2000) != 0 && v23) {
    [v4 addObject:@"PHAssetPropertySetAdjustment"];
  }
  uint64_t v24 = [@"PHAssetPropertySetCuration" length];
  if ((a3 & 0x4000) != 0 && v24) {
    [v4 addObject:@"PHAssetPropertySetCuration"];
  }
  uint64_t v25 = [@"PHAssetPropertySetAesthetic" length];
  if ((a3 & 0x8000) != 0 && v25) {
    [v4 addObject:@"PHAssetPropertySetAesthetic"];
  }
  uint64_t v26 = [@"PHAssetPropertySetMediaAnalysis" length];
  if ((a3 & 0x10000) != 0 && v26) {
    [v4 addObject:@"PHAssetPropertySetMediaAnalysis"];
  }
  uint64_t v27 = [@"PHAssetPropertySetPhotoAnalysisWallpaperProperties" length];
  if ((a3 & 0x200000000) != 0 && v27) {
    [v4 addObject:@"PHAssetPropertySetPhotoAnalysisWallpaperProperties"];
  }
  uint64_t v28 = [@"PHAssetPropertySetCharacterRecognition" length];
  if ((a3 & 0x8000000) != 0 && v28) {
    [v4 addObject:@"PHAssetPropertySetCharacterRecognition"];
  }
  uint64_t v29 = [@"PHAssetPropertySetVisualSearch" length];
  if ((a3 & 0x40000000) != 0 && v29) {
    [v4 addObject:@"PHAssetPropertySetVisualSearch"];
  }
  uint64_t v30 = [@"PHAssetPropertySetImport" length];
  if ((a3 & 0x20000) != 0 && v30) {
    [v4 addObject:@"PHAssetPropertySetImport"];
  }
  uint64_t v31 = [@"PHAssetPropertySetSceneprint" length];
  if ((a3 & 0x40000) != 0 && v31) {
    [v4 addObject:@"PHAssetPropertySetSceneprint"];
  }
  uint64_t v32 = [@"PHAssetPropertySetDestinationAssetCopy" length];
  if ((a3 & 0x80000) != 0 && v32) {
    [v4 addObject:@"PHAssetPropertySetDestinationAssetCopy"];
  }
  uint64_t v33 = [@"PHAssetPropertySetKeywords" length];
  if ((a3 & 0x400000) != 0 && v33) {
    [v4 addObject:@"PHAssetPropertySetKeywords"];
  }
  uint64_t v34 = [@"PHAssetPropertySetGridMetadata" length];
  if ((a3 & 0x800000) != 0 && v34) {
    [v4 addObject:@"PHAssetPropertySetGridMetadata"];
  }
  uint64_t v35 = [@"PHAssetPropertySetCoarseLocation" length];
  if ((a3 & 0x2000000) != 0 && v35) {
    [v4 addObject:@"PHAssetPropertySetCoarseLocation"];
  }
  uint64_t v36 = [@"PHAssetPropertySetLibraryScope" length];
  if ((a3 & 0x4000000) != 0 && v36) {
    [v4 addObject:@"PHAssetPropertySetLibraryScope"];
  }
  uint64_t v37 = [@"PHAssetPropertySetCameraCaptureDevice" length];
  if ((a3 & 0x10000000) != 0 && v37) {
    [v4 addObject:@"PHAssetPropertySetCameraCaptureDevice"];
  }
  uint64_t v38 = [@"PHAssetPropertySetCloudLocalState" length];
  if ((a3 & 0x20000000) != 0 && v38) {
    [v4 addObject:@"PHAssetPropertySetCloudLocalState"];
  }
  uint64_t v39 = [@"PHAssetPropertySetMontage" length];
  if (a3 >= 0xFFFFFFFF80000000 && v39) {
    [v4 addObject:@"PHAssetPropertySetMontage"];
  }
  uint64_t v40 = [@"PHAssetPropertySetSpatialMedia" length];
  if ((a3 & 0x100000000) != 0 && v40) {
    [v4 addObject:@"PHAssetPropertySetSpatialMedia"];
  }
  uint64_t v41 = [@"PHAssetPropertySetLocationData" length];
  if ((a3 & 0x400000000) != 0 && v41) {
    [v4 addObject:@"PHAssetPropertySetLocationData"];
  }
  uint64_t v42 = [@"PHAssetPropertySetPTP" length];
  if ((a3 & 0x2000000000) != 0 && v42) {
    [v4 addObject:@"PHAssetPropertySetPTP"];
  }
  uint64_t v43 = [@"PHAssetPropertySetIconicScore" length];
  if ((a3 & 0x800000000) != 0 && v43) {
    [v4 addObject:@"PHAssetPropertySetIconicScore"];
  }
  uint64_t v44 = [@"PHAssetPropertySetStoryPlayback" length];
  if ((a3 & 0x4000000000) != 0 && v44) {
    [v4 addObject:@"PHAssetPropertySetStoryPlayback"];
  }
  long long v45 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];

  return v45;
}

- (NSNumber)livePhotoSRLCompensationAmount
{
  if ([(PHAsset *)self hasAdjustments])
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v4 = [(PHAsset *)self originalImageProperties];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"58"];

    unsigned int v7 = [v6 unsignedIntValue];
    if (v7 < 0x80000001)
    {
      unint64_t v3 = 0;
    }
    else
    {
      *(float *)&double v8 = (float)v7 * 0.0039062;
      unint64_t v3 = [NSNumber numberWithFloat:v8];
    }
  }

  return (NSNumber *)v3;
}

- (id)objectReference
{
  return +[PHAssetReference referenceForAsset:self];
}

+ (id)fetchAssetsForReferences:(id)a3 photoLibrary:(id)a4
{
  id v6 = a4;
  unsigned int v7 = PHLocalIdentifierForObjectReferencesAndLibrary((uint64_t)a3, (uint64_t)v6);
  double v8 = [v6 librarySpecificFetchOptions];

  [v8 setIsExclusivePredicate:1];
  uint64_t v9 = [a1 fetchAssetsWithLocalIdentifiers:v7 options:v8];

  return v9;
}

- (NSString)syndicatedAppDisplayName
{
  id v2 = [(PHAsset *)self curationProperties];
  unint64_t v3 = [v2 importedByBundleIdentifier];
  unint64_t v4 = [v2 importedByDisplayName];
  if (PLShouldConstructDisplayNameForAppBundle())
  {
    uint64_t v5 = PLSyndicatedDisplayNameForAppBundle();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (int64_t)syndicationEligibility
{
  int v3 = [(PHAsset *)self syndicationState];
  if ([(PHAsset *)self thumbnailIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return -6;
  }
  if ((v3 & 0xFFFFFFFD) != 0) {
    return -5;
  }
  uint64_t v5 = [(PHAsset *)self sceneAnalysisProperties];
  int v6 = [v5 sceneAnalysisVersion];
  unsigned int v7 = [MEMORY[0x1E4F8A998] currentSceneVersion];
  int v8 = [v7 intValue];

  if (v8 > v6) {
    return -4;
  }
  [(PHAsset *)self curationScore];
  if (v9 == 0.0) {
    return -2;
  }
  [(PHAsset *)self curationScore];
  if (v10 < *MEMORY[0x1E4F8ACF8]) {
    return 0;
  }
  uint64_t v11 = [(PHAsset *)self curationProperties];
  uint64_t v12 = [v11 importedByBundleIdentifier];
  int v13 = [v12 isEqual:*MEMORY[0x1E4F8AE28]];

  if (!v13) {
    return 0;
  }
  uint64_t v14 = [(PHAsset *)self faceAdjustmentVersion];

  uint64_t v15 = [(PHAsset *)self mediaAnalysisProperties];
  uint64_t v16 = [v15 syndicationProcessingVersion];

  uint64_t v17 = 65556;
  if (!v14) {
    uint64_t v17 = 20;
  }
  if (v16 != v17) {
    return -1;
  }
  PHAssetSourceType v18 = [(PHAsset *)self sourceType];
  int64_t v19 = -3;
  if (v14) {
    int64_t v19 = 1;
  }
  if (v18 == 32) {
    return 2;
  }
  else {
    return v19;
  }
}

+ (id)senderIdentifierByAssetUUIDForAssets:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    int v8 = 0;
    uint64_t v9 = *(void *)v43;
    *(void *)&long long v6 = 138543362;
    long long v33 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x19F389B10]();
        int v13 = [v11 uuid];
        uint64_t v14 = [v11 curationProperties];
        if (!v14)
        {
          int64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:a2 object:a1 file:@"PHAsset+Syndicated.m" lineNumber:303 description:@"Expecting PHAsset to have curationProperties pre-loaded"];
        }
        uint64_t v15 = objc_msgSend(v14, "syndicationIdentifier", v33);
        if (v15)
        {
          uint64_t v16 = [v14 importedByBundleIdentifier];
          if (v16)
          {
            uint64_t v17 = v16;

            [v36 setObject:v13 forKeyedSubscript:v15];
            [v4 addObject:v15];
            int v8 = v17;
          }
          else
          {
            PHAssetSourceType v18 = [MEMORY[0x1E4F28B00] currentHandler];
            [v18 handleFailureInMethod:a2 object:a1 file:@"PHAsset+Syndicated.m" lineNumber:313 description:@"Expecting bundle identifier to be non-nil for a syndicated asset"];

            uint64_t v17 = 0;
          }
        }
        else
        {
          uint64_t v17 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v33;
            uint64_t v47 = (uint64_t)v13;
            _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Returning nil CSSearchableItem due to nil syndication identifier for asset: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v21 = [v4 count];
  if (v21) {
    BOOL v22 = v8 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22) {
    goto LABEL_24;
  }
  uint64_t v23 = v21;
  uint64_t v24 = *MEMORY[0x1E4F22B00];
  v50[0] = *MEMORY[0x1E4F22A10];
  v50[1] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  uint64_t v26 = PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers();

  uint64_t v27 = [v26 count];
  if (v23 == v27)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __60__PHAsset_Syndicated__senderIdentifierByAssetUUIDForAssets___block_invoke;
    v38[3] = &unk_1E58474A8;
    id v39 = v36;
    id v40 = v26;
    id v41 = v20;
    id v28 = v26;
    [v4 enumerateObjectsUsingBlock:v38];

LABEL_24:
    id v29 = v20;
    goto LABEL_28;
  }
  uint64_t v30 = v27;
  uint64_t v31 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v47 = v23;
    __int16 v48 = 2048;
    uint64_t v49 = v30;
    _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "Returning empty senderIdentifierByAssetUUIDForAssets, got a mismatch of syndication identifiers (%tu) and searchable items (%tu)", buf, 0x16u);
  }

  id v29 = (id)MEMORY[0x1E4F1CC08];
LABEL_28:

  return v29;
}

void __60__PHAsset_Syndicated__senderIdentifierByAssetUUIDForAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  int v8 = [MEMORY[0x1E4F1CA98] null];

  if (v7 == v8)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v9 = [v7 attributeSet];
    double v10 = [v9 authorAddresses];
    uint64_t v11 = [v10 firstObject];
    if (![(__CFString *)v11 length])
    {
      uint64_t v12 = [v9 accountIdentifier];

      uint64_t v11 = (__CFString *)v12;
    }
  }
  if ([(__CFString *)v11 length])
  {
    int v13 = *(void **)(a1 + 48);
    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v5;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "No sender identifier found for syndication identifier %{public}@", (uint8_t *)&v16, 0xCu);
    }

    int v13 = *(void **)(a1 + 48);
    uint64_t v14 = &stru_1EEAC1950;
  }
  [v13 setObject:v14 forKeyedSubscript:v6];
}

+ (id)predicateForSyndicatedAssetIdentifiers:(id)a3 includeRejected:(BOOL)a4
{
  return (id)[MEMORY[0x1E4F8A950] predicateForSyndicatedAssetIdentifiers:a3 includeRejected:a4];
}

+ (id)predicateForSyndicatedAssetIdentifiers:(id)a3
{
  return (id)[a1 predicateForSyndicatedAssetIdentifiers:a3 includeRejected:0];
}

+ (id)filterPredicateToExcludeNoSyndicationAssets
{
  return (id)[MEMORY[0x1E4F8A950] filterPredicateToExcludeNoSyndicationAssets];
}

+ (id)filterPredicateToIncludeOnlyReceivedSyndicatedAssets
{
  return (id)[MEMORY[0x1E4F8A950] filterPredicateToIncludeOnlyReceivedSyndicatedAssets];
}

+ (id)filterPredicateForSavedSyndicationAssetsOnly
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"syndicationState", 2);
}

+ (id)fetchSyndicatedAssetsWithOptions:(id)a3 includeRejected:(BOOL)a4
{
  return (id)[a1 fetchAssetsWithSyndicationIdentifiers:0 options:a3 includeRejected:a4];
}

+ (id)fetchSyndicatedAssetsWithOptions:(id)a3
{
  return (id)[a1 fetchSyndicatedAssetsWithOptions:a3 includeRejected:0];
}

+ (id)fetchAssetsWithSyndicationIdentifiers:(id)a3 options:(id)a4 includeRejected:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 photoLibrary];

  if (!v11)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PHAsset+Syndicated.m", 218, @"Invalid parameter not satisfying: %@", @"fetchOptions.photoLibrary != nil" object file lineNumber description];
  }
  uint64_t v12 = [v9 internalPredicate];

  if (v12)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHAsset+Syndicated.m", 219, @"Invalid parameter not satisfying: %@", @"fetchOptions.internalPredicate == nil" object file lineNumber description];
  }
  int v13 = (void *)[v9 copy];
  uint64_t v14 = [a1 predicateForSyndicatedAssetIdentifiers:v10 includeRejected:v5];

  [v13 setInternalPredicate:v14];
  uint64_t v15 = +[PHObject authorizationAwareFetchResultWithOptions:v13 fetchBlock:&__block_literal_global_37856];

  return v15;
}

id __85__PHAsset_Syndicated__fetchAssetsWithSyndicationIdentifiers_options_includeRejected___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForAssetsWithOptions:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetsWithSyndicationIdentifiers:(id)a3 options:(id)a4
{
  return (id)[a1 fetchAssetsWithSyndicationIdentifiers:a3 options:a4 includeRejected:0];
}

+ (id)fetchPreviewAssetsForMomentShareCreationWithAssets:(id)a3 options:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 firstObject];
  long long v6 = [v5 photoLibrary];
  uint64_t v7 = [v6 librarySpecificFetchOptions];

  int v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v14[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v7 setSortDescriptors:v10];

  [v7 setFetchLimit:10];
  [v7 setIncludeHiddenAssets:1];
  uint64_t v11 = PFMap();

  uint64_t v12 = +[PHAsset fetchAssetsWithObjectIDs:v11 options:v7];

  return v12;
}

uint64_t __83__PHAsset_MomentShare__fetchPreviewAssetsForMomentShareCreationWithAssets_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

+ (id)fetchCuratedAssetsForMomentShareCreationWithAssets:(id)a3 options:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 fetchLimit]) {
    unint64_t v7 = [v6 fetchLimit];
  }
  else {
    unint64_t v7 = 10;
  }
  unint64_t v8 = [v5 count];
  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  id v10 = [v5 firstObject];
  uint64_t v11 = [v10 photoLibrary];

  if (v11)
  {
    long long v45 = v6;
    uint64_t v46 = v11;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F8A8C8]) initWithNumericValueKeypaths:&unk_1EEB26D48];
    [v12 setK:v9];
    long long v44 = v12;
    uint64_t v47 = v5;
    int v13 = [v12 performWithDataset:v5 progressBlock:&__block_literal_global_319];
    uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
    v59[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
    v59[1] = v15;
    int v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v59[2] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];

    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v9];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v19 = v13;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v53 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = [*(id *)(*((void *)&v52 + 1) + 8 * i) objects];
          uint64_t v25 = [v24 sortedArrayUsingDescriptors:v17];

          uint64_t v26 = [v25 firstObject];
          uint64_t v27 = [v26 uuid];

          if (v27) {
            [v18 addObject:v27];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v21);
    }

    if ([v18 count] < v9)
    {
      id v28 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEFAULT, "fetchCuratedAssetsForMomentShareCreationWithAssets: adding some random assets to clustering assets selection.", buf, 2u);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v29 = v47;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v49;
LABEL_22:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v49 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = [*(id *)(*((void *)&v48 + 1) + 8 * v33) uuid];
          [v18 addObject:v34];

          if ([v18 count] == v9) {
            break;
          }
          if (v31 == ++v33)
          {
            uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v31) {
              goto LABEL_22;
            }
            break;
          }
        }
      }
    }
    id v6 = v45;
    if (v45)
    {
      uint64_t v35 = [v45 copy];
    }
    else
    {
      uint64_t v35 = [v46 librarySpecificFetchOptions];
    }
    uint64_t v38 = (void *)v35;
    id v5 = v47;
    id v39 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v56[0] = v39;
    id v40 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v56[1] = v40;
    id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    [v38 setSortDescriptors:v41];

    [v38 setFetchLimit:v9];
    long long v42 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v18];
    [v38 setPredicate:v42];

    [v38 setIncludeHiddenAssets:1];
    uint64_t v37 = +[PHAsset fetchAssetsWithOptions:v38];

    uint64_t v11 = v46;
    id v36 = v44;
  }
  else
  {
    id v36 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v5;
      _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_ERROR, "Failed to compute curated assets: No photo library with assets: %@.", buf, 0xCu);
    }
    uint64_t v37 = 0;
  }

  return v37;
}

+ (id)composabilityScoresOfAssets:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [v14 photoLibrary];

        uint64_t v11 = (void *)v15;
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  }
  while (v10);
  if (v11)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "localIdentifier", (void)v26);
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    uint64_t v23 = [v11 photoAnalysisClient];
    uint64_t v24 = [v23 requestComposabilityScoresOfAssetsForLocalIdentifiers:v16 options:v8 error:a5];
  }
  else
  {
LABEL_19:
    uint64_t v24 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v24;
}

- (id)messagesForRecentImageManagerRequests
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PHObject *)self uuid];
  id v5 = [(id)objc_opt_class() _imageManagerRequestLoggingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PHAsset_ImageManager__messagesForRecentImageManagerRequests__block_invoke;
  block[3] = &unk_1E5848EC0;
  block[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  dispatch_sync(v5, block);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

void __62__PHAsset_ImageManager__messagesForRecentImageManagerRequests__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend((id)objc_opt_class(), "_inq_imageManagerRequestLogsByAssetUUID");
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [v3 allKeys];
  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        [*(id *)(a1 + 48) appendFormat:@"ID: %@\n", v10];
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(a1 + 48) appendString:*(void *)(*((void *)&v17 + 1) + 8 * j)];
              [*(id *)(a1 + 48) appendString:@"\n"];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }
        [*(id *)(a1 + 48) appendString:@"\n"];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)recordImageManagerMessageForRequestID:(int)a3 message:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PHAsset_ImageManager.m", 123, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  long long v23 = &v24;
  uint64_t v8 = NSString;
  id v9 = [(id)objc_opt_class() _currentTimestampString];
  uint64_t v10 = [v8 stringWithFormat:@"%@: ", v9];

  uint64_t v11 = (void *)[[NSString alloc] initWithFormat:v7 arguments:&v24];
  uint64_t v12 = [v10 stringByAppendingString:v11];

  uint64_t v13 = [(PHObject *)self uuid];
  uint64_t v14 = [(id)objc_opt_class() _imageManagerRequestLoggingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PHAsset_ImageManager__recordImageManagerMessageForRequestID_message___block_invoke;
  block[3] = &unk_1E5847F88;
  block[4] = self;
  id v19 = v13;
  int v22 = a3;
  id v20 = v12;
  SEL v21 = a2;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(v14, block);
}

void __71__PHAsset_ImageManager__recordImageManagerMessageForRequestID_message___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend((id)objc_opt_class(), "_inq_imageManagerRequestMessagesByRequestIDForAssetUUID:requestID:", *(void *)(a1 + 40), *(int *)(a1 + 64));
  id v4 = v2;
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PHAsset_ImageManager.m" lineNumber:132 description:@"cannot get messages array"];

    id v2 = 0;
  }
  [v2 addObject:*(void *)(a1 + 48)];
  objc_msgSend((id)objc_opt_class(), "_inq_recordRequestID:", *(int *)(a1 + 64));
  objc_msgSend((id)objc_opt_class(), "_inq_trimToMostRecentImageManagerMessages");
}

+ (void)_inq_trimToMostRecentImageManagerMessages
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "_inq_imageManagerRequestLogsByAssetUUID");
  id v4 = objc_msgSend(a1, "_inq_highestImageManagerRequestIDsObserved");
  uint64_t v5 = [v4 firstIndex];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__PHAsset_ImageManager___inq_trimToMostRecentImageManagerMessages__block_invoke;
  v17[3] = &unk_1E5847F60;
  uint64_t v19 = v5;
  id v7 = v6;
  id v18 = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v3, "removeObjectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v10);
  }
}

void __66__PHAsset_ImageManager___inq_trimToMostRecentImageManagerMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!v10 || [v10 compare:*(void *)(*((void *)&v15 + 1) + 8 * i)] == 1)
        {
          id v14 = v13;

          uint64_t v10 = v14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  if ([v10 integerValue] < *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

+ (id)_currentTimestampString
{
  if (_currentTimestampString_s_onceToken_44185 != -1) {
    dispatch_once(&_currentTimestampString_s_onceToken_44185, &__block_literal_global_37_44186);
  }
  id v2 = (void *)_currentTimestampString_s_formatter_44187;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 stringFromDate:v3];

  return v4;
}

uint64_t __48__PHAsset_ImageManager___currentTimestampString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)_currentTimestampString_s_formatter_44187;
  _currentTimestampString_s_formatter_44187 = (uint64_t)v0;

  id v2 = (void *)_currentTimestampString_s_formatter_44187;

  return [v2 setDateFormat:@"yyyy-MM-dd' 'HH:mm:ss.SS"];
}

+ (void)_inq_recordRequestID:(int64_t)a3
{
  objc_msgSend(a1, "_inq_highestImageManagerRequestIDsObserved");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addIndex:a3];
  if ((unint64_t)[v4 count] >= 0x65) {
    objc_msgSend(v4, "removeIndex:", objc_msgSend(v4, "firstIndex"));
  }
}

+ (id)_inq_imageManagerRequestMessagesByRequestIDForAssetUUID:(id)a3 requestID:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "_inq_imageManagerRequestLogsByAssetUUID");
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = objc_msgSend(a1, "_inq_imageManagerRequestLogsByAssetUUID");
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  uint64_t v10 = [NSNumber numberWithInteger:a4];
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];

  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = [NSNumber numberWithInteger:a4];
    [v8 setObject:v11 forKeyedSubscript:v12];
  }

  return v11;
}

+ (id)_inq_highestImageManagerRequestIDsObserved
{
  if (_inq_highestImageManagerRequestIDsObserved_s_onceToken != -1) {
    dispatch_once(&_inq_highestImageManagerRequestIDsObserved_s_onceToken, &__block_literal_global_32);
  }
  id v2 = (void *)_inq_highestImageManagerRequestIDsObserved_s_highest;

  return v2;
}

void __67__PHAsset_ImageManager___inq_highestImageManagerRequestIDsObserved__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v1 = (void *)_inq_highestImageManagerRequestIDsObserved_s_highest;
  _inq_highestImageManagerRequestIDsObserved_s_highest = (uint64_t)v0;
}

+ (id)_inq_imageManagerRequestLogsByAssetUUID
{
  if (_inq_imageManagerRequestLogsByAssetUUID_s_onceToken != -1) {
    dispatch_once(&_inq_imageManagerRequestLogsByAssetUUID_s_onceToken, &__block_literal_global_30);
  }
  id v2 = (void *)_inq_imageManagerRequestLogsByAssetUUID_s_logsByAssetUUID;

  return v2;
}

void __64__PHAsset_ImageManager___inq_imageManagerRequestLogsByAssetUUID__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = (void *)_inq_imageManagerRequestLogsByAssetUUID_s_logsByAssetUUID;
  _inq_imageManagerRequestLogsByAssetUUID_s_logsByAssetUUID = (uint64_t)v0;
}

+ (id)_imageManagerRequestLoggingQueue
{
  if (_imageManagerRequestLoggingQueue_s_onceToken != -1) {
    dispatch_once(&_imageManagerRequestLoggingQueue_s_onceToken, &__block_literal_global_27);
  }
  id v2 = (void *)_imageManagerRequestLoggingQueue_s_queue;

  return v2;
}

void __57__PHAsset_ImageManager___imageManagerRequestLoggingQueue__block_invoke()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.imagemanagerloggingqueue", attr);
  id v2 = (void *)_imageManagerRequestLoggingQueue_s_queue;
  _imageManagerRequestLoggingQueue_s_queue = (uint64_t)v1;
}

@end