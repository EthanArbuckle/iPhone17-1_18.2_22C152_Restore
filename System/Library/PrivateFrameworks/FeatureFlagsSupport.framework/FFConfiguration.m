@interface FFConfiguration
+ (BOOL)isValidDisclosureName:(id)a3;
+ (BOOL)isValidName:(id)a3;
+ (FFConfiguration)shared;
+ (id)_configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5 parseErrorReporter:(id)a6 safeModeChecker:(id)a7;
+ (id)configurationForProfileManagement;
+ (id)configurationForTestingWithFileReader:(id)a3;
+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4;
+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5;
+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4;
+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4 safeModeChecker:(id)a5;
+ (id)configurationForTestingWithFileWriter:(id)a3;
- (BOOL)addProfilePayload:(id)a3 error:(id *)a4;
- (BOOL)commitProfilePayloadsAndReturnError:(id *)a3;
- (BOOL)commitUpdates:(id *)a3;
- (BOOL)isFeatureHidden:(id)a3 domain:(id)a4;
- (BOOL)isSafeMode;
- (BOOL)isValidDisclosureName:(id)a3;
- (BOOL)isValidName:(id)a3;
- (BOOL)phaseShouldBeEnabledByDefault:(id)a3;
- (BOOL)reset:(id *)a3;
- (BOOL)resetDomain:(id)a3 error:(id *)a4;
- (BOOL)resolvedStateForDisclosure:(id)a3;
- (BOOL)writeCombinedUpdates:(id *)a3;
- (BOOL)writeCombinedUpdatesAtLevelIndex:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeDisclosureUpdates:(id *)a3;
- (BOOL)writeDisclosureUpdatesAtlevelIndex:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeDomainUpdates:(id *)a3;
- (BOOL)writeFeatureSetUpdates:(id *)a3;
- (BOOL)writeFeatureSetUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4;
- (BOOL)writeSubscriptionUpdates:(id *)a3;
- (BOOL)writeSubscriptionUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4;
- (FFBuildVersionGetter)buildVersionGetter;
- (FFFileReader)filereader;
- (FFFileWriter)filewriter;
- (FFParseErrorReporter)parseerrorreporter;
- (FFPlistParser)plistparser;
- (FFSafeModeChecker)safemodechecker;
- (NSMutableArray)profilePayloads;
- (NSSet)domains;
- (id)allFeatureGroups;
- (id)allSubscriptionsAtLevel:(int64_t)a3;
- (id)attributesForFeatureGroup:(id)a3;
- (id)currentDisclosures;
- (id)currentDisclosuresAtLevel:(int64_t)a3;
- (id)currentDisclosuresAtLevelIndex:(unint64_t)a3;
- (id)defaultStateForFeature:(id)a3 domain:(id)a4;
- (id)definedFeatureGroupsFilteredByCurrentDisclosures;
- (id)definedFeatureSetsFilteredByCurrentDisclosures;
- (id)disclosureFileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4;
- (id)disclosureForFeature:(id)a3 domain:(id)a4;
- (id)disclosureForFeatureGroup:(id)a3;
- (id)effectiveStateForFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (id)featureFlagsInSet:(id)a3 inGroup:(id)a4;
- (id)featureSetsFileURLForLevelIndex:(unint64_t)a3;
- (id)featureSetsInGroup:(id)a3;
- (id)featuresForDomain:(id)a3;
- (id)featuresForDomainAlreadyLocked:(id)a3;
- (id)fileURLForDomain:(id)a3 pathIndex:(int)a4;
- (id)fileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4;
- (id)initPrivate;
- (id)initPrivateForBootTask;
- (id)internalDisclosureFileURLForLevelIndex:(unint64_t)a3;
- (id)makeFeatureDictionaryFrom:(id)a3 forDomain:(id)a4 atDomainLevel:(BOOL)a5 reportableFilename:(id)a6;
- (id)mutableDisclosureSetAtLevelIndex:(unint64_t)a3;
- (id)parseSubscriptionsDictionary:(id)a3;
- (id)resolvedStateForFeature:(id)a3 domain:(id)a4;
- (id)stateForFeature:(id)a3 domain:(id)a4;
- (id)stateForFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (id)subscriptionsFileURLForLevelIndex:(unint64_t)a3;
- (int64_t)_resolvedValueForFeatureSet:(id)a3;
- (int64_t)_valueForFeatureSet:(id)a3 atLevel:(int64_t)a4;
- (int64_t)resolvedValueForFeatureSet:(id)a3 inGroup:(id)a4;
- (int64_t)valueForFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5;
- (unsigned)sortValueForPhase:(id)a3;
- (void)_enableFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)_unsetFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)addDisclosure:(id)a3 atLevel:(int64_t)a4;
- (void)addDisclosureAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)addFeaturesForDomain:(id)a3 pathIndex:(int)a4 fromURL:(id)a5;
- (void)addSubscription:(id)a3 atLevel:(int64_t)a4;
- (void)addSubscriptionAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)clearCachedData;
- (void)createMutableDomainConfig:(id)a3 levelIndex:(unint64_t)a4;
- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6;
- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6;
- (void)disableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4;
- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6;
- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6;
- (void)enableFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5;
- (void)enableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4;
- (void)loadAllData;
- (void)loadAllLevelsForDomain:(id)a3;
- (void)loadCombinedDataForLevelIndex:(unint64_t)a3;
- (void)loadDomain:(id)a3 levelIndex:(unint64_t)a4;
- (void)loadFeatureSetDataForLevelIndex:(unint64_t)a3;
- (void)loadFeatureSetDefinitions;
- (void)loadFeatureSetDefinitionsNamed:(id)a3 fromURL:(id)a4;
- (void)loadSubscriptionDataForLevelIndex:(unint64_t)a3;
- (void)populateDictionary:(id)a3 withFeatures:(id)a4;
- (void)prepareToAddProfilePayloads;
- (void)recalculateFeatureSetEffectsAt:(unint64_t)a3;
- (void)recalculateSubscriptionEffectsAt:(unint64_t)a3;
- (void)removeAllDisclosuresAtLevelIndex:(unint64_t)a3;
- (void)removeAllFeatureSetDataAtLevelIndex:(unint64_t)a3;
- (void)removeAllSubscriptionsAtLevelIndex:(unint64_t)a3;
- (void)removeDisclosure:(id)a3 atLevel:(int64_t)a4;
- (void)removeDisclosure:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)removeSubscription:(id)a3 atLevel:(int64_t)a4;
- (void)reportParseError:(id)a3 severity:(id)a4 whileParsingKey:(id)a5 inContext:(id)a6 inFile:(id)a7;
- (void)setBuildVersionGetter:(id)a3;
- (void)setFeaturesMatchingAttribute:(id)a3 levelIndex:(unint64_t)a4 value:(int64_t)a5;
- (void)setFilereader:(id)a3;
- (void)setFilewriter:(id)a3;
- (void)setParseerrorreporter:(id)a3;
- (void)setPlistparser:(id)a3;
- (void)setProfilePayloads:(id)a3;
- (void)setSafemodechecker:(id)a3;
- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6;
- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6 buildVersion:(id)a7;
- (void)unsetFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (void)unsetFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (void)unsetFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5;
- (void)unsetFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4;
- (void)validateName:(id)a3;
@end

@implementation FFConfiguration

+ (FFConfiguration)shared
{
  if (ffConfigOnce != -1) {
    _os_once();
  }
  v2 = (void *)instance;
  return (FFConfiguration *)v2;
}

- (id)initPrivate
{
  v24.receiver = self;
  v24.super_class = (Class)FFConfiguration;
  v2 = [(FFConfiguration *)&v24 init];
  v3 = v2;
  if (v2)
  {
    v2->lock._os_unfair_lock_opaque = 0;
    [(FFConfiguration *)v2 clearCachedData];
    v4 = _os_feature_search_paths();
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (*v4)
    {
      v6 = v4 + 1;
      do
      {
        v7 = objc_msgSend(NSString, "stringWithUTF8String:");
        [(NSArray *)v5 addObject:v7];
      }
      while (*v6++);
    }
    searchPaths = v3->searchPaths;
    v3->searchPaths = v5;
    v10 = v5;

    v11 = objc_alloc_init(FFDefaultFileWriter);
    filewriter = v3->_filewriter;
    v3->_filewriter = (FFFileWriter *)v11;

    v13 = objc_alloc_init(FFDefaultFileReader);
    filereader = v3->_filereader;
    v3->_filereader = (FFFileReader *)v13;

    v15 = objc_alloc_init(FFDefaultParseErrorReporter);
    parseerrorreporter = v3->_parseerrorreporter;
    v3->_parseerrorreporter = (FFParseErrorReporter *)v15;

    v17 = objc_alloc_init(FFPlistParser);
    plistparser = v3->_plistparser;
    v3->_plistparser = v17;

    v19 = objc_alloc_init(FFDefaultSafeModeChecker);
    safemodechecker = v3->_safemodechecker;
    v3->_safemodechecker = (FFSafeModeChecker *)v19;

    v21 = objc_alloc_init(FFDefaultBuildVersionGetter);
    buildVersionGetter = v3->_buildVersionGetter;
    v3->_buildVersionGetter = (FFBuildVersionGetter *)v21;
  }
  return v3;
}

- (id)initPrivateForBootTask
{
  id v2 = [(FFConfiguration *)self initPrivate];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 safemodechecker];
    int v5 = [v4 isItSafeMode];

    if (v5)
    {
      v6 = objc_alloc_init(FFImmutableOnlyFileReader);
      v7 = [v3 filereader];
      [(FFImmutableOnlyFileReader *)v6 setUnderlying:v7];

      [v3 setFilereader:v6];
    }
  }
  return v3;
}

+ (id)_configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5 parseErrorReporter:(id)a6 safeModeChecker:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [[FFConfiguration alloc] initPrivate];
  v17 = v16;
  if (v16)
  {
    if (v11) {
      [v16 setFilereader:v11];
    }
    if (v12) {
      [v17 setFilewriter:v12];
    }
    if (v13) {
      [v17 setBuildVersionGetter:v13];
    }
    if (v14) {
      [v17 setParseerrorreporter:v14];
    }
    if (v15) {
      [v17 setSafemodechecker:v15];
    }
  }

  return v17;
}

+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4 safeModeChecker:(id)a5
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:0 buildVersionGetter:0 parseErrorReporter:a4 safeModeChecker:a5];
}

+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:0 buildVersionGetter:0 parseErrorReporter:a4 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:a4 buildVersionGetter:0 parseErrorReporter:0 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:a4 buildVersionGetter:a5 parseErrorReporter:0 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileReader:(id)a3
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:0 buildVersionGetter:0 parseErrorReporter:0 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileWriter:(id)a3
{
  return (id)[a1 _configurationForTestingWithFileReader:0 fileWriter:a3 buildVersionGetter:0 parseErrorReporter:0 safeModeChecker:0];
}

- (void)clearCachedData
{
  uint64_t v3 = 0;
  configByLevelIndex = self->configByLevelIndex;
  char v5 = 1;
  do
  {
    uint64_t v6 = 0;
    char v7 = v5;
    v8 = configByLevelIndex[v3];
    do
    {
      v9 = v8[v6];
      v8[v6] = 0;

      ++v6;
    }
    while (v6 != 8);
    char v5 = 0;
    uint64_t v3 = 1;
  }
  while ((v7 & 1) != 0);
  uint64_t v10 = 0;
  metaByLevelIndex = self->metaByLevelIndex;
  do
  {
    id v12 = metaByLevelIndex[v10];
    metaByLevelIndex[v10] = 0;

    ++v10;
  }
  while (v10 != 8);
  [(NSMutableSet *)self->_domains removeAllObjects];
  uint64_t v13 = 0;
  disclosuresByLevelIndex = self->disclosuresByLevelIndex;
  do
  {
    id v15 = disclosuresByLevelIndex[v13];
    disclosuresByLevelIndex[v13] = 0;

    ++v13;
  }
  while (v13 != 8);
}

- (void)validateName:(id)a3
{
  id v4 = a3;
  if (!-[FFConfiguration isValidName:](self, "isValidName:")) {
    [MEMORY[0x1E4F1CA00] raise:@"FFInvalidName", @"Invalid domain or feature name: %@", v4 format];
  }
}

- (id)fileURLForDomain:(id)a3 pathIndex:(int)a4
{
  searchPaths = self->searchPaths;
  uint64_t v5 = a4;
  id v6 = a3;
  char v7 = [(NSArray *)searchPaths objectAtIndexedSubscript:v5];
  v8 = [v6 stringByAppendingString:@".plist"];

  v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];
  uint64_t v10 = [v9 URLByAppendingPathComponent:@"/Domain/" isDirectory:1];
  id v11 = [v10 URLByAppendingPathComponent:v8 isDirectory:0];

  return v11;
}

- (id)fileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4
{
  uint64_t v5 = [(NSArray *)self->searchPaths objectAtIndexedSubscript:a4];
  if (a3 > 7 || ((1 << a3) & 0x92) == 0) {
    -[FFConfiguration fileURLForLevelIndex:pathIndex:](a3);
  }
  id v6 = (void *)v5;
  if ((0x6DuLL >> a3))
  {
    v9 = 0;
  }
  else
  {
    uint64_t v7 = fileNamesByLevelIndex[a3];
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];
  }
  return v9;
}

- (id)disclosureFileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4
{
  uint64_t v5 = [(NSArray *)self->searchPaths objectAtIndexedSubscript:a4];
  if (a3 > 7 || ((1 << a3) & 0x92) == 0) {
    -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:](a3);
  }
  id v6 = (void *)v5;
  if ((0x6DuLL >> a3))
  {
    v9 = 0;
  }
  else
  {
    uint64_t v7 = disclosureFileNamesByLevelIndex[a3];
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];
  }
  return v9;
}

- (id)internalDisclosureFileURLForLevelIndex:(unint64_t)a3
{
  id v4 = (void *)[[NSString alloc] initWithUTF8String:_os_feature_internal_search_path()];
  uint64_t v5 = 0;
  if (a3 != 7 && a3 != 4)
  {
    if (a3 != 1) {
      -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:](a3);
    }
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1];
    uint64_t v5 = [v6 URLByAppendingPathComponent:0x1F38A7E08 isDirectory:0];
  }
  return v5;
}

- (id)featureSetsFileURLForLevelIndex:(unint64_t)a3
{
  id v4 = [(NSArray *)self->searchPaths objectAtIndexedSubscript:1];
  if (a3 != 5 && a3 != 2) {
    -[FFConfiguration featureSetsFileURLForLevelIndex:](a3);
  }
  uint64_t v5 = featureSetsFileNamesByLevelIndex[a3];
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1];
  uint64_t v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:0];

  return v7;
}

- (id)subscriptionsFileURLForLevelIndex:(unint64_t)a3
{
  id v4 = [(NSArray *)self->searchPaths objectAtIndexedSubscript:1];
  if (a3 != 6 && a3 != 3) {
    -[FFConfiguration subscriptionsFileURLForLevelIndex:](a3);
  }
  uint64_t v5 = subscriptionsFileNamesByLevelIndex[a3];
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1];
  uint64_t v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:0];

  return v7;
}

- (id)makeFeatureDictionaryFrom:(id)a3 forDomain:(id)a4 atDomainLevel:(BOOL)a5 reportableFilename:(id)a6
{
  BOOL v46 = a5;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v43 = a4;
  id v39 = a6;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0x1E4F1C000uLL;
    uint64_t v14 = *(void *)v61;
    id v15 = @"DevelopmentPhase";
    uint64_t v40 = *(void *)v61;
    v41 = self;
    id v45 = v10;
    do
    {
      uint64_t v16 = 0;
      uint64_t v44 = v12;
      do
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v60 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1E01B6120]();
        if ([(FFConfiguration *)self isValidName:v17])
        {
          uint64_t v54 = v17;
          v19 = [v10 objectForKeyedSubscript:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v55 = [v19 objectForKeyedSubscript:@"Enabled"];
            if (v46)
            {
              uint64_t v20 = v13;
              uint64_t v21 = [v19 objectForKeyedSubscript:v15];
              v22 = v15;
              v23 = (void *)v21;
              if (v21) {
                BOOL v24 = v55 == 0;
              }
              else {
                BOOL v24 = 1;
              }
              if (!v24)
              {
                v37 = v22;
                -[FFConfiguration reportParseError:severity:whileParsingKey:inContext:inFile:](self, "reportParseError:severity:whileParsingKey:inContext:inFile:", @"A flag cannot have both Enabled and DevelopmentPhase keys", FFParseErrorContextSeverityError);
                goto LABEL_28;
              }
              v37 = v22;
              v53 = (void *)v21;
            }
            else
            {
              uint64_t v20 = v13;
              v37 = v15;
              v53 = 0;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v51 = v18;
              uint64_t v52 = v16;
              BOOL v47 = [v55 intValue] != 0;
              goto LABEL_20;
            }
            objc_opt_class();
            v23 = v53;
            if (objc_opt_isKindOfClass())
            {
              v51 = v18;
              uint64_t v52 = v16;
              BOOL v47 = [(FFConfiguration *)self phaseShouldBeEnabledByDefault:v53];
LABEL_20:
              v49 = [v19 objectForKeyedSubscript:@"DisclosureRequired"];
              v25 = [v19 objectForKeyedSubscript:@"Attributes"];
              v50 = v19;
              v48 = [v19 objectForKeyedSubscript:@"BuildVersion"];
              v26 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              id v27 = v25;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v57;
                do
                {
                  for (uint64_t i = 0; i != v29; ++i)
                  {
                    if (*(void *)v57 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    uint64_t v32 = *(void *)(*((void *)&v56 + 1) + 8 * i);
                    v33 = (void *)MEMORY[0x1E01B6120]();
                    v34 = [v27 objectForKeyedSubscript:v32];
                    v35 = [[FFFeatureAttribute alloc] initWithName:v32 value:v34];
                    [v26 setObject:v35 forKeyedSubscript:v32];
                  }
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
                }
                while (v29);
              }

              v36 = [[FFFeatureState alloc] initWithDomain:v43 feature:v54 value:v47 phase:v53 disclosureRequired:v49 attributes:v26 buildVersion:v48];
              [v42 setObject:v36 forKeyedSubscript:v54];

              uint64_t v14 = v40;
              self = v41;
              uint64_t v20 = 0x1E4F1C000;
              uint64_t v12 = v44;
              v37 = @"DevelopmentPhase";
              v23 = v53;
              v18 = v51;
              uint64_t v16 = v52;
              v19 = v50;
            }
LABEL_28:

            id v15 = v37;
            unint64_t v13 = v20;
            id v10 = v45;
          }
        }
        ++v16;
      }
      while (v16 != v12);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v12);
  }

  return v42;
}

- (void)recalculateFeatureSetEffectsAt:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 2 && a3 != 5) {
    -[FFConfiguration recalculateFeatureSetEffectsAt:](a3);
  }
  uint64_t v5 = &self->super.isa + a3;
  Class v6 = v5[12];
  v5[12] = 0;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5[44];
  uint64_t v20 = [(objc_class *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        v8 = [(NSMutableDictionary *)self->definedFeatureSets objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        id v9 = v8;
        if (v8)
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v10 = [v8 features];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v21 + 1) + 8 * j);
                uint64_t v16 = [v15 featureName];
                uint64_t v17 = [v15 domainName];
                [(FFConfiguration *)self setValue:1 feature:v16 domain:v17 levelIndex:a3];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v20 = [(objc_class *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
}

- (void)recalculateSubscriptionEffectsAt:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 3 && a3 != 6) {
    -[FFConfiguration recalculateFeatureSetEffectsAt:](a3);
  }
  uint64_t v5 = &self->super.isa + a3;
  Class v6 = v5[12];
  v5[12] = 0;

  uint64_t v7 = (void *)[(NSMutableSet *)self->_domains copy];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v7;
  uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v8;
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * v8);
        id v10 = [(FFConfiguration *)self featuresForDomainAlreadyLocked:v9];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v24 = v10;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v25 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v31 != v25) {
                objc_enumerationMutation(v24);
              }
              uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              id v15 = self->subscriptionsByLevelIndex[a3];
              uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v27;
                do
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v27 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    if ([*(id *)(*((void *)&v26 + 1) + 8 * j) matchesFeature:v14 inDomain:v9 inAlreadyLockedConfiguration:self])-[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", 1, v14, v9, a3); {
                  }
                    }
                  uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
                }
                while (v17);
              }
            }
            uint64_t v12 = [v24 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v22);
  }
}

- (void)reportParseError:(id)a3 severity:(id)a4 whileParsingKey:(id)a5 inContext:(id)a6 inFile:(id)a7
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v20[0] = FFParseErrorMessageKey;
  v20[1] = FFParseErrorContextKeyKey;
  v21[0] = a3;
  v21[1] = a5;
  v20[2] = FFParseErrorContextOtherKey;
  v20[3] = FFParseErrorContextFilenameKey;
  v21[2] = a6;
  v21[3] = a7;
  v20[4] = FFParseErrorContextSeverityKey;
  v21[4] = a4;
  uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [v12 dictionaryWithObjects:v21 forKeys:v20 count:5];

  uint64_t v19 = [(FFConfiguration *)self parseerrorreporter];
  [v19 reportError:v18];
}

- (void)loadFeatureSetDataForLevelIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  id v4 = self;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (a3 != 2 && a3 != 5) {
    abort();
  }
  enabledFeatureSetsByLevelIndex = self->enabledFeatureSetsByLevelIndex;
  if (!self->enabledFeatureSetsByLevelIndex[a3])
  {
    Class v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = enabledFeatureSetsByLevelIndex[v3];
    enabledFeatureSetsByLevelIndex[v3] = v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = v4->enabledFeatureSetsAtLevelIndexByGroup[v3];
    v4->enabledFeatureSetsAtLevelIndexByGroup[v3] = v8;

    id v10 = [(FFConfiguration *)v4 featureSetsFileURLForLevelIndex:v3];
    if (v10)
    {
      uint64_t v11 = [(FFConfiguration *)v4 filereader];
      uint64_t v12 = v10;
      id v13 = v11;
      v38 = v12;
      id v14 = objc_msgSend(v11, "dictionaryWithContentsOfURL:error:");

      if (v14)
      {
        long long v37 = v14;
        id v15 = [v14 objectForKeyedSubscript:@"TentpoleFeatureSets"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          enabledFeatureSetsAtLevelIndexByGroup = v4->enabledFeatureSetsAtLevelIndexByGroup;
          unint64_t v46 = v3;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v16 = v15;
          id v17 = v15;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v55;
            uint64_t v44 = v4;
            id v40 = v17;
            uint64_t v41 = v16;
            uint64_t v39 = *(void *)v55;
            do
            {
              uint64_t v21 = 0;
              uint64_t v42 = v19;
              do
              {
                if (*(void *)v55 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * v21);
                if ([(FFConfiguration *)v4 isValidName:v22])
                {
                  uint64_t v23 = [v17 objectForKeyedSubscript:v22];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v49 = v22;
                    uint64_t v43 = v21;
                    long long v52 = 0u;
                    long long v53 = 0u;
                    long long v50 = 0u;
                    long long v51 = 0u;
                    id v24 = v23;
                    uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v58 count:16];
                    long long v26 = v23;
                    if (v25)
                    {
                      uint64_t v27 = v25;
                      uint64_t v28 = *(void *)v51;
                      id v47 = v24;
                      v48 = v23;
                      do
                      {
                        for (uint64_t i = 0; i != v27; ++i)
                        {
                          if (*(void *)v51 != v28) {
                            objc_enumerationMutation(v24);
                          }
                          uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8 * i);
                          if ([(FFConfiguration *)v4 isValidName:v30])
                          {
                            long long v31 = [v24 objectForKeyedSubscript:v30];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v32 = [[FFFeatureSetIdentifier alloc] initWithGroup:v49 set:v30];
                              long long v33 = enabledFeatureSetsByLevelIndex;
                              [(NSMutableSet *)enabledFeatureSetsByLevelIndex[v46] addObject:v32];
                              long long v34 = [(NSMutableDictionary *)enabledFeatureSetsAtLevelIndexByGroup[v46] objectForKeyedSubscript:v49];

                              if (!v34)
                              {
                                id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                                [(NSMutableDictionary *)enabledFeatureSetsAtLevelIndexByGroup[v46] setObject:v35 forKeyedSubscript:v49];
                              }
                              long long v36 = [(NSMutableDictionary *)enabledFeatureSetsAtLevelIndexByGroup[v46] objectForKeyedSubscript:v49];
                              [v36 addObject:v32];

                              enabledFeatureSetsByLevelIndex = v33;
                              id v4 = v44;
                              id v24 = v47;
                              long long v26 = v48;
                            }
                          }
                        }
                        uint64_t v27 = [v24 countByEnumeratingWithState:&v50 objects:v58 count:16];
                      }
                      while (v27);
                    }

                    uint64_t v23 = v26;
                    id v17 = v40;
                    id v16 = v41;
                    uint64_t v20 = v39;
                    uint64_t v19 = v42;
                    uint64_t v21 = v43;
                  }
                }
                ++v21;
              }
              while (v21 != v19);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
            }
            while (v19);
          }

          unint64_t v3 = v46;
          id v15 = v16;
        }

        id v14 = v37;
      }

      id v10 = v38;
    }
    [(FFConfiguration *)v4 recalculateFeatureSetEffectsAt:v3];
  }
}

- (void)removeAllFeatureSetDataAtLevelIndex:(unint64_t)a3
{
  uint64_t v5 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  Class v6 = &self->super.isa + a3;
  Class v7 = v6[44];
  v6[44] = v5;

  v6[52] = (Class)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  MEMORY[0x1F41817F8]();
}

- (void)loadFeatureSetDefinitions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->definedFeatureGroups && !self->definedFeatureSets)
  {
    unint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    definedFeatureGroups = self->definedFeatureGroups;
    self->definedFeatureGroups = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    definedFeatureSets = self->definedFeatureSets;
    self->definedFeatureSets = v5;

    Class v7 = (void *)[[NSString alloc] initWithUTF8String:_os_feature_internal_search_path()];
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"Tentpole/"];

    id v10 = [(FFConfiguration *)self filereader];
    id v27 = 0;
    uint64_t v11 = [v10 contentsOfDirectoryAtURL:v9 error:&v27];
    id v12 = v27;

    if (!v12)
    {
      uint64_t v21 = v11;
      uint64_t v22 = v7;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(v18, "lastPathComponent", v21, v22, (void)v23);
            uint64_t v20 = [v19 stringByDeletingPathExtension];

            if ([(FFConfiguration *)self isValidName:v20]) {
              [(FFConfiguration *)self loadFeatureSetDefinitionsNamed:v20 fromURL:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v15);
      }

      uint64_t v11 = v21;
      Class v7 = v22;
    }
  }
}

- (void)loadFeatureSetDefinitionsNamed:(id)a3 fromURL:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v53 = v6;
  uint64_t v8 = [(NSMutableDictionary *)self->definedFeatureGroups objectForKeyedSubscript:v6];

  if (v8) {
    -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:]();
  }
  uint64_t v9 = [(FFConfiguration *)self filereader];
  id v10 = [v9 dictionaryWithContentsOfURL:v7 error:0];

  if (v10)
  {
    uint64_t v11 = [[FFFeatureGroup alloc] initWithName:v6];
    [(NSMutableDictionary *)self->definedFeatureGroups setObject:v11 forKeyedSubscript:v6];
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[FFFeatureGroup setFeatureSets:](v11, "setFeatureSets:");
    id v12 = [v10 objectForKeyedSubscript:@"DisclosureRequired"];
    objc_opt_class();
    v48 = self;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v12 = 0;
    }
    unint64_t v46 = v12;
    id v47 = v11;
    [(FFFeatureGroup *)v11 setDisclosure:v12];
    id v13 = [v10 objectForKeyedSubscript:@"Attributes"];
    long long v56 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v67 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          uint64_t v19 = [obj objectForKeyedSubscript:v18];
          uint64_t v20 = [[FFFeatureAttribute alloc] initWithName:v18 value:v19];
          [v56 setObject:v20 forKeyedSubscript:v18];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v15);
    }

    uint64_t v21 = v47;
    [(FFFeatureGroup *)v47 setAttributes:v56];
    uint64_t v22 = [v10 objectForKeyedSubscript:@"FeatureSets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v45 = v10;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v44 = v22;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v71 count:16];
      p_isa = (id *)&v48->super.isa;
      if (v24)
      {
        uint64_t v26 = v24;
        uint64_t v27 = *(void *)v63;
        uint64_t v50 = *(void *)v63;
        id v51 = v23;
        do
        {
          uint64_t v28 = 0;
          uint64_t v54 = v26;
          do
          {
            if (*(void *)v63 != v27) {
              objc_enumerationMutation(v23);
            }
            uint64_t v29 = *(void *)(*((void *)&v62 + 1) + 8 * v28);
            if ([p_isa isValidName:v29])
            {
              uint64_t v30 = [v23 objectForKeyedSubscript:v29];
              objc_opt_class();
              long long v55 = v30;
              if (objc_opt_isKindOfClass())
              {
                long long v31 = [[FFFeatureSetIdentifier alloc] initWithGroup:v53 set:v29];
                long long v32 = [p_isa[60] objectForKeyedSubscript:v31];

                if (v32) {
                  -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:]();
                }
                id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                long long v34 = [v30 objectForKeyedSubscript:@"FeatureFlags"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v60 = 0u;
                  long long v61 = 0u;
                  long long v58 = 0u;
                  long long v59 = 0u;
                  uint64_t v49 = v34;
                  id v35 = v34;
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v70 count:16];
                  if (v36)
                  {
                    uint64_t v37 = v36;
                    uint64_t v38 = *(void *)v59;
                    do
                    {
                      for (uint64_t j = 0; j != v37; ++j)
                      {
                        if (*(void *)v59 != v38) {
                          objc_enumerationMutation(v35);
                        }
                        uint64_t v40 = *(void *)(*((void *)&v58 + 1) + 8 * j);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v41 = +[FFFeatureIdentifier identifierFromString:v40];
                          if (v41) {
                            [v33 addObject:v41];
                          }
                        }
                      }
                      uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v70 count:16];
                    }
                    while (v37);
                  }

                  p_isa = (id *)&v48->super.isa;
                  long long v34 = v49;
                }
                uint64_t v42 = [[FFFeatureSet alloc] initWithIdentifier:v31];
                [(FFFeatureSet *)v42 setFeatures:v33];
                [p_isa[60] setObject:v42 forKeyedSubscript:v31];
                uint64_t v43 = [(FFFeatureSetIdentifier *)v31 featureSetName];
                [v52 setObject:v42 forKeyedSubscript:v43];

                uint64_t v27 = v50;
                id v23 = v51;
                uint64_t v26 = v54;
              }
            }
            ++v28;
          }
          while (v28 != v26);
          uint64_t v26 = [v23 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (v26);
      }

      id v10 = v45;
      uint64_t v21 = v47;
      uint64_t v22 = v44;
    }
  }
}

- (id)parseSubscriptionsDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = [(FFConfiguration *)self plistparser];
          id v13 = [v12 parseSubscriptionsFromDictionary:v11];

          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (void)loadSubscriptionDataForLevelIndex:(unint64_t)a3
{
  if (a3 != 3 && a3 != 6) {
    -[FFConfiguration loadSubscriptionDataForLevelIndex:](a3);
  }
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  if (!self->subscriptionsByLevelIndex[a3])
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = subscriptionsByLevelIndex[a3];
    subscriptionsByLevelIndex[a3] = v6;

    id v12 = [(FFConfiguration *)self subscriptionsFileURLForLevelIndex:a3];
    if (v12)
    {
      uint64_t v8 = [(FFConfiguration *)self filereader];
      uint64_t v9 = [v8 dictionaryWithContentsOfURL:v12 error:0];

      if (v9)
      {
        id v10 = [v9 objectForKeyedSubscript:@"Subscriptions"];
        uint64_t v11 = [(FFConfiguration *)self parseSubscriptionsDictionary:v10];
        [(NSMutableArray *)subscriptionsByLevelIndex[a3] addObjectsFromArray:v11];
      }
    }
    [(FFConfiguration *)self recalculateSubscriptionEffectsAt:a3];
  }
}

- (void)removeAllSubscriptionsAtLevelIndex:(unint64_t)a3
{
  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 3 && a3 != 6) {
    -[FFConfiguration removeAllSubscriptionsAtLevelIndex:](a3);
  }
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  if ([(NSMutableArray *)self->subscriptionsByLevelIndex[a3] count])
  {
    id v6 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = &self->super.isa + a3;
    Class v8 = v7[62];
    v7[62] = v6;

    [(objc_class *)v7[62] setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#MODIFIED#"];
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = subscriptionsByLevelIndex[a3];
    subscriptionsByLevelIndex[a3] = v9;

    Class v11 = v7[12];
    v7[12] = 0;
  }
}

- (void)loadCombinedDataForLevelIndex:(unint64_t)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    abort();
  }
  unint64_t v3 = a3;
  id v4 = self;
  configByLevelIndex = self->configByLevelIndex;
  if (!self->configByLevelIndex[0][a3])
  {
    uint64_t v5 = 0;
    location = (id *)&self->metaByLevelIndex[a3];
    disclosuresByLevelIndex = self->disclosuresByLevelIndex;
    char v7 = 1;
    unint64_t v8 = 0x1E4F1C000uLL;
    uint64_t v9 = @"Disclosed";
    long long v59 = self->disclosuresByLevelIndex;
    do
    {
      char v10 = v7;
      obuint64_t j = objc_alloc_init(*(Class *)(v8 + 2656));
      Class v11 = [(FFConfiguration *)v4 fileURLForLevelIndex:v3 pathIndex:v5];
      id v12 = v11;
      char v67 = v10;
      if (v11)
      {
        id v13 = [v11 path];
        uint64_t v14 = [(FFConfiguration *)v4 filereader];
        long long v15 = [v14 dictionaryWithContentsOfURL:v12 error:0];

        if (v15)
        {
          long long v64 = v12;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          v71 = v15;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v77 objects:v82 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v78;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v78 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v77 + 1) + 8 * i);
                if ([(FFConfiguration *)v4 isValidName:v21])
                {
                  uint64_t v22 = [v16 objectForKeyedSubscript:v21];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v23 = [(FFConfiguration *)v4 makeFeatureDictionaryFrom:v22 forDomain:v21 atDomainLevel:0 reportableFilename:v13];
                    [obj setObject:v23 forKeyedSubscript:v21];

                    id v4 = self;
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v77 objects:v82 count:16];
            }
            while (v18);
          }

          disclosuresByLevelIndex = v59;
          unint64_t v8 = 0x1E4F1C000uLL;
          id v12 = v64;
          long long v15 = v71;
        }

        uint64_t v9 = @"Disclosed";
      }
      objc_storeStrong((id *)&configByLevelIndex[v5][v3], obj);
      id v24 = objc_alloc_init(*(Class *)(v8 + 2656));
      [v24 setObject:v12 forKeyedSubscript:@"#FILE#"];
      objc_storeStrong(location, v24);
      v70 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v25 = [(FFConfiguration *)v4 disclosureFileURLForLevelIndex:v3 pathIndex:v5];
      uint64_t v26 = [(FFConfiguration *)v4 internalDisclosureFileURLForLevelIndex:v3];
      if (v25)
      {
        uint64_t v27 = disclosuresByLevelIndex;
        uint64_t v28 = v26;
        uint64_t v29 = [(FFConfiguration *)v4 filereader];
        uint64_t v30 = (void *)v25;
        uint64_t v72 = [v29 dictionaryWithContentsOfURL:v25 error:0];

        uint64_t v26 = v28;
        disclosuresByLevelIndex = v27;
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v72 = 0;
      }
      long long v66 = (void *)v26;
      if (v26)
      {
        uint64_t v31 = v26;
        long long v32 = [(FFConfiguration *)v4 filereader];
        uint64_t v33 = [v32 dictionaryWithContentsOfURL:v31 error:0];
      }
      else
      {
        uint64_t v33 = 0;
      }
      long long v34 = v70;
      id v35 = (void *)v72;
      unint64_t v8 = 0x1E4F1C000;
      if (v72 | v33)
      {
        long long v60 = v30;
        uint64_t v36 = [MEMORY[0x1E4F1CA48] array];
        if (v72)
        {
          uint64_t v37 = [(id)v72 allKeys];
          [v36 addObjectsFromArray:v37];
        }
        id v61 = v24;
        long long v65 = v12;
        if (v33)
        {
          uint64_t v38 = [(id)v33 allKeys];
          [v36 addObjectsFromArray:v38];
        }
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v39 = v36;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v73 objects:v81 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v74;
          do
          {
            uint64_t v43 = 0;
            do
            {
              if (*(void *)v74 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v73 + 1) + 8 * v43);
              if (+[FFConfiguration isValidDisclosureName:v44])
              {
                id v45 = [v35 objectForKeyedSubscript:v44];
                unint64_t v46 = [v45 objectForKeyedSubscript:v9];

                if (v46)
                {
                  id v47 = [v35 objectForKeyedSubscript:v44];
                  [v47 objectForKeyedSubscript:v9];
                  uint64_t v49 = v48 = v9;
                  int v50 = [v49 BOOLValue];
                }
                else
                {
                  int v50 = 0;
                  v48 = v9;
                }
                id v51 = [(id)v33 objectForKeyedSubscript:v44];
                id v52 = [v51 objectForKeyedSubscript:v48];

                if (v52)
                {
                  long long v53 = [(id)v33 objectForKeyedSubscript:v44];
                  uint64_t v54 = [v53 objectForKeyedSubscript:v48];
                  char v55 = [v54 BOOLValue];

                  uint64_t v9 = v48;
                  id v35 = (void *)v72;
                  if ((v55 & 1) == 0) {
                    goto LABEL_42;
                  }
LABEL_41:
                  [(NSMutableSet *)v70 addObject:v44];
                  goto LABEL_42;
                }
                uint64_t v9 = v48;
                id v35 = (void *)v72;
                if (v50) {
                  goto LABEL_41;
                }
              }
LABEL_42:
              ++v43;
            }
            while (v41 != v43);
            uint64_t v56 = [v39 countByEnumeratingWithState:&v73 objects:v81 count:16];
            uint64_t v41 = v56;
          }
          while (v56);
        }

        unint64_t v3 = a3;
        disclosuresByLevelIndex = v59;
        unint64_t v8 = 0x1E4F1C000;
        id v12 = v65;
        uint64_t v30 = v60;
        id v24 = v61;
        long long v34 = v70;
      }
      if (disclosuresByLevelIndex[v3]) {
        -[NSMutableSet unionSet:](v34, "unionSet:");
      }
      long long v57 = disclosuresByLevelIndex[v3];
      disclosuresByLevelIndex[v3] = v34;

      char v7 = 0;
      uint64_t v5 = 1;
      id v4 = self;
    }
    while ((v67 & 1) != 0);
  }
}

- (void)addFeaturesForDomain:(id)a3 pathIndex:(int)a4 fromURL:(id)a5
{
  id v24 = a3;
  id v8 = a5;
  uint64_t v9 = (char *)self + 64 * (uint64_t)a4;
  uint64_t v11 = *((void *)v9 + 4);
  char v10 = (id *)(v9 + 32);
  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = *v10;
    id *v10 = v12;

    if (a4 == 1)
    {
      uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v15 = self->metaByLevelIndex[0];
      self->metaByLevelIndex[0] = v14;
    }
  }
  id v16 = [*v10 objectForKeyedSubscript:v24];

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*v10 setObject:v17 forKeyedSubscript:v24];

    if (a4 == 1)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->metaByLevelIndex[0] setObject:v18 forKeyedSubscript:v24];
    }
  }
  uint64_t v19 = [(FFConfiguration *)self filereader];
  uint64_t v20 = [v19 dictionaryWithContentsOfURL:v8 error:0];

  uint64_t v21 = [v8 path];
  uint64_t v22 = [(FFConfiguration *)self makeFeatureDictionaryFrom:v20 forDomain:v24 atDomainLevel:1 reportableFilename:v21];
  [*v10 setObject:v22 forKeyedSubscript:v24];

  if (a4 == 1)
  {
    id v23 = [(NSMutableDictionary *)self->metaByLevelIndex[0] objectForKeyedSubscript:v24];
    [v23 setObject:v8 forKeyedSubscript:@"#FILE#"];
  }
}

- (void)loadDomain:(id)a3 levelIndex:(unint64_t)a4
{
  id v11 = a3;
  switch(a4)
  {
    case 0uLL:
      id v6 = [(NSMutableDictionary *)self->configByLevelIndex[0][0] objectForKeyedSubscript:v11];

      if (!v6)
      {
        char v7 = (void *)MEMORY[0x1E01B6120]();
        id v8 = [(FFConfiguration *)self fileURLForDomain:v11 pathIndex:0];
        [(FFConfiguration *)self addFeaturesForDomain:v11 pathIndex:0 fromURL:v8];

        uint64_t v9 = (void *)MEMORY[0x1E01B6120]();
        char v10 = [(FFConfiguration *)self fileURLForDomain:v11 pathIndex:1];
        [(FFConfiguration *)self addFeaturesForDomain:v11 pathIndex:1 fromURL:v10];
      }
      break;
    case 1uLL:
    case 4uLL:
    case 7uLL:
      [(FFConfiguration *)self loadCombinedDataForLevelIndex:a4];
      break;
    case 2uLL:
    case 5uLL:
      [(FFConfiguration *)self loadFeatureSetDataForLevelIndex:a4];
      break;
    case 3uLL:
    case 6uLL:
      [(FFConfiguration *)self loadSubscriptionDataForLevelIndex:a4];
      break;
    case 8uLL:
      abort();
    default:
      break;
  }
  MEMORY[0x1F41817F8]();
}

- (void)loadAllLevelsForDomain:(id)a3
{
  id v4 = a3;
  [(FFConfiguration *)self loadDomain:v4 levelIndex:0];
  [(FFConfiguration *)self loadFeatureSetDefinitions];
  [(FFConfiguration *)self loadDomain:v4 levelIndex:1];
  [(FFConfiguration *)self loadDomain:v4 levelIndex:2];
  [(FFConfiguration *)self loadDomain:v4 levelIndex:4];
  [(FFConfiguration *)self loadDomain:v4 levelIndex:5];
  [(FFConfiguration *)self loadDomain:v4 levelIndex:7];
}

- (void)loadAllData
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->lock);
  uint64_t v3 = 0;
  id v4 = 0;
  char v5 = 1;
  unint64_t v6 = 0x1E4F1C000uLL;
  do
  {
    char v7 = v5;

    id v8 = [(NSArray *)self->searchPaths objectAtIndexedSubscript:v3];
    uint64_t v9 = [*(id *)(v6 + 2832) fileURLWithPath:v8 isDirectory:1];
    char v10 = [v9 URLByAppendingPathComponent:@"/Domain/"];

    id v11 = [(FFConfiguration *)self filereader];
    id v44 = 0;
    id v12 = [v11 contentsOfDirectoryAtURL:v10 error:&v44];
    id v4 = v44;

    if (!v4)
    {
      uint64_t v33 = v10;
      long long v34 = v8;
      char v35 = v7;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            id v18 = v12;
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            uint64_t v20 = objc_msgSend(v19, "lastPathComponent", v33, v34);
            uint64_t v21 = [v20 stringByDeletingPathExtension];

            if ([(FFConfiguration *)self isValidName:v21]) {
              [(FFConfiguration *)self addFeaturesForDomain:v21 pathIndex:v3 fromURL:v19];
            }

            id v12 = v18;
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v15);
      }

      id v4 = 0;
      unint64_t v6 = 0x1E4F1C000;
      char v7 = v35;
      char v10 = v33;
      id v8 = v34;
    }

    char v5 = 0;
    uint64_t v3 = 1;
  }
  while ((v7 & 1) != 0);
  [(FFConfiguration *)self loadFeatureSetDefinitions];
  char v22 = 1;
  [(FFConfiguration *)self loadCombinedDataForLevelIndex:1];
  [(FFConfiguration *)self loadCombinedDataForLevelIndex:4];
  [(FFConfiguration *)self loadCombinedDataForLevelIndex:7];
  [(FFConfiguration *)self loadFeatureSetDataForLevelIndex:2];
  [(FFConfiguration *)self loadFeatureSetDataForLevelIndex:5];
  id v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  domains = self->_domains;
  self->_domains = v23;

  uint64_t v25 = 0;
  do
  {
    uint64_t v26 = 0;
    char v27 = v22;
    do
    {
      uint64_t v28 = self->configByLevelIndex[v25][v26];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v29 = [(NSMutableDictionary *)v28 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(v28);
            }
            -[NSMutableSet addObject:](self->_domains, "addObject:", *(void *)(*((void *)&v36 + 1) + 8 * j), v33, v34);
          }
          uint64_t v30 = [(NSMutableDictionary *)v28 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v30);
      }

      ++v26;
    }
    while (v26 != 8);
    char v22 = 0;
    uint64_t v25 = 1;
  }
  while ((v27 & 1) != 0);
  [(FFConfiguration *)self loadSubscriptionDataForLevelIndex:3];
  [(FFConfiguration *)self loadSubscriptionDataForLevelIndex:6];
}

- (id)effectiveStateForFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(FFConfiguration *)self buildVersionGetter];
  id v11 = [v10 getBuildVersion];

  os_unfair_lock_assert_owner(&self->lock);
  id v12 = &self->super.isa + a5;
  for (uint64_t i = 12; i != -4; i -= 8)
  {
    uint64_t v14 = [(objc_class *)v12[i] objectForKeyedSubscript:v9];
    uint64_t v15 = [v14 objectForKeyedSubscript:v8];

    uint64_t v16 = [v15 disclosurerequired];
    if (v16)
    {
      id v17 = (void *)v16;
      id v18 = [v15 disclosurerequired];
      BOOL v19 = [(FFConfiguration *)self resolvedStateForDisclosure:v18];

      if (!v19) {
        goto LABEL_13;
      }
    }
    uint64_t v20 = [v15 buildVersion];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      char v22 = [v15 buildVersion];

      if (v22 != v11 || v15 == 0) {
        goto LABEL_13;
      }
    }
    else if (!v15)
    {
      goto LABEL_13;
    }
    if ([v15 value] != 2) {
      goto LABEL_15;
    }
LABEL_13:
  }
  uint64_t v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)resolvedStateForDisclosure:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_assert_owner(&self->lock);
    uint64_t v5 = 0;
    unint64_t v6 = &self->disclosuresByLevelIndex[7];
    do
    {
      BOOL v7 = v5 != -8;
      if (v5 == -8) {
        break;
      }
      int v8 = [(NSMutableSet *)v6[v5--] containsObject:v4];
    }
    while (!v8);
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)resolvedStateForFeature:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->lock);
  uint64_t v8 = 7;
  while (1)
  {
    id v9 = [(FFConfiguration *)self effectiveStateForFeature:v6 domain:v7 levelIndex:v8];
    char v10 = v9;
    if (v9)
    {
      if ([v9 value] != 2) {
        break;
      }
    }

    if (--v8 == -1)
    {
      char v10 = 0;
      goto LABEL_11;
    }
  }
  if (v8)
  {
    id v11 = [(FFConfiguration *)self effectiveStateForFeature:v6 domain:v7 levelIndex:0];
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 phase];

      if (v13)
      {
        uint64_t v14 = (void *)[v10 copy];

        uint64_t v15 = [v12 phase];
        [v14 setPhase:v15];

        char v10 = v14;
      }
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)isFeatureHidden:(id)a3 domain:(id)a4
{
  id v6 = a3;
  uint64_t v7 = 0;
  char v8 = 1;
  while (2)
  {
    char v9 = v8;
    char v10 = (char *)self + 64 * v7;
    for (uint64_t i = 88; i != 24; i -= 8)
    {
      id v12 = [*(id *)&v10[i] objectForKeyedSubscript:a4];
      id v13 = [v12 objectForKeyedSubscript:v6];

      if (v13)
      {
        uint64_t v14 = [v13 disclosurerequired];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = [v13 disclosurerequired];
          BOOL v17 = [(FFConfiguration *)self resolvedStateForDisclosure:v16];

          if (!v17)
          {

            BOOL v18 = 1;
            goto LABEL_10;
          }
        }
      }
    }
    char v8 = 0;
    BOOL v18 = 0;
    uint64_t v7 = 1;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_10:

  return v18;
}

- (void)createMutableDomainConfig:(id)a3 levelIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self->configByLevelIndex[1];
  char v8 = self->configByLevelIndex[1][a4];
  id v17 = v6;
  if (!v8)
  {
    char v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v10 = v7[a4];
    v7[a4] = v9;

    id v11 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v12 = &self->super.isa + a4;
    Class v13 = v12[20];
    v12[20] = v11;

    id v6 = v17;
    char v8 = v7[a4];
  }
  uint64_t v14 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v6];

  if (!v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)v7[a4] setObject:v15 forKeyedSubscript:v17];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->metaByLevelIndex[a4] setObject:v16 forKeyedSubscript:v17];
  }
}

- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6
{
}

- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6 buildVersion:(id)a7
{
  id v22 = a4;
  id v12 = a5;
  id v13 = a7;
  os_unfair_lock_assert_owner(&self->lock);
  if (a6 - 2 >= 6) {
    -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:](a6);
  }
  if (a6 == 4)
  {
    uint64_t v14 = [(FFConfiguration *)self profilePayloads];

    if (!v14) {
      -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:]();
    }
  }
  [(FFConfiguration *)self createMutableDomainConfig:v12 levelIndex:a6];
  id v15 = [[FFFeatureState alloc] initWithDomain:v12 feature:v22 value:a3 buildVersion:v13];
  id v16 = (id *)(&self->super.isa + a6);
  id v17 = [v16[12] objectForKeyedSubscript:v12];
  [v17 setObject:v15 forKeyedSubscript:v22];

  if (a6 > 6 || ((1 << a6) & 0x6C) == 0)
  {
    id v19 = v16[20];
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#MODIFIED#"];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"#FILE#"];

    if (!v20)
    {
      uint64_t v21 = [(FFConfiguration *)self fileURLForLevelIndex:a6 pathIndex:1];
      [v19 setObject:v21 forKeyedSubscript:@"#FILE#"];
    }
  }
  if (a3 != 2)
  {
    domains = self->_domains;
    if (domains) {
      [(NSMutableSet *)domains addObject:v12];
    }
  }
}

- (void)setFeaturesMatchingAttribute:(id)a3 levelIndex:(unint64_t)a4 value:(int64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(FFConfiguration *)self loadAllData];
  uint64_t v7 = 0;
  long long v32 = self;
  configByLevelIndex = self->configByLevelIndex;
  char v8 = 1;
  do
  {
    char v9 = v8;
    if (a4 <= 7)
    {
      char v23 = v8;
      uint64_t v31 = (id *)configByLevelIndex[v7];
      do
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        obuint64_t j = *v31;
        uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v26)
        {
          uint64_t v25 = *(void *)v38;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v38 != v25) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = v10;
              uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * v10);
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v30 = [*v31 objectForKeyedSubscript:v11];
              uint64_t v12 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v13; ++i)
                  {
                    if (*(void *)v34 != v14) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                    id v17 = [*v31 objectForKeyedSubscript:v11];
                    BOOL v18 = [v17 objectForKeyedSubscript:v16];

                    id v19 = [v18 attributes];
                    uint64_t v20 = [v6 name];
                    uint64_t v21 = [v19 objectForKeyedSubscript:v20];

                    if (![(FFConfiguration *)v32 isFeatureHidden:v16 domain:v11]
                      && v21
                      && [v6 matchesAgainst:v21])
                    {
                      [(FFConfiguration *)v32 setValue:a5 feature:v16 domain:v11 levelIndex:a4];
                    }
                  }
                  uint64_t v13 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
                }
                while (v13);
              }

              uint64_t v10 = v27 + 1;
            }
            while (v27 + 1 != v26);
            uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
          }
          while (v26);
        }

        ++a4;
      }
      while (a4 != 8);
      a4 = 8;
      char v9 = v23;
    }
    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
}

- (void)populateDictionary:(id)a3 withFeatures:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 value];
        if (v13 != 2
          || ([v12 buildVersion],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v14))
        {
          id v15 = [v12 buildVersion];

          uint64_t v16 = MEMORY[0x1E4F1CC28];
          if (v13 == 1) {
            uint64_t v16 = MEMORY[0x1E4F1CC38];
          }
          if (v15)
          {
            v26[0] = v16;
            v25[0] = @"Enabled";
            v25[1] = @"BuildVersion";
            id v17 = [v12 buildVersion];
            v26[1] = v17;
            BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
            [v5 setObject:v18 forKeyedSubscript:v11];
          }
          else
          {
            char v23 = @"Enabled";
            uint64_t v24 = v16;
            id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
            [v5 setObject:v17 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }
}

- (BOOL)writeDomainUpdates:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = self->metaByLevelIndex[0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v22)
  {
    long long v20 = self;
    uint64_t v21 = *(void *)v24;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"#MODIFIED#"];

        if (v10)
        {
          uint64_t v11 = [v9 objectForKeyedSubscript:@"#FILE#"];
          uint64_t v12 = [v11 URLByDeletingLastPathComponent];
          uint64_t v13 = [(FFConfiguration *)v20 filewriter];
          int v14 = [v13 createDirectoryAtURL:v12 error:a3];

          if (v14)
          {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v16 = [(NSMutableDictionary *)v20->configByLevelIndex[1][0] objectForKeyedSubscript:v8];
            [(FFConfiguration *)v20 populateDictionary:v15 withFeatures:v16];
            [(FFConfiguration *)v20 filewriter];
            v18 = id v17 = a3;
            char v6 = [v18 writeData:v15 toFile:v11 error:v17];

            a3 = v17;
          }
          else
          {
            char v6 = 0;
          }
        }
      }
      uint64_t v22 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v22);
  }
  else
  {
    char v6 = 1;
  }

  return v6 & 1;
}

- (BOOL)writeCombinedUpdatesAtLevelIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  metaByLevelIndex = self->metaByLevelIndex;
  char v6 = self->metaByLevelIndex[a3];
  if (!v6) {
    return 1;
  }
  uint64_t v9 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:@"#MODIFIED#"];

  if (!v9) {
    return 1;
  }
  uint64_t v10 = [(NSMutableDictionary *)metaByLevelIndex[a3] objectForKeyedSubscript:@"#FILE#"];
  uint64_t v11 = [v10 URLByDeletingLastPathComponent];
  uint64_t v12 = [(FFConfiguration *)self filewriter];
  int v13 = [v12 createDirectoryAtURL:v11 error:a4];

  if (v13)
  {
    long long v26 = v11;
    uint64_t v27 = v10;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = self->configByLevelIndex[1][a3];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v22 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v20];
          [(FFConfiguration *)self populateDictionary:v21 withFeatures:v22];
          [v14 setObject:v21 forKeyedSubscript:v20];
        }
        uint64_t v17 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }
    long long v23 = [(FFConfiguration *)self filewriter];
    uint64_t v10 = v27;
    char v24 = [v23 writeData:v14 toFile:v27 error:a4];

    uint64_t v11 = v26;
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (BOOL)writeCombinedUpdates:(id *)a3
{
  BOOL v5 = [(FFConfiguration *)self writeCombinedUpdatesAtLevelIndex:1 error:a3];
  if (v5)
  {
    uint64_t v6 = 2;
    do
    {
      uint64_t v7 = v6;
      if (v6 == 8) {
        break;
      }
      BOOL v8 = [(FFConfiguration *)self writeCombinedUpdatesAtLevelIndex:v6 error:a3];
      uint64_t v6 = v7 + 1;
    }
    while (v8);
    LOBYTE(v5) = (unint64_t)(v7 - 1) > 6;
  }
  return v5;
}

- (BOOL)writeDisclosureUpdatesAtlevelIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v5 = self->metaByLevelIndex[a3];
  if (!v5) {
    return 1;
  }
  BOOL v8 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:@"#DISCLOSURES_MODIFIED#"];

  if (!v8) {
    return 1;
  }
  uint64_t v9 = [(FFConfiguration *)self disclosureFileURLForLevelIndex:a3 pathIndex:1];
  uint64_t v10 = [v9 URLByDeletingLastPathComponent];
  uint64_t v11 = [(FFConfiguration *)self filewriter];
  int v12 = [v11 createDirectoryAtURL:v10 error:a4];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = self->disclosuresByLevelIndex[a3];
    uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v13, "setObject:forKey:", &unk_1F38A9BB0, *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
        }
        uint64_t v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    long long v19 = [(FFConfiguration *)self filewriter];
    char v20 = [v19 writeData:v13 toFile:v9 error:a4];
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (BOOL)writeDisclosureUpdates:(id *)a3
{
  uint64_t v5 = 1;
  BOOL result = 1;
  do
    BOOL result = result
          && [(FFConfiguration *)self writeDisclosureUpdatesAtlevelIndex:v5++ error:a3];
  while (v5 != 8);
  return result;
}

- (BOOL)writeFeatureSetUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  uint64_t v6 = self->featureSetsMetaByLevelIndex[a3];
  if (!v6) {
    return 1;
  }
  unint64_t v8 = a3;
  uint64_t v9 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:@"#MODIFIED#"];

  if (!v9) {
    return 1;
  }
  uint64_t v10 = [(FFConfiguration *)self featureSetsFileURLForLevelIndex:v8];
  uint64_t v11 = [v10 URLByDeletingLastPathComponent];
  int v12 = [(FFConfiguration *)self filewriter];
  int v13 = [v12 createDirectoryAtURL:v11 error:a4];

  if (v13)
  {
    long long v36 = a4;
    long long v37 = v11;
    long long v38 = v10;
    long long v39 = featureSetsMetaByLevelIndex;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    unint64_t v40 = v8;
    obuint64_t j = self->enabledFeatureSetsByLevelIndex[v8];
    uint64_t v15 = [(NSMutableSet *)obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          char v20 = objc_msgSend(v19, "featureGroupName", v36, v37, v38, v39);
          id v21 = [v14 objectForKeyedSubscript:v20];

          if (!v21)
          {
            id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v23 = [v19 featureGroupName];
            [v14 setObject:v22 forKeyedSubscript:v23];
          }
          definedFeatureGroups = self->definedFeatureGroups;
          long long v25 = [v19 featureGroupName];
          long long v26 = [(NSMutableDictionary *)definedFeatureGroups objectForKeyedSubscript:v25];

          uint64_t v27 = [v19 featureGroupName];
          long long v28 = [v14 objectForKeyedSubscript:v27];
          long long v29 = [v19 featureSetName];
          if (v26) {
            long long v30 = &unk_1F38A9BD8;
          }
          else {
            long long v30 = &unk_1F38A9C00;
          }
          [v28 setObject:v30 forKeyedSubscript:v29];
        }
        uint64_t v16 = [(NSMutableSet *)obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v16);
    }

    if ([v14 count]) {
      [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v14 forKey:@"TentpoleFeatureSets"];
    }
    else {
    long long v32 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    uint64_t v10 = v38;
    featureSetsMetaByLevelIndex = v39;
    uint64_t v33 = v36;
    uint64_t v11 = v37;
    long long v34 = [(FFConfiguration *)self filewriter];
    char v31 = [v34 writeData:v32 toFile:v10 error:v33];

    unint64_t v8 = v40;
  }
  else
  {
    char v31 = 0;
  }
  [(NSMutableDictionary *)featureSetsMetaByLevelIndex[v8] setObject:0 forKeyedSubscript:@"#MODIFIED#"];

  return v31;
}

- (BOOL)writeFeatureSetUpdates:(id *)a3
{
  return 1;
}

- (BOOL)writeSubscriptionUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->subscriptionsMetaByLevelIndex[a3];
  if (!v5) {
    return 1;
  }
  unint64_t v7 = a3;
  unint64_t v8 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:@"#MODIFIED#"];

  if (!v8) {
    return 1;
  }
  uint64_t v9 = [(FFConfiguration *)self subscriptionsFileURLForLevelIndex:v7];
  uint64_t v10 = [v9 URLByDeletingLastPathComponent];
  uint64_t v11 = [(FFConfiguration *)self filewriter];
  int v12 = [v11 createDirectoryAtURL:v10 error:a4];

  if (v12)
  {
    long long v26 = a4;
    uint64_t v27 = v10;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    unint64_t v28 = v7;
    obuint64_t j = self->subscriptionsByLevelIndex[v7];
    uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v19 = objc_msgSend(v18, "nameOfClass", v26);
          id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v20 setObject:v19 forKeyedSubscript:@"SubscriptionClass"];
          id v21 = [v18 encodeToDictionary];
          [v20 setObject:v21 forKeyedSubscript:@"SubscriptionContents"];

          [v13 addObject:v20];
        }
        uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v13 forKey:@"Subscriptions"];
    long long v23 = [(FFConfiguration *)self filewriter];
    char v24 = [v23 writeData:v22 toFile:v9 error:v26];

    unint64_t v7 = v28;
    uint64_t v10 = v27;
  }
  else
  {
    char v24 = 0;
  }
  [(NSMutableDictionary *)self->featureSetsMetaByLevelIndex[v7] setObject:0, @"#MODIFIED#", v26 forKeyedSubscript];

  return v24;
}

- (BOOL)writeSubscriptionUpdates:(id *)a3
{
  BOOL v5 = [(FFConfiguration *)self writeSubscriptionUpdatesAtLevelIndex:3 withError:a3];
  if (v5)
  {
    LOBYTE(v5) = [(FFConfiguration *)self writeSubscriptionUpdatesAtLevelIndex:6 withError:a3];
  }
  return v5;
}

- (NSSet)domains
{
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  id v4 = (void *)[(NSMutableSet *)self->_domains copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (id)featuresForDomainAlreadyLocked:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  char v24 = self;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v22 = 0;
  configByLevelIndex = self->configByLevelIndex;
  char v4 = 1;
  do
  {
    uint64_t v5 = 0;
    char v19 = v4;
    do
    {
      uint64_t v23 = v5;
      uint64_t v6 = [(NSMutableDictionary *)configByLevelIndex[v22][v5] objectForKeyedSubscript:v21];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          int v12 = [v6 objectForKeyedSubscript:v11];
          uint64_t v13 = [v12 disclosurerequired];
          if (!v13)
          {

LABEL_12:
            [v25 addObject:v11];
            continue;
          }
          uint64_t v14 = (void *)v13;
          uint64_t v15 = [v6 objectForKeyedSubscript:v11];
          uint64_t v16 = [v15 disclosurerequired];
          BOOL v17 = [(FFConfiguration *)v24 resolvedStateForDisclosure:v16];

          if (v17) {
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
LABEL_15:

      uint64_t v5 = v23 + 1;
    }
    while (v23 != 7);
    char v4 = 0;
    uint64_t v22 = 1;
  }
  while ((v19 & 1) != 0);

  return v25;
}

- (id)featuresForDomain:(id)a3
{
  id v4 = a3;
  [(FFConfiguration *)self validateName:v4];
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllLevelsForDomain:v4];
  uint64_t v6 = [(FFConfiguration *)self featuresForDomainAlreadyLocked:v4];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)stateForFeature:(id)a3 domain:(id)a4
{
  return [(FFConfiguration *)self stateForFeature:a3 domain:a4 level:4];
}

- (id)stateForFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(FFConfiguration *)self validateName:v9];
  [(FFConfiguration *)self validateName:v8];
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  switch(a5)
  {
    case 0:
      goto LABEL_5;
    case 1:
      a5 = 1;
      goto LABEL_5;
    case 2:
      a5 = 4;
      goto LABEL_5;
    case 3:
      a5 = 7;
LABEL_5:
      [(FFConfiguration *)self loadDomain:v9 levelIndex:a5];
      uint64_t v11 = [(FFConfiguration *)self effectiveStateForFeature:v8 domain:v9 levelIndex:a5];
      break;
    case 4:
      [(FFConfiguration *)self loadAllLevelsForDomain:v9];
      uint64_t v11 = [(FFConfiguration *)self resolvedStateForFeature:v8 domain:v9];
      break;
    default:
      -[FFConfiguration stateForFeature:domain:level:](a5);
  }
  int v12 = (void *)v11;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)defaultStateForFeature:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FFConfiguration *)self validateName:v7];
  [(FFConfiguration *)self validateName:v6];
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadDomain:v7 levelIndex:0];
  uint64_t v8 = 1;
  [(FFConfiguration *)self loadDomain:v7 levelIndex:1];
  while (1)
  {
    id v9 = [(FFConfiguration *)self effectiveStateForFeature:v6 domain:v7 levelIndex:v8];
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 value] != 2) {
        break;
      }
    }

    if (--v8 == -1)
    {
      uint64_t v10 = 0;
      break;
    }
  }
  os_unfair_lock_unlock(&self->lock);

  return v10;
}

- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 1:
      uint64_t v9 = 1;
      break;
    case 2:
      uint64_t v9 = 4;
      break;
    case 3:
      uint64_t v9 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v9 = 0;
      break;
  }
  [(FFConfiguration *)self enableFeature:v10 domain:v8 levelIndex:v9];
}

- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1:
      uint64_t v11 = 1;
      break;
    case 2:
      uint64_t v11 = 4;
      break;
    case 3:
      uint64_t v11 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v11 = 0;
      break;
  }
  [(FFConfiguration *)self enableFeature:v12 domain:v10 levelIndex:v11 transient:v6];
}

- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
}

- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  [(FFConfiguration *)self validateName:v10];
  [(FFConfiguration *)self validateName:v13];
  if (v6)
  {
    uint64_t v11 = [(FFConfiguration *)self buildVersionGetter];
    id v12 = [v11 getBuildVersion];
  }
  else
  {
    id v12 = 0;
  }
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadDomain:v10 levelIndex:a5];
  [(FFConfiguration *)self setValue:1 feature:v13 domain:v10 levelIndex:a5 buildVersion:v12];

  os_unfair_lock_unlock(&self->lock);
}

- (void)enableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 1:
      uint64_t v6 = 1;
      break;
    case 2:
      uint64_t v6 = 4;
      break;
    case 3:
      uint64_t v6 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v6 = 0;
      break;
  }
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self setFeaturesMatchingAttribute:v7 levelIndex:v6 value:1];
  os_unfair_lock_unlock(&self->lock);
}

- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 1:
      uint64_t v9 = 1;
      break;
    case 2:
      uint64_t v9 = 4;
      break;
    case 3:
      uint64_t v9 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v9 = 0;
      break;
  }
  [(FFConfiguration *)self disableFeature:v10 domain:v8 levelIndex:v9];
}

- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1:
      uint64_t v11 = 1;
      break;
    case 2:
      uint64_t v11 = 4;
      break;
    case 3:
      uint64_t v11 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v11 = 0;
      break;
  }
  [(FFConfiguration *)self disableFeature:v12 domain:v10 levelIndex:v11 transient:v6];
}

- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
}

- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  [(FFConfiguration *)self validateName:v10];
  [(FFConfiguration *)self validateName:v13];
  if (v6)
  {
    uint64_t v11 = [(FFConfiguration *)self buildVersionGetter];
    id v12 = [v11 getBuildVersion];
  }
  else
  {
    id v12 = 0;
  }
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadDomain:v10 levelIndex:a5];
  [(FFConfiguration *)self setValue:0 feature:v13 domain:v10 levelIndex:a5 buildVersion:v12];

  os_unfair_lock_unlock(&self->lock);
}

- (void)disableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 1:
      uint64_t v6 = 1;
      break;
    case 2:
      uint64_t v6 = 4;
      break;
    case 3:
      uint64_t v6 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v6 = 0;
      break;
  }
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self setFeaturesMatchingAttribute:v7 levelIndex:v6 value:0];
  os_unfair_lock_unlock(&self->lock);
}

- (void)unsetFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 1:
      uint64_t v9 = 1;
      break;
    case 2:
      uint64_t v9 = 4;
      break;
    case 3:
      uint64_t v9 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v9 = 0;
      break;
  }
  [(FFConfiguration *)self unsetFeature:v10 domain:v8 levelIndex:v9];
}

- (void)unsetFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(FFConfiguration *)self validateName:v8];
  [(FFConfiguration *)self validateName:v9];
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadDomain:v8 levelIndex:a5];
  [(FFConfiguration *)self setValue:2 feature:v9 domain:v8 levelIndex:a5];

  os_unfair_lock_unlock(&self->lock);
}

- (void)unsetFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 1:
      uint64_t v6 = 1;
      break;
    case 2:
      uint64_t v6 = 4;
      break;
    case 3:
      uint64_t v6 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v6 = 0;
      break;
  }
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self setFeaturesMatchingAttribute:v7 levelIndex:v6 value:2];
  os_unfair_lock_unlock(&self->lock);
}

- (void)_enableFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v20 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  [(NSMutableSet *)self->enabledFeatureSetsByLevelIndex[a4] addObject:v20];
  enabledFeatureSetsAtLevelIndexByGroup = self->enabledFeatureSetsAtLevelIndexByGroup;
  id v7 = self->enabledFeatureSetsAtLevelIndexByGroup[a4];
  id v8 = [v20 featureGroupName];
  id v9 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v11 = enabledFeatureSetsAtLevelIndexByGroup[a4];
    id v12 = [v20 featureGroupName];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];
  }
  id v13 = enabledFeatureSetsAtLevelIndexByGroup[a4];
  uint64_t v14 = [v20 featureGroupName];
  uint64_t v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];
  [v15 addObject:v20];

  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  BOOL v17 = self->featureSetsMetaByLevelIndex[a4];
  if (!v17)
  {
    uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v19 = featureSetsMetaByLevelIndex[a4];
    featureSetsMetaByLevelIndex[a4] = v18;

    BOOL v17 = featureSetsMetaByLevelIndex[a4];
  }
  [(NSMutableDictionary *)v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#MODIFIED#"];
  [(FFConfiguration *)self recalculateFeatureSetEffectsAt:a4];
}

- (void)_unsetFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  p_lock = &self->lock;
  id v7 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v8 = (id *)(&self->super.isa + a4);
  [v8[44] removeObject:v7];
  id v9 = v8[52];
  id v10 = [v7 featureGroupName];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  [v11 removeObject:v7];

  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  id v13 = self->featureSetsMetaByLevelIndex[a4];
  if (!v13)
  {
    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v15 = featureSetsMetaByLevelIndex[a4];
    featureSetsMetaByLevelIndex[a4] = v14;

    id v13 = featureSetsMetaByLevelIndex[a4];
  }
  [(NSMutableDictionary *)v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#MODIFIED#"];
  [(FFConfiguration *)self recalculateFeatureSetEffectsAt:a4];
}

- (void)addSubscriptionAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v14 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  id v7 = self->subscriptionsByLevelIndex[a4];
  if (!v7)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = subscriptionsByLevelIndex[a4];
    subscriptionsByLevelIndex[a4] = v8;

    id v7 = subscriptionsByLevelIndex[a4];
  }
  [(NSMutableArray *)v7 addObject:v14];
  subscriptionsMetaByLevelIndex = self->subscriptionsMetaByLevelIndex;
  uint64_t v11 = self->subscriptionsMetaByLevelIndex[a4];
  if (!v11)
  {
    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = subscriptionsMetaByLevelIndex[a4];
    subscriptionsMetaByLevelIndex[a4] = v12;

    uint64_t v11 = subscriptionsMetaByLevelIndex[a4];
  }
  [(NSMutableDictionary *)v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#MODIFIED#"];
  [(FFConfiguration *)self recalculateSubscriptionEffectsAt:a4];
}

- (BOOL)commitUpdates:(id *)a3
{
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  BOOL v6 = [(FFConfiguration *)self writeDomainUpdates:a3]
    && [(FFConfiguration *)self writeCombinedUpdates:a3]
    && [(FFConfiguration *)self writeDisclosureUpdates:a3]
    && [(FFConfiguration *)self writeFeatureSetUpdates:a3]
    && [(FFConfiguration *)self writeSubscriptionUpdates:a3];
  os_unfair_lock_unlock(p_lock);
  notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);
  return v6;
}

+ (BOOL)isValidName:(id)a3
{
  id v3 = a3;
  id v4 = (unsigned __int8 *)[v3 UTF8String];
  int v5 = *v4;
  if (!*v4) {
    goto LABEL_13;
  }
  BOOL v6 = v4;
  uint64_t v7 = MEMORY[0x1E4F14390];
  if (v5 == 95) {
    goto LABEL_7;
  }
  if (((char)v5 & 0x80000000) == 0)
  {
    if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * (char)v5 + 60) & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
  if (!__maskrune((char)v5, 0x100uLL))
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    do
    {
LABEL_7:
      int v9 = *v6++;
      int v8 = v9;
    }
    while (v9 == 95);
    if (!v8) {
      break;
    }
    if ((char)v8 < 0)
    {
      if (!__maskrune((char)v8, 0x500uLL)) {
        goto LABEL_13;
      }
    }
    else if ((*(_DWORD *)(v7 + 4 * (char)v8 + 60) & 0x500) == 0)
    {
      goto LABEL_13;
    }
  }
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)isValidName:(id)a3
{
  return +[FFConfiguration isValidName:a3];
}

+ (BOOL)isValidDisclosureName:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 UTF8String];
  char v5 = *v4;
  if (*v4)
  {
    BOOL v6 = v4 + 1;
    uint64_t v7 = MEMORY[0x1E4F14390];
    while (1)
    {
      if (v5 != 45 && v5 != 95)
      {
        if (!v5)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
        if (v5 < 0)
        {
          if (!__maskrune(v5, 0x500uLL)) {
            break;
          }
        }
        else if ((*(_DWORD *)(v7 + 4 * v5 + 60) & 0x500) == 0)
        {
          break;
        }
      }
      char v8 = *v6++;
      char v5 = v8;
    }
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)resetDomain:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(FFConfiguration *)self validateName:v5];
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllLevelsForDomain:v5];
  for (uint64_t i = 4; i != 8; ++i)
  {
    uint64_t v7 = self->configByLevelIndex[1][i];
    char v8 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v5];
    BOOL v9 = (void *)[v8 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          [(FFConfiguration *)self setValue:2 feature:*(void *)(*((void *)&v18 + 1) + 8 * j) domain:v5 levelIndex:i];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  BOOL v15 = [(FFConfiguration *)self writeDomainUpdates:a4]
     && [(FFConfiguration *)self writeCombinedUpdates:a4]
     && [(FFConfiguration *)self writeFeatureSetUpdates:a4]
     && [(FFConfiguration *)self writeSubscriptionUpdates:a4];
  os_unfair_lock_unlock(&self->lock);
  notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);

  return v15;
}

- (BOOL)reset:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  os_unfair_lock_lock(&self->lock);
  BOOL v6 = [(FFConfiguration *)self fileURLForLevelIndex:7 pathIndex:1];
  uint64_t v7 = [v6 path];
  int v8 = [v5 fileExistsAtPath:v7];

  if (v8
    && ([v6 path],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v5 removeItemAtPath:v9 error:a3],
        v9,
        (v10 & 1) == 0))
  {
    os_unfair_lock_unlock(&self->lock);
    BOOL v16 = 0;
    uint64_t v11 = v6;
  }
  else
  {
    uint64_t v11 = [(FFConfiguration *)self disclosureFileURLForLevelIndex:7 pathIndex:1];

    uint64_t v12 = [v11 path];
    int v13 = [v5 fileExistsAtPath:v12];

    if (v13
      && ([v11 path],
          id v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v5 removeItemAtPath:v14 error:a3],
          v14,
          (v15 & 1) == 0))
    {
      os_unfair_lock_unlock(&self->lock);
      BOOL v16 = 0;
    }
    else
    {
      [(FFConfiguration *)self clearCachedData];
      os_unfair_lock_unlock(&self->lock);
      notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);
      BOOL v16 = 1;
    }
  }

  return v16;
}

- (BOOL)isSafeMode
{
  return [(FFSafeModeChecker *)self->_safemodechecker isItSafeMode];
}

- (BOOL)phaseShouldBeEnabledByDefault:(id)a3
{
  return [a3 isEqualToString:@"FeatureComplete"];
}

- (unsigned)sortValueForPhase:(id)a3
{
  if (objc_msgSend(@"UnderDevelopment", "isEqualToString:")) {
    return 10;
  }
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = v5;
    v5 += 16;
  }
  while (v5 != 64
       && ![*(id *)((char *)&FFKnownPhasesAndValues + v6 + 24) isEqualToString:a3]);
  return *(_DWORD *)((char *)&FFKnownPhasesAndValues + v6 + 16);
}

- (FFFileWriter)filewriter
{
  return self->_filewriter;
}

- (void)setFilewriter:(id)a3
{
}

- (FFFileReader)filereader
{
  return self->_filereader;
}

- (void)setFilereader:(id)a3
{
}

- (FFParseErrorReporter)parseerrorreporter
{
  return self->_parseerrorreporter;
}

- (void)setParseerrorreporter:(id)a3
{
}

- (FFPlistParser)plistparser
{
  return self->_plistparser;
}

- (void)setPlistparser:(id)a3
{
}

- (FFSafeModeChecker)safemodechecker
{
  return self->_safemodechecker;
}

- (void)setSafemodechecker:(id)a3
{
}

- (FFBuildVersionGetter)buildVersionGetter
{
  return self->_buildVersionGetter;
}

- (void)setBuildVersionGetter:(id)a3
{
}

- (NSMutableArray)profilePayloads
{
  return self->_profilePayloads;
}

- (void)setProfilePayloads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePayloads, 0);
  objc_storeStrong((id *)&self->_buildVersionGetter, 0);
  objc_storeStrong((id *)&self->_safemodechecker, 0);
  objc_storeStrong((id *)&self->_plistparser, 0);
  objc_storeStrong((id *)&self->_parseerrorreporter, 0);
  objc_storeStrong((id *)&self->_filereader, 0);
  objc_storeStrong((id *)&self->_filewriter, 0);
  for (uint64_t i = 0; i != -8; --i)
    objc_storeStrong((id *)&self->subscriptionsByLevelIndex[i + 7], 0);
  for (uint64_t j = 0; j != -8; --j)
    objc_storeStrong((id *)&self->subscriptionsMetaByLevelIndex[j + 7], 0);
  objc_storeStrong((id *)&self->definedFeatureGroups, 0);
  objc_storeStrong((id *)&self->definedFeatureSets, 0);
  for (uint64_t k = 0; k != -8; --k)
    objc_storeStrong((id *)&self->enabledFeatureSetsAtLevelIndexByGroup[k + 7], 0);
  for (uint64_t m = 0; m != -8; --m)
    objc_storeStrong((id *)&self->enabledFeatureSetsByLevelIndex[m + 7], 0);
  for (uint64_t n = 0; n != -8; --n)
    objc_storeStrong((id *)&self->featureSetsMetaByLevelIndex[n + 7], 0);
  for (iuint64_t i = 0; ii != -8; --ii)
    objc_storeStrong((id *)&self->disclosuresByLevelIndex[ii + 7], 0);
  for (juint64_t j = 0; jj != -8; --jj)
    objc_storeStrong((id *)&self->metaByLevelIndex[jj + 7], 0);
  for (kuint64_t k = 152; kk != 24; kk -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + kk), 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->searchPaths, 0);
}

- (id)definedFeatureGroupsFilteredByCurrentDisclosures
{
  os_unfair_lock_assert_owner(&self->lock);
  [(FFConfiguration *)self loadAllData];
  definedFeatureGroups = self->definedFeatureGroups;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke;
  v15[3] = &unk_1E6CC6100;
  v15[4] = self;
  id v4 = [(NSMutableDictionary *)definedFeatureGroups keysOfEntriesPassingTest:v15];
  uint64_t v5 = self->enabledFeatureSetsAtLevelIndexByGroup[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_2;
  v14[3] = &unk_1E6CC6128;
  v14[4] = self;
  uint64_t v6 = [(NSMutableDictionary *)v5 keysOfEntriesPassingTest:v14];
  uint64_t v7 = [(NSMutableDictionary *)self->enabledFeatureSetsAtLevelIndexByGroup[2] keysOfEntriesPassingTest:&__block_literal_global];
  int v8 = [v4 setByAddingObjectsFromSet:v6];
  BOOL v9 = [v8 setByAddingObjectsFromSet:v7];

  char v10 = self->definedFeatureGroups;
  uint64_t v11 = [v9 allObjects];
  uint64_t v12 = [(NSMutableDictionary *)v10 dictionaryWithValuesForKeys:v11];

  return v12;
}

uint64_t __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 disclosure];
  uint64_t v5 = [v3 resolvedStateForDisclosure:v4];

  return v5;
}

uint64_t __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 488) objectForKeyedSubscript:a2];

  if (v6) {
    uint64_t v6 = [v5 count] != 0;
  }

  return v6;
}

BOOL __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 count] != 0;
}

- (id)definedFeatureSetsFilteredByCurrentDisclosures
{
  os_unfair_lock_assert_owner(&self->lock);
  [(FFConfiguration *)self loadAllData];
  id v3 = [(FFConfiguration *)self definedFeatureGroupsFilteredByCurrentDisclosures];
  id v4 = [v3 allValues];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke;
  v8[3] = &unk_1E6CC6198;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 featureSets];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke_2;
  v4[3] = &unk_1E6CC6170;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v4 identifier];
  [v3 setObject:v4 forKey:v5];
}

- (id)mutableDisclosureSetAtLevelIndex:(unint64_t)a3
{
  os_unfair_lock_assert_owner(&self->lock);
  [(FFConfiguration *)self loadAllData];
  disclosuresByLevelIndex = self->disclosuresByLevelIndex;
  id v6 = disclosuresByLevelIndex[a3];
  if (!v6)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v8 = disclosuresByLevelIndex[a3];
    disclosuresByLevelIndex[a3] = v7;

    id v6 = disclosuresByLevelIndex[a3];
  }
  return v6;
}

- (void)addDisclosure:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFDLL) {
    -[FFConfiguration(Disclosure) addDisclosure:atLevel:](a4);
  }
  id v9 = v6;
  if (a4 == 2)
  {
    uint64_t v7 = [(FFConfiguration *)self profilePayloads];

    if (!v7) {
      -[FFConfiguration(Disclosure) addDisclosure:atLevel:]();
    }
    uint64_t v8 = 4;
  }
  else
  {
    uint64_t v8 = 7;
  }
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self addDisclosureAlreadyLocked:v9 atLevelIndex:v8];
  os_unfair_lock_unlock(&self->lock);
}

- (void)addDisclosureAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v11 = a3;
  id v6 = [(FFConfiguration *)self mutableDisclosureSetAtLevelIndex:a4];
  if (([v6 containsObject:v11] & 1) == 0)
  {
    [v6 addObject:v11];
    metaByLevelIndex = self->metaByLevelIndex;
    uint64_t v8 = self->metaByLevelIndex[a4];
    if (!v8)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      char v10 = metaByLevelIndex[a4];
      metaByLevelIndex[a4] = v9;

      uint64_t v8 = metaByLevelIndex[a4];
    }
    [(NSMutableDictionary *)v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#DISCLOSURES_MODIFIED#"];
  }
  [(FFConfiguration *)self recalculateSubscriptionEffectsAt:3];
  [(FFConfiguration *)self recalculateSubscriptionEffectsAt:6];
}

- (void)removeDisclosure:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFDLL) {
    -[FFConfiguration(Disclosure) removeDisclosure:atLevel:](a4);
  }
  id v7 = v6;
  id v10 = v6;
  if (a4 == 2)
  {
    uint64_t v8 = [(FFConfiguration *)self profilePayloads];

    if (!v8) {
      -[FFConfiguration(Disclosure) removeDisclosure:atLevel:]();
    }
    uint64_t v9 = 4;
    id v7 = v10;
  }
  else
  {
    uint64_t v9 = 7;
  }
  [(FFConfiguration *)self removeDisclosure:v7 atLevelIndex:v9];
}

- (void)removeDisclosure:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v11 = a3;
  os_unfair_lock_lock(&self->lock);
  id v6 = [(FFConfiguration *)self mutableDisclosureSetAtLevelIndex:a4];
  if ([v6 containsObject:v11])
  {
    [v6 removeObject:v11];
    metaByLevelIndex = self->metaByLevelIndex;
    uint64_t v8 = self->metaByLevelIndex[a4];
    if (!v8)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = metaByLevelIndex[a4];
      metaByLevelIndex[a4] = v9;

      uint64_t v8 = metaByLevelIndex[a4];
    }
    [(NSMutableDictionary *)v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#DISCLOSURES_MODIFIED#"];
  }
  [(FFConfiguration *)self recalculateSubscriptionEffectsAt:3];
  [(FFConfiguration *)self recalculateSubscriptionEffectsAt:6];
  os_unfair_lock_unlock(&self->lock);
}

- (void)removeAllDisclosuresAtLevelIndex:(unint64_t)a3
{
  if (a3 == 4)
  {
    id v5 = [(FFConfiguration *)self profilePayloads];

    if (!v5) {
      -[FFConfiguration(Disclosure) removeAllDisclosuresAtLevelIndex:]();
    }
  }
  else if (a3 != 7)
  {
    -[FFConfiguration(Disclosure) removeAllDisclosuresAtLevelIndex:](a3);
  }
  os_unfair_lock_assert_owner(&self->lock);
  id v10 = [(FFConfiguration *)self mutableDisclosureSetAtLevelIndex:a3];
  [v10 removeAllObjects];
  metaByLevelIndex = self->metaByLevelIndex;
  id v7 = metaByLevelIndex[a3];
  if (!v7)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = metaByLevelIndex[a3];
    metaByLevelIndex[a3] = v8;

    id v7 = metaByLevelIndex[a3];
  }
  [(NSMutableDictionary *)v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#DISCLOSURES_MODIFIED#"];
}

- (id)currentDisclosuresAtLevel:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 4;
      break;
    case 3:
      uint64_t v4 = 7;
      break;
    case 4:
      abort();
    default:
      uint64_t v4 = 0;
      break;
  }
  return [(FFConfiguration *)self currentDisclosuresAtLevelIndex:v4];
}

- (id)currentDisclosuresAtLevelIndex:(unint64_t)a3
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  id v6 = [(FFConfiguration *)self mutableDisclosureSetAtLevelIndex:a3];
  id v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)currentDisclosures
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  for (uint64_t i = 7; i != -1; --i)
  {
    id v6 = (void *)MEMORY[0x1E01B6120]();
    id v7 = [(FFConfiguration *)self mutableDisclosureSetAtLevelIndex:i];
    [v4 unionSet:v7];
  }
  uint64_t v8 = (void *)[v4 copy];
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)isValidDisclosureName:(id)a3
{
  return +[FFConfiguration isValidDisclosureName:a3];
}

- (id)disclosureForFeature:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  uint64_t v8 = 0;
  char v9 = 1;
  while (2)
  {
    char v10 = v9;
    id v11 = (char *)self + 64 * v8;
    for (uint64_t i = 88; i != 24; i -= 8)
    {
      int v13 = [*(id *)&v11[i] objectForKeyedSubscript:v7];
      id v14 = [v13 objectForKeyedSubscript:v6];

      if (v14)
      {
        uint64_t v15 = [v14 disclosurerequired];
        if (v15)
        {
          BOOL v16 = (void *)v15;
          BOOL v17 = [v14 disclosurerequired];
          BOOL v18 = [(FFConfiguration *)self resolvedStateForDisclosure:v17];

          if (v18)
          {
            os_unfair_lock_unlock(lock);
            long long v19 = [v14 disclosurerequired];

            goto LABEL_10;
          }
        }
      }
    }
    char v9 = 0;
    uint64_t v8 = 1;
    if (v10) {
      continue;
    }
    break;
  }
  os_unfair_lock_unlock(lock);
  long long v19 = 0;
LABEL_10:

  return v19;
}

+ (id)configurationForProfileManagement
{
  id v2 = [[FFConfiguration alloc] initPrivate];
  return v2;
}

- (void)prepareToAddProfilePayloads
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadCombinedDataForLevelIndex:4];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(FFConfiguration *)self setProfilePayloads:v3];

  id v4 = self->configByLevelIndex[1][4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(NSMutableDictionary *)v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        char v9 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v8];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        char v10 = [v9 allKeys];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              [(FFConfiguration *)self setValue:2 feature:*(void *)(*((void *)&v18 + 1) + 8 * j) domain:v8 levelIndex:4];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }

        [(NSMutableDictionary *)v4 removeObjectForKey:v8];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  [(FFConfiguration *)self removeAllDisclosuresAtLevelIndex:4];
  [(FFConfiguration *)self removeAllFeatureSetDataAtLevelIndex:2];
  [(FFConfiguration *)self removeAllSubscriptionsAtLevelIndex:3];
  os_unfair_lock_unlock(lock);
}

- (BOOL)addProfilePayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  char v7 = FFConfigurationValidateProfilePayload(v6, &v12);
  id v8 = v12;
  char v9 = v8;
  if (v7)
  {
    char v10 = [(FFConfiguration *)self profilePayloads];
    [v10 addObject:v6];
  }
  else if (a4)
  {
    *a4 = v8;
  }

  return v7;
}

- (BOOL)commitProfilePayloadsAndReturnError:(id *)a3
{
  v135[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FFConfiguration *)self profilePayloads];

  if (v5)
  {
    v81 = a3;
    os_unfair_lock_lock(&self->lock);
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    obuint64_t j = [(FFConfiguration *)self profilePayloads];
    uint64_t v82 = [obj countByEnumeratingWithState:&v123 objects:v133 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v124;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v124 != v83) {
            objc_enumerationMutation(obj);
          }
          uint64_t v85 = v6;
          char v7 = *(void **)(*((void *)&v123 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_85;
          }
          uint64_t v8 = [v7 objectForKeyedSubscript:@"Features"];
          if (v8)
          {
            char v9 = (void *)v8;
            char v10 = [v7 objectForKeyedSubscript:@"Features"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0) {
              goto LABEL_85;
            }
          }
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          v86 = v7;
          id v87 = [v7 objectForKeyedSubscript:@"Features"];
          uint64_t v91 = [v87 countByEnumeratingWithState:&v119 objects:v132 count:16];
          if (v91)
          {
            uint64_t v89 = *(void *)v120;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v120 != v89) {
                  objc_enumerationMutation(v87);
                }
                uint64_t v13 = *(void **)(*((void *)&v119 + 1) + 8 * v12);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                id v14 = [v13 objectForKeyedSubscript:@"Domain"];
                uint64_t v15 = [v13 objectForKeyedSubscript:@"Features"];
                objc_opt_class();
                char v16 = objc_opt_isKindOfClass();

                if ((v16 & 1) == 0) {
                  goto LABEL_85;
                }
                uint64_t v93 = v12;
                long long v117 = 0u;
                long long v118 = 0u;
                long long v115 = 0u;
                long long v116 = 0u;
                uint64_t v17 = [v13 objectForKeyedSubscript:@"Features"];
                uint64_t v18 = [v17 countByEnumeratingWithState:&v115 objects:v131 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v116;
                  do
                  {
                    for (uint64_t i = 0; i != v19; ++i)
                    {
                      if (*(void *)v116 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      long long v22 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_85;
                      }
                      long long v23 = [v22 objectForKeyedSubscript:@"FeatureName"];
                      long long v24 = [v22 objectForKeyedSubscript:@"Enabled"];
                      uint64_t v25 = [v24 BOOLValue];

                      [(FFConfiguration *)self setValue:v25 feature:v23 domain:v14 levelIndex:4];
                    }
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v115 objects:v131 count:16];
                  }
                  while (v19);
                }

                uint64_t v12 = v93 + 1;
              }
              while (v93 + 1 != v91);
              uint64_t v91 = [v87 countByEnumeratingWithState:&v119 objects:v132 count:16];
            }
            while (v91);
          }

          uint64_t v26 = [v86 objectForKeyedSubscript:@"Disclosures"];
          if (v26)
          {
            long long v27 = (void *)v26;
            uint64_t v28 = [v86 objectForKeyedSubscript:@"Disclosures"];
            objc_opt_class();
            char v29 = objc_opt_isKindOfClass();

            if ((v29 & 1) == 0) {
              goto LABEL_85;
            }
          }
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v30 = [v86 objectForKeyedSubscript:@"Disclosures"];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v111 objects:v130 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v112;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v112 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void **)(*((void *)&v111 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                long long v36 = [v35 objectForKeyedSubscript:@"DisclosureName"];
                [(FFConfiguration *)self addDisclosureAlreadyLocked:v36 atLevelIndex:4];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v111 objects:v130 count:16];
            }
            while (v32);
          }

          long long v37 = @"FeatureSets";
          uint64_t v38 = [v86 objectForKeyedSubscript:@"FeatureSets"];
          if (v38)
          {
            long long v39 = (void *)v38;
            unint64_t v40 = [v86 objectForKeyedSubscript:@"FeatureSets"];
            objc_opt_class();
            char v41 = objc_opt_isKindOfClass();

            if ((v41 & 1) == 0) {
              goto LABEL_85;
            }
          }
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v88 = [v86 objectForKeyedSubscript:@"FeatureSets"];
          uint64_t v92 = [v88 countByEnumeratingWithState:&v107 objects:v129 count:16];
          if (v92)
          {
            uint64_t v90 = *(void *)v108;
            do
            {
              uint64_t v42 = 0;
              do
              {
                if (*(void *)v108 != v90) {
                  objc_enumerationMutation(v88);
                }
                long long v43 = *(void **)(*((void *)&v107 + 1) + 8 * v42);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                long long v44 = [v43 objectForKeyedSubscript:@"FeatureSetGroupName"];
                long long v45 = [v43 objectForKeyedSubscript:v37];
                objc_opt_class();
                char v46 = objc_opt_isKindOfClass();

                if ((v46 & 1) == 0) {
                  goto LABEL_85;
                }
                uint64_t v94 = v42;
                long long v105 = 0u;
                long long v106 = 0u;
                long long v103 = 0u;
                long long v104 = 0u;
                uint64_t v47 = v37;
                v48 = [v43 objectForKeyedSubscript:v37];
                uint64_t v49 = [v48 countByEnumeratingWithState:&v103 objects:v128 count:16];
                if (v49)
                {
                  uint64_t v50 = v49;
                  uint64_t v51 = *(void *)v104;
                  do
                  {
                    for (uint64_t k = 0; k != v50; ++k)
                    {
                      if (*(void *)v104 != v51) {
                        objc_enumerationMutation(v48);
                      }
                      long long v53 = *(void **)(*((void *)&v103 + 1) + 8 * k);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_85;
                      }
                      uint64_t v54 = [v53 objectForKeyedSubscript:@"FeatureSetName"];
                      char v55 = [[FFFeatureSetIdentifier alloc] initWithGroup:v44 set:v54];
                      if (v55) {
                        [(FFConfiguration *)self _enableFeatureSetAlreadyLocked:v55 atLevelIndex:2];
                      }
                    }
                    uint64_t v50 = [v48 countByEnumeratingWithState:&v103 objects:v128 count:16];
                  }
                  while (v50);
                }

                uint64_t v42 = v94 + 1;
                long long v37 = v47;
              }
              while (v94 + 1 != v92);
              uint64_t v92 = [v88 countByEnumeratingWithState:&v107 objects:v129 count:16];
            }
            while (v92);
          }

          uint64_t v56 = [v86 objectForKeyedSubscript:@"Subscriptions"];
          if (v56)
          {
            long long v57 = (void *)v56;
            long long v58 = [v86 objectForKeyedSubscript:@"Subscriptions"];
            objc_opt_class();
            char v59 = objc_opt_isKindOfClass();

            if ((v59 & 1) == 0) {
LABEL_85:
            }
              abort();
          }
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v60 = [v86 objectForKeyedSubscript:@"Subscriptions"];
          uint64_t v61 = [v60 countByEnumeratingWithState:&v99 objects:v127 count:16];
          if (v61)
          {
            uint64_t v62 = v61;
            uint64_t v63 = *(void *)v100;
            do
            {
              for (uint64_t m = 0; m != v62; ++m)
              {
                if (*(void *)v100 != v63) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v65 = *(void *)(*((void *)&v99 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                long long v66 = [(FFConfiguration *)self plistparser];
                char v67 = [v66 parseSubscriptionsFromDictionary:v65];

                if (v67) {
                  [(FFConfiguration *)self addSubscriptionAlreadyLocked:v67 atLevelIndex:3];
                }
              }
              uint64_t v62 = [v60 countByEnumeratingWithState:&v99 objects:v127 count:16];
            }
            while (v62);
          }

          uint64_t v6 = v85 + 1;
        }
        while (v85 + 1 != v82);
        uint64_t v82 = [obj countByEnumeratingWithState:&v123 objects:v133 count:16];
      }
      while (v82);
    }

    id v98 = 0;
    BOOL v68 = [(FFConfiguration *)self writeCombinedUpdatesAtLevelIndex:4 error:&v98];
    id v69 = v98;
    v70 = v69;
    if (v81 && !v68) {
      id *v81 = v69;
    }
    id v97 = v70;
    BOOL v71 = [(FFConfiguration *)self writeDisclosureUpdatesAtlevelIndex:4 error:&v97];
    id v72 = v97;

    if (v81 && !v71) {
      id *v81 = v72;
    }
    id v96 = v72;
    BOOL v73 = [(FFConfiguration *)self writeFeatureSetUpdatesAtLevelIndex:2 withError:&v96];
    id v74 = v96;

    if (v81 && !v73) {
      id *v81 = v74;
    }
    id v95 = v74;
    BOOL v75 = [(FFConfiguration *)self writeSubscriptionUpdatesAtLevelIndex:3 withError:&v95];
    id v76 = v95;

    if (v81 && !v75) {
      id *v81 = v76;
    }
    os_unfair_lock_unlock(&self->lock);
  }
  else
  {
    long long v77 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v78 = *MEMORY[0x1E4F28798];
    uint64_t v134 = *MEMORY[0x1E4F28228];
    v135[0] = @"Must prepareToAddProfilePayloads before committing";
    long long v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v135 forKeys:&v134 count:1];
    id v76 = [v77 errorWithDomain:v78 code:22 userInfo:v79];

    if (a3) {
      *a3 = v76;
    }
    notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);
    LOBYTE(v75) = 0;
  }

  return v75;
}

- (id)allFeatureGroups
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = [(FFConfiguration *)self definedFeatureGroupsFilteredByCurrentDisclosures];
  uint64_t v6 = [v5 allKeys];
  char v7 = [v4 setWithArray:v6];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)attributesForFeatureGroup:(id)a3
{
  p_locuint64_t k = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(FFConfiguration *)self loadAllData];
  uint64_t v6 = [(FFConfiguration *)self definedFeatureGroupsFilteredByCurrentDisclosures];
  char v7 = [v6 objectForKeyedSubscript:v5];

  uint64_t v8 = [v7 attributes];
  char v9 = (void *)[v8 copy];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)featureSetsInGroup:(id)a3
{
  p_locuint64_t k = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(FFConfiguration *)self loadAllData];
  uint64_t v6 = [(FFConfiguration *)self definedFeatureGroupsFilteredByCurrentDisclosures];
  char v7 = [v6 objectForKeyedSubscript:v5];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  if (v7)
  {
    char v9 = [v7 featureSets];
    char v10 = [v9 allKeys];
    uint64_t v11 = [v8 setWithArray:v10];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)featureFlagsInSet:(id)a3 inGroup:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  uint64_t v26 = v7;
  long long v27 = v6;
  uint64_t v8 = [[FFFeatureSetIdentifier alloc] initWithGroup:v7 set:v6];
  char v9 = [(FFConfiguration *)self definedFeatureSetsFilteredByCurrentDisclosures];
  long long v24 = v8;
  char v10 = [v9 objectForKeyedSubscript:v8];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = [v10 features];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v18 = [v17 domainName];
        uint64_t v19 = [v11 objectForKeyedSubscript:v18];

        if (!v19)
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v11 setObject:v20 forKeyedSubscript:v18];
        }
        long long v21 = [v11 objectForKeyedSubscript:v18];
        long long v22 = [v17 featureName];
        [v21 addObject:v22];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(lock);
  return v11;
}

- (int64_t)valueForFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = [[FFFeatureSetIdentifier alloc] initWithGroup:v8 set:v9];

  int64_t v11 = [(FFConfiguration *)self _valueForFeatureSet:v10 atLevel:a5];
  return v11;
}

- (int64_t)resolvedValueForFeatureSet:(id)a3 inGroup:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[FFFeatureSetIdentifier alloc] initWithGroup:v6 set:v7];

  int64_t v9 = [(FFConfiguration *)self _resolvedValueForFeatureSet:v8];
  return v9;
}

- (int64_t)_resolvedValueForFeatureSet:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(FFConfiguration *)self _valueForFeatureSet:v4 atLevel:3];
  if (v5 == 2) {
    int64_t v5 = [(FFConfiguration *)self _valueForFeatureSet:v4 atLevel:2];
  }

  return v5;
}

- (int64_t)_valueForFeatureSet:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 2)
  {
    if (a4 != 3) {
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:](a4);
    }
    a4 = 5;
  }
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  if ([(NSMutableSet *)self->enabledFeatureSetsByLevelIndex[a4] containsObject:v6]) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = 2;
  }
  os_unfair_lock_unlock(&self->lock);

  return v7;
}

- (void)enableFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (a5 != 2)
  {
    if (a5 != 3) {
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:](a5);
    }
    a5 = 5;
  }
  int64_t v9 = [[FFFeatureSetIdentifier alloc] initWithGroup:v8 set:v10];
  if (v9)
  {
    os_unfair_lock_lock(&self->lock);
    [(FFConfiguration *)self loadAllData];
    [(FFConfiguration *)self _enableFeatureSetAlreadyLocked:v9 atLevelIndex:a5];
    os_unfair_lock_unlock(&self->lock);
  }
}

- (void)unsetFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (a5 != 2)
  {
    if (a5 != 3) {
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:](a5);
    }
    a5 = 5;
  }
  int64_t v9 = [[FFFeatureSetIdentifier alloc] initWithGroup:v8 set:v10];
  if (v9)
  {
    os_unfair_lock_lock(&self->lock);
    [(FFConfiguration *)self loadAllData];
    [(FFConfiguration *)self _unsetFeatureSetAlreadyLocked:v9 atLevelIndex:a5];
    os_unfair_lock_unlock(&self->lock);
  }
}

- (id)disclosureForFeatureGroup:(id)a3
{
  p_locuint64_t k = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(FFConfiguration *)self loadAllData];
  id v6 = [(NSMutableDictionary *)self->definedFeatureGroups objectForKeyedSubscript:v5];

  if (!v6) {
    goto LABEL_5;
  }
  int64_t v7 = [v6 disclosure];
  id v8 = (void *)[v7 copy];

  if (!v8 || ![(FFConfiguration *)self resolvedStateForDisclosure:v8])
  {

LABEL_5:
    id v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)addSubscription:(id)a3 atLevel:(int64_t)a4
{
  id v7 = a3;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  if (a4 == 2)
  {
    uint64_t v6 = 3;
  }
  else
  {
    if (a4 != 3) {
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:]((NSString *)a4);
    }
    uint64_t v6 = 6;
  }
  [(FFConfiguration *)self addSubscriptionAlreadyLocked:v7 atLevelIndex:v6];
  os_unfair_lock_unlock(&self->lock);
}

- (void)removeSubscription:(id)a3 atLevel:(int64_t)a4
{
  id v11 = a3;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  if (a4 == 2)
  {
    uint64_t v6 = 3;
  }
  else
  {
    if (a4 != 3) {
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:]((NSString *)a4);
    }
    uint64_t v6 = 6;
  }
  [(NSMutableArray *)self->subscriptionsByLevelIndex[v6] removeObject:v11];
  subscriptionsMetaByLevelIndex = self->subscriptionsMetaByLevelIndex;
  id v8 = self->subscriptionsMetaByLevelIndex[v6];
  if (!v8)
  {
    int64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v10 = subscriptionsMetaByLevelIndex[v6];
    subscriptionsMetaByLevelIndex[v6] = v9;

    id v8 = subscriptionsMetaByLevelIndex[v6];
  }
  [(NSMutableDictionary *)v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"#MODIFIED#"];
  [(FFConfiguration *)self recalculateSubscriptionEffectsAt:v6];
  os_unfair_lock_unlock(&self->lock);
}

- (id)allSubscriptionsAtLevel:(int64_t)a3
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  [(FFConfiguration *)self loadAllData];
  if (a3 == 2)
  {
    uint64_t v6 = 584;
  }
  else
  {
    if (a3 != 3) {
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:]((NSString *)a3);
    }
    uint64_t v6 = 608;
  }
  id v7 = (void *)[*(id *)((char *)&self->super.isa + v6) copy];
  os_unfair_lock_unlock(p_lock);
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C978] array];
  }
  int64_t v9 = v8;

  return v9;
}

- (void)fileURLForLevelIndex:(uint64_t)a1 pathIndex:.cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to fileURLForLevel with unexpected level";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)disclosureFileURLForLevelIndex:(uint64_t)a1 pathIndex:.cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to disclosureFileURLForLevel with unexpected level";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)featureSetsFileURLForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to featureSetsFileURLForLevelIndex with unexpected level";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)subscriptionsFileURLForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to subscriptionsFileURLForLevelIndex with unexpected level";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)recalculateFeatureSetEffectsAt:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: wrong level";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)loadFeatureSetDefinitionsNamed:fromURL:.cold.1()
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: feature group/set name was duplicated, which shouldn't be possible";
  __break(1u);
}

- (void)loadFeatureSetDefinitionsNamed:fromURL:.cold.2()
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: feature group name was duplicated, which shouldn't be possible";
  __break(1u);
}

- (void)loadSubscriptionDataForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to loadSubscriptionDataForLevelIndex with a level that is not permitted";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)removeAllSubscriptionsAtLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeAllSubscriptionsAtLevelIndex with a level that is not permitted";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)setValue:feature:domain:levelIndex:buildVersion:.cold.1()
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to setValue with a level that is not permitted";
  qword_1EAB22090 = 4;
  __break(1u);
}

- (void)setValue:(uint64_t)a1 feature:domain:levelIndex:buildVersion:.cold.2(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to setValue with a level that is not permitted";
  qword_1EAB22090 = a1;
  __break(1u);
}

- (void)stateForFeature:(uint64_t)a1 domain:level:.cold.1(uint64_t a1)
{
  qword_1EAB22060 = (uint64_t)"BUG IN CLIENT OF LIBFEATUREFLAGS: Call to this function with a level that is unknown/invalid/unsupported";
  qword_1EAB22090 = a1;
  __break(1u);
}

@end