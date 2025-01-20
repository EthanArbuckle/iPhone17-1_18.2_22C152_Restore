@interface TDDistiller
- (BOOL)_distillColorDefinitions:(id)a3;
- (BOOL)_distillCursorFacetDefinitions:(id)a3;
- (BOOL)_distillFonts:(id)a3;
- (BOOL)_distillNamedElements:(id)a3;
- (BOOL)_setupWithOutputPath:(id)a3 attemptIncremental:(BOOL)a4;
- (BOOL)assetStoreWriteToDisk;
- (BOOL)distillCatalogGlobals;
- (BOOL)distillCursorFacetDefinitions;
- (BOOL)distillCustomColors;
- (BOOL)distillCustomFontSizes;
- (BOOL)distillCustomFonts;
- (BOOL)distillLocalizationss;
- (BOOL)distillNamedElements;
- (BOOL)distillRenditions;
- (BOOL)distillThemeAppearances;
- (BOOL)dontPackRenditionsBeforeDistilling;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isIncremental;
- (BOOL)isSuccessful;
- (BOOL)setAsset:(id)a3 withKey:(const _renditionkeytoken *)a4 fromRenditionSpec:(id)a5;
- (NSString)accumulatedErrorDescription;
- (NSString)assetStoreVersionString;
- (NSThread)callbackThread;
- (NSUUID)uuid;
- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4;
- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 attemptIncremental:(BOOL)a5;
- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 attemptIncremental:(BOOL)a5 versionString:(id)a6;
- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 versionString:(id)a5;
- (TDLogger)logger;
- (id)_copyStandardEffectDefinitions;
- (id)_filterRenditions:(id)a3;
- (id)_keyDataFromKey:(const _renditionkeytoken *)a3;
- (id)_keySpecsToRemoveFromKeySpecs:(id)a3;
- (id)_productionForRenditionSpec:(id)a3;
- (id)_renditionsFromProductions:(id)a3 error:(id *)a4;
- (id)_renditionsWithError:(id *)a3;
- (id)_textureFaceExclusionPredicate;
- (id)completionHandler;
- (id)dateOfLastDistill;
- (id)documentPath;
- (id)keyFormatData;
- (int)fileCompression;
- (int64_t)assetStoreVersionNumber;
- (unint64_t)_removeRenditionsWithKeySpecs:(id)a3;
- (void)_accumulateErrorDescription:(id)a3;
- (void)_distill:(id)a3;
- (void)_distillChanges:(id)a3;
- (void)_logError:(id)a3;
- (void)_logErrorAndAccumulateDescription:(id)a3;
- (void)_logExtra:(id)a3;
- (void)_logInfo:(id)a3;
- (void)_logWarning:(id)a3;
- (void)_resetDocumentUuid:(id)a3;
- (void)cancelDistill;
- (void)dealloc;
- (void)finishDistillationWithSuccess:(BOOL)a3;
- (void)markDistillationAsFinished;
- (void)performSelectorOnCallbackThread:(SEL)a3 withObject:(id)a4 waitUntilDone:(BOOL)a5;
- (void)removeRenditionsFromAssetStoreWithKey:(id)a3;
- (void)saveAndDistillWithCompletionHandler:(id)a3;
- (void)setAccumulatedErrorDescription:(id)a3;
- (void)setAssetColorSpaceID:(unsigned int)a3;
- (void)setAssetSchemaVersion:(unsigned int)a3;
- (void)setAssetStorageVersion:(unsigned int)a3;
- (void)setAssetStorageVersionString:(const char *)a3;
- (void)setAssetStoreAssociatedChecksum:(unsigned int)a3;
- (void)setAssetStoreKeyFormatData:(id)a3;
- (void)setAssetStoreKeySemantics:(int)a3;
- (void)setAssetStoreRenditionCount:(unsigned int)a3;
- (void)setAssetStoreUuid:(id)a3;
- (void)setAssetStoreVersionNumber:(int64_t)a3;
- (void)setAssetStoreVersionString:(id)a3;
- (void)setAuthoringTool:(id)a3;
- (void)setCallbackThread:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDeploymentPlatform:(id)a3;
- (void)setDeploymentPlatformVersion:(id)a3;
- (void)setDontPackRenditionsBeforeDistilling:(BOOL)a3;
- (void)setFileCompression:(int)a3;
- (void)setFinished:(BOOL)a3;
- (void)setIncremental:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setSuccessful:(BOOL)a3;
- (void)waitUntilFinished;
@end

@implementation TDDistiller

- (int)fileCompression
{
  return self->_fileCompression;
}

- (void)setFileCompression:(int)a3
{
  self->_fileCompression = a3;
  if (a3 == 1) {
    [MEMORY[0x263F38370] setFileEncoding:0];
  }
}

- (void)_logError:(id)a3
{
  v4 = [(TDDistiller *)self logger];

  [(TDLogger *)v4 logError:a3];
}

- (void)_logWarning:(id)a3
{
  v4 = [(TDDistiller *)self logger];

  [(TDLogger *)v4 logWarning:a3];
}

- (void)_logInfo:(id)a3
{
  v4 = [(TDDistiller *)self logger];

  [(TDLogger *)v4 logInfo:a3];
}

- (void)_logExtra:(id)a3
{
  v4 = [(TDDistiller *)self logger];

  [(TDLogger *)v4 logExtra:a3];
}

- (void)_accumulateErrorDescription:(id)a3
{
  if ([(NSString *)[(TDDistiller *)self accumulatedErrorDescription] length]) {
    a3 = (id)[NSString stringWithFormat:@"%@ -- %@", a3, -[TDDistiller accumulatedErrorDescription](self, "accumulatedErrorDescription")];
  }

  [(TDDistiller *)self setAccumulatedErrorDescription:a3];
}

- (void)_logErrorAndAccumulateDescription:(id)a3
{
  -[TDDistiller _logError:](self, "_logError:");

  [(TDDistiller *)self _accumulateErrorDescription:a3];
}

- (BOOL)_setupWithOutputPath:(id)a3 attemptIncremental:(BOOL)a4
{
  self->_assetStoreVersionNumber = 17;
  if (!a4)
  {
    -[TDDistiller _logInfo:](self, "_logInfo:", [NSString stringWithFormat:@"AttemptingIncremental %d isIncremental %d on document %@", 0, 0, a3]);
    self->_assetStore = (CUIMutableCommonAssetStorage *)[objc_alloc(MEMORY[0x263F38390]) initWithPath:a3];
LABEL_9:
    self->_renditionEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v12 = objc_alloc(MEMORY[0x263EFF8C0]);
    self->_mainThreadPerformRunLoopModes = (NSArray *)objc_msgSend(v12, "initWithObjects:", *MEMORY[0x263EFF478], @"DistillWaitRunLoopMode", 0);
    [(TDDistiller *)self _logExtra:@"Theme document and asset store created"];
    return 1;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", a3))
  {
    [(TDDistiller *)self setIncremental:1];
    -[TDDistiller _logInfo:](self, "_logInfo:", [NSString stringWithFormat:@"AttemptingIncremental %d isIncremental %d on document %@", 1, 1, a3]);
    self->_assetStore = (CUIMutableCommonAssetStorage *)[[TDProMergeableCommonAssetStorage alloc] initWithPath:a3];
    if ([(CoreThemeDocument *)self->_document pathToRepresentedDocument]
      && (objc_msgSend((id)-[CUIMutableCommonAssetStorage uuid](self->_assetStore, "uuid"), "isEqual:", -[CoreThemeDocument uuid](self->_document, "uuid")) & 1) == 0)
    {
      v14 = (__CFString *)[NSString stringWithFormat:@"Definition (%@) and CAR (%@) files do not match.", -[CoreThemeDocument pathToRepresentedDocument](self->_document, "pathToRepresentedDocument"), a3];
    }
    else
    {
      unint64_t v6 = [(CoreThemeDocument *)self->_document colorSpaceID];
      if (v6 == [(CUIMutableCommonAssetStorage *)self->_assetStore colorSpaceID])
      {
        int v7 = [(CUIMutableCommonAssetStorage *)self->_assetStore storageVersion];
        int v8 = [(CUIMutableCommonAssetStorage *)self->_assetStore schemaVersion];
        int v9 = [(TDDistiller *)self assetStoreVersionNumber];
        id v10 = [(CoreThemeDocument *)self->_document metadatumForKey:@"CoreThemeSchemaVersion"];
        if (v10) {
          int v11 = [v10 unsignedIntValue];
        }
        else {
          int v11 = 1;
        }
        if (v7 == v9 && v8 == v11)
        {
          uint64_t v15 = [(CUIMutableCommonAssetStorage *)self->_assetStore distilledInCoreUIVersion];
          uint64_t v16 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)-[CUIMutableCommonAssetStorage storageTimestamp](self->_assetStore, "storageTimestamp"));
          v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
          uint64_t v18 = [v17 objectForKey:*MEMORY[0x263F080B8]];
          v19 = &unk_26E876970;
          if (v18) {
            v19 = (void *)v18;
          }
          NSLog(&cfstr_PerformingIncr.isa, a3, v19, v15, v16);
          goto LABEL_9;
        }
        v14 = @"Definition and CAR version numbers do not match.";
      }
      else
      {
        v14 = @"Definition and CAR color spaces do not match.";
      }
    }
    [(TDDistiller *)self _logError:v14];
    [(TDDistiller *)self setIncremental:0];

    BOOL result = 0;
    self->_assetStore = 0;
  }
  else
  {
    [(TDDistiller *)self _logError:@"No CAR file to increment doing a clean distill"];
    return 0;
  }
  return result;
}

- (id)_keySpecsToRemoveFromKeySpecs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF980] array];
  if ([a3 count])
  {
    if ([(CoreThemeDocument *)self->_document countOfRenditionsMatchingRenditionKeySpecs:a3])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(a3);
            }
            uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            if (!-[CoreThemeDocument countOfRenditionsMatchingRenditionKeySpec:](self->_document, "countOfRenditionsMatchingRenditionKeySpec:", v10))[v5 addObject:v10]; {
          }
            }
          uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
    }
    else
    {
      [v5 addObjectsFromArray:a3];
    }
  }
  return v5;
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4
{
  return [(TDDistiller *)self initWithDocument:a3 outputPath:a4 attemptIncremental:0 versionString:0];
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 versionString:(id)a5
{
  return [(TDDistiller *)self initWithDocument:a3 outputPath:a4 attemptIncremental:0 versionString:a5];
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 attemptIncremental:(BOOL)a5
{
  return [(TDDistiller *)self initWithDocument:a3 outputPath:a4 attemptIncremental:a5 versionString:0];
}

- (TDDistiller)initWithDocument:(id)a3 outputPath:(id)a4 attemptIncremental:(BOOL)a5 versionString:(id)a6
{
  BOOL v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TDDistiller;
  uint64_t v10 = [(TDDistiller *)&v12 init];
  if (v10)
  {
    v10->_document = (CoreThemeDocument *)a3;
    if ([(TDDistiller *)v10 _setupWithOutputPath:a4 attemptIncremental:v7])
    {
      [(TDDistiller *)v10 setAssetStoreVersionString:a6];
    }
    else
    {
      [(TDDistiller *)v10 dealloc];
      return 0;
    }
  }
  return v10;
}

- (id)documentPath
{
  v2 = [(TDPersistentDocument *)self->_document fileURL];

  return [(NSURL *)v2 path];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  [(TDDistiller *)self setCompletionHandler:0];
  [(TDDistiller *)self setLogger:0];
  [(TDDistiller *)self setCallbackThread:0];
  v3.receiver = self;
  v3.super_class = (Class)TDDistiller;
  [(TDDistiller *)&v3 dealloc];
}

- (id)keyFormatData
{
  [(CoreThemeDocument *)self->_document renditionKeyFormat];
  v2 = (void *)MEMORY[0x263EFF8F8];

  return (id)objc_msgSend(v2, "dataWithBytes:length:");
}

- (id)_keyDataFromKey:(const _renditionkeytoken *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(_OWORD *)objc_super v12 = 0u;
  objc_super v3 = [(CoreThemeDocument *)self->_document renditionKeyFormat];
  size_t var2 = v3->var2;
  if (var2 < 0x16) {
    v5 = &v11;
  }
  else {
    v5 = (long long *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
  }
  CUIFillCARKeyArrayForRenditionKey();
  unsigned int v6 = v3->var2;
  id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v8 = 2 * v3->var2;
  if (v6 < 0x16) {
    int v9 = (void *)[v7 initWithBytes:v5 length:v8];
  }
  else {
    int v9 = (void *)[v7 initWithBytesNoCopy:v5 length:v8 freeWhenDone:1];
  }
  return v9;
}

- (id)_filterRenditions:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (void *)[MEMORY[0x263F089C8] indexSet];
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = (void *)[a3 objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v9 = (void *)[v8 mipLevels];
        uint64_t v10 = objc_msgSend(v9, "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(face != nil) AND (face.identifier != 0)"));
        if ([v10 count])
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "textureImage"));
                if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
                  [v4 addIndex:v15];
                }
                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
            }
            while (v12);
          }
        }
      }
    }
  }
  if ([v4 count])
  {
    uint64_t v16 = (void *)[a3 mutableCopy];
    [v16 removeObjectsAtIndexes:v4];
    return v16;
  }
  return a3;
}

- (id)_textureFaceExclusionPredicate
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"(((entity = 'TextureImageRenditionSpec') AND ((textureLevelAssignment.face = nil) OR (textureLevelAssignment.face.identifier = 0))) OR (renditionType.constantName != 'kCUITextureImageRenditionType'))"];
}

- (id)_renditionsWithError:(id *)a3
{
  id v5 = [(CoreThemeDocument *)self->_document objectsForEntity:@"RenditionSpec" withPredicate:0 sortDescriptors:0 error:a3];
  uint64_t v6 = [(CoreThemeDocument *)self->_document renditionKeyFormat];
  id v7 = [(TDDistiller *)self _filterRenditions:v5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__TDDistiller__renditionsWithError___block_invoke;
  v12[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v12[4] = v6;
  uint64_t v8 = (void *)[v7 sortedArrayUsingComparator:v12];
  int v9 = (void *)[MEMORY[0x263EFF980] array];
  __midpointQuickPermuteInRange(v8, 0, [v8 count], v9);
  uint64_t v10 = [v9 count];
  if (v10 != [v8 count]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDDistiller.m", 418, @"%s __midpointQuickPermute result doesn't match original count", "-[TDDistiller _renditionsWithError:]");
  }
  return v9;
}

uint64_t __36__TDDistiller__renditionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "keySpec"), "key");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "keySpec"), "key");
  uint64_t v7 = *(void *)(a1 + 32);

  return MEMORY[0x270F23A38](v5, v6, v7);
}

- (id)_renditionsFromProductions:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x263F08720];
        uint64_t v12 = [MEMORY[0x263F087F0] expressionForKeyPath:@"production"];
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v12, objc_msgSend(MEMORY[0x263F087F0], "expressionForConstantValue:", v10), 0, 4, 0));
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  return -[TDDistiller _filterRenditions:](self, "_filterRenditions:", -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self->_document, "objectsForEntity:withPredicate:sortDescriptors:error:", @"RenditionSpec", [MEMORY[0x263F08730] orPredicateWithSubpredicates:v5], 0, a4));
}

- (BOOL)setAsset:(id)a3 withKey:(const _renditionkeytoken *)a4 fromRenditionSpec:(id)a5
{
  assetStore = self->_assetStore;
  id v7 = [(TDDistiller *)self _keyDataFromKey:a4];

  return [(CUIMutableCommonAssetStorage *)assetStore setAsset:a3 forKey:v7];
}

- (unint64_t)_removeRenditionsWithKeySpecs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      id v10 = -[TDDistiller _keyDataFromKey:](self, "_keyDataFromKey:", [*(id *)(*((void *)&v12 + 1) + 8 * i) key]);
      if ([(CUIMutableCommonAssetStorage *)self->_assetStore assetExistsForKey:v10])
      {
        ++v7;
        [(TDDistiller *)self removeRenditionsFromAssetStoreWithKey:v10];
      }
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);
  return v7;
}

- (id)_productionForRenditionSpec:(id)a3
{
  uint64_t v5 = (void *)[a3 production];
  if (!v5) {
    -[TDDistiller _logWarning:](self, "_logWarning:", [NSString stringWithFormat:@"WARNING: Found a rendition spec not associated with any element production: %@", a3]);
  }
  return v5;
}

- (BOOL)distillRenditions
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)MEMORY[0x237DD6000](self, a2);
  id v25 = 0;
  v4 = [[TDRenditionsDistiller alloc] initWithDocument:self->_document shouldCompressCSIDataFlag:1];
  [(TDRenditionsDistiller *)v4 setLogger:[(TDDistiller *)self logger]];
  [(TDRenditionsDistiller *)v4 detachDistillationThread];
  [(TDDistiller *)self _logExtra:@"Fetching and distilling renditions"];
  id v5 = [(TDDistiller *)self _renditionsWithError:&v25];
  uint64_t v6 = [v5 count];
  [(CoreThemeDocument *)self->_document renditionKeyFormat];
  [(TDDistiller *)self setAssetStoreRenditionCount:v6];
  if (v25)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [v25 localizedDescription]);
    [(TDRenditionsDistiller *)v4 enqueueAbortFlag];
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v23 = v3;
    v24 = v4;
    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    if (v6)
    {
      uint64_t v9 = 0;
      while (1)
      {
        if ([(TDDistiller *)self isCancelled])
        {
          [(TDRenditionsDistiller *)v24 enqueueAbortFlag];
          goto LABEL_21;
        }
        id v10 = (void *)MEMORY[0x237DD6000]();
        uint64_t v11 = (void *)[v5 objectAtIndex:v9];
        long long v12 = (void *)[v11 keySpec];
        if (!-[TDDistiller setAsset:withKey:fromRenditionSpec:](self, "setAsset:withKey:fromRenditionSpec:", 0, [v12 key], v11))
        {
          -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [NSString stringWithFormat:@"ERROR: couldnot write key to file\n%@\n", objc_msgSend(v12, "keyDescription")]);

          goto LABEL_20;
        }
        [v12 key];
        CUIRenditionKeyCopy();
        CUIRenditionKeyStandardize();
        long long v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v26 length:4 * CUIRenditionKeyTokenCount()];
        if ([v8 containsObject:v13]) {
          break;
        }
        [(TDRenditionsDistiller *)v24 enqueueRenditionSpec:v11];
        [v8 addObject:v13];

        if (v6 == ++v9) {
          goto LABEL_9;
        }
      }
      -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [NSString stringWithFormat:@"ERROR: Identical key for two renditions\n\n%@\n", objc_msgSend(v12, "keyDescription")]);

LABEL_20:
      [(TDRenditionsDistiller *)v24 enqueueAbortFlag];
LABEL_21:
      BOOL v7 = 0;
    }
    else
    {
LABEL_9:

      long long v14 = v24;
      [(TDRenditionsDistiller *)v24 enqueueLastRenditionFlag];
      long long v15 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC");
      uint64_t v16 = [(TDRenditionsDistiller *)v24 nextCSIDataInfoFromQueue];
      if (v16 && (uint64_t v17 = (void *)v16, ![(TDDistiller *)self isCancelled]))
      {
        while (1)
        {
          long long v18 = (void *)MEMORY[0x237DD6000]();
          if (objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"DistillingAborted"), "BOOLValue"))break; {
          uint64_t v19 = [v17 objectForKey:@"CSIData"];
          }
          long long v20 = objc_msgSend(v15, "objectWithID:", objc_msgSend(v17, "objectForKey:", @"RenditionSpec"));
          BOOL v7 = -[TDDistiller setAsset:withKey:fromRenditionSpec:](self, "setAsset:withKey:fromRenditionSpec:", v19, objc_msgSend((id)objc_msgSend(v20, "keySpec"), "key"), v20);
          long long v14 = v24;
          uint64_t v21 = [(TDRenditionsDistiller *)v24 nextCSIDataInfoFromQueue];
          if (v21)
          {
            uint64_t v17 = (void *)v21;
            if (![(TDDistiller *)self isCancelled]) {
              continue;
            }
          }
          goto LABEL_12;
        }
        BOOL v7 = 0;
        long long v14 = v24;
      }
      else
      {
        BOOL v7 = 1;
      }
LABEL_12:
      [(TDRenditionsDistiller *)v14 waitUntilFinished];
    }
    objc_super v3 = v23;
  }
  return v7;
}

- (BOOL)distillThemeAppearances
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)MEMORY[0x237DD6000](self, a2);
  id v16 = 0;
  [(TDDistiller *)self _logExtra:@"Fetching and distilling appearances"];
  id v4 = [(CoreThemeDocument *)self->_document allObjectsForEntity:@"Appearance" withSortDescriptors:0 error:&v16];
  id v5 = v16;
  if (v16)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [v16 localizedDescription]);
  }
  else
  {
    uint64_t v6 = v4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[CUIMutableCommonAssetStorage setAppearanceIdentifier:forName:](self->_assetStore, "setAppearanceIdentifier:forName:", [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier], objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name"));
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5 == 0;
}

- (BOOL)distillLocalizationss
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)MEMORY[0x237DD6000](self, a2);
  id v17 = 0;
  [(TDDistiller *)self _logExtra:@"Fetching and distilling localizations"];
  id v4 = [(CoreThemeDocument *)self->_document allObjectsForEntity:@"Localization" withSortDescriptors:0 error:&v17];
  id v5 = v17;
  if (v17)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [v17 localizedDescription]);
  }
  else
  {
    uint64_t v6 = v4;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
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
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 identifier]) {
            -[CUIMutableCommonAssetStorage setLocalizationIdentifier:forName:](self->_assetStore, "setLocalizationIdentifier:forName:", [v11 identifier], objc_msgSend(v11, "name"));
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v5 == 0;
}

- (BOOL)distillCatalogGlobals
{
  id v4 = (void *)MEMORY[0x237DD6000]();
  id v12 = 0;
  [(TDDistiller *)self _logExtra:@"Fetching and distilling catalog globals"];
  id v5 = [(CoreThemeDocument *)self->_document allObjectsForEntity:@"CatalogGlobals" withSortDescriptors:0 error:&v12];
  id v6 = v12;
  if (v12)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [v12 localizedDescription]);
  }
  else
  {
    uint64_t v8 = v5;
    unint64_t v9 = [v5 count];
    if (v9 >= 2)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDDistiller.m", 653, @"More than one CatalogGlobals entity");
    }
    else if (!v9)
    {
      goto LABEL_3;
    }
    id v10 = (void *)[v8 firstObject];
    uint64_t v11 = objc_msgSend(MEMORY[0x263F08910], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(v10, "dictionaryForArchiving"), 0, 0);
    if (v11) {
      [(CUIMutableCommonAssetStorage *)self->_assetStore setCatalogGlobalData:v11];
    }
  }
LABEL_3:
  return v6 == 0;
}

- (BOOL)_distillColorDefinitions:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v15 = v6;
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(a3);
        }
        unint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x237DD6000]();
        uint64_t v11 = (void *)[v9 valueForKey:@"name"];
        id v12 = (void *)[v11 valueForKey:@"selector"];
        uint64_t v13 = objc_msgSend((id)objc_msgSend(v11, "valueForKey:", @"isExcludedFromFilter"), "BOOLValue");
        LODWORD(v9) = objc_msgSend((id)objc_msgSend(v9, "valueForKey:", @"physicalColor"), "unsignedIntValue");
        -[TDDistiller _logExtra:](self, "_logExtra:", [NSString stringWithFormat:@"Writing color A:%u R:%u G:%u B:%u name %@ excludeFromFilter %d", v9 >> 24, BYTE2(v9), BYTE1(v9), v9, v12, v13]);
        -[CUIMutableCommonAssetStorage setColor:forName:excludeFromFilter:](self->_assetStore, "setColor:forName:excludeFromFilter:", v9, [v12 UTF8String], v13);
      }
      uint64_t v6 = v15 + v5;
      uint64_t v5 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
    if (v6) {
      -[TDDistiller _logExtra:](self, "_logExtra:", objc_msgSend(NSString, "stringWithFormat:", @"Successfully distilled and stored %lu colors", v6));
    }
  }
  return 1;
}

- (BOOL)distillCustomColors
{
  objc_super v3 = (void *)MEMORY[0x237DD6000](self, a2);
  id v7 = 0;
  [(TDDistiller *)self _logExtra:@"Fetching and distilling color definitions"];
  id v4 = [(CoreThemeDocument *)self->_document allObjectsForEntity:@"ColorDefinition" withSortDescriptors:0 error:&v7];
  if (v7)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v7, "localizedDescription", v4));
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(TDDistiller *)self _distillColorDefinitions:v4];
  }
  return v5;
}

- (BOOL)_distillFonts:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v18 = v7;
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x237DD6000]();
        uint64_t v12 = [v10 postscriptName];
        uint64_t v13 = objc_msgSend((id)objc_msgSend(v10, "selector"), "constantName");
        objc_msgSend((id)objc_msgSend(v10, "baselineOffset"), "floatValue");
        int v15 = v14;
        -[TDDistiller _logExtra:](self, "_logExtra:", [NSString stringWithFormat:@"Writing font %@ for %@", v12, v13]);
        LODWORD(v16) = v15;
        [(CUIMutableCommonAssetStorage *)self->_assetStore setFontName:v12 baselineOffset:v13 forFontSelector:v16];
      }
      uint64_t v7 = v18 + v6;
      uint64_t v6 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
    if (v7) {
      -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(NSString, "stringWithFormat:", @"Successfully distilled and stored %lu fonts", v7));
    }
  }
  return 1;
}

- (BOOL)distillCustomFonts
{
  objc_super v3 = (void *)MEMORY[0x237DD6000](self, a2);
  id v7 = 0;
  [(TDDistiller *)self _logInfo:@"Fetching and distilling font definitions"];
  id v4 = [(CoreThemeDocument *)self->_document allObjectsForEntity:@"FontDefinition" withSortDescriptors:0 error:&v7];
  if (v7)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", objc_msgSend(v7, "localizedDescription", v4));
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(TDDistiller *)self _distillFonts:v4];
  }
  return v5;
}

- (BOOL)distillCustomFontSizes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  id v3 = [(CoreThemeDocument *)self->_document allObjectsForEntity:@"FontSizeDefinition" withSortDescriptors:0 error:&v15];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "selector"), "selectorName");
        objc_msgSend((id)objc_msgSend(v8, "pointSize"), "floatValue");
        -[CUIMutableCommonAssetStorage setFontSize:forFontSizeSelector:](self->_assetStore, "setFontSize:forFontSizeSelector:", v9);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
  return 1;
}

- (id)_copyStandardEffectDefinitions
{
  int64_t v2 = [(CoreThemeDocument *)self->_document targetPlatform];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  if (v2)
  {
    return (id)[v3 initWithCapacity:0];
  }
  else
  {
    uint64_t v5 = (void *)[v3 initWithCapacity:50];
    uint64_t v6 = (void *)[MEMORY[0x263F383D0] schemaForPlatform:0];
    if ([v6 effectDefinitionCount])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [v6 effectDefinitionAtIndex:v7];
        if (*(void *)(v8 + 72))
        {
          uint64_t v9 = v8 + 32;
          do
          {
            objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v6, "schemaEffectRenditionsForPartDefinition:", v9));
            uint64_t v10 = *(void *)(v9 + 480);
            v9 += 440;
          }
          while (v10);
        }
        ++v7;
      }
      while (v7 < [v6 effectDefinitionCount]);
    }
    return v5;
  }
}

- (BOOL)_distillNamedElements:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x237DD6000]();
        long long v11 = objc_msgSend((id)objc_msgSend(v9, "production"), "baseKeySpec");
        [v11 key];
        CUIRenditionKeyCopy();
        CUIRenditionKeySetValueForAttribute();
        if (objc_msgSend((id)objc_msgSend(v11, "part"), "identifier"))
        {
          if (objc_msgSend((id)objc_msgSend(v11, "part"), "identifier") != 181)
          {
            uint64_t v15 = 0;
            if (objc_msgSend(-[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self->_document, "objectsForEntity:withPredicate:sortDescriptors:error:", @"RenditionKeySpec", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"nameIdentifier == %d AND part.identifier == %d", objc_msgSend(v11, "nameIdentifier"), 181), 0, &v15), "count"))
            {
              CUIRenditionKeySetValueForAttribute();
            }
          }
        }
        CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)[v9 name]);
        long long v13 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xB734F61BuLL);
        CFStringGetFileSystemRepresentation((CFStringRef)[v9 name], v13, MaximumSizeOfFileSystemRepresentation);
        -[CUIMutableCommonAssetStorage setRenditionKey:hotSpot:forName:](self->_assetStore, "setRenditionKey:hotSpot:forName:", v20, v13, 0.0, 0.0);
        free(v13);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }
  -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(NSString, "stringWithFormat:", @"Successfully stored %ld asset name entries.", objc_msgSend(a3, "count")));
  return 1;
}

- (BOOL)distillNamedElements
{
  uint64_t v7 = 0;
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"production.isActive = YES"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"name" ascending:1];
  id v5 = -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:error:](self->_document, "objectsForEntity:withPredicate:sortDescriptors:error:", @"NamedElement", v3, [MEMORY[0x263EFF8C0] arrayWithObject:v4], &v7);

  return [(TDDistiller *)self _distillNamedElements:v5];
}

- (BOOL)_distillCursorFacetDefinitions:(id)a3
{
  id v5 = (void *)MEMORY[0x237DD6000](self, a2);
  if ([a3 count])
  {
    id v14 = a3;
    uint64_t v15 = v5;
    uint64_t v6 = (void *)[a3 objectEnumerator];
    uint64_t v7 = [v6 nextObject];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      do
      {
        double v9 = -1.0;
        double v10 = -1.0;
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "entity"), "name"), "isEqualToString:", @"CursorFacetDefinition"))
        {
          double v10 = (double)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", @"hotSpotX"), "integerValue");
          double v9 = (double)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", @"hotSpotY"), "integerValue");
        }
        CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)[v8 valueForKey:@"facetName"]);
        long long v12 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x70829098uLL);
        CFStringGetFileSystemRepresentation((CFStringRef)[v8 valueForKey:@"facetName"], v12, MaximumSizeOfFileSystemRepresentation);
        -[CUIMutableCommonAssetStorage setRenditionKey:hotSpot:forName:](self->_assetStore, "setRenditionKey:hotSpot:forName:", objc_msgSend((id)objc_msgSend(v8, "valueForKey:", @"keySpec"), "key"), v12, v10, v9);
        free(v12);
        uint64_t v8 = (void *)[v6 nextObject];
      }
      while (v8);
    }
    -[TDDistiller _logInfo:](self, "_logInfo:", objc_msgSend(NSString, "stringWithFormat:", @"Successfully stored %ld facet definitions", objc_msgSend(v14, "count")));
    id v5 = v15;
  }
  return 1;
}

- (BOOL)distillCursorFacetDefinitions
{
  uint64_t v3 = (void *)MEMORY[0x237DD6000](self, a2);
  id v20 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"facetName" ascending:1];
  id v5 = objc_msgSend(-[CoreThemeDocument allObjectsForEntity:withSortDescriptors:error:](self->_document, "allObjectsForEntity:withSortDescriptors:error:", @"CursorFacetDefinition", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v4), &v20), "mutableCopy");

  if (v20)
  {
    -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [v20 localizedDescription]);
  }
  else
  {
    uint64_t v7 = [v5 count];
    uint64_t v8 = (void *)[MEMORY[0x263F089C8] indexSet];
    if (v7 >= 1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        double v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", i), "valueForKey:", @"cursorProductions"), "objectEnumerator");
        while (1)
        {
          long long v11 = (void *)[v10 nextObject];
          if (!v11) {
            break;
          }
          if (objc_msgSend((id)objc_msgSend(v11, "valueForKey:", @"isActive"), "BOOLValue")) {
            goto LABEL_11;
          }
        }
        [v8 addIndex:i];
LABEL_11:
        ;
      }
    }
    [v5 removeObjectsAtIndexes:v8];
    uint64_t v12 = [v5 count];
    uint64_t v13 = v12 - 1;
    if (v12 <= 1) {
      goto LABEL_21;
    }
    uint64_t v14 = 0;
    uint64_t v15 = v12 - 2;
    char v16 = 1;
    do
    {
      while (1)
      {
        uint64_t v17 = v14 + 1;
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v14), "valueForKey:", @"facetName"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v14 + 1), "valueForKey:", @"facetName")) & 1) == 0)break; {
        -[TDDistiller _logErrorAndAccumulateDescription:](self, "_logErrorAndAccumulateDescription:", [NSString stringWithFormat:@"More than one definition of the facet name: %@", objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v14), "valueForKey:", @"facetName"]);
        }
        char v16 = 0;
        BOOL v6 = 0;
        if (v15 == v14++) {
          goto LABEL_22;
        }
      }
      ++v14;
    }
    while (v13 != v17);
    if (v16)
    {
LABEL_21:
      BOOL v6 = [(TDDistiller *)self _distillCursorFacetDefinitions:v5];
      goto LABEL_22;
    }
  }
  BOOL v6 = 0;
LABEL_22:

  return v6;
}

- (void)finishDistillationWithSuccess:(BOOL)a3
{
  [(TDDistiller *)self setSuccessful:a3];

  [(TDDistiller *)self performSelectorOnCallbackThread:sel_markDistillationAsFinished withObject:0 waitUntilDone:0];
}

- (void)markDistillationAsFinished
{
  [(TDDistiller *)self setFinished:1];
  uint64_t v3 = [(TDDistiller *)self completionHandler];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([(NSString *)[(TDDistiller *)self accumulatedErrorDescription] length])
    {
      id v5 = (void *)MEMORY[0x263F087E8];
      BOOL v6 = CoreThemeDefinitionErrorDomain[0];
      uint64_t v7 = NSDictionary;
      uint64_t v8 = [(TDDistiller *)self accumulatedErrorDescription];
      uint64_t v9 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 0, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x263F08320], 0));
    }
    else
    {
      uint64_t v9 = 0;
    }
    v4[2](v4, [(TDDistiller *)self isSuccessful], v9);
    [(TDDistiller *)self setCompletionHandler:0];
  }

  [(TDDistiller *)self setAccumulatedErrorDescription:0];
}

- (void)_resetDocumentUuid:(id)a3
{
  [(TDDistiller *)self _logExtra:@"Setting document uuid."];
  [(CoreThemeDocument *)self->_document setUuid:a3];
  if ([(TDPersistentDocument *)self->_document fileURL])
  {
    document = self->_document;
    [(TDPersistentDocument *)document saveDocument:self];
  }
}

- (id)dateOfLastDistill
{
  if (!self->_assetStore || ![(TDDistiller *)self isIncremental]) {
    return 0;
  }
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  double v4 = (double)[(CUIMutableCommonAssetStorage *)self->_assetStore storageTimestamp];

  return (id)[v3 dateWithTimeIntervalSince1970:v4];
}

- (void)_distillChanges:(id)a3
{
  [(TDDistiller *)self _logExtra:@"CAR exists. Beginning incremental distill"];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v5 = (void *)[MEMORY[0x263F08B88] currentThread];
    BOOL v6 = NSString;
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    [v5 setName:objc_msgSend(v6, "stringWithFormat:", @"%@.%@", v8, NSStringFromSelector(a2))];
  }
  uint64_t v9 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__TDDistiller__distillChanges___block_invoke;
  v10[3] = &unk_264C44FA0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a2;
  [v9 performBlockAndWait:v10];

  self->_assetStore = 0;
  [(TDDistiller *)self finishDistillationWithSuccess:*((unsigned __int8 *)v12 + 24)];
  _Block_object_dispose(&v11, 8);
}

uint64_t __31__TDDistiller__distillChanges___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v67 = *MEMORY[0x263EF8340];
  char v64 = 0;
  id v63 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) dateOfLastDistill];
  uint64_t v3 = (void *)[*(id *)(*(void *)(v1 + 32) + 8) historian];
  double v4 = (void *)[v3 colorsChangedSinceDate:v2];
  uint64_t v5 = [v4 count];
  uint64_t result = [*(id *)(v1 + 32) _distillColorDefinitions:v4];
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  if (!result) {
    return result;
  }
  uint64_t v7 = (void *)[v3 fontsChangedSinceDate:v2];
  uint64_t v8 = v7;
  BOOL v9 = v5 || [v7 count] != 0;
  uint64_t result = [*(id *)(v1 + 32) _distillFonts:v8];
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  if (!result) {
    return result;
  }
  uint64_t result = [*(id *)(v1 + 32) distillCustomFontSizes];
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  if (!result) {
    return result;
  }
  double v10 = (void *)[v3 namedElementsChangedSinceDate:v2];
  uint64_t v11 = v10;
  BOOL v12 = v9 || [v10 count] != 0;
  uint64_t result = [*(id *)(v1 + 32) _distillNamedElements:v11];
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  if (!result) {
    return result;
  }
  uint64_t v13 = (void *)[v3 facetDefinitionsChangedSinceDate:v2];
  char v14 = v13;
  BOOL v15 = v12 || [v13 count] != 0;
  uint64_t result = [*(id *)(v1 + 32) _distillCursorFacetDefinitions:v14];
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  if (!result) {
    return result;
  }
  uint64_t v16 = objc_msgSend(*(id *)(v1 + 32), "_removeRenditionsWithKeySpecs:", objc_msgSend(*(id *)(v1 + 32), "_keySpecsToRemoveFromKeySpecs:", objc_msgSend(v3, "keySpecsForRenditionsRemovedSinceDate:", v2)));
  if (v16) {
    char v17 = 1;
  }
  else {
    char v17 = v15;
  }
  char v64 = v17;
  *(void *)(*(void *)(v1 + 32) + 32) = [v3 productionsChangedSinceDate:v2 uuidNeedsReset:&v64];
  uint64_t v18 = [*(id *)(*(void *)(v1 + 32) + 32) count];
  if (v18) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v64 == 0;
  }
  char v20 = !v19;
  char v64 = v20;
  if (v18)
  {
    long long v21 = @"s";
    if (v18 == 1) {
      long long v21 = &stru_26E8675B0;
    }
    [*(id *)(v1 + 32) _logExtra:objc_msgSend(NSString, "stringWithFormat:", @"Found %lu changed production%@.", v18, v21)];
  }
  uint64_t v22 = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 32), "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"isActive = NO"));
  if ([v22 count])
  {
    [*(id *)(v1 + 32) _logWarning:objc_msgSend(NSString, "stringWithFormat:", @"Removing renditions for %lu inactive productions", objc_msgSend(v22, "count"))];
    uint64_t v23 = (void *)[*(id *)(v1 + 32) _renditionsFromProductions:v22 error:&v63];
    uint64_t v24 = *(void **)(v1 + 32);
    if (v63)
    {
      uint64_t v25 = [v63 localizedDescription];
      v26 = v24;
LABEL_35:
      uint64_t result = [v26 _logErrorAndAccumulateDescription:v25];
      *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 0;
      return result;
    }
    v16 += objc_msgSend(v24, "_removeRenditionsWithKeySpecs:", objc_msgSend(v24, "_keySpecsToRemoveFromKeySpecs:", objc_msgSend(v23, "valueForKey:", @"keySpec")));
  }
  uint64_t v27 = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 32), "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"isActive = YES"));
  if (![v27 count]) {
    goto LABEL_52;
  }
  [*(id *)(v1 + 32) _logInfo:objc_msgSend(NSString, "stringWithFormat:", @"Active changed productions: %lu", objc_msgSend(v27, "count"))];
  v28 = (void *)[*(id *)(v1 + 32) _renditionsFromProductions:v27 error:&v63];
  if (v63)
  {
    v29 = *(void **)(v1 + 32);
    uint64_t v25 = [v63 localizedDescription];
    v26 = v29;
    goto LABEL_35;
  }
  unint64_t v30 = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 8), "countOfRenditionsMatchingRenditionKeySpecs:", objc_msgSend(v28, "valueForKey:", @"keySpec"));
  unint64_t v31 = [v28 count];
  if (v30 < v31) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(v1 + 48), *(void *)(v1 + 32), @"TDDistiller.m", 1113, @"-[TDDistiller _distillChanges] rendition counting mismatch.");
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = v30 == v31;
  obuint64_t j = v28;
  if (v30 != v31)
  {
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    long long v59 = 0uLL;
    long long v60 = 0uLL;
    uint64_t result = [v28 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (result)
    {
      uint64_t v40 = result;
      uint64_t v41 = *(void *)v60;
      uint64_t v51 = *(void *)v60;
      uint64_t v52 = v1;
      do
      {
        uint64_t v42 = 0;
        uint64_t v53 = v40;
        do
        {
          if (*(void *)v60 != v41) {
            objc_enumerationMutation(v28);
          }
          v43 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * v42) keySpec];
          if ((unint64_t)[*(id *)(*(void *)(v1 + 32) + 8) countOfRenditionsMatchingRenditionKeySpec:v43] >= 2)
          {
            v44 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:250];
            v45 = (void *)[*(id *)(*(void *)(v1 + 32) + 8) renditionsMatchingRenditionKeySpec:v43];
            uint64_t v46 = [v45 count];
            if (v46)
            {
              for (uint64_t i = 0;
                    i != v46;
                    [v44 appendString:objc_msgSend(v49, "stringWithFormat:", @"\n\t%lu. %@ Rendition: %@", i, NSStringFromClass(v50), v48)])
              {
                v48 = (void *)[v45 objectAtIndex:i];
                [v48 production];
                v49 = NSString;
                ++i;
                v50 = (objc_class *)objc_opt_class();
              }
            }
            uint64_t v1 = v52;
            [*(id *)(v52 + 32) _logErrorAndAccumulateDescription:objc_msgSend(NSString, "stringWithFormat:", @"ERROR: Identical keys for %lu renditions.\n\t%@%@", v46, objc_msgSend(v43, "keyDescription"), v44)];
            uint64_t v40 = v53;
            v28 = obj;
            uint64_t v41 = v51;
          }
          ++v42;
        }
        while (v42 != v40);
        uint64_t result = [v28 countByEnumeratingWithState:&v59 objects:v66 count:16];
        uint64_t v40 = result;
      }
      while (result);
    }
    return result;
  }
  long long v57 = 0uLL;
  long long v58 = 0uLL;
  long long v55 = 0uLL;
  long long v56 = 0uLL;
  uint64_t v32 = [v28 countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = 0;
    uint64_t v35 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v56 != v35) {
          objc_enumerationMutation(v28);
        }
        v37 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(*(void *)(v1 + 32) + 16), "assetExistsForKey:", objc_msgSend(*(id *)(v1 + 32), "_keyDataFromKey:", objc_msgSend((id)objc_msgSend(v37, "keySpec"), "key"))) & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = objc_msgSend(*(id *)(v1 + 32), "setAsset:withKey:fromRenditionSpec:", objc_msgSend(v37, "createCSIRepresentationWithCompression:colorSpaceID:document:", 1, objc_msgSend(*(id *)(*(void *)(v1 + 32) + 8), "colorSpaceID"), *(void *)(*(void *)(v1 + 32) + 8)), objc_msgSend((id)objc_msgSend(v37, "keySpec"), "key"), v37);
          if (!*(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24)) {
            goto LABEL_53;
          }
          ++v34;
        }
      }
      uint64_t v33 = [v28 countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v33);
  }
  else
  {
LABEL_52:
    uint64_t v34 = 0;
  }
LABEL_53:
  if (v16) {
    [*(id *)(v1 + 32) _logInfo:objc_msgSend(NSString, "stringWithFormat:", @"%lu renditions removed from the CAR", v16)];
  }
  if (v34) {
    [*(id *)(v1 + 32) _logInfo:objc_msgSend(NSString, "stringWithFormat:", @"%lu renditions added to the CAR", v34)];
  }
  objc_msgSend(*(id *)(v1 + 32), "setAssetStoreRenditionCount:", v34 - v16 + objc_msgSend(*(id *)(*(void *)(v1 + 32) + 16), "renditionCount"));
  if (v64)
  {
    id v38 = objc_alloc_init(MEMORY[0x263F08C38]);
    [*(id *)(v1 + 32) setAssetStoreUuid:v38];
    objc_msgSend(*(id *)(v1 + 32), "setAssetStoreAssociatedChecksum:", objc_msgSend(*(id *)(*(void *)(v1 + 32) + 8), "checksum"));
    id v39 = v38;
  }
  else
  {
    id v38 = 0;
  }
  uint64_t result = [*(id *)(v1 + 32) assetStoreWriteToDisk];
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  if ((result & 1) == 0) {
    return [*(id *)(v1 + 32) _logErrorAndAccumulateDescription:@"Failed to write to CAR"];
  }
  if (v64) {
    return [*(id *)(v1 + 32) performSelectorOnCallbackThread:sel__resetDocumentUuid_ withObject:v38 waitUntilDone:1];
  }
  return result;
}

- (void)removeRenditionsFromAssetStoreWithKey:(id)a3
{
}

- (void)setAssetStoreRenditionCount:(unsigned int)a3
{
}

- (void)setAssetStoreUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)[(CUIMutableCommonAssetStorage *)self->_assetStore uuid];
}

- (void)setAssetStoreAssociatedChecksum:(unsigned int)a3
{
}

- (void)setAssetStoreKeyFormatData:(id)a3
{
}

- (void)setAssetStoreKeySemantics:(int)a3
{
}

- (void)setAssetStorageVersion:(unsigned int)a3
{
}

- (void)setAssetStorageVersionString:(const char *)a3
{
}

- (void)setAssetSchemaVersion:(unsigned int)a3
{
}

- (void)setAssetColorSpaceID:(unsigned int)a3
{
}

- (void)setDeploymentPlatform:(id)a3
{
}

- (void)setDeploymentPlatformVersion:(id)a3
{
}

- (void)setAuthoringTool:(id)a3
{
}

- (BOOL)assetStoreWriteToDisk
{
  unint64_t v3 = [(CoreThemeDocument *)self->_document targetPlatform];
  int v4 = [(CoreThemeDocument *)self->_document majorVersion];
  int v5 = [(CoreThemeDocument *)self->_document minorVersion];
  int v6 = [(CoreThemeDocument *)self->_document patchVersion];
  if (v3 != 4)
  {
    if (v3)
    {
      if (v3 <= 3 && (v4 < 9 || v4 == 9 && v5 <= 2)) {
LABEL_18:
      }
        [(CUIMutableCommonAssetStorage *)self->_assetStore setEnableLargeCarKeyWorkaround:1];
    }
    else
    {
      BOOL v7 = v5 < 12 && v4 < 11;
      if (v6 >= 5) {
        BOOL v7 = 0;
      }
      BOOL v8 = v5 < 11 && v4 < 11;
      if (v7 || v8) {
        goto LABEL_18;
      }
    }
  }
  BOOL v9 = [(CUIMutableCommonAssetStorage *)self->_assetStore writeToDiskAndCompact:1];
  if (v9) {
    LOBYTE(v9) = [(CUIMutableCommonAssetStorage *)self->_assetStore validateFile] == 0;
  }
  return v9;
}

- (void)_distill:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  int v5 = (void *)MEMORY[0x237DD6000](self, a2, a3);
  int v6 = (void *)MEMORY[0x237DD6000]();
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v7 = (void *)[MEMORY[0x263F08B88] currentThread];
    BOOL v8 = NSString;
    BOOL v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    [v7 setName:objc_msgSend(v8, "stringWithFormat:", @"%@.%@", v10, NSStringFromSelector(a2))];
  }
  [(TDDistiller *)self _logExtra:@"Beginning clean distill."];
  assetStore = self->_assetStore;
  if (!assetStore)
  {
    [(TDDistiller *)self _logErrorAndAccumulateDescription:@"ERROR: Each TDDistiller instance can be distilled only one time!"];
    *((unsigned char *)v16 + 24) = 0;
  }
  if (assetStore)
  {
    [(TDDistiller *)self setDeploymentPlatformVersion:[(CoreThemeDocument *)self->_document minimumDeploymentVersion]];
    [(CoreThemeDocument *)self->_document targetPlatform];
    [(TDDistiller *)self setDeploymentPlatform:CUIPlatformNameForPlatform()];
    stpncpy(__dst, "@(#)PROGRAM:CoreThemeDefinition  PROJECT:CoreThemeDefinition-610\n", 0x100uLL);
    size_t v12 = strnlen(__dst, 0x100uLL) - 1;
    if (__dst[v12] == 10) {
      __dst[v12] = 32;
    }
    -[TDDistiller setAuthoringTool:](self, "setAuthoringTool:", objc_msgSend(NSString, "stringWithFormat:", @"%s [IIO-%s]", __dst, CGGetImageIOVersion()));
    uint64_t v13 = objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC");
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __24__TDDistiller__distill___block_invoke;
    v14[3] = &unk_264C44FA0;
    v14[4] = self;
    v14[5] = &v15;
    v14[6] = a2;
    [v13 performBlockAndWait:v14];
  }
  if ([(TDDistiller *)self isCancelled])
  {
    *((unsigned char *)v16 + 24) = 0;
    [(TDDistiller *)self _logErrorAndAccumulateDescription:@"Distill aborted. No data written to CAR"];
  }

  self->_assetStore = 0;
  self->_renditionEntries = 0;
  [(TDDistiller *)self finishDistillationWithSuccess:*((unsigned __int8 *)v16 + 24)];
  _Block_object_dispose(&v15, 8);
}

uint64_t __24__TDDistiller__distill___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) distillCatalogGlobals];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) distillThemeAppearances];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) distillLocalizationss];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) distillCustomColors];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) distillCustomFonts];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) distillCustomFontSizes];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) distillNamedElements];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  char v3 = [*(id *)(a1 + 32) distillCursorFacetDefinitions];
  int v4 = *(id **)(a1 + 32);
  if ((v3 & 1) == 0)
  {
    uint64_t v20 = @"distilling Cursor Facet Definitions failed";
LABEL_32:
    uint64_t result = [v4 _logErrorAndAccumulateDescription:v20];
LABEL_33:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    return result;
  }
  objc_msgSend(v4, "setAssetStoreKeyFormatData:", objc_msgSend(*(id *)(a1 + 32), "keyFormatData"));
  objc_msgSend(*(id *)(a1 + 32), "setAssetStoreKeySemantics:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "renditionKeySemantics"));
  uint64_t result = [*(id *)(a1 + 32) distillRenditions];
  if (!result) {
    goto LABEL_33;
  }
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    goto LABEL_33;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAssetStorageVersion:", objc_msgSend(*(id *)(a1 + 32), "assetStoreVersionNumber"));
  if ([*(id *)(*(void *)(a1 + 32) + 8) deviceTraitsUsedForOptimization])
  {
    id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = (id)[*(id *)(*(void *)(a1 + 32) + 8) deviceTraitsUsedForOptimization];
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(obj);
          }
          size_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_msgSend(v35, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "idiomValue")));
          objc_msgSend(v34, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "subtype")));
          uint64_t v13 = NSNumber;
          [v12 scale];
          objc_msgSend(v31, "addObject:", objc_msgSend(v13, "numberWithInteger:", llround(v14)));
          objc_msgSend(v33, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "graphicsFeatureSetClassValue")));
          objc_msgSend(v32, "addObject:", objc_msgSend(v12, "graphicsFeatureSetFallbackValues"));
          objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "memoryPerformanceClass")));
          objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "displayGamutValue")));
          objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "deploymentTargetValue")));
          if (objc_msgSend((id)objc_msgSend(v12, "hostedIdiomValues"), "count")) {
            objc_msgSend(v30, "addObject:", objc_msgSend(v12, "hostedIdiomValues"));
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v9);
    }
    id obja = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v27 = NSString;
    v26 = __arrayToString(v35);
    uint64_t v25 = __arrayToString(v34);
    uint64_t v24 = __arrayToString(v31);
    uint64_t v23 = __arrayToString(v6);
    uint64_t v22 = __arrayToString(v33);
    uint64_t v15 = __arrayToString(v32);
    uint64_t v16 = __arrayToString(v5);
    uint64_t v17 = __arrayToString(v7);
    [obja setThinningArguments:objc_msgSend(v27, "stringWithFormat:", @"optimized <idiom %@> <subtype %@> <scale %@> <gamut %@> <graphics %@> <graphicsfallback %@> <memory %@> <deployment %@> <hostedIdioms %@>", v26, v25, v24, v23, v22, v15, v16, v17, __arrayToString(v30))];
  }
  snprintf(__str, 0x100uLL, "%s", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetStoreVersionString"), "UTF8String"));
  [*(id *)(a1 + 32) setAssetStorageVersionString:__str];
  char v18 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) metadatumForKey:@"CoreThemeSchemaVersion"];
  if (v18) {
    uint64_t v19 = [v18 unsignedIntValue];
  }
  else {
    uint64_t v19 = 1;
  }
  [*(id *)(a1 + 32) setAssetSchemaVersion:v19];
  uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 8) uuid];
  if (!v21)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 32), @"TDDistiller.m", 1497, @"No document uuid!");
    int v4 = *(id **)(a1 + 32);
    uint64_t v20 = (__CFString *)[NSString stringWithFormat:@"-[TDDistiller _distill:] is surprised that %@ doesn't have a uuid!", objc_msgSend(v4[1], "displayName")];
    goto LABEL_32;
  }
  [*(id *)(a1 + 32) setAssetStoreUuid:v21];
  objc_msgSend(*(id *)(a1 + 32), "setAssetStoreAssociatedChecksum:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "checksum"));
  objc_msgSend(*(id *)(a1 + 32), "setAssetColorSpaceID:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "colorSpaceID"));
  if ([*(id *)(a1 + 32) isCancelled]) {
    return [*(id *)(a1 + 32) _logErrorAndAccumulateDescription:@"Failed to write to CAR"];
  }
  uint64_t result = [*(id *)(a1 + 32) assetStoreWriteToDisk];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) _logErrorAndAccumulateDescription:@"Failed to write to CAR"];
  }
  return result;
}

- (void)saveAndDistillWithCompletionHandler:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(CoreThemeDocument *)self->_document _processModelProductions];
  if (![(TDDistiller *)self dontPackRenditionsBeforeDistilling])
  {
    if ([(TDDistiller *)self isIncremental]) {
      [(CoreThemeDocument *)self->_document incrementallyPackRenditionsSinceDate:[(TDDistiller *)self dateOfLastDistill] error:&v6];
    }
    else {
      [(CoreThemeDocument *)self->_document packRenditionsError:&v6];
    }
    if (v6) {
      goto LABEL_7;
    }
  }
  objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self->_document, "mocOrganizer"), "threadMOC"), "save:", &v7);
  if (v7)
  {
LABEL_7:
    if (a3)
    {
      (*((void (**)(id, void))a3 + 2))(a3, 0);
      [(TDDistiller *)self setFinished:1];
      [(TDDistiller *)self setSuccessful:0];
    }
  }
  else
  {
    [(TDDistiller *)self setCompletionHandler:a3];
    if ([(TDDistiller *)self isIncremental]) {
      id v5 = sel__distillChanges_;
    }
    else {
      id v5 = sel__distill_;
    }
    [MEMORY[0x263F08B88] detachNewThreadSelector:v5 toTarget:self withObject:0];
  }
}

- (void)waitUntilFinished
{
  uint64_t v3 = [MEMORY[0x263EFF910] distantFuture];
  int v4 = (void *)[objc_alloc(MEMORY[0x263EFFA20]) initWithFireDate:v3 interval:self target:sel_waitTimerDidFire_ selector:0 userInfo:0 repeats:0.0];
  id v5 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
  [v5 addTimer:v4 forMode:@"DistillWaitRunLoopMode"];
  -[TDDistiller setCallbackThread:](self, "setCallbackThread:", [MEMORY[0x263F08B88] currentThread]);
  if (![(TDDistiller *)self isFinished])
  {
    do
      [v5 runMode:@"DistillWaitRunLoopMode" beforeDate:v3];
    while (![(TDDistiller *)self isFinished]);
  }
  [v4 invalidate];

  uint64_t v6 = [(TDDistiller *)self logger];

  [(TDLogger *)v6 waitForLoggingToComplete];
}

- (void)cancelDistill
{
  if ([(TDDistiller *)self isIncremental]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDDistiller.m", 1601, @"Cancelling incremental distill is not implemented.");
  }
  [(TDDistiller *)self _logErrorAndAccumulateDescription:@"Canceling. Cleaning up."];

  [(TDDistiller *)self setCancelled:1];
}

- (void)performSelectorOnCallbackThread:(SEL)a3 withObject:(id)a4 waitUntilDone:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = [(TDDistiller *)self callbackThread];
  if (!v9) {
    uint64_t v9 = (NSThread *)[MEMORY[0x263F08B88] mainThread];
  }
  mainThreadPerformRunLoopModes = self->_mainThreadPerformRunLoopModes;

  [(TDDistiller *)self performSelector:a3 onThread:v9 withObject:a4 waitUntilDone:v5 modes:mainThreadPerformRunLoopModes];
}

- (BOOL)isIncremental
{
  return self->_incremental;
}

- (void)setIncremental:(BOOL)a3
{
  self->_incremental = a3;
}

- (NSString)assetStoreVersionString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssetStoreVersionString:(id)a3
{
}

- (int64_t)assetStoreVersionNumber
{
  return self->_assetStoreVersionNumber;
}

- (void)setAssetStoreVersionNumber:(int64_t)a3
{
  self->_assetStoreVersionNumber = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isSuccessful
{
  return self->_successful;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (TDLogger)logger
{
  return (TDLogger *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogger:(id)a3
{
}

- (BOOL)dontPackRenditionsBeforeDistilling
{
  return self->_dontPackRenditionsBeforeDistilling;
}

- (void)setDontPackRenditionsBeforeDistilling:(BOOL)a3
{
  self->_dontPackRenditionsBeforeDistilling = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSString)accumulatedErrorDescription
{
  return self->_accumulatedErrorDescription;
}

- (void)setAccumulatedErrorDescription:(id)a3
{
}

- (NSThread)callbackThread
{
  return (NSThread *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCallbackThread:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

@end