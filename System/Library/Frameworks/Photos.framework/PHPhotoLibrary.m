@interface PHPhotoLibrary
+ (BOOL)_isInternalObserver:(id)a3;
+ (BOOL)additionalCheckForProcessingNeededForAsset:(id)a3 taskID:(unint64_t)a4 priority:(unint64_t)a5;
+ (BOOL)checkAuthorizationStatusForAPIAccessLevel:(int64_t)a3;
+ (BOOL)checkAuthorizationStatusForAPIAccessLevel:(int64_t)a3 suppressPrompt:(BOOL)a4;
+ (BOOL)hasSharedPhotoLibrary;
+ (BOOL)isMultiLibraryModeEnabled;
+ (BOOL)isPhotosApplicationInstalled;
+ (BOOL)isSystemPhotoLibraryURL:(id)a3;
+ (BOOL)setImagePickerPhotoLibrary:(id)a3 error:(id *)a4;
+ (BOOL)setSystemPhotoLibraryURL:(id)a3 error:(id *)a4;
+ (BOOL)shouldDisplayMergeCandidates:(id)a3 forPerson:(id)a4;
+ (Class)PHObjectClassForEntityName:(id)a3;
+ (Class)PHObjectClassForIdentifierCode:(id)a3;
+ (Class)PHObjectClassForOID:(id)a3;
+ (Class)PHObjectClassForObjectType:(int64_t)a3;
+ (Class)classForFetchType:(id)a3;
+ (PHAuthorizationStatus)authorizationStatus;
+ (PHAuthorizationStatus)authorizationStatusForAccessLevel:(PHAccessLevel)accessLevel;
+ (PHPhotoLibrary)sharedPhotoLibrary;
+ (const)systemPhotoLibraryAvailableNotificationName;
+ (const)systemPhotoLibraryURLChangeNotificationName;
+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3;
+ (id)PHObjectClasses;
+ (id)PHObjectClassesByEntityName;
+ (id)_countOfAnalysisVersionsForKey:(id)a3 inLibrary:(id)a4;
+ (id)_effectiveRootEntity:(id)a3;
+ (id)_sharedPhotoLibrary;
+ (id)fetchTypeForLocalIdentifierCode:(id)a3;
+ (id)imagePickerPhotoLibrary;
+ (id)mediaProcessingDeviceIndependentFacesSortDescriptors;
+ (id)mediaProcessingFacesSortDescriptorsForGeneratingPersonModel;
+ (id)openPhotoLibraryWithWellKnownIdentifier:(int64_t)a3 error:(id *)a4;
+ (id)photoLibraryForCurrentTransaction;
+ (id)plLibraryOptionsFromPHOptions:(id)a3 createOptions:(unint64_t *)a4;
+ (id)sharedContactStore;
+ (id)sharedLazyPhotoLibraryForCMM;
+ (id)sharedMomentSharePhotoLibrary;
+ (id)stringFromPHPhotoLibraryType:(unsigned __int16)a3;
+ (id)systemPhotoLibraryURL;
+ (id)uniqueObjectIDCache;
+ (id)uniquedOID:(id)a3;
+ (id)uniquedOIDs:(id)a3;
+ (id)uniquedOIDsFromObjects:(id)a3;
+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3;
+ (int64_t)_photosAccessAllowedForAccessLevel:(int64_t)a3;
+ (int64_t)collectionListTypeForIdentifierCode:(id)a3;
+ (unint64_t)_countOfAssetsWithPredicate:(id)a3 entityName:(id)a4 inLibrary:(id)a5;
+ (void)_forceUserInterfaceReload;
+ (void)_requestAuthorizationForAccessLevel:(int64_t)a3 supportsLimited:(BOOL)a4 handler:(id)a5;
+ (void)assertRunningInExtension;
+ (void)assertTransaction;
+ (void)enableMultiLibraryMode;
+ (void)removeAllUniquedOIDs;
+ (void)requestAuthorization:(void *)handler;
+ (void)requestAuthorizationForAccessLevel:(PHAccessLevel)accessLevel handler:(void *)handler;
+ (void)setNeedsToRepairKeyCuratedAssetForMemories:(id)a3;
+ (void)setSharedPhotoLibrary:(id)a3;
+ (void)unsafeShutdownLibraryWithPhotoLibraryURL:(id)a3;
- (BOOL)_isApplicationOwnedFolderWithApplicationDataFolderIdentifier:(int64_t)a3;
- (BOOL)_isOptimizedMediaProcessingTaskID:(unint64_t)a3;
- (BOOL)_isValidTaskID:(unint64_t)a3;
- (BOOL)_openApplicationOwnedFoldersIfNecessary;
- (BOOL)_postOpenInitializationWithError:(id *)a3;
- (BOOL)_preflightRequest:(id)a3 withError:(id *)a4;
- (BOOL)_setUnavailabilityReason:(id)a3;
- (BOOL)_shouldIncludeAllBurstAssetsForTaskID:(unint64_t)a3;
- (BOOL)_shouldIncludeGuestAssetsForTaskID:(unint64_t)a3;
- (BOOL)_shouldIncludeHiddenAssetsForTaskID:(unint64_t)a3;
- (BOOL)_shouldIncludeOnlyAssetsAllowedForAnalysisForTaskID:(unint64_t)a3;
- (BOOL)_shouldIncludeTrashedAssetsForTaskID:(unint64_t)a3;
- (BOOL)assetsArePendingForDuplicateMergeProcessingWithLocalIdentifiers:(id)a3;
- (BOOL)bfa_supportsPrivacyRestrictionsForOIDs:(id)a3;
- (BOOL)cancelReservedCloudIdentifiersWithObjectType:(int64_t)a3 error:(id *)a4;
- (BOOL)clearsOIDCacheAfterFetchResultDealloc;
- (BOOL)cloudQuotaResourceBytesUsed:(id *)a3 error:(id *)a4;
- (BOOL)cloudQuotaResourceBytesUsed:(id *)a3 minVideoSize:(unint64_t)a4 error:(id *)a5;
- (BOOL)createPhotoLibraryUsingOptions:(id)a3 error:(id *)a4;
- (BOOL)hasSyncProgressReturningImportOperations:(int *)a3;
- (BOOL)internal_processIdenticalDuplicatesWithError:(id *)a3;
- (BOOL)invalidatePersistentGraphCachesAndReturnError:(id *)a3;
- (BOOL)invalidateTransientGraphCachesAndReturnError:(id *)a3;
- (BOOL)isCPLSyncablePhotoLibrary;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isFaceProcessingFinished;
- (BOOL)isInitialDuplicateDetectorProcessingCompleted;
- (BOOL)isKeepOriginalsEnabled;
- (BOOL)isPHPhotoLibraryForCMM;
- (BOOL)isReadOnlyCloudPhotoLibrary;
- (BOOL)isReadyForAnalysis;
- (BOOL)isReadyForAnalysisCPLInitialDownloadCompleted;
- (BOOL)isReadyForAnalysis_FOR_UI_USE_ONLY;
- (BOOL)isSharedAlbumsEnabled;
- (BOOL)isSystemPhotoLibrary;
- (BOOL)isWalrusEnabled;
- (BOOL)openAndWaitWithUpgrade:(BOOL)a3 error:(id *)a4;
- (BOOL)openAndWaitWithUpgrade:(BOOL)a3 options:(id)a4 error:(id *)a5;
- (BOOL)performCancellableChangesAndWait:(id)a3 error:(id *)a4;
- (BOOL)petVIPModelExists;
- (BOOL)photoAnalysisClientAllowed;
- (BOOL)postsPersistentHistoryChangedNotifications;
- (BOOL)processDuplicateAssetsWithLocalIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)processUniversalSearchJITForAssetLocalIdentifier:(id)a3 processingTypes:(unint64_t)a4 error:(id *)a5;
- (BOOL)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 withError:(id *)a4;
- (BOOL)requestAssetRevGeocodingWithError:(id *)a3;
- (BOOL)requestEnrichmentWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestHighlightCollectionEnrichmentWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestHighlightEnrichmentWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestSandboxExtensionsIfNeededWithError:(id *)a3;
- (BOOL)requestStartSharedLibrarySuggestionResultWithError:(id *)a3;
- (BOOL)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetIdentifiers:(id)a4 resetOptions:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldMobileSlideShowLaunchWithError:(id *)a3;
- (BOOL)unknownMergeEvent;
- (CPLStatus)cplStatus;
- (NSArray)cloudIdentifiersForLocalIdentifiers:(NSArray *)localIdentifiers;
- (NSArray)gatheredSqlStatements;
- (NSArray)localIdentifiersForCloudIdentifiers:(NSArray *)cloudIdentifiers;
- (NSDictionary)cloudIdentifierMappingsForLocalIdentifiers:(NSArray *)localIdentifiers;
- (NSDictionary)localIdentifierMappingsForCloudIdentifiers:(NSArray *)cloudIdentifiers;
- (NSError)unavailabilityReason;
- (NSHashTable)availabilityObservers;
- (NSManagedObjectID)albumRootFolderObjectID;
- (NSManagedObjectID)projectAlbumRootFolderObjectID;
- (NSMutableDictionary)changeNotificationInfo;
- (NSProgress)postOpenProgress;
- (NSString)databaseUUID;
- (NSString)debugDescription;
- (NSString)mainScopeIdentifier;
- (NSString)uuid;
- (NSURL)photoLibraryURL;
- (OS_dispatch_queue)isolationQueue;
- (OS_dispatch_queue)transactionQueue;
- (PAImageConversionServiceClient)imageConversionServiceClient;
- (PAVideoConversionServiceClient)videoConversionServiceClient;
- (PHPerformChangesRequest)performChangesRequest;
- (PHPersistentChangeFetchResult)fetchPersistentChangesSinceToken:(PHPersistentChangeToken *)token error:(NSError *)error;
- (PHPersistentChangeToken)currentToken;
- (PHPhotoLibrary)init;
- (PHPhotoLibrary)initWithPLPhotoLibrary:(id)a3;
- (PHPhotoLibrary)initWithPLPhotoLibrary:(id)a3 type:(unsigned __int16)a4;
- (PHPhotoLibrary)initWithPhotoLibraryBundle:(id)a3 type:(unsigned __int16)a4;
- (PHPhotoLibrary)initWithPhotoLibraryURL:(id)a3;
- (PHPhotoLibrary)initWithPhotoLibraryURL:(id)a3 type:(unsigned __int16)a4;
- (PHPhotoLibraryAppPrivateData)appPrivateData;
- (PHPhotoLibraryCloudStatus)cloudStatus;
- (PHPhotoLibraryIdentifier)photoLibraryIdentifier;
- (PLAssetsdClient)assetsdClient;
- (PLCacheMetricsCollectorClient)cacheMetricsCollector;
- (PLPhotoAnalysisServiceClient)photoAnalysisClient;
- (PLPhotoKitVariationCache)variationCache;
- (PLPhotoLibrary)backgroundQueueObjectFetchingPhotoLibrary;
- (PLPhotoLibrary)backgroundQueuePhotoLibrary;
- (PLPhotoLibrary)changeHandlingPhotoLibrary;
- (PLPhotoLibrary)graphObjectFetchingPhotoLibrary;
- (PLPhotoLibrary)mainQueueConcurrencyPhotoLibrary;
- (PLPhotoLibrary)mainQueuePhotoLibrary;
- (PLPhotoLibrary)photoLibrary;
- (PLPhotoLibrary)transactionPhotoLibrary;
- (PLPhotoLibrary)userInitiatedQueuePhotoLibrary;
- (PLPhotoLibraryBundle)photoLibraryBundle;
- (double)_analysisProgressForHighlight:(id)a3 fetchCountBlock:(id)a4;
- (double)_ratioOfAssetsAtOrAboveVersion:(signed __int16)a3 forKey:(id)a4;
- (double)faceAnalysisProgressForHighlight:(id)a3;
- (double)ratioOfAssetsAtOrAboveFaceAnalysisVersion:(signed __int16)a3;
- (double)ratioOfAssetsAtOrAboveSceneAnalysisVersion:(signed __int16)a3;
- (double)ratioOfAssetsWithFacesProcessed;
- (double)ratioOfAssetsWithMediaAnalysisImageProcessed;
- (double)ratioOfAssetsWithMediaAnalysisVideoProcessed;
- (double)ratioOfAssetsWithScenesProcessed;
- (double)sceneAnalysisProgressForHighlight:(id)a3;
- (id)_assetOIDsForHighlight:(id)a3 withContext:(id)a4;
- (id)_baseFetchOptionsForMediaProcessing;
- (id)_cachedCloudStatus;
- (id)_cloudInternalClient;
- (id)_deriveMainScopeIdentifierFromCPLSettings;
- (id)_errorForAuthorizationStatus:(int64_t)a3 accessLevel:(int64_t)a4;
- (id)_facesFetchOptionsForMediaProcessing;
- (id)_fetchPersistentChangesSinceToken:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_graphBasedPHObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5;
- (id)_initializeAppPrivateData;
- (id)_initializeCPLStatus;
- (id)_initializeIsReadyForAnalysis;
- (id)_initializeIsReadyForAnalysisCPLInitialDownloadCompleted;
- (id)_initializeIsReadyForAnalysisQuickCheck;
- (id)_initializePhotoLibraryIdentifier;
- (id)_initializeSearchIndex;
- (id)_lazyPhotoLibrary;
- (id)_popChangesRequest;
- (id)_propertySetsForTaskID:(unint64_t)a3;
- (id)_updateGraphAvailabilityInFeatureAvailability:(id)a3 forFeature:(unint64_t)a4 error:(id *)a5;
- (id)_urlForApplicationDataFolderIdentifier:(int64_t)a3 pathManager:(id)a4 error:(id *)a5;
- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)allowedEntities;
- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletion:(id)a5;
- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletion:(id)a4;
- (id)assetIdentifiersForPersonIdentifiers:(id)a3 error:(id *)a4;
- (id)bfa_fetchObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 overrideResultsWithClass:(Class)a5;
- (id)bfa_fetchUUIDsForRestrictedOIDs:(id)a3;
- (id)bfa_tombstoneObjectForOID:(id)a3 uuid:(id)a4 propertyHint:(unint64_t)a5 overrideResultsWithClass:(Class)a6;
- (id)changeRequestForUUID:(id)a3;
- (id)curationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)curationDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4;
- (id)exportGraphForPurpose:(id)a3 error:(id *)a4;
- (id)faceAnalysisProcessingCounts;
- (id)faceAnalysisProgressCounts;
- (id)faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers:(id)a3 error:(id *)a4;
- (id)faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson:(id)a3 verifiedClusterSequenceNumbers:(id)a4;
- (id)featureAvailabilityForFeature:(unint64_t)a3 readOptions:(id)a4 error:(id *)a5;
- (id)fetchAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7;
- (id)fetchDictionariesByPHClassForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5 overrideWithPHClass:(Class)a6;
- (id)fetchFacesForMediaProcessingWithPersonLocalIdentifiers:(id)a3 inMoment:(id)a4;
- (id)fetchOptionsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 processed:(BOOL)a7 error:(id *)a8;
- (id)fetchOptionsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 processed:(BOOL)a7 exactVersionMatch:(BOOL)a8 error:(id *)a9;
- (id)fetchPHObjectsForOIDs:(id)a3;
- (id)fetchPHObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5 overrideResultsWithClass:(Class)a6;
- (id)fetchPHObjectsForUUIDs:(id)a3 entityName:(id)a4;
- (id)fetchPersistentChangesWithRequest:(id)a3 error:(id *)a4;
- (id)fetchPersonAvailabilityOfDetectionTypes:(id)a3 error:(id *)a4;
- (id)fetchPersonAvailabilityWithError:(id *)a3;
- (id)fetchProcessedAssetsBelowAnalysisStage:(signed __int16)a3 forTaskIDs:(id)a4 algorithmVersion:(id)a5 error:(id *)a6;
- (id)fetchProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7;
- (id)fetchPropertiesByOID:(id)a3 propertyNamesByEntityName:(id)a4;
- (id)fetchUnprocessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7;
- (id)fetchUpdatedObject:(id)a3;
- (id)fetchedObjectsForOIDs:(id)a3 propertySetClass:(Class)a4;
- (id)graphStatisticsDescription:(id *)a3;
- (id)graphStatusDescription:(id *)a3;
- (id)highlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 error:(id *)a4;
- (id)initMomentShareLibrary;
- (id)initSharedLibrary;
- (id)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(id)a3 candidateAssetUUIDs:(id)a4 error:(id *)a5;
- (id)libraryID;
- (id)librarySpecificFetchOptions;
- (id)limitedLibraryPredicateForApplication:(id)a3 fetchType:(id)a4;
- (id)mainQueueManagedObjectContext;
- (id)managedObjectContext;
- (id)managedObjectContextForCurrentQueueQoS;
- (id)memoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 error:(id *)a4;
- (id)migrationDate;
- (id)newClusteringEligibleFacesFetchOptions;
- (id)newFaceCropsToBeGeneratedFetchOptions;
- (id)newUnclusteredFacesFetchOptions;
- (id)objectFetchingContextForCurrentQueueQoS;
- (id)pathManager;
- (id)photoLibraryForCurrentQueueQoS;
- (id)pl_photoLibraryForCMM;
- (id)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 error:(id *)a6;
- (id)queryForType:(id)a3 withIdentifiers:(id)a4 local:(BOOL)a5;
- (id)relatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7;
- (id)relatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7;
- (id)requestGraphInferencesSummaryWithDateInterval:(id)a3 error:(id *)a4;
- (id)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 error:(id *)a4;
- (id)requestPersonalTraitsForAssetsWithUUIDs:(id)a3 error:(id *)a4;
- (id)requestPersonalTraitsForHighlightsWithUUIDs:(id)a3 error:(id *)a4;
- (id)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)reserveCloudIdentifiersWithObjectType:(int64_t)a3 count:(unint64_t)a4 error:(id *)a5;
- (id)reservedCloudIdentifiersWithObjectType:(int64_t)a3 error:(id *)a4;
- (id)sceneTaxonomyDetectorNodeSceneIDsFromSceneID:(unint64_t)a3 sceneTaxonomy:(id)a4;
- (id)searchDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4;
- (id)searchIndex;
- (id)sharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4;
- (id)sharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4;
- (id)sharingSuggestionWithRandomPick:(BOOL)a3 fallbackToRecentMoments:(BOOL)a4 needsNotification:(BOOL)a5;
- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)sortedArrayOfPersonIdentifiers:(id)a3 error:(id *)a4;
- (id)stateCaptureDictionary;
- (id)suggestedMePersonIdentifierWithError:(id *)a3;
- (id)suggestionsForPersonLocalIdentifier:(id)a3 clusterSequenceNumbers:(id)a4 excludePersonLocalIdentifiers:(id)a5 minimumSuggestionFaceCount:(unint64_t)a6;
- (id)summaryCurationForHighlightForLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)upgradePhotoLibraryUsingOptions:(id)a3 completion:(id)a4;
- (id)urlForApplicationDataFolderIdentifier:(int64_t)a3;
- (id)urlForApplicationDataFolderIdentifier:(int64_t)a3 error:(id *)a4;
- (int)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int64_t)_initialRetryCountForChangesRequest:(id)a3;
- (int64_t)currentDatabaseStatistics;
- (int64_t)fetchCountOfAssetsWithAllowedForAnalysis;
- (int64_t)fetchCountOfAssetsWithFacesProcessedToAnyVersion;
- (int64_t)fetchCountOfAssetsWithFacesProcessedToLatestVersion;
- (int64_t)fetchCountOfAssetsWithMediaAnalysisImageProcessed;
- (int64_t)fetchCountOfAssetsWithMediaAnalysisVideoProcessed;
- (int64_t)fetchCountOfAssetsWithScenesProcessed;
- (int64_t)fetchCountOfVideosWithAllowedForAnalysis;
- (int64_t)wellKnownPhotoLibraryIdentifier;
- (uint64_t)_performCancellableChangesAndWait:(void *)a3 withInstrumentation:(uint64_t)a4 error:;
- (unint64_t)countOfAllAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 sceneConfidenceThreshold:(float)a5 error:(id *)a6;
- (unint64_t)countOfClusteringEligibleFaces;
- (unint64_t)countOfDirtyFaceGroups;
- (unint64_t)countOfFaceCropsToBeGenerated;
- (unint64_t)countOfFetchResultsRegisteredForChangeNotifications;
- (unint64_t)countOfProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7;
- (unint64_t)countOfUnclusteredFaces;
- (unint64_t)countOfUnprocessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7;
- (unint64_t)countOfUnprocessedFaceCrops;
- (unsigned)type;
- (void)_addObservers:(id)a3 authorizationStatus:(int64_t)a4;
- (void)_beginTransaction;
- (void)_callLegacyCompletionTarget:(id)a3 completionSelector:(SEL)a4 contextInfo:(void *)a5 withSuccess:(BOOL)a6 error:(id)a7;
- (void)_cancelTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 completionHandler:(id)a5;
- (void)_commitTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 completionHandler:(id)a5;
- (void)_denyTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 authorizationStatus:(int64_t)a5 accessLevel:(int64_t)a6 completionHandler:(id)a7;
- (void)_endTransaction;
- (void)_handleLibraryBecameUnavailable:(id)a3 reason:(id)a4;
- (void)_handleServiceConnectionClosed:(id)a3;
- (void)_invalidateEverythingWithReason:(id)a3;
- (void)_notifyAvailabilityObserversWithReason:(id)a3;
- (void)_notifyPersistentChangeObservers;
- (void)_onQueueNotifyAvailabilityObserversWithReason:(id)a3;
- (void)_performCancellableChanges:(void *)a3 withInstrumentation:(void *)a4 completionHandler:;
- (void)_performCancellableChanges:(void *)a3 withInstrumentation:(void *)a4 onExecutionContext:(void *)a5 completionHandler:;
- (void)_processPendingChanges;
- (void)_publishChangeToObserversIfAuthorized:(id)a3;
- (void)_publishCloudStatusChange;
- (void)_removeObserver:(id)a3;
- (void)_resetCachedValues;
- (void)_sendChangesRequest:(id)a3 onExecutionContext:(id)a4 withInstrumentation:(id)a5 remainingRetryCount:(int64_t)a6 reply:(id)a7;
- (void)_sendChangesRequest:(id)a3 onExecutionContext:(id)a4 withInstrumentation:(id)a5 reply:(id)a6;
- (void)_setCachedCloudStatus:(id)a3;
- (void)_setFetchLimit:(id)a3 forTaskID:(unint64_t)a4;
- (void)_setSortDescriptors:(id)a3 forTaskID:(unint64_t)a4;
- (void)_startObservingServiceConnectionInvalidated;
- (void)_startWatchingFileSystemVolumeForLibraryAvailability;
- (void)_startWatchingForLibraryAvailability;
- (void)_stopObservingServiceConnectionInvalidated;
- (void)_stopWatchingFileSystemVolumeForLibraryAvailability;
- (void)_stopWatchingForLibraryAvailability;
- (void)_updateFetchOptionsForMediaProcessingCounts:(id)a3;
- (void)accountDidChange:(id)a3;
- (void)appPrivateDataWriteFailedWithError:(id)a3;
- (void)assertTransaction;
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)close;
- (void)cloudQuotaResourceBytesUsedForMinVideoSize:(unint64_t)a3 completion:(id)a4;
- (void)countOfReferencedMediaWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)disableGatheringSqlStatements;
- (void)enableGatheringSqlStatements;
- (void)getCPLConfigrationValueForClient:(unint64_t)a3 completionHandler:(id)a4;
- (void)handleMergeNotification:(id)a3;
- (void)legacySaveImageDataToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6;
- (void)legacySaveImageToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6;
- (void)legacySaveScreenshotToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6;
- (void)legacySaveVideoToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6;
- (void)mergeDuplicateAssetsWithLocalIdentifierGroupingContainer:(id)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 completionHandler:(id)a6;
- (void)performCancellableChanges:(id)a3 completionHandler:(id)a4;
- (void)personPromotionProcessingStatusForUserInterface:(id)a3;
- (void)recordDeleteRequest:(id)a3;
- (void)recordInsertRequest:(id)a3;
- (void)recordOtherChangeRequest:(id)a3;
- (void)recordUpdateRequest:(id)a3;
- (void)registerAvailabilityObserver:(id)observer;
- (void)registerChangeObserver:(id)observer;
- (void)registerFetchResult:(id)a3;
- (void)removeAllGatheredSqlStatements;
- (void)requestDeleteEmbeddings:(id)a3 assetUUID:(id)a4 withCompletion:(id)a5;
- (void)requestExternalAssetRelevanceProcessingWithReply:(id)a3;
- (void)requestGenerateQuestionsWithOptions:(id)a3 reply:(id)a4;
- (void)requestGraphModelResultWithOptions:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)requestGraphReadyNotificationWithCoalescingIdentifier:(id)a3 completion:(id)a4;
- (void)requestGraphRebuildProgressWithCompletion:(id)a3;
- (void)requestHighlightEstimatesWithCompletion:(id)a3;
- (void)requestInsertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 withCompletion:(id)a6;
- (void)requestSearchIndexGraphUpdates:(id)a3 supportingData:(id)a4 withCompletion:(id)a5;
- (void)requestSyndicationProcessingWithOptions:(id)a3 reply:(id)a4;
- (void)requestTotalProgressCountsForWorkerType:(signed __int16)a3 states:(id)a4 completion:(id)a5;
- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 completionHandler:(id)a4;
- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4;
- (void)runPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5;
- (void)runShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8;
- (void)setAvailabilityObservers:(id)a3;
- (void)setChangeNotificationInfo:(id)a3;
- (void)setChangeRequest:(id)a3 forUUID:(id)a4;
- (void)setClearsOIDCacheAfterFetchResultDealloc:(BOOL)a3;
- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4;
- (void)setCustomLibrarySpecificFetchOptions:(id)a3;
- (void)setImageConversionServiceClient:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setKeepOriginalsEnabled:(BOOL)a3;
- (void)setPerformChangesRequest:(id)a3;
- (void)setPostsPersistentHistoryChangedNotifications:(BOOL)a3;
- (void)setTransactionQueue:(id)a3;
- (void)setUnavailabilityReason:(id)a3;
- (void)setUnknownMergeEvent:(BOOL)a3;
- (void)setVideoConversionServiceClient:(id)a3;
- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3;
- (void)simulateMemoriesNotificationWithOptions:(id)a3 reply:(id)a4;
- (void)statusDidChange:(id)a3;
- (void)unregisterAvailabilityObserver:(id)observer;
- (void)unregisterChangeObserver:(id)observer;
- (void)unregisterFetchResult:(id)a3;
@end

@implementation PHPhotoLibrary

- (int64_t)wellKnownPhotoLibraryIdentifier
{
  return self->_wellKnownPhotoLibraryIdentifier;
}

- (id)fetchedObjectsForOIDs:(id)a3 propertySetClass:(Class)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  uint64_t v5 = [v36 count];
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5)
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v34 setName:@"objectID"];
    v7 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    [v34 setExpression:v7];

    [v34 setExpressionResultType:2000];
    v59[0] = v34;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
    uint64_t v8 = [(objc_class *)a4 propertiesToFetch];
    v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = v6;
    }
    id v32 = v10;

    v30 = [v33 arrayByAddingObjectsFromArray:v32];
    v31 = [(objc_class *)a4 entityName];
    v37 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v31];
    if ([(objc_class *)a4 useNoIndexSelf]) {
      v11 = @"noindex:(self) IN %@";
    }
    else {
      v11 = @"self IN %@";
    }
    v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v11, v36);
    [v37 setPredicate:v12];

    [v37 setPropertiesToFetch:v30];
    [v37 setResultType:2];
    [v37 setAllocationType:1];
    v35 = [(objc_class *)a4 propertiesToSortBy];
    if ([v35 count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count"));
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v14 = v35;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v54 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*(void *)(*((void *)&v53 + 1) + 8 * i) ascending:1];
            [v13 addObject:v18];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v15);
      }

      [v37 setSortDescriptors:v13];
    }
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__20217;
    v51 = __Block_byref_object_dispose__20218;
    id v52 = 0;
    if ([(objc_class *)a4 useObjectFetchingContext]) {
      [(PHPhotoLibrary *)self objectFetchingContextForCurrentQueueQoS];
    }
    else {
    v19 = [(PHPhotoLibrary *)self managedObjectContextForCurrentQueueQoS];
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __57__PHPhotoLibrary_fetchedObjectsForOIDs_propertySetClass___block_invoke;
    v43[3] = &unk_1E5848318;
    v46 = &v47;
    id v20 = v19;
    id v44 = v20;
    id v45 = v37;
    [v20 performBlockAndWait:v43];

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v36, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = (id)v48[5];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v57 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v26 = [v25 valueAtIndex:0];
          v27 = +[PHPhotoLibrary uniquedOID:v26];

          v28 = (void *)[[a4 alloc] initWithObjectID:v27 knownKeysDictionary:v25 photoLibrary:self];
          [v6 addObject:v28];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v57 count:16];
      }
      while (v22);
    }

    _Block_object_dispose(&v47, 8);
  }

  return v6;
}

+ (id)uniquedOID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 uniqueObjectIDCache];
  id v6 = v4;
  if (v5)
  {
    [v5 _verifyObjectIDIsTagged:v6];
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)uniqueObjectIDCache
{
  pl_dispatch_once();
  v2 = (void *)uniqueObjectIDCache_pl_once_object_78;

  return v2;
}

void __98__PHPhotoLibrary_fetchDictionariesByPHClassForOIDs_propertyHint_includeTrash_overrideWithPHClass___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v2)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v5 = [*(id *)(a1 + 32) objectForKey:v4];
        id v6 = (void *)MEMORY[0x1E4F1C0D0];
        id v7 = [v4 managedEntityName];
        uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

        v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v5];
        if (!*(unsigned char *)(a1 + 72) && [v4 managedObjectSupportsTrashedState])
        {
          v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(trashedState) == %d", 0);
          v11 = (void *)MEMORY[0x1E4F28BA0];
          v31[0] = v9;
          v31[1] = v10;
          v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
          uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];

          v9 = (void *)v13;
        }
        [v8 setPredicate:v9];
        id v14 = [v4 propertiesToFetchWithHint:*(void *)(a1 + 64)];
        [v8 setPropertiesToFetch:v14];

        [v8 setResultType:2];
        uint64_t v15 = *(void **)(a1 + 40);
        id v22 = 0;
        uint64_t v16 = [v15 executeFetchRequest:v8 error:&v22];
        id v17 = v22;
        if (!v16)
        {
          v18 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138412546;
            id v28 = v17;
            __int16 v29 = 2114;
            uint64_t v30 = v19;
            _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "error: %@ while building fetch dictionaries from OIDs: %{public}@", buf, 0x16u);
          }
        }
        [*(id *)(a1 + 56) setObject:v16 forKey:v4];
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v2);
  }
}

+ (Class)classForFetchType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

- (id)managedObjectContextForCurrentQueueQoS
{
  uint64_t v2 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  v3 = [v2 managedObjectContext];

  return v3;
}

- (PLPhotoLibrary)userInitiatedQueuePhotoLibrary
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM]) {
    [(PHPhotoLibrary *)self pl_photoLibraryForCMM];
  }
  else {
  v3 = [(PLLazyObject *)self->_lazyUserInitiatedQueuePhotoLibrary objectValue];
  }

  return (PLPhotoLibrary *)v3;
}

- (id)photoLibraryForCurrentQueueQoS
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM])
  {
    v3 = [(PHPhotoLibrary *)self pl_photoLibraryForCMM];
  }
  else
  {
    qos_class_t v4 = qos_class_self();
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v3 = [(PHPhotoLibrary *)self mainQueuePhotoLibrary];
    }
    else
    {
      if (v4 < QOS_CLASS_USER_INITIATED) {
        [(PHPhotoLibrary *)self backgroundQueuePhotoLibrary];
      }
      else {
      v3 = [(PHPhotoLibrary *)self userInitiatedQueuePhotoLibrary];
      }
    }
  }

  return v3;
}

- (BOOL)isPHPhotoLibraryForCMM
{
  return [(PHPhotoLibrary *)self type] == 1;
}

- (unsigned)type
{
  return self->_type;
}

- (void)registerFetchResult:(id)a3
{
}

+ (id)uniquedOIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 uniqueObjectIDCache];
  id v6 = -[PHUniqueObjectIDCache uniquedOIDs:](v5, v4);

  return v6;
}

- (id)allowedEntities
{
  id v2 = (id)[(PHPhotoLibrary *)self type];
  if (v2 == 1)
  {
    pl_dispatch_once();
    v3 = &allowedEntities_pl_once_object_80;
  }
  else
  {
    if (v2) {
      goto LABEL_6;
    }
    pl_dispatch_once();
    v3 = &allowedEntities_pl_once_object_79;
  }
  id v2 = (id)*v3;
LABEL_6:

  return v2;
}

- (PLPhotoLibrary)backgroundQueuePhotoLibrary
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM]) {
    [(PHPhotoLibrary *)self pl_photoLibraryForCMM];
  }
  else {
  v3 = [(PLLazyObject *)self->_lazyBackgroundQueuePhotoLibrary objectValue];
  }

  return (PLPhotoLibrary *)v3;
}

- (id)fetchDictionariesByPHClassForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5 overrideWithPHClass:(Class)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  if ([v10 count])
  {
    unint64_t v28 = a4;
    BOOL v29 = a5;
    v31 = v11;
    v27 = [(PHPhotoLibrary *)self objectFetchingContextForCurrentQueueQoS];
    v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v30 = v10;
    obuint64_t j = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v18 = [v17 entity];
          uint64_t v19 = v18;
          id v20 = a6;
          if (!a6)
          {
            uint64_t v21 = [v18 name];
            id v20 = +[PHPhotoLibrary PHObjectClassForEntityName:v21];
          }
          id v22 = [v12 objectForKey:v20];
          if (v22)
          {
            long long v23 = v22;
            [v22 addObject:v17];
          }
          else
          {
            long long v23 = [MEMORY[0x1E4F1CA48] arrayWithObject:v17];
            [v12 setObject:v23 forKey:v20];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);
    }

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __98__PHPhotoLibrary_fetchDictionariesByPHClassForOIDs_propertyHint_includeTrash_overrideWithPHClass___block_invoke;
    v33[3] = &unk_1E5844E38;
    BOOL v39 = v29;
    unint64_t v38 = v28;
    id v34 = v12;
    id v35 = v27;
    id v36 = obj;
    v11 = v31;
    id v37 = v31;
    id v24 = v27;
    id v25 = v12;
    [v24 performBlockAndWait:v33];

    id v10 = v30;
  }

  return v11;
}

+ (Class)PHObjectClassForEntityName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 PHObjectClassesByEntityName];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

+ (id)PHObjectClassesByEntityName
{
  if (PHObjectClassesByEntityName_onceToken != -1) {
    dispatch_once(&PHObjectClassesByEntityName_onceToken, &__block_literal_global_390);
  }
  id v2 = (void *)PHObjectClassesByEntityName_nameToClass;

  return v2;
}

- (id)fetchPHObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5 overrideResultsWithClass:(Class)a6
{
  BOOL v6 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v34 = [MEMORY[0x1E4F8A858] entity];
  id v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v16 = [v15 entity];
        int v17 = [v16 isKindOfEntity:v34];

        if (v17) {
          v18 = v33;
        }
        else {
          v18 = v35;
        }
        [v18 addObject:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v12);
  }

  BOOL v29 = v6;
  [(PHPhotoLibrary *)self fetchDictionariesByPHClassForOIDs:v35 propertyHint:a4 includeTrash:v6 overrideWithPHClass:a6];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [v37 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v36)
  {
    uint64_t v32 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(v37);
        }
        id v20 = *(objc_class **)(*((void *)&v42 + 1) + 8 * j);
        uint64_t v21 = [v37 objectForKey:v20];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v39;
          if (a6) {
            id v20 = a6;
          }
          do
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v39 != v24) {
                objc_enumerationMutation(v21);
              }
              long long v26 = (void *)[[v20 alloc] initWithFetchDictionary:*(void *)(*((void *)&v38 + 1) + 8 * k) propertyHint:a4 photoLibrary:self];
              [v10 addObject:v26];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }
          while (v23);
        }
      }
      uint64_t v36 = [v37 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v36);
  }
  if ([v33 count])
  {
    v27 = [(PHPhotoLibrary *)self _graphBasedPHObjectsForOIDs:v33 propertyHint:2 includeTrash:v29];
    [v10 addObjectsFromArray:v27];
  }

  return v10;
}

- (id)objectFetchingContextForCurrentQueueQoS
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3 = [(PHPhotoLibrary *)self mainQueueManagedObjectContext];
  }
  else
  {
    id v4 = [(PHPhotoLibrary *)self backgroundQueueObjectFetchingPhotoLibrary];
    v3 = [v4 managedObjectContext];
  }

  return v3;
}

- (PLPhotoLibrary)backgroundQueueObjectFetchingPhotoLibrary
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM]) {
    [(PHPhotoLibrary *)self pl_photoLibraryForCMM];
  }
  else {
  v3 = [(PLLazyObject *)self->_lazyBackgroundQueueObjectFetchingPhotoLibrary objectValue];
  }

  return (PLPhotoLibrary *)v3;
}

- (id)mainQueueManagedObjectContext
{
  id v2 = [(PHPhotoLibrary *)self mainQueuePhotoLibrary];
  v3 = [v2 managedObjectContext];

  return v3;
}

- (PLPhotoLibrary)mainQueuePhotoLibrary
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM]) {
    [(PHPhotoLibrary *)self pl_photoLibraryForCMM];
  }
  else {
  v3 = [(PLLazyObject *)self->_lazyMainQueuePhotoLibrary objectValue];
  }

  return (PLPhotoLibrary *)v3;
}

- (id)librarySpecificFetchOptions
{
  v3 = objc_opt_new();
  id v4 = v3;
  if (self->_customLibrarySpecificFetchOptions) {
    objc_msgSend(v3, "mergeWithFetchOptions:");
  }
  [v4 setPhotoLibrary:self];

  return v4;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  return [(PLCPLSettingsObserver *)self->_cplSettingsObserver isCloudPhotoLibraryEnabled];
}

- (id)libraryID
{
  id v2 = [(PLPhotoLibraryBundle *)self->_photoLibraryBundle pathManager];
  v3 = PLLibraryIDFromPathManager();

  return v3;
}

+ (BOOL)isMultiLibraryModeEnabled
{
  return [MEMORY[0x1E4F8B980] isMultiLibraryModeEnabled];
}

+ (BOOL)checkAuthorizationStatusForAPIAccessLevel:(int64_t)a3 suppressPrompt:(BOOL)a4
{
  uint64_t v5 = [a1 _photosAccessAllowedForAccessLevel:a3];
  if (!v5) {
    return 1;
  }
  if (v5 == 4)
  {
    if (!a4)
    {
      BOOL v6 = [MEMORY[0x1E4F8B998] sharedInstance];
      [v6 presentAsyncPromptForLimitedLibraryPickerIfNeeded];
    }
    return 1;
  }
  return 0;
}

+ (int64_t)_photosAccessAllowedForAccessLevel:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F8B998] sharedInstance];
  uint64_t v5 = v4;
  if (a3 == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 7;
  }
  int64_t v7 = [v4 photosAccessAllowedWithScope:v6];

  return v7;
}

+ (BOOL)checkAuthorizationStatusForAPIAccessLevel:(int64_t)a3
{
  return [a1 checkAuthorizationStatusForAPIAccessLevel:a3 suppressPrompt:0];
}

void __45__PHPhotoLibrary_PHObjectClassesByEntityName__block_invoke()
{
  v10[28] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Asset";
  v10[0] = objc_opt_class();
  v0 = [MEMORY[0x1E4F8A950] entityName];
  v9[1] = v0;
  v10[1] = objc_opt_class();
  v9[2] = @"Album";
  v10[2] = objc_opt_class();
  v1 = [MEMORY[0x1E4F8A848] entityName];
  v9[3] = v1;
  v10[3] = objc_opt_class();
  v9[4] = @"FetchingAlbum";
  v10[4] = objc_opt_class();
  v9[5] = @"CloudSharedAlbum";
  v10[5] = objc_opt_class();
  v9[6] = @"CloudSharedAlbumInvitationRecord";
  v10[6] = objc_opt_class();
  v9[7] = @"LegacyFaceAlbum";
  v10[7] = objc_opt_class();
  v9[8] = @"PhotoStreamAlbum";
  v10[8] = objc_opt_class();
  v9[9] = @"Folder";
  v10[9] = objc_opt_class();
  v9[10] = @"Moment";
  v10[10] = objc_opt_class();
  v9[11] = @"MomentList";
  v10[11] = objc_opt_class();
  v9[12] = @"DetectedFace";
  v10[12] = objc_opt_class();
  v9[13] = @"Person";
  v10[13] = objc_opt_class();
  v9[14] = @"DetectedFaceGroup";
  v10[14] = objc_opt_class();
  v9[15] = @"Memory";
  v10[15] = objc_opt_class();
  v9[16] = @"FaceCrop";
  v10[16] = objc_opt_class();
  v9[17] = @"PhotosHighlight";
  v10[17] = objc_opt_class();
  v9[18] = @"MomentShare";
  v10[18] = objc_opt_class();
  v9[19] = @"LibraryScope";
  v10[19] = objc_opt_class();
  v9[20] = @"ShareParticipant";
  v10[20] = objc_opt_class();
  v9[21] = @"CloudSharedComment";
  v10[21] = objc_opt_class();
  v9[22] = @"Suggestion";
  v10[22] = objc_opt_class();
  v9[23] = @"ImportSession";
  v10[23] = objc_opt_class();
  v9[24] = @"ProjectAlbum";
  v10[24] = objc_opt_class();
  v9[25] = @"Keyword";
  v10[25] = objc_opt_class();
  v9[26] = @"Question";
  v10[26] = objc_opt_class();
  v9[27] = @"DuplicateAlbum";
  v10[27] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:28];

  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v5 = [v2 allKeys];
  uint64_t v6 = [v4 sharedKeySetForKeys:v5];
  int64_t v7 = [v3 dictionaryWithSharedKeySet:v6];

  [v7 addEntriesFromDictionary:v2];
  uint64_t v8 = (void *)PHObjectClassesByEntityName_nameToClass;
  PHObjectClassesByEntityName_nameToClass = (uint64_t)v7;
}

+ (const)systemPhotoLibraryURLChangeNotificationName
{
  return (const char *)*MEMORY[0x1E4F8C580];
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = +[PHQuery fetchRootFolderIDForAlbumKind:3999 photoLibrary:WeakRetained];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)bfa_fetchObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 overrideResultsWithClass:(Class)a5
{
  return [(PHPhotoLibrary *)self fetchPHObjectsForOIDs:a3 propertyHint:a4 includeTrash:1 overrideResultsWithClass:a5];
}

- (void)unregisterFetchResult:(id)a3
{
}

- (id)searchIndex
{
  return (id)[(PLLazyObject *)self->_lazySearchIndex objectValue];
}

- (void)registerChangeObserver:(id)observer
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = observer;
  if (v4)
  {
    PHAuthorizationStatus v5 = +[PHPhotoLibrary authorizationStatusForAccessLevel:2];
    v11[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(PHPhotoLibrary *)self _addObservers:v6 authorizationStatus:v5];

    if ((unint64_t)(v5 - 3) > 1)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __41__PHPhotoLibrary_registerChangeObserver___block_invoke;
      v9[3] = &unk_1E5844BC0;
      v9[4] = self;
      +[PHPhotoLibrary requestAuthorizationForAccessLevel:2 handler:v9];
    }
    else
    {
      int64_t v7 = [(PHPhotoLibrary *)self photoLibrary];
      if (!v7)
      {
        uint64_t v8 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Unexpected error, could not access photo library", buf, 2u);
        }
      }
    }
  }
}

- (void)_addObservers:(id)a3 authorizationStatus:(int64_t)a4
{
}

+ (PHAuthorizationStatus)authorizationStatusForAccessLevel:(PHAccessLevel)accessLevel
{
  unint64_t v3 = [a1 _photosAccessAllowedForAccessLevel:accessLevel];
  if (v3 > 4) {
    return 0;
  }
  else {
    return qword_19B2CCB10[v3];
  }
}

- (id)pathManager
{
  return (id)[(PLPhotoLibraryBundle *)self->_photoLibraryBundle pathManager];
}

- (PLPhotoLibrary)photoLibrary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PHPhotoLibrary *)self _lazyPhotoLibrary];
  id v4 = [v3 objectValue];
  if (!v4)
  {
    PHAuthorizationStatus v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [(PHPhotoLibrary *)self debugDescription];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "Unable to create PLPhotoLibrary for PHPhotoLibrary: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return (PLPhotoLibrary *)v4;
}

- (id)_lazyPhotoLibrary
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM])
  {
    unint64_t v3 = +[PHPhotoLibrary sharedLazyPhotoLibraryForCMM];
  }
  else
  {
    unint64_t v3 = self->_lazyPhotoLibrary;
  }

  return v3;
}

- (PLCacheMetricsCollectorClient)cacheMetricsCollector
{
  return (PLCacheMetricsCollectorClient *)[(PLLazyObject *)self->_lazyCacheMetricsCollectorClient objectValue];
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    unint64_t v3 = newPhotoLibrary((uint64_t)"PHPhotoLibraryUserInitiatedQoS", a1[4], a1[5]);
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    unint64_t v3 = newPhotoLibrary((uint64_t)"PHPhotoLibraryMainQueueQoS", a1[4], a1[5]);
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_6(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    unint64_t v3 = newPhotoLibrary((uint64_t)"PHPhotoLibraryBackgroundQueueObjectFetching", a1[4], a1[5]);
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    unint64_t v3 = newPhotoLibrary((uint64_t)"PHPhotoLibraryBackgroundQueueQoS", a1[4], a1[5]);
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    unint64_t v3 = newPhotoLibrary((uint64_t)"PHPhotoLibrary", a1[4], a1[5]);
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)initSharedLibrary
{
  unint64_t v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  id v4 = [(PHPhotoLibrary *)self initWithPhotoLibraryURL:v3 type:0];

  return v4;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = [WeakRetained _initializeAppPrivateData];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)_initializeAppPrivateData
{
  id v4 = (void *)MEMORY[0x1E4F8AA78];
  PHAuthorizationStatus v5 = [(PHPhotoLibrary *)self photoLibraryBundle];
  if ([v4 shouldTryFastPathWithLibraryBundle:v5]) {
    goto LABEL_2;
  }
  uint64_t v6 = [(PHPhotoLibrary *)self photoLibrary];

  if (!v6)
  {
    PHAuthorizationStatus v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:671 description:@"Library open required to be called before creating AppPrivateData"];
LABEL_2:
  }
  int64_t v7 = [[PHPhotoLibraryAppPrivateData alloc] initWithLibrary:self];

  return v7;
}

- (PLPhotoLibraryBundle)photoLibraryBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 344, 1);
}

- (PHPhotoLibrary)initWithPhotoLibraryURL:(id)a3 type:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F8AA90];
  id v7 = a3;
  int v8 = [v6 sharedBundleController];
  id v9 = [v8 openBundleAtLibraryURL:v7];

  uint64_t v10 = [(PHPhotoLibrary *)self initWithPhotoLibraryBundle:v9 type:v4];
  return v10;
}

- (PHPhotoLibrary)initWithPhotoLibraryBundle:(id)a3 type:(unsigned __int16)a4
{
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v189.receiver = self;
  v189.super_class = (Class)PHPhotoLibrary;
  int v8 = [(PHPhotoLibrary *)&v189 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.PHPhotoLibrary.changes", 0);
    transactionQueue = v8->_transactionQueue;
    v8->_transactionQueue = (OS_dispatch_queue *)v9;

    v8->_type = a4;
    uint64_t v11 = objc_alloc_init(PHPerformChangesRequest);
    performChangesRequest = v8->_performChangesRequest;
    v8->_performChangesRequest = v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    availabilityObservers = v8->_availabilityObservers;
    v8->_availabilityObservers = (NSHashTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    changeNotificationInfo = v8->_changeNotificationInfo;
    v8->_changeNotificationInfo = (NSMutableDictionary *)v15;

    int v17 = [v7 libraryURL];
    uint64_t v18 = [v17 copy];
    photoLibraryURL = v8->_photoLibraryURL;
    v8->_photoLibraryURL = (NSURL *)v18;

    v8->_wellKnownPhotoLibraryIdentifier = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryIdentifierForURL:v8->_photoLibraryURL];
    objc_storeStrong((id *)&v8->_photoLibraryBundle, a3);
    id v20 = objc_alloc_init(_TtC6Photos27PHDatabaseStatisticsTracker);
    objc_storeStrong((id *)&v8->_databaseStatisticsTracker, v20);
    id v21 = objc_initWeak((id *)location, v8);

    id v22 = objc_alloc(MEMORY[0x1E4F8B948]);
    v185[0] = MEMORY[0x1E4F143A8];
    v185[1] = 3221225472;
    v185[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke;
    v185[3] = &unk_1E5844C88;
    objc_copyWeak(&v188, (id *)location);
    id v23 = v7;
    id v186 = v23;
    uint64_t v24 = v20;
    v187 = v24;
    uint64_t v25 = [v22 initWithRetriableBlock:v185];

    objc_destroyWeak(&v188);
    objc_destroyWeak((id *)location);
    lazyPhotoLibrary = v8->_lazyPhotoLibrary;
    v8->_lazyPhotoLibrary = (PLLazyObject *)v25;

    id v27 = objc_initWeak((id *)location, v8);
    id v28 = objc_alloc(MEMORY[0x1E4F8B948]);
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2;
    v181[3] = &unk_1E5844C88;
    objc_copyWeak(&v184, (id *)location);
    id v29 = v23;
    id v182 = v29;
    id v30 = v24;
    v183 = v30;
    uint64_t v31 = [v28 initWithRetriableBlock:v181];

    objc_destroyWeak(&v184);
    objc_destroyWeak((id *)location);
    lazyMainQueueConcurrencyPhotoLibrary = v8->_lazyMainQueueConcurrencyPhotoLibrary;
    v8->_lazyMainQueueConcurrencyPhotoLibrary = (PLLazyObject *)v31;

    id v33 = objc_initWeak((id *)location, v8);
    id v34 = objc_alloc(MEMORY[0x1E4F8B948]);
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3;
    v177[3] = &unk_1E5844C88;
    objc_copyWeak(&v180, (id *)location);
    id v35 = v29;
    id v178 = v35;
    uint64_t v36 = v30;
    v179 = v36;
    uint64_t v37 = [v34 initWithRetriableBlock:v177];

    objc_destroyWeak(&v180);
    objc_destroyWeak((id *)location);
    lazyMainQueuePhotoLibrary = v8->_lazyMainQueuePhotoLibrary;
    v8->_lazyMainQueuePhotoLibrary = (PLLazyObject *)v37;

    id v39 = objc_initWeak((id *)location, v8);
    id v40 = objc_alloc(MEMORY[0x1E4F8B948]);
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4;
    v173[3] = &unk_1E5844C88;
    objc_copyWeak(&v176, (id *)location);
    id v41 = v35;
    id v174 = v41;
    long long v42 = v36;
    v175 = v42;
    uint64_t v43 = [v40 initWithRetriableBlock:v173];

    objc_destroyWeak(&v176);
    objc_destroyWeak((id *)location);
    lazyBackgroundQueuePhotoLibrary = v8->_lazyBackgroundQueuePhotoLibrary;
    v8->_lazyBackgroundQueuePhotoLibrary = (PLLazyObject *)v43;

    id v45 = objc_initWeak((id *)location, v8);
    id v46 = objc_alloc(MEMORY[0x1E4F8B948]);
    v169[0] = MEMORY[0x1E4F143A8];
    v169[1] = 3221225472;
    v169[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5;
    v169[3] = &unk_1E5844C88;
    objc_copyWeak(&v172, (id *)location);
    id v47 = v41;
    id v170 = v47;
    long long v48 = v42;
    v171 = v48;
    uint64_t v49 = [v46 initWithRetriableBlock:v169];

    objc_destroyWeak(&v172);
    objc_destroyWeak((id *)location);
    lazyUserInitiatedQueuePhotoLibrary = v8->_lazyUserInitiatedQueuePhotoLibrary;
    v8->_lazyUserInitiatedQueuePhotoLibrary = (PLLazyObject *)v49;

    id v51 = objc_initWeak((id *)location, v8);
    id v52 = objc_alloc(MEMORY[0x1E4F8B948]);
    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_6;
    v165[3] = &unk_1E5844C88;
    objc_copyWeak(&v168, (id *)location);
    id v53 = v47;
    id v166 = v53;
    long long v54 = v48;
    v167 = v54;
    uint64_t v55 = [v52 initWithRetriableBlock:v165];

    objc_destroyWeak(&v168);
    objc_destroyWeak((id *)location);
    lazyBackgroundQueueObjectFetchingPhotoLibrary = v8->_lazyBackgroundQueueObjectFetchingPhotoLibrary;
    v8->_lazyBackgroundQueueObjectFetchingPhotoLibrary = (PLLazyObject *)v55;

    id v57 = objc_initWeak((id *)location, v8);
    id v58 = objc_alloc(MEMORY[0x1E4F8B948]);
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_7;
    v161[3] = &unk_1E5844C88;
    objc_copyWeak(&v164, (id *)location);
    id v59 = v53;
    id v162 = v59;
    v60 = v54;
    v163 = v60;
    uint64_t v61 = [v58 initWithRetriableBlock:v161];

    objc_destroyWeak(&v164);
    objc_destroyWeak((id *)location);
    lazyGraphObjectFetchingPhotoLibrary = v8->_lazyGraphObjectFetchingPhotoLibrary;
    v8->_lazyGraphObjectFetchingPhotoLibrary = (PLLazyObject *)v61;

    id v63 = objc_initWeak((id *)location, v8);
    id v64 = objc_alloc(MEMORY[0x1E4F8B948]);
    v157[0] = MEMORY[0x1E4F143A8];
    v157[1] = 3221225472;
    v157[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_8;
    v157[3] = &unk_1E5844C88;
    objc_copyWeak(&v160, (id *)location);
    id v65 = v59;
    id v158 = v65;
    v66 = v60;
    v159 = v66;
    uint64_t v67 = [v64 initWithRetriableBlock:v157];

    objc_destroyWeak(&v160);
    objc_destroyWeak((id *)location);
    lazyChangeHandlingPhotoLibrary = v8->_lazyChangeHandlingPhotoLibrary;
    v8->_lazyChangeHandlingPhotoLibrary = (PLLazyObject *)v67;

    id v69 = objc_initWeak((id *)location, v8);
    id v70 = objc_alloc(MEMORY[0x1E4F8B948]);
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_9;
    v155[3] = &unk_1E5847760;
    objc_copyWeak(&v156, (id *)location);
    uint64_t v71 = [v70 initWithBlock:v155];
    objc_destroyWeak(&v156);
    objc_destroyWeak((id *)location);
    lazyAlbumRootFolderObjectID = v8->_lazyAlbumRootFolderObjectID;
    v8->_lazyAlbumRootFolderObjectID = (PLLazyObject *)v71;

    id v73 = objc_initWeak((id *)location, v8);
    id v74 = objc_alloc(MEMORY[0x1E4F8B948]);
    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_10;
    v153[3] = &unk_1E5847760;
    objc_copyWeak(&v154, (id *)location);
    uint64_t v75 = [v74 initWithBlock:v153];
    objc_destroyWeak(&v154);
    objc_destroyWeak((id *)location);
    lazyProjectAlbumRootFolderObjectID = v8->_lazyProjectAlbumRootFolderObjectID;
    v8->_lazyProjectAlbumRootFolderObjectID = (PLLazyObject *)v75;

    id v77 = objc_initWeak((id *)location, v8);
    id v78 = objc_alloc(MEMORY[0x1E4F8B948]);
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_11;
    v151[3] = &unk_1E5847760;
    objc_copyWeak(&v152, (id *)location);
    uint64_t v79 = [v78 initWithBlock:v151];
    objc_destroyWeak(&v152);
    objc_destroyWeak((id *)location);
    lazyAppPrivateData = v8->_lazyAppPrivateData;
    v8->_lazyAppPrivateData = (PLLazyObject *)v79;

    id v81 = objc_initWeak((id *)location, v8);
    id v82 = objc_alloc(MEMORY[0x1E4F8B948]);
    v149[0] = MEMORY[0x1E4F143A8];
    v149[1] = 3221225472;
    v149[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_12;
    v149[3] = &unk_1E5847760;
    objc_copyWeak(&v150, (id *)location);
    uint64_t v83 = [v82 initWithBlock:v149];
    objc_destroyWeak(&v150);
    objc_destroyWeak((id *)location);
    lazyPhotoLibraryIdentifier = v8->_lazyPhotoLibraryIdentifier;
    v8->_lazyPhotoLibraryIdentifier = (PLLazyObject *)v83;

    id v85 = objc_initWeak((id *)location, v8);
    id v86 = objc_alloc(MEMORY[0x1E4F8B948]);
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_13;
    v147[3] = &unk_1E5847760;
    objc_copyWeak(&v148, (id *)location);
    uint64_t v87 = [v86 initWithBlock:v147];
    objc_destroyWeak(&v148);
    objc_destroyWeak((id *)location);
    lazySearchIndex = v8->_lazySearchIndex;
    v8->_lazySearchIndex = (PLLazyObject *)v87;

    dispatch_queue_t v89 = dispatch_queue_create("com.apple.PHPhotoLibrary.isolation", 0);
    isolationQueue = v8->_isolationQueue;
    v8->_isolationQueue = (OS_dispatch_queue *)v89;

    if ([(PHPhotoLibrary *)v8 isSystemPhotoLibrary] && (PLIsAssetsd() & 1) == 0)
    {
      id v94 = objc_initWeak((id *)location, v8);

      id v95 = objc_alloc(MEMORY[0x1E4F8B948]);
      v145[0] = MEMORY[0x1E4F143A8];
      v145[1] = 3221225472;
      v145[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_14;
      v145[3] = &unk_1E5847760;
      objc_copyWeak(&v146, (id *)location);
      uint64_t v96 = [v95 initWithBlock:v145];
      objc_destroyWeak(&v146);
      objc_destroyWeak((id *)location);
      lazyCacheMetricsCollectorClient = v8->_lazyCacheMetricsCollectorClient;
      v8->_lazyCacheMetricsCollectorClient = (PLLazyObject *)v96;
    }
    else
    {
      v91 = PLCacheMetricsCollectorGetLog();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)location = 0;
        _os_log_impl(&dword_19B043000, v91, OS_LOG_TYPE_DEFAULT, "skipping initializing cacheMetrics collection in PHPhotoLibrary: not using system library or initializing in assetsd", location, 2u);
      }

      uint64_t v92 = [objc_alloc(MEMORY[0x1E4F8B948]) initWithObject:0];
      lazyCacheMetricsCollectorClient = v8->_lazyCacheMetricsCollectorClient;
      v8->_lazyCacheMetricsCollectorClient = (PLLazyObject *)v92;
    }

    id v97 = objc_initWeak((id *)location, v8);
    id v98 = objc_alloc(MEMORY[0x1E4F8B948]);
    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_253;
    v143[3] = &unk_1E5847760;
    objc_copyWeak(&v144, (id *)location);
    uint64_t v99 = [v98 initWithRetriableBlock:v143];
    objc_destroyWeak(&v144);
    objc_destroyWeak((id *)location);
    lazyCPLStatus = v8->_lazyCPLStatus;
    v8->_lazyCPLStatus = (PLLazyObject *)v99;

    id v101 = objc_initWeak((id *)location, v8);
    id v102 = objc_alloc(MEMORY[0x1E4F8B948]);
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2_254;
    v141[3] = &unk_1E5847760;
    objc_copyWeak(&v142, (id *)location);
    uint64_t v103 = [v102 initWithRetriableBlock:v141];
    objc_destroyWeak(&v142);
    objc_destroyWeak((id *)location);
    lazyIsReadyForAnalysis = v8->_lazyIsReadyForAnalysis;
    v8->_lazyIsReadyForAnalysis = (PLLazyObject *)v103;

    id v105 = objc_initWeak((id *)location, v8);
    id v106 = objc_alloc(MEMORY[0x1E4F8B948]);
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3_255;
    v139[3] = &unk_1E5847760;
    objc_copyWeak(&v140, (id *)location);
    uint64_t v107 = [v106 initWithRetriableBlock:v139];
    objc_destroyWeak(&v140);
    objc_destroyWeak((id *)location);
    lazyIsReadyForAnalysisQuickChecuint64_t k = v8->_lazyIsReadyForAnalysisQuickCheck;
    v8->_lazyIsReadyForAnalysisQuickChecuint64_t k = (PLLazyObject *)v107;

    id v109 = objc_initWeak((id *)location, v8);
    id v110 = objc_alloc(MEMORY[0x1E4F8B948]);
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4_256;
    v137[3] = &unk_1E5847760;
    objc_copyWeak(&v138, (id *)location);
    uint64_t v111 = [v110 initWithRetriableBlock:v137];
    objc_destroyWeak(&v138);
    objc_destroyWeak((id *)location);
    lazyIsReadyForAnalysisCPLInitialDownloadCompleted = v8->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted;
    v8->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted = (PLLazyObject *)v111;

    uint64_t v113 = [objc_alloc(MEMORY[0x1E4F8A6C8]) initWithLibraryBundle:v65];
    cplSettingsObserver = v8->_cplSettingsObserver;
    v8->_cplSettingsObserver = (PLCPLSettingsObserver *)v113;

    [(PLCPLSettingsObserver *)v8->_cplSettingsObserver setDelegate:v8];
    id v115 = objc_initWeak((id *)location, v8);

    id v116 = objc_alloc(MEMORY[0x1E4F8B948]);
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5_258;
    v135[3] = &unk_1E5847760;
    objc_copyWeak(&v136, (id *)location);
    uint64_t v117 = [v116 initWithBlock:v135];
    objc_destroyWeak(&v136);
    objc_destroyWeak((id *)location);
    lazyMainScopeIdentifier = v8->_lazyMainScopeIdentifier;
    v8->_lazyMainScopeIdentifier = (PLLazyObject *)v117;

    v119 = objc_alloc_init(PHChangeHandlingDebugger);
    changeHandlingDebugger = v8->_changeHandlingDebugger;
    v8->_changeHandlingDebugger = v119;

    v121 = [PHPhotoLibraryObserverRegistrar alloc];
    photoLibraryBundle = v8->_photoLibraryBundle;
    v123 = v8->_changeHandlingDebugger;
    v124 = +[PHPhotoLibrary uniqueObjectIDCache];
    uint64_t v125 = [(PHPhotoLibraryObserverRegistrar *)v121 initWithLibraryBundle:photoLibraryBundle changeHandlingDebugger:v123 uniqueObjectIDCache:v124];
    observerRegistrar = v8->_observerRegistrar;
    v8->_observerRegistrar = (PHPhotoLibraryObserverRegistrar *)v125;

    v127 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v127 addObserver:v8 selector:sel_handleMergeNotification_ name:*MEMORY[0x1E4F8AE10] object:0];

    if ([(PHPhotoLibrary *)v8 isSystemPhotoLibrary])
    {
      v128 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v129 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
      [v128 addObserver:v8 selector:sel_accountDidChange_ name:*MEMORY[0x1E4F8ACE8] object:v129];
    }
    uint64_t v130 = [objc_alloc(MEMORY[0x1E4F8A228]) initWithProvider:v8];
    stateCaptureHandler = v8->_stateCaptureHandler;
    v8->_stateCaptureHandler = (PFStateCaptureHandler *)v130;
  }
  v132 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v133 = objc_opt_class();
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v133;
    __int16 v191 = 2048;
    v192 = v8;
    __int16 v193 = 2112;
    id v194 = v7;
    _os_log_impl(&dword_19B043000, v132, OS_LOG_TYPE_DEBUG, "%@ %p initWithPhotoLibraryBundle:%@", location, 0x20u);
  }

  return v8;
}

- (BOOL)isSystemPhotoLibrary
{
  unint64_t v3 = objc_opt_class();
  uint64_t v4 = [(PHPhotoLibrary *)self photoLibraryURL];
  LOBYTE(v3) = [v3 isSystemPhotoLibraryURL:v4];

  return (char)v3;
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

+ (BOOL)isSystemPhotoLibraryURL:(id)a3
{
  return [MEMORY[0x1E4F8B980] isSystemPhotoLibraryURL:a3];
}

- (PHPhotoLibrary)initWithPhotoLibraryURL:(id)a3
{
  return [(PHPhotoLibrary *)self initWithPhotoLibraryURL:a3 type:0];
}

- (PHPhotoLibraryAppPrivateData)appPrivateData
{
  return (PHPhotoLibraryAppPrivateData *)[(PLLazyObject *)self->_lazyAppPrivateData objectValue];
}

+ (void)enableMultiLibraryMode
{
}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  id v2 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  unint64_t v3 = [v2 globalValues];
  char v4 = [v3 isInitialDuplicateDetectorProcessingCompleted];

  return v4;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F8A6E0]);
    unint64_t v3 = [WeakRetained assetsdClient];
    char v4 = (void *)[v2 initWithAssetsdClient:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (PLAssetsdClient)assetsdClient
{
  return (PLAssetsdClient *)[(PLPhotoLibraryBundle *)self->_photoLibraryBundle assetsdClient];
}

void __57__PHPhotoLibrary_fetchedObjectsForOIDs_propertySetClass___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (v5)
  {
    int v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "error %@", buf, 0xCu);
    }
  }
}

void __37__PHPhotoLibrary_uniqueObjectIDCache__block_invoke()
{
  v0 = objc_alloc_init(PHUniqueObjectIDCache);
  v1 = (void *)uniqueObjectIDCache_pl_once_object_78;
  uniqueObjectIDCache_pl_once_object_78 = (uint64_t)v0;
}

void __37__PHPhotoLibrary__sharedPhotoLibrary__block_invoke()
{
  id v0 = [[PHPhotoLibrary alloc] initSharedLibrary];
  v1 = (void *)sharedPhotoLibrary;
  sharedPhotoLibrary = (uint64_t)v0;
}

+ (PHPhotoLibrary)sharedPhotoLibrary
{
  [MEMORY[0x1E4F8B980] assertSingleLibraryMode];

  return (PHPhotoLibrary *)[a1 _sharedPhotoLibrary];
}

- (NSManagedObjectID)albumRootFolderObjectID
{
  return (NSManagedObjectID *)[(PLLazyObject *)self->_lazyAlbumRootFolderObjectID objectValue];
}

void __33__PHPhotoLibrary_allowedEntities__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [MEMORY[0x1E4F8A950] entityName];
  v1 = [MEMORY[0x1E4F8A848] entityName];
  objc_msgSend(v0, "setWithObjects:", v4, @"Album", v1, @"FetchingAlbum", @"CloudSharedAlbum", @"CloudSharedAlbumInvitationRecord", @"LegacyFaceAlbum", @"PhotoStreamAlbum", @"Folder", @"Moment", @"MomentList", @"DetectedFace", @"Person", @"DetectedFaceGroup", @"Memory", @"FaceCrop", @"PhotosHighlight",
    @"GraphNode",
    @"Suggestion",
    @"ImportSession",
    @"ProjectAlbum",
    @"Keyword",
    @"Question",
    @"LibraryScope",
    @"ShareParticipant",
    @"CloudSharedComment",
  uint64_t v2 = 0);
  uint64_t v3 = (void *)allowedEntities_pl_once_object_79;
  allowedEntities_pl_once_object_79 = v2;
}

+ (id)_sharedPhotoLibrary
{
  if (sharedPhotoLibraryOnceToken != -1) {
    dispatch_once(&sharedPhotoLibraryOnceToken, &__block_literal_global_20629);
  }
  uint64_t v2 = (void *)sharedPhotoLibrary;
  if (!sharedPhotoLibrary)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unable to create shared library" userInfo:0];
    objc_exception_throw(v4);
  }

  return v2;
}

- (BOOL)shouldMobileSlideShowLaunchWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  PLPhotoKitGetLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = v5;
  int v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ShouldMobileSlideShowLaunch", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (([MEMORY[0x1E4F8A9B0] shouldPromptUserForLibrarySchemaMismatch] & 1) == 0)
  {
    uint64_t v16 = v8;
    uint64_t v14 = v16;
    if (v9 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "Do not prompt";
    goto LABEL_12;
  }
  uint64_t v10 = [(PHPhotoLibrary *)self photoLibraryBundle];
  id v11 = [v10 persistentContainer];
  uint64_t v12 = [v11 sharedPersistentStoreCoordinator];

  if (!v12)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F8A9F0];
    id v20 = [(PHPhotoLibrary *)self photoLibraryBundle];
    id v21 = [v20 pathManager];
    id v36 = 0;
    int v17 = [v19 currentModelVersionMatchesLibrarySchemaVersionWithPathManager:v21 error:&v36];
    uint64_t v14 = v36;

    if ((v17 & 1) == 0)
    {
      id v22 = PLBackendGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v38 = v14;
        _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "shouldMobileSlideShowLaunchWithError: %@", buf, 0xCu);
      }

      if (PLIsErrorEqualToCode())
      {
        id v23 = PLBackendGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEFAULT, "Library requires upgrade. Calling openAndWaitWithUpgrade:YES", buf, 2u);
        }

        id v35 = 0;
        BOOL v24 = [(PHPhotoLibrary *)self openAndWaitWithUpgrade:1 error:&v35];
        uint64_t v14 = v35;
        if (v24)
        {
          uint64_t v25 = PLBackendGetLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEFAULT, "Library open (upgrade) succeeded, MobileSlideShow can proceed.", buf, 2u);
          }

          long long v26 = v8;
          if (v9 < 0xFFFFFFFFFFFFFFFELL)
          {
            id v27 = v26;
            if (os_signpost_enabled(v26))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_19B043000, v27, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", "Library open (upgrade) succeeded", buf, 2u);
            }
          }
          LOBYTE(v17) = 1;
        }
        else
        {
          uint64_t v32 = PLBackendGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v38 = v14;
            _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "Library upgrade failed with error %@", buf, 0xCu);
          }

          if (a3) {
            *a3 = v14;
          }
          id v33 = v8;
          if (v9 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            id v34 = v33;
            if (os_signpost_enabled(v33))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_19B043000, v34, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", "Library upgrade failed", buf, 2u);
            }
          }
          LOBYTE(v17) = 0;
        }
LABEL_42:

        goto LABEL_14;
      }
      id v28 = PHErrorFromPLError(v14);
      id v29 = v28;
      if (a3) {
        *a3 = v28;
      }
    }
    id v30 = v8;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v31 = v30;
      if (os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v17;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v31, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", "Result: %d", buf, 8u);
      }
    }
    goto LABEL_42;
  }
  uint64_t v13 = v8;
  uint64_t v14 = v13;
  if (v9 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13)) {
    goto LABEL_13;
  }
  *(_WORD *)buf = 0;
  uint64_t v15 = "Found shared PSC";
LABEL_12:
  _os_signpost_emit_with_name_impl(&dword_19B043000, v14, OS_SIGNPOST_INTERVAL_END, v6, "ShouldMobileSlideShowLaunch", v15, buf, 2u);
LABEL_13:
  LOBYTE(v17) = 1;
LABEL_14:

  return v17;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _initializeSearchIndex];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)isFaceProcessingFinished
{
  uint64_t v3 = PLAssetAnalysisGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "IsFaceProcessingFinished", (const char *)&unk_19B30018E, buf, 2u);
  }

  BOOL v7 = ![(PHPhotoLibrary *)self countOfUnprocessedFaceCrops]
    && ![(PHPhotoLibrary *)self countOfUnclusteredFaces]
    && ![(PHPhotoLibrary *)self countOfFaceCropsToBeGenerated];
  int v8 = v6;
  unint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "IsFaceProcessingFinished", (const char *)&unk_19B30018E, v11, 2u);
  }

  return v7;
}

- (unint64_t)countOfUnclusteredFaces
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLAssetAnalysisGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfUnclusteredFaces", (const char *)&unk_19B30018E, v14, 2u);
  }

  id v7 = [(PHPhotoLibrary *)self newUnclusteredFacesFetchOptions];
  [v7 setShouldPrefetchCount:1];
  v15[0] = @"PHFacePropertySetIdentifier";
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v7 setFetchPropertySets:v8];

  unint64_t v9 = +[PHFace fetchFacesWithOptions:v7];
  unint64_t v10 = [v9 count];
  id v11 = v6;
  uint64_t v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_END, v4, "CountOfUnclusteredFaces", (const char *)&unk_19B30018E, v14, 2u);
  }

  return v10;
}

- (unint64_t)countOfFaceCropsToBeGenerated
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLAssetAnalysisGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfFaceCropsToBeGenerated", (const char *)&unk_19B30018E, buf, 2u);
  }

  *(void *)buf = 0;
  id v20 = buf;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  id v7 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  int v8 = [v7 managedObjectContext];

  unint64_t v9 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__PHPhotoLibrary_AssetAnalysis__countOfFaceCropsToBeGenerated__block_invoke;
  v16[3] = &unk_1E5848D28;
  uint64_t v18 = buf;
  id v10 = v8;
  id v17 = v10;
  [v9 performBlockAndWait:v16];

  id v11 = v6;
  uint64_t v12 = v11;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
  {
    uint64_t v13 = *((void *)v20 + 3);
    *(_DWORD *)id v23 = 134217984;
    uint64_t v24 = v13;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_END, v4, "CountOfFaceCropsToBeGenerated", "count: %ld", v23, 0xCu);
  }

  unint64_t v14 = *((void *)v20 + 3);
  _Block_object_dispose(buf, 8);

  return v14;
}

- (id)_initializeSearchIndex
{
  uint64_t v2 = [[PHSearchIndex alloc] initWithPhotoLibrary:self];

  return v2;
}

- (NSString)uuid
{
  uint64_t v2 = [(PHPhotoLibrary *)self photoLibrary];
  uint64_t v3 = [v2 pathManager];
  os_signpost_id_t v4 = [v3 photoDirectoryWithType:1];

  return (NSString *)v4;
}

- (id)searchDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  os_signpost_id_t v6 = +[PHObject uuidFromLocalIdentifier:a3];
  id v7 = [(PHPhotoLibrary *)self photoLibrary];
  int v8 = [v7 assetsdClient];
  unint64_t v9 = [v8 debugClient];
  id v10 = [v9 requestSearchDebugInformationForAssetUUID:v6 error:a4];

  return v10;
}

- (BOOL)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetIdentifiers:(id)a4 resetOptions:(unint64_t)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v12 = [v11 photoKitClient];

  if (v12)
  {
    uint64_t v13 = objc_msgSend(v10, "_pl_map:", &__block_literal_global_2642);
    char v14 = [v12 resetStateForMediaProcessingTaskID:a3 assetUUIDs:v13 resetOptions:a5 error:a6];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    v21[0] = @"photokit client is nil";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v17 = [v15 errorWithDomain:@"PHPhotosErrorDomain" code:4302 userInfo:v16];
    uint64_t v18 = v17;
    if (a6) {
      *a6 = v17;
    }

    char v14 = 0;
  }

  return v14;
}

id __106__PHPhotoLibrary_MediaProcessing__resetStateForMediaProcessingTaskID_assetIdentifiers_resetOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PHObject uuidFromLocalIdentifier:a2];
}

- (id)_facesFetchOptionsForMediaProcessing
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PHPhotoLibrary *)self _baseFetchOptionsForMediaProcessing];
  v8[0] = @"PHFacePropertySetIdentifier";
  v8[1] = @"PHFacePropertySetCore";
  v8[2] = @"PHFacePropertySetClustering";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [v2 setFetchPropertySets:v3];

  os_signpost_id_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  id v7 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  [v2 setSortDescriptors:v5];

  [v2 setIncludeTorsoAndFaceDetectionData:1];
  [v2 setIncludedDetectionTypes:&unk_1EEB26850];

  return v2;
}

- (id)_baseFetchOptionsForMediaProcessing
{
  uint64_t v2 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
  [v2 setWantsIncrementalChangeDetails:0];

  return v2;
}

- (id)fetchFacesForMediaProcessingWithPersonLocalIdentifiers:(id)a3 inMoment:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PHPhotoLibrary *)self _facesFetchOptionsForMediaProcessing];
  unint64_t v9 = [(PHPhotoLibrary *)self _assetFetchOptionsForMediaProcessing];
  id v10 = +[PHAsset fetchAssetsInAssetCollection:v7 options:v9];

  id v11 = [v10 fetchedObjectIDs];
  if ([v11 count])
  {
    long long v26 = v10;
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in (%@)", @"assetForFace", v11];
    uint64_t v13 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = v6;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"any %K in %@", @"personForFace.personUUID", v13];
    uint64_t v21 = (void *)MEMORY[0x1E4F28BA0];
    v34[0] = v12;
    v34[1] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    id v23 = [v21 andPredicateWithSubpredicates:v22];

    [v8 setInternalPredicate:v23];
    uint64_t v24 = +[PHFace fetchFacesWithOptions:v8];

    id v6 = v27;
    id v10 = v26;
  }
  else
  {
    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v7;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Getting no object IDs when fetching assets on moment %@", buf, 0xCu);
    }
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)_propertySetsForTaskID:(unint64_t)a3
{
  v30[5] = *MEMORY[0x1E4F143B8];
  v30[0] = @"PHAssetPropertySetCharacterRecognition";
  v30[1] = @"PHAssetPropertySetFaceWorker";
  v30[2] = @"PHAssetPropertySetMediaAnalysis";
  v30[3] = @"PHAssetPropertySetSceneAnalysis";
  v30[4] = @"PHAssetPropertySetVisualSearch";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v6 addObject:@"PHAssetPropertySetOriginalMetadata"];
  switch(a3)
  {
    case 1uLL:
    case 0x11uLL:
      [v6 addObjectsFromArray:v5];
      v29[0] = @"PHAssetPropertySetMediaAnalysis";
      v29[1] = @"PHAssetPropertySetPhotoIris";
      v29[2] = @"PHAssetPropertySetSceneAnalysis";
      v29[3] = @"PHAssetPropertySetSceneprint";
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
      [v6 addObjectsFromArray:v7];

      if ([(PHPhotoLibrary *)self wellKnownPhotoLibraryIdentifier] == 3) {
        [v6 addObject:@"PHAssetPropertySetCuration"];
      }
      break;
    case 2uLL:
      [v6 addObjectsFromArray:v5];
      v28[0] = @"PHAssetPropertySetSceneAnalysis";
      v28[1] = @"PHAssetPropertySetIconicScore";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = (__CFString **)v28;
      goto LABEL_18;
    case 3uLL:
      [v6 addObjectsFromArray:v5];
      id v27 = @"PHAssetPropertySetFaceWorker";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = &v27;
      goto LABEL_16;
    case 4uLL:
      v25[0] = @"PHAssetPropertySetMediaAnalysis";
      v25[1] = @"PHAssetPropertySetPhotoIris";
      v25[2] = @"PHAssetPropertySetSceneAnalysis";
      v25[3] = @"PHAssetPropertySetSceneprint";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = (__CFString **)v25;
      goto LABEL_11;
    case 5uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      break;
    case 6uLL:
      v24[0] = @"PHAssetPropertySetMediaAnalysis";
      v24[1] = @"PHAssetPropertySetPhotoIris";
      v24[2] = @"PHAssetPropertySetSceneAnalysis";
      v24[3] = @"PHAssetPropertySetSceneprint";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = (__CFString **)v24;
LABEL_11:
      uint64_t v10 = 4;
      goto LABEL_19;
    case 7uLL:
      goto LABEL_6;
    case 8uLL:
      long long v26 = @"PHAssetPropertySetFaceWorker";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = &v26;
      goto LABEL_16;
    case 9uLL:
      id v23 = @"PHAssetPropertySetCloudLocalState";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = &v23;
      goto LABEL_16;
    case 0xAuLL:
      [v6 addObjectsFromArray:v5];
      v22[0] = @"PHAssetPropertySetCharacterRecognition";
      v22[1] = @"PHAssetPropertySetSceneAnalysis";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = (__CFString **)v22;
      goto LABEL_18;
    case 0xBuLL:
      uint64_t v21 = @"PHAssetPropertySetMediaAnalysis";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = &v21;
LABEL_16:
      uint64_t v10 = 1;
      goto LABEL_19;
    case 0xCuLL:
      [v6 addObjectsFromArray:v5];
      v20[0] = @"PHAssetPropertySetSceneAnalysis";
      v20[1] = @"PHAssetPropertySetVisualSearch";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = (__CFString **)v20;
      goto LABEL_18;
    case 0x10uLL:
    case 0x12uLL:
      v19[0] = @"PHAssetPropertySetSceneAnalysis";
      v19[1] = @"PHAssetPropertySetVisualSearch";
      int v8 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v9 = (__CFString **)v19;
LABEL_18:
      uint64_t v10 = 2;
LABEL_19:
      id v11 = [v8 arrayWithObjects:v9 count:v10];
      [v6 addObjectsFromArray:v11];

      break;
    default:
      if (a3 == 0x7FFFFFFF) {
LABEL_6:
      }
        [v6 addObjectsFromArray:v5];
      break;
  }
  uint64_t v12 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v15 = 134218242;
    unint64_t v16 = a3;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "PHMediaProcessingTaskID %tu using property sets:%{public}@", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v13 = [v6 allObjects];

  return v13;
}

- (BOOL)_shouldIncludeHiddenAssetsForTaskID:(unint64_t)a3
{
  return a3 == 9;
}

- (BOOL)_shouldIncludeTrashedAssetsForTaskID:(unint64_t)a3
{
  return ((a3 - 5) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)_shouldIncludeAllBurstAssetsForTaskID:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x12)
  {
    if (a3 != 0x7FFFFFFF)
    {
      id v5 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 134217984;
        unint64_t v7 = a3;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "PHMediaProcessingTaskID (%tu); defaulting to include all burst assets",
          (uint8_t *)&v6,
          0xCu);
      }
    }
    return 1;
  }
  return ((1 << a3) & 0x2E9F3) != 0;
}

- (BOOL)_shouldIncludeGuestAssetsForTaskID:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x12)
  {
    if (a3 != 0x7FFFFFFF)
    {
      id v5 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 134217984;
        unint64_t v7 = a3;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "PHMediaProcessingTaskID (%tu); defaulting to include guest assets",
          (uint8_t *)&v6,
          0xCu);
      }
    }
    return 1;
  }
  if (((1 << a3) & 0x7FDF7) != 0) {
    return 1;
  }
  if (a3 == 3) {
    return ![(PHPhotoLibrary *)self isSystemPhotoLibrary];
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldIncludeOnlyAssetsAllowedForAnalysisForTaskID:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 - 4 >= 0xF && a3 >= 3)
  {
    if (a3 == 3) {
      return 1;
    }
    if (a3 != 0x7FFFFFFF)
    {
      int v6 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        unint64_t v8 = a3;
        _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEFAULT, "PHMediaProcessingTaskID (%tu); defaulting to NOT only allowed for analysis assets",
          (uint8_t *)&v7,
          0xCu);
      }
    }
  }
  return 0;
}

- (BOOL)_isValidTaskID:(unint64_t)a3
{
  return a3 - 1 < 0x12 || a3 == 0x7FFFFFFF;
}

- (void)_setFetchLimit:(id)a3 forTaskID:(unint64_t)a4
{
  if (a4 == 16) {
    [a3 setFetchLimit:1000];
  }
}

- (void)_setSortDescriptors:(id)a3 forTaskID:(unint64_t)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a4)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0x12uLL:
      int v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assetDateCreated" ascending:0];
      id v11 = v6;
      int v7 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v8 = &v11;
      goto LABEL_5;
    case 0x10uLL:
      int v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
      v12[0] = v6;
      int v7 = (void *)MEMORY[0x1E4F1C978];
      unint64_t v8 = (void **)v12;
LABEL_5:
      uint64_t v9 = [v7 arrayWithObjects:v8 count:1];
      [v5 setInternalSortDescriptors:v9];
      break;
    default:
      int v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
      uint64_t v10 = v6;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      [v5 setSortDescriptors:v9];
      break;
  }
}

- (BOOL)_isOptimizedMediaProcessingTaskID:(unint64_t)a3
{
  return (a3 < 0x13) & (0x51400u >> a3);
}

- (id)fetchOptionsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 processed:(BOOL)a7 exactVersionMatch:(BOOL)a8 error:(id *)a9
{
  BOOL v10 = a7;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  if ([(PHPhotoLibrary *)self _isValidTaskID:a3])
  {
    int v15 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
    [v15 setIncludeAssetSourceTypes:5];
    if (v14) {
      unint64_t v16 = [[PHMediaProcessingAlgorithmVersionProvider alloc] initWithProvider:v14];
    }
    else {
      unint64_t v16 = 0;
    }
    if ([(PHPhotoLibrary *)self _isOptimizedMediaProcessingTaskID:a3])
    {
      uint64_t v25 = PLOptimizedInternalPredicateForMediaProcessingTaskID();
      [v15 setInternalPredicate:v25];

      [v15 setIsExclusivePredicate:1];
      long long v26 = [MEMORY[0x1E4F8A990] entityName];
      [v15 setRelatedEntityName:v26];

      [v15 setRelatedRelationshipProperty:@"asset"];
    }
    else
    {
      objc_msgSend(v15, "setIncludeAllBurstAssets:", -[PHPhotoLibrary _shouldIncludeAllBurstAssetsForTaskID:](self, "_shouldIncludeAllBurstAssetsForTaskID:", a3));
      objc_msgSend(v15, "setIncludeTrashedAssets:", -[PHPhotoLibrary _shouldIncludeTrashedAssetsForTaskID:](self, "_shouldIncludeTrashedAssetsForTaskID:", a3));
      objc_msgSend(v15, "setIncludeHiddenAssets:", -[PHPhotoLibrary _shouldIncludeHiddenAssetsForTaskID:](self, "_shouldIncludeHiddenAssetsForTaskID:", a3));
      objc_msgSend(v15, "setIncludeGuestAssets:", -[PHPhotoLibrary _shouldIncludeGuestAssetsForTaskID:](self, "_shouldIncludeGuestAssetsForTaskID:", a3));
      objc_msgSend(v15, "setIncludeOnlyAssetsAllowedForAnalysis:", -[PHPhotoLibrary _shouldIncludeOnlyAssetsAllowedForAnalysisForTaskID:](self, "_shouldIncludeOnlyAssetsAllowedForAnalysisForTaskID:", a3));
      id v27 = PLInternalPredicateForMediaProcessingTaskID();
      [v15 setInternalPredicate:v27];
    }
    long long v28 = [(PHPhotoLibrary *)self _propertySetsForTaskID:a3];
    [v15 setFetchPropertySets:v28];

    long long v29 = NSString;
    uint64_t v30 = PHMediaProcessingDescriptionForTaskID(a3);
    long long v31 = (void *)v30;
    uint64_t v32 = @"NO";
    if (v10) {
      uint64_t v32 = @"YES";
    }
    id v33 = [v29 stringWithFormat:@"!MediaProcessing task: %@ priority: %tu processed: %@", v30, a4, v32];
    [v15 setImportantFetchName:v33];

    [(PHPhotoLibrary *)self _setSortDescriptors:v15 forTaskID:a3];
    [(PHPhotoLibrary *)self _setFetchLimit:v15 forTaskID:a3];
  }
  else
  {
    __int16 v17 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v38 = a3;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "Unknown PHMediaProcessingTaskID (%tu)", buf, 0xCu);
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v20 = [v19 stringValue];
    uint64_t v21 = [@"unknown taskID " stringByAppendingString:v20];
    uint64_t v36 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v23 = [v18 errorWithDomain:@"PHPhotosErrorDomain" code:8002 userInfo:v22];
    uint64_t v24 = v23;
    if (a9) {
      *a9 = v23;
    }

    int v15 = 0;
  }

  return v15;
}

- (id)fetchOptionsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 processed:(BOOL)a7 error:(id *)a8
{
  return -[PHPhotoLibrary fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:](self, "fetchOptionsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:processed:exactVersionMatch:error:", a3, a4, a5, a7, 1, a8);
}

- (void)_updateFetchOptionsForMediaProcessingCounts:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 setShouldPrefetchCount:1];
  v5[0] = @"PHAssetPropertySetIdentifier";
  os_signpost_id_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 setFetchPropertySets:v4];

  [v3 setSortDescriptors:0];
  [v3 setFetchLimit:0];
}

- (unint64_t)countOfProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  uint64_t v13 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:v12];
    int v25 = 134218754;
    unint64_t v26 = a3;
    __int16 v27 = 2048;
    unint64_t v28 = a4;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    __int16 v31 = 2048;
    double v32 = a6;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "countOfProcessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v25, 0x2Au);
  }
  *(float *)&double v15 = a6;
  unint64_t v16 = [(PHPhotoLibrary *)self fetchOptionsForMediaProcessingTaskID:a3 priority:a4 algorithmVersion:v12 sceneConfidenceThreshold:1 processed:0 exactVersionMatch:a7 error:v15];
  [(PHPhotoLibrary *)self _updateFetchOptionsForMediaProcessingCounts:v16];
  if (!v16) {
    goto LABEL_13;
  }
  __int16 v17 = +[PHAsset fetchAssetsWithOptions:v16];
  id v18 = [v17 fetchError];

  if (v18)
  {
    uint64_t v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v17 fetchError];
      int v25 = 138412290;
      unint64_t v26 = (unint64_t)v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v21 = [v17 fetchError];
    uint64_t v22 = v21;
    if (a7) {
      *a7 = v21;
    }

    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_13:
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  unint64_t v23 = [v17 count];
LABEL_12:

LABEL_14:
  return v23;
}

- (unint64_t)countOfAllAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 sceneConfidenceThreshold:(float)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v22 = 134218496;
    unint64_t v23 = a3;
    __int16 v24 = 2048;
    unint64_t v25 = a4;
    __int16 v26 = 2048;
    double v27 = a5;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_INFO, "countOfAllAssetsForMediaProcessingTaskID:%tu priority:%tu confidence:%f", (uint8_t *)&v22, 0x20u);
  }

  *(float *)&double v12 = a5;
  uint64_t v13 = [(PHPhotoLibrary *)self fetchOptionsForMediaProcessingTaskID:a3 priority:a4 algorithmVersion:0 sceneConfidenceThreshold:0 processed:0 exactVersionMatch:a6 error:v12];
  [(PHPhotoLibrary *)self _updateFetchOptionsForMediaProcessingCounts:v13];
  if (!v13) {
    goto LABEL_13;
  }
  id v14 = +[PHAsset fetchAssetsWithOptions:v13];
  double v15 = [v14 fetchError];

  if (v15)
  {
    unint64_t v16 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = [v14 fetchError];
      int v22 = 138412290;
      unint64_t v23 = (unint64_t)v17;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v22, 0xCu);
    }
    id v18 = [v14 fetchError];
    uint64_t v19 = v18;
    if (a6) {
      *a6 = v18;
    }

    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  if (!v14)
  {
LABEL_13:
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  unint64_t v20 = [v14 count];
LABEL_12:

LABEL_14:
  return v20;
}

- (unint64_t)countOfUnprocessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  uint64_t v13 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:v12];
    int v25 = 134218754;
    unint64_t v26 = a3;
    __int16 v27 = 2048;
    unint64_t v28 = a4;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    __int16 v31 = 2048;
    double v32 = a6;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "countOfUnprocessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v25, 0x2Au);
  }
  *(float *)&double v15 = a6;
  unint64_t v16 = [(PHPhotoLibrary *)self fetchOptionsForMediaProcessingTaskID:a3 priority:a4 algorithmVersion:v12 sceneConfidenceThreshold:0 processed:0 exactVersionMatch:a7 error:v15];
  [(PHPhotoLibrary *)self _updateFetchOptionsForMediaProcessingCounts:v16];
  if (!v16) {
    goto LABEL_13;
  }
  __int16 v17 = +[PHAsset fetchAssetsWithOptions:v16];
  id v18 = [v17 fetchError];

  if (v18)
  {
    uint64_t v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = [v17 fetchError];
      int v25 = 138412290;
      unint64_t v26 = (unint64_t)v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v21 = [v17 fetchError];
    int v22 = v21;
    if (a7) {
      *a7 = v21;
    }

    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_13:
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  unint64_t v23 = [v17 count];
LABEL_12:

LABEL_14:
  return v23;
}

- (id)fetchProcessedAssetsBelowAnalysisStage:(signed __int16)a3 forTaskIDs:(id)a4 algorithmVersion:(id)a5 error:(id *)a6
{
  int v7 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9)
  {
    id v11 = [[PHMediaProcessingAlgorithmVersionProvider alloc] initWithProvider:v9];
  }
  else
  {
    id v11 = +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions];
  }
  id v12 = v11;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) unsignedIntegerValue];
        id v18 = PLProcessingPredicateForTaskID();
        if (v18) {
          [v10 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  uint64_t v19 = (void *)MEMORY[0x1E4F28BA0];
  unint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL", @"computeSyncAttributes");
  v33[0] = v20;
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %d", @"computeSyncAttributes.localAnalysisStage", v7);
  v33[1] = v21;
  int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  unint64_t v23 = [v19 orPredicateWithSubpredicates:v22];

  [v10 addObject:v23];
  __int16 v24 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
  int v25 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
  [v24 setInternalPredicate:v25];

  unint64_t v26 = +[PHAsset fetchAssetsWithOptions:v24];

  return v26;
}

- (id)fetchProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:v12];
    int v24 = 134218754;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2114;
    long long v29 = v14;
    __int16 v30 = 2048;
    double v31 = a6;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "fetchProcessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v24, 0x2Au);
  }
  *(float *)&double v15 = a6;
  uint64_t v16 = [(PHPhotoLibrary *)self fetchOptionsForMediaProcessingTaskID:a3 priority:a4 algorithmVersion:v12 sceneConfidenceThreshold:1 processed:0 exactVersionMatch:a7 error:v15];
  if (v16)
  {
    __int16 v17 = +[PHAsset fetchAssetsWithOptions:v16];
    id v18 = [v17 fetchError];

    if (!v18) {
      goto LABEL_11;
    }
    uint64_t v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = [v17 fetchError];
      int v24 = 138412290;
      unint64_t v25 = (unint64_t)v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v21 = [v17 fetchError];
    int v22 = v21;
    if (a7) {
      *a7 = v21;
    }
  }
  __int16 v17 = 0;
LABEL_11:

  return v17;
}

- (id)fetchUnprocessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:v12];
    int v24 = 134218754;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2114;
    long long v29 = v14;
    __int16 v30 = 2048;
    double v31 = a6;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "fetchUnprocessedAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v24, 0x2Au);
  }
  *(float *)&double v15 = a6;
  uint64_t v16 = [(PHPhotoLibrary *)self fetchOptionsForMediaProcessingTaskID:a3 priority:a4 algorithmVersion:v12 sceneConfidenceThreshold:0 processed:0 exactVersionMatch:a7 error:v15];
  if (v16)
  {
    __int16 v17 = +[PHAsset fetchAssetsWithOptions:v16];
    id v18 = [v17 fetchError];

    if (!v18) {
      goto LABEL_11;
    }
    uint64_t v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = [v17 fetchError];
      int v24 = 138412290;
      unint64_t v25 = (unint64_t)v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v21 = [v17 fetchError];
    int v22 = v21;
    if (a7) {
      *a7 = v21;
    }
  }
  __int16 v17 = 0;
LABEL_11:

  return v17;
}

- (id)fetchAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 algorithmVersion:(id)a5 sceneConfidenceThreshold:(float)a6 error:(id *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = +[PHMediaProcessingAlgorithmVersionProvider descriptionForVersionProvider:v12];
    int v24 = 134218754;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2114;
    long long v29 = v14;
    __int16 v30 = 2048;
    double v31 = a6;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "fetchAssetsForMediaProcessingTaskID:%tu priority:%tu versions:%{public}@ confidence:%f", (uint8_t *)&v24, 0x2Au);
  }
  *(float *)&double v15 = a6;
  uint64_t v16 = [(PHPhotoLibrary *)self fetchOptionsForMediaProcessingTaskID:a3 priority:a4 algorithmVersion:v12 sceneConfidenceThreshold:0 processed:a7 error:v15];
  if (v16)
  {
    __int16 v17 = +[PHAsset fetchAssetsWithOptions:v16];
    id v18 = [v17 fetchError];

    if (!v18) {
      goto LABEL_11;
    }
    uint64_t v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = [v17 fetchError];
      int v24 = 138412290;
      unint64_t v25 = (unint64_t)v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Error fetching assets for media processing: %@", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v21 = [v17 fetchError];
    int v22 = v21;
    if (a7) {
      *a7 = v21;
    }
  }
  __int16 v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)processUniversalSearchJITForAssetLocalIdentifier:(id)a3 processingTypes:(unint64_t)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ([(PHPhotoLibrary *)self wellKnownPhotoLibraryIdentifier] != 3
    && (PLIsInternalTool() & 1) == 0
    && (MEMORY[0x19F388C70]() & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PHPhotoLibrary+MediaProcessing.m", 370, @"Invalid parameter not satisfying: %@", @"PLIsInternalTool() || PLIsXcTest()" object file lineNumber description];
  }
  id v10 = [(PHPhotoLibrary *)self assetsdClient];
  id v11 = [v10 photoKitClient];

  id v12 = +[PHObject uuidFromLocalIdentifier:v9];

  if (v11)
  {
    char v13 = [v11 processUniversalSearchJITForAssetUUID:v12 processingTypes:a4 error:a5];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    v21[0] = @"PhotoKit client is nil";
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"PHPhotosErrorDomain" code:4302 userInfo:v15];
    __int16 v17 = v16;
    if (a5) {
      *a5 = v16;
    }

    char v13 = 0;
  }

  return v13;
}

- (id)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a3;
  if ([(PHPhotoLibrary *)self wellKnownPhotoLibraryIdentifier] != 3
    && (PLIsInternalTool() & 1) == 0
    && (MEMORY[0x19F388C70]() & 1) == 0)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PHPhotoLibrary+MediaProcessing.m", 347, @"Invalid parameter not satisfying: %@", @"PLIsInternalTool() || PLIsXcTest()" object file lineNumber description];
  }
  char v13 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v14 = [v13 photoKitClient];

  double v15 = [v14 processUniversalSearchJITForCoreSpotlightUniqueIdentifier:v12 bundleID:v11 processingTypes:a5 error:a6];

  if (v15)
  {
    uint64_t v16 = +[PHObject localIdentifierWithUUID:v15];
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"PhotoKit client is nil";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v19 = [v17 errorWithDomain:@"PHPhotosErrorDomain" code:4302 userInfo:v18];
    uint64_t v20 = v19;
    if (!v14 && a6) {
      *a6 = v19;
    }

    uint64_t v16 = 0;
  }

  return v16;
}

- (int)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F8A998];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = [(PHPhotoLibrary *)self photoLibraryURL];
  LODWORD(a3) = [v10 requestProcessingTypes:a3 forAssetsWithLocalIdentifiers:v13 fromPhotoLibraryWithURL:v14 progressHandler:v12 completionHandler:v11];

  return a3;
}

+ (id)mediaProcessingFacesSortDescriptorsForGeneratingPersonModel
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assetForFace.dateCreated" ascending:0];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v6[1] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)mediaProcessingDeviceIndependentFacesSortDescriptors
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assetForFace.dateCreated" ascending:1];
  id v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"assetForFace.addedDate", 1, v2);
  v9[1] = v3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"assetForFace.filename" ascending:1];
  v9[2] = v4;
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"centerX" ascending:1];
  v9[3] = v5;
  int v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"centerY" ascending:1];
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (BOOL)additionalCheckForProcessingNeededForAsset:(id)a3 taskID:(unint64_t)a4 priority:(unint64_t)a5
{
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F8BA10] maskForAllowedForMediaAnalysis];
  if ((v7 & [v6 savedAssetType]) != 0)
  {
    BOOL v8 = 1;
    switch(a4)
    {
      case 0xAuLL:
        BOOL v8 = [v6 mediaType] == 1;
        break;
      case 0xCuLL:
      case 0x10uLL:
      case 0x12uLL:
        BOOL v8 = [v6 mediaSubtypes] != 1;
        break;
      default:
        break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)sharingSuggestionWithRandomPick:(BOOL)a3 fallbackToRecentMoments:(BOOL)a4 needsNotification:(BOOL)a5
{
  BOOL v40 = a5;
  BOOL v5 = a4;
  BOOL v6 = a3;
  v64[1] = *MEMORY[0x1E4F143B8];
  BOOL v8 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d && state == %d", 1, 1);
  [v8 setPredicate:v9];

  id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v64[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  [v8 setSortDescriptors:v11];

  [v8 setFetchLimit:1];
  id v12 = +[PHSuggestion fetchSuggestionsWithOptions:v8];
  if ([v12 count])
  {
    if (v6) {
      objc_msgSend(v12, "objectAtIndex:", arc4random_uniform(objc_msgSend(v12, "count")));
    }
    else {
    id v13 = [v12 firstObject];
    }
    id v14 = v13;
    if (!v40) {
      goto LABEL_36;
    }
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke;
    v50[3] = &unk_1E5848578;
    id v14 = v13;
    id v51 = v14;
    id v49 = 0;
    BOOL v26 = [(PHPhotoLibrary *)self performChangesAndWait:v50 error:&v49];
    id v15 = v49;
    if (!v26)
    {
      unint64_t v27 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:"
                             "needsNotification:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "%s Fail to change Suggestion notification state: %@", buf, 0x16u);
      }
    }
    uint64_t v21 = v51;
    goto LABEL_35;
  }
  id v14 = 0;
  if (![v12 count] && v5)
  {
    id v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v16 setMonth:-240];
    __int16 v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v18 = [MEMORY[0x1E4F1C9C8] date];
    id v19 = [v17 dateByAddingComponents:v16 toDate:v18 options:0];

    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate >= %@", v19];
    [v15 addObject:v20];

    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"estimatedAssetCount > 8"];
    [v15 addObject:v21];
    int v22 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];

    uint64_t v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v15];
    [v22 setPredicate:v23];

    uint64_t v39 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    id v63 = v39;
    int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    [v22 setSortDescriptors:v24];

    [v22 setFetchLimit:6];
    unint64_t v25 = +[PHAssetCollection fetchMomentsWithOptions:v22];
    if (![v25 count])
    {
      __int16 v28 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:"
                             "needsNotification:]";
        _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_ERROR, "%s Fail to add Suggestion (no moments found in the past 20 years)", buf, 0xCu);
      }
      id v14 = 0;
      goto LABEL_34;
    }
    if (v6) {
      objc_msgSend(v25, "objectAtIndex:", arc4random_uniform(objc_msgSend(v25, "count")));
    }
    else {
    __int16 v28 = [v25 firstObject];
    }
    long long v29 = +[PHAsset fetchKeyAssetsInAssetCollection:v28 options:0];
    __int16 v30 = [v29 firstObject];

    unint64_t v38 = +[PHAsset fetchAssetsInAssetCollection:v28 options:0];
    if (!v30)
    {
      __int16 v30 = [v38 firstObject];
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v60 = __Block_byref_object_copy__11839;
    uint64_t v61 = __Block_byref_object_dispose__11840;
    id v62 = 0;
    if (v30 && [v38 count])
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke_25;
      v43[3] = &unk_1E5843658;
      id v44 = v30;
      id v45 = v38;
      BOOL v48 = v40;
      id v46 = v28;
      id v47 = buf;
      id v42 = 0;
      BOOL v31 = [(PHPhotoLibrary *)self performChangesAndWait:v43 error:&v42];
      id v41 = v42;

      if (v31)
      {
        uint64_t v32 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
        uint64_t v58 = *(void *)(*(void *)&buf[8] + 40);
        uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        uint64_t v33 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v37 options:v32];
        id v14 = [v33 firstObject];

        if (v14)
        {
LABEL_33:

          _Block_object_dispose(buf, 8);
LABEL_34:

          BOOL v8 = v22;
LABEL_35:

          goto LABEL_36;
        }
        id v34 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = *(void **)(*(void *)&buf[8] + 40);
          *(_DWORD *)id v52 = 136315650;
          id v53 = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:needsNotification:]";
          __int16 v54 = 2112;
          id v55 = v35;
          __int16 v56 = 2112;
          id v57 = v41;
          _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_ERROR, "%s Added, but fail to find Suggestion by localIdentifier (%@): %@", v52, 0x20u);
        }

LABEL_32:
        id v14 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      id v41 = 0;
    }
    uint64_t v32 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v52 = 136315394;
      id v53 = "-[PHPhotoLibrary(PHDebugUtilities) sharingSuggestionWithRandomPick:fallbackToRecentMoments:needsNotification:]";
      __int16 v54 = 2112;
      id v55 = v41;
      _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "%s Fail to add Suggestion: %@", v52, 0x16u);
    }
    goto LABEL_32;
  }
LABEL_36:

  return v14;
}

void __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke(uint64_t a1)
{
  id v1 = +[PHSuggestionChangeRequest changeRequestForSuggestion:*(void *)(a1 + 32)];
  [v1 setNotificationState:1];
}

void __110__PHPhotoLibrary_PHDebugUtilities__sharingSuggestionWithRandomPick_fallbackToRecentMoments_needsNotification___block_invoke_25(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v3 = *(void *)(a1 + 40);
  os_signpost_id_t v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v5 = +[PHSuggestionChangeRequest creationRequestForSuggestionWithType:1 subtype:101 keyAssets:v2 representativeAssets:v3 creationDate:v4 relevantUntilDate:0 version:1];

  BOOL v6 = [*(id *)(a1 + 48) localizedTitle];
  [v5 setTitle:v6];

  int v7 = [*(id *)(a1 + 48) localizedSubtitle];
  [v5 setSubtitle:v7];

  if (*(unsigned char *)(a1 + 64)) {
    [v5 setNotificationState:1];
  }
  [v5 markActive];
  BOOL v8 = [v5 placeholderForCreatedSuggestion];
  uint64_t v9 = [v8 localIdentifier];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (BOOL)hasSyncProgressReturningImportOperations:(int *)a3
{
  os_signpost_id_t v4 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PHPhotoLibrary_PHAdoptionUtilities__hasSyncProgressReturningImportOperations___block_invoke;
  v7[3] = &unk_1E5847E80;
  id v5 = v4;
  uint64_t v9 = &v11;
  uint64_t v10 = a3;
  id v8 = v5;
  [v5 performBlockAndWait:v7];
  LOBYTE(a3) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __80__PHPhotoLibrary_PHAdoptionUtilities__hasSyncProgressReturningImportOperations___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) syncProgressAlbumsIgnoreiTunes:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    int v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 managedObjectContext];
        [v10 refreshObject:v9 mergeChanges:1];

        int v11 = [v9 pendingItemsCount];
        if (v11) {
          v7 |= [v9 pendingItemsType];
        }
        v5 += v11;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
    int v7 = 1;
  }
  id v12 = *(int **)(a1 + 48);
  if (v12) {
    int *v12 = v7;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_photoLibraryBundle, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_availabilityObservers, 0);
  objc_storeStrong((id *)&self->_changeNotificationInfo, 0);
  objc_storeStrong((id *)&self->_performChangesRequest, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_transactionPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_unavailabilityReason, 0);
  objc_storeStrong((id *)&self->_cachedCloudStatus, 0);
  objc_storeStrong((id *)&self->_databaseStatisticsTracker, 0);
  objc_storeStrong((id *)&self->_changeHandlingDebugger, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
  objc_storeStrong((id *)&self->_customLibrarySpecificFetchOptions, 0);
  objc_storeStrong((id *)&self->_openError, 0);
  objc_storeStrong((id *)&self->_postOpenProgress, 0);
  objc_storeStrong((id *)&self->_libraryFileSystemVolume, 0);
  objc_storeStrong((id *)&self->_observerRegistrar, 0);
  objc_storeStrong((id *)&self->_lazySearchIndex, 0);
  objc_storeStrong((id *)&self->_lazyMainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_cplSettingsObserver, 0);
  objc_storeStrong((id *)&self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted, 0);
  objc_storeStrong((id *)&self->_lazyIsReadyForAnalysisQuickCheck, 0);
  objc_storeStrong((id *)&self->_lazyIsReadyForAnalysis, 0);
  objc_storeStrong((id *)&self->_lazyCPLStatus, 0);
  objc_storeStrong((id *)&self->_lazyCacheMetricsCollectorClient, 0);
  objc_storeStrong((id *)&self->_lazyPhotoLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_lazyProjectAlbumRootFolderObjectID, 0);
  objc_storeStrong((id *)&self->_lazyAlbumRootFolderObjectID, 0);
  objc_storeStrong((id *)&self->_lazyChangeHandlingPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyGraphObjectFetchingPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyBackgroundQueueObjectFetchingPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyUserInitiatedQueuePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyBackgroundQueuePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyMainQueuePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_lazyMainQueueConcurrencyPhotoLibrary, 0);

  objc_storeStrong((id *)&self->_lazyPhotoLibrary, 0);
}

- (void)setVideoConversionServiceClient:(id)a3
{
}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  return self->_videoConversionServiceClient;
}

- (void)setImageConversionServiceClient:(id)a3
{
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  return self->_imageConversionServiceClient;
}

- (void)setClearsOIDCacheAfterFetchResultDealloc:(BOOL)a3
{
  self->_clearsOIDCacheAfterFetchResultDealloc = a3;
}

- (BOOL)clearsOIDCacheAfterFetchResultDealloc
{
  return self->_clearsOIDCacheAfterFetchResultDealloc;
}

- (void)setAvailabilityObservers:(id)a3
{
}

- (NSHashTable)availabilityObservers
{
  return self->_availabilityObservers;
}

- (void)setUnknownMergeEvent:(BOOL)a3
{
  self->_unknownMergeEvent = a3;
}

- (BOOL)unknownMergeEvent
{
  return self->_unknownMergeEvent;
}

- (void)setChangeNotificationInfo:(id)a3
{
}

- (NSMutableDictionary)changeNotificationInfo
{
  return self->_changeNotificationInfo;
}

- (void)setPerformChangesRequest:(id)a3
{
}

- (PHPerformChangesRequest)performChangesRequest
{
  return self->_performChangesRequest;
}

- (void)setTransactionQueue:(id)a3
{
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (PLPhotoLibrary)transactionPhotoLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 296, 1);
}

- (void)setIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setUnavailabilityReason:(id)a3
{
}

- (NSError)unavailabilityReason
{
  return (NSError *)objc_getProperty(self, a2, 280, 1);
}

- (id)stateCaptureDictionary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:self->_photoLibraryURL];
    int v10 = 134218242;
    int v11 = self;
    __int16 v12 = 2112;
    long long v13 = v4;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "STATEDUMP: State information for PHPhotoLibrary-%p at path %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [NSNumber numberWithInteger:self->_wellKnownPhotoLibraryIdentifier];
  [v5 setObject:v6 forKeyedSubscript:@"wellKnownPhotoLibraryIdentifier"];

  int v7 = [MEMORY[0x1E4F8B908] redactedDescriptionForFileURL:self->_photoLibraryURL];
  [v5 setObject:v7 forKeyedSubscript:@"photoLibraryURL"];

  id v8 = [(PHChangeHandlingDebugger *)self->_changeHandlingDebugger stateCaptureDictionary];
  [v5 setObject:v8 forKeyedSubscript:@"changeHandling"];

  return v5;
}

- (NSArray)gatheredSqlStatements
{
  return [(PHDatabaseStatisticsTracker *)self->_databaseStatisticsTracker sqlStatements];
}

- (void)removeAllGatheredSqlStatements
{
}

- (void)disableGatheringSqlStatements
{
}

- (void)enableGatheringSqlStatements
{
}

- (int64_t)currentDatabaseStatistics
{
  return [(PHDatabaseStatisticsTracker *)self->_databaseStatisticsTracker currentByteCount];
}

- (void)legacySaveScreenshotToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E5848578;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v14[3] = &unk_1E5844F50;
  v14[4] = self;
  id v15 = v11;
  SEL v16 = a5;
  __int16 v17 = a6;
  id v12 = v11;
  id v13 = v10;
  [(PHPhotoLibrary *)self performChanges:v18 completionHandler:v14];
}

id __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  return +[PHAssetCreationRequest creationRequestForAssetFromScreenshotImage:*(void *)(a1 + 32)];
}

uint64_t __99__PHPhotoLibrary_legacySaveScreenshotToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callLegacyCompletionTarget:*(void *)(a1 + 40) completionSelector:*(void *)(a1 + 48) contextInfo:*(void *)(a1 + 56) withSuccess:a2 error:a3];
}

- (void)legacySaveImageToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E5848578;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v14[3] = &unk_1E5844F50;
  v14[4] = self;
  id v15 = v11;
  SEL v16 = a5;
  __int16 v17 = a6;
  id v12 = v11;
  id v13 = v10;
  [(PHPhotoLibrary *)self performChanges:v18 completionHandler:v14];
}

id __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  return +[PHAssetCreationRequest creationRequestForAssetFromImage:*(void *)(a1 + 32)];
}

uint64_t __94__PHPhotoLibrary_legacySaveImageToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callLegacyCompletionTarget:*(void *)(a1 + 40) completionSelector:*(void *)(a1 + 48) contextInfo:*(void *)(a1 + 56) withSuccess:a2 error:a3];
}

- (void)legacySaveVideoToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PHPhotoLibrary.m", 3384, @"Invalid parameter not satisfying: %@", @"videoPath != nil" object file lineNumber description];
  }
  id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v23[3] = &unk_1E5848578;
  id v24 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v18[3] = &unk_1E5844F50;
  id v19 = v11;
  id v20 = v12;
  SEL v21 = a5;
  int v22 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v13;
  [(PHPhotoLibrary *)self performChanges:v23 completionHandler:v18];
}

id __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  return +[PHAssetCreationRequest creationRequestForAssetFromVideoAtFileURL:*(void *)(a1 + 32)];
}

void __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8A6A0] createWriteVideoCompletionBlockWithVideoPath:*(void *)(a1 + 32) target:*(void *)(a1 + 40) selector:*(void *)(a1 + 48) contextInfo:*(void *)(a1 + 56)];
  uint64_t v6 = v5;
  if (v5)
  {
    id v9 = v5;
    id v7 = *(id *)(a1 + 32);
    id v8 = v4;
    pl_dispatch_async();
  }
}

uint64_t __94__PHPhotoLibrary_legacySaveVideoToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)legacySaveImageDataToCameraRoll:(id)a3 completionTarget:(id)a4 completionSelector:(SEL)a5 contextInfo:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E5848578;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2;
  v14[3] = &unk_1E5844F50;
  v14[4] = self;
  id v15 = v11;
  SEL v16 = a5;
  __int16 v17 = a6;
  id v12 = v11;
  id v13 = v10;
  [(PHPhotoLibrary *)self performChanges:v18 completionHandler:v14];
}

void __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke(uint64_t a1)
{
  id v2 = +[PHAssetCreationRequest creationRequestForAsset];
  [v2 addResourceWithType:1 data:*(void *)(a1 + 32) options:0];
}

uint64_t __98__PHPhotoLibrary_legacySaveImageDataToCameraRoll_completionTarget_completionSelector_contextInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callLegacyCompletionTarget:*(void *)(a1 + 40) completionSelector:*(void *)(a1 + 48) contextInfo:*(void *)(a1 + 56) withSuccess:a2 error:a3];
}

- (void)_callLegacyCompletionTarget:(id)a3 completionSelector:(SEL)a4 contextInfo:(void *)a5 withSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a7;
  id v11 = [MEMORY[0x1E4F8A6A0] createWriteImageCompletionBlockWithImage:0 target:a3 selector:a4 contextInfo:a5];
  id v12 = v11;
  if (v11)
  {
    id v14 = v11;
    id v13 = v10;
    pl_dispatch_async();
  }
}

uint64_t __95__PHPhotoLibrary__callLegacyCompletionTarget_completionSelector_contextInfo_withSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (BOOL)cloudQuotaResourceBytesUsed:(id *)a3 minVideoSize:(unint64_t)a4 error:(id *)a5
{
  if (a3)
  {
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    BOOL v31 = __Block_byref_object_copy__20217;
    uint64_t v32 = __Block_byref_object_dispose__20218;
    id v33 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    unint64_t v25 = __Block_byref_object_copy__20217;
    BOOL v26 = __Block_byref_object_dispose__20218;
    id v27 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__PHPhotoLibrary_cloudQuotaResourceBytesUsed_minVideoSize_error___block_invoke;
    v18[3] = &unk_1E5844F28;
    id v20 = &v28;
    SEL v21 = &v22;
    id v10 = v9;
    id v19 = v10;
    [(PHPhotoLibrary *)self cloudQuotaResourceBytesUsedForMinVideoSize:a4 completion:v18];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    *a3 = (id) v29[5];
    id v11 = (void *)v23[5];
    id v12 = v11;
    id v13 = v12;
    if (v11 && a5) {
      *a5 = v12;
    }

    BOOL v14 = v23[5] == 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:1 userInfo:MEMORY[0x1E4F1CC08]];
    SEL v16 = v15;
    if (a5) {
      *a5 = v15;
    }

    return 0;
  }
  return v14;
}

void __65__PHPhotoLibrary_cloudQuotaResourceBytesUsed_minVideoSize_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v13 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)cloudQuotaResourceBytesUsed:(id *)a3 error:(id *)a4
{
  return [(PHPhotoLibrary *)self cloudQuotaResourceBytesUsed:a3 minVideoSize:31457280 error:a4];
}

- (void)cloudQuotaResourceBytesUsedForMinVideoSize:(unint64_t)a3 completion:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  id v7 = (void (**)(void, void, void, void))v6;
  if ([(PHPhotoLibrary *)self isCloudPhotoLibraryEnabled])
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__20217;
    v26[4] = __Block_byref_object_dispose__20218;
    id v27 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    v24[0] = 0;
    v24[1] = v24;
    void v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__20217;
    void v24[4] = __Block_byref_object_dispose__20218;
    id v25 = 0;
    uint64_t v8 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
    if (a3) {
      unint64_t v9 = a3;
    }
    else {
      unint64_t v9 = 31457280;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke;
    v19[3] = &unk_1E5844ED8;
    id v10 = v8;
    id v20 = v10;
    SEL v21 = v24;
    uint64_t v22 = v26;
    unint64_t v23 = v9;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke_2;
    v15[3] = &unk_1E5844F00;
    SEL v16 = v7;
    __int16 v17 = v24;
    uint64_t v18 = v26;
    [v10 performBlock:v19 completionHandler:v15 withPriority:1];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    v29[0] = @"API not available when iCPL is OFF";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v13 = [v11 errorWithDomain:@"PHPhotosErrorDomain" code:3126 userInfo:v12];
    ((void (**)(void, void, void, void *))v7)[2](v7, 0, 0, v13);
  }
}

void __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke(uint64_t a1)
{
  v69[5] = *MEMORY[0x1E4F143B8];
  v50 = (void *)MEMORY[0x1E4F28BA0];
  id v57 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", @"trashedState", 0);
  v69[0] = v57;
  objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", @"master.cloudLocalState", 3);
  id v55 = (id)objc_claimAutoreleasedReturnValue();
  v69[1] = v55;
  id v53 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCplQuotaExclusions"), 0);
  v69[2] = v53;
  id v1 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == NO", @"hidden");
  v69[3] = v1;
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(noindex:(%K) == %d) AND (%K != %d)", @"playbackStyle", 4, @"kind", 2);
  v68[0] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kindSubtype", 10);
  v68[1] = v4;
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
  v67[0] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 2);
  v67[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  unint64_t v9 = [v5 andPredicateWithSubpredicates:v8];
  v68[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  id v11 = [v2 orPredicateWithSubpredicates:v10];
  v69[4] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:5];
  id v51 = [v50 andPredicateWithSubpredicates:v12];

  id v13 = (void *)MEMORY[0x1E4F8A8D8];
  id v14 = [*(id *)(a1 + 32) managedObjectContext];
  id v15 = [v13 activeLibraryScopeInManagedObjectContext:v14];

  id v49 = v15;
  if (v15 && [v15 status] == 3)
  {
    SEL v16 = (void *)MEMORY[0x1E4F28BA0];
    v66[0] = v51;
    __int16 v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", 0);
    v66[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
    uint64_t v19 = [v16 andPredicateWithSubpredicates:v18];

    id v51 = (void *)v19;
  }
  id v20 = (void *)MEMORY[0x1E4F1C0D0];
  SEL v21 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v22 = [v20 fetchRequestWithEntityName:v21];

  [v22 setPredicate:v51];
  v65[0] = @"kind";
  v65[1] = @"kindSubtype";
  v65[2] = @"duplicateAssetVisibilityState";
  v65[3] = @"additionalAttributes.originalFilesize";
  v65[4] = @"duplicatePerceptualMatchingAlbum";
  unint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:5];
  [v22 setPropertiesToFetch:v23];

  [v22 setResultType:2];
  uint64_t v24 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v25 + 40);
  BOOL v48 = v22;
  BOOL v26 = [v24 executeFetchRequest:v22 error:&obj];
  objc_storeStrong((id *)(v25 + 40), obj);

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v56 = v26;
  uint64_t v27 = [v56 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = 0;
    uint64_t v54 = 0;
    uint64_t v58 = 0;
    uint64_t v30 = *(void *)v60;
    while (1)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v60 != v30) {
          objc_enumerationMutation(v56);
        }
        uint64_t v32 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v33 = [v32 objectForKeyedSubscript:@"additionalAttributes.originalFilesize"];
        unint64_t v34 = [v33 unsignedIntegerValue];

        uint64_t v35 = [v32 objectForKeyedSubscript:@"duplicateAssetVisibilityState"];
        __int16 v36 = [v35 unsignedIntegerValue];

        uint64_t v37 = [v32 objectForKeyedSubscript:@"kind"];
        __int16 v38 = [v37 unsignedIntegerValue];

        uint64_t v39 = [v32 objectForKeyedSubscript:@"kindSubtype"];
        __int16 v40 = [v39 unsignedIntegerValue];

        id v41 = [v32 objectForKeyedSubscript:@"duplicatePerceptualMatchingAlbum"];
        if (v36 > 1)
        {
          if (v36 != 2)
          {
            if (v36 != 100) {
              goto LABEL_28;
            }
LABEL_15:
            if (v41) {
              unint64_t v42 = v34;
            }
            else {
              unint64_t v42 = 0;
            }
            v58 += v42;
            goto LABEL_28;
          }
        }
        else if (v36)
        {
          if (v36 != 1) {
            goto LABEL_28;
          }
          goto LABEL_15;
        }
        if (v38 == 1)
        {
          if (v34 >= *(void *)(a1 + 56)) {
            unint64_t v43 = v34;
          }
          else {
            unint64_t v43 = 0;
          }
          v54 += v43;
        }
        if (v40 == 10) {
          unint64_t v44 = v34;
        }
        else {
          unint64_t v44 = 0;
        }
        v29 += v44;
LABEL_28:
      }
      uint64_t v28 = [v56 countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (!v28) {
        goto LABEL_32;
      }
    }
  }
  uint64_t v29 = 0;
  uint64_t v54 = 0;
  uint64_t v58 = 0;
LABEL_32:

  id v45 = [NSNumber numberWithUnsignedLong:v54];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v45 forKeyedSubscript:@"PHCloudQuotaBytesUsedMediaTypeVideo"];

  id v46 = [NSNumber numberWithUnsignedLong:v29];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v46 forKeyedSubscript:@"PHCloudQuotaBytesUsedMediaTypeScreenshot"];

  id v47 = [NSNumber numberWithUnsignedLong:v58];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v47 forKeyedSubscript:@"PHCloudQuotaBytesUsedMediaTypeDuplicate"];
}

uint64_t __72__PHPhotoLibrary_cloudQuotaResourceBytesUsedForMinVideoSize_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40) == 0, *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (id)limitedLibraryPredicateForApplication:(id)a3 fetchType:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a3;
  unint64_t v9 = [v7 predicateWithValue:0];
  id v10 = [MEMORY[0x1E4F8A910] fetchFilterIdentifierForApplicationIdentifier:v8];

  id v11 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  id v12 = v11;
  if (v11)
  {
    id v13 = (void *)MEMORY[0x1E4F8A910];
    id v14 = [v11 managedObjectContext];
    id v15 = [v13 fetchLimitedLibraryFetchFilterWithApplicationIdentifier:v10 inManagedObjectContext:v14];

    if (v15)
    {
      SEL v16 = [(objc_class *)+[PHPhotoLibrary classForFetchType:v6] managedEntityName];
      __int16 v17 = [v15 predicateForEntityName:v16];
      uint64_t v18 = v17;
      if (v17)
      {
        id v19 = v17;

        unint64_t v9 = v19;
      }
    }
  }

  return v9;
}

- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = self;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "Resetting limited library access for %{public}@ to %@", buf, 0x16u);
  }

  unint64_t v9 = [(PHPhotoLibrary *)self assetsdClient];
  id v10 = [v9 libraryInternalClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __76__PHPhotoLibrary_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke;
  v12[3] = &unk_1E58484E0;
  id v13 = v7;
  id v11 = v7;
  [v10 resetLimitedLibraryAccessForApplication:v6 completionHandler:v12];
}

void __76__PHPhotoLibrary_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v8 = v5;
    if (a2)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:0];
      uint64_t v6 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v7);

    id v5 = v8;
  }
}

- (void)countOfReferencedMediaWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  [v5 countOfReferencedMediaWithCompletionHandler:v4];
}

- (BOOL)isReadyForAnalysisCPLInitialDownloadCompleted
{
  id v2 = [(PLLazyObject *)self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted objectValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isReadyForAnalysis_FOR_UI_USE_ONLY
{
  id v2 = [(PLLazyObject *)self->_lazyIsReadyForAnalysisQuickCheck objectValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isReadyForAnalysis
{
  char v3 = [(PLLazyObject *)self->_lazyIsReadyForAnalysis objectValue];
  int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0;
  }
  if (![(PHPhotoLibrary *)self photoAnalysisClientAllowed])
  {
    id v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.photoanalysisd"];

    if (v7)
    {
      id v8 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "Reporting NO for isReadyForAnalysis to photoanalysisd because NoPhotoAnalysis flag is set", v10, 2u);
      }

      return 0;
    }
  }
  return 1;
}

- (void)_notifyPersistentChangeObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PHPhotoLibraryPersistentHistoryDidChangeNotification" object:self];
}

- (PHPersistentChangeFetchResult)fetchPersistentChangesSinceToken:(PHPersistentChangeToken *)token error:(NSError *)error
{
  uint64_t v6 = token;
  int v7 = objc_alloc_init(PHPersistentChangeFetchOptions);
  [(PHPersistentChangeFetchOptions *)v7 setMaximumChangeThreshold:100000];
  [(PHPersistentChangeFetchOptions *)v7 setExcludesPrivateChanges:1];
  id v13 = 0;
  id v8 = [(PHPhotoLibrary *)self _fetchPersistentChangesSinceToken:v6 options:v7 error:&v13];

  id v9 = v13;
  id v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = error == 0;
  }
  if (!v11) {
    *error = (NSError *)v9;
  }

  return (PHPersistentChangeFetchResult *)v8;
}

- (PHPersistentChangeToken)currentToken
{
  id v2 = [(PHPhotoLibrary *)self changeHandlingPhotoLibrary];
  id v3 = [v2 managedObjectContext];

  int v4 = +[PHPersistentChangeToken currentTokenForContext:v3];

  return (PHPersistentChangeToken *)v4;
}

- (id)_fetchPersistentChangesSinceToken:(id)a3 options:(id)a4 error:(id *)a5
{
  return +[PHPersistentChangeFetchResult fetchResultWithToken:a3 options:a4 photoLibrary:self error:a5];
}

- (id)fetchPersistentChangesWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = objc_alloc_init(PHPersistentChangeFetchOptions);
  -[PHPersistentChangeFetchOptions setMaximumChangeThreshold:](v7, "setMaximumChangeThreshold:", [v6 maximumChangeThreshold]);
  [(PHPersistentChangeFetchOptions *)v7 setExcludesPrivateChanges:0];
  id v8 = [v6 token];

  id v9 = [(PHPhotoLibrary *)self _fetchPersistentChangesSinceToken:v8 options:v7 error:a4];

  return v9;
}

- (BOOL)isSharedAlbumsEnabled
{
  return [MEMORY[0x1E4F8AAB0] sharedStreamsEnabledForPhotoLibraryURL:self->_photoLibraryURL];
}

- (void)_processPendingChanges
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v3 = [(PHChangeHandlingDebugger *)self->_changeHandlingDebugger beginProcessPendingChanges];
  uint64_t v93 = 0;
  id v94 = &v93;
  uint64_t v95 = 0x3032000000;
  uint64_t v96 = __Block_byref_object_copy__20217;
  id v97 = __Block_byref_object_dispose__20218;
  id v98 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__20217;
  v91 = __Block_byref_object_dispose__20218;
  id v92 = 0;
  uint64_t v81 = 0;
  id v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__20217;
  id v85 = __Block_byref_object_dispose__20218;
  id v86 = 0;
  observerRegistrar = self->_observerRegistrar;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __40__PHPhotoLibrary__processPendingChanges__block_invoke;
  v80[3] = &unk_1E5844EB0;
  v80[4] = &v93;
  v80[5] = &v87;
  v80[6] = &v81;
  [(PHPhotoLibraryObserverRegistrar *)observerRegistrar getObserversWithBlock:v80];
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = __Block_byref_object_copy__20217;
  id v78 = __Block_byref_object_dispose__20218;
  id v79 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PHPhotoLibrary__processPendingChanges__block_invoke_2;
  block[3] = &unk_1E58485C8;
  block[4] = self;
  block[5] = &v74;
  block[6] = &v70;
  dispatch_sync(isolationQueue, block);
  objc_msgSend(v3, "setInternalObserversCount:", objc_msgSend((id)v94[5], "count"));
  objc_msgSend(v3, "setExternalObserversCount:", objc_msgSend((id)v88[5], "count"));
  id v6 = [(id)v75[5] objectForKeyedSubscript:*MEMORY[0x1E4F1BDF0]];
  uint64_t v7 = [v6 count];

  uint64_t v54 = *MEMORY[0x1E4F1BFA0];
  id v8 = objc_msgSend((id)v75[5], "objectForKeyedSubscript:");
  uint64_t v9 = [v8 count];

  id v10 = [(id)v75[5] objectForKeyedSubscript:*MEMORY[0x1E4F1BDB8]];
  uint64_t v11 = [v10 count];

  uint64_t v55 = [(id)v82[5] count];
  id v12 = [(id)v75[5] objectForKeyedSubscript:*MEMORY[0x1E4F8ADB0]];
  uint64_t v13 = [v12 unsignedLongLongValue];

  id v14 = [(id)v75[5] objectForKeyedSubscript:*MEMORY[0x1E4F8B788]];
  uint64_t v15 = [v14 integerValue];

  __int16 v16 = [(id)v75[5] objectForKeyedSubscript:*MEMORY[0x1E4F8AD18]];
  uint64_t v17 = [v16 integerValue];

  [v3 setInsertedCount:v7];
  [v3 setUpdatedCount:v9];
  [v3 setDeletedCount:v11];
  [v3 setUnknownMergeEvent:*((unsigned __int8 *)v71 + 24)];
  [v3 setFetchResultCount:v55];
  [v3 setLastTransactionNumber:v13];
  [v3 setTransactionCount:v15];
  [v3 setChangeCount:v17];
  PLChangeHandlingGetLog();
  uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t spid = os_signpost_id_generate(v18);

  id v19 = v18;
  id v20 = v19;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    uint64_t v52 = v7;
    log = v20;
    qos_class_self();
    PLShortStringFromQoSClass();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [(id)v94[5] count];
    uint64_t v23 = [(id)v88[5] count];
    if (*((unsigned char *)v71 + 24)) {
      int v24 = 89;
    }
    else {
      int v24 = 78;
    }
    *(_DWORD *)buf = 134220546;
    id v101 = self;
    __int16 v102 = 2112;
    uint64_t v103 = (uint64_t)v21;
    __int16 v104 = 2048;
    uint64_t v105 = v22;
    __int16 v106 = 2048;
    uint64_t v107 = v23;
    __int16 v108 = 2048;
    uint64_t v109 = v52;
    __int16 v110 = 2048;
    uint64_t v111 = v9;
    __int16 v112 = 2048;
    uint64_t v113 = v11;
    __int16 v114 = 1024;
    int v115 = v24;
    __int16 v116 = 2048;
    uint64_t v117 = v13;
    __int16 v118 = 2048;
    uint64_t v119 = v15;
    __int16 v120 = 2048;
    uint64_t v121 = v17;
    id v20 = log;
    _os_signpost_emit_with_name_impl(&dword_19B043000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ProcessPendingChanges", "%p: qos: %@, int: %tu, ext: %tu, ins: %tu, upd: %tu, del: %tu, unk: %c, tx#: %llu, tx cnt: %zd, ch cnt: %zd", buf, 0x6Cu);
  }
  uint64_t v25 = v20;
  uint64_t v26 = [(id)v94[5] count];
  if (v26 + [(id)v88[5] count] && (objc_msgSend((id)v75[5], "count") || *((unsigned char *)v71 + 24)))
  {
    objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", v52, log);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if ([v29 BOOLForKey:@"com.apple.PHPhotoLibrary.simulateEveryObjectChanged"])
    {
      BOOL v30 = *((unsigned char *)v71 + 24) == 0;

      if (!v30)
      {
LABEL_27:
        unint64_t v42 = [PHChange alloc];
        unint64_t v43 = [(PHChange *)v42 initWithChangedIdentifiers:v75[5] unknownMergeEvent:*((unsigned __int8 *)v71 + 24) library:self];
        unint64_t v44 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v45 = [(id)v94[5] count];
          uint64_t v46 = [(id)v88[5] count];
          uint64_t v47 = [(id)v82[5] count];
          BOOL v48 = [(PHChange *)v43 _pl_prettyDescription];
          *(_DWORD *)buf = 134218498;
          id v101 = (PHPhotoLibrary *)(v46 + v45);
          __int16 v102 = 2048;
          uint64_t v103 = v47;
          __int16 v104 = 2112;
          uint64_t v105 = (uint64_t)v48;
          _os_log_impl(&dword_19B043000, v44, OS_LOG_TYPE_DEBUG, "Handle merge notification observer count: %lu, result count: %lu, change: %@", buf, 0x20u);
        }
        id v49 = [(PHPhotoLibrary *)self changeHandlingPhotoLibrary];
        v50 = [v49 managedObjectContext];
        id v51 = [MEMORY[0x1E4F1CAD0] setWithArray:v82[5]];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3254779904;
        v57[2] = __40__PHPhotoLibrary__processPendingChanges__block_invoke_546;
        v57[3] = &unk_1EEABE1C8;
        id v58 = v3;
        long long v60 = &v93;
        long long v61 = &v87;
        os_signpost_id_t v63 = spid;
        uint64_t v64 = v55;
        long long v62 = v25;
        long long v59 = self;
        [(PHChange *)v43 preloadChangeDetailsForFetchResults:v51 inManagedObjectContext:v50 handler:v57];

        goto LABEL_30;
      }
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v31 = (id)v82[5];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v99 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v66 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v35 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            __int16 v36 = [v35 fetchedObjectIDsSet];

            if (v36)
            {
              uint64_t v37 = [v35 fetchedObjectIDsSet];
              [v29 unionSet:v37];
            }
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v99 count:16];
        }
        while (v32);
      }

      __int16 v38 = (void *)[(id)v75[5] mutableCopy];
      uint64_t v39 = (void *)[v29 copy];
      [v38 setObject:v39 forKeyedSubscript:v54];

      uint64_t v40 = [v38 copy];
      id v41 = (void *)v75[5];
      v75[5] = v40;
    }
    goto LABEL_27;
  }
  uint64_t v27 = v25;
  uint64_t v28 = v27;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v28, OS_SIGNPOST_INTERVAL_END, spid, "ProcessPendingChanges", "No changes", buf, 2u);
  }

  [(PHChangeHandlingDebugger *)self->_changeHandlingDebugger endCurrentEvent];
LABEL_30:

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v87, 8);

  _Block_object_dispose(&v93, 8);
}

void __40__PHPhotoLibrary__processPendingChanges__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  __int16 v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

uint64_t __40__PHPhotoLibrary__processPendingChanges__block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 320) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(a1[4] + 320) removeAllObjects];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 272);
  *(unsigned char *)(a1[4] + 272) = 0;
  return result;
}

void __40__PHPhotoLibrary__processPendingChanges__block_invoke_546(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(*(id *)(a1 + 32), "setDistributeInternalTimestamp:");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x19F389B10]();
        [v9 photoLibraryDidChange:v3];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v6);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(*(id *)(a1 + 32), "setDistributeExternalTimestamp:");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
        id v17 = (void *)MEMORY[0x19F389B10](v12);
        objc_msgSend(v16, "photoLibraryDidChange:", v3, (void)v22);
        ++v15;
      }
      while (v13 != v15);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
      uint64_t v13 = v12;
    }
    while (v12);
  }

  uint64_t v18 = *(id *)(a1 + 64);
  id v19 = v18;
  os_signpost_id_t v20 = *(void *)(a1 + 72);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    uint64_t v21 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 134217984;
    uint64_t v31 = v21;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v19, OS_SIGNPOST_INTERVAL_END, v20, "ProcessPendingChanges", "fr cnt: %tu", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 248) endCurrentEvent];
}

- (void)_publishCloudStatusChange
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = [(PHChangeHandlingDebugger *)self->_changeHandlingDebugger beginPublishCloudStatusChange];
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  uint64_t v55 = __Block_byref_object_copy__20217;
  id v56 = __Block_byref_object_dispose__20218;
  id v57 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = __Block_byref_object_copy__20217;
  v50 = __Block_byref_object_dispose__20218;
  id v51 = 0;
  observerRegistrar = self->_observerRegistrar;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __43__PHPhotoLibrary__publishCloudStatusChange__block_invoke;
  v45[3] = &unk_1E5844E88;
  v45[4] = &v52;
  v45[5] = &v46;
  [(PHPhotoLibraryObserverRegistrar *)observerRegistrar getObserversWithBlock:v45];
  objc_msgSend(v3, "setInternalObserversCount:", objc_msgSend((id)v53[5], "count"));
  objc_msgSend(v3, "setExternalObserversCount:", objc_msgSend((id)v47[5], "count"));
  uint64_t v5 = [(PHPhotoLibrary *)self _cachedCloudStatus];
  objc_msgSend(v3, "setCloudSyncEnabled:", objc_msgSend(v5, "isCloudSyncEnabled"));
  uint64_t v6 = [v5 lastSyncDate];
  [v6 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setLastSyncTimestamp:");

  uint64_t v7 = [v5 firstSyncDate];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setFirstSyncTimestamp:");

  PLChangeHandlingGetLog();
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t spid = os_signpost_id_generate(v8);

  id v9 = v8;
  uint64_t v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    qos_class_self();
    PLShortStringFromQoSClass();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [(id)v53[5] count];
    uint64_t v13 = [(id)v47[5] count];
    int v14 = [v5 isCloudSyncEnabled];
    *(_DWORD *)buf = 134219010;
    long long v61 = self;
    __int16 v62 = 2112;
    id v63 = v11;
    __int16 v64 = 2048;
    uint64_t v65 = v12;
    __int16 v66 = 2048;
    uint64_t v67 = v13;
    __int16 v68 = 1024;
    int v69 = v14;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PublishCloudStatusChange", "%p: qos: %@, int: %tu, ext: %tu, sync: %d", buf, 0x30u);
  }
  uint64_t v35 = v10;

  uint64_t v15 = [(id)v53[5] count];
  if (v15 + [(id)v47[5] count])
  {
    __int16 v16 = [[PHChange alloc] initWithCloudStatus:v5 library:self];
    id v17 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [(id)v53[5] count];
      uint64_t v19 = [(id)v47[5] count];
      os_signpost_id_t v20 = [(PHChange *)v16 _pl_prettyDescription];
      *(_DWORD *)buf = 134218242;
      long long v61 = (PHPhotoLibrary *)(v19 + v18);
      __int16 v62 = 2112;
      id v63 = v20;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "Publish cloud status change observer count: %lu, change: %@", buf, 0x16u);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setDistributeInternalTimestamp:");
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v21 = (id)v53[5];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v59 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v25 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          long long v26 = (void *)MEMORY[0x19F389B10]();
          [v25 photoLibraryDidChange:v16];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v59 count:16];
      }
      while (v22);
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setDistributeExternalTimestamp:");
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v27 = (id)v47[5];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          uint64_t v32 = (void *)MEMORY[0x19F389B10]();
          [v31 photoLibraryDidChange:v16];
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v58 count:16];
      }
      while (v28);
    }
  }
  uint64_t v33 = v35;
  uint64_t v34 = v33;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v34, OS_SIGNPOST_INTERVAL_END, spid, "PublishCloudStatusChange", (const char *)&unk_19B30018E, buf, 2u);
  }

  [(PHChangeHandlingDebugger *)self->_changeHandlingDebugger endCurrentEvent];
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

void __43__PHPhotoLibrary__publishCloudStatusChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)_publishChangeToObserversIfAuthorized:(id)a3
{
  id v6 = a3;
  if ((unint64_t)(+[PHPhotoLibrary authorizationStatusForAccessLevel:2]- 3) <= 1)
  {
    observerRegistrar = self->_observerRegistrar;
    id v5 = +[PHChange handlerQueue];
    [(PHPhotoLibraryObserverRegistrar *)observerRegistrar publishChangesToObserversOnQueue:v5 withBlock:v6];
  }
}

- (void)handleMergeNotification:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PHPhotoLibrary *)self _notifyPersistentChangeObservers];
  id v17 = v4;
  id v21 = [v4 userInfo];
  id v5 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F8B798]];
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
    os_signpost_id_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = [MEMORY[0x1E4F8A980] changeNotificationObjectIDMutationKeys];
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v7)
    {
      char v8 = 0;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v11 = [MEMORY[0x1E4F1CA48] array];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v12 = [v21 objectForKeyedSubscript:v10];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v41 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v12);
                }
                __int16 v16 = +[PHPhotoLibrary uniquedOID:*(void *)(*((void *)&v28 + 1) + 8 * j)];
                [v11 addObject:v16];
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v41 count:16];
            }
            while (v13);
            char v8 = 1;
          }

          [v20 setObject:v11 forKey:v10];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v7);

      if ((v8 & 1) == 0) {
        goto LABEL_21;
      }
      location[1] = (id)MEMORY[0x1E4F143A8];
      location[2] = (id)3221225472;
      location[3] = __42__PHPhotoLibrary_handleMergeNotification___block_invoke_2;
      location[4] = &unk_1E5848EC0;
      id v25 = v20;
      long long v26 = self;
      id v27 = v21;
      pl_dispatch_sync();

      obuint64_t j = v25;
    }

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  long long v38 = __42__PHPhotoLibrary_handleMergeNotification___block_invoke;
  long long v39 = &unk_1E5848578;
  long long v40 = self;
  pl_dispatch_sync();
LABEL_22:
  objc_initWeak(location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __42__PHPhotoLibrary_handleMergeNotification___block_invoke_3;
  v22[3] = &unk_1E58479D0;
  objc_copyWeak(&v23, location);
  [(PHPhotoLibrary *)self _publishChangeToObserversIfAuthorized:v22];
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

uint64_t __42__PHPhotoLibrary_handleMergeNotification___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 272) = 1;
  return result;
}

void __42__PHPhotoLibrary_handleMergeNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v2 = [MEMORY[0x1E4F8A980] changeNotificationObjectIDMutationKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v99 objects:v106 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v100 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v99 + 1) + 8 * i);
        char v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        if ([v8 count])
        {
          uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 320) objectForKeyedSubscript:v7];
          if (!v9)
          {
            uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
            [*(id *)(*(void *)(a1 + 40) + 320) setObject:v9 forKeyedSubscript:v7];
          }
          [v9 addObjectsFromArray:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v99 objects:v106 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F1BDB8]];
  uint64_t v11 = [v10 count];
  uint64_t v12 = *MEMORY[0x1E4F1BDF0];
  uint64_t v13 = a1;
  uint64_t v14 = (uint64_t *)MEMORY[0x1E4F1BFA0];
  id v78 = v10;
  if (v11)
  {
    uint64_t v15 = [*(id *)(*(void *)(v13 + 40) + 320) objectForKeyedSubscript:v12];
    uint64_t v16 = v13;
    uint64_t v17 = *v14;
    uint64_t v18 = objc_msgSend(*(id *)(*(void *)(v13 + 40) + 320), "objectForKeyedSubscript:");
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v95 objects:v105 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v96;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v96 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v95 + 1) + 8 * j);
          [v15 removeObject:v24];
          [v18 removeObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v95 objects:v105 count:16];
      }
      while (v21);
    }

    uint64_t v25 = v17;
  }
  else
  {
    uint64_t v16 = v13;
    uint64_t v25 = *MEMORY[0x1E4F1BFA0];
  }
  long long v26 = [*(id *)(*(void *)(v16 + 40) + 320) objectForKeyedSubscript:v12];
  uint64_t v86 = v16;
  id v77 = v26;
  if ([v26 count])
  {
    uint64_t v82 = v25;
    obuint64_t j = [*(id *)(*(void *)(v16 + 40) + 320) objectForKeyedSubscript:v25];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v27 = v26;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v91 objects:v104 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      long long v30 = 0;
      long long v31 = 0;
      uint64_t v32 = *(void *)v92;
      uint64_t v33 = *MEMORY[0x1E4F8B7A8];
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          long long v35 = v31;
          if (*(void *)v92 != v32) {
            objc_enumerationMutation(v27);
          }
          uint64_t v36 = *(void *)(*((void *)&v91 + 1) + 8 * k);
          long long v31 = [*(id *)(*(void *)(v86 + 40) + 320) objectForKeyedSubscript:v33];

          uint64_t v37 = [*(id *)(v86 + 48) objectForKeyedSubscript:v33];

          long long v38 = [v31 objectForKeyedSubscript:v36];
          if (v38)
          {
            long long v30 = v37;
          }
          else
          {
            long long v30 = v37;
            long long v39 = [v37 objectForKeyedSubscript:v36];

            if (!v39) {
              [obj removeObject:v36];
            }
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v91 objects:v104 count:16];
      }
      while (v29);
    }
    else
    {
      long long v30 = 0;
      long long v31 = 0;
    }
    uint64_t v81 = v30;

    uint64_t v16 = v86;
    uint64_t v25 = v82;
  }
  else
  {
    uint64_t v81 = 0;
    long long v31 = 0;
  }
  long long v40 = [*(id *)(v16 + 32) objectForKeyedSubscript:v25];
  long long v41 = [*(id *)(*(void *)(v16 + 40) + 320) objectForKeyedSubscript:v25];
  if ([v40 count])
  {
    uint64_t v42 = *MEMORY[0x1E4F8B7A0];
    v80 = [*(id *)(*(void *)(v16 + 40) + 320) objectForKeyedSubscript:*MEMORY[0x1E4F8B7A0]];
    if (!v80)
    {
      v80 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(*(id *)(*(void *)(v86 + 40) + 320), "setObject:forKeyedSubscript:");
    }
    if (!v31)
    {
      uint64_t v43 = *MEMORY[0x1E4F8B7A8];
      long long v31 = [*(id *)(*(void *)(v86 + 40) + 320) objectForKeyedSubscript:*MEMORY[0x1E4F8B7A8]];
      if (!v31)
      {
        long long v31 = [MEMORY[0x1E4F1CA60] dictionary];
        [*(id *)(*(void *)(v86 + 40) + 320) setObject:v31 forKeyedSubscript:v43];
      }
    }
    id v79 = [*(id *)(v86 + 48) objectForKeyedSubscript:v42];
    if (!v81)
    {
      uint64_t v81 = [*(id *)(v86 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F8B7A8]];
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v76 = v40;
    id obja = v40;
    uint64_t v44 = [obja countByEnumeratingWithState:&v87 objects:v103 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v88;
      do
      {
        uint64_t v47 = 0;
        uint64_t v83 = v45;
        do
        {
          if (*(void *)v88 != v46) {
            objc_enumerationMutation(obja);
          }
          uint64_t v48 = *(void *)(*((void *)&v87 + 1) + 8 * v47);
          if ([v41 containsObject:v48])
          {
            id v49 = [v80 objectForKeyedSubscript:v48];
            uint64_t v50 = [v49 unsignedLongLongValue];
            [v79 objectForKeyedSubscript:v48];
            uint64_t v51 = v46;
            v53 = uint64_t v52 = v41;
            uint64_t v54 = [v53 unsignedLongLongValue] | v50;

            uint64_t v55 = [v31 objectForKeyedSubscript:v48];
            uint64_t v56 = [v55 unsignedLongLongValue];
            id v57 = [v81 objectForKeyedSubscript:v48];
            uint64_t v58 = [v57 unsignedLongLongValue] | v56;

            long long v59 = [NSNumber numberWithUnsignedLongLong:v54];
            [v80 setObject:v59 forKeyedSubscript:v48];

            uint64_t v60 = v58;
            long long v41 = v52;
            uint64_t v46 = v51;
            uint64_t v45 = v83;
            long long v61 = [NSNumber numberWithUnsignedLongLong:v60];
            [v31 setObject:v61 forKeyedSubscript:v48];
          }
          ++v47;
        }
        while (v45 != v47);
        uint64_t v45 = [obja countByEnumeratingWithState:&v87 objects:v103 count:16];
      }
      while (v45);
    }

    long long v40 = v76;
  }
  uint64_t v62 = *MEMORY[0x1E4F8ADB0];
  id v63 = [*(id *)(v86 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F8ADB0]];
  [*(id *)(*(void *)(v86 + 40) + 320) setObject:v63 forKeyedSubscript:v62];

  uint64_t v64 = *MEMORY[0x1E4F8B788];
  uint64_t v65 = [*(id *)(*(void *)(v86 + 40) + 320) objectForKeyedSubscript:*MEMORY[0x1E4F8B788]];
  uint64_t v66 = [v65 integerValue];

  uint64_t v67 = [*(id *)(v86 + 48) objectForKeyedSubscript:v64];
  uint64_t v68 = [v67 integerValue];

  int v69 = [NSNumber numberWithInteger:v68 + v66];
  [*(id *)(*(void *)(v86 + 40) + 320) setObject:v69 forKeyedSubscript:v64];

  uint64_t v70 = *MEMORY[0x1E4F8AD18];
  uint64_t v71 = [*(id *)(*(void *)(v86 + 40) + 320) objectForKeyedSubscript:*MEMORY[0x1E4F8AD18]];
  uint64_t v72 = [v71 integerValue];

  char v73 = [*(id *)(v86 + 48) objectForKeyedSubscript:v70];
  uint64_t v74 = [v73 integerValue];

  uint64_t v75 = [NSNumber numberWithInteger:v74 + v72];
  [*(id *)(*(void *)(v86 + 40) + 320) setObject:v75 forKeyedSubscript:v70];
}

void __42__PHPhotoLibrary_handleMergeNotification___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processPendingChanges];
}

- (NSManagedObjectID)projectAlbumRootFolderObjectID
{
  return (NSManagedObjectID *)[(PLLazyObject *)self->_lazyProjectAlbumRootFolderObjectID objectValue];
}

- (void)setCustomLibrarySpecificFetchOptions:(id)a3
{
  uint64_t v4 = (PHFetchOptions *)[a3 copy];
  customLibrarySpecificFetchOptions = self->_customLibrarySpecificFetchOptions;
  self->_customLibrarySpecificFetchOptions = v4;
}

void __33__PHPhotoLibrary_allowedEntities__block_invoke_2()
{
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v1 = objc_msgSend(v0, "setWithObjects:", @"Asset", v3, @"MomentShare", @"ShareParticipant", 0);
  uint64_t v2 = (void *)allowedEntities_pl_once_object_80;
  allowedEntities_pl_once_object_80 = v1;
}

- (id)fetchUpdatedObject:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectID];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  int v6 = [(PHPhotoLibrary *)self fetchPHObjectsForOIDs:v5];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (id)fetchPHObjectsForUUIDs:(id)a3 entityName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    uint64_t v9 = [(PHPhotoLibrary *)self managedObjectContext];
    uint64_t v10 = +[PHPhotoLibrary PHObjectClassForEntityName:v7];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__PHPhotoLibrary_fetchPHObjectsForUUIDs_entityName___block_invoke;
    v13[3] = &unk_1E5844E60;
    id v14 = v7;
    id v15 = v6;
    id v16 = v9;
    id v19 = v10;
    uint64_t v17 = self;
    id v18 = v8;
    id v11 = v9;
    [v11 performBlockAndWait:v13];
  }

  return v8;
}

void __52__PHPhotoLibrary_fetchPHObjectsForUUIDs_entityName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", *(void *)(a1 + 40)];
  [v2 setPredicate:v3];

  uint64_t v4 = [*(id *)(a1 + 72) propertiesToFetchWithHint:2];
  [v2 setPropertiesToFetch:v4];

  [v2 setResultType:2];
  uint64_t v5 = [*(id *)(a1 + 48) executeFetchRequest:v2 error:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)[objc_alloc(*(Class *)(a1 + 72)) initWithFetchDictionary:*(void *)(*((void *)&v11 + 1) + 8 * v9) propertyHint:2 photoLibrary:*(void *)(a1 + 56)];
        [*(id *)(a1 + 64) addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)fetchPropertiesByOID:(id)a3 propertyNamesByEntityName:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v6 count])
  {
    uint64_t v25 = v8;
    long long v26 = v7;
    uint64_t v24 = [(PHPhotoLibrary *)self objectFetchingContextForCurrentQueueQoS];
    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v16 = [v15 entity];
          uint64_t v17 = [v16 name];
          id v18 = [v9 objectForKey:v17];
          if (v18)
          {
            id v19 = v18;
            [v18 addObject:v15];
          }
          else
          {
            id v19 = [MEMORY[0x1E4F1CA48] arrayWithObject:v15];
            [v9 setObject:v19 forKey:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__PHPhotoLibrary_fetchPropertiesByOID_propertyNamesByEntityName___block_invoke;
    v27[3] = &unk_1E5848078;
    id v28 = v9;
    id v7 = v26;
    id v29 = v26;
    id v30 = v24;
    id v31 = v10;
    id v8 = v25;
    id v32 = v25;
    id v20 = v24;
    id v21 = v9;
    [v20 performBlockAndWait:v27];
  }
  uint64_t v22 = (void *)[v8 copy];

  return v22;
}

void __65__PHPhotoLibrary_fetchPropertiesByOID_propertyNamesByEntityName___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v20 setName:@"self"];
  uint64_t v2 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v20 setExpression:v2];

  [v20 setExpressionResultType:2000];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v22 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        context = (void *)MEMORY[0x19F389B10]();
        uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
        if ([v5 count])
        {
          uint64_t v24 = [*(id *)(a1 + 32) objectForKey:v4];
          long long v26 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v4];
          [v26 setResultType:2];
          id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v24];
          [v26 setPredicate:v6];

          id v7 = [v5 allObjects];
          id v8 = [v7 arrayByAddingObject:v20];
          [v26 setPropertiesToFetch:v8];

          uint64_t v9 = *(void **)(a1 + 48);
          id v31 = 0;
          id v10 = [v9 executeFetchRequest:v26 error:&v31];
          id v23 = v31;
          if (!v10)
          {
            uint64_t v11 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              uint64_t v12 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412546;
              id v38 = v23;
              __int16 v39 = 2114;
              uint64_t v40 = v12;
              _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "error: %@ while building fetch dictionaries from OIDs: %{public}@", buf, 0x16u);
            }
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v13 = v10;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                id v18 = [v17 objectForKeyedSubscript:@"self"];
                [*(id *)(a1 + 64) setObject:v17 forKey:v18];
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }
            while (v14);
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v22);
  }
}

- (id)_graphBasedPHObjectsForOIDs:(id)a3 propertyHint:(unint64_t)a4 includeTrash:(BOOL)a5
{
  id v7 = a3;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v9 = [(PHPhotoLibrary *)self graphObjectFetchingPhotoLibrary];
  id v10 = [v9 managedObjectContext];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PHPhotoLibrary__graphBasedPHObjectsForOIDs_propertyHint_includeTrash___block_invoke;
  v17[3] = &unk_1E5844E10;
  id v18 = v10;
  id v19 = v7;
  id v20 = self;
  SEL v22 = a2;
  id v11 = v8;
  id v21 = v11;
  id v12 = v7;
  id v13 = v10;
  [v13 performBlockAndWait:v17];
  uint64_t v14 = v21;
  id v15 = v11;

  return v15;
}

void __72__PHPhotoLibrary__graphBasedPHObjectsForOIDs_propertyHint_includeTrash___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
  id v48 = 0;
  char v4 = [v2 setQueryGenerationFromToken:v3 error:&v48];
  id v5 = v48;

  if (v4)
  {

    id v6 = [MEMORY[0x1E4F8A858] fetchRequest];
    v50[0] = @"values";
    v50[1] = @"edgesIn";
    v50[2] = @"edgesOut";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
    [v6 setRelationshipKeyPathsForPrefetching:v7];

    [v6 setResultType:0];
    [v6 setReturnsObjectsAsFaults:0];
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", *(void *)(v1 + 40)];
    [v6 setPredicate:v8];

    uint64_t v9 = *(void **)(v1 + 32);
    id v47 = 0;
    __int16 v39 = v6;
    id v10 = [v9 executeFetchRequest:v6 error:&v47];
    id v38 = v47;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (!v12) {
      goto LABEL_15;
    }
    uint64_t v13 = v12;
    unint64_t v14 = 0x1E4F8A000uLL;
    unint64_t v15 = 0x1E4F8A000uLL;
    uint64_t v16 = *(void *)v44;
    uint64_t v17 = &off_1E5840000;
    uint64_t v40 = *(void *)v44;
    id v41 = v11;
    while (1)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v11);
        }
        id v19 = (void *)[*(id *)(v14 + 2144) newNodeContainerWithNode:*(void *)(*((void *)&v43 + 1) + 8 * v18)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = (objc_class *)v17[338];
LABEL_11:
          id v21 = (void *)[[v20 alloc] initWithNodeContainer:v19 photoLibrary:*(void *)(v1 + 48)];
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = (objc_class *)PHSearchEntity;
          goto LABEL_11;
        }
        SEL v22 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v23 = *(void *)(v1 + 64);
        uint64_t v24 = *(void *)(v1 + 48);
        uint64_t v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        uint64_t v26 = v1;
        uint64_t v27 = v13;
        unint64_t v28 = v15;
        v30 = unint64_t v29 = v14;
        uint64_t v31 = v23;
        uint64_t v17 = &off_1E5840000;
        uint64_t v32 = v24;
        id v11 = v41;
        [v22 handleFailureInMethod:v31, v32, @"PHPhotoLibrary.m", 2455, @"Unsupported node container type: %@", v30 object file lineNumber description];

        unint64_t v14 = v29;
        unint64_t v15 = v28;
        uint64_t v13 = v27;
        uint64_t v1 = v26;
        uint64_t v16 = v40;

        id v21 = 0;
LABEL_13:
        [*(id *)(v1 + 56) addObject:v21];

        ++v18;
      }
      while (v13 != v18);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (!v13)
      {
LABEL_15:

        long long v33 = *(void **)(v1 + 32);
        id v42 = 0;
        int v34 = [v33 setQueryGenerationFromToken:0 error:&v42];
        id v35 = v42;
        if (v34)
        {
          [*(id *)(v1 + 32) reset];
        }
        else
        {
          uint64_t v37 = PLBackendGetLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v52 = v35;
            _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_ERROR, "Failed to un-pin moc from query generation with error: %@", buf, 0xCu);
          }
        }
        long long v36 = v38;
        id v5 = v39;
        goto LABEL_23;
      }
    }
  }
  long long v36 = PLBackendGetLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v5;
    _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_FAULT, "Failed to pin moc to current generation with error: %@", buf, 0xCu);
  }
LABEL_23:
}

- (id)fetchPHObjectsForOIDs:(id)a3
{
  return [(PHPhotoLibrary *)self fetchPHObjectsForOIDs:a3 propertyHint:2 includeTrash:1 overrideResultsWithClass:0];
}

- (id)queryForType:(id)a3 withIdentifiers:(id)a4 local:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((unint64_t)[v16 length] >= 0x25)
        {
          uint64_t v17 = [v16 substringToIndex:36];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            [v10 addObject:v17];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    if (v5) {
      id v19 = @"uuid IN (%@)";
    }
    else {
      id v19 = @"cloudAssetGUID IN (%@)";
    }
    id v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v19, v10);
    id v21 = +[PHQuery queryForType:v8 withBasePredicate:v20 inLibrary:self];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)_urlForApplicationDataFolderIdentifier:(int64_t)a3 pathManager:(id)a4 error:(id *)a5
{
  id v9 = a4;
  if (!v9)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PHPhotoLibrary.m", 2182, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  switch(a3)
  {
    case 1:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      long long v33 = 0;
      id v11 = [v9 privateCacheDirectoryWithSubType:4 createIfNeeded:1 error:&v33];
      uint64_t v12 = v33;
      goto LABEL_20;
    case 2:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v32 = 0;
      id v11 = [v9 privateCacheDirectoryWithSubType:5 createIfNeeded:1 error:&v32];
      uint64_t v12 = v32;
      goto LABEL_20;
    case 3:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v31 = 0;
      id v11 = [v9 privateCacheDirectoryWithSubType:6 createIfNeeded:1 error:&v31];
      uint64_t v12 = v31;
      goto LABEL_20;
    case 4:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      long long v30 = 0;
      id v11 = [v9 privateCacheDirectoryWithSubType:7 createIfNeeded:1 error:&v30];
      uint64_t v12 = v30;
      goto LABEL_20;
    case 5:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      unint64_t v29 = 0;
      id v11 = [v9 privateDirectoryWithSubType:0 createIfNeeded:1 error:&v29];
      uint64_t v12 = v29;
      goto LABEL_20;
    case 6:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v28 = 0;
      id v11 = [v9 photoDirectoryWithType:16 createIfNeeded:1 error:&v28];
      uint64_t v12 = v28;
      goto LABEL_20;
    case 7:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v27 = 0;
      id v11 = [v9 photoDirectoryWithType:15 createIfNeeded:1 error:&v27];
      uint64_t v12 = v27;
      goto LABEL_20;
    case 8:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      long long v26 = 0;
      id v11 = [v9 photoDirectoryWithType:33 leafType:1 additionalPathComponents:@"ExternalEditSessions" createIfNeeded:1 error:&v26];
      uint64_t v12 = v26;
      goto LABEL_20;
    case 9:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      long long v25 = 0;
      id v11 = [v9 photoDirectoryWithType:17 createIfNeeded:1 error:&v25];
      uint64_t v12 = v25;
      goto LABEL_20;
    case 10:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      long long v24 = 0;
      id v11 = [v9 photoDirectoryWithType:20 createIfNeeded:1 error:&v24];
      uint64_t v12 = v24;
      goto LABEL_20;
    case 11:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      long long v23 = 0;
      id v11 = [v9 internalDirectoryWithSubType:3 additionalPathComponents:0 createIfNeeded:1 error:&v23];
      uint64_t v12 = v23;
      goto LABEL_20;
    case 12:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      SEL v22 = 0;
      id v11 = [v9 internalDirectoryWithSubType:4 additionalPathComponents:0 createIfNeeded:1 error:&v22];
      uint64_t v12 = v22;
      goto LABEL_20;
    case 13:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      id v21 = 0;
      id v11 = [v9 internalDirectoryWithSubType:5 additionalPathComponents:0 createIfNeeded:1 error:&v21];
      uint64_t v12 = v21;
      goto LABEL_20;
    case 14:
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      id v20 = 0;
      id v11 = [v9 privateCacheDirectoryWithSubType:16 createIfNeeded:1 error:&v20];
      uint64_t v12 = v20;
LABEL_20:
      id v15 = v12;
      goto LABEL_21;
    default:
      id v34 = 0;
      int v13 = [v9 validateCreationRequestWithError:&v34];
      id v14 = v34;
      id v15 = v14;
      if (v13)
      {
        id v10 = (void *)MEMORY[0x1E4F1CB10];
        id v11 = [v9 photoDirectoryWithType:28];
LABEL_21:
        uint64_t v16 = [v10 fileURLWithPath:v11 isDirectory:1];

        if (v15) {
          goto LABEL_22;
        }
LABEL_26:
        id v17 = v16;
        goto LABEL_27;
      }
      uint64_t v16 = 0;
      if (!v14) {
        goto LABEL_26;
      }
LABEL_22:
      id v17 = 0;
      if (a5) {
        *a5 = v15;
      }
LABEL_27:

      return v17;
  }
}

- (id)urlForApplicationDataFolderIdentifier:(int64_t)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(PHPhotoLibrary *)self pathManager];
  if (!v7)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"pathManager is nil";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v9 = [v11 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v12];

    int v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v17 = "-[PHPhotoLibrary urlForApplicationDataFolderIdentifier:error:]";
      __int16 v18 = 2112;
      int64_t v19 = (int64_t)v9;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "%{public}s: Failed to access path manager for application folder identifier. Error: %@", buf, 0x16u);
    }

    if (!a4) {
      goto LABEL_8;
    }
LABEL_12:
    id v9 = v9;
    id v8 = 0;
    *a4 = v9;
    goto LABEL_13;
  }
  if ([(PHPhotoLibrary *)self _isApplicationOwnedFolderWithApplicationDataFolderIdentifier:a3])
  {
    [(PHPhotoLibrary *)self _openApplicationOwnedFoldersIfNecessary];
  }
  id v15 = 0;
  id v8 = [(PHPhotoLibrary *)self _urlForApplicationDataFolderIdentifier:a3 pathManager:v7 error:&v15];
  id v9 = v15;
  if (!v8)
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v17 = "-[PHPhotoLibrary urlForApplicationDataFolderIdentifier:error:]";
      __int16 v18 = 2048;
      int64_t v19 = a3;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create directories for application folder identifier %td. Error: %@", buf, 0x20u);
    }

    if (!a4)
    {
LABEL_8:
      id v8 = 0;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (id)urlForApplicationDataFolderIdentifier:(int64_t)a3
{
  return [(PHPhotoLibrary *)self urlForApplicationDataFolderIdentifier:a3 error:0];
}

- (BOOL)_isApplicationOwnedFolderWithApplicationDataFolderIdentifier:(int64_t)a3
{
  return ((unint64_t)a3 < 0xF) & (0x403Eu >> a3);
}

- (BOOL)_openApplicationOwnedFoldersIfNecessary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __57__PHPhotoLibrary__openApplicationOwnedFoldersIfNecessary__block_invoke;
  v5[3] = &unk_1E5848D28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __57__PHPhotoLibrary__openApplicationOwnedFoldersIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 208)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 224) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v4 = [*(id *)(a1 + 32) assetsdClient];
    BOOL v5 = [v4 libraryClient];
    id v10 = 0;
    char v6 = [v5 openApplicationOwnedFoldersWithError:&v10];
    id v7 = v10;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      char v8 = 1;
    }
    else
    {
      char v9 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "failed to open application owned folders %@", buf, 0xCu);
      }

      char v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 224) = v8;
  }
}

- (void)setChangeRequest:(id)a3 forUUID:(id)a4
{
  id v7 = a4;
  id v11 = a3;
  if (PLIsAssetsd())
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2100 description:@"cannot be run from assetsd"];

    if (v7) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  char v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2101 description:@"uuid is a required argument"];

LABEL_3:
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2102 description:@"changeRequest is a required argument"];
  }
  [(PHPhotoLibrary *)self assertTransaction];
  [(PHPerformChangesRequest *)self->_performChangesRequest setChangeRequest:v11 forUUID:v7];
}

- (id)changeRequestForUUID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2093 description:@"uuid is a required argument"];
  }
  [(PHPhotoLibrary *)self assertTransaction];
  char v6 = [(PHPerformChangesRequest *)self->_performChangesRequest changeRequestForUUID:v5];

  return v6;
}

- (void)recordOtherChangeRequest:(id)a3
{
  id v5 = a3;
  if (PLIsAssetsd())
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2087 description:@"cannot be run from assetsd"];
  }
  id v7 = [(id)objc_opt_class() photoLibraryForCurrentTransaction];
  [v7[39] recordOtherChangeRequest:v5];
}

- (void)recordDeleteRequest:(id)a3
{
  id v5 = a3;
  if (PLIsAssetsd())
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2080 description:@"cannot be run from assetsd"];
  }
  id v7 = [(id)objc_opt_class() photoLibraryForCurrentTransaction];
  [v7[39] recordDeleteRequest:v5];
}

- (void)recordUpdateRequest:(id)a3
{
  id v5 = a3;
  if (PLIsAssetsd())
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2073 description:@"cannot be run from assetsd"];
  }
  id v7 = [(id)objc_opt_class() photoLibraryForCurrentTransaction];
  [v7[39] recordUpdateRequest:v5];
}

- (void)recordInsertRequest:(id)a3
{
  id v5 = a3;
  if (PLIsAssetsd())
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:2066 description:@"cannot be run from assetsd"];
  }
  id v7 = [(id)objc_opt_class() photoLibraryForCurrentTransaction];
  [v7[39] recordInsertRequest:v5];
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend((id)objc_opt_class(), "stringFromPHPhotoLibraryType:", -[PHPhotoLibrary type](self, "type"));
  char v6 = [(PHPhotoLibrary *)self photoLibraryURL];
  id v7 = [v6 path];
  char v8 = [v3 stringWithFormat:@"<%@: %p> type:%@ path:%@", v4, self, v5, v7];

  return (NSString *)v8;
}

- (void)assertTransaction
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (PLIsAssetsd()) {
    return;
  }
  uint64_t v2 = [(id)objc_opt_class() photoLibraryForCurrentTransaction];
  if (!v2)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    id v5 = @"This method can only be called from inside of -[PHPhotoLibrary performChanges:completionHandler:] or -[PHPhotoLibrary performChangesAndWait:error:]";
    goto LABEL_11;
  }
  if (v2 != self)
  {
    id v10 = v2;
    char v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(PHPhotoLibrary *)self debugDescription];
      char v8 = [(PHPhotoLibrary *)v10 debugDescription];
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Wrong instance: (%@) used during perform transaction for (%@)", buf, 0x16u);
    }
    BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    id v5 = @"Using wrong PHPhotoLibrary instance in perform transaction";
LABEL_11:
    objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0, v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
}

uint64_t __46__PHPhotoLibrary_performChangesAndWait_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)_performCancellableChangesAndWait:(void *)a3 withInstrumentation:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v18 = 0;
    int64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__20217;
    uint64_t v16 = __Block_byref_object_dispose__20218;
    id v17 = 0;
    id v9 = +[PHSynchronousPhotoLibraryExecutionContext synchronousExecutionContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __78__PHPhotoLibrary__performCancellableChangesAndWait_withInstrumentation_error___block_invoke;
    v11[3] = &unk_1E5844DC0;
    v11[4] = &v18;
    v11[5] = &v12;
    -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:onExecutionContext:completionHandler:](a1, v7, v8, v9, v11);

    -[PHPerformChangesInstrumentation endPerformChangesWithSuccess:error:]((uint64_t)v8, *((unsigned __int8 *)v19 + 24), (void *)v13[5]);
    if (*((unsigned char *)v19 + 24))
    {
      a4 = 1;
    }
    else if (a4)
    {
      *(void *)a4 = (id) v13[5];
      a4 = *((unsigned char *)v19 + 24) != 0;
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

void __78__PHPhotoLibrary__performCancellableChangesAndWait_withInstrumentation_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)_performCancellableChanges:(void *)a3 withInstrumentation:(void *)a4 onExecutionContext:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1 + 304);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__PHPhotoLibrary__performCancellableChanges_withInstrumentation_onExecutionContext_completionHandler___block_invoke;
  v18[3] = &unk_1E5844DE8;
  void v18[4] = a1;
  id v14 = v9;
  id v21 = v14;
  id v15 = v11;
  id v19 = v15;
  id v16 = v10;
  id v20 = v16;
  id v17 = v12;
  id v22 = v17;
  [v15 dispatchOnQueue:v13 block:v18];
}

uint64_t __102__PHPhotoLibrary__performCancellableChanges_withInstrumentation_onExecutionContext_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginTransaction];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) performChangesRequest];
  uint64_t v3 = [v2 determineAuthorizationStatusForChanges];

  if ((unint64_t)(v3 - 3) > 1)
  {
    uint64_t v4 = [*(id *)(a1 + 32) performChangesRequest];
    if ([v4 accessScopeOptionsRequiredForRequestedChanges] == 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }

    [*(id *)(a1 + 32) _denyTransactionOnExecutionContext:*(void *)(a1 + 40) withInstrumentation:*(void *)(a1 + 48) authorizationStatus:v3 accessLevel:v5 completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    char v6 = (void *)MEMORY[0x19F389B10]();
    [*(id *)(a1 + 32) _commitTransactionOnExecutionContext:*(void *)(a1 + 40) withInstrumentation:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 64)];
  }
  return [*(id *)(a1 + 32) _endTransaction];
}

uint64_t __51__PHPhotoLibrary_performChanges_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performCancellableChanges:(void *)a3 withInstrumentation:(void *)a4 completionHandler:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = a2;
    id v10 = +[PHAsynchronousPhotoLibraryExecutionContext asynchronousExecutionContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __83__PHPhotoLibrary__performCancellableChanges_withInstrumentation_completionHandler___block_invoke;
    v11[3] = &unk_1E58465A8;
    id v12 = v7;
    id v13 = v8;
    -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:onExecutionContext:completionHandler:](a1, v9, v12, v10, v11);
  }
}

void __83__PHPhotoLibrary__performCancellableChanges_withInstrumentation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  -[PHPerformChangesInstrumentation endPerformChangesWithSuccess:error:](*(void *)(a1 + 32), a2, v6);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (BOOL)performCancellableChangesAndWait:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performCancellableChangesAndWait:");
  LOBYTE(a4) = -[PHPhotoLibrary _performCancellableChangesAndWait:withInstrumentation:error:]((uint64_t)self, v6, v7, (uint64_t)a4);

  return (char)a4;
}

- (void)performCancellableChanges:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performCancellableChanges:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:completionHandler:]((uint64_t)self, v7, v8, v6);
}

- (BOOL)_preflightRequest:(id)a3 withError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v22 = a3;
  obuint64_t j = [v22 requestSets];
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v34;
    BOOL v9 = 1;
    uint64_t v23 = *(void *)v34;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        if (!v9)
        {
          BOOL v9 = 0;
          goto LABEL_27;
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (!v13)
        {
          BOOL v9 = 1;
          goto LABEL_26;
        }
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v28 = v7;
            char v18 = [v17 prepareForServicePreflightCheck:&v28];
            id v19 = v28;

            if ((v18 & 1) == 0)
            {
              if (!a4)
              {
                BOOL v9 = 0;
                id v7 = v19;
LABEL_25:
                uint64_t v8 = v23;
                uint64_t v6 = v24;
                goto LABEL_26;
              }
LABEL_23:
              uint64_t v8 = v23;
              uint64_t v6 = v24;
              id v7 = v19;
              BOOL v9 = 0;
              *a4 = v7;
              goto LABEL_26;
            }
            id v27 = v19;
            char v20 = [v17 prepareForPhotoLibraryCheck:self error:&v27];
            id v7 = v27;

            if ((v20 & 1) == 0)
            {
              if (!a4)
              {
                BOOL v9 = 0;
                goto LABEL_25;
              }
              id v19 = v7;
              goto LABEL_23;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
          BOOL v9 = 1;
          uint64_t v8 = v23;
          uint64_t v6 = v24;
          if (v14) {
            continue;
          }
          break;
        }
LABEL_26:

LABEL_27:
        ++v10;
      }
      while (v10 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (!v6) {
        goto LABEL_31;
      }
    }
  }
  id v7 = 0;
  BOOL v9 = 1;
LABEL_31:

  return v9;
}

- (id)_errorForAuthorizationStatus:(int64_t)a3 accessLevel:(int64_t)a4
{
  +[PHPhotoLibrary requestAuthorizationForAccessLevel:a4 handler:&__block_literal_global_299];
  switch(a3)
  {
    case 0:
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = 5102;
      goto LABEL_5;
    case 1:
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = 3310;
      goto LABEL_5;
    case 2:
    case 4:
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = 3311;
LABEL_5:
      id v7 = objc_msgSend(v5, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", v6, 0);
      break;
    default:
      id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Photos Access denied (authorization status %ld)", a3);
      break;
  }

  return v7;
}

- (void)_denyTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 authorizationStatus:(int64_t)a5 accessLevel:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = self;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  transactionQueue = self->_transactionQueue;
  id v13 = a7;
  uint64_t v14 = a4;
  id v15 = a3;
  dispatch_assert_queue_V2(transactionQueue);
  id v16 = [(PHPhotoLibrary *)v11 _popChangesRequest];
  id v44 = v16;
  if (v14)
  {
    uint64_t v17 = [v16 accessScopeOptionsRequiredForRequestedChanges];
    char v18 = @"read/write";
    if (v17 == 1) {
      char v18 = @"add-only";
    }
    id v19 = v18;
    char v20 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v43 = v11;
      id v21 = v15;
      id v22 = v13;
      int64_t v23 = a6;
      uint64_t v24 = (void *)v14[5];
      int64_t v25 = a5;
      if ((unint64_t)(a5 - 1) > 3) {
        long long v26 = @"not determined";
      }
      else {
        long long v26 = off_1E5844F98[a5 - 1];
      }
      id v27 = v26;
      qos_class_self();
      id v28 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138544386;
      long long v46 = v24;
      __int16 v47 = 2114;
      id v48 = v27;
      __int16 v49 = 2114;
      uint64_t v50 = v19;
      __int16 v51 = 2114;
      id v52 = v28;
      __int16 v53 = 2114;
      id v54 = v44;
      _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request denied with authorization status %{public}@ for access scope %{public}@ at %{public}@, %{public}@", buf, 0x34u);

      a6 = v23;
      a5 = v25;
      id v13 = v22;
      id v15 = v21;
      id v11 = v43;
    }

    long long v29 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEBUG, "#####  Deny transaction:", buf, 2u);
    }

    long long v30 = [v44 inserts];
    uint64_t v31 = [v30 count];

    if (v31)
    {
      long long v32 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        long long v33 = [v44 inserts];
        *(_DWORD *)buf = 138412290;
        long long v46 = v33;
        _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_DEBUG, "##### denied inserts: %@", buf, 0xCu);
      }
    }
    long long v34 = objc_msgSend(v44, "updates", v43);
    uint64_t v35 = [v34 count];

    if (v35)
    {
      long long v36 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = [v44 updates];
        *(_DWORD *)buf = 138412290;
        long long v46 = v37;
        _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_DEBUG, "##### denied updates: %@", buf, 0xCu);
      }
    }
    id v38 = [v44 deletes];
    uint64_t v39 = [v38 count];

    if (v39)
    {
      uint64_t v40 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        id v41 = [v44 deletes];
        *(_DWORD *)buf = 138412290;
        long long v46 = v41;
        _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_DEBUG, "##### denied deletes: %@", buf, 0xCu);
      }
    }

    id v16 = v44;
  }

  id v42 = [(PHPhotoLibrary *)v11 _errorForAuthorizationStatus:a5 accessLevel:a6];
  [v15 callTransactionCompletionHandler:v13 withSuccess:0 error:v42];
}

- (void)_cancelTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  transactionQueue = self->_transactionQueue;
  id v9 = a5;
  uint64_t v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(transactionQueue);
  id v29 = [(PHPhotoLibrary *)self _popChangesRequest];
  if (v10)
  {
    id v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)v10[5];
      qos_class_self();
      uint64_t v14 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      long long v33 = v14;
      __int16 v34 = 2114;
      id v35 = v29;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request cancelled at %{public}@, %{public}@", buf, 0x20u);
    }
    id v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "#####  Cancel transaction:", buf, 2u);
    }

    id v16 = [v29 inserts];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      char v18 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = [v29 inserts];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v19;
        _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "##### cancelled inserts: %@", buf, 0xCu);
      }
    }
    char v20 = [v29 updates];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      id v22 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int64_t v23 = [v29 updates];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v23;
        _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEBUG, "##### cancelled updates: %@", buf, 0xCu);
      }
    }
    uint64_t v24 = [v29 deletes];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      long long v26 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        id v27 = [v29 deletes];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v27;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, "##### cancelled deletes: %@", buf, 0xCu);
      }
    }
  }

  id v28 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3072, 0);
  [v11 callTransactionCompletionHandler:v9 withSuccess:0 error:v28];
}

- (void)_endTransaction
{
  if ([(PHPerformChangesRequest *)self->_performChangesRequest hasChangeRequests])
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:1859 description:@"Transaction is not clean"];
  }
  transactionQueue = self->_transactionQueue;

  dispatch_queue_set_specific(transactionQueue, "PHPhotoLibrary_transactionPhotoLibrary", 0, 0);
}

- (void)_sendChangesRequest:(id)a3 onExecutionContext:(id)a4 withInstrumentation:(id)a5 reply:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  uint64_t v14 = [v10 accessLevel];
  id v15 = [(PHPhotoLibrary *)self assetsdClient];
  id v16 = v15;
  if (v14 == 1) {
    [v15 photoKitAddClient];
  }
  else {
  uint64_t v17 = [v15 photoKitClient];
  }

  char v18 = [v17 clientName];
  id v19 = v10;
  id v20 = v18;
  if (v11)
  {
    uint64_t v21 = PLPhotoKitGetLog();
    void v11[2] = os_signpost_id_generate(v21);
    id v22 = v21;
    int64_t v23 = v22;
    os_signpost_id_t v24 = v11[2];
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      uint64_t v25 = v11[5];
      qos_class_self();
      long long v26 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = v25;
      __int16 v39 = 2114;
      uint64_t v40 = v26;
      __int16 v41 = 2114;
      id v42 = v20;
      __int16 v43 = 2114;
      id v44 = v19;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PhotoKit request [client]", "PhotoKit changes: [%{public}@] Request sent at %{public}@ on %{public}@, %{public}@", buf, 0x2Au);
    }
    id v27 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = v11[5];
      qos_class_self();
      id v29 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = v28;
      __int16 v39 = 2114;
      uint64_t v40 = v29;
      __int16 v41 = 2114;
      id v42 = v20;
      __int16 v43 = 2114;
      id v44 = v19;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request sent at %{public}@ on %{public}@, %{public}@", buf, 0x2Au);
    }
  }

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  void v33[2] = __83__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_reply___block_invoke;
  v33[3] = &unk_1E5844D20;
  id v34 = v11;
  id v35 = v19;
  id v36 = v12;
  id v30 = v12;
  id v31 = v19;
  __int16 v32 = v11;
  [v13 sendChangesRequest:v31 onClient:v17 reply:v33];
}

void __83__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_reply___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  uint64_t v5 = (void *)a1[5];
  id v7 = a3;
  id v8 = v5;
  id v23 = v7;
  if (v6)
  {
    id v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(v6 + 40);
      qos_class_self();
      uint64_t v11 = PLStringFromQoSClass();
      id v12 = (void *)v11;
      *(_DWORD *)buf = 138544386;
      id v13 = @"NO";
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      if (a2) {
        id v13 = @"YES";
      }
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v23;
      __int16 v32 = 2114;
      id v33 = v8;
      uint64_t v14 = v13;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Reply received at %{public}@, success: %{public}@, error: %@, %{public}@", buf, 0x34u);
    }
    PLPhotoKitGetLog();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v15;
    os_signpost_id_t v17 = *(void *)(v6 + 16);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      uint64_t v18 = *(void *)(v6 + 40);
      qos_class_self();
      uint64_t v19 = PLStringFromQoSClass();
      id v20 = (void *)v19;
      *(_DWORD *)buf = 138544386;
      uint64_t v21 = @"NO";
      uint64_t v25 = v18;
      __int16 v26 = 2114;
      if (a2) {
        uint64_t v21 = @"YES";
      }
      uint64_t v27 = v19;
      __int16 v28 = 2114;
      id v29 = v21;
      __int16 v30 = 2112;
      id v31 = v23;
      __int16 v32 = 2114;
      id v33 = v8;
      id v22 = v21;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PhotoKit request [client]", "PhotoKit changes: [%{public}@] Reply received at %{public}@, success: %{public}@, error: %@, %{public}@", buf, 0x34u);
    }
    *(void *)(v6 + 16) = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_sendChangesRequest:(id)a3 onExecutionContext:(id)a4 withInstrumentation:(id)a5 remainingRetryCount:(int64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke;
  v20[3] = &unk_1E5844D70;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  int64_t v25 = a6;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  [(PHPhotoLibrary *)self _sendChangesRequest:v19 onExecutionContext:v18 withInstrumentation:v17 reply:v20];
}

void __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    id v7 = v5;
LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v11 = v7;
    goto LABEL_17;
  }
  int v8 = PLIsErrorXPCConnectionInvalid();
  id v9 = v6;
  id v7 = v9;
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v10 = *(void *)(a1 + 72);
  if (v10)
  {
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v11 = v9;
    if (dyld_program_sdk_at_least())
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28228];
      v34[0] = *MEMORY[0x1E4F28A50];
      v34[1] = v13;
      v35[0] = v7;
      v35[1] = @"The requested change was interrupted and could not be completed, try again";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      uint64_t v11 = objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3301, v14);
    }
    id v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_FAULT, "PhotoKit XPC proxy is invalid. Dropping request on the floor and returning an error: %@ (underlying error %@)", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1 + 72);
  }
  if (v10 < 1)
  {
    id v7 = v11;
    goto LABEL_16;
  }
  id v16 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    id v17 = *(void **)(a1 + 72);
    *(_DWORD *)buf = 134217984;
    id v31 = v17;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "PhotoKit XPC proxy is invalid. Retry attempt: %zd", buf, 0xCu);
  }

  qos_class_t v18 = qos_class_self();
  id v19 = dispatch_get_global_queue(v18, 0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke_297;
  v24[3] = &unk_1E5844D48;
  id v20 = *(void **)(a1 + 40);
  void v24[4] = *(void *)(a1 + 32);
  id v25 = v20;
  id v26 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v23 = *(void **)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 72);
  id v27 = v21;
  uint64_t v29 = v22;
  id v28 = v23;
  dispatch_async(v19, v24);

LABEL_17:
}

uint64_t __103__PHPhotoLibrary__sendChangesRequest_onExecutionContext_withInstrumentation_remainingRetryCount_reply___block_invoke_297(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendChangesRequest:*(void *)(a1 + 40) onExecutionContext:*(void *)(a1 + 48) withInstrumentation:*(void *)(a1 + 56) remainingRetryCount:*(void *)(a1 + 72) - 1 reply:*(void *)(a1 + 64)];
}

- (int64_t)_initialRetryCountForChangesRequest:(id)a3
{
  int64_t result = 0;
  if ([a3 accessLevel] == 1)
  {
    pl_dispatch_once();
    if (PLIsScreenShotOrScreenRecordingClient_sIsScreenShotOrScreenRecordingClient) {
      return 1;
    }
  }
  return result;
}

- (id)_popChangesRequest
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  uint64_t v3 = self->_performChangesRequest;
  uint64_t v4 = objc_alloc_init(PHPerformChangesRequest);
  performChangesRequest = self->_performChangesRequest;
  self->_performChangesRequest = v4;

  return v3;
}

- (void)_commitTransactionOnExecutionContext:(id)a3 withInstrumentation:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  if (PLIsAssetsd())
  {
    __int16 v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:1745 description:@"cannot commit PhotoKit transactions from assetsd"];
  }
  id v12 = [(PHPhotoLibrary *)self _popChangesRequest];
  [v12 setInstrumentation:v10];
  id v13 = v12;
  if (v10)
  {
    id v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "#####  Commit transaction:", buf, 2u);
    }

    id v15 = [v13 inserts];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v17 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        qos_class_t v18 = [v13 inserts];
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v18;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "##### inserts: %@", buf, 0xCu);
      }
    }
    id v19 = [v13 updates];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      id v21 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v13 updates];
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v22;
        _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEBUG, "##### updates: %@", buf, 0xCu);
      }
    }
    id v23 = [v13 deletes];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      id v25 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v26 = [v13 deletes];
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v26;
        _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "##### deletes: %@", buf, 0xCu);
      }
    }
  }

  int v27 = [v13 hasChangeRequests];
  if (!v27)
  {
    id v29 = 0;
LABEL_23:
    [v9 callTransactionCompletionHandler:v11 withSuccess:v27 ^ 1u error:v29];
    goto LABEL_24;
  }
  id v36 = 0;
  BOOL v28 = [(PHPhotoLibrary *)self _preflightRequest:v13 withError:&v36];
  id v29 = v36;
  if (!v28)
  {
    id v31 = [(PHPhotoLibrary *)self _lazyPhotoLibrary];
    [v13 notifyChangesTransactionFailedWithLazyPhotoLibrary:v31 error:v29];

    goto LABEL_23;
  }
  int64_t v30 = [(PHPhotoLibrary *)self _initialRetryCountForChangesRequest:v13];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  void v33[2] = __93__PHPhotoLibrary__commitTransactionOnExecutionContext_withInstrumentation_completionHandler___block_invoke;
  v33[3] = &unk_1E5844D20;
  void v33[4] = self;
  id v34 = v13;
  id v35 = v11;
  [(PHPhotoLibrary *)self _sendChangesRequest:v34 onExecutionContext:v9 withInstrumentation:v10 remainingRetryCount:v30 reply:v33];

LABEL_24:
}

void __93__PHPhotoLibrary__commitTransactionOnExecutionContext_withInstrumentation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) _lazyPhotoLibrary];
    [*(id *)(a1 + 40) notifyChangesTransactionFailedWithLazyPhotoLibrary:v5 error:v8];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }
  [*(id *)(a1 + 40) didSendChangesToServiceWithResult:a2];
  id v7 = [MEMORY[0x1E4F8B998] sharedInstance];
  [v7 photosAccessAllowedWithScope:7];

  if (PLPhotosAccessAllowed()) {
    [*(id *)(*(void *)(a1 + 32) + 344) distributeChangesSinceLastCheckpoint];
  }
}

- (void)_beginTransaction
{
  if ([(PHPerformChangesRequest *)self->_performChangesRequest hasChangeRequests])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHPhotoLibrary.m" lineNumber:1739 description:@"Transaction is not clean"];
  }
  transactionQueue = self->_transactionQueue;

  dispatch_queue_set_specific(transactionQueue, "PHPhotoLibrary_transactionPhotoLibrary", self, 0);
}

- (BOOL)postsPersistentHistoryChangedNotifications
{
  return [(PHPhotoLibraryObserverRegistrar *)self->_observerRegistrar postsPersistentHistoryChangedNotifications];
}

- (void)setPostsPersistentHistoryChangedNotifications:(BOOL)a3
{
}

- (void)_removeObserver:(id)a3
{
}

- (void)unregisterChangeObserver:(id)observer
{
  if (observer) {
    -[PHPhotoLibrary _removeObserver:](self, "_removeObserver:");
  }
}

uint64_t __41__PHPhotoLibrary_registerChangeObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addObservers:MEMORY[0x1E4F1CBF0] authorizationStatus:a2];
}

- (void)appPrivateDataWriteFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self photoLibraryURL];
  [(PHPhotoLibrary *)self _handleLibraryBecameUnavailable:v5 reason:v4];
}

- (void)_onQueueNotifyAvailabilityObserversWithReason:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(PHPhotoLibrary *)self availabilityObservers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x19F389B10]();
        id v11 = PLPhotosObjectLifecycleGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          uint64_t v21 = v12;
          __int16 v22 = 2048;
          id v23 = self;
          __int16 v24 = 2112;
          id v25 = v9;
          _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "%@ %p notifying availability observer %@", buf, 0x20u);
        }

        [v9 photoLibraryDidBecomeUnavailable:self];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v6);
  }

  [(PHPhotoLibrary *)self _invalidateEverythingWithReason:v15];
  if (!+[PHPhotoLibrary isMultiLibraryModeEnabled])
  {
    id v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(PHPhotoLibrary *)self unavailabilityReason];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = (uint64_t)v14;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "Terminating single library mode PhotoKit client with reason: %@", buf, 0xCu);
    }
    exit(1);
  }
}

- (void)_notifyAvailabilityObserversWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PHPhotoLibrary *)self _setUnavailabilityReason:v4];
  uint64_t v6 = PLPhotoKitGetLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(PHPhotoLibrary *)self unavailabilityReason];
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Photo Library became unavailable because: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    isolationQueue = self->_isolationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PHPhotoLibrary__notifyAvailabilityObserversWithReason___block_invoke;
    v10[3] = &unk_1E5844CF8;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v4;
    dispatch_async(isolationQueue, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Ignoring additional unavailability reason received: %@", buf, 0xCu);
    }
  }
}

void __57__PHPhotoLibrary__notifyAvailabilityObserversWithReason___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412546;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    id v7 = WeakRetained;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "%@ %p notifying availability observers", (uint8_t *)&v4, 0x16u);
  }

  [WeakRetained _onQueueNotifyAvailabilityObserversWithReason:*(void *)(a1 + 32)];
}

- (BOOL)_setUnavailabilityReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHPhotoLibrary.m", 1639, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  __int16 v6 = self;
  objc_sync_enter(v6);
  id v7 = [(PHPhotoLibrary *)v6 unavailabilityReason];

  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = [v5 domain];
    uint64_t v10 = [v5 code];
    id v11 = [v5 userInfo];
    id v12 = objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", v9, v10, v11);
    [(PHPhotoLibrary *)v6 setUnavailabilityReason:v12];
  }
  objc_sync_exit(v6);

  return v7 == 0;
}

- (void)_handleServiceConnectionClosed:(id)a3
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  int v4 = (void *)MEMORY[0x1E4F28C58];
  v8[0] = *MEMORY[0x1E4F289D0];
  id v5 = [(PHPhotoLibrary *)self photoLibraryURL];
  v8[1] = *MEMORY[0x1E4F28588];
  v9[0] = v5;
  v9[1] = @"Connection to photos service has been invalidated";
  __int16 v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v7 = [v4 errorWithDomain:@"PHPhotosErrorDomain" code:3133 userInfo:v6];

  [(PHPhotoLibrary *)self _notifyAvailabilityObserversWithReason:v7];
}

- (void)_stopObservingServiceConnectionInvalidated
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F8BA90] object:0];
}

- (void)_startObservingServiceConnectionInvalidated
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleServiceConnectionClosed_ name:*MEMORY[0x1E4F8BA90] object:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (PLFileSystemVolume *)a4;
  id v12 = a5;
  if (a6 == "PHPhotoLibraryFileSystemVolumeKVOContext" && self->_libraryFileSystemVolume == v11)
  {
    if ([(PLFileSystemVolume *)v11 faultingState])
    {
      id v13 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        id v14 = "Ignoring isOffline state change for _libraryFileSystemVolume due to faultingState";
        uint64_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
        uint32_t v17 = 2;
LABEL_9:
        _os_log_impl(&dword_19B043000, v15, v16, v14, (uint8_t *)&v19, v17);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    if ([(PLFileSystemVolume *)self->_libraryFileSystemVolume isOffline])
    {
      id v13 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        libraryFileSystemVolume = self->_libraryFileSystemVolume;
        int v19 = 134217984;
        uint64_t v20 = libraryFileSystemVolume;
        id v14 = "Unexpected: _libraryFileSystemVolume %p is offline";
        uint64_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 12;
        goto LABEL_9;
      }
LABEL_10:
    }
  }
}

- (void)_stopWatchingFileSystemVolumeForLibraryAvailability
{
  libraryFileSystemVolume = self->_libraryFileSystemVolume;
  if (libraryFileSystemVolume)
  {
    int v4 = [(PLFileSystemVolume *)libraryFileSystemVolume managedObjectContext];
    if (v4) {
      goto LABEL_6;
    }
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "Watched filesystem volume's MOC is nil.", buf, 2u);
    }

    __int16 v6 = [(PHPhotoLibrary *)self photoLibrary];
    int v4 = [v6 managedObjectContext];

    if (v4)
    {
LABEL_6:
      id v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "MOC for the watched file system volume is available", buf, 2u);
      }

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __69__PHPhotoLibrary__stopWatchingFileSystemVolumeForLibraryAvailability__block_invoke;
      v11[3] = &unk_1E5848578;
      void v11[4] = self;
      [v4 performBlockAndWait:v11];
    }
    else
    {
      uint64_t v8 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "No MOC for the watched file system volume", buf, 2u);
      }

      id v9 = self->_libraryFileSystemVolume;
      self->_libraryFileSystemVolume = 0;
      id v10 = v9;

      int v4 = NSStringFromSelector(sel_isOffline);
      [(PLFileSystemVolume *)v10 removeObserver:self forKeyPath:v4 context:"PHPhotoLibraryFileSystemVolumeKVOContext"];
    }
  }
}

void __69__PHPhotoLibrary__stopWatchingFileSystemVolumeForLibraryAvailability__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 176);
  int v4 = NSStringFromSelector(sel_isOffline);
  [v3 removeObserver:v2 forKeyPath:v4 context:"PHPhotoLibraryFileSystemVolumeKVOContext"];

  [*(id *)(*(void *)(a1 + 32) + 176) unregisterWithVolumeManager];
  uint64_t v5 = *(void *)(a1 + 32);
  __int16 v6 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = 0;
}

- (void)_startWatchingFileSystemVolumeForLibraryAvailability
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_libraryFileSystemVolume)
  {
    id v3 = [(PHPhotoLibrary *)self photoLibrary];
    int v4 = [v3 managedObjectContext];

    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F8A828] sharedFileSystemVolumeManager];
      __int16 v6 = [(PHPhotoLibrary *)self photoLibraryURL];
      id v7 = [v5 volumeForURL:v6 context:v4];

      if (v7)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __70__PHPhotoLibrary__startWatchingFileSystemVolumeForLibraryAvailability__block_invoke;
        v11[3] = &unk_1E5848DF0;
        void v11[4] = self;
        uint64_t v8 = v7;
        id v12 = v8;
        [v4 performBlockAndWait:v11];
      }
      else
      {
        id v9 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = [(PHPhotoLibrary *)self photoLibraryURL];
          *(_DWORD *)buf = 138412290;
          id v14 = v10;
          _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "No file system volume for URL %@", buf, 0xCu);
        }
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = self;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "No managed object context for %@", buf, 0xCu);
      }
    }
  }
}

void __70__PHPhotoLibrary__startWatchingFileSystemVolumeForLibraryAvailability__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 176);
  NSStringFromSelector(sel_isOffline);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObserver:v2 forKeyPath:v4 options:0 context:"PHPhotoLibraryFileSystemVolumeKVOContext"];
}

- (void)_stopWatchingForLibraryAvailability
{
  [(PHPhotoLibrary *)self _stopObservingServiceConnectionInvalidated];

  [(PHPhotoLibrary *)self _stopWatchingFileSystemVolumeForLibraryAvailability];
}

- (void)_handleLibraryBecameUnavailable:(id)a3 reason:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 path];
  id v9 = [(PHPhotoLibrary *)self photoLibraryURL];
  id v10 = [v9 path];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    id v12 = PHErrorFromPLError(v7);
    [(PHPhotoLibrary *)self _notifyAvailabilityObserversWithReason:v12];
  }
  else
  {
    id v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(PHPhotoLibrary *)self photoLibraryURL];
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      uint32_t v17 = v13;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "unavailable library %@ does not match mine %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_startWatchingForLibraryAvailability
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PHPhotoLibrary *)self _startWatchingFileSystemVolumeForLibraryAvailability];
  [(PHPhotoLibrary *)self _startObservingServiceConnectionInvalidated];
  objc_initWeak(&location, self);
  id v3 = [(PHPhotoLibrary *)self photoLibrary];
  id v4 = [v3 assetsdClient];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __54__PHPhotoLibrary__startWatchingForLibraryAvailability__block_invoke;
  v5[3] = &unk_1E5844CD0;
  objc_copyWeak(&v6, &location);
  [v4 addPhotoLibraryUnavailabilityHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__PHPhotoLibrary__startWatchingForLibraryAvailability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleLibraryBecameUnavailable:v6 reason:v5];
}

- (void)unregisterAvailabilityObserver:(id)observer
{
  id v4 = observer;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PHPhotoLibrary_unregisterAvailabilityObserver___block_invoke;
  v7[3] = &unk_1E5848DF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v7);
}

void __49__PHPhotoLibrary_unregisterAvailabilityObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) availabilityObservers];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(a1 + 32) availabilityObservers];
  [v4 removeObject:*(void *)(a1 + 40)];

  if (v3 == 1)
  {
    id v5 = [*(id *)(a1 + 32) availabilityObservers];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = *(void **)(a1 + 32);
      [v7 _stopWatchingForLibraryAvailability];
    }
  }
}

- (void)registerAvailabilityObserver:(id)observer
{
  id v4 = observer;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PHPhotoLibrary_registerAvailabilityObserver___block_invoke;
  v7[3] = &unk_1E5848DF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v7);
}

void __47__PHPhotoLibrary_registerAvailabilityObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) availabilityObservers];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(a1 + 32) availabilityObservers];
  [v4 addObject:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v5 = [*(id *)(a1 + 32) availabilityObservers];
    uint64_t v6 = [v5 count];

    if (v6 == 1)
    {
      id v7 = *(void **)(a1 + 32);
      [v7 _startWatchingForLibraryAvailability];
    }
  }
}

- (unint64_t)countOfFetchResultsRegisteredForChangeNotifications
{
  return [(PHPhotoLibraryObserverRegistrar *)self->_observerRegistrar countOfRegisteredFetchResults];
}

- (PLPhotoLibrary)changeHandlingPhotoLibrary
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM]) {
    [(PHPhotoLibrary *)self pl_photoLibraryForCMM];
  }
  else {
  uint64_t v3 = [(PLLazyObject *)self->_lazyChangeHandlingPhotoLibrary objectValue];
  }

  return (PLPhotoLibrary *)v3;
}

- (PLPhotoLibrary)graphObjectFetchingPhotoLibrary
{
  if ([(PHPhotoLibrary *)self isPHPhotoLibraryForCMM]) {
    [(PHPhotoLibrary *)self pl_photoLibraryForCMM];
  }
  else {
  uint64_t v3 = [(PLLazyObject *)self->_lazyGraphObjectFetchingPhotoLibrary objectValue];
  }

  return (PLPhotoLibrary *)v3;
}

- (PLPhotoLibrary)mainQueueConcurrencyPhotoLibrary
{
  return (PLPhotoLibrary *)[(PLLazyObject *)self->_lazyMainQueueConcurrencyPhotoLibrary objectValue];
}

- (PLPhotoAnalysisServiceClient)photoAnalysisClient
{
  return (PLPhotoAnalysisServiceClient *)[(PLPhotoLibraryBundle *)self->_photoLibraryBundle photoAnalysisServiceClient];
}

- (id)managedObjectContext
{
  uint64_t v2 = [(PHPhotoLibrary *)self photoLibrary];
  uint64_t v3 = [v2 managedObjectContext];

  return v3;
}

- (id)pl_photoLibraryForCMM
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PHPhotoLibrary sharedLazyPhotoLibraryForCMM];
  id v4 = [v3 objectValue];
  if (!v4)
  {
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [(PHPhotoLibrary *)self debugDescription];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "Unable to create CMM PLPhotoLibrary for PHPhotoLibrary: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v4;
}

- (PLPhotoKitVariationCache)variationCache
{
  return (PLPhotoKitVariationCache *)[(PLPhotoLibraryBundle *)self->_photoLibraryBundle variationCache];
}

- (NSString)databaseUUID
{
  uint64_t v2 = [(PHPhotoLibrary *)self photoLibrary];
  uint64_t v3 = [v2 managedObjectContext];
  id v4 = [v3 storeUUID];

  return (NSString *)v4;
}

- (void)accountDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F17810]];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F17750]];

  if (v6)
  {
    [(PHPhotoLibrary *)self _resetCachedValues];
  }
}

- (void)_resetCachedValues
{
  [(PLLazyObject *)self->_lazyIsReadyForAnalysis resetObject];
  [(PLLazyObject *)self->_lazyIsReadyForAnalysisQuickCheck resetObject];
  [(PLLazyObject *)self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted resetObject];
  lazyCPLStatus = self->_lazyCPLStatus;

  [(PLLazyObject *)lazyCPLStatus resetObjectWithHandler:&__block_literal_global_274];
}

uint64_t __36__PHPhotoLibrary__resetCachedValues__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (id)_initializeIsReadyForAnalysisCPLInitialDownloadCompleted
{
  uint64_t v2 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v3 = [v2 cloudInternalClient];
  int v4 = [v3 isReadyForAnalysisCPLInitialDownloadCompleted];

  if (v4)
  {
    id v5 = [NSNumber numberWithBool:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_initializeIsReadyForAnalysisQuickCheck
{
  uint64_t v2 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v3 = [v2 cloudInternalClient];
  int v4 = [v3 isReadyForAnalysisQuickCheck];

  if (v4)
  {
    id v5 = [NSNumber numberWithBool:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_initializeIsReadyForAnalysis
{
  uint64_t v2 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v3 = [v2 cloudInternalClient];
  int v4 = [v3 isReadyForAnalysis];

  if (v4)
  {
    id v5 = [NSNumber numberWithBool:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)statusDidChange:(id)a3
{
  id v4 = a3;
  if (!self->_wellKnownPhotoLibraryIdentifier)
  {
    id v5 = [(PHPhotoLibrary *)self _cachedCloudStatus];
    int v6 = [[PHPhotoLibraryCloudStatus alloc] initWithCPLStatus:v4];
    if (![(PHPhotoLibraryCloudStatus *)v6 isEqual:v5])
    {
      [(PHPhotoLibrary *)self _setCachedCloudStatus:v6];
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __34__PHPhotoLibrary_statusDidChange___block_invoke;
      v7[3] = &unk_1E58479D0;
      objc_copyWeak(&v8, &location);
      [(PHPhotoLibrary *)self _publishChangeToObserversIfAuthorized:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __34__PHPhotoLibrary_statusDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _publishCloudStatusChange];
}

- (NSString)mainScopeIdentifier
{
  return (NSString *)[(PLLazyObject *)self->_lazyMainScopeIdentifier objectValue];
}

- (id)_deriveMainScopeIdentifierFromCPLSettings
{
  uint64_t v2 = [(PLCPLSettingsObserver *)self->_cplSettingsObserver settings];
  uint64_t v3 = [v2 deriveMainScopeIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v6 = v5;

  return v6;
}

- (id)_initializeCPLStatus
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(PHPhotoLibrary *)self isCPLSyncablePhotoLibrary])
  {
    uint64_t v3 = [(PHPhotoLibrary *)self photoLibrary];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 pathManager];
      int v6 = CPLStatusFromPathManager();

      [v6 setDelegate:self];
    }
    else
    {
      id v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [(PHPhotoLibrary *)self debugDescription];
        int v10 = 138412290;
        int v11 = v8;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unable to create PLPhotoLibrary instance for newCPLStatusWithPhotoLibrary: %@", (uint8_t *)&v10, 0xCu);
      }
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    photoLibraryBundle = self->_photoLibraryBundle;
    *(_DWORD *)buf = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    int v11 = self;
    __int16 v12 = 2112;
    id v13 = photoLibraryBundle;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  if ((PLIsAssetsd() & 1) == 0)
  {
    int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41024 userInfo:0];
    [(PHPhotoLibrary *)self closeWithReason:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)PHPhotoLibrary;
  [(PHPhotoLibrary *)&v7 dealloc];
}

- (void)_invalidateEverythingWithReason:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412802;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    int v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "%@ %p _invalidateEverythingWithReason:%@", (uint8_t *)&v8, 0x20u);
  }

  [(PHPhotoLibrary *)self _stopWatchingForLibraryAvailability];
  [(PLLazyObject *)self->_lazyAppPrivateData invalidate];
  [(PLLazyObject *)self->_lazyCacheMetricsCollectorClient invalidate];
  [(PLLazyObject *)self->_lazyPhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyMainQueueConcurrencyPhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyMainQueuePhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyBackgroundQueuePhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyUserInitiatedQueuePhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyBackgroundQueueObjectFetchingPhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyGraphObjectFetchingPhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyChangeHandlingPhotoLibrary invalidate];
  [(PLLazyObject *)self->_lazyCPLStatus invalidateWithHandler:&__block_literal_global_270];
  [(PLLazyObject *)self->_lazyIsReadyForAnalysis invalidate];
  [(PLLazyObject *)self->_lazyIsReadyForAnalysisQuickCheck invalidate];
  [(PLLazyObject *)self->_lazyIsReadyForAnalysisCPLInitialDownloadCompleted invalidate];
  [(PLLazyObject *)self->_lazyMainScopeIdentifier invalidate];
  [(PLLazyObject *)self->_lazySearchIndex invalidate];
  int v6 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = objc_opt_class();
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    int v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "%@ %p finished _invalidateEverythingWithReason:%@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __50__PHPhotoLibrary__invalidateEverythingWithReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    id v5 = v3;
    id v6 = objc_alloc_init(MEMORY[0x1E4F8AAA0]);
    [v6 setAutomaticallyMergesContext:0];
    id v12 = 0;
    uint64_t v7 = (void *)[MEMORY[0x1E4F8A938] newPhotoLibraryWithName:"PHPhotoLibraryMainQueueConcurrency" loadedFromBundle:v4 options:v6 error:&v12];
    id v8 = v12;
    if (v7)
    {
      uint64_t v9 = [v7 managedObjectContext];
      [v5 addManagedObjectContext:v9];
    }
    else
    {
      uint64_t v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = [v4 libraryURL];
        *(_DWORD *)buf = 136446722;
        uint64_t v14 = "PHPhotoLibraryMainQueueConcurrency";
        __int16 v15 = 2112;
        __int16 v16 = v10;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "failed to load main queue photo library %{public}s with url %@, %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_7(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = newPhotoLibrary((uint64_t)"PHPhotoLibraryGraphObjectFetching", a1[4], a1[5]);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_8(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = newPhotoLibrary((uint64_t)"PHPhotoLibraryChangeHandling", a1[4], a1[5]);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = +[PHQuery fetchRootFolderIDForAlbumKind:3998 photoLibrary:WeakRetained];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _initializePhotoLibraryIdentifier];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_253(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _initializeCPLStatus];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_2_254(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _initializeIsReadyForAnalysis];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_3_255(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _initializeIsReadyForAnalysisQuickCheck];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_4_256(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _initializeIsReadyForAnalysisCPLInitialDownloadCompleted];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __50__PHPhotoLibrary_initWithPhotoLibraryBundle_type___block_invoke_5_258(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _deriveMainScopeIdentifierFromCPLSettings];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (PHPhotoLibrary)initWithPLPhotoLibrary:(id)a3 type:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 pathManager];
  id v8 = [v7 libraryURL];
  uint64_t v9 = [(PHPhotoLibrary *)self initWithPhotoLibraryURL:v8 type:v4];

  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F8B948]) initWithObject:v6];
    lazyPhotoLibrary = v9->_lazyPhotoLibrary;
    v9->_lazyPhotoLibrary = (PLLazyObject *)v10;
  }
  return v9;
}

- (PHPhotoLibrary)initWithPLPhotoLibrary:(id)a3
{
  return [(PHPhotoLibrary *)self initWithPLPhotoLibrary:a3 type:0];
}

- (void)close
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3158 userInfo:0];
  [(PHPhotoLibrary *)self closeWithReason:v3];
}

- (BOOL)requestSandboxExtensionsIfNeededWithError:(id *)a3
{
  uint64_t v4 = [(PHPhotoLibrary *)self assetsdClient];
  id v5 = [v4 libraryClient];
  id v9 = 0;
  char v6 = [v5 openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:0 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0 && a3) {
    *a3 = v7;
  }

  return v6;
}

- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(PHPhotoLibrary *)self assetsdClient];
  id v8 = [v7 libraryClient];

  if ([v8 isOpened])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__PHPhotoLibrary_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke;
    v10[3] = &unk_1E58484E0;
    id v11 = v6;
    [v8 resetFaceAnalysisWithResetLevel:a3 completionHandler:v10];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3109, 0);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

void __68__PHPhotoLibrary_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    PHErrorFromPLError(a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v5);
  }
}

- (NSProgress)postOpenProgress
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__20217;
  __int16 v17 = __Block_byref_object_dispose__20218;
  id v18 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PHPhotoLibrary_postOpenProgress__block_invoke;
  block[3] = &unk_1E5848D28;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(isolationQueue, block);
  uint64_t v4 = (void *)v14[5];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v11 = 0;
    [(PHPhotoLibrary *)self openAndWaitWithUpgrade:0 error:&v11];
    id v6 = v11;
    if (v6)
    {
      id v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "failed to open photo library %@", buf, 0xCu);
      }
    }
    id v8 = self->_isolationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__PHPhotoLibrary_postOpenProgress__block_invoke_235;
    v10[3] = &unk_1E5848D28;
    void v10[4] = self;
    v10[5] = &v13;
    dispatch_sync(v8, v10);
    id v5 = (id)v14[5];
  }
  _Block_object_dispose(&v13, 8);

  return (NSProgress *)v5;
}

void __34__PHPhotoLibrary_postOpenProgress__block_invoke(uint64_t a1)
{
}

void __34__PHPhotoLibrary_postOpenProgress__block_invoke_235(uint64_t a1)
{
}

- (id)upgradePhotoLibraryUsingOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v10 = [v9 libraryClient];

  uint64_t v39 = 0;
  id v11 = [(id)objc_opt_class() plLibraryOptionsFromPHOptions:v7 createOptions:&v39];
  if ((v39 & 4) == 0)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    void v28[2] = __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_3;
    v28[3] = &unk_1E5844C60;
    v28[4] = self;
    id v29 = v8;
    id v12 = [v10 upgradePhotoLibraryDatabaseWithOptions:v11 completion:v28];
    uint64_t v13 = v29;
    goto LABEL_11;
  }
  unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_isCompletedPostOpenInitialization);
  if (v14)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PHPhotoLibrary.m", 991, @"Invalid parameter not satisfying: %@", @"_isCompletedPostOpenInitialization == NO" object file lineNumber description];
  }
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__20217;
  uint64_t v37 = __Block_byref_object_dispose__20218;
  uint64_t v38 = 0;
  dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_233);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_2;
  v30[3] = &unk_1E5844C38;
  __int16 v32 = &v33;
  id v16 = v15;
  id v31 = v16;
  id v12 = [v10 upgradePhotoLibraryDatabaseWithOptions:v11 completion:v30];
  dispatch_block_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  __int16 v17 = [(id)v34[5] domain];
  if (![v17 isEqualToString:*MEMORY[0x1E4F8C500]])
  {

    goto LABEL_9;
  }
  uint64_t v18 = [(id)v34[5] code];

  if (v18 != 41020)
  {
LABEL_9:
    id v23 = PHErrorFromPLError((void *)v34[5]);
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v23);
    goto LABEL_10;
  }
  uint64_t v19 = [MEMORY[0x1E4F8AA90] sharedBundleController];
  id v20 = [(PLPhotoLibraryBundle *)self->_photoLibraryBundle libraryURL];
  uint64_t v21 = [v19 replaceBundleForRebuildAtLibraryURL:v20];
  photoLibraryBundle = self->_photoLibraryBundle;
  self->_photoLibraryBundle = v21;

  id v23 = (void *)[v11 mutableCopy];
  __int16 v24 = [NSNumber numberWithUnsignedInteger:v39 & 0xFFFFFFFFFFFFFFFBLL];
  [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F8B238]];

  uint64_t v25 = [(PHPhotoLibrary *)self upgradePhotoLibraryUsingOptions:v23 completion:v8];

  id v12 = (void *)v25;
LABEL_10:

  _Block_object_dispose(&v33, 8);
  uint64_t v13 = v38;
LABEL_11:

  return v12;
}

void __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__PHPhotoLibrary_upgradePhotoLibraryUsingOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if (a3)
  {
    PHErrorFromPLError(a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), a2);
    id v8 = *(void **)(a1 + 32);
    id v9 = 0;
    [v8 _postOpenInitializationWithError:&v9];
    id v7 = v9;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)openAndWaitWithUpgrade:(BOOL)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(PHPhotoLibrary *)self wellKnownPhotoLibraryIdentifier];
  PHAuthorizationStatus v9 = +[PHPhotoLibrary authorizationStatusForAccessLevel:2];
  uint64_t v10 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134349056;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary openAndWaitWithUpgrade: authorization status is %{public}td", (uint8_t *)&buf, 0xCu);
  }

  if (v9 == PHAuthorizationStatusNotDetermined)
  {
    id v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary openAndWaitWithUpgrade: PHAuthorizationStatusNotDetermined", (uint8_t *)&buf, 2u);
    }

    id v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke;
    v23[3] = &unk_1E5844BC0;
    __int16 v24 = v12;
    uint64_t v13 = v12;
    +[PHPhotoLibrary requestAuthorizationForAccessLevel:2 handler:v23];
    dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  isolationQueue = self->_isolationQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2;
  v18[3] = &unk_1E5844C10;
  p_long long buf = &buf;
  uint64_t v21 = a5;
  BOOL v22 = a3;
  void v18[4] = self;
  id v19 = v8;
  id v15 = v8;
  dispatch_sync(isolationQueue, v18);
  char v16 = *(unsigned char *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke(uint64_t a1)
{
}

void __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 208);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v43 = 0;
    id v44 = &v43;
    uint64_t v45 = 0x3032000000;
    long long v46 = __Block_byref_object_copy__20217;
    __int16 v47 = __Block_byref_object_dispose__20218;
    id v2 = *(id *)(*(void *)(a1 + 32) + 216);
    id v48 = v2;
    if (v2)
    {
      if (*(void *)(a1 + 56))
      {
        PHErrorFromPLError(v2);
        **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_36:
      _Block_object_dispose(&v43, 8);

      return;
    }
    uint64_t v3 = [*(id *)(a1 + 32) assetsdClient];
    uint64_t v4 = [v3 libraryClient];
    id v5 = (id *)(v44 + 5);
    obuint64_t j = (id)v44[5];
    id v42 = 0;
    char v6 = [v4 openPhotoLibraryDatabaseWithPostOpenProgress:&v42 error:&obj];
    id v7 = v42;
    id v8 = v42;
    objc_storeStrong(v5, obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      || (objc_msgSend(MEMORY[0x1E4F8B980], "ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:", objc_msgSend(*(id *)(a1 + 32), "wellKnownPhotoLibraryIdentifier")) & 1) != 0)
    {
LABEL_23:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        id v23 = [(id)v44[5] domain];
        if ([v23 isEqualToString:*MEMORY[0x1E4F8C500]])
        {
          BOOL v24 = [(id)v44[5] code] == 41013;

          if (v24)
          {
            if (*(unsigned char *)(a1 + 64))
            {
              dispatch_block_t v25 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_223);
              uint64_t v26 = *(void **)(a1 + 32);
              uint64_t v27 = *(void *)(a1 + 40);
              v35[0] = MEMORY[0x1E4F143A8];
              v35[1] = 3221225472;
              v35[2] = __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2_224;
              void v35[3] = &unk_1E5844BE8;
              uint64_t v37 = *(void *)(a1 + 48);
              uint64_t v38 = &v43;
              id v28 = v25;
              id v36 = v28;
              id v29 = (id)[v26 upgradePhotoLibraryUsingOptions:v27 completion:v35];
              dispatch_block_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
            }
LABEL_31:
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            {
              LOBYTE(v33) = 1;
            }
            else
            {
              uint64_t v33 = *(void *)(a1 + 56);
              if (v33)
              {
                PHErrorFromPLError((void *)v44[5]);
                **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
                LOBYTE(v33) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
              }
            }
            *(unsigned char *)(*(void *)(a1 + 32) + 208) = v33;
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), (id)v44[5]);

            goto LABEL_36;
          }
        }
        else
        {
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), v7);
        int64_t v30 = *(void **)(a1 + 32);
        id v31 = (id *)(v44 + 5);
        id v34 = (id)v44[5];
        char v32 = [v30 _postOpenInitializationWithError:&v34];
        objc_storeStrong(v31, v34);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v32;
      }
      goto LABEL_31;
    }
    PHAuthorizationStatus v9 = *(void **)(*(void *)(a1 + 32) + 336);
    id v40 = 0;
    uint64_t v10 = *MEMORY[0x1E4F1C810];
    id v39 = 0;
    int v11 = [v9 getResourceValue:&v40 forKey:v10 error:&v39];
    id v12 = v40;
    id v13 = v39;
    if (v11)
    {
      unint64_t v14 = [v12 unsignedIntegerValue];
      if (v14 >= [MEMORY[0x1E4F8B8F8] minimumAvailableBytesRequiredForLibraryOpen])
      {
LABEL_22:

        goto LABEL_23;
      }
      id v15 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 336);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v54 = v16;
        __int16 v55 = 2112;
        id v56 = v12;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Volume containing photo library %@ has insufficient free space %@", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 336);
      if (v17)
      {
        uint64_t v51 = *MEMORY[0x1E4F289D0];
        uint64_t v52 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      }
      else
      {
        uint64_t v18 = 0;
      }
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3305 userInfo:v18];
    }
    else
    {
      id v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 336);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v54 = v20;
        __int16 v55 = 2112;
        id v56 = v13;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "getResourceValue for volume available capacity at %@ failed with error %@", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      if (v13)
      {
        uint64_t v49 = *MEMORY[0x1E4F28A50];
        id v50 = v13;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      }
      else
      {
        uint64_t v18 = 0;
      }
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v18];
    }
    BOOL v22 = (void *)v44[5];
    v44[5] = v21;

    goto LABEL_22;
  }
}

void __55__PHPhotoLibrary_openAndWaitWithUpgrade_options_error___block_invoke_2_224(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

- (BOOL)openAndWaitWithUpgrade:(BOOL)a3 error:(id *)a4
{
  return [(PHPhotoLibrary *)self openAndWaitWithUpgrade:a3 options:0 error:a4];
}

- (BOOL)createPhotoLibraryUsingOptions:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v8 = [(PHPhotoLibrary *)self photoLibraryURL];
  PHAuthorizationStatus v9 = [v8 path];
  int v10 = [v7 fileExistsAtPath:v9];

  if (v10)
  {
    int v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F289D0];
    id v12 = [(PHPhotoLibrary *)self photoLibraryURL];
    v34[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v14 = [v11 errorWithDomain:@"PHPhotosErrorDomain" code:3107 userInfo:v13];

LABEL_9:
    BOOL v23 = 0;
    goto LABEL_10;
  }
  id v15 = [(PHPhotoLibrary *)self photoLibraryURL];
  id v32 = 0;
  int v16 = [v7 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v32];
  id v14 = v32;

  if ((v16 & 1) == 0)
  {
    id v12 = [v14 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v24 = [v14 code];

      if (v24 != 513)
      {
        BOOL v23 = 0;
        goto LABEL_11;
      }
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      dispatch_block_t v25 = [(PHPhotoLibrary *)self photoLibraryURL];
      uint64_t v26 = [v25 path];
      uint64_t v27 = [v26 stringByDeletingLastPathComponent];
      [v12 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F28328]];

      [v12 setObject:@"You do not have permission to write to the selected folder" forKeyedSubscript:*MEMORY[0x1E4F28588]];
      [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 5404, v12);

      BOOL v23 = 0;
      id v14 = (id)v28;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v17 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v18 = [v17 libraryManagementClient];

  id v19 = [(id)objc_opt_class() plLibraryOptionsFromPHOptions:v6 createOptions:0];
  uint64_t v20 = (void *)[v19 mutableCopy];

  uint64_t v21 = [(PHPhotoLibrary *)self photoLibraryURL];
  [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F8B248]];

  id v31 = v14;
  BOOL v22 = [v18 createManagedPhotoLibraryWithOptions:v20 error:&v31];
  id v12 = v31;

  if (!v22)
  {
    BOOL v23 = 0;
    id v14 = v12;
    goto LABEL_11;
  }
  id v30 = v12;
  BOOL v23 = [(PHPhotoLibrary *)self _postOpenInitializationWithError:&v30];
  id v14 = v30;
LABEL_10:

LABEL_11:
  if (a4 && !v23)
  {
    PHErrorFromPLError(v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (BOOL)_postOpenInitializationWithError:(id *)a3
{
  id v5 = [(PHPhotoLibrary *)self photoLibrary];
  if (v5)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_isCompletedPostOpenInitialization);
  }
  else if (a3)
  {
    photoLibraryBundle = self->_photoLibraryBundle;
    id v12 = 0;
    id v7 = (void *)[MEMORY[0x1E4F8AA78] newPhotoLibraryWithName:"-[PHPhotoLibrary _postOpenInitializationWithError:]" loadedFromBundle:photoLibraryBundle options:0 error:&v12];
    id v8 = v12;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v10 = [(PHPhotoLibrary *)self photoLibraryURL];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F289D0]];

    [v9 setObject:@"Creation of PLPhotoLibrary failed" forKeyedSubscript:*MEMORY[0x1E4F28228]];
    if (v8) {
      [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v9];
  }
  return v5 != 0;
}

- (id)_initializePhotoLibraryIdentifier
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v4 = [v3 libraryManagementClient];

  id v5 = [(PHPhotoLibrary *)self photoLibraryURL];
  id v11 = 0;
  id v6 = [v4 photoLibraryIdentifierForPhotoLibraryURL:v5 error:&v11];
  id v7 = v11;

  if (v6)
  {
    id v8 = [[PHPhotoLibraryIdentifier alloc] initWithPLLibraryIdentifier:v6];
  }
  else
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v13 = self;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Failed to retrieve library identifier for %@: %@", buf, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)getCPLConfigrationValueForClient:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v11 = v6;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_7;
    }
    id v7 = (id *)MEMORY[0x1E4F59748];
  }
  else
  {
    id v7 = (id *)MEMORY[0x1E4F59758];
  }
  id v8 = *v7;
  id v6 = v11;
  if (v8)
  {
    id v9 = [(PHPhotoLibrary *)self assetsdClient];
    int v10 = [v9 cloudInternalClient];
    [v10 getCPLConfigrationValueForKey:v8 completionHandler:v11];

    goto LABEL_9;
  }
LABEL_7:
  if (!v6) {
    goto LABEL_10;
  }
  (*((void (**)(id, void))v6 + 2))(v11, 0);
LABEL_9:
  id v6 = v11;
LABEL_10:
}

- (BOOL)isWalrusEnabled
{
  id v2 = [(PLLazyObject *)self->_lazyCPLStatus objectValue];
  char v3 = [v2 isWalrusEnabled];

  return v3;
}

- (PHPhotoLibraryCloudStatus)cloudStatus
{
  char v3 = [(PHPhotoLibrary *)self _cachedCloudStatus];
  if (!v3)
  {
    uint64_t v4 = [(PHPhotoLibrary *)self cplStatus];
    char v3 = [[PHPhotoLibraryCloudStatus alloc] initWithCPLStatus:v4];
  }

  return v3;
}

- (void)_setCachedCloudStatus:(id)a3
{
  uint64_t v4 = (PHPhotoLibraryCloudStatus *)a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  cachedCloudStatus = obj->_cachedCloudStatus;
  obj->_cachedCloudStatus = v4;

  objc_sync_exit(obj);
}

- (id)_cachedCloudStatus
{
  cachedCloudStatus = self->_cachedCloudStatus;
  uint64_t v4 = self;
  id v5 = cachedCloudStatus;
  objc_sync_enter(v4);
  id v6 = self->_cachedCloudStatus;

  objc_sync_exit(v4);

  return v6;
}

- (CPLStatus)cplStatus
{
  if ([(PHPhotoLibrary *)self isCloudPhotoLibraryEnabled])
  {
    char v3 = [(PHPhotoLibrary *)self photoLibrary];
    uint64_t v4 = [v3 pathManager];

    id v5 = CPLStatusFromPathManager();
  }
  else
  {
    id v5 = 0;
  }

  return (CPLStatus *)v5;
}

- (void)setKeepOriginalsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  cplSettingsObserver = self->_cplSettingsObserver;
  id v8 = 0;
  char v5 = [(PLCPLSettingsObserver *)cplSettingsObserver setPrefetchMode:a3 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109378;
      BOOL v10 = v3;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Couldn't set keepOriginals to: %d, error: %@", buf, 0x12u);
    }
  }
}

- (BOOL)isKeepOriginalsEnabled
{
  id v2 = [(PLCPLSettingsObserver *)self->_cplSettingsObserver settings];
  char v3 = [v2 isKeepOriginalsEnabled];

  return v3;
}

- (BOOL)isReadOnlyCloudPhotoLibrary
{
  id v2 = [(PHPhotoLibrary *)self cplStatus];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 exitDeleteTime];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isCPLSyncablePhotoLibrary
{
  if ([(PHPhotoLibrary *)self isSystemPhotoLibrary]) {
    return 1;
  }
  uint64_t v4 = [(PLCPLSettingsObserver *)self->_cplSettingsObserver settings];
  if ([v4 isAppLibrary])
  {
    BOOL v5 = [(PLCPLSettingsObserver *)self->_cplSettingsObserver settings];
    char v3 = [v5 isCloudPhotoLibraryEnabled];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (PHPhotoLibraryIdentifier)photoLibraryIdentifier
{
  return (PHPhotoLibraryIdentifier *)[(PLLazyObject *)self->_lazyPhotoLibraryIdentifier objectValue];
}

- (id)initMomentShareLibrary
{
  char v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  uint64_t v4 = [(PHPhotoLibrary *)self initWithPhotoLibraryURL:v3 type:1];

  return v4;
}

- (PHPhotoLibrary)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-[PHPhotoLibrary init] unsupported" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)sharedContactStore
{
  id v2 = a1;
  objc_sync_enter(v2);
  char v3 = (void *)sharedContactStore___sContactStore;
  if (!sharedContactStore___sContactStore)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    BOOL v5 = (void *)sharedContactStore___sContactStore;
    sharedContactStore___sContactStore = (uint64_t)v4;

    char v3 = (void *)sharedContactStore___sContactStore;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (BOOL)_isInternalObserver:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (void)removeAllUniquedOIDs
{
  id v2 = [a1 uniqueObjectIDCache];
}

+ (id)uniquedOIDsFromObjects:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 uniqueObjectIDCache];
  id v6 = -[PHUniqueObjectIDCache uniquedOIDsFromObjects:](v5, v4);

  return v6;
}

+ (id)_effectiveRootEntity:(id)a3
{
  id v3 = a3;
  if (_effectiveRootEntity__onceToken != -1) {
    dispatch_once(&_effectiveRootEntity__onceToken, &__block_literal_global_521);
  }
  id v4 = v3;
  uint64_t v5 = _effectiveRootEntity__effectiveRootEntityNames;
  id v6 = [v4 name];
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if (v5)
  {
    id v7 = v4;
  }
  else
  {
    id v8 = v4;
    while (1)
    {
      uint64_t v9 = [v8 superentity];
      if (!v9) {
        break;
      }
      id v7 = (id)v9;

      BOOL v10 = (void *)_effectiveRootEntity__effectiveRootEntityNames;
      __int16 v11 = [v4 name];
      int v12 = [v10 containsObject:v11];

      id v8 = v7;
      if (v12) {
        goto LABEL_10;
      }
    }
    id v7 = v8;

    id v4 = v7;
  }
LABEL_10:

  return v4;
}

void __39__PHPhotoLibrary__effectiveRootEntity___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:@"Folder"];
  uint64_t v1 = (void *)_effectiveRootEntity__effectiveRootEntityNames;
  _effectiveRootEntity__effectiveRootEntityNames = v0;
}

+ (Class)PHObjectClassForIdentifierCode:(id)a3
{
  id v3 = +[PHPhotoLibrary fetchTypeForLocalIdentifierCode:a3];
  id v4 = +[PHPhotoLibrary classForFetchType:v3];

  return v4;
}

+ (Class)PHObjectClassForObjectType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (Class)PHObjectClassForOID:(id)a3
{
  uint64_t v3 = [a3 entity];
  id v4 = [v3 name];
  uint64_t v5 = +[PHPhotoLibrary PHObjectClassForEntityName:v4];

  id v6 = v5;
  return v6;
}

+ (id)PHObjectClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PHPhotoLibrary_PHObjectClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (PHObjectClasses_onceToken != -1) {
    dispatch_once(&PHObjectClasses_onceToken, block);
  }
  id v2 = (void *)PHObjectClasses_classes;

  return v2;
}

void __33__PHPhotoLibrary_PHObjectClasses__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) PHObjectClassesByEntityName];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v2 = [v7 allValues];
  uint64_t v3 = [v1 setWithArray:v2];

  id v4 = [v3 allObjects];
  uint64_t v5 = [v4 sortedArrayUsingFunction:_classNameCompare context:0];
  id v6 = (void *)PHObjectClasses_classes;
  PHObjectClasses_classes = v5;
}

+ (id)fetchTypeForLocalIdentifierCode:(id)a3
{
  uint64_t v3 = fetchTypeForLocalIdentifierCode__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&fetchTypeForLocalIdentifierCode__onceToken, &__block_literal_global_363);
  }
  uint64_t v5 = [(id)fetchTypeForLocalIdentifierCode___fetchTypesByIdentifierCode objectForKeyedSubscript:v4];

  return v5;
}

void __50__PHPhotoLibrary_fetchTypeForLocalIdentifierCode___block_invoke()
{
  v20[17] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = +[PHAsset identifierCode];
  v19[0] = v18;
  v20[0] = @"PHAsset";
  uint64_t v17 = +[PHCollectionList identifierCode];
  v19[1] = v17;
  v20[1] = @"PHCollectionList";
  uint64_t v16 = +[PHMomentList identifierCode];
  void v19[2] = v16;
  void v20[2] = @"PHMomentList";
  id v15 = +[PHAssetCollection identifierCode];
  v19[3] = v15;
  v20[3] = @"PHAssetCollection";
  __int16 v14 = +[PHMoment identifierCode];
  void v19[4] = v14;
  v20[4] = @"PHMoment";
  uint64_t v13 = +[PHPerson identifierCode];
  v19[5] = v13;
  void v20[5] = @"PHPerson";
  int v12 = +[PHFace identifierCode];
  v19[6] = v12;
  v20[6] = @"PHFace";
  uint64_t v0 = +[PHFaceGroup identifierCode];
  v19[7] = v0;
  v20[7] = @"PHFaceGroup";
  uint64_t v1 = +[PHSocialGroup identifierCode];
  v19[8] = v1;
  v20[8] = @"PHSocialGroup";
  id v2 = +[PHMemory identifierCode];
  v19[9] = v2;
  v20[9] = @"PHMemory";
  uint64_t v3 = +[PHPhotosHighlight identifierCode];
  v19[10] = v3;
  v20[10] = @"PHPhotosHighlight";
  id v4 = +[PHMomentShare identifierCode];
  v19[11] = v4;
  v20[11] = @"PHMomentShare";
  uint64_t v5 = +[PHLibraryScope identifierCode];
  v19[12] = v5;
  v20[12] = @"PHLibraryScope";
  id v6 = +[PHShareParticipant identifierCode];
  v19[13] = v6;
  v20[13] = @"PHShareParticipant";
  id v7 = +[PHSuggestion identifierCode];
  v19[14] = v7;
  v20[14] = @"PHSuggestion";
  id v8 = +[PHImportSession identifierCode];
  v19[15] = v8;
  v20[15] = @"PHImportSession";
  uint64_t v9 = +[PHProject identifierCode];
  v19[16] = v9;
  v20[16] = @"PHProject";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:17];
  __int16 v11 = (void *)fetchTypeForLocalIdentifierCode___fetchTypesByIdentifierCode;
  fetchTypeForLocalIdentifierCode___fetchTypesByIdentifierCode = v10;
}

+ (int64_t)collectionListTypeForIdentifierCode:(id)a3
{
  id v3 = a3;
  pl_dispatch_once();
  id v4 = [(id)collectionListTypeForIdentifierCode___typeByCode objectForKeyedSubscript:v3];

  if (v4) {
    int64_t v5 = [v4 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

void __54__PHPhotoLibrary_collectionListTypeForIdentifierCode___block_invoke()
{
  uint64_t v0 = (void *)collectionListTypeForIdentifierCode___typeByCode;
  collectionListTypeForIdentifierCode___typeByCode = (uint64_t)&unk_1EEB26FE8;
}

+ (id)photoLibraryForCurrentTransaction
{
  return dispatch_get_specific("PHPhotoLibrary_transactionPhotoLibrary");
}

+ (id)stringFromPHPhotoLibraryType:(unsigned __int16)a3
{
  if (a3 == 1)
  {
    id v4 = @"CMM";
  }
  else if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownType(%u)", a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"UserLibrary";
  }
  return v4;
}

+ (void)assertTransaction
{
  id v2 = [a1 photoLibraryForCurrentTransaction];
  id v4 = v2;
  if (v2)
  {
    [v2 assertTransaction];
  }
  else if ((PLIsAssetsd() & 1) == 0 && ([MEMORY[0x1E4F8B878] inTransactionProxy] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This method can only be called from inside of -[PHPhotoLibrary performChanges:completionHandler:] or -[PHPhotoLibrary performChangesAndWait:error:]" userInfo:0];
    objc_exception_throw(v3);
  }
}

+ (id)sharedLazyPhotoLibraryForCMM
{
  pl_dispatch_once();
  id v2 = (void *)sharedLazyPhotoLibraryForCMM_pl_once_object_47;

  return v2;
}

void __46__PHPhotoLibrary_sharedLazyPhotoLibraryForCMM__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = objc_initWeak(&location, v1);

  id v3 = objc_alloc(MEMORY[0x1E4F8B948]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PHPhotoLibrary_sharedLazyPhotoLibraryForCMM__block_invoke_2;
  void v6[3] = &unk_1E5847760;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [v3 initWithBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  int64_t v5 = (void *)sharedLazyPhotoLibraryForCMM_pl_once_object_47;
  sharedLazyPhotoLibraryForCMM_pl_once_object_47 = v4;
}

id __46__PHPhotoLibrary_sharedLazyPhotoLibraryForCMM__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    id v3 = [MEMORY[0x1E4F8AA90] sharedBundleController];
    uint64_t v4 = [v3 openBundleAtLibraryURL:v2];

    id WeakRetained = newPhotoLibrary((uint64_t)"CMM PLPhotoLibrary", v4, 0);
  }

  return WeakRetained;
}

+ (id)plLibraryOptionsFromPHOptions:(id)a3 createOptions:(unint64_t *)a4
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"PHPhotoLibraryCreateOptions"];
    uint64_t v8 = [v7 unsignedIntegerValue];

    uint64_t v9 = [v6 objectForKeyedSubscript:@"PHPhotoLibraryUpgradeOptions"];
    uint64_t v10 = [v9 unsignedIntegerValue];

    unint64_t v11 = 0;
    for (uint64_t i = 0; i != 64; ++i)
    {
      uint64_t v13 = v10 & (1 << i);
      uint64_t v14 = v11 | 4;
      if (v13 != 4) {
        uint64_t v14 = v11;
      }
      if (v13 == 8) {
        v11 |= 8uLL;
      }
      else {
        unint64_t v11 = v14;
      }
    }
    for (uint64_t j = 0; j != 64; ++j)
    {
      uint64_t v16 = v8 & (1 << j);
      uint64_t v17 = v11 | 0x80;
      uint64_t v18 = v11 | 0x100;
      if (v16 != 256) {
        uint64_t v18 = v11;
      }
      if (v16 != 128) {
        uint64_t v17 = v18;
      }
      uint64_t v19 = v11 | 0x20;
      uint64_t v20 = v11 | 0x40;
      if (v16 != 64) {
        uint64_t v20 = v11;
      }
      if (v16 != 32) {
        uint64_t v19 = v20;
      }
      if (v16 <= 127) {
        uint64_t v17 = v19;
      }
      uint64_t v21 = v11 | 0x10;
      uint64_t v22 = v11 | 0x11;
      if (v16 != 17) {
        uint64_t v22 = v11;
      }
      if (v16 != 16) {
        uint64_t v21 = v22;
      }
      uint64_t v23 = v11 | 1;
      uint64_t v24 = v11 | 2;
      if (v16 != 2) {
        uint64_t v24 = v11;
      }
      if (v16 != 1) {
        uint64_t v23 = v24;
      }
      if (v16 <= 15) {
        uint64_t v21 = v23;
      }
      if (v16 <= 31) {
        unint64_t v11 = v21;
      }
      else {
        unint64_t v11 = v17;
      }
    }
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      id v25 = (id)[v6 mutableCopy];
      v29[0] = @"PHPhotoLibraryCreateOptions";
      v29[1] = @"PHPhotoLibraryUpgradeOptions";
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      [v25 removeObjectsForKeys:v26];

      uint64_t v27 = [NSNumber numberWithUnsignedInteger:v11];
      [v25 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F8B238]];
    }
    else
    {
      id v25 = v6;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

+ (BOOL)isPhotosApplicationInstalled
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v3 = [v2 applicationIsInstalled:@"com.apple.mobileslideshow"];

  return v3;
}

+ (const)systemPhotoLibraryAvailableNotificationName
{
  return (const char *)*MEMORY[0x1E4F8C578];
}

+ (BOOL)setSystemPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v10 = 0;
  char v5 = [MEMORY[0x1E4F8B980] setSystemLibraryURL:a3 options:0 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    PHErrorFromPLError(v6);
    id v8 = objc_claimAutoreleasedReturnValue();
    *a4 = v8;
  }
  return v5;
}

+ (void)unsafeShutdownLibraryWithPhotoLibraryURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    char v5 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v3];
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_FAULT, "Unsafe PHPhotoLibrary shutdown for URL: %@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F8AA90] sharedBundleController];
  id v7 = [v6 bundleForLibraryURL:v3];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46019 userInfo:0];
    [v6 shutdownBundle:v7 reason:v8];
  }
}

+ (id)openPhotoLibraryWithWellKnownIdentifier:(int64_t)a3 error:(id *)a4
{
  id v7 = [PHPhotoLibrary alloc];
  id v8 = [a1 wellKnownPhotoLibraryURLForIdentifier:a3];
  int v9 = [(PHPhotoLibrary *)v7 initWithPhotoLibraryURL:v8];

  id v12 = 0;
  LODWORD(v8) = [(PHPhotoLibrary *)v9 openAndWaitWithUpgrade:1 error:&v12];
  id v10 = v12;
  if (v8)
  {
    [a1 enableMultiLibraryMode];
  }
  else
  {

    int v9 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v9;
}

+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:a3];
}

+ (id)systemPhotoLibraryURL
{
  return (id)[MEMORY[0x1E4F8B980] systemLibraryURL];
}

+ (void)_forceUserInterfaceReload
{
  id v2 = [MEMORY[0x1E4F8AA90] sharedBundleController];
  [v2 handleUnknownMergeEvent];
}

+ (void)_requestAuthorizationForAccessLevel:(int64_t)a3 supportsLimited:(BOOL)a4 handler:(id)a5
{
  id v8 = a5;
  PHAuthorizationStatus v9 = +[PHPhotoLibrary authorizationStatusForAccessLevel:a3];
  if (a3 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 7;
  }
  uint64_t v11 = [MEMORY[0x1E4F8B998] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PHPhotoLibrary__requestAuthorizationForAccessLevel_supportsLimited_handler___block_invoke;
  v13[3] = &unk_1E5844B98;
  id v14 = v8;
  int64_t v15 = a3;
  BOOL v18 = a4;
  PHAuthorizationStatus v16 = v9;
  id v17 = a1;
  id v12 = v8;
  [v11 checkPhotosAccessAllowedWithScope:v10 handler:v13];
}

uint64_t __78__PHPhotoLibrary__requestAuthorizationForAccessLevel_supportsLimited_handler___block_invoke(uint64_t a1)
{
  PHAuthorizationStatus v2 = +[PHPhotoLibrary authorizationStatusForAccessLevel:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (v2 == PHAuthorizationStatusLimited && *(unsigned char *)(a1 + 64) == 0) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = v2;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  BOOL v6 = (unint64_t)(v2 - 3) > 1 || *(void *)(a1 + 48) == v2;
  if (!v6 && *(void *)(a1 + 40) != 1)
  {
    id v7 = *(void **)(a1 + 56);
    return [v7 _forceUserInterfaceReload];
  }
  return result;
}

+ (void)requestAuthorizationForAccessLevel:(PHAccessLevel)accessLevel handler:(void *)handler
{
}

+ (void)requestAuthorization:(void *)handler
{
}

+ (PHAuthorizationStatus)authorizationStatus
{
  PHAuthorizationStatus v2 = [MEMORY[0x1E4F8B998] sharedInstance];
  uint64_t v3 = [v2 photosAccessAllowedWithScope:7];

  PHAuthorizationStatus v4 = PHAuthorizationStatusNotDetermined;
  PHAuthorizationStatus result = PHAuthorizationStatusAuthorized;
  switch(v3)
  {
    case 0:
      return 3;
    case 2:
      return 2;
    case 3:
      return 1;
    case 4:
      return result;
    default:
      return v4;
  }
}

+ (id)sharedMomentSharePhotoLibrary
{
  if (sharedMomentSharePhotoLibrary_onceToken != -1) {
    dispatch_once(&sharedMomentSharePhotoLibrary_onceToken, &__block_literal_global_181);
  }
  PHAuthorizationStatus v2 = (void *)sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary;
  if (!sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unable to create moment share shared library" userInfo:0];
    objc_exception_throw(v4);
  }

  return v2;
}

void __47__PHPhotoLibrary_sharedMomentSharePhotoLibrary__block_invoke()
{
  id v0 = [[PHPhotoLibrary alloc] initMomentShareLibrary];
  uint64_t v1 = (void *)sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary;
  sharedMomentSharePhotoLibrary_sharedMomentSharePhotoLibrary = (uint64_t)v0;
}

+ (BOOL)setImagePickerPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__20217;
  uint64_t v13 = __Block_byref_object_dispose__20218;
  id v14 = 0;
  id v5 = a3;
  PLRunWithUnfairLock();
  BOOL v6 = (void *)v10[5];
  if (a4 && v6)
  {
    *a4 = v6;
    BOOL v6 = (void *)v10[5];
  }
  BOOL v7 = v6 == 0;

  _Block_object_dispose(&v9, 8);
  return v7;
}

void __51__PHPhotoLibrary_setImagePickerPhotoLibrary_error___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  PHAuthorizationStatus v2 = [*(id *)(a1 + 32) photoLibraryURL];
  BOOL v3 = +[PHPhotoLibrary isSystemPhotoLibraryURL:v2];

  if (v3)
  {
    objc_storeStrong((id *)&imagePickerPhotoLibrary, *(id *)(a1 + 32));
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v10[0] = @"The image picker photo library URL must match the system photo library URL";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v6 = [v4 errorWithDomain:@"PHPhotosErrorDomain" code:3111 userInfo:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

+ (id)imagePickerPhotoLibrary
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__20217;
  id v8 = __Block_byref_object_dispose__20218;
  id v9 = 0;
  PLRunWithUnfairLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __41__PHPhotoLibrary_imagePickerPhotoLibrary__block_invoke(uint64_t a1)
{
  id v2 = (void *)imagePickerPhotoLibrary;
  if (!imagePickerPhotoLibrary)
  {
    uint64_t v3 = [*(id *)(a1 + 40) _sharedPhotoLibrary];
    uint64_t v4 = (void *)imagePickerPhotoLibrary;
    imagePickerPhotoLibrary = v3;

    id v2 = (void *)imagePickerPhotoLibrary;
  }
  id v5 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  objc_storeStrong(v5, v2);
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(PHPhotoLibrary *)self assetsdClient];
  id v5 = [v6 libraryInternalClient];
  objc_msgSend(v5, "setWidgetTimelineGeneratedForDisplaySize:completionHandler:", &__block_literal_global_1178, width, height);
}

void __68__PHPhotoLibrary_Widgets__setWidgetTimelineGeneratedForDisplaySize___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLBackendGetLog();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      uint64_t v7 = "Widget timeline update date successfully persisted";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_19B043000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    uint64_t v7 = "Widget timeline update date failed to persist: %@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (id)sceneTaxonomyDetectorNodeSceneIDsFromSceneID:(unint64_t)a3 sceneTaxonomy:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    if ([v5 nodeRefForExtendedSceneClassId:a3])
    {
      uint64_t v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:PFSceneTaxonomyNodeDetectorsCount()];
      PFSceneTaxonomyNodeVisitDetectors();
      id v8 = v7;
      goto LABEL_10;
    }
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      unint64_t v15 = a3;
      __int16 v16 = 2112;
      id v17 = v6;
      os_log_type_t v9 = "Failed to find sceneID (%llu) in sceneTaxonomy: %@";
      uint32_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 22;
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      os_log_type_t v9 = "PFSceneTaxonomy is nil.";
      uint32_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 2;
LABEL_8:
      _os_log_impl(&dword_19B043000, v10, v11, v9, buf, v12);
    }
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

uint64_t __91__PHPhotoLibrary_PhotosFormat__sceneTaxonomyDetectorNodeSceneIDsFromSceneID_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a3 + 16)];
  [v3 addObject:v4];

  return 1;
}

- (id)migrationDate
{
  id v2 = [(PHPhotoLibrary *)self photoLibrary];
  uint64_t v9 = 0;
  uint32_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint32_t v12 = __Block_byref_object_copy__20217;
  uint64_t v13 = __Block_byref_object_dispose__20218;
  id v14 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PHPhotoLibrary_MigrationDate__migrationDate__block_invoke;
  void v6[3] = &unk_1E5848D28;
  id v3 = v2;
  id v7 = v3;
  id v8 = &v9;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

void __46__PHPhotoLibrary_MigrationDate__migrationDate__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F8A9A8];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v7 = [v2 currentMigrationHistoryWithManagedObjectContext:v3];

  uint64_t v4 = [v7 migrationDate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)cancelReservedCloudIdentifiersWithObjectType:(int64_t)a3 error:(id *)a4
{
  id v6 = +[PHPhotoLibrary PHObjectClassForObjectType:a3];
  id v7 = [(objc_class *)v6 identifierCode];
  uint64_t v8 = [(objc_class *)v6 managedEntityName];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    id v15 = v14;
    BOOL v16 = 1;
    goto LABEL_9;
  }
  uint64_t v11 = [(PHPhotoLibrary *)self assetsdClient];
  uint32_t v12 = [v11 photoKitClient];
  id v20 = 0;
  char v13 = [v12 cancelReservedCloudIdentifiersWithEntityName:v9 error:&v20];
  id v14 = v20;

  if (v13) {
    goto LABEL_8;
  }
  uint64_t v18 = PHPublicErrorFromError(v14);

  id v19 = v18;
  id v15 = v19;
  if (a4)
  {
    id v15 = v19;
    BOOL v16 = 0;
    *a4 = v15;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_9:

  return v16;
}

- (id)reservedCloudIdentifiersWithObjectType:(int64_t)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = +[PHPhotoLibrary PHObjectClassForObjectType:a3];
  id v7 = [(objc_class *)v6 identifierCode];
  uint64_t v8 = [(objc_class *)v6 managedEntityName];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    if (a4)
    {
      id v11 = v11;
      BOOL v16 = 0;
      *a4 = v11;
    }
    else
    {
      BOOL v16 = 0;
    }
    goto LABEL_21;
  }
  uint32_t v12 = [(PHPhotoLibrary *)self assetsdClient];
  char v13 = [v12 photoKitClient];
  id v30 = 0;
  id v14 = [v13 reservedCloudIdentifiersWithEntityName:v9 error:&v30];
  id v15 = v30;

  if (v14)
  {
    id v25 = v15;
    BOOL v16 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    uint64_t v17 = PHPublicErrorFromError(v15);

    BOOL v16 = 0;
    id v25 = (void *)v17;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [[PHCloudIdentifier alloc] initWithLocalCloudIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * i) identifierCode:v7 fingerPrint:&stru_1EEAC1950];
        [v16 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  id v11 = v25;
  if (!v16) {
    goto LABEL_18;
  }
LABEL_21:

  return v16;
}

- (id)reserveCloudIdentifiersWithObjectType:(int64_t)a3 count:(unint64_t)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F8AD38] < a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3204, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    if (a5)
    {
      id v6 = v6;
      id v15 = 0;
      *a5 = v6;
    }
    else
    {
      id v15 = 0;
    }
    goto LABEL_24;
  }
  uint64_t v9 = +[PHPhotoLibrary PHObjectClassForObjectType:a3];
  BOOL v10 = [(objc_class *)v9 identifierCode];
  uint64_t v11 = [(objc_class *)v9 managedEntityName];
  uint32_t v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    id v15 = 0;
  }
  else
  {
    BOOL v16 = [(PHPhotoLibrary *)self assetsdClient];
    uint64_t v17 = [v16 photoKitClient];
    id v34 = 0;
    id v18 = [v17 reserveCloudIdentifiersWithEntityName:v12 count:a4 error:&v34];
    id v19 = v34;

    long long v29 = a5;
    if (v18)
    {
      id v28 = v19;
      id v15 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      uint64_t v20 = PHPublicErrorFromError(v19);

      id v15 = 0;
      id v28 = (id)v20;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = [[PHCloudIdentifier alloc] initWithLocalCloudIdentifier:*(void *)(*((void *)&v30 + 1) + 8 * i) identifierCode:v10 fingerPrint:&stru_1EEAC1950];
          [v15 addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v23);
    }

    id v14 = v28;
    a5 = v29;
  }

  id v6 = v14;
  if (!v15) {
    goto LABEL_21;
  }
LABEL_24:

  return v15;
}

+ (void)setNeedsToRepairKeyCuratedAssetForMemories:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueForKey:@"uuid"];
  if (setNeedsToRepairKeyCuratedAssetForMemories__onceToken != -1) {
    dispatch_once(&setNeedsToRepairKeyCuratedAssetForMemories__onceToken, &__block_literal_global_1154);
  }
  uint64_t v5 = setNeedsToRepairKeyCuratedAssetForMemories__repairQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __69__PHPhotoLibrary_Repair__setNeedsToRepairKeyCuratedAssetForMemories___block_invoke_2;
  v8[3] = &unk_1E5848DF0;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void __69__PHPhotoLibrary_Repair__setNeedsToRepairKeyCuratedAssetForMemories___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v3 = (void *)PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs;
    PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs = (uint64_t)v2;
  }
  uint64_t v4 = [*(id *)(a1 + 32) firstObject];
  uint64_t v5 = [v4 photoLibrary];

  id v18 = v5;
  id v19 = [v5 assetsdClient];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (([(id)PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs containsObject:v11] & 1) == 0)
        {
          [(id)PHCloudQuotaBytesUsedMediaTypeKeyVideo_block_invoke_repairedUUIDs addObject:v11];
          uint32_t v12 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v26 = v11;
            _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "repairing key asset for memory with uuid=%@", buf, 0xCu);
          }

          BOOL v13 = [v19 libraryInternalClient];
          uint64_t v29 = v11;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
          id v20 = 0;
          char v15 = [v13 repairMemoriesWithUUIDs:v14 error:&v20];
          id v16 = v20;

          if ((v15 & 1) == 0)
          {
            uint64_t v17 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v26 = v11;
              __int16 v27 = 2112;
              id v28 = v16;
              _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Error repairing key asset for memory with uuid=%@: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v8);
  }
}

void __69__PHPhotoLibrary_Repair__setNeedsToRepairKeyCuratedAssetForMemories___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PHPhotoLibrary.memoryKeyCuratedAssetRepair", 0);
  uint64_t v1 = (void *)setNeedsToRepairKeyCuratedAssetForMemories__repairQueue;
  setNeedsToRepairKeyCuratedAssetForMemories__repairQueue = (uint64_t)v0;
}

+ (void)setSharedPhotoLibrary:(id)a3
{
  id v4 = a3;
  [a1 assertRunningInExtension];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PHPhotoLibrary_ProjectExtensions__setSharedPhotoLibrary___block_invoke;
  block[3] = &unk_1E5848578;
  id v8 = v4;
  uint64_t v5 = sharedPhotoLibraryOnceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&sharedPhotoLibraryOnceToken, block);
  }
}

void __59__PHPhotoLibrary_ProjectExtensions__setSharedPhotoLibrary___block_invoke(uint64_t a1)
{
}

+ (BOOL)hasSharedPhotoLibrary
{
  return sharedPhotoLibrary != 0;
}

+ (void)assertRunningInExtension
{
  if (assertRunningInExtension_onceToken != -1) {
    dispatch_once(&assertRunningInExtension_onceToken, &__block_literal_global_1163);
  }
  if (!assertRunningInExtension_runningInExtension)
  {
    id v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_ERROR, "Error: API misuse. Calling API that is only allowed for extensions.", v4, 2u);
    }

    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"API misuse. Calling API that is only allowed for extensions." userInfo:0];
    objc_exception_throw(v3);
  }
}

void __61__PHPhotoLibrary_ProjectExtensions__assertRunningInExtension__block_invoke()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v0 infoDictionary];

  uint64_t v1 = [v3 objectForKey:@"NSExtension"];
  if (v1)
  {
    assertRunningInExtension_runningInExtension = 1;
  }
  else
  {
    id v2 = [v3 objectForKey:@"PlugInKit"];
    assertRunningInExtension_runningInExtension = v2 != 0;
  }
}

+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3
{
  [MEMORY[0x1E4F598A0] nextOverrideTimeIntervalForSystemBudgets:a3];
  return result;
}

- (id)_cloudInternalClient
{
  id v2 = [(PHPhotoLibrary *)self photoLibrary];
  id v3 = [v2 assetsdClient];
  id v4 = [v3 cloudInternalClient];

  return v4;
}

- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = [(PHPhotoLibrary *)self _cloudInternalClient];
  [v12 overrideSystemBudgetsForSyncSession:v8 pauseReason:v11 systemBudgets:a5 completionHandler:v10];
}

- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PHPhotoLibrary *)self _cloudInternalClient];
  [v6 setCloudPhotoLibraryPauseState:v5 reason:v4];
}

- (id)_updateGraphAvailabilityInFeatureAvailability:(id)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  PLPhotoKitGetLog();
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PHFeatureAvailability - updateGraphAvailabilityInFeatureAvailability", (const char *)&unk_19B30018E, (uint8_t *)&v24, 2u);
  }

  if (PLIsPhotoanalysisd())
  {
    BOOL v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315138;
      id v25 = "-[PHPhotoLibrary(FeatureAvailability) _updateGraphAvailabilityInFeatureAvailability:forFeature:error:]";
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "FeatureAvailability - %s called from PAD, using intpu FeatureAvailability as is", (uint8_t *)&v24, 0xCu);
    }

    id v14 = [[PHFeatureAvailability alloc] initForFeature:a4 withPLFeatureAvailability:v8];
  }
  else
  {
    char v15 = [(PHPhotoLibrary *)self photoAnalysisClient];
    id v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 requestGraphStatus:a5];
      id v18 = v17;
      if (v17)
      {
        BOOL v19 = [v17 availability] == 2;
        id v20 = [MEMORY[0x1E4F8A800] availabilityFromFeatureAvailability:v8 withGraphIsAvailable:v19];
        id v14 = [[PHFeatureAvailability alloc] initForFeature:a4 withPLFeatureAvailability:v20];
        long long v21 = v12;
        long long v22 = v21;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          LOWORD(v24) = 0;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v22, OS_SIGNPOST_INTERVAL_END, v10, "PHFeatureAvailability - updateGraphAvailabilityInFeatureAvailability", (const char *)&unk_19B30018E, (uint8_t *)&v24, 2u);
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Could not get PhotoAnalysis client.");
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

- (id)featureAvailabilityForFeature:(unint64_t)a3 readOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  PLPhotoKitGetLog();
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PHFeatureAvailability - featureAvailabilityForFeature", (const char *)&unk_19B30018E, buf, 2u);
  }

  BOOL v13 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  id v14 = [v13 globalValues];
  char v15 = [v14 featureAvailability];

  if (!v15)
  {
    id v17 = [[PHFeatureAvailability alloc] initForFeature:a3];
    goto LABEL_15;
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F8A800]) initWithDictionary:v15];
  if ([v8 useJustInTimeGraphAvailability])
  {
    id v17 = [(PHPhotoLibrary *)self _updateGraphAvailabilityInFeatureAvailability:v16 forFeature:a3 error:a5];
    if (v17) {
      goto LABEL_11;
    }
    id v18 = [[PHFeatureAvailability alloc] initForFeature:a3];
  }
  else
  {
    id v18 = [[PHFeatureAvailability alloc] initForFeature:a3 withPLFeatureAvailability:v16];
  }
  id v17 = v18;
LABEL_11:
  BOOL v19 = v12;
  id v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_INTERVAL_END, v10, "PHFeatureAvailability - featureAvailabilityForFeature", (const char *)&unk_19B30018E, v22, 2u);
  }

LABEL_15:

  return v17;
}

- (NSArray)cloudIdentifiersForLocalIdentifiers:(NSArray *)localIdentifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = localIdentifiers;
  BOOL v5 = [[PHCloudIdentifierLookup alloc] initWithPhotoLibrary:self];
  id v6 = [(PHCloudIdentifierLookup *)v5 lookupCloudIdentifiersForLocalIdentifiers:v4];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        BOOL v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (!v13)
        {
          BOOL v13 = +[PHCloudIdentifier _notFoundIdentifier];
        }
        [v7 addObject:v13];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (NSArray)localIdentifiersForCloudIdentifiers:(NSArray *)cloudIdentifiers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = cloudIdentifiers;
  long long v16 = [[PHCloudIdentifierLookup alloc] initWithPhotoLibrary:self];
  BOOL v5 = [(PHCloudIdentifierLookup *)v16 lookupLocalIdentifiersForCloudIdentifiers:v4];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = v4;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) localCloudIdentifier];
        BOOL v13 = [v5 objectForKeyedSubscript:v12];

        if (v13)
        {
          objc_opt_class();
          id v14 = &stru_1EEAC1950;
          if (objc_opt_isKindOfClass()) {
            id v14 = v13;
          }
        }
        else
        {
          id v14 = &stru_1EEAC1950;
        }
        [v6 addObject:v14];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (NSDictionary)cloudIdentifierMappingsForLocalIdentifiers:(NSArray *)localIdentifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = localIdentifiers;
  long long v17 = [[PHCloudIdentifierLookup alloc] initWithPhotoLibrary:self];
  BOOL v5 = [(PHCloudIdentifierLookup *)v17 lookupCloudIdentifiersForLocalIdentifiers:v4];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x19F389B10]();
        BOOL v13 = [v5 objectForKeyedSubscript:v11];
        if (v13)
        {
          id v14 = 0;
        }
        else
        {
          id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3201 userInfo:0];
        }
        long long v15 = [[PHCloudIdentifierMapping alloc] initWithCloudIdentifier:v13 error:v14];
        [v6 setObject:v15 forKeyedSubscript:v11];
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return (NSDictionary *)v6;
}

- (NSDictionary)localIdentifierMappingsForCloudIdentifiers:(NSArray *)cloudIdentifiers
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = cloudIdentifiers;
  long long v23 = [[PHCloudIdentifierLookup alloc] initWithPhotoLibrary:self];
  BOOL v5 = [(PHCloudIdentifierLookup *)v23 lookupLocalIdentifiersForCloudIdentifiers:v4];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v4, "count"));
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x19F389B10]();
        id v12 = [v10 localCloudIdentifier];
        BOOL v13 = [v5 objectForKeyedSubscript:v12];

        if (!v13)
        {
          long long v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v17 = 3201;
LABEL_13:
          long long v15 = [v16 errorWithDomain:@"PHPhotosErrorDomain" code:v17 userInfo:0];
          goto LABEL_14;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          long long v15 = 0;
          goto LABEL_15;
        }
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        long long v19 = (void *)MEMORY[0x1E4F28C58];
        if ((isKindOfClass & 1) == 0)
        {
          long long v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v17 = -1;
          goto LABEL_13;
        }
        long long v30 = @"PHLocalIdentifiersErrorKey";
        uint64_t v31 = v13;
        long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        long long v15 = [v19 errorWithDomain:@"PHPhotosErrorDomain" code:3202 userInfo:v20];

LABEL_14:
        id v14 = 0;
LABEL_15:
        long long v21 = [[PHLocalIdentifierMapping alloc] initWithLocalIdentifier:v14 error:v15];
        [v25 setObject:v21 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v7);
  }

  return (NSDictionary *)v25;
}

- (id)bfa_fetchUUIDsForRestrictedOIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v6 = [v5 photoKitClient];

  uint64_t v7 = [(PHPhotoLibrary *)self objectFetchingContextForCurrentQueueQoS];
  id v12 = 0;
  uint64_t v8 = [v6 getUUIDsForAssetObjectIDs:v4 filterPredicate:0 context:v7 error:&v12];

  id v9 = v12;
  if (!v8)
  {
    uint64_t v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve UUIDs for missing fetch result object IDs %@", buf, 0xCu);
    }
  }

  return v8;
}

- (BOOL)bfa_supportsPrivacyRestrictionsForOIDs:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_8;
  }
  BOOL v5 = [(PHPhotoLibrary *)self photoLibraryBundle];
  uint64_t v6 = [v5 connectionType];

  if (v6 != 1) {
    goto LABEL_8;
  }
  objc_opt_class();
  uint64_t v7 = [v4 firstObject];
  uint64_t v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  id v9 = v8;

  uint64_t v10 = [v9 entity];

  uint64_t v11 = [v10 name];
  id v12 = [MEMORY[0x1E4F8A950] entityName];
  char v13 = [v11 isEqualToString:v12];

  if (v13) {
    BOOL v14 = 1;
  }
  else {
LABEL_8:
  }
    BOOL v14 = 0;

  return v14;
}

- (id)bfa_tombstoneObjectForOID:(id)a3 uuid:(id)a4 propertyHint:(unint64_t)a5 overrideResultsWithClass:(Class)a6
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!a6) {
    a6 = +[PHPhotoLibrary PHObjectClassForOID:v10];
  }
  uint64_t v12 = [(objc_class *)a6 entityKeyForPropertyKey:@"uuid"];
  char v13 = (void *)v12;
  if (v12) {
    BOOL v14 = (__CFString *)v12;
  }
  else {
    BOOL v14 = @"uuid";
  }
  uint64_t v15 = v14;

  v19[0] = @"objectID";
  v19[1] = @"deleted";
  v20[0] = v10;
  v20[1] = MEMORY[0x1E4F1CC38];
  void v19[2] = v15;
  void v20[2] = v11;
  long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  uint64_t v17 = (void *)[[a6 alloc] initWithFetchDictionary:v16 propertyHint:a5 photoLibrary:self];

  return v17;
}

- (id)fetchPersonAvailabilityOfDetectionTypes:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PHPhotoLibrary *)self photoLibrary];
  if (v7)
  {
    if (!v6)
    {
      id v6 = +[PHFetchOptions defaultDetectionTypes];
    }
    uint64_t v8 = [MEMORY[0x1E4F8AA10] predicateForIncludedDetectionTypes:v6];
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    uint64_t v35 = __Block_byref_object_copy__44067;
    uint64_t v36 = __Block_byref_object_dispose__44068;
    id v37 = 0;
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__44067;
    long long v30 = __Block_byref_object_dispose__44068;
    id v31 = 0;
    id v9 = [v7 managedObjectContext];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __84__PHPhotoLibrary_PersonAvailability__fetchPersonAvailabilityOfDetectionTypes_error___block_invoke;
    v20[3] = &unk_1E5847F08;
    id v10 = v8;
    id v21 = v10;
    id v11 = v9;
    id v22 = v11;
    uint64_t v24 = &v26;
    id v25 = &v32;
    id v6 = v6;
    id v23 = v6;
    [v11 performBlockAndWait:v20];
    uint64_t v12 = v33[5];
    id v13 = (id)v27[5];
    BOOL v14 = v13;
    if (!v12 && a4) {
      *a4 = v13;
    }

    id v15 = (id)v33[5];
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28228];
    v39[0] = @"Unable to obtain PLPhotoLibrary";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v17 = objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3109, v10);
    long long v18 = v17;
    if (a4) {
      *a4 = v17;
    }

    id v15 = 0;
  }

  return v15;
}

void __84__PHPhotoLibrary_PersonAvailability__fetchPersonAvailabilityOfDetectionTypes_error___block_invoke(void *a1)
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F8AA10] fetchRequest];
  v49[0] = @"mdID";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  [v2 setPropertiesToFetch:v3];

  v48[0] = @"keyFace.vuObservationID";
  v48[1] = @"faceCrops";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  [v2 setRelationshipKeyPathsForPrefetching:v4];

  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"type", 0);
  v47[0] = v5;
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"verifiedType", &unk_1EEB26D78];
  v47[1] = v6;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"faceCount");
  v47[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];

  if (a1[4])
  {
    uint64_t v9 = objc_msgSend(v8, "arrayByAddingObject:");

    uint64_t v8 = (void *)v9;
  }
  id v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v8];
  [v2 setPredicate:v10];

  [v2 setFetchBatchSize:100];
  id v11 = (void *)a1[5];
  id v43 = 0;
  uint64_t v12 = [v11 executeFetchRequest:v2 error:&v43];
  id v13 = v43;
  BOOL v14 = v13;
  if (v12)
  {
    id v15 = [[PHPersonAvailability alloc] initWithRequestedDetectionTypes:a1[6]];
    uint64_t v16 = *(void *)(a1[8] + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v36 = v14;
      id v37 = v12;
      uint64_t v38 = v8;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v24 = (void *)MEMORY[0x19F389B10]();
          objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "setAvailablePersonCount:", objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "availablePersonCount") + 1);
          id v25 = [v23 mdID];

          if (v25) {
            objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "setMdIDCount:", objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "mdIDCount") + 1);
          }
          uint64_t v26 = [v23 keyFace];
          if (v26)
          {
            objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "setKeyFaceCount:", objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "keyFaceCount") + 1);
            if ([v26 vuObservationID]) {
              objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "setKeyFaceWithVUObservationIDCount:", objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "keyFaceWithVUObservationIDCount") + 1);
            }
          }
          long long v27 = [v23 faceCrops];
          uint64_t v28 = [v27 anyObject];

          if (v28) {
            objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "setNonzeroFaceCropsCount:", objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "nonzeroFaceCropsCount") + 1);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v20);
      uint64_t v12 = v37;
      uint64_t v8 = v38;
      BOOL v14 = v36;
    }
LABEL_22:

    goto LABEL_23;
  }
  long long v29 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v30 = *MEMORY[0x1E4F28228];
  v46[0] = @"Person fetch failed";
  uint64_t v31 = *MEMORY[0x1E4F28A50];
  v45[0] = v30;
  v45[1] = v31;
  id v18 = v13;
  if (!v13)
  {
    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:0 userInfo:0];
  }
  v46[1] = v18;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  uint64_t v33 = [v29 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v32];
  uint64_t v34 = *(void *)(a1[7] + 8);
  uint64_t v35 = *(void **)(v34 + 40);
  *(void *)(v34 + 40) = v33;

  if (!v14) {
    goto LABEL_22;
  }
LABEL_23:
}

- (id)fetchPersonAvailabilityWithError:(id *)a3
{
  return [(PHPhotoLibrary *)self fetchPersonAvailabilityOfDetectionTypes:0 error:a3];
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v8 = [v7 photoKitClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __73__PHPhotoLibrary_AssetAnalysis__analyzeLibraryForFeature_withCompletion___block_invoke;
  v12[3] = &unk_1E5848190;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v8 analyzeLibraryForFeature:a3 withCompletionHandler:v12];

  return v10;
}

void __73__PHPhotoLibrary_AssetAnalysis__analyzeLibraryForFeature_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isSuccess];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PHPhotoLibrary *)self assetsdClient];
  id v11 = [v10 photoKitClient];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __73__PHPhotoLibrary_AssetAnalysis__analyzeAssets_forFeature_withCompletion___block_invoke;
  v15[3] = &unk_1E5848190;
  id v16 = v8;
  id v12 = v8;
  id v13 = [v11 analyzeAssets:v9 forFeature:a4 withCompletionHandler:v15];

  return v13;
}

void __73__PHPhotoLibrary_AssetAnalysis__analyzeAssets_forFeature_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isSuccess];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (void)requestDeleteEmbeddings:(id)a3 assetUUID:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PHPhotoLibrary *)self assetsdClient];
  id v12 = [v11 libraryInternalClient];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__PHPhotoLibrary_AssetAnalysis__requestDeleteEmbeddings_assetUUID_withCompletion___block_invoke;
  v14[3] = &unk_1E58484E0;
  id v15 = v8;
  id v13 = v8;
  [v12 deleteEmbeddings:v10 assetUUID:v9 completionHandler:v14];
}

void __82__PHPhotoLibrary_AssetAnalysis__requestDeleteEmbeddings_assetUUID_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Error requesting embedding deletions: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)requestInsertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(PHPhotoLibrary *)self assetsdClient];
  BOOL v14 = [v13 libraryInternalClient];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__PHPhotoLibrary_AssetAnalysis__requestInsertEmbeddings_modelType_assetUUID_withCompletion___block_invoke;
  v16[3] = &unk_1E58484E0;
  id v17 = v10;
  id v15 = v10;
  [v14 insertEmbeddings:v12 modelType:a4 assetUUID:v11 completionHandler:v16];
}

void __92__PHPhotoLibrary_AssetAnalysis__requestInsertEmbeddings_modelType_assetUUID_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Error requesting embedding insertions: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)requestGraphModelResultWithOptions:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v11 = v10;
  if (v10)
  {
    [v10 requestGraphModelResultWithOptions:v12 progress:v8 reply:v9];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (id)newUnclusteredFacesFetchOptions
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F8A998] currentFaceVersion];
  uint64_t v4 = [v3 intValue];

  id v5 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
  [v5 setIncludeNonvisibleFaces:1];
  [v5 setIncludeOnlyFacesWithFaceprints:1];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K = %d) AND (((%K = 0) AND (%K = 0) AND ((%K = %d) OR (%K = nil))) OR ((%K = %d) OR (%K = %d) OR (%K = %d)))", @"faceAlgorithmVersion", v4, @"hidden", @"manual", @"trainingType", 0, @"trainingType", @"trainingType", 1, @"trainingType", 2, @"trainingType", 5);
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v6;
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0", @"vuObservationID");
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v7 andPredicateWithSubpredicates:v9];
  [v5 setInternalPredicate:v10];

  [v5 setIncludedDetectionTypes:&unk_1EEB26DF0];
  return v5;
}

- (id)newFaceCropsToBeGeneratedFetchOptions
{
  uint64_t v2 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
  [v2 setIncludeOnlyFacesNeedingFaceCrop:1];
  [v2 setIncludeNonvisibleFaces:1];
  [v2 setIncludedDetectionTypes:&unk_1EEB26DD8];
  return v2;
}

- (id)newClusteringEligibleFacesFetchOptions
{
  id v3 = [MEMORY[0x1E4F8A998] currentFaceVersion];
  uint64_t v4 = [v3 intValue];

  id v5 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
  [v5 setIncludeNonvisibleFaces:1];
  [v5 setIncludeOnlyFacesWithFaceprints:1];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(faceAlgorithmVersion = %d) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))", v4, 0, 1, 2, 5);
  [v5 setInternalPredicate:v6];

  return v5;
}

- (unint64_t)countOfClusteringEligibleFaces
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = PLAssetAnalysisGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)BOOL v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfClusteringEligibleFaces", (const char *)&unk_19B30018E, v14, 2u);
  }

  id v7 = [(PHPhotoLibrary *)self newClusteringEligibleFacesFetchOptions];
  [v7 setShouldPrefetchCount:1];
  v15[0] = @"PHFacePropertySetIdentifier";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v7 setFetchPropertySets:v8];

  id v9 = +[PHFace fetchFacesWithOptions:v7];
  unint64_t v10 = [v9 count];
  id v11 = v6;
  id v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)BOOL v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_END, v4, "CountOfClusteringEligibleFaces", (const char *)&unk_19B30018E, v14, 2u);
  }

  return v10;
}

- (unint64_t)countOfDirtyFaceGroups
{
  return 0;
}

void __62__PHPhotoLibrary_AssetAnalysis__countOfFaceCropsToBeGenerated__block_invoke(uint64_t a1)
{
  v21[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F8A7B0] fetchRequest];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  os_signpost_id_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"faceCrop");
  v21[0] = v4;
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 0", @"duration");
  v21[1] = v5;
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NO", @"manual");
  void v21[2] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0 OR %K == 0", @"centerX", @"bodyCenterX");
  v21[3] = v7;
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"ANY %K != nil OR %K = %d", @"rejectedPersonsNeedingFaceCrops", @"confirmedFaceCropGenerationState", 1);
  v21[4] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
  unint64_t v10 = [v3 andPredicateWithSubpredicates:v9];
  [v2 setPredicate:v10];

  id v11 = *(void **)(a1 + 32);
  id v16 = 0;
  uint64_t v12 = [v11 countForFetchRequest:v2 error:&v16];
  id v13 = v16;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v2 predicate];
      *(_DWORD *)long long buf = 138412546;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Error getting count of DetectedFace with predicate %@: %@", buf, 0x16u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (unint64_t)countOfUnprocessedFaceCrops
{
  id v3 = PLAssetAnalysisGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CountOfUnprocessedFaceCrops", (const char *)&unk_19B30018E, buf, 2u);
  }

  id v7 = [(PHPhotoLibrary *)self librarySpecificFetchOptions];
  [v7 setShouldPrefetchCount:1];
  id v8 = +[PHFaceCrop fetchFaceCropsNeedingFaceDetectionWithOptions:v7];
  unint64_t v9 = [v8 count];
  unint64_t v10 = v6;
  id v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v11, OS_SIGNPOST_INTERVAL_END, v4, "CountOfUnprocessedFaceCrops", (const char *)&unk_19B30018E, v13, 2u);
  }

  return v9;
}

- (id)faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__44562;
    uint64_t v32 = __Block_byref_object_dispose__44563;
    id v33 = 0;
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__44562;
    uint64_t v26 = __Block_byref_object_dispose__44563;
    id v27 = 0;
    unint64_t v9 = [(PHPhotoLibrary *)self photoLibrary];
    unint64_t v10 = [v9 managedObjectContext];
    id v11 = (void *)MEMORY[0x19F389B10]();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers_error___block_invoke;
    v16[3] = &unk_1E5848368;
    id v17 = v6;
    id v12 = v10;
    id v18 = v12;
    __int16 v19 = &v28;
    id v20 = &v22;
    uint64_t v21 = v8;
    [v9 performBlockAndWait:v16];

    id v13 = (void *)v23[5];
    if (a4 && !v13)
    {
      *a4 = (id) v29[5];
      id v13 = (void *)v23[5];
    }
    id v14 = v13;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v14;
}

void __99__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers_error___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F8A7B0] fetchRequest];
  [v2 setPropertiesToFetch:&unk_1EEB26DC0];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"clusterSequenceNumber in %@", a1[4]];
  [v2 setPredicate:v3];

  [v2 setFetchBatchSize:100];
  os_signpost_id_t v4 = (void *)a1[5];
  uint64_t v5 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v5 + 40);
  id v6 = [v4 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithCapacity:a1[8]];
    uint64_t v8 = *(void *)(a1[7] + 8);
    unint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*(void *)(a1[7] + 8) + 40);
          id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "clusterSequenceNumber"));
          [v15 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    unint64_t v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v25 = v17;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Error fetching faces: %@", buf, 0xCu);
    }
  }
}

- (id)faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson:(id)a3 verifiedClusterSequenceNumbers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v10 = [(PHPhotoLibrary *)self photoLibrary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke;
  v21[3] = &unk_1E5848078;
  v21[4] = self;
  id v22 = v6;
  id v11 = v8;
  id v23 = v11;
  id v24 = v7;
  id v12 = v9;
  id v25 = v12;
  id v13 = v7;
  id v14 = v6;
  [v10 performBlockAndWait:v21];

  if (![v12 count])
  {
    id v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v20 = 0;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "Prefiltering is not done since the current criteria filtered out all clusters.", v20, 2u);
    }

    id v16 = v11;
    id v12 = v16;
  }
  uint64_t v17 = v25;
  id v18 = v12;

  return v18;
}

void __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = [v2 managedObjectContext];

  uint64_t v35 = [*v1 librarySpecificFetchOptions];
  [v35 setMinimumUnverifiedFaceCount:1];
  uint64_t v34 = +[PHFaceGroup fetchFaceGroupsForPerson:*(void *)(a1 + 40) options:v35];
  id v33 = [v34 fetchedObjectIDs];
  objc_msgSend(v3, "pl_fetchObjectsWithIDs:", v33);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v66 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v6 = (void *)MEMORY[0x19F389B10]();
        id v7 = (void *)MEMORY[0x1E4F1C0D0];
        id v8 = [MEMORY[0x1E4F8AA10] entityName];
        id v9 = [v7 fetchRequestWithEntityName:v8];

        unint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"associatedFaceGroup == %@ AND faceCount > 0", v5];
        [v9 setPredicate:v10];

        [v9 setResultType:0];
        [v9 setFetchLimit:1];
        [v9 setReturnsObjectsAsFaults:0];
        id v64 = 0;
        id v11 = [v3 executeFetchRequest:v9 error:&v64];
        id v12 = v64;
        id v13 = [v11 firstObject];

        if (v12)
        {
          id v14 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v12;
            _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Error fetching unverified person: %@", (uint8_t *)&buf, 0xCu);
          }
        }
        id v15 = (void *)MEMORY[0x1E4F1C0D0];
        id v16 = [MEMORY[0x1E4F8A7B0] entityName];
        uint64_t v17 = [v15 fetchRequestWithEntityName:v16];

        id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ AND %K == NO AND %K >= 1", @"faceGroup", v5, @"manual", @"clusterSequenceNumber"];
        [v17 setPredicate:v18];

        uint64_t v75 = @"personForFace";
        long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
        [v17 setRelationshipKeyPathsForPrefetching:v19];

        uint64_t v74 = @"clusterSequenceNumber";
        long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
        [v17 setPropertiesToFetch:v20];

        [v17 setResultType:0];
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v70 = 0x3032000000;
        uint64_t v71 = __Block_byref_object_copy__44562;
        uint64_t v72 = __Block_byref_object_dispose__44563;
        id v73 = [v5 keyFace];
        uint64_t v60 = 0;
        long long v61 = &v60;
        uint64_t v62 = 0x2020000000;
        uint64_t v63 = 0;
        uint64_t v56 = 0;
        uint64_t v57 = &v56;
        uint64_t v58 = 0x2020000000;
        uint64_t v59 = 0;
        uint64_t v52 = 0;
        __int16 v53 = &v52;
        uint64_t v54 = 0x2020000000;
        uint64_t v55 = 0;
        uint64_t v48 = 0;
        uint64_t v49 = &v48;
        uint64_t v50 = 0x2020000000;
        uint64_t v51 = 0;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke_200;
        v40[3] = &unk_1E5848160;
        id v43 = &v60;
        p_long long buf = &buf;
        id v41 = *(id *)(a1 + 40);
        id v21 = v13;
        id v42 = v21;
        uint64_t v45 = &v48;
        long long v46 = &v56;
        __int16 v47 = &v52;
        id v22 = (id)[v3 enumerateObjectsFromFetchRequest:v17 count:0 usingDefaultBatchSizeWithBlock:v40];
        id v23 = *(void **)(a1 + 48);
        id v24 = [NSNumber numberWithUnsignedInteger:v61[3]];
        [v23 addObject:v24];

        unint64_t v25 = v53[3];
        unint64_t v26 = v49[3];
        if (!v25
          || (unint64_t v27 = v57[3], v25 <= v27)
          && (unint64_t v28 = v25 + v27 + v26, v28 > 7)
          && (float)((float)v26 / (float)v28) <= 0.8
          && v27 >= 5 * v25)
        {
          if (!v26)
          {
            long long v29 = *(void **)(a1 + 56);
            uint64_t v30 = [NSNumber numberWithUnsignedInteger:v61[3]];
            [v29 addObject:v30];
          }
          uint64_t v31 = *(void **)(a1 + 64);
          uint64_t v32 = [NSNumber numberWithUnsignedInteger:v61[3]];
          [v31 addObject:v32];
        }
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&buf, 8);
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v38);
  }
}

void __133__PHPhotoLibrary_AssetAnalysis__faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson_verifiedClusterSequenceNumbers___block_invoke_200(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v17 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v5 + 40);
    id v6 = (id *)(v5 + 40);
    id v7 = v8;
    if (v8)
    {
      int v9 = [v7 isEqual:v4];
      id v4 = v17;
      if (!v9) {
        goto LABEL_7;
      }
    }
    else
    {
      objc_storeStrong(v6, a2);
      id v4 = v17;
    }
    int v10 = [v4 clusterSequenceNumber];
    id v4 = v17;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  }
LABEL_7:
  id v11 = [v4 associatedPersonForFaceOrTorso:1 orTemporal:0];
  id v12 = [v11 personUUID];
  id v13 = [*(id *)(a1 + 32) uuid];
  id v14 = *(void **)(a1 + 40);
  if (v14 && [v14 isEqual:v11])
  {
    uint64_t v15 = a1 + 64;
  }
  else
  {
    int v16 = [v12 isEqualToString:v13];
    uint64_t v15 = a1 + 80;
    if (v16) {
      uint64_t v15 = a1 + 72;
    }
  }
  ++*(void *)(*(void *)(*(void *)v15 + 8) + 24);
}

- (id)suggestionsForPersonLocalIdentifier:(id)a3 clusterSequenceNumbers:(id)a4 excludePersonLocalIdentifiers:(id)a5 minimumSuggestionFaceCount:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    unint64_t v25 = __Block_byref_object_copy__44562;
    unint64_t v26 = __Block_byref_object_dispose__44563;
    id v27 = 0;
    id v13 = [(PHPhotoLibrary *)self photoLibrary];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke;
    v16[3] = &unk_1E5848138;
    void v16[4] = self;
    id v17 = v11;
    id v18 = v10;
    unint64_t v21 = a6;
    id v19 = v12;
    long long v20 = &v22;
    [v13 performBlockAndWait:v16];

    id v14 = (id)v23[5];
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = [v2 managedObjectContext];

  if (!*(void *)(a1 + 40))
  {
    uint64_t v9 = 0;
    id v42 = 0;
    unint64_t v13 = 0x1E4F8A000;
    goto LABEL_12;
  }
  id v4 = (void *)MEMORY[0x19F389B10]();
  uint64_t v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = [MEMORY[0x1E4F8A7B0] entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"clusterSequenceNumber in %@", *(void *)(a1 + 40)];
  [v7 setPredicate:v8];

  [v7 setFetchBatchSize:100];
  id v48 = 0;
  uint64_t v9 = [v3 executeFetchRequest:v7 error:&v48];
  id v10 = v48;
  id v11 = v10;
  if (!v9)
  {
    id v17 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v50 = v11;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Error fetching faces: %@", buf, 0xCu);
    }
    uint64_t v9 = 0;
    unint64_t v13 = 0x1E4F8A000uLL;
    goto LABEL_10;
  }

  id v4 = (void *)MEMORY[0x19F389B10]();
  id v12 = (void *)MEMORY[0x1E4F1C0D0];
  unint64_t v13 = 0x1E4F8A000uLL;
  id v14 = [MEMORY[0x1E4F8A7B8] entityName];
  id v7 = [v12 fetchRequestWithEntityName:v14];

  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY detectedFaces in %@", v9];
  [v7 setPredicate:v15];

  [v7 setFetchBatchSize:100];
  id v47 = 0;
  uint64_t v16 = [v3 executeFetchRequest:v7 error:&v47];
  id v11 = v47;
  id v42 = (void *)v16;
  if (!v16)
  {
    id v17 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v50 = v11;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Error fetching face groups: %@", buf, 0xCu);
    }
LABEL_10:

    id v42 = 0;
  }

LABEL_12:
  id v41 = (void *)v9;
  long long v40 = +[PHObject uuidFromLocalIdentifier:*(void *)(a1 + 48)];
  id v18 = objc_msgSend(MEMORY[0x1E4F8AA10], "personWithUUID:inManagedObjectContext:");
  id v19 = [v18 rejectedFaces];
  long long v20 = v3;
  if (v19)
  {
    unint64_t v21 = (void *)MEMORY[0x19F389B10]();
    uint64_t v22 = [*(id *)(v13 + 1976) fetchRequest];
    id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY detectedFaces in %@", v19];
    [v22 setPredicate:v23];

    [v22 setFetchBatchSize:100];
    id v46 = 0;
    uint64_t v24 = v20;
    unint64_t v25 = [v20 executeFetchRequest:v22 error:&v46];
    id v26 = v46;
    if (!v25)
    {
      id v27 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v50 = v26;
        _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "Error fetching rejected face groups: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v24 = v3;
    unint64_t v25 = 0;
  }
  unint64_t v28 = (void *)[v42 mutableCopy];
  [v28 removeObjectsInArray:v25];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v28 count])
  {
    uint64_t v30 = (void *)MEMORY[0x19F389B10]();
    uint64_t v31 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v32 = [MEMORY[0x1E4F8AA10] entityName];
    id v33 = [v31 fetchRequestWithEntityName:v32];

    uint64_t v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"associatedFaceGroup IN %@ AND faceCount >= %ld", v28, *(void *)(a1 + 72)];
    [v33 setPredicate:v34];

    [v33 setRelationshipKeyPathsForPrefetching:&unk_1EEB26DA8];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke_159;
    v43[3] = &unk_1E58480F0;
    id v44 = *(id *)(a1 + 56);
    id v45 = v29;
    id v35 = (id)[v24 enumerateObjectsFromFetchRequest:v33 count:0 usingDefaultBatchSizeWithBlock:v43];
  }
  uint64_t v36 = [v29 allValues];
  uint64_t v37 = [v36 sortedArrayUsingComparator:&__block_literal_global_179];
  uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v39 = *(void **)(v38 + 40);
  *(void *)(v38 + 40) = v37;
}

void __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke_159(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 personUUID];
  id v4 = +[PHObject localIdentifierWithUUID:v3];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) member:v4];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v7 = [v15 keyFace];
      id v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 uuid];
        id v10 = +[PHObject localIdentifierWithUUID:v9];

        [v6 setObject:v4 forKeyedSubscript:@"personIdentifier"];
        id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "faceCount"));
        [v6 setObject:v11 forKeyedSubscript:@"personFaceCount"];

        [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"confirmed"];
        id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "clusterSequenceNumber"));
        [v6 setObject:v12 forKeyedSubscript:@"faceCSN"];

        [v6 setObject:v10 forKeyedSubscript:@"faceIdentifier"];
        unint64_t v13 = *(void **)(a1 + 40);
        id v14 = [v15 objectID];
        [v13 setObject:v6 forKeyedSubscript:v14];
      }
    }
  }
}

uint64_t __149__PHPhotoLibrary_AssetAnalysis__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_minimumSuggestionFaceCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"personFaceCount"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 objectForKeyedSubscript:@"personFaceCount"];

  uint64_t v8 = [v7 integerValue];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

- (id)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(id)a3 candidateAssetUUIDs:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F8ABF8];
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PHPhotoLibrary *)self photoLibrary];
  id v12 = [v8 keyAssetUUIDOfSocialGroupWithPersonUUIDs:v10 candidateAssetUUIDs:v9 inLibrary:v11 error:a5];

  return v12;
}

- (void)personPromotionProcessingStatusForUserInterface:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v5 personPromoterStatus:v4];
}

- (id)suggestedMePersonIdentifierWithError:(id *)a3
{
  id v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v5 = [v4 requestSuggestedMePersonIdentifierWithError:a3];

  return v5;
}

- (id)assetIdentifiersForPersonIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  uint64_t v8 = [v7 requestAssetsForPersonLocalIdentifiers:v6 withError:a4];

  return v8;
}

- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  uint64_t v8 = [v7 requestSocialGroupsOverlappingMemberLocalIdentifiers:v6 withError:a4];

  return v8;
}

- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v11 = [v10 requestAllSocialGroupsForMemberLocalIdentifier:v9 withOptions:v8 error:a5];

  return v11;
}

- (id)sortedArrayOfPersonIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestSortedArrayOfPersonLocalIdentifiers:v6 withError:a4];

  return v8;
}

- (void)requestSearchIndexGraphUpdates:(id)a3 supportingData:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PHPhotoLibrary *)self assetsdClient];
  id v12 = [v11 libraryInternalClient];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__PHPhotoLibrary_AssetAnalysis__requestSearchIndexGraphUpdates_supportingData_withCompletion___block_invoke;
  v14[3] = &unk_1E58484E0;
  id v15 = v8;
  id v13 = v8;
  [v12 applySearchIndexGraphUpdates:v10 supportingData:v9 completionHandler:v14];
}

void __94__PHPhotoLibrary_AssetAnalysis__requestSearchIndexGraphUpdates_supportingData_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Error requesting search index graph updates: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)requestExternalAssetRelevanceProcessingWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v5 requestExternalAssetRelevanceProcessingWithReply:v4];
}

- (void)requestSyndicationProcessingWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v8 requestSyndicationProcessingWithOptions:v7 reply:v6];
}

- (void)requestGenerateQuestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v8 requestGenerateQuestionsWithOptions:v7 reply:v6];
}

- (void)runShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v20 requestRunShadowEvaluationWithRecipe:v19 models:v18 trialDeploymentID:v17 trialExperimentID:v16 trialTreatmentID:v15 resultBlock:v14];
}

- (void)runPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v11 requestRunPFLWithAttachments:v10 recipeUserInfo:v9 resultBlock:v8];
}

- (id)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestTextFeaturesForMomentLocalIdentifiers:v6 error:a4];

  return v8;
}

- (void)simulateMemoriesNotificationWithOptions:(id)a3 reply:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = v7;
  if (v7)
  {
    [v7 simulateMemoriesNotificationWithOptions:v9 reply:v6];
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (BOOL)requestEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a4) = [v7 requestEnrichmentWithOptions:v6 error:a4];

  return (char)a4;
}

- (BOOL)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a4) = [v7 requestAssetRevGeocodingForAssetLocalIdentifiers:v6 withError:a4];

  return (char)a4;
}

- (BOOL)requestAssetRevGeocodingWithError:(id *)a3
{
  id v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a3) = [v4 requestAssetRevGeocodingWithError:a3];

  return (char)a3;
}

- (BOOL)requestHighlightCollectionEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a4) = [v7 requestHighlightCollectionEnrichmentWithOptions:v6 error:a4];

  return (char)a4;
}

- (BOOL)requestHighlightEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a4) = [v7 requestHighlightEnrichmentWithOptions:v6 error:a4];

  return (char)a4;
}

- (void)requestGraphReadyNotificationWithCoalescingIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = v7;
  if (v7)
  {
    [v7 notifyWhenGraphReadyWithCoalescingIdentifier:v9 reply:v6];
  }
  else if (v6)
  {
    v6[2](v6, 1, 0);
  }
}

- (void)requestGraphRebuildProgressWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *, void))a3;
  id v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v5 = v4;
  if (v4)
  {
    [v4 requestGraphRebuildFractionCompletedWithReply:v6];
  }
  else if (v6)
  {
    v6[2](v6, &unk_1EEB26F60, 0);
  }
}

- (BOOL)invalidatePersistentGraphCachesAndReturnError:(id *)a3
{
  id v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a3) = [v4 requestInvalidatePersistentCaches:a3];

  return (char)a3;
}

- (BOOL)invalidateTransientGraphCachesAndReturnError:(id *)a3
{
  id v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a3) = [v4 requestInvalidateTransientCaches:a3];

  return (char)a3;
}

- (id)exportGraphForPurpose:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestExportGraphForPurpose:v6 error:a4];

  return v8;
}

- (void)requestHighlightEstimatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v5 requestHighlightEstimatesWithReply:v4];
}

- (id)graphStatisticsDescription:(id *)a3
{
  id v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v5 = [v4 requestGraphStatisticsWithOptions:MEMORY[0x1E4F1CC08] error:a3];

  return v5;
}

- (id)graphStatusDescription:(id *)a3
{
  id v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v5 = [v4 requestGraphStatus:a3];

  if (v5)
  {
    id v6 = [v5 statusDescription];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)sharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:v6 error:a4];

  return v8;
}

- (id)sharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:v6 error:a4];

  return v8;
}

- (id)relatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v16 = [v15 requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:v14 andRelatedAssetCollectionForLocalIdentifier:v13 options:v12 relatedType:a6 error:a7];

  return v16;
}

- (id)relatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v16 = [v15 requestRelatedDebugInformationBetweenAssetForLocalIdentifier:v14 andRelatedAssetCollectionForLocalIdentifier:v13 options:v12 relatedType:a6 error:a7];

  return v16;
}

- (id)summaryCurationForHighlightForLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v11 = [v10 requestSummaryCurationForHighlightLocalIdentifier:v9 options:v8 error:a5];

  return v11;
}

- (id)curationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v11 = [v10 requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:v9 options:v8 error:a5];

  return v11;
}

- (id)curationDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestCurationDebugInformationForAssetLocalIdentifier:v6 error:a4];

  return v8;
}

- (id)highlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestHighlightDebugInformationForHighlightWithLocalIdentifier:v6 error:a4];

  return v8;
}

- (id)memoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  id v8 = [v7 requestMemoryDebugInformationForMemoryWithLocalIdentifier:v6 error:a4];

  return v8;
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PHPhotoLibrary *)self photoAnalysisClient];
  [v8 cancelOperationsWithIdentifiers:v7 reply:v6];
}

- (BOOL)photoAnalysisClientAllowed
{
  if ([(PHPhotoLibrary *)self wellKnownPhotoLibraryIdentifier] == 3) {
    return 0;
  }
  id v4 = [(PHPhotoLibrary *)self photoLibrary];
  id v5 = [v4 globalValues];
  char v6 = [v5 libraryCreateOptions];

  return (v6 & 1) == 0;
}

- (double)_analysisProgressForHighlight:(id)a3 fetchCountBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  unint64_t v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v8 = [(PHPhotoLibrary *)self photoLibrary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PHPhotoLibrary_AssetAnalysis___analysisProgressForHighlight_fetchCountBlock___block_invoke;
  v14[3] = &unk_1E58480C8;
  id v9 = v8;
  id v15 = v9;
  id v16 = self;
  id v10 = v6;
  id v17 = v10;
  id v19 = &v20;
  id v11 = v7;
  id v18 = v11;
  [v9 performBlockAndWait:v14];
  double v12 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __79__PHPhotoLibrary_AssetAnalysis___analysisProgressForHighlight_fetchCountBlock___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_assetOIDsForHighlight:withContext:", *(void *)(a1 + 48));
  if ([v2 count])
  {
    double v3 = (double)(unint64_t)(*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    double v4 = v3 / (double)(unint64_t)[v2 count];
  }
  else
  {
    double v4 = 1.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v4;
}

- (double)sceneAnalysisProgressForHighlight:(id)a3
{
  [(PHPhotoLibrary *)self _analysisProgressForHighlight:a3 fetchCountBlock:&__block_literal_global_134];
  return result;
}

uint64_t __67__PHPhotoLibrary_AssetAnalysis__sceneAnalysisProgressForHighlight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  double v4 = (void *)MEMORY[0x1E4F8A670];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 entityName];
  id v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v7];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset", v6];

  id v10 = [MEMORY[0x1E4F8A670] predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestSceneVersionWithNoindex:1];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v9;
  v18[1] = v10;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v13 = [v11 andPredicateWithSubpredicates:v12];
  [v8 setPredicate:v13];

  id v17 = 0;
  uint64_t v14 = [v5 countForFetchRequest:v8 error:&v17];

  id v15 = v17;
  return v14;
}

- (double)ratioOfAssetsWithMediaAnalysisImageProcessed
{
  unint64_t v3 = [(PHPhotoLibrary *)self countOfAllAssetsForMediaProcessingTaskID:17 priority:0 sceneConfidenceThreshold:0 error:0.0];
  if (v3) {
    return (double)(unint64_t)[(PHPhotoLibrary *)self fetchCountOfAssetsWithMediaAnalysisImageProcessed]/ (double)v3;
  }
  else {
    return 1.0;
  }
}

- (double)ratioOfAssetsWithMediaAnalysisVideoProcessed
{
  unint64_t v3 = [(PHPhotoLibrary *)self countOfAllAssetsForMediaProcessingTaskID:1 priority:0 sceneConfidenceThreshold:0 error:0.0];
  if (v3) {
    return (double)(unint64_t)[(PHPhotoLibrary *)self fetchCountOfAssetsWithMediaAnalysisVideoProcessed]/ (double)v3;
  }
  else {
    return 1.0;
  }
}

- (double)ratioOfAssetsWithFacesProcessed
{
  [(PHPhotoLibrary *)self _ratioOfAssetsAtOrAboveVersion:(__int16)(*MEMORY[0x1E4F8ADF8] + 1) forKey:@"faceAnalysisVersion"];
  return result;
}

- (double)ratioOfAssetsAtOrAboveFaceAnalysisVersion:(signed __int16)a3
{
  [(PHPhotoLibrary *)self _ratioOfAssetsAtOrAboveVersion:a3 forKey:@"faceAnalysisVersion"];
  return result;
}

- (double)ratioOfAssetsWithScenesProcessed
{
  [(PHPhotoLibrary *)self _ratioOfAssetsAtOrAboveVersion:(__int16)(*MEMORY[0x1E4F8AE00] + 1) forKey:@"sceneAnalysisVersion"];
  return result;
}

- (int64_t)fetchCountOfAssetsWithMediaAnalysisImageProcessed
{
  unint64_t v3 = +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions];
  int64_t v4 = [(PHPhotoLibrary *)self countOfProcessedAssetsForMediaProcessingTaskID:17 priority:0 algorithmVersion:v3 sceneConfidenceThreshold:0 error:0.0];

  return v4;
}

- (int64_t)fetchCountOfAssetsWithMediaAnalysisVideoProcessed
{
  unint64_t v3 = +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions];
  int64_t v4 = [(PHPhotoLibrary *)self countOfProcessedAssetsForMediaProcessingTaskID:1 priority:0 algorithmVersion:v3 sceneConfidenceThreshold:0 error:0.0];

  return v4;
}

- (int64_t)fetchCountOfAssetsWithFacesProcessedToAnyVersion
{
  unint64_t v3 = objc_opt_class();
  int64_t v4 = [MEMORY[0x1E4F8A670] predicateToIncludeOnlyAllowedForAnalysisAndProcessedToFaceVersion:0 noindex:0];
  id v5 = [MEMORY[0x1E4F8A670] entityName];
  id v6 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  int64_t v7 = [v3 _countOfAssetsWithPredicate:v4 entityName:v5 inLibrary:v6];

  return v7;
}

- (int64_t)fetchCountOfAssetsWithFacesProcessedToLatestVersion
{
  unint64_t v3 = objc_opt_class();
  int64_t v4 = [MEMORY[0x1E4F8A670] predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestFaceVersionWithNoindex:0];
  id v5 = [MEMORY[0x1E4F8A670] entityName];
  id v6 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  int64_t v7 = [v3 _countOfAssetsWithPredicate:v4 entityName:v5 inLibrary:v6];

  return v7;
}

- (int64_t)fetchCountOfAssetsWithScenesProcessed
{
  unint64_t v3 = objc_opt_class();
  int64_t v4 = [MEMORY[0x1E4F8A670] predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestSceneVersionWithNoindex:0];
  id v5 = [MEMORY[0x1E4F8A670] entityName];
  id v6 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  int64_t v7 = [v3 _countOfAssetsWithPredicate:v4 entityName:v5 inLibrary:v6];

  return v7;
}

- (int64_t)fetchCountOfVideosWithAllowedForAnalysis
{
  v13[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = PLAssetKindPredicateForTaskID();
  int64_t v4 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyAllowedForAnalysisAssets];
  id v5 = objc_opt_class();
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v3;
  v13[1] = v4;
  int64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v8 = [v6 andPredicateWithSubpredicates:v7];
  id v9 = [MEMORY[0x1E4F8A950] entityName];
  id v10 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  int64_t v11 = [v5 _countOfAssetsWithPredicate:v8 entityName:v9 inLibrary:v10];

  return v11;
}

- (int64_t)fetchCountOfAssetsWithAllowedForAnalysis
{
  unint64_t v3 = objc_opt_class();
  int64_t v4 = [MEMORY[0x1E4F8A670] predicateToIncludeOnlyAllowedForAnalysisWithNoindex:0];
  id v5 = [MEMORY[0x1E4F8A670] entityName];
  id v6 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  int64_t v7 = [v3 _countOfAssetsWithPredicate:v4 entityName:v5 inLibrary:v6];

  return v7;
}

- (double)ratioOfAssetsAtOrAboveSceneAnalysisVersion:(signed __int16)a3
{
  [(PHPhotoLibrary *)self _ratioOfAssetsAtOrAboveVersion:a3 forKey:@"sceneAnalysisVersion"];
  return result;
}

- (double)_ratioOfAssetsAtOrAboveVersion:(signed __int16)a3 forKey:(id)a4
{
  int v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = objc_opt_class();
  id v8 = [(PHPhotoLibrary *)self photoLibraryForCurrentQueueQoS];
  id v9 = [v7 _countOfAnalysisVersionsForKey:v6 inLibrary:v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v23 = v6;
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v18 = [v10 objectForKeyedSubscript:v17];
        uint64_t v19 = [v18 unsignedIntegerValue];
        v13 += v19;
        if ((int)[v17 shortValue] >= v4) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
        v14 += v20;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);

    if (v13) {
      double v21 = (double)v14 / (double)v13;
    }
    else {
      double v21 = 0.0;
    }
    id v6 = v23;
  }
  else
  {

    double v21 = 0.0;
  }

  return v21;
}

- (id)faceAnalysisProgressCounts
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F8A998];
  id v11 = 0;
  unint64_t v3 = [(PHPhotoLibrary *)self photoLibraryURL];
  int v4 = objc_msgSend(v2, "queryProgressDetail:forPhotoLibraryURL:andTaskID:", &v11, v3, objc_msgSend(MEMORY[0x1E4F8A998], "faceAnalysisTaskID"));
  id v5 = v11;

  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (v6)
  {
    int64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v13 = v4;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to get face processing counts from VideoProcessing, status: %d", buf, 8u);
    }

    id v8 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)petVIPModelExists
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_110);
  int v4 = (void *)MEMORY[0x1E4F8A998];
  id v5 = [(PHPhotoLibrary *)self photoLibraryURL];
  uint64_t v6 = [MEMORY[0x1E4F8A998] petVIPModelType];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PHPhotoLibrary_AssetAnalysis__petVIPModelExists__block_invoke_2;
  void v13[3] = &unk_1E5848050;
  uint64_t v15 = &v16;
  id v7 = v3;
  id v14 = v7;
  [v4 requestVIPModelFilepathForPhotoLibraryURL:v5 forModelType:v6 andCompletionHandler:v13];

  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (dispatch_block_wait(v7, v8))
  {
    id v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Request to get pet VIP model filepath from VideoProcessing timed out", v12, 2u);
    }
  }
  char v10 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __50__PHPhotoLibrary_AssetAnalysis__petVIPModelExists__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 fileExistsAtPath:v5];
  }
  else
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to get pet VIP model filepath from VideoProcessing: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)faceAnalysisProgressForHighlight:(id)a3
{
  [(PHPhotoLibrary *)self _analysisProgressForHighlight:a3 fetchCountBlock:&__block_literal_global_44640];
  return result;
}

uint64_t __66__PHPhotoLibrary_AssetAnalysis__faceAnalysisProgressForHighlight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = (void *)MEMORY[0x1E4F8A950];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 entityName];
  int v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v7];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@ AND %K != nil", v6, @"faceAdjustmentVersion"];

  [v8 setPredicate:v9];
  uint64_t v12 = 0;
  uint64_t v10 = [v5 countForFetchRequest:v8 error:&v12];

  return v10;
}

- (id)_assetOIDsForHighlight:(id)a3 withContext:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F8A950] entityName];
  int v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v7];
  int v9 = [v5 kind];
  if (!v9)
  {
    uint64_t v10 = @"highlightBeingAssets";
    goto LABEL_5;
  }
  if (v9 == 3)
  {
    uint64_t v10 = @"dayGroupHighlightBeingAssets";
LABEL_5:
    id v11 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v12 = [v5 objectID];
    int v13 = [v11 predicateWithFormat:@"%K = %@", v10, v12];

    id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"kind", &unk_1EEB26D90];
    uint64_t v15 = [MEMORY[0x1E4F8A950] predicateToIncludeOnlyAllowedForAnalysisAssets];
    uint64_t v16 = (void *)MEMORY[0x1E4F28BA0];
    v21[0] = v13;
    v21[1] = v14;
    void v21[2] = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    uint64_t v18 = [v16 andPredicateWithSubpredicates:v17];
    [v8 setPredicate:v18];

    [v8 setResultType:1];
    [v8 setIncludesPropertyValues:0];
    [v8 setIncludesPendingChanges:0];
    char v19 = [v6 executeFetchRequest:v8 error:0];

    goto LABEL_7;
  }
  char v19 = 0;
LABEL_7:

  return v19;
}

- (void)requestTotalProgressCountsForWorkerType:(signed __int16)a3 states:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  if (v10)
  {
    if (v6 != 4)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = [NSNumber numberWithShort:v6];
      [v15 handleFailureInMethod:a2, self, @"PHPhotoLibrary+AssetAnalysis.m", 87, @"Input worker type (%@) not supported, only %@ supported", v16, &unk_1EEB26400 object file lineNumber description];
    }
    uint64_t v11 = [(PHPhotoLibrary *)self faceAnalysisProcessingCounts];
    if (v11) {
      uint64_t v12 = (void *)v11;
    }
    else {
      uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
    }
    int v13 = PLShortDescriptionForWorkerType();
    id v17 = v13;
    v18[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v10[2](v10, v14, 0);
  }
}

- (id)faceAnalysisProcessingCounts
{
  uint64_t v3 = [MEMORY[0x1E4F8A998] faceAnalysisTaskID];
  int v4 = (void *)MEMORY[0x1E4F8A998];
  id v8 = 0;
  id v5 = [(PHPhotoLibrary *)self photoLibraryURL];
  [v4 queryProgressDetail:&v8 forPhotoLibraryURL:v5 andTaskID:v3];
  id v6 = v8;

  return v6;
}

+ (BOOL)shouldDisplayMergeCandidates:(id)a3 forPerson:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  unint64_t v9 = 0;
  if (v8)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isVerified", (void)v15))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
        v9 += [v12 faceCount];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  float v13 = (float)[v6 faceCount] * 0.1;
  if (v13 < 1.0) {
    float v13 = 1.0;
  }
  if (v9 > (unint64_t)v13) {
    LOBYTE(v8) = 1;
  }

  return v8;
}

+ (unint64_t)_countOfAssetsWithPredicate:(id)a3 entityName:(id)a4 inLibrary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v8];
  [v10 setPredicate:v7];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__PHPhotoLibrary_AssetAnalysis___countOfAssetsWithPredicate_entityName_inLibrary___block_invoke;
  v16[3] = &unk_1E58480A0;
  uint64_t v20 = &v21;
  id v11 = v9;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v7;
  id v19 = v13;
  [v11 performBlockAndWait:v16];
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = v22[3];
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __82__PHPhotoLibrary_AssetAnalysis___countOfAssetsWithPredicate_entityName_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  uint64_t v4 = [v2 countForFetchRequest:v3 error:&v8];
  id v5 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Error getting count of assets with predicate %@: %@", buf, 0x16u);
    }
  }
}

+ (id)_countOfAnalysisVersionsForKey:(id)a3 inLibrary:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = [MEMORY[0x1E4F8A670] entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setResultType:2];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v10 setName:@"count"];
  __int16 v11 = (void *)MEMORY[0x1E4F28C68];
  id v12 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  v35[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  unint64_t v14 = [v11 expressionForFunction:@"count:" arguments:v13];
  [v10 setExpression:v14];

  [v10 setExpressionResultType:200];
  v34[0] = v5;
  v34[1] = @"allowedForAnalysis";
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  [v9 setPropertiesToGroupBy:v15];

  v33[0] = v5;
  v33[1] = v10;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [v9 setPropertiesToFetch:v16];

  id v17 = [MEMORY[0x1E4F8A670] predicateToIncludeOnlyAllowedForAnalysisWithNoindex:0];
  [v9 setHavingPredicate:v17];

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__PHPhotoLibrary_AssetAnalysis___countOfAnalysisVersionsForKey_inLibrary___block_invoke;
  v27[3] = &unk_1E5848078;
  id v28 = v6;
  id v29 = v9;
  id v19 = v18;
  id v30 = v19;
  id v31 = v5;
  id v32 = v10;
  id v20 = v10;
  id v21 = v5;
  id v22 = v9;
  id v23 = v6;
  [v23 performBlockAndWait:v27];
  uint64_t v24 = v32;
  id v25 = v19;

  return v25;
}

void __74__PHPhotoLibrary_AssetAnalysis___countOfAnalysisVersionsForKey_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v21 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v21];
  id v5 = v21;

  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v16 = v5;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          __int16 v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = [*(id *)(a1 + 64) name];
          uint64_t v13 = [v11 objectForKeyedSubscript:v12];
          unint64_t v14 = *(void **)(a1 + 48);
          long long v15 = [v11 objectForKeyedSubscript:*(void *)(a1 + 56)];
          [v14 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v8);
      id v5 = v16;
    }
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "_countOfAnalysisVersionsForKey: fetch error %@", buf, 0xCu);
    }
  }
}

- (BOOL)requestStartSharedLibrarySuggestionResultWithError:(id *)a3
{
  uint64_t v4 = [(PHPhotoLibrary *)self photoAnalysisClient];
  LOBYTE(a3) = [v4 requestStartSharedLibrarySuggestionResultWithError:a3];

  return (char)a3;
}

- (id)requestPersonalTraitsForAssetsWithUUIDs:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
    a4 = [v7 requestPersonalTraitsForAssetsWithUUIDs:v6 error:a4];
  }
  else
  {
    uint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "This SPI is disabled due to missing feature flag.", v12, 2u);
    }

    if (a4)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28588];
      v14[0] = @"This feature is not enabled.";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3310, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (id)requestPersonalTraitsForHighlightsWithUUIDs:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
    a4 = [v7 requestPersonalTraitsForHighlightsWithUUIDs:v6 error:a4];
  }
  else
  {
    uint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "This SPI is disabled due to missing feature flag.", v12, 2u);
    }

    if (a4)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28588];
      v14[0] = @"This feature is not enabled.";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3310, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (id)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  uint64_t v8 = [v7 requestGraphMomentLocalIdentifiersWithDateInterval:v6 error:a4];

  return v8;
}

- (id)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  uint64_t v8 = [v7 requestGraphInferencesSummaryWithMomentLocalIdentifiers:v6 error:a4];

  return v8;
}

- (id)requestGraphInferencesSummaryWithDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PHPhotoLibrary *)self photoAnalysisClient];
  uint64_t v8 = [v7 requestGraphInferencesSummaryWithDateInterval:v6 error:a4];

  return v8;
}

- (BOOL)processDuplicateAssetsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__46116;
  long long v39 = __Block_byref_object_dispose__46117;
  id v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  uint64_t v8 = +[PHObject uuidsFromLocalIdentifiers:v7];

  if ([v8 count])
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = [(PHPhotoLibrary *)self assetsdClient];
    __int16 v11 = [v10 libraryInternalClient];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__PHPhotoLibrary_DuplicateProcessing__processDuplicateAssetsWithLocalIdentifiers_error___block_invoke;
    v27[3] = &unk_1E5848438;
    id v29 = &v35;
    id v30 = &v31;
    id v12 = v9;
    id v28 = v12;
    [v11 mergeDuplicateAssetUuidSelection:v8 completionHandler:v27];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v13 = v28;
  }
  else
  {
    unint64_t v14 = NSString;
    uint64_t v15 = [v8 count];
    id v16 = @"Missing photolibrary";
    if (!v15) {
      id v16 = @"No identifiers specified";
    }
    id v12 = [v14 stringWithFormat:@"%@ for merge request", v16];
    long long v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28228];
    v44[0] = v12;
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v19 = [v17 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v18];
    long long v20 = (void *)v36[5];
    v36[5] = v19;

    uint64_t v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v36[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v42 = v21;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "Duplicate Merge processing failed with missing identifiers. Error: %@", buf, 0xCu);
    }
  }

  int v22 = *((unsigned __int8 *)v32 + 24);
  id v23 = (id)v36[5];
  uint64_t v24 = v23;
  if (!v22 && a4) {
    *a4 = v23;
  }

  BOOL v25 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v25;
}

intptr_t __88__PHPhotoLibrary_DuplicateProcessing__processDuplicateAssetsWithLocalIdentifiers_error___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v5 = PHErrorFromPLError(a3);
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  uint64_t v8 = a1[4];

  return dispatch_semaphore_signal(v8);
}

- (void)mergeDuplicateAssetsWithLocalIdentifierGroupingContainer:(id)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if (mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__onceToken != -1) {
      dispatch_once(&mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__onceToken, &__block_literal_global_46129);
    }
    id v11 = v5;
    id v12 = v6;
    pl_dispatch_async();

    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"No identifiers specified for merge request";
    dispatch_semaphore_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v7 = [v8 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v9];

    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      unint64_t v14 = v7;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge processing failed with missing identifiers. Error: %@", buf, 0xCu);
    }

    if (v6) {
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v7);
    }
  }
}

void __114__PHPhotoLibrary_DuplicateProcessing__mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        [v2 addObjectsFromArray:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if ((unint64_t)[v2 count] >= 0x1F5)
        {
          dispatch_semaphore_t v9 = *(void **)(a1 + 40);
          id v14 = v6;
          int v10 = [v9 processDuplicateAssetsWithLocalIdentifiers:v2 error:&v14];
          id v11 = v14;

          [v2 removeAllObjects];
          if (!v10) {
            goto LABEL_16;
          }
          id v6 = v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  if ([v2 count])
  {
    id v12 = *(void **)(a1 + 40);
    id v13 = v6;
    [v12 processDuplicateAssetsWithLocalIdentifiers:v2 error:&v13];
    id v11 = v13;
    id v3 = v6;
LABEL_16:

    id v6 = v11;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __114__PHPhotoLibrary_DuplicateProcessing__mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.duplicate", 0);
  uint64_t v1 = (void *)mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__queue;
  mergeDuplicateAssetsWithLocalIdentifierGroupingContainer_completionHandler__queue = (uint64_t)v0;
}

- (BOOL)assetsArePendingForDuplicateMergeProcessingWithLocalIdentifiers:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  uint64_t v5 = +[PHObject uuidsFromLocalIdentifiers:v4];

  id v6 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v7 = [v6 libraryInternalClient];
  char v8 = [v7 checkAssetsArePendingForDuplicateMergeProcessing:v5];

  return v8;
}

- (BOOL)internal_processIdenticalDuplicatesWithError:(id *)a3
{
  uint64_t v4 = [(PHPhotoLibrary *)self assetsdClient];
  uint64_t v5 = [v4 libraryInternalClient];
  LOBYTE(a3) = [v5 processIdenticalDuplicatesWithProcessingType:7 error:a3];

  return (char)a3;
}

@end