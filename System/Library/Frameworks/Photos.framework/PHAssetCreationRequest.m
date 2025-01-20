@interface PHAssetCreationRequest
+ (BOOL)_shouldGenerateThumbnailsDuringCreationForImageSource:(CGImageSource *)a3 contentType:(id)a4 timeZoneLookup:(id)a5;
+ (BOOL)setDeferredIdentifierAndCreateDeferredDestinationURLFromCurrentDstURL:(id *)a3 withMainFileMetadata:(id)a4 managedAsset:(id)a5 photoLibrary:(id)a6 error:(id *)a7;
+ (BOOL)setdbgFileWithAsset:(id)a3 dbgFilePath:(id)a4 photoFilename:(id)a5;
+ (BOOL)supportsAssetResourceTypes:(NSArray *)types;
+ (BOOL)supportsImportAssetResourceTypes:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (PHAssetCreationRequest)creationRequestForAsset;
+ (id)_cameraMetadataURLForPrimaryAssetURL:(id)a3 photoLibrary:(id)a4;
+ (id)_creationRequestForAssetUsingUUID:(id)a3;
+ (id)_imageIOThumbnailCreationOptionsFromDerivativeContext:(id)a3;
+ (id)_jpegDataFromRAWData:(id)a3 derivativeContext:(id)a4;
+ (id)_photoIrisIndicatorFilePathForPhotoAtPath:(id)a3 UUID:(id)a4;
+ (id)_uuidForAssetWithSyndicationIdentifier:(id)a3 inLibrary:(id)a4 isTrashed:(BOOL *)a5;
+ (id)creationRequestForAssetCopyFromAsset:(id)a3;
+ (id)creationRequestForAssetCopyFromAsset:(id)a3 options:(id)a4;
+ (id)creationRequestForAssetFromAssetBundle:(id)a3;
+ (id)creationRequestForAssetFromBatchImageJobDictionary:(id)a3;
+ (id)creationRequestForAssetFromGuestAsset:(id)a3;
+ (id)creationRequestForAssetFromGuestAsset:(id)a3 checkForMomentShareAsset:(BOOL)a4;
+ (id)creationRequestForAssetFromImage:(id)a3;
+ (id)creationRequestForAssetFromImageAtFileURL:(id)a3;
+ (id)creationRequestForAssetFromImageData:(id)a3;
+ (id)creationRequestForAssetFromImageData:(id)a3 options:(id)a4;
+ (id)creationRequestForAssetFromImageData:(id)a3 usingUUID:(id)a4;
+ (id)creationRequestForAssetFromImageJobDictionary:(id)a3 holdingDirectoryPath:(id)a4;
+ (id)creationRequestForAssetFromScreenshotImage:(id)a3;
+ (id)creationRequestForAssetFromVideoAtFileURL:(id)a3;
+ (id)creationRequestForAssetFromVideoComplementBundle:(id)a3;
+ (id)creationRequestForAssetFromVideoJobDictionary:(id)a3;
+ (id)creationRequestForAssetFromVideoPreviewJobDict:(id)a3 withPreviewImageSurface:(__IOSurface *)a4;
+ (id)creationRequestForAssetWithOptions:(id)a3;
+ (id)creationRequestForAssetWithSyndicationIdentifier:(id)a3;
+ (id)creationRequestForAssetWithUUID:(id)a3;
+ (id)creationRequestForAssetWithUUID:(id)a3 options:(id)a4;
+ (int64_t)_originalResourceTypeFromAdjustedResourceType:(int64_t)a3 sourceAssetIsLoopingVideo:(BOOL)a4 sourceAssetIsVideo:(BOOL)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duplicateStillSourceTime;
- (BOOL)_accessWritableURLForUUID:(id)a3 imageUTI:(id)a4 originalFilename:(id)a5 photoLibrary:(id)a6 withHandler:(id)a7;
- (BOOL)_assetAlreadyExistsAsPlaceholder:(BOOL)a3 mediaType:(int64_t)a4 uuid:(id)a5 photoLibrary:(id)a6 fetchAsset:(id *)a7;
- (BOOL)_createAssetAsAdjusted:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 error:(id *)a6;
- (BOOL)_createAssetAsPhotoIris:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 error:(id *)a6;
- (BOOL)_createAudioResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)_createOriginalResourceForAsset:(id)a3 fromValidatedResource:(id)a4 resourceType:(unsigned int)a5 photoLibrary:(id)a6 destinationURL:(id)a7 error:(id *)a8;
- (BOOL)_createRAWSidecarForAsset:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 photoLibrary:(id)a6 error:(id *)a7;
- (BOOL)_createSocResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)_createXmpResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)_filePathIsInIncomingDirectory:(id)a3;
- (BOOL)_ingestOriginalInPlaceSrcURL:(id)a3 dstURL:(id)a4 asset:(id)a5 error:(id *)a6;
- (BOOL)_populateDuplicatingAssetCreationRequest:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)_restoreMovedFilesOnFailure;
- (BOOL)_setupSemanticEnhanceMetadataIfNeededWithDestinationURL:(id)a3 photoLibrary:(id)a4 semanticEnhanceResult:(id *)a5 ingestJobCameraMetadata:(id)a6;
- (BOOL)_shouldCreateScreenshot;
- (BOOL)_shouldUseAutomaticallyGeneratedOriginalFilename;
- (BOOL)_unTrashAndResetAsset:(id)a3;
- (BOOL)_validateNewObjectUUID:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5;
- (BOOL)_writeDataToDisk:(id)a3 imageUTIType:(id)a4 primaryImageProperties:(id)a5 mainFileURL:(id)a6 thumbnailData:(id)a7;
- (BOOL)_writeOutCameraMetadata:(id)a3 destinationURL:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)assetExistingWithSyndicationIdentifierIsTrashed;
- (BOOL)crashBeforeCreation;
- (BOOL)createAsCompanionSyncedAsset;
- (BOOL)duplicateAllowsPrivateMetadata;
- (BOOL)duplicateAsAlternateAsset;
- (BOOL)duplicateAsOriginal;
- (BOOL)duplicateLivePhotoAsStill;
- (BOOL)duplicateSinglePhotoFromBurst;
- (BOOL)isDuplicateAssetCreationRequest;
- (BOOL)isNew;
- (BOOL)useRecoverableStagingDirectory;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (CGImageSource)_imageSourceForDerivatives;
- (NSDictionary)_movedFiles;
- (NSDictionary)customAssetProperties;
- (NSManagedObjectID)_limitedLibraryFetchFilterObjectID;
- (NSNumber)assetExistsWithSyndicationIdentifier;
- (NSString)conversationID;
- (NSString)duplicateAssetIdentifier;
- (NSString)forcePairingIdentifier;
- (NSString)importSessionID;
- (NSString)importedByBundleIdentifier;
- (NSString)momentShareUUID;
- (NSString)syndicationIdentifier;
- (PHAssetCreationAdjustmentBakeInOptions)adjustmentBakeInOptions;
- (PHAssetCreationCameraIngestOptions)cameraIngestOptions;
- (PHAssetCreationMetadataCopyOptions)metadataCopyOptions;
- (PHAssetCreationRequest)initWithCoder:(id)a3;
- (PHAssetCreationRequest)initWithHelper:(id)a3;
- (PHAssetCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHAssetResourceBag)assetResourceBag;
- (PHMomentShare)momentShare;
- (PHRelationshipChangeRequestHelper)momentShareHelper;
- (id)_captureSessionIdentifier;
- (id)_createAdjustmentsFileFromJobDictionary:(id)a3 cameraIngestOptions:(id)a4;
- (id)_createAssetAdjustmentsFromBackupWithAsset:(id)a3;
- (id)_createAssetFromValidatedResources:(id)a3 withUUID:(id)a4 assetAlreadyExistsAsPlaceholder:(BOOL)a5 inPhotoLibrary:(id)a6 error:(id *)a7;
- (id)_createTimelapsePlaceholderAssetWithUUID:(id)a3 InPhotoLibrary:(id)a4;
- (id)_externalLivePhotoResourceForAsset:(id)a3;
- (id)_filteredImagePropertiesByConditionallyRemovingLivePhotoIdentifiersFromSourceImageProperties:(id)a3;
- (id)_ingestOriginalFromSrcURL:(id)a3 toDstURL:(id)a4 useSecureMove:(BOOL)a5 resource:(id)a6 resourceType:(unsigned int)a7 asset:(id)a8 error:(id *)a9;
- (id)_managedAssetFromPrimaryResourceData:(id)a3 validatedResources:(id)a4 withUUID:(id)a5 photoLibrary:(id)a6 mainFileMetadata:(id *)a7 getImageSource:(CGImageSource *)a8 imageData:(id *)a9;
- (id)_mutableMomentShareObjectIDsAndUUIDs;
- (id)_resolveResourceHoldingDirectoryPath;
- (id)_secureMove:(BOOL)a3 assetResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (id)_secureMove:(BOOL)a3 fileAtURL:(id)a4 toURL:(id)a5 capabilities:(id)a6 error:(id *)a7;
- (id)createAssetFromValidatedResources:(id)a3 withUUID:(id)a4 assetAlreadyExistsAsPlaceholder:(BOOL)a5 inPhotoLibrary:(id)a6 error:(id *)a7;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)duplicatedAssetResourcesFromAsset:(id)a3 stillSourceTime:(id *)a4 flattenLivePhotoIntoStillPhoto:(BOOL)a5 duplicateAsOriginal:(BOOL)a6 duplicateWithAdjustmentsBakedIn:(BOOL)a7 duplicatePhotoAsData:(BOOL)a8 error:(id *)a9;
- (id)initForNewObject;
- (id)initForNewObjectWithUUID:(id)a3;
- (id)placeholderForCreatedAsset;
- (int)retryCount;
- (int64_t)_mediaTypeForCreatedAsset;
- (int64_t)accessScopeOptionsRequirement;
- (int64_t)importedBy;
- (signed)_savedAssetTypeForAsset;
- (unsigned)bundleScope;
- (unsigned)duplicateAssetPhotoLibraryType;
- (void)_addResourceWithType:(int64_t)a3 data:(id)a4 orFileURL:(id)a5 options:(id)a6;
- (void)_checkAndGenerateThumbnailsForAsset:(id)a3 imageSource:(CGImageSource *)a4 imageData:(id)a5 previewImage:(id)a6 thumbnailImage:(id)a7 timeZoneLookup:(id)a8 resourceBag:(id)a9;
- (void)_checkAndSetForSemanticEnhancementForAsset:(id)a3 resourceBag:(id)a4;
- (void)_copyMediaAnalysisProperties:(id)a3;
- (void)_copyMetadataFromAsset:(id)a3;
- (void)_copyUserSpecificMetadataFromAsset:(id)a3;
- (void)_deleteJobFileAtPath:(id)a3 withAsset:(id)a4;
- (void)_didMoveFileFromURL:(id)a3 toURL:(id)a4;
- (void)_prepareMomentShareHelperIfNeeded;
- (void)_removePhotoKitCameraIngestFiles:(id)a3 originalFileURL:(id)a4 resourceBag:(id)a5;
- (void)_resetMovedFiles;
- (void)_setAdjustmentBakeInOptions:(id)a3;
- (void)_setCaptureSessionIdentifierOnAsset:(id)a3;
- (void)_setCreatingAssetIsBusy:(BOOL)a3;
- (void)_setDuplicateAllowsPrivateMetadata:(BOOL)a3;
- (void)_setDuplicateAsAlternateAsset:(BOOL)a3;
- (void)_setDuplicateAsOriginal:(BOOL)a3;
- (void)_setDuplicateAssetIdentifier:(id)a3;
- (void)_setDuplicateAssetPhotoLibraryType:(unsigned __int16)a3;
- (void)_setDuplicateLivePhotoAsStill:(BOOL)a3;
- (void)_setDuplicateSinglePhotoFromBurst:(BOOL)a3;
- (void)_setDuplicateStillSourceTime:(id *)a3;
- (void)_setLimitedLibraryFetchFilterObjectID:(id)a3;
- (void)_setMetadataCopyOptions:(id)a3;
- (void)_setModificationDateOnAsset:(id)a3;
- (void)_setShouldCreateScreenshot:(BOOL)a3;
- (void)_setShouldUseAutomaticallyGeneratedOriginalFilename:(BOOL)a3;
- (void)_setUseRecoverableStagingDirectory:(BOOL)a3;
- (void)_setupDerivativeCreationContextForAsset:(id)a3 imageSource:(CGImageSource *)a4 imageData:(id)a5;
- (void)_setupIrisPairingTimeoutForAsset:(id)a3 imageFile:(id)a4 library:(id)a5;
- (void)_tracePhotoKitAssetCreationWithUUID:(id)a3;
- (void)_updateMutationsForDuplicatingPrivateMetadataFromAsset:(id)a3;
- (void)addResourceWithType:(PHAssetResourceType)type data:(NSData *)data options:(PHAssetResourceCreationOptions *)options;
- (void)addResourceWithType:(PHAssetResourceType)type fileURL:(NSURL *)fileURL options:(PHAssetResourceCreationOptions *)options;
- (void)didSendChangeToServiceHandlerWithResult:(BOOL)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeRequestWithBatchSuccess:(BOOL)a3;
- (void)performConcurrentWork;
- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3;
- (void)setAssetExistingWithSyndicationIdentifierIsTrashed:(BOOL)a3;
- (void)setAssetExistsWithSyndicationIdentifier:(id)a3;
- (void)setAssetResourceBag:(id)a3;
- (void)setBundleScope:(unsigned __int16)a3;
- (void)setCameraIngestOptions:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setCrashBeforeCreation:(BOOL)a3;
- (void)setCreateAsCompanionSyncedAsset:(BOOL)a3;
- (void)setCustomAssetProperties:(id)a3;
- (void)setImportSessionID:(id)a3;
- (void)setImportedBy:(int64_t)a3;
- (void)setImportedByBundleIdentifier:(id)a3;
- (void)setMomentShare:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setSyndicationIdentifier:(id)a3;
@end

@implementation PHAssetCreationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraIngestOptions, 0);
  objc_storeStrong((id *)&self->_momentShareUUID, 0);
  objc_storeStrong((id *)&self->_forcePairingIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataCopyOptions, 0);
  objc_storeStrong((id *)&self->_adjustmentBakeInOptions, 0);
  objc_storeStrong((id *)&self->_duplicateAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_momentShareHelper, 0);
  objc_storeStrong((id *)&self->_assetResourceBag, 0);
  objc_storeStrong((id *)&self->_assetExistsWithSyndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_limitedLibraryFetchFilterObjectID, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_customAssetProperties, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_derivativeContext, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_resourceHoldingDirectoryPath, 0);
  objc_storeStrong((id *)&self->_movedFiles, 0);

  objc_storeStrong((id *)&self->_assetResources, 0);
}

- (NSString)syndicationIdentifier
{
  return self->_syndicationIdentifier;
}

- (void)setCreateAsCompanionSyncedAsset:(BOOL)a3
{
  self->_createAsCompanionSyncedAsset = a3;
}

- (BOOL)createAsCompanionSyncedAsset
{
  return self->_createAsCompanionSyncedAsset;
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (void)setCameraIngestOptions:(id)a3
{
}

- (PHAssetCreationCameraIngestOptions)cameraIngestOptions
{
  return self->_cameraIngestOptions;
}

- (void)_setUseRecoverableStagingDirectory:(BOOL)a3
{
  self->_useRecoverableStagingDirectory = a3;
}

- (BOOL)useRecoverableStagingDirectory
{
  return self->_useRecoverableStagingDirectory;
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (NSString)momentShareUUID
{
  return self->_momentShareUUID;
}

- (NSString)forcePairingIdentifier
{
  return self->_forcePairingIdentifier;
}

- (void)_setMetadataCopyOptions:(id)a3
{
}

- (PHAssetCreationMetadataCopyOptions)metadataCopyOptions
{
  return self->_metadataCopyOptions;
}

- (void)_setAdjustmentBakeInOptions:(id)a3
{
}

- (PHAssetCreationAdjustmentBakeInOptions)adjustmentBakeInOptions
{
  return self->_adjustmentBakeInOptions;
}

- (void)_setDuplicateAsAlternateAsset:(BOOL)a3
{
  self->_duplicateAsAlternateAsset = a3;
}

- (BOOL)duplicateAsAlternateAsset
{
  return self->_duplicateAsAlternateAsset;
}

- (void)_setDuplicateSinglePhotoFromBurst:(BOOL)a3
{
  self->_duplicateSinglePhotoFromBurst = a3;
}

- (BOOL)duplicateSinglePhotoFromBurst
{
  return self->_duplicateSinglePhotoFromBurst;
}

- (void)_setDuplicateAsOriginal:(BOOL)a3
{
  self->_duplicateAsOriginal = a3;
}

- (BOOL)duplicateAsOriginal
{
  return self->_duplicateAsOriginal;
}

- (void)_setDuplicateLivePhotoAsStill:(BOOL)a3
{
  self->_duplicateLivePhotoAsStill = a3;
}

- (BOOL)duplicateLivePhotoAsStill
{
  return self->_duplicateLivePhotoAsStill;
}

- (void)_setDuplicateStillSourceTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_duplicateStillSourceTime.value = *(_OWORD *)&a3->var0;
  self->_duplicateStillSourceTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duplicateStillSourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[48];
  return self;
}

- (void)_setDuplicateAssetPhotoLibraryType:(unsigned __int16)a3
{
  self->_duplicateAssetPhotoLibraryType = a3;
}

- (unsigned)duplicateAssetPhotoLibraryType
{
  return self->_duplicateAssetPhotoLibraryType;
}

- (void)_setDuplicateAssetIdentifier:(id)a3
{
}

- (NSString)duplicateAssetIdentifier
{
  return self->_duplicateAssetIdentifier;
}

- (PHRelationshipChangeRequestHelper)momentShareHelper
{
  return self->_momentShareHelper;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (int)retryCount
{
  return self->_retryCount;
}

- (void)setAssetResourceBag:(id)a3
{
}

- (PHAssetResourceBag)assetResourceBag
{
  return self->_assetResourceBag;
}

- (void)setCrashBeforeCreation:(BOOL)a3
{
  self->_crashBeforeCreation = a3;
}

- (BOOL)crashBeforeCreation
{
  return self->_crashBeforeCreation;
}

- (void)setAssetExistingWithSyndicationIdentifierIsTrashed:(BOOL)a3
{
  self->_assetExistingWithSyndicationIdentifierIsTrashed = a3;
}

- (BOOL)assetExistingWithSyndicationIdentifierIsTrashed
{
  return self->_assetExistingWithSyndicationIdentifierIsTrashed;
}

- (void)setAssetExistsWithSyndicationIdentifier:(id)a3
{
}

- (NSNumber)assetExistsWithSyndicationIdentifier
{
  return self->_assetExistsWithSyndicationIdentifier;
}

- (void)_setLimitedLibraryFetchFilterObjectID:(id)a3
{
}

- (NSManagedObjectID)_limitedLibraryFetchFilterObjectID
{
  return self->_limitedLibraryFetchFilterObjectID;
}

- (NSDictionary)customAssetProperties
{
  return self->_customAssetProperties;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (int64_t)importedBy
{
  return self->_importedBy;
}

- (PHAssetCreationRequest)initWithCoder:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  v110.receiver = self;
  v110.super_class = (Class)PHAssetCreationRequest;
  id v3 = a3;
  v4 = [(PHAssetChangeRequest *)&v110 initWithCoder:v3];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v11 = [NSString stringWithUTF8String:"assetResources"];
    v12 = [v3 decodeObjectOfClasses:v10 forKey:v11];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v16 = [NSString stringWithUTF8String:"sandboxExtensionTokens"];
    v104 = [v3 decodeObjectOfClasses:v15 forKey:v16];

    v103 = v12;
    if (v12)
    {
      v102 = v4;
      v17 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v106 objects:v111 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v107 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[PHExternalAssetResource alloc] initWithPropertyListRepresentation:*(void *)(*((void *)&v106 + 1) + 8 * i)];
            v24 = [(PHExternalAssetResource *)v23 fileURL];
            v25 = [v24 path];
            v26 = [v104 objectForKeyedSubscript:v25];

            if (v26)
            {
              id v27 = objc_alloc(MEMORY[0x1E4F8B9D0]);
              v28 = [(PHExternalAssetResource *)v23 fileURL];
              v29 = (void *)[v27 initWithURL:v28 sandboxExtensionToken:v26 consume:1];

              [(PHExternalAssetResource *)v23 setFileURL:v29];
            }
            [(NSMutableArray *)v17 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v106 objects:v111 count:16];
        }
        while (v20);
      }

      v4 = v102;
      assetResources = v102->_assetResources;
      v102->_assetResources = v17;
    }
    uint64_t v31 = objc_opt_class();
    v32 = [NSString stringWithUTF8String:"duplicateAssetIdentifier"];
    v33 = [v3 decodeObjectOfClass:v31 forKey:v32];

    if (v33)
    {
      objc_storeStrong((id *)&v4->_duplicateAssetIdentifier, v33);
      v34 = [NSString stringWithUTF8String:"duplicateLivePhotoAsStill"];
      v4->_duplicateLivePhotoAsStill = [v3 decodeBoolForKey:v34];
    }
    v35 = [NSString stringWithUTF8String:"duplicateAssetPhotoLibraryType"];
    v4->_duplicateAssetPhotoLibraryType = [v3 decodeIntegerForKey:v35];

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);
    v40 = [NSString stringWithUTF8String:"duplicateLivePhotoStillTimeKey"];
    CFDictionaryRef v41 = [v3 decodeObjectOfClasses:v39 forKey:v40];

    v42 = v4;
    p_duplicateStillSourceTime = &v4->_duplicateStillSourceTime;
    CMTimeMakeFromDictionary(&v105, v41);
    long long v44 = *(_OWORD *)&v105.value;
    p_duplicateStillSourceTime->epoch = v105.epoch;
    *(_OWORD *)&p_duplicateStillSourceTime->value = v44;
    v45 = [NSString stringWithUTF8String:"duplicateAsOriginal"];
    v42->_duplicateAsOriginal = [v3 decodeBoolForKey:v45];

    v46 = [NSString stringWithUTF8String:"duplicateAsAlternateAsset"];
    v42->_duplicateAsAlternateAsset = [v3 decodeBoolForKey:v46];

    v47 = [NSString stringWithUTF8String:"createScreenshot"];
    v42->_shouldCreateScreenshot = [v3 decodeBoolForKey:v47];

    v48 = [NSString stringWithUTF8String:"useAutomaticallyGeneratedOriginalFilename"];
    v42->_shouldUseAutomaticallyGeneratedOriginalFilename = [v3 decodeBoolForKey:v48];

    v49 = [NSString stringWithUTF8String:"createAsCompanionSyncedAsset"];
    v42->_createAsCompanionSyncedAsset = [v3 decodeBoolForKey:v49];

    v50 = [NSString stringWithUTF8String:"bundleScope"];
    v42->_bundleScope = [v3 decodeIntegerForKey:v50];

    uint64_t v51 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"momentShare"];
    momentShareHelper = v42->_momentShareHelper;
    v42->_momentShareHelper = (PHRelationshipChangeRequestHelper *)v51;

    uint64_t v53 = objc_opt_class();
    v54 = [NSString stringWithUTF8String:"momentShareUUID"];
    uint64_t v55 = [v3 decodeObjectOfClass:v53 forKey:v54];
    momentShareUUID = v42->_momentShareUUID;
    v42->_momentShareUUID = (NSString *)v55;

    uint64_t v57 = objc_opt_class();
    v58 = [NSString stringWithUTF8String:"importSessionID"];
    uint64_t v59 = [v3 decodeObjectOfClass:v57 forKey:v58];
    importSessionID = v42->_importSessionID;
    v42->_importSessionID = (NSString *)v59;

    uint64_t v61 = objc_opt_class();
    v62 = [NSString stringWithUTF8String:"conversationID"];
    uint64_t v63 = [v3 decodeObjectOfClass:v61 forKey:v62];
    conversationID = v42->_conversationID;
    v42->_conversationID = (NSString *)v63;

    v65 = [NSString stringWithUTF8String:"importedBy"];
    v42->_importedBy = [v3 decodeIntegerForKey:v65];

    [(PHChangeRequest *)v42 setShouldPerformConcurrentWork:v42->_importedBy == 5];
    v66 = [NSString stringWithUTF8String:"duplicateSinglePhotoFromBurst"];
    v42->_duplicateSinglePhotoFromBurst = [v3 decodeBoolForKey:v66];

    uint64_t v67 = objc_opt_class();
    v68 = [NSString stringWithUTF8String:"adjustmentBakeInOptions"];
    uint64_t v69 = [v3 decodeObjectOfClass:v67 forKey:v68];
    adjustmentBakeInOptions = v42->_adjustmentBakeInOptions;
    v42->_adjustmentBakeInOptions = (PHAssetCreationAdjustmentBakeInOptions *)v69;

    uint64_t v71 = objc_opt_class();
    v72 = [NSString stringWithUTF8String:"metadataCopyOptions"];
    uint64_t v73 = [v3 decodeObjectOfClass:v71 forKey:v72];
    metadataCopyOptions = v42->_metadataCopyOptions;
    v42->_metadataCopyOptions = (PHAssetCreationMetadataCopyOptions *)v73;

    uint64_t v75 = objc_opt_class();
    v76 = [NSString stringWithUTF8String:"importedByBundleIdentifier"];
    uint64_t v77 = [v3 decodeObjectOfClass:v75 forKey:v76];
    importedByBundleIdentifier = v42->_importedByBundleIdentifier;
    v42->_importedByBundleIdentifier = (NSString *)v77;

    uint64_t v79 = objc_opt_class();
    v80 = [NSString stringWithUTF8String:"syndicationIdentifier"];
    uint64_t v81 = [v3 decodeObjectOfClass:v79 forKey:v80];
    syndicationIdentifier = v42->_syndicationIdentifier;
    v42->_syndicationIdentifier = (NSString *)v81;

    v83 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v84 = objc_opt_class();
    uint64_t v85 = objc_opt_class();
    uint64_t v86 = objc_opt_class();
    uint64_t v87 = objc_opt_class();
    v88 = objc_msgSend(v83, "setWithObjects:", v84, v85, v86, v87, objc_opt_class(), 0);
    v89 = [NSString stringWithUTF8String:"customAssetProperties"];
    uint64_t v90 = [v3 decodeObjectOfClasses:v88 forKey:v89];
    customAssetProperties = v42->_customAssetProperties;
    v42->_customAssetProperties = (NSDictionary *)v90;

    uint64_t v92 = objc_opt_class();
    v93 = [NSString stringWithUTF8String:"assetExistsWithSyndicationIdentifier"];
    uint64_t v94 = [v3 decodeObjectOfClass:v92 forKey:v93];
    assetExistsWithSyndicationIdentifier = v42->_assetExistsWithSyndicationIdentifier;
    v42->_assetExistsWithSyndicationIdentifier = (NSNumber *)v94;

    v4 = v42;
    if ([(NSNumber *)v42->_assetExistsWithSyndicationIdentifier BOOLValue])
    {
      v96 = [NSString stringWithUTF8String:"assetExistingWithSyndicationIdentifierIsTrashed"];
      v42->_assetExistingWithSyndicationIdentifierIsTrashed = [v3 decodeBoolForKey:v96];
    }
    uint64_t v97 = objc_opt_class();
    v98 = [NSString stringWithUTF8String:"resourceHoldingDirectoryPath"];
    uint64_t v99 = [v3 decodeObjectOfClass:v97 forKey:v98];
    resourceHoldingDirectoryPath = v42->_resourceHoldingDirectoryPath;
    v42->_resourceHoldingDirectoryPath = (NSString *)v99;

    v42->_retryCount = [v3 decodeIntForKey:@"PHAssetCreationRequestRetryCountKey"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)PHAssetCreationRequest;
  [(PHAssetChangeRequest *)&v75 encodeWithCoder:v4];
  unint64_t v5 = 0x1E4F29000;
  if (self->_assetResources)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    uint64_t v69 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v68 = self;
    uint64_t v7 = self->_assetResources;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v72 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v13 = [v12 propertyListRepresentation];
          [v6 addObject:v13];

          uint64_t v14 = [v12 fileURL];

          if (v14)
          {
            v15 = [v12 fileURL];
            v16 = [v15 path];

            v17 = [v12 creationOptions];
            [v17 shouldMoveFile];

            id v18 = PLGetSandboxExtensionToken();
            [v69 setObject:v18 forKeyedSubscript:v16];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v71 objects:v76 count:16];
      }
      while (v9);
    }

    unint64_t v5 = 0x1E4F29000uLL;
    uint64_t v19 = [NSString stringWithUTF8String:"assetResources"];
    [v4 encodeObject:v6 forKey:v19];

    uint64_t v20 = [NSString stringWithUTF8String:"sandboxExtensionTokens"];
    [v4 encodeObject:v69 forKey:v20];

    self = v68;
  }
  duplicateAssetIdentifier = self->_duplicateAssetIdentifier;
  v22 = [*(id *)(v5 + 24) stringWithUTF8String:"duplicateAssetIdentifier"];
  [v4 encodeObject:duplicateAssetIdentifier forKey:v22];

  BOOL duplicateLivePhotoAsStill = self->_duplicateLivePhotoAsStill;
  v24 = [*(id *)(v5 + 24) stringWithUTF8String:"duplicateLivePhotoAsStill"];
  [v4 encodeBool:duplicateLivePhotoAsStill forKey:v24];

  uint64_t duplicateAssetPhotoLibraryType = self->_duplicateAssetPhotoLibraryType;
  v26 = [*(id *)(v5 + 24) stringWithUTF8String:"duplicateAssetPhotoLibraryType"];
  [v4 encodeInteger:duplicateAssetPhotoLibraryType forKey:v26];

  BOOL duplicateAsOriginal = self->_duplicateAsOriginal;
  v28 = [*(id *)(v5 + 24) stringWithUTF8String:"duplicateAsOriginal"];
  [v4 encodeBool:duplicateAsOriginal forKey:v28];

  BOOL duplicateAsAlternateAsset = self->_duplicateAsAlternateAsset;
  v30 = [*(id *)(v5 + 24) stringWithUTF8String:"duplicateAsAlternateAsset"];
  [v4 encodeBool:duplicateAsAlternateAsset forKey:v30];

  BOOL createAsCompanionSyncedAsset = self->_createAsCompanionSyncedAsset;
  v32 = [*(id *)(v5 + 24) stringWithUTF8String:"createAsCompanionSyncedAsset"];
  [v4 encodeBool:createAsCompanionSyncedAsset forKey:v32];

  BOOL shouldCreateScreenshot = self->_shouldCreateScreenshot;
  v34 = [*(id *)(v5 + 24) stringWithUTF8String:"createScreenshot"];
  [v4 encodeBool:shouldCreateScreenshot forKey:v34];

  BOOL shouldUseAutomaticallyGeneratedOriginalFilename = self->_shouldUseAutomaticallyGeneratedOriginalFilename;
  v36 = [*(id *)(v5 + 24) stringWithUTF8String:"useAutomaticallyGeneratedOriginalFilename"];
  [v4 encodeBool:shouldUseAutomaticallyGeneratedOriginalFilename forKey:v36];

  if (self->_duplicateStillSourceTime.flags)
  {
    CMTime time = (CMTime)self->_duplicateStillSourceTime;
    CFDictionaryRef v37 = CMTimeCopyAsDictionary(&time, 0);
    uint64_t v38 = [*(id *)(v5 + 24) stringWithUTF8String:"duplicateLivePhotoStillTimeKey"];
    [v4 encodeObject:v37 forKey:v38];
  }
  if (self->_momentShare)
  {
    v39 = [(PHAssetCreationRequest *)self momentShareHelper];
    v40 = [(PHAssetCreationRequest *)self momentShareHelper];
    CFDictionaryRef v41 = [v40 relationshipName];
    [v4 encodeObject:v39 forKey:v41];

    momentShareUUID = self->_momentShareUUID;
    v43 = [*(id *)(v5 + 24) stringWithUTF8String:"momentShareUUID"];
    [v4 encodeObject:momentShareUUID forKey:v43];
  }
  importSessionID = self->_importSessionID;
  v45 = [*(id *)(v5 + 24) stringWithUTF8String:"importSessionID"];
  [v4 encodeObject:importSessionID forKey:v45];

  conversationID = self->_conversationID;
  v47 = [*(id *)(v5 + 24) stringWithUTF8String:"conversationID"];
  [v4 encodeObject:conversationID forKey:v47];

  int64_t importedBy = self->_importedBy;
  if (importedBy)
  {
    v49 = [*(id *)(v5 + 24) stringWithUTF8String:"importedBy"];
    [v4 encodeInteger:importedBy forKey:v49];
  }
  BOOL duplicateSinglePhotoFromBurst = self->_duplicateSinglePhotoFromBurst;
  uint64_t v51 = [*(id *)(v5 + 24) stringWithUTF8String:"duplicateSinglePhotoFromBurst"];
  [v4 encodeBool:duplicateSinglePhotoFromBurst forKey:v51];

  adjustmentBakeInOptions = self->_adjustmentBakeInOptions;
  uint64_t v53 = [*(id *)(v5 + 24) stringWithUTF8String:"adjustmentBakeInOptions"];
  [v4 encodeObject:adjustmentBakeInOptions forKey:v53];

  metadataCopyOptions = self->_metadataCopyOptions;
  uint64_t v55 = [*(id *)(v5 + 24) stringWithUTF8String:"metadataCopyOptions"];
  [v4 encodeObject:metadataCopyOptions forKey:v55];

  importedByBundleIdentifier = self->_importedByBundleIdentifier;
  uint64_t v57 = [*(id *)(v5 + 24) stringWithUTF8String:"importedByBundleIdentifier"];
  [v4 encodeObject:importedByBundleIdentifier forKey:v57];

  syndicationIdentifier = self->_syndicationIdentifier;
  uint64_t v59 = [*(id *)(v5 + 24) stringWithUTF8String:"syndicationIdentifier"];
  [v4 encodeObject:syndicationIdentifier forKey:v59];

  customAssetProperties = self->_customAssetProperties;
  uint64_t v61 = [*(id *)(v5 + 24) stringWithUTF8String:"customAssetProperties"];
  [v4 encodeObject:customAssetProperties forKey:v61];

  assetExistsWithSyndicationIdentifier = self->_assetExistsWithSyndicationIdentifier;
  uint64_t v63 = [*(id *)(v5 + 24) stringWithUTF8String:"assetExistsWithSyndicationIdentifier"];
  [v4 encodeObject:assetExistsWithSyndicationIdentifier forKey:v63];

  if ([(NSNumber *)self->_assetExistsWithSyndicationIdentifier BOOLValue])
  {
    BOOL assetExistingWithSyndicationIdentifierIsTrashed = self->_assetExistingWithSyndicationIdentifierIsTrashed;
    v65 = [*(id *)(v5 + 24) stringWithUTF8String:"assetExistingWithSyndicationIdentifierIsTrashed"];
    [v4 encodeBool:assetExistingWithSyndicationIdentifierIsTrashed forKey:v65];
  }
  resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
  uint64_t v67 = [*(id *)(v5 + 24) stringWithUTF8String:"resourceHoldingDirectoryPath"];
  [v4 encodeObject:resourceHoldingDirectoryPath forKey:v67];

  if (self->_retryCount >= 1) {
    objc_msgSend(v4, "encodeInt:forKey:");
  }
}

- (int64_t)accessScopeOptionsRequirement
{
  if ([(PHAssetCreationRequest *)self isDuplicateAssetCreationRequest]) {
    return 7;
  }
  else {
    return 1;
  }
}

- (BOOL)isDuplicateAssetCreationRequest
{
  v2 = [(PHAssetCreationRequest *)self duplicateAssetIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_shouldUseAutomaticallyGeneratedOriginalFilename
{
  return self->_shouldUseAutomaticallyGeneratedOriginalFilename;
}

- (void)_setShouldUseAutomaticallyGeneratedOriginalFilename:(BOOL)a3
{
  self->_BOOL shouldUseAutomaticallyGeneratedOriginalFilename = a3;
}

- (BOOL)_shouldCreateScreenshot
{
  return self->_shouldCreateScreenshot;
}

- (void)_setShouldCreateScreenshot:(BOOL)a3
{
  self->_BOOL shouldCreateScreenshot = a3;
}

- (BOOL)duplicateAllowsPrivateMetadata
{
  return self->_duplicateAllowsPrivateMetadata;
}

- (void)_setDuplicateAllowsPrivateMetadata:(BOOL)a3
{
  self->_duplicateAllowsPrivateMetadata = a3;
}

- (BOOL)isNew
{
  return 1;
}

- (void)setMomentShare:(id)a3
{
  objc_storeStrong((id *)&self->_momentShare, a3);
  id v7 = a3;
  unint64_t v5 = [v7 uuid];
  momentShareUUID = self->_momentShareUUID;
  self->_momentShareUUID = v5;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (id)_mutableMomentShareObjectIDsAndUUIDs
{
  [(PHAssetCreationRequest *)self _prepareMomentShareHelperIfNeeded];
  momentShareHelper = self->_momentShareHelper;

  return [(PHRelationshipChangeRequestHelper *)momentShareHelper mutableObjectIDsAndUUIDs];
}

- (void)_prepareMomentShareHelperIfNeeded
{
  BOOL v3 = [(PHRelationshipChangeRequestHelper *)self->_momentShareHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_momentShareHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_momentShareHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    momentShareHelper = self->_momentShareHelper;
    id v7 = [(PHRelationshipChangeRequestHelper *)momentShareHelper originalObjectIDs];
    uint64_t v6 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)momentShareHelper setMutableObjectIDsAndUUIDs:v6];
  }
}

- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PHAssetCreationRequest *)self _limitedLibraryFetchFilterObjectID];

  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F8ADC8];
    id v7 = [(PHAssetCreationRequest *)self _limitedLibraryFetchFilterObjectID];
    uint64_t v11 = *MEMORY[0x1E4F8ADD0];
    uint64_t v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 clientBundleIdentifier];
    v12[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v5 postNotificationName:v6 object:v7 userInfo:v10];
  }
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHAssetCreationRequest;
  id v19 = 0;
  LODWORD(v9) = [(PHAssetChangeRequest *)&v18 applyMutationsToManagedObject:v8 photoLibrary:a4 error:&v19];
  id v10 = v19;
  uint64_t v11 = [(PHAssetCreationRequest *)self momentShareHelper];
  v12 = v11;
  if (v9)
  {
    v13 = [v11 mutableObjectIDsAndUUIDs];
    uint64_t v14 = [v13 count];

    if (!v14)
    {

      LOBYTE(v9) = 1;
      goto LABEL_8;
    }
    [v12 setAllowsInsert:1];
    uint64_t v9 = +[PHMomentShare managedEntityName];
    [v12 setDestinationEntityName:v9];

    id v17 = v10;
    LOBYTE(v9) = [v12 applyMutationsToManagedObjectToOneRelationship:v8 error:&v17];
    id v15 = v17;

    id v10 = v15;
  }

  if (a5 && (v9 & 1) == 0)
  {
    id v10 = v10;
    LOBYTE(v9) = 0;
    *a5 = v10;
  }
LABEL_8:

  return v9;
}

- (void)_tracePhotoKitAssetCreationWithUUID:(id)a3
{
}

- (id)_captureSessionIdentifier
{
  v2 = [(PHChangeRequest *)self helper];
  BOOL v3 = [v2 clientAuthorization];
  id v4 = [v3 captureSessionState];

  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 sessionIdentifier];
  }
  else
  {
    objc_opt_class();
    id v9 = v5;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v8 = [v11 sessionIdentifier];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)_setCaptureSessionIdentifierOnAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHAssetCreationRequest *)self _captureSessionIdentifier];
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 isEqualToString:&stru_1EEAC1950];

    if ((v7 & 1) == 0)
    {
      id v8 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v4 uuidDescription];
        int v10 = 138412546;
        id v11 = v9;
        __int16 v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "Capture Session: Setting session identifier of new asset %@: %@", (uint8_t *)&v10, 0x16u);
      }
      [v4 setCaptureSessionIdentifier:v6];
    }
  }
}

- (void)_setModificationDateOnAsset:(id)a3
{
  id v5 = a3;
  id v4 = [(PHAssetChangeRequest *)self modificationDate];
  if (v4) {
    [v5 setModificationDate:v4];
  }
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![(PHAssetResourceBag *)self->_assetResourceBag didValidateForInsertion])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:4296 description:@"expect prior validation"];
  }
  if (![(PHAssetResourceBag *)self->_assetResourceBag isValid])
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:4297 description:@"expect validated asset resources upon asset creation"];
  }
  if ([(PHAssetResourceBag *)self->_assetResourceBag isValid])
  {
    id v8 = [(PHChangeRequest *)self uuid];
    id v32 = 0;
    BOOL v9 = [(PHAssetCreationRequest *)self _validateNewObjectUUID:v8 inPhotoLibrary:v7 error:&v32];
    id v10 = v32;
    if (v9)
    {
      id v11 = [(PHChangeRequest *)self helper];
      id v31 = 0;
      __int16 v12 = [MEMORY[0x1E4F8A950] entityName];
      id v30 = v10;
      int v13 = [v11 getCloudGUIDIfReserved:&v31 entityName:v12 photoLibrary:v7 error:&v30];
      id v28 = v31;
      id v14 = v30;

      if (v13)
      {
        assetResourceBag = self->_assetResourceBag;
        id v29 = v14;
        v16 = [(PHAssetCreationRequest *)self createAssetFromValidatedResources:assetResourceBag withUUID:v8 assetAlreadyExistsAsPlaceholder:0 inPhotoLibrary:v7 error:&v29];
        id v10 = v29;

        if (v16)
        {
          id v17 = v28;
          if (v28) {
            [v16 setCloudAssetGUID:v28];
          }
          [(PHAssetCreationRequest *)self _setModificationDateOnAsset:v16];
          [(PHAssetCreationRequest *)self _setCaptureSessionIdentifierOnAsset:v16];
          [(PHAssetCreationRequest *)self _tracePhotoKitAssetCreationWithUUID:v8];
          goto LABEL_23;
        }
        objc_super v18 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v10;
          _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "Unable to create asset from validated resources: %@", buf, 0xCu);
        }

        id v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = [(PHAssetResourceBag *)self->_assetResourceBag primaryResource];
        uint64_t v21 = [v20 fileURL];
        v22 = [v21 path];
        v23 = [v22 lastPathComponent];
        uint64_t v24 = objc_msgSend(v19, "ph_genericErrorWithUnderlyingError:localizedDescription:", v10, @"Failed to create asset for resource: %@", v23);

        id v10 = (id)v24;
      }
      else
      {
        id v10 = v14;
      }
      id v17 = v28;
      if (!a4) {
        goto LABEL_22;
      }
    }
    else
    {
      id v17 = 0;
      if (!a4)
      {
LABEL_22:
        v16 = 0;
        goto LABEL_23;
      }
    }
    id v10 = v10;
    v16 = 0;
    *a4 = v10;
LABEL_23:

    goto LABEL_24;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unable to create asset from invalid resources");
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_24:

  return v16;
}

- (BOOL)_validateNewObjectUUID:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![(PHChangeRequest *)self isClientEntitled])
  {
    BOOL v9 = [(PHAssetCreationRequest *)self assetExistsWithSyndicationIdentifier];
    char v10 = [v9 isEqualToNumber:MEMORY[0x1E4F1CC38]];

    if ((v10 & 1) == 0)
    {
      if (![v7 length]
        || (*(void *)uu = 0,
            *(void *)&uu[8] = 0,
            id v12 = v7,
            (int v13 = (const char *)[v12 cStringUsingEncoding:4]) == 0)
        || uuid_parse(v13, uu))
      {
        id v14 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uu = 138543362;
          *(void *)&uu[4] = v7;
          _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Failed to validate malformed UUID '%{public}@'", uu, 0xCu);
        }

        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F28228];
        v42[0] = @"Malformed UUID";
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
        id v17 = [v15 errorWithDomain:@"PHPhotosErrorDomain" code:3140 userInfo:v16];

        BOOL v11 = 0;
        goto LABEL_10;
      }
      id v19 = (void *)MEMORY[0x1E4F8A950];
      v39[0] = v12;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
      uint64_t v21 = [v8 managedObjectContext];
      id v34 = 0;
      uint64_t v22 = [v19 countForAssetsWithUUIDs:v20 includePendingChanges:1 inManagedObjectContext:v21 error:&v34];
      id v17 = v34;

      if (v22)
      {
        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uu = 138543618;
            *(void *)&uu[4] = v12;
            *(_WORD *)&uu[12] = 2112;
            *(void *)&uu[14] = v17;
            _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Failed to validate UUID '%{public}@' uniqueness, fetch error %@", uu, 0x16u);
          }

          uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v37 = *MEMORY[0x1E4F28228];
          uint64_t v38 = @"Unable to check UUID uniqueness";
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          uint64_t v26 = [v24 errorWithDomain:@"PHPhotosErrorDomain" code:3140 userInfo:v25];

LABEL_28:
          BOOL v11 = 0;
          id v17 = (id)v26;
          goto LABEL_10;
        }
        id v27 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions jobType];
        int v28 = [v27 isEqualToString:*MEMORY[0x1E4F8C9D0]];
        if (v22 == 1) {
          int v29 = v28;
        }
        else {
          int v29 = 0;
        }

        if (!v29)
        {
          id v31 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uu = 138543362;
            *(void *)&uu[4] = v12;
            _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "UUID '%{public}@' is not unique", uu, 0xCu);
          }

          id v32 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v35 = *MEMORY[0x1E4F28228];
          v36 = @"UUID is not unique";
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          uint64_t v26 = [v32 errorWithDomain:@"PHPhotosErrorDomain" code:3140 userInfo:v33];

          goto LABEL_28;
        }
        id v30 = PLPhotoKitIngestGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uu = 0;
          _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEFAULT, "Duplicate asset is a timelapse placeholder. Ignoring.", uu, 2u);
        }
      }
      BOOL v11 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (self->_assetResourceBag)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:4210 description:@"expect single call to validate"];
  }
  id v8 = [(PHAssetCreationRequest *)self duplicateAssetIdentifier];
  if (v8)
  {
    id v24 = 0;
    BOOL v9 = [(PHAssetCreationRequest *)self _populateDuplicatingAssetCreationRequest:self photoLibrary:v7 error:&v24];
    id v10 = v24;
    if (!v9)
    {
LABEL_12:
      BOOL v18 = 0;
      if (!a4) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = 0;
  }
  BOOL v11 = v10;
  id v12 = [[PHAssetResourceBag alloc] initWithAssetResources:self->_assetResources assetCreationRequest:self];
  assetResourceBag = self->_assetResourceBag;
  self->_assetResourceBag = v12;

  id v14 = self->_assetResourceBag;
  id v23 = v10;
  BOOL v15 = [(PHAssetResourceBag *)v14 validateForInsertIntoPhotoLibrary:v7 error:&v23];
  id v10 = v23;

  if (!v15) {
    goto LABEL_12;
  }
  if (![(PHAssetChangeRequest *)self didChangeAdjustments]
    || ([(PHAssetChangeRequest *)self contentEditingOutput],
        v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        !v16))
  {
    BOOL v18 = 1;
    goto LABEL_16;
  }
  id v17 = [(PHAssetChangeRequest *)self contentEditingOutput];
  id v22 = v10;
  BOOL v18 = [(PHAssetChangeRequest *)self validateContentEditingOutput:v17 error:&v22];
  id v19 = v22;

  id v10 = v19;
  if (!a4) {
    goto LABEL_16;
  }
LABEL_13:
  if (!v18)
  {
    id v10 = v10;
    BOOL v18 = 0;
    *a4 = v10;
  }
LABEL_16:

  return v18;
}

- (BOOL)_populateDuplicatingAssetCreationRequest:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  location = (id *)&self->_assetResources;
  id v10 = self->_assetResources;
  BOOL v11 = [v8 duplicateAssetIdentifier];
  long long v55 = 0uLL;
  uint64_t v56 = 0;
  if (v8) {
    [v8 duplicateStillSourceTime];
  }
  id v12 = [[PHPhotoLibrary alloc] initWithPLPhotoLibrary:v9 type:self->_duplicateAssetPhotoLibraryType];
  int v13 = [(PHPhotoLibrary *)v12 librarySpecificFetchOptions];

  if (self->_duplicateAssetPhotoLibraryType)
  {
    if (self->_duplicateAssetPhotoLibraryType != 1) {
      goto LABEL_8;
    }
    uint64_t v14 = 8;
  }
  else
  {
    uint64_t v14 = 7;
  }
  [v13 setIncludeAssetSourceTypes:v14];
LABEL_8:
  [v13 setIncludeHiddenAssets:1];
  [v13 setIncludeAllBurstAssets:1];
  v58[0] = v11;
  BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
  v16 = +[PHAsset fetchAssetsWithLocalIdentifiers:v15 options:v13];
  id v17 = [v16 firstObject];

  if (self->_duplicateAsAlternateAsset)
  {
    BOOL v18 = (void *)[(NSMutableArray *)v10 mutableCopy];
    [(NSMutableArray *)v10 removeAllObjects];
    if (v17) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Cannot create a copy of missing asset");
    goto LABEL_14;
  }
  BOOL v18 = 0;
  if (!v17) {
    goto LABEL_13;
  }
LABEL_10:
  if ([(NSMutableArray *)v10 count])
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Cannot copy asset with added resources");
LABEL_14:
    uint64_t v20 = (void *)v19;
    BOOL v21 = 0;
    goto LABEL_15;
  }
  long long v44 = self;
  v45 = v18;
  uint64_t v23 = [v8 duplicateSinglePhotoFromBurst];
  uint64_t v24 = [v8 duplicateLivePhotoAsStill];
  if (v24)
  {
    if (([v17 isPhotoIris] & 1) == 0)
    {
      uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = [v17 mediaType];
      if ((unint64_t)(v36 - 1) > 2) {
        uint64_t v37 = @"unknown";
      }
      else {
        uint64_t v37 = off_1E58454F0[v36 - 1];
      }
      uint64_t v38 = v37;
      v39 = +[PHAsset descriptionForMediaSubtypes:](PHAsset, "descriptionForMediaSubtypes:", [v17 mediaSubtypes]);
      uint64_t v40 = objc_msgSend(v35, "ph_errorWithCode:localizedDescription:", 3300, @"Cannot create still photo from asset type %@/%@, requires live photo", v38, v39);

      uint64_t v20 = (void *)v40;
      BOOL v21 = 0;
      goto LABEL_42;
    }
    v43 = v13;
    uint64_t v23 = 1;
  }
  else
  {
    v43 = v13;
  }
  uint64_t v25 = [v8 duplicateAsOriginal];
  long long v52 = v55;
  uint64_t v53 = v56;
  id v54 = 0;
  uint64_t v26 = [(PHAssetCreationRequest *)v44 duplicatedAssetResourcesFromAsset:v17 stillSourceTime:&v52 flattenLivePhotoIntoStillPhoto:v24 duplicateAsOriginal:v25 duplicateWithAdjustmentsBakedIn:0 duplicatePhotoAsData:v23 error:&v54];
  id v27 = v54;

  if (![(NSMutableArray *)v26 count])
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithUnderlyingError:localizedDescription:", v27, @"Failed to copy asset resources");

    BOOL v21 = 0;
    id v10 = v26;
    int v13 = v43;
LABEL_42:
    BOOL v18 = v45;
    goto LABEL_15;
  }
  id v42 = v27;
  BOOL v18 = v45;
  if ([v45 count])
  {
    uint64_t v41 = v11;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v28 = v45;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __86__PHAssetCreationRequest__populateDuplicatingAssetCreationRequest_photoLibrary_error___block_invoke;
          v47[3] = &unk_1E5844368;
          v47[4] = v33;
          uint64_t v34 = [(NSMutableArray *)v26 indexOfObjectPassingTest:v47];
          if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
            [(NSMutableArray *)v26 addObject:v33];
          }
          else {
            [(NSMutableArray *)v26 replaceObjectAtIndex:v34 withObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v30);
    }

    BOOL v11 = v41;
    BOOL v18 = v45;
  }
  objc_storeStrong(location, v26);
  [(PHAssetCreationRequest *)v44 _updateMutationsForDuplicatingPrivateMetadataFromAsset:v17];
  BOOL v21 = 1;
  id v10 = v26;
  uint64_t v20 = v42;
  int v13 = v43;
LABEL_15:
  if (a5 && v20) {
    *a5 = v20;
  }

  return v21;
}

BOOL __86__PHAssetCreationRequest__populateDuplicatingAssetCreationRequest_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 type];
  return v3 == [*(id *)(a1 + 32) type];
}

- (void)_updateMutationsForDuplicatingPrivateMetadataFromAsset:(id)a3
{
  id v5 = [a3 descriptionProperties];
  id v4 = [v5 assetDescription];
  if (v4)
  {
    [(PHAssetCreationRequest *)self _setDuplicateAllowsPrivateMetadata:1];
    [(PHAssetChangeRequest *)self setAssetDescription:v4];
  }
}

- (id)duplicatedAssetResourcesFromAsset:(id)a3 stillSourceTime:(id *)a4 flattenLivePhotoIntoStillPhoto:(BOOL)a5 duplicateAsOriginal:(BOOL)a6 duplicateWithAdjustmentsBakedIn:(BOOL)a7 duplicatePhotoAsData:(BOOL)a8 error:(id *)a9
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  long long v55 = +[PHAssetResource assetResourcesForAsset:v15 includeDerivatives:0 includeMetadata:0 includeAdjustmentOverflowDataBlob:1];
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x3032000000;
  uint64_t v87 = __Block_byref_object_copy__14582;
  v88 = __Block_byref_object_dispose__14583;
  id v89 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v80 = 0;
  uint64_t v81 = &v80;
  uint64_t v82 = 0x2020000000;
  uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v74 = 0;
  objc_super v75 = &v74;
  uint64_t v76 = 0x3032000000;
  uint64_t v77 = __Block_byref_object_copy__14582;
  v78 = __Block_byref_object_dispose__14583;
  id v79 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke;
  v63[3] = &unk_1E5844318;
  long long v16 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  long long v68 = v16;
  BOOL v70 = a7;
  BOOL v71 = a5;
  BOOL v72 = a6;
  BOOL v73 = a8;
  v65 = &v80;
  v63[4] = self;
  id v17 = v15;
  id v64 = v17;
  v66 = &v84;
  uint64_t v67 = &v74;
  [v55 enumerateObjectsUsingBlock:v63];
  if (a9)
  {
    BOOL v18 = (void *)v75[5];
    if (v18) {
      *a9 = v18;
    }
  }
  if (a4->var2)
  {
    if (([v17 isPhotoIris] & 1) == 0)
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:4043 description:@"Can't extract a still image from the video complement when duplicating a non-iris asset"];
    }
    if (v81[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:4044 description:@"Can't extract a still image without a video complement"];
    }
    uint64_t v19 = objc_msgSend(v55, "objectAtIndexedSubscript:");
    uint64_t v20 = [v19 privateFileURL];
    long long v49 = v19;
    long long v52 = [MEMORY[0x1E4F16330] assetWithURL:v20];
    BOOL v21 = objc_msgSend(MEMORY[0x1E4F16368], "assetImageGeneratorWithAsset:");
    long long v57 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)long long v50 = v57;
    int64_t v58 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    int64_t v22 = v58;
    [v21 setRequestedTimeToleranceBefore:&v57];
    long long v57 = *(_OWORD *)v50;
    int64_t v58 = v22;
    [v21 setRequestedTimeToleranceAfter:&v57];
    [v21 setAppliesPreferredTrackTransform:1];
    id v62 = 0;
    long long v57 = *(_OWORD *)&a4->var0;
    int64_t v58 = a4->var3;
    uint64_t v23 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v21 atTime:&v57 actualTime:0 error:&v62];
    id v51 = v62;
    if (v23)
    {
      uint64_t v24 = [v20 path];
      uint64_t v25 = PFVideoComplementMetadataForVideoAtPath();

      uint64_t v92 = *MEMORY[0x1E4F2FC20];
      uint64_t v90 = *MEMORY[0x1E4F15530];
      uint64_t v26 = [v25 pairingIdentifier];
      v91 = v26;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
      v93[0] = v27;
      CFDictionaryRef v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];

      id v28 = [MEMORY[0x1E4F1CA58] data];
      uint64_t v29 = [(id)*MEMORY[0x1E4F44410] identifier];
      uint64_t v30 = CGImageDestinationCreateWithData(v28, v29, 1uLL, 0);

      CGImageDestinationAddImage(v30, v23, v48);
      CGImageDestinationFinalize(v30);
      uint64_t v31 = [[PHExternalAssetResource alloc] initWithResourceType:1];
      [(PHExternalAssetResource *)v31 setPixelWidth:CGImageGetWidth(v23)];
      [(PHExternalAssetResource *)v31 setPixelHeight:CGImageGetHeight(v23)];
      [(PHExternalAssetResource *)v31 setData:v28];
      [(id)v85[5] addObject:v31];
      CGImageRelease(v23);
      CFRelease(v30);
      if (!a5)
      {
        id v32 = dispatch_group_create();
        id v33 = objc_alloc(MEMORY[0x1E4F8CB90]);
        long long v57 = *(_OWORD *)&a4->var0;
        int64_t v58 = a4->var3;
        v47 = (void *)[v33 initWithAsset:v52 stillImageTime:&v57];
        uint64_t v34 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v35 = [v34 UUIDString];
        id v54 = [v35 stringByAppendingPathExtension:@"mov"];

        uint64_t v36 = NSTemporaryDirectory();
        uint64_t v37 = [v36 stringByAppendingPathComponent:v54];

        uint64_t v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v37];
        dispatch_group_enter(v32);
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_2;
        v60[3] = &unk_1E5846A10;
        v39 = v32;
        uint64_t v61 = v39;
        [v47 writeToURL:v38 progress:0 completion:v60];
        dispatch_group_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
        *(void *)&long long v57 = 0;
        *((void *)&v57 + 1) = &v57;
        int64_t v58 = 0x2020000000;
        uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v40 = (void *)v85[5];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_3;
        v56[3] = &unk_1E5844340;
        v56[4] = &v57;
        [v40 enumerateObjectsUsingBlock:v56];
        if (*(void *)(*((void *)&v57 + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v41 = (PHExternalAssetResource *)v85[5];
          v85[5] = 0;
        }
        else
        {
          uint64_t v41 = [[PHExternalAssetResource alloc] initWithResourceType:9];
          [(PHExternalAssetResource *)v41 setFileURL:v38];
          [(id)v85[5] replaceObjectAtIndex:*(void *)(*((void *)&v57 + 1) + 24) withObject:v41];
        }

        _Block_object_dispose(&v57, 8);
      }
    }
    else
    {
      id v42 = (void *)v85[5];
      v85[5] = 0;

      if (a9) {
        *a9 = v51;
      }
    }
  }
  id v43 = (id)v85[5];

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  return v43;
}

void __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 type];
  switch(v8)
  {
    case 1:
    case 13:
      if ((*(unsigned char *)(a1 + 84) & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    case 2:
    case 3:
    case 4:
    case 12:
    case 14:
      goto LABEL_12;
    case 5:
    case 6:
      goto LABEL_11;
    case 7:
    case 8:
LABEL_5:
      if (!*(unsigned char *)(a1 + 98)) {
        goto LABEL_8;
      }
      goto LABEL_23;
    case 9:
    case 15:
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
      if (*(unsigned char *)(a1 + 97)) {
        goto LABEL_23;
      }
LABEL_8:
      if (!*(unsigned char *)(a1 + 96)) {
        goto LABEL_12;
      }
      goto LABEL_23;
    case 10:
    case 11:
      if (*(unsigned char *)(a1 + 97)) {
        goto LABEL_23;
      }
LABEL_11:
      if (*(unsigned char *)(a1 + 98)) {
        goto LABEL_23;
      }
LABEL_12:
      if (*(unsigned char *)(a1 + 99)) {
        BOOL v9 = [v7 type] == 1;
      }
      else {
        BOOL v9 = 0;
      }
      if (*(unsigned char *)(a1 + 96))
      {
        uint64_t v10 = objc_msgSend((id)objc_opt_class(), "_originalResourceTypeFromAdjustedResourceType:sourceAssetIsLoopingVideo:sourceAssetIsVideo:", objc_msgSend(v7, "type"), objc_msgSend(*(id *)(a1 + 40), "isLoopingVideo"), objc_msgSend(*(id *)(a1 + 40), "isVideo"));
        if (!v10) {
          goto LABEL_23;
        }
        uint64_t v20 = 0;
        BOOL v11 = (id *)&v20;
        uint64_t v12 = +[PHExternalAssetResource assetResourceForDuplicatingAssetResource:v7 newResourceType:v10 asData:v9 error:&v20];
      }
      else
      {
        uint64_t v21 = 0;
        BOOL v11 = (id *)&v21;
        uint64_t v12 = +[PHExternalAssetResource assetResourceForDuplicatingAssetResource:v7 asData:v9 error:&v21];
      }
      int v13 = (void *)v12;
      id v14 = *v11;
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      long long v16 = *(void **)(v15 + 40);
      if (v13)
      {
        [v16 addObject:v13];
      }
      else
      {
        *(void *)(v15 + 40) = 0;

        uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
        BOOL v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v14;
        id v19 = v14;

        *a4 = 1;
      }

LABEL_23:
      return;
    default:
      switch(v8)
      {
        case 'j':
        case 'm':
        case 'r':
          goto LABEL_23;
        case 'l':
          goto LABEL_5;
        default:
          goto LABEL_12;
      }
      goto LABEL_23;
  }
}

void __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_2(uint64_t a1)
{
}

uint64_t __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 type];
  if (result == 9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PHAssetCreationRequest;
  [(PHAssetChangeRequest *)&v44 encodeToXPCDict:v4];
  if (self->_assetResources)
  {
    id v36 = v4;
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v6 = self->_assetResources;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v12 = [v11 propertyListRepresentation];
          [v5 addObject:v12];

          int v13 = [v11 fileURL];

          if (v13)
          {
            id v14 = [v11 fileURL];
            uint64_t v15 = [v14 path];

            long long v16 = [v11 creationOptions];
            [v16 shouldMoveFile];

            uint64_t v17 = PLGetSandboxExtensionToken();
            [v37 setObject:v17 forKeyedSubscript:v15];
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v8);
    }

    id v4 = v36;
    PLXPCDictionarySetArray();
    PLXPCDictionarySetDictionary();
  }
  if (self->_duplicateAssetIdentifier)
  {
    PLXPCDictionarySetString();
    xpc_dictionary_set_BOOL(v4, "duplicateLivePhotoAsStill", self->_duplicateLivePhotoAsStill);
  }
  xpc_dictionary_set_int64(v4, "duplicateAssetPhotoLibraryType", self->_duplicateAssetPhotoLibraryType);
  xpc_dictionary_set_BOOL(v4, "duplicateAsOriginal", self->_duplicateAsOriginal);
  xpc_dictionary_set_BOOL(v4, "duplicateAsAlternateAsset", self->_duplicateAsAlternateAsset);
  xpc_dictionary_set_BOOL(v4, "createAsCompanionSyncedAsset", self->_createAsCompanionSyncedAsset);
  xpc_dictionary_set_int64(v4, "bundleScope", self->_bundleScope);
  if ([(PHAssetCreationRequest *)self _shouldCreateScreenshot]) {
    xpc_dictionary_set_BOOL(v4, "createScreenshot", 1);
  }
  if ([(PHAssetCreationRequest *)self _shouldUseAutomaticallyGeneratedOriginalFilename])
  {
    xpc_dictionary_set_BOOL(v4, "useAutomaticallyGeneratedOriginalFilename", 1);
  }
  if (self->_duplicateStillSourceTime.flags)
  {
    CMTime time = (CMTime)self->_duplicateStillSourceTime;
    CFDictionaryRef v18 = CMTimeCopyAsDictionary(&time, 0);
    PLXPCDictionarySetDictionary();
  }
  if (self->_momentShare)
  {
    id v19 = [(PHAssetCreationRequest *)self _mutableMomentShareObjectIDsAndUUIDs];
    [v19 removeAllObjects];

    uint64_t v20 = [(PHAssetCreationRequest *)self _mutableMomentShareObjectIDsAndUUIDs];
    uint64_t v21 = PLObjectIDOrUUIDFromPHObject(self->_momentShare);
    [v20 addObject:v21];

    int64_t v22 = [(PHAssetCreationRequest *)self momentShareHelper];
    [v22 encodeToXPCDict:v4];

    PLXPCDictionarySetString();
  }
  if (self->_importSessionID) {
    PLXPCDictionarySetString();
  }
  if (self->_conversationID) {
    PLXPCDictionarySetString();
  }
  int64_t importedBy = self->_importedBy;
  if (importedBy) {
    xpc_dictionary_set_int64(v4, "importedBy", importedBy);
  }
  if (self->_duplicateSinglePhotoFromBurst) {
    xpc_dictionary_set_BOOL(v4, "duplicateSinglePhotoFromBurst", 1);
  }
  if (self->_adjustmentBakeInOptions)
  {
    uint64_t v24 = [(PHAssetCreationRequest *)self adjustmentBakeInOptions];
    [v24 encodeToXPCDict:v4];
  }
  if (self->_metadataCopyOptions)
  {
    uint64_t v25 = [(PHAssetCreationRequest *)self metadataCopyOptions];
    [v25 encodeToXPCDict:v4];
  }
  if (self->_cameraIngestOptions)
  {
    uint64_t v26 = [(PHAssetCreationRequest *)self cameraIngestOptions];
    [v26 encodeToXPCDict:v4];
  }
  if (self->_importedByBundleIdentifier) {
    PLXPCDictionarySetString();
  }
  if (self->_syndicationIdentifier) {
    PLXPCDictionarySetString();
  }
  if (self->_customAssetProperties) {
    PLXPCDictionarySetDictionary();
  }
  assetExistsWithSyndicationIdentifier = self->_assetExistsWithSyndicationIdentifier;
  if (assetExistsWithSyndicationIdentifier)
  {
    xpc_dictionary_set_BOOL(v4, "assetExistsWithSyndicationIdentifier", [(NSNumber *)assetExistsWithSyndicationIdentifier BOOLValue]);
    if ([(NSNumber *)self->_assetExistsWithSyndicationIdentifier BOOLValue]) {
      xpc_dictionary_set_BOOL(v4, "assetExistingWithSyndicationIdentifierIsTrashed", self->_assetExistingWithSyndicationIdentifierIsTrashed);
    }
  }
  if (self->_resourceHoldingDirectoryPath)
  {
    PLXPCDictionarySetString();
    resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
    if (resourceHoldingDirectoryPath)
    {
      uint64_t v29 = [@"XPCDict" stringByAppendingPathExtension:@"plist"];
      uint64_t v30 = [(NSString *)resourceHoldingDirectoryPath stringByAppendingPathComponent:v29];

      id v39 = 0;
      uint64_t v31 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v39];
      id v32 = v39;
      if (v31)
      {
        id v38 = 0;
        char v33 = [v31 writeToFile:v30 options:1 error:&v38];
        id v34 = v38;
        if ((v33 & 1) == 0)
        {
          uint64_t v35 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            LODWORD(time.value) = 138412546;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v30;
            LOWORD(time.flags) = 2112;
            *(void *)((char *)&time.flags + 2) = v34;
            _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_ERROR, "Unable to write out XPC dict to holding path %@: %@", (uint8_t *)&time, 0x16u);
          }
        }
      }
    }
  }
}

- (PHAssetCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v69.receiver = self;
  v69.super_class = (Class)PHAssetCreationRequest;
  uint64_t v10 = [(PHAssetChangeRequest *)&v69 initWithXPCDict:v8 request:v9 clientAuthorization:a5];
  if (v10)
  {
    BOOL v11 = PLArrayFromXPCDictionary();
    PLDictionaryFromXPCDictionary();
    uint64_t v63 = v62 = v11;
    if (v11)
    {
      uint64_t v59 = v10;
      id v60 = v9;
      id v61 = v8;
      uint64_t v12 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v65 objects:v70 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v66 != v16) {
              objc_enumerationMutation(v13);
            }
            CFDictionaryRef v18 = [[PHExternalAssetResource alloc] initWithPropertyListRepresentation:*(void *)(*((void *)&v65 + 1) + 8 * i)];
            id v19 = [(PHExternalAssetResource *)v18 fileURL];
            uint64_t v20 = [v19 path];
            uint64_t v21 = [v63 objectForKeyedSubscript:v20];

            if (v21)
            {
              id v22 = objc_alloc(MEMORY[0x1E4F8B9D0]);
              uint64_t v23 = [(PHExternalAssetResource *)v18 fileURL];
              uint64_t v24 = (void *)[v22 initWithURL:v23 sandboxExtensionToken:v21 consume:1];

              [(PHExternalAssetResource *)v18 setFileURL:v24];
            }
            -[NSMutableArray addObject:](v12, "addObject:", v18, v59);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v65 objects:v70 count:16];
        }
        while (v15);
      }

      uint64_t v10 = v59;
      assetResources = v59->_assetResources;
      v59->_assetResources = v12;

      id v9 = v60;
      id v8 = v61;
    }
    uint64_t v26 = PLStringFromXPCDictionary();
    if (v26)
    {
      objc_storeStrong((id *)&v10->_duplicateAssetIdentifier, v26);
      v10->_BOOL duplicateLivePhotoAsStill = xpc_dictionary_get_BOOL(v8, "duplicateLivePhotoAsStill");
    }
    v10->_uint64_t duplicateAssetPhotoLibraryType = xpc_dictionary_get_int64(v8, "duplicateAssetPhotoLibraryType");
    PLDictionaryFromXPCDictionary();
    CFDictionaryRef v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v64, v27);
    long long v28 = *(_OWORD *)&v64.value;
    v10->_duplicateStillSourceTime.epoch = v64.epoch;
    *(_OWORD *)&v10->_duplicateStillSourceTime.BOOL value = v28;
    v10->_BOOL duplicateAsOriginal = xpc_dictionary_get_BOOL(v8, "duplicateAsOriginal");
    v10->_BOOL duplicateAsAlternateAsset = xpc_dictionary_get_BOOL(v8, "duplicateAsAlternateAsset");
    v10->_BOOL createAsCompanionSyncedAsset = xpc_dictionary_get_BOOL(v8, "createAsCompanionSyncedAsset");
    v10->_bundleScope = xpc_dictionary_get_int64(v8, "bundleScope");
    if (xpc_dictionary_get_BOOL(v8, "createScreenshot")) {
      [(PHAssetCreationRequest *)v10 _setShouldCreateScreenshot:1];
    }
    if (xpc_dictionary_get_BOOL(v8, "useAutomaticallyGeneratedOriginalFilename")) {
      [(PHAssetCreationRequest *)v10 _setShouldUseAutomaticallyGeneratedOriginalFilename:1];
    }
    objc_msgSend(v9, "recordInsertRequest:", v10, v59);
    uint64_t v29 = [PHRelationshipChangeRequestHelper alloc];
    uint64_t v30 = [(PHChangeRequest *)v10 helper];
    uint64_t v31 = [(PHRelationshipChangeRequestHelper *)v29 initWithRelationshipName:@"momentShare" xpcDict:v8 changeRequestHelper:v30];
    momentShareHelper = v10->_momentShareHelper;
    v10->_momentShareHelper = (PHRelationshipChangeRequestHelper *)v31;

    char v33 = PLStringFromXPCDictionary();
    if (v33) {
      objc_storeStrong((id *)&v10->_momentShareUUID, v33);
    }
    uint64_t v34 = PLStringFromXPCDictionary();
    importSessionID = v10->_importSessionID;
    v10->_importSessionID = (NSString *)v34;

    uint64_t v36 = PLStringFromXPCDictionary();
    conversationID = v10->_conversationID;
    v10->_conversationID = (NSString *)v36;

    int64_t int64 = xpc_dictionary_get_int64(v8, "importedBy");
    v10->_int64_t importedBy = int64;
    [(PHChangeRequest *)v10 setShouldPerformConcurrentWork:int64 == 5];
    v10->_BOOL duplicateSinglePhotoFromBurst = xpc_dictionary_get_BOOL(v8, "duplicateSinglePhotoFromBurst");
    id v39 = [[PHAssetCreationAdjustmentBakeInOptions alloc] initWithXPCDict:v8];
    adjustmentBakeInOptions = v10->_adjustmentBakeInOptions;
    v10->_adjustmentBakeInOptions = v39;

    long long v41 = [[PHAssetCreationMetadataCopyOptions alloc] initWithXPCDict:v8];
    metadataCopyOptions = v10->_metadataCopyOptions;
    v10->_metadataCopyOptions = v41;

    long long v43 = [[PHAssetCreationCameraIngestOptions alloc] initWithXPCDict:v8];
    cameraIngestOptions = v10->_cameraIngestOptions;
    v10->_cameraIngestOptions = v43;

    uint64_t v45 = PLStringFromXPCDictionary();
    importedByBundleIdentifier = v10->_importedByBundleIdentifier;
    v10->_importedByBundleIdentifier = (NSString *)v45;

    uint64_t v47 = PLStringFromXPCDictionary();
    syndicationIdentifier = v10->_syndicationIdentifier;
    v10->_syndicationIdentifier = (NSString *)v47;

    uint64_t v49 = PLDictionaryFromXPCDictionary();
    customAssetProperties = v10->_customAssetProperties;
    v10->_customAssetProperties = (NSDictionary *)v49;

    id v51 = xpc_dictionary_get_value(v8, "assetExistsWithSyndicationIdentifier");
    long long v52 = v51;
    if (v51)
    {
      BOOL value = xpc_BOOL_get_value(v51);
      uint64_t v54 = [NSNumber numberWithBool:value];
      assetExistsWithSyndicationIdentifier = v10->_assetExistsWithSyndicationIdentifier;
      v10->_assetExistsWithSyndicationIdentifier = (NSNumber *)v54;

      if (value) {
        v10->_BOOL assetExistingWithSyndicationIdentifierIsTrashed = xpc_dictionary_get_BOOL(v8, "assetExistingWithSyndicationIdentifierIsTrashed");
      }
    }
    uint64_t v56 = PLStringFromXPCDictionary();
    resourceHoldingDirectoryPath = v10->_resourceHoldingDirectoryPath;
    v10->_resourceHoldingDirectoryPath = (NSString *)v56;
  }
  return v10;
}

- (void)setCustomAssetProperties:(id)a3
{
  id v4 = (NSDictionary *)a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  customAssetProperties = self->_customAssetProperties;
  self->_customAssetProperties = v4;
}

- (void)setImportedByBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  uint64_t v6 = (NSString *)[v4 copy];
  importedByBundleIdentifier = self->_importedByBundleIdentifier;
  self->_importedByBundleIdentifier = v6;
}

- (void)setConversationID:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  conversationID = self->_conversationID;
  self->_conversationID = v4;
}

- (void)setImportSessionID:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  importSessionID = self->_importSessionID;
  self->_importSessionID = v4;
}

- (void)setImportedBy:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  self->_int64_t importedBy = a3;
}

- (int64_t)_mediaTypeForCreatedAsset
{
  int64_t v6 = 0;
  uint64_t v3 = [(NSMutableArray *)self->_assetResources valueForKey:@"type"];
  +[PHAssetResourceBag supportsAssetResourceTypes:v3 mediaType:&v6 importedBy:(__int16)[(PHAssetCreationRequest *)self importedBy]];
  int64_t v4 = v6;

  return v4;
}

- (id)placeholderForCreatedAsset
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  int64_t v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  objc_msgSend(v4, "setAssetMediaType:", -[PHAssetCreationRequest _mediaTypeForCreatedAsset](self, "_mediaTypeForCreatedAsset"));

  return v4;
}

- (void)_addResourceWithType:(int64_t)a3 data:(id)a4 orFileURL:(id)a5 options:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  BOOL v11 = (PHAssetResourceCreationOptions *)a6;
  id v12 = a4;
  id v13 = [[PHExternalAssetResource alloc] initWithResourceType:a3];
  [(PHExternalAssetResource *)v13 setData:v12];

  if (!self->_useRecoverableStagingDirectory
    || ([(PHAssetCreationRequest *)self _resolveResourceHoldingDirectoryPath],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    [(PHExternalAssetResource *)v13 setFileURL:v10];
    goto LABEL_21;
  }
  resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
  uint64_t v16 = [v10 lastPathComponent];
  uint64_t v17 = [(NSString *)resourceHoldingDirectoryPath stringByAppendingPathComponent:v16];

  CFDictionaryRef v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
  id v19 = [v10 path];

  if (v19)
  {
    if ([(PHAssetResourceCreationOptions *)v11 shouldMoveFile])
    {
      uint64_t v20 = [(PHChangeRequest *)self photoLibrary];
      uint64_t v21 = [v20 pathManager];
      id v22 = [v21 capabilities];
      id v32 = 0;
      uint64_t v30 = v18;
      uint64_t v23 = [(PHAssetCreationRequest *)self _secureMove:1 fileAtURL:v10 toURL:v18 capabilities:v22 error:&v32];
      id v24 = v32;

      if (v23)
      {
        id v25 = 0;
        CFDictionaryRef v18 = v30;
LABEL_17:
        [(PHExternalAssetResource *)v13 setFileURL:v18];

        goto LABEL_18;
      }
      uint64_t v29 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v17;
        __int16 v35 = 2112;
        id v36 = v24;
        _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_ERROR, "Unable to secure move resource to holding directory location %@: %@", buf, 0x16u);
      }
      id v25 = 0;
      CFDictionaryRef v18 = v30;
    }
    else
    {
      uint64_t v26 = v18;
      CFDictionaryRef v27 = (void *)MEMORY[0x1E4F8B908];
      long long v28 = [v10 path];
      id v31 = 0;
      LOBYTE(v27) = [v27 cloneFileAtPath:v28 toPath:v17 error:&v31];
      id v25 = v31;

      if (v27)
      {
        id v24 = 0;
        CFDictionaryRef v18 = v26;
        goto LABEL_17;
      }
      uint64_t v29 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v17;
        __int16 v35 = 2112;
        id v36 = v25;
        _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_ERROR, "Unable to clone resource to holding directory location %@: %@", buf, 0x16u);
      }
      id v24 = 0;
      CFDictionaryRef v18 = v26;
    }

    goto LABEL_17;
  }
LABEL_18:
  if (!v11) {
    BOOL v11 = objc_alloc_init(PHAssetResourceCreationOptions);
  }
  [(PHAssetResourceCreationOptions *)v11 setShouldMoveFile:1];

LABEL_21:
  [(PHExternalAssetResource *)v13 setCreationOptions:v11];
  [(NSMutableArray *)self->_assetResources addObject:v13];
}

- (void)addResourceWithType:(PHAssetResourceType)type data:(NSData *)data options:(PHAssetResourceCreationOptions *)options
{
}

- (void)addResourceWithType:(PHAssetResourceType)type fileURL:(NSURL *)fileURL options:(PHAssetResourceCreationOptions *)options
{
}

- (id)_resolveResourceHoldingDirectoryPath
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0)
  {
    p_resourceHoldingDirectoryPath = &self->_resourceHoldingDirectoryPath;
    if (!self->_resourceHoldingDirectoryPath)
    {
      int64_t v4 = [(PHChangeRequest *)self photoLibrary];
      id v19 = 0;
      int v5 = [v4 requestSandboxExtensionsIfNeededWithError:&v19];
      int64_t v6 = (NSString *)v19;

      if (v5)
      {
        uint64_t v7 = [(PHChangeRequest *)self photoLibrary];
        uint64_t v8 = [v7 pathManager];
        id v9 = [(PHChangeRequest *)self uuid];
        id v10 = [(id)v8 assetCreationHoldingDirectoryForAssetUUID:v9];

        id v18 = 0;
        LOBYTE(v8) = [MEMORY[0x1E4F8B908] createDirectoryAtPath:v10 error:&v18];
        id v11 = v18;
        if ((v8 & 1) != 0 || [MEMORY[0x1E4F8B908] isFileExistsError:v11])
        {
          objc_storeStrong((id *)&self->_resourceHoldingDirectoryPath, v10);
          id v12 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = *p_resourceHoldingDirectoryPath;
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v13;
            _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "PHAssetCreationRequest resolved resourceHoldingDirectoryPath: %@", buf, 0xCu);
          }
        }
        else
        {
          id v12 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = [(PHChangeRequest *)self uuid];
            uint64_t v15 = *p_resourceHoldingDirectoryPath;
            *(_DWORD *)buf = 138543874;
            uint64_t v21 = v14;
            __int16 v22 = 2112;
            uint64_t v23 = v15;
            __int16 v24 = 2112;
            id v25 = v11;
            _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Unable to create resource holding directory for %{public}@ at %@: %@", buf, 0x20u);
          }
        }
      }
      else
      {
        id v10 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v6;
          _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Error resolving resource holding directory path: %@", buf, 0xCu);
        }
      }
    }
  }
  resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;

  return resourceHoldingDirectoryPath;
}

- (PHAssetCreationRequest)initWithHelper:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHAssetCreationRequest;
  int v5 = [(PHAssetChangeRequest *)&v11 initWithHelper:v4];
  if (v5)
  {
    [v4 setNewRequest:1];
    int64_t v6 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"momentShare" changeRequestHelper:v4];
    momentShareHelper = v5->_momentShareHelper;
    v5->_momentShareHelper = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetResources = v5->_assetResources;
    v5->_assetResources = v8;

    v5->_uint64_t duplicateAssetPhotoLibraryType = 0;
    v5->_int64_t importedBy = 0;
    v5->_bundleScope = 0;
  }

  return v5;
}

- (id)initForNewObjectWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [[PHChangeRequestHelper alloc] initForNewObjectWithUUID:v4 changeRequest:self];

  int64_t v6 = [(PHAssetCreationRequest *)self initWithHelper:v5];
  return v6;
}

- (id)initForNewObject
{
  return [(PHAssetCreationRequest *)self initForNewObjectWithUUID:0];
}

- (id)_createAssetFromValidatedResources:(id)a3 withUUID:(id)a4 assetAlreadyExistsAsPlaceholder:(BOOL)a5 inPhotoLibrary:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v410 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v321 = [MEMORY[0x1E4F28B00] currentHandler];
    v322 = NSStringFromSelector(a2);
    [v321 handleFailureInMethod:a2, self, @"PHAssetCreationRequest.m", 3003, @"%@ can only be called from assetsd", v322 object file lineNumber description];
  }
  uint64_t v16 = [(PHAssetCreationRequest *)self syndicationIdentifier];

  if (!v16) {
    goto LABEL_18;
  }
  LOBYTE(v391[0]) = 0;
  uint64_t v17 = [(PHAssetCreationRequest *)self assetExistsWithSyndicationIdentifier];
  int v18 = [v17 BOOLValue];

  if (v18)
  {
    id v19 = [(PHChangeRequest *)self helper];
    id v20 = [v19 uuid];

    LOBYTE(v391[0]) = [(PHAssetCreationRequest *)self assetExistingWithSyndicationIdentifierIsTrashed];
    uint64_t v21 = PLSyndicationGetLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    __int16 v22 = [(PHAssetCreationRequest *)self syndicationIdentifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    uint64_t v23 = "assetExistsWithSyndicationIdentifier=YES (%{public}@), helper provided uuid %{public}@";
  }
  else
  {
    __int16 v24 = [(PHAssetCreationRequest *)self assetExistsWithSyndicationIdentifier];

    if (v24) {
      goto LABEL_18;
    }
    id v25 = [(PHAssetCreationRequest *)self syndicationIdentifier];
    id v20 = +[PHAssetCreationRequest _uuidForAssetWithSyndicationIdentifier:v25 inLibrary:v15 isTrashed:v391];

    uint64_t v21 = PLSyndicationGetLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    __int16 v22 = [(PHAssetCreationRequest *)self syndicationIdentifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    uint64_t v23 = "Check for existing asset with syndication identifier %{public}@ returned uuid %{public}@";
  }
  _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_INFO, v23, buf, 0x16u);

LABEL_11:
  if (v20)
  {
    id v26 = [MEMORY[0x1E4F8A950] assetWithUUID:v20 inLibrary:v15];
    if (LOBYTE(v391[0]) && ![(PHAssetCreationRequest *)self _unTrashAndResetAsset:v26])
    {
    }
    else if (v26)
    {
      [v26 syndicatedAssetDidSaveToUserLibrary];
      goto LABEL_375;
    }
  }
LABEL_18:
  BOOL v368 = v9;
  SEL v340 = a2;
  v347 = a7;
  v374 = v15;
  id v27 = v13;
  uint64_t v365 = [v27 mediaType];
  uint64_t v350 = [v27 mediaSubtype];
  long long v28 = [v27 primaryResource];
  uint64_t v29 = [(PHChangeRequest *)self helper];
  uint64_t v30 = [v29 clientAuthorization];
  int v367 = [v30 isCameraClient];

  id v31 = [(PHChangeRequest *)self helper];
  id v32 = [v31 clientAuthorization];
  char v33 = [v32 trustedCallerBundleID];
  int v334 = [v33 isEqualToString:@"com.apple.nebulad"];

  v359 = [v27 validatedDataForAssetResource:v28];
  uint64_t v34 = [v27 validatedURLForAssetResource:v28];
  __int16 v35 = [v28 creationOptions];
  v373 = v34;
  [v35 ensureOptionsAreCompleteForURL:v34];

  id v36 = [v28 creationOptions];
  uint64_t v37 = [v36 forcePairingIdentifier];
  forcePairingIdentifier = self->_forcePairingIdentifier;
  self->_forcePairingIdentifier = v37;

  if (self->_forcePairingIdentifier)
  {
    id v39 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      long long v40 = self->_forcePairingIdentifier;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_impl(&dword_19B043000, v39, OS_LOG_TYPE_DEFAULT, "forcing pairing identifier %@", buf, 0xCu);
    }
  }
  long long v41 = (void *)MEMORY[0x1E4F8CDF8];
  long long v42 = [v34 pathExtension];
  long long v43 = [v41 typeWithFilenameExtension:v42];

  long long v404 = xmmword_19B2CC6B0;
  objc_super v44 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions cameraMetadataPath];

  if (v44)
  {
    id v45 = objc_alloc(MEMORY[0x1E4F8A8A0]);
    v46 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions cameraMetadataPath];
    uint64_t v47 = (void *)[v45 initWithCameraMetadataPath:v46];

    [v47 deserializeCameraMetadata];
    v363 = v47;
    if ([v43 conformsToType:*MEMORY[0x1E4F44498]])
    {
      LODWORD(v44) = 0;
    }
    else
    {
      objc_super v44 = (void *)MEMORY[0x1E4F8CD68];
      CFDictionaryRef v48 = [v47 cameraMetadata];
      *(void *)&long long v404 = [v44 semanticEnhanceSceneForCameraMetadata:v48];
      *((void *)&v404 + 1) = v49;

      LODWORD(v44) = [MEMORY[0x1E4F8A890] semanticEnhanceSceneIsValid:(void)v404];
    }
  }
  else
  {
    v363 = 0;
  }
  v371 = v27;
  v358 = v43;
  if (![v43 conformsToType:*MEMORY[0x1E4F44450]]
    || self->_duplicateAssetPhotoLibraryType == 1)
  {
    int v342 = (int)v44;
    v364 = v14;
    uint64_t v403 = 0;
    int v338 = MEMORY[0x19F388B10]();
    long long v50 = PLBackendGetLog();
    os_signpost_id_t v51 = os_signpost_id_make_with_pointer(v50, self);
    v372 = v28;
    id v348 = v13;
    os_signpost_id_t spid = v51;
    v346 = v50;
    if (!v28)
    {
      long long v67 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions jobType];
      char v68 = [v67 isEqualToString:*MEMORY[0x1E4F8C9E0]];

      if ((v68 & 1) == 0)
      {
        id v70 = 0;
        v369 = 0;
        LOBYTE(v341) = 0;
        int v335 = 0;
        v353 = 0;
        id v357 = 0;
        id v88 = 0;
        BOOL v89 = 0;
        BOOL v345 = v365 == 1;
        BOOL v90 = v350 == 8;
        id v63 = 0;
        goto LABEL_231;
      }
      objc_super v69 = v374;
      id v70 = [(PHAssetCreationRequest *)self _createTimelapsePlaceholderAssetWithUUID:v14 InPhotoLibrary:v374];
      v353 = 0;
      id v357 = 0;
      int v335 = 0;
      LOBYTE(v341) = 0;
      v369 = 0;
      uint64_t v71 = 0;
      BOOL v72 = v70 != 0;
      id v63 = 0;
      uint64_t v73 = v365;
LABEL_214:
      BOOL v345 = v73 == 1;
      BOOL v90 = v350 == 8;
      if (v72 && v73 == 1 && v350 == 8)
      {
        id v390 = v71;
        v207 = v71;
        BOOL v208 = [(PHAssetCreationRequest *)self _createAssetAsPhotoIris:v70 fromValidatedResources:v27 mainFileMetadata:v63 error:&v390];
        id v88 = v390;

        if (!v208)
        {
          BOOL v89 = 0;
          BOOL v90 = 1;
          BOOL v345 = 1;
          goto LABEL_231;
        }
        v209 = v88;
      }
      else
      {
        if (!v72)
        {
          BOOL v89 = 0;
          id v88 = v71;
          goto LABEL_231;
        }
        v209 = v71;
      }
      if ([(PHAssetCreationRequest *)self _shouldCreateScreenshot]
        && [v70 kindSubtype] != 10)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Unable to create screenshot asset from available resources");
        id v88 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v89 = 0;
      }
      else
      {
        if ([v27 hasSpatialOverCapture])
        {
          v210 = v209;
          id v389 = v209;
          BOOL v89 = [(PHAssetCreationRequest *)self _createSocResourceForAsset:v70 fromValidatedResources:v27 photoLibrary:v69 error:&v389];
          id v88 = v389;

          if (!v89) {
            goto LABEL_231;
          }
          v209 = v88;
        }
        id v388 = v209;
        v211 = v209;
        BOOL v89 = [(PHAssetCreationRequest *)self _createXmpResourceForAsset:v70 fromValidatedResources:v27 photoLibrary:v69 error:&v388];
        id v88 = v388;

        if (v89)
        {
          id v387 = v88;
          BOOL v89 = [(PHAssetCreationRequest *)self _createAudioResourceForAsset:v70 fromValidatedResources:v27 photoLibrary:v69 error:&v387];
          id v212 = v387;

          id v88 = v212;
        }
      }
LABEL_231:
      if ([(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions candidateOptions])
      {
        v213 = [v70 additionalAttributes];
        objc_msgSend(v213, "setDeferredProcessingCandidateOptions:", -[PHAssetCreationCameraIngestOptions candidateOptions](self->_cameraIngestOptions, "candidateOptions"));
      }
      v362 = v63;
      if (!v89) {
        goto LABEL_240;
      }
      if ([v27 hasAdjustments])
      {
        BOOL v214 = v345;
        if (!v369) {
          BOOL v214 = 0;
        }
        if (v214 && v90)
        {
          objc_msgSend(v70, "setPlaybackStyle:", objc_msgSend(v369, "playbackStyle"));
          objc_msgSend(v70, "setPlaybackVariation:", objc_msgSend(v369, "playbackVariation"));
        }
        id v386 = v88;
        BOOL v89 = [(PHAssetCreationRequest *)self _createAssetAsAdjusted:v70 fromValidatedResources:v27 mainFileMetadata:v63 error:&v386];
        id v215 = v386;

        id v88 = v215;
LABEL_240:
        v216 = v372;
        goto LABEL_259;
      }
      v216 = v372;
      if ([v63 customRendered] != 9)
      {
        [v70 setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:v63];
LABEL_258:
        BOOL v89 = 1;
LABEL_259:
        v236 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions portraitEffectFilterName];

        id v13 = v348;
        if (!v236) {
          goto LABEL_265;
        }
        v237 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions portraitEffectFilterName];
        if (([v237 isEqualToString:@"CIPortraitEffectStageWhite"] & 1) == 0)
        {
          v238 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions portraitEffectFilterName];
          if (![v238 isEqualToString:@"CIPortraitEffectStageMonoV2"])
          {
            v250 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions portraitEffectFilterName];
            char v251 = [v250 isEqualToString:@"CIPortraitEffectStageV2"];

            v216 = v372;
            if ((v251 & 1) == 0)
            {
LABEL_265:
              if (v89)
              {
                uint64_t v239 = [v216 type];
                char v240 = v341 ^ 1;
                if (v239 != 19) {
                  char v240 = 1;
                }
                id v15 = v374;
                if (v240)
                {
                  id v366 = v353;
                  id v20 = v88;
                  v241 = v362;
LABEL_274:
                  v243 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions jobType];

                  if (v243)
                  {
                    v244 = PLPhotoKitIngestGetLog();
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v245 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions captureID];
                      v246 = (void *)v245;
                      if (v245) {
                        v247 = (__CFString *)v245;
                      }
                      else {
                        v247 = @"(unknown capture ID)";
                      }
                      v248 = [v366 lastPathComponent];
                      if (v248)
                      {
                        v249 = [v366 lastPathComponent];
                      }
                      else
                      {
                        v249 = &stru_1EEAC1950;
                      }
                      v256 = [v70 uuid];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v247;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v249;
                      *(_WORD *)&buf[22] = 2114;
                      *(void *)&buf[24] = v256;
                      _os_log_impl(&dword_19B043000, v244, OS_LOG_TYPE_DEFAULT, "PhotoKit Camera Ingest: %{public}@ Created asset %{public}@ with UUID %{public}@", buf, 0x20u);

                      if (v248) {
                      id v13 = v348;
                      }
                      id v15 = v374;
                      v241 = v362;
                    }
                  }
                  if (((v335 | v342) & ~[v371 hasCurrentAdjustment] & v367) == 1)
                  {
                    v257 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions previewImageData];
                    v258 = DCIM_newPLImageWithStoredJPEGData();

                    uint64_t v259 = v403;
                    v260 = [v15 libraryBundle];
                    v261 = [v260 timeZoneLookup];
                    [(PHAssetCreationRequest *)self _checkAndGenerateThumbnailsForAsset:v70 imageSource:v259 imageData:v357 previewImage:v258 thumbnailImage:0 timeZoneLookup:v261 resourceBag:v371];

                    id v15 = v374;
                  }
                  if (v345 && [v371 hasRAW])
                  {
                    id v382 = v20;
                    int v254 = [(PHAssetCreationRequest *)self _createRAWSidecarForAsset:v70 fromValidatedResources:v371 mainFileMetadata:v241 photoLibrary:v15 error:&v382];
                    id v262 = v382;

                    id v20 = v262;
                  }
                  else
                  {
                    int v254 = 1;
                  }
                  if (v254)
                  {
                    if (v363)
                    {
                      [v363 applyCameraMetadataToAsset:v70];
                      if (v338)
                      {
                        v263 = (void *)MEMORY[0x1E4F8A950];
                        uint64_t v264 = [v70 filename];
                        id v265 = v15;
                        v266 = (void *)v264;
                        v267 = [v263 diagnosticFilePathForLibrary:v265 mainFilename:v264 createIfNeeded:1];

                        v268 = [v267 stringByDeletingPathExtension];
                        uint64_t v269 = [v268 stringByAppendingPathExtension:*MEMORY[0x1E4F8C620]];

                        v270 = [MEMORY[0x1E4F8B908] fileManager];
                        v271 = [(PHAssetCreationRequest *)self cameraIngestOptions];
                        v272 = [v271 cameraMetadataPath];
                        id v381 = 0;
                        v354 = (void *)v269;
                        LOBYTE(v269) = [v270 copyItemAtPath:v272 toPath:v269 error:&v381];
                        id v273 = v381;

                        if ((v269 & 1) == 0)
                        {
                          v274 = PLPhotoKitIngestGetLog();
                          if (os_log_type_enabled(v274, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)&uint8_t buf[4] = v273;
                            _os_log_impl(&dword_19B043000, v274, OS_LOG_TYPE_ERROR, "Failed to copy MDATA file to CaptureDebug destination with error: %@", buf, 0xCu);
                          }
                        }
                        id v15 = v374;
                        v241 = v362;
                      }
                    }
                  }
                  BOOL v255 = v70 == 0;
                  if (v70 && ((v254 ^ 1) & 1) == 0)
                  {
                    id v275 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                    id v380 = v20;
                    int v254 = [MEMORY[0x1E4F8AB40] installInternalResourcesForExistingAsset:v70 assumeNoExistingResources:0 referencedResourceURLs:v275 error:&v380];
                    id v276 = v380;

                    id v20 = v276;
                  }
                  if (v369 && v254)
                  {
                    long long v378 = 0u;
                    long long v379 = 0u;
                    long long v376 = 0u;
                    long long v377 = 0u;
                    v277 = [v369 modernResources];
                    uint64_t v278 = [v277 countByEnumeratingWithState:&v376 objects:v405 count:16];
                    if (v278)
                    {
                      uint64_t v279 = v278;
                      uint64_t v280 = *(void *)v377;
                      do
                      {
                        for (uint64_t i = 0; i != v279; ++i)
                        {
                          if (*(void *)v377 != v280) {
                            objc_enumerationMutation(v277);
                          }
                          v282 = *(void **)(*((void *)&v376 + 1) + 8 * i);
                          if ([v282 supportsTrashedState]) {
                            objc_msgSend(v70, "setTrashedState:forResourceType:", objc_msgSend(v282, "trashedState"), objc_msgSend(v282, "cplType"));
                          }
                        }
                        uint64_t v279 = [v277 countByEnumeratingWithState:&v376 objects:v405 count:16];
                      }
                      while (v279);
                    }

                    if ([v369 cameraProcessingAdjustmentState]) {
                      objc_msgSend(v70, "setCameraProcessingAdjustmentState:", objc_msgSend(v70, "cameraProcessingAdjustmentState") | 1);
                    }
                    id v13 = v348;
                    id v15 = v374;
                    v241 = v362;
                    if (([v369 cameraProcessingAdjustmentState] & 4) != 0) {
                      objc_msgSend(v70, "setCameraProcessingAdjustmentState:", objc_msgSend(v70, "cameraProcessingAdjustmentState") | 4);
                    }
                    if (([v369 cameraProcessingAdjustmentState] & 8) != 0) {
                      objc_msgSend(v70, "setCameraProcessingAdjustmentState:", objc_msgSend(v70, "cameraProcessingAdjustmentState") | 8);
                    }
                    int v254 = 1;
                  }
LABEL_327:
                  objc_msgSend(v70, "setDeferredProcessingNeeded:", objc_msgSend(v70, "expectedDeferredProcessingNeededOnAssetCreation"));
                  if ([v70 deferredProcessingNeeded])
                  {
                    v283 = [v15 libraryServicesManager];
                    v284 = [v283 backgroundJobService];
                    [v284 signalBackgroundProcessingNeededOnLibrary:v15];
                  }
                  if (v254)
                  {
                    v285 = v346;
                    if (v367)
                    {
                      uint64_t v286 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions jobType];
                      if (v286)
                      {
                        v287 = (void *)v286;
                        v288 = [v241 smartStyleExpectingReversibility];
                        int v289 = [v288 BOOLValue];

                        if (v289) {
                          [v70 setIsSmartStyleableWithMetadata:v241];
                        }
                      }
                    }
                    [(PHAssetCreationRequest *)self _resetMovedFiles];
                    v290 = [(PHAssetCreationRequest *)self customAssetProperties];

                    if (v290)
                    {
                      v291 = [(PHAssetCreationRequest *)self customAssetProperties];
                      [v70 updateWithCustomAssetProperties:v291];
                    }
                    [v70 persistMetadataToFilesystem];
                    id v15 = v374;
                    if ([(PHChangeRequest *)self shouldPerformConcurrentWork]) {
                      [(PHAssetCreationRequest *)self _setupDerivativeCreationContextForAsset:v70 imageSource:v403 imageData:v357];
                    }
                    goto LABEL_350;
                  }
                  if (v255)
                  {
                    v285 = v346;
                    v292 = v347;
                    if (!v347)
                    {
LABEL_350:
                      v297 = v285;
                      v298 = v297;
                      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v297))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_19B043000, v298, OS_SIGNPOST_INTERVAL_END, spid, "Ingest-CreateAsset", "END: asset creation", buf, 2u);
                      }

                      v299 = [v15 libraryBundle];
                      [v299 touch];

                      if (v254)
                      {
                        if ([(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions isEligibleForQuickFaceAnalysis])
                        {
                          v300 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions deferredPhotoIdentifier];

                          v301 = [v15 libraryBundle];
                          v302 = [v301 constraintsDirector];
                          v303 = v302;
                          if (v300) {
                            [v302 informPhotoCapturedThatNeedsDeferredProcessing];
                          }
                          else {
                            [v302 informPhotoCapturedThatNeedsQuickFace];
                          }
                        }
                        v305 = [v70 additionalAttributes];
                        v306 = [v305 syndicationIdentifier];

                        if (v306) {
                          [v70 syndicatedAssetDidSaveToUserLibrary];
                        }
                        if (self->_resourceHoldingDirectoryPath)
                        {
                          v307 = [MEMORY[0x1E4F8B908] fileManager];
                          resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
                          id v375 = 0;
                          char v309 = [v307 removeItemAtPath:resourceHoldingDirectoryPath error:&v375];
                          id v310 = v375;

                          if ((v309 & 1) == 0)
                          {
                            v311 = PLPhotoKitGetLog();
                            if (os_log_type_enabled(v311, OS_LOG_TYPE_ERROR))
                            {
                              v312 = [v70 uuid];
                              *(_DWORD *)buf = 138412546;
                              *(void *)&uint8_t buf[4] = v312;
                              *(_WORD *)&buf[12] = 2112;
                              *(void *)&buf[14] = v310;
                              _os_log_impl(&dword_19B043000, v311, OS_LOG_TYPE_ERROR, "Unable to remove asset creation recovery directory for %@: %@", buf, 0x16u);
                            }
                          }
                        }
                        v313 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions jobType];
                        if (v313) {
                          int v314 = v367;
                        }
                        else {
                          int v314 = 0;
                        }

                        v304 = v70;
                        if (v314 == 1)
                        {
                          [(PHAssetCreationRequest *)self _removePhotoKitCameraIngestFiles:v70 originalFileURL:v373 resourceBag:v371];
                          v304 = v70;
                        }
                      }
                      else
                      {
                        v304 = 0;
                      }
                      id v26 = v304;

                      long long v28 = v372;
                      v91 = v363;
                      id v14 = v364;
                      uint64_t v74 = v366;
                      goto LABEL_374;
                    }
                  }
                  else
                  {
                    BOOL v293 = [(PHAssetCreationRequest *)self _restoreMovedFilesOnFailure];
                    if (v372 && v293)
                    {
                      v294 = [MEMORY[0x1E4F8A698] transactionReason:@"Unable to create asset from resources"];
                      [v70 deleteWithReason:v294];
                    }
                    else
                    {
                      v294 = PLPhotoKitGetLog();
                      if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                      {
                        id v295 = [(PHAssetCreationRequest *)self _movedFiles];
                        *(_DWORD *)buf = 138412546;
                        *(void *)&uint8_t buf[4] = v70;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v295;
                        _os_log_impl(&dword_19B043000, v294, OS_LOG_TYPE_ERROR, "Complete asset ingestion failed, but moved files could not be restored to their original location.  Leaving partially ingested asset %@ with orphaned supporting files %@.", buf, 0x16u);
                      }
                    }
                    v285 = v346;
                    v292 = v347;

                    id v70 = 0;
                    if (!v347) {
                      goto LABEL_350;
                    }
                  }
                  if (v20)
                  {
                    id *v292 = v20;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Unable to create asset from resources");
                    id v296 = objc_claimAutoreleasedReturnValue();
                    id *v292 = v296;
                  }
                  goto LABEL_350;
                }
                id v383 = v88;
                id v384 = v353;
                v241 = v362;
                BOOL v242 = +[PHAssetCreationRequest setDeferredIdentifierAndCreateDeferredDestinationURLFromCurrentDstURL:&v384 withMainFileMetadata:v362 managedAsset:v70 photoLibrary:v374 error:&v383];
                id v366 = v384;

                id v20 = v383;
                if (v242)
                {
                  if ([v362 isDeferredPhotoProxyExpectingDepth])
                  {
                    [v70 setDepthType:1];
                    [v70 setEditableDepthBadgeAttribute:1];
                  }
                  goto LABEL_274;
                }
                v252 = PLPhotoKitGetLog();
                if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
                {
                  id v253 = [v70 uuid];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v253;
                  _os_log_impl(&dword_19B043000, v252, OS_LOG_TYPE_ERROR, "Deferred identifier could not be created for asset with UUID: %@", buf, 0xCu);
                }
              }
              else
              {
                id v366 = v353;
                id v20 = v88;
                id v15 = v374;
                v241 = v362;
              }
              int v254 = 0;
              BOOL v255 = v70 == 0;
              goto LABEL_327;
            }
LABEL_264:
            [v70 setPlaybackStyle:1];
            [v70 setVideoCpVisibilityState:1];
            goto LABEL_265;
          }

          v216 = v372;
        }

        goto LABEL_264;
      }
      id v385 = 0;
      v217 = [v70 generatePortraitAdjustment:&v385];
      id v218 = v385;
      v219 = v218;
      if (v217)
      {
        id v351 = v218;
        uint64_t v220 = [v217 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
        v221 = [v217 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
        v222 = [v217 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
        v223 = [(PHAssetChangeRequest *)self editorBundleID];
        v224 = [v217 objectForKeyedSubscript:*MEMORY[0x1E4F8BA50]];
        uint64_t v225 = [v224 integerValue];

        v226 = (void *)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithFormatIdentifier:v220 formatVersion:v221 data:v222 baseVersion:v225 editorBundleID:v223 renderTypes:0];
        if (v226)
        {
          v227 = [v70 dateCreated];
          [v226 setAdjustmentTimestamp:v227];

          v228 = [MEMORY[0x1E4F8A678] assetAdjustmentOptionsForPortraitImportWithMainFileMetadata:v362];
          [v70 setAdjustments:v226 options:v228];

          [v70 setDeferredProcessingNeeded:2];
        }
        else
        {
          v235 = PLImportGetLog();
          if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v222;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v220;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v221;
            _os_log_impl(&dword_19B043000, v235, OS_LOG_TYPE_ERROR, "Unable to create adjustment info from adjustment data (%p), format identifier (%@) and format version (%@)", buf, 0x20u);
          }
        }
        v216 = v372;
        v219 = v351;
        v229 = v220;
      }
      else
      {
        if (!v218)
        {
LABEL_257:

          goto LABEL_258;
        }
        v229 = PLImportGetLog();
        if (os_log_type_enabled(v229, OS_LOG_TYPE_ERROR))
        {
          v230 = (void *)MEMORY[0x1E4F8B8F0];
          v231 = [v70 mainFileURL];
          id v232 = [v230 descriptionWithFileURL:v231];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v232;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v219;
          _os_log_impl(&dword_19B043000, v229, OS_LOG_TYPE_ERROR, "Unable to get adjustment info from original file '%@': %@", buf, 0x16u);
        }
      }

      goto LABEL_257;
    }
    os_signpost_id_t v52 = v51;
    uint64_t v53 = [v28 creationOptions];
    unsigned int v356 = [v53 shouldMoveFile];

    uint64_t v54 = [v28 creationOptions];
    int v360 = [v54 shouldIngestInPlace];

    unsigned int v331 = [(PHAssetCreationRequest *)self _savedAssetTypeForAsset];
    long long v55 = v50;
    uint64_t v56 = v55;
    unint64_t v57 = v52 - 1;
    os_signpost_id_t v58 = v52;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v52, "Ingest-Prepare", "START: file operation + metadata", buf, 2u);
    }

    if (!v373)
    {
      BOOL v66 = 0;
      v337 = 0;
      id v63 = 0;
      id v64 = 0;
      if (v359) {
        BOOL v75 = v365 == 1;
      }
      else {
        BOOL v75 = 0;
      }
      BOOL v65 = v75;
      if (!v65) {
        goto LABEL_36;
      }
      goto LABEL_50;
    }
    if (v360)
    {
      v352 = [v374 pathManager];
      uint64_t v59 = (void *)MEMORY[0x1E4F8B908];
      id v60 = [v352 capabilities];
      id v402 = 0;
      int v61 = [v59 ingestItemAtURL:v373 toURL:v373 type:0 options:3 capabilities:v60 error:&v402];
      id v62 = v402;

      id v63 = v373;
      id v64 = v62;
      unint64_t v57 = v52 - 1;
      BOOL v65 = v61;
      BOOL v66 = 0;
      v337 = 0;
      if (!v61)
      {
LABEL_36:
        if (!v64)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Unable to resolve primary resource");
          id v64 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v339 = v64;

LABEL_51:
        uint64_t v76 = v56;
        uint64_t v77 = v76;
        if (v57 > 0xFFFFFFFFFFFFFFFDLL)
        {

          id v79 = v77;
        }
        else
        {
          if (os_signpost_enabled(v76))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_19B043000, v77, OS_SIGNPOST_INTERVAL_END, v58, "Ingest-Prepare", "END: file operation + metadata", buf, 2u);
          }

          v78 = v77;
          if (os_signpost_enabled(v78))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_19B043000, v78, OS_SIGNPOST_INTERVAL_BEGIN, v58, "Ingest-CreateAsset", "START: asset creation", buf, 2u);
          }
        }

        uint64_t v80 = [v372 creationOptions];
        v344 = [v80 uniformTypeIdentifier];

        v353 = v63;
        if (!v65)
        {
          BOOL v72 = 0;
          id v70 = 0;
          id v357 = 0;
          id v63 = 0;
          uint64_t v85 = 0;
          int v335 = 0;
          LOBYTE(v341) = 0;
          uint64_t v86 = 0;
          objc_super v69 = v374;
          id v27 = v371;
          uint64_t v73 = v365;
LABEL_213:
          v369 = v86;

          uint64_t v71 = v339;
          goto LABEL_214;
        }
        objc_super v69 = v374;
        if (v63)
        {
          if ([v372 type] == 1 || objc_msgSend(v372, "type") == 19)
          {
            id v81 = objc_alloc(MEMORY[0x1E4F8CC48]);
            uint64_t v82 = [v374 libraryBundle];
            uint64_t v83 = [v82 timeZoneLookup];
            uint64_t v84 = [v81 initWithImageURL:v63 contentType:0 options:14 timeZoneLookup:v83 cacheImageSource:1 cacheImageData:1];
          }
          else
          {
            id v92 = objc_alloc(MEMORY[0x1E4F8CC48]);
            uint64_t v82 = [v374 libraryBundle];
            uint64_t v83 = [v82 timeZoneLookup];
            uint64_t v84 = [v92 initWithAVURL:v63 options:14 timeZoneLookup:v83];
          }
          id v63 = (id)v84;

          objc_super v69 = v374;
        }
        id v399 = 0;
        uint64_t v73 = v365;
        BOOL v93 = [(PHAssetCreationRequest *)self _assetAlreadyExistsAsPlaceholder:v368 mediaType:v365 uuid:v364 photoLibrary:v69 fetchAsset:&v399];
        id v94 = v399;
        id v333 = v94;
        if (v93)
        {
          uint64_t v85 = v94;
          v95 = v372;
          if (v94)
          {
            uint64_t v96 = [v94 bundleScope];
            id v398 = 0;
            [v85 setAttributesFromMainFileURL:v353 mainFileMetadata:v63 savedAssetType:v331 bundleScope:v96 isPlaceholder:0 placeholderFileURL:0 imageSource:&v403 imageData:&v398];
            id v357 = v398;
            id v70 = v85;
            id v27 = v371;
LABEL_81:
            if (v364)
            {
              v101 = [v70 uuid];
              char v102 = [v364 isEqualToString:v101];

              if ((v102 & 1) == 0)
              {
                v323 = [MEMORY[0x1E4F28B00] currentHandler];
                [v323 handleFailureInMethod:v340, self, @"PHAssetCreationRequest.m", 3198, @"Invalid parameter not satisfying: %@", @"[uuid isEqualToString:asset.uuid]" object file lineNumber description];
              }
            }
            v103 = [v70 additionalAttributes];
            v104 = [v95 creationOptions];
            CMTime v105 = [v104 alternateImportImageDate];
            [v103 setAlternateImportImageDate:v105];

            if (v63)
            {
              long long v106 = v374;
              uint64_t v73 = v365;
              if (([v63 photoProcessingFlags] & 0x1000) != 0)
              {
                int v341 = 1;
                if (([v63 photoCaptureFlags] & 0x4000000000) != 0) {
                  [v70 setSpatialType:1];
                }
              }
              else
              {
                int v341 = 0;
              }
            }
            else
            {
              int v341 = 0;
              long long v106 = v374;
              uint64_t v73 = v365;
            }
            v117 = [(PHAssetCreationRequest *)self importSessionID];

            if (v117)
            {
              v118 = [(PHAssetCreationRequest *)self importSessionID];
              [v70 setImportSessionAlbumWithImportSessionID:v118];
            }
            v119 = [(PHAssetCreationRequest *)self conversationID];

            if (v119)
            {
              v120 = [(PHAssetCreationRequest *)self conversationID];
              [v70 setConversationAlbumWithConversationID:v120];
            }
            v121 = [(PHAssetCreationRequest *)self syndicationIdentifier];

            if (v121)
            {
              v122 = [(PHAssetCreationRequest *)self syndicationIdentifier];
              v123 = [v70 additionalAttributes];
              [v123 setSyndicationIdentifier:v122];
            }
            v124 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions creationDate];

            if (v124)
            {
              v125 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions creationDate];
              [v70 setDateCreated:v125];
            }
            [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetHeight];
            if (v126 != 0.0)
            {
              [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetWidth];
              if (v127 != 0.0)
              {
                [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetHeight];
                [v70 setHeight:(uint64_t)v128];
                [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetWidth];
                [v70 setWidth:(uint64_t)v129];
              }
            }
            uint64_t v130 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions cameraMetadataPath];
            if (v130)
            {
              v131 = (void *)v130;
              int v132 = [MEMORY[0x1E4F8A890] semanticEnhanceSceneIsValid:(void)v404];

              if (v132) {
                [(PHAssetCreationRequest *)self _checkAndSetForSemanticEnhancementForAsset:v70 resourceBag:v27];
              }
            }
            if (![v70 kind]
              && [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions isExpectingPairedVideo])
            {
              [(PHAssetCreationRequest *)self _setupIrisPairingTimeoutForAsset:v70 imageFile:v373 library:v106];
            }
            v133 = [(PHAssetCreationRequest *)self cameraIngestOptions];
            uint64_t v134 = [v133 dbgFilePath];

            id v330 = (id)v134;
            if (v134) {
              int v135 = v338;
            }
            else {
              int v135 = 0;
            }
            if (v135 == 1)
            {
              v136 = [v70 filename];
              +[PHAssetCreationRequest setdbgFileWithAsset:v70 dbgFilePath:v330 photoFilename:v136];
            }
            v137 = [v95 creationOptions];
            objc_msgSend(v70, "setAvalanchePickType:", objc_msgSend(v137, "burstPickType"));

            v138 = [v95 creationOptions];
            v139 = [v138 originalFilename];
            if (v139)
            {
              id v332 = v139;

              v140 = v344;
            }
            else
            {
              id v141 = [v373 lastPathComponent];

              v140 = v344;
              id v332 = v141;
              if (!v141)
              {
                id v332 = 0;
LABEL_131:
                v143 = [v70 mainFileURL];
                uint64_t v144 = [v143 lastPathComponent];

                id v332 = (id)v144;
LABEL_132:
                if ((v367 & 1) == 0)
                {
                  v145 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions jobType];
                  char v146 = [v145 isEqualToString:*MEMORY[0x1E4F8C9D0]];

                  if ((v146 & 1) == 0) {
                    [v70 setOriginalFilename:v332];
                  }
                }
                if (v140) {
                  [v70 setUniformTypeIdentifier:v140];
                }
                v147 = PLPhotoKitGetLog();
                if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
                {
                  id v148 = [v70 uuid];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v148;
                  _os_log_impl(&dword_19B043000, v147, OS_LOG_TYPE_DEBUG, "Generating new thumbnails for asset with UUID %@", buf, 0xCu);
                }
                if (v73 == 2)
                {
                  if ([(PHChangeRequest *)self shouldPerformConcurrentWork])
                  {
                    id v328 = 0;
                    id v329 = 0;
                  }
                  else
                  {
                    v149 = [v353 path];
                    id v393 = 0;
                    id v392 = 0;
                    PLPreviewImageAndDurationForVideoAtPath();
                    id v329 = v393;
                    id v328 = v392;
                  }
                  v150 = [(PHAssetCreationRequest *)self duplicateAssetIdentifier];
                  if (v150)
                  {
                    v151 = +[PHObject uuidFromLocalIdentifier:v150];
                    uint64_t v86 = [MEMORY[0x1E4F8A950] assetWithUUID:v151 inLibrary:v106];
                    if (v86)
                    {
                      v152 = [v70 additionalAttributes];
                      [v86 additionalAttributes];
                      v154 = v153 = v86;
                      objc_msgSend(v152, "setCameraCaptureDevice:", objc_msgSend(v154, "cameraCaptureDevice"));

                      uint64_t v86 = v153;
                      uint64_t v73 = v365;
                      long long v106 = v374;
                    }
                  }
                  else
                  {
                    uint64_t v86 = 0;
                  }
                }
                else
                {
                  id v328 = 0;
                  id v329 = 0;
                  uint64_t v86 = 0;
                }
                uint64_t v155 = [(PHAssetCreationRequest *)self duplicateAssetIdentifier];
                v156 = (void *)v155;
                if (!v86 && v155)
                {
                  v157 = +[PHObject uuidFromLocalIdentifier:v155];
                  uint64_t v86 = [MEMORY[0x1E4F8A950] assetWithUUID:v157 inLibrary:v106];
                }
                if (v86)
                {
                  v158 = [v86 additionalAttributes];
                  [v158 setDestinationAssetCopyState:2];
                }
                id v361 = v63;
                if (self->_duplicateAssetPhotoLibraryType == 1)
                {
                  v159 = [v70 additionalAttributes];
                  [v159 setImportedBy:7];
                  [v159 setShareType:1];
                  if (!v86) {
                    goto LABEL_204;
                  }
                  v160 = [v86 additionalAttributes];
                  v161 = [v160 shareOriginator];
                  [v159 setShareOriginator:v161];
                }
                else
                {
                  v327 = v156;
                  v370 = v86;
                  __int16 v162 = [(PHAssetCreationRequest *)self importedBy];
                  v163 = [(PHChangeRequest *)self helper];
                  v164 = [v163 clientBundleIdentifier];

                  v165 = [(PHChangeRequest *)self helper];
                  uint64_t v166 = [v165 clientDisplayName];

                  if (v162) {
                    __int16 v167 = v162;
                  }
                  else {
                    __int16 v167 = 3;
                  }
                  if ([v164 hasPrefix:@"com.apple."])
                  {
                    if ((v367 | v334) == 1)
                    {
                      v168 = [(PHAssetCreationRequest *)self cameraIngestOptions];
                      if ([v168 isRearFacingCamera]) {
                        __int16 v167 = 1;
                      }
                      else {
                        __int16 v167 = 2;
                      }
                    }
                    else if (v167 == 3)
                    {
                      __int16 v167 = 8;
                    }
                    else if (v167 == 6)
                    {
                      __int16 v167 = 9;
                    }
                  }
                  v343 = v164;
                  if ([v164 length])
                  {
                    v170 = [(PHChangeRequest *)self helper];
                    int v171 = [v170 isClientInLimitedLibraryMode];

                    if (v171)
                    {
                      v172 = [(PHChangeRequest *)self helper];
                      v173 = [v172 fetchFilterIdentifier];

                      memset(buf, 0, 32);
                      v174 = [(PHChangeRequest *)self helper];
                      v175 = [v174 clientAuthorization];
                      v176 = v175;
                      if (v175) {
                        [v175 clientAuditToken];
                      }
                      else {
                        memset(buf, 0, 32);
                      }

                      v177 = (void *)MEMORY[0x1E4F8A910];
                      v178 = [v374 managedObjectContext];
                      v391[0] = *(_OWORD *)buf;
                      v391[1] = *(_OWORD *)&buf[16];
                      v179 = [v177 fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:v173 auditToken:v391 inManagedObjectContext:v178];

                      v180 = [(PHChangeRequest *)self uuid];
                      v408 = v180;
                      v181 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v408 count:1];
                      [v179 addAssetsWithUUIDs:v181];

                      v182 = [v179 objectID];
                      [(PHAssetCreationRequest *)self _setLimitedLibraryFetchFilterObjectID:v182];
                    }
                  }
                  v183 = [v70 additionalAttributes];
                  [v183 setImportedBy:v167];

                  if ([(NSString *)self->_importedByBundleIdentifier length])
                  {
                    importedByBundleIdentifier = self->_importedByBundleIdentifier;
                    v185 = [v70 additionalAttributes];
                    [v185 setImportedByBundleIdentifier:importedByBundleIdentifier];

                    v164 = self->_importedByBundleIdentifier;
                    uint64_t v186 = (uint64_t)v344;
                  }
                  else
                  {
                    uint64_t v186 = (uint64_t)v344;
                    if ([v164 length])
                    {
                      v233 = [v70 additionalAttributes];
                      [v233 setImportedByBundleIdentifier:v164];

                      if ([MEMORY[0x1E4F8A670] shouldPersistImportedByDisplayName:v166])
                      {
                        v234 = [v70 additionalAttributes];
                        [v234 setImportedByDisplayName:v166];
                      }
                    }
                    else
                    {
                      v164 = (void *)*MEMORY[0x1E4F8BB68];
                    }
                  }
                  id v187 = v164;
                  uint64_t v188 = *MEMORY[0x1E4F8BB38];
                  v407[0] = v187;
                  uint64_t v189 = *MEMORY[0x1E4F8BB58];
                  v406[0] = v188;
                  v406[1] = v189;
                  uint64_t v190 = v186;
                  if (!v186)
                  {
                    uint64_t v190 = [MEMORY[0x1E4F1CA98] null];
                  }
                  id v326 = v187;
                  v325 = (void *)v190;
                  v407[1] = v190;
                  v406[2] = *MEMORY[0x1E4F8BB50];
                  uint64_t v191 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v70, "originalFilesize"));
                  v192 = (void *)v191;
                  if (!v191)
                  {
                    uint64_t v191 = [MEMORY[0x1E4F1CA98] null];
                  }
                  v336 = (void *)v166;
                  v193 = (void *)v191;
                  v407[2] = v191;
                  v406[3] = *MEMORY[0x1E4F8BB48];
                  v194 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v70, "width"));
                  v195 = v194;
                  if (!v194)
                  {
                    v195 = [MEMORY[0x1E4F1CA98] null];
                  }
                  v407[3] = v195;
                  v406[4] = *MEMORY[0x1E4F8BB40];
                  v196 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v70, "height"));
                  v197 = v196;
                  if (!v196)
                  {
                    v197 = [MEMORY[0x1E4F1CA98] null];
                  }
                  v407[4] = v197;
                  v198 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v407 forKeys:v406 count:5];
                  PLSendCoreAnalyticEvent();

                  if (!v196) {
                  uint64_t v86 = v370;
                  }
                  if (!v194) {

                  }
                  id v27 = v371;
                  if (!v192) {

                  }
                  uint64_t v73 = v365;
                  v159 = v343;
                  if (!v344) {

                  }
                  v161 = v326;
                  v156 = v327;
                  v160 = v336;
                }

LABEL_204:
                int v199 = [MEMORY[0x1E4F8A890] semanticEnhanceSceneIsValid:(void)v404];
                int v200 = [v27 hasCurrentAdjustment];
                int v342 = v199;
                v201 = v156;
                if (v367)
                {
                  if (((v200 | v341 | v199) & 1) == 0)
                  {
LABEL_206:
                    uint64_t v202 = v403;
                    v203 = [v374 libraryBundle];
                    v204 = [v203 timeZoneLookup];
                    [(PHAssetCreationRequest *)self _checkAndGenerateThumbnailsForAsset:v70 imageSource:v202 imageData:v357 previewImage:v329 thumbnailImage:v328 timeZoneLookup:v204 resourceBag:v27];

                    uint64_t v73 = v365;
                    int v335 = 0;
LABEL_209:
                    uint64_t v85 = v333;
                    v205 = PLPhotoKitGetLog();
                    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
                    {
                      id v206 = [v70 uuid];
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v70;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v206;
                      _os_log_impl(&dword_19B043000, v205, OS_LOG_TYPE_DEFAULT, "Created asset %@ uuid %{public}@ from valid resources ", buf, 0x16u);

                      uint64_t v85 = v333;
                    }

                    BOOL v72 = 1;
                    id v107 = v330;
                    id v63 = v361;
                    objc_super v69 = v374;
                    goto LABEL_212;
                  }
                }
                else if ((v200 & 1) == 0)
                {
                  goto LABEL_206;
                }
                int v335 = v367 & v341;
                goto LABEL_209;
              }
            }
            if (!self->_shouldUseAutomaticallyGeneratedOriginalFilename) {
              goto LABEL_132;
            }
            goto LABEL_131;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Expected to find an existing placeholder asset in the library for uuid '%@'", v364);
          id v70 = (id)objc_claimAutoreleasedReturnValue();

          id v357 = 0;
          id v27 = v371;
LABEL_92:
          if (v70)
          {
            id v107 = v70;
            BOOL v72 = 0;
            id v70 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Unable to create asset from primary resource");
            id v107 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v72 = 0;
          }
          int v335 = 0;
          LOBYTE(v341) = 0;
          uint64_t v86 = 0;
          id v339 = v107;
LABEL_212:

          goto LABEL_213;
        }
        v95 = v372;
        if (v66)
        {
          uint64_t v97 = (void *)MEMORY[0x1E4F8A950];
          uint64_t v98 = [(PHAssetCreationRequest *)self bundleScope];
          id v397 = 0;
          LOWORD(v324) = 257;
          objc_msgSend(v97, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v69, v337, v63, v331, v98, v364, 0, &v403, &v397, v324);
          id v70 = (id)objc_claimAutoreleasedReturnValue();
          id v357 = v397;
          [v70 setAttributesFromMainFileURL:v337 mainFileMetadata:v63 savedAssetType:v331 bundleScope:0 isPlaceholder:1 placeholderFileURL:v353 imageSource:0 imageData:0];
        }
        else
        {
          if (!v353)
          {
            id v395 = v63;
            id v394 = 0;
            id v27 = v371;
            id v70 = [(PHAssetCreationRequest *)self _managedAssetFromPrimaryResourceData:v372 validatedResources:v371 withUUID:v364 photoLibrary:v69 mainFileMetadata:&v395 getImageSource:&v403 imageData:&v394];
            id v142 = v395;

            id v357 = v394;
            id v63 = v142;
            goto LABEL_80;
          }
          uint64_t v99 = (void *)MEMORY[0x1E4F8A950];
          uint64_t v100 = [(PHAssetCreationRequest *)self bundleScope];
          id v396 = 0;
          BYTE1(v324) = (v356 | v360) ^ 1;
          LOBYTE(v324) = 0;
          objc_msgSend(v99, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v69, v353, v63, v331, v100, v364, 0, &v403, &v396, v324);
          id v70 = (id)objc_claimAutoreleasedReturnValue();
          id v357 = v396;
        }
        id v27 = v371;
LABEL_80:
        uint64_t v85 = v333;
        if (v70) {
          goto LABEL_81;
        }
        id v70 = v339;
        goto LABEL_92;
      }
LABEL_50:
      id v339 = v64;
      goto LABEL_51;
    }
    if (v365 != 1) {
      goto LABEL_170;
    }
    if ([v27 hasCurrentAdjustment])
    {
      uint64_t v87 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions deferredPhotoIdentifier];
      if (v87)
      {

        goto LABEL_97;
      }
      if ((v342 & 1) == 0)
      {
LABEL_170:
        id v400 = 0;
        id v63 = [(PHAssetCreationRequest *)self _secureMove:v356 assetResource:v28 photoLibrary:v374 error:&v400];
        id v64 = v400;
        BOOL v66 = 0;
        v337 = 0;
        BOOL v65 = v63 != 0;
        if (!v63) {
          goto LABEL_36;
        }
        goto LABEL_50;
      }
    }
    else if (!v342)
    {
      goto LABEL_170;
    }
LABEL_97:
    long long v108 = [v374 libraryServicesManager];
    long long v109 = [v108 imageWriter];
    objc_super v110 = [v373 pathExtension];
    v111 = [v110 uppercaseString];
    uint64_t v112 = [v109 cameraAssetPathForNewAssetWithExtension:v111 assetUUID:v364];

    uint64_t v113 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v112];
    id v63 = [MEMORY[0x1E4F8AA78] deferredPhotoPreviewDestinationURLForPrimaryAssetURL:v113];
    v337 = (void *)v113;
    if (!v342) {
      goto LABEL_381;
    }
    BOOL v114 = [(PHAssetCreationRequest *)self _setupSemanticEnhanceMetadataIfNeededWithDestinationURL:v113 photoLibrary:v374 semanticEnhanceResult:&v404 ingestJobCameraMetadata:v363];
    v115 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions deferredPhotoIdentifier];

    if (v115 || !v114)
    {
      v169 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions deferredPhotoIdentifier];
      if (v169) {
        LOBYTE(v114) = 1;
      }

      if (v114)
      {
LABEL_381:
        id v401 = 0;
        char v316 = [MEMORY[0x1E4F8B908] copyItemAtURL:v373 toURL:v63 error:&v401];
        id v317 = v401;
        if (v316)
        {
          BOOL v66 = v337 != 0;
          BOOL v65 = 1;
        }
        else
        {
          v318 = PLPhotoKitIngestGetLog();
          if (os_log_type_enabled(v318, OS_LOG_TYPE_ERROR))
          {
            v319 = [v373 path];
            [v63 path];
            v320 = id v355 = v63;
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v319;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v320;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v317;
            _os_log_impl(&dword_19B043000, v318, OS_LOG_TYPE_ERROR, "Failed to copy file from %@ to %@ with error: %@", buf, 0x20u);

            id v63 = v355;
          }

          BOOL v66 = 0;
          BOOL v65 = 0;
        }

        id v64 = 0;
        if (!v65) {
          goto LABEL_36;
        }
        goto LABEL_50;
      }
      id v116 = v337;

      v337 = 0;
      id v63 = v116;
    }
    else
    {
      id v116 = [MEMORY[0x1E4F8A890] semanticEnhancePreviewDestinationURLForPrimaryAssetURL:v337];
    }

    id v63 = v116;
    goto LABEL_381;
  }
  if (v347)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Importing PDF types is not supported.");
    uint64_t v74 = 0;
    v369 = 0;
    id v70 = 0;
    id v20 = 0;
    id v26 = 0;
    id *v347 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v74 = 0;
    v369 = 0;
    id v70 = 0;
    id v20 = 0;
    id v26 = 0;
  }
  id v15 = v374;
  v91 = v363;
LABEL_374:

LABEL_375:

  return v26;
}

- (BOOL)_unTrashAndResetAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 metadataFromMediaPropertiesOrOriginalResource];
  if (v5)
  {
    [v4 unTrash];
    [v4 revertToOriginal];
    int64_t v6 = [(PHAssetCreationRequest *)self importSessionID];
    [v4 setImportSessionAlbumWithImportSessionID:v6];

    [v4 setDateCreated:0];
    uint64_t v7 = [v4 additionalAttributes];
    [v7 setTimeZoneName:0];

    uint64_t v8 = [v4 additionalAttributes];
    [v8 setTimeZoneOffset:0];

    [v4 setTitle:0];
    [v4 setLongDescription:0];
    [v4 setLocation:0];
    BOOL v9 = [v4 additionalAttributes];
    [v9 setKeywords:0];

    id v10 = [v4 filename];
    objc_super v11 = [v4 directory];
    id v12 = [v4 additionalAttributes];
    id v13 = [v12 originalFilename];

    objc_msgSend(v4, "setAttributesFromMainFileURL:mainFileMetadata:savedAssetType:bundleScope:isPlaceholder:placeholderFileURL:imageSource:imageData:", 0, v5, objc_msgSend(v4, "savedAssetType"), objc_msgSend(v4, "bundleScope"), 0, 0, 0, 0);
    [v4 setFilename:v10];
    [v4 setDirectory:v11];
    id v14 = [v4 additionalAttributes];
    [v14 setOriginalFilename:v13];
  }
  else
  {
    id v15 = PLSyndicationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v4 uuid];
      uint64_t v17 = [(PHAssetCreationRequest *)self syndicationIdentifier];
      *(_DWORD *)buf = 138412546;
      id v20 = v16;
      __int16 v21 = 2112;
      __int16 v22 = v17;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Found existing trashed asset (%@) with same syndication id (%@), but it is missing both media metadata and original", buf, 0x16u);
    }
    [v4 expunge];
  }

  return v5 != 0;
}

- (void)didSendChangeToServiceHandlerWithResult:(BOOL)a3
{
  if (self->_fileCoordinator)
  {
    id v4 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEBUG, "[AssetCreationRecovery] Closing asset creation indicator file", v5, 2u);
    }

    [(PLIndicatorFileCoordinator *)self->_fileCoordinator setCreatingAssetIsBusy:0];
  }
}

- (void)_setCreatingAssetIsBusy:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHAssetCreationRequest *)self _resolveResourceHoldingDirectoryPath];

  if (v5)
  {
    fileCoordinator = self->_fileCoordinator;
    if (!fileCoordinator)
    {
      uint64_t v7 = (PLIndicatorFileCoordinator *)[objc_alloc(MEMORY[0x1E4F8A898]) initWithResourceHoldingDirectoryPath:self->_resourceHoldingDirectoryPath];
      uint64_t v8 = self->_fileCoordinator;
      self->_fileCoordinator = v7;

      fileCoordinator = self->_fileCoordinator;
    }
    [(PLIndicatorFileCoordinator *)fileCoordinator setCreatingAssetIsBusy:v3];
  }
  else
  {
    BOOL v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_FAULT, "[AssetCreationRecovery] Could not resolve resource holding directory path and unable to write out indicator file", v10, 2u);
    }
  }
}

- (id)createAssetFromValidatedResources:(id)a3 withUUID:(id)a4 assetAlreadyExistsAsPlaceholder:(BOOL)a5 inPhotoLibrary:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = [v15 libraryServicesManager];
  if (!v16)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PHAssetCreationRequest.m", 2912, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];
  }
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__14582;
  long long v41 = __Block_byref_object_dispose__14583;
  id v42 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__14582;
  __int16 v35 = __Block_byref_object_dispose__14583;
  id v36 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __122__PHAssetCreationRequest_createAssetFromValidatedResources_withUUID_assetAlreadyExistsAsPlaceholder_inPhotoLibrary_error___block_invoke;
  v24[3] = &unk_1E58442F0;
  long long v28 = &v37;
  v24[4] = self;
  id v17 = v13;
  id v25 = v17;
  id v18 = v14;
  id v26 = v18;
  BOOL v30 = a5;
  id v19 = v15;
  id v27 = v19;
  uint64_t v29 = &v31;
  [v16 performBlockWithImportMutex:v24];
  if (a7)
  {
    id v20 = (void *)v32[5];
    if (v20) {
      *a7 = v20;
    }
  }
  id v21 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

void __122__PHAssetCreationRequest_createAssetFromValidatedResources_withUUID_assetAlreadyExistsAsPlaceholder_inPhotoLibrary_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v2 _createAssetFromValidatedResources:v3 withUUID:v4 assetAlreadyExistsAsPlaceholder:v5 inPhotoLibrary:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)finalizeRequestWithBatchSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PLBackendGetLog();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  uint64_t v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Ingest-FinalizeRequest", "START: finalize thumbnails", (uint8_t *)&v31, 2u);
  }

  if (!v3)
  {
    uint64_t v23 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136315138;
      id v32 = "-[PHAssetCreationRequest finalizeRequestWithBatchSuccess:]";
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "%s: Creation request failed. Clean up installed files", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_17;
  }
  derivativeContext = self->_derivativeContext;
  if (derivativeContext)
  {
    if (![(PHAssetCreationDerivativeContext *)derivativeContext thumbnailWriteSucceeded])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28D60]);
      objc_super v11 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext asset];
      id v12 = objc_msgSend(v10, "initWithIndex:", objc_msgSend(v11, "effectiveThumbnailIndex"));

      id v13 = (void *)MEMORY[0x1E4F8AC40];
      id v14 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext asset];
      id v15 = [v14 photoLibrary];
      [v13 recycleThumbnailIndexes:v12 inLibrary:v15];

      uint64_t v16 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext asset];
      [v16 setEffectiveThumbnailIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    if ([(PHAssetCreationDerivativeContext *)self->_derivativeContext assetKind] == 1)
    {
      id v17 = (void *)MEMORY[0x1E4F8AB40];
      id v18 = [MEMORY[0x1E4F8AB50] recipeFromID:65741];
      id v19 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext asset];
      if ([v19 hasAdjustments]) {
        uint64_t v20 = 2;
      }
      else {
        uint64_t v20 = 0;
      }
      id v21 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext asset];
      id v22 = (id)objc_msgSend(v17, "onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:", v18, v20, v21);
    }
    uint64_t v23 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext originalHash];
    if (v23)
    {
      __int16 v24 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext asset];
      id v25 = [v24 additionalAttributes];
      [v25 setOriginalHash:v23];

      id v26 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext asset];
      id v27 = [v26 additionalAttributes];
      long long v28 = [v23 base64EncodedStringWithOptions:0];
      [v27 setOriginalStableHash:v28];
    }
LABEL_17:
  }
  uint64_t v29 = v8;
  BOOL v30 = v29;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v30, OS_SIGNPOST_INTERVAL_END, v6, "Ingest-FinalizeRequest", "END: finalize thumbnails", (uint8_t *)&v31, 2u);
  }
}

- (void)performConcurrentWork
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PLBackendGetLog();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  uint64_t v5 = v3;
  os_signpost_id_t v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Ingest-ConcurrentWork", "START: concurrent work", buf, 2u);
  }

  int v8 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext assetKind];
  if (v8 == 1)
  {
    unint64_t v41 = v4 - 1;
    os_signpost_id_t v42 = v4;
    id v12 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext pathForOriginalFile];
    uint64_t v20 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext fullsizeRenderVideoPath];

    if (v20)
    {
      uint64_t v21 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext fullsizeRenderVideoPath];

      id v12 = (void *)v21;
    }
    PLPreviewImageAndDurationForVideoAtPath();
    uint64_t v9 = (CGImageSource *)0;
    id v22 = 0;
    id v19 = 0;
    id v18 = 0;
    goto LABEL_18;
  }
  if (v8)
  {
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = [(PHAssetCreationRequest *)self _imageSourceForDerivatives];
  size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v9);
  if (!v9)
  {
LABEL_13:
    id v22 = 0;
    id v18 = 0;
    id v19 = 0;
    goto LABEL_23;
  }
  size_t v11 = PrimaryImageIndex;
  unint64_t v41 = v4 - 1;
  os_signpost_id_t v42 = v4;
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setImageData:0];
  id v12 = +[PHAssetCreationRequest _imageIOThumbnailCreationOptionsFromDerivativeContext:self->_derivativeContext];
  id v13 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v14 = (void *)*MEMORY[0x1E4F44410];
  id v15 = [(id)*MEMORY[0x1E4F44410] identifier];
  uint64_t v16 = CGImageDestinationCreateWithData(v13, v15, 1uLL, 0);

  CGImageDestinationAddImageFromSource(v16, v9, v11, (CFDictionaryRef)v12);
  BOOL v17 = CGImageDestinationFinalize(v16);
  CFRelease(v16);
  if (v17)
  {
    id v18 = v13;
    id v19 = [v14 identifier];
    uint64_t v9 = (CGImageSource *)DCIM_newPLImageWithData();
  }
  else
  {
    uint64_t v23 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v44 = "-[PHAssetCreationRequest performConcurrentWork]";
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "%s failed to write preview image", buf, 0xCu);
    }

    id v19 = 0;
    id v18 = 0;
    uint64_t v9 = 0;
  }

  id v22 = 0;
LABEL_18:

  if (v9)
  {
    long long v40 = v6;
    int64_t v37 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext nextAvailableThumbnailIndex];
    id v24 = objc_alloc(MEMORY[0x1E4F8A878]);
    id v25 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext auxiliaryImageRecords];
    id v38 = v18;
    uint64_t v39 = v19;
    id v26 = (void *)[v24 initWithPLImage:v9 backingData:v18 uniformTypeIdentifier:v19 auxiliaryImageRecords:v25];

    id v27 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext thumbnailManager];
    long long v28 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext thumbnailIdentifier];
    uint64_t v29 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext assetUUID];
    id v30 = v22;
    uint64_t v31 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext assetKind];
    id v32 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext assetExtension];
    uint64_t v33 = v31;
    id v22 = v30;
    -[PHAssetCreationDerivativeContext setThumbnailWriteSucceeded:](self->_derivativeContext, "setThumbnailWriteSucceeded:", [v27 setThumbnailsForThumbIdentifier:v28 thumbnailIndex:v37 assetUUID:v29 kind:v33 extension:v32 withImage:v26]);

    if ([(PHAssetCreationDerivativeContext *)self->_derivativeContext assetKind] == 1)
    {
      uint64_t v34 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext pathForVideoPreviewFile];
      PLWriteImageWithEmbeddedThumbnailToPath();
    }
    unint64_t v7 = v41;
    os_signpost_id_t v4 = v42;
    id v19 = v39;
    os_signpost_id_t v6 = v40;
    id v18 = v38;
  }
  else
  {
    unint64_t v7 = v41;
    os_signpost_id_t v4 = v42;
  }
LABEL_23:
  __int16 v35 = v6;
  id v36 = v35;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v36, OS_SIGNPOST_INTERVAL_END, v4, "Ingest-ConcurrentWork", "END: concurrent work", buf, 2u);
  }
}

- (CGImageSource)_imageSourceForDerivatives
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext imageData];
  os_signpost_id_t v4 = (void *)MEMORY[0x1E4F8CDF8];
  uint64_t v5 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext originalUTI];
  os_signpost_id_t v6 = [v4 typeWithIdentifier:v5];

  unint64_t v7 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext fullsizeRenderImagePath];

  if (v7)
  {
    int v8 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v9 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext fullsizeRenderImagePath];
    id v19 = 0;
    uint64_t v10 = [v8 dataWithContentsOfFile:v9 options:1 error:&v19];
    id v11 = v19;

    if (v10) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 0;
    }
    if (!v12)
    {
      id v13 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = [(PHAssetCreationDerivativeContext *)self->_derivativeContext fullsizeRenderImagePath];
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "Failed to read data from %@ (%@)", buf, 0x16u);
      }
    }

    BOOL v3 = (void *)v10;
  }
  else if ([v6 conformsToType:*MEMORY[0x1E4F44498]])
  {
    uint64_t v15 = +[PHAssetCreationRequest _jpegDataFromRAWData:v3 derivativeContext:self->_derivativeContext];

    BOOL v3 = (void *)v15;
  }
  if (v3 && [v3 length])
  {
    CGImageSourceRef v16 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
    BOOL v17 = v16;
    if (v16) {
      CFAutorelease(v16);
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_setupDerivativeCreationContextForAsset:(id)a3 imageSource:(CGImageSource *)a4 imageData:(id)a5
{
  id v34 = a3;
  id v8 = a5;
  if ([v34 hasAllThumbs])
  {
    uint64_t v9 = [v34 photoLibrary];
    uint64_t v10 = [v9 thumbnailManager];
    id v11 = [v34 thumbnailIdentifier];
    uint64_t v12 = [v34 effectiveThumbnailIndex];
    id v13 = [v34 uuid];
    [v10 deleteThumbnailsWithIdentifier:v11 orIndex:v12 uuid:v13];
  }
  id v14 = objc_alloc_init(PHAssetCreationDerivativeContext);
  derivativeContext = self->_derivativeContext;
  self->_derivativeContext = v14;

  CGImageSourceRef v16 = (void *)MEMORY[0x1E4F8AC40];
  BOOL v17 = [v34 photoLibrary];
  -[PHAssetCreationDerivativeContext setNextAvailableThumbnailIndex:](self->_derivativeContext, "setNextAvailableThumbnailIndex:", [v16 nextAvailableThumbnailIndexInLibrary:v17]);

  objc_msgSend(v34, "setEffectiveThumbnailIndex:", -[PHAssetCreationDerivativeContext nextAvailableThumbnailIndex](self->_derivativeContext, "nextAvailableThumbnailIndex"));
  id v18 = [v34 photoLibrary];
  id v19 = [v18 thumbnailManager];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setThumbnailManager:v19];

  uint64_t v20 = [v34 thumbnailIdentifier];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setThumbnailIdentifier:v20];

  uint64_t v21 = [v34 fileURLForThumbnailFile];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setFileURLForThumbnailFile:v21];

  __int16 v22 = [(PHAssetResourceBag *)self->_assetResourceBag assetResourceWithType:5];

  if (v22)
  {
    id v23 = [v34 pathForFullsizeRenderImageFile];
    [(PHAssetCreationDerivativeContext *)self->_derivativeContext setFullsizeRenderImagePath:v23];
  }
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setAsset:v34];
  uint64_t v24 = [v34 uuid];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setAssetUUID:v24];

  -[PHAssetCreationDerivativeContext setAssetKind:](self->_derivativeContext, "setAssetKind:", [v34 kind]);
  id v25 = [v34 pathForOriginalFile];
  id v26 = [v25 pathExtension];
  id v27 = [v26 uppercaseString];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setAssetExtension:v27];

  long long v28 = [v34 originalUniformTypeIdentifier];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setOriginalUTI:v28];

  -[PHAssetCreationDerivativeContext setAssetOrientation:](self->_derivativeContext, "setAssetOrientation:", (int)[v34 orientation]);
  [v34 imageSize];
  -[PHAssetCreationDerivativeContext setAssetOrientedImageSize:](self->_derivativeContext, "setAssetOrientedImageSize:");
  -[PHAssetCreationDerivativeContext setEmbeddedThumbnailSize:](self->_derivativeContext, "setEmbeddedThumbnailSize:", (double)(int)[v34 embeddedThumbnailWidth], (double)(int)objc_msgSend(v34, "embeddedThumbnailHeight"));
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setImageData:v8];

  uint64_t v29 = [v34 pathForOriginalFile];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setPathForOriginalFile:v29];

  id v30 = [v34 pathForVideoPreviewFile];
  [(PHAssetCreationDerivativeContext *)self->_derivativeContext setPathForVideoPreviewFile:v30];

  uint64_t v31 = [(PHAssetResourceBag *)self->_assetResourceBag assetResourceWithType:6];

  if (v31)
  {
    id v32 = [v34 pathForFullsizeRenderVideoFile];
    [(PHAssetCreationDerivativeContext *)self->_derivativeContext setFullsizeRenderVideoPath:v32];
  }
  if (!v8)
  {
    uint64_t v33 = [MEMORY[0x1E4F8CC38] auxiliaryImageRecordsToPreserveForDerivativesFromPrimaryImageInImageSource:a4];
    [(PHAssetCreationDerivativeContext *)self->_derivativeContext setAuxiliaryImageRecords:v33];
  }
}

- (id)_createAssetAdjustmentsFromBackupWithAsset:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetWidth];
  double v8 = v7;
  [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetHeight];
  BOOL v10 = v8 != 0.0;
  BOOL v11 = v9 != 0.0;
  if (v10 && v11) {
    double v12 = v9;
  }
  else {
    double v12 = v6;
  }
  if (!v10 || !v11) {
    double v8 = v5;
  }
  if (v5 == v8 && v6 == v12)
  {
    double v12 = 0.0;
    double v8 = 0.0;
    if ([v4 originalWidth] >= 1) {
      double v8 = (double)(unint64_t)[v4 originalWidth];
    }
    if ([v4 originalHeight] >= 1) {
      double v12 = (double)(unint64_t)[v4 originalHeight];
    }
  }
  int v14 = [v4 orientation];
  if (v4) {
    [v4 photoIrisVideoDuration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  uint64_t v15 = [MEMORY[0x1E4F8AA48] exportPropertiesWithImageWidth:(unint64_t)v8 imageHeight:(unint64_t)v12 exifOrientation:v14 duration:CMTimeGetSeconds(&time)];
  CGImageSourceRef v16 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions cameraMetadataPath];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F8A8A0]);
    id v18 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions cameraMetadataPath];
    CGImageSourceRef v16 = (void *)[v17 initWithCameraMetadataPath:v18];

    [v16 deserializeCameraMetadata];
  }
  id v19 = (void *)MEMORY[0x1E4F8A890];
  uint64_t v20 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions backupAdjustmentsFile];
  uint64_t v21 = [v16 cameraMetadata];
  __int16 v22 = [v19 assetAdjustmentsFromCameraAdjustmentsFileAtPath:v20 exportProperties:v15 cameraMetadata:v21];

  return v22;
}

- (void)_deleteJobFileAtPath:(id)a3 withAsset:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v6)
  {
    BOOL v9 = [(PHAssetCreationRequest *)self _filePathIsInIncomingDirectory:v6];
    BOOL v10 = PLPhotoKitIngestGetLog();
    BOOL v11 = v10;
    if (!v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v17 = [MEMORY[0x1E4F8B8F0] descriptionWithPath:v6];
        id v18 = [v7 uuid];
        *(_DWORD *)buf = 138412546;
        id v21 = v17;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "File not in Incoming, skipping deletion: %@, for UUID:%{public}@", buf, 0x16u);
      }
      id v14 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [v7 uuid];
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "Will remove file at path: %@, for UUID:%@", buf, 0x16u);
    }
    id v19 = 0;
    char v13 = [v8 removeItemAtPath:v6 error:&v19];
    id v14 = v19;
    if ((v13 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      BOOL v11 = PLPhotoKitIngestGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [MEMORY[0x1E4F8B8F0] descriptionWithPath:v6];
        CGImageSourceRef v16 = [v7 uuid];
        *(_DWORD *)buf = 138412802;
        id v21 = v15;
        __int16 v22 = 2114;
        id v23 = v16;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@, for UUID:%{public}@ %@", buf, 0x20u);
      }
LABEL_13:
    }
  }
  else
  {
    id v14 = 0;
  }
}

- (void)_removePhotoKitCameraIngestFiles:(id)a3 originalFileURL:(id)a4 resourceBag:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v8 path];
  BOOL v11 = [(PHAssetCreationRequest *)self _filePathIsInIncomingDirectory:v10];

  if (v11)
  {
    double v12 = [v8 path];
    [(PHAssetCreationRequest *)self _deleteJobFileAtPath:v12 withAsset:v25];

    char v13 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions cameraMetadataPath];
    [(PHAssetCreationRequest *)self _deleteJobFileAtPath:v13 withAsset:v25];

    id v14 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions backupAdjustmentsFile];
    [(PHAssetCreationRequest *)self _deleteJobFileAtPath:v14 withAsset:v25];

    uint64_t v15 = [v9 assetResourceWithType:5];
    CGImageSourceRef v16 = [v9 validatedURLForAssetResource:v15];

    id v17 = [v16 path];
    [(PHAssetCreationRequest *)self _deleteJobFileAtPath:v17 withAsset:v25];

    id v18 = [v9 assetResourceWithType:107];
    id v19 = [v9 validatedURLForAssetResource:v18];

    uint64_t v20 = [v19 path];
    [(PHAssetCreationRequest *)self _deleteJobFileAtPath:v20 withAsset:v25];

    id v21 = [v9 assetResourceWithType:7];
    __int16 v22 = [v9 validatedURLForAssetResource:v21];

    id v23 = [v22 path];
    [(PHAssetCreationRequest *)self _deleteJobFileAtPath:v23 withAsset:v25];

    __int16 v24 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions dbgFilePath];
    [(PHAssetCreationRequest *)self _deleteJobFileAtPath:v24 withAsset:v25];
  }
}

- (BOOL)_filePathIsInIncomingDirectory:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  double v5 = [v3 defaultManager];
  uint64_t v21 = -1;
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];

  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [MEMORY[0x1E4F8B850] incomingDirectoryPath];
  id v9 = [v7 fileURLWithPath:v8 isDirectory:1];
  id v20 = 0;
  char v10 = [v5 getRelationship:&v21 ofDirectoryAtURL:v9 toItemAtURL:v6 error:&v20];
  id v11 = v20;

  if (v10)
  {
    if (!v21)
    {
      BOOL v18 = 1;
      goto LABEL_9;
    }
    double v12 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v6];
      *(_DWORD *)buf = 138412290;
      id v23 = v13;
      id v14 = "File not in Incoming, skipping deletion: %@";
      uint64_t v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 12;
LABEL_7:
      _os_log_impl(&dword_19B043000, v15, v16, v14, buf, v17);
    }
  }
  else
  {
    double v12 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v6];
      *(_DWORD *)buf = 138412546;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v11;
      id v14 = "Unable to get relationship between incoming dir and %@: %@";
      uint64_t v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
      goto LABEL_7;
    }
  }

  BOOL v18 = 0;
LABEL_9:

  return v18;
}

- (void)_setupIrisPairingTimeoutForAsset:(id)a3 imageFile:(id)a4 library:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v9 setKindSubtype:2];
  char v10 = [v8 path];

  id v11 = [v10 stringByDeletingLastPathComponent];

  double v12 = [v9 uuid];

  char v13 = +[PHAssetCreationRequest _photoIrisIndicatorFilePathForPhotoAtPath:v11 UUID:v12];

  if (v13)
  {
    PLMakeIndicatorFileExistAtPath();
    id v14 = [MEMORY[0x1E4F8BA48] transaction:"-[PHAssetCreationRequest _setupIrisPairingTimeoutForAsset:imageFile:library:]"];
    dispatch_time_t v15 = dispatch_time(0, 8000000000);
    os_log_type_t v16 = [MEMORY[0x1E4F8A760] sharedLimiter];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke;
    v18[3] = &unk_1E5848EC0;
    id v19 = v7;
    id v20 = v13;
    id v21 = v14;
    id v17 = v14;
    [v16 dispatchAfterTime:v15 library:v19 block:v18];
  }
}

void __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke(id *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke_2;
  v3[3] = &unk_1E5848EC0;
  id v2 = a1[4];
  id v4 = a1[5];
  id v5 = a1[4];
  id v6 = a1[6];
  [v2 performTransactionAndWait:v3];
}

uint64_t __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke_2(void *a1)
{
  [MEMORY[0x1E4F8A890] photoIrisPairingDidSucceed:0 fileIndicatorPath:a1[4] photoAsset:0 photoLibrary:a1[5]];
  id v2 = (void *)a1[6];

  return [v2 stillAlive];
}

- (BOOL)_writeOutCameraMetadata:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v9 = [a3 cameraMetadata];
  id v15 = 0;
  char v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v15];
  id v11 = v15;

  id v14 = v11;
  LOBYTE(v9) = [v10 writeToURL:v7 options:1 error:&v14];
  id v12 = v14;

  if ((v9 & 1) == 0)
  {

    id v7 = 0;
  }
  if (a5 && v12) {
    *a5 = v12;
  }

  return v12 == 0;
}

- (BOOL)_setupSemanticEnhanceMetadataIfNeededWithDestinationURL:(id)a3 photoLibrary:(id)a4 semanticEnhanceResult:(id *)a5 ingestJobCameraMetadata:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int64_t var0 = a5->var0;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 cameraMetadata];
  [v14 setSemanticEnhanceScene:var0];

  double var1 = a5->var1;
  os_log_type_t v16 = [v11 cameraMetadata];
  [v16 setSemanticEnhanceSceneConfidence:var1];

  id v17 = +[PHAssetCreationRequest _cameraMetadataURLForPrimaryAssetURL:v13 photoLibrary:v12];

  id v23 = 0;
  BOOL v18 = [(PHAssetCreationRequest *)self _writeOutCameraMetadata:v11 destinationURL:v17 error:&v23];

  id v19 = v23;
  if (!v18)
  {
    id v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [v17 path];
      *(_DWORD *)buf = 138412546;
      id v25 = v21;
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "[SemDev] Error writing out MDATA file to destination %@, skipping SemDev: %@", buf, 0x16u);
    }
    a5->int64_t var0 = -1;
  }

  return v18;
}

- (void)_checkAndSetForSemanticEnhancementForAsset:(id)a3 resourceBag:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions deferredPhotoIdentifier];

  id v7 = (void *)MEMORY[0x1E4F8CDF8];
  id v8 = [v5 uniformTypeIdentifier];
  uint64_t v9 = [v7 typeWithIdentifier:v8];
  char v10 = [v9 conformsToType:*MEMORY[0x1E4F44498]];

  if ((v10 & 1) == 0)
  {
    id v11 = [v5 additionalAttributes];
    objc_msgSend(v11, "setDeferredProcessingCandidateOptions:", objc_msgSend(v11, "deferredProcessingCandidateOptions") | 8);

    if (v6) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 10;
    }
    [v5 setDeferredProcessingNeeded:v12];
    id v13 = PLAssetImportGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v5 uuidDescription];
      int v22 = 138543362;
      id v23 = v14;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "Signaling background processing needed for %{public}@, due to needs capture scheduling", (uint8_t *)&v22, 0xCu);
    }
    id v15 = [v5 photoLibrary];
    os_log_type_t v16 = [v15 libraryServicesManager];
    id v17 = [v16 backgroundJobService];
    [v17 startWatchdogTimerIfNeededWithSourceDescription:@"CameraIngest"];

    BOOL v18 = [v5 photoLibrary];
    id v19 = [v18 libraryServicesManager];
    id v20 = [v19 backgroundJobService];
    id v21 = [v5 photoLibrary];
    [v20 signalBackgroundProcessingNeededOnLibrary:v21];
  }
}

- (void)_checkAndGenerateThumbnailsForAsset:(id)a3 imageSource:(CGImageSource *)a4 imageData:(id)a5 previewImage:(id)a6 thumbnailImage:(id)a7 timeZoneLookup:(id)a8 resourceBag:(id)a9
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if ([v15 isPhoto])
  {
    id v42 = v17;
    id v43 = v16;
    id v21 = v18;
    id v22 = v20;
    id v23 = (void *)MEMORY[0x1E4F8CDF8];
    uint64_t v24 = [v15 uniformTypeIdentifier];
    [v23 typeWithIdentifier:v24];
    __int16 v26 = v25 = a4;

    id v27 = v25;
    id v28 = v19;
    char v29 = [(id)objc_opt_class() _shouldGenerateThumbnailsDuringCreationForImageSource:v25 contentType:v26 timeZoneLookup:v19];
    if ((v29 & 1) == 0)
    {
      id v30 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = [(PHChangeRequest *)self uuid];
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v31;
        _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_INFO, "Delaying thumbnail generation for %{public}@", buf, 0xCu);
      }
    }

    char v32 = v29 ^ 1;
    a4 = v27;
    id v20 = v22;
    id v18 = v21;
    id v17 = v42;
    id v16 = v43;
    id v19 = v28;
  }
  else
  {
    char v32 = 0;
  }
  BOOL v33 = [(PHChangeRequest *)self shouldPerformConcurrentWork];
  if ((v32 & 1) == 0 && !v33)
  {
    id v34 = [(PHChangeRequest *)self helper];
    __int16 v35 = [v34 clientAuthorization];
    int v36 = [v35 isCameraClient];

    if (v36)
    {
      int64_t v37 = [v15 avalancheUUID];

      if (!v37)
      {
        a4 = 0;
        uint64_t v39 = v16;
        id v16 = 0;
LABEL_17:

        goto LABEL_18;
      }
      id v38 = [v15 avalancheUUID];

      if (v38)
      {
        uint64_t v39 = [v20 assetResourceWithType:111];
        long long v40 = [v20 validatedDataForAssetResource:v39];
        if ([v40 length])
        {
          uint64_t v41 = DCIM_newPLImageWithStoredJPEGData();

          id v17 = (id)v41;
        }

        goto LABEL_17;
      }
    }
LABEL_18:
    [v15 generateAndUpdateThumbnailsWithPreviewImage:v17 thumbnailImage:v18 fromImageSource:a4 imageData:v16 forceSRGBConversion:0];
  }
}

- (BOOL)_assetAlreadyExistsAsPlaceholder:(BOOL)a3 mediaType:(int64_t)a4 uuid:(id)a5 photoLibrary:(id)a6 fetchAsset:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  if (a4 == 2)
  {
    id v14 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions jobType];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F8C9D0]];

    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    int v15 = 0;
    if (a3)
    {
LABEL_7:
      *a7 = [MEMORY[0x1E4F8A950] assetWithUUID:v12 inLibrary:v13];
      char v16 = v15 | a3;
      goto LABEL_8;
    }
  }
  if (v15) {
    goto LABEL_7;
  }
  char v16 = 0;
LABEL_8:

  return v16;
}

- (id)_createTimelapsePlaceholderAssetWithUUID:(id)a3 InPhotoLibrary:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v6 = a4;
  id v7 = [v6 pathManager];
  id v8 = [v7 simpleDCIMDirectory];

  id v38 = +[PHContentEditingOutput defaultExtensionForUniformTypeIdentifierType:*MEMORY[0x1E4F44490]];
  uint64_t v39 = v8;
  uint64_t v9 = objc_msgSend(v8, "nextAvailableFileURLWithExtension:");
  char v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [v9 path];
  id v12 = [v11 stringByDeletingLastPathComponent];
  id v41 = 0;
  char v13 = [v10 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v41];
  id v14 = v41;

  if (v13)
  {
    uint64_t v15 = [MEMORY[0x1E4F8BA10] savedAssetTypeForCameraAsset];
    [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions previewImgSurfaceRef];
    uint64_t v16 = PLCreateCGImageFromIOSurface();
    if (v16)
    {
      id v17 = (const void *)v16;
      id v18 = DCIM_newPLImageWithCGImage();
      if (v18) {
        id v19 = (void *)PLCreateImageWithFormatFromImage();
      }
      else {
        id v19 = 0;
      }
      CFRelease(v17);
    }
    else
    {
      id v18 = 0;
      id v19 = 0;
    }
    LOWORD(v36) = 257;
    id v22 = [MEMORY[0x1E4F8A950] insertAssetIntoPhotoLibrary:v6 mainFileURL:v9 mainFileMetadata:0 savedAssetType:v15 bundleScope:-[PHAssetCreationRequest bundleScope](self uuid:"bundleScope") replacementUUID:v40 imageSource:0 imageData:0 isPlaceholder:0 deleteFileOnFailure:v36];
    id v21 = v22;
    if (v22)
    {
      [v22 setAttributesFromMainFileURL:v9 mainFileMetadata:0 savedAssetType:v15 bundleScope:0 isPlaceholder:1 placeholderFileURL:0 imageSource:0 imageData:0];
      [v21 generateAndUpdateThumbnailsWithPreviewImage:v18 thumbnailImage:v19 fromImageSource:0 imageData:0 forceSRGBConversion:0];
      BOOL v23 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions isRearFacingCamera];
      [v21 additionalAttributes];
      int64_t v37 = v18;
      v25 = uint64_t v24 = self;
      [v25 setCameraCaptureDevice:!v23];

      __int16 v26 = [v21 additionalAttributes];
      id v27 = v26;
      if (v23) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = 2;
      }
      [v26 setImportedBy:v28];

      char v29 = [(PHAssetCreationCameraIngestOptions *)v24->_cameraIngestOptions creationDate];
      [v21 setDateCreated:v29];

      [v21 setKindSubtype:102];
      [(PHAssetCreationCameraIngestOptions *)v24->_cameraIngestOptions placeholderHeight];
      double v31 = v30;
      cameraIngestOptions = v24->_cameraIngestOptions;
      id v18 = v37;
      [(PHAssetCreationCameraIngestOptions *)cameraIngestOptions placeholderWidth];
      if ((uint64_t)v33 && (uint64_t)v31)
      {
        objc_msgSend(v21, "setWidth:");
        [v21 setHeight:(uint64_t)v31];
      }
    }
    else
    {
      id v34 = PLPhotoKitIngestGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v43 = v40;
        _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_ERROR, "Could not create timelapse PLManagedAsset placeholder for uuid: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v18 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v9 path];
      *(_DWORD *)buf = 138412546;
      id v43 = v20;
      __int16 v44 = 2112;
      id v45 = v14;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "PhotoKit Camera Ingest: Failed to create directory for timelapse placeholder at path: %@, Error: %@", buf, 0x16u);
    }
    id v21 = 0;
  }

  return v21;
}

- (id)_createAdjustmentsFileFromJobDictionary:(id)a3 cameraIngestOptions:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F8C8D8]];
  id v8 = [v5 objectForKey:*MEMORY[0x1E4F8C8B0]];
  uint64_t v9 = [v5 objectForKey:*MEMORY[0x1E4F8CA08]];
  uint64_t v10 = *MEMORY[0x1E4F8C970];
  id v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
  uint64_t v12 = *MEMORY[0x1E4F8C9D8];
  int v13 = [v11 isEqual:*MEMORY[0x1E4F8C9D8]];

  id v14 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v15 = (void *)MEMORY[0x1E4F8CAE8];
  if (!v13) {
    uint64_t v15 = (void *)MEMORY[0x1E4F8CA78];
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:*v15];
  id v62 = (void *)[v14 initFileURLWithPath:v16 isDirectory:0];

  double v17 = *MEMORY[0x1E4F1DB30];
  double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v19 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C950]];
  uint64_t v20 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C940]];
  id v21 = (void *)v20;
  if (v19 && v20)
  {
    [v19 floatValue];
    double v17 = v22;
    [v21 floatValue];
    double v18 = v23;
  }
  uint64_t v59 = v21;
  id v60 = v19;
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F8AA48], "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", (unint64_t)v17, (unint64_t)v18, (int)objc_msgSend(v9, "intValue"), 0.0);
  int v61 = v9;
  if (!v7)
  {
    os_signpost_id_t v58 = 0;
    id v25 = 0;
    id v27 = 0;
    goto LABEL_11;
  }
  id v66 = 0;
  id v25 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:2 error:&v66];
  id v26 = v66;
  os_signpost_id_t v58 = v26;
  if (!v25)
  {
    id v47 = v26;
    id v25 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v68 = (uint64_t)v7;
      __int16 v69 = 2112;
      id v70 = v47;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "Error reading camera metadata at path: %@ error: %@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  id v65 = 0;
  id v27 = [MEMORY[0x1E4F8CBE0] deserializedMetadataFromData:v25 error:&v65];
  id v28 = v65;
  char v29 = v28;
  if (!v27)
  {
    os_signpost_id_t v51 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = [v25 length];
      *(_DWORD *)buf = 134218242;
      uint64_t v68 = v52;
      __int16 v69 = 2112;
      id v70 = v29;
      _os_log_impl(&dword_19B043000, v51, OS_LOG_TYPE_ERROR, "Error deserialization camera metadata (length=%lu): %@", buf, 0x16u);
    }

LABEL_35:
    id v27 = 0;
    id v43 = 0;
    id v46 = 0;
    goto LABEL_36;
  }

LABEL_11:
  double v30 = [v5 objectForKeyedSubscript:v10];
  int v31 = [v30 isEqual:v12];

  uint64_t v56 = v24;
  unint64_t v57 = v8;
  if (v31)
  {
    char v32 = [MEMORY[0x1E4F8A890] assetAdjustmentsFromCameraAdjustmentData:v8 cameraMetadata:v27 exportProperties:v24 applySemanticEnhance:0 assetType:1 sourceURL:v62];
  }
  else
  {
    char v32 = [MEMORY[0x1E4F8A890] assetAdjustmentsFromCameraAdjustmentData:v8 cameraMetadata:v27 exportProperties:v24 applySemanticEnhance:0 assetType:0 sourceURL:v62];
    uint64_t v64 = 0;
    uint64_t v33 = [MEMORY[0x1E4F8CBC8] deserializedAdjustmentsFromData:v8 error:&v64];
    id v34 = (void *)v33;
    if (v6 && v33)
    {
      uint64_t v54 = v6;
      __int16 v35 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8CA50]];
      uint64_t v36 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C910]];
      int v37 = [v34 canBeRenderedByCapturePipelineWithVideoComplement:v35 != 0 deferredIdentifier:v36];

      if (v37) {
        [v54 setCandidateOptions:16];
      }
      id v38 = [v34 portraitEffectFilterName];
      id v6 = v54;
      [v54 setPortraitEffectFilterName:v38];
    }
  }
  uint64_t v39 = [v32 propertyListDictionary];
  if (v39)
  {
    long long v55 = v7;
    id v40 = v6;
    id v41 = [v62 absoluteString];
    id v42 = +[PHAssetCreationRequestBridge buildAdjustmentsPlistPathForPhotoKitIngestJob:v5 withSourcePath:v41];

    id v43 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v42];
    id v63 = 0;
    char v44 = [v39 writeToURL:v43 error:&v63];
    id v45 = v63;
    if (v44)
    {
      id v46 = v43;
    }
    else
    {
      long long v50 = PLPhotoKitIngestGetLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v68 = (uint64_t)v42;
        __int16 v69 = 2112;
        id v70 = v45;
        _os_log_impl(&dword_19B043000, v50, OS_LOG_TYPE_ERROR, "PhotoKit Image Ingest: Could not write propertyListDictionary to URL %@. error: %@", buf, 0x16u);
      }

      id v46 = 0;
    }

    id v6 = v40;
    id v7 = v55;
  }
  else
  {
    id v42 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      CFDictionaryRef v48 = [v5 objectForKeyedSubscript:v10];
      uint64_t v49 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
      *(_DWORD *)buf = 138412546;
      uint64_t v68 = (uint64_t)v48;
      __int16 v69 = 2112;
      id v70 = v49;
      _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_ERROR, "PhotoKit ingest pipeline: property list dictionary for asset of job type %@ with uuid %@ is empty.", buf, 0x16u);
    }
    id v43 = 0;
    id v46 = 0;
  }

  uint64_t v24 = v56;
  id v8 = v57;
LABEL_36:

  return v46;
}

- (id)_externalLivePhotoResourceForAsset:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [v5 kind];
  if (v6 >= 2)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:2250 description:@"This method is intended to create external assets for images and videos only"];
  }
  id v7 = [PHExternalAssetResource alloc];
  if (v6) {
    uint64_t v8 = 9;
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v9 = [(PHExternalAssetResource *)v7 initWithResourceType:v8];
  uint64_t v10 = [v5 pathManager];
  int v11 = [v10 isUBF];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F8B978]);
    int v13 = [v5 uuid];
    uint64_t v14 = [v5 bundleScope];
    uint64_t v15 = [v5 uniformTypeIdentifier];
    uint64_t v16 = [v5 originalFilename];
    double v17 = (void *)[v12 initWithAssetUuid:v13 bundleScope:v14 uti:v15 resourceVersion:0 resourceType:v6 != 0 recipeID:0 originalFilename:v16];

    double v18 = [v5 photoLibrary];

    if (!v18)
    {
      id v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, self, @"PHAssetCreationRequest.m", 2257, @"Invalid parameter not satisfying: %@", @"asset.photoLibrary" object file lineNumber description];
    }
    id v19 = [v5 pathManager];
    uint64_t v20 = [v19 readOnlyUrlWithIdentifier:v17];
  }
  else
  {
    uint64_t v20 = [v5 mainFileURL];
  }
  id v21 = objc_alloc_init(PHAssetResourceCreationOptions);
  [(PHAssetResourceCreationOptions *)v21 setShouldMoveFile:0];
  float v22 = [v5 uniformTypeIdentifier];
  [(PHAssetResourceCreationOptions *)v21 setUniformTypeIdentifier:v22];

  float v23 = [v5 additionalAttributes];
  uint64_t v24 = [v23 alternateImportImageDate];
  [(PHAssetResourceCreationOptions *)v21 setAlternateImportImageDate:v24];

  id v25 = [v5 originalFilename];
  [(PHAssetResourceCreationOptions *)v21 setOriginalFilename:v25];

  [(PHExternalAssetResource *)v9 setFileURL:v20];
  [(PHExternalAssetResource *)v9 setCreationOptions:v21];

  return v9;
}

- (BOOL)_writeDataToDisk:(id)a3 imageUTIType:(id)a4 primaryImageProperties:(id)a5 mainFileURL:(id)a6 thumbnailData:(id)a7
{
  v54[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v12 = (const __CFData *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([MEMORY[0x1E4F8A950] isPrimaryImageFormatForUTI:v13])
  {
    double v17 = [(PHAssetCreationRequest *)self _filteredImagePropertiesByConditionallyRemovingLivePhotoIdentifiersFromSourceImageProperties:v14];
    char IsEqual = PLObjectIsEqual();
    id v19 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v13];
    int v20 = [v19 isEqual:*MEMORY[0x1E4F44410]];

    if (!v20)
    {
      if ((IsEqual & 1) == 0)
      {
        int v31 = CGImageSourceCreateWithData(v12, 0);
        if (v31)
        {
          char v32 = v31;
          uint64_t v53 = *MEMORY[0x1E4F2FDE8];
          v54[0] = MEMORY[0x1E4F1CC38];
          CFDictionaryRef v33 = CGImageSourceCopyProperties(v31, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1]);
          v41[1] = (id)MEMORY[0x1E4F143A8];
          v41[2] = (id)3221225472;
          v41[3] = __105__PHAssetCreationRequest__writeDataToDisk_imageUTIType_primaryImageProperties_mainFileURL_thumbnailData___block_invoke;
          v41[4] = &unk_1E58442C8;
          id v43 = self;
          char v44 = v32;
          CFDictionaryRef v42 = v33;
          float v23 = v33;
          int v34 = PFFigCopyImageDataToURLWithUpdatedProperties();
          BOOL v28 = v34 == 0;
          if (v34)
          {
            int v35 = v34;
            log = PLPhotoKitGetLog();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218754;
              CFDataRef v46 = v12;
              __int16 v47 = 2048;
              uint64_t v48 = [(__CFData *)v12 length];
              __int16 v49 = 2112;
              id v50 = v15;
              __int16 v51 = 2048;
              uint64_t v52 = v35;
              _os_log_impl(&dword_19B043000, log, OS_LOG_TYPE_ERROR, "Failed to copy primary image data (%p %ld) to URL %@, %ld", buf, 0x2Au);
            }
          }
          CFRelease(v32);

          goto LABEL_26;
        }
        float v23 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        uint64_t v24 = "Failed to create image source from finalized image data";
        id v25 = v23;
        uint32_t v26 = 2;
        goto LABEL_13;
      }
      v41[0] = 0;
      char v29 = [(__CFData *)v12 writeToURL:v15 options:1073741825 error:v41];
      float v23 = v41[0];
      if (v29)
      {
        BOOL v28 = 1;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v36 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [(__CFData *)v12 length];
        *(_DWORD *)buf = 134218754;
        CFDataRef v46 = v12;
        __int16 v47 = 2048;
        uint64_t v48 = v37;
        __int16 v49 = 2112;
        id v50 = v15;
        __int16 v51 = 2112;
        uint64_t v52 = v23;
        _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_ERROR, "Failed to copy primary image data (%p %ld) to URL %@: %@", buf, 0x2Au);
      }

      goto LABEL_25;
    }
    id v21 = [MEMORY[0x1E4F8B850] sharedDCIMWriter];
    char v22 = [v21 writeJPEGToURL:v15 withData:v12 thumbnail:v16 properties:v17];

    if ((v22 & 1) == 0)
    {
      float v23 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        CFDataRef v46 = v12;
        __int16 v47 = 2048;
        uint64_t v48 = [(__CFData *)v12 length];
        __int16 v49 = 2112;
        id v50 = v15;
        uint64_t v24 = "Failed to write JPEG image data (%p %ld) to URL %@.";
        id v25 = v23;
        uint32_t v26 = 32;
LABEL_13:
        _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else
  {
    id v40 = 0;
    char v27 = [(__CFData *)v12 writeToURL:v15 options:1073741825 error:&v40];
    double v17 = v40;
    if ((v27 & 1) == 0)
    {
      float v23 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [(__CFData *)v12 length];
        *(_DWORD *)buf = 134218754;
        CFDataRef v46 = v12;
        __int16 v47 = 2048;
        uint64_t v48 = v30;
        __int16 v49 = 2112;
        id v50 = v15;
        __int16 v51 = 2112;
        uint64_t v52 = v17;
        uint64_t v24 = "Failed to write image data (%p %ld) to URL %@, %@";
        id v25 = v23;
        uint32_t v26 = 42;
        goto LABEL_13;
      }
LABEL_25:
      BOOL v28 = 0;
      goto LABEL_26;
    }
  }
  BOOL v28 = 1;
LABEL_27:

  return v28;
}

id __105__PHAssetCreationRequest__writeDataToDisk_imageUTIType_primaryImageProperties_mainFileURL_thumbnailData___block_invoke(uint64_t a1)
{
  id v2 = 0;
  if (PFFigGetImageSourceImageIndexForContainerItemID())
  {
    CFDictionaryRef v3 = CGImageSourceCopyPropertiesAtIndex(*(CGImageSourceRef *)(a1 + 48), 0, 0);
    id v2 = [*(id *)(a1 + 40) _filteredImagePropertiesByConditionallyRemovingLivePhotoIdentifiersFromSourceImageProperties:v3];
  }

  return v2;
}

- (BOOL)_accessWritableURLForUUID:(id)a3 imageUTI:(id)a4 originalFilename:(id)a5 photoLibrary:(id)a6 withHandler:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  double v17 = [v15 pathManager];
  int v18 = [v17 isUBF];

  if (v18)
  {
    id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8B978]), "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v12, -[PHAssetCreationRequest bundleScope](self, "bundleScope"), v13, 0, 31, 0, v14);
    int v20 = [v15 pathManager];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __103__PHAssetCreationRequest__accessWritableURLForUUID_imageUTI_originalFilename_photoLibrary_withHandler___block_invoke;
    v30[3] = &unk_1E58442A0;
    int v35 = &v36;
    id v34 = v16;
    id v31 = v12;
    id v32 = v13;
    id v33 = v14;
    [v20 obtainAccessAndWaitWithFileWithIdentifier:v19 mode:2 toURLWithHandler:v30];

    id v21 = v34;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F8B850] defaultFileExtensionForAssetType:0];
    if (v13)
    {
      char v22 = [MEMORY[0x1E4F8B850] preferredFileExtensionForType:v13];
      if ([v22 length])
      {
        id v23 = v22;

        id v19 = v23;
      }
    }
    uint64_t v24 = [v15 libraryServicesManager];
    id v25 = [v24 imageWriter];
    id v21 = [v25 cameraAssetPathForNewAssetWithExtension:v19 assetUUID:v12];

    *((unsigned char *)v37 + 24) = v21 != 0;
    if (v21)
    {
      uint32_t v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21 isDirectory:0];
      char v27 = (*((uint64_t (**)(id, NSObject *))v16 + 2))(v16, v26);
      *((unsigned char *)v37 + 24) = v27;
    }
    else
    {
      uint32_t v26 = PLBackendGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v41 = v19;
        __int16 v42 = 2114;
        id v43 = v12;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Failed to get a valid path from -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:] for extension: %{public}@, UUID: %{public}@", buf, 0x16u);
      }
    }
  }
  BOOL v28 = *((unsigned char *)v37 + 24) != 0;
  _Block_object_dispose(&v36, 8);

  return v28;
}

void __103__PHAssetCreationRequest__accessWritableURLForUUID_imageUTI_originalFilename_photoLibrary_withHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    unsigned int v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      int v10 = 138413058;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Unable to obtain writable URL for UUID: %@, UTI: %@, and original filename: %@, error: %@", (uint8_t *)&v10, 0x2Au);
    }

    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
  }
}

- (id)_managedAssetFromPrimaryResourceData:(id)a3 validatedResources:(id)a4 withUUID:(id)a5 photoLibrary:(id)a6 mainFileMetadata:(id *)a7 getImageSource:(CGImageSource *)a8 imageData:(id *)a9
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v52 = a4;
  id v53 = a5;
  id v54 = a6;
  uint64_t v66 = 0;
  long long v67 = &v66;
  uint64_t v68 = 0x3032000000;
  __int16 v69 = __Block_byref_object_copy__14582;
  id v70 = __Block_byref_object_dispose__14583;
  id v71 = 0;
  CFDataRef data = [v13 data];
  __int16 v14 = [v13 creationOptions];
  uint64_t v15 = [v14 uniformTypeIdentifier];

  context = (void *)MEMORY[0x19F389B10]();
  if (v15)
  {
    uint64_t v74 = *MEMORY[0x1E4F2FF78];
    v75[0] = v15;
    CFDictionaryRef v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
  }
  else
  {
    CFDictionaryRef v16 = 0;
  }
  id v17 = CGImageSourceCreateWithData(data, v16);
  uint64_t v18 = v17;
  if (v15)
  {

    BOOL v19 = v18 != 0;
  }
  else if (v17)
  {
    uint64_t v15 = CGImageSourceGetType(v17);
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
    uint64_t v15 = 0;
  }
  if ((v19 & ~[v52 hasCurrentAdjustment]) != 1) {
    goto LABEL_12;
  }
  int v20 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v15];
  id v21 = objc_opt_class();
  char v22 = [v54 libraryBundle];
  id v23 = [v22 timeZoneLookup];
  LODWORD(v21) = [v21 _shouldGenerateThumbnailsDuringCreationForImageSource:v18 contentType:v20 timeZoneLookup:v23];

  if (v21)
  {

LABEL_12:
    uint64_t v24 = (void *)MEMORY[0x1E4F8B850];
    id v65 = 0;
    int v25 = 1;
    uint32_t v26 = &v65;
    goto LABEL_16;
  }
  char v27 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    BOOL v28 = [(PHChangeRequest *)self uuid];
    *(_DWORD *)buf = 138543362;
    uint64_t v73 = v28;
    _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_INFO, "Delaying thumbnail generation from image data for %{public}@", buf, 0xCu);
  }
  uint32_t v26 = 0;
  int v25 = 0;
  uint64_t v24 = (void *)MEMORY[0x1E4F8B850];
LABEL_16:
  id v63 = 0;
  id v64 = 0;
  id v62 = 0;
  [v24 writeableDataForImageData:data imageUTIType:v15 imageSource:v18 thumbnailDataOut:v26 imageUTITypeOut:&v64 primaryImagePropertiesOut:&v63 imageDataOut:&v62];
  if (v25) {
    id v29 = v65;
  }
  else {
    id v29 = 0;
  }
  id v30 = v64;
  id v31 = v63;
  id v32 = v62;
  if (v19) {
    CFRelease(v18);
  }
  id v33 = [v13 creationOptions];
  id v34 = [v33 originalFilename];

  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __146__PHAssetCreationRequest__managedAssetFromPrimaryResourceData_validatedResources_withUUID_photoLibrary_mainFileMetadata_getImageSource_imageData___block_invoke;
  v56[3] = &unk_1E5844278;
  int v61 = &v66;
  v56[4] = self;
  id v35 = v32;
  id v57 = v35;
  id v36 = v30;
  id v58 = v36;
  id v37 = v31;
  id v59 = v37;
  id v38 = v29;
  id v60 = v38;
  BOOL v39 = [(PHAssetCreationRequest *)self _accessWritableURLForUUID:v53 imageUTI:v36 originalFilename:v34 photoLibrary:v54 withHandler:v56];

  if (v39)
  {
    id v40 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v15];
    id v41 = objc_alloc(MEMORY[0x1E4F8CC48]);
    __int16 v42 = [v54 libraryBundle];
    id v43 = [v42 timeZoneLookup];
    uint64_t v44 = [v41 initWithImageData:data contentType:v40 options:14 timeZoneLookup:v43 cacheImageSource:1 cacheImageData:1];

    if (v44)
    {
      if (a7) {
        *a7 = v44;
      }
      LOWORD(v48) = 256;
      id v45 = objc_msgSend(MEMORY[0x1E4F8A950], "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v54, v67[5], v44, -[PHAssetCreationRequest _savedAssetTypeForAsset](self, "_savedAssetTypeForAsset"), -[PHAssetCreationRequest bundleScope](self, "bundleScope"), v53, 0, a8, a9, v48);
      [v45 setUniformTypeIdentifier:v36];
    }
    else
    {
      uint64_t v44 = PLBackendGetLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        CFDataRef v46 = (void *)v67[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v73 = v46;
        _os_log_impl(&dword_19B043000, v44, OS_LOG_TYPE_ERROR, "Unable to read metadata from data written to disk at %@", buf, 0xCu);
      }
      id v45 = 0;
    }
  }
  else
  {
    id v45 = 0;
  }

  _Block_object_dispose(&v66, 8);

  return v45;
}

uint64_t __146__PHAssetCreationRequest__managedAssetFromPrimaryResourceData_validatedResources_withUUID_photoLibrary_mainFileMetadata_getImageSource_imageData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEBUG, "Writing data for new asset to URL: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) _writeDataToDisk:*(void *)(a1 + 40) imageUTIType:*(void *)(a1 + 48) primaryImageProperties:*(void *)(a1 + 56) mainFileURL:v3 thumbnailData:*(void *)(a1 + 64)];
  return v8;
}

- (signed)_savedAssetTypeForAsset
{
  if (self->_createAsCompanionSyncedAsset) {
    return [MEMORY[0x1E4F8BA10] savedAssetTypeForCompanionSyncedAsset];
  }
  if (self->_momentShareUUID) {
    return [MEMORY[0x1E4F8BA10] savedAssetTypeForMomentSharedAsset];
  }
  if (self->_importedBy == 4) {
    return [MEMORY[0x1E4F8BA10] savedAssetTypeForImportedByCameraConnectionKit];
  }
  if (self->_duplicateAsAlternateAsset) {
    return [MEMORY[0x1E4F8BA10] savedAssetTypeForDuplicateAsAlternateAsset];
  }
  return [MEMORY[0x1E4F8BA10] defaultSavedAssetTypeForPhotoKitAssetCreationRequest];
}

- (id)_filteredImagePropertiesByConditionallyRemovingLivePhotoIdentifiersFromSourceImageProperties:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = [(PHAssetCreationRequest *)self duplicateAssetIdentifier];
    uint64_t v8 = [(PHAssetCreationRequest *)self forcePairingIdentifier];
    BOOL v9 = [(PHAssetCreationRequest *)self duplicateLivePhotoAsStill];
    BOOL v10 = [(PHAssetCreationRequest *)self duplicateSinglePhotoFromBurst];
    BOOL v11 = v9 || v10;
    if (!v7) {
      BOOL v11 = 0;
    }
    if (v11 || v8)
    {
      uint64_t v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v19 = 138413058;
        int v20 = (PHAssetCreationRequest *)v7;
        __int16 v21 = 2112;
        char v22 = v8;
        __int16 v23 = 1024;
        BOOL v24 = v9;
        __int16 v25 = 1024;
        BOOL v26 = v10;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "Asset creation request rewrites metadata: duplicateAssetIdentifier=%@, forcePairingIdentifier=%@, duplicateLivePhotoAsStill=%d, duplicateSinglePhotoFromBurst=%d", (uint8_t *)&v19, 0x22u);
      }

      uint64_t v13 = *MEMORY[0x1E4F2FC20];
      __int16 v14 = [v6 objectForKey:*MEMORY[0x1E4F2FC20]];
      uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v14];
      CFDictionaryRef v16 = v15;
      if (v8)
      {
        [v15 setObject:v8 forKey:*MEMORY[0x1E4F15530]];
      }
      else
      {
        if (v9) {
          [v15 removeObjectForKey:*MEMORY[0x1E4F15530]];
        }
        if (v10) {
          [v16 removeObjectForKey:*MEMORY[0x1E4F15538]];
        }
      }
      id v17 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
      [v17 setObject:v16 forKey:v13];

      id v6 = v17;
    }
  }
  else
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      int v20 = self;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unexpected nil image properties while processing creation request %@", (uint8_t *)&v19, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_createOriginalResourceForAsset:(id)a3 fromValidatedResource:(id)a4 resourceType:(unsigned int)a5 photoLibrary:(id)a6 destinationURL:(id)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  uint64_t v59 = 0;
  id v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000;
  id v62 = __Block_byref_object_copy__14582;
  id v63 = __Block_byref_object_dispose__14583;
  id v64 = 0;
  if (v15)
  {
    uint64_t v18 = [v15 fileURL];
    id v43 = v17;
    uint64_t v44 = v14;
    uint64_t v53 = 0;
    id v54 = (id *)&v53;
    uint64_t v55 = 0x3032000000;
    uint64_t v56 = __Block_byref_object_copy__14582;
    id v57 = __Block_byref_object_dispose__14583;
    id v58 = 0;
    int v19 = [v15 creationOptions];
    int v20 = [v19 shouldIngestInPlace];

    __int16 v21 = [v16 pathManager];
    char v22 = v21;
    if (v20)
    {
      __int16 v23 = (void *)MEMORY[0x1E4F8B908];
      BOOL v24 = [v21 capabilities];
      __int16 v25 = v60;
      id obj = v60[5];
      LODWORD(v23) = [v23 ingestItemAtURL:v18 toURL:v18 type:0 options:3 capabilities:v24 error:&obj];
      objc_storeStrong(v25 + 5, obj);

      if (v23)
      {
        objc_storeStrong(v54 + 5, v18);
        BOOL v26 = 1;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    uint64_t v27 = [v15 creationOptions];
    unsigned int v42 = [v27 shouldMoveFile];

    if ([v22 isUBF])
    {
      id v41 = self;
      id v40 = objc_alloc(MEMORY[0x1E4F8B978]);
      BOOL v28 = [(PHChangeRequest *)self uuid];
      uint64_t v29 = [v44 bundleScope];
      id v30 = [v15 uniformTypeIdentifier];
      id v31 = [v15 originalFilename];
      id v32 = (void *)[v40 initWithAssetUuid:v28 bundleScope:v29 uti:v30 resourceVersion:0 resourceType:v11 recipeID:0 originalFilename:v31];

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __127__PHAssetCreationRequest__createOriginalResourceForAsset_fromValidatedResource_resourceType_photoLibrary_destinationURL_error___block_invoke;
      v46[3] = &unk_1E5844228;
      __int16 v49 = &v53;
      v46[4] = v41;
      char v51 = v42;
      id v47 = v18;
      id v48 = v22;
      id v50 = &v59;
      [v48 obtainAccessAndWaitWithFileWithIdentifier:v32 mode:2 toURLWithHandler:v46];
    }
    else
    {
      objc_storeStrong(v54 + 5, a7);
      id v33 = v54[5];
      if (!v33)
      {
LABEL_12:
        BOOL v26 = 0;
LABEL_13:

        _Block_object_dispose(&v53, 8);
        id v17 = v43;
        id v14 = v44;
        if (!a8) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      id v32 = [v22 capabilities];
      id v34 = v60;
      id v45 = v60[5];
      uint64_t v35 = [(PHAssetCreationRequest *)self _secureMove:v42 fileAtURL:v18 toURL:v33 capabilities:v32 error:&v45];
      objc_storeStrong(v34 + 5, v45);
      id v36 = v54[5];
      v54[5] = (id)v35;
    }
    BOOL v26 = v54[5] != 0;
    goto LABEL_13;
  }
  BOOL v26 = 0;
  if (!a8) {
    goto LABEL_18;
  }
LABEL_14:
  if (!v26)
  {
    id v37 = v60[5];
    if (v37)
    {
      *a8 = v37;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to create spatial over capture from resources");
      id v38 = objc_claimAutoreleasedReturnValue();
      *a8 = v38;
    }
  }
LABEL_18:
  _Block_object_dispose(&v59, 8);

  return v26;
}

void __127__PHAssetCreationRequest__createOriginalResourceForAsset_fromValidatedResource_resourceType_photoLibrary_destinationURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v10 = [*(id *)(a1 + 48) capabilities];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v11 + 40);
    uint64_t v12 = [v8 _secureMove:v7 fileAtURL:v9 toURL:v5 capabilities:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

- (BOOL)_createAudioResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 isValid])
  {
    uint64_t v13 = [v11 assetResourceWithType:3];
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F1CB10];
      id v30 = [v10 pathForOriginalFile];
      id v15 = [v30 stringByDeletingPathExtension];
      id v16 = [v13 fileURL];
      [v16 pathExtension];
      id v17 = v10;
      uint64_t v18 = v13;
      id v19 = v12;
      v21 = int v20 = a6;
      [v15 stringByAppendingPathExtension:v21];
      v22 = uint64_t v29 = self;
      __int16 v23 = [v14 fileURLWithPath:v22];

      BOOL v24 = v20;
      id v12 = v19;
      uint64_t v13 = v18;
      id v10 = v17;

      BOOL v25 = [(PHAssetCreationRequest *)v29 _createOriginalResourceForAsset:v17 fromValidatedResource:v13 resourceType:2 photoLibrary:v12 destinationURL:v23 error:v24];
      if (v25)
      {
        [MEMORY[0x1E4F8AB40] installSupplementalResourceForExistingFileAtURL:v23 ptpTrashedState:0 index:0 forAsset:v17 imageOrientation:0 resultingResource:0 error:v24];
      }
      else
      {
        BOOL v26 = PLBackendGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = *v24;
          *(_DWORD *)buf = 138412290;
          id v32 = v27;
          _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    else
    {
      LOBYTE(v25) = 1;
    }
  }
  else
  {
    LOBYTE(v25) = 1;
  }

  return v25;
}

- (BOOL)_createXmpResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 isValid])
  {
    uint64_t v13 = [v11 assetResourceWithType:17];
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F1CB10];
      id v15 = [v10 pathForXMPFile];
      id v16 = [v14 fileURLWithPath:v15];
      BOOL v17 = [(PHAssetCreationRequest *)self _createOriginalResourceForAsset:v10 fromValidatedResource:v13 resourceType:5 photoLibrary:v12 destinationURL:v16 error:a6];
    }
    else
    {
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)_createSocResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 isValid])
  {
    uint64_t v13 = [v11 assetResourceWithType:13];
    if (!v13)
    {
      uint64_t v13 = [v11 assetResourceWithType:14];
    }
    id v14 = [v10 pathForSpatialOverCaptureContentFile];
    if (v14)
    {
      id v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
      id v16 = [v13 creationOptions];
      [v16 ensureOptionsAreCompleteForURL:v15];

      LODWORD(a6) = [(PHAssetCreationRequest *)self _createOriginalResourceForAsset:v10 fromValidatedResource:v13 resourceType:10 photoLibrary:v12 destinationURL:v15 error:a6];
      if (a6) {
        objc_msgSend(v10, "setCameraProcessingAdjustmentState:", objc_msgSend(v10, "cameraProcessingAdjustmentState") | 1);
      }
    }
    else if (a6)
    {
      BOOL v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F8C500];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"invalid parameters required for fileIdentifier";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a6 = [v17 errorWithDomain:v18 code:46801 userInfo:v19];

      LOBYTE(a6) = 0;
    }
  }
  else
  {
    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (BOOL)_createRAWSidecarForAsset:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  id v61 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v81 = 0;
  uint64_t v82 = (id *)&v81;
  uint64_t v83 = 0x3032000000;
  uint64_t v84 = __Block_byref_object_copy__14582;
  uint64_t v85 = __Block_byref_object_dispose__14583;
  id v86 = 0;
  id v14 = [v11 assetResourceWithType:4];
  id v15 = [v11 validatedURLForAssetResource:v14];
  id v16 = [v14 creationOptions];
  [v16 ensureOptionsAreCompleteForURL:v15];

  BOOL v17 = [[_PHAssetCreationRequestValidator alloc] initWithAssetCreationRequest:self];
  uint64_t v18 = v82;
  id v80 = v82[5];
  LODWORD(a5) = [(PHValidator *)v17 validateURL:v15 withOptions:1 error:&v80];
  objc_storeStrong(v18 + 5, v80);
  if (a5)
  {
    id v57 = v12;
    uint64_t v74 = 0;
    BOOL v75 = &v74;
    uint64_t v76 = 0x3032000000;
    uint64_t v77 = __Block_byref_object_copy__14582;
    v78 = __Block_byref_object_dispose__14583;
    id v79 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke;
    aBlock[3] = &unk_1E5844250;
    id v55 = v61;
    id v71 = v55;
    id v19 = v15;
    id v72 = v19;
    uint64_t v73 = &v74;
    id v58 = (void (**)(void))_Block_copy(aBlock);
    int v20 = [v14 creationOptions];
    int v21 = [v20 shouldIngestInPlace];

    uint64_t v56 = v13;
    uint64_t v59 = [v13 pathManager];
    if (v21)
    {
      v58[2]();
      char v22 = (void *)v75[5];
      if (!v22) {
        goto LABEL_6;
      }
      if (![v22 isEqual:v19]) {
        goto LABEL_6;
      }
      __int16 v23 = (void *)MEMORY[0x1E4F8B908];
      uint64_t v24 = v75[5];
      BOOL v25 = [v59 capabilities];
      BOOL v26 = v82;
      id obj = v82[5];
      LOBYTE(v23) = [v23 ingestItemAtURL:v24 toURL:v24 type:0 options:3 capabilities:v25 error:&obj];
      objc_storeStrong(v26 + 5, obj);

      if ((v23 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
    BOOL v28 = [v14 creationOptions];
    uint64_t v29 = [v28 shouldMoveFile];

    if ([v59 isUBF])
    {
      char v53 = v29;
      id v54 = objc_alloc(MEMORY[0x1E4F8B978]);
      id v30 = [(PHChangeRequest *)self uuid];
      uint64_t v31 = [v55 bundleScope];
      id v32 = [v14 uniformTypeIdentifier];
      uint64_t v33 = [v14 originalFilename];
      id v34 = (void *)[v54 initWithAssetUuid:v30 bundleScope:v31 uti:v32 resourceVersion:0 resourceType:4 recipeID:0 originalFilename:v33];

      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke_2;
      v63[3] = &unk_1E5844228;
      uint64_t v66 = &v74;
      v63[4] = self;
      char v68 = v53;
      id v64 = v19;
      id v65 = v59;
      long long v67 = &v81;
      [v65 obtainAccessAndWaitWithFileWithIdentifier:v34 mode:2 toURLWithHandler:v63];
    }
    else
    {
      if (!((unsigned int (*)(void))v58[2])()) {
        goto LABEL_13;
      }
      uint64_t v35 = v75[5];
      id v34 = [v59 capabilities];
      id v36 = v82;
      id v62 = v82[5];
      uint64_t v37 = [(PHAssetCreationRequest *)self _secureMove:v29 fileAtURL:v19 toURL:v35 capabilities:v34 error:&v62];
      objc_storeStrong(v36 + 5, v62);
      id v38 = (void *)v75[5];
      v75[5] = v37;
    }
LABEL_13:
    if (!v75[5])
    {
LABEL_6:
      BOOL v27 = 0;
LABEL_17:

      _Block_object_dispose(&v74, 8);
      id v13 = v56;
      id v12 = v57;
      goto LABEL_18;
    }
LABEL_14:
    if ([v59 isDCIM])
    {
      id v39 = objc_alloc_init(MEMORY[0x1E4F8AC78]);
      [v39 setResourceType:4];
      [v39 setFileURL:v75[5]];
      [v39 persistResourceTypeToFileURL];
    }
    uint64_t v40 = v75[5];
    id v41 = [v55 dateCreated];
    unsigned int v42 = [v14 creationOptions];
    id v43 = [v42 uniformTypeIdentifier];
    int v44 = [v57 orientation];
    id v45 = [v56 pathManager];
    LODWORD(v52) = v44;
    [v55 addSidecarFileAtIndex:0 sidecarURL:v40 withFilename:0 compressedSize:0 captureDate:v41 modificationDate:0 uniformTypeIdentifier:v43 imageOrientation:v52 pathManager:v45];

    BOOL v27 = 1;
    goto LABEL_17;
  }
  BOOL v27 = 0;
LABEL_18:
  if (a7 && !v27)
  {
    CFDataRef v46 = v82;
    id v47 = v82[5];
    if (v47)
    {
      id v48 = v47;
      id v49 = v46[5];
      void v46[5] = v48;
    }
    else
    {
      uint64_t v50 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to create sidecar from resources");
      id v49 = v82[5];
      v82[5] = (id)v50;
    }

    *a7 = v82[5];
  }

  _Block_object_dispose(&v81, 8);
  return v27;
}

BOOL __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pathForOriginalFile];
  id v3 = [v2 lastPathComponent];
  id v4 = [v3 stringByDeletingPathExtension];
  id v5 = [*(id *)(a1 + 40) pathExtension];
  id v6 = [v4 stringByAppendingPathExtension:v5];

  uint64_t v7 = [*(id *)(a1 + 32) fileURLForHypotheticalSidecarFileWithFilename:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

void __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v10 = [*(id *)(a1 + 48) capabilities];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v11 + 40);
    uint64_t v12 = [v8 _secureMove:v7 fileAtURL:v9 toURL:v5 capabilities:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

- (BOOL)_createAssetAsPhotoIris:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v68 = a5;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v13 = [v10 pathForOriginalFile];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
    [v12 addObject:v14];
  }
  id v15 = [v11 assetResourceWithType:9];
  id v16 = [v11 validatedURLForAssetResource:v15];
  if (v16) {
    [v12 addObject:v16];
  }
  __int16 v69 = v15;
  BOOL v17 = [v15 creationOptions];
  [v17 ensureOptionsAreCompleteForURL:v16];

  uint64_t v18 = [[_PHAssetCreationRequestValidator alloc] initWithAssetCreationRequest:self];
  v84[0] = 0;
  LODWORD(v17) = [(PHValidator *)v18 validateURLs:v12 withOptions:64 videoComplementMetadata:0 error:v84];
  id v19 = v84[0];
  int v20 = self;
  id v21 = v19;
  uint64_t v66 = (void *)v13;
  if (v17)
  {
    uint64_t v59 = v20;
    id v62 = a6;
    uint64_t v61 = [(_PHAssetCreationRequestValidator *)v18 validatedPairingIdentifier];
    [v12 removeAllObjects];
    char v22 = [v11 assetResourceWithType:13];
    uint64_t v23 = [v11 validatedURLForAssetResource:v22];
    id v63 = v10;
    id v65 = v18;
    if (!v23)
    {

      id v70 = 0;
      long long v67 = 0;
LABEL_13:
      uint64_t v33 = [v69 creationOptions];
      int v34 = [v33 shouldIngestInPlace];

      uint64_t v35 = (void *)MEMORY[0x1E4F1CB10];
      id v36 = [v63 pathForVideoComplementFile];
      uint64_t v37 = [v35 fileURLWithPath:v36 isDirectory:0];
      if (v34)
      {
        id v82 = v21;
        BOOL v38 = [(PHAssetCreationRequest *)v59 _ingestOriginalInPlaceSrcURL:v16 dstURL:v37 asset:v63 error:&v82];
        id v39 = v82;

        id v10 = v63;
        if (!v38)
        {
          id v60 = v39;
          id v41 = 0;
          char v30 = 0;
          id v32 = (void *)v61;
          a6 = v62;
          uint64_t v31 = v65;
          goto LABEL_33;
        }
        id v40 = v16;
        if (!v70)
        {
          id v41 = 0;
          id v42 = v68;
          uint64_t v31 = v65;
LABEL_25:
          id v32 = (void *)v61;
LABEL_28:
          long long v77 = 0uLL;
          uint64_t v78 = 0;
          id v60 = v39;
          id v64 = v41;
          if (v31)
          {
            id v56 = v40;
            [(_PHAssetCreationRequestValidator *)v31 validatedVideoDuration];
            long long v75 = 0uLL;
            uint64_t v76 = 0;
            [(_PHAssetCreationRequestValidator *)v31 validatedImageDisplayTime];
            id v40 = v56;
          }
          else
          {
            long long v75 = 0uLL;
            uint64_t v76 = 0;
          }
          a6 = v62;
          long long v73 = v77;
          uint64_t v74 = v78;
          long long v71 = v75;
          uint64_t v72 = v76;
          id v41 = v40;
          char v30 = [v10 becomePhotoIrisWithMediaGroupUUID:v32 mainFileMetadata:v42 videoURL:v40 spatialOverCaptureURL:v64 videoDuration:&v73 stillDisplayTime:&v71 options:0];

          goto LABEL_33;
        }
      }
      else
      {
        id v43 = [v69 creationOptions];
        id v81 = v21;
        uint64_t v44 = -[PHAssetCreationRequest _ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:](v59, "_ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:", v16, v37, [v43 shouldMoveFile], v69, 3, v63, &v81);
        id v39 = v81;

        id v40 = (id)v44;
        id v10 = v63;
        if (!v40 || !v70)
        {
          id v41 = 0;
          id v42 = v68;
          uint64_t v31 = v65;
          if (v40) {
            goto LABEL_25;
          }
          id v60 = v39;
          char v30 = 0;
          id v32 = (void *)v61;
          a6 = v62;
          goto LABEL_33;
        }
      }
      id v58 = v40;
      id v45 = [v67 creationOptions];
      int v46 = [v45 shouldIngestInPlace];

      id v47 = (void *)MEMORY[0x1E4F1CB10];
      id v48 = [v63 pathForVideoComplementSpatialOverCaptureContentFile];
      id v49 = [v47 fileURLWithPath:v48 isDirectory:0];
      if (v46)
      {
        id v80 = v39;
        BOOL v50 = [(PHAssetCreationRequest *)v59 _ingestOriginalInPlaceSrcURL:v70 dstURL:v49 asset:v63 error:&v80];
        id v51 = v80;
        uint64_t v52 = v39;
        id v39 = v51;

        id v10 = v63;
        if (v50)
        {
          id v41 = v70;
LABEL_27:
          id v42 = v68;
          uint64_t v31 = v65;
          id v32 = (void *)v61;
          id v40 = v58;
          goto LABEL_28;
        }
      }
      else
      {
        char v53 = [v67 creationOptions];
        id v79 = v39;
        -[PHAssetCreationRequest _ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:](v59, "_ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:", v70, v49, [v53 shouldMoveFile], v67, 11, v63, &v79);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        id v54 = v79;
        id v55 = v39;
        id v39 = v54;

        id v10 = v63;
        if (v41) {
          goto LABEL_27;
        }
      }
      id v60 = v39;
      char v30 = 0;
      id v32 = (void *)v61;
      a6 = v62;
      uint64_t v31 = v65;
      id v41 = v58;
LABEL_33:

      id v21 = v60;
      goto LABEL_34;
    }
    uint64_t v24 = (void *)v23;
    [v12 addObject:v23];
    BOOL v25 = [v11 assetResourceWithType:15];
    uint64_t v26 = [v11 validatedURLForAssetResource:v25];
    if (v26) {
      [v12 addObject:v26];
    }
    BOOL v27 = [v25 creationOptions];
    id v70 = (void *)v26;
    [v27 ensureOptionsAreCompleteForURL:v26];

    id v83 = v21;
    BOOL v28 = [(PHValidator *)v65 validateURLs:v12 withOptions:64 videoComplementMetadata:0 error:&v83];
    id v29 = v83;

    long long v67 = v25;
    if (v28)
    {
      id v21 = v29;
      goto LABEL_13;
    }
    char v30 = 0;
    id v21 = v29;
    a6 = v62;
    id v10 = v63;
    uint64_t v31 = v65;
    id v32 = (void *)v61;
  }
  else
  {
    id v70 = 0;
    long long v67 = 0;
    char v30 = 0;
    uint64_t v31 = v18;
    id v32 = 0;
  }
LABEL_34:
  if (a6 && (v30 & 1) == 0)
  {
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to create videoComplement from resources");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v21 = v21;
    *a6 = v21;
  }

  return v30;
}

- (id)_ingestOriginalFromSrcURL:(id)a3 toDstURL:(id)a4 useSecureMove:(BOOL)a5 resource:(id)a6 resourceType:(unsigned int)a7 asset:(id)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  BOOL v40 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__14582;
  uint64_t v59 = __Block_byref_object_dispose__14583;
  id v60 = 0;
  uint64_t v49 = 0;
  BOOL v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__14582;
  char v53 = __Block_byref_object_dispose__14583;
  id v54 = 0;
  BOOL v17 = [v16 photoLibrary];
  uint64_t v18 = [v17 pathManager];

  if (![v18 isUBF])
  {
    if (!v14)
    {
LABEL_12:
      if (a9) {
        *a9 = (id) v56[5];
      }
      id v33 = (id)v50[5];
      goto LABEL_15;
    }
    int v20 = [v16 photoLibrary];
    id v21 = [v20 pathManager];

    char v22 = [v21 capabilities];
    uint64_t v23 = (id *)(v56 + 5);
    id obj = (id)v56[5];
    uint64_t v24 = [(PHAssetCreationRequest *)self _secureMove:v40 fileAtURL:v41 toURL:v14 capabilities:v22 error:&obj];
    objc_storeStrong(v23, obj);
    BOOL v25 = (void *)v50[5];
    v50[5] = v24;

LABEL_11:
    goto LABEL_12;
  }
  if (v15)
  {
    id v19 = [v15 uniformTypeIdentifier];
    if (v19)
    {

LABEL_8:
      id v28 = objc_alloc(MEMORY[0x1E4F8B978]);
      id v29 = [v16 uuid];
      char v30 = [v15 uniformTypeIdentifier];
      uint64_t v31 = [v15 originalFilename];
      id v21 = (void *)[v28 initWithAssetUuid:v29 bundleScope:0 uti:v30 resourceVersion:0 resourceType:v10 recipeID:0 originalFilename:v31];

      id v32 = [v16 photoLibrary];
      LODWORD(v28) = v32 == 0;

      if (v28)
      {
        BOOL v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2, self, @"PHAssetCreationRequest.m", 1702, @"Invalid parameter not satisfying: %@", @"asset.photoLibrary" object file lineNumber description];
      }
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __109__PHAssetCreationRequest__ingestOriginalFromSrcURL_toDstURL_useSecureMove_resource_resourceType_asset_error___block_invoke;
      v43[3] = &unk_1E5844228;
      int v46 = &v49;
      v43[4] = self;
      BOOL v48 = v40;
      id v44 = v41;
      id v45 = v18;
      id v47 = &v55;
      [v45 obtainAccessAndWaitWithFileWithIdentifier:v21 mode:2 toURLWithHandler:v43];

      goto LABEL_11;
    }
    uint64_t v26 = [v15 originalFilename];
    BOOL v27 = v26 == 0;

    if (!v27) {
      goto LABEL_8;
    }
  }
  uint64_t v35 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    id v36 = [v15 uniformTypeIdentifier];
    uint64_t v37 = [v15 originalFilename];
    *(_DWORD *)buf = 134218498;
    id v62 = v15;
    __int16 v63 = 2112;
    id v64 = v36;
    __int16 v65 = 2112;
    uint64_t v66 = v37;
    _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_ERROR, "Resource (%p) must be non-nil and either resource.uniformTypeIdentifier (%@) or resource.originalFilename (%@) must be non-nil", buf, 0x20u);
  }
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to ingest resource file from source to destination");
    id v33 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v33 = 0;
  }
LABEL_15:

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v33;
}

void __109__PHAssetCreationRequest__ingestOriginalFromSrcURL_toDstURL_useSecureMove_resource_resourceType_asset_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 48) capabilities];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v11 + 40);
    uint64_t v12 = [v8 _secureMove:v7 fileAtURL:v9 toURL:v5 capabilities:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

- (BOOL)_ingestOriginalInPlaceSrcURL:(id)a3 dstURL:(id)a4 asset:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 path];
  uint64_t v13 = [v12 stringByDeletingPathExtension];

  id v14 = [v9 path];
  id v15 = [v14 stringByDeletingPathExtension];

  char v16 = 0;
  id v17 = 0;
  if (v15 && v13)
  {
    if (![v13 isEqualToString:v15])
    {
      id v17 = 0;
      char v16 = 0;
      if (!a6) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    uint64_t v18 = [v11 photoLibrary];
    id v19 = [v18 pathManager];
    int v20 = [v19 capabilities];

    id v22 = 0;
    char v16 = [MEMORY[0x1E4F8B908] ingestItemAtURL:v9 toURL:v10 type:0 options:3 capabilities:v20 error:&v22];
    id v17 = v22;
  }
  if (a6) {
LABEL_6:
  }
    *a6 = v17;
LABEL_7:

  return v16;
}

- (BOOL)_createAssetAsAdjusted:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 error:(id *)a6
{
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v11 hasAdjustments] & 1) == 0)
  {
    v153 = [MEMORY[0x1E4F28B00] currentHandler];
    [v153 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:1376 description:@"expect adjustment resources"];
  }
  uint64_t v182 = [v11 mediaType];
  if (![v11 hasCurrentAdjustment]) {
    goto LABEL_135;
  }
  v184 = a6;
  id v186 = v12;
  uint64_t v13 = [v11 assetResourceWithType:7];
  v183 = [v11 assetResourceWithType:108];
  v180 = [v11 assetResourceWithType:110];
  uint64_t v14 = [v11 validatedURLForAssetResource:v13];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v14];
  char v16 = self;
  v181 = v13;
  v178 = (void *)v14;
  if (!v15)
  {
    BOOL v25 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions backupAdjustmentsFile];

    if (!v25
      || (id v26 = objc_alloc(MEMORY[0x1E4F1C9E8]),
          -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](self->_cameraIngestOptions, "backupAdjustmentsFile"), BOOL v27 = objc_claimAutoreleasedReturnValue(), v15 = (void *)[v26 initWithContentsOfFile:v27], v27, !v15))
    {
      id v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v202 = *MEMORY[0x1E4F28228];
      v203 = @"Unable to determine adjustment data";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
      objc_msgSend(v28, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v15);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_134;
    }
  }
  id v17 = [v13 creationOptions];
  int v18 = [v17 shouldMoveFile];

  aSelector = a2;
  if (v18)
  {
    id v19 = [MEMORY[0x1E4F8B908] fileManager];
    id v193 = 0;
    [v19 removeItemAtURL:v14 error:&v193];
    id v20 = v193;
  }
  else
  {
    id v20 = 0;
  }
  id v21 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
  uint64_t v179 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
  uint64_t v22 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
  uint64_t v23 = [(PHAssetChangeRequest *)self editorBundleID];
  uint64_t v24 = v23;
  if (v23)
  {
    id v171 = v23;
  }
  else
  {
    id v171 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA60]];
  }
  id v29 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA50]];
  uint64_t v156 = [v29 integerValue];

  uint64_t v30 = *MEMORY[0x1E4F8BA78];
  uint64_t v31 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA78]];
  unsigned int v158 = [v31 intValue];

  BOOL v154 = [(PHChangeRequest *)self shouldPerformConcurrentWork];
  BOOL v32 = [v10 importedBy] == 1 || objc_msgSend(v10, "importedBy") == 2;
  BOOL v155 = v32;
  if (!v22 && v183)
  {
    id v33 = v10;
    int v34 = v21;
    uint64_t v35 = [v11 validatedURLForAssetResource:v183];
    id v36 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v37 = [v35 path];
    int v38 = [v36 fileExistsAtPath:v37];

    if (v38)
    {
      uint64_t v39 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v35];
    }
    else
    {
      uint64_t v39 = 0;
    }

    char v16 = self;
    id v21 = v34;
    id v10 = v33;
    uint64_t v22 = v39;
  }
  BOOL v40 = (void *)v179;
  v177 = (void *)v22;
  __int16 v162 = v21;
  if (!v21 || !v179 || !v22)
  {
    id v41 = [(PHAssetCreationCameraIngestOptions *)v16->_cameraIngestOptions backupAdjustmentsFile];

    if (!v41)
    {
      uint64_t v57 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v206 = *MEMORY[0x1E4F28228];
      v207 = @"Unable to determine adjustment data format and version";
      id v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
      uint64_t v59 = objc_msgSend(v57, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v58);

      BOOL v60 = 0;
      v168 = 0;
      v169 = 0;
      v172 = 0;
      aSelectora = 0;
      uint64_t v166 = 0;
      v160 = 0;
      v161 = 0;
      id v20 = (id)v59;
      id v56 = v177;
      if (!v20) {
        goto LABEL_101;
      }
      goto LABEL_133;
    }
  }
  BOOL v42 = [v10 playbackStyle] == 3 || objc_msgSend(v10, "playbackStyle") == 5;
  if (v16->_duplicateAssetIdentifier) {
    unsigned int v167 = v42;
  }
  else {
    unsigned int v167 = ([v11 mediaSubtype] >> 3) & 1;
  }
  id v192 = 0;
  char v43 = [MEMORY[0x1E4F8AA58] validateAdjustmentData:v22 formatIdentifier:v21 formatVersion:v179 error:&v192];
  id v159 = v192;
  if ((v43 & 1) == 0)
  {
    id v44 = [(PHAssetCreationCameraIngestOptions *)v16->_cameraIngestOptions backupAdjustmentsFile];

    if (!v44)
    {
      id v45 = PLBackendGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v217 = v46;
        __int16 v218 = 2112;
        id v219 = v159;
        _os_log_impl(&dword_19B043000, v45, OS_LOG_TYPE_DEFAULT, "%@ - Invalid adjustment. Relying on rendered resources. Error: %@", buf, 0x16u);
      }
      BOOL v40 = (void *)v179;
    }
  }
  id v47 = [v15 objectForKeyedSubscript:v30];
  char v48 = [v47 integerValue];

  if (v182 != 2)
  {
    if (v182 != 1)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Unexpected media type");
      BOOL v54 = 0;
      v168 = 0;
      v169 = 0;
      v172 = 0;
      aSelectora = 0;
      uint64_t v163 = 0;
      uint64_t v166 = 0;
      v160 = 0;
      v161 = 0;
      uint64_t v55 = v20;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = v162;
LABEL_99:
      id v56 = v177;
      goto LABEL_100;
    }
    uint64_t v49 = [v11 assetResourceWithType:5];
    BOOL v50 = [v11 assetResourceWithType:5];
    if (!v49)
    {
      uint64_t v49 = [v11 assetResourceWithType:107];
    }
    char v165 = v48;
    if (!v50)
    {
      BOOL v50 = [v11 assetResourceWithType:111];
    }
    uint64_t v51 = [v11 validatedURLForAssetResource:v49];
    uint64_t v52 = [v11 validatedDataForAssetResource:v50];
    uint64_t v53 = [v52 length];
    v160 = v52;
    if (v51)
    {
      uint64_t v163 = v51;
      BOOL v54 = 0;
LABEL_46:
      v161 = 0;
LABEL_72:
      if (!v167 || v20)
      {
        uint64_t v55 = v49;
      }
      else
      {
        uint64_t v55 = [v11 assetResourceWithType:10];

        uint64_t v75 = [v11 validatedURLForAssetResource:v55];
        v169 = (void *)v75;
        if (v75) {
          char v76 = 1;
        }
        else {
          char v76 = v43;
        }
        if (v75) {
          int v77 = v54;
        }
        else {
          int v77 = 1;
        }
        if (v76)
        {
          BOOL v54 = v77;
          id v21 = v162;
          goto LABEL_85;
        }
        uint64_t v78 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v212 = *MEMORY[0x1E4F28228];
        v213 = @"This resource set requires a full size video complement render resource to be provided";
        id v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v213 forKeys:&v212 count:1];
        objc_msgSend(v78, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v79);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v21 = v162;
      v169 = 0;
      v172 = 0;
      aSelectora = 0;
      if (v20)
      {
LABEL_98:

        uint64_t v166 = 0;
        v168 = 0;
        BOOL v40 = (void *)v179;
        goto LABEL_99;
      }
LABEL_85:
      id v80 = [v11 assetResourceWithType:8];
      if (v80)
      {
        aSelectora = [v11 validatedDataForAssetResource:v80];
        if (!aSelectora)
        {
          id v81 = [v11 validatedURLForAssetResource:v80];
          aSelectora = (char *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v81];
        }
        if (v167)
        {
          uint64_t v82 = [v11 assetResourceWithType:11];

          v172 = [v11 validatedURLForAssetResource:v82];
          if (!v172)
          {
            if ((v165 & 0x20) != 0)
            {
              v151 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v210 = *MEMORY[0x1E4F28228];
              v211 = @"This resource set requires a adjustment base video complement resource to be provided";
              v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
              objc_msgSend(v151, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v152);
              id v20 = (id)objc_claimAutoreleasedReturnValue();

              id v21 = v162;
              v172 = 0;
              goto LABEL_93;
            }
            v172 = 0;
          }
          id v20 = 0;
LABEL_93:
          id v80 = (void *)v82;
LABEL_97:

          goto LABEL_98;
        }
        v172 = 0;
      }
      else
      {
        v172 = 0;
        aSelectora = 0;
      }
      id v20 = 0;
      goto LABEL_97;
    }
    if (v53)
    {
      if (![v52 length])
      {
        BOOL v54 = 0;
        uint64_t v163 = 0;
        goto LABEL_46;
      }
      uint64_t v61 = DCIM_newPLImageWithStoredJPEGData();
      aSelectorb = [v10 photoLibrary];
      v173 = [aSelectorb libraryServicesManager];
      id v62 = [v173 imageWriter];
      uint64_t v63 = [v10 filename];
      id v64 = v52;
      __int16 v65 = (void *)v63;
      v170 = (void *)v61;
      uint64_t v66 = [v62 writeFilteredPreviewWithImageData:v64 orImage:v61 toPathWithBaseName:v63];

      if (v66)
      {
        v161 = (void *)v66;
        uint64_t v163 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v66 isDirectory:0];
      }
      else
      {
        uint64_t v163 = 0;
        v161 = 0;
      }
      long long v73 = v170;
    }
    else
    {
      if (v43)
      {
        uint64_t v163 = 0;
        v161 = 0;
        BOOL v54 = 1;
        goto LABEL_72;
      }
      uint64_t v72 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v214 = *MEMORY[0x1E4F28228];
      id v215 = @"This resource set requires a full size render resource to be provided";
      long long v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
      uint64_t v74 = objc_msgSend(v72, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v73);

      uint64_t v163 = 0;
      v161 = 0;
      id v20 = (id)v74;
    }

    BOOL v54 = 0;
    goto LABEL_72;
  }
  uint64_t v55 = [v11 assetResourceWithType:6];
  if (!v55)
  {
    uint64_t v55 = [v11 assetResourceWithType:107];
  }
  [v11 validatedURLForAssetResource:v55];
  v163 = id v56 = v177;
  if (v163)
  {
    BOOL v54 = 0;
  }
  else if (v43)
  {
    BOOL v54 = [v10 kindSubtype] != 101;
  }
  else
  {
    uint64_t v67 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v208 = *MEMORY[0x1E4F28228];
    v209 = @"This resource set requires a full size video render resource to be provided";
    id v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
    uint64_t v69 = objc_msgSend(v67, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v68);

    BOOL v54 = 0;
    id v20 = (id)v69;
    id v56 = v177;
  }
  id v21 = v162;
  if (v20)
  {
    v168 = 0;
    v169 = 0;
    v172 = 0;
    uint64_t v166 = 0;
  }
  else
  {
    id v70 = [v11 assetResourceWithType:5];
    v168 = [v11 validatedURLForAssetResource:v70];
    long long v71 = [v11 assetResourceWithType:12];
    uint64_t v166 = [v11 validatedURLForAssetResource:v71];

    id v56 = v177;
    v172 = 0;
    v169 = 0;
  }
  v160 = 0;
  v161 = 0;
  aSelectora = 0;
LABEL_100:

  BOOL v60 = v54;
  id v41 = (void *)v163;
  if (!v20)
  {
LABEL_101:
    id v83 = (void *)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithFormatIdentifier:v21 formatVersion:v40 data:v56 baseVersion:v156 editorBundleID:v171 renderTypes:v158];
    if (!v83)
    {
      uint64_t v98 = [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions backupAdjustmentsFile];

      if (!v98
        || ([(PHAssetCreationRequest *)self _createAssetAdjustmentsFromBackupWithAsset:v10], (id v83 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v99 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v204 = *MEMORY[0x1E4F28228];
        v205 = @"Unable to create adjustments from adjustment data";
        uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
        objc_msgSend(v99, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v100);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_132:
        id v56 = v177;

        goto LABEL_133;
      }
    }
    double v84 = *MEMORY[0x1E4F1DB30];
    double v85 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    id v86 = [v10 dateCreated];
    v157 = v83;
    [v83 setAdjustmentTimestamp:v86];

    [v181 creationOptions];
    v88 = uint64_t v87 = v41;
    uint64_t v89 = 4;
    if ([v88 shouldMoveFile]) {
      uint64_t v90 = 4;
    }
    else {
      uint64_t v90 = 1;
    }

    [v10 setCameraProcessingAdjustmentStateFromAdjustmentRenderTypes:v158];
    v91 = [v87 path];
    char v92 = [v91 containsString:@"fullsizerender.JPG"];

    if (v92)
    {
      uint64_t v93 = 0;
      uint64_t v94 = 1;
      uint64_t v95 = 1;
      uint64_t v96 = v87;
LABEL_119:
      id v103 = objc_alloc_init(MEMORY[0x1E4F8A9C8]);
      v164 = v96;
      [v103 setRenderedContentURL:v96];
      [v103 setPenultimateRenderedJPEGData:aSelectora];
      [v103 setPenultimateRenderedVideoContentURL:v166];
      [v103 setSubstandardRender:v93];
      [v103 setDeferred:v60];
      objc_msgSend(v103, "setFullSizeRenderSize:", v84, v85);
      [v103 setRenderedVideoComplementContentURL:v169];
      [v103 setPenultimateRenderedVideoComplementContentURL:v172];
      [v103 setRenderedVideoPosterContentURL:v168];
      [v103 setMainFileMetadata:v186];
      [v103 setShouldUpdateAttributes:v95];
      [v103 setFileIngestionType:v89];
      [v103 setShouldGenerateThumbnails:v94];
      [v103 setShouldCheckForLegacyCameraAutoAdjustment:!v155];
      v104 = [v11 validatedURLForAssetResource:v180];
      [v103 setAdjustmentSecondaryDataURL:v104];

      uint64_t v100 = v157;
      [v10 setAdjustments:v157 options:v103];
      if (v60 && ![v10 deferredProcessingNeeded]) {
        [v10 setDeferredProcessingNeeded:2];
      }
      CMTime v105 = [(PHChangeRequest *)self helper];
      long long v106 = [v105 clientAuthorization];
      int v107 = [v106 isCameraClient];

      BOOL v40 = (void *)v179;
      if (!v107) {
        goto LABEL_125;
      }
      long long v108 = [v11 assetResourceWithType:16];
      if (!v108)
      {
        if ([v10 setCurrentAdjustmentAsOriginalAdjustment]) {
          goto LABEL_125;
        }
        long long v108 = PLPhotoKitIngestGetLog();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v108, OS_LOG_TYPE_ERROR, "Failed to set original adjustment file (AAE) for asset", buf, 2u);
        }
      }

LABEL_125:
      if (v182 == 1)
      {
        long long v109 = [v11 assetResourceWithType:8];
        objc_super v110 = [v109 creationOptions];
        int v111 = [v110 shouldMoveFile];

        if (v111)
        {
          uint64_t v112 = [v11 validatedURLForAssetResource:v109];
          uint64_t v113 = [MEMORY[0x1E4F8B908] fileManager];
          id v191 = 0;
          [v113 removeItemAtURL:v112 error:&v191];
          id v20 = v191;
        }
        else
        {
          id v20 = 0;
        }
        id v41 = v164;
      }
      else
      {
        id v20 = 0;
        id v41 = v164;
      }

      id v21 = v162;
      goto LABEL_132;
    }
    uint64_t v97 = [v87 pathExtension];
    uint64_t v96 = v87;
    if ([v97 isEqualToString:@"largeThumbnail"])
    {
    }
    else
    {

      uint64_t v93 = 0;
      uint64_t v95 = 1;
      if (!v87 || !v161)
      {
LABEL_118:
        uint64_t v89 = v90;
        uint64_t v94 = !v154;
        goto LABEL_119;
      }
    }
    [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetWidth];
    double v84 = v101;
    [(PHAssetCreationCameraIngestOptions *)self->_cameraIngestOptions finalAssetHeight];
    double v85 = v102;
    uint64_t v95 = 0;
    BOOL v60 = 1;
    if (v84 <= 0.0 && v102 <= 0.0)
    {
      double v84 = (double)[v10 width];
      uint64_t v95 = 0;
      double v85 = (double)[v10 height];
    }
    uint64_t v93 = 1;
    goto LABEL_118;
  }
LABEL_133:

LABEL_134:
  a6 = v184;
  id v12 = v186;
  if (v20) {
    goto LABEL_163;
  }
LABEL_135:
  if (![v11 hasOriginalAdjustment]) {
    goto LABEL_152;
  }
  v185 = a6;
  id v187 = v12;
  BOOL v114 = [v11 assetResourceWithType:16];
  v115 = [v11 validatedURLForAssetResource:v114];
  id v116 = [v114 creationOptions];
  [v116 ensureOptionsAreCompleteForURL:v115];

  v117 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v115];
  uint64_t v118 = [v117 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
  if (!v118) {
    goto LABEL_143;
  }
  v119 = (void *)v118;
  uint64_t v120 = [v117 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
  if (!v120)
  {

    goto LABEL_143;
  }
  v121 = (void *)v120;
  v122 = [v117 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];

  if (!v122)
  {
LABEL_143:
    double v126 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v198 = *MEMORY[0x1E4F28228];
    int v199 = @"Unable to determine original adjustment data format and version";
    double v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];
    objc_msgSend(v126, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v127);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_150:

    goto LABEL_151;
  }
  v123 = [v117 objectForKeyedSubscript:*MEMORY[0x1E4F8BA78]];
  char v124 = [v123 integerValue];

  if ((v124 & 0x10) == 0) {
    goto LABEL_146;
  }
  uint64_t v125 = v182 == 1 ? 13 : 14;
  double v128 = [v11 assetResourceWithType:v125];

  if (v128) {
    goto LABEL_146;
  }
  v149 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v200 = *MEMORY[0x1E4F28228];
  v201 = @"This resource set requires a adjustment base resource to be provided";
  v150 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
  objc_msgSend(v149, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v150);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_146:
    double v127 = [v11 validatedURLForAssetResource:v114];
    double v129 = [v114 creationOptions];
    int v130 = [v129 shouldIngestInPlace];

    v131 = (void *)MEMORY[0x1E4F1CB10];
    int v132 = [v10 pathForOriginalAdjustmentFile];
    v133 = [v131 fileURLWithPath:v132];
    if (v130)
    {
      id v190 = 0;
      [(PHAssetCreationRequest *)self _ingestOriginalInPlaceSrcURL:v127 dstURL:v133 asset:v10 error:&v190];
      id v20 = v190;
    }
    else
    {
      uint64_t v134 = [v114 creationOptions];
      id v189 = 0;
      id v135 = -[PHAssetCreationRequest _ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:](self, "_ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:", v127, v133, [v134 shouldMoveFile], v114, 5, v10, &v189);
      id v20 = v189;
    }
    goto LABEL_150;
  }
LABEL_151:

  a6 = v185;
  id v12 = v187;
  if (v20) {
    goto LABEL_163;
  }
LABEL_152:
  v136 = [v11 assetResourceWithType:18];
  if (v136)
  {
    id v137 = objc_alloc(MEMORY[0x1E4F8CE18]);
    v138 = [v136 fileURL];
    v139 = (void *)[v137 initWithURL:v138];

    if (v139)
    {
      uint64_t v140 = [v139 adjustmentFormatIdentifier];
      if (v140)
      {
        id v141 = (void *)v140;
        id v142 = [v139 adjustmentFormatVersion];

        if (v142)
        {
          v143 = [MEMORY[0x1E4F8A678] assetAdjustmentOptionsForSLMAdjustmentsWithMainFileMetadata:v12];
          [v10 setAdjustments:v139 options:v143];
          id v20 = 0;
LABEL_161:

          goto LABEL_162;
        }
      }
      uint64_t v144 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v196 = *MEMORY[0x1E4F28228];
      v197 = @"Unable to determine slomo adjustment data format and version";
      v145 = (void *)MEMORY[0x1E4F1C9E8];
      char v146 = &v197;
      v147 = &v196;
    }
    else
    {
      uint64_t v144 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v194 = *MEMORY[0x1E4F28228];
      v195 = @"Unable to create adjustments from slo-mo adjustment data";
      v145 = (void *)MEMORY[0x1E4F1C9E8];
      char v146 = &v195;
      v147 = &v194;
    }
    v143 = [v145 dictionaryWithObjects:v146 forKeys:v147 count:1];
    objc_msgSend(v144, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v143);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_161;
  }
  id v20 = 0;
LABEL_162:

LABEL_163:
  if (a6) {
    *a6 = v20;
  }

  return v20 == 0;
}

- (id)_secureMove:(BOOL)a3 assetResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  BOOL v40 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 fileURL];
  if (v11)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v35 = id v34 = v9;
    [v35 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:1343 description:@"expect file url"];

    id v9 = v34;
    if (v10) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v37 = v36 = v9;
  [v37 handleFailureInMethod:a2, self, @"PHAssetCreationRequest.m", 1344, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

  id v9 = v36;
LABEL_3:
  [v10 pathManager];
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = __Block_byref_object_copy__14582;
  id v58 = __Block_byref_object_dispose__14583;
  id v41 = v59 = 0;
  if ([v41 isUBF])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F8B978]);
    uint64_t v13 = [(PHChangeRequest *)self uuid];
    uint64_t v14 = [(PHAssetCreationRequest *)self bundleScope];
    id v15 = [v9 uniformTypeIdentifier];
    char v16 = [v9 originalFilename];
    id v17 = (void *)[v12 initWithAssetUuid:v13 bundleScope:v14 uti:v15 resourceVersion:0 resourceType:31 recipeID:0 originalFilename:v16];

    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x3032000000;
    uint64_t v51 = __Block_byref_object_copy__14582;
    uint64_t v52 = __Block_byref_object_dispose__14583;
    id v53 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    void v42[2] = __71__PHAssetCreationRequest__secureMove_assetResource_photoLibrary_error___block_invoke;
    v42[3] = &unk_1E5844228;
    id v45 = &v54;
    v42[4] = self;
    BOOL v47 = v40;
    id v43 = v11;
    int v18 = v41;
    id v44 = v41;
    id v46 = &v48;
    [v44 obtainAccessAndWaitWithFileWithIdentifier:v17 mode:2 toURLWithHandler:v42];
    if (a6)
    {
      id v19 = (void *)v49[5];
      if (v19) {
        *a6 = v19;
      }
    }

    _Block_object_dispose(&v48, 8);
    id v20 = 0;
    goto LABEL_13;
  }
  if (self->_momentShareUUID)
  {
    id v38 = v9;
    id v21 = [v10 pathManager];
    uint64_t v22 = [v21 privateDirectoryWithSubType:7];
    uint64_t v23 = [v22 stringByAppendingPathComponent:self->_momentShareUUID];

    uint64_t v24 = [v10 libraryServicesManager];
    BOOL v25 = [v24 imageWriter];
    id v26 = [(PHChangeRequest *)self uuid];
    BOOL v27 = [v11 pathExtension];
    id v28 = [v27 uppercaseString];
    id v20 = [v25 pathForNewAssetWithDirectoryPath:v23 fileName:v26 extension:v28];

    id v9 = v38;
  }
  else
  {
    uint64_t v23 = [v10 libraryServicesManager];
    uint64_t v24 = [v23 imageWriter];
    BOOL v25 = [v11 pathExtension];
    id v26 = [v25 uppercaseString];
    BOOL v27 = [(PHChangeRequest *)self uuid];
    id v20 = [v24 cameraAssetPathForNewAssetWithExtension:v26 assetUUID:v27];
  }

  if (v20)
  {
    id v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:0];
    id v29 = [v41 capabilities];
    uint64_t v30 = [(PHAssetCreationRequest *)self _secureMove:v40 fileAtURL:v11 toURL:v17 capabilities:v29 error:a6];
    uint64_t v31 = (void *)v55[5];
    v55[5] = v30;

    int v18 = v41;
LABEL_13:

    goto LABEL_14;
  }
  int v18 = v41;
LABEL_14:
  id v32 = (id)v55[5];
  _Block_object_dispose(&v54, 8);

  return v32;
}

void __71__PHAssetCreationRequest__secureMove_assetResource_photoLibrary_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 48) capabilities];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v11 + 40);
    uint64_t v12 = [v8 _secureMove:v7 fileAtURL:v9 toURL:v5 capabilities:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

- (id)_secureMove:(BOOL)a3 fileAtURL:(id)a4 toURL:(id)a5 capabilities:(id)a6 error:(id *)a7
{
  BOOL v10 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"PHAssetCreationRequest.m" lineNumber:1311 description:@"expect file url"];
  }
  if (v10)
  {
    uint64_t v16 = *MEMORY[0x1E4F8C3F0];
    id v32 = 0;
    int v17 = [MEMORY[0x1E4F8B908] stripExtendedAttributesFromFileAtURL:v13 inDomain:v16 error:&v32];
    id v18 = v32;
    id v19 = v18;
    if (v17)
    {
      id v31 = v18;
      int v20 = [MEMORY[0x1E4F8B908] secureMoveItemAtURL:v13 toURL:v14 capabilities:v15 error:&v31];
      id v21 = v31;

      if (v20)
      {
        [(PHAssetCreationRequest *)self _didMoveFileFromURL:v13 toURL:v14];
        goto LABEL_17;
      }
    }
    else
    {
      id v21 = v18;
    }
    goto LABEL_14;
  }
  id v30 = 0;
  int v22 = [MEMORY[0x1E4F8B908] copyItemAtURL:v13 toURL:v14 error:&v30];
  id v21 = v30;
  if (!v22)
  {
LABEL_14:

    if (a7)
    {
      id v21 = v21;
      id v14 = 0;
      *a7 = v21;
    }
    else
    {
      id v14 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v23 = *MEMORY[0x1E4F8C3F0];
  id v29 = 0;
  char v24 = [MEMORY[0x1E4F8B908] stripExtendedAttributesFromFileAtURL:v14 inDomain:v23 error:&v29];
  id v25 = v29;
  if ((v24 & 1) == 0)
  {
    id v26 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v14;
      __int16 v35 = 2112;
      id v36 = v25;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Failed to strip extended attributes from %@, %@", buf, 0x16u);
    }
  }
LABEL_17:

  return v14;
}

- (NSDictionary)_movedFiles
{
  return (NSDictionary *)self->_movedFiles;
}

- (void)_resetMovedFiles
{
  [(NSMutableDictionary *)self->_movedFiles removeAllObjects];
  movedFiles = self->_movedFiles;
  self->_movedFiles = 0;
}

- (BOOL)_restoreMovedFilesOnFailure
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v20 = [MEMORY[0x1E4F8B908] fileManager];
  id v3 = (void *)[(NSMutableDictionary *)self->_movedFiles copy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = 0;
    uint64_t v8 = *(void *)v23;
    char v18 = 1;
    *(void *)&long long v5 = 138412802;
    long long v17 = v5;
    do
    {
      uint64_t v9 = 0;
      BOOL v10 = v7;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v12 = -[NSMutableDictionary objectForKey:](self->_movedFiles, "objectForKey:", v11, v17);
        id v21 = v10;
        int v13 = [v20 moveItemAtURL:v11 toURL:v12 error:&v21];
        id v7 = v21;

        if (v13)
        {
          [(NSMutableDictionary *)self->_movedFiles removeObjectForKey:v11];
        }
        else
        {
          id v14 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v27 = v11;
            __int16 v28 = 2112;
            id v29 = v12;
            __int16 v30 = 2112;
            id v31 = v7;
            _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Failed to restore moved file from %@ to %@ %@", buf, 0x20u);
          }

          char v18 = 0;
        }

        ++v9;
        BOOL v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v6);

    char v15 = v18;
  }
  else
  {
    char v15 = 1;
  }

  return v15 & 1;
}

- (void)_didMoveFileFromURL:(id)a3 toURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  movedFiles = self->_movedFiles;
  if (!movedFiles)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v9 = self->_movedFiles;
    self->_movedFiles = v8;

    movedFiles = self->_movedFiles;
  }
  [(NSMutableDictionary *)movedFiles setObject:v10 forKey:v6];
}

- (void)_copyMediaAnalysisProperties:(id)a3
{
  id v4 = a3;
  [v4 fetchPropertySetsIfNeeded];
  long long v5 = [v4 mediaAnalysisProperties];
  [v5 bestPlaybackRect];
  -[PHAssetChangeRequest setBestPlaybackRectWithNormalizedRect:](self, "setBestPlaybackRectWithNormalizedRect:");

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [(PHAssetChangeRequest *)self setMediaAnalysisTimeStamp:v6];

  id v7 = [v4 mediaAnalysisProperties];
  uint64_t v8 = v7;
  if (v7) {
    [v7 bestKeyFrameTime];
  }
  else {
    memset(v32, 0, sizeof(v32));
  }
  [(PHAssetChangeRequest *)self setBestKeyFrame:0 time:v32];

  uint64_t v9 = [v4 mediaAnalysisProperties];
  id v10 = v9;
  if (v9) {
    [v9 bestVideoTimeRange];
  }
  else {
    memset(v31, 0, sizeof(v31));
  }
  [(PHAssetChangeRequest *)self setBestVideoTimeRange:v31];

  uint64_t v11 = [v4 mediaAnalysisProperties];
  uint64_t v12 = v11;
  if (v11) {
    [v11 animatedStickerTimeRange];
  }
  else {
    memset(v30, 0, sizeof(v30));
  }
  [(PHAssetChangeRequest *)self setAnimatedStickerTimeRange:v30];

  int v13 = [v4 mediaAnalysisProperties];
  [v13 blurrinessScore];
  -[PHAssetChangeRequest setBlurrinessScore:](self, "setBlurrinessScore:");

  id v14 = [v4 mediaAnalysisProperties];
  [v14 exposureScore];
  -[PHAssetChangeRequest setExposureScore:](self, "setExposureScore:");

  char v15 = [v4 mediaAnalysisProperties];
  [v15 wallpaperScore];
  -[PHAssetChangeRequest setWallpaperScore:](self, "setWallpaperScore:");

  uint64_t v16 = [v4 mediaAnalysisProperties];
  [v16 autoplaySuggestionScore];
  -[PHAssetChangeRequest setAutoplaySuggestionScore:](self, "setAutoplaySuggestionScore:");

  long long v17 = [v4 mediaAnalysisProperties];
  [v17 videoStickerSuggestionScore];
  -[PHAssetChangeRequest setVideoStickerSuggestionScore:](self, "setVideoStickerSuggestionScore:");

  char v18 = [v4 mediaAnalysisProperties];
  [v18 videoScore];
  -[PHAssetChangeRequest setVideoScore:](self, "setVideoScore:");

  id v19 = [v4 mediaAnalysisProperties];
  [v19 activityScore];
  -[PHAssetChangeRequest setActivityScore:](self, "setActivityScore:");

  int v20 = [v4 mediaAnalysisProperties];
  [v20 audioScore];
  -[PHAssetChangeRequest setAudioScore:](self, "setAudioScore:");

  id v21 = [v4 mediaAnalysisProperties];
  [v21 settlingEffectScore];
  -[PHAssetChangeRequest setSettlingEffectScore:](self, "setSettlingEffectScore:");

  long long v22 = [v4 mediaAnalysisProperties];
  -[PHAssetChangeRequest setFaceCount:](self, "setFaceCount:", [v22 faceCount]);

  long long v23 = [v4 mediaAnalysisProperties];
  -[PHAssetChangeRequest setAudioClassification:](self, "setAudioClassification:", [v23 audioClassification]);

  long long v24 = [v4 mediaAnalysisProperties];
  -[PHAssetChangeRequest setProbableRotationDirection:](self, "setProbableRotationDirection:", [v24 probableRotationDirection]);

  long long v25 = [v4 mediaAnalysisProperties];
  [v25 probableRotationDirectionConfidence];
  -[PHAssetChangeRequest setProbableRotationDirectionConfidence:](self, "setProbableRotationDirectionConfidence:");

  id v26 = [v4 mediaAnalysisProperties];
  uint64_t v27 = [v26 colorNormalizationData];
  [(PHAssetChangeRequest *)self setColorNormalizationData:v27];

  __int16 v28 = [v4 mediaAnalysisProperties];
  [v28 bestPlaybackRect];
  -[PHAssetChangeRequest setBestPlaybackRectWithNormalizedRect:](self, "setBestPlaybackRectWithNormalizedRect:");

  id v29 = [v4 mediaAnalysisProperties];
  -[PHAssetChangeRequest setScreenTimeDeviceImageSensitivity:](self, "setScreenTimeDeviceImageSensitivity:", [v29 screenTimeDeviceImageSensitivity]);
}

- (void)_copyUserSpecificMetadataFromAsset:(id)a3
{
  id v4 = a3;
  -[PHAssetChangeRequest setHidden:](self, "setHidden:", [v4 isHidden]);
  -[PHAssetChangeRequest setFavorite:](self, "setFavorite:", [v4 isFavorite]);
  id v5 = [v4 title];

  [(PHAssetChangeRequest *)self setTitle:v5];
}

- (void)_copyMetadataFromAsset:(id)a3
{
  id v7 = a3;
  [v7 fetchPropertySetsIfNeeded];
  id v4 = [v7 creationDate];
  [(PHAssetChangeRequest *)self setCreationDate:v4];

  id v5 = [v7 location];
  [(PHAssetChangeRequest *)self setLocation:v5];

  id v6 = [v7 coarseLocationProperties];
  [v6 gpsHorizontalAccuracy];
  -[PHAssetChangeRequest setGpsHorizontalAccuracy:](self, "setGpsHorizontalAccuracy:");

  if ([v7 videoCpVisibilityState]) {
    -[PHAssetChangeRequest setPhotoIrisVisibilityState:](self, "setPhotoIrisVisibilityState:", [v7 videoCpVisibilityState]);
  }
  -[PHAssetChangeRequest setOriginalResourceChoice:](self, "setOriginalResourceChoice:", [v7 originalResourceChoice]);
}

- (void)setSyndicationIdentifier:(id)a3
{
  id v5 = (NSString *)a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PHAssetCreationRequest.m", 836, @"Invalid parameter not satisfying: %@", @"syndicationIdentifier != nil" object file lineNumber description];
  }
  if (self->_syndicationIdentifier)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PHAssetCreationRequest.m", 838, @"Invalid parameter not satisfying: %@", @"_syndicationIdentifier == nil" object file lineNumber description];

    syndicationIdentifier = self->_syndicationIdentifier;
  }
  else
  {
    syndicationIdentifier = 0;
  }
  self->_syndicationIdentifier = v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_originalResourceTypeFromAdjustedResourceType:(int64_t)a3 sourceAssetIsLoopingVideo:(BOOL)a4 sourceAssetIsVideo:(BOOL)a5
{
  int64_t v5 = 9;
  if (a4) {
    int64_t v5 = 2;
  }
  int64_t v6 = 2;
  BOOL v7 = !a4 && !a5;
  if (a3 != 5) {
    BOOL v7 = 0;
  }
  if (a3 != 6) {
    int64_t v6 = v7;
  }
  if (a3 == 10) {
    return v5;
  }
  else {
    return v6;
  }
}

+ (id)_uuidForAssetWithSyndicationIdentifier:(id)a3 inLibrary:(id)a4 isTrashed:(BOOL *)a5
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  id v10 = (void *)MEMORY[0x1E4F8A950];
  id v48 = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  uint64_t v12 = [v10 predicateForSyndicatedAssetIdentifiers:v11 includeRejected:1];
  v49[0] = v12;
  int v13 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForUserLibrary"), 0);
  v49[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  char v15 = [v9 andPredicateWithSubpredicates:v14];

  uint64_t v16 = (void *)MEMORY[0x1E4F1C0D0];
  long long v17 = [MEMORY[0x1E4F8A950] entityName];
  char v18 = [v16 fetchRequestWithEntityName:v17];

  [v18 setPredicate:v15];
  [v18 setFetchLimit:1];
  v47[0] = @"uuid";
  v47[1] = @"trashedState";
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  [v18 setPropertiesToFetch:v19];

  [v18 setResultType:2];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__14582;
  uint64_t v39 = __Block_byref_object_dispose__14583;
  id v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__PHAssetCreationRequest__uuidForAssetWithSyndicationIdentifier_inLibrary_isTrashed___block_invoke;
  v26[3] = &unk_1E5847CB0;
  id v20 = v8;
  id v27 = v20;
  id v21 = v18;
  id v28 = v21;
  id v29 = &v35;
  __int16 v30 = &v31;
  [v20 performBlockAndWait:v26];
  long long v22 = PLSyndicationGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = v36[5];
    *(_DWORD *)buf = 138543874;
    id v42 = v7;
    __int16 v43 = 2112;
    id v44 = v20;
    __int16 v45 = 2114;
    uint64_t v46 = v23;
    _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_INFO, "_uuidForAssetWithSyndicationIdentifier:%{public}@ from photoLibrary %@ is %{public}@", buf, 0x20u);
  }

  if (a5) {
    *a5 = *((unsigned char *)v32 + 24);
  }
  id v24 = (id)v36[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v24;
}

void __85__PHAssetCreationRequest__uuidForAssetWithSyndicationIdentifier_inLibrary_isTrashed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v11];
  id v5 = v11;

  int64_t v6 = [v4 firstObject];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"uuid"];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [v6 objectForKeyedSubscript:@"trashedState"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10 != 0;
}

+ (id)_jpegDataFromRAWData:(id)a3 derivativeContext:(id)a4
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 || ![v5 length])
  {
    char v18 = 0;
    goto LABEL_61;
  }
  uint64_t v7 = *MEMORY[0x1E4F2FF20];
  v67[0] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F2FF78];
  v66[0] = v7;
  v66[1] = v8;
  uint64_t v9 = [v6 originalUTI];
  v67[1] = v9;
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];

  id v11 = CGImageSourceCreateWithData((CFDataRef)v5, v10);
  if (v11)
  {
    uint64_t v12 = v11;
    CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v11, 0, v10);
    id v14 = [(__CFDictionary *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FD18]];
    id v58 = [v14 objectForKeyedSubscript:@"jpegThumbnail"];
    NSRange v15 = NSRangeFromString(v58);
    if (v15.length) {
      BOOL v16 = v15.location == 0;
    }
    else {
      BOOL v16 = 1;
    }
    unint64_t v17 = 0x1E4F1C000uLL;
    if (v16 || v15.location + v15.length > [v5 length])
    {
      uint64_t v59 = [v6 assetOrientation];
    }
    else
    {
      uint64_t v56 = v14;
      uint64_t v23 = [v5 bytes];
      id v24 = malloc_type_malloc(v15.length, 0xBB174195uLL);
      memcpy(v24, (const void *)(v23 + v15.location), v15.length);
      unsigned char *v24 = -1;
      uint64_t v20 = 1;
      char v18 = (__CFData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytesNoCopy:v24 length:v15.length freeWhenDone:1];
      uint64_t v59 = [v6 assetOrientation];
      if (v18)
      {
        id v14 = v56;
        goto LABEL_16;
      }
      id v14 = v56;
      unint64_t v17 = 0x1E4F1C000;
    }
    char v18 = (__CFData *)objc_alloc_init(*(Class *)(v17 + 2648));
    id v19 = [(id)*MEMORY[0x1E4F44410] identifier];
    uint64_t v20 = 1;
    id v21 = CGImageDestinationCreateWithData(v18, v19, 1uLL, 0);

    if (v21)
    {
      CFDictionaryRef v22 = +[PHAssetCreationRequest _imageIOThumbnailCreationOptionsFromDerivativeContext:v6];
      CGImageDestinationAddImageFromSource(v21, v12, 0, v22);
      CGImageDestinationFinalize(v21);
      CFRelease(v21);

      uint64_t v20 = v59;
    }
LABEL_16:
    if (![(__CFData *)v18 length])
    {
LABEL_59:
      CFRelease(v12);

      goto LABEL_60;
    }
    CFDictionaryRef v55 = v13;
    uint64_t v57 = v14;
    if (v20 != 1)
    {
      uint64_t v33 = 0;
LABEL_48:
      if (v20 != v59)
      {
        uint64_t v46 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
        BOOL v47 = [(id)*MEMORY[0x1E4F44410] identifier];
        id v48 = CGImageDestinationCreateWithData(v46, v47, 1uLL, 0);

        if (v48)
        {
          if (!v33) {
            uint64_t v33 = CGImageSourceCreateWithData(v18, 0);
          }
          uint64_t v60 = *MEMORY[0x1E4F2FD70];
          uint64_t v49 = [NSNumber numberWithInteger:v59];
          uint64_t v61 = v49;
          CFDictionaryRef v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];

          CGImageDestinationAddImageFromSource(v48, v33, 0, v50);
          CGImageDestinationFinalize(v48);
          CFRelease(v48);
          if ([(__CFData *)v46 length])
          {
            uint64_t v51 = v46;

            char v18 = v51;
          }
        }
        id v14 = v57;
      }
      if (v33) {
        CFRelease(v33);
      }
      CFDictionaryRef v13 = v55;
      goto LABEL_59;
    }
    [v6 assetOrientedImageSize];
    uint64_t v26 = (uint64_t)v25;
    [v6 assetOrientedImageSize];
    uint64_t v28 = (uint64_t)v27;
    id v29 = [v6 originalUTI];
    uint64_t v53 = v28;
    uint64_t v54 = v29;
    if (v26 && v28 && v26 == v28)
    {
      __int16 v30 = v29;
      if (([v29 isEqualToString:@"com.hasselblad.fff-raw-image"] & 1) == 0)
      {
        uint64_t v31 = [(__CFDictionary *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
        id v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F2FD68]];
        if ([v32 isEqualToString:@"Hasselblad CFV - Hasselblad 500"])
        {
        }
        else
        {
          int v34 = [v30 isEqualToString:@"com.hasselblad.3fr-raw-image"];

          if (!v34) {
            goto LABEL_29;
          }
        }
      }
      if (v59 != 1)
      {
        uint64_t v33 = 0;
LABEL_46:
        uint64_t v20 = v59;
        goto LABEL_47;
      }
    }
LABEL_29:
    uint64_t v35 = *MEMORY[0x1E4F2FF48];
    uint64_t v64 = *MEMORY[0x1E4F2FF48];
    uint64_t v65 = MEMORY[0x1E4F1CC38];
    uint64_t v20 = 1;
    CFDictionaryRef v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    uint64_t v33 = CGImageSourceCreateWithData(v18, v36);

    if (v33)
    {
      uint64_t v62 = v35;
      uint64_t v63 = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v33, 0, v37);

      if (ImageAtIndex)
      {
        double Width = (double)CGImageGetWidth(ImageAtIndex);
        double Height = (double)CGImageGetHeight(ImageAtIndex);
        CGImageRelease(ImageAtIndex);
      }
      else
      {
        double Width = *MEMORY[0x1E4F1DB30];
        double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      double v41 = (double)v26 / (double)v53;
      double v42 = Width / Height;
      if (v41 > 1.0 && v42 > 1.0) {
        goto LABEL_46;
      }
      BOOL v44 = v42 < 1.0 && v41 < 1.0;
      if (v44 || v41 == v42) {
        goto LABEL_46;
      }
      uint64_t v20 = 1;
    }
LABEL_47:
    id v14 = v57;

    goto LABEL_48;
  }
  CFDictionaryRef v13 = 0;
  char v18 = 0;
LABEL_60:

LABEL_61:

  return v18;
}

+ (id)_imageIOThumbnailCreationOptionsFromDerivativeContext:(id)a3
{
  v29[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 maxPixelSize])
  {
    [v3 assetOrientedImageSize];
    double v5 = v4;
    [v3 assetOrientedImageSize];
    double v7 = v6;
    [v3 assetOrientation];
    int v8 = PLExifOrientationSwapsWidthAndHeight();
    if (v8) {
      double v9 = v7;
    }
    else {
      double v9 = v5;
    }
    if (!v8) {
      double v5 = v7;
    }
    [v3 embeddedThumbnailSize];
    double v11 = v10;
    [v3 embeddedThumbnailSize];
    if (v11 < v12) {
      double v11 = v12;
    }
    double v26 = 0.0;
    double v27 = 0.0;
    v25[0] = 0;
    v25[1] = 0;
    CFDictionaryRef v13 = (void *)MEMORY[0x1E4F8A950];
    [v3 assetOrientedImageSize];
    objc_msgSend(v13, "computePreCropThumbnailSize:andPostCropSize:forOrientedOriginalSize:andCroppedSize:isLargeThumbnail:", &v26, v25, 0, v9, v5, v14, v15);
    double v16 = v26;
    if (v26 < v27) {
      double v16 = v27;
    }
    if (v11 >= v16) {
      double v16 = v11;
    }
    [v3 setMaxPixelSize:(uint64_t)v16];
  }
  v28[0] = *MEMORY[0x1E4F2F428];
  unint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "maxPixelSize"));
  uint64_t v18 = *MEMORY[0x1E4F2FE48];
  v29[0] = v17;
  v29[1] = MEMORY[0x1E4F1CC38];
  uint64_t v19 = *MEMORY[0x1E4F2FF48];
  v28[1] = v18;
  v28[2] = v19;
  v29[2] = MEMORY[0x1E4F1CC38];
  v29[3] = MEMORY[0x1E4F1CC38];
  uint64_t v20 = *MEMORY[0x1E4F2FE58];
  v28[3] = @"kCGImageSourceKeepOriginalProfile";
  v28[4] = v20;
  uint64_t v21 = *MEMORY[0x1E4F2F410];
  v29[4] = *MEMORY[0x1E4F2FE70];
  v29[5] = MEMORY[0x1E4F1CC38];
  uint64_t v22 = *MEMORY[0x1E4F2F460];
  v28[5] = v21;
  v28[6] = v22;
  v29[6] = MEMORY[0x1E4F1CC38];
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:7];

  return v23;
}

+ (id)_photoIrisIndicatorFilePathForPhotoAtPath:(id)a3 UUID:(id)a4
{
  double v4 = 0;
  if (a3 && a4)
  {
    double v6 = NSString;
    id v7 = a3;
    int v8 = [v6 stringWithFormat:@"%@%@.%@", @"iris_pending_", a4, @"irs"];
    double v4 = [v7 stringByAppendingPathComponent:v8];
  }

  return v4;
}

+ (id)_cameraMetadataURLForPrimaryAssetURL:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  double v6 = [a4 pathManager];
  id v7 = [v6 privateDirectoryWithSubType:9 createIfNeeded:1 error:0];

  int v8 = [v5 path];

  double v9 = [v8 lastPathComponent];
  double v10 = [v9 stringByDeletingPathExtension];
  double v11 = [v10 stringByAppendingPathExtension:*MEMORY[0x1E4F8C620]];

  double v12 = (void *)MEMORY[0x1E4F1CB10];
  CFDictionaryRef v13 = [v7 stringByAppendingPathComponent:v11];
  double v14 = [v12 fileURLWithPath:v13];

  return v14;
}

+ (BOOL)_shouldGenerateThumbnailsDuringCreationForImageSource:(CGImageSource *)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 conformsToType:*MEMORY[0x1E4F44498]])
  {
    double v9 = (void *)MEMORY[0x19F389B10]();
    CFDictionaryRef v10 = CGImageSourceCopyProperties(a3, 0);
    if (v10) {
      char v11 = [MEMORY[0x1E4F8CC38] embeddedJPEGSuitableForDerivativesInRawImageSource:a3 enforcePixelCountLimits:1 timeZoneLookup:v8];
    }
    else {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

+ (BOOL)setdbgFileWithAsset:(id)a3 dbgFilePath:(id)a4 photoFilename:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = a5;
  id v9 = a3;
  CFDictionaryRef v10 = [v7 fileURLWithPath:a4 isDirectory:0];
  char v11 = (void *)MEMORY[0x1E4F8A950];
  double v12 = [v9 photoLibrary];

  CFDictionaryRef v13 = [v11 diagnosticFilePathForLibrary:v12 mainFilename:v8 createIfNeeded:1];

  if (!v13)
  {
    unint64_t v17 = PLPhotoKitIngestGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Failed to get diagnostic destination path.", buf, 2u);
    }
    double v14 = 0;
    BOOL v15 = 1;
    goto LABEL_11;
  }
  double v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
  BOOL v15 = 1;
  if (v14)
  {
    if (v10)
    {
      uint64_t v20 = 0;
      if (([MEMORY[0x1E4F8B908] copyItemAtURL:v10 toURL:v14 error:&v20] & 1) == 0)
      {
        double v16 = PLPhotoKitIngestGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Failed to copy DBG source file to CaptureDebug destination.", v19, 2u);
        }

        BOOL v15 = 0;
        unint64_t v17 = v10;
        CFDictionaryRef v10 = 0;
LABEL_11:
      }
    }
  }

  return v15;
}

+ (BOOL)setDeferredIdentifierAndCreateDeferredDestinationURLFromCurrentDstURL:(id *)a3 withMainFileMetadata:(id)a4 managedAsset:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [v12 mainFileURL];

  if (v14)
  {
    id v15 = [v12 mainFileURL];
    *a3 = v15;
  }
  else
  {
    id v15 = *a3;
  }
  double v16 = (void *)MEMORY[0x1E4F1CB10];
  unint64_t v17 = [v15 path];
  uint64_t v18 = [v16 fileURLWithPath:v17];

  id v19 = [MEMORY[0x1E4F8AA78] deferredPhotoPreviewDestinationURLForPrimaryAssetURL:*a3];
  *a3 = v19;
  uint64_t v20 = (void *)MEMORY[0x1E4F8B908];
  uint64_t v21 = [v13 pathManager];

  uint64_t v22 = [v21 capabilities];
  id v38 = 0;
  [v20 secureMoveItemAtURL:v18 toURL:v19 capabilities:v22 error:&v38];
  id v23 = v38;

  id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v25 = [*a3 path];
  LODWORD(v20) = [v24 fileExistsAtPath:v25];

  int v26 = MEMORY[0x19F388BC0](v23) & v20;
  if (v23) {
    BOOL v27 = v26;
  }
  else {
    BOOL v27 = 1;
  }
  if (v27)
  {
    uint64_t v28 = NSString;
    id v29 = [v11 imageCaptureRequestIdentifier];
    __int16 v30 = [v11 photoProcessingIdentifier];
    uint64_t v31 = [v28 stringWithFormat:@"%@/%@", v29, v30];

    id v32 = [v12 additionalAttributes];
    [v32 setDeferredPhotoIdentifier:v31];

    [v12 setDeferredProcessingNeeded:1];
    id v33 = 0;
  }
  else
  {
    int v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    v42[0] = @"PhotoKit Deferred Processing: Failure to move destination URL file to file with deferred suffix.";
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    objc_msgSend(v34, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3123, v35);
    id v33 = (id)objc_claimAutoreleasedReturnValue();

    CFDictionaryRef v36 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v23;
      _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_ERROR, "PhotoKit Deferred Processing: Failed to move file to one with deferred suffix attached. %{public}@", buf, 0xCu);
    }

    if (a7 && v33)
    {
      id v33 = v33;
      *a7 = v33;
    }
  }

  return v27;
}

+ (BOOL)supportsImportAssetResourceTypes:(id)a3
{
  return +[PHAssetResourceBag supportsAssetResourceTypes:a3 mediaType:0 importedBy:5];
}

+ (BOOL)supportsAssetResourceTypes:(NSArray *)types
{
  return +[PHAssetResourceBag supportsAssetResourceTypes:types mediaType:0 importedBy:0];
}

+ (id)creationRequestForAssetCopyFromAsset:(id)a3
{
  return (id)[a1 creationRequestForAssetCopyFromAsset:a3 options:0];
}

+ (id)creationRequestForAssetCopyFromAsset:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PHAssetCreationRequest.m", 1136, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if ([v8 shouldDownloadOrCloudReReferenceMissingResources])
  {
    id v9 = [[PHAssetCreationRequestPlaceholderSupport alloc] initForNewObject];
    CFDictionaryRef v10 = [v8 adjustmentBakeInOptions];
    [v9 _setAdjustmentBakeInOptions:v10];

    id v11 = [v8 metadataCopyOptions];
    [v9 _setMetadataCopyOptions:v11];
LABEL_5:

    goto LABEL_9;
  }
  id v9 = [a1 creationRequestForAssetWithOptions:v8];
  id v12 = [v8 adjustmentBakeInOptions];

  if (v12)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"PHAssetCreationRequest.m" lineNumber:1145 description:@"adjustmentBakeInOptions should only be set if shouldDownloadOrCloudReReferenceMissingResources is YES"];
  }
  id v13 = [v8 metadataCopyOptions];

  if (v13)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"PHAssetCreationRequest.m" lineNumber:1146 description:@"metadataCopyOptions should only be set if shouldDownloadOrCloudReReferenceMissingResources is YES"];
    goto LABEL_5;
  }
LABEL_9:
  if ([v8 copyStillPhotoFromLivePhoto]) {
    [v9 _setDuplicateLivePhotoAsStill:1];
  }
  if ([v8 copyOriginal]) {
    [v9 _setDuplicateAsOriginal:1];
  }
  if ([v8 copySinglePhotoFromBurst]) {
    [v9 _setDuplicateSinglePhotoFromBurst:1];
  }
  if ([v8 copyAsAlternateAsset]) {
    [v9 _setDuplicateAsAlternateAsset:1];
  }
  if ([v8 useRecoverableStagingDirectory]) {
    [v9 _setUseRecoverableStagingDirectory:1];
  }
  if (([v8 resetUserSpecificMetadata] & 1) == 0) {
    [v9 _copyUserSpecificMetadataFromAsset:v7];
  }
  [v7 fetchPropertySetsIfNeeded];
  double v14 = [v7 photosOneUpProperties];
  id v15 = [v14 reverseLocationData];
  [v9 setReverseLocationData:v15];

  double v16 = [v7 photosOneUpProperties];
  objc_msgSend(v9, "setReverseLocationDataIsValid:", objc_msgSend(v16, "reverseLocationDataIsValid"));

  [v7 preferredCropRect];
  if (PLCGRectIsNormalized())
  {
    [v7 preferredCropRect];
    objc_msgSend(v9, "setPreferredCropRectWithNormalizedRect:");
  }
  [v7 acceptableCropRect];
  if (PLCGRectIsNormalized())
  {
    [v7 acceptableCropRect];
    objc_msgSend(v9, "setAcceptableCropRectWithNormalizedRect:");
  }
  [v7 curationScore];
  objc_msgSend(v9, "setCurationScore:");
  [v9 _copyMetadataFromAsset:v7];
  [v9 _copyMediaAnalysisProperties:v7];
  unint64_t v17 = [v7 localIdentifier];
  [v9 _setDuplicateAssetIdentifier:v17];

  uint64_t v18 = [v7 photoLibrary];
  objc_msgSend(v9, "_setDuplicateAssetPhotoLibraryType:", objc_msgSend(v18, "type"));

  if (v8) {
    [v8 stillSourceTime];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  [v9 _setDuplicateStillSourceTime:v24];
  id v19 = [v7 keywordProperties];
  uint64_t v20 = [v19 keywordTitles];
  [v9 setKeywordTitles:v20];

  return v9;
}

+ (id)creationRequestForAssetFromGuestAsset:(id)a3 checkForMomentShareAsset:(BOOL)a4
{
  BOOL v4 = a4;
  v119[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
  uint64_t v9 = [v8 wellKnownPhotoLibraryIdentifier];

  if (v9 == 3)
  {
    uint64_t v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2 object:a1 file:@"PHAssetCreationRequest.m" lineNumber:979 description:@"Expect the library being used is not the syndication library"];
  }
  [v7 fetchPropertySetsIfNeeded];
  CFDictionaryRef v10 = [v7 curationProperties];
  id v11 = [v10 syndicationIdentifier];

  if ([v11 length])
  {
    if (!v4) {
      goto LABEL_14;
    }
  }
  else
  {
    id v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v7 uuid];
      *(_DWORD *)buf = 138543362;
      int v111 = v13;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ missing syndicationIdentifier", buf, 0xCu);
    }
    if (!v4)
    {
LABEL_14:
      uint64_t v28 = [v7 mediaType];
      if ((unint64_t)(v28 - 1) < 2)
      {
        uint64_t v31 = [v7 mainFileURL];
        if (v31)
        {
          BOOL v27 = v31;
          char v32 = 0;
          goto LABEL_25;
        }
      }
      else if (v28 == 3 || !v28)
      {
        BOOL v27 = PLSyndicationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v29 = [v7 uuid];
          __int16 v30 = +[PHAsset descriptionForMediaType:](PHAsset, "descriptionForMediaType:", [v7 mediaType]);
          *(_DWORD *)buf = 138543618;
          int v111 = v29;
          __int16 v112 = 2114;
          uint64_t v113 = v30;
          _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ has media type %{public}@", buf, 0x16u);
        }
        id v23 = 0;
        goto LABEL_87;
      }
      id v33 = PLSyndicationGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        int v34 = [v7 uuid];
        *(_DWORD *)buf = 138543362;
        int v111 = v34;
        _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ mainFileURL is nil", buf, 0xCu);
      }
      BOOL v27 = 0;
      char v32 = 1;
LABEL_25:
      uint64_t v35 = [MEMORY[0x1E4F28CB8] defaultManager];
      CFDictionaryRef v36 = [v27 path];
      char v37 = [v35 fileExistsAtPath:v36];

      if ((v37 & 1) == 0)
      {
        id v38 = PLSyndicationGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = [v7 uuid];
          *(_DWORD *)buf = 138543618;
          int v111 = v39;
          __int16 v112 = 2112;
          uint64_t v113 = v27;
          _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ file does not exist at mainFileURL %@", buf, 0x16u);
        }
      }
      if (v32) {
        goto LABEL_83;
      }
      uint64_t v93 = v27;
      if (([v7 mediaSubtypes] & 8) != 0)
      {
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        double v42 = +[PHAssetResource assetResourcesForAsset:v7];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v106 objects:v118 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v107;
LABEL_36:
          uint64_t v46 = 0;
          while (1)
          {
            if (*(void *)v107 != v45) {
              objc_enumerationMutation(v42);
            }
            BOOL v47 = *(void **)(*((void *)&v106 + 1) + 8 * v46);
            if ([v47 type] == 9) {
              break;
            }
            if (v44 == ++v46)
            {
              uint64_t v44 = [v42 countByEnumeratingWithState:&v106 objects:v118 count:16];
              if (v44) {
                goto LABEL_36;
              }
              goto LABEL_42;
            }
          }
          id v48 = [v47 privateFileURL];

          if (v48) {
            goto LABEL_47;
          }
        }
        else
        {
LABEL_42:
        }
        uint64_t v49 = PLSyndicationGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          CFDictionaryRef v50 = [v7 uuid];
          *(_DWORD *)buf = 138543362;
          int v111 = v50;
          _os_log_impl(&dword_19B043000, v49, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ live photo video complement URL is nil", buf, 0xCu);
        }
        id v48 = 0;
LABEL_47:
        uint64_t v51 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v52 = [v48 path];
        char v53 = [v51 fileExistsAtPath:v52];

        if ((v53 & 1) == 0)
        {
          uint64_t v54 = PLSyndicationGetLog();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            CFDictionaryRef v55 = [v7 uuid];
            uint64_t v56 = [v48 path];
            *(_DWORD *)buf = 138543618;
            int v111 = v55;
            __int16 v112 = 2112;
            uint64_t v113 = v56;
            _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ videoComplementURL does not exist at path %@", buf, 0x16u);
          }
        }
        id v57 = objc_alloc(MEMORY[0x1E4F8CE20]);
        id v58 = [v48 path];
        uint64_t v59 = [v93 path];
        uint64_t v60 = (void *)[v57 initWithPathToVideo:v58 pathToImage:v59];

        if (!v60)
        {
          uint64_t v61 = PLSyndicationGetLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            uint64_t v62 = [v7 uuid];
            *(_DWORD *)buf = 138543362;
            int v111 = v62;
            _os_log_impl(&dword_19B043000, v61, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ videoComplementBundle is nil", buf, 0xCu);
          }
        }
        uint64_t v63 = [a1 creationRequestForAssetFromVideoComplementBundle:v60];

        BOOL v27 = v93;
        if (!v63) {
          goto LABEL_83;
        }
      }
      else
      {
        uint64_t v40 = [v7 mediaType];
        if (v40 == 1)
        {
          uint64_t v41 = [a1 creationRequestForAssetFromImageAtFileURL:v27];
        }
        else
        {
          if (v40 != 2)
          {
LABEL_83:
            id v23 = 0;
LABEL_84:
            double v85 = PLSyndicationGetLog();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              id v86 = [v7 uuid];
              uint64_t v87 = [v23 placeholderForCreatedAsset];
              id v88 = [v87 uuid];
              *(_DWORD *)buf = 138543874;
              int v111 = v86;
              __int16 v112 = 2114;
              uint64_t v113 = v88;
              __int16 v114 = 2114;
              v115 = v11;
              _os_log_impl(&dword_19B043000, v85, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@, new asset uuid: %{public}@, syndicationIdentifier: %{public}@", buf, 0x20u);
            }
            goto LABEL_87;
          }
          uint64_t v41 = [a1 creationRequestForAssetFromVideoAtFileURL:v27];
        }
        uint64_t v63 = v41;
        if (!v41) {
          goto LABEL_83;
        }
      }
      objc_storeStrong((id *)(v63 + 1144), v11);
      uint64_t v64 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v65 = [v64 bundleIdentifier];
      uint64_t v66 = *(void **)(v63 + 1136);
      *(void *)(v63 + 1136) = v65;

      uint64_t v67 = [v7 importProperties];
      uint64_t v68 = [v67 importedBy];
      if ((unint64_t)(v68 - 1) < 0xE) {
        __int16 v69 = v68;
      }
      else {
        __int16 v69 = 0;
      }

      char v92 = v11;
      if (v69)
      {
        uint64_t v70 = v69;
      }
      else
      {
        long long v71 = PLSyndicationGetLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v71, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: importSource was unknown, setting to GuestAssetSyndication", buf, 2u);
        }

        uint64_t v70 = 12;
      }
      *(void *)(v63 + 1016) = v70;
      uint64_t v72 = [v7 creationDate];
      [(id)v63 setCreationDate:v72];

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v91 = (void *)v63;
      id obj = *(id *)(v63 + 952);
      uint64_t v96 = [obj countByEnumeratingWithState:&v102 objects:v117 count:16];
      if (v96)
      {
        uint64_t v95 = *(void *)v103;
        do
        {
          for (uint64_t i = 0; i != v96; ++i)
          {
            if (*(void *)v103 != v95) {
              objc_enumerationMutation(obj);
            }
            uint64_t v74 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            context = (void *)MEMORY[0x19F389B10]();
            long long v98 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v75 = v7;
            char v76 = +[PHAssetResource assetResourcesForAsset:v7];
            uint64_t v77 = [v76 countByEnumeratingWithState:&v98 objects:v116 count:16];
            if (v77)
            {
              uint64_t v78 = v77;
              uint64_t v79 = *(void *)v99;
              do
              {
                for (uint64_t j = 0; j != v78; ++j)
                {
                  if (*(void *)v99 != v79) {
                    objc_enumerationMutation(v76);
                  }
                  id v81 = *(void **)(*((void *)&v98 + 1) + 8 * j);
                  uint64_t v82 = [v81 type];
                  if (v82 == [v74 type])
                  {
                    id v83 = objc_alloc_init(PHAssetResourceCreationOptions);
                    double v84 = [v81 originalFilename];
                    [(PHAssetResourceCreationOptions *)v83 setOriginalFilename:v84];

                    [v74 setCreationOptions:v83];
                  }
                }
                uint64_t v78 = [v76 countByEnumeratingWithState:&v98 objects:v116 count:16];
              }
              while (v78);
            }

            id v7 = v75;
          }
          uint64_t v96 = [obj countByEnumeratingWithState:&v102 objects:v117 count:16];
        }
        while (v96);
      }

      id v11 = v92;
      BOOL v27 = v93;
      id v23 = v91;
      goto LABEL_84;
    }
  }
  v119[0] = v11;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:1];
  id v15 = +[PHPhotoLibrary sharedMomentSharePhotoLibrary];
  double v16 = [v15 librarySpecificFetchOptions];
  unint64_t v17 = +[PHAsset fetchAssetsWithSyndicationIdentifiers:v14 options:v16];

  uint64_t v18 = [v17 firstObject];
  uint64_t v19 = [v18 sourceType];

  if (v19 != 8)
  {

    goto LABEL_14;
  }
  uint64_t v20 = objc_alloc_init(PHAssetCreationOptions);
  [(PHAssetCreationOptions *)v20 setShouldDownloadOrCloudReReferenceMissingResources:1];
  uint64_t v21 = v17;
  uint64_t v22 = [v17 firstObject];
  id v23 = +[PHAssetCreationRequest creationRequestForAssetCopyFromAsset:v22 options:v20];
  id v24 = PLSyndicationGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    double v25 = [v22 uuid];
    int v26 = [v7 uuid];
    *(_DWORD *)buf = 138543618;
    int v111 = v25;
    __int16 v112 = 2114;
    uint64_t v113 = v26;
    _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_INFO, "creationRequestForAssetFromGuestAsset: Converting creation request into a native CMM save creationRequestForAssetCopyFromAsset since we found a MomentShare asset %{public}@ with the same syndicationIdentifier as %{public}@", buf, 0x16u);
  }
  BOOL v27 = v21;
LABEL_87:

  return v23;
}

+ (id)creationRequestForAssetFromGuestAsset:(id)a3
{
  return (id)[a1 creationRequestForAssetFromGuestAsset:a3 checkForMomentShareAsset:1];
}

+ (id)creationRequestForAssetFromAssetBundle:(id)a3
{
  id v4 = a3;
  id v5 = [a1 creationRequestForAsset];
  double v6 = [v4 photoURL];

  if (v6)
  {
    id v7 = [v4 photoURL];
    [v5 addResourceWithType:1 fileURL:v7 options:0];
  }
  id v8 = [v4 videoURL];

  if (v8)
  {
    uint64_t v9 = [v4 videoURL];
    [v5 addResourceWithType:2 fileURL:v9 options:0];
  }
  CFDictionaryRef v10 = [v4 audioURL];

  if (v10)
  {
    id v11 = [v4 audioURL];
    [v5 addResourceWithType:3 fileURL:v11 options:0];
  }
  id v12 = [v4 alternatePhotoURL];

  if (v12)
  {
    id v13 = [v4 alternatePhotoURL];
    [v5 addResourceWithType:4 fileURL:v13 options:0];
  }
  double v14 = [v4 fullSizePhotoURL];

  if (v14)
  {
    id v15 = [v4 fullSizePhotoURL];
    [v5 addResourceWithType:5 fileURL:v15 options:0];
  }
  double v16 = [v4 fullSizeVideoURL];

  if (v16)
  {
    unint64_t v17 = [v4 fullSizeVideoURL];
    [v5 addResourceWithType:6 fileURL:v17 options:0];
  }
  uint64_t v18 = [v4 adjustmentDataURL];

  if (v18)
  {
    uint64_t v19 = [v4 adjustmentDataURL];
    [v5 addResourceWithType:7 fileURL:v19 options:0];
  }
  uint64_t v20 = [v4 originalAdjustmentDataURL];

  if (v20)
  {
    uint64_t v21 = [v4 originalAdjustmentDataURL];
    [v5 addResourceWithType:16 fileURL:v21 options:0];
  }
  uint64_t v22 = [v4 adjustmentSecondaryDataURL];

  if (v22)
  {
    id v23 = [v4 adjustmentSecondaryDataURL];
    [v5 addResourceWithType:110 fileURL:v23 options:0];
  }
  id v24 = [v4 adjustmentBasePhotoURL];

  if (v24)
  {
    double v25 = [v4 adjustmentBasePhotoURL];
    [v5 addResourceWithType:8 fileURL:v25 options:0];
  }
  int v26 = [v4 adjustmentBaseVideoURL];

  if (v26)
  {
    BOOL v27 = [v4 adjustmentBaseVideoURL];
    [v5 addResourceWithType:12 fileURL:v27 options:0];
  }
  uint64_t v28 = [v4 pairedVideoURL];

  if (v28)
  {
    id v29 = [v4 pairedVideoURL];
    [v5 addResourceWithType:9 fileURL:v29 options:0];
  }
  __int16 v30 = [v4 fullSizePairedVideoURL];

  if (v30)
  {
    uint64_t v31 = [v4 fullSizePairedVideoURL];
    [v5 addResourceWithType:10 fileURL:v31 options:0];
  }
  char v32 = [v4 adjustmentBasePairedVideoURL];

  if (v32)
  {
    id v33 = [v4 adjustmentBasePairedVideoURL];
    [v5 addResourceWithType:11 fileURL:v33 options:0];
  }
  int v34 = [v4 spatialOvercapturePhotoURL];

  if (v34)
  {
    uint64_t v35 = [v4 spatialOvercapturePhotoURL];
    [v5 addResourceWithType:13 fileURL:v35 options:0];
  }
  CFDictionaryRef v36 = [v4 spatialOvercapturePairedVideoURL];

  if (v36)
  {
    char v37 = [v4 spatialOvercapturePairedVideoURL];
    [v5 addResourceWithType:15 fileURL:v37 options:0];
  }
  id v38 = [v4 spatialOvercaptureVideoURL];

  if (v38)
  {
    uint64_t v39 = [v4 spatialOvercaptureVideoURL];
    [v5 addResourceWithType:14 fileURL:v39 options:0];
  }
  uint64_t v40 = [v4 videoComplementVisibilityState];
  if (v40) {
    [v5 setPhotoIrisVisibilityState:v40];
  }
  uint64_t v41 = [v4 keywordTitles];
  if ([v41 count]) {
    [v5 setKeywordTitles:v41];
  }
  double v42 = [v4 assetDescription];
  if ([v42 length]) {
    [v5 setAssetDescription:v42];
  }
  uint64_t v43 = [v4 accessibilityDescription];
  if ([v43 length]) {
    [v5 setAccessibilityDescription:v43];
  }
  uint64_t v44 = [v4 assetTitle];
  if (v44) {
    [v5 setTitle:v44];
  }
  uint64_t v45 = [v4 libraryCreationDate];
  uint64_t v46 = [v4 libraryCreationDateTimeZone];
  if (v45)
  {
    [v5 setCreationDate:v45];
    if (v46) {
      [v5 setTimeZone:v46 withDate:v45];
    }
  }
  BOOL v47 = [v4 libraryLocation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v48 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v48 = v47;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_52;
    }
  }
  [v5 setLocation:v48];
LABEL_52:
  if (objc_msgSend(v4, "spatialOvercaptureResourcesPurgeable", v48)) {
    [v5 trashAllSpatialOverCaptureResources];
  }

  return v5;
}

+ (id)creationRequestForAssetFromVideoComplementBundle:(id)a3
{
  id v4 = a3;
  id v5 = [a1 creationRequestForAsset];
  double v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = [v4 imagePath];
  id v8 = [v6 fileURLWithPath:v7 isDirectory:0];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  CFDictionaryRef v10 = [v4 videoPath];
  id v11 = [v9 fileURLWithPath:v10 isDirectory:0];

  [v5 addResourceWithType:1 fileURL:v8 options:0];
  [v5 addResourceWithType:9 fileURL:v11 options:0];
  id v12 = [v4 pairingIdentifier];
  [v5 setPairingIdentifier:v12];

  if (v4)
  {
    [v4 imageDisplayTime];
    [v5 setImageDisplayTime:v15];
    [v4 originalVideoDuration];
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    [v5 setImageDisplayTime:v15];
    memset(v14, 0, sizeof(v14));
  }
  [v5 setVideoDuration:v14];

  return v5;
}

+ (id)creationRequestForAssetWithSyndicationIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned __int8 v15 = 0;
  if (!v4)
  {
LABEL_9:
    CFDictionaryRef v10 = 0;
    id v7 = 0;
    goto LABEL_10;
  }
  id v5 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
  double v6 = [v5 photoLibrary];
  id v7 = +[PHAssetCreationRequest _uuidForAssetWithSyndicationIdentifier:v4 inLibrary:v6 isTrashed:&v15];

  id v8 = PLSyndicationGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v4;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, "Did not find exising asset with syndication identifier %{public}@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, "Found exising asset %{public}@ with syndication identifier %{public}@", buf, 0x16u);
  }

  CFDictionaryRef v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
LABEL_10:
  id v11 = [a1 _creationRequestForAssetUsingUUID:v10];
  [v11 setSyndicationIdentifier:v4];
  if (v10)
  {
    id v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "Setting assetExistsWithSyndicationIdentifier to YES", buf, 2u);
    }

    [v11 setAssetExistsWithSyndicationIdentifier:MEMORY[0x1E4F1CC38]];
    [v11 setAssetExistingWithSyndicationIdentifierIsTrashed:v15];
  }
  id v13 = PLSyndicationGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v4;
    __int16 v18 = 2114;
    id v19 = v10;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "creationRequestForAssetWithSyndicationIdentifier: %{public}@ existing uuid: %{public}@", buf, 0x16u);
  }

  return v11;
}

+ (id)creationRequestForAssetFromVideoAtFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _creationRequestForAssetUsingUUID:0];
  [v5 _addResourceWithType:2 data:0 orFileURL:v4 options:0];

  return v5;
}

+ (id)creationRequestForAssetFromImageAtFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _creationRequestForAssetUsingUUID:0];
  [v5 _addResourceWithType:1 data:0 orFileURL:v4 options:0];

  return v5;
}

+ (id)creationRequestForAssetFromImage:(id)a3
{
  id v4 = PHImageDataFromImageAsScreenshot(a3, 0);
  id v5 = [a1 _creationRequestForAssetUsingUUID:0];
  [v5 _addResourceWithType:1 data:v4 orFileURL:0 options:0];

  return v5;
}

+ (id)creationRequestForAssetFromScreenshotImage:(id)a3
{
  id v4 = PHImageDataFromImageAsScreenshot(a3, 1);
  id v5 = [a1 _creationRequestForAssetUsingUUID:0];
  [v5 _addResourceWithType:1 data:v4 orFileURL:0 options:0];
  [v5 _setShouldCreateScreenshot:1];

  return v5;
}

+ (id)creationRequestForAssetFromBatchImageJobDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C8A8]];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    double v6 = 0;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = *MEMORY[0x1E4F8C8F0];
    uint64_t v9 = *MEMORY[0x1E4F8CA78];
    do
    {
      uint64_t v10 = 0;
      id v11 = v6;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        id v13 = [[PHAssetCreationCameraIngestOptions alloc] initFromJobDictionary:v3 withPreviewImgSurfaceRef:0];
        [v11 setCameraIngestOptions:v13];

        double v14 = [v12 objectForKeyedSubscript:v8];
        double v6 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:v14 options:0];

        id v15 = objc_alloc(MEMORY[0x1E4F1CB10]);
        double v16 = [v12 objectForKeyedSubscript:v9];
        id v17 = (void *)[v15 initFileURLWithPath:v16 isDirectory:0];

        [v6 addResourceWithType:1 fileURL:v17 options:0];
        ++v10;
        id v11 = v6;
      }
      while (v5 != v10);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

+ (id)creationRequestForAssetFromImageJobDictionary:(id)a3 holdingDirectoryPath:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(PHAssetResourceCreationOptions);
  double v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C8B8]];
  uint64_t v7 = v6;
  if (v6) {
    -[PHAssetResourceCreationOptions setBurstPickType:](v5, "setBurstPickType:", [v6 intValue]);
  }
  uint64_t v8 = *MEMORY[0x1E4F8C8F0];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
  uint64_t v10 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:v9 options:0];

  id v11 = [[PHAssetCreationCameraIngestOptions alloc] initFromJobDictionary:v4 withPreviewImgSurfaceRef:0];
  [v10 setCameraIngestOptions:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F1CB10]);
  id v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA78]];
  double v14 = (void *)[v12 initFileURLWithPath:v13 isDirectory:0];

  id v15 = [v4 objectForKey:*MEMORY[0x1E4F8C910]];

  if (v15) {
    uint64_t v16 = 19;
  }
  else {
    uint64_t v16 = 1;
  }
  [v10 addResourceWithType:v16 fileURL:v14 options:v5];
  id v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C8B0]];

  if (!v17)
  {
    uint64_t v28 = *MEMORY[0x1E4F8CA90];
    id v29 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA90]];

    if (v29)
    {
      __int16 v30 = [v4 objectForKeyedSubscript:v28];
      [v10 addResourceWithType:111 data:v30 options:0];
    }
    goto LABEL_31;
  }
  uint64_t v39 = v5;
  __int16 v18 = [v10 cameraIngestOptions];
  id v19 = [v10 _createAdjustmentsFileFromJobDictionary:v4 cameraIngestOptions:v18];

  long long v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA18]];
  if (v20)
  {
    long long v21 = [v10 cameraIngestOptions];
    [v21 setBackupAdjustmentsFile:v20];
  }
  char v37 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA90]];
  long long v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA20]];
  uint64_t v23 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA38]];
  id v38 = v14;
  CFDictionaryRef v36 = (void *)v23;
  if (v22)
  {
    id v24 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22];
    uint64_t v25 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v24];
    int v26 = 0;
    if (v19)
    {
LABEL_11:
      [v10 addResourceWithType:7 fileURL:v19 options:0];
      if (v24)
      {
        [v10 addResourceWithType:107 fileURL:v24 options:0];
        BOOL v27 = v37;
LABEL_28:
        if (v25) {
          [v10 addResourceWithType:111 data:v25 options:0];
        }

        double v14 = v38;
        uint64_t v5 = v39;
LABEL_31:
        id v33 = v10;
        goto LABEL_32;
      }
      BOOL v27 = v37;
      if (v26)
      {
        [v10 addResourceWithType:107 fileURL:v26 options:0];
        id v24 = 0;
        goto LABEL_28;
      }
LABEL_25:
      if (v27) {
        [v10 addResourceWithType:111 data:v27 options:0];
      }
      id v24 = 0;
      int v26 = 0;
      goto LABEL_28;
    }
    goto LABEL_17;
  }
  if (v23)
  {
    int v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23];
    id v24 = 0;
    uint64_t v25 = 0;
    if (v19) {
      goto LABEL_11;
    }
LABEL_17:
    uint64_t v35 = v19;
    goto LABEL_18;
  }
  if (v19)
  {
    [v10 addResourceWithType:7 fileURL:v19 options:0];
    uint64_t v25 = 0;
    BOOL v27 = v37;
    goto LABEL_25;
  }
  uint64_t v35 = 0;
  uint64_t v25 = 0;
  int v26 = 0;
  id v24 = 0;
LABEL_18:
  uint64_t v31 = PLPhotoKitIngestGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    char v32 = [v4 objectForKeyedSubscript:v8];
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v32;
    _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "Failed to get adjustments data URL for asset with UUID: %@", buf, 0xCu);
  }
  id v33 = 0;
  double v14 = v38;
  uint64_t v5 = v39;
LABEL_32:

  return v33;
}

+ (id)creationRequestForAssetFromVideoJobDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8CAE8]];
  double v6 = (void *)[v4 initFileURLWithPath:v5 isDirectory:0];

  uint64_t v7 = *MEMORY[0x1E4F8C8F0];
  uint64_t v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
  uint64_t v9 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:v8];

  [v9 addResourceWithType:2 fileURL:v6 options:0];
  id v10 = [[PHAssetCreationCameraIngestOptions alloc] initFromJobDictionary:v3 withPreviewImgSurfaceRef:0];
  [v9 setCameraIngestOptions:v10];

  id v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C8B0]];

  if (v11)
  {
    uint64_t v12 = [v9 _createAdjustmentsFileFromJobDictionary:v3 cameraIngestOptions:0];
    if (!v12)
    {
      id v16 = 0;
      goto LABEL_13;
    }
    id v13 = (void *)v12;
    [v9 addResourceWithType:7 fileURL:v12 options:0];
    double v14 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8CA38]];
    if (v14)
    {
      id v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
      if (v15) {
        [v9 addResourceWithType:107 fileURL:v15 options:0];
      }
    }
    else
    {
      id v17 = PLPhotoKitIngestGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = [v3 objectForKeyedSubscript:v7];
        int v20 = 138412290;
        long long v21 = v18;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "No largeThumbnail file associated to asset with uuid %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  id v16 = v9;
LABEL_13:

  return v16;
}

+ (id)creationRequestForAssetFromVideoPreviewJobDict:(id)a3 withPreviewImageSurface:(__IOSurface *)a4
{
  uint64_t v5 = *MEMORY[0x1E4F8C8F0];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];
  uint64_t v8 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:v7];

  id v9 = [[PHAssetCreationCameraIngestOptions alloc] initFromJobDictionary:v6 withPreviewImgSurfaceRef:a4];
  [v8 setCameraIngestOptions:v9];

  return v8;
}

+ (id)creationRequestForAssetFromImageData:(id)a3 usingUUID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _creationRequestForAssetUsingUUID:a4];
  [v7 _addResourceWithType:1 data:v6 orFileURL:0 options:0];

  return v7;
}

+ (id)creationRequestForAssetFromImageData:(id)a3 options:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 creationRequestForAssetWithOptions:a4];
  [v7 _addResourceWithType:1 data:v6 orFileURL:0 options:0];

  return v7;
}

+ (id)creationRequestForAssetFromImageData:(id)a3
{
  return (id)[a1 creationRequestForAssetFromImageData:a3 usingUUID:0];
}

+ (id)creationRequestForAssetWithUUID:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [a1 _creationRequestForAssetUsingUUID:v8];
  if ([v7 copyStillPhotoFromLivePhoto]) {
    [v9 _setDuplicateLivePhotoAsStill:1];
  }
  if ([v7 copyOriginal]) {
    [v9 _setDuplicateAsOriginal:1];
  }
  if ([v7 copySinglePhotoFromBurst]) {
    [v9 _setDuplicateSinglePhotoFromBurst:1];
  }
  if ([v7 copyAsAlternateAsset]) {
    [v9 _setDuplicateAsAlternateAsset:1];
  }
  if ([v7 useRecoverableStagingDirectory])
  {
    [v9 _setUseRecoverableStagingDirectory:1];
    [v9 _setCreatingAssetIsBusy:1];
  }
  if ([v7 crashBeforeCreation]) {
    [v9 setCrashBeforeCreation:1];
  }
  if ([v7 shouldCreateScreenshot]) {
    [v9 _setShouldCreateScreenshot:1];
  }
  if ([v7 shouldUseAutomaticallyGeneratedOriginalFilename]) {
    [v9 _setShouldUseAutomaticallyGeneratedOriginalFilename:1];
  }

  return v9;
}

+ (id)creationRequestForAssetWithOptions:(id)a3
{
  return (id)[a1 creationRequestForAssetWithUUID:0 options:a3];
}

+ (id)creationRequestForAssetWithUUID:(id)a3
{
  return (id)[a1 creationRequestForAssetWithUUID:a3 options:0];
}

+ (PHAssetCreationRequest)creationRequestForAsset
{
  return (PHAssetCreationRequest *)[a1 _creationRequestForAssetUsingUUID:0];
}

+ (id)_creationRequestForAssetUsingUUID:(id)a3
{
  id v3 = a3;
  id v4 = [[PHAssetCreationRequest alloc] initForNewObjectWithUUID:v3];

  return v4;
}

@end