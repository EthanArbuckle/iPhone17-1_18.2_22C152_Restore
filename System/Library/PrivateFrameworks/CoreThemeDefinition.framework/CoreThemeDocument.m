@interface CoreThemeDocument
+ (BOOL)deepmap2CompressionEnabled;
+ (BOOL)defaultAllowsExtendedRangePixelFormats;
+ (id)_imageAssetURLsByCopyingFileURLs:(id)a3 toManagedLocationAtURL:(id)a4 error:(id *)a5;
+ (id)_sharedDocumentList;
+ (id)createConfiguredDocumentAtURL:(id)a3 error:(id *)a4;
+ (id)createConfiguredDocumentAtURL:(id)a3 targetPlatform:(int64_t)a4 error:(id *)a5;
+ (id)dataModelNameForVersion:(int64_t)a3;
+ (id)defaultThemeBitSourceURLForDocumentURL:(id)a3;
+ (id)migrateDocumentAtURL:(id)a3 ofType:(id)a4 error:(id *)a5;
+ (id)persistentStringForPlatform:(int64_t)a3;
+ (int)maximumAreaOfPackableImageForScale:(unint64_t)a3;
+ (int)shouldConvertColorsFromColorSpaceWithIdentifier:(unint64_t)a3 toIdentifier:(unint64_t)a4 error:(id *)a5;
+ (int64_t)dataModelVersion;
+ (int64_t)dataModelVersionFromMetadata:(id)a3;
+ (int64_t)platformForPersistentString:(id)a3;
+ (int64_t)targetPlatformForMOC:(id)a3;
+ (unint64_t)standardColorSpaceID;
+ (void)_addThemeDocument:(id)a3;
+ (void)closeMigrationProgress;
+ (void)initialize;
+ (void)presentMigrationProgress;
- (BOOL)_canremoveKeyAttribte:(unsigned __int16)a3;
- (BOOL)_clampMetrics;
- (BOOL)_matchesAllExceptGamut:(id)a3 andKeySpec:(id)a4;
- (BOOL)_production:(id)a3 containsScale:(unsigned int)a4 andIdiom:(unsigned int)a5 andSubtype:(unsigned int)a6;
- (BOOL)_updateRenditionPackings:(id)a3 error:(id *)a4;
- (BOOL)allowMultipleInstancesOfElementID:(int64_t)a3;
- (BOOL)allowsExtendedRangePixelFormats;
- (BOOL)buildModelError:(id *)a3;
- (BOOL)canImportNamedAssetImportInfo:(id)a3;
- (BOOL)checkCompatibilityOfDocumentAtURL:(id)a3 ofType:(id)a4 error:(id *)a5;
- (BOOL)configurePersistentStoreCoordinatorForURL:(id)a3 ofType:(id)a4 modelConfiguration:(id)a5 storeOptions:(id)a6 error:(id *)a7;
- (BOOL)createCustomArtworkProductionsForCustomAssets:(id)a3 withImportInfos:(id)a4 error:(id *)a5;
- (BOOL)createPSDReferenceArtworkForRenditionGroup:(id)a3 atDestination:(id)a4 error:(id *)a5;
- (BOOL)customizationExistsForSchemaDefinition:(id)a3;
- (BOOL)customizeSchemaEffectDefinition:(id)a3 shouldReplaceExisting:(BOOL)a4 error:(id *)a5;
- (BOOL)customizeSchemaElementDefinition:(id)a3 usingArtworkFormat:(id)a4 shouldReplaceExisting:(BOOL)a5 error:(id *)a6;
- (BOOL)customizeSchemaMaterialDefinition:(id)a3 shouldReplaceExisting:(BOOL)a4 error:(id *)a5;
- (BOOL)customizeSchemaPartDefinition:(id)a3 usingArtworkFormat:(id)a4 nameElement:(id)a5 shouldReplaceExisting:(BOOL)a6 error:(id *)a7;
- (BOOL)didMigrate;
- (BOOL)featureEnabled:(int)a3;
- (BOOL)isArtworkRenditionEligibleForForwardstop:(id)a3;
- (BOOL)isCustomLook;
- (BOOL)needToCreateForwardstopFor2018DeploymentVariant:(id)a3 withCompressionTypes:(id)a4;
- (BOOL)needToCreateForwardstopFor2019DeploymentVariant:(id)a3 withCompressionTypes:(id)a4;
- (BOOL)needToCreateForwardstopForPlatform;
- (BOOL)readFromURL:(id)a3 ofType:(id)a4 error:(id *)a5;
- (BOOL)renameThemeBitSourceFolderTo:(id)a3 error:(id *)a4;
- (BOOL)shouldAllowDeepmap2Compression;
- (BOOL)shouldAllowDeepmap2CompressionForDeploymentTarget:(unsigned int)a3;
- (BOOL)shouldAllowDeepmapCompression;
- (BOOL)shouldAllowDeepmapCompressionForDeploymentTarget:(unsigned int)a3;
- (BOOL)shouldAllowHevcCompression;
- (BOOL)shouldAllowHevcCompressionForDeploymentTarget:(unsigned int)a3;
- (BOOL)shouldAllowPaletteImageCompression;
- (BOOL)shouldAllowPaletteImageCompressionForDeploymentTarget:(unsigned int)a3;
- (BOOL)shouldCreate2018ForwardstopForLossless;
- (BOOL)shouldCreate2019ForwardstopForLossless;
- (BOOL)shouldCreateForwardstopForLossy;
- (BOOL)shouldGenerateDisplayGamut:(unsigned int)a3;
- (BOOL)shouldGenerateScale:(unsigned int)a3;
- (BOOL)shouldSupportCompactCompression;
- (BOOL)usesCUISystemThemeRenditionKey;
- (CoreThemeDocument)init;
- (CoreThemeDocument)initWithContentsOfURL:(id)a3 ofType:(id)a4 error:(id *)a5;
- (CoreThemeDocument)initWithType:(id)a3 error:(id *)a4;
- (CoreThemeDocument)initWithType:(id)a3 targetPlatform:(int64_t)a4 error:(id *)a5;
- (NSString)minimumDeploymentVersion;
- (NSString)pathToRepresentedDocument;
- (NSURL)themeBitSourceURL;
- (NSUUID)uuid;
- (TDAssetManagementDelegate)assetManagementDelegate;
- (TDCatalogGlobals)catalogGlobals;
- (TDCustomAssetProvider)customAssetProvider;
- (TDDeviceTraits)optimizeForDeviceTraits;
- (const)renditionKeyFormat;
- (const)untrimmedRenditionKeyFormat;
- (id)_addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4 referenceFiles:(BOOL)a5 bitSource:(id)a6 customInfos:(id)a7 sortedCustomInfos:(id *)a8;
- (id)_addAssetsFromCustomAssetInfos:(id)a3 bitSource:(id)a4 error:(id *)a5;
- (id)_cachedConstantsForEntity:(id)a3;
- (id)_cachedModelAssets;
- (id)_createNamedElementWithIdentifier:(int64_t)a3;
- (id)_createNamedElementWithNextAvailableIdentifier;
- (id)_createPhotoshopElementProductionWithAsset:(id)a3;
- (id)_customizedSchemaDefinitionsForEntity:(id)a3;
- (id)_genericPartDefinition;
- (id)_namedImageEffectPartDefinition;
- (id)_namedImagePartDefinition;
- (id)_namedTextEffectPartDefinition;
- (id)_predicateForRenditionKeySpec:(id)a3;
- (id)_sizeIndexesByNameFromNamedAssetImportInfos:(id)a3;
- (id)_themeBitSource:(id *)a3;
- (id)_themeBitSourceForReferencedFilesAtURLs:(id)a3 createIfNecessary:(BOOL)a4;
- (id)addAssetsAtFileURLs:(id)a3;
- (id)addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4;
- (id)addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4 referenceFiles:(BOOL)a5 bitSource:(id)a6 customInfos:(id)a7;
- (id)allObjectsForEntity:(id)a3 withSortDescriptors:(id)a4;
- (id)allObjectsForEntity:(id)a3 withSortDescriptors:(id)a4 error:(id *)a5;
- (id)appearanceWithIdentifier:(int64_t)a3;
- (id)appearanceWithIdentifier:(int64_t)a3 name:(id)a4 createIfNeeded:(BOOL)a5;
- (id)artworkFormat;
- (id)assetAtFileURL:(id)a3;
- (id)assetAtPath:(id)a3;
- (id)compressionTypeWithIdentifier:(int64_t)a3;
- (id)compressionTypes;
- (id)constantWithName:(id)a3 forIdentifier:(int64_t)a4;
- (id)createAssetWithName:(id)a3 fileType:(id)a4 scaleFactor:(unsigned int)a5 inCategory:(id)a6 forThemeBitSource:(id)a7;
- (id)createAssetWithName:(id)a3 inCategory:(id)a4 forThemeBitSource:(id)a5;
- (id)createAssetWithName:(id)a3 scaleFactor:(unsigned int)a4 inCategory:(id)a5 forThemeBitSource:(id)a6;
- (id)createEffectStyleProductionForPartDefinition:(id)a3;
- (id)createEffectStyleProductionForPartDefinition:(id)a3 withNameIdentifier:(id)a4;
- (id)createElementProductionWithAsset:(id)a3;
- (id)createNamedArtworkProductionsForAssets:(id)a3 customInfos:(id)a4 error:(id *)a5;
- (id)createNamedColorProductionsForImportInfos:(id)a3 error:(id *)a4;
- (id)createNamedEffectProductionWithName:(id)a3 isText:(BOOL)a4;
- (id)createProductionWithRenditionGroup:(id)a3 forPartDefinition:(id)a4 artworkFormat:(id)a5 nameElement:(id)a6 shouldReplaceExisting:(BOOL)a7 error:(id *)a8;
- (id)createProductionWithRenditionGroup:(id)a3 forPartDefinition:(id)a4 artworkFormat:(id)a5 shouldReplaceExisting:(BOOL)a6 error:(id *)a7;
- (id)createReferencePNGForSchemaRendition:(id)a3 withPartDefinition:(id)a4 atLocation:(id)a5 error:(id *)a6;
- (id)createTextStyleProductionsForImportInfos:(id)a3 error:(id *)a4;
- (id)customizedSchemaEffectDefinitions;
- (id)customizedSchemaElementDefinitions;
- (id)customizedSchemaMaterialDefinitions;
- (id)defaultBaseFileNameForSchemaRendition:(id)a3 withPartDefinition:(id)a4;
- (id)defaultPNGFileNameForSchemaRendition:(id)a3 withPartDefinition:(id)a4;
- (id)defaultPathComponentsForPartDefinition:(id)a3;
- (id)deploymentTargetWithIdentifier:(int64_t)a3;
- (id)deploymentTargets;
- (id)deviceTraitsUsedForOptimization;
- (id)directionWithIdentifier:(int64_t)a3;
- (id)directions;
- (id)displayGamutWithIdentifier:(int64_t)a3;
- (id)displayGamuts;
- (id)drawingLayerWithIdentifier:(int64_t)a3;
- (id)effectComponentWithType:(unsigned int)a3 inRendition:(id)a4 createIfNeeded:(BOOL)a5;
- (id)effectParameterTypeWithIdentifier:(unsigned int)a3;
- (id)effectParameterValueWithType:(unsigned int)a3 inComponent:(id)a4 createIfNeeded:(BOOL)a5;
- (id)effectTypeWithIdentifier:(unsigned int)a3;
- (id)elementProductionsWithName:(id)a3;
- (id)elementWithIdentifier:(int64_t)a3;
- (id)featureSetClasses;
- (id)folderNameFromRenditionKey:(id)a3 forPartDefinition:(id)a4;
- (id)glyphRenderingModes;
- (id)glyphSizeWithIdentifier:(int64_t)a3;
- (id)glyphWeightWithIdentifier:(int64_t)a3;
- (id)glyphWeights;
- (id)glyphsSizes;
- (id)graphicsFeatureSetClassWithIdentifier:(int64_t)a3;
- (id)historian;
- (id)idiomWithIdentifier:(int64_t)a3;
- (id)idioms;
- (id)iterationTypeWithIdentifier:(int)a3;
- (id)localizationWithIdentifier:(int64_t)a3;
- (id)localizationWithIdentifier:(int64_t)a3 name:(id)a4 createIfNeeded:(BOOL)a5;
- (id)managedObjectModel;
- (id)mappingForPhotoshopLayerIndex:(int64_t)a3 themeDrawingLayerIdentifier:(int64_t)a4;
- (id)metadatumForKey:(id)a3;
- (id)minimalDisplayNameForThemeConstant:(id)a3;
- (id)mocOrganizer;
- (id)namedArtworkProductionWithName:(id)a3;
- (id)namedArtworkProductions;
- (id)namedEffectProductionWithName:(id)a3;
- (id)namedEffectProductions;
- (id)namedElementWithName:(id)a3;
- (id)namedElementsForElementDefinition:(id)a3;
- (id)newObjectForEntity:(id)a3;
- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5;
- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6;
- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 withContext:(id)a6 error:(id *)a7;
- (id)partWithIdentifier:(int64_t)a3;
- (id)pathToAsset:(id)a3;
- (id)persistentStoreTypeForFileType:(id)a3;
- (id)pixelFormatWithIdentifier:(int64_t)a3;
- (id)presentationStateWithIdentifier:(int64_t)a3;
- (id)previousStateWithIdentifier:(int64_t)a3;
- (id)previousValueWithIdentifier:(int64_t)a3;
- (id)psdImageRefForAsset:(id)a3;
- (id)relativePathToProductionData;
- (id)renditionSubtypeWithIdentifier:(unsigned int)a3;
- (id)renditionTypeWithIdentifier:(int64_t)a3;
- (id)renditionsMatchingRenditionKeySpec:(id)a3;
- (id)rootPathForProductionData;
- (id)schemaCategoryWithIdentifier:(int64_t)a3;
- (id)schemaDefinitionWithElementID:(int64_t)a3;
- (id)schemaPartDefinitionWithElementID:(int64_t)a3 partID:(int64_t)a4;
- (id)sizeClassWithIdentifier:(int64_t)a3;
- (id)sizeClasses;
- (id)sizeWithIdentifier:(int64_t)a3;
- (id)slicesComputedForImageSize:(CGSize)a3 usingSliceInsets:(id)a4 resizableSliceSize:(CGSize)a5 withRenditionType:(int64_t)a6;
- (id)stateWithIdentifier:(int64_t)a3;
- (id)templateRenderingModeWithIdentifier:(int64_t)a3;
- (id)textureFaceWithIdentifier:(int64_t)a3;
- (id)textureFaces;
- (id)textureInterpretaitionWithIdentifier:(unsigned int)a3;
- (id)themeBitSourceFolderName;
- (id)themeConstant:(id)a3 withIdentifier:(int64_t)a4;
- (id)updateAutomaticTexturesForCustomInfos:(id)a3 allTextureInfos:(id)a4;
- (id)updateToEmbeddedSchemaVersion2AndReturnAlertString:(id *)a3;
- (id)updatedVersionsMetadataFromMetadata:(id)a3;
- (id)valueWithIdentifier:(int64_t)a3;
- (id)vectorGlyphRenderingModeWithIdentifier:(int64_t)a3;
- (int)majorVersion;
- (int)minorVersion;
- (int)patchVersion;
- (int)renditionKeySemantics;
- (int64_t)_compareFlattenedKeySpec1:(id)a3 toKeySpec2:(id)a4;
- (int64_t)renditionKeySpecAttributeCount;
- (int64_t)targetPlatform;
- (unint64_t)colorSpaceID;
- (unint64_t)countForEntity:(id)a3 withPredicate:(id)a4;
- (unint64_t)countOfRenditionsMatchingRenditionKeySpec:(id)a3;
- (unint64_t)countOfRenditionsMatchingRenditionKeySpecs:(id)a3;
- (unsigned)checksum;
- (void)_addResolvedLayerReferenceToFlattenedImageRendition:(id)a3 usingArtworkRendition:(id)a4 andLayerReference:(id)a5;
- (void)_automaticP3GenerationFromSRGB;
- (void)_automaticSRGBGenerationFromP3;
- (void)_backwardsCompatibilityPatchForLayoutDirection;
- (void)_configureAfterFirstSave;
- (void)_createForwardstopRenditions;
- (void)_delete:(id)a3 withRendition:(id)a4;
- (void)_generateWatchImages;
- (void)_getFilename:(id *)a3 scaleFactor:(unsigned int *)a4 category:(id *)a5 bitSource:(id *)a6 forFileURL:(id)a7;
- (void)_groupPackableRenditions;
- (void)_insertRendition:(id)a3 forKey:(id)a4;
- (void)_makeRadiosityImages;
- (void)_makeSolidLayerStackTextures;
- (void)_normalizeRenditionKeySpec:(id)a3 forSchemaRendition:(id)a4;
- (void)_optimizeForDeviceTraits;
- (void)_processModelProductions;
- (void)_removeRedundantPDFBasedRenditions:(id)a3;
- (void)_removeRedundantPDFBasedRenditionsForAssets:(id)a3;
- (void)_synchronousSave;
- (void)_tidyUpLayerStacks;
- (void)_tidyUpRecognitionImages;
- (void)_updateDeviceTraits;
- (void)_updateKeyFormatWithContext:(id)a3;
- (void)addDeviceTraitForOptimization:(id)a3;
- (void)addThemeBitSourceAtPath:(id)a3;
- (void)addThemeBitSourceAtPath:(id)a3 createProductions:(BOOL)a4;
- (void)changedObjectsNotification:(id)a3;
- (void)convertColorsFromColorSpaceWithIdentifier:(unint64_t)a3 toIdentifier:(unint64_t)a4;
- (void)createForwardstops:(id)a3 withCompressionTypes:(id)a4 withDeploymentTargets:(id)a5;
- (void)createNamedGlyphVectorForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6;
- (void)createNamedModelsForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6;
- (void)createNamedRecognitionObjectsForAssets:(id)a3 customInfos:(id)a4 error:(id *)a5;
- (void)createNamedRenditionGroupProductionsForImportInfos:(id)a3 error:(id *)a4;
- (void)createNamedTexturesForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6;
- (void)dealloc;
- (void)deleteNamedAssets:(id)a3 shouldDeleteAssetFiles:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteObject:(id)a3;
- (void)deleteObjects:(id)a3;
- (void)deleteProduction:(id)a3 shouldDeleteAssetFiles:(BOOL)a4;
- (void)deleteProductions:(id)a3 shouldDeleteAssetFiles:(BOOL)a4;
- (void)exportCursorsToURL:(id)a3;
- (void)importCursorsFromURL:(id)a3 getUnusedImportedCursors:(id *)a4 getUnupdatedCursors:(id *)a5;
- (void)importCustomAssetsWithImportInfos:(id)a3 completionHandler:(id)a4;
- (void)importNamedAssetsFromFileURLs:(id)a3 referenceFiles:(BOOL)a4 completionHandler:(id)a5;
- (void)importNamedAssetsWithImportInfos:(id)a3 referenceFiles:(BOOL)a4 completionHandler:(id)a5;
- (void)incrementallyPackRenditionsSinceDate:(id)a3 error:(id *)a4;
- (void)packRenditionsError:(id *)a3;
- (void)primeArrayControllers;
- (void)removeCustomizationForSchemaDefinition:(id)a3 shouldDeleteAssetFiles:(BOOL)a4;
- (void)removeDeviceTraitsForOptimization;
- (void)resetThemeConstants;
- (void)setAllowsExtendedRangePixelFormats:(BOOL)a3;
- (void)setArtworkFormat:(id)a3;
- (void)setAssetManagementDelegate:(id)a3;
- (void)setCustomAssetProvider:(id)a3;
- (void)setMetadatum:(id)a3 forKey:(id)a4;
- (void)setMinimumDeploymentVersion:(id)a3;
- (void)setOptimizeForDeviceTraits:(id)a3;
- (void)setPathToRepresentedDocument:(id)a3;
- (void)setRelativePathToProductionData:(id)a3;
- (void)setTargetPlatform:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)updateRenditionSpec:(id)a3;
@end

@implementation CoreThemeDocument

+ (void)initialize
{
  __coreThemeLoggingEnabled = getenv("CoreThemeLoggingEnabled") != 0;
  v2 = getenv("CoreUI_PACKING");
  if (v2)
  {
    v3 = v2;
    v4 = strdup(v2);
    __stringp = v4;
    v5 = strsep(&__stringp, ":");
    v6 = strsep(&__stringp, ":");
    uint64_t v7 = atoi(v5);
    __packing_max_area = v7;
    if (v6)
    {
      uint64_t v8 = atoi(v6);
      __packing_imageSize_allowed = v8;
    }
    else
    {
      uint64_t v8 = __packing_imageSize_allowed;
    }
    free(v4);
    NSLog(&cfstr_Corethemedocum_0.isa, v3, v7, v8);
  }
}

+ (int)maximumAreaOfPackableImageForScale:(unint64_t)a3
{
  return __packing_imageSize_allowed * a3;
}

- (void)setMinimumDeploymentVersion:(id)a3
{
  minimumDeploymentVersion = self->_minimumDeploymentVersion;
  if (minimumDeploymentVersion != a3)
  {

    v6 = (NSString *)[a3 copy];
    self->_minimumDeploymentVersion = v6;
    uint64_t v7 = [(NSString *)v6 componentsSeparatedByString:@"."];
    uint64_t v8 = [(NSArray *)v7 count];
    if (v8)
    {
      unint64_t v9 = v8;
      self->_int majorVersion = objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", 0), "intValue");
      if (v9 != 1)
      {
        self->_int minorVersion = objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", 1), "intValue");
        if (v9 < 3) {
          int v10 = 0;
        }
        else {
          int v10 = objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", 2), "intValue");
        }
LABEL_8:
        self->_patchVersion = v10;
        if ([(CoreThemeDocument *)self targetPlatform])
        {
          if ([(CoreThemeDocument *)self targetPlatform] == 5) {
            goto LABEL_23;
          }
          int64_t v11 = [(CoreThemeDocument *)self targetPlatform];
          int majorVersion = self->_majorVersion;
          if (v11 == 4)
          {
            if (majorVersion < 2)
            {
              v13 = (void *)MEMORY[0x263F38370];
              if (majorVersion == 1) {
                goto LABEL_29;
              }
              goto LABEL_20;
            }
LABEL_23:
            v13 = (void *)MEMORY[0x263F38370];
            uint64_t v16 = 2;
            goto LABEL_24;
          }
          if (majorVersion >= 9) {
            goto LABEL_23;
          }
          v13 = (void *)MEMORY[0x263F38370];
          if (majorVersion == 8)
          {
LABEL_29:
            uint64_t v16 = 1;
            goto LABEL_24;
          }
        }
        else
        {
          int v14 = self->_majorVersion;
          if (v14 >= 10)
          {
            if (v14 != 10) {
              goto LABEL_23;
            }
            int minorVersion = self->_minorVersion;
            if (minorVersion > 10) {
              goto LABEL_23;
            }
            if (minorVersion >= 10)
            {
              v13 = (void *)MEMORY[0x263F38370];
              goto LABEL_29;
            }
          }
          v13 = (void *)MEMORY[0x263F38370];
        }
LABEL_20:
        uint64_t v16 = 0;
LABEL_24:
        [v13 setFileEncoding:v16];
        goto LABEL_25;
      }
    }
    else
    {
      self->_int majorVersion = 0x7FFFFFFF;
    }
    int v10 = 0;
    self->_int minorVersion = 0;
    goto LABEL_8;
  }
LABEL_25:

  [(CoreThemeDocument *)self _updateDeviceTraits];
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)patchVersion
{
  return self->_patchVersion;
}

- (TDDeviceTraits)optimizeForDeviceTraits
{
  return (TDDeviceTraits *)[(NSMutableArray *)self->_deviceTraits firstObject];
}

- (void)setOptimizeForDeviceTraits:(id)a3
{
  if (a3) {
    -[CoreThemeDocument addDeviceTraitForOptimization:](self, "addDeviceTraitForOptimization:");
  }
  else {
    [(CoreThemeDocument *)self removeDeviceTraitsForOptimization];
  }
}

- (void)addDeviceTraitForOptimization:(id)a3
{
  if (a3)
  {
    deviceTraits = self->_deviceTraits;
    if (!deviceTraits)
    {
      deviceTraits = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_deviceTraits = deviceTraits;
    }
    [(NSMutableArray *)deviceTraits addObject:a3];
    if ([a3 dynamicDisplayModeValue] == 1)
    {
      id v6 = (id)objc_msgSend(a3, "copyWithZone:", -[CoreThemeDocument zone](self, "zone"));
      [v6 setScale:1.0];
      [v6 setDisplayGamut:@"sRGB"];
      [(NSMutableArray *)self->_deviceTraits addObject:v6];
    }
  }
}

- (void)removeDeviceTraitsForOptimization
{
  self->_deviceTraits = 0;
}

- (id)deviceTraitsUsedForOptimization
{
  return self->_deviceTraits;
}

- (BOOL)shouldGenerateScale:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  deviceTraits = self->_deviceTraits;
  if (!deviceTraits)
  {
LABEL_11:
    LOBYTE(v5) = 1;
    return v5;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSMutableArray *)deviceTraits countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    double v8 = (double)a3;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(deviceTraits);
      }
      [*(id *)(*((void *)&v12 + 1) + 8 * v9) scale];
      if (v10 == v8) {
        goto LABEL_11;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [(NSMutableArray *)deviceTraits countByEnumeratingWithState:&v12 objects:v16 count:16];
        LOBYTE(v5) = 0;
        if (v6) {
          goto LABEL_4;
        }
        return v5;
      }
    }
  }
  return v5;
}

- (void)updateRenditionSpec:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  if (![(CoreThemeDocument *)self targetPlatform])
  {
    int majorVersion = self->_majorVersion;
    if (majorVersion < 10 || (majorVersion == 10 ? (BOOL v9 = self->_minorVersion <= 9) : (BOOL v9 = 0), v9))
    {
      BOOL v7 = 0;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if ([(CoreThemeDocument *)self targetPlatform] == 5
    || [(CoreThemeDocument *)self targetPlatform] != 1
    && [(CoreThemeDocument *)self targetPlatform] != 4
    && [(CoreThemeDocument *)self targetPlatform] != 3
    && [(CoreThemeDocument *)self targetPlatform] != 2)
  {
LABEL_16:
    BOOL v7 = 1;
    goto LABEL_18;
  }
  int64_t v5 = [(CoreThemeDocument *)self targetPlatform];
  int v6 = self->_majorVersion;
  if (v5 != 4)
  {
    if (v6 < 8 || (uint64_t v11 = 1, v6 == 8) && self->_minorVersion < 0) {
      uint64_t v11 = 0;
    }
    [a3 setAllowsMultiPassEncoding:v11];
    [a3 setAllowsOptimalRowbytesPacking:v11];
    int v12 = self->_majorVersion;
    if (v12 > 8) {
      goto LABEL_20;
    }
    BOOL v7 = 0;
    if (v12 == 8 && self->_minorVersion >= 4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  BOOL v7 = v6 > 1;
LABEL_18:
  [a3 setAllowsMultiPassEncoding:v7];
LABEL_19:
  [a3 setAllowsOptimalRowbytesPacking:v7];
LABEL_20:
  BOOL v10 = [(CoreThemeDocument *)self shouldSupportCompactCompression];

  [a3 setAllowsCompactCompression:v10];
}

- (BOOL)shouldSupportCompactCompression
{
  return [(CoreThemeDocument *)self featureEnabled:10];
}

- (BOOL)shouldAllowPaletteImageCompression
{
  return [(CoreThemeDocument *)self featureEnabled:11];
}

- (BOOL)shouldAllowPaletteImageCompressionForDeploymentTarget:(unsigned int)a3
{
  return a3 > 2;
}

- (BOOL)shouldAllowHevcCompression
{
  if ([(CoreThemeDocument *)self featureEnabled:20]) {
    return 0;
  }

  return [(CoreThemeDocument *)self featureEnabled:12];
}

- (BOOL)shouldAllowHevcCompressionForDeploymentTarget:(unsigned int)a3
{
  BOOL v4 = ![(CoreThemeDocument *)self featureEnabled:20];
  return a3 > 2 && v4;
}

- (BOOL)shouldAllowDeepmapCompression
{
  return [(CoreThemeDocument *)self featureEnabled:13];
}

- (BOOL)shouldAllowDeepmapCompressionForDeploymentTarget:(unsigned int)a3
{
  return a3 > 2;
}

+ (BOOL)deepmap2CompressionEnabled
{
  return 1;
}

- (BOOL)shouldAllowDeepmap2Compression
{
  return [(CoreThemeDocument *)self featureEnabled:14];
}

- (BOOL)shouldAllowDeepmap2CompressionForDeploymentTarget:(unsigned int)a3
{
  return a3 > 4;
}

- (BOOL)shouldCreateForwardstopForLossy
{
  return ![(CoreThemeDocument *)self featureEnabled:12];
}

- (BOOL)shouldCreate2018ForwardstopForLossless
{
  if ([(CoreThemeDocument *)self featureEnabled:11]) {
    return 0;
  }
  else {
    return ![(CoreThemeDocument *)self featureEnabled:13];
  }
}

- (BOOL)shouldCreate2019ForwardstopForLossless
{
  return ![(CoreThemeDocument *)self featureEnabled:14];
}

- (void)changedObjectsNotification:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[TDPersistentDocument managedObjectContext](self, "managedObjectContext")))
  {
    int64_t v5 = (void *)[a3 userInfo];
    int v6 = (void *)[MEMORY[0x263EFF980] array];
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x263EFF018]), "allObjects"));
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x263EFF180]), "allObjects"));
    id v7 = [(CoreThemeDocument *)self historian];
    [v7 updateEntriesForManagedObjects:v6];
  }
}

- (id)_predicateForRenditionKeySpec:(id)a3
{
  v20[29] = *MEMORY[0x263EF8340];
  uint64_t v17 = @"part";
  v18 = sel_part;
  v19 = @"direction";
  v20[0] = sel_direction;
  v20[1] = @"state";
  v20[2] = sel_state;
  v20[3] = @"presentationState";
  v20[4] = sel_presentationState;
  v20[5] = @"size";
  v20[6] = sel_size;
  v20[7] = @"element";
  v20[8] = sel_element;
  v20[9] = @"value";
  v20[10] = sel_value;
  v20[11] = @"layer";
  v20[12] = sel_layer;
  v20[13] = @"idiom";
  v20[14] = sel_idiom;
  v20[15] = @"graphicsFeatureSetClass";
  v20[16] = sel_graphicsFeatureSetClass;
  v20[17] = @"sizeClassHorizontal";
  v20[18] = sel_sizeClassHorizontal;
  v20[19] = @"sizeClassVertical";
  v20[20] = sel_sizeClassVertical;
  v20[21] = @"appearance";
  v20[22] = sel_appearance;
  v20[23] = @"localization";
  v20[24] = sel_localization;
  v20[25] = @"target";
  v20[26] = sel_target;
  v20[27] = 0;
  v20[28] = 0;
  BOOL v4 = @"nameIdentifier";
  int64_t v5 = sel_nameIdentifier;
  long long v15 = @"dimension1";
  v16[0] = sel_dimension1;
  v16[1] = @"dimension2";
  v16[2] = sel_dimension2;
  v16[3] = @"scaleFactor";
  v16[4] = sel_scaleFactor;
  v16[5] = @"subtype";
  v16[6] = sel_subtype;
  v16[7] = @"memoryClass";
  v16[8] = sel_memoryClass;
  v16[9] = 0;
  v16[10] = 0;
  int v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:21];
  id v7 = (char **)v16;
  do
  {
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"keySpec.%K == %d", v4, objc_msgSend(a3, "performSelector:", v5)));
    BOOL v4 = (__CFString *)*(v7 - 1);
    int64_t v5 = *v7;
    v7 += 2;
  }
  while (v4);
  double v8 = v17;
  if (v17)
  {
    BOOL v9 = v18;
    BOOL v10 = (char **)v20;
    do
    {
      uint64_t v11 = (void *)[a3 performSelector:v9];
      if (v11) {
        uint64_t v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"keySpec.%K.identifier == %d", v8, objc_msgSend(v11, "identifier"));
      }
      else {
        uint64_t v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"( keySpec.%K.identifier == 0 OR keySpec.%K == NULL)", v8, v8);
      }
      [v6 addObject:v12];
      double v8 = (__CFString *)*(v10 - 1);
      BOOL v9 = *v10;
      v10 += 2;
    }
    while (v8);
  }
  long long v13 = (void *)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v6];

  return v13;
}

- (void)_getFilename:(id *)a3 scaleFactor:(unsigned int *)a4 category:(id *)a5 bitSource:(id *)a6 forFileURL:(id)a7
{
  long long v13 = (void *)[a7 lastPathComponent];
  unsigned int v14 = +[TDAsset scaleFactorFromImageFilename:v13];
  uint64_t v15 = objc_msgSend(-[CoreThemeDocument rootPathForProductionData](self, "rootPathForProductionData"), "td_stringByStandardizingPath");
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a7, "URLByStandardizingPath"), "path");
    if ([v17 rangeOfString:v16 options:8])
    {
      if (a5) {
        *a5 = 0;
      }
      if (a6) {
        *a6 = 0;
      }
    }
    else
    {
      v18 = (__CFString *)objc_msgSend((id)objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v16, "length")+ (objc_msgSend((id)objc_msgSend(v16, "substringWithRange:", objc_msgSend(v16, "length") - 1, 1), "isEqualToString:", @"/") ^ 1)), "stringByDeletingLastPathComponent");
      v19 = (void *)[(__CFString *)v18 pathComponents];
      if ((![(CoreThemeDocument *)self metadatumForKey:@"hasNoBitSource"]
         || [(CoreThemeDocument *)self isCustomLook])
        && [v19 count])
      {
        v20 = (__CFString *)[v19 objectAtIndex:0];
      }
      else
      {
        v20 = &stru_26E8675B0;
      }
      if (-[__CFString length](v20, "length") && (unint64_t)[v19 count] >= 2)
      {
        v18 = (__CFString *)[(__CFString *)v18 substringFromIndex:[(__CFString *)v20 length] + 1];
      }
      else if ([(__CFString *)v20 length])
      {
        v18 = &stru_26E8675B0;
      }
      if (a6)
      {
        id v21 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"ThemeBitSource", [MEMORY[0x263F08A98] predicateWithFormat:@"path == %@", v20], 0);
        uint64_t v22 = [v21 count];
        v23 = 0;
        if (v22 == 1)
        {
          [v21 objectAtIndex:0];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v23 = 0;
          if (isKindOfClass) {
            v23 = (void *)[v21 objectAtIndex:0];
          }
        }
        *a6 = v23;
      }
      if (a5) {
        *a5 = v18;
      }
    }
  }
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v14;
  }
}

+ (id)_sharedDocumentList
{
  if (_sharedDocumentList_pred != -1) {
    dispatch_once(&_sharedDocumentList_pred, &__block_literal_global_3);
  }
  return (id)sDocList;
}

uint64_t __40__CoreThemeDocument__sharedDocumentList__block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  sDocList = result;
  return result;
}

+ (void)_addThemeDocument:(id)a3
{
  [a1 _sharedDocumentList];
  BOOL v4 = (void *)sDocList;

  [v4 addObject:a3];
}

- (CoreThemeDocument)init
{
  v6.receiver = self;
  v6.super_class = (Class)CoreThemeDocument;
  v2 = [(CoreThemeDocument *)&v6 init];
  if (v2)
  {
    v2->constantArrayControllers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->cachedConstantArrays = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->_cachedAppearances = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_cachedUnknownAppearanceIds = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2->_cachedLocalizations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_cachedUnknownLocalizationIds = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2->_cachedModelAssets = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    [(CoreThemeDocument *)v2 primeArrayControllers];
    v3 = [TDThreadMOCOrganizer alloc];
    v2->m_mocOrganizer = -[TDThreadMOCOrganizer initWithDocument:mainThread:](v3, "initWithDocument:mainThread:", v2, [MEMORY[0x263F08B88] currentThread]);
    BOOL v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_changedObjectsNotification_ name:*MEMORY[0x263EFF050] object:0];
    -[CoreThemeDocument setTargetPlatform:](v2, "setTargetPlatform:", [(id)objc_opt_class() defaultTargetPlatform]);
    v2->_int majorVersion = 0x7FFFFFFF;
    v2->_int minorVersion = 0x7FFFFFFF;
    v2->_patchVersion = 0x7FFFFFFF;
  }
  return v2;
}

- (CoreThemeDocument)initWithType:(id)a3 targetPlatform:(int64_t)a4 error:(id *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CoreThemeDocument;
  id v7 = [(TDPersistentDocument *)&v11 initWithType:a3 error:a5];
  double v8 = v7;
  if (v7)
  {
    v7->_int majorVersion = 0x7FFFFFFF;
    v7->_int minorVersion = 0x7FFFFFFF;
    v7->_patchVersion = 0x7FFFFFFF;
    BOOL v9 = [(CoreThemeDocument *)v7 buildModelError:a5];
    [(CoreThemeDocument *)v8 setTargetPlatform:a4];
    if (!v9)
    {

      return 0;
    }
  }
  return v8;
}

- (CoreThemeDocument)initWithType:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CoreThemeDocument;
  int64_t v5 = -[TDPersistentDocument initWithType:error:](&v8, sel_initWithType_error_, a3);
  objc_super v6 = v5;
  if (v5)
  {
    v5->_int majorVersion = 0x7FFFFFFF;
    v5->_int minorVersion = 0x7FFFFFFF;
    v5->_patchVersion = 0x7FFFFFFF;
    if (![(CoreThemeDocument *)v5 buildModelError:a4])
    {

      return 0;
    }
  }
  return v6;
}

- (CoreThemeDocument)initWithContentsOfURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CoreThemeDocument;
  objc_super v6 = -[TDPersistentDocument initWithContentsOfURL:ofType:error:](&v9, sel_initWithContentsOfURL_ofType_error_, a3, a4);
  id v7 = v6;
  if (v6)
  {
    v6->_int majorVersion = 0x7FFFFFFF;
    v6->_int minorVersion = 0x7FFFFFFF;
    v6->_patchVersion = 0x7FFFFFFF;
    if (![(CoreThemeDocument *)v6 buildModelError:a5])
    {

      return 0;
    }
  }
  return v7;
}

+ (id)createConfiguredDocumentAtURL:(id)a3 error:(id *)a4
{
  uint64_t v7 = [(id)objc_opt_class() defaultTargetPlatform];

  return (id)[a1 createConfiguredDocumentAtURL:a3 targetPlatform:v7 error:a4];
}

+ (id)createConfiguredDocumentAtURL:(id)a3 targetPlatform:(int64_t)a4 error:(id *)a5
{
  id v8 = objc_alloc((Class)a1);
  id result = (id)[v8 initWithType:CoreThemeDocumentFileType targetPlatform:a4 error:a5];
  if (result)
  {
    id v10 = result;
    [result setFileURL:a3];
    if (objc_msgSend((id)objc_msgSend(v10, "managedObjectContext"), "save:", a5))
    {
      [v10 _configureAfterFirstSave];
      if (objc_msgSend((id)objc_msgSend(v10, "managedObjectContext"), "save:", a5)) {
        return v10;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (int64_t)dataModelVersionFromMetadata:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"CoreThemeDefinitionDataModelKey"];
  int64_t v5 = (void *)[a3 objectForKey:@"NSProThemeDefinitionDataModelKey"];
  if (v4) {
    int64_t v5 = (void *)v4;
  }

  return [v5 integerValue];
}

+ (id)migrateDocumentAtURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v8 = [MEMORY[0x263EFF320] metadataForPersistentStoreOfType:*MEMORY[0x263EFF168] URL:a3 options:0 error:a5];
  if (!v8) {
    return 0;
  }
  objc_super v9 = -[CoreThemeDefinitionMigrator initWithURL:oldVersion:newVersion:]([CoreThemeDefinitionMigrator alloc], "initWithURL:oldVersion:newVersion:", a3, [a1 dataModelVersionFromMetadata:v8], objc_msgSend(a1, "dataModelVersion"));
  if (!v9)
  {
    if (a5)
    {
      uint64_t v12 = 0;
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:CoreThemeDefinitionErrorDomain[0], 1, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Unrecognized document format, migration failed", @"reason" code userInfo];
      return v12;
    }
    return 0;
  }
  id v10 = v9;
  [a1 presentMigrationProgress];
  if ([(CoreThemeDefinitionMigrator *)v10 migrateWithError:a5])
  {
    uint64_t v11 = [(CoreThemeDefinitionMigrator *)v10 temporaryMigrationPath];
    uint64_t v12 = (void *)[NSURL fileURLWithPath:v11];
    NSLog(&cfstr_CreatedTempora.isa, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  [a1 closeMigrationProgress];
  return v12;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  keyFormat = self->_keyFormat;
  if (keyFormat) {
    free(keyFormat);
  }
  [(CoreThemeDocument *)self setPathToRepresentedDocument:0];

  v4.receiver = self;
  v4.super_class = (Class)CoreThemeDocument;
  [(TDPersistentDocument *)&v4 dealloc];
}

- (id)updateToEmbeddedSchemaVersion2AndReturnAlertString:(id *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = [(CoreThemeDocument *)self _namedTextEffectPartDefinition];
  id v22 = [(CoreThemeDocument *)self _namedImageEffectPartDefinition];
  id v5 = [(CoreThemeDocument *)self partWithIdentifier:178];
  id v21 = (void *)[MEMORY[0x263EFF980] array];
  v20 = (void *)[MEMORY[0x263EFF980] array];
  id v23 = v4;
  objc_super v6 = self;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"EffectStyleProduction", [MEMORY[0x263F08A98] predicateWithFormat:@"partDefinition = %@", v4], 0);
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v11, "baseKeySpec"), "setPart:", v5);
        [v11 setPartDefinition:v22];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v12 = (void *)[v11 renditions];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "keySpec"), "setPart:", v5);
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
        uint64_t v17 = -[CoreThemeDocument createEffectStyleProductionForPartDefinition:withNameIdentifier:](v6, "createEffectStyleProductionForPartDefinition:withNameIdentifier:", v23, objc_msgSend((id)objc_msgSend(v11, "name"), "identifier"));
        objc_msgSend(v21, "addObject:", objc_msgSend((id)objc_msgSend(v11, "name"), "name"));
        [v20 addObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }
  return @"Named Effects now support both high quality and simplified text variants. Your original effect definitions have been classified as 'High Quality Image Effects' and new 'Simplified Text Effect' effect definitions have been created with the same name, using default values. Adjust your effect definitions accordingly.";
}

- (id)managedObjectModel
{
  id result = self->m_managedObjectModel;
  if (!result)
  {
    id v4 = (void *)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreThemeDefinition"];
    id v5 = objc_alloc(MEMORY[0x263EFF298]);
    id result = (id)objc_msgSend(v5, "initWithContentsOfURL:", objc_msgSend(NSURL, "fileURLWithPath:", objc_msgSend(v4, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", +[CoreThemeDocument dataModelVersion](CoreThemeDocument, "dataModelVersion")), @"mom")));
    self->m_managedObjectModel = (NSManagedObjectModel *)result;
    if (!result)
    {
      NSLog(&cfstr_Corethemedocum_1.isa, objc_msgSend(v4, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", +[CoreThemeDocument dataModelVersion](CoreThemeDocument, "dataModelVersion")), @"mom"));
      return self->m_managedObjectModel;
    }
  }
  return result;
}

- (id)mocOrganizer
{
  return self->m_mocOrganizer;
}

- (id)historian
{
  id result = self->m_historian;
  if (!result)
  {
    id result = [[TDHistorian alloc] initWithDocument:self];
    self->m_historian = (TDHistorian *)result;
  }
  return result;
}

- (id)_cachedConstantsForEntity:(id)a3
{
  id v5 = (id)-[NSMutableDictionary objectForKey:](self->cachedConstantArrays, "objectForKey:");
  if (!v5)
  {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"identifier" ascending:1];
    id v5 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", a3, [MEMORY[0x263EFF8C0] arrayWithObject:v6]);

    if (v5) {
      [(NSMutableDictionary *)self->cachedConstantArrays setObject:v5 forKey:a3];
    }
  }
  return v5;
}

- (id)themeConstant:(id)a3 withIdentifier:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ((unint64_t)a4 > 0xFFFFFFFE) {
    return 0;
  }
  int v4 = a4;
  id v7 = -[CoreThemeDocument _cachedConstantsForEntity:](self, "_cachedConstantsForEntity:");
  if (![v7 count])
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"identifier" ascending:1];
    id v7 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self, "allObjectsForEntity:withSortDescriptors:", a3, [MEMORY[0x263EFF8C0] arrayWithObject:v8]);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v16;
LABEL_6:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v16 != v11) {
      objc_enumerationMutation(v7);
    }
    uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
    if ([v13 identifier] == v4) {
      return v13;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v13 = 0;
      if (v10) {
        goto LABEL_6;
      }
      return v13;
    }
  }
}

- (id)elementWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeElement" withIdentifier:a3];
}

- (id)partWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemePart" withIdentifier:a3];
}

- (id)sizeWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeSize" withIdentifier:a3];
}

- (id)directionWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeDirection" withIdentifier:a3];
}

- (id)stateWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeState" withIdentifier:a3];
}

- (id)previousStateWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeState" withIdentifier:a3];
}

- (id)presentationStateWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemePresentationState" withIdentifier:a3];
}

- (id)valueWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeValue" withIdentifier:a3];
}

- (id)previousValueWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeValue" withIdentifier:a3];
}

- (id)drawingLayerWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeDrawingLayer" withIdentifier:a3];
}

- (id)idiomWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeIdiom" withIdentifier:a3];
}

- (id)graphicsFeatureSetClassWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeGraphicsFeatureSetClass" withIdentifier:a3];
}

- (id)displayGamutWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeDisplayGamut" withIdentifier:a3];
}

- (id)deploymentTargetWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeDeploymentTarget" withIdentifier:a3];
}

- (id)sizeClassWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeUISizeClass" withIdentifier:a3];
}

- (id)templateRenderingModeWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"RenderingMode" withIdentifier:a3];
}

- (id)compressionTypeWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeCompressionType" withIdentifier:a3];
}

- (id)schemaCategoryWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"SchemaCategory" withIdentifier:a3];
}

- (id)effectTypeWithIdentifier:(unsigned int)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"EffectType" withIdentifier:a3];
}

- (id)effectParameterTypeWithIdentifier:(unsigned int)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"EffectParameterType" withIdentifier:a3];
}

- (id)effectParameterValueWithType:(unsigned int)a3 inComponent:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)[a4 parameters];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(id *)(*((void *)&v23 + 1) + 8 * v13);
      if (objc_msgSend((id)objc_msgSend(v14, "parameterType"), "identifier") == v7) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v14 = 0;
  }
  if (!v14 && v5)
  {
    id v14 = [(CoreThemeDocument *)self newObjectForEntity:@"EffectParameterValue"];
    [v14 setComponent:a4];
    id v15 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"EffectParameterType", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier == %d", v7), 0);
    if ([v15 count])
    {
      objc_msgSend(v14, "setParameterType:", objc_msgSend(v15, "objectAtIndex:", 0));
      int v16 = v7 - 2;
      if ((v7 - 2) > 6)
      {
        long long v18 = &unk_26E876988;
        long long v17 = &unk_26E876910;
        v19 = &unk_26E876910;
      }
      else
      {
        long long v17 = *(&off_264C44D98 + v16);
        long long v18 = (void *)qword_264C44DD0[v16];
        v19 = *(&off_264C44E08 + v16);
      }
      [v14 setIntValue:v17];
      [v14 setColorValue:&unk_26E876910];
      [v14 setFloatValue:v18];
      [v14 setAngleValue:v19];
      int v20 = objc_msgSend((id)objc_msgSend(a4, "effectType"), "identifier");
      if (v7 == 2 && v20 == 1397715043) {
        [v14 setFloatValue:&unk_26E8769A8];
      }
      int v21 = objc_msgSend((id)objc_msgSend(a4, "effectType"), "identifier");
      if (v7 == 2 && v21 == 1180787813) {
        [v14 setFloatValue:&unk_26E8769A8];
      }
    }
  }
  return v14;
}

- (id)effectComponentWithType:(unsigned int)a3 inRendition:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = (void *)[a4 components];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(id *)(*((void *)&v25 + 1) + 8 * v13);
      if (objc_msgSend((id)objc_msgSend(v14, "effectType"), "identifier") == v7) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v14 = 0;
  }
  if (!v14 && v5)
  {
    id v14 = [(CoreThemeDocument *)self newObjectForEntity:@"EffectComponent"];
    objc_msgSend(v14, "setEffectType:", -[CoreThemeDocument effectTypeWithIdentifier:](self, "effectTypeWithIdentifier:", v7));
    id v15 = (void *)[MEMORY[0x263F383C8] requiredEffectParametersForEffectType:v7];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          -[CoreThemeDocument effectParameterValueWithType:inComponent:createIfNeeded:](self, "effectParameterValueWithType:inComponent:createIfNeeded:", [*(id *)(*((void *)&v21 + 1) + 8 * i) unsignedIntValue], v14, 1);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }
    [v14 setRendition:a4];
  }
  return v14;
}

- (id)renditionTypeWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"RenditionType" withIdentifier:a3];
}

- (id)renditionSubtypeWithIdentifier:(unsigned int)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"RenditionSubtype" withIdentifier:a3];
}

- (id)iterationTypeWithIdentifier:(int)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"IterationType" withIdentifier:a3];
}

- (id)pixelFormatWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"TexturePixelFormat" withIdentifier:a3];
}

- (id)textureFaceWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"TextureFace" withIdentifier:a3];
}

- (id)textureInterpretaitionWithIdentifier:(unsigned int)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"TextureInterpretation" withIdentifier:a3];
}

- (id)constantWithName:(id)a3 forIdentifier:(int64_t)a4
{
  id v6 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", a3, objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier = %ld", a4), 0);
  if ([v6 count])
  {
    return (id)[v6 objectAtIndex:0];
  }
  else
  {
    id v8 = [(CoreThemeDocument *)self newObjectForEntity:a3];
    return v8;
  }
}

- (id)psdImageRefForAsset:(id)a3
{
  uint64_t v3 = objc_msgSend(-[CoreThemeDocument rootPathForProductionData](self, "rootPathForProductionData"), "stringByAppendingPathComponent:", objc_msgSend(a3, "sourceRelativePath"));
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v3)) {
    return 0;
  }
  int v4 = (void *)[objc_alloc(MEMORY[0x263F383B0]) initWithPath:v3];

  return v4;
}

- (id)appearanceWithIdentifier:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (-[NSMutableSet containsObject:](self->_cachedUnknownAppearanceIds, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:")))return 0; {
  long long v16 = 0u;
  }
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  cachedAppearances = self->_cachedAppearances;
  uint64_t v8 = [(NSMutableArray *)cachedAppearances countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(cachedAppearances);
      }
      id v6 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
      if ([v6 identifier] == a3) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)cachedAppearances countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    if (v6) {
      return v6;
    }
  }
LABEL_13:
  id v12 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"Appearance", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier = %d", a3), 0);
  if ((unint64_t)[v12 count] >= 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1395, @"more than one appearance with identifier %d", (unsigned __int16)a3);
  }
  id v6 = (void *)[v12 firstObject];
  if (v6) {
    [(NSMutableArray *)self->_cachedAppearances addObject:v6];
  }
  return v6;
}

- (id)appearanceWithIdentifier:(int64_t)a3 name:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = -[CoreThemeDocument appearanceWithIdentifier:](self, "appearanceWithIdentifier:");
  if (v10)
  {
    id v11 = v10;
    if (!a4) {
      return v11;
    }
  }
  else if (!a4 {
         || !v5
  }
         || (id v11 = [(CoreThemeDocument *)self newObjectForEntity:@"Appearance"],
             [v11 setIdentifier:(unsigned __int16)a3],
             [v11 setName:a4],
             [(NSMutableArray *)self->_cachedAppearances addObject:v11],
             v11,
             !v11))
  {
    -[NSMutableSet addObject:](self->_cachedUnknownAppearanceIds, "addObject:", [NSNumber numberWithInteger:a3]);
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(v11, "name"), "isEqualToString:", a4) & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1424, @"different appearance identifier for appearance name, got %ld but previously got %ld", a3, objc_msgSend(v11, "identifier"));
  }
  return v11;
}

- (id)localizationWithIdentifier:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (-[NSMutableSet containsObject:](self->_cachedUnknownLocalizationIds, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:")))return 0; {
  long long v16 = 0u;
  }
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  cachedLocalizations = self->_cachedLocalizations;
  uint64_t v8 = [(NSMutableArray *)cachedLocalizations countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(cachedLocalizations);
      }
      id v6 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
      if ([v6 identifier] == a3) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)cachedLocalizations countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    if (v6) {
      return v6;
    }
  }
LABEL_13:
  id v12 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"Localization", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier = %d", a3), 0);
  if ((unint64_t)[v12 count] >= 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1451, @"more than one localization with identifier %d", (unsigned __int16)a3);
  }
  id v6 = (void *)[v12 firstObject];
  if (v6) {
    [(NSMutableArray *)self->_cachedLocalizations addObject:v6];
  }
  return v6;
}

- (id)localizationWithIdentifier:(int64_t)a3 name:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = -[CoreThemeDocument localizationWithIdentifier:](self, "localizationWithIdentifier:");
  if (v10)
  {
    id v11 = v10;
    if (!a4) {
      return v11;
    }
  }
  else if (!a4 {
         || !v5
  }
         || (id v11 = [(CoreThemeDocument *)self newObjectForEntity:@"Localization"],
             [v11 setIdentifier:(unsigned __int16)a3],
             [v11 setName:a4],
             [(NSMutableArray *)self->_cachedLocalizations addObject:v11],
             v11,
             !v11))
  {
    -[NSMutableSet addObject:](self->_cachedUnknownLocalizationIds, "addObject:", [NSNumber numberWithInteger:a3]);
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(v11, "name"), "isEqualToString:", a4) & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1481, @"Different localization identifier %ld for localization name, got %@ but previously got %@ getting different name identifier pairs", a3, a4, objc_msgSend(v11, "name"));
  }
  return v11;
}

- (id)glyphWeightWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeGlyphWeight" withIdentifier:a3];
}

- (id)glyphSizeWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"ThemeGlyphSize" withIdentifier:a3];
}

- (id)vectorGlyphRenderingModeWithIdentifier:(int64_t)a3
{
  return [(CoreThemeDocument *)self themeConstant:@"VectorGlyphRenderingMode" withIdentifier:a3];
}

- (id)mappingForPhotoshopLayerIndex:(int64_t)a3 themeDrawingLayerIdentifier:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  id v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"LayerMapping", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"photoshopLayerIndex = %d AND themeDrawingLayer.identifier = %d", a3, a4), 0);
  if (![v7 count])
  {
    uint64_t v10 = objc_msgSend(-[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"ThemeDrawingLayer", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier = %d", a4), 0), "objectAtIndex:", 0);
    id v9 = [(CoreThemeDocument *)self newObjectForEntity:@"LayerMapping"];
    objc_msgSend(v9, "setPhotoshopLayerIndex:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
    [v9 setThemeDrawingLayer:v10];
    return v9;
  }

  return (id)[v7 objectAtIndex:0];
}

- (id)allObjectsForEntity:(id)a3 withSortDescriptors:(id)a4
{
  id v9 = 0;
  id v6 = [(CoreThemeDocument *)self allObjectsForEntity:a3 withSortDescriptors:a4 error:&v9];
  if (v9)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CoreThemeDocument.m", 1536, @"%@", objc_msgSend(v9, "localizedDescription") object file lineNumber description];
  }
  return v6;
}

- (id)allObjectsForEntity:(id)a3 withSortDescriptors:(id)a4 error:(id *)a5
{
  return [(CoreThemeDocument *)self objectsForEntity:a3 withPredicate:0 sortDescriptors:a4 error:a5];
}

- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5
{
  id v10 = 0;
  id v7 = [(CoreThemeDocument *)self objectsForEntity:a3 withPredicate:a4 sortDescriptors:a5 error:&v10];
  if (v10)
  {
    id v9 = (void *)[MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CoreThemeDocument.m", 1553, @"%@", objc_msgSend(v10, "localizedDescription") object file lineNumber description];
  }
  return v7;
}

- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  uint64_t v11 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");

  return [(CoreThemeDocument *)self objectsForEntity:a3 withPredicate:a4 sortDescriptors:a5 withContext:v11 error:a6];
}

- (id)objectsForEntity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 withContext:(id)a6 error:(id *)a7
{
  id v13 = objc_alloc_init(MEMORY[0x263EFF260]);
  objc_msgSend(v13, "setEntity:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3));
  if (a4) {
    [v13 setPredicate:a4];
  }
  if (a5) {
    [v13 setSortDescriptors:a5];
  }
  long long v14 = (void *)[a6 executeFetchRequest:v13 error:a7];

  return v14;
}

- (unint64_t)countForEntity:(id)a3 withPredicate:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263EFF260]);
  objc_msgSend(v7, "setEntity:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3));
  if (a4) {
    [v7 setPredicate:a4];
  }
  uint64_t v10 = 0;
  unint64_t v8 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC"), "countForFetchRequest:error:", v7, &v10);

  return v8;
}

- (id)newObjectForEntity:(id)a3
{
  uint64_t v6 = [MEMORY[0x263F08B88] currentThread];
  if (v6 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread")) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1605, @"-[CoreThemeDocument newObjectForEntity:] can only be called from the main thread.");
  }
  id v7 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3);
  unint64_t v8 = objc_msgSend(objc_alloc(NSClassFromString((NSString *)objc_msgSend(v7, "managedObjectClassName"))), "initWithEntity:insertIntoManagedObjectContext:", v7, -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1610, @"object for entity %@ not created", a3);
  }
  return v8;
}

- (void)deleteObjects:(id)a3
{
  uint64_t v6 = [MEMORY[0x263F08B88] currentThread];
  if (v6 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread")) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1616, @"-[CoreThemeDocument deleteObjects:] can only be called from the main thread.");
  }
  id v7 = [(TDPersistentDocument *)self managedObjectContext];
  unint64_t v8 = (void *)[a3 objectEnumerator];
  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    uint64_t v10 = v9;
    do
    {
      [v7 deleteObject:v10];
      uint64_t v10 = [v8 nextObject];
    }
    while (v10);
  }
}

- (void)deleteObject:(id)a3
{
  uint64_t v6 = [MEMORY[0x263F08B88] currentThread];
  if (v6 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread")) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 1627, @"-[CoreThemeDocument deleteObject:] can only be called from the main thread.");
  }
  id v7 = [(TDPersistentDocument *)self managedObjectContext];

  [v7 deleteObject:a3];
}

- (void)deleteProduction:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  [a3 deleteRenditionsInDocument:self shouldDeleteAssetFiles:a4];

  [(CoreThemeDocument *)self deleteObject:a3];
}

- (void)deleteProductions:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a3);
        }
        [(CoreThemeDocument *)self deleteProduction:*(void *)(*((void *)&v11 + 1) + 8 * v10++) shouldDeleteAssetFiles:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)minimalDisplayNameForThemeConstant:(id)a3
{
  BOOL v4 = (void *)[a3 displayName];
  uint64_t v5 = [a3 identifier];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d-", v5);
  uint64_t v7 = (void *)[v4 stringByReplacingOccurrencesOfString:@" " withString:&stru_26E8675B0];

  return (id)[v7 stringByReplacingOccurrencesOfString:v6 withString:&stru_26E8675B0];
}

- (id)folderNameFromRenditionKey:(id)a3 forPartDefinition:(id)a4
{
  int v7 = [a4 partFeatures];
  uint64_t v8 = (void *)[a4 element];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "displayName"), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_26E8675B0);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v8, "parts"), "count") < 2)
  {
    uint64_t v10 = 0;
    if ((v7 & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "displayName"), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_26E8675B0), "stringByReplacingOccurrencesOfString:withString:", @"/", &stru_26E8675B0);
    if ((v7 & 0x200) != 0)
    {
LABEL_3:
      id v11 = 0;
      goto LABEL_6;
    }
  }
  id v11 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", [a3 themeSize]));
LABEL_6:
  if ((v7 & 0x38) != 0) {
    id v12 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", [a3 themeDirection]));
  }
  else {
    id v12 = 0;
  }
  if ((~v7 & 0x10004) != 0) {
    id v13 = 0;
  }
  else {
    id v13 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", [a3 themePresentationState]));
  }
  uint64_t v14 = [a3 themeScale];
  if (v10) {
    uint64_t v9 = (void *)[v9 stringByAppendingFormat:@"_%@", v10];
  }
  if (v11) {
    uint64_t v9 = (void *)[v9 stringByAppendingFormat:@"_%@", v11];
  }
  if (v12) {
    uint64_t v9 = (void *)[v9 stringByAppendingFormat:@"_%@", v12];
  }
  if (v13) {
    uint64_t v9 = (void *)[v9 stringByAppendingFormat:@"_%@", v13];
  }
  if (v14 != 2) {
    return v9;
  }

  return (id)[v9 stringByAppendingString:@"@2x"];
}

- (id)defaultPNGFileNameForSchemaRendition:(id)a3 withPartDefinition:(id)a4
{
  id v4 = [(CoreThemeDocument *)self defaultBaseFileNameForSchemaRendition:a3 withPartDefinition:a4];

  return (id)[v4 stringByAppendingPathExtension:@"png"];
}

- (id)defaultBaseFileNameForSchemaRendition:(id)a3 withPartDefinition:(id)a4
{
  int v7 = [a4 partFeatures];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend(a3, "key"));
  id v9 = [(CoreThemeDocument *)self folderNameFromRenditionKey:v8 forPartDefinition:a4];
  uint64_t v10 = [v8 themeScale];
  if (v10 == 2)
  {
    id v11 = @"@2x";
    id v9 = (id)[v9 stringByReplacingOccurrencesOfString:@"@2x" withString:&stru_26E8675B0];
  }
  else
  {
    id v11 = 0;
  }
  if ((*(void *)&v7 & 0x10004) == 4) {
    id v12 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", [v8 themePresentationState]));
  }
  else {
    id v12 = 0;
  }
  if ([v8 themeLayer] >= 1)
  {
    id v13 = -[CoreThemeDocument drawingLayerWithIdentifier:](self, "drawingLayerWithIdentifier:", [v8 themeLayer]);
    goto LABEL_11;
  }
  if ((v7 & 0x1000) == 0)
  {
    id v13 = -[CoreThemeDocument stateWithIdentifier:](self, "stateWithIdentifier:", [v8 themeState]);
LABEL_11:
    id v14 = [(CoreThemeDocument *)self minimalDisplayNameForThemeConstant:v13];
    if ((v7 & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  id v14 = 0;
  if ((v7 & 0x4000) == 0)
  {
LABEL_12:
    if (v7)
    {
      id v15 = -[CoreThemeDocument minimalDisplayNameForThemeConstant:](self, "minimalDisplayNameForThemeConstant:", -[CoreThemeDocument valueWithIdentifier:](self, "valueWithIdentifier:", [v8 themeValue]));
      goto LABEL_17;
    }
LABEL_19:
    id v18 = 0;
    if (!v12) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v16 = [a4 cuiPartDefinition];
  unint64_t v17 = [v8 themeDimension1];
  if (v17 >= objc_msgSend((id)objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform")), "dimensionDefinitionCountForPartDefinition:", v16))goto LABEL_19; {
  id v15 = (id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", *(void *)(v16 + 32 * v17 + 64)), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_26E8675B0);
  }
LABEL_17:
  id v18 = v15;
  if (v12) {
LABEL_20:
  }
    id v9 = (id)[v9 stringByAppendingFormat:@"_%@", v12];
LABEL_21:
  if (v14) {
    id v9 = (id)[v9 stringByAppendingFormat:@"_%@", v14];
  }
  if (v18) {
    id v9 = (id)[v9 stringByAppendingFormat:@"_%@", v18];
  }
  if (v10 == 2) {
    id v9 = (id)[v9 stringByAppendingFormat:@"%@", v11];
  }

  return v9;
}

- (id)defaultPathComponentsForPartDefinition:(id)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "element"), "category"), "displayName");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "element"), "displayName");

  return (id)[v4 stringByAppendingPathComponent:v5];
}

- (id)createReferencePNGForSchemaRendition:(id)a3 withPartDefinition:(id)a4 atLocation:(id)a5 error:(id *)a6
{
  id v10 = [(CoreThemeDocument *)self defaultPNGFileNameForSchemaRendition:a3 withPartDefinition:a4];
  if (a5)
  {
    CFURLRef v11 = (const __CFURL *)[a5 URLByAppendingPathComponent:v10];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", -[__CFURL path](v11, "path")) & 1) == 0)
    {
      [(CoreThemeDocument *)self assetManagementDelegate];
      if (objc_opt_respondsToSelector()) {
        [(TDAssetManagementDelegate *)[(CoreThemeDocument *)self assetManagementDelegate] willCreateAssetAtURL:v11];
      }
      id v12 = CGImageDestinationCreateWithURL(v11, @"public.png", 1uLL, 0);
      CGImageDestinationAddImage(v12, (CGImageRef)objc_msgSend((id)objc_msgSend(a3, "referenceImage"), "image"), 0);
      BOOL v13 = CGImageDestinationFinalize(v12);
      CFRelease(v12);
      if (!v13)
      {
        id v10 = 0;
        if (a6) {
          *a6 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F07F70], 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Unable to write image", *MEMORY[0x263F08320]));
        }
      }
    }
  }
  return v10;
}

- (id)_themeBitSource:(id *)a3
{
  id v4 = [(CoreThemeDocument *)self allObjectsForEntity:@"ThemeBitSource" withSortDescriptors:0];
  if ([v4 count])
  {
    if ((unint64_t)[v4 count] >= 2) {
      NSLog(&cfstr_ExpectingOnlyO.isa, [v4 count]);
    }
    return (id)[v4 objectAtIndex:0];
  }
  else
  {
    if (a3) {
      *a3 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F07F70], 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"No ThemeBitSource found", *MEMORY[0x263F08320]));
    }
    return 0;
  }
}

- (id)_themeBitSourceForReferencedFilesAtURLs:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__CoreThemeDocument__themeBitSourceForReferencedFilesAtURLs_createIfNecessary___block_invoke;
  v19[3] = &unk_264C449A8;
  v19[4] = v7;
  [a3 enumerateObjectsUsingBlock:v19];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "lastObject"), "pathExtension"), "isEqualToString:", @"imagestack"))objc_msgSend(v7, "removeLastObject"); {
  uint64_t v8 = [(NSURL *)[(TDPersistentDocument *)self fileURL] pathComponents];
  }
  unint64_t UncommonItemInArrays = indexOfFirstUncommonItemInArrays(v7, v8);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v11 = [(NSArray *)v8 count];
  uint64_t v12 = [v7 count];
  if (UncommonItemInArrays != 0x7FFFFFFFFFFFFFFFLL && UncommonItemInArrays < v11)
  {
    unint64_t v13 = v12;
    if (UncommonItemInArrays < v11 - 1)
    {
      unint64_t v14 = ~UncommonItemInArrays + v11;
      do
      {
        [v10 addObject:@"../"];
        --v14;
      }
      while (v14);
    }
    if (UncommonItemInArrays < v13)
    {
      do
        objc_msgSend(v10, "addObject:", objc_msgSend(v7, "objectAtIndex:", UncommonItemInArrays++));
      while (v13 != UncommonItemInArrays);
    }
  }

  uint64_t v15 = [NSString pathWithComponents:v10];
  id v16 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self, "objectsForEntity:withPredicate:sortDescriptors:error:", @"ThemeBitSource", [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"path", v15], 0, 0);
  if ([v16 count]) {
    return (id)[v16 objectAtIndex:0];
  }
  if (!v4) {
    return 0;
  }
  unint64_t v17 = -[TDThemeBitSource initWithEntity:insertIntoManagedObjectContext:]([TDThemeBitSource alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeBitSource"), -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  [(TDThemeBitSource *)v17 setPath:v15];
  return v17;
}

uint64_t __79__CoreThemeDocument__themeBitSourceForReferencedFilesAtURLs_createIfNecessary___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if ((void *)*MEMORY[0x263EFFD08] != a2)
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)[a2 pathComponents];
    uint64_t v6 = *(void **)(v4 + 32);
    if (a3)
    {
      id result = indexOfFirstUncommonItemInArrays(v6, v5);
      if (result != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = result;
        id v9 = *(void **)(v4 + 32);
        uint64_t v10 = [v9 count] - result;
        return objc_msgSend(v9, "removeObjectsInRange:", v8, v10);
      }
    }
    else
    {
      [v6 addObjectsFromArray:v5];
      id v7 = *(void **)(v4 + 32);
      return [v7 removeLastObject];
    }
  }
  return result;
}

- (BOOL)createPSDReferenceArtworkForRenditionGroup:(id)a3 atDestination:(id)a4 error:(id *)a5
{
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", a3, a4, a5);
  [(CoreThemeDocument *)self assetManagementDelegate];
  if (objc_opt_respondsToSelector()) {
    [(TDAssetManagementDelegate *)[(CoreThemeDocument *)self assetManagementDelegate] willCreateAssetAtURL:a4];
  }
  if ((objc_msgSend(v8, "fileExistsAtPath:", objc_msgSend(a4, "path")) & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"TEUseOldStylePSDLayout"))id v9 = objc_msgSend(a3, "mutablePSDImageRef"); {
    else
    }
      id v9 = (void *)[a3 mutablePSDImageRefColumnStyle];
    [v9 saveToURL:a4 completionHandler:0];
  }
  return 1;
}

- (BOOL)allowMultipleInstancesOfElementID:(int64_t)a3
{
  return a3 == 101;
}

- (id)createProductionWithRenditionGroup:(id)a3 forPartDefinition:(id)a4 artworkFormat:(id)a5 shouldReplaceExisting:(BOOL)a6 error:(id *)a7
{
  return [(CoreThemeDocument *)self createProductionWithRenditionGroup:a3 forPartDefinition:a4 artworkFormat:a5 nameElement:0 shouldReplaceExisting:a6 error:a7];
}

- (id)createProductionWithRenditionGroup:(id)a3 forPartDefinition:(id)a4 artworkFormat:(id)a5 nameElement:(id)a6 shouldReplaceExisting:(BOOL)a7 error:(id *)a8
{
  BOOL v8 = a7;
  uint64_t v224 = *MEMORY[0x263EF8340];
  v166 = (void *)[MEMORY[0x263F08850] defaultManager];
  v187 = self;
  id v11 = [(CoreThemeDocument *)self allObjectsForEntity:@"ElementProduction" withSortDescriptors:0];
  obuint64_t j = a3;
  objc_msgSend((id)objc_msgSend(a3, "baseKey"), "keyList");
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v213 objects:v223 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v214;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v214 != v15) {
          objc_enumerationMutation(v11);
        }
        unint64_t v17 = *(void **)(*((void *)&v213 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v17, "baseKeySpec"), "key");
        CUISystemThemeRenditionKeyFormat();
        if (CUIEqualRenditionKeys())
        {
          int v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "partDefinition"), "element"), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a4, "element"), "name"));
          char v19 = v18;
          if (v18) {
            id v20 = v17;
          }
          else {
            id v20 = v14;
          }
          if (v18) {
            BOOL v21 = !v8;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            id v14 = v20;
            if (v18) {
              goto LABEL_22;
            }
          }
          else
          {
            [v17 deleteRenditionsInDocument:v187 shouldDeleteAssetFiles:1];
            [(CoreThemeDocument *)v187 deleteObject:v17];
            if (v19) {
              goto LABEL_22;
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v213 objects:v223 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }
LABEL_22:
  id v22 = a4;
  long long v23 = v187;
  BOOL v24 = -[CoreThemeDocument allowMultipleInstancesOfElementID:](v187, "allowMultipleInstancesOfElementID:", [a4 elementID]);
  if (v14 && !v24) {
    return v14;
  }
  if ([a5 isEqualToString:CoreThemeArtworkFormatPNG])
  {
    id v14 = [(CoreThemeDocument *)v187 newObjectForEntity:@"SchemaElementProduction"];
    [v14 setIsExcludedFromFilter:*MEMORY[0x263EFFB38]];
    long long v25 = obj;
    long long v26 = objc_msgSend((id)objc_msgSend(obj, "renditions"), "objectAtIndex:", 0);
    objc_msgSend(v14, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v26, "type")));
    objc_msgSend(v14, "setRenditionSubtype:", -[CoreThemeDocument renditionSubtypeWithIdentifier:](v187, "renditionSubtypeWithIdentifier:", objc_msgSend(v26, "subtype")));
    long long v27 = (void *)[v26 slices];
    if ([v27 count])
    {
      long long v28 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v27, "count"));
      long long v209 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      uint64_t v29 = [v27 countByEnumeratingWithState:&v209 objects:v222 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v210;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v210 != v31) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v209 + 1) + 8 * j) rectValue];
            double v34 = v33;
            double v36 = v35;
            double v38 = v37;
            double v40 = v39;
            id v41 = [(CoreThemeDocument *)v187 newObjectForEntity:@"Slice"];
            objc_msgSend(v41, "setSliceRect:", v34, v36, v38, v40);
            [v28 addObject:v41];
          }
          uint64_t v30 = [v27 countByEnumeratingWithState:&v209 objects:v222 count:16];
        }
        while (v30);
      }
      [v14 setSlices:v28];
      long long v25 = obj;
      id v22 = a4;
    }
    id v42 = [(CoreThemeDocument *)v187 newObjectForEntity:@"RenditionKeySpec"];
    objc_msgSend(v42, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(v25, "baseKey"), "keyList"), v187);
    [v14 setBaseKeySpec:v42];

    [v14 setPartDefinition:v22];
    id obja = (id)[v25 renditions];
    id v43 = [(CoreThemeDocument *)v187 defaultPathComponentsForPartDefinition:v22];
    id v44 = (id)objc_msgSend(objc_alloc(NSURL), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](v187, "rootPathForProductionData"));
    uint64_t v45 = -[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](v187, "folderNameFromRenditionKey:forPartDefinition:", [v25 baseKey], v22);
    uint64_t v46 = [v43 stringByAppendingPathComponent:v45];
    [v14 setFolderName:v45];
    [v14 setComment:objc_msgSend(NSString, "stringWithFormat:", @"From: %@", v45)];
    id v47 = [(CoreThemeDocument *)v187 _themeBitSource:a8];
    if (v47)
    {
      v48 = v47;
      v49 = objc_msgSend((id)objc_msgSend(v44, "URLByAppendingPathComponent:", objc_msgSend(v47, "name")), "URLByAppendingPathComponent:", v46);
      if ((objc_msgSend(v166, "fileExistsAtPath:", objc_msgSend(v49, "path")) & 1) != 0
        || (id v208 = 0,
            ([v166 createDirectoryAtURL:v49 withIntermediateDirectories:1 attributes:0 error:&v208] & 1) != 0))
      {
        uint64_t v170 = objc_msgSend((id)objc_msgSend(v25, "baseKey"), "themeScale");
        long long v204 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        long long v207 = 0u;
        uint64_t v50 = [obja countByEnumeratingWithState:&v204 objects:v221 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          id v164 = v48;
          uint64_t v167 = v46;
          v186 = v14;
          uint64_t v52 = *(void *)v205;
          do
          {
            for (uint64_t k = 0; k != v51; ++k)
            {
              if (*(void *)v205 != v52) {
                objc_enumerationMutation(obja);
              }
              v54 = *(void **)(*((void *)&v204 + 1) + 8 * k);
              id v208 = 0;
              uint64_t v55 = [(CoreThemeDocument *)v23 createReferencePNGForSchemaRendition:v54 withPartDefinition:v22 atLocation:v49 error:&v208];
              if (v208)
              {
                uint64_t v56 = objc_msgSend((id)objc_msgSend(v49, "URLByAppendingPathComponent:", v55), "path");
                NSLog(&cfstr_UnableToCreate.isa, v56, [v208 localizedDescription]);
              }
              else
              {
                id v57 = [(CoreThemeDocument *)v23 newObjectForEntity:@"PNGAsset"];
                [v57 setCategory:v167];
                [v57 setName:v55];
                [v57 setSource:v164];
                [v57 setScaleFactor:v170];
                id v58 = [(CoreThemeDocument *)v23 newObjectForEntity:@"SchemaRenditionSpec"];
                objc_msgSend((id)objc_msgSend(v58, "keySpec"), "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v54, "key"), v23);
                -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v23, "_normalizeRenditionKeySpec:forSchemaRendition:", [v58 keySpec], v54);
                [v58 setAsset:v57];
                [v58 setProduction:v186];
                objc_msgSend(v58, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v23, "renditionTypeWithIdentifier:", objc_msgSend(v54, "type")));
                [(CoreThemeDocument *)v23 assetManagementDelegate];
                if (objc_opt_respondsToSelector()) {
                  -[TDAssetManagementDelegate didCreateAsset:atURL:](-[CoreThemeDocument assetManagementDelegate](v187, "assetManagementDelegate"), "didCreateAsset:atURL:", v57, [v49 URLByAppendingPathComponent:v55]);
                }

                long long v23 = v187;
                id v22 = a4;
              }
            }
            uint64_t v51 = [obja countByEnumeratingWithState:&v204 objects:v221 count:16];
          }
          while (v51);
          return v186;
        }
        return v14;
      }
      if (a8)
      {
        uint64_t v114 = [v208 localizedDescription];
        if (v114) {
          v115 = (__CFString *)v114;
        }
        else {
          v115 = @"Unable to write new folder to file system.";
        }
        v116 = (void *)MEMORY[0x263F087E8];
        uint64_t v117 = *MEMORY[0x263F07F70];
        id v118 = v14;
        uint64_t v119 = [v208 code];
        uint64_t v120 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Couldn't create folder for reference assets.", *MEMORY[0x263F08320], v115, *MEMORY[0x263F08338], 0);
        uint64_t v121 = v119;
        id v14 = v118;
        *a8 = (id)[v116 errorWithDomain:v117 code:v121 userInfo:v120];
      }
    }
    v122 = v187;
    goto LABEL_113;
  }
  if (![a5 isEqualToString:CoreThemeArtworkFormatPSD])
  {
    if (![a5 isEqualToString:CoreThemeArtworkFormatCAAR]) {
      return 0;
    }
    uint64_t v81 = [(CoreThemeDocument *)v187 _themeBitSource:a8];
    if (!v81) {
      return 0;
    }
    v82 = (void *)v81;
    id v83 = (id)objc_msgSend(objc_alloc(NSURL), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](v187, "rootPathForProductionData"));
    id v84 = [(CoreThemeDocument *)v187 defaultPathComponentsForPartDefinition:a4];
    v85 = objc_msgSend((id)objc_msgSend(v83, "URLByAppendingPathComponent:", objc_msgSend(v82, "name")), "URLByAppendingPathComponent:", v84);
    id v86 = a4;
    v87 = v85;
    if ((objc_msgSend(v166, "fileExistsAtPath:", objc_msgSend(v85, "path")) & 1) == 0)
    {
      id v208 = 0;
      if (([v166 createDirectoryAtURL:v87 withIntermediateDirectories:1 attributes:0 error:&v208] & 1) == 0)goto LABEL_117; {
      id v86 = a4;
      }
    }
    id v88 = -[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](v187, "folderNameFromRenditionKey:forPartDefinition:", [obj baseKey], v86);
    uint64_t v89 = [v88 stringByAppendingPathExtension:@"caml"];
    v90 = (void *)[v87 URLByAppendingPathComponent:v89];
    if (([v90 checkResourceIsReachableAndReturnError:a8] & 1) == 0)
    {
      uint64_t v89 = [v88 stringByAppendingPathExtension:@"ca"];
      v90 = (void *)[v87 URLByAppendingPathComponent:v89];
    }
    if (([v90 checkResourceIsReachableAndReturnError:a8] & 1) == 0)
    {
      uint64_t v89 = [v88 stringByAppendingPathExtension:@"caar"];
      v90 = (void *)[v87 URLByAppendingPathComponent:v89];
    }
    [(CoreThemeDocument *)v187 assetManagementDelegate];
    if (objc_opt_respondsToSelector()) {
      [(TDAssetManagementDelegate *)[(CoreThemeDocument *)v187 assetManagementDelegate] willCreateAssetAtURL:v90];
    }
    id v91 = [(CoreThemeDocument *)v187 newObjectForEntity:@"MicaAsset"];
    [v91 setCategory:v84];
    [v91 setName:v89];
    objc_msgSend(v91, "setScaleFactor:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "themeScale"));
    [v91 setSource:v82];
    [(CoreThemeDocument *)v187 assetManagementDelegate];
    if (objc_opt_respondsToSelector()) {
      [(TDAssetManagementDelegate *)[(CoreThemeDocument *)v187 assetManagementDelegate] didCreateAsset:v91 atURL:v90];
    }
    v174 = v90;
    id v92 = [(CoreThemeDocument *)v187 newObjectForEntity:@"MicaElementProduction"];
    [v92 setAsset:v91];
    [v92 setPartDefinition:a4];
    [v92 setComment:objc_msgSend(NSString, "stringWithFormat:", @"Production for %@", objc_msgSend(v84, "stringByAppendingPathComponent:", v89))];
    [v92 setIsExcludedFromFilter:*MEMORY[0x263EFFB38]];
    v93 = objc_msgSend((id)objc_msgSend(obj, "renditions"), "objectAtIndex:", 0);
    objc_msgSend(v92, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v93, "type")));
    objc_msgSend(v92, "setRenditionSubtype:", -[CoreThemeDocument renditionSubtypeWithIdentifier:](v187, "renditionSubtypeWithIdentifier:", objc_msgSend(v93, "subtype")));
    id v94 = [(CoreThemeDocument *)v187 newObjectForEntity:@"RenditionKeySpec"];
    objc_msgSend(v94, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "keyList"), v187);
    v186 = v92;
    [v92 setBaseKeySpec:v94];

    v95 = (void *)[MEMORY[0x263F157E8] layer];
    [v95 setName:@"rootLayer"];
    v183 = v95;
    objc_msgSend(v95, "setFrame:", 0.0, 0.0, 128.0, 128.0);
    v96 = (void *)[obj schemaLayersAndLayerGroups];
    v97 = (void *)[MEMORY[0x263EFF980] array];
    long long v188 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    uint64_t v98 = [v96 countByEnumeratingWithState:&v188 objects:v217 count:16];
    if (v98)
    {
      uint64_t v99 = v98;
      unint64_t v100 = 0x263F38000uLL;
      id v101 = *(id *)v189;
      v102 = v95;
      id objb = *(id *)v189;
      do
      {
        for (uint64_t m = 0; m != v99; ++m)
        {
          if (*(id *)v189 != v101) {
            objc_enumerationMutation(v96);
          }
          v104 = *(void **)(*((void *)&v188 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v104 isStart])
            {
              v105 = (void *)[MEMORY[0x263F157E8] layer];
              objc_msgSend(v105, "setName:", objc_msgSend(v104, "name"));
              [v102 addSublayer:v105];
              [v97 addObject:v105];
              v102 = v105;
            }
            else
            {
              [v97 removeLastObject];
              v102 = v183;
              if ([v97 count]) {
                v102 = (void *)[v97 lastObject];
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v106 = (void *)[v104 rendition];
              unint64_t v107 = v100;
              v108 = v96;
              id v109 = [(CoreThemeDocument *)v23 newObjectForEntity:@"MicaRenditionSpec"];
              uint64_t v110 = [v109 keySpec];
              uint64_t v111 = [v106 key];
              v112 = (void *)v110;
              long long v23 = v187;
              [v112 setAttributesFromRenditionKey:v111 withDocument:v187];
              -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v187, "_normalizeRenditionKeySpec:forSchemaRendition:", [v109 keySpec], v106);
              [v109 setProduction:v186];
              objc_msgSend(v109, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v106, "type")));
              objc_msgSend(v109, "setLayerPath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v97, "valueForKey:", @"name"), "arrayByAddingObject:", objc_msgSend(v104, "name")), "componentsJoinedByString:", @"/"));
              v113 = (void *)[MEMORY[0x263F157E8] layer];
              objc_msgSend(v113, "setName:", objc_msgSend(v104, "name"));
              [v102 bounds];
              objc_msgSend(v113, "setFrame:");
              [v102 addSublayer:v113];

              v96 = v108;
              unint64_t v100 = v107;
              id v101 = objb;
            }
          }
        }
        uint64_t v99 = [v96 countByEnumeratingWithState:&v188 objects:v217 count:16];
      }
      while (v99);
    }
    [v174 fileSystemRepresentation];
    CAEncodeLayerTreeToFile();
    return v186;
  }
  uint64_t v59 = [(CoreThemeDocument *)v187 _themeBitSource:a8];
  if (!v59) {
    return 0;
  }
  v60 = (void *)v59;
  id v61 = (id)objc_msgSend(objc_alloc(NSURL), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](v187, "rootPathForProductionData"));
  id v62 = [(CoreThemeDocument *)v187 defaultPathComponentsForPartDefinition:a4];
  v63 = objc_msgSend((id)objc_msgSend(v61, "URLByAppendingPathComponent:", objc_msgSend(v60, "name")), "URLByAppendingPathComponent:", v62);
  if ((objc_msgSend(v166, "fileExistsAtPath:", objc_msgSend(v63, "path")) & 1) == 0)
  {
    id v208 = 0;
    if (([v166 createDirectoryAtURL:v63 withIntermediateDirectories:1 attributes:0 error:&v208] & 1) == 0)
    {
LABEL_117:
      if (a8)
      {
        uint64_t v128 = [v208 localizedDescription];
        if (v128) {
          v129 = (__CFString *)v128;
        }
        else {
          v129 = @"Unable to write new folder to file system.";
        }
        v130 = (void *)MEMORY[0x263F087E8];
        uint64_t v131 = *MEMORY[0x263F07F70];
        uint64_t v132 = [v208 code];
        *a8 = (id)objc_msgSend(v130, "errorWithDomain:code:userInfo:", v131, v132, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Couldn't create folder for reference assets.", *MEMORY[0x263F08320], v129, *MEMORY[0x263F08338], 0));
      }
      return 0;
    }
  }
  uint64_t v64 = objc_msgSend(-[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](v187, "folderNameFromRenditionKey:forPartDefinition:", objc_msgSend(obj, "baseKey"), a4), "stringByAppendingPathExtension:", @"psd");
  v65 = (void *)[v63 URLByAppendingPathComponent:v64];
  if (![(CoreThemeDocument *)v187 createPSDReferenceArtworkForRenditionGroup:obj atDestination:v65 error:a8])
  {
    if (a8)
    {
      v123 = (void *)MEMORY[0x263F087E8];
      uint64_t v124 = *MEMORY[0x263F07F70];
      v125 = NSDictionary;
      uint64_t v126 = [NSString stringWithFormat:@"Can't make reference PSD image. Filename: %@", v64];
      v127 = objc_msgSend(v123, "errorWithDomain:code:userInfo:", v124, 0, objc_msgSend(v125, "dictionaryWithObject:forKey:", v126, *MEMORY[0x263F08320]));
      id v14 = 0;
      *a8 = v127;
      return v14;
    }
    return 0;
  }
  id v66 = [(CoreThemeDocument *)v187 newObjectForEntity:@"PhotoshopAsset"];
  [v66 setCategory:v62];
  [v66 setName:v64];
  objc_msgSend(v66, "setScaleFactor:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "themeScale"));
  [v66 setSource:v60];
  [(CoreThemeDocument *)v187 assetManagementDelegate];
  if (objc_opt_respondsToSelector()) {
    [(TDAssetManagementDelegate *)[(CoreThemeDocument *)v187 assetManagementDelegate] didCreateAsset:v66 atURL:v65];
  }
  id v14 = [(CoreThemeDocument *)v187 newObjectForEntity:@"PhotoshopElementProduction"];
  [v14 setAsset:v66];
  [v14 setPartDefinition:a4];
  [v14 setComment:objc_msgSend(NSString, "stringWithFormat:", @"Production for %@", objc_msgSend(v62, "stringByAppendingPathComponent:", v64))];
  [v14 setIsExcludedFromFilter:*MEMORY[0x263EFFB38]];
  v67 = objc_msgSend((id)objc_msgSend(obj, "renditions"), "objectAtIndex:", 0);
  objc_msgSend(v14, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v67, "type")));
  objc_msgSend(v14, "setRenditionSubtype:", -[CoreThemeDocument renditionSubtypeWithIdentifier:](v187, "renditionSubtypeWithIdentifier:", objc_msgSend(v67, "subtype")));
  id v68 = [(CoreThemeDocument *)v187 newObjectForEntity:@"RenditionKeySpec"];
  objc_msgSend(v68, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(obj, "baseKey"), "keyList"), v187);
  [v14 setBaseKeySpec:v68];

  uint64_t v69 = [a4 partFeatures];
  if ((v69 & 0x8000) != 0) {
    unsigned int v70 = 3;
  }
  else {
    unsigned int v70 = 4;
  }
  if ((v69 & 0x10004) == 4) {
    uint64_t v71 = 1;
  }
  else {
    uint64_t v71 = v70;
  }
  objc_msgSend(v14, "setRowIterationType:", -[CoreThemeDocument iterationTypeWithIdentifier:](v187, "iterationTypeWithIdentifier:", v71));
  if ((v69 & 0x4000) != 0) {
    unsigned int v72 = 2;
  }
  else {
    unsigned int v72 = 4;
  }
  if (v69) {
    uint64_t v73 = 0;
  }
  else {
    uint64_t v73 = v72;
  }
  objc_msgSend(v14, "setColumnIterationType:", -[CoreThemeDocument iterationTypeWithIdentifier:](v187, "iterationTypeWithIdentifier:", v73));
  v74 = (void *)[MEMORY[0x263EFF9C0] set];
  uint64_t v75 = objc_msgSend((id)objc_msgSend(a4, "validStatesWithDocument:", v187), "count");
  uint64_t v182 = v69;
  if ((v69 & 0x80) != 0) {
    objc_msgSend(v74, "addObject:", -[CoreThemeDocument mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:](v187, "mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:", v75++, 3));
  }
  if ((v69 & 0x2000) != 0) {
    objc_msgSend(v74, "addObject:", -[CoreThemeDocument mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:](v187, "mappingForPhotoshopLayerIndex:themeDrawingLayerIdentifier:", v75, 2));
  }
  if ([v74 count]) {
    [v14 addLayerMappings:v74];
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"TEUseOldStylePSDLayout") & 1) == 0)
  {
    [v14 setRowCount:&unk_26E876958];
    [v14 setColumnCount:&unk_26E876958];
    id objc = (id)[obj schemaLayersAndLayerGroups];
    v184 = (void *)[MEMORY[0x263EFF980] array];
    long long v200 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    uint64_t v133 = [objc countByEnumeratingWithState:&v200 objects:v220 count:16];
    if (v133)
    {
      uint64_t v134 = v133;
      v186 = v14;
      uint64_t v135 = 0;
      uint64_t v136 = *(void *)v201;
      uint64_t v171 = *(void *)v201;
      do
      {
        for (uint64_t n = 0; n != v134; ++n)
        {
          if (*(void *)v201 != v136) {
            objc_enumerationMutation(objc);
          }
          v138 = *(void **)(*((void *)&v200 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v138 isStart])
            {
              id v139 = [(CoreThemeDocument *)v187 newObjectForEntity:@"PhotoshopLayer"];
              objc_msgSend(v139, "setName:", objc_msgSend(v138, "name"));
              [v139 setParentLayer:v135];
              [v184 addObject:v139];
              uint64_t v135 = (uint64_t)v139;
            }
            else
            {
              [v184 removeLastObject];
              if ([v184 count]) {
                uint64_t v135 = [v184 lastObject];
              }
              else {
                uint64_t v135 = 0;
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v140 = [(CoreThemeDocument *)v187 newObjectForEntity:@"PhotoshopLayer"];
              [v140 setParentLayer:v135];
              objc_msgSend(v140, "setName:", objc_msgSend(v138, "name"));
              v141 = (void *)[v138 rendition];
              id v142 = [(CoreThemeDocument *)v187 newObjectForEntity:@"PhotoshopRenditionSpec"];
              [v142 setProduction:v186];
              objc_msgSend((id)objc_msgSend(v142, "keySpec"), "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v141, "key"), v187);
              objc_msgSend((id)objc_msgSend(v142, "keySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(a6, "identifier"), "unsignedIntValue"));
              -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v187, "_normalizeRenditionKeySpec:forSchemaRendition:", [v142 keySpec], v141);
              uint64_t v136 = v171;
              objc_msgSend(v142, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v141, "type")));
              [v142 setPhotoshopLayer:v140];
            }
          }
        }
        uint64_t v134 = [objc countByEnumeratingWithState:&v200 objects:v220 count:16];
      }
      while (v134);
      return v186;
    }
    return v14;
  }
  v76 = -[CTDPSDPreviewRef initWithPath:]([CTDPSDPreviewRef alloc], "initWithPath:", [v65 path]);
  if (!v76) {
    return 0;
  }
  v77 = v76;
  uint64_t v78 = [v67 rowSlices];
  uint64_t v79 = [v67 columnSlices];
  if ([(CTDPSDPreviewRef *)v77 sliceRowCount] < 1) {
    uint64_t v80 = 0;
  }
  else {
    uint64_t v80 = [(CTDPSDPreviewRef *)v77 sliceRowCount];
  }
  if ([(CTDPSDPreviewRef *)v77 sliceColumnCount] < 1) {
    uint64_t v143 = 0;
  }
  else {
    uint64_t v143 = [(CTDPSDPreviewRef *)v77 sliceColumnCount];
  }
  if ([v67 type] == 6)
  {
    uint64_t v144 = 1;
    uint64_t v145 = 1;
  }
  else
  {
    if (v80 < 1 || v143 < 1 || v80 % v78 || v143 % v79)
    {
      if (a8)
      {
        v158 = (void *)MEMORY[0x263F087E8];
        uint64_t v159 = *MEMORY[0x263F07F70];
        id v160 = v14;
        v161 = NSDictionary;
        uint64_t v162 = [NSString stringWithFormat:@"Reference PSD has wrong number of slices. Couldn't create production. Filename: %@", v64];
        v163 = v161;
        id v14 = v160;
        *a8 = (id)objc_msgSend(v158, "errorWithDomain:code:userInfo:", v159, 0, objc_msgSend(v163, "dictionaryWithObject:forKey:", v162, *MEMORY[0x263F08320]));
      }
      -[CoreThemeDocument deleteObject:](v187, "deleteObject:", [v14 asset]);
      v122 = v187;
LABEL_113:
      [(CoreThemeDocument *)v122 deleteObject:v14];
      return 0;
    }
    uint64_t v144 = (uint64_t)(double)(v143 / v79);
    uint64_t v145 = (uint64_t)(double)(v80 / v78);
  }
  objc_msgSend(v14, "setRowCount:", objc_msgSend(NSNumber, "numberWithInteger:", v145));
  objc_msgSend(v14, "setColumnCount:", objc_msgSend(NSNumber, "numberWithInteger:", v144));
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  id v165 = (id)[obj themeSchemaLayers];
  uint64_t v172 = [v165 countByEnumeratingWithState:&v196 objects:v219 count:16];
  if (v172)
  {
    v186 = v14;
    uint64_t v168 = *(void *)v197;
    do
    {
      uint64_t v146 = 0;
      do
      {
        if (*(void *)v197 != v168) {
          objc_enumerationMutation(v165);
        }
        uint64_t v175 = v146;
        v147 = *(void **)(*((void *)&v196 + 1) + 8 * v146);
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id objd = (id)[v147 renditions];
        uint64_t v148 = [objd countByEnumeratingWithState:&v192 objects:v218 count:16];
        if (v148)
        {
          uint64_t v149 = v148;
          uint64_t v150 = *(void *)v193;
          do
          {
            for (iuint64_t i = 0; ii != v149; ++ii)
            {
              if (*(void *)v193 != v150) {
                objc_enumerationMutation(objd);
              }
              v152 = *(void **)(*((void *)&v192 + 1) + 8 * ii);
              id v153 = [(CoreThemeDocument *)v187 newObjectForEntity:@"PhotoshopRenditionSpec"];
              [v153 setProduction:v186];
              objc_msgSend((id)objc_msgSend(v153, "keySpec"), "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v152, "key"), v187);
              -[CoreThemeDocument _normalizeRenditionKeySpec:forSchemaRendition:](v187, "_normalizeRenditionKeySpec:forSchemaRendition:", [v153 keySpec], v152);
              objc_msgSend(v153, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](v187, "renditionTypeWithIdentifier:", objc_msgSend(v152, "type")));
              objc_msgSend(v153, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v147, "index")), @"layer");
              [v152 renditionCoordinatesForPartFeatures:v182];
              double v155 = v154;
              objc_msgSend(v153, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", (v145 + ~(uint64_t)v156) & ~((v145 + ~(uint64_t)v156) >> 63)), @"row");
              objc_msgSend(v153, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", (uint64_t)v155), @"column");
            }
            uint64_t v149 = [objd countByEnumeratingWithState:&v192 objects:v218 count:16];
          }
          while (v149);
        }
        uint64_t v146 = v175 + 1;
      }
      while (v175 + 1 != v172);
      uint64_t v172 = [v165 countByEnumeratingWithState:&v196 objects:v219 count:16];
    }
    while (v172);
    return v186;
  }
  return v14;
}

- (void)_normalizeRenditionKeySpec:(id)a3 forSchemaRendition:(id)a4
{
  if (![a3 size]) {
    objc_msgSend(a3, "setSize:", -[CoreThemeDocument sizeWithIdentifier:](self, "sizeWithIdentifier:", 0));
  }
  if (![a3 state]) {
    objc_msgSend(a3, "setState:", -[CoreThemeDocument stateWithIdentifier:](self, "stateWithIdentifier:", 0));
  }
  if (![a3 presentationState]) {
    objc_msgSend(a3, "setPresentationState:", -[CoreThemeDocument presentationStateWithIdentifier:](self, "presentationStateWithIdentifier:", 0));
  }
  if (![a3 direction]) {
    objc_msgSend(a3, "setDirection:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", 0));
  }
  if (![a3 value]) {
    objc_msgSend(a3, "setValue:", -[CoreThemeDocument valueWithIdentifier:](self, "valueWithIdentifier:", 0));
  }
  if (![a3 layer])
  {
    id v6 = [(CoreThemeDocument *)self drawingLayerWithIdentifier:0];
    [a3 setLayer:v6];
  }
}

- (id)createEffectStyleProductionForPartDefinition:(id)a3
{
  return [(CoreThemeDocument *)self createEffectStyleProductionForPartDefinition:a3 withNameIdentifier:0];
}

- (id)createEffectStyleProductionForPartDefinition:(id)a3 withNameIdentifier:(id)a4
{
  if (a4) {
    id v7 = @"NamedEffectProduction";
  }
  else {
    id v7 = @"EffectStyleProduction";
  }
  id v8 = [(CoreThemeDocument *)self newObjectForEntity:v7];
  [v8 setIsExcludedFromFilter:*MEMORY[0x263EFFB38]];
  objc_msgSend(v8, "setRenditionType:", -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 7));
  id v9 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
  uint64_t v10 = objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform"));
  [a3 element];
  objc_msgSend(v9, "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v10, "partDefinitionWithName:forElementDefinition:", objc_msgSend(a3, "name"), objc_msgSend((id)objc_opt_class(), "elementDefinitionWithName:withSchema:", objc_msgSend((id)objc_msgSend(a3, "element"), "name"), v10))+ 16, self);
  [v8 setBaseKeySpec:v9];

  if (a4) {
    objc_msgSend((id)objc_msgSend(v8, "baseKeySpec"), "setNameIdentifier:", objc_msgSend(a4, "unsignedIntValue"));
  }
  [v8 setComment:objc_msgSend(NSString, "stringWithFormat:", @"System Effect: %@ - %@", objc_msgSend((id)objc_msgSend(a3, "element"), "name"), objc_msgSend(a3, "name"))];
  [v8 setPartDefinition:a3];
  [v8 generateRenditionsWithDocument:self];

  return v8;
}

- (id)namedEffectProductionWithName:(id)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"NamedEffectProduction"];
  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"name.name = %@", a3];
  id v7 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
  [v5 setPredicate:v6];
  id v10 = 0;
  id v8 = (void *)[v7 executeFetchRequest:v5 error:&v10];

  if (v10)
  {
    NSLog(&cfstr_UnableToLookup.isa, a3, [v10 localizedDescription]);
    return 0;
  }
  else
  {
    id result = (id)[v8 count];
    if (result) {
      return (id)[v8 objectAtIndex:0];
    }
  }
  return result;
}

- (id)_namedTextEffectPartDefinition
{
  id v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"SchemaPartDefinition", [MEMORY[0x263F08A98] predicateWithFormat:@"name = %@ AND element.name = %@", @"Named Text", @"Named Effect"], 0);
  id result = (id)[v2 count];
  if (result)
  {
    return (id)[v2 objectAtIndex:0];
  }
  return result;
}

- (id)_namedImageEffectPartDefinition
{
  id v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"SchemaPartDefinition", [MEMORY[0x263F08A98] predicateWithFormat:@"name = %@ AND element.name = %@", @"Named Image", @"Named Effect"], 0);
  id result = (id)[v2 count];
  if (result)
  {
    return (id)[v2 objectAtIndex:0];
  }
  return result;
}

- (id)createNamedEffectProductionWithName:(id)a3 isText:(BOOL)a4
{
  if (a4) {
    id v6 = [(CoreThemeDocument *)self _namedTextEffectPartDefinition];
  }
  else {
    id v6 = [(CoreThemeDocument *)self _namedImageEffectPartDefinition];
  }
  id v7 = v6;
  id v8 = [(CoreThemeDocument *)self namedEffectProductionWithName:a3];
  if (v8)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "name"), "identifier");
    return [(CoreThemeDocument *)self createEffectStyleProductionForPartDefinition:v7 withNameIdentifier:v9];
  }
  else
  {
    id v11 = [(CoreThemeDocument *)self _createNamedElementWithNextAvailableIdentifier];
    id v12 = -[CoreThemeDocument createEffectStyleProductionForPartDefinition:withNameIdentifier:](self, "createEffectStyleProductionForPartDefinition:withNameIdentifier:", v7, [v11 identifier]);
    [v11 setName:a3];
    [v11 setProduction:v12];
    return v12;
  }
}

- (id)_createPhotoshopElementProductionWithAsset:(id)a3
{
  id v5 = [(CoreThemeDocument *)self newObjectForEntity:@"PhotoshopElementProduction"];
  [v5 setValue:a3 forKey:@"asset"];
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 0), @"isExcludedFromFilter");
  objc_msgSend(v5, "setValue:forKey:", -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 0), @"renditionType");
  id v6 = [(CoreThemeDocument *)self iterationTypeWithIdentifier:4];
  [v5 setValue:v6 forKey:@"rowIterationType"];
  [v5 setValue:v6 forKey:@"columnIterationType"];
  id v7 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
  objc_msgSend(v7, "setScaleFactor:", objc_msgSend(a3, "scaleFactor"));
  [v5 setValue:v7 forKey:@"baseKeySpec"];

  [v5 setValue:objc_msgSend(NSString, "stringWithFormat:", @"From: %@/%@", objc_msgSend(a3, "category"), objc_msgSend(a3, "name")), @"comment" forKey];
  return v5;
}

- (id)_namedImagePartDefinition
{
  id v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"SchemaPartDefinition", [MEMORY[0x263F08A98] predicateWithFormat:@"name = %@ AND element.name = %@", @"Artwork Image", @"Named Asset"], 0);
  id result = (id)[v2 count];
  if (result)
  {
    return (id)[v2 objectAtIndex:0];
  }
  return result;
}

- (id)_createNamedElementWithNextAvailableIdentifier
{
  cachedMaxIdentifierInUse = (void *)self->cachedMaxIdentifierInUse;
  if ((uint64_t)cachedMaxIdentifierInUse > 0)
  {
LABEL_2:
    self->cachedMaxIdentifierInUse = (int64_t)cachedMaxIdentifierInUse + 1;
    return -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:");
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"identifier" ascending:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"NamedElement"];
  id v7 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
  objc_msgSend(v6, "setSortDescriptors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v5));

  [v6 setFetchLimit:1];
  id v9 = 0;
  id v8 = (void *)[v7 executeFetchRequest:v6 error:&v9];

  if (!v9)
  {
    cachedMaxIdentifierInUse = (void *)[v8 count];
    if (cachedMaxIdentifierInUse)
    {
      cachedMaxIdentifierInUse = (void *)[v8 objectAtIndex:0];
      if (cachedMaxIdentifierInUse) {
        cachedMaxIdentifierInUse = objc_msgSend((id)objc_msgSend(cachedMaxIdentifierInUse, "identifier"), "integerValue");
      }
    }
    goto LABEL_2;
  }
  NSLog(&cfstr_UnableToComput.isa, [v9 localizedDescription]);
  return 0;
}

- (id)_createNamedElementWithIdentifier:(int64_t)a3
{
  id v5 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedElement"];
  objc_msgSend(v5, "setIdentifier:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
  if (self->cachedMaxIdentifierInUse < a3) {
    self->cachedMaxIdentifierInUse = a3;
  }

  return v5;
}

- (id)namedElementWithName:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"NamedElement"];
  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"name = %@", a3];
  id v7 = [(TDPersistentDocument *)self managedObjectContext];
  [v5 setPredicate:v6];
  id v10 = 0;
  id v8 = (void *)[v7 executeFetchRequest:v5 error:&v10];

  if (v10)
  {
    NSLog(&cfstr_UnableToLookup_0.isa, a3, [v10 localizedDescription]);
    return 0;
  }
  else
  {
    id result = (id)[v8 count];
    if (result) {
      return (id)[v8 objectAtIndex:0];
    }
  }
  return result;
}

- (id)namedElementsForElementDefinition:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "parts"), "anyObject"), "productions"), "valueForKey:", @"name");

  return (id)[v3 allObjects];
}

- (id)elementProductionsWithName:(id)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"name" ascending:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"ElementProduction"];
  uint64_t v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"name.name = %@", a3];
  objc_msgSend(v6, "setSortDescriptors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v5));
  [v6 setPredicate:v7];
  id v10 = 0;
  id v8 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC"), "executeFetchRequest:error:", v6, &v10);

  if (v10)
  {
    NSLog(&cfstr_UnableToLookup_1.isa, a3, [v10 localizedDescription]);
    return 0;
  }
  return v8;
}

- (id)namedArtworkProductionWithName:(id)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"NamedArtworkProduction"];
  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"name.name = %@", a3];
  uint64_t v7 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
  [v5 setPredicate:v6];
  id v10 = 0;
  id v8 = (void *)[v7 executeFetchRequest:v5 error:&v10];

  if (v10)
  {
    NSLog(&cfstr_UnableToLookup_1.isa, a3, [v10 localizedDescription]);
    return 0;
  }
  else
  {
    id result = (id)[v8 count];
    if (result) {
      return (id)[v8 objectAtIndex:0];
    }
  }
  return result;
}

- (id)slicesComputedForImageSize:(CGSize)a3 usingSliceInsets:(id)a4 resizableSliceSize:(CGSize)a5 withRenditionType:(int64_t)a6
{
  uint64_t v6 = 0;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (a3.width <= 0.0 || a3.height <= 0.0) {
    return v6;
  }
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  if (a4.var0 < 0.0 && a4.var2 < 0.0 && a4.var3 < 0.0 && a4.var1 < 0.0) {
    return 0;
  }
  unint64_t width = (unint64_t)a3.width;
  unint64_t height = (unint64_t)a3.height;
  if (a4.var0 >= 0.0 && a6 == 3 && a4.var2 >= 0.0 && a4.var1 >= 0.0 && a4.var3 >= 0.0)
  {
    if (a5.width >= 1.0) {
      double v14 = a5.width;
    }
    else {
      double v14 = 1.0;
    }
    double v15 = (double)width - (a4.var1 + a4.var3) - v14;
    if (v15 < 0.0) {
      double v15 = 0.0;
    }
    double v16 = (double)height;
    double v17 = (double)height - (a4.var0 + var2);
    if (a5.height >= 1.0) {
      double v18 = a5.height;
    }
    else {
      double v18 = 1.0;
    }
    double v19 = v17 - v18;
    if (v17 - v18 < 0.0) {
      double v19 = 0.0;
    }
    double v20 = a4.var1 + v14 + v15;
    if ((double)width - v20 >= 0.0) {
      double v21 = (double)width - v20;
    }
    else {
      double v21 = 0.0;
    }
    double v22 = var0 + v18 + v19;
    if (v16 - v22 >= 0.0) {
      double v23 = v16 - v22;
    }
    else {
      double v23 = 0.0;
    }
    BOOL v24 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:9];
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, 0.0, var1, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", var1, 0.0, v14, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v20, 0.0, v21, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, var0, var1, v18));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", var1, var0, v14, v18));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v20, var0, v21, v18));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, v22, var1, v23));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", var1, v22, v14, v23));
    long long v25 = (void *)MEMORY[0x263F08D40];
    double v26 = v20;
    double v27 = v22;
    double v28 = v21;
    double v29 = v23;
    goto LABEL_49;
  }
  if (a6 == 1 && a4.var1 >= 0.0 && a4.var3 >= 0.0)
  {
    if (a5.width >= 1.0) {
      double v30 = a5.width;
    }
    else {
      double v30 = 1.0;
    }
    if ((double)width - (a4.var1 + a4.var3) - v30 >= 0.0) {
      double v31 = (double)width - (a4.var1 + a4.var3) - v30;
    }
    else {
      double v31 = 0.0;
    }
    BOOL v24 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:4];
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, 0.0, var1, (double)height));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", var1, 0.0, v30, (double)height));
    double v32 = var1 + v30;
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v32, 0.0, v31, (double)height));
    long long v25 = (void *)MEMORY[0x263F08D40];
    double v26 = v32 + v31;
    double v27 = 0.0;
    double v28 = var3;
    double v29 = (double)height;
LABEL_49:
    objc_msgSend(v24, "addObject:", objc_msgSend(v25, "valueWithRect:", v26, v27, v28, v29));
    goto LABEL_50;
  }
  if (a4.var0 >= 0.0 && a6 == 2 && a4.var2 >= 0.0)
  {
    if (a5.height >= 1.0) {
      double v33 = a5.height;
    }
    else {
      double v33 = 1.0;
    }
    if ((double)height - (a4.var0 + a4.var2) - v33 >= 0.0) {
      double v34 = (double)height - (a4.var0 + a4.var2) - v33;
    }
    else {
      double v34 = 0.0;
    }
    BOOL v24 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:4];
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, 0.0, (double)width, var0));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, var0, (double)width, v33));
    objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, var0 + v33, (double)width, v34));
    long long v25 = (void *)MEMORY[0x263F08D40];
    double v26 = 0.0;
    double v27 = v33 + var0 + v34;
    double v28 = (double)width;
    double v29 = var2;
    goto LABEL_49;
  }
  if ((unint64_t)a6 > 0xC || ((1 << a6) & 0x1801) == 0)
  {
    id v49 = +[TDLogger defaultLogger];
    [v49 logError:objc_msgSend(NSString, "stringWithFormat:", @"Edge insets were specified but didn't match the rendition type"];
  }
  BOOL v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, 0.0, (double)width, (double)height));
LABEL_50:
  if (![v24 count]) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v24, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v35 = [v24 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * i) rectValue];
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        id v47 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
        objc_msgSend(v47, "setSliceRect:", v40, v42, v44, v46);
        [v6 addObject:v47];
      }
      uint64_t v36 = [v24 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v36);
  }
  return v6;
}

- (id)createTextStyleProductionsForImportInfos:(id)a3 error:(id *)a4
{
  if (![a3 count]) {
    return 0;
  }
  uint64_t v6 = (void *)[MEMORY[0x263EFF980] array];
  id v34 = [(CoreThemeDocument *)self elementWithIdentifier:85];
  id v33 = [(CoreThemeDocument *)self partWithIdentifier:231];
  id v32 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1015];
  id v31 = [(CoreThemeDocument *)self displayGamuts];
  id v30 = [(CoreThemeDocument *)self idioms];
  id v29 = [(CoreThemeDocument *)self sizeClasses];
  uint64_t v7 = (void *)[a3 sortedArrayUsingComparator:&__block_literal_global_601];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = (void *)[v7 objectAtIndex:v8];
      id v10 = (id)[v6 lastObject];
      char v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "name"), "name"), "isEqualToString:", objc_msgSend(v9, "name"));
      if (v10) {
        char v12 = v11;
      }
      else {
        char v12 = 0;
      }
      if (v12) {
        goto LABEL_9;
      }
      id v10 = [(CoreThemeDocument *)self newObjectForEntity:@"TextStyleProduction"];
      id v13 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v9 nameIdentifier]);
      objc_msgSend(v13, "setName:", objc_msgSend(v9, "name"));
      [v13 setProduction:v10];
      [v10 setRenditionType:v32];
      id v14 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
      [v14 setElement:v34];
      [v14 setPart:v33];
      objc_msgSend(v14, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v13, "identifier"), "unsignedIntValue"));
      [v10 setBaseKeySpec:v14];

      if (v10)
      {
LABEL_9:
        id v15 = [(CoreThemeDocument *)self newObjectForEntity:@"TextStyleRenditionSpec"];
        objc_msgSend(v15, "setAlignment:", (__int16)objc_msgSend(v9, "textAlignment"));
        objc_msgSend(v15, "setFontName:", objc_msgSend(v9, "fontName"));
        [v9 fontSize];
        *(float *)&double v16 = v16;
        [v15 setFontSize:v16];
        [v9 maxPointSize];
        *(float *)&double v17 = v17;
        [v15 setMaxPointSize:v17];
        [v9 minPointSize];
        *(float *)&double v18 = v18;
        [v15 setMinPointSize:v18];
        objc_msgSend(v15, "setScalingStyle:", (__int16)objc_msgSend(v9, "scalingStyle"));
        [v15 setProduction:v10];
        [v15 setRenditionType:v32];
        id v19 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
        objc_msgSend(v19, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v10, "baseKeySpec"), "nameIdentifier"));
        [v19 setElement:v34];
        [v19 setPart:v33];
        objc_msgSend(v19, "setGamut:", objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v9, "displayGamut")));
        objc_msgSend(v19, "setIdiom:", objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v9, "idiom")));
        objc_msgSend(v19, "setSubtype:", objc_msgSend(v9, "subtype"));
        char v35 = v12;
        double v20 = v7;
        uint64_t v21 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v9, "sizeClassHorizontal"));
        double v22 = v6;
        uint64_t v23 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v9, "sizeClassVertical"));
        uint64_t v24 = v21;
        uint64_t v7 = v20;
        [v19 setSizeClassHorizontal:v24];
        [v19 setSizeClassVertical:v23];
        objc_msgSend(v19, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v9, "appearanceIdentifier"), objc_msgSend(v9, "appearanceName"), 1));
        uint64_t v25 = [v9 localizationIdentifier];
        uint64_t v26 = [v9 localizationName];
        uint64_t v27 = v25;
        uint64_t v6 = v22;
        objc_msgSend(v19, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", v27, v26, 1));
        [v15 setKeySpec:v19];

        if ((v35 & 1) == 0) {
          [v22 addObject:v10];
        }
      }
      ++v8;
    }
    while (v8 < [v7 count]);
  }
  return v6;
}

uint64_t __68__CoreThemeDocument_createTextStyleProductionsForImportInfos_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 compare:v5];
}

- (id)createNamedColorProductionsForImportInfos:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "array", a3, a4);
  id v7 = [(CoreThemeDocument *)self elementWithIdentifier:85];
  id v31 = [(CoreThemeDocument *)self partWithIdentifier:217];
  id v30 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1009];
  id v29 = [(CoreThemeDocument *)self displayGamuts];
  id v28 = [(CoreThemeDocument *)self idioms];
  unint64_t v8 = (void *)[a3 sortedArrayUsingComparator:&__block_literal_global_609];
  if ([v8 count])
  {
    uint64_t v9 = 0;
    id v25 = v7;
    uint64_t v26 = v6;
    uint64_t v27 = v8;
    while (1)
    {
      id v10 = (void *)[v8 objectAtIndex:v9];
      if (![v10 colorComponents]) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 3356, @"All colors need to have the colorComponents set when being imported into a Core Theme Document color named '%@'.", objc_msgSend(v10, "name"));
      }
      id v11 = (id)[v6 lastObject];
      char v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "name"), "name"), "isEqualToString:", objc_msgSend(v10, "name"));
      if (v11) {
        char v13 = v12;
      }
      else {
        char v13 = 0;
      }
      if ((v13 & 1) == 0)
      {
        id v11 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedColorProduction"];
        id v14 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v10 nameIdentifier]);
        objc_msgSend(v14, "setName:", objc_msgSend(v10, "name"));
        [v14 setProduction:v11];
        [v11 setRenditionType:v30];
        id v15 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
        [v15 setElement:v7];
        [v15 setPart:v31];
        objc_msgSend(v15, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v14, "identifier"), "unsignedIntValue"));
        [v11 setBaseKeySpec:v15];

        if (!v11) {
          goto LABEL_22;
        }
      }
      id v16 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedColorRenditionSpec"];
      double v17 = (void *)[v10 colorComponents];
      if ([v17 count] == 4) {
        break;
      }
      if ([v17 count] == 2)
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 1;
        goto LABEL_14;
      }
LABEL_15:
      if ([v10 colorSpaceID]) {
        uint64_t v21 = [v10 colorSpaceID];
      }
      else {
        uint64_t v21 = 1;
      }
      [v16 setColorSpaceID:v21];
      if (objc_msgSend((id)objc_msgSend(v10, "systemColorName"), "length")) {
        objc_msgSend(v16, "setSystemColorName:", objc_msgSend(v10, "systemColorName"));
      }
      [v16 setProduction:v11];
      [v16 setRenditionType:v30];
      id v22 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
      objc_msgSend(v22, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v11, "baseKeySpec"), "nameIdentifier"));
      [v22 setElement:v7];
      [v22 setPart:v31];
      objc_msgSend(v22, "setGamut:", objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v10, "displayGamut")));
      objc_msgSend(v22, "setIdiom:", objc_msgSend(v28, "objectAtIndex:", objc_msgSend(v10, "idiom")));
      objc_msgSend(v22, "setSubtype:", objc_msgSend(v10, "subtype"));
      objc_msgSend(v22, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v10, "appearanceIdentifier"), objc_msgSend(v10, "appearanceName"), 1));
      objc_msgSend(v22, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v10, "localizationIdentifier"), objc_msgSend(v10, "localizationName"), 1));
      [v16 setKeySpec:v22];

      unint64_t v8 = v27;
      if ((v13 & 1) == 0) {
        [v6 addObject:v11];
      }
LABEL_22:
      if (++v9 >= (unint64_t)[v8 count]) {
        return v6;
      }
    }
    uint64_t v18 = 1;
    uint64_t v19 = 2;
    uint64_t v20 = 3;
LABEL_14:
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 0), "doubleValue");
    objc_msgSend(v16, "setRed:");
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v18), "doubleValue");
    objc_msgSend(v16, "setGreen:");
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v19), "doubleValue");
    objc_msgSend(v16, "setBlue:");
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v20), "doubleValue");
    objc_msgSend(v16, "setAlpha:");
    id v7 = v25;
    uint64_t v6 = v26;
    goto LABEL_15;
  }
  return v6;
}

uint64_t __69__CoreThemeDocument_createNamedColorProductionsForImportInfos_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 compare:v5];
}

- (id)_sizeIndexesByNameFromNamedAssetImportInfos:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v30 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = (void *)[a3 sortedArrayUsingComparator:&__block_literal_global_621];
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v6 count];
  id v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  do
  {
    if (v8 < [v6 count]) {
      id v7 = (void *)[v6 objectAtIndex:v8];
    }
    if (!v9) {
      uint64_t v9 = (void *)[v7 name];
    }
    if (!objc_msgSend(v9, "isEqualToString:", objc_msgSend(v7, "name"))
      || v8 == [v6 count])
    {
      if ([v27 count])
      {
        uint64_t v10 = [v27 sortedArrayUsingComparator:&__block_literal_global_623];
        if (v10 && v9) {
          [v30 setObject:v10 forKey:v9];
        }
        else {
          objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 3478, @"sortedSizes and currentName should not be nil");
        }
      }

      if (v8 >= [v6 count]) {
        id v11 = 0;
      }
      else {
        id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      uint64_t v9 = objc_msgSend(v7, "name", v11);
    }
    if (v8 < [v6 count])
    {
      uint64_t v12 = [v7 iconSize];
      if (v12)
      {
        uint64_t v13 = v12;
        if ([v27 indexOfObject:v12] == 0x7FFFFFFFFFFFFFFFLL) {
          [v27 addObject:v13];
        }
      }
    }
    ++v8;
  }
  while (v8 <= [v6 count]);
  id v29 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = (id)[v30 allKeys];
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v19 = (void *)[v30 valueForKey:v18];
        uint64_t v20 = (void *)[MEMORY[0x263EFF9C0] set];
        if ([v19 count])
        {
          unint64_t v21 = 0;
          do
          {
            id v22 = [(CoreThemeDocument *)self newObjectForEntity:@"MultisizeImageSetSizeIndex"];
            objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", v21), "sizeValue");
            double v24 = v23;
            [v22 setWidth:(int)v25];
            [v22 setHeight:(int)v24];
            [v22 setIndex:(__int16)(v21 + 1)];
            [v20 addObject:v22];
            ++v21;
          }
          while (v21 < [v19 count]);
        }
        [v29 setObject:v20 forKey:v18];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v15);
  }

  return v29;
}

uint64_t __65__CoreThemeDocument__sizeIndexesByNameFromNamedAssetImportInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 compare:v5];
}

uint64_t __65__CoreThemeDocument__sizeIndexesByNameFromNamedAssetImportInfos___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  [a2 sizeValue];
  double v5 = v4;
  double v7 = v6;
  [a3 sizeValue];
  double v10 = v8 * v9;
  if (v5 * v7 < v10) {
    return -1;
  }
  else {
    return v5 * v7 > v10;
  }
}

- (BOOL)needToCreateForwardstopForPlatform
{
  return [(CoreThemeDocument *)self targetPlatform] != 0;
}

- (BOOL)isArtworkRenditionEligibleForForwardstop:(id)a3
{
  BOOL result = objc_msgSend((id)objc_msgSend(a3, "compressionType"), "identifier") != 4
        && objc_msgSend((id)objc_msgSend(a3, "compressionType"), "identifier") != 5
        && ((double v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "asset"), "fileURLWithDocument:", self), "pathExtension"), !objc_msgSend(v5, "caseInsensitiveCompare:", @"PNG"))|| !objc_msgSend(v5, "caseInsensitiveCompare:", @"PDF")|| !objc_msgSend(v5, "caseInsensitiveCompare:", @"SVG"))&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "keySpec"), "part"), "identifier") == 181&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "keySpec"), "element"), "identifier") == 85;
  return result;
}

- (BOOL)needToCreateForwardstopFor2018DeploymentVariant:(id)a3 withCompressionTypes:(id)a4
{
  if (![(CoreThemeDocument *)self needToCreateForwardstopForPlatform]) {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "renditionType"), "identifier")) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [a3 production];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  [a3 production];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  uint64_t v8 = [a3 compressionType];
  if (v8 == [a4 objectAtIndex:3])
  {
    return [(CoreThemeDocument *)self shouldCreateForwardstopForLossy];
  }
  else
  {
    uint64_t v9 = [a3 compressionType];
    if (v9 != [a4 objectAtIndex:2])
    {
      uint64_t v10 = [a3 compressionType];
      if (v10 != [a4 objectAtIndex:0]) {
        return 0;
      }
    }
    return [(CoreThemeDocument *)self shouldCreate2018ForwardstopForLossless];
  }
}

- (BOOL)needToCreateForwardstopFor2019DeploymentVariant:(id)a3 withCompressionTypes:(id)a4
{
  if (![(CoreThemeDocument *)self needToCreateForwardstopForPlatform]) {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "renditionType"), "identifier")) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [a3 production];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  [a3 production];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  uint64_t v7 = [a3 compressionType];
  if (v7 != [a4 objectAtIndex:2])
  {
    uint64_t v8 = [a3 compressionType];
    if (v8 != [a4 objectAtIndex:0]) {
      return 0;
    }
  }

  return [(CoreThemeDocument *)self shouldCreate2019ForwardstopForLossless];
}

- (void)createForwardstops:(id)a3 withCompressionTypes:(id)a4 withDeploymentTargets:(id)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![(CoreThemeDocument *)self isArtworkRenditionEligibleForForwardstop:a3])
  {
    return;
  }
  BOOL v9 = [(CoreThemeDocument *)self needToCreateForwardstopFor2018DeploymentVariant:a3 withCompressionTypes:a4];
  BOOL v10 = [(CoreThemeDocument *)self needToCreateForwardstopFor2019DeploymentVariant:a3 withCompressionTypes:a4];
  if (v9)
  {
    id v11 = [(CoreThemeDocument *)self newObjectForEntity:@"SimpleArtworkRenditionSpec"];
    objc_msgSend((id)objc_msgSend(a3, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 0));
    [a3 copyAttributesInto:v11];
    objc_msgSend(v11, "setAllowsPaletteImageCompression:", -[CoreThemeDocument shouldAllowPaletteImageCompressionForDeploymentTarget:](self, "shouldAllowPaletteImageCompressionForDeploymentTarget:", 3));
    objc_msgSend(v11, "setAllowsDeepmapCompression:", -[CoreThemeDocument shouldAllowDeepmapCompressionForDeploymentTarget:](self, "shouldAllowDeepmapCompressionForDeploymentTarget:", 3));
    objc_msgSend(v11, "setAllowsHevcCompression:", -[CoreThemeDocument shouldAllowHevcCompressionForDeploymentTarget:](self, "shouldAllowHevcCompressionForDeploymentTarget:", 3));
    objc_msgSend(v11, "setProduction:", objc_msgSend(a3, "production"));
    objc_msgSend(v11, "setAsset:", objc_msgSend(a3, "asset"));
    objc_msgSend(v11, "setSlices:", objc_msgSend(a3, "slices"));
    [v11 resetToBaseKeySpec];
    objc_msgSend((id)objc_msgSend(a3, "keySpec"), "copyAttributesInto:", objc_msgSend(v11, "keySpec"));
    objc_msgSend((id)objc_msgSend(v11, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 3));

    if (v10)
    {
      id v13 = [(CoreThemeDocument *)self newObjectForEntity:@"SimpleArtworkRenditionSpec"];
      [a3 copyAttributesInto:v13];
LABEL_9:
      objc_msgSend(v13, "setAllowsDeepmap2Compression:", -[CoreThemeDocument shouldAllowDeepmap2CompressionForDeploymentTarget:](self, "shouldAllowDeepmap2CompressionForDeploymentTarget:", 5));
      objc_msgSend(v13, "setProduction:", objc_msgSend(a3, "production"));
      objc_msgSend(v13, "setAsset:", objc_msgSend(a3, "asset"));
      objc_msgSend(v13, "setSlices:", objc_msgSend(a3, "slices"));
      [v13 resetToBaseKeySpec];
      objc_msgSend((id)objc_msgSend(a3, "keySpec"), "copyAttributesInto:", objc_msgSend(v13, "keySpec"));
      objc_msgSend((id)objc_msgSend(v13, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 5));

      return;
    }
  }
  else
  {
    objc_msgSend(a3, "setAllowsPaletteImageCompression:", -[CoreThemeDocument shouldAllowPaletteImageCompression](self, "shouldAllowPaletteImageCompression"));
    objc_msgSend(a3, "setAllowsHevcCompression:", -[CoreThemeDocument shouldAllowHevcCompression](self, "shouldAllowHevcCompression"));
    objc_msgSend(a3, "setAllowsDeepmapCompression:", -[CoreThemeDocument shouldAllowDeepmapCompression](self, "shouldAllowDeepmapCompression"));
    if (v10)
    {
      id v13 = [(CoreThemeDocument *)self newObjectForEntity:@"SimpleArtworkRenditionSpec"];
      objc_msgSend((id)objc_msgSend(a3, "keySpec"), "setTarget:", objc_msgSend(a5, "objectAtIndex:", 0));
      [a3 copyAttributesInto:v13];
      goto LABEL_9;
    }
  }
  BOOL v12 = [(CoreThemeDocument *)self shouldAllowDeepmap2Compression];

  [a3 setAllowsDeepmap2Compression:v12];
}

- (id)compressionTypes
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F38458] + 16))
  {
    double v4 = (void *)MEMORY[0x263F38458];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)deploymentTargets
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F38460] + 16))
  {
    double v4 = (void *)MEMORY[0x263F38460];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument deploymentTargetWithIdentifier:](self, "deploymentTargetWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)idioms
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F384A0] + 16))
  {
    double v4 = (void *)MEMORY[0x263F384A0];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument idiomWithIdentifier:](self, "idiomWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)displayGamuts
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F38470] + 16))
  {
    double v4 = (void *)MEMORY[0x263F38470];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)sizeClasses
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F384E8] + 16))
  {
    double v4 = (void *)MEMORY[0x263F384E8];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)featureSetClasses
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F38490] + 16))
  {
    double v4 = (void *)MEMORY[0x263F38490];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument graphicsFeatureSetClassWithIdentifier:](self, "graphicsFeatureSetClassWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)directions
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F38468] + 16))
  {
    double v4 = (void *)MEMORY[0x263F38468];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)textureFaces
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F384D0] + 16))
  {
    double v4 = (void *)MEMORY[0x263F384D0];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument textureFaceWithIdentifier:](self, "textureFaceWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)glyphsSizes
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F38500] + 16))
  {
    double v4 = (void *)MEMORY[0x263F38500];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument glyphSizeWithIdentifier:](self, "glyphSizeWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)glyphWeights
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F38508] + 16))
  {
    double v4 = (void *)MEMORY[0x263F38508];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument glyphWeightWithIdentifier:](self, "glyphWeightWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (id)glyphRenderingModes
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if (*(void *)(MEMORY[0x263F384F8] + 16))
  {
    double v4 = (void *)MEMORY[0x263F384F8];
    do
    {
      objc_msgSend(v3, "addObject:", -[CoreThemeDocument vectorGlyphRenderingModeWithIdentifier:](self, "vectorGlyphRenderingModeWithIdentifier:", *v4));
      uint64_t v5 = v4[5];
      v4 += 3;
    }
    while (v5);
  }
  return v3;
}

- (void)_createForwardstopRenditions
{
  id v3 = [(CoreThemeDocument *)self allObjectsForEntity:@"RenditionSpec" withSortDescriptors:0];
  id v4 = [(CoreThemeDocument *)self compressionTypes];
  id v5 = [(CoreThemeDocument *)self deploymentTargets];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
      -[CoreThemeDocument createForwardstops:withCompressionTypes:withDeploymentTargets:](self, "createForwardstops:withCompressionTypes:withDeploymentTargets:", [v3 objectAtIndex:v6++], v4, v5);
    while (v6 < [v3 count]);
  }
}

- (id)createNamedArtworkProductionsForAssets:(id)a3 customInfos:(id)a4 error:(id *)a5
{
  uint64_t v311 = *MEMORY[0x263EF8340];
  v242 = objc_msgSend(MEMORY[0x263EFF980], "array", a3, a4, a5);
  id v240 = [(CoreThemeDocument *)self _namedImagePartDefinition];
  id v243 = [(CoreThemeDocument *)self elementWithIdentifier:85];
  id v237 = [(CoreThemeDocument *)self partWithIdentifier:181];
  id v220 = [(CoreThemeDocument *)self partWithIdentifier:42];
  id v224 = [(CoreThemeDocument *)self partWithIdentifier:208];
  id v219 = [(CoreThemeDocument *)self partWithIdentifier:218];
  id v234 = [(CoreThemeDocument *)self partWithIdentifier:220];
  id v241 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:0];
  id v207 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1];
  id v206 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:2];
  id v205 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:3];
  id v230 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1002];
  id v229 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1018];
  id v217 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1006];
  id v218 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1010];
  id v246 = [(CoreThemeDocument *)self idioms];
  id v245 = [(CoreThemeDocument *)self displayGamuts];
  id v226 = [(CoreThemeDocument *)self deploymentTargets];
  id v232 = [(CoreThemeDocument *)self featureSetClasses];
  id v244 = [(CoreThemeDocument *)self sizeClasses];
  id v236 = [(CoreThemeDocument *)self directions];
  obuint64_t j = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"NamedArtworkProduction", 0, 0));
  id v262 = (id)[MEMORY[0x263EFF980] array];
  id v248 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:10];
  id v216 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:11];
  id v215 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:12];
  id v214 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:20];
  id v213 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:23];
  id v212 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:30];
  id v211 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:21];
  id v210 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:24];
  id v209 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:31];
  id v208 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:34];
  id v238 = [(CoreThemeDocument *)self templateRenderingModeWithIdentifier:0];
  id v233 = [(CoreThemeDocument *)self templateRenderingModeWithIdentifier:1];
  id v231 = [(CoreThemeDocument *)self templateRenderingModeWithIdentifier:2];
  id v253 = [(CoreThemeDocument *)self compressionTypes];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v298 = 0u;
  long long v299 = 0u;
  long long v300 = 0u;
  long long v301 = 0u;
  id v7 = [(CoreThemeDocument *)self objectsForEntity:@"Tag" withPredicate:0 sortDescriptors:0];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v298 objects:v310 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v299;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v299 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", *(void *)(*((void *)&v298 + 1) + 8 * i)), objc_msgSend(*(id *)(*((void *)&v298 + 1) + 8 * i), "identifier"));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v298 objects:v310 count:16];
    }
    while (v9);
  }
  id v12 = a4;
  id v221 = [(CoreThemeDocument *)self _sizeIndexesByNameFromNamedAssetImportInfos:a4];
  id v13 = a3;
  v261 = v6;
  if ([a3 count])
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0x263F08000;
    double v16 = *MEMORY[0x263F001A8];
    double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
    v247 = (void *)*MEMORY[0x263EFFD08];
    double v222 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v223 = *MEMORY[0x263F001B0];
    uint64_t v239 = *MEMORY[0x263EFFB38];
    while (1)
    {
      uint64_t v20 = (void *)[v13 objectAtIndex:v14];
      uint64_t v21 = [v12 count];
      v258 = v20;
      uint64_t v254 = v14;
      if (v21 != [v13 count]) {
        break;
      }
      id v22 = (void *)[v12 objectAtIndex:v14];
      double v23 = v22;
      if (v20 == v247)
      {
        uint64_t v24 = [v22 name];
        if (!v23) {
          goto LABEL_28;
        }
      }
      else
      {
        if (!v22) {
          goto LABEL_15;
        }
        uint64_t v24 = [v22 name];
      }
      if ([v23 renditionType] != 1002
        && [v23 renditionType] != 1018
        && [v23 renditionType] != 1004
        && [v23 renditionType] != 1006)
      {
        uint64_t v156 = [v23 renditionType];
        double v158 = v222;
        double v157 = v223;
        if (v156 != 1000) {
          objc_msgSend(v258, "sourceImageSizeWithDocument:", self, v223, v222);
        }
        double v201 = v157;
        double v202 = v158;
        [v23 sliceInsets];
        double v228 = v159;
        double v252 = v160;
        double v257 = v161;
        double v260 = v162;
        [v23 resizableSliceSize];
        double v203 = v163;
        double v204 = v164;
        id v165 = (void *)[v258 fileURLWithDocument:self];
        if ([v23 renditionType] == 1000)
        {
          double v30 = v19;
          double v31 = v18;
          double v32 = v17;
          double v33 = v16;
        }
        else
        {
          v166 = v23;
          if ([v23 renditionType] == 1017
            || objc_msgSend((id)objc_msgSend(v165, "pathExtension"), "caseInsensitiveCompare:", @"PDF")
            && objc_msgSend((id)objc_msgSend(v165, "pathExtension"), "caseInsensitiveCompare:", @"SVG"))
          {
            double v30 = v19;
            double v31 = v18;
            double v32 = v17;
            double v33 = v16;
          }
          else
          {
            double v200 = v16;
            unsigned int v167 = [v258 fileScaleFactor];
            unsigned int v168 = [v258 scaleFactor];
            [v166 alignmentRect];
            double v33 = v169;
            double v32 = v170;
            double v31 = v171;
            double v30 = v172;
            if (v167)
            {
              double v173 = (double)v167;
            }
            else
            {
              unsigned int v174 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", [v165 lastPathComponent]);
              if (v174) {
                double v173 = (double)v174;
              }
              else {
                double v173 = 1.0;
              }
            }
            [v258 setFileScaleFactor:v173];
            double v175 = (double)v168 / v173;
            double v23 = v166;
            if (v175 != 1.0)
            {
              double v228 = v228 * v175;
              double v252 = v252 * v175;
              double v257 = v257 * v175;
              double v260 = v260 * v175;
              double v203 = v203 * v175;
              double v204 = v204 * v175;
              double v33 = v33 * v175;
              double v32 = v32 * v175;
              double v30 = v30 * v175;
              double v31 = v31 * v175;
            }
            double v16 = v200;
          }
        }
        id v28 = -[CoreThemeDocument slicesComputedForImageSize:usingSliceInsets:resizableSliceSize:withRenditionType:](self, "slicesComputedForImageSize:usingSliceInsets:resizableSliceSize:withRenditionType:", [v23 renditionType], v201, v202, v228, v252, v257, v260, v203, v204);
        uint64_t v176 = [v28 count];
        if (v176 >= 1)
        {
          uint64_t v177 = v176;
          if ([v23 renditionType] < 1) {
            goto LABEL_309;
          }
          if (v177 == 9)
          {
            uint64_t v180 = [v23 renditionType];
            int v27 = 0;
            id v34 = v241;
            if (v180 == 3) {
              id v34 = v205;
            }
          }
          else
          {
            if (v177 != 4)
            {
LABEL_309:
              int v27 = 0;
              id v255 = v241;
              goto LABEL_31;
            }
            if ([v23 renditionType] == 1) {
              id v178 = v207;
            }
            else {
              id v178 = v241;
            }
            uint64_t v179 = [v23 renditionType];
            int v27 = 0;
            id v34 = v206;
            if (v179 != 2) {
              id v34 = v178;
            }
          }
          goto LABEL_30;
        }
        int v27 = 0;
LABEL_29:
        id v34 = v241;
LABEL_30:
        id v255 = v34;
        goto LABEL_31;
      }
      if ([v23 renditionType] == 1002 || objc_msgSend(v23, "renditionType") == 1018)
      {
        uint64_t v26 = [v23 renditionType];
        int v27 = 0;
        id v28 = 0;
        id v29 = v230;
        if (v26 != 1002) {
          id v29 = v229;
        }
      }
      else
      {
        if ([v23 renditionType] == 1004)
        {
          if (!self->_explicitlyPackedIdentifiers) {
            self->_explicitlyPackedIdentifiers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          }
          long long v297 = 0u;
          long long v296 = 0u;
          long long v295 = 0u;
          long long v294 = 0u;
          long long v53 = (void *)[v23 containedImageNames];
          uint64_t v54 = [v53 countByEnumeratingWithState:&v294 objects:v309 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v295;
            do
            {
              for (uint64_t j = 0; j != v55; ++j)
              {
                if (*(void *)v295 != v56) {
                  objc_enumerationMutation(v53);
                }
                -[NSMutableDictionary setObject:forKey:](self->_explicitlyPackedIdentifiers, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "nameIdentifier")), *(void *)(*((void *)&v294 + 1) + 8 * j));
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v294 objects:v309 count:16];
            }
            while (v55);
          }
          explicitlyPackedPackings = self->_explicitlyPackedPackings;
          if (!explicitlyPackedPackings)
          {
            explicitlyPackedPackings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
            self->_explicitlyPackedPackings = explicitlyPackedPackings;
          }
          uint64_t v59 = [v23 name];
          -[NSMutableDictionary setObject:forKey:](explicitlyPackedPackings, "setObject:forKey:", v59, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "nameIdentifier")));
          explicitlyPackedContents = self->_explicitlyPackedContents;
          id v12 = a4;
          if (!explicitlyPackedContents)
          {
            explicitlyPackedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
            self->_explicitlyPackedContents = explicitlyPackedContents;
          }
          uint64_t v61 = [v23 containedImageNames];
          -[NSMutableDictionary setObject:forKey:](explicitlyPackedContents, "setObject:forKey:", v61, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "nameIdentifier")));
          unint64_t v15 = 0x263F08000uLL;
          id v13 = a3;
          goto LABEL_280;
        }
        uint64_t v74 = [v23 renditionType];
        int v27 = 0;
        id v28 = 0;
        id v29 = v241;
        if (v74 == 1006) {
          id v29 = v217;
        }
      }
      id v255 = v29;
      double v30 = v19;
      double v31 = v18;
      double v32 = v17;
      double v33 = v16;
LABEL_31:
      v259 = v23;
      if ([v23 renditionType] == 1002 || objc_msgSend(v23, "renditionType") == 1018)
      {
        long long v292 = 0u;
        long long v293 = 0u;
        long long v290 = 0u;
        long long v291 = 0u;
        uint64_t v35 = [obj countByEnumeratingWithState:&v290 objects:v308 count:16];
        if (!v35) {
          goto LABEL_95;
        }
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v291;
LABEL_35:
        uint64_t v38 = 0;
        while (1)
        {
          if (*(void *)v291 != v37) {
            objc_enumerationMutation(obj);
          }
          double v39 = *(void **)(*((void *)&v290 + 1) + 8 * v38);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "name"), "name"), "isEqualToString:", v24) & 1) != 0)
          {
            break;
          }
          if (v36 == ++v38)
          {
            uint64_t v36 = [obj countByEnumeratingWithState:&v290 objects:v308 count:16];
            if (v36) {
              goto LABEL_35;
            }
            goto LABEL_95;
          }
        }
      }
      else if ([v23 iconSize])
      {
        long long v288 = 0uLL;
        long long v289 = 0uLL;
        long long v286 = 0uLL;
        long long v287 = 0uLL;
        uint64_t v40 = [obj countByEnumeratingWithState:&v286 objects:v307 count:16];
        if (!v40) {
          goto LABEL_95;
        }
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v287;
LABEL_46:
        uint64_t v43 = 0;
        while (1)
        {
          if (*(void *)v287 != v42) {
            objc_enumerationMutation(obj);
          }
          double v39 = *(void **)(*((void *)&v286 + 1) + 8 * v43);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "name"), "name"), "isEqualToString:", v24) & 1) != 0)
          {
            break;
          }
          if (v41 == ++v43)
          {
            uint64_t v41 = [obj countByEnumeratingWithState:&v286 objects:v307 count:16];
            id v44 = 0;
            if (v41) {
              goto LABEL_46;
            }
            goto LABEL_96;
          }
        }
      }
      else
      {
        long long v284 = 0uLL;
        long long v285 = 0uLL;
        long long v282 = 0uLL;
        long long v283 = 0uLL;
        uint64_t v45 = [obj countByEnumeratingWithState:&v282 objects:v306 count:16];
        if (!v45) {
          goto LABEL_95;
        }
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v283;
LABEL_56:
        uint64_t v48 = 0;
        while (1)
        {
          if (*(void *)v283 != v47) {
            objc_enumerationMutation(obj);
          }
          double v39 = *(void **)(*((void *)&v282 + 1) + 8 * v48);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "name"), "name"), "isEqualToString:", v24) & 1) != 0)
              {
                break;
              }
            }
          }
          if (v46 == ++v48)
          {
            uint64_t v46 = [obj countByEnumeratingWithState:&v282 objects:v306 count:16];
            id v44 = 0;
            if (v46) {
              goto LABEL_56;
            }
            goto LABEL_96;
          }
        }
      }
      if (v39)
      {
        objc_opt_class();
        id v49 = v259;
        if ((objc_opt_isKindOfClass() & 1) == 0
          || [v259 renditionType] == 1002
          || [v259 renditionType] == 1018)
        {
          long long v50 = v255;
          if ([v259 renditionType] != 1002 && objc_msgSend(v259, "renditionType") != 1018
            || ![v39 isMemberOfClass:objc_opt_class()])
          {
            id v52 = v39;
            if ((v27 & 1) == 0) {
              goto LABEL_154;
            }
            goto LABEL_155;
          }
          id v44 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedArtworkProduction"];
          objc_msgSend(v44, "setBaseKeySpec:", objc_msgSend(v39, "baseKeySpec"));
          objc_msgSend(v44, "setRenditions:", objc_msgSend(v39, "renditions"));
          objc_msgSend((id)objc_msgSend(v44, "baseKeySpec"), "setPart:", v224);
          objc_msgSend(v44, "setRenditionType:", objc_msgSend(v39, "renditionType"));
          goto LABEL_96;
        }
        id v52 = (id)[v39 flattenedImageProduction];
        long long v50 = v255;
        if (v52) {
          goto LABEL_93;
        }
        id v52 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedArtworkProduction"];
        [v39 setFlattenedImageProduction:v52];
        id v62 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
        objc_msgSend(v62, "setElement:", objc_msgSend((id)objc_msgSend(v39, "baseKeySpec"), "element"));
        [v62 setPart:v224];
        [v52 setBaseKeySpec:v62];
        [v52 setRenditionType:v241];

        id v49 = v259;
        if (v52)
        {
LABEL_93:
          if ((v27 & 1) == 0) {
            goto LABEL_154;
          }
          goto LABEL_155;
        }
      }
LABEL_95:
      id v44 = 0;
LABEL_96:
      if ([v259 renditionType] == 1002 || objc_msgSend(v259, "renditionType") == 1018)
      {
        id v63 = [(CoreThemeDocument *)self newObjectForEntity:@"LayerStackProduction"];
        id v52 = v63;
        if (v44) {
          [v63 setFlattenedImageProduction:v44];
        }
      }
      else if ([v259 iconSize])
      {
        id v52 = [(CoreThemeDocument *)self newObjectForEntity:@"MultisizeImageSetProduction"];
        objc_msgSend(v52, "setSizeIndexes:", objc_msgSend(v221, "objectForKey:", objc_msgSend(v259, "name")));
      }
      else
      {
        id v52 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedArtworkProduction"];
        [v52 setMakeOpaqueIfPossible:1];
      }
      id v64 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
      if (v27) {
        id v65 = [(CoreThemeDocument *)self _createNamedElementWithNextAvailableIdentifier];
      }
      else {
        id v65 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v259 nameIdentifier]);
      }
      id v66 = v65;
      id v250 = v28;
      [v65 setName:v24];
      [v66 setProduction:v52];
      [v64 setElement:v243];
      if ((v27 & 1) != 0 || (v67 = [v259 iconSize], id v68 = v234, !v67)) {
        id v68 = v237;
      }
      [v64 setPart:v68];
      objc_msgSend(v64, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v66, "identifier"), "unsignedIntValue"));
      [v52 setBaseKeySpec:v64];

      [v52 setPartDefinition:v240];
      [v52 setIsExcludedFromFilter:v239];
      long long v50 = v255;
      [v52 setRenditionType:v255];
      [v52 setRenditionSubtype:v248];
      uint64_t v69 = v52;
      [v52 setComment:objc_msgSend(NSString, "stringWithFormat:", @"Named Image from: %@", objc_msgSend(v258, "name"))];
      if (v27)
      {
        if (+[TDAsset isTemplateFromImageFilename:](TDAsset, "isTemplateFromImageFilename:", [v258 name]))
        {
          unsigned int v70 = v52;
          id v71 = v233;
        }
        else
        {
          unsigned int v70 = v52;
          id v71 = v238;
        }
        [v70 setTemplateRenderingMode:v71];
        id v49 = v259;
      }
      else
      {
        id v49 = v259;
        uint64_t v72 = [v259 renditionSubtype];
        id v73 = v248;
        switch(v72)
        {
          case 10:
            goto LABEL_127;
          case 11:
            id v73 = v216;
            goto LABEL_127;
          case 12:
            id v73 = v215;
            goto LABEL_127;
          case 20:
            id v73 = v214;
            goto LABEL_127;
          case 21:
            id v73 = v211;
            goto LABEL_127;
          case 23:
            id v73 = v213;
            goto LABEL_127;
          case 24:
            id v73 = v210;
            goto LABEL_127;
          case 30:
            id v73 = v212;
            goto LABEL_127;
          case 31:
            id v73 = v209;
            goto LABEL_127;
          case 34:
            id v73 = v208;
LABEL_127:
            [v52 setRenditionSubtype:v73];
            break;
          default:
            break;
        }
        uint64_t v75 = objc_msgSend(v259, "templateRenderingMode", v73);
        id v76 = v238;
        if (!v75 || (id v76 = v231, v75 == 2) || (id v76 = v233, v75 == 1)) {
          [v52 setTemplateRenderingMode:v76];
        }
        objc_msgSend(v52, "setOptOutOfThinning:", objc_msgSend(v259, "optOutOfThinning", v76));
        objc_msgSend(v52, "setIsFlippable:", objc_msgSend(v259, "isFlippable"));
        objc_msgSend(v52, "setDateOfLastChange:", objc_msgSend(v259, "modificationDate"));
        [v52 setHasCustomDateOfLastChange:1];
        if ([(CoreThemeDocument *)self featureEnabled:17]) {
          objc_msgSend(v52, "setPreservesVectorRepresentation:", objc_msgSend(v259, "preservesVectorRepresentation"));
        }
        objc_msgSend(v52, "setAutoscalingType:", objc_msgSend(v259, "autoscalingType"));
        v77 = (void *)[v259 tags];
        if ([v77 count] && -[CoreThemeDocument featureEnabled:](self, "featureEnabled:", 1))
        {
          int v227 = v27;
          id v78 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v278 = 0u;
          long long v279 = 0u;
          long long v280 = 0u;
          long long v281 = 0u;
          uint64_t v79 = [v77 countByEnumeratingWithState:&v278 objects:v305 count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            uint64_t v81 = *(void *)v279;
            do
            {
              for (uint64_t k = 0; k != v80; ++k)
              {
                if (*(void *)v279 != v81) {
                  objc_enumerationMutation(v77);
                }
                uint64_t v83 = *(void *)(*((void *)&v278 + 1) + 8 * k);
                id v84 = (void *)[v261 objectForKey:v83];
                if ([v84 count])
                {
                  if ([v84 count] != 1) {
                    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 4292, @"We should ONLY have 1 tag with a name, tag names need to be Unique");
                  }
                  id v85 = (id)[v84 objectAtIndex:0];
                }
                else
                {
                  id v85 = [(CoreThemeDocument *)self newObjectForEntity:@"Tag"];
                  [v85 setIdentifier:v83];
                  objc_msgSend(v261, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v85), v83);
                }
                unint64_t v15 = 0x263F08000uLL;
                [v78 addObject:v85];
              }
              uint64_t v80 = [v77 countByEnumeratingWithState:&v278 objects:v305 count:16];
            }
            while (v80);
          }
          id v52 = v69;
          [v69 addTags:v78];
          uint64_t v86 = [v77 count];
          if (v86 != [v78 count]) {
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 4299, @"Supplied tags should always equal the count of tags on the production else the counts are wrong");
          }

          id v13 = a3;
          id v49 = v259;
          int v27 = v227;
          long long v50 = v255;
        }
        if (objc_msgSend((id)objc_msgSend(v49, "universalTypeIdentifier"), "length")) {
          objc_msgSend(v52, "setUniversalTypeIdentifier:", objc_msgSend(v49, "universalTypeIdentifier"));
        }
      }
      [obj addObject:v52];
      [v242 addObject:v52];
      id v28 = v250;
      if ((v27 & 1) == 0)
      {
LABEL_154:
        uint64_t v87 = [v49 iconSize];
        long long v51 = @"MultisizeImageRenditionSpec";
        if (v87) {
          goto LABEL_159;
        }
      }
LABEL_155:
      int v88 = objc_msgSend(v50, "identifier", v51);
      long long v51 = @"LayerStackRenditionSpec";
      if (v88 != 1002)
      {
        if (objc_msgSend(v50, "identifier", @"LayerStackRenditionSpec") == 1018) {
          long long v51 = @"LayerStackRenditionSpec";
        }
        else {
          long long v51 = @"SimpleArtworkRenditionSpec";
        }
      }
LABEL_159:
      id v89 = [(CoreThemeDocument *)self newObjectForEntity:v51];
      id v90 = v89;
      [v89 setProduction:v52];
      objc_msgSend(v89, "setPreserveForArchiveOnly:", objc_msgSend(v49, "preserveForArchiveOnly"));
      objc_opt_class();
      id v91 = v258;
      v256 = v52;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v89 setAsset:v258];
          if (v27)
          {
            int v27 = 1;
          }
          else
          {
            [v49 canvasSize];
            objc_msgSend(v89, "setCanvasSize:");
            v251 = v89;
            objc_msgSend(v89, "setCompressionType:", objc_msgSend(v253, "objectAtIndexedSubscript:", objc_msgSend(v49, "compressionType")));
            id v102 = objc_alloc_init(MEMORY[0x263EFF9B0]);
            long long v274 = 0u;
            long long v275 = 0u;
            long long v276 = 0u;
            long long v277 = 0u;
            v103 = (void *)[v49 layerReferences];
            uint64_t v104 = [v103 countByEnumeratingWithState:&v274 objects:v304 count:16];
            if (v104)
            {
              uint64_t v105 = v104;
              uint64_t v106 = *(void *)v275;
              do
              {
                for (uint64_t m = 0; m != v105; ++m)
                {
                  if (*(void *)v275 != v106) {
                    objc_enumerationMutation(v103);
                  }
                  v108 = *(void **)(*((void *)&v274 + 1) + 8 * m);
                  id v109 = [(CoreThemeDocument *)self newObjectForEntity:@"LayerReference"];
                  [v108 frame];
                  objc_msgSend(v109, "setFrameRect:", floor(v110), floor(v111));
                  objc_msgSend(v109, "setName:", objc_msgSend(v108, "layerName"));
                  v112 = *(void **)(v15 + 2584);
                  [v108 opacity];
                  objc_msgSend(v109, "setOpacity:", objc_msgSend(v112, "numberWithDouble:"));
                  objc_msgSend(v109, "setBlendMode:", objc_msgSend(*(id *)(v15 + 2584), "numberWithInt:", objc_msgSend(v108, "blendMode")));
                  objc_msgSend(v109, "setMakeOpaqueIfPossible:", objc_msgSend(v108, "makeOpaqueIfPossible"));
                  v113 = (void *)[obj filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name.name == %@", objc_msgSend(v108, "layerName"))];
                  if ([v113 count]
                    && ([v113 objectAtIndex:0], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                    && (uint64_t v114 = [v113 objectAtIndex:0]) != 0)
                  {
                    v115 = (void *)v114;
                    [v109 setReference:v114];
                    objc_msgSend(v115, "setMakeOpaqueIfPossible:", objc_msgSend(v109, "makeOpaqueIfPossible"));
                  }
                  else
                  {
                    [v262 addObject:v109];
                  }
                  [v102 addObject:v109];
                }
                uint64_t v105 = [v103 countByEnumeratingWithState:&v274 objects:v304 count:16];
              }
              while (v105);
            }
            id v89 = v251;
            [v251 setLayerReferences:v102];

            int v27 = 0;
            id v13 = a3;
            id v91 = v258;
            id v49 = v259;
            id v52 = v256;
          }
        }
        goto LABEL_214;
      }
      [v89 setAsset:v258];
      [v49 physicalSizeInMeters];
      if (v92 > 0.0 && v93 > 0.0)
      {
        id v94 = v89;
LABEL_169:
        objc_msgSend(v94, "setPhysicalSizeInMeters:", v92, v93);
        goto LABEL_171;
      }
      if (v92 == 0.0 && v93 == 0.0)
      {
        id v94 = v89;
        double v93 = v222;
        double v92 = v223;
        goto LABEL_169;
      }
      uint64_t v95 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v198 = [v258 name];
      v96 = (void *)v95;
      id v49 = v259;
      [v96 handleFailureInMethod:a2, self, @"CoreThemeDocument.m", 4344, @"%@ recognition image asset should have at both width/height in the physical size > 0", v198 object file lineNumber description];
LABEL_171:
      v312.origin.x = v33;
      v312.origin.y = v32;
      v312.size.unint64_t width = v31;
      v312.size.unint64_t height = v30;
      if (CGRectIsEmpty(v312))
      {
        if (v27) {
          goto LABEL_175;
        }
        [v49 alignmentRect];
        double v33 = v97;
        double v32 = v98;
        double v31 = v99;
        double v30 = v100;
      }
      objc_msgSend(v89, "setAlignmentRect:", v33, v32, v31, v30);
LABEL_175:
      if ([v28 count]) {
        [v89 setSlices:v28];
      }
      if ([v49 renditionType] == 1000)
      {
        if (![(CoreThemeDocument *)self featureEnabled:5]) {
          goto LABEL_212;
        }
        if ([v49 compressionType] == 2
          || ![v49 compressionType]
          || [v49 compressionType] == 1)
        {
          goto LABEL_211;
        }
        objc_msgSend(v89, "setCompressionType:", objc_msgSend(v253, "objectAtIndexedSubscript:", 0));
        if ([v49 compressionType] && objc_msgSend(v49, "compressionType") != 1)
        {
          uint64_t v199 = [v49 name];
          id v49 = v259;
          NSLog(&cfstr_CoreuiOnlyLoss.isa, v199, [v259 fileURL]);
        }
      }
      else
      {
        uint64_t v101 = [v49 compressionType];
        if ((unint64_t)(v101 - 4) >= 2)
        {
          if (v101 == 3)
          {
            if ([(CoreThemeDocument *)self featureEnabled:3]) {
              goto LABEL_211;
            }
          }
          else
          {
            if (v101 != 7 || [(CoreThemeDocument *)self featureEnabled:10])
            {
LABEL_211:
              uint64_t v120 = [v49 compressionType];
              uint64_t v119 = v253;
              goto LABEL_213;
            }
LABEL_208:
            if ([(CoreThemeDocument *)self featureEnabled:3])
            {
              uint64_t v119 = v253;
              uint64_t v120 = 3;
LABEL_213:
              objc_msgSend(v89, "setCompressionType:", objc_msgSend(v119, "objectAtIndexedSubscript:", v120));
              goto LABEL_214;
            }
          }
LABEL_212:
          uint64_t v119 = v253;
          uint64_t v120 = 0;
          goto LABEL_213;
        }
        if (![(CoreThemeDocument *)self featureEnabled:4]) {
          goto LABEL_208;
        }
        objc_msgSend(v89, "setCompressionType:", objc_msgSend(v253, "objectAtIndexedSubscript:", objc_msgSend(v49, "compressionType")));
        if ([(CoreThemeDocument *)self targetPlatform] == 1
          || [(CoreThemeDocument *)self targetPlatform] == 4
          || [(CoreThemeDocument *)self targetPlatform] == 3)
        {
          uint64_t v116 = [v226 objectAtIndexedSubscript:1];
          uint64_t v117 = (void *)[v89 keySpec];
          uint64_t v118 = v116;
          id v49 = v259;
          [v117 setTarget:v118];
        }
      }
LABEL_214:
      [v89 resetToBaseKeySpec];
      uint64_t v121 = (void *)[v89 keySpec];
      objc_msgSend(v121, "setScaleFactor:", objc_msgSend(v91, "scaleFactor"));
      if (![v52 preservesVectorRepresentation]
        || [v121 scaleFactor]
        || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "fileURLWithDocument:", self), "pathExtension"), "caseInsensitiveCompare:", @"PDF")&& (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "fileURLWithDocument:", self), "pathExtension"), "caseInsensitiveCompare:", @"SVG")|| objc_msgSend((id)objc_msgSend(v121, "glyphWeight"), "identifier")))
      {
        if (v27) {
          goto LABEL_220;
        }
      }
      else
      {
        objc_msgSend(v121, "setScaleFactor:", objc_msgSend(v91, "fileScaleFactor"));
        [v121 setPart:v220];
        if (v27)
        {
LABEL_220:
          objc_msgSend(v121, "setSubtype:", +[TDAsset subtypeFromImageFilename:](TDAsset, "subtypeFromImageFilename:", objc_msgSend(v91, "name")));
          id v52 = v256;
          uint64_t v122 = +[TDAsset idiomFromImageFilename:](TDAsset, "idiomFromImageFilename:", [v91 name]);
          goto LABEL_223;
        }
      }
      objc_msgSend(v121, "setSubtype:", objc_msgSend(v49, "subtype"));
      uint64_t v122 = [v49 idiom];
LABEL_223:
      v123 = (void *)[v246 objectAtIndex:v122];
      [v121 setIdiom:v123];
      if ([v123 identifier] == 6) {
        [v52 setMakeOpaqueIfPossible:1];
      }
      if (!v27)
      {
        objc_msgSend(v121, "setGamut:", objc_msgSend(v245, "objectAtIndexedSubscript:", objc_msgSend(v259, "displayGamut")));
        uint64_t v126 = objc_msgSend(v244, "objectAtIndexedSubscript:", objc_msgSend(v259, "sizeClassHorizontal"));
        uint64_t v127 = objc_msgSend(v244, "objectAtIndexedSubscript:", objc_msgSend(v259, "sizeClassVertical"));
        uint64_t v128 = v126;
        v125 = v259;
        [v121 setSizeClassHorizontal:v128];
        [v121 setSizeClassVertical:v127];
        objc_msgSend(v121, "setMemoryClass:", objc_msgSend(v259, "memoryClass"));
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v129 = [v89 compressionType];
          uint64_t v124 = v253;
          uint64_t v14 = v254;
          if (v129 == [v253 objectAtIndexedSubscript:4]
            || (uint64_t v130 = [v89 compressionType], v130 == objc_msgSend(v253, "objectAtIndexedSubscript:", 5)))
          {
            id v12 = a4;
            v125 = v259;
            if (![(CoreThemeDocument *)self targetPlatform]) {
              goto LABEL_243;
            }
            if ([(CoreThemeDocument *)self targetPlatform] == 2) {
              goto LABEL_243;
            }
            objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", 2));
            if ([(CoreThemeDocument *)self targetPlatform] != 1) {
              goto LABEL_243;
            }
            uint64_t v132 = v226;
            uint64_t v133 = 1;
          }
          else
          {
            uint64_t v131 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "asset"), "fileURLWithDocument:", self), "pathExtension");
            if ([v131 caseInsensitiveCompare:@"HEIF"]
              && [v131 caseInsensitiveCompare:@"HEIC"])
            {
              objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", objc_msgSend(v259, "graphicsFeatureSetClass")));
              v125 = v259;
              objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", objc_msgSend(v259, "graphicsFeatureSetClass")));
              id v12 = a4;
LABEL_243:
              if ([v125 appearanceName])
              {
                uint64_t v134 = [v125 appearanceIdentifier];
                uint64_t v135 = [v259 appearanceName];
                uint64_t v136 = v134;
                v125 = v259;
                objc_msgSend(v121, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", v136, v135, 1));
              }
              if ([v125 localizationName])
              {
                uint64_t v137 = [v125 localizationIdentifier];
                uint64_t v138 = [v259 localizationName];
                uint64_t v139 = v137;
                v125 = v259;
                objc_msgSend(v121, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", v139, v138, 1));
              }
              objc_msgSend(v121, "setDirection:", objc_msgSend(v236, "objectAtIndexedSubscript:", objc_msgSend(v125, "layoutDirection")));
              goto LABEL_248;
            }
            id v12 = a4;
            v125 = v259;
            if ([(CoreThemeDocument *)self targetPlatform] != 1
              && [(CoreThemeDocument *)self targetPlatform] != 4
              && [(CoreThemeDocument *)self targetPlatform] != 3)
            {
              goto LABEL_243;
            }
            uint64_t v132 = v226;
            uint64_t v133 = 2;
          }
          objc_msgSend(v121, "setTarget:", objc_msgSend(v132, "objectAtIndexedSubscript:", v133));
          goto LABEL_243;
        }
        objc_msgSend(v121, "setGraphicsFeatureSetClass:", objc_msgSend(v232, "objectAtIndexedSubscript:", objc_msgSend(v259, "graphicsFeatureSetClass")));
        id v12 = a4;
        uint64_t v124 = v253;
        uint64_t v14 = v254;
        goto LABEL_243;
      }
      objc_msgSend(v121, "setGamut:", objc_msgSend(v245, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v121, "setSizeClassHorizontal:", objc_msgSend(v244, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v121, "setSizeClassVertical:", objc_msgSend(v244, "objectAtIndexedSubscript:", 0));
      id v12 = a4;
      uint64_t v124 = v253;
      uint64_t v14 = v254;
      v125 = v259;
LABEL_248:
      if ([v125 iconSize])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v140 = (void *)[v256 sizeIndexes];
            v273[0] = MEMORY[0x263EF8330];
            v273[1] = 3221225472;
            v273[2] = __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke;
            v273[3] = &unk_264C44A10;
            v273[4] = v125;
            v141 = objc_msgSend((id)objc_msgSend(v140, "objectsPassingTest:", v273), "anyObject");
            if (v141)
            {
              id v142 = v141;
              objc_msgSend(v121, "setDimension2:", objc_msgSend(v141, "index"));
              [v89 setSizeIndex:v142];
            }
            uint64_t v143 = (void *)[v256 multisizeImageSetRenditions];
            v272[0] = MEMORY[0x263EF8330];
            v272[1] = 3221225472;
            v272[2] = __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke_2;
            v272[3] = &unk_264C44A10;
            v272[4] = v121;
            uint64_t v144 = objc_msgSend((id)objc_msgSend(v143, "objectsPassingTest:", v272), "anyObject");
            if (v144)
            {
              [v89 setMultisizeImageSetRendition:v144];
              v125 = v259;
            }
            else
            {
              id v145 = [(CoreThemeDocument *)self newObjectForEntity:@"MultisizeImageSetRenditionSpec"];
              [v145 setRenditionType:v218];
              id v146 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
              [v146 setElement:v243];
              [v146 setPart:v219];
              objc_msgSend(v146, "setNameIdentifier:", objc_msgSend(v259, "nameIdentifier"));
              objc_msgSend(v146, "setIdiom:", objc_msgSend(v121, "idiom"));
              objc_msgSend(v146, "setSubtype:", objc_msgSend(v121, "subtype"));
              [v145 setKeySpec:v146];

              [v145 setProduction:v256];
              [v89 setMultisizeImageSetRendition:v145];
              v147 = v145;
              v125 = v259;
              id v13 = a3;
              [v147 setMultisizeImageSetProduction:v256];
            }
            uint64_t v124 = v253;
          }
        }
      }
      objc_msgSend(v89, "setPreserveForArchiveOnly:", objc_msgSend(v125, "preserveForArchiveOnly"));
      if ([(CoreThemeDocument *)self targetPlatform])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v148 = [v89 compressionType];
          if ((v148 == [v124 objectAtIndexedSubscript:4]
             || (uint64_t v149 = [v89 compressionType],
                 v149 == [v124 objectAtIndexedSubscript:5]))
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "keySpec"), "target"), "identifier") == 1)
          {
            id v150 = [(CoreThemeDocument *)self newObjectForEntity:@"SimpleArtworkRenditionSpec"];
            [v150 setProduction:v256];
            objc_msgSend(v150, "setAsset:", objc_msgSend(v89, "asset"));
            [v89 alignmentRect];
            objc_msgSend(v150, "setAlignmentRect:");
            objc_msgSend(v150, "setSlices:", objc_msgSend(v89, "slices"));
            [v150 setIsBackstop:1];
            [v89 copyAttributesInto:v150];
            if ([(CoreThemeDocument *)self featureEnabled:3]) {
              uint64_t v151 = 3;
            }
            else {
              uint64_t v151 = 0;
            }
            objc_msgSend(v150, "setCompressionType:", objc_msgSend(v124, "objectAtIndexedSubscript:", v151));
            if (objc_msgSend((id)objc_msgSend(v150, "compressionType"), "identifier") == 3)
            {
              objc_msgSend(v150, "setAllowsHevcCompression:", -[CoreThemeDocument shouldAllowHevcCompression](self, "shouldAllowHevcCompression"));
            }
            else if (!objc_msgSend((id)objc_msgSend(v150, "compressionType"), "identifier"))
            {
              objc_msgSend(v150, "setAllowsPaletteImageCompression:", -[CoreThemeDocument shouldAllowPaletteImageCompression](self, "shouldAllowPaletteImageCompression"));
              objc_msgSend(v150, "setAllowsDeepmapCompression:", -[CoreThemeDocument shouldAllowDeepmapCompression](self, "shouldAllowDeepmapCompression"));
              objc_msgSend(v150, "setAllowsDeepmap2Compression:", -[CoreThemeDocument shouldAllowDeepmap2Compression](self, "shouldAllowDeepmap2Compression"));
            }
            [v150 resetToBaseKeySpec];
            double v155 = (void *)[v150 keySpec];
            objc_msgSend(v155, "setIdiom:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "idiom"));
            objc_msgSend(v155, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "scaleFactor"));
            objc_msgSend(v155, "setSubtype:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "subtype"));
            objc_msgSend(v155, "setGamut:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "gamut"));
            objc_msgSend(v155, "setSizeClassHorizontal:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassHorizontal"));
            objc_msgSend(v155, "setSizeClassVertical:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassVertical"));
            objc_msgSend(v155, "setMemoryClass:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "memoryClass"));
            objc_msgSend(v155, "setDirection:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "direction"));
            [v155 setGraphicsFeatureSetClass:0];
            if (([v150 allowsPaletteImageCompression] & 1) != 0
              || ([v150 allowsHevcCompression] & 1) != 0
              || [v150 allowsDeepmapCompression])
            {
              objc_msgSend((id)objc_msgSend(v150, "keySpec"), "setTarget:", -[CoreThemeDocument deploymentTargetWithIdentifier:](self, "deploymentTargetWithIdentifier:", 3));
            }
            if ([v150 allowsDeepmap2Compression]) {
              objc_msgSend((id)objc_msgSend(v150, "keySpec"), "setTarget:", -[CoreThemeDocument deploymentTargetWithIdentifier:](self, "deploymentTargetWithIdentifier:", 5));
            }

            id v12 = a4;
          }
          else
          {
            v152 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "asset"), "fileURLWithDocument:", self), "pathExtension");
            if ((![v152 caseInsensitiveCompare:@"HEIF"]
               || ![v152 caseInsensitiveCompare:@"HEIC"])
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "keySpec"), "target"), "identifier") == 2)
            {
              id v153 = [(CoreThemeDocument *)self newObjectForEntity:@"SimpleArtworkRenditionSpec"];
              [v153 setProduction:v256];
              [v153 resetToBaseKeySpec];
              double v154 = (void *)[v153 keySpec];
              objc_msgSend(v153, "setAsset:", objc_msgSend(v89, "asset"));
              [v89 alignmentRect];
              objc_msgSend(v153, "setAlignmentRect:");
              objc_msgSend(v153, "setSlices:", objc_msgSend(v89, "slices"));
              objc_msgSend(v153, "setCompressionType:", objc_msgSend(v124, "objectAtIndexedSubscript:", 3));
              [v153 setIsBackstop:1];
              objc_msgSend(v154, "setIdiom:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "idiom"));
              objc_msgSend(v154, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "scaleFactor"));
              objc_msgSend(v154, "setSubtype:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "subtype"));
              objc_msgSend(v154, "setGamut:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "gamut"));
              objc_msgSend(v154, "setSizeClassHorizontal:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassHorizontal"));
              objc_msgSend(v154, "setSizeClassVertical:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "sizeClassVertical"));
              objc_msgSend(v154, "setMemoryClass:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "memoryClass"));
              objc_msgSend(v154, "setDirection:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "direction"));
              [v154 setGraphicsFeatureSetClass:0];
              objc_msgSend(v154, "setAppearance:", objc_msgSend((id)objc_msgSend(v89, "keySpec"), "appearance"));
              objc_msgSend(v154, "setTarget:", objc_msgSend(v226, "objectAtIndexedSubscript:", 0));
            }
          }
        }
      }
LABEL_280:
      if (++v14 >= (unint64_t)[v13 count]) {
        goto LABEL_313;
      }
    }
    if (v20 == v247) {
      uint64_t v25 = [0 name];
    }
    else {
LABEL_15:
    }
      uint64_t v25 = [v20 baseName];
    uint64_t v24 = v25;
    double v23 = 0;
LABEL_28:
    id v28 = 0;
    int v27 = 1;
    double v30 = v19;
    double v31 = v18;
    double v32 = v17;
    double v33 = v16;
    goto LABEL_29;
  }
LABEL_313:
  [(CoreThemeDocument *)self _removeRedundantPDFBasedRenditionsForAssets:v13];
  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  uint64_t v181 = [v262 countByEnumeratingWithState:&v268 objects:v303 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v269;
    do
    {
      for (uint64_t n = 0; n != v182; ++n)
      {
        if (*(void *)v269 != v183) {
          objc_enumerationMutation(v262);
        }
        v185 = *(void **)(*((void *)&v268 + 1) + 8 * n);
        id v186 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"NamedArtworkProduction", [MEMORY[0x263F08A98] predicateWithFormat:@"name.name == %@", objc_msgSend(v185, "name")], 0);
        if ([v186 count]
          && ([v186 objectAtIndex:0], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v187 = (void *)[v186 objectAtIndex:0];
        }
        else
        {
          NSLog(&cfstr_CouldnTResolve.isa, [v185 name], objc_msgSend((id)objc_msgSend((id)objc_msgSend(v185, "stack"), "production"), "name"));
          v187 = 0;
        }
        [v185 setReference:v187];
        objc_msgSend(v187, "setMakeOpaqueIfPossible:", objc_msgSend(v185, "makeOpaqueIfPossible"));
      }
      uint64_t v182 = [v262 countByEnumeratingWithState:&v268 objects:v303 count:16];
    }
    while (v182);
  }

  if (self->_explicitlyPackedIdentifiers)
  {
    id v188 = [(CoreThemeDocument *)self allObjectsForEntity:@"NamedElement" withSortDescriptors:0];
    long long v264 = 0u;
    long long v265 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    long long v189 = (void *)[(NSMutableDictionary *)self->_explicitlyPackedIdentifiers allKeys];
    uint64_t v190 = [v189 countByEnumeratingWithState:&v264 objects:v302 count:16];
    if (v190)
    {
      uint64_t v191 = v190;
      uint64_t v192 = *(void *)v265;
      do
      {
        for (iuint64_t i = 0; ii != v191; ++ii)
        {
          if (*(void *)v265 != v192) {
            objc_enumerationMutation(v189);
          }
          uint64_t v194 = *(void *)(*((void *)&v264 + 1) + 8 * ii);
          id v195 = (id)[(NSMutableDictionary *)self->_explicitlyPackedIdentifiers objectForKey:v194];
          [(NSMutableDictionary *)self->_explicitlyPackedIdentifiers removeObjectForKey:v194];
          long long v196 = (void *)[(id)objc_msgSend(v188 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name == %@", v194)), "firstObject"];
          if (v196) {
            -[NSMutableDictionary setObject:forKey:](self->_explicitlyPackedIdentifiers, "setObject:forKey:", v195, [v196 identifier]);
          }
          else {
            NSLog(&cfstr_Corethemedefin_2.isa, v194);
          }
        }
        uint64_t v191 = [v189 countByEnumeratingWithState:&v264 objects:v302 count:16];
      }
      while (v191);
    }
  }
  return v242;
}

BOOL __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "iconSize"), "sizeValue");
  double v4 = v3;
  return [a2 height] == (int)v5 && objc_msgSend(a2, "width") == (int)v4;
}

BOOL __78__CoreThemeDocument_createNamedArtworkProductionsForAssets_customInfos_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) idiom];
  BOOL result = 0;
  if (v4 == objc_msgSend((id)objc_msgSend(a2, "keySpec"), "idiom"))
  {
    int v5 = [*(id *)(a1 + 32) subtype];
    if (v5 == objc_msgSend((id)objc_msgSend(a2, "keySpec"), "subtype")) {
      return 1;
    }
  }
  return result;
}

- (void)createNamedTexturesForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6
{
  v101[1] = *MEMORY[0x263EF8340];
  id v70 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41, a4, a5, a6);
  id v66 = [(CoreThemeDocument *)self partWithIdentifier:181];
  v101[0] = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"mipLevel" ascending:0];
  uint64_t v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:1];
  id v76 = [(CoreThemeDocument *)self compressionTypes];
  id v75 = [(CoreThemeDocument *)self idioms];
  id v74 = [(CoreThemeDocument *)self sizeClasses];
  id v73 = [(CoreThemeDocument *)self displayGamuts];
  id v72 = [(CoreThemeDocument *)self directions];
  id v71 = [(CoreThemeDocument *)self featureSetClasses];
  id v62 = [(CoreThemeDocument *)self textureFaces];
  if ([(CoreThemeDocument *)self featureEnabled:8])
  {
    id v56 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1007];
    id v55 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:10];
    id v61 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v7 = [(CoreThemeDocument *)self objectsForEntity:@"Tag" withPredicate:0 sortDescriptors:0];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v93 objects:v100 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v94 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v61, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", *(void *)(*((void *)&v93 + 1) + 8 * i)), objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * i), "identifier"));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v93 objects:v100 count:16];
      }
      while (v9);
    }
    uint64_t v59 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"NamedTextureProduction", 0, 0));
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v58 = [a3 countByEnumeratingWithState:&v89 objects:v99 count:16];
    if (v58)
    {
      uint64_t v57 = *(void *)v90;
      id v65 = (void *)*MEMORY[0x263EFFD08];
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v90 != v57) {
            objc_enumerationMutation(a3);
          }
          uint64_t v60 = v12;
          id v13 = *(void **)(*((void *)&v89 + 1) + 8 * v12);
          uint64_t v14 = (void *)[v59 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name.name == %@", objc_msgSend(v13, "name"))];
          if ([v14 firstObject]
            && ([v14 firstObject], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v15 = (id)[v14 firstObject];
          }
          else
          {
            id v15 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedTextureProduction"];
            id v16 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v13 nameIdentifier]);
            objc_msgSend(v16, "setName:", objc_msgSend(v13, "name"));
            [v16 setProduction:v15];
            id v17 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
            [v15 setBaseKeySpec:v17];
            [v17 setElement:v70];
            objc_msgSend(v17, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v16, "identifier"), "unsignedIntValue"));
            objc_msgSend(v15, "setDateOfLastChange:", objc_msgSend(v13, "modificationDate"));
            objc_msgSend(v15, "setOptOutOfThinning:", objc_msgSend(v13, "optOutOfThinning"));
            objc_msgSend(v15, "setTextureInterpretation:", -[CoreThemeDocument textureInterpretaitionWithIdentifier:](self, "textureInterpretaitionWithIdentifier:", objc_msgSend(v13, "textureInterpretation")));
            [v15 setRenditionType:v56];
            [v15 setRenditionSubtype:v55];

            [v59 addObject:v15];
            if (v13)
            {
              double v18 = (void *)[v13 tags];
              if ([v18 count])
              {
                id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                long long v85 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                long long v88 = 0u;
                uint64_t v20 = [v18 countByEnumeratingWithState:&v85 objects:v98 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v86;
                  id v68 = v18;
                  do
                  {
                    for (uint64_t j = 0; j != v21; ++j)
                    {
                      if (*(void *)v86 != v22) {
                        objc_enumerationMutation(v68);
                      }
                      uint64_t v24 = *(void *)(*((void *)&v85 + 1) + 8 * j);
                      uint64_t v25 = (void *)[v61 objectForKey:v24];
                      if ([v25 count])
                      {
                        if ([v25 count] != 1) {
                          objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 4917, @"We should ONLY have 1 tag with a name, tag names need to be Unique");
                        }
                        id v26 = (id)[v25 objectAtIndex:0];
                      }
                      else
                      {
                        id v26 = [(CoreThemeDocument *)self newObjectForEntity:@"Tag"];
                        [v26 setIdentifier:v24];
                        objc_msgSend(v61, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v26), v24);
                      }
                      [v19 addObject:v26];
                    }
                    double v18 = v68;
                    uint64_t v21 = [v68 countByEnumeratingWithState:&v85 objects:v98 count:16];
                  }
                  while (v21);
                }
                [v15 addTags:v19];
                uint64_t v27 = [v18 count];
                if (v27 != [v19 count]) {
                  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 4924, @"Supplied tags should always equal the count of tags on the production else the counts are wrong");
                }
              }
              if (objc_msgSend((id)objc_msgSend(v13, "universalTypeIdentifier"), "length")) {
                objc_msgSend(v15, "setUniversalTypeIdentifier:", objc_msgSend(v13, "universalTypeIdentifier"));
              }
            }
          }
          id v28 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureRenditionSpec"];
          [v28 setProduction:v15];
          objc_msgSend(v28, "setPixelFormat:", -[CoreThemeDocument pixelFormatWithIdentifier:](self, "pixelFormatWithIdentifier:", objc_msgSend(v13, "texturePixelFormat")));
          objc_msgSend(v28, "setCompressionType:", objc_msgSend(v76, "objectAtIndexedSubscript:", 0));
          -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", [v13 compressionType]);
          objc_msgSend(v28, "setCubeMap:", objc_msgSend(v13, "cubeMap"));
          objc_msgSend(v28, "setWidth:", objc_msgSend(v13, "textureWidth"));
          objc_msgSend(v28, "setHeight:", objc_msgSend(v13, "textureHeight"));
          [v28 resetToBaseKeySpec];
          objc_msgSend(v28, "setPreserveForArchiveOnly:", objc_msgSend(v13, "preserveForArchiveOnly"));
          id v29 = (void *)[v28 keySpec];
          objc_msgSend(v29, "setIdiom:", objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v13, "idiom")));
          objc_msgSend(v29, "setScaleFactor:", objc_msgSend(v13, "scaleFactor"));
          objc_msgSend(v29, "setSubtype:", objc_msgSend(v13, "subtype"));
          objc_msgSend(v29, "setGamut:", objc_msgSend(v73, "objectAtIndexedSubscript:", objc_msgSend(v13, "displayGamut")));
          objc_msgSend(v29, "setSizeClassHorizontal:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassHorizontal")));
          objc_msgSend(v29, "setSizeClassVertical:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassVertical")));
          objc_msgSend(v29, "setMemoryClass:", objc_msgSend(v13, "memoryClass"));
          objc_msgSend(v29, "setDirection:", objc_msgSend(v72, "objectAtIndexedSubscript:", objc_msgSend(v13, "layoutDirection")));
          objc_msgSend(v29, "setGraphicsFeatureSetClass:", objc_msgSend(v71, "objectAtIndexedSubscript:", objc_msgSend(v13, "graphicsFeatureSetClass")));
          objc_msgSend(v29, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v13, "appearanceIdentifier"), objc_msgSend(v13, "appearanceName"), 1));
          objc_msgSend(v29, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v13, "localizationIdentifier"), objc_msgSend(v13, "localizationName"), 1));
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v64 = (id)[v13 textureInfos];
          uint64_t v30 = [v64 countByEnumeratingWithState:&v81 objects:v97 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            id v69 = *(id *)v82;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(id *)v82 != v69) {
                  objc_enumerationMutation(v64);
                }
                double v33 = *(void **)(*((void *)&v81 + 1) + 8 * k);
                int v78 = 0;
                id v77 = a5;
                uint64_t v79 = 0;
                uint64_t v80 = 0;
                id v34 = (void *)[v33 fileURL];
                uint64_t v35 = [v33 flipped];
                if (v34) {
                  BOOL v36 = v34 == v65;
                }
                else {
                  BOOL v36 = 1;
                }
                if (!v36)
                {
                  uint64_t v39 = v35;
                  [(CoreThemeDocument *)self _getFilename:&v80 scaleFactor:&v78 category:&v79 bitSource:&v77 forFileURL:v34];
LABEL_47:
                  uint64_t v40 = (void *)[v34 pathComponents];
                  uint64_t UncommonItemInArrays = indexOfFirstUncommonItemInArrays(objc_msgSend((id)objc_msgSend(v77, "fileURLWithDocument:", self), "pathComponents"), v40);
                  uint64_t v42 = objc_msgSend(v40, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v40, "count") + ~UncommonItemInArrays);
                  uint64_t v79 = [NSString pathWithComponents:v42];
                  goto LABEL_48;
                }
                uint64_t v37 = (void *)[v13 textureInfos];
                uint64_t v38 = objc_msgSend((id)objc_msgSend(v37, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(mipLevel < %d) AND (fileURL != nil) AND (textureFace = %d)", objc_msgSend(v33, "mipLevel"), objc_msgSend(v33, "textureFace"))), "sortedArrayUsingDescriptors:", v63);
                id v34 = objc_msgSend((id)objc_msgSend(v38, "firstObject"), "fileURL");
                uint64_t v39 = objc_msgSend((id)objc_msgSend(v38, "firstObject"), "flipped");
                [(CoreThemeDocument *)self _getFilename:&v80 scaleFactor:&v78 category:&v79 bitSource:&v77 forFileURL:v34];
                if (v34) {
                  goto LABEL_47;
                }
LABEL_48:
                uint64_t v43 = v80;
                uint64_t v44 = [v13 scaleFactor];
                id v45 = [(CoreThemeDocument *)self createAssetWithName:v43 fileType:@"texture" scaleFactor:v44 inCategory:v79 forThemeBitSource:v77];
                id v46 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureImageRenditionSpec"];
                objc_msgSend(v46, "setPreserveForArchiveOnly:", objc_msgSend(v13, "preserveForArchiveOnly"));
                if (([v13 compressionType] & 0xFFFFFFFFFFFFFFFELL) == 4
                  && ![(CoreThemeDocument *)self featureEnabled:4])
                {
                  if ([(CoreThemeDocument *)self featureEnabled:3]) {
                    uint64_t v47 = 3;
                  }
                  else {
                    uint64_t v47 = 0;
                  }
                }
                else
                {
                  uint64_t v47 = [v13 compressionType];
                }
                objc_msgSend(v46, "setCompressionType:", objc_msgSend(v76, "objectAtIndexedSubscript:", v47));
                [v46 setProduction:v15];
                [v46 setAsset:v45];
                [v46 setFlipped:v39];
                uint64_t v48 = (__int16)[v33 mipLevel];
                if ((int)[v28 width] >> v48 < 2) {
                  uint64_t v49 = 1;
                }
                else {
                  uint64_t v49 = ((int)[v28 width] >> v48);
                }
                [v46 setWidth:v49];
                if ((int)[v28 height] >> v48 < 2) {
                  uint64_t v50 = 1;
                }
                else {
                  uint64_t v50 = ((int)[v28 height] >> v48);
                }
                [v46 setHeight:v50];
                id v51 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureMipLevel"];
                if ([v13 cubeMap]) {
                  objc_msgSend(v51, "setFace:", objc_msgSend(v62, "objectAtIndexedSubscript:", objc_msgSend(v33, "textureFace")));
                }
                [v51 setLevel:v48];
                [v51 setTextureImage:v46];
                [v28 addMipLevelsObject:v51];

                id v52 = (void *)[v46 keySpec];
                [v52 setElement:v70];
                [v52 setPart:v66];
                objc_msgSend(v52, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v15, "baseKeySpec"), "nameIdentifier"));
                objc_msgSend(v52, "setIdiom:", objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v13, "idiom")));
                objc_msgSend(v52, "setScaleFactor:", objc_msgSend(v13, "scaleFactor"));
                objc_msgSend(v52, "setSubtype:", objc_msgSend(v13, "subtype"));
                objc_msgSend(v52, "setGamut:", objc_msgSend(v73, "objectAtIndexedSubscript:", objc_msgSend(v13, "displayGamut")));
                objc_msgSend(v52, "setSizeClassHorizontal:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassHorizontal")));
                objc_msgSend(v52, "setSizeClassVertical:", objc_msgSend(v74, "objectAtIndexedSubscript:", objc_msgSend(v13, "sizeClassVertical")));
                objc_msgSend(v52, "setMemoryClass:", objc_msgSend(v13, "memoryClass"));
                objc_msgSend(v52, "setDirection:", objc_msgSend(v72, "objectAtIndexedSubscript:", objc_msgSend(v13, "layoutDirection")));
                objc_msgSend(v52, "setGraphicsFeatureSetClass:", objc_msgSend(v71, "objectAtIndexedSubscript:", objc_msgSend(v13, "graphicsFeatureSetClass")));
                objc_msgSend(v52, "setDimension2:", objc_msgSend(v33, "mipLevel"));
                objc_msgSend(v52, "setAppearance:", objc_msgSend((id)objc_msgSend(v28, "keySpec"), "appearance"));
              }
              uint64_t v31 = [v64 countByEnumeratingWithState:&v81 objects:v97 count:16];
            }
            while (v31);
          }

          uint64_t v12 = v60 + 1;
        }
        while (v60 + 1 != v58);
        uint64_t v58 = [a3 countByEnumeratingWithState:&v89 objects:v99 count:16];
      }
      while (v58);
    }
  }
}

- (void)createNamedModelsForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6
{
  id v6 = a5;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v8 = -[CoreThemeDocument renditionTypeWithIdentifier:](self, "renditionTypeWithIdentifier:", 1011, a4, a5, a6);
  id v44 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:10];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v10 = [(CoreThemeDocument *)self objectsForEntity:@"Tag" withPredicate:0 sortDescriptors:0];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v66 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", *(void *)(*((void *)&v65 + 1) + 8 * i)), objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "identifier"));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v12);
  }
  uint64_t v49 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"ModelIOProduction", 0, 0));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v15 = v44;
  uint64_t v48 = [a3 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v62;
    id v42 = v8;
    id v43 = v6;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(a3);
        }
        uint64_t v51 = v16;
        id v17 = *(void **)(*((void *)&v61 + 1) + 8 * v16);
        int v58 = 0;
        id v57 = v6;
        uint64_t v59 = 0;
        uint64_t v60 = 0;
        uint64_t v50 = [v17 fileURL];
        double v18 = (void *)[v49 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name.name == %@", objc_msgSend(v17, "name"))];
        if ([v18 firstObject])
        {
          [v18 firstObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v52 = (void *)[v18 firstObject];
LABEL_35:
            double v32 = (void *)v50;
            goto LABEL_36;
          }
        }
        id v19 = [(CoreThemeDocument *)self newObjectForEntity:@"ModelIOProduction"];
        id v20 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v17 nameIdentifier]);
        objc_msgSend(v20, "setName:", objc_msgSend(v17, "name"));
        [v20 setProduction:v19];
        id v21 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
        objc_msgSend(v21, "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 164));
        objc_msgSend(v21, "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 60));
        objc_msgSend(v21, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v20, "identifier"), "unsignedIntValue"));
        [v19 setBaseKeySpec:v21];
        objc_msgSend(v19, "setDateOfLastChange:", objc_msgSend(v17, "modificationDate"));
        [v19 setRenditionType:v8];
        [v19 setRenditionSubtype:v15];

        id v52 = v19;
        [v49 addObject:v19];
        if (!v17) {
          goto LABEL_35;
        }
        uint64_t v22 = (void *)[v17 tags];
        if ([v22 count])
        {
          id v46 = v17;
          id v23 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v69 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v54;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v54 != v26) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v28 = *(void *)(*((void *)&v53 + 1) + 8 * j);
                id v29 = (void *)[v9 objectForKey:v28];
                if ([v29 count])
                {
                  if ([v29 count] != 1) {
                    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 5169, @"We should ONLY have 1 tag with a name, tag names need to be Unique");
                  }
                  id v30 = (id)[v29 objectAtIndex:0];
                }
                else
                {
                  id v30 = [(CoreThemeDocument *)self newObjectForEntity:@"Tag"];
                  [v30 setIdentifier:v28];
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v30), v28);
                }
                [v23 addObject:v30];
              }
              uint64_t v25 = [v22 countByEnumeratingWithState:&v53 objects:v69 count:16];
            }
            while (v25);
          }
          [v52 addTags:v23];
          uint64_t v31 = [v22 count];
          if (v31 != [v23 count]) {
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 5176, @"Supplied tags should always equal the count of tags on the production else the counts are wrong");
          }

          id v8 = v42;
          id v6 = v43;
          id v15 = v44;
          id v17 = v46;
        }
        double v32 = (void *)v50;
        if (objc_msgSend((id)objc_msgSend(v17, "universalTypeIdentifier"), "length")) {
          objc_msgSend(v52, "setUniversalTypeIdentifier:", objc_msgSend(v17, "universalTypeIdentifier"));
        }
LABEL_36:
        [(CoreThemeDocument *)self _getFilename:&v60 scaleFactor:&v58 category:&v59 bitSource:&v57 forFileURL:v32];
        if (v32)
        {
          double v33 = (void *)[v32 pathComponents];
          uint64_t UncommonItemInArrays = indexOfFirstUncommonItemInArrays(objc_msgSend((id)objc_msgSend(v57, "fileURLWithDocument:", self), "pathComponents"), v33);
          uint64_t v35 = objc_msgSend(v33, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v33, "count") + ~UncommonItemInArrays);
          uint64_t v59 = [NSString pathWithComponents:v35];
        }
        uint64_t v36 = v60;
        uint64_t v37 = [v17 scaleFactor];
        id v38 = [(CoreThemeDocument *)self createAssetWithName:v36 fileType:@"model" scaleFactor:v37 inCategory:v59 forThemeBitSource:v57];
        id v39 = [(CoreThemeDocument *)self newObjectForEntity:@"ModelIORenditionSpec"];
        [v39 setAsset:v38];
        [v39 setProduction:v52];
        objc_msgSend(v39, "setPreserveForArchiveOnly:", objc_msgSend(v17, "preserveForArchiveOnly"));
        [v39 resetToBaseKeySpec];
        uint64_t v40 = (void *)[v39 keySpec];
        objc_msgSend(v40, "setIdiom:", -[CoreThemeDocument idiomWithIdentifier:](self, "idiomWithIdentifier:", objc_msgSend(v17, "idiom")));
        objc_msgSend(v40, "setScaleFactor:", objc_msgSend(v17, "scaleFactor"));
        objc_msgSend(v40, "setSubtype:", objc_msgSend(v17, "subtype"));
        objc_msgSend(v40, "setGamut:", -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", objc_msgSend(v17, "displayGamut")));
        objc_msgSend(v40, "setSizeClassHorizontal:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v17, "sizeClassHorizontal")));
        objc_msgSend(v40, "setSizeClassVertical:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v17, "sizeClassVertical")));
        objc_msgSend(v40, "setMemoryClass:", objc_msgSend(v17, "memoryClass"));
        objc_msgSend(v40, "setDirection:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", objc_msgSend(v17, "layoutDirection")));
        objc_msgSend(v40, "setGraphicsFeatureSetClass:", -[CoreThemeDocument graphicsFeatureSetClassWithIdentifier:](self, "graphicsFeatureSetClassWithIdentifier:", objc_msgSend(v17, "graphicsFeatureSetClass")));
        objc_msgSend(v40, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v17, "appearanceIdentifier"), objc_msgSend(v17, "appearanceName"), 1));
        objc_msgSend(v40, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v17, "localizationIdentifier"), objc_msgSend(v17, "localizationName"), 1));

        uint64_t v16 = v51 + 1;
      }
      while (v51 + 1 != v48);
      uint64_t v48 = [a3 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v48);
  }
}

- (void)createNamedRecognitionObjectsForAssets:(id)a3 customInfos:(id)a4 error:(id *)a5
{
  id v5 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v36 = -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 85, a4, a5);
  id v39 = [(CoreThemeDocument *)self partWithIdentifier:207];
  id v38 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1014];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = [(CoreThemeDocument *)self objectsForEntity:@"Tag" withPredicate:0 sortDescriptors:0];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", *(void *)(*((void *)&v48 + 1) + 8 * i)), objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "identifier"));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v10);
  }
  uint64_t v41 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"RecognitionObjectProduction", 0, 0));
  id v14 = v36;
  id v13 = a3;
  if ([v5 count])
  {
    unint64_t v15 = 0;
    id v35 = v5;
    do
    {
      uint64_t v16 = (void *)[v5 objectAtIndex:v15];
      id v17 = (void *)[v41 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name.name == %@", objc_msgSend(v16, "name"))];
      id v43 = v16;
      if ([v17 firstObject]
        && ([v17 firstObject], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v18 = (void *)[v17 firstObject];
      }
      else
      {
        id v42 = [(CoreThemeDocument *)self newObjectForEntity:@"RecognitionObjectProduction"];
        unint64_t v40 = v15;
        if ([v16 nameIdentifier]) {
          id v19 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v16 nameIdentifier]);
        }
        else {
          id v19 = [(CoreThemeDocument *)self _createNamedElementWithNextAvailableIdentifier];
        }
        id v20 = v19;
        objc_msgSend(v19, "setName:", objc_msgSend(v16, "name"));
        double v18 = v42;
        [v20 setProduction:v42];
        id v21 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
        [v42 setBaseKeySpec:v21];
        [v21 setElement:v14];
        [v21 setPart:v39];
        objc_msgSend(v21, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v20, "identifier"), "unsignedIntValue"));
        objc_msgSend(v42, "setDateOfLastChange:", objc_msgSend(v16, "modificationDate"));
        [v42 setRenditionType:v38];

        [v41 addObject:v42];
        if (v16)
        {
          uint64_t v22 = (void *)[v16 tags];
          if ([v22 count])
          {
            id v23 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v45 != v26) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                  id v29 = (void *)[v7 objectForKey:v28];
                  if ([v29 count])
                  {
                    if ([v29 count] != 1) {
                      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 5307, @"We should ONLY have 1 tag with a name, tag names need to be Unique");
                    }
                    id v30 = (id)[v29 objectAtIndex:0];
                  }
                  else
                  {
                    id v30 = [(CoreThemeDocument *)self newObjectForEntity:@"Tag"];
                    [v30 setIdentifier:v28];
                    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v30), v28);
                  }
                  [v23 addObject:v30];
                }
                uint64_t v25 = [v22 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v25);
            }
            [v42 addTags:v23];
            uint64_t v31 = [v22 count];
            if (v31 != [v23 count]) {
              objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 5314, @"Supplied tags should always equal the count of tags on the production else the counts are wrong");
            }

            id v5 = v35;
            id v14 = v36;
            id v13 = a3;
            double v18 = v42;
            uint64_t v16 = v43;
          }
          unint64_t v15 = v40;
          if (objc_msgSend((id)objc_msgSend(v16, "universalTypeIdentifier"), "length")) {
            objc_msgSend(v18, "setUniversalTypeIdentifier:", objc_msgSend(v16, "universalTypeIdentifier"));
          }
        }
        else
        {
          unint64_t v15 = v40;
        }
      }
      id v32 = [(CoreThemeDocument *)self newObjectForEntity:@"RecognitionObjectRenditionSpec"];
      objc_msgSend(v32, "setAsset:", objc_msgSend(v13, "objectAtIndex:", v15));
      [v32 setProduction:v18];
      objc_msgSend(v32, "setVersion:", objc_msgSend(v43, "objectVersion"));
      [v43 transformation];
      objc_msgSend(v32, "setReferenceOriginTransform:");
      objc_msgSend(v32, "setPreserveForArchiveOnly:", objc_msgSend(v43, "preserveForArchiveOnly"));
      [v32 resetToBaseKeySpec];
      double v33 = (void *)[v32 keySpec];
      objc_msgSend(v33, "setIdiom:", -[CoreThemeDocument idiomWithIdentifier:](self, "idiomWithIdentifier:", objc_msgSend(v43, "idiom")));
      objc_msgSend(v33, "setScaleFactor:", objc_msgSend(v43, "scaleFactor"));
      objc_msgSend(v33, "setSubtype:", objc_msgSend(v43, "subtype"));
      objc_msgSend(v33, "setGamut:", -[CoreThemeDocument displayGamutWithIdentifier:](self, "displayGamutWithIdentifier:", objc_msgSend(v43, "displayGamut")));
      objc_msgSend(v33, "setSizeClassHorizontal:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v43, "sizeClassHorizontal")));
      objc_msgSend(v33, "setSizeClassVertical:", -[CoreThemeDocument sizeClassWithIdentifier:](self, "sizeClassWithIdentifier:", objc_msgSend(v43, "sizeClassVertical")));
      objc_msgSend(v33, "setMemoryClass:", objc_msgSend(v43, "memoryClass"));
      objc_msgSend(v33, "setDirection:", -[CoreThemeDocument directionWithIdentifier:](self, "directionWithIdentifier:", objc_msgSend(v43, "layoutDirection")));
      objc_msgSend(v33, "setGraphicsFeatureSetClass:", -[CoreThemeDocument graphicsFeatureSetClassWithIdentifier:](self, "graphicsFeatureSetClassWithIdentifier:", objc_msgSend(v43, "graphicsFeatureSetClass")));

      ++v15;
    }
    while (v15 < [v5 count]);
  }
}

- (void)createNamedGlyphVectorForCustomInfos:(id)a3 referenceFiles:(BOOL)a4 bitSource:(id)a5 error:(id *)a6
{
  id v6 = a3;
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v112 = a5;
  id v97 = [(CoreThemeDocument *)self displayGamuts];
  id v96 = [(CoreThemeDocument *)self idioms];
  id v8 = [(CoreThemeDocument *)self sizeClasses];
  id v95 = [(CoreThemeDocument *)self directions];
  id v94 = [(CoreThemeDocument *)self featureSetClasses];
  id v93 = [(CoreThemeDocument *)self glyphsSizes];
  id v92 = [(CoreThemeDocument *)self glyphWeights];
  id v72 = [(CoreThemeDocument *)self glyphRenderingModes];
  id v98 = [(CoreThemeDocument *)self elementWithIdentifier:85];
  id v78 = [(CoreThemeDocument *)self partWithIdentifier:59];
  id v90 = [(CoreThemeDocument *)self partWithIdentifier:181];
  id v89 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:0];
  id v73 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1017];
  id v91 = [(CoreThemeDocument *)self deploymentTargetWithIdentifier:5];
  id v77 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v9 = [(CoreThemeDocument *)self objectsForEntity:@"Tag" withPredicate:0 sortDescriptors:0];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v108 objects:v114 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v109 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v77, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", *(void *)(*((void *)&v108 + 1) + 8 * i)), objc_msgSend(*(id *)(*((void *)&v108 + 1) + 8 * i), "identifier"));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v108 objects:v114 count:16];
    }
    while (v11);
  }
  [(CoreThemeDocument *)self targetPlatform];
  unsigned int v84 = CUIMaxScaleForTargetPlatform();
  [(CoreThemeDocument *)self targetPlatform];
  unsigned int v79 = CUIMinScaleForTargetPlatform();
  id v75 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"NamedVectorGlyphProduction", 0, 0));
  if ([v6 count])
  {
    uint64_t v14 = 0;
    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
    id v74 = v6;
    long long v85 = v8;
    while (1)
    {
      uint64_t v76 = v14;
      id v19 = (void *)[v6 objectAtIndex:v14];
      int v105 = 0;
      uint64_t v106 = 0;
      uint64_t v107 = 0;
      id v20 = (void *)[v19 fileURL];
      [(CoreThemeDocument *)self _getFilename:&v107 scaleFactor:&v105 category:&v106 bitSource:&v112 forFileURL:v20];
      if (v20)
      {
        id v21 = (void *)[v20 pathComponents];
        uint64_t UncommonItemInArrays = indexOfFirstUncommonItemInArrays(objc_msgSend((id)objc_msgSend(v112, "fileURLWithDocument:", self), "pathComponents"), v21);
        uint64_t v23 = objc_msgSend(v21, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v21, "count") + ~UncommonItemInArrays);
        uint64_t v106 = [NSString pathWithComponents:v23];
      }
      uint64_t v24 = (void *)[v75 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name.name == %@", objc_msgSend(v19, "name"))];
      if ([v24 firstObject]
        && ([v24 firstObject], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v25 = (id)[v24 firstObject];
        uint64_t v26 = v77;
        if (!v20) {
          goto LABEL_78;
        }
      }
      else
      {
        long long v87 = v20;
        id v25 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedVectorGlyphProduction"];
        uint64_t v26 = v77;
        id v27 = [v19 nameIdentifier]
            ? -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v19 nameIdentifier]): -[CoreThemeDocument _createNamedElementWithNextAvailableIdentifier](self, "_createNamedElementWithNextAvailableIdentifier");
        uint64_t v28 = v27;
        objc_msgSend(v27, "setName:", objc_msgSend(v19, "name"));
        [v28 setProduction:v25];
        id v29 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
        [v25 setBaseKeySpec:v29];
        [v29 setElement:v98];
        [v29 setPart:v78];
        objc_msgSend(v29, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v28, "identifier"), "unsignedIntValue"));
        [v29 setTarget:v91];
        objc_msgSend(v25, "setDateOfLastChange:", objc_msgSend(v19, "modificationDate"));
        [v25 setRenditionType:v73];
        objc_msgSend(v25, "setIsFlippable:", objc_msgSend(v19, "isFlippable"));

        [v75 addObject:v25];
        if (v19)
        {
          id v30 = (void *)[v19 tags];
          if ([v30 count])
          {
            double v99 = v25;
            id v31 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            uint64_t v32 = [v30 countByEnumeratingWithState:&v101 objects:v113 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v102;
              do
              {
                for (uint64_t j = 0; j != v33; ++j)
                {
                  if (*(void *)v102 != v34) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v36 = *(void *)(*((void *)&v101 + 1) + 8 * j);
                  uint64_t v37 = (void *)[v77 objectForKey:v36];
                  if ([v37 count])
                  {
                    if ([v37 count] != 1) {
                      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 5481, @"We should ONLY have 1 tag with a name, tag names need to be Unique");
                    }
                    id v38 = (id)[v37 objectAtIndex:0];
                  }
                  else
                  {
                    id v38 = [(CoreThemeDocument *)self newObjectForEntity:@"Tag"];
                    [v38 setIdentifier:v36];
                    objc_msgSend(v77, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v38), v36);
                  }
                  [v31 addObject:v38];
                }
                uint64_t v33 = [v30 countByEnumeratingWithState:&v101 objects:v113 count:16];
              }
              while (v33);
            }
            id v25 = v99;
            [v99 addTags:v31];
            uint64_t v39 = [v30 count];
            if (v39 != [v31 count]) {
              objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 5488, @"Supplied tags should always equal the count of tags on the production else the counts are wrong");
            }

            id v20 = v87;
          }
          if (objc_msgSend((id)objc_msgSend(v19, "universalTypeIdentifier"), "length")) {
            objc_msgSend(v25, "setUniversalTypeIdentifier:", objc_msgSend(v19, "universalTypeIdentifier"));
          }
          objc_msgSend(v25, "setVectorGlyphRenderingMode:", objc_msgSend(v72, "objectAtIndex:", objc_msgSend(v19, "vectorGlyphRenderingMode")));
          if (!v20) {
LABEL_78:
          }
            -[CoreThemeDocument createNamedGlyphVectorForCustomInfos:referenceFiles:bitSource:error:]();
        }
        else if (!v20)
        {
          goto LABEL_78;
        }
      }
      unint64_t v40 = +[TDVectorGlyphReader vectorGlyphReaderWithURL:v20 platform:[(CoreThemeDocument *)self targetPlatform] error:a6];
      if (!v40) {
        break;
      }
      id v100 = v25;
      uint64_t v41 = 1;
      long long v86 = v40;
      do
      {
        uint64_t v82 = v41 & 0x7FFFFFFFFFFFFFFELL;
        uint64_t v42 = 1;
        uint64_t v88 = v41;
        do
        {
          uint64_t v83 = v42;
          if (-[TDVectorGlyphReader vectorGlyphExistsWithWeight:size:error:](v40, "vectorGlyphExistsWithWeight:size:error:"))
          {
LABEL_45:
            id v43 = [(CoreThemeDocument *)self newObjectForEntity:@"VectorGlyphRenditionSpec"];
            uint64_t v44 = v107;
            uint64_t v45 = [v19 scaleFactor];
            id v46 = [(CoreThemeDocument *)self createAssetWithName:v44 fileType:@"png" scaleFactor:v45 inCategory:v106 forThemeBitSource:v112];
            [v46 setScaleFactor:0];
            objc_msgSend(v46, "setFileScaleFactor:", objc_msgSend(v19, "scaleFactor"));
            if (![v46 fileScaleFactor]) {
              [v46 setFileScaleFactor:1];
            }
            long long v81 = v46;
            [v43 setAsset:v46];
            [v43 setProduction:v100];
            objc_msgSend(v43, "setAlignmentRect:", v15, v16, v17, v18);
            int64_t v47 = [(CoreThemeDocument *)self targetPlatform];
            uint64_t v48 = v88;
            if (!v47) {
              uint64_t v48 = v82;
            }
            if (v83 == 4 && v48 == 2)
            {
              [(CoreThemeDocument *)self targetPlatform];
              unsigned int v49 = CUIMinDimensionForVectorGlyph();
              [(CoreThemeDocument *)self targetPlatform];
              if (v49 < CUIMaxDimensionForVectorGlyph())
              {
                do
                {
                  id v50 = [(CoreThemeDocument *)self newObjectForEntity:@"AvaliableVectorSize"];
                  long long v51 = NSNumber;
                  [(CoreThemeDocument *)self targetPlatform];
                  CUIPointSizeForDimensionForVectorGlyph();
                  objc_msgSend(v50, "setPointSize:", objc_msgSend(v51, "numberWithInt:", (int)v52));
                  [v43 addAvaliablePointSizesObject:v50];

                  ++v49;
                  [(CoreThemeDocument *)self targetPlatform];
                }
                while (CUIMaxDimensionForVectorGlyph() > (unsigned __int16)v49);
              }
            }
            [v43 resetToBaseKeySpec];
            long long v53 = (void *)[v43 keySpec];
            [v53 setElement:v98];
            [v53 setPart:v78];
            objc_msgSend(v53, "setIdiom:", objc_msgSend(v96, "objectAtIndexedSubscript:", objc_msgSend(v19, "idiom")));
            objc_msgSend(v53, "setScaleFactor:", objc_msgSend(v81, "fileScaleFactor"));
            objc_msgSend(v53, "setSubtype:", objc_msgSend(v19, "subtype"));
            objc_msgSend(v53, "setGamut:", objc_msgSend(v97, "objectAtIndexedSubscript:", objc_msgSend(v19, "displayGamut")));
            objc_msgSend(v53, "setSizeClassHorizontal:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassHorizontal")));
            objc_msgSend(v53, "setSizeClassVertical:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassVertical")));
            objc_msgSend(v53, "setMemoryClass:", objc_msgSend(v19, "memoryClass"));
            objc_msgSend(v53, "setDirection:", objc_msgSend(v95, "objectAtIndexedSubscript:", objc_msgSend(v19, "layoutDirection")));
            objc_msgSend(v53, "setGraphicsFeatureSetClass:", objc_msgSend(v94, "objectAtIndexedSubscript:", objc_msgSend(v19, "graphicsFeatureSetClass")));
            objc_msgSend(v53, "setGlyphSize:", objc_msgSend(v93, "objectAtIndexedSubscript:", v88));
            objc_msgSend(v53, "setGlyphWeight:", objc_msgSend(v92, "objectAtIndexedSubscript:", v83));
            objc_msgSend(v53, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "appearanceIdentifier"), objc_msgSend(v19, "appearanceName"), 1));
            objc_msgSend(v53, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "localizationIdentifier"), objc_msgSend(v19, "localizationName"), 1));
            int64_t v54 = [(CoreThemeDocument *)self targetPlatform];
            uint64_t v55 = v82;
            if (v54) {
              uint64_t v55 = v88;
            }
            if (v83 == 4 && v55 == 2 && v79 <= v84)
            {
              uint64_t v56 = v79;
              do
              {
                if ([(CoreThemeDocument *)self shouldGenerateScale:v56])
                {
                  [(CoreThemeDocument *)self targetPlatform];
                  for (uint64_t k = CUIMinDimensionForVectorGlyph(); ; uint64_t k = (k + 1))
                  {
                    [(CoreThemeDocument *)self targetPlatform];
                    if (k >= CUIMaxDimensionForVectorGlyph()) {
                      break;
                    }
                    id v58 = [(CoreThemeDocument *)self newObjectForEntity:@"VectorGlyphImageRenditionSpec"];
                    uint64_t v59 = v107;
                    uint64_t v60 = [v19 scaleFactor];
                    id v61 = [(CoreThemeDocument *)self createAssetWithName:v59 fileType:@"png" scaleFactor:v60 inCategory:v106 forThemeBitSource:v112];
                    objc_msgSend(v61, "setFileScaleFactor:", objc_msgSend(v19, "scaleFactor"));
                    [v61 setScaleFactor:v56];
                    [v58 setAsset:v61];
                    [(CoreThemeDocument *)self targetPlatform];
                    CUIPointSizeForDimensionForVectorGlyph();
                    double v63 = v62;
                    [(TDVectorGlyphReader *)v86 defaultPointSize];
                    [v58 setPostScaleFactor:v63 / v64];
                    [v58 setRenditionType:v89];
                    objc_msgSend(v58, "setAllowsDeepmap2Compression:", -[CoreThemeDocument shouldAllowDeepmap2CompressionForDeploymentTarget:](self, "shouldAllowDeepmap2CompressionForDeploymentTarget:", objc_msgSend(v91, "identifier")));
                    [v58 setProduction:v100];
                    [v58 resetToBaseKeySpec];
                    long long v65 = (void *)[v58 keySpec];
                    [v65 setElement:v98];
                    [v65 setPart:v90];
                    objc_msgSend(v65, "setIdiom:", objc_msgSend(v96, "objectAtIndexedSubscript:", objc_msgSend(v19, "idiom")));
                    [v65 setScaleFactor:v56];
                    objc_msgSend(v65, "setSubtype:", objc_msgSend(v19, "subtype"));
                    objc_msgSend(v65, "setGamut:", objc_msgSend(v97, "objectAtIndexedSubscript:", objc_msgSend(v19, "displayGamut")));
                    objc_msgSend(v65, "setSizeClassHorizontal:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassHorizontal")));
                    objc_msgSend(v65, "setSizeClassVertical:", objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v19, "sizeClassVertical")));
                    objc_msgSend(v65, "setMemoryClass:", objc_msgSend(v19, "memoryClass"));
                    objc_msgSend(v65, "setDirection:", objc_msgSend(v95, "objectAtIndexedSubscript:", objc_msgSend(v19, "layoutDirection")));
                    objc_msgSend(v65, "setGraphicsFeatureSetClass:", objc_msgSend(v94, "objectAtIndexedSubscript:", objc_msgSend(v19, "graphicsFeatureSetClass")));
                    objc_msgSend(v65, "setGlyphSize:", objc_msgSend(v93, "objectAtIndexedSubscript:", v88));
                    objc_msgSend(v65, "setGlyphWeight:", objc_msgSend(v92, "objectAtIndexedSubscript:", 4));
                    [v65 setDimension2:k];
                    objc_msgSend(v65, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "appearanceIdentifier"), objc_msgSend(v19, "appearanceName"), 1));
                    objc_msgSend(v65, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v19, "localizationIdentifier"), objc_msgSend(v19, "localizationName"), 1));
                  }
                }
                uint64_t v56 = (v56 + 1);
              }
              while (v56 <= v84);
            }
          }
          else
          {
            [(CoreThemeDocument *)self targetPlatform];
            long long v66 = (uint64_t *)CUIPreferredVectorGlyphConfigurationsForPlatform();
            uint64_t v67 = *v66;
            if (*v66)
            {
              long long v68 = v66 + 3;
              do
              {
                uint64_t v69 = *(v68 - 2);
                if (!v69) {
                  break;
                }
                if (v67 == v83 && v69 == v88)
                {
                  if (-[TDVectorGlyphReader isInterpolatableForWeight:size:](v86, "isInterpolatableForWeight:size:")) {
                    goto LABEL_45;
                  }
                  break;
                }
                uint64_t v70 = *v68;
                v68 += 3;
                uint64_t v67 = v70;
              }
              while (v70);
            }
          }
          uint64_t v42 = v83 + 1;
          unint64_t v40 = v86;
        }
        while (v83 != 9);
        uint64_t v41 = v88 + 1;
      }
      while (v88 != 3);

      uint64_t v14 = v76 + 1;
      id v6 = v74;
      if (v76 + 1 >= (unint64_t)[v74 count]) {
        goto LABEL_76;
      }
    }
  }
  else
  {
LABEL_76:
  }
}

- (id)updateAutomaticTexturesForCustomInfos:(id)a3 allTextureInfos:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if ([a3 count])
  {
    uint64_t v47 = 0;
    id v38 = (id)[a4 mutableCopy];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v37 = [a3 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v44;
      uint64_t v7 = *MEMORY[0x263EFFD08];
      obuint64_t j = a3;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v10 = (void *)[v9 textureInfos];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v40;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v40 != v13) {
                  objc_enumerationMutation(v10);
                }
                double v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                if ([v15 fileURL] != v7)
                {
                  double v16 = CGImageSourceCreateWithURL((CFURLRef)[v15 fileURL], 0);
                  if (v16)
                  {
                    double v17 = v16;
                    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
                    CFRelease(v17);
                    if (ImageAtIndex)
                    {
                      uint64_t v47 = 2;
                      memset(v51, 0, sizeof(v51));
                      int v19 = -1;
                      id v20 = &v50;
                      do
                      {
                        [(CoreThemeDocument *)self targetPlatform];
                        [v9 displayGamut];
                        [v9 textureInterpretation];
                        uint64_t v21 = CUIGetFormatForFeatureSetAndPixelFormat();
                        uint64_t v22 = v47;
                        *((void *)v51 + v47) = v21;
                        uint64_t v47 = v22 - 1;
                        ++v20;
                        ++v19;
                      }
                      while (v22 > 0);
                      if (v19)
                      {
                        int v23 = v19 + 1;
                        while (*((void *)v51 + (v23 - 2)) == *v20)
                        {
                          if (--v23 <= 1) {
                            goto LABEL_24;
                          }
                        }
                      }
                      else
                      {
LABEL_24:
                        int v23 = 1;
                      }
                      unint64_t v24 = [(CoreThemeDocument *)self targetPlatform];
                      if (v24 <= 5 && ((1 << v24) & 0x3A) != 0)
                      {
                        if (v23 >= 1)
                        {
                          for (uint64_t j = 0; j != v23; ++j)
                          {
                            uint64_t v26 = *((void *)v51 + j);
                            if (v26)
                            {
                              id v27 = (void *)[v9 copyWithZone:0];
                              [v27 setTexturePixelFormat:v26];
                              [v27 setGraphicsFeatureSetClass:j];
                              [v38 addObject:v27];
                            }
                          }
                        }
                      }
                      else
                      {
                        int v28 = v23 - 1;
                        if ([(CoreThemeDocument *)self featureEnabled:18]) {
                          unsigned int v29 = v28;
                        }
                        else {
                          unsigned int v29 = 0;
                        }
                        if ((v29 & 0x80000000) == 0)
                        {
                          while (1)
                          {
                            uint64_t v30 = *((void *)v51 + v29);
                            uint64_t v31 = v29;
                            if (v30) {
                              break;
                            }
                            --v29;
                            if ((int)v31 < 1) {
                              goto LABEL_32;
                            }
                          }
                          uint64_t v32 = (void *)[v9 copyWithZone:0];
                          [v32 setTexturePixelFormat:v30];
                          [v32 setGraphicsFeatureSetClass:v31];
                          [v38 addObject:v32];
                        }
                      }
LABEL_32:
                      CFRelease(ImageAtIndex);
                    }
                    goto LABEL_33;
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_33:
          ++v8;
        }
        while (v8 != v37);
        uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
        uint64_t v37 = v33;
      }
      while (v33);
    }
    return v38;
  }
  return a4;
}

+ (id)_imageAssetURLsByCopyingFileURLs:(id)a3 toManagedLocationAtURL:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  id v9 = (void *)[MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = (void *)[a4 URLByAppendingPathComponent:@"NamedImages"];
  if (([v10 checkResourceIsReachableAndReturnError:0] & 1) != 0
    || (int v11 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:a5],
        id result = 0,
        v11))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v13 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v22 = a5;
      uint64_t v15 = *(void *)v25;
      double v16 = (void *)*MEMORY[0x263EFFD08];
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(a3);
          }
          double v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
          if (v18 == v16)
          {
            id v20 = v8;
            uint64_t v21 = v16;
          }
          else
          {
            int v23 = 0;
            int v19 = objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v18, "lastPathComponent"));
            if ([v19 checkResourceIsReachableAndReturnError:&v23]
              && (NSLog(&cfstr_FileAlreadyExi.isa, v18), ([v9 removeItemAtURL:v19 error:&v23] & 1) == 0)
              || ([v9 copyItemAtURL:v18 toURL:v19 error:&v23] & 1) == 0)
            {
              if (v22) {
                *uint64_t v22 = v23;
              }
              return 0;
            }
            id v20 = v8;
            uint64_t v21 = v19;
          }
          [v20 addObject:v21];
          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    return v8;
  }
  return result;
}

- (int64_t)_compareFlattenedKeySpec1:(id)a3 toKeySpec2:(id)a4
{
  int v6 = [a3 scaleFactor];
  if (v6 != [a4 scaleFactor]) {
    return -1;
  }
  uint64_t v7 = [a3 idiom];
  if (v7 != [a4 idiom]) {
    return -1;
  }
  int v8 = [a3 subtype];
  if (v8 != [a4 subtype]) {
    return -1;
  }
  uint64_t v9 = [a3 gamut];
  if (v9 == [a4 gamut]) {
    return 0;
  }
  else {
    return -1;
  }
}

- (void)_addResolvedLayerReferenceToFlattenedImageRendition:(id)a3 usingArtworkRendition:(id)a4 andLayerReference:(id)a5
{
  id v8 = [(CoreThemeDocument *)self newObjectForEntity:@"ResolvedLayerReference"];
  [v8 setReference:a4];
  objc_msgSend(v8, "setBlendMode:", objc_msgSend(a5, "blendMode"));
  [a5 frameRect];
  objc_msgSend(v8, "setFrameRect:");
  objc_msgSend(v8, "setName:", objc_msgSend(a5, "name"));
  objc_msgSend(v8, "setOpacity:", objc_msgSend(a5, "opacity"));
  [a3 addLayerReferencesObject:v8];
  uint64_t v9 = [a4 asset];

  [a3 setAsset:v9];
}

- (void)_makeRadiosityImages
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [(CoreThemeDocument *)self partWithIdentifier:209];
  id v20 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"LayerStackProduction", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"renditionType.identifier == %d", 1002), 0);
  uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v4;
        id v5 = *(void **)(*((void *)&v28 + 1) + 8 * v4);
        uint64_t v6 = [v5 flattenedImageProduction];
        if (v6)
        {
          uint64_t v7 = (void *)v6;
          id v8 = [(CoreThemeDocument *)self newObjectForEntity:@"SimpleArtworkElementProduction"];
          objc_msgSend(v8, "setTemplateRenderingMode:", objc_msgSend(v7, "templateRenderingMode"));
          id v9 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
          objc_msgSend(v9, "setElement:", objc_msgSend((id)objc_msgSend(v5, "baseKeySpec"), "element"));
          [v9 setPart:v3];
          [v8 setBaseKeySpec:v9];
          [v8 setRenditionType:v20];
          objc_msgSend(v8, "setTags:", objc_msgSend(v5, "tags"));
          [v5 setRadiosityImageProduction:v8];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v10 = (void *)[v7 renditions];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                id v16 = [(CoreThemeDocument *)self newObjectForEntity:@"RadiosityImageRenditionSpec"];
                [v16 setFlattenedImage:v15];
                [v16 setProduction:v8];
                objc_msgSend(v16, "setAsset:", objc_msgSend(v15, "asset"));
                id v17 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
                objc_msgSend(v17, "setElement:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "element"));
                [v17 setPart:v3];
                objc_msgSend(v17, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "scaleFactor"));
                objc_msgSend(v17, "setIdiom:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "idiom"));
                objc_msgSend(v17, "setSubtype:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "subtype"));
                objc_msgSend(v17, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "nameIdentifier"));
                objc_msgSend(v17, "setGraphicsFeatureSetClass:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "graphicsFeatureSetClass"));
                objc_msgSend(v17, "setTarget:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "target"));
                objc_msgSend(v17, "setGamut:", objc_msgSend((id)objc_msgSend(v15, "keySpec"), "gamut"));
                objc_msgSend(v16, "setCompressionType:", objc_msgSend(v15, "compressionType"));
                [v16 setKeySpec:v17];
                double v18 = (double)[v17 scaleFactor] * 40.0;
                objc_msgSend(v16, "setWidth:", (int)((double)(int)objc_msgSend(v15, "width") + v18 * 2.0));
                objc_msgSend(v16, "setHeight:", (int)((double)(int)objc_msgSend(v15, "height") + v18 * 2.0));
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v12);
          }
        }
        uint64_t v4 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)_tidyUpLayerStacks
{
  uint64_t v173 = *MEMORY[0x263EF8340];
  id v80 = [(CoreThemeDocument *)self idioms];
  id v79 = [(CoreThemeDocument *)self sizeClasses];
  id v93 = [(CoreThemeDocument *)self compressionTypes];
  id v92 = [(CoreThemeDocument *)self deploymentTargets];
  id v3 = [(CoreThemeDocument *)self objectsForEntity:@"LayerStackProduction" withPredicate:0 sortDescriptors:0];
  id v94 = [(CoreThemeDocument *)self partWithIdentifier:208];
  id v74 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:0];
  id v91 = [(CoreThemeDocument *)self graphicsFeatureSetClassWithIdentifier:2];
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  obuint64_t j = v3;
  uint64_t v77 = [v3 countByEnumeratingWithState:&v156 objects:v172 count:16];
  if (v77)
  {
    uint64_t v76 = *(void *)v157;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v157 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v78 = v4;
        id v5 = *(void **)(*((void *)&v156 + 1) + 8 * v4);
        uint64_t v6 = (void *)[v5 renditions];
        long long v85 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
        long long v152 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        uint64_t v7 = (void *)[v5 renditions];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v152 objects:v171 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v153;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v153 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v152 + 1) + 8 * i);
              uint64_t v13 = objc_alloc_init(_TDLayerStackFilterHelper);
              [(_TDLayerStackFilterHelper *)v13 setLayerStackRendition:v12];
              [v85 addObject:v13];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v152 objects:v171 count:16];
          }
          while (v9);
        }
        if ([v85 count])
        {
          unint64_t v14 = 0;
          do
          {
            uint64_t v15 = (void *)[v85 objectAtIndex:v14];
            if ([v85 count])
            {
              unint64_t v16 = 0;
              do
              {
                if (v14 != v16) {
                  objc_msgSend(v15, "establishExclusionsWithHelper:idioms:sizeClasses:", objc_msgSend(v85, "objectAtIndex:", v16), v80, v79);
                }
                ++v16;
              }
              while (v16 < [v85 count]);
            }
            ++v14;
          }
          while (v14 < [v85 count]);
        }
        id v96 = (void *)[v5 name];
        id v95 = (void *)[v5 flattenedImageProduction];
        if (v95)
        {
          id v86 = (id)objc_msgSend((id)objc_msgSend(v5, "flattenedImageProduction"), "renditions");
        }
        else
        {
          id v17 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedArtworkProduction"];
          [v5 setFlattenedImageProduction:v17];
          objc_msgSend(v17, "setTags:", objc_msgSend(v5, "tags"));
          id v18 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
          objc_msgSend(v18, "setElement:", objc_msgSend((id)objc_msgSend(v5, "baseKeySpec"), "element"));
          [v18 setPart:v94];
          [v17 setBaseKeySpec:v18];
          id v95 = v17;
          [v17 setRenditionType:v74];
          id v86 = 0;
        }
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id v81 = (id)[v5 renditions];
        uint64_t v83 = [v81 countByEnumeratingWithState:&v148 objects:v170 count:16];
        if (v83)
        {
          uint64_t v82 = *(void *)v149;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v149 != v82) {
                objc_enumerationMutation(v81);
              }
              uint64_t v84 = v19;
              id v20 = *(void **)(*((void *)&v148 + 1) + 8 * v19);
              id v103 = (id)[MEMORY[0x263EFF980] array];
              long long v144 = 0u;
              long long v145 = 0u;
              long long v146 = 0u;
              long long v147 = 0u;
              id v97 = v20;
              id v101 = (id)[v20 layerReferences];
              uint64_t v104 = [v101 countByEnumeratingWithState:&v144 objects:v169 count:16];
              if (v104)
              {
                uint64_t v102 = *(void *)v145;
                do
                {
                  uint64_t v21 = 0;
                  do
                  {
                    if (*(void *)v145 != v102) {
                      objc_enumerationMutation(v101);
                    }
                    uint64_t v106 = v21;
                    uint64_t v22 = *(void **)(*((void *)&v144 + 1) + 8 * v21);
                    long long v140 = 0u;
                    long long v141 = 0u;
                    long long v142 = 0u;
                    long long v143 = 0u;
                    uint64_t v23 = objc_msgSend((id)objc_msgSend(v22, "reference"), "renditions");
                    uint64_t v24 = [v23 countByEnumeratingWithState:&v140 objects:v168 count:16];
                    if (v24)
                    {
                      uint64_t v25 = v24;
                      uint64_t v26 = *(void *)v141;
                      do
                      {
                        for (uint64_t j = 0; j != v25; ++j)
                        {
                          if (*(void *)v141 != v26) {
                            objc_enumerationMutation(v23);
                          }
                          long long v28 = *(void **)(*((void *)&v140 + 1) + 8 * j);
                          long long v136 = 0u;
                          long long v137 = 0u;
                          long long v138 = 0u;
                          long long v139 = 0u;
                          uint64_t v29 = [v103 countByEnumeratingWithState:&v136 objects:v167 count:16];
                          if (v29)
                          {
                            uint64_t v30 = v29;
                            uint64_t v31 = *(void *)v137;
LABEL_41:
                            uint64_t v32 = 0;
                            while (1)
                            {
                              if (*(void *)v137 != v31) {
                                objc_enumerationMutation(v103);
                              }
                              if (!-[CoreThemeDocument _compareFlattenedKeySpec1:toKeySpec2:](self, "_compareFlattenedKeySpec1:toKeySpec2:", *(void *)(*((void *)&v136 + 1) + 8 * v32), [v28 keySpec]))break; {
                              if (v30 == ++v32)
                              }
                              {
                                uint64_t v30 = [v103 countByEnumeratingWithState:&v136 objects:v167 count:16];
                                if (v30) {
                                  goto LABEL_41;
                                }
                                goto LABEL_47;
                              }
                            }
                          }
                          else
                          {
LABEL_47:
                            objc_msgSend(v103, "addObject:", objc_msgSend(v28, "keySpec"));
                          }
                        }
                        uint64_t v25 = [v23 countByEnumeratingWithState:&v140 objects:v168 count:16];
                      }
                      while (v25);
                    }
                    uint64_t v21 = v106 + 1;
                  }
                  while (v106 + 1 != v104);
                  uint64_t v104 = [v101 countByEnumeratingWithState:&v144 objects:v169 count:16];
                }
                while (v104);
              }
              long long v134 = 0u;
              long long v135 = 0u;
              long long v132 = 0u;
              long long v133 = 0u;
              uint64_t v33 = [v85 countByEnumeratingWithState:&v132 objects:v166 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v133;
                while (2)
                {
                  for (uint64_t k = 0; k != v34; ++k)
                  {
                    if (*(void *)v133 != v35) {
                      objc_enumerationMutation(v85);
                    }
                    uint64_t v37 = *(void **)(*((void *)&v132 + 1) + 8 * k);
                    if ((void *)[v37 layerStackRendition] == v97)
                    {
                      if (v37)
                      {
                        id v38 = (void *)[MEMORY[0x263EFF980] array];
                        long long v128 = 0u;
                        long long v129 = 0u;
                        long long v130 = 0u;
                        long long v131 = 0u;
                        uint64_t v39 = [v103 countByEnumeratingWithState:&v128 objects:v165 count:16];
                        if (v39)
                        {
                          uint64_t v40 = v39;
                          uint64_t v41 = *(void *)v129;
                          do
                          {
                            for (uint64_t m = 0; m != v40; ++m)
                            {
                              if (*(void *)v129 != v41) {
                                objc_enumerationMutation(v103);
                              }
                              uint64_t v43 = *(void *)(*((void *)&v128 + 1) + 8 * m);
                              if ([v37 allowKey:v43]) {
                                [v38 addObject:v43];
                              }
                            }
                            uint64_t v40 = [v103 countByEnumeratingWithState:&v128 objects:v165 count:16];
                          }
                          while (v40);
                        }
                        id v103 = v38;
                      }
                      goto LABEL_72;
                    }
                  }
                  uint64_t v34 = [v85 countByEnumeratingWithState:&v132 objects:v166 count:16];
                  if (v34) {
                    continue;
                  }
                  break;
                }
              }
LABEL_72:
              long long v126 = 0u;
              long long v127 = 0u;
              long long v124 = 0u;
              long long v125 = 0u;
              uint64_t v44 = [v86 countByEnumeratingWithState:&v124 objects:v164 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v125;
                do
                {
                  for (uint64_t n = 0; n != v45; ++n)
                  {
                    if (*(void *)v125 != v46) {
                      objc_enumerationMutation(v86);
                    }
                    uint64_t v48 = *(void **)(*((void *)&v124 + 1) + 8 * n);
                    long long v120 = 0u;
                    long long v121 = 0u;
                    long long v122 = 0u;
                    long long v123 = 0u;
                    uint64_t v49 = [v103 countByEnumeratingWithState:&v120 objects:v163 count:16];
                    if (v49)
                    {
                      uint64_t v50 = v49;
                      uint64_t v51 = *(void *)v121;
                      while (2)
                      {
                        for (iuint64_t i = 0; ii != v50; ++ii)
                        {
                          if (*(void *)v121 != v51) {
                            objc_enumerationMutation(v103);
                          }
                          uint64_t v53 = *(void *)(*((void *)&v120 + 1) + 8 * ii);
                          if (!-[CoreThemeDocument _compareFlattenedKeySpec1:toKeySpec2:](self, "_compareFlattenedKeySpec1:toKeySpec2:", v53, [v48 keySpec]))
                          {
                            [v97 canvasSize];
                            [v48 setWidth:(int)v54];
                            [v97 canvasSize];
                            [v48 setHeight:(int)v55];
                            objc_msgSend((id)objc_msgSend(v48, "keySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v96, "identifier"), "unsignedIntValue"));
                            [v103 removeObject:v53];
                            goto LABEL_87;
                          }
                        }
                        uint64_t v50 = [v103 countByEnumeratingWithState:&v120 objects:v163 count:16];
                        if (v50) {
                          continue;
                        }
                        break;
                      }
                    }
LABEL_87:
                    ;
                  }
                  uint64_t v45 = [v86 countByEnumeratingWithState:&v124 objects:v164 count:16];
                }
                while (v45);
              }
              long long v118 = 0u;
              long long v119 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              uint64_t v56 = v97;
              uint64_t v88 = [v103 countByEnumeratingWithState:&v116 objects:v162 count:16];
              if (v88)
              {
                uint64_t v87 = *(void *)v117;
                do
                {
                  uint64_t v57 = 0;
                  do
                  {
                    if (*(void *)v117 != v87) {
                      objc_enumerationMutation(v103);
                    }
                    uint64_t v90 = v57;
                    id v58 = *(void **)(*((void *)&v116 + 1) + 8 * v57);
                    for (juint64_t j = [v56 compressionType];
                          ;
                          juint64_t j = [v93 objectAtIndexedSubscript:0])
                    {
                      uint64_t v60 = jj;
                      if (![v58 scaleFactor]) {
                        break;
                      }
                      uint64_t v98 = v60;
                      id v61 = [(CoreThemeDocument *)self newObjectForEntity:@"FlattenedImageRenditionSpec"];
                      double v62 = (void *)[v56 layerReferences];
                      long long v112 = 0u;
                      long long v113 = 0u;
                      long long v114 = 0u;
                      long long v115 = 0u;
                      id v100 = v62;
                      uint64_t v107 = [v62 countByEnumeratingWithState:&v112 objects:v161 count:16];
                      if (v107)
                      {
                        uint64_t v105 = *(void *)v113;
                        id v99 = v61;
                        do
                        {
                          for (kuint64_t k = 0; kk != v107; ++kk)
                          {
                            if (*(void *)v113 != v105) {
                              objc_enumerationMutation(v100);
                            }
                            double v64 = *(void **)(*((void *)&v112 + 1) + 8 * kk);
                            long long v108 = 0u;
                            long long v109 = 0u;
                            long long v110 = 0u;
                            long long v111 = 0u;
                            long long v65 = objc_msgSend((id)objc_msgSend(v64, "reference"), "renditions");
                            uint64_t v66 = [v65 countByEnumeratingWithState:&v108 objects:v160 count:16];
                            if (v66)
                            {
                              uint64_t v67 = v66;
                              uint64_t v68 = *(void *)v109;
LABEL_103:
                              uint64_t v69 = 0;
                              while (1)
                              {
                                if (*(void *)v109 != v68) {
                                  objc_enumerationMutation(v65);
                                }
                                uint64_t v70 = *(void **)(*((void *)&v108 + 1) + 8 * v69);
                                if (!-[CoreThemeDocument _compareFlattenedKeySpec1:toKeySpec2:](self, "_compareFlattenedKeySpec1:toKeySpec2:", v58, [v70 keySpec]))break; {
                                if (v67 == ++v69)
                                }
                                {
                                  uint64_t v67 = [v65 countByEnumeratingWithState:&v108 objects:v160 count:16];
                                  if (v67) {
                                    goto LABEL_103;
                                  }
                                  goto LABEL_109;
                                }
                              }
                            }
                            else
                            {
LABEL_109:
                              uint64_t v70 = objc_msgSend(MEMORY[0x263F38378], "bestMatchUsingObjects:getAttributeValueUsing:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:deploymentTarget:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsFeatureSetClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v64, "reference"), "renditions"), "allObjects"), &__block_literal_global_785, objc_msgSend((id)objc_msgSend(v58, "idiom"), "identifier"), objc_msgSend(v58, "subtype"), objc_msgSend((id)objc_msgSend(v58, "gamut"), "identifier"), objc_msgSend((id)objc_msgSend(v58, "target"), "identifier"), (double)objc_msgSend(v58, "scaleFactor"), objc_msgSend((id)objc_msgSend(v58, "direction"), "identifier"), objc_msgSend((id)objc_msgSend(v58, "sizeClassHorizontal"),
                                                              "identifier"),
                                              objc_msgSend((id)objc_msgSend(v58, "sizeClassVertical"), "identifier"), objc_msgSend(v58, "memoryClass"), objc_msgSend((id)objc_msgSend(v58, "graphicsFeatureSetClass"), "identifier"), 0, 0);
                              if (!v70) {
                                objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 6060, @"We don't have a closest match in the layerstack oops");
                              }
                              id v61 = v99;
                            }
                            [(CoreThemeDocument *)self _addResolvedLayerReferenceToFlattenedImageRendition:v61 usingArtworkRendition:v70 andLayerReference:v64];
                          }
                          uint64_t v107 = [v100 countByEnumeratingWithState:&v112 objects:v161 count:16];
                        }
                        while (v107);
                      }
                      [v61 setOpaque:1];
                      uint64_t v56 = v97;
                      [v97 canvasSize];
                      objc_msgSend(v61, "setWidth:", objc_msgSend(v58, "scaleFactor") * (int)v71);
                      [v97 canvasSize];
                      objc_msgSend(v61, "setHeight:", objc_msgSend(v58, "scaleFactor") * (int)v72);
                      id v73 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
                      [v73 setPart:v94];
                      objc_msgSend(v73, "setScaleFactor:", objc_msgSend(v58, "scaleFactor"));
                      objc_msgSend(v73, "setIdiom:", objc_msgSend(v58, "idiom"));
                      objc_msgSend(v73, "setSubtype:", objc_msgSend(v58, "subtype"));
                      objc_msgSend(v73, "setGamut:", objc_msgSend(v58, "gamut"));
                      [v61 setCompressionType:v98];
                      objc_msgSend(v73, "setElement:", objc_msgSend((id)objc_msgSend(v95, "baseKeySpec"), "element"));
                      objc_msgSend(v73, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v96, "identifier"), "unsignedIntValue"));
                      [v61 setKeySpec:v73];
                      [v61 setProduction:v95];
                      if (objc_msgSend((id)objc_msgSend(v61, "compressionType"), "identifier") != 4
                        && objc_msgSend((id)objc_msgSend(v61, "compressionType"), "identifier") != 5)
                      {
                        break;
                      }
                      [v73 setGraphicsFeatureSetClass:v91];
                      objc_msgSend(v73, "setTarget:", objc_msgSend(v92, "objectAtIndexedSubscript:", 1));
                    }
                    uint64_t v57 = v90 + 1;
                  }
                  while (v90 + 1 != v88);
                  uint64_t v88 = [v103 countByEnumeratingWithState:&v116 objects:v162 count:16];
                }
                while (v88);
              }
              uint64_t v19 = v84 + 1;
            }
            while (v84 + 1 != v83);
            uint64_t v83 = [v81 countByEnumeratingWithState:&v148 objects:v170 count:16];
          }
          while (v83);
        }

        uint64_t v4 = v78 + 1;
      }
      while (v78 + 1 != v77);
      uint64_t v77 = [obj countByEnumeratingWithState:&v156 objects:v172 count:16];
    }
    while (v77);
  }
  [(CoreThemeDocument *)self _makeRadiosityImages];
  [(CoreThemeDocument *)self _makeSolidLayerStackTextures];
}

uint64_t __39__CoreThemeDocument__tidyUpLayerStacks__block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  return __valueForAttributeNamed(a2, a3);
}

- (void)_tidyUpRecognitionImages
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [(CoreThemeDocument *)self allObjectsForEntity:@"ContentsRenditionSpec" withSortDescriptors:0];
  uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v38;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v2;
        id v3 = *(void **)(*((void *)&v37 + 1) + 8 * v2);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v22 = (id)[v3 contains];
        uint64_t v4 = [v22 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v24 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v5; ++i)
            {
              if (*(void *)v34 != v24) {
                objc_enumerationMutation(v22);
              }
              id v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"NamedArtworkProduction", [MEMORY[0x263F08A98] predicateWithFormat:@"name.name == %@", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "name")], 0);
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v42 count:16];
              if (v8)
              {
                uint64_t v9 = v8;
                uint64_t v10 = *(void *)v30;
                do
                {
                  for (uint64_t j = 0; j != v9; ++j)
                  {
                    if (*(void *)v30 != v10) {
                      objc_enumerationMutation(v7);
                    }
                    uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                    [v12 setRecognitionImage:1];
                    long long v27 = 0u;
                    long long v28 = 0u;
                    long long v25 = 0u;
                    long long v26 = 0u;
                    uint64_t v13 = (void *)[v12 renditions];
                    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v41 count:16];
                    if (v14)
                    {
                      uint64_t v15 = v14;
                      uint64_t v16 = *(void *)v26;
                      do
                      {
                        for (uint64_t k = 0; k != v15; ++k)
                        {
                          if (*(void *)v26 != v16) {
                            objc_enumerationMutation(v13);
                          }
                          [*(id *)(*((void *)&v25 + 1) + 8 * k) setMonochrome:1];
                        }
                        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v41 count:16];
                      }
                      while (v15);
                    }
                  }
                  uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v42 count:16];
                }
                while (v9);
              }
            }
            uint64_t v5 = [v22 countByEnumeratingWithState:&v33 objects:v43 count:16];
          }
          while (v5);
        }
        uint64_t v2 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v20);
  }
}

- (void)_makeSolidLayerStackTextures
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  [(CoreThemeDocument *)self targetPlatform];
  if (CUISDFTexturesSupported())
  {
    id v3 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"LayerStackProduction", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"renditionType.identifier == %d", 1018), 0);
    id v49 = [(CoreThemeDocument *)self elementWithIdentifier:41];
    id v48 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1007];
    id v47 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:10];
    uint64_t v52 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"NamedTextureProduction", 0, 0));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = v3;
    uint64_t v36 = [v3 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v36)
    {
      uint64_t v4 = @"RenditionKeySpec";
      uint64_t v35 = *(void *)v68;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v68 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v5;
          uint64_t v6 = *(void **)(*((void *)&v67 + 1) + 8 * v5);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v38 = (id)[v6 renditions];
          uint64_t v40 = [v38 countByEnumeratingWithState:&v63 objects:v73 count:16];
          if (v40)
          {
            uint64_t v39 = *(void *)v64;
            do
            {
              uint64_t v7 = 0;
              do
              {
                if (*(void *)v64 != v39) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v41 = v7;
                uint64_t v8 = *(void **)(*((void *)&v63 + 1) + 8 * v7);
                long long v59 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                id v42 = (id)[v8 layerReferences];
                uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v72 count:16];
                if (v44)
                {
                  uint64_t v43 = *(void *)v60;
                  do
                  {
                    uint64_t v9 = 0;
                    do
                    {
                      if (*(void *)v60 != v43) {
                        objc_enumerationMutation(v42);
                      }
                      uint64_t v45 = v9;
                      uint64_t v10 = *(void **)(*((void *)&v59 + 1) + 8 * v9);
                      long long v55 = 0u;
                      long long v56 = 0u;
                      long long v57 = 0u;
                      long long v58 = 0u;
                      id v46 = (id)objc_msgSend((id)objc_msgSend(v10, "reference"), "renditions");
                      uint64_t v51 = [v46 countByEnumeratingWithState:&v55 objects:v71 count:16];
                      if (v51)
                      {
                        uint64_t v50 = *(void *)v56;
                        do
                        {
                          uint64_t v11 = 0;
                          do
                          {
                            if (*(void *)v56 != v50) {
                              objc_enumerationMutation(v46);
                            }
                            uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8 * v11);
                            uint64_t v13 = (CGImage *)objc_msgSend(v12, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)objc_msgSend(v12, "asset"), "fileURLWithDocument:", self), self, 0, 0);
                            [(CoreThemeDocument *)self targetPlatform];
                            CUICreateSDFEdgeTexturePixelFormat();
                            id v14 = [(CoreThemeDocument *)self pixelFormatWithIdentifier:CUIConvertFromTXRPixelFormat()];
                            [(CoreThemeDocument *)self targetPlatform];
                            CUICreateSDFGradientTexturePixelFormat();
                            id v15 = [(CoreThemeDocument *)self pixelFormatWithIdentifier:CUIConvertFromTXRPixelFormat()];
                            uint64_t v16 = objc_msgSend(v52, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name.identifier == %d", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "production"), "name"), "identifier")));
                            id v53 = v15;
                            uint64_t v54 = v11;
                            if ([v16 firstObject]
                              && ([v16 firstObject], objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v17 = (id)[v16 firstObject];
                            }
                            else
                            {
                              id v17 = [(CoreThemeDocument *)self newObjectForEntity:@"NamedTextureProduction"];
                              id v18 = [(CoreThemeDocument *)self newObjectForEntity:v4];
                              objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v18);
                              [v17 setBaseKeySpec:v18];
                              objc_msgSend((id)objc_msgSend(v17, "baseKeySpec"), "setElement:", v49);
                              objc_msgSend(v17, "setName:", objc_msgSend((id)objc_msgSend(v12, "production"), "name"));
                              objc_msgSend(v17, "setTextureInterpretation:", -[CoreThemeDocument textureInterpretaitionWithIdentifier:](self, "textureInterpretaitionWithIdentifier:", 0));
                              [v17 setRenditionType:v48];
                              [v17 setRenditionSubtype:v47];
                              objc_msgSend(v17, "setTags:", objc_msgSend((id)objc_msgSend(v12, "production"), "tags"));

                              [v52 addObject:v17];
                            }
                            id v19 = -[CoreThemeDocument createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:](self, "createAssetWithName:fileType:scaleFactor:inCategory:forThemeBitSource:", objc_msgSend((id)objc_msgSend(v12, "asset"), "name"), @"texture", objc_msgSend((id)objc_msgSend(v12, "asset"), "scaleFactor"), objc_msgSend((id)objc_msgSend(v12, "asset"), "category"), objc_msgSend((id)objc_msgSend(v12, "asset"), "source"));
                            id v20 = [(CoreThemeDocument *)self newObjectForEntity:v4];
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v20);
                            id v21 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureRenditionSpec"];
                            [v21 setProduction:v17];
                            [v21 setPixelFormat:v14];
                            objc_msgSend(v21, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            [v21 setCubeMap:0];
                            [v21 setWidth:CGImageGetWidth(v13)];
                            [v21 setHeight:CGImageGetWidth(v13)];
                            [v21 setKeySpec:v20];
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setDimension1:", 1);
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setDimension2:", 0);
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            objc_msgSend((id)objc_msgSend(v21, "keySpec"), "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 0));

                            id v22 = [(CoreThemeDocument *)self newObjectForEntity:v4];
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v22);
                            id v23 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureRawRenditionSpec"];
                            [v23 setProduction:v17];
                            [v19 addRenditionsObject:v23];
                            [v23 setAsset:v19];
                            objc_msgSend(v23, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            [v23 setKeySpec:v22];
                            uint64_t v24 = v4;
                            objc_msgSend((id)objc_msgSend(v23, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            id v25 = [(CoreThemeDocument *)self partWithIdentifier:181];
                            long long v26 = (void *)[v23 keySpec];
                            id v27 = v25;
                            uint64_t v4 = v24;
                            [v26 setPart:v27];
                            objc_msgSend((id)objc_msgSend(v23, "keySpec"), "setDimension1:", 1);
                            objc_msgSend((id)objc_msgSend(v23, "keySpec"), "setDimension2:", 0);
                            [v23 setWidth:CGImageGetWidth(v13)];
                            [v23 setHeight:CGImageGetWidth(v13)];

                            id v28 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureMipLevel"];
                            [v28 setTexture:v21];
                            [v28 setTextureImage:v23];
                            [v28 setLevel:0];
                            [v21 addMipLevelsObject:v28];

                            id v29 = [(CoreThemeDocument *)self newObjectForEntity:v24];
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v29);
                            id v30 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureRenditionSpec"];
                            [v30 setProduction:v17];
                            [v30 setPixelFormat:v53];
                            objc_msgSend(v30, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            [v30 setCubeMap:0];
                            [v30 setWidth:CGImageGetWidth(v13)];
                            [v30 setHeight:CGImageGetWidth(v13)];
                            [v30 setKeySpec:v29];
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 0));
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setDimension1:", 2);
                            objc_msgSend((id)objc_msgSend(v30, "keySpec"), "setDimension2:", 0);

                            id v31 = [(CoreThemeDocument *)self newObjectForEntity:v24];
                            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", v31);
                            id v32 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureRawRenditionSpec"];
                            [v32 setProduction:v17];
                            [v19 addRenditionsObject:v32];
                            [v32 setAsset:v19];
                            objc_msgSend(v32, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 0));
                            [v32 setKeySpec:v31];
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setElement:", -[CoreThemeDocument elementWithIdentifier:](self, "elementWithIdentifier:", 41));
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setPart:", -[CoreThemeDocument partWithIdentifier:](self, "partWithIdentifier:", 181));
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setDimension1:", 2);
                            objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setDimension2:", 0);
                            [v32 setWidth:CGImageGetWidth(v13)];
                            [v32 setHeight:CGImageGetWidth(v13)];

                            id v33 = [(CoreThemeDocument *)self newObjectForEntity:@"TextureMipLevel"];
                            [v33 setTexture:v30];
                            [v33 setTextureImage:v32];
                            [v33 setLevel:0];
                            [v30 addMipLevelsObject:v33];

                            CGImageRelease(v13);
                            uint64_t v11 = v54 + 1;
                          }
                          while (v51 != v54 + 1);
                          uint64_t v51 = [v46 countByEnumeratingWithState:&v55 objects:v71 count:16];
                        }
                        while (v51);
                      }
                      uint64_t v9 = v45 + 1;
                    }
                    while (v45 + 1 != v44);
                    uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v72 count:16];
                  }
                  while (v44);
                }
                uint64_t v7 = v41 + 1;
              }
              while (v41 + 1 != v40);
              uint64_t v40 = [v38 countByEnumeratingWithState:&v63 objects:v73 count:16];
            }
            while (v40);
          }
          uint64_t v5 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v36);
    }
  }
}

- (void)createNamedRenditionGroupProductionsForImportInfos:(id)a3 error:(id *)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v48 = [(CoreThemeDocument *)self idioms];
  id v47 = [(CoreThemeDocument *)self sizeClasses];
  id v46 = [(CoreThemeDocument *)self displayGamuts];
  id v45 = [(CoreThemeDocument *)self directions];
  id v44 = [(CoreThemeDocument *)self featureSetClasses];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v6 = [(CoreThemeDocument *)self objectsForEntity:@"Tag" withPredicate:0 sortDescriptors:0];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v68 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", *(void *)(*((void *)&v67 + 1) + 8 * i)), objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * i), "identifier"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v8);
  }
  id v43 = [(CoreThemeDocument *)self elementWithIdentifier:85];
  id v42 = [(CoreThemeDocument *)self partWithIdentifier:206];
  id v41 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1013];
  uint64_t v50 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"GroupedRecognitionProduction", 0, 0));
  id v40 = [(CoreThemeDocument *)self renditionSubtypeWithIdentifier:10];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v51 = [a3 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v51)
  {
    uint64_t v49 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v64 != v49) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v63 + 1) + 8 * j);
        uint64_t v13 = (void *)[v50 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name.name == %@", objc_msgSend(v12, "name"))];
        if ([v13 firstObject]
          && ([v13 firstObject], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [v13 firstObject];
        }
        else
        {
          id v14 = [(CoreThemeDocument *)self newObjectForEntity:@"GroupedRecognitionProduction"];
          id v15 = -[CoreThemeDocument _createNamedElementWithIdentifier:](self, "_createNamedElementWithIdentifier:", [v12 nameIdentifier]);
          objc_msgSend(v15, "setName:", objc_msgSend(v12, "name"));
          [v15 setProduction:v14];
          id v16 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
          [v14 setBaseKeySpec:v16];
          [v16 setElement:v43];
          [v16 setPart:v42];
          objc_msgSend(v16, "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v15, "identifier"), "unsignedIntValue"));
          objc_msgSend(v14, "setDateOfLastChange:", objc_msgSend(v12, "modificationDate"));
          objc_msgSend(v14, "setOptOutOfThinning:", objc_msgSend(v12, "optOutOfThinning"));
          [v14 setRenditionType:v41];
          [v14 setRenditionSubtype:v40];

          uint64_t v54 = j;
          if (v12)
          {
            id v17 = (void *)[v12 tags];
            if ([v17 count])
            {
              uint64_t v39 = v14;
              uint64_t v52 = v12;
              id v18 = objc_alloc_init(MEMORY[0x263EFF9C0]);
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v72 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v60;
                do
                {
                  for (uint64_t k = 0; k != v20; ++k)
                  {
                    if (*(void *)v60 != v21) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v59 + 1) + 8 * k);
                    uint64_t v24 = (void *)[v5 objectForKey:v23];
                    if ([v24 count])
                    {
                      if ([v24 count] != 1) {
                        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 6391, @"We should ONLY have 1 tag with a name, tag names need to be Unique");
                      }
                      id v25 = (id)[v24 objectAtIndex:0];
                    }
                    else
                    {
                      id v25 = [(CoreThemeDocument *)self newObjectForEntity:@"Tag"];
                      [v25 setIdentifier:v23];
                      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v25), v23);
                    }
                    [v18 addObject:v25];
                  }
                  uint64_t v20 = [v17 countByEnumeratingWithState:&v59 objects:v72 count:16];
                }
                while (v20);
              }
              id v14 = v39;
              [v39 addTags:v18];
              uint64_t v26 = [v17 count];
              if (v26 != [v18 count]) {
                objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 6398, @"Supplied tags should always equal the count of tags on the production else the counts are wrong");
              }

              uint64_t v12 = v52;
            }
            if (objc_msgSend((id)objc_msgSend(v12, "universalTypeIdentifier"), "length")) {
              objc_msgSend(v14, "setUniversalTypeIdentifier:", objc_msgSend(v12, "universalTypeIdentifier"));
            }
          }
          id v27 = [(CoreThemeDocument *)self newObjectForEntity:@"ContentsRenditionSpec"];
          [v27 setProduction:v14];
          [v27 resetToBaseKeySpec];
          id v53 = v27;
          id v28 = (void *)[v27 keySpec];
          objc_msgSend(v28, "setIdiom:", objc_msgSend(v48, "objectAtIndexedSubscript:", objc_msgSend(v12, "idiom")));
          objc_msgSend(v28, "setScaleFactor:", objc_msgSend(v12, "scaleFactor"));
          objc_msgSend(v28, "setSubtype:", objc_msgSend(v12, "subtype"));
          objc_msgSend(v28, "setGamut:", objc_msgSend(v46, "objectAtIndexedSubscript:", objc_msgSend(v12, "displayGamut")));
          objc_msgSend(v28, "setSizeClassHorizontal:", objc_msgSend(v47, "objectAtIndexedSubscript:", objc_msgSend(v12, "sizeClassHorizontal")));
          objc_msgSend(v28, "setSizeClassVertical:", objc_msgSend(v47, "objectAtIndexedSubscript:", objc_msgSend(v12, "sizeClassVertical")));
          objc_msgSend(v28, "setMemoryClass:", objc_msgSend(v12, "memoryClass"));
          objc_msgSend(v28, "setDirection:", objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v12, "layoutDirection")));
          objc_msgSend(v28, "setGraphicsFeatureSetClass:", objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(v12, "graphicsFeatureSetClass")));
          objc_msgSend(v28, "setAppearance:", -[CoreThemeDocument appearanceWithIdentifier:name:createIfNeeded:](self, "appearanceWithIdentifier:name:createIfNeeded:", objc_msgSend(v12, "appearanceIdentifier"), objc_msgSend(v12, "appearanceName"), 1));
          objc_msgSend(v28, "setLocalization:", -[CoreThemeDocument localizationWithIdentifier:name:createIfNeeded:](self, "localizationWithIdentifier:name:createIfNeeded:", objc_msgSend(v12, "localizationIdentifier"), objc_msgSend(v12, "localizationName"), 1));
          id v29 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v30 = (void *)[v12 containedImageNames];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v56;
            do
            {
              for (uint64_t m = 0; m != v32; ++m)
              {
                if (*(void *)v56 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void *)(*((void *)&v55 + 1) + 8 * m);
                id v36 = [(CoreThemeDocument *)self newObjectForEntity:@"ContentsName"];
                [v36 setName:v35];
                [v29 addObject:v36];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v55 objects:v71 count:16];
            }
            while (v32);
          }
          [v53 setContains:v29];

          uint64_t j = v54;
        }
      }
      uint64_t v51 = [a3 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v51);
  }
}

- (BOOL)_production:(id)a3 containsScale:(unsigned int)a4 andIdiom:(unsigned int)a5 andSubtype:(unsigned int)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = objc_msgSend(a3, "renditions", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor") == a4
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "keySpec"), "idiom"), "identifier") == a5
          && objc_msgSend((id)objc_msgSend(v14, "keySpec"), "subtype") == a6)
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v11 = v10;
      if (v10) {
        continue;
      }
      break;
    }
  }
  return v10;
}

- (void)_generateWatchImages
{
  uint64_t v188 = *MEMORY[0x263EF8340];
  if ([(CoreThemeDocument *)self targetPlatform] == 4)
  {
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    obuint64_t j = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"SimpleArtworkElementProduction", [MEMORY[0x263F08A98] predicateWithFormat:@"autoscalingType > 0"], 0);
    uint64_t v130 = [obj countByEnumeratingWithState:&v174 objects:v187 count:16];
    if (v130)
    {
      uint64_t v129 = *(void *)v175;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v175 != v129)
          {
            uint64_t v4 = v3;
            objc_enumerationMutation(obj);
            uint64_t v3 = v4;
          }
          uint64_t v131 = v3;
          id v5 = *(void **)(*((void *)&v174 + 1) + 8 * v3);
          id v132 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v170 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          long long v173 = 0u;
          long long v136 = v5;
          id v6 = (void *)[v5 renditions];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v170 objects:v186 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v171;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v171 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void **)(*((void *)&v170 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && objc_msgSend((id)objc_msgSend(v11, "asset"), "scaleFactor")
                  && (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "idiom"), "identifier")|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "idiom"), "identifier") == 5)&& !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphSize"), "identifier")&& !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphWeight"), "identifier")&& (!objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "asset"), "name"), "pathExtension"), "caseInsensitiveCompare:", @"PDF")|| !objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "asset"), "name"), "pathExtension"), "caseInsensitiveCompare:", @"SVG")))
                {
                  [v132 addObject:v11];
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v170 objects:v186 count:16];
            }
            while (v8);
          }
          long long v168 = 0u;
          long long v169 = 0u;
          long long v166 = 0u;
          long long v167 = 0u;
          uint64_t v12 = v136;
          uint64_t v134 = [v132 countByEnumeratingWithState:&v166 objects:v185 count:16];
          if (v134)
          {
            uint64_t v133 = *(void *)v167;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v167 != v133) {
                  objc_enumerationMutation(v132);
                }
                uint64_t v135 = v13;
                id v14 = *(void **)(*((void *)&v166 + 1) + 8 * v13);
                id v15 = (void *)[v14 entity];
                long long v137 = v15;
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 320))
                {
                  id v16 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", [v15 name]);
                  long long v17 = (void *)[v14 slices];
                  if ([v17 count])
                  {
                    long long v18 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v17, "count"));
                    long long v162 = 0u;
                    long long v163 = 0u;
                    long long v164 = 0u;
                    long long v165 = 0u;
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v162 objects:v184 count:16];
                    if (v19)
                    {
                      uint64_t v20 = v19;
                      uint64_t v21 = *(void *)v163;
                      do
                      {
                        for (uint64_t j = 0; j != v20; ++j)
                        {
                          if (*(void *)v163 != v21) {
                            objc_enumerationMutation(v17);
                          }
                          [*(id *)(*((void *)&v162 + 1) + 8 * j) sliceRect];
                          double v24 = v23;
                          double v26 = v25;
                          double v28 = v27;
                          double v30 = v29;
                          id v31 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                          objc_msgSend(v31, "setSliceRect:", v24, v26, v28, v30);
                          [v18 addObject:v31];
                        }
                        uint64_t v20 = [v17 countByEnumeratingWithState:&v162 objects:v184 count:16];
                      }
                      while (v20);
                    }
                    [v16 setSlices:v18];
                    uint64_t v12 = v136;
                    id v15 = v137;
                  }
                  objc_msgSend(v16, "setAsset:", objc_msgSend(v14, "asset"));
                  [v16 setProduction:v12];
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v16);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v16, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v16, "keySpec"), "setSubtype:", 320);
                  [v16 setPostScaleFactor:0.91];
                  objc_msgSend(v16, "setCompressionType:", objc_msgSend(v14, "compressionType"));
                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 384))
                {
                  id v32 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", [v15 name]);
                  uint64_t v33 = (void *)[v14 slices];
                  if ([v33 count])
                  {
                    long long v34 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v33, "count"));
                    long long v158 = 0u;
                    long long v159 = 0u;
                    long long v160 = 0u;
                    long long v161 = 0u;
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v158 objects:v183 count:16];
                    if (v35)
                    {
                      uint64_t v36 = v35;
                      uint64_t v37 = *(void *)v159;
                      do
                      {
                        for (uint64_t k = 0; k != v36; ++k)
                        {
                          if (*(void *)v159 != v37) {
                            objc_enumerationMutation(v33);
                          }
                          [*(id *)(*((void *)&v158 + 1) + 8 * k) sliceRect];
                          double v40 = v39;
                          double v42 = v41;
                          double v44 = v43;
                          double v46 = v45;
                          id v47 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                          objc_msgSend(v47, "setSliceRect:", v40, v42, v44, v46);
                          [v34 addObject:v47];
                        }
                        uint64_t v36 = [v33 countByEnumeratingWithState:&v158 objects:v183 count:16];
                      }
                      while (v36);
                    }
                    [v32 setSlices:v34];
                    uint64_t v12 = v136;
                    id v15 = v137;
                  }
                  objc_msgSend(v32, "setAsset:", objc_msgSend(v14, "asset"));
                  [v32 setProduction:v12];
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v32);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v32, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v32, "keySpec"), "setSubtype:", 384);
                  [v32 setPostScaleFactor:1.0];
                  objc_msgSend(v32, "setCompressionType:", objc_msgSend(v14, "compressionType"));
                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 340))
                {
                  id v48 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", [v15 name]);
                  uint64_t v49 = (void *)[v14 slices];
                  if ([v49 count])
                  {
                    uint64_t v50 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v49, "count"));
                    long long v154 = 0u;
                    long long v155 = 0u;
                    long long v156 = 0u;
                    long long v157 = 0u;
                    uint64_t v51 = [v49 countByEnumeratingWithState:&v154 objects:v182 count:16];
                    if (v51)
                    {
                      uint64_t v52 = v51;
                      uint64_t v53 = *(void *)v155;
                      do
                      {
                        for (uint64_t m = 0; m != v52; ++m)
                        {
                          if (*(void *)v155 != v53) {
                            objc_enumerationMutation(v49);
                          }
                          [*(id *)(*((void *)&v154 + 1) + 8 * m) sliceRect];
                          double v56 = v55;
                          double v58 = v57;
                          double v60 = v59;
                          double v62 = v61;
                          id v63 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                          objc_msgSend(v63, "setSliceRect:", v56, v58, v60, v62);
                          [v50 addObject:v63];
                        }
                        uint64_t v52 = [v49 countByEnumeratingWithState:&v154 objects:v182 count:16];
                      }
                      while (v52);
                    }
                    [v48 setSlices:v50];
                    uint64_t v12 = v136;
                    id v15 = v137;
                  }
                  objc_msgSend(v48, "setAsset:", objc_msgSend(v14, "asset"));
                  [v48 setProduction:v12];
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v48);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v48, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v48, "keySpec"), "setSubtype:", 340);
                  [v48 setPostScaleFactor:1.0];
                  objc_msgSend(v48, "setCompressionType:", objc_msgSend(v14, "compressionType"));
                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 390))
                {
                  id v64 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", [v15 name]);
                  long long v65 = (void *)[v14 slices];
                  if ([v65 count])
                  {
                    long long v66 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v65, "count"));
                    long long v150 = 0u;
                    long long v151 = 0u;
                    long long v152 = 0u;
                    long long v153 = 0u;
                    uint64_t v67 = [v65 countByEnumeratingWithState:&v150 objects:v181 count:16];
                    if (v67)
                    {
                      uint64_t v68 = v67;
                      uint64_t v69 = *(void *)v151;
                      do
                      {
                        for (uint64_t n = 0; n != v68; ++n)
                        {
                          if (*(void *)v151 != v69) {
                            objc_enumerationMutation(v65);
                          }
                          [*(id *)(*((void *)&v150 + 1) + 8 * n) sliceRect];
                          double v72 = v71;
                          double v74 = v73;
                          double v76 = v75;
                          double v78 = v77;
                          id v79 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                          objc_msgSend(v79, "setSliceRect:", v72, v74, v76, v78);
                          [v66 addObject:v79];
                        }
                        uint64_t v68 = [v65 countByEnumeratingWithState:&v150 objects:v181 count:16];
                      }
                      while (v68);
                    }
                    [v64 setSlices:v66];
                    uint64_t v12 = v136;
                    id v15 = v137;
                  }
                  objc_msgSend(v64, "setAsset:", objc_msgSend(v14, "asset"));
                  [v64 setProduction:v12];
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v64);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v64, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v64, "keySpec"), "setSubtype:", 390);
                  [v64 setPostScaleFactor:1.1];
                  objc_msgSend(v64, "setCompressionType:", objc_msgSend(v14, "compressionType"));
                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 430))
                {
                  id v80 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", [v15 name]);
                  id v81 = (void *)[v14 slices];
                  if ([v81 count])
                  {
                    uint64_t v82 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v81, "count"));
                    long long v146 = 0u;
                    long long v147 = 0u;
                    long long v148 = 0u;
                    long long v149 = 0u;
                    uint64_t v83 = [v81 countByEnumeratingWithState:&v146 objects:v180 count:16];
                    if (v83)
                    {
                      uint64_t v84 = v83;
                      uint64_t v85 = *(void *)v147;
                      do
                      {
                        for (iuint64_t i = 0; ii != v84; ++ii)
                        {
                          if (*(void *)v147 != v85) {
                            objc_enumerationMutation(v81);
                          }
                          [*(id *)(*((void *)&v146 + 1) + 8 * ii) sliceRect];
                          double v88 = v87;
                          double v90 = v89;
                          double v92 = v91;
                          double v94 = v93;
                          id v95 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                          objc_msgSend(v95, "setSliceRect:", v88, v90, v92, v94);
                          [v82 addObject:v95];
                        }
                        uint64_t v84 = [v81 countByEnumeratingWithState:&v146 objects:v180 count:16];
                      }
                      while (v84);
                    }
                    [v80 setSlices:v82];
                    uint64_t v12 = v136;
                    id v15 = v137;
                  }
                  objc_msgSend(v80, "setAsset:", objc_msgSend(v14, "asset"));
                  [v80 setProduction:v12];
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v80);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v80, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v80, "keySpec"), "setSubtype:", 430);
                  [v80 setPostScaleFactor:1.06];
                  objc_msgSend(v80, "setCompressionType:", objc_msgSend(v14, "compressionType"));
                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 484))
                {
                  id v96 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", [v15 name]);
                  id v97 = (void *)[v14 slices];
                  if ([v97 count])
                  {
                    uint64_t v98 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v97, "count"));
                    long long v142 = 0u;
                    long long v143 = 0u;
                    long long v144 = 0u;
                    long long v145 = 0u;
                    uint64_t v99 = [v97 countByEnumeratingWithState:&v142 objects:v179 count:16];
                    if (v99)
                    {
                      uint64_t v100 = v99;
                      uint64_t v101 = *(void *)v143;
                      do
                      {
                        for (juint64_t j = 0; jj != v100; ++jj)
                        {
                          if (*(void *)v143 != v101) {
                            objc_enumerationMutation(v97);
                          }
                          [*(id *)(*((void *)&v142 + 1) + 8 * jj) sliceRect];
                          double v104 = v103;
                          double v106 = v105;
                          double v108 = v107;
                          double v110 = v109;
                          id v111 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                          objc_msgSend(v111, "setSliceRect:", v104, v106, v108, v110);
                          [v98 addObject:v111];
                        }
                        uint64_t v100 = [v97 countByEnumeratingWithState:&v142 objects:v179 count:16];
                      }
                      while (v100);
                    }
                    [v96 setSlices:v98];
                    uint64_t v12 = v136;
                    id v15 = v137;
                  }
                  objc_msgSend(v96, "setAsset:", objc_msgSend(v14, "asset"));
                  [v96 setProduction:v12];
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v96);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v96, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v96, "keySpec"), "setSubtype:", 484);
                  [v96 setPostScaleFactor:1.19];
                  objc_msgSend(v96, "setCompressionType:", objc_msgSend(v14, "compressionType"));
                }
                if (!-[CoreThemeDocument _production:containsScale:andIdiom:andSubtype:](self, "_production:containsScale:andIdiom:andSubtype:", v12, objc_msgSend((id)objc_msgSend(v14, "keySpec"), "scaleFactor"), 5, 502))
                {
                  id v112 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", [v15 name]);
                  long long v113 = (void *)[v14 slices];
                  if ([v113 count])
                  {
                    long long v114 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v113, "count"));
                    long long v138 = 0u;
                    long long v139 = 0u;
                    long long v140 = 0u;
                    long long v141 = 0u;
                    uint64_t v115 = [v113 countByEnumeratingWithState:&v138 objects:v178 count:16];
                    if (v115)
                    {
                      uint64_t v116 = v115;
                      uint64_t v117 = *(void *)v139;
                      do
                      {
                        for (kuint64_t k = 0; kk != v116; ++kk)
                        {
                          if (*(void *)v139 != v117) {
                            objc_enumerationMutation(v113);
                          }
                          [*(id *)(*((void *)&v138 + 1) + 8 * kk) sliceRect];
                          double v120 = v119;
                          double v122 = v121;
                          double v124 = v123;
                          double v126 = v125;
                          id v127 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                          objc_msgSend(v127, "setSliceRect:", v120, v122, v124, v126);
                          [v114 addObject:v127];
                        }
                        uint64_t v116 = [v113 countByEnumeratingWithState:&v138 objects:v178 count:16];
                      }
                      while (v116);
                    }
                    [v112 setSlices:v114];
                    uint64_t v12 = v136;
                  }
                  objc_msgSend(v112, "setAsset:", objc_msgSend(v14, "asset"));
                  [v112 setProduction:v12];
                  objc_msgSend((id)objc_msgSend(v14, "production"), "processRendition:withBackstop:", v14, v112);
                  objc_msgSend((id)objc_msgSend(v14, "keySpec"), "copyAttributesInto:", objc_msgSend(v112, "keySpec"));
                  objc_msgSend((id)objc_msgSend(v112, "keySpec"), "setSubtype:", 502);
                  [v112 setPostScaleFactor:1.19];
                  objc_msgSend(v112, "setCompressionType:", objc_msgSend(v14, "compressionType"));
                }
                uint64_t v13 = v135 + 1;
              }
              while (v135 + 1 != v134);
              uint64_t v134 = [v132 countByEnumeratingWithState:&v166 objects:v185 count:16];
            }
            while (v134);
          }

          uint64_t v3 = v131 + 1;
        }
        while (v131 + 1 != v130);
        uint64_t v130 = [obj countByEnumeratingWithState:&v174 objects:v187 count:16];
      }
      while (v130);
    }
  }
}

- (void)_backwardsCompatibilityPatchForLayoutDirection
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (![(CoreThemeDocument *)self featureEnabled:9])
  {
    id v3 = [(CoreThemeDocument *)self directionWithIdentifier:5];
    id v4 = [(CoreThemeDocument *)self directionWithIdentifier:4];
    id v39 = [(CoreThemeDocument *)self directionWithIdentifier:0];
    id v5 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"SimpleArtworkRenditionSpec", [MEMORY[0x263F08A98] predicateWithFormat:@"keySpec.direction == %@ OR keySpec.direction == %@", v3, v4], 0);
    id v6 = (void *)[MEMORY[0x263EFF980] array];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v61 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = [*(id *)(*((void *)&v60 + 1) + 8 * i) production];
          if (([v6 containsObject:v11] & 1) == 0) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v8);
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v12 = v39;
    uint64_t v41 = [v6 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v57;
      uint64_t v37 = v6;
      id v38 = v3;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v57 != v40) {
            objc_enumerationMutation(v6);
          }
          id v14 = *(void **)(*((void *)&v56 + 1) + 8 * v13);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v42 = v13;
          double v43 = v14;
          id v15 = (void *)[v14 renditions];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v53;
LABEL_18:
            uint64_t v19 = 0;
            while (1)
            {
              if (*(void *)v53 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v52 + 1) + 8 * v19);
              if ((id)objc_msgSend((id)objc_msgSend(v20, "keySpec"), "direction") == v12
                || !objc_msgSend((id)objc_msgSend(v20, "keySpec"), "direction"))
              {
                break;
              }
              if (v17 == ++v19)
              {
                uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
                if (v17) {
                  goto LABEL_18;
                }
                goto LABEL_25;
              }
            }
          }
          else
          {
LABEL_25:
            id v21 = [(CoreThemeDocument *)self newObjectForEntity:@"SimpleArtworkRenditionSpec"];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v22 = (void *)[v43 renditions];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v65 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v49;
LABEL_27:
              uint64_t v26 = 0;
              while (1)
              {
                if (*(void *)v49 != v25) {
                  objc_enumerationMutation(v22);
                }
                double v27 = *(void **)(*((void *)&v48 + 1) + 8 * v26);
                if ((id)objc_msgSend((id)objc_msgSend(v27, "keySpec"), "direction") == v3) {
                  break;
                }
                if (v24 == ++v26)
                {
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v65 count:16];
                  if (v24) {
                    goto LABEL_27;
                  }
                  goto LABEL_35;
                }
              }
              if (v27) {
                goto LABEL_36;
              }
            }
LABEL_35:
            double v27 = objc_msgSend((id)objc_msgSend(v43, "renditions"), "anyObject");
LABEL_36:
            [v27 alignmentRect];
            objc_msgSend(v21, "setAlignmentRect:");
            objc_msgSend(v21, "setAlignmentRectString:", (id)objc_msgSend((id)objc_msgSend(v27, "alignmentRectString"), "copy"));
            objc_msgSend(v21, "setIsTintable:", objc_msgSend(v27, "isTintable"));
            objc_msgSend(v21, "setNonAlphaImageAreaString:", (id)objc_msgSend((id)objc_msgSend(v27, "nonAlphaImageAreaString"), "copy"));
            objc_msgSend(v21, "setOriginalImageSizeString:", (id)objc_msgSend((id)objc_msgSend(v27, "originalImageSizeString"), "copy"));
            objc_msgSend(v21, "setAsset:", objc_msgSend(v27, "asset"));
            objc_msgSend(v21, "setCompressionType:", objc_msgSend(v27, "compressionType"));
            double v28 = (void *)[v27 slices];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v64 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v45 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                  id v34 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                  [v33 sliceRect];
                  objc_msgSend(v34, "setSliceRect:");
                  objc_msgSend(v34, "setSliceRectString:", (id)objc_msgSend((id)objc_msgSend(v33, "sliceRectString"), "copy"));
                  objc_msgSend(v34, "setProduction:", objc_msgSend(v33, "production"));
                  [v34 setRendition:v21];
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v64 count:16];
              }
              while (v30);
            }
            objc_msgSend(v21, "setAlphaCrop:", objc_msgSend(v27, "alphaCrop"));
            objc_msgSend(v21, "setHeight:", objc_msgSend(v27, "height"));
            objc_msgSend(v21, "setMonochrome:", objc_msgSend(v27, "monochrome"));
            objc_msgSend(v21, "setOpaque:", objc_msgSend(v27, "opaque"));
            objc_msgSend(v21, "setPackedPointX:", objc_msgSend(v27, "packedPointX"));
            objc_msgSend(v21, "setPackedPointY:", objc_msgSend(v27, "packedPointY"));
            objc_msgSend(v21, "setWidth:", objc_msgSend(v27, "width"));
            [v27 postScaleFactor];
            objc_msgSend(v21, "setPostScaleFactor:");
            [v43 addRenditionsObject:v21];
            objc_msgSend(v21, "setRenditionType:", objc_msgSend(v27, "renditionType"));
            id v35 = [(CoreThemeDocument *)self newObjectForEntity:@"RenditionKeySpec"];
            id v12 = v39;
            [v35 setDirection:v39];
            uint64_t v36 = (void *)[v27 keySpec];
            objc_msgSend(v35, "setDimension1:", objc_msgSend(v36, "dimension1"));
            objc_msgSend(v35, "setDimension2:", objc_msgSend(v36, "dimension2"));
            objc_msgSend(v35, "setMemoryClass:", objc_msgSend(v36, "memoryClass"));
            objc_msgSend(v35, "setNameIdentifier:", objc_msgSend(v36, "nameIdentifier"));
            objc_msgSend(v35, "setScaleFactor:", objc_msgSend(v36, "scaleFactor"));
            objc_msgSend(v35, "setSubtype:", objc_msgSend(v36, "subtype"));
            objc_msgSend(v35, "setElement:", objc_msgSend(v36, "element"));
            objc_msgSend(v35, "setGamut:", objc_msgSend(v36, "gamut"));
            objc_msgSend(v35, "setGraphicsFeatureSetClass:", objc_msgSend(v36, "graphicsFeatureSetClass"));
            objc_msgSend(v35, "setIdiom:", objc_msgSend(v36, "idiom"));
            objc_msgSend(v35, "setLayer:", objc_msgSend(v36, "layer"));
            objc_msgSend(v35, "setPart:", objc_msgSend(v36, "part"));
            objc_msgSend(v35, "setPresentationState:", objc_msgSend(v36, "presentationState"));
            objc_msgSend(v35, "setPreviousState:", objc_msgSend(v36, "previousState"));
            objc_msgSend(v35, "setSize:", objc_msgSend(v36, "size"));
            objc_msgSend(v35, "setSizeClassVertical:", objc_msgSend(v36, "sizeClassVertical"));
            objc_msgSend(v35, "setSizeClassHorizontal:", objc_msgSend(v36, "sizeClassHorizontal"));
            objc_msgSend(v35, "setState:", objc_msgSend(v36, "state"));
            objc_msgSend(v35, "setTarget:", objc_msgSend(v36, "target"));
            objc_msgSend(v35, "setValue:", objc_msgSend(v36, "value"));
            objc_msgSend(v35, "setGlyphSize:", objc_msgSend(v36, "glyphSize"));
            objc_msgSend(v35, "setGlyphWeight:", objc_msgSend(v36, "glyphWeight"));
            objc_msgSend(v35, "setAppearance:", objc_msgSend(v36, "appearance"));
            objc_msgSend(v35, "setLocalization:", objc_msgSend(v36, "localization"));
            [v21 setKeySpec:v35];
            id v6 = v37;
            id v3 = v38;
          }
          uint64_t v13 = v42 + 1;
        }
        while (v42 + 1 != v41);
        uint64_t v41 = [v6 countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v41);
    }
  }
}

- (void)importNamedAssetsFromFileURLs:(id)a3 referenceFiles:(BOOL)a4 completionHandler:(id)a5
{
  if (a4) {
    id v9 = [(CoreThemeDocument *)self _themeBitSourceForReferencedFilesAtURLs:a3 createIfNecessary:1];
  }
  else {
    id v9 = [(CoreThemeDocument *)self _themeBitSource:0];
  }
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(-[CoreThemeDocument rootPathForProductionData](self, "rootPathForProductionData"), "stringByAppendingPathComponent:", objc_msgSend(v9, "path"));
    uint64_t v12 = [NSURL fileURLWithPath:v11 isDirectory:1];
    global_queue = dispatch_get_global_queue(0, 0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke;
    v15[3] = &unk_264C44A80;
    BOOL v16 = a4;
    v15[4] = a3;
    v15[5] = self;
    v15[7] = v10;
    v15[8] = a5;
    v15[6] = v12;
    dispatch_async(global_queue, v15);
  }
  else if (a5)
  {
    id v14 = (void (*)(id, void, void))*((void *)a5 + 2);
    v14(a5, 0, 0);
  }
}

void __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[MEMORY[0x263EFF980] array];
  id v3 = objc_alloc_init(MEMORY[0x263F08850]);
  uint64_t v4 = [MEMORY[0x263EFF8C0] array];
  uint64_t v5 = *MEMORY[0x263EFF6A8];
  v29[0] = *MEMORY[0x263EFF6A8];
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = a1;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "resourceValuesForKeys:error:", v6, 0), "objectForKey:", v5), "BOOLValue"))
        {
          uint64_t v13 = (void *)[v3 enumeratorAtURL:v12 includingPropertiesForKeys:v4 options:6 errorHandler:0];
          uint64_t v14 = [v13 nextObject];
          if (v14)
          {
            uint64_t v15 = v14;
            do
            {
              [v2 addObject:v15];
              uint64_t v15 = [v13 nextObject];
            }
            while (v15);
          }
        }
        else
        {
          [v2 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)(v19 + 72))
  {
    char v16 = 1;
LABEL_18:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke_2;
    block[3] = &unk_264C44A58;
    block[4] = *(void *)(v19 + 40);
    block[5] = v2;
    char v22 = v16;
    long long v21 = *(_OWORD *)(v19 + 56);
    dispatch_async(MEMORY[0x263EF83A0], block);
    return;
  }
  id v23 = 0;
  uint64_t v17 = [(id)objc_opt_class() _imageAssetURLsByCopyingFileURLs:v2 toManagedLocationAtURL:*(void *)(v19 + 48) error:&v23];
  if (v17)
  {
    uint64_t v2 = (void *)v17;
    char v16 = *(unsigned char *)(v19 + 72);
    goto LABEL_18;
  }
  NSLog(&cfstr_UnableToImport.isa, [v23 localizedDescription]);
  uint64_t v18 = *(void *)(v19 + 64);
  if (v18) {
    (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v23);
  }
}

uint64_t __84__CoreThemeDocument_importNamedAssetsFromFileURLs_referenceFiles_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) undoManager];
  id v12 = 0;
  id v13 = 0;
  id v3 = (void *)MEMORY[0x237DD6000]([v2 disableUndoRegistration]);
  id v4 = (id)[*(id *)(a1 + 32) addAssetsAtFileURLs:*(void *)(a1 + 40) createProductions:0 referenceFiles:*(unsigned __int8 *)(a1 + 64) bitSource:*(void *)(a1 + 48) customInfos:0];
  uint64_t v5 = (void *)MEMORY[0x237DD6000]();
  [*(id *)(a1 + 32) createNamedArtworkProductionsForAssets:v4 customInfos:0 error:&v13];
  id v6 = v13;

  if (v13)
  {
    NSLog(&cfstr_UnableToImport_0.isa, [v13 localizedDescription]);
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v13);
    }
  }
  uint64_t v8 = (void *)MEMORY[0x237DD6000]();
  [*(id *)(a1 + 32) _tidyUpRecognitionImages];
  [*(id *)(a1 + 32) _generateWatchImages];
  [*(id *)(a1 + 32) _automaticSRGBGenerationFromP3];
  [*(id *)(a1 + 32) _automaticP3GenerationFromSRGB];
  [*(id *)(a1 + 32) _createForwardstopRenditions];
  [*(id *)(a1 + 32) _tidyUpLayerStacks];
  [*(id *)(a1 + 32) _optimizeForDeviceTraits];
  [*(id *)(a1 + 32) _backwardsCompatibilityPatchForLayoutDirection];
  uint64_t v9 = (void *)MEMORY[0x237DD6000]();
  [*(id *)(a1 + 32) packRenditionsError:&v12];
  id v10 = v12;
  [v2 enableUndoRegistration];
  if (v10) {
    NSLog(&cfstr_UnableToPackIm.isa, [v12 localizedDescription]);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, id))(result + 16))(result, v10 == 0, v12);
  }
  return result;
}

- (BOOL)canImportNamedAssetImportInfo:(id)a3
{
  if ([a3 renditionType] != 1018
    || ([(CoreThemeDocument *)self targetPlatform], LODWORD(v5) = CUISDFTexturesSupported(), v5))
  {
    if (![(CoreThemeDocument *)self featureEnabled:19]
      || [a3 renditionType] < 0
      || [a3 renditionType] > 5
      || (uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "fileURL"), "pathExtension"), "caseInsensitiveCompare:", @"HEIF")) != 0&& (uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "fileURL"), "pathExtension"), "caseInsensitiveCompare:", @"HEIC")) != 0)
    {
      [(CoreThemeDocument *)self targetPlatform];
      unsigned int v6 = CUIMaxScaleForTargetPlatform();
      LOBYTE(v5) = [(CoreThemeDocument *)self targetPlatform] == 4
                && [a3 idiom] == 5
                && [a3 scaleFactor] >= (unint64_t)v6
                || [a3 scaleFactor] <= (unint64_t)v6;
    }
  }
  return v5;
}

- (void)importNamedAssetsWithImportInfos:(id)a3 referenceFiles:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v18 = a4;
  uint64_t v8 = (void *)[MEMORY[0x263EFF980] array];
  double v28 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v24 = [MEMORY[0x263EFF980] array];
  uint64_t v23 = [MEMORY[0x263EFF980] array];
  long long v25 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v17 = [MEMORY[0x263EFF980] array];
  long long v26 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  uint64_t v20 = [MEMORY[0x263EFF980] array];
  uint64_t v21 = [MEMORY[0x263EFF980] array];
  id v10 = (void *)[MEMORY[0x263EFF980] array];
  long long v27 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v22 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v19 = [MEMORY[0x263EFF980] array];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v42 = 0;
  double v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  CUILogLogToStderr();
  self->_donotstoreDocumentChecksuuint64_t m = 1;
  *((unsigned char *)v43 + 24) = 0;
  id v13 = (void *)[MEMORY[0x263EFF980] array];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke;
  v39[3] = &unk_264C44AD0;
  int64x2_t v40 = vdupq_n_s64(0x404E000000000000uLL);
  v39[4] = self;
  v39[5] = a3;
  int64x2_t v41 = vdupq_n_s64(0x4056800000000000uLL);
  v39[6] = v13;
  v39[7] = a5;
  v39[8] = &v42;
  [a3 enumerateObjectsUsingBlock:v39];
  if (*((unsigned char *)v43 + 24)) {
    goto LABEL_2;
  }
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_3;
  v38[3] = &unk_264C44AF8;
  v38[4] = self;
  v38[5] = v27;
  v38[6] = v28;
  v38[7] = v24;
  v38[8] = v23;
  v38[9] = v26;
  v38[10] = v11;
  v38[11] = v25;
  v38[12] = v22;
  v38[13] = v8;
  v38[14] = v10;
  v38[15] = v12;
  [v13 enumerateObjectsUsingBlock:v38];
  if ([v12 count])
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_4;
    v37[3] = &unk_264C44B20;
    v37[4] = v12;
    [v8 enumerateObjectsUsingBlock:v37];
  }

  if ([v10 count])
  {
    if (a5) {
      (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.CoreThemeDefinition", 1, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Misconfigured TDNamedAssetInfo", *MEMORY[0x263F08320])));
    }
    goto LABEL_2;
  }
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_5;
  v36[3] = &unk_264C44B20;
  v36[4] = v20;
  [v8 enumerateObjectsUsingBlock:v36];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_6;
  v35[3] = &unk_264C44B20;
  v35[4] = v21;
  [v28 enumerateObjectsUsingBlock:v35];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_7;
  v34[3] = &unk_264C44B20;
  v34[4] = v21;
  [v27 enumerateObjectsUsingBlock:v34];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_8;
  v33[3] = &unk_264C44B20;
  v33[4] = v9;
  [v26 enumerateObjectsUsingBlock:v33];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_9;
  v32[3] = &unk_264C44B20;
  v32[4] = v19;
  [v11 enumerateObjectsUsingBlock:v32];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_10;
  v31[3] = &unk_264C44B20;
  v31[4] = v17;
  [v25 enumerateObjectsUsingBlock:v31];
  if (v18)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v14 addObjectsFromArray:v20];
    [v14 addObjectsFromArray:v21];
    [v14 addObjectsFromArray:v19];
    id v15 = [(CoreThemeDocument *)self _themeBitSourceForReferencedFilesAtURLs:v14 createIfNecessary:1];

    if (v15)
    {
LABEL_10:
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_11;
      block[3] = &unk_264C44B70;
      BOOL v30 = v18;
      block[4] = v20;
      block[5] = v21;
      void block[6] = v19;
      block[7] = self;
      block[8] = v15;
      block[9] = v8;
      block[10] = v28;
      block[11] = v11;
      block[12] = v22;
      block[13] = v25;
      block[14] = v24;
      block[15] = v26;
      block[16] = v23;
      block[17] = v27;
      block[18] = a5;
      dispatch_async(global_queue, block);
      goto LABEL_2;
    }
  }
  else
  {
    id v15 = [(CoreThemeDocument *)self _themeBitSource:0];
    if (v15) {
      goto LABEL_10;
    }
  }
  if (a5) {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
  }
LABEL_2:
  _Block_object_dispose(&v42, 8);
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 verify];
  if ([*(id *)(a1 + 32) targetPlatform] == 1
    && ![a2 renditionType]
    && [a2 idiom] == 1
    && [a2 scaleFactor] == 3)
  {
    objc_msgSend((id)objc_msgSend(a2, "iconSize"), "sizeValue");
    if (v8 == *(double *)(a1 + 72) && v7 == *(double *)(a1 + 80))
    {
      uint64_t v9 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_2;
      v12[3] = &unk_264C44AA8;
      v12[4] = a2;
      long long v13 = *(_OWORD *)(a1 + 88);
      if ([v9 indexOfObjectPassingTest:v12] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = (void *)[a2 copy];
        [v10 setScaleFactor:2];
        [v10 setSubtype:1792];
        objc_msgSend(v10, "setIconSize:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSize:", *(double *)(a1 + 88), *(double *)(a1 + 96)));
        [*(id *)(a1 + 48) addObject:v10];
      }
    }
  }
  if ([a2 graphicsFeatureSetClass] >= 10 && objc_msgSend(a2, "graphicsFeatureSetClass") != 10)
  {
    if ([a2 graphicsFeatureSetClass] == 11)
    {
      objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.CoreThemeDefinition", 4, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Unrecognised Metal GPU Family (Apple10) is not supported by this target platform", *MEMORY[0x263F08320], 0, 0));
      NSLog(&cfstr_Apple10NotSupp.isa);
LABEL_15:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      *a4 = 1;
      return [*(id *)(a1 + 48) addObject:a2];
    }
    if ([a2 graphicsFeatureSetClass] >= 12)
    {
      objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.CoreThemeDefinition", 10, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Unrecognised Metal GPU Family", *MEMORY[0x263F08320], 0, 0));
      NSLog(&cfstr_Apple10NotSupp_0.isa);
      goto LABEL_15;
    }
  }
  return [*(id *)(a1 + 48) addObject:a2];
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) renditionType]
    || [*(id *)(a1 + 32) subtype] != 1792
    || [*(id *)(a1 + 32) idiom] != 1
    || [*(id *)(a1 + 32) scaleFactor] != 2)
  {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "iconSize"), "sizeValue");
  if (v7 != *(double *)(a1 + 40) || v6 != *(double *)(a1 + 48)) {
    return 0;
  }
  uint64_t result = 1;
  *a4 = 1;
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([a2 renditionType] != 1009
    && [a2 renditionType] != 1015
    && ([a2 compressionType] == 4 || objc_msgSend(a2, "compressionType") == 5)
    && [a2 compressionType] == 5
    && [*(id *)(a1 + 32) featureEnabled:16])
  {
    [a2 setCompressionType:4];
  }
  if ([a2 renditionType] == 1007)
  {
    if (![a2 scaleFactor]) {
      [a2 setScaleFactor:1];
    }
    if ([a2 texturePixelFormat]) {
      id v4 = *(void **)(a1 + 48);
    }
    else {
      id v4 = *(void **)(a1 + 40);
    }
    goto LABEL_24;
  }
  if ([a2 renditionType] == 1009)
  {
    id v4 = *(void **)(a1 + 56);
LABEL_24:
    return [v4 addObject:a2];
  }
  if ([a2 renditionType] == 1015)
  {
    id v4 = *(void **)(a1 + 64);
    goto LABEL_24;
  }
  if ([a2 renditionType] == 1011)
  {
    id v4 = *(void **)(a1 + 72);
    goto LABEL_24;
  }
  if ([a2 renditionType] == 1014)
  {
    id v4 = *(void **)(a1 + 80);
    goto LABEL_24;
  }
  if ([a2 renditionType] == 1017)
  {
    id v4 = *(void **)(a1 + 88);
    goto LABEL_24;
  }
  if ([a2 renditionType] == 1013)
  {
    if (![a2 scaleFactor]) {
      [a2 setScaleFactor:1];
    }
    [*(id *)(a1 + 96) addObject:a2];
  }
  else if ([*(id *)(a1 + 32) canImportNamedAssetImportInfo:a2])
  {
    if ([a2 renditionType] == 1002 || objc_msgSend(a2, "renditionType") == 1018) {
      [*(id *)(a1 + 104) insertObject:a2 atIndex:0];
    }
    else {
      [*(id *)(a1 + 104) addObject:a2];
    }
    if ([a2 containedImageNames] && !objc_msgSend(a2, "renditionType")) {
      [*(id *)(a1 + 112) addObject:a2];
    }
    if ([a2 renditionType] == 1002 || objc_msgSend(a2, "renditionType") == 1018)
    {
      if (![a2 scaleFactor]) {
        [a2 setScaleFactor:1];
      }
      if ([a2 compressionType])
      {
        double v6 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(a2, "compressionType"));
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        double v7 = objc_msgSend(a2, "layerReferences", 0);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v13;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v13 != v10) {
                objc_enumerationMutation(v7);
              }
              objc_msgSend(*(id *)(a1 + 120), "setObject:forKey:", v6, objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "layerName"));
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          }
          while (v9);
        }
      }
    }
  }
  if ([a2 renditionType] == 1000 && !objc_msgSend(a2, "scaleFactor")) {
    [a2 setScaleFactor:1];
  }
  if (![a2 renditionType]) {
    [a2 setResizingMode:1];
  }
  uint64_t result = [a2 renditionType];
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t result = [a2 renditionType];
    if (result <= 5)
    {
      uint64_t result = [a2 scaleFactor];
      if (!result)
      {
        uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "fileURL"), "pathExtension"), "caseInsensitiveCompare:", @"PDF");
        if (result) {
          return [a2 setScaleFactor:1];
        }
      }
    }
  }
  return result;
}

void *__87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a2, "name"));
  if (result)
  {
    uint64_t v4 = (int)[result intValue];
    return (void *)[a2 setCompressionType:v4];
  }
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 fileURL];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v6 = [a2 fileURL];
  }
  else {
    uint64_t v6 = *MEMORY[0x263EFFD08];
  }

  return [v5 addObject:v6];
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(a2, "textureInfos", 0);
  uint64_t result = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = *MEMORY[0x263EFFD08];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = [v9 fileURL];
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = v7;
        if (v10) {
          uint64_t v12 = objc_msgSend(v9, "fileURL", v7);
        }
        [v11 addObject:v12];
        ++v8;
      }
      while (v5 != v8);
      uint64_t result = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(a2, "textureInfos", 0);
  uint64_t result = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = *MEMORY[0x263EFFD08];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = [v9 fileURL];
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = v7;
        if (v10) {
          uint64_t v12 = objc_msgSend(v9, "fileURL", v7);
        }
        [v11 addObject:v12];
        ++v8;
      }
      while (v5 != v8);
      uint64_t result = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 fileURL];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v6 = [a2 fileURL];
  }
  else {
    uint64_t v6 = *MEMORY[0x263EFFD08];
  }

  return [v5 addObject:v6];
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 fileURL];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v6 = [a2 fileURL];
  }
  else {
    uint64_t v6 = *MEMORY[0x263EFFD08];
  }

  return [v5 addObject:v6];
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 fileURL];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v6 = [a2 fileURL];
  }
  else {
    uint64_t v6 = *MEMORY[0x263EFFD08];
  }

  return [v5 addObject:v6];
}

void __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_11(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = *(void **)(a1 + 48);
LABEL_3:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_15;
    block[3] = &unk_264C44B48;
    block[4] = *(void *)(a1 + 56);
    block[5] = v2;
    char v28 = *(unsigned char *)(a1 + 152);
    long long v20 = *(_OWORD *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 136);
    uint64_t v5 = *(void *)(a1 + 144);
    uint64_t v21 = v3;
    long long v6 = *(_OWORD *)(a1 + 104);
    long long v22 = *(_OWORD *)(a1 + 88);
    long long v23 = v6;
    long long v24 = *(_OWORD *)(a1 + 120);
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v25 = v4;
    uint64_t v26 = v7;
    uint64_t v27 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
    return;
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rootPathForProductionData"), "stringByAppendingPathComponent:", objc_msgSend(*(id *)(a1 + 64), "path"));
  uint64_t v9 = [NSURL fileURLWithPath:v8 isDirectory:1];
  id v32 = 0;
  uint64_t v2 = (void *)[(id)objc_opt_class() _imageAssetURLsByCopyingFileURLs:*(void *)(a1 + 32) toManagedLocationAtURL:v9 error:&v32];
  uint64_t v10 = [v2 count];
  if (v10 != [*(id *)(a1 + 72) count])
  {
    NSLog(&cfstr_UnableToImport_1.isa, [v32 localizedDescription]);
    goto LABEL_10;
  }
  uint64_t v11 = *(void **)(a1 + 72);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_12;
  v31[3] = &unk_264C44B20;
  v31[4] = v2;
  [v11 enumerateObjectsUsingBlock:v31];
  uint64_t v12 = (void *)[(id)objc_opt_class() _imageAssetURLsByCopyingFileURLs:*(void *)(a1 + 40) toManagedLocationAtURL:v9 error:&v32];
  uint64_t v13 = [v12 count];
  if (v13 != [*(id *)(a1 + 40) count])
  {
    NSLog(&cfstr_UnableToImport_1.isa, [v32 localizedDescription]);
LABEL_10:
    uint64_t v17 = *(void *)(a1 + 144);
    if (v17) {
      (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v32);
    }
    return;
  }
  long long v14 = *(void **)(a1 + 80);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_13;
  v30[3] = &unk_264C44B20;
  v30[4] = v12;
  [v14 enumerateObjectsUsingBlock:v30];
  id v3 = (void *)[(id)objc_opt_class() _imageAssetURLsByCopyingFileURLs:*(void *)(a1 + 48) toManagedLocationAtURL:v9 error:&v32];
  uint64_t v15 = [v3 count];
  if (v15 == [*(id *)(a1 + 88) count])
  {
    long long v16 = *(void **)(a1 + 88);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_14;
    void v29[3] = &unk_264C44B20;
    v29[4] = v3;
    [v16 enumerateObjectsUsingBlock:v29];
    goto LABEL_3;
  }
  NSLog(&cfstr_UnableToImport_2.isa, [v32 localizedDescription]);
  uint64_t v18 = *(void *)(a1 + 144);
  if (v18) {
    (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v32);
  }
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");

  return [a2 setFileURL:v3];
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend(a2, "textureInfos", 0);
  uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setFileURL:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3));
      }
      while (v7 != v9);
      uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");

  return [a2 setFileURL:v3];
}

uint64_t __87__CoreThemeDocument_importNamedAssetsWithImportInfos_referenceFiles_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) undoManager];
  [v2 disableUndoRegistration];
  id v11 = (id)[MEMORY[0x263EFF8C0] array];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) _addAssetsAtFileURLs:*(void *)(a1 + 40) createProductions:0 referenceFiles:*(unsigned __int8 *)(a1 + 144) bitSource:*(void *)(a1 + 48) customInfos:*(void *)(a1 + 56) sortedCustomInfos:&v11];
  uint64_t v4 = [v3 count];
  if (v4 == [v11 count])
  {
    id v10 = (id)[MEMORY[0x263EFF8C0] array];
    uint64_t v5 = (void *)[*(id *)(a1 + 32) _addAssetsAtFileURLs:*(void *)(a1 + 64) createProductions:0 referenceFiles:*(unsigned __int8 *)(a1 + 144) bitSource:*(void *)(a1 + 48) customInfos:*(void *)(a1 + 72) sortedCustomInfos:&v10];
    uint64_t v6 = [v5 count];
    if (v6 == [v10 count])
    {
      uint64_t v9 = 0;
      [*(id *)(a1 + 32) createNamedRenditionGroupProductionsForImportInfos:*(void *)(a1 + 80) error:&v9];
      if (v9
        || ([*(id *)(a1 + 32) createNamedArtworkProductionsForAssets:v3 customInfos:v11 error:&v9], v9)
        || ([*(id *)(a1 + 32) createNamedRecognitionObjectsForAssets:v5 customInfos:v10 error:&v9], v9)
        || ([*(id *)(a1 + 32) createNamedGlyphVectorForCustomInfos:*(void *)(a1 + 88) referenceFiles:*(unsigned __int8 *)(a1 + 144) bitSource:*(void *)(a1 + 48) error:&v9], v9)|| (objc_msgSend(*(id *)(a1 + 32), "createNamedColorProductionsForImportInfos:error:", *(void *)(a1 + 96), &v9), v9)|| (objc_msgSend(*(id *)(a1 + 32), "createNamedModelsForCustomInfos:referenceFiles:bitSource:error:", *(void *)(a1 + 104), *(unsigned __int8 *)(a1 + 144), *(void *)(a1 + 48),
              &v9),
            v9)
        || ([*(id *)(a1 + 32) createTextStyleProductionsForImportInfos:*(void *)(a1 + 112) error:&v9], v9)|| (objc_msgSend(*(id *)(a1 + 32), "createNamedTexturesForCustomInfos:referenceFiles:bitSource:error:", objc_msgSend(*(id *)(a1 + 32), "updateAutomaticTexturesForCustomInfos:allTextureInfos:", *(void *)(a1 + 120), *(void *)(a1 + 128)), *(unsigned __int8 *)(a1 + 144), *(void *)(a1 + 48), &v9), v9))
      {
        uint64_t v7 = 0;
      }
      else
      {
        [*(id *)(a1 + 32) _tidyUpRecognitionImages];
        [*(id *)(a1 + 32) _generateWatchImages];
        [*(id *)(a1 + 32) _automaticSRGBGenerationFromP3];
        [*(id *)(a1 + 32) _automaticP3GenerationFromSRGB];
        [*(id *)(a1 + 32) _createForwardstopRenditions];
        [*(id *)(a1 + 32) _tidyUpLayerStacks];
        [*(id *)(a1 + 32) _optimizeForDeviceTraits];
        [*(id *)(a1 + 32) _backwardsCompatibilityPatchForLayoutDirection];
        uint64_t v7 = 1;
      }
      [v2 enableUndoRegistration];
      uint64_t result = *(void *)(a1 + 136);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, v7, v9);
      }
    }
    else
    {
      NSLog(&cfstr_UnableToImport_3.isa);
      [v2 enableUndoRegistration];
      uint64_t result = *(void *)(a1 + 136);
      if (result) {
        return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
      }
    }
  }
  else
  {
    NSLog(&cfstr_UnableToImport_3.isa);
    [v2 enableUndoRegistration];
    uint64_t result = *(void *)(a1 + 136);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
    }
  }
  return result;
}

- (void)deleteNamedAssets:(id)a3 shouldDeleteAssetFiles:(BOOL)a4 completionHandler:(id)a5
{
  id v24 = a5;
  BOOL v5 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = a3;
  uint64_t v28 = [a3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v8, "addObject:", v11, v24);
        long long v12 = (void *)[v11 renditions];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              [v8 addObject:v17];
              uint64_t v18 = [v17 asset];
              if (v18)
              {
                uint64_t v19 = (void *)v18;
                [v8 addObject:v18];
                if (v5)
                {
                  uint64_t v20 = [v19 fileURLWithDocument:self];
                  if (v20) {
                    [v9 addObject:v20];
                  }
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v14);
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v28);
  }
  id v21 = [(TDPersistentDocument *)self undoManager];
  if (v5)
  {
    long long v22 = v21;
    [v21 disableUndoRegistration];
    [(CoreThemeDocument *)self deleteObjects:v8];

    [v22 enableUndoRegistration];
  }
  else
  {
    [(CoreThemeDocument *)self deleteObjects:v8];
  }
  if ([v9 count])
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__CoreThemeDocument_deleteNamedAssets_shouldDeleteAssetFiles_completionHandler___block_invoke;
    block[3] = &unk_264C44B98;
    block[4] = v9;
    block[5] = v25;
    dispatch_async(global_queue, block);
  }
  else if (v25)
  {
    (*(void (**)(void))(v25 + 16))();
  }
}

uint64_t __80__CoreThemeDocument_deleteNamedAssets_shouldDeleteAssetFiles_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F08850]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 removeItemAtURL:*(void *)(*((void *)&v9 + 1) + 8 * i) error:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_addAssetsFromCustomAssetInfos:(id)a3 bitSource:(id)a4 error:(id *)a5
{
  long long v9 = (void *)[MEMORY[0x263EFF980] array];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CoreThemeDocument__addAssetsFromCustomAssetInfos_bitSource_error___block_invoke;
  v11[3] = &unk_264C44BC0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = v9;
  v11[7] = a5;
  [a3 enumerateObjectsUsingBlock:v11];
  return v9;
}

uint64_t __68__CoreThemeDocument__addAssetsFromCustomAssetInfos_bitSource_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = (void *)[a2 customAsset];
  id v8 = (void *)[*(id *)(a1 + 32) newObjectForEntity:@"CustomAsset"];
  uint64_t v13 = v8;
  if (!v8 && *(void *)(a1 + 56))
  {
    id v9 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v10 = objc_msgSend(v9, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 0, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Unable to create CustomAsset entity. Data model may not support this operation.", *MEMORY[0x263F08320], 0));
    id v8 = 0;
    **(void **)(a1 + 56) = v10;
    *a4 = 1;
  }
  [v8 setSource:*(void *)(a1 + 40)];
  [v13 setCategory:@"custom"];
  [v13 setName:objc_msgSend(NSString, "stringWithFormat:", @"CustomAsset-%@-%@", objc_msgSend(a2, "elementName"), objc_msgSend(a2, "partName"))];
  objc_msgSend(v13, "setTemplateRenderingMode:", objc_msgSend(*(id *)(a1 + 32), "templateRenderingModeWithIdentifier:", objc_msgSend(a2, "templateRenderingMode")));
  objc_msgSend(v13, "setScaleFactor:", objc_msgSend((id)objc_msgSend(a2, "renditionKey"), "themeScale"));
  uint64_t v11 = objc_msgSend(v13, "setReferenceData:", objc_msgSend(v7, "customAssetReferenceData"));
  if (v13) {
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 48), "addObject:");
  }

  return MEMORY[0x270F9A790](v11);
}

- (BOOL)createCustomArtworkProductionsForCustomAssets:(id)a3 withImportInfos:(id)a4 error:(id *)a5
{
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "array", a3, a4, a5);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__CoreThemeDocument_createCustomArtworkProductionsForCustomAssets_withImportInfos_error___block_invoke;
  v10[3] = &unk_264C44BE8;
  v10[4] = a4;
  v10[5] = self;
  v10[6] = v8;
  [a3 enumerateObjectsUsingBlock:v10];
  return 1;
}

uint64_t __89__CoreThemeDocument_createCustomArtworkProductionsForCustomAssets_withImportInfos_error___block_invoke(id *a1, void *a2)
{
  uint64_t v4 = objc_msgSend(a1[4], "objectAtIndexedSubscript:");
  objc_msgSend((id)objc_msgSend(v4, "customAsset"), "customAssetSize");
  double v6 = v5;
  double v8 = v7;
  id v9 = a1[5];
  [v4 sliceInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v4 resizableSliceSize];
  uint64_t v20 = objc_msgSend(v9, "slicesComputedForImageSize:usingSliceInsets:resizableSliceSize:withRenditionType:", objc_msgSend(v4, "renditionType"), v6, v8, v11, v13, v15, v17, v18, v19);
  id v21 = (id)[a1[5] newObjectForEntity:@"CustomArtworkProduction"];
  long long v22 = (void *)[a1[5] newObjectForEntity:@"RenditionKeySpec"];
  objc_msgSend(v22, "setAttributesFromRenditionKey:withDocument:", objc_msgSend((id)objc_msgSend(v4, "renditionKey"), "keyList"), a1[5]);
  [v21 setBaseKeySpec:v22];

  [v21 setIsExcludedFromFilter:*MEMORY[0x263EFFB38]];
  objc_msgSend(v21, "setRenditionType:", objc_msgSend(a1[5], "renditionTypeWithIdentifier:", objc_msgSend(v4, "renditionType")));
  objc_msgSend(v21, "setRenditionSubtype:", objc_msgSend(a1[5], "renditionSubtypeWithIdentifier:", objc_msgSend(v4, "renditionSubtype")));
  objc_msgSend(v21, "setTemplateRenderingMode:", objc_msgSend(a1[5], "templateRenderingModeWithIdentifier:", objc_msgSend(v4, "templateRenderingMode")));
  objc_msgSend(v21, "setOptOutOfThinning:", objc_msgSend(v4, "optOutOfThinning"));
  [v21 setComment:objc_msgSend(NSString, "stringWithFormat:", @"Custom Asset from: %@", objc_msgSend(a2, "name"))];
  if ([v4 modificationDate])
  {
    objc_msgSend(v21, "setDateOfLastChange:", objc_msgSend(v4, "modificationDate"));
    [v21 setHasCustomDateOfLastChange:1];
  }
  [a1[6] addObject:v21];
  id v23 = (id)[a1[5] newObjectForEntity:@"CustomArtworkRenditionSpec"];
  [v23 setAsset:a2];
  [v23 setProduction:v21];
  [v4 alignmentRect];
  objc_msgSend(v23, "setAlignmentRect:");
  if ([v20 count]) {
    [v23 setSlices:v20];
  }
  [v23 resetToBaseKeySpec];
  if (objc_msgSend((id)objc_msgSend(v4, "name"), "length"))
  {
    id v24 = objc_msgSend(a1[5], "namedElementWithName:", objc_msgSend(v4, "name"));
    if (!v24)
    {
      id v24 = (void *)[a1[5] _createNamedElementWithNextAvailableIdentifier];
      objc_msgSend(v24, "setName:", objc_msgSend(v4, "name"));
    }
    [v24 setProduction:v21];
    objc_msgSend((id)objc_msgSend(v21, "baseKeySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(v24, "identifier"), "unsignedIntValue"));
  }

  return [v23 resetToBaseKeySpec];
}

- (void)importCustomAssetsWithImportInfos:(id)a3 completionHandler:(id)a4
{
  id v7 = [(CoreThemeDocument *)self _themeBitSource:0];
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__CoreThemeDocument_importCustomAssetsWithImportInfos_completionHandler___block_invoke;
    v9[3] = &unk_264C44C10;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = v7;
    v9[7] = a4;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
  else if (a4)
  {
    double v8 = (void (*)(id, void, void))*((void *)a4 + 2);
    v8(a4, 0, 0);
  }
}

uint64_t __73__CoreThemeDocument_importCustomAssetsWithImportInfos_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  id v2 = (void *)[*(id *)(a1 + 32) undoManager];
  [v2 disableUndoRegistration];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) _addAssetsFromCustomAssetInfos:*(void *)(a1 + 40) bitSource:*(void *)(a1 + 48) error:&v7];
  uint64_t v4 = [v3 count];
  if (v4 == [*(id *)(a1 + 40) count])
  {
    [*(id *)(a1 + 32) createCustomArtworkProductionsForCustomAssets:v3 withImportInfos:*(void *)(a1 + 40) error:&v7];
    [v2 enableUndoRegistration];
    uint64_t result = *(void *)(a1 + 56);
    if (!result) {
      return result;
    }
    double v6 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    NSLog(&cfstr_UnableToImport_4.isa);
    [v2 enableUndoRegistration];
    uint64_t result = *(void *)(a1 + 56);
    if (!result) {
      return result;
    }
    double v6 = *(uint64_t (**)(void))(result + 16);
  }
  return v6();
}

- (id)_genericPartDefinition
{
  id v2 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"SchemaPartDefinition", [MEMORY[0x263F08A98] predicateWithFormat:@"name = %@ AND element.name = %@", @"Push Button", @"Push Button"], 0);
  id result = (id)[v2 count];
  if (result)
  {
    return (id)[v2 objectAtIndex:0];
  }
  return result;
}

- (id)createElementProductionWithAsset:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [(CoreThemeDocument *)self _createPhotoshopElementProductionWithAsset:a3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      NSLog(&cfstr_CreatingProduc.isa);
    }
    return 0;
  }
}

- (id)createAssetWithName:(id)a3 inCategory:(id)a4 forThemeBitSource:(id)a5
{
  uint64_t v9 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:");

  return [(CoreThemeDocument *)self createAssetWithName:a3 scaleFactor:v9 inCategory:a4 forThemeBitSource:a5];
}

- (id)createAssetWithName:(id)a3 scaleFactor:(unsigned int)a4 inCategory:(id)a5 forThemeBitSource:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v11 = [a3 pathExtension];

  return [(CoreThemeDocument *)self createAssetWithName:a3 fileType:v11 scaleFactor:v8 inCategory:a5 forThemeBitSource:a6];
}

- (id)createAssetWithName:(id)a3 fileType:(id)a4 scaleFactor:(unsigned int)a5 inCategory:(id)a6 forThemeBitSource:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  if ([a4 isEqualToString:@"psd"])
  {
    double v13 = @"PhotoshopAsset";
  }
  else if ([a4 isEqualToString:@"png"])
  {
    double v13 = @"PNGAsset";
  }
  else if ([a4 isEqualToString:@"imagestack"])
  {
    double v13 = @"ImageStackAsset";
  }
  else if ([a4 isEqualToString:@"texture"])
  {
    double v13 = @"TextureAsset";
  }
  else
  {
    if (![a4 isEqualToString:@"model"])
    {
      NSLog(&cfstr_UnsupportedFil.isa, a3);
      id v14 = 0;
      goto LABEL_12;
    }
    double v13 = @"ModelIOAsset";
  }
  id v14 = [(CoreThemeDocument *)self newObjectForEntity:v13];
LABEL_12:
  [v14 setName:a3];
  [v14 setScaleFactor:v9];
  [v14 setCategory:a6];
  [v14 setSource:a7];
  return v14;
}

- (id)assetAtPath:(id)a3
{
  uint64_t v4 = [NSURL fileURLWithPath:a3];

  return [(CoreThemeDocument *)self assetAtFileURL:v4];
}

- (id)assetAtFileURL:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  unsigned int v11 = 0;
  uint64_t v10 = 0;
  [(CoreThemeDocument *)self _getFilename:&v13 scaleFactor:&v11 category:&v12 bitSource:&v10 forFileURL:a3];
  id result = 0;
  if (v13) {
    BOOL v6 = v11 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && v12 != 0 && v10 != 0)
  {
    id v9 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"PhotoshopAsset", [MEMORY[0x263F08A98] predicateWithFormat:@"name == %@ AND scaleFactor == %u AND category == %@", v13, v11, v12], 0);
    id result = (id)[v9 count];
    if (result)
    {
      if ((unint64_t)[v9 count] >= 2) {
        NSLog(&cfstr_WarningFoundMu.isa, [a3 path]);
      }
      return (id)[v9 objectAtIndex:0];
    }
  }
  return result;
}

- (id)addAssetsAtFileURLs:(id)a3
{
  return [(CoreThemeDocument *)self addAssetsAtFileURLs:a3 createProductions:1 referenceFiles:0 bitSource:0 customInfos:0];
}

- (id)addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4
{
  return [(CoreThemeDocument *)self addAssetsAtFileURLs:a3 createProductions:a4 referenceFiles:0 bitSource:0 customInfos:0];
}

- (id)addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4 referenceFiles:(BOOL)a5 bitSource:(id)a6 customInfos:(id)a7
{
  return [(CoreThemeDocument *)self _addAssetsAtFileURLs:a3 createProductions:a4 referenceFiles:a5 bitSource:a6 customInfos:a7 sortedCustomInfos:0];
}

- (id)_addAssetsAtFileURLs:(id)a3 createProductions:(BOOL)a4 referenceFiles:(BOOL)a5 bitSource:(id)a6 customInfos:(id)a7 sortedCustomInfos:(id *)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v81 = *MEMORY[0x263EF8340];
  long long v66 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"Asset", 0, 0));
  uint64_t v63 = [v66 count];
  double v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v65 = (void *)[MEMORY[0x263EFF980] array];
  double v16 = 0;
  if (v11) {
    double v16 = (void *)[a6 fileURLWithDocument:self];
  }
  uint64_t v17 = [v16 pathComponents];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke;
  v77[3] = &unk_264C44C38;
  v77[4] = a6;
  v77[5] = a7;
  long long v55 = self;
  v77[6] = self;
  v77[7] = a3;
  BOOL v78 = v11;
  v77[8] = v16;
  v77[9] = v17;
  v77[10] = @"FilePDF";
  v77[11] = @"AssetName";
  v77[12] = @"Scale";
  v77[13] = @"FileScale";
  v77[14] = @"Category";
  v77[15] = @"FileBitSource";
  v77[17] = v15;
  v77[18] = a8;
  v77[16] = @"CustomInfo";
  [a3 enumerateObjectsUsingBlock:v77];
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke_2;
  v76[3] = &unk_264C44C60;
  v76[4] = @"AssetName";
  double v18 = (void *)[v15 sortedArrayUsingComparator:v76];
  double v19 = v18;
  if (a8)
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v73 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = [*(id *)(*((void *)&v72 + 1) + 8 * i) objectForKey:@"CustomInfo"];
          if (v25) {
            [v20 addObject:v25];
          }
        }
        uint64_t v22 = [v19 countByEnumeratingWithState:&v72 objects:v80 count:16];
      }
      while (v22);
    }
    *a8 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v20];
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v62 = [v19 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v62)
  {
    uint64_t v58 = 0;
    long long v59 = 0;
    id v60 = (id)*MEMORY[0x263EFFD08];
    uint64_t v61 = *(void *)v69;
    int v56 = !v12;
    uint64_t v26 = self;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v69 != v61) {
          objc_enumerationMutation(v19);
        }
        uint64_t v28 = *(void **)(*((void *)&v68 + 1) + 8 * v27);
        uint64_t v29 = [v28 objectForKey:@"AssetName"];
        uint64_t v30 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", @"Scale"), "unsignedIntegerValue");
        uint64_t v31 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", @"FileScale"), "unsignedIntegerValue");
        uint64_t v32 = [v28 objectForKey:@"Category"];
        uint64_t v33 = [v28 objectForKey:@"FileBitSource"];
        uint64_t v34 = [v28 objectForKey:@"FilePDF"];
        uint64_t v67 = (void *)[v28 objectForKey:@"CustomInfo"];
        if (v63)
        {
          if (v31) {
            BOOL v35 = v34 == 0;
          }
          else {
            BOOL v35 = 1;
          }
          if (v35)
          {
            uint64_t v36 = v30;
            char v45 = (void *)[v66 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name == %@ AND scaleFactor == %u AND category == %@", v29, v30, v32)];
            if (![v45 count]
              || ([v45 objectAtIndex:0], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (v67)
              {
                uint64_t v37 = [v67 renditionType];
                id v38 = @"imagestack";
                if (v37 != 1002)
                {
                  if ([v67 renditionType] == 1018) {
                    id v38 = @"imagestack";
                  }
                  else {
                    id v38 = @"png";
                  }
                }
                id v39 = [(CoreThemeDocument *)v26 createAssetWithName:v29 fileType:v38 scaleFactor:v36 inCategory:v32 forThemeBitSource:v33];
                if ([v67 renditionType] == 1000 || objc_msgSend(v67, "renditionType") == 1014)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v39 setRawData:1];
                  }
                }
              }
              else
              {
                id v39 = [(CoreThemeDocument *)v26 createAssetWithName:v29 fileType:@"png" scaleFactor:v36 inCategory:v32 forThemeBitSource:v33];
              }
              goto LABEL_62;
            }
LABEL_41:
            id v39 = (id)[v45 objectAtIndex:0];
          }
          else
          {
            uint64_t v44 = v30;
            char v45 = (void *)[v66 filteredArrayUsingPredicate:objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"name == %@ AND scaleFactor == %u AND category == %@ AND fileScaleFactor == %@", v29, v30, v32, v31)];
            if ([v45 count])
            {
              [v45 objectAtIndex:0];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                goto LABEL_41;
              }
            }
            id v39 = [(CoreThemeDocument *)v26 createAssetWithName:v29 fileType:@"png" scaleFactor:v44 inCategory:v32 forThemeBitSource:v33];
            [v39 setFileScaleFactor:v31];
LABEL_62:
            [v66 addObject:v39];
          }
LABEL_63:
          if (!v39) {
            return 0;
          }
          goto LABEL_64;
        }
        uint64_t v57 = v33;
        uint64_t v64 = v29;
        uint64_t v40 = v30;
        int v41 = 0;
        uint64_t v42 = 0;
        if (v59)
        {
          double v43 = 0;
          if (v58)
          {
            uint64_t v42 = (void *)[v59 objectForKey:@"AssetName"];
            int v41 = objc_msgSend((id)objc_msgSend(v59, "objectForKey:", @"Scale"), "unsignedIntegerValue");
            double v43 = (void *)[v59 objectForKey:v32];
          }
        }
        else
        {
          double v43 = 0;
        }
        int v46 = [v42 isEqualToString:v64];
        if (v41 == v40) {
          int v47 = v46;
        }
        else {
          int v47 = 0;
        }
        if (v31) {
          BOOL v48 = v34 == 0;
        }
        else {
          BOOL v48 = 1;
        }
        if (!v48)
        {
          uint64_t v26 = v55;
          if (v47) {
            [v43 isEqualToString:v32];
          }
          id v39 = [(CoreThemeDocument *)v55 createAssetWithName:v64 fileType:@"png" scaleFactor:v40 inCategory:v32 forThemeBitSource:v57];
          [v39 setFileScaleFactor:v31];
          uint64_t v58 = (uint64_t)v39;
          long long v59 = v28;
          goto LABEL_63;
        }
        uint64_t v26 = v55;
        if (!v47 || ([v43 isEqualToString:v32] & 1) == 0)
        {
          if (v67)
          {
            if ([v67 renditionType] != 1002 && objc_msgSend(v67, "renditionType") != 1018)
            {
              uint64_t v58 = (uint64_t)v60;
              if ([v67 renditionType] != 1004)
              {
                id v52 = [(CoreThemeDocument *)v55 createAssetWithName:v64 fileType:@"png" scaleFactor:v40 inCategory:v32 forThemeBitSource:v57];
                uint64_t v58 = (uint64_t)v52;
                if ([v67 renditionType] == 1000 || objc_msgSend(v67, "renditionType") == 1014)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v52 setRawData:1];
                  }
                }
              }
              goto LABEL_71;
            }
            long long v49 = v55;
            uint64_t v50 = v64;
            long long v51 = @"imagestack";
          }
          else
          {
            long long v49 = v55;
            uint64_t v50 = v64;
            long long v51 = @"png";
          }
          uint64_t v58 = [(CoreThemeDocument *)v49 createAssetWithName:v50 fileType:v51 scaleFactor:v40 inCategory:v32 forThemeBitSource:v57];
        }
LABEL_71:
        id v39 = (id)v58;
        if (!v58) {
          return 0;
        }
        [v66 addObject:v58];
        long long v59 = v28;
LABEL_64:
        if (v39 != v60 && (([v39 hasProduction] | v56) & 1) == 0) {
          [(CoreThemeDocument *)v26 createElementProductionWithAsset:v39];
        }
        [v65 addObject:v39];
        ++v27;
      }
      while (v62 != v27);
      uint64_t v53 = [v19 countByEnumeratingWithState:&v68 objects:v79 count:16];
      uint64_t v62 = v53;
    }
    while (v53);
  }
  return v65;
}

uint64_t __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v43 = 0;
  uint64_t v44 = v5;
  uint64_t v42 = 0;
  unsigned int v41 = 1;
  if ((void *)*MEMORY[0x263EFFD08] == a2)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3), "name");
    BOOL v6 = 0;
    uint64_t v42 = @"PackedAsset";
    uint64_t v43 = v9;
  }
  else
  {
    BOOL v6 = a2;
    if (v5) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = &v42;
    }
    if (v5) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = &v44;
    }
    [*(id *)(a1 + 48) _getFilename:&v43 scaleFactor:&v41 category:v7 bitSource:v8 forFileURL:a2];
  }
  uint64_t v10 = [*(id *)(a1 + 40) count];
  if (v10 == [*(id *)(a1 + 56) count]) {
    unsigned int v41 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3), "scaleFactor");
  }
  if (*(unsigned char *)(a1 + 152) && v6 && *(void *)(a1 + 64))
  {
    BOOL v11 = (void *)[v6 pathComponents];
    uint64_t UncommonItemInArrays = indexOfFirstUncommonItemInArrays(*(void **)(a1 + 72), v11);
    uint64_t v13 = objc_msgSend(v11, "subarrayWithRange:", UncommonItemInArrays, objc_msgSend(v11, "count") + ~UncommonItemInArrays);
    uint64_t result = [NSString pathWithComponents:v13];
    uint64_t v42 = (__CFString *)result;
    if (!result) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t result = (uint64_t)v42;
    if (!v42) {
LABEL_18:
    }
      uint64_t v42 = @"NamedImages";
  }
  if (!v43 || !v44) {
    return result;
  }
  [*(id *)(a1 + 48) targetPlatform];
  unsigned int v15 = CUIMaxScaleForTargetPlatform();
  [*(id *)(a1 + 48) targetPlatform];
  uint64_t v16 = CUIMinScaleForTargetPlatform();
  uint64_t v17 = *(void **)(a1 + 40);
  if (v17 && [v17 count] > a3)
  {
    double v18 = (void *)[*(id *)(a1 + 40) objectAtIndex:a3];
    double v19 = v18;
    if (v6 && v18)
    {
      if ([v18 renditionType] == 1000 && !objc_msgSend(v19, "universalTypeIdentifier"))
      {
        PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], (CFStringRef)[v6 pathExtension], 0);
        [v19 setUniversalTypeIdentifier:PreferredIdentifierForTag];
      }
    }
    else if (!v6)
    {
      goto LABEL_51;
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_51;
    }
    double v19 = 0;
  }
  if ([v19 renditionType] != 1000
    && [v19 renditionType] != 1017
    && (!objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "caseInsensitiveCompare:", @"PDF")
     || !objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "caseInsensitiveCompare:", @"SVG")))
  {
    uint64_t v21 = (void *)MEMORY[0x263EFF980];
    uint64_t v22 = v43;
    uint64_t v23 = [NSNumber numberWithUnsignedInteger:0];
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:v41];
    uint64_t v25 = objc_msgSend(v21, "arrayWithObjects:", v22, v23, v24, v42, v44, *(void *)(a1 + 80), 0);
    uint64_t v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 80), 0);
    if (*(void *)(a1 + 144))
    {
      uint64_t v27 = *(void **)(a1 + 40);
      if (v27)
      {
        if ([v27 count] > a3)
        {
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3));
          [v26 addObject:*(void *)(a1 + 128)];
        }
      }
    }
    uint64_t result = [NSDictionary dictionaryWithObjects:v25 forKeys:v26];
    if (result) {
      uint64_t result = [*(id *)(a1 + 136) addObject:result];
    }
    while (v16 <= v15)
    {
      uint64_t result = [*(id *)(a1 + 48) shouldGenerateScale:v16];
      if (result)
      {
        uint64_t v28 = (void *)MEMORY[0x263EFF980];
        uint64_t v29 = v43;
        uint64_t v30 = [NSNumber numberWithUnsignedInteger:v16];
        uint64_t v31 = [NSNumber numberWithUnsignedInteger:v41];
        uint64_t v32 = objc_msgSend(v28, "arrayWithObjects:", v29, v30, v31, v42, v44, *(void *)(a1 + 80), 0);
        uint64_t v33 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 80), 0);
        if (*(void *)(a1 + 144))
        {
          uint64_t v34 = *(void **)(a1 + 40);
          if (v34)
          {
            if ([v34 count] > a3)
            {
              objc_msgSend(v32, "addObject:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3));
              [v33 addObject:*(void *)(a1 + 128)];
            }
          }
        }
        uint64_t result = [NSDictionary dictionaryWithObjects:v32 forKeys:v33];
        if (result) {
          uint64_t result = [*(id *)(a1 + 136) addObject:result];
        }
      }
      uint64_t v16 = (v16 + 1);
    }
    return result;
  }
LABEL_51:
  BOOL v35 = (void *)MEMORY[0x263EFF980];
  uint64_t v36 = v43;
  uint64_t v37 = [NSNumber numberWithUnsignedInteger:v41];
  id v38 = objc_msgSend(v35, "arrayWithObjects:", v36, v37, v42, v44, 0);
  id v39 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 112), *(void *)(a1 + 120), 0);
  if (*(void *)(a1 + 144))
  {
    uint64_t v40 = *(void **)(a1 + 40);
    if (v40)
    {
      if ([v40 count] > a3)
      {
        objc_msgSend(v38, "addObject:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3));
        [v39 addObject:*(void *)(a1 + 128)];
      }
    }
  }
  uint64_t result = [NSDictionary dictionaryWithObjects:v38 forKeys:v39];
  if (result) {
    return [*(id *)(a1 + 136) addObject:result];
  }
  return result;
}

uint64_t __115__CoreThemeDocument__addAssetsAtFileURLs_createProductions_referenceFiles_bitSource_customInfos_sortedCustomInfos___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)[a2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v6 = [a3 objectForKey:*(void *)(a1 + 32)];

  return [v5 compare:v6];
}

- (id)metadatumForKey:(id)a3
{
  uint64_t v6 = objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator");
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 8218, @"-[CoreThemeDocument metadatumForKey] expects a persistent store coordinator be associated with the operating context.");
  }
  uint64_t v7 = (void *)[v6 persistentStores];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 count];
    if (v9 == 1) {
      goto LABEL_8;
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 8223, @"-[CoreThemeDocument metadatumForKey] expects exactly one persistent store, but got %lu.", v10);
LABEL_8:
  BOOL v11 = objc_msgSend(v6, "metadataForPersistentStore:", objc_msgSend(v8, "objectAtIndex:", 0));

  return (id)[v11 objectForKey:a3];
}

- (void)setMetadatum:(id)a3 forKey:(id)a4
{
  uint64_t v8 = [MEMORY[0x263F08B88] currentThread];
  if (v8 != objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "mainThread")) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 8232, @"-[CoreThemeDocument setMetadatum:forKey:] must run from main thread.");
  }
  uint64_t v9 = objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator");
  uint64_t v10 = (void *)[v9 persistentStores];
  if ([v10 count] != 1) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 8236, @"-[CoreThemeDocument setMetadatum:forKey:] expects exactly one persistent store.");
  }
  id v11 = (id)objc_msgSend((id)objc_msgSend(v9, "metadataForPersistentStore:", objc_msgSend(v10, "objectAtIndex:", 0)), "mutableCopy");
  [v11 setObject:a3 forKey:a4];
  BOOL v12 = (void *)[v10 objectAtIndex:0];
  if (([v12 isReadOnly] & 1) == 0)
  {
    [v9 setMetadata:v11 forPersistentStore:v12];
  }
}

- (id)pathToAsset:(id)a3
{
  id v4 = [(CoreThemeDocument *)self rootPathForProductionData];
  uint64_t v5 = [a3 sourceRelativePath];

  return (id)[v4 stringByAppendingPathComponent:v5];
}

- (id)rootPathForProductionData
{
  uint64_t v3 = [(CoreThemeDocument *)self pathToRepresentedDocument];
  if (!v3) {
    uint64_t v3 = [(NSURL *)[(TDPersistentDocument *)self fileURL] path];
  }
  id v4 = [[(NSString *)v3 stringByDeletingLastPathComponent] stringByAppendingPathComponent:[(CoreThemeDocument *)self relativePathToProductionData]];

  return [(NSString *)v4 td_stringByStandardizingPath];
}

- (id)relativePathToProductionData
{
  id result = self->_relativePathToProductionData;
  if (!result)
  {
    id v4 = [(CoreThemeDocument *)self metadatumForKey:@"relativePathToProductionData"];
    uint64_t v5 = @"./";
    if (v4) {
      uint64_t v5 = v4;
    }
    id result = v5;
    self->_relativePathToProductionData = (NSString *)result;
  }
  return result;
}

- (void)setRelativePathToProductionData:(id)a3
{
  [(CoreThemeDocument *)self setMetadatum:a3 forKey:@"relativePathToProductionData"];
  relativePathToProductionData = self->_relativePathToProductionData;
  if (relativePathToProductionData != a3)
  {

    self->_relativePathToProductionData = (NSString *)a3;
  }
}

- (BOOL)isCustomLook
{
  return 0;
}

- (id)renditionsMatchingRenditionKeySpec:(id)a3
{
  id v4 = [(CoreThemeDocument *)self _predicateForRenditionKeySpec:a3];

  return [(CoreThemeDocument *)self objectsForEntity:@"RenditionSpec" withPredicate:v4 sortDescriptors:0];
}

- (unint64_t)countOfRenditionsMatchingRenditionKeySpec:(id)a3
{
  id v4 = [(CoreThemeDocument *)self _predicateForRenditionKeySpec:a3];

  return [(CoreThemeDocument *)self countForEntity:@"RenditionSpec" withPredicate:v4];
}

- (unint64_t)countOfRenditionsMatchingRenditionKeySpecs:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = (void *)[a3 objectEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uint64_t v8 = v7;
    do
    {
      objc_msgSend(v5, "addObject:", -[CoreThemeDocument _predicateForRenditionKeySpec:](self, "_predicateForRenditionKeySpec:", v8));
      uint64_t v8 = [v6 nextObject];
    }
    while (v8);
  }
  unint64_t v9 = -[CoreThemeDocument countForEntity:withPredicate:](self, "countForEntity:withPredicate:", @"RenditionSpec", [MEMORY[0x263F08730] orPredicateWithSubpredicates:v5]);

  return v9;
}

- (NSUUID)uuid
{
  id result = [(CoreThemeDocument *)self metadatumForKey:@"uuid"];
  if (result)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:result];
    return (NSUUID *)v3;
  }
  return result;
}

- (void)setUuid:(id)a3
{
  uint64_t v4 = [a3 UUIDString];

  [(CoreThemeDocument *)self setMetadatum:v4 forKey:@"uuid"];
}

- (unsigned)checksum
{
  if (self->_donotstoreDocumentChecksum) {
    return 0;
  }
  uLong v5 = crc32(0, 0, 0);
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:", -[NSURL path](-[TDPersistentDocument fileURL](self, "fileURL"), "path"));
  unint64_t v7 = [v6 length];
  uInt v8 = v7;
  if (HIDWORD(v7)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 8361, @"File data will be truncated due to zlib limitations");
  }
  return crc32(v5, (const Bytef *)[v6 bytes], v8);
}

- (id)artworkFormat
{
  id result = [(CoreThemeDocument *)self metadatumForKey:@"artworkFormat"];
  if (!result) {
    return (id)CoreThemeArtworkFormatPNG;
  }
  return result;
}

- (void)setArtworkFormat:(id)a3
{
}

+ (id)persistentStringForPlatform:(int64_t)a3
{
  return (id)CUIPlatformNameForPlatform();
}

+ (int64_t)platformForPersistentString:(id)a3
{
  return MEMORY[0x270F23B28](a3, a2);
}

- (void)setTargetPlatform:(int64_t)a3
{
  uint64_t v5 = CUICurrentPlatform();
  if (v5 == 3) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = a3;
  }
  if (v5 == 4) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = [(id)objc_opt_class() persistentStringForPlatform:v7];
  targetPlatforuint64_t m = self->_targetPlatform;
  if ((NSString *)v8 != targetPlatform)
  {
    uint64_t v10 = (void *)v8;

    self->_targetPlatforuint64_t m = (NSString *)[v10 copy];
  }

  [(CoreThemeDocument *)self _updateDeviceTraits];
}

- (void)_updateDeviceTraits
{
  if ([(CoreThemeDocument *)self targetPlatform] == 2
    && [(NSString *)self->_minimumDeploymentVersion length]
    && !self->_deviceTraits)
  {
    id v3 = [NSString alloc];
    uint64_t v4 = MEMORY[0x263F384A0];
    uint64_t v5 = (void *)[v3 initWithUTF8String:*(void *)(MEMORY[0x263F384A0] + 64)];
    int64_t v6 = (void *)[[NSString alloc] initWithUTF8String:*(void *)(v4 + 184)];
    id v14 = (id)[[NSString alloc] initWithUTF8String:*(void *)(v4 + 160)];
    id v7 = [NSString alloc];
    uint64_t v8 = (void *)[v7 initWithUTF8String:*(void *)(MEMORY[0x263F38470] + 16)];
    unint64_t v9 = [[TDDeviceTraits alloc] initWithPlatform:[(CoreThemeDocument *)self targetPlatform]];
    [(TDDeviceTraits *)v9 setScale:2.0];
    [(TDDeviceTraits *)v9 setIdiom:v5];
    [(TDDeviceTraits *)v9 setSubtype:32401];
    [(TDDeviceTraits *)v9 setDisplayGamut:v8];
    [(TDDeviceTraits *)v9 setDeploymentTarget:[(CoreThemeDocument *)self minimumDeploymentVersion]];
    [(TDDeviceTraits *)v9 setMemoryPerformanceClass:16];
    [(TDDeviceTraits *)v9 setGraphicsFeatureSetClass:0];
    [(TDDeviceTraits *)v9 setGraphicsFeatureSetFallbacks:0];
    [(TDDeviceTraits *)v9 setSubtypeFallbackValues:0];
    [(CoreThemeDocument *)self addDeviceTraitForOptimization:v9];

    uint64_t v10 = [[TDDeviceTraits alloc] initWithPlatform:[(CoreThemeDocument *)self targetPlatform]];
    [(TDDeviceTraits *)v10 setScale:1.0];
    [(TDDeviceTraits *)v10 setIdiom:v5];
    [(TDDeviceTraits *)v10 setSubtype:32401];
    [(TDDeviceTraits *)v10 setDisplayGamut:v8];
    [(TDDeviceTraits *)v10 setDeploymentTarget:[(CoreThemeDocument *)self minimumDeploymentVersion]];
    [(TDDeviceTraits *)v10 setMemoryPerformanceClass:16];
    [(TDDeviceTraits *)v10 setGraphicsFeatureSetClass:0];
    [(TDDeviceTraits *)v10 setGraphicsFeatureSetFallbacks:0];
    [(TDDeviceTraits *)v10 setSubtypeFallbackValues:0];
    [(CoreThemeDocument *)self addDeviceTraitForOptimization:v10];

    id v11 = [[TDDeviceTraits alloc] initWithPlatform:[(CoreThemeDocument *)self targetPlatform]];
    [(TDDeviceTraits *)v11 setScale:1.0];
    [(TDDeviceTraits *)v11 setIdiom:v14];
    [(TDDeviceTraits *)v11 setSubtype:32401];
    [(TDDeviceTraits *)v11 setDisplayGamut:v8];
    [(TDDeviceTraits *)v11 setDeploymentTarget:[(CoreThemeDocument *)self minimumDeploymentVersion]];
    [(TDDeviceTraits *)v11 setMemoryPerformanceClass:16];
    [(TDDeviceTraits *)v11 setGraphicsFeatureSetClass:0];
    [(TDDeviceTraits *)v11 setGraphicsFeatureSetFallbacks:0];
    [(TDDeviceTraits *)v11 setSubtypeFallbackValues:0];
    [(CoreThemeDocument *)self addDeviceTraitForOptimization:v11];

    BOOL v12 = [[TDDeviceTraits alloc] initWithPlatform:[(CoreThemeDocument *)self targetPlatform]];
    [(TDDeviceTraits *)v12 setScale:1.0];
    [(TDDeviceTraits *)v12 setIdiom:v6];
    [(TDDeviceTraits *)v12 setSubtype:32401];
    [(TDDeviceTraits *)v12 setDisplayGamut:v8];
    [(TDDeviceTraits *)v12 setDeploymentTarget:[(CoreThemeDocument *)self minimumDeploymentVersion]];
    [(TDDeviceTraits *)v12 setMemoryPerformanceClass:16];
    [(TDDeviceTraits *)v12 setGraphicsFeatureSetClass:0];
    [(TDDeviceTraits *)v12 setGraphicsFeatureSetFallbacks:0];
    [(TDDeviceTraits *)v12 setSubtypeFallbackValues:0];
    [(CoreThemeDocument *)self addDeviceTraitForOptimization:v12];

    uint64_t v13 = [[TDDeviceTraits alloc] initWithPlatform:[(CoreThemeDocument *)self targetPlatform]];
    [(TDDeviceTraits *)v13 setScale:2.0];
    [(TDDeviceTraits *)v13 setIdiom:v6];
    [(TDDeviceTraits *)v13 setSubtype:0];
    [(TDDeviceTraits *)v13 setDisplayGamut:v8];
    [(TDDeviceTraits *)v13 setDeploymentTarget:[(CoreThemeDocument *)self minimumDeploymentVersion]];
    [(TDDeviceTraits *)v13 setMemoryPerformanceClass:16];
    [(TDDeviceTraits *)v13 setGraphicsFeatureSetClass:0];
    [(TDDeviceTraits *)v13 setGraphicsFeatureSetFallbacks:0];
    [(TDDeviceTraits *)v13 setSubtypeFallbackValues:0];
    [(CoreThemeDocument *)self addDeviceTraitForOptimization:v13];
  }
}

- (int64_t)targetPlatform
{
  targetPlatforuint64_t m = self->_targetPlatform;
  uint64_t v4 = objc_opt_class();
  if (targetPlatform)
  {
    uint64_t v5 = self->_targetPlatform;
    return [v4 platformForPersistentString:v5];
  }
  else
  {
    return [v4 defaultTargetPlatform];
  }
}

+ (int64_t)targetPlatformForMOC:(id)a3
{
  id v3 = (void *)[a3 persistentStoreCoordinator];
  uint64_t v4 = (void *)[v3 persistentStores];
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "metadataForPersistentStore:", objc_msgSend(v4, "objectAtIndex:", 0)), "objectForKey:", @"targetPlatform");
    return +[CoreThemeDocument platformForPersistentString:v5];
  }
  else
  {
    return +[CoreThemeDocument defaultTargetPlatform];
  }
}

- (BOOL)buildModelError:(id *)a3
{
  uint64_t v4 = [[TDThemeSchema alloc] initWithThemeDocument:self];
  if ([(TDPersistentDocument *)self fileURL]) {
    [(TDThemeSchema *)v4 sanityCheckAndUpdateDocumentIfNecessary];
  }
  else {
    [(TDThemeSchema *)v4 resetThemeConstants];
  }

  return 1;
}

- (void)resetThemeConstants
{
  id v2 = [[TDThemeSchema alloc] initWithThemeDocument:self];
  [(TDThemeSchema *)v2 resetThemeConstants];
}

- (void)primeArrayControllers
{
  [(CoreThemeDocument *)self renditionTypeWithIdentifier:0];
  [(CoreThemeDocument *)self drawingLayerWithIdentifier:0];
  [(CoreThemeDocument *)self valueWithIdentifier:0];
  [(CoreThemeDocument *)self stateWithIdentifier:0];
  [(CoreThemeDocument *)self directionWithIdentifier:0];
  [(CoreThemeDocument *)self sizeWithIdentifier:0];
  [(CoreThemeDocument *)self partWithIdentifier:0];
  [(CoreThemeDocument *)self elementWithIdentifier:1];

  [(CoreThemeDocument *)self schemaCategoryWithIdentifier:0];
}

+ (int64_t)dataModelVersion
{
  if (dataModelVersion_latestModelOnce != -1) {
    dispatch_once(&dataModelVersion_latestModelOnce, &__block_literal_global_979);
  }
  return dataModelVersion_latestModel;
}

uint64_t __37__CoreThemeDocument_dataModelVersion__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreThemeDefinition"), "URLsForResourcesWithExtension:subdirectory:", @"mom", 0);
  v3[0] = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"path" ascending:0];
  v1 = objc_msgSend((id)objc_msgSend(v0, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v3, 1)), "firstObject");
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "lastPathComponent"), "stringByReplacingOccurrencesOfString:withString:", objc_msgSend(@".", "stringByAppendingString:", objc_msgSend(v1, "pathExtension")), &stru_26E8675B0), "stringByReplacingOccurrencesOfString:withString:", @"CoreThemeDefinition", &stru_26E8675B0), "integerValue");
  dataModelVersion_latestModel = result;
  return result;
}

+ (id)dataModelNameForVersion:(int64_t)a3
{
  if (a3 < 1) {
    return @"CoreThemeDefinition";
  }
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  return (id)[@"CoreThemeDefinition" stringByAppendingString:v4];
}

+ (void)presentMigrationProgress
{
}

+ (void)closeMigrationProgress
{
}

- (BOOL)didMigrate
{
  return self->m_didMigrate;
}

+ (BOOL)defaultAllowsExtendedRangePixelFormats
{
  id v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "valueForKey:", @"AllowsExtendedRange");
  if (!v2) {
    return 1;
  }

  return [v2 BOOLValue];
}

- (BOOL)allowsExtendedRangePixelFormats
{
  id v2 = [(CoreThemeDocument *)self metadatumForKey:@"CoreThemeDocumentAllowsExtendedRangeKey"];

  return [v2 BOOLValue];
}

- (void)setAllowsExtendedRangePixelFormats:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(CoreThemeDocument *)self setMetadatum:v4 forKey:@"CoreThemeDocumentAllowsExtendedRangeKey"];
}

+ (unint64_t)standardColorSpaceID
{
  return 1;
}

- (unint64_t)colorSpaceID
{
  id v2 = [(CoreThemeDocument *)self metadatumForKey:@"NSCoreThemeDefinitionColorSpaceKey"];

  return [v2 unsignedIntegerValue];
}

+ (int)shouldConvertColorsFromColorSpaceWithIdentifier:(unint64_t)a3 toIdentifier:(unint64_t)a4 error:(id *)a5
{
  if (a3 > a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CoreThemeDocument.m", 8747, @"Unexpected color conversion inquiry. Old version: %ld, New version: %ld", a3, a4);
  }
  return 1;
}

- (void)convertColorsFromColorSpaceWithIdentifier:(unint64_t)a3 toIdentifier:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = [(CoreThemeDocument *)self allObjectsForEntity:@"ColorDefinition" withSortDescriptors:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned int v12 = objc_msgSend((id)objc_msgSend(v11, "valueForKey:", @"physicalColor", *(_OWORD *)&v16), "unsignedIntValue");
        int8x8_t v13 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v12), (uint32x2_t)0xFFFFFFF0FFFFFFF8), (int8x8_t)0xFF000000FFLL);
        v14.i64[0] = v13.u32[0];
        v14.i64[1] = v13.u32[1];
        int8x8_t v15 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(vrndxq_f64(vmulq_f64(vdivq_f64(vcvtq_f64_s64(v14), v16), v16)))), (uint32x2_t)0x1000000008), (int8x8_t)0xFF00000000FF00);
        objc_msgSend(v11, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", rint((double)v12 / 255.0 * 255.0) | (rint((double)HIBYTE(v12) / 255.0 * 255.0) << 24) | v15.i32[0] | v15.i32[1]), @"physicalColor");
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", [NSNumber numberWithInteger:a4], @"NSCoreThemeDefinitionColorSpaceKey");
}

- (BOOL)_canremoveKeyAttribte:(unsigned __int16)a3
{
  if (a3 == 12) {
    return 0;
  }
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v4;
    if (v4 == 9) {
      break;
    }
    int v6 = dword_235184948[++v4];
  }
  while (v6 != a3);
  return v5 > 8;
}

- (void)_updateKeyFormatWithContext:(id)a3
{
  uint64_t v22 = 0;
  uint64_t v4 = objc_msgSend(-[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:withContext:error:](self, "objectsForEntity:withPredicate:sortDescriptors:withContext:error:", @"RenditionKeySpec", 0, 0), "count");
  uint64_t v21 = objc_msgSend(MEMORY[0x263EFF240], "entityForName:inManagedObjectContext:", @"RenditionKeySpec", -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  uint64_t v5 = [&unk_26E8769B8 count];
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [&unk_26E8769B8 objectAtIndex:v6];
      id v8 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"RenditionKeySpec", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K.identifier == 0", v7), 0);
      id v9 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"RenditionKeySpec", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == NULL", v7), 0);
      uint64_t v22 = 0;
      uint64_t v10 = [v8 count];
      if ([v9 count] + v10 == v4
        && [(CoreThemeDocument *)self _canremoveKeyAttribte:word_235184970[2 * v6]])
      {
        CUIRenditionKeyFormatRemoveAttribute();
      }
      ++v6;
    }
    while (v5 != v6);
  }
  uint64_t v11 = [&unk_26E8769D0 count];
  if (v11)
  {
    uint64_t v12 = 0;
    do
    {
      int8x8_t v13 = (void *)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RenditionKeySpec"];
      uint64_t v14 = [&unk_26E8769D0 objectAtIndex:v12];
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v21, "attributesByName"), "objectForKey:", v14);
      uint64_t v16 = [MEMORY[0x263F087F0] expressionForKeyPath:v14];
      uint64_t v17 = objc_msgSend(MEMORY[0x263F087F0], "expressionForFunction:arguments:", @"count:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v16));
      id v18 = objc_alloc_init(MEMORY[0x263EFF248]);
      [v18 setName:@"count"];
      [v18 setExpression:v17];
      [v18 setExpressionResultType:200];
      objc_msgSend(v13, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v15, v18, 0));
      objc_msgSend(v13, "setPropertiesToGroupBy:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v15));
      [v13 setResultType:2];

      uint64_t v22 = 0;
      long long v19 = (void *)[a3 executeFetchRequest:v13 error:&v22];
      if ([v19 count] == 1
        && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "firstObject"), "objectForKey:", v14), "integerValue"))
      {
        if ([(CoreThemeDocument *)self _canremoveKeyAttribte:(unsigned __int16)*(_DWORD *)&word_235184970[2 * v12]])
        {
          CUIRenditionKeyFormatRemoveAttribute();
        }
      }
      ++v12;
    }
    while (v11 != v12);
  }
}

- (const)untrimmedRenditionKeyFormat
{
  uint64_t v2 = [(CoreThemeDocument *)self renditionKeySemantics];

  return (const _renditionkeyfmt *)MEMORY[0x270F23AA8](v2, 17);
}

- (const)renditionKeyFormat
{
  uint64_t result = self->_keyFormat;
  if (!result)
  {
    uint64_t v4 = [(CoreThemeDocument *)self untrimmedRenditionKeyFormat];
    uint64_t v5 = (_renditionkeyfmt *)malloc_type_malloc(4 * v4->var2 + 12, 0x12A1DFBEuLL);
    self->_keyFormat = v5;
    v5->double var0 = v4->var0;
    v5->double var1 = v4->var1;
    unint64_t var2 = v4->var2;
    v5->unint64_t var2 = var2;
    if (var2)
    {
      for (unint64_t i = 0; i < var2; ++i)
        v5->var3[i] = v4->var3[i];
    }
    id v8 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__CoreThemeDocument_renditionKeyFormat__block_invoke;
    v9[3] = &unk_264C44C90;
    v9[4] = self;
    v9[5] = v8;
    [v8 performBlockAndWait:v9];
    return self->_keyFormat;
  }
  return result;
}

uint64_t __39__CoreThemeDocument_renditionKeyFormat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateKeyFormatWithContext:*(void *)(a1 + 40)];
}

- (int)renditionKeySemantics
{
  int64_t v2 = [(CoreThemeDocument *)self targetPlatform];
  if ((unint64_t)(v2 - 1) > 4) {
    return 1;
  }
  else {
    return dword_2351849D4[v2 - 1];
  }
}

- (int64_t)renditionKeySpecAttributeCount
{
  return [(CoreThemeDocument *)self renditionKeyFormat][8];
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  return [(CoreThemeDocument *)self renditionKeySemantics] == 1;
}

- (id)customizedSchemaElementDefinitions
{
  return [(CoreThemeDocument *)self _customizedSchemaDefinitionsForEntity:@"SchemaElementDefinition"];
}

- (id)customizedSchemaEffectDefinitions
{
  return [(CoreThemeDocument *)self _customizedSchemaDefinitionsForEntity:@"SchemaEffectDefinition"];
}

- (id)customizedSchemaMaterialDefinitions
{
  return [(CoreThemeDocument *)self _customizedSchemaDefinitionsForEntity:@"SchemaMaterialDefinition"];
}

- (id)_customizedSchemaDefinitionsForEntity:(id)a3
{
  uint64_t v8 = 0;
  id v4 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self, "objectsForEntity:withPredicate:sortDescriptors:error:", a3, [MEMORY[0x263F08A98] predicateWithValue:1], 0, &v8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CoreThemeDocument__customizedSchemaDefinitionsForEntity___block_invoke;
  v7[3] = &unk_264C44CB8;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithBlock:", v7));
  return (id)[MEMORY[0x263EFFA08] setWithArray:v5];
}

uint64_t __59__CoreThemeDocument__customizedSchemaDefinitionsForEntity___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [*(id *)(a1 + 32) customizationExistsForSchemaDefinition:a2];
  return v3 & (objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"Named Asset") ^ 1);
}

- (BOOL)customizationExistsForSchemaDefinition:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = (void *)[a3 parts];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "productions"), "count"))
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (void)removeCustomizationForSchemaDefinition:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)[a3 parts];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CoreThemeDocument deleteProductions:shouldDeleteAssetFiles:](self, "deleteProductions:shouldDeleteAssetFiles:", [*(id *)(*((void *)&v11 + 1) + 8 * v10++) productions], v4);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)customizeSchemaElementDefinition:(id)a3 usingArtworkFormat:(id)a4 shouldReplaceExisting:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (-[CoreThemeDocument allowMultipleInstancesOfElementID:](self, "allowMultipleInstancesOfElementID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "parts"), "anyObject"), "elementID")))
  {
    id v11 = [(CoreThemeDocument *)self _createNamedElementWithNextAvailableIdentifier];
    [v11 setName:@"New Structured Image"];
  }
  else
  {
    id v11 = 0;
  }
  long long v12 = (void *)[a3 parts];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
LABEL_6:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v12);
      }
      BOOL v17 = [(CoreThemeDocument *)self customizeSchemaPartDefinition:*(void *)(*((void *)&v19 + 1) + 8 * v16) usingArtworkFormat:a4 nameElement:v11 shouldReplaceExisting:v7 error:a6];
      if (!v17) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v17) = 1;
  }
  return v17;
}

- (BOOL)customizeSchemaEffectDefinition:(id)a3 shouldReplaceExisting:(BOOL)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)[a3 parts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![(CoreThemeDocument *)self createEffectStyleProductionForPartDefinition:*(void *)(*((void *)&v16 + 1) + 8 * v12)])
        {
          if (!a5) {
            return 0;
          }
          uint64_t v14 = [NSString stringWithFormat:@"Unable to create production for effect definition: %@", objc_msgSend(a3, "name")];
          uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 0, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x263F08320], 0));
          BOOL result = 0;
          *a5 = v15;
          return result;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (BOOL)customizeSchemaMaterialDefinition:(id)a3 shouldReplaceExisting:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)[a3 parts];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      BOOL v13 = [(CoreThemeDocument *)self customizeSchemaPartDefinition:*(void *)(*((void *)&v15 + 1) + 8 * v12) usingArtworkFormat:CoreThemeArtworkFormatCAAR nameElement:0 shouldReplaceExisting:v6 error:a5];
      if (!v13) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)customizeSchemaPartDefinition:(id)a3 usingArtworkFormat:(id)a4 nameElement:(id)a5 shouldReplaceExisting:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = (id)[a3 renditionGroups];
  uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(obj);
      }
      id v16 = [(CoreThemeDocument *)self createProductionWithRenditionGroup:*(void *)(*((void *)&v21 + 1) + 8 * v15) forPartDefinition:a3 artworkFormat:a4 nameElement:a5 shouldReplaceExisting:v7 error:a7];
      if (!v16) {
        break;
      }
      if (a5)
      {
        id v17 = v16;
        objc_msgSend((id)objc_msgSend(v16, "baseKeySpec"), "setNameIdentifier:", objc_msgSend((id)objc_msgSend(a5, "identifier"), "unsignedIntValue"));
        [a5 setProduction:v17];
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    LOBYTE(v16) = 1;
  }
  return (char)v16;
}

- (id)schemaDefinitionWithElementID:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [(CoreThemeDocument *)self allObjectsForEntity:@"SchemaPartDefinition" withSortDescriptors:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id result = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if ([v9 elementID] == a3
          && objc_msgSend((id)objc_msgSend(v9, "element"), "published"))
        {
          return (id)[v9 element];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)schemaPartDefinitionWithElementID:(int64_t)a3 partID:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = [(CoreThemeDocument *)self allObjectsForEntity:@"SchemaPartDefinition" withSortDescriptors:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(v6);
    }
    long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if ([v11 elementID] == a3
      && [v11 partID] == a4
      && (objc_msgSend((id)objc_msgSend(v11, "element"), "published") & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)namedArtworkProductions
{
  id v2 = [(CoreThemeDocument *)self allObjectsForEntity:@"NamedArtworkProduction" withSortDescriptors:0];
  int v3 = (void *)MEMORY[0x263EFFA08];

  return (id)[v3 setWithArray:v2];
}

- (id)namedEffectProductions
{
  id v2 = [(CoreThemeDocument *)self allObjectsForEntity:@"NamedEffectProduction" withSortDescriptors:0];
  int v3 = (void *)MEMORY[0x263EFFA08];

  return (id)[v3 setWithArray:v2];
}

- (void)exportCursorsToURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  obuint64_t j = [(CoreThemeDocument *)self allObjectsForEntity:@"CursorFacetDefinition" withSortDescriptors:0];
  long long v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(obj, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v7, "valueForKey:", @"facetName"), @"facetName", objc_msgSend(v7, "valueForKey:", @"hotSpotX"), @"hotSpotX", objc_msgSend(v7, "valueForKey:", @"hotSpotY"), @"hotSpotY", 0);
        [v11 setObject:v8, objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend((id)objc_msgSend(v7, "keySpec"), "dimension1")) forKey];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  uint64_t v12 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AC0], "dataWithPropertyList:format:options:error:", v11, 100, 200, &v12), "writeToURL:atomically:", a3, 1);
}

- (void)importCursorsFromURL:(id)a3 getUnusedImportedCursors:(id *)a4 getUnupdatedCursors:(id *)a5
{
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3];
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v7 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:&v26 error:&v27];
  id v8 = [(CoreThemeDocument *)self allObjectsForEntity:@"CursorFacetDefinition" withSortDescriptors:0];
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v10 = (void *)[v8 objectEnumerator];
  uint64_t v11 = [v10 nextObject];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    do
    {
      [v9 setObject:v12, objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend((id)objc_msgSend(v12, "keySpec"), "dimension1")) forKey];
      uint64_t v12 = (void *)[v10 nextObject];
    }
    while (v12);
  }
  long long v13 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v14 = (void *)[v7 keyEnumerator];
  uint64_t v15 = [v14 nextObject];
  if (v15)
  {
    uint64_t v16 = v15;
    do
    {
      id v17 = (void *)[v7 objectForKey:v16];
      uint64_t v18 = (void *)[v9 objectForKey:v16];
      if (v18)
      {
        long long v19 = v18;
        objc_msgSend(v18, "setValue:forKey:", objc_msgSend(v17, "objectForKey:", @"facetName"), @"facetName");
        objc_msgSend(v19, "setValue:forKey:", objc_msgSend(v17, "objectForKey:", @"hotSpotX"), @"hotSpotX");
        objc_msgSend(v19, "setValue:forKey:", objc_msgSend(v17, "objectForKey:", @"hotSpotY"), @"hotSpotY");
      }
      else
      {
        [v13 setObject:v17 forKey:v16];
      }
      uint64_t v16 = [v14 nextObject];
    }
    while (v16);
  }
  if (a4) {
    *a4 = (id)[NSDictionary dictionaryWithDictionary:v13];
  }
  if (a5)
  {
    uint64_t v20 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
    long long v21 = (void *)[v9 keyEnumerator];
    uint64_t v22 = [v21 nextObject];
    if (v22)
    {
      uint64_t v23 = v22;
      do
      {
        if (![v7 objectForKey:v23]) {
          objc_msgSend(v20, "addObject:", objc_msgSend(v9, "objectForKey:", v23));
        }
        uint64_t v23 = [v21 nextObject];
      }
      while (v23);
    }
    *a5 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v20];
  }
}

- (TDCatalogGlobals)catalogGlobals
{
  catalogGlobals = self->_catalogGlobals;
  if (!catalogGlobals)
  {
    uint64_t v10 = 0;
    id v5 = [(CoreThemeDocument *)self allObjectsForEntity:@"CatalogGlobals" withSortDescriptors:0 error:&v10];
    unint64_t v6 = [v5 count];
    if (v10) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    if (v7)
    {
      id v8 = [(CoreThemeDocument *)self newObjectForEntity:@"CatalogGlobals"];
    }
    else
    {
      if (v6 >= 2) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 9282, @"More than one CatalogGlobals entity");
      }
      id v8 = (TDCatalogGlobals *)(id)[v5 firstObject];
    }
    catalogGlobals = v8;
    [(CoreThemeDocument *)self willChangeValueForKey:@"catalogGlobals"];
    self->_catalogGlobals = catalogGlobals;
    [(CoreThemeDocument *)self didChangeValueForKey:@"catalogGlobals"];
  }
  return catalogGlobals;
}

- (id)persistentStoreTypeForFileType:(id)a3
{
  unint64_t v6 = (void *)[a3 lowercaseString];
  if (([v6 isEqualToString:CoreThemeDocumentFileType] & 1) == 0
    && (objc_msgSend((id)objc_msgSend(a3, "lowercaseString"), "isEqualToString:", @"tdd") & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument.m", 9299, @"Only valid file type is uicatalog");
  }
  return (id)*MEMORY[0x263EFF168];
}

- (id)updatedVersionsMetadataFromMetadata:(id)a3
{
  uint64_t v5 = CUIThemeInfoVersion();
  int64_t v6 = +[CoreThemeDocument dataModelVersion];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self, "targetPlatform")), "schemaVersion");
  uint64_t v8 = [a3 objectForKey:@"uuid"];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"CoreThemeInfoVersion"), "integerValue");
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"CoreThemeDefinitionDataModelKey"), "integerValue");
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"CoreThemeSchemaVersion"), "integerValue");
  int v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"targetPlatform"), "isEqualToString:", self->_targetPlatform);
  if (v8 && v9 == v5 && v10 == v6 && v11 == v7 && v12) {
    return 0;
  }
  if (a3) {
    long long v14 = (void *)[a3 mutableCopy];
  }
  else {
    long long v14 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  }
  uint64_t v15 = v14;
  objc_msgSend(v14, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v5), @"CoreThemeInfoVersion");
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v6), @"CoreThemeDefinitionDataModelKey");
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v7), @"CoreThemeSchemaVersion");
  targetPlatforuint64_t m = self->_targetPlatform;
  if (targetPlatform) {
    [v15 setObject:targetPlatform forKey:@"targetPlatform"];
  }
  if (!v8)
  {
    id v17 = objc_alloc_init(MEMORY[0x263F08C38]);
    objc_msgSend(v15, "setObject:forKey:", objc_msgSend(v17, "UUIDString"), @"uuid");
  }

  return v15;
}

- (BOOL)configurePersistentStoreCoordinatorForURL:(id)a3 ofType:(id)a4 modelConfiguration:(id)a5 storeOptions:(id)a6 error:(id *)a7
{
  int v12 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a6];
  uint64_t v13 = [NSNumber numberWithBool:1];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263EFF070]];
  uint64_t v14 = [NSNumber numberWithBool:1];
  [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x263EFF008]];
  v21.receiver = self;
  v21.super_class = (Class)CoreThemeDocument;
  BOOL v15 = [(TDPersistentDocument *)&v21 configurePersistentStoreCoordinatorForURL:a3 ofType:a4 modelConfiguration:a5 storeOptions:v12 error:a7];
  uint64_t v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self, "mocOrganizer"), "threadMOC"), "persistentStoreCoordinator"), "persistentStoreForURL:", a3);
  id v17 = (void *)[v16 metadata];
  uint64_t v18 = v17;
  if (self->_updateVersionMetadataState == 1 || ![v17 objectForKey:@"uuid"])
  {
    id v19 = [(CoreThemeDocument *)self updatedVersionsMetadataFromMetadata:v18];
    if (v19) {
      [v16 setMetadata:v19];
    }
    self->_updateVersionMetadataState = 2;
  }
  return v15;
}

- (BOOL)checkCompatibilityOfDocumentAtURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v7 = [(CoreThemeDocument *)self persistentStoreTypeForFileType:a4];
  uint64_t v8 = (void *)[MEMORY[0x263EFF320] metadataForPersistentStoreOfType:v7 URL:a3 options:0 error:a5];
  if (!v8)
  {
    if (a5)
    {
      uint64_t v11 = (void *)MEMORY[0x263F087E8];
      int v12 = CoreThemeDefinitionErrorDomain[0];
      uint64_t v13 = [NSDictionary dictionaryWithObjectsAndKeys:@"Theme definition document is not compatible with this software", *MEMORY[0x263F08338], @"Unrecognized format, missing document metadata", *MEMORY[0x263F08348], 0];
LABEL_10:
      uint64_t v16 = v13;
      id v17 = v11;
      uint64_t v18 = v12;
      uint64_t v19 = 1;
LABEL_11:
      uint64_t v20 = (void *)[v17 errorWithDomain:v18 code:v19 userInfo:v16];
      BOOL result = 0;
      *a5 = v20;
      return result;
    }
    return 0;
  }
  uint64_t v9 = (void *)[v8 objectForKey:@"CoreThemeDefinitionDataModelKey"];
  if (v9) {
    uint64_t v10 = [v9 integerValue];
  }
  else {
    uint64_t v10 = 0;
  }
  int64_t v14 = +[CoreThemeDocument dataModelVersion];
  if (v14 < v10)
  {
    if (a5)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"The theme definition document / UI catalog is too new for this code. You are trying to open a document that is version %ld and this code can only handle up to version %ld", v10, v14);
      uint64_t v11 = (void *)MEMORY[0x263F087E8];
      int v12 = CoreThemeDefinitionErrorDomain[0];
      uint64_t v13 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x263F08338], @"Update your CoreThemeDefinition framework and try again.", *MEMORY[0x263F08348], 0);
      goto LABEL_10;
    }
    return 0;
  }
  if (v10 <= 22)
  {
    if (a5)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = CoreThemeDefinitionErrorDomain[0];
      uint64_t v16 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Theme definition document format is in an older format (<23).", *MEMORY[0x263F08338], @"You need to migrate the document to open it.", *MEMORY[0x263F08348], 0);
      id v17 = v22;
      uint64_t v18 = v23;
      uint64_t v19 = 101;
      goto LABEL_11;
    }
    return 0;
  }
  return 1;
}

- (BOOL)readFromURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  unsigned int v9 = [a3 checkResourceIsReachableAndReturnError:a5];
  if (v9)
  {
    unsigned int v9 = [(CoreThemeDocument *)self checkCompatibilityOfDocumentAtURL:a3 ofType:a4 error:a5];
    if (v9)
    {
      v15.receiver = self;
      v15.super_class = (Class)CoreThemeDocument;
      unsigned int v9 = [(TDPersistentDocument *)&v15 readFromURL:a3 ofType:a4 error:a5];
      if (v9)
      {
        unint64_t v10 = [(CoreThemeDocument *)self colorSpaceID];
        unint64_t v11 = +[CoreThemeDocument standardColorSpaceID];
        if (v11 > v10)
        {
          unint64_t v12 = v11;
          unsigned int v9 = [(id)objc_opt_class() shouldConvertColorsFromColorSpaceWithIdentifier:v10 toIdentifier:v11 error:a5];
          if (!v9) {
            return v9;
          }
          [(CoreThemeDocument *)self convertColorsFromColorSpaceWithIdentifier:v10 toIdentifier:v12];
          [(id)objc_opt_class() doneWithColorConversion];
        }

        uint64_t v13 = (NSString *)objc_msgSend(-[CoreThemeDocument metadatumForKey:](self, "metadatumForKey:", @"targetPlatform"), "copy");
        self->_targetPlatforuint64_t m = v13;
        if (!v13) {
          -[CoreThemeDocument setTargetPlatform:](self, "setTargetPlatform:", [(id)objc_opt_class() defaultTargetPlatform]);
        }
        LOBYTE(v9) = 1;
      }
    }
  }
  return v9;
}

- (void)_synchronousSave
{
}

- (void)_configureAfterFirstSave
{
  -[CoreThemeDocument setMetadatum:forKey:](self, "setMetadatum:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", +[CoreThemeDocument standardColorSpaceID](CoreThemeDocument, "standardColorSpaceID")), @"NSCoreThemeDefinitionColorSpaceKey");
  id v3 = [(CoreThemeDocument *)self metadatumForKey:@"artworkFormat"];
  if (v3) {
    uint64_t v4 = (uint64_t)v3;
  }
  else {
    uint64_t v4 = CoreThemeArtworkFormatPNG;
  }
  [(CoreThemeDocument *)self setArtworkFormat:v4];
  [(CoreThemeDocument *)self setAllowsExtendedRangePixelFormats:+[CoreThemeDocument defaultAllowsExtendedRangePixelFormats]];
  [(CoreThemeDocument *)self setRelativePathToProductionData:@"./"];
  -[CoreThemeDocument addThemeBitSourceAtPath:createProductions:](self, "addThemeBitSourceAtPath:createProductions:", objc_msgSend((id)objc_opt_class(), "defaultThemeBitSourceURLForDocumentURL:", -[TDPersistentDocument fileURL](self, "fileURL")), 0);

  [(CoreThemeDocument *)self _synchronousSave];
}

+ (id)defaultThemeBitSourceURLForDocumentURL:(id)a3
{
  uint64_t v4 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent"), "stringByDeletingPathExtension");
  if ([(__CFString *)v4 length]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"Aqua";
  }
  uint64_t v6 = [(__CFString *)v5 stringByAppendingString:@"-Artwork"];
  id v7 = (void *)[a3 URLByDeletingLastPathComponent];

  return (id)[v7 URLByAppendingPathComponent:v6];
}

- (NSURL)themeBitSourceURL
{
  uint64_t v7 = 0;
  uint64_t v3 = objc_msgSend(-[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", &v7), "path");
  uint64_t v4 = (NSURL *)objc_msgSend((id)objc_opt_class(), "defaultThemeBitSourceURLForDocumentURL:", -[TDPersistentDocument fileURL](self, "fileURL"));
  uint64_t v5 = v4;
  if (v3 && ![(NSString *)[(NSURL *)v4 lastPathComponent] isEqualToString:v3]) {
    return [[(NSURL *)v5 URLByDeletingLastPathComponent] URLByAppendingPathComponent:v3];
  }
  return v5;
}

- (id)themeBitSourceFolderName
{
  id v2 = objc_msgSend(-[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", 0), "path");

  return (id)[v2 lastPathComponent];
}

- (BOOL)renameThemeBitSourceFolderTo:(id)a3 error:(id *)a4
{
  char v7 = objc_msgSend(a3, "isEqualToString:", -[CoreThemeDocument themeBitSourceFolderName](self, "themeBitSourceFolderName"));
  LOBYTE(v8) = 1;
  if (a3)
  {
    if ((v7 & 1) == 0)
    {
      unsigned int v9 = [(CoreThemeDocument *)self themeBitSourceURL];
      unint64_t v10 = [[(NSURL *)v9 URLByDeletingLastPathComponent] URLByAppendingPathComponent:a3];
      if ([(NSURL *)v10 checkResourceIsReachableAndReturnError:0]
        || (int v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "moveItemAtURL:toURL:error:", v9, v10, a4)) != 0)
      {
        objc_msgSend(-[CoreThemeDocument _themeBitSource:](self, "_themeBitSource:", 0), "setPath:", a3);
        LOBYTE(v8) = 1;
      }
    }
  }
  return v8;
}

- (void)addThemeBitSourceAtPath:(id)a3 createProductions:(BOOL)a4
{
  uint64_t v5 = [a3 lastPathComponent];
  uint64_t v6 = -[TDThemeBitSource initWithEntity:insertIntoManagedObjectContext:]([TDThemeBitSource alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeBitSource"), -[TDPersistentDocument managedObjectContext](self, "managedObjectContext"));
  [(TDThemeBitSource *)v6 setPath:v5];
}

- (void)addThemeBitSourceAtPath:(id)a3
{
}

- (void)_removeRedundantPDFBasedRenditionsForAssets:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_class();
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(a3);
        }
        unint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v10, "renditions"), "allObjects"));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(CoreThemeDocument *)self _removeRedundantPDFBasedRenditions:v5];
}

- (void)_removeRedundantPDFBasedRenditions:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v47 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  obuint64_t j = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v74 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * i) keySpec];
        uint64_t v10 = [v9 key];
        long long v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v10 length:4 * CUIRenditionKeyTokenCount()];
        if ([v47 containsObject:v11])
        {
          uint64_t v12 = objc_msgSend(-[CoreThemeDocument renditionsMatchingRenditionKeySpec:](self, "renditionsMatchingRenditionKeySpec:", v9), "sortedArrayUsingComparator:", &__block_literal_global_1120);
          long long v13 = obj;
        }
        else
        {
          long long v13 = v47;
          uint64_t v12 = (uint64_t)v11;
        }
        [v13 addObject:v12];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v6);
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v48 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v70 != v46) {
          objc_enumerationMutation(obj);
        }
        objc_super v15 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        uint64_t v16 = [v15 count];
        id v51 = objc_alloc_init(MEMORY[0x263F089C8]);
        id v17 = objc_alloc_init(MEMORY[0x263F089C8]);
        id v50 = objc_alloc_init(MEMORY[0x263F089C8]);
        id v52 = objc_alloc_init(MEMORY[0x263F089C8]);
        if (v16)
        {
          for (uint64_t k = 0; k != v16; ++k)
          {
            uint64_t v19 = (void *)[v15 objectAtIndex:k];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "keySpec"), "part"), "identifier") != 59)
            {
              uint64_t v20 = (void *)[v19 asset];
              if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "name"), "pathExtension"), "caseInsensitiveCompare:", @"PDF")|| !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "name"), "pathExtension"), "caseInsensitiveCompare:", @"SVG"))
              {
                [v17 addIndex:k];
              }
              if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "name"), "pathExtension"), "caseInsensitiveCompare:", @"PNG"))objc_msgSend(v51, "addIndex:", k); {
              int v21 = [v20 fileScaleFactor];
              }
              if (v21 == objc_msgSend((id)objc_msgSend(v19, "keySpec"), "scaleFactor")) {
                [v52 addIndex:k];
              }
            }
          }
          for (uint64_t m = 0; m != v16; ++m)
          {
            uint64_t v23 = (void *)[v15 objectAtIndex:m];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v24 = (void *)[v23 asset];
              if (objc_msgSend((id)objc_msgSend(v23, "keySpec"), "scaleFactor"))
              {
                int v25 = [v24 fileScaleFactor];
                if (v25 != objc_msgSend((id)objc_msgSend(v23, "keySpec"), "scaleFactor")
                  && (![v24 fileScaleFactor]
                   || HIDWORD(div(objc_msgSend((id)objc_msgSend(v23, "keySpec"), "scaleFactor"), objc_msgSend(v24, "fileScaleFactor")).quot)|| objc_msgSend(v52, "count")))
                {
                  [v50 addIndex:m];
                }
              }
            }
          }
        }
        if ([v51 count] && objc_msgSend(v17, "count"))
        {
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          uint64_t v26 = (void *)[v15 objectsAtIndexes:v17];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v80 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v66;
            do
            {
              for (uint64_t n = 0; n != v28; ++n)
              {
                if (*(void *)v66 != v29) {
                  objc_enumerationMutation(v26);
                }
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", [*(id *)(*((void *)&v65 + 1) + 8 * n) asset], *(void *)(*((void *)&v65 + 1) + 8 * n));
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v80 count:16];
            }
            while (v28);
          }
        }
        else if ([v52 count] && objc_msgSend(v50, "count"))
        {
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          uint64_t v31 = (void *)[v15 objectsAtIndexes:v50];
          uint64_t v32 = [v31 countByEnumeratingWithState:&v61 objects:v79 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v62;
            do
            {
              for (iuint64_t i = 0; ii != v33; ++ii)
              {
                if (*(void *)v62 != v34) {
                  objc_enumerationMutation(v31);
                }
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", [*(id *)(*((void *)&v61 + 1) + 8 * ii) asset], *(void *)(*((void *)&v61 + 1) + 8 * ii));
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v61 objects:v79 count:16];
            }
            while (v33);
          }
        }
        else if ([v50 count] == v16 - 1)
        {
          long long v59 = 0uLL;
          long long v60 = 0uLL;
          long long v57 = 0uLL;
          long long v58 = 0uLL;
          uint64_t v36 = (void *)[v15 objectsAtIndexes:v50];
          uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v78 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v58;
            do
            {
              for (juint64_t j = 0; jj != v38; ++jj)
              {
                if (*(void *)v58 != v39) {
                  objc_enumerationMutation(v36);
                }
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", [*(id *)(*((void *)&v57 + 1) + 8 * jj) asset], *(void *)(*((void *)&v57 + 1) + 8 * jj));
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v57 objects:v78 count:16];
            }
            while (v38);
          }
        }
        else
        {
          long long v55 = 0uLL;
          long long v56 = 0uLL;
          long long v53 = 0uLL;
          long long v54 = 0uLL;
          unsigned int v41 = (void *)[v15 subarrayWithRange:1];
          uint64_t v42 = [v41 countByEnumeratingWithState:&v53 objects:v77 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v54;
            do
            {
              for (kuint64_t k = 0; kk != v43; ++kk)
              {
                if (*(void *)v54 != v44) {
                  objc_enumerationMutation(v41);
                }
                -[CoreThemeDocument _delete:withRendition:](self, "_delete:withRendition:", [*(id *)(*((void *)&v53 + 1) + 8 * kk) asset], *(void *)(*((void *)&v53 + 1) + 8 * kk));
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v53 objects:v77 count:16];
            }
            while (v43);
          }
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v48);
  }
}

uint64_t __56__CoreThemeDocument__removeRedundantPDFBasedRenditions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v4 = objc_msgSend((id)objc_msgSend(a2, "asset"), "fileScaleFactor");
  if (v4 > objc_msgSend((id)objc_msgSend(a3, "asset"), "fileScaleFactor")) {
    return -1;
  }
  else {
    return 1;
  }
}

- (void)_delete:(id)a3 withRendition:(id)a4
{
  uint64_t v7 = (void *)[a4 production];
  objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "deleteObject:", a4);
  uint64_t v8 = (void *)[v7 renditions];
  if ([v8 count] == 1 && objc_msgSend(v8, "containsObject:", a4)) {
    objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "deleteObject:", v7);
  }
  uint64_t v9 = (void *)[a3 renditions];
  if ([v9 count] == 1 && objc_msgSend(v9, "containsObject:", a4))
  {
    id v10 = [(TDPersistentDocument *)self managedObjectContext];
    [v10 deleteObject:a3];
  }
}

- (void)_insertRendition:(id)a3 forKey:(id)a4
{
  packableRenditions = self->_packableRenditions;
  objc_sync_enter(packableRenditions);
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_packableRenditions objectForKey:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    objc_super v15 = __45__CoreThemeDocument__insertRendition_forKey___block_invoke;
    uint64_t v16 = &unk_264C44C60;
    id v17 = self;
    unint64_t v10 = 0;
    unint64_t v11 = [v8 count];
    if (v11)
    {
      do
      {
        uint64_t v12 = [v9 objectAtIndex:(v11 + v10) >> 1];
        if (v15((uint64_t)v14, (void *)v12, a3) >= 0) {
          unint64_t v11 = (v11 + v10) >> 1;
        }
        else {
          unint64_t v10 = ((v11 + v10) >> 1) + 1;
        }
      }
      while (v10 < v11);
    }
    [v9 insertObject:a3 atIndex:v10];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    [(NSMutableDictionary *)self->_packableRenditions setObject:v13 forKey:a4];

    [v13 addObject:a3];
  }
  objc_sync_exit(packableRenditions);
}

uint64_t __45__CoreThemeDocument__insertRendition_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v6 = [a2 width];
  int v7 = [a2 height] * v6;
  int v8 = [a3 width];
  int v9 = [a3 height] * v8;
  if (v7 > v9) {
    return -1;
  }
  if (v7 < v9) {
    return 1;
  }
  unint64_t v11 = (void *)[a2 keySpec];
  uint64_t v12 = (void *)[a3 keySpec];
  uint64_t v13 = [v11 key];
  uint64_t v14 = [v12 key];
  uint64_t v15 = [*(id *)(a1 + 32) untrimmedRenditionKeyFormat];

  return MEMORY[0x270F23A38](v13, v14, v15);
}

- (BOOL)_updateRenditionPackings:(id)a3 error:(id *)a4
{
  int v6 = self;
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (!self->_packableRenditions) {
    self->_packableRenditions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v44 = a4;
  [(CoreThemeDocument *)v6 untrimmedRenditionKeyFormat];
  id v50 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!CUIRenditionKeyHasIdentifier()) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"CoreThemeDocument.m", 9903, @"We need to have Dimension1 in the renditionKeyFormat for the document");
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v45 = 0;
    uint64_t v9 = *(void *)v62;
    unint64_t v10 = 0x2687F3000uLL;
    uint64_t v49 = *(void *)v62;
    uint64_t v46 = v6;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v51 = v8;
      do
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v61 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&v6->super.super.isa + *(int *)(v10 + 2752)), "objectForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "production"), "name"), "identifier")), "intValue");
        uint64_t v14 = (void *)MEMORY[0x237DD6000]();
        if (v13) {
          [v12 setAlphaCrop:1];
        }
        if (([v12 updatePackingPropertiesWithDocument:v6] & 1) == 0)
        {
          if (v44)
          {
            uint64_t v39 = (void *)MEMORY[0x263F087E8];
            uint64_t v40 = *MEMORY[0x263F07F70];
            unsigned int v41 = NSDictionary;
            uint64_t v42 = [NSString stringWithFormat:@"Unable to generate packing info for %@", objc_msgSend((id)objc_msgSend(v12, "production"), "relativePath")];
            *uint64_t v44 = (id)objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 0, objc_msgSend(v41, "dictionaryWithObject:forKey:", v42, *MEMORY[0x263F08320]));
          }

          return 0;
        }
        if ([v12 canBePackedWithDocument:v6])
        {
          long long v59 = v14;
          uint64_t v58 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "scaleFactor");
          unsigned int v15 = [v12 opaque];
          unsigned int v16 = [v12 monochrome];
          uint64_t v57 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "gamut"), "identifier");
          uint64_t v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "target"), "identifier");
          uint64_t v55 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "appearance"), "identifier");
          uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "keySpec"), "localization"), "identifier");
          unsigned int v54 = [v12 preserveForArchiveOnly];
          if (objc_opt_respondsToSelector())
          {
            unsigned int v18 = objc_msgSend((id)objc_msgSend(v12, "compressionType"), "identifier");
            if (v18 == 2) {
              uint64_t v19 = 0;
            }
            else {
              uint64_t v19 = v18;
            }
            uint64_t v53 = v19;
          }
          else
          {
            uint64_t v53 = 0;
          }
          if (v13) {
            uint64_t v20 = 0;
          }
          else {
            uint64_t v20 = v16;
          }
          if (v13) {
            uint64_t v21 = 0;
          }
          else {
            uint64_t v21 = v15;
          }
          int v22 = [(CoreThemeDocument *)v6 renditionKeySemantics];
          uint64_t v23 = (void *)[v12 keySpec];
          if (v22 == 1)
          {
            long long v24 = (void *)[v23 presentationState];
            int v25 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "size");
            uint64_t v26 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d", v58, v21, v20, objc_msgSend(v24, "identifier"), objc_msgSend(v25, "identifier"), 0, 0, v13, 0, 0, v57, v53, v56, v55, v17, v54);
          }
          else
          {
            uint64_t v48 = [v23 subtype];
            uint64_t v27 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "idiom");
            uint64_t v28 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "sizeClassHorizontal");
            uint64_t v29 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "sizeClassVertical");
            uint64_t v47 = v21;
            uint64_t v30 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "memoryClass");
            uint64_t v31 = v20;
            uint64_t v32 = objc_msgSend((id)objc_msgSend(v12, "keySpec"), "graphicsFeatureSetClass");
            uint64_t v43 = v31;
            int v6 = v46;
            uint64_t v26 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d", v58, v47, v43, v48, objc_msgSend(v27, "identifier"), objc_msgSend(v28, "identifier"), objc_msgSend(v29, "identifier"), v13, v30, objc_msgSend(v32, "identifier"), v57, v53, v56, v55, v17, v54);
          }
          uint64_t v33 = (void *)v26;
          uint64_t v34 = objc_msgSend((id)objc_msgSend(v12, "production"), "tags");
          unint64_t v10 = 0x2687F3000;
          uint64_t v14 = v59;
          if ([v34 count])
          {
            id v35 = objc_alloc_init(MEMORY[0x263F089D8]);
            v60[0] = MEMORY[0x263EF8330];
            v60[1] = 3221225472;
            v60[2] = __52__CoreThemeDocument__updateRenditionPackings_error___block_invoke;
            v60[3] = &unk_264C448C0;
            v60[4] = v35;
            [v34 enumerateObjectsUsingBlock:v60];
            uint64_t v36 = [v50 objectForKey:v35];
            if (v36)
            {
              uint64_t v37 = (void *)v36;
            }
            else
            {
              uint64_t v37 = (void *)[NSNumber numberWithInt:(unsigned __int16)v45];
              [v50 setObject:v37 forKey:v35];
              ++v45;
            }
            objc_msgSend(v33, "appendFormat:", @".tag%d", objc_msgSend(v37, "intValue"));
          }
          [(CoreThemeDocument *)v6 _insertRendition:v12 forKey:v33];
          uint64_t v9 = v49;
          uint64_t v8 = v51;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  return 1;
}

void __52__CoreThemeDocument__updateRenditionPackings_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)objc_msgSend((id)objc_msgSend(a2, "identifier"), "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"|", @"||", 2, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @".", @"|", 2, 0, objc_msgSend(v3, "length"));
  [*(id *)(a1 + 32) appendString:v3];
}

- (void)_groupPackableRenditions
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  id v132 = [(CoreThemeDocument *)self displayGamuts];
  id v125 = [(CoreThemeDocument *)self featureSetClasses];
  id v124 = [(CoreThemeDocument *)self idioms];
  v178[0] = [(CoreThemeDocument *)self sizeWithIdentifier:0];
  v178[1] = [(CoreThemeDocument *)self sizeWithIdentifier:1];
  v178[2] = [(CoreThemeDocument *)self sizeWithIdentifier:2];
  v178[3] = [(CoreThemeDocument *)self sizeWithIdentifier:3];
  double v123 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v178 count:4];
  id v122 = [(CoreThemeDocument *)self sizeClasses];
  v177[0] = [(CoreThemeDocument *)self presentationStateWithIdentifier:0];
  v177[1] = [(CoreThemeDocument *)self presentationStateWithIdentifier:1];
  v177[2] = [(CoreThemeDocument *)self presentationStateWithIdentifier:2];
  double v121 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v177 count:3];
  id v131 = [(CoreThemeDocument *)self compressionTypes];
  id v130 = [(CoreThemeDocument *)self deploymentTargets];
  id v129 = [(CoreThemeDocument *)self partWithIdentifier:181];
  id v128 = [(CoreThemeDocument *)self renditionTypeWithIdentifier:1004];
  id v133 = [(CoreThemeDocument *)self elementWithIdentifier:9];
  id v120 = [(CoreThemeDocument *)self partWithIdentifier:127];
  id v147 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = self;
  id v146 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v150 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  obuint64_t j = (id)objc_msgSend((id)-[NSMutableDictionary allKeys](self->_packableRenditions, "allKeys"), "sortedArrayUsingSelector:");
  long long v157 = self;
  uint64_t v142 = [obj countByEnumeratingWithState:&v166 objects:v176 count:16];
  if (v142)
  {
    uint64_t v140 = *(void *)v167;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v167 != v140) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v166 + 1) + 8 * v4);
        int v6 = (void *)[v5 componentsSeparatedByString:@"."];
        long long v153 = v5;
        uint64_t v7 = (void *)[(NSMutableDictionary *)v3->_packableRenditions objectForKey:v5];
        unint64_t v8 = [v7 count];
        int v9 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 7), "intValue");
        int v10 = v9;
        uint64_t v144 = v4;
        if (v8 == 1)
        {
          if (!v9) {
            [v150 addObject:v153];
          }
        }
        else
        {
          int v11 = objc_msgSend((id)objc_msgSend(v6, "firstObject"), "intValue");
          if (v10)
          {
            unint64_t v12 = 0x366666uLL / v11;
            if (!v8) {
              goto LABEL_31;
            }
          }
          else
          {
            LODWORD(v12) = __packing_max_area;
            if (!v8) {
              goto LABEL_31;
            }
          }
          unint64_t v13 = 0;
          uint64_t v14 = 0;
          double v15 = (double)(unint64_t)((int)v12 * (uint64_t)v11);
          unint64_t v155 = v8;
          do
          {
            unint64_t v16 = [v7 count];
            if (v16 <= v13)
            {
              unint64_t v17 = v13;
            }
            else
            {
              unint64_t v17 = v16;
              uint64_t v18 = 0;
              unint64_t v19 = v13 - v16;
              double v20 = 0.0;
              while (1)
              {
                unint64_t v21 = v13 + v18;
                int v22 = (void *)[v7 objectAtIndex:v13 + v18];
                int v23 = [v22 width];
                double v20 = v20 + (double)(int)([v22 height] * v23);
                if (v20 >= v15) {
                  break;
                }
                ++v18;
                if (!(v19 + v18)) {
                  goto LABEL_23;
                }
              }
              long long v24 = (void *)[v7 array];
              int v25 = objc_alloc_init(TDPacker);
              [(TDPacker *)v25 setSizeHandler:&__block_literal_global_1649];
              -[TDPacker setObjectsToPack:](v25, "setObjectsToPack:", objc_msgSend(v24, "subarrayWithRange:", v13, v18));
              [(TDPacker *)v25 pack];
              [(TDPacker *)v25 enclosingSize];
              double v27 = v26;
              double v29 = v28;
              uint64_t v30 = [(TDPacker *)v25 countOfEmptyNodes];

              if (v21 + v30 >= v17) {
                goto LABEL_22;
              }
              uint64_t v31 = objc_alloc_init(TDPacker);
              [(TDPacker *)v31 setSizeHandler:&__block_literal_global_1649];
              -[TDPacker setObjectsToPack:](v31, "setObjectsToPack:", objc_msgSend(v24, "subarrayWithRange:", v13, v30 + v18));
              [(TDPacker *)v31 pack];
              [(TDPacker *)v31 enclosingSize];
              double v33 = v32;
              double v35 = v34;

              unint64_t v17 = v21 + v30;
              if (v35 * v33 != v29 * v27) {
LABEL_22:
              }
                unint64_t v17 = v13 + v18;
LABEL_23:
              if (v17 <= v13)
              {
                unint64_t v8 = v155;
              }
              else
              {
                unint64_t v8 = v155;
                if (v17 <= v155)
                {
                  if (v17 == v155) {
                    uint64_t v36 = v155 - v13;
                  }
                  else {
                    uint64_t v36 = v17 - v13 + 1;
                  }
                  uint64_t v37 = objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithOrderedSet:range:copyItems:", v7, v13, v36, 0);
                  [v150 addObject:v153];
                  uint64_t v38 = (void *)[v153 mutableCopy];
                  objc_msgSend(v38, "appendFormat:", @".%d", v14);
                  [v147 setObject:v37 forKey:v38];
                }
              }
            }
            unint64_t v13 = v17 + 1;
            uint64_t v14 = (v14 + 1);
          }
          while (v17 + 1 < v8);
        }
LABEL_31:
        uint64_t v4 = v144 + 1;
        id v3 = v157;
      }
      while (v144 + 1 != v142);
      uint64_t v142 = [obj countByEnumeratingWithState:&v166 objects:v176 count:16];
    }
    while (v142);
  }
  [(NSMutableDictionary *)v3->_packableRenditions removeObjectsForKeys:v150];
  [(NSMutableDictionary *)v3->_packableRenditions addEntriesFromDictionary:v147];

  uint64_t v39 = objc_alloc_init(TDPacker);
  [(TDPacker *)v39 setSizeHandler:&__block_literal_global_1153];
  double v126 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableDictionary count](v3->_packableRenditions, "count"));
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v127 = (id)objc_msgSend((id)-[NSMutableDictionary allKeys](v3->_packableRenditions, "allKeys"), "sortedArrayUsingSelector:", sel_localizedCompare_);
  uint64_t v137 = [v127 countByEnumeratingWithState:&v162 objects:v175 count:16];
  if (!v137) {
    goto LABEL_93;
  }
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v136 = *(void *)v163;
  do
  {
    for (uint64_t i = 0; i != v137; uint64_t i = v75 + 1)
    {
      if (*(void *)v163 != v136) {
        objc_enumerationMutation(v127);
      }
      unsigned int v41 = *(void **)(*((void *)&v162 + 1) + 8 * i);
      uint64_t v42 = (void *)[(NSMutableDictionary *)v3->_packableRenditions objectForKey:v41];
      uint64_t v43 = [v42 count];
      -[TDPacker setObjectsToPack:](v39, "setObjectsToPack:", [v42 array]);
      [(TDPacker *)v39 pack];
      id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (v43)
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if ([(TDPacker *)v39 objectAtIndexFit:j])
          {
            [(TDPacker *)v39 fitPositionOfObjectAtIndex:j];
            objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", j), "setPackedPoint:", v46 + 2.0, v47 + 2.0);
            objc_msgSend(v44, "addObject:", objc_msgSend(v42, "objectAtIndex:", j));
          }
        }
      }
      uint64_t v154 = i;
      long long v156 = v44;
      uint64_t v48 = (void *)[v41 componentsSeparatedByString:@"."];
      uint64_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 0), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 3), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 4), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 5), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 6), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 7), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 8), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 9), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 10), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 12), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"), objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 15), "intValue"));
      id v50 = (void *)[v146 objectForKey:v49];
      if (v50) {
        uint64_t v51 = [v50 intValue] + 1;
      }
      else {
        uint64_t v51 = 0;
      }
      uint64_t v52 = [NSNumber numberWithInt:v51];
      [v146 setObject:v52 forKey:v49];
      if (![v44 count])
      {
        uint64_t v75 = v154;
        id v3 = v157;
        goto LABEL_91;
      }
      id v3 = v157;
      id v53 = [(CoreThemeDocument *)v157 newObjectForEntity:@"PackedRenditionSpec"];
      objc_msgSend(v53, "setPackedRenditions:", objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v44));
      objc_msgSend(v53, "setCompressionType:", objc_msgSend(v131, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 11), "intValue")));
      id v54 = [(CoreThemeDocument *)v157 newObjectForEntity:@"RenditionKeySpec"];
      uint64_t v55 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 7), "intValue");
      long long v151 = (void *)v52;
      if (!v55)
      {
        [v54 setElement:v133];
        id v76 = [(CoreThemeDocument *)v157 newObjectForEntity:@"ElementProduction"];
        objc_msgSend(v76, "setTags:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "firstObject"), "production"), "tags"));
        id v77 = v76;
        id v73 = [(CoreThemeDocument *)v157 newObjectForEntity:@"RenditionKeySpec"];
        [v73 setNameIdentifier:0];
        objc_msgSend(v73, "setElement:", objc_msgSend(v54, "element"));
        long long v145 = v54;
        objc_msgSend(v73, "setPart:", objc_msgSend(v54, "part"));
        long long v148 = v76;
        [v76 setBaseKeySpec:v73];
LABEL_59:

        id v54 = v145;
        id v59 = v148;
        id v3 = v157;
        goto LABEL_60;
      }
      uint64_t v56 = v55;
      [v53 setAlphaCrop:1];
      [v54 setElement:v133];
      [v54 setNameIdentifier:v56];
      uint64_t v57 = (int)v56;
      uint64_t v58 = -[NSMutableDictionary objectForKey:](v157->_explicitlyPackedPackings, "objectForKey:", [NSNumber numberWithInteger:(int)v56]);
      id v59 = [(CoreThemeDocument *)v157 namedArtworkProductionWithName:v58];
      if (!v59)
      {
        long long v143 = v53;
        uint64_t v60 = v56;
        id v61 = [(CoreThemeDocument *)v157 newObjectForEntity:@"NamedArtworkProduction"];
        objc_msgSend(v61, "setTags:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v156, "firstObject"), "production"), "tags"));
        id v62 = [(CoreThemeDocument *)v157 _createNamedElementWithIdentifier:v57];
        objc_msgSend(v62, "setDateOfLastChange:", objc_msgSend(MEMORY[0x263EFF910], "date"));
        [v62 setName:v58];
        [v61 setName:v62];
        id v63 = v61;
        id v64 = [(CoreThemeDocument *)v157 newObjectForEntity:@"RenditionKeySpec"];
        uint64_t v141 = v60;
        [v64 setNameIdentifier:v60];
        objc_msgSend(v64, "setElement:", objc_msgSend(v54, "element"));
        long long v145 = v54;
        objc_msgSend(v64, "setPart:", objc_msgSend(v54, "part"));
        long long v148 = v61;
        [v61 setBaseKeySpec:v64];

        id obja = [(CoreThemeDocument *)v157 newObjectForEntity:@"ContentsRenditionSpec"];
        id v65 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v66 = (void *)-[NSMutableDictionary objectForKey:](v157->_explicitlyPackedContents, "objectForKey:", [NSNumber numberWithInteger:v57]);
        long long v158 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        uint64_t v67 = [v66 countByEnumeratingWithState:&v158 objects:v174 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v159;
          do
          {
            for (uint64_t k = 0; k != v68; ++k)
            {
              if (*(void *)v159 != v69) {
                objc_enumerationMutation(v66);
              }
              uint64_t v71 = *(void *)(*((void *)&v158 + 1) + 8 * k);
              id v72 = [(CoreThemeDocument *)v157 newObjectForEntity:@"ContentsName"];
              [v72 setName:v71];
              [v65 addObject:v72];
            }
            uint64_t v68 = [v66 countByEnumeratingWithState:&v158 objects:v174 count:16];
          }
          while (v68);
        }
        id v73 = obja;
        [obja setContains:v65];

        id v74 = [(CoreThemeDocument *)v157 newObjectForEntity:@"RenditionKeySpec"];
        [v74 setNameIdentifier:v141];
        [v74 setElement:v133];
        [v74 setPart:v120];
        [v74 setScaleFactor:1];
        [obja setKeySpec:v74];

        [obja setProduction:v148];
        id v53 = v143;
        goto LABEL_59;
      }
LABEL_60:
      objc_msgSend(v59, "setBaseKeySpec:", objc_msgSend(v59, "baseKeySpec"));
      [v53 setKeySpec:v54];
      [v53 resetToBaseKeySpec];
      objc_msgSend(v54, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 0), "intValue"));
      [v54 setPart:v129];
      int v78 = [(CoreThemeDocument *)v3 renditionKeySemantics];
      uint64_t v79 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 3), "intValue");
      if (v78 == 1)
      {
        objc_msgSend(v54, "setPresentationState:", objc_msgSend(v121, "objectAtIndexedSubscript:", (int)v79));
        objc_msgSend(v54, "setSize:", objc_msgSend(v123, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 4), "intValue")));
      }
      else
      {
        [v54 setSubtype:v79];
        objc_msgSend(v54, "setIdiom:", objc_msgSend(v124, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 4), "intValue")));
        objc_msgSend(v54, "setSizeClassHorizontal:", objc_msgSend(v122, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 5), "intValue")));
        objc_msgSend(v54, "setSizeClassVertical:", objc_msgSend(v122, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 6), "intValue")));
        objc_msgSend(v54, "setMemoryClass:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 8), "intValue"));
        objc_msgSend(v54, "setGraphicsFeatureSetClass:", objc_msgSend(v125, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 9), "intValue")));
      }
      id v44 = v156;
      objc_msgSend(v54, "setGamut:", objc_msgSend(v132, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 10), "intValue")));
      objc_msgSend(v54, "setDimension1:", objc_msgSend(v151, "intValue"));
      objc_msgSend(v54, "setTarget:", objc_msgSend(v130, "objectAtIndexedSubscript:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 12), "intValue")));
      if (objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"))
      {
        if (v134
          && (int v80 = [v134 identifier],
              int v81 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"),
              uint64_t v82 = (uint64_t)v134,
              v81 == v80))
        {
          uint64_t v83 = v54;
        }
        else
        {
          uint64_t v82 = -[CoreThemeDocument appearanceWithIdentifier:](v3, "appearanceWithIdentifier:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 13), "intValue"));
          uint64_t v83 = v54;
          uint64_t v134 = (void *)v82;
        }
      }
      else
      {
        uint64_t v83 = v54;
        uint64_t v82 = 0;
      }
      [v83 setAppearance:v82];
      if (objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"))
      {
        if (v135
          && (int v84 = [v135 identifier],
              int v85 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"),
              uint64_t v86 = (uint64_t)v135,
              v85 == v84))
        {
          double v87 = v54;
        }
        else
        {
          uint64_t v86 = -[CoreThemeDocument localizationWithIdentifier:](v3, "localizationWithIdentifier:", (int)objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 14), "intValue"));
          double v87 = v54;
          uint64_t v135 = (void *)v86;
        }
      }
      else
      {
        double v87 = v54;
        uint64_t v86 = 0;
      }
      [v87 setLocalization:v86];
      [v53 setProduction:v59];

      [v59 setRenditionType:v128];
      [v53 setRenditionType:v128];
      [(TDPacker *)v39 enclosingSize];
      double v89 = v88 + 1.0;
      double v91 = v90 + 1.0;
      double v92 = fmod(v90 + 1.0, 2.0);
      if (v92 == 0.0) {
        double v92 = -0.0;
      }
      double v93 = v91 + v92;
      double v94 = fmod(v89, 2.0);
      if (v94 == 0.0) {
        double v94 = -0.0;
      }
      [v53 setWidth:(int)(v89 + v94)];
      [v53 setHeight:(int)v93];
      objc_msgSend(v53, "setOpaque:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 1), "BOOLValue"));
      objc_msgSend(v53, "setMonochrome:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 2), "BOOLValue"));
      objc_msgSend(v53, "setPreserveForArchiveOnly:", objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", 15), "intValue") != 0);
      if (__coreThemeLoggingEnabled)
      {
        int v95 = [v53 width];
        int v96 = [v53 height];
        long long v170 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        id v97 = (void *)[v53 packedRenditions];
        uint64_t v98 = [v97 countByEnumeratingWithState:&v170 objects:v179 count:16];
        if (v98)
        {
          uint64_t v99 = v98;
          int v149 = v96;
          int v152 = v95;
          int v100 = 0;
          uint64_t v101 = *(void *)v171;
          do
          {
            for (uint64_t m = 0; m != v99; ++m)
            {
              if (*(void *)v171 != v101) {
                objc_enumerationMutation(v97);
              }
              double v103 = *(void **)(*((void *)&v170 + 1) + 8 * m);
              int v104 = [v103 width];
              v100 += [v103 height] * v104;
            }
            uint64_t v99 = [v97 countByEnumeratingWithState:&v170 objects:v179 count:16];
          }
          while (v99);
          float v105 = (float)v100;
          id v44 = v156;
          id v3 = v157;
          int v95 = v152;
          int v96 = v149;
        }
        else
        {
          float v105 = 0.0;
        }
        float v106 = v105 / (float)(v96 * v95);
        NSLog(&cfstr_PackedRenditio.isa, [v53 renditionPackName], (float)(v106 * 100.0));
        *(float *)&double v107 = v106;
        objc_msgSend(v126, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v107));
      }

      uint64_t v75 = v154;
LABEL_91:
    }
    uint64_t v137 = [v127 countByEnumeratingWithState:&v162 objects:v175 count:16];
  }
  while (v137);
LABEL_93:

  if (__coreThemeLoggingEnabled)
  {
    objc_msgSend((id)objc_msgSend(v126, "valueForKeyPath:", @"@avg.self"), "floatValue");
    float v109 = v108;
    double v110 = (void *)[v126 sortedArrayUsingSelector:sel_compare_];
    if ([v110 count] == 1)
    {
      id v111 = (void *)[v110 objectAtIndex:1];
      goto LABEL_98;
    }
    char v112 = [v110 count];
    id v111 = objc_msgSend(v110, "objectAtIndex:", (unint64_t)objc_msgSend(v110, "count") >> 1);
    long long v113 = v111;
    if (v112)
    {
LABEL_98:
      [v111 floatValue];
      float v118 = v119;
    }
    else
    {
      long long v114 = objc_msgSend(v110, "objectAtIndex:", ((unint64_t)objc_msgSend(v110, "count") >> 1) + 1);
      [v113 floatValue];
      float v116 = v115;
      [v114 floatValue];
      float v118 = (float)(v116 + v117) * 0.5;
    }
    NSLog(&cfstr_MeanSpaceUtili.isa, (float)(v109 * 100.0));
    NSLog(&cfstr_MedianSpaceUti.isa, (float)(v118 * 100.0));
  }
}

double __45__CoreThemeDocument__groupPackableRenditions__block_invoke(uint64_t a1, void *a2)
{
  double v3 = (double)(int)([a2 width] + 2);
  [a2 height];
  return v3;
}

- (void)packRenditionsError:(id *)a3
{
  if ([(CoreThemeDocument *)self featureEnabled:2])
  {
    id v5 = [(CoreThemeDocument *)self allObjectsForEntity:@"PackedRenditionSpec" withSortDescriptors:0];
    if ([v5 count]) {
      [(CoreThemeDocument *)self deleteObjects:v5];
    }
    [(CoreThemeDocument *)self _updateRenditionPackings:[(CoreThemeDocument *)self allObjectsForEntity:@"RenditionSpec" withSortDescriptors:0] error:a3];
    [(CoreThemeDocument *)self _groupPackableRenditions];
  }
}

- (void)incrementallyPackRenditionsSinceDate:(id)a3 error:(id *)a4
{
  if (a3 && [(CoreThemeDocument *)self featureEnabled:2])
  {
    id v7 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self, "objectsForEntity:withPredicate:sortDescriptors:", @"RenditionSpec", [MEMORY[0x263F08A98] predicateWithFormat:@"production.dateOfLastChange > %@", a3], 0);
    NSLog(&cfstr_FoundLuChanged.isa, [v7 count], a3, v7);
    [(CoreThemeDocument *)self _updateRenditionPackings:v7 error:a4];
    [(CoreThemeDocument *)self _groupPackableRenditions];
  }
}

- (void)_optimizeForDeviceTraits
{
  uint64_t v233 = *MEMORY[0x263EF8340];
  if (![(CoreThemeDocument *)self deviceTraitsUsedForOptimization]) {
    return;
  }
  id v116 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v3 = [(TDDeviceTraits *)[(CoreThemeDocument *)self optimizeForDeviceTraits] hostedIdiomValues];
  id v121 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v118 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v117 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v131 = self;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  obuint64_t j = [(CoreThemeDocument *)self allObjectsForEntity:@"ElementProduction" withSortDescriptors:0];
  id v122 = v4;
  uint64_t v114 = [obj countByEnumeratingWithState:&v208 objects:v231 count:16];
  if (!v114) {
    goto LABEL_37;
  }
  uint64_t v112 = *(void *)v209;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v209 != v112) {
        objc_enumerationMutation(obj);
      }
      unint64_t v8 = *(void **)(*((void *)&v208 + 1) + 8 * v7);
      if (objc_msgSend((id)objc_msgSend(v8, "renditionType"), "identifier") == 1006) {
        [v118 addObject:v8];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v117 addObject:v8];
      }
      uint64_t v119 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 optOutOfThinning])
      {
        objc_msgSend(v5, "unionSet:", objc_msgSend(v8, "renditions"));
        goto LABEL_35;
      }
      long long v207 = 0u;
      long long v206 = 0u;
      long long v205 = 0u;
      long long v204 = 0u;
      id v127 = (id)[v8 renditions];
      uint64_t v143 = [v127 countByEnumeratingWithState:&v204 objects:v230 count:16];
      if (v143)
      {
        uint64_t v9 = *(void *)v205;
        uint64_t v125 = *(void *)v205;
        do
        {
          for (uint64_t i = 0; i != v143; ++i)
          {
            if (*(void *)v205 != v9) {
              objc_enumerationMutation(v127);
            }
            int v11 = *(void **)(*((void *)&v204 + 1) + 8 * i);
            unsigned int v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "idiom"), "identifier");
            int v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "element"), "identifier");
            int v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "part"), "identifier");
            if (v3
              && -[NSArray containsObject:](v3, "containsObject:", [NSNumber numberWithInteger:v12])|| v13 == 127|| v14 == 218)
            {
              double v26 = v5;
            }
            else if (v13 == 9 {
                   && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "production"), "name"), "identifier"))
            }
            {
              double v26 = v121;
            }
            else
            {
              int v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "part"), "identifier");
              id v139 = (id)NSString;
              id v136 = (id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "nameIdentifier");
              uint64_t v132 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "element"), "identifier");
              uint64_t v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "part"), "identifier");
              uint64_t v17 = objc_msgSend((id)objc_msgSend(v11, "keySpec"), "dimension1");
              uint64_t v18 = (void *)[v11 keySpec];
              if (v15 == 220)
              {
                id v123 = (id)[v18 dimension2];
                uint64_t v19 = v16;
                double v20 = v3;
                unsigned int v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "appearance"), "identifier");
                unsigned int v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "localization"), "identifier");
                uint64_t v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphWeight"), "identifier");
                uint64_t v110 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphSize"), "identifier");
                uint64_t v24 = v21;
                double v3 = v20;
                uint64_t v25 = objc_msgSend(v139, "stringWithFormat:", @"%d.%d.%d.%d.%d.%d.%d.%d.%d", v136, v132, v19, v17, v123, v24, v22, v23, v110);
              }
              else
              {
                uint64_t v25 = objc_msgSend(v139, "stringWithFormat:", @"%d.%d.%d.%d.%d.%d.%d.%d", v136, v132, v16, v17, objc_msgSend((id)objc_msgSend(v18, "appearance"), "identifier"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "localization"), "identifier"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "keySpec"), "glyphSize"), "identifier"), v109);
              }
              uint64_t v27 = v25;
              id v4 = v122;
              double v26 = (void *)[v122 objectForKey:v25];
              uint64_t v9 = v125;
              if (!v26)
              {
                id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
                [v28 addObject:v11];
                [v122 setObject:v28 forKey:v27];

                continue;
              }
            }
            [v26 addObject:v11];
          }
          uint64_t v143 = [v127 countByEnumeratingWithState:&v204 objects:v230 count:16];
        }
        while (v143);
      }
LABEL_35:
      uint64_t v7 = v119 + 1;
    }
    while (v119 + 1 != v114);
    uint64_t v114 = [obj countByEnumeratingWithState:&v208 objects:v231 count:16];
  }
  while (v114);
LABEL_37:
  long long v203 = 0u;
  long long v202 = 0u;
  long long v201 = 0u;
  long long v200 = 0u;
  uint64_t v115 = [v4 countByEnumeratingWithState:&v200 objects:v229 count:16];
  if (v115)
  {
    uint64_t v113 = *(void *)v201;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v201 != v113) {
          objc_enumerationMutation(v4);
        }
        uint64_t v120 = v29;
        uint64_t v30 = *(void *)(*((void *)&v200 + 1) + 8 * v29);
        id v137 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v128 = (id)[v4 objectForKey:v30];
        long long v196 = 0u;
        long long v197 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        id v124 = [(CoreThemeDocument *)v131 deviceTraitsUsedForOptimization];
        uint64_t v133 = [v124 countByEnumeratingWithState:&v196 objects:v228 count:16];
        if (v133)
        {
          uint64_t v126 = *(void *)v197;
          do
          {
            for (uint64_t j = 0; j != v133; ++j)
            {
              if (*(void *)v197 != v126) {
                objc_enumerationMutation(v124);
              }
              double v32 = *(void **)(*((void *)&v196 + 1) + 8 * j);
              uint64_t v144 = (void *)MEMORY[0x263F38378];
              [v32 scale];
              uint64_t v34 = objc_msgSend(v144, "bestMatchUsingObjects:getAttributeValueUsing:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:deploymentTarget:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsFeatureSetClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:platform:", v128, &__block_literal_global_1178, objc_msgSend(v32, "idiomValue"), objc_msgSend(v32, "subtype"), objc_msgSend(v32, "displayGamutValue"), objc_msgSend(v32, "deploymentTargetValue"), (double)(uint64_t)v33, 5, 0, 0, objc_msgSend(v32, "memoryPerformanceClass"), objc_msgSend(v32, "graphicsFeatureSetClassValue"), objc_msgSend(v32, "graphicsFeatureSetFallbackValues"), objc_msgSend(v32, "subtypeFallbackValues"), -[CoreThemeDocument targetPlatform](v131, "targetPlatform"));
              if (v34)
              {
                uint64_t v35 = v34;
                [v5 addObject:v34];
                [v137 addObject:v35];
              }
            }
            uint64_t v133 = [v124 countByEnumeratingWithState:&v196 objects:v228 count:16];
          }
          while (v133);
        }
        uint64_t v36 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v128];
        [v36 minusSet:v5];
        long long v194 = 0u;
        long long v195 = 0u;
        long long v192 = 0u;
        long long v193 = 0u;
        uint64_t v134 = [v137 countByEnumeratingWithState:&v192 objects:v227 count:16];
        if (v134)
        {
          id v129 = *(id *)v193;
          do
          {
            uint64_t v37 = 0;
            do
            {
              if (*(id *)v193 != v129) {
                objc_enumerationMutation(v137);
              }
              uint64_t v140 = v37;
              uint64_t v38 = *(void **)(*((void *)&v192 + 1) + 8 * (void)v37);
              long long v188 = 0u;
              long long v189 = 0u;
              long long v190 = 0u;
              long long v191 = 0u;
              uint64_t v39 = (void *)[v36 allObjects];
              long long v145 = (void *)[MEMORY[0x263EFF980] array];
              long long v212 = 0u;
              long long v213 = 0u;
              long long v214 = 0u;
              long long v215 = 0u;
              uint64_t v40 = [v39 countByEnumeratingWithState:&v212 objects:v232 count:16];
              if (v40)
              {
                uint64_t v41 = v40;
                uint64_t v42 = *(void *)v213;
                do
                {
                  for (uint64_t k = 0; k != v41; ++k)
                  {
                    if (*(void *)v213 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    id v44 = *(void **)(*((void *)&v212 + 1) + 8 * k);
                    int v45 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "nameIdentifier");
                    if (v45 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "nameIdentifier"))
                    {
                      int v46 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "scaleFactor");
                      if (v46 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "scaleFactor"))
                      {
                        int v47 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "idiom"), "identifier");
                        if (v47 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "idiom"), "identifier"))
                        {
                          int v48 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "subtype");
                          if (v48 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "subtype"))
                          {
                            int v49 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "gamut"), "identifier");
                            if (v49 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "gamut"), "identifier"))
                            {
                              int v50 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "target"), "identifier");
                              if (v50 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "target"), "identifier"))
                              {
                                int v51 = objc_msgSend((id)objc_msgSend(v44, "keySpec"), "memoryClass");
                                if (v51 == objc_msgSend((id)objc_msgSend(v38, "keySpec"), "memoryClass"))
                                {
                                  int v52 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "appearance"), "identifier");
                                  if (v52 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "appearance"), "identifier"))
                                  {
                                    int v53 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "keySpec"), "graphicsFeatureSetClass"), "identifier");
                                    if (v53 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "keySpec"), "graphicsFeatureSetClass"), "identifier"))objc_msgSend(v145, "addObject:", v44); {
                                  }
                                    }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  uint64_t v41 = [v39 countByEnumeratingWithState:&v212 objects:v232 count:16];
                }
                while (v41);
              }
              id v54 = v145;
              if (![v145 count]) {
                id v54 = 0;
              }
              uint64_t v55 = [v54 countByEnumeratingWithState:&v188 objects:v226 count:16];
              if (v55)
              {
                uint64_t v56 = v55;
                uint64_t v57 = *(void *)v189;
                do
                {
                  for (uint64_t m = 0; m != v56; ++m)
                  {
                    if (*(void *)v189 != v57) {
                      objc_enumerationMutation(v54);
                    }
                    uint64_t v59 = *(void *)(*((void *)&v188 + 1) + 8 * m);
                    [v36 removeObject:v59];
                    [v5 addObject:v59];
                  }
                  uint64_t v56 = [v54 countByEnumeratingWithState:&v188 objects:v226 count:16];
                }
                while (v56);
              }
              uint64_t v37 = v140 + 1;
            }
            while (v140 + 1 != (char *)v134);
            uint64_t v134 = [v137 countByEnumeratingWithState:&v192 objects:v227 count:16];
          }
          while (v134);
        }
        long long v186 = 0u;
        long long v187 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        uint64_t v60 = [v36 countByEnumeratingWithState:&v184 objects:v225 count:16];
        id v4 = v122;
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v185;
          do
          {
            for (uint64_t n = 0; n != v61; ++n)
            {
              if (*(void *)v185 != v62) {
                objc_enumerationMutation(v36);
              }
              objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v184 + 1) + 8 * n), "production"), "removeRenditionsObject:", *(void *)(*((void *)&v184 + 1) + 8 * n));
            }
            uint64_t v61 = [v36 countByEnumeratingWithState:&v184 objects:v225 count:16];
          }
          while (v61);
        }
        -[CoreThemeDocument deleteObjects:](v131, "deleteObjects:", [v36 allObjects]);
        [v6 unionSet:v36];

        uint64_t v29 = v120 + 1;
      }
      while (v120 + 1 != v115);
      uint64_t v115 = [v122 countByEnumeratingWithState:&v200 objects:v229 count:16];
    }
    while (v115);
  }
  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  uint64_t v64 = [v118 countByEnumeratingWithState:&v180 objects:v224 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v181;
    do
    {
      for (iuint64_t i = 0; ii != v65; ++ii)
      {
        if (*(void *)v181 != v66) {
          objc_enumerationMutation(v118);
        }
        uint64_t v68 = *(void **)(*((void *)&v180 + 1) + 8 * ii);
        -[CoreThemeDocument deleteObjects:](v131, "deleteObjects:", objc_msgSend((id)objc_msgSend(v68, "renditions"), "allObjects"));
        objc_msgSend(v68, "setRenditions:", objc_msgSend(MEMORY[0x263EFFA08], "set"));
      }
      uint64_t v65 = [v118 countByEnumeratingWithState:&v180 objects:v224 count:16];
    }
    while (v65);
  }
  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  uint64_t v146 = [v121 countByEnumeratingWithState:&v176 objects:v223 count:16];
  if (v146)
  {
    id v141 = *(id *)v177;
    do
    {
      for (juint64_t j = 0; jj != v146; ++jj)
      {
        if (*(id *)v177 != v141) {
          objc_enumerationMutation(v121);
        }
        long long v70 = *(void **)(*((void *)&v176 + 1) + 8 * jj);
        uint64_t v71 = objc_msgSend((id)objc_msgSend(v70, "packedRenditions"), "mutableCopy");
        long long v172 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        id v72 = (void *)[v70 packedRenditions];
        uint64_t v73 = [v72 countByEnumeratingWithState:&v172 objects:v222 count:16];
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v75 = *(void *)v173;
          do
          {
            for (kuint64_t k = 0; kk != v74; ++kk)
            {
              if (*(void *)v173 != v75) {
                objc_enumerationMutation(v72);
              }
              uint64_t v77 = *(void *)(*((void *)&v172 + 1) + 8 * kk);
              if ([v6 containsObject:v77]) {
                [v71 removeObject:v77];
              }
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&v172 objects:v222 count:16];
          }
          while (v74);
        }
        if ([v71 count])
        {
          [v70 setPackedRenditions:v71];
        }
        else
        {
          [v116 addObject:v70];
          objc_msgSend((id)objc_msgSend(v70, "production"), "removeRenditionsObject:", v70);
        }
      }
      uint64_t v146 = [v121 countByEnumeratingWithState:&v176 objects:v223 count:16];
    }
    while (v146);
  }
  objc_opt_class();
  objc_opt_class();
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v78 = [(CoreThemeDocument *)v131 allObjectsForEntity:@"Asset" withSortDescriptors:0];
  uint64_t v79 = [v78 countByEnumeratingWithState:&v168 objects:v221 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v169;
    do
    {
      for (muint64_t m = 0; mm != v80; ++mm)
      {
        if (*(void *)v169 != v81) {
          objc_enumerationMutation(v78);
        }
        uint64_t v83 = *(void **)(*((void *)&v168 + 1) + 8 * mm);
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
          && !objc_msgSend((id)objc_msgSend(v83, "renditions"), "count"))
        {
          [v116 addObject:v83];
        }
      }
      uint64_t v80 = [v78 countByEnumeratingWithState:&v168 objects:v221 count:16];
    }
    while (v80);
  }
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v84 = [(CoreThemeDocument *)v131 allObjectsForEntity:@"ElementProduction" withSortDescriptors:0];
  uint64_t v85 = [v84 countByEnumeratingWithState:&v164 objects:v220 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v165;
    do
    {
      for (nuint64_t n = 0; nn != v86; ++nn)
      {
        if (*(void *)v165 != v87) {
          objc_enumerationMutation(v84);
        }
        double v89 = *(void **)(*((void *)&v164 + 1) + 8 * nn);
        if (!objc_msgSend((id)objc_msgSend(v89, "renditions"), "count")) {
          [v116 addObject:v89];
        }
      }
      uint64_t v86 = [v84 countByEnumeratingWithState:&v164 objects:v220 count:16];
    }
    while (v86);
  }
  [(CoreThemeDocument *)v131 deleteObjects:v116];

  id v90 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  uint64_t v135 = [v117 countByEnumeratingWithState:&v160 objects:v219 count:16];
  if (v135)
  {
    id v130 = *(id *)v161;
    do
    {
      double v91 = 0;
      do
      {
        if (*(id *)v161 != v130) {
          objc_enumerationMutation(v117);
        }
        long long v138 = v91;
        double v92 = (void *)[*(id *)(*((void *)&v160 + 1) + 8 * (void)v91) flattenedImageProduction];
        long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        id v142 = (id)[v92 renditions];
        uint64_t v93 = [v142 countByEnumeratingWithState:&v156 objects:v218 count:16];
        if (v93)
        {
          uint64_t v94 = v93;
          uint64_t v147 = *(void *)v157;
          do
          {
            for (uint64_t i1 = 0; i1 != v94; ++i1)
            {
              if (*(void *)v157 != v147) {
                objc_enumerationMutation(v142);
              }
              int v96 = (void *)[*(id *)(*((void *)&v156 + 1) + 8 * i1) layerReferences];
              long long v152 = 0u;
              long long v153 = 0u;
              long long v154 = 0u;
              long long v155 = 0u;
              uint64_t v97 = [v96 countByEnumeratingWithState:&v152 objects:v217 count:16];
              if (v97)
              {
                uint64_t v98 = v97;
                uint64_t v99 = *(void *)v153;
                do
                {
                  for (uint64_t i2 = 0; i2 != v98; ++i2)
                  {
                    if (*(void *)v153 != v99) {
                      objc_enumerationMutation(v96);
                    }
                    uint64_t v101 = *(void **)(*((void *)&v152 + 1) + 8 * i2);
                    if (objc_msgSend(v6, "containsObject:", objc_msgSend(v101, "reference"))) {
                      [v90 addObject:v101];
                    }
                  }
                  uint64_t v98 = [v96 countByEnumeratingWithState:&v152 objects:v217 count:16];
                }
                while (v98);
              }
            }
            uint64_t v94 = [v142 countByEnumeratingWithState:&v156 objects:v218 count:16];
          }
          while (v94);
        }
        double v91 = v138 + 1;
      }
      while (v138 + 1 != (char *)v135);
      uint64_t v135 = [v117 countByEnumeratingWithState:&v160 objects:v219 count:16];
    }
    while (v135);
  }
  [(CoreThemeDocument *)v131 deleteObjects:v90];

  id v102 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v103 = [(CoreThemeDocument *)v131 allObjectsForEntity:@"MultisizeImageSetRenditionSpec" withSortDescriptors:0];
  uint64_t v104 = [v103 countByEnumeratingWithState:&v148 objects:v216 count:16];
  if (v104)
  {
    uint64_t v105 = v104;
    uint64_t v106 = *(void *)v149;
    do
    {
      for (uint64_t i3 = 0; i3 != v105; ++i3)
      {
        if (*(void *)v149 != v106) {
          objc_enumerationMutation(v103);
        }
        float v108 = *(void **)(*((void *)&v148 + 1) + 8 * i3);
        if (!objc_msgSend((id)objc_msgSend(v108, "multisizeImageRenditions"), "count")) {
          [v102 addObject:v108];
        }
      }
      uint64_t v105 = [v103 countByEnumeratingWithState:&v148 objects:v216 count:16];
    }
    while (v105);
  }
  [(CoreThemeDocument *)v131 deleteObjects:v102];
}

uint64_t __45__CoreThemeDocument__optimizeForDeviceTraits__block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  return __valueForAttributeNamed(a2, a3);
}

- (BOOL)_matchesAllExceptGamut:(id)a3 andKeySpec:(id)a4
{
  int v6 = [a3 nameIdentifier];
  if (v6 != [a4 nameIdentifier]) {
    return 0;
  }
  int v7 = [a3 dimension1];
  if (v7 != [a4 dimension1]) {
    return 0;
  }
  int v8 = [a3 dimension2];
  if (v8 != [a4 dimension2]) {
    return 0;
  }
  int v9 = [a3 scaleFactor];
  if (v9 != [a4 scaleFactor]) {
    return 0;
  }
  int v10 = [a3 subtype];
  if (v10 != [a4 subtype]) {
    return 0;
  }
  int v11 = [a3 memoryClass];
  if (v11 != [a4 memoryClass]) {
    return 0;
  }
  int v12 = objc_msgSend((id)objc_msgSend(a3, "state"), "identifier");
  if (v12 != objc_msgSend((id)objc_msgSend(a4, "state"), "identifier")) {
    return 0;
  }
  int v13 = objc_msgSend((id)objc_msgSend(a3, "presentationState"), "identifier");
  if (v13 != objc_msgSend((id)objc_msgSend(a4, "presentationState"), "identifier")) {
    return 0;
  }
  int v14 = objc_msgSend((id)objc_msgSend(a3, "value"), "identifier");
  if (v14 != objc_msgSend((id)objc_msgSend(a4, "value"), "identifier")) {
    return 0;
  }
  int v15 = objc_msgSend((id)objc_msgSend(a3, "size"), "identifier");
  if (v15 != objc_msgSend((id)objc_msgSend(a4, "size"), "identifier")) {
    return 0;
  }
  int v16 = objc_msgSend((id)objc_msgSend(a3, "direction"), "identifier");
  if (v16 != objc_msgSend((id)objc_msgSend(a4, "direction"), "identifier")) {
    return 0;
  }
  int v17 = objc_msgSend((id)objc_msgSend(a3, "part"), "identifier");
  if (v17 != objc_msgSend((id)objc_msgSend(a4, "part"), "identifier")) {
    return 0;
  }
  int v18 = objc_msgSend((id)objc_msgSend(a3, "element"), "identifier");
  if (v18 != objc_msgSend((id)objc_msgSend(a4, "element"), "identifier")) {
    return 0;
  }
  int v19 = objc_msgSend((id)objc_msgSend(a3, "layer"), "identifier");
  if (v19 != objc_msgSend((id)objc_msgSend(a4, "layer"), "identifier")) {
    return 0;
  }
  int v20 = objc_msgSend((id)objc_msgSend(a3, "previousState"), "identifier");
  if (v20 != objc_msgSend((id)objc_msgSend(a4, "previousState"), "identifier")) {
    return 0;
  }
  int v21 = objc_msgSend((id)objc_msgSend(a3, "previousValue"), "identifier");
  if (v21 == objc_msgSend((id)objc_msgSend(a4, "previousValue"), "identifier")
    && (int v22 = objc_msgSend((id)objc_msgSend(a3, "idiom"), "identifier"),
        v22 == objc_msgSend((id)objc_msgSend(a4, "idiom"), "identifier"))
    && (int v23 = objc_msgSend((id)objc_msgSend(a3, "target"), "identifier"),
        v23 == objc_msgSend((id)objc_msgSend(a4, "target"), "identifier"))
    && (int v24 = objc_msgSend((id)objc_msgSend(a3, "sizeClassHorizontal"), "identifier"),
        v24 == objc_msgSend((id)objc_msgSend(a4, "sizeClassHorizontal"), "identifier"))
    && (int v25 = objc_msgSend((id)objc_msgSend(a3, "sizeClassVertical"), "identifier"),
        v25 == objc_msgSend((id)objc_msgSend(a4, "sizeClassVertical"), "identifier"))
    && (int v26 = objc_msgSend((id)objc_msgSend(a3, "appearance"), "identifier"),
        v26 == objc_msgSend((id)objc_msgSend(a4, "appearance"), "identifier"))
    && (int v27 = objc_msgSend((id)objc_msgSend(a3, "graphicsFeatureSetClass"), "identifier"),
        v27 == objc_msgSend((id)objc_msgSend(a4, "graphicsFeatureSetClass"), "identifier")))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldGenerateDisplayGamut:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  deviceTraits = self->_deviceTraits;
  if (!deviceTraits)
  {
LABEL_11:
    LOBYTE(v5) = 1;
    return v5;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(NSMutableArray *)deviceTraits countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(deviceTraits);
      }
      if ([*(id *)(*((void *)&v10 + 1) + 8 * v8) displayGamutValue] == a3) {
        goto LABEL_11;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMutableArray *)deviceTraits countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v5) = 0;
        if (v6) {
          goto LABEL_4;
        }
        return v5;
      }
    }
  }
  return v5;
}

- (void)_automaticSRGBGenerationFromP3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if ([(CoreThemeDocument *)self shouldGenerateDisplayGamut:0])
  {
    id v31 = [(CoreThemeDocument *)self displayGamutWithIdentifier:0];
    id v3 = [(CoreThemeDocument *)self allObjectsForEntity:@"NamedArtworkProduction" withSortDescriptors:0];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v49 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "renditions"), "allObjects"));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v5);
    }
    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke;
    v47[3] = &unk_264C44D00;
    v47[4] = v8;
    v47[5] = v9;
    [v4 enumerateObjectsUsingBlock:v47];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v32 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v32)
    {
      uint64_t v10 = *(void *)v44;
      id v29 = v8;
      id v30 = v4;
      uint64_t v27 = *(void *)v44;
      id v28 = v9;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          uint64_t v39 = 0;
          uint64_t v40 = &v39;
          uint64_t v41 = 0x2020000000;
          char v42 = 0;
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke_2;
          v38[3] = &unk_264C44D28;
          v38[5] = v12;
          v38[6] = &v39;
          v38[4] = self;
          objc_msgSend(v9, "enumerateObjectsUsingBlock:", v38, v27, v28, v29, v30);
          if (!*((unsigned char *)v40 + 24))
          {
            id v33 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend((id)objc_msgSend(v12, "entity"), "name"));
            long long v13 = (void *)[v12 slices];
            if ([v13 count])
            {
              int v14 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v13, "count"));
              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v52 count:16];
              if (v15)
              {
                uint64_t v16 = *(void *)v35;
                do
                {
                  for (uint64_t k = 0; k != v15; ++k)
                  {
                    if (*(void *)v35 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    [*(id *)(*((void *)&v34 + 1) + 8 * k) sliceRect];
                    double v19 = v18;
                    double v21 = v20;
                    double v23 = v22;
                    double v25 = v24;
                    id v26 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                    objc_msgSend(v26, "setSliceRect:", v19, v21, v23, v25);
                    [v14 addObject:v26];
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v52 count:16];
                }
                while (v15);
              }
              [v33 setSlices:v14];
              id v8 = v29;
              id v4 = v30;
              uint64_t v10 = v27;
              id v9 = v28;
            }
            objc_msgSend(v33, "setAsset:", objc_msgSend(v12, "asset"));
            objc_msgSend(v33, "setProduction:", objc_msgSend(v12, "production"));
            objc_msgSend((id)objc_msgSend(v12, "production"), "processRendition:withBackstop:", v12, v33);
            [v12 copyAttributesInto:v33];
            objc_msgSend((id)objc_msgSend(v12, "keySpec"), "copyAttributesInto:", objc_msgSend(v33, "keySpec"));
            objc_msgSend((id)objc_msgSend(v33, "keySpec"), "setGamut:", v31);
            [v9 addObject:v33];
          }
          _Block_object_dispose(&v39, 8);
        }
        uint64_t v32 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v32);
    }
  }
}

uint64_t __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "gamut"), "identifier");
    uint64_t v6 = 40;
    if (v5 == 1) {
      uint64_t v6 = 32;
    }
    uint64_t v7 = *(void **)(a1 + v6);
    return [v7 addObject:a2];
  }
  return result;
}

uint64_t __51__CoreThemeDocument__automaticSRGBGenerationFromP3__block_invoke_2(uint64_t result, void *a2, unsigned char *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v4 = result;
    uint64_t result = objc_msgSend(*(id *)(result + 32), "_matchesAllExceptGamut:andKeySpec:", objc_msgSend(*(id *)(result + 40), "keySpec"), objc_msgSend(a2, "keySpec"));
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  return result;
}

- (void)_automaticP3GenerationFromSRGB
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if ([(CoreThemeDocument *)self shouldGenerateDisplayGamut:1])
  {
    id v31 = [(CoreThemeDocument *)self displayGamutWithIdentifier:1];
    id v3 = [(CoreThemeDocument *)self allObjectsForEntity:@"NamedArtworkProduction" withSortDescriptors:0];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "renditions"), "allObjects"));
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v6);
    }
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke;
    v42[3] = &unk_264C44D00;
    v42[4] = self;
    v42[5] = v9;
    [v4 enumerateObjectsUsingBlock:v42];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = v9;
    uint64_t v32 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          id v12 = -[CoreThemeDocument newObjectForEntity:](self, "newObjectForEntity:", objc_msgSend((id)objc_msgSend(v11, "entity"), "name"));
          long long v13 = (void *)[v11 slices];
          if ([v13 count])
          {
            uint64_t v33 = j;
            int v14 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v13, "count"));
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v47 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v35;
              do
              {
                for (uint64_t k = 0; k != v16; ++k)
                {
                  if (*(void *)v35 != v17) {
                    objc_enumerationMutation(v13);
                  }
                  [*(id *)(*((void *)&v34 + 1) + 8 * k) sliceRect];
                  double v20 = v19;
                  double v22 = v21;
                  double v24 = v23;
                  double v26 = v25;
                  id v27 = [(CoreThemeDocument *)self newObjectForEntity:@"Slice"];
                  objc_msgSend(v27, "setSliceRect:", v20, v22, v24, v26);
                  [v14 addObject:v27];
                }
                uint64_t v16 = [v13 countByEnumeratingWithState:&v34 objects:v47 count:16];
              }
              while (v16);
            }
            [v12 setSlices:v14];
            uint64_t j = v33;
          }
          objc_msgSend(v12, "setAsset:", objc_msgSend(v11, "asset"));
          objc_msgSend(v12, "setProduction:", objc_msgSend(v11, "production"));
          objc_msgSend((id)objc_msgSend(v11, "production"), "processRendition:withBackstop:", v11, v12);
          [v11 copyAttributesInto:v12];
          objc_msgSend((id)objc_msgSend(v11, "keySpec"), "copyAttributesInto:", objc_msgSend(v12, "keySpec"));
          objc_msgSend((id)objc_msgSend(v12, "keySpec"), "setGamut:", v31);
          id v28 = (void *)[v11 compressionType];
          if (v28 == [(CoreThemeDocument *)self compressionTypeWithIdentifier:3])
          {
            [v12 setAllowsHevcCompression:0];
            objc_msgSend(v12, "setCompressionType:", -[CoreThemeDocument compressionTypeWithIdentifier:](self, "compressionTypeWithIdentifier:", 2));
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v32);
    }
  }
}

void __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend((id)objc_msgSend(a2, "asset"), "rawData") & 1) == 0
    && objc_msgSend((id)objc_msgSend(a2, "renditionType"), "identifier") != 1006
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "gamut"), "identifier")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "glyphWeight"), "identifier")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "glyphSize"), "identifier"))
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    id v4 = objc_msgSend((id)objc_msgSend(a2, "production"), "renditions");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke_2;
    v8[3] = &unk_264C44D50;
    v8[4] = &v9;
    [v4 enumerateObjectsUsingBlock:v8];
    if (!*((unsigned char *)v10 + 24))
    {
      int v7 = 0;
      char v6 = 0;
      uint64_t v5 = (CGImage *)objc_msgSend(a2, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)objc_msgSend(a2, "asset"), "fileURLWithDocument:", *(void *)(a1 + 32)), *(void *)(a1 + 32), &v7, &v6);
      if (v5
        && v7 != 1246774599
        && v7 != 1212500294
        && ((CUIImageIsWideGamut() & 1) != 0
         || CGImageGetBitsPerComponent(v5) >= 9 && CUIImageIsMonochrome()))
      {
        [*(id *)(a1 + 40) addObject:a2];
      }
      CGImageRelease(v5);
    }
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __51__CoreThemeDocument__automaticP3GenerationFromSRGB__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "keySpec"), "gamut"), "identifier");
    if (result == 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 0;
    }
  }
  return result;
}

- (void)_processModelProductions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(CoreThemeDocument *)self allObjectsForEntity:@"ModelIOProduction" withSortDescriptors:0];
  [(NSMutableArray *)self->_cachedModelAssets removeAllObjects];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v7), "renditions"), "copy");
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
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
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) processModelObjectsInDocument:self];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
}

- (id)_cachedModelAssets
{
  return self->_cachedModelAssets;
}

- (BOOL)_clampMetrics
{
  return [(CoreThemeDocument *)self featureEnabled:15];
}

- (NSString)minimumDeploymentVersion
{
  return self->_minimumDeploymentVersion;
}

- (NSString)pathToRepresentedDocument
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPathToRepresentedDocument:(id)a3
{
}

- (TDAssetManagementDelegate)assetManagementDelegate
{
  return self->_assetManagementDelegate;
}

- (void)setAssetManagementDelegate:(id)a3
{
  self->_assetManagementDelegate = (TDAssetManagementDelegate *)a3;
}

- (TDCustomAssetProvider)customAssetProvider
{
  return self->_customAssetProvider;
}

- (void)setCustomAssetProvider:(id)a3
{
  self->_customAssetProvider = (TDCustomAssetProvider *)a3;
}

- (BOOL)featureEnabled:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int64_t v6 = [(CoreThemeDocument *)self targetPlatform];
  if ((v6 | 2) == 2)
  {
    LOBYTE(v7) = 1;
    switch((int)v3)
    {
      case 1:
      case 3:
        int majorVersion = self->_majorVersion;
        if (v6) {
          goto LABEL_64;
        }
        if (majorVersion == 10)
        {
          int minorVersion = self->_minorVersion;
          if (minorVersion > 10 || minorVersion == 10 && self->_patchVersion > 1) {
            return v7;
          }
        }
        goto LABEL_82;
      case 2:
        int majorVersion = self->_majorVersion;
        if (v6)
        {
LABEL_64:
          BOOL v14 = majorVersion <= 8;
          goto LABEL_85;
        }
        if (majorVersion >= 10 && self->_minorVersion > 10) {
          return v7;
        }
        goto LABEL_82;
      case 4:
        int majorVersion = self->_majorVersion;
        if (!v6) {
          goto LABEL_53;
        }
        goto LABEL_84;
      case 5:
      case 9:
        int majorVersion = self->_majorVersion;
        LOBYTE(v7) = majorVersion > 9;
        if (v6) {
          return v7;
        }
        if (majorVersion >= 10 && self->_minorVersion > 11) {
          goto LABEL_26;
        }
        goto LABEL_82;
      case 8:
        return v7;
      case 10:
        int majorVersion = self->_majorVersion;
        if (!v6) {
          goto LABEL_48;
        }
        goto LABEL_82;
      case 11:
      case 13:
        int majorVersion = self->_majorVersion;
        if (v6) {
          goto LABEL_68;
        }
        if (majorVersion >= 10 && self->_minorVersion > 13) {
          return v7;
        }
        goto LABEL_82;
      case 12:
        int majorVersion = self->_majorVersion;
        if (!v6) {
          goto LABEL_48;
        }
LABEL_68:
        BOOL v14 = majorVersion <= 11;
        goto LABEL_85;
      case 14:
        int64_t v10 = [(CoreThemeDocument *)self targetPlatform];
        int majorVersion = self->_majorVersion;
        if (v10)
        {
LABEL_84:
          BOOL v14 = majorVersion <= 12;
        }
        else
        {
          if (majorVersion >= 10 && self->_minorVersion > 14)
          {
LABEL_26:
            LOBYTE(v7) = 1;
            return v7;
          }
LABEL_82:
          BOOL v14 = majorVersion <= 10;
        }
LABEL_85:
        LOBYTE(v7) = !v14;
        break;
      case 15:
        int v11 = self->_majorVersion;
        if (v6) {
          BOOL v12 = v11 < 11;
        }
        else {
          BOOL v12 = 0;
        }
        LOBYTE(v7) = v12;
        if (v6 || v11 > 10) {
          return v7;
        }
        BOOL v13 = self->_minorVersion < 13;
LABEL_72:
        LOBYTE(v7) = v13;
        return v7;
      case 16:
        if (!v6) {
          goto LABEL_80;
        }
LABEL_65:
        BOOL v13 = self->_majorVersion < 11;
        goto LABEL_72;
      case 17:
        if (v6) {
          return v7;
        }
        int majorVersion = self->_majorVersion;
LABEL_48:
        if (majorVersion >= 10 && self->_minorVersion > 12) {
          return v7;
        }
        goto LABEL_82;
      case 18:
        if (v6) {
          return v7;
        }
        int majorVersion = self->_majorVersion;
LABEL_53:
        if (majorVersion >= 10 && self->_minorVersion > 14) {
          return v7;
        }
        goto LABEL_82;
      case 19:
      case 20:
        goto LABEL_80;
      default:
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument_FeatureEnabledment.m", 59, @"%s Called targetPlatform %d with unknown feature %d", "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
        goto LABEL_24;
    }
  }
  else
  {
LABEL_24:
    if ([(CoreThemeDocument *)self targetPlatform] == 4)
    {
      LOBYTE(v7) = 0;
      switch((int)v3)
      {
        case 1:
        case 2:
        case 3:
          BOOL v14 = self->_majorVersion <= 1;
          goto LABEL_85;
        case 4:
        case 12:
        case 16:
        case 18:
          return v7;
        case 5:
        case 9:
          BOOL v14 = self->_majorVersion <= 2;
          goto LABEL_85;
        case 8:
        case 17:
        case 19:
        case 20:
          goto LABEL_26;
        case 10:
          BOOL v14 = self->_majorVersion <= 3;
          goto LABEL_85;
        case 11:
        case 13:
          BOOL v14 = self->_majorVersion <= 4;
          goto LABEL_85;
        case 14:
          BOOL v14 = self->_majorVersion <= 5;
          goto LABEL_85;
        case 15:
          BOOL v13 = self->_majorVersion < 4;
          goto LABEL_72;
        default:
          objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument_FeatureEnabledment.m", 102, @"%s Called targetPlatform %d with unknown feature %d", "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
          goto LABEL_60;
      }
    }
    else
    {
LABEL_60:
      if ([(CoreThemeDocument *)self targetPlatform] == 1
        || [(CoreThemeDocument *)self targetPlatform] == 3)
      {
        LOBYTE(v7) = 1;
        switch((int)v3)
        {
          case 1:
          case 2:
          case 3:
            int majorVersion = self->_majorVersion;
            goto LABEL_64;
          case 4:
          case 5:
          case 9:
            BOOL v14 = self->_majorVersion <= 9;
            goto LABEL_85;
          case 8:
          case 17:
            return v7;
          case 10:
            int majorVersion = self->_majorVersion;
            goto LABEL_82;
          case 11:
          case 12:
          case 13:
            int majorVersion = self->_majorVersion;
            goto LABEL_68;
          case 14:
            int majorVersion = self->_majorVersion;
            goto LABEL_84;
          case 15:
          case 16:
            goto LABEL_65;
          case 18:
          case 19:
          case 20:
            goto LABEL_80;
          default:
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument_FeatureEnabledment.m", 145, @"%s Called targetPlatform %d with unknown feature %d", "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
            goto LABEL_76;
        }
      }
      else
      {
LABEL_76:
        if ([(CoreThemeDocument *)self targetPlatform] == 5)
        {
          char v15 = v3 - 1;
          if (v3 - 1) < 0x14 && ((0xFFF9Fu >> v15)) {
            return (0x13FFFu >> v15) & 1;
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreThemeDocument_FeatureEnabledment.m", 189, @"%s Called targetPlatform %d with unknown feature %d", "-[CoreThemeDocument(CoreThemeDocument_FeatureEnabledment) featureEnabled:]", v6, v3);
        }
LABEL_80:
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

- (void)createNamedGlyphVectorForCustomInfos:referenceFiles:bitSource:error:.cold.1()
{
}

@end