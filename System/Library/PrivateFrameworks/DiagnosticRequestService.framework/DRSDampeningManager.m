@interface DRSDampeningManager
+ (BOOL)passesAcceptanceRate:(double)a3;
+ (BOOL)removeExistingDampeningManagerStateFromManagedObjectContext:(id)a3 errorOut:(id *)a4;
+ (id)_ON_MOC_QUEUE_existingMOFromContext:(id)a3 errorOut:(id *)a4;
+ (id)_RMETeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_abcTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_appIntentsServicesTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_coreAnimationTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_coreAudioTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_defaultTailspinConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_drmTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_entityName;
+ (id)_hangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_libtraceTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_mailTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_memoryToolsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_nandGBBTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_nandTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_newsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_nonWatchOShangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4;
+ (id)_ppsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_rapidTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_sentryTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_skylightTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_softwareUpdateTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_spindumpTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_spotlightTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_watchOS_hangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4;
+ (id)_watchdogdTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)_workflowResponsivenessDampeningConfiguration:(BOOL)a3;
+ (id)dampeningManagerFromPersistentContainer:(id)a3 deleteBadState:(BOOL)a4 errorOut:(id *)a5;
+ (id)defaultResourceConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)defaultResourceConfigurationsForCurrentDevice;
+ (id)defaultTeamConfigurationForTeam:(id)a3 isInternal:(BOOL)a4 isSeed:(BOOL)a5 isCarrier:(BOOL)a6 platform:(unsigned __int8)a7;
+ (id)defaultTeamConfigurationForTeamForCurrentDevice:(id)a3 teamConfigurationDirectory:(id)a4;
+ (id)defaultTeamConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
+ (id)defaultTeamConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6 plistDirectoryPath:(id)a7 errorOut:(id *)a8;
+ (id)defaultTeamConfigurationsForCurrentDevice:(id)a3;
+ (unint64_t)defaultTotalCapForCurrentDevice;
+ (unint64_t)defaultTotalCapForIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5;
- (BOOL)_hasRequestsRecordCountGreaterThanOrEqualToThreshold:(unint64_t)a3 matchingPredicate:(id)a4 inContext:(id)a5 filterToObjectsMatchingClassOfRequest:(id)a6;
- (BOOL)_passesResourceCap:(id)a3 config:(id)a4 managedObjectContext:(id)a5;
- (BOOL)_passesResourceHysteresis:(id)a3 config:(id)a4 managedObjectContext:(id)a5;
- (BOOL)_passesResourceRandomDownsampling:(id)a3 config:(id)a4;
- (BOOL)_passesSignatureCap:(id)a3 config:(id)a4 managedObjectContext:(id)a5;
- (BOOL)_passesSignatureHysteresis:(id)a3 config:(id)a4 managedObjectContext:(id)a5;
- (BOOL)_passesSignatureRandomDownsampling:(id)a3 config:(id)a4;
- (BOOL)_passesTotalCap:(id)a3 managedObjectContext:(id)a4;
- (BOOL)_request:(id)a3 passesHysteresis:(double)a4 countCap:(unint64_t)a5 usesSignature:(BOOL)a6 usesRequestClass:(BOOL)a7 managedObjectContext:(id)a8;
- (BOOL)isEqualToDampeningManager:(id)a3;
- (BOOL)saveToPersistentContainerWithErrorOut:(id *)a3;
- (BOOL)writeConfigurationPlistsToDirectory:(id)a3 createDirIfMissing:(BOOL)a4 errorOut:(id *)a5;
- (DRSDampeningConfiguration)defaultSignatureConfiguration;
- (DRSDampeningEnforcementSettings)enforcementSettings;
- (DRSDampeningManager)initWithIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6;
- (DRSDampeningManager)initWithPersistentContainer:(id)a3 enforcementSettings:(id)a4 defaultSignatureConfiguration:(id)a5 totalCap:(unint64_t)a6 teamDampeningConfigDict:(id)a7 resourceDampeningConfigDict:(id)a8;
- (DRSDampeningManager)initWithPersistentContainer:(id)a3 teamConfigurationDirectory:(id)a4;
- (NSDictionary)resourceDampeningConfigDict;
- (NSMutableDictionary)teamDampeningConfigDict;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)workQueue;
- (double)_24HoursHysteresis;
- (id)_ON_MOC_QUEUE_initWith:(id)a3 persistentContainer:(id)a4;
- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3;
- (id)_predicateForUndampenedRequestsMatchingSignatureOfRequest:(id)a3 afterDate:(id)a4;
- (id)_resourceConfigurationForRequest:(id)a3;
- (id)dampeningConfigurationForRequestSignature:(id)a3;
- (id)dampeningConfigurationForResource:(id)a3;
- (id)dampeningConfigurationForTeamID:(id)a3 issueCategory:(id)a4;
- (id)debugDescription;
- (id)jsonCompatibleDictRepresentation;
- (unint64_t)dampeningOutcomeForRequest:(id)a3;
- (unint64_t)totalCap;
- (void)setDefaultSignatureConfiguration:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setTotalCap:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation DRSDampeningManager

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = [(DRSDampeningManager *)self enforcementSettings];
  v5 = [v4 debugDescription];
  v6 = [v3 stringWithFormat:@"Enforcement settings:\n%@\n", v5];

  v7 = [(DRSDampeningManager *)self defaultSignatureConfiguration];

  if (v7)
  {
    v8 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
    v9 = [v8 debugDescription];
    [v6 appendFormat:@"Default signature configuration:\n--------------------------\n%@\n", v9];
  }
  v10 = [(DRSDampeningManager *)self teamDampeningConfigDict];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    [v6 appendString:@"Team Dampening Configuration(s):\n**************************\n\n"];
    v12 = [(DRSDampeningManager *)self teamDampeningConfigDict];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __39__DRSDampeningManager_debugDescription__block_invoke;
    v20[3] = &unk_263FCA7C8;
    id v21 = v6;
    [v12 enumerateKeysAndObjectsUsingBlock:v20];
  }
  v13 = [(DRSDampeningManager *)self resourceDampeningConfigDict];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    [v6 appendString:@"Resource Dampening Configuration(s):\n**************************\n\n"];
    v15 = [(DRSDampeningManager *)self resourceDampeningConfigDict];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __39__DRSDampeningManager_debugDescription__block_invoke_2;
    v18[3] = &unk_263FCA750;
    id v19 = v6;
    [v15 enumerateKeysAndObjectsUsingBlock:v18];
  }
  if ([(DRSDampeningManager *)self totalCap] == 0x7FFFFFFF)
  {
    v16 = (void *)[[NSString alloc] initWithFormat:@"Total request cap: %@\n", @"<No cap>"];
    [v6 appendString:v16];
  }
  else
  {
    objc_msgSend(v6, "appendFormat:", @"Total request cap: %lu\n", -[DRSDampeningManager totalCap](self, "totalCap"));
  }

  return v6;
}

void __39__DRSDampeningManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 debugDescription];
  [v4 appendFormat:@"%@:\n--------------------------\n%@", v5, v6];
}

void __39__DRSDampeningManager_debugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 debugDescription];
  [v4 appendFormat:@"%@:\n--------------------------\n%@", v5, v6];
}

- (id)jsonCompatibleDictRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(DRSDampeningManager *)self enforcementSettings];
  id v5 = [v4 jsonCompatibleDictRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"EnforcementSettings"];

  id v6 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
  v7 = [v6 jsonCompatibleDictRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"DefaultSignatureConfig"];

  if ([(DRSDampeningManager *)self totalCap] == 0x7FFFFFFF)
  {
    [v3 setObject:@"<No cap>" forKeyedSubscript:@"TotalCap"];
  }
  else
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DRSDampeningManager totalCap](self, "totalCap"));
    [v3 setObject:v8 forKeyedSubscript:@"TotalCap"];
  }
  v9 = [(DRSDampeningManager *)self teamDampeningConfigDict];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v11 = [(DRSDampeningManager *)self teamDampeningConfigDict];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke;
    v23[3] = &unk_263FCA7C8;
    id v24 = v10;
    id v12 = v10;
    [v11 enumerateKeysAndObjectsUsingBlock:v23];

    [v3 setObject:v12 forKeyedSubscript:@"TeamDampeningConfigurations"];
  }
  v13 = [(DRSDampeningManager *)self resourceDampeningConfigDict];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15 = [(DRSDampeningManager *)self resourceDampeningConfigDict];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke_2;
    id v21 = &unk_263FCA750;
    id v22 = v14;
    id v16 = v14;
    [v15 enumerateKeysAndObjectsUsingBlock:&v18];

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, @"ResourceDampeningConfigurations", v18, v19, v20, v21);
  }

  return v3;
}

void __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 jsonCompatibleDictRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 jsonCompatibleDictRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

+ (id)_entityName
{
  return @"DRSDampeningManagerMO";
}

- (BOOL)isEqualToDampeningManager:(id)a3
{
  v4 = (DRSDampeningManager *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_20;
  }
  if (self != v4)
  {
    unint64_t v6 = [(DRSDampeningManager *)self totalCap];
    if (v6 != [(DRSDampeningManager *)v5 totalCap]) {
      goto LABEL_20;
    }
    v7 = [(DRSDampeningManager *)self enforcementSettings];
    v8 = [(DRSDampeningManager *)v5 enforcementSettings];
    int v9 = [v7 isEqual:v8];

    if (!v9) {
      goto LABEL_20;
    }
    uint64_t v10 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
    if (v10
      && (uint64_t v11 = (void *)v10,
          [(DRSDampeningManager *)v5 defaultSignatureConfiguration],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      v13 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
      id v14 = [(DRSDampeningManager *)v5 defaultSignatureConfiguration];
      char v15 = [v13 isEqualToDampeningConfiguration:v14];

      if ((v15 & 1) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v17 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
      if (v17) {
        goto LABEL_17;
      }
      uint64_t v18 = [(DRSDampeningManager *)v5 defaultSignatureConfiguration];

      if (v18) {
        goto LABEL_20;
      }
    }
    uint64_t v19 = [(DRSDampeningManager *)self teamDampeningConfigDict];
    if (v19)
    {
      v20 = (void *)v19;
      id v21 = [(DRSDampeningManager *)v5 teamDampeningConfigDict];

      if (v21)
      {
        id v22 = [(DRSDampeningManager *)self teamDampeningConfigDict];
        v23 = [(DRSDampeningManager *)v5 teamDampeningConfigDict];
        char v24 = [v22 isEqualToDictionary:v23];

        if (v24)
        {
LABEL_15:
          v25 = [(DRSDampeningManager *)self resourceDampeningConfigDict];
          v26 = [(DRSDampeningManager *)v5 resourceDampeningConfigDict];
          char v16 = [v25 isEqualToDictionary:v26];

LABEL_18:
          goto LABEL_21;
        }
LABEL_20:
        char v16 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v17 = [(DRSDampeningManager *)self teamDampeningConfigDict];
    if (!v17)
    {
      v27 = [(DRSDampeningManager *)v5 teamDampeningConfigDict];

      if (!v27) {
        goto LABEL_15;
      }
      goto LABEL_20;
    }
LABEL_17:
    v25 = (void *)v17;
    char v16 = 0;
    goto LABEL_18;
  }
  char v16 = 1;
LABEL_21:

  return v16;
}

- (BOOL)_hasRequestsRecordCountGreaterThanOrEqualToThreshold:(unint64_t)a3 matchingPredicate:(id)a4 inContext:(id)a5 filterToObjectsMatchingClassOfRequest:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    id v12 = (__objc2_class *)objc_opt_class();
    uint64_t v24 = 0;
    v13 = (id *)&v24;
    id v14 = &v24;
  }
  else
  {
    id v12 = DRSRequest;
    uint64_t v23 = 0;
    v13 = (id *)&v23;
    id v14 = &v23;
  }
  unint64_t v15 = -[__objc2_class requestCountForFilterPredicate:context:fetchLimit:errorOut:](v12, "requestCountForFilterPredicate:context:fetchLimit:errorOut:", v9, v10, a3 + 1, v14, v23, v24);
  id v16 = *v13;
  if (v16)
  {
    uint64_t v17 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v17))
    {
      uint64_t v18 = [v16 localizedDescription];
      uint64_t v19 = (void *)v18;
      v20 = @"Unknown";
      if (v18) {
        v20 = (__CFString *)v18;
      }
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ThresholdCheckError", "Encountered error while trying to check threshold count: %{public}@", buf, 0xCu);
    }
    BOOL v21 = 0;
  }
  else
  {
    BOOL v21 = v15 >= a3;
  }

  return v21;
}

- (DRSDampeningManager)initWithIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v11 = objc_alloc_init(DRSDampeningEnforcementSettings);
  id v12 = [(id)objc_opt_class() defaultResourceConfigurations:v9 isSeed:v8 isCarrier:v7 platform:v6];
  v13 = [(id)objc_opt_class() defaultTeamConfigurations:v9 isSeed:v8 isCarrier:v7 platform:v6];
  id v14 = +[DRSDampeningConfiguration defaultSignatureDampeningConfiguration];
  unint64_t v15 = -[DRSDampeningManager initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:](self, "initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:", 0, v11, v14, [(id)objc_opt_class() defaultTotalCapForCurrentDevice], v13, v12);

  return v15;
}

- (DRSDampeningManager)initWithPersistentContainer:(id)a3 enforcementSettings:(id)a4 defaultSignatureConfiguration:(id)a5 totalCap:(unint64_t)a6 teamDampeningConfigDict:(id)a7 resourceDampeningConfigDict:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (v17)
  {
    id v36 = v16;
    id v21 = v15;
    if (v19
      && ([v19 objectForKeyedSubscript:kDRSRequestResourceTailspin],
          id v22 = objc_claimAutoreleasedReturnValue(),
          v22,
          v22))
    {
      if (a6 != 0x7FFFFFFF && a6)
      {
        v37.receiver = self;
        v37.super_class = (Class)DRSDampeningManager;
        v28 = [(DRSDampeningManager *)&v37 init];
        v29 = v28;
        id v15 = v21;
        if (v28)
        {
          objc_storeStrong((id *)&v28->_persistentContainer, a3);
          objc_storeStrong((id *)&v29->_enforcementSettings, a4);
          objc_storeStrong((id *)&v29->_defaultSignatureConfiguration, a5);
          v29->_totalCap = a6;
          uint64_t v30 = [v18 mutableCopy];
          teamDampeningConfigDict = v29->_teamDampeningConfigDict;
          v29->_teamDampeningConfigDict = (NSMutableDictionary *)v30;

          uint64_t v32 = [v20 mutableCopy];
          resourceDampeningConfigDict = v29->_resourceDampeningConfigDict;
          v29->_resourceDampeningConfigDict = (NSDictionary *)v32;

          dispatch_queue_t v34 = dispatch_queue_create("DRSDampeningManager work queue", 0);
          workQueue = v29->_workQueue;
          v29->_workQueue = (OS_dispatch_queue *)v34;
        }
        self = v29;
        uint64_t v24 = self;
      }
      else
      {
        uint64_t v23 = DPLogHandle_DampeningManagerError();
        id v15 = v21;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningManagerInit", "Invalid total cap", buf, 2u);
        }

        uint64_t v24 = 0;
      }
    }
    else
    {
      v25 = DPLogHandle_DampeningManagerError();
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningManagerInit", "Invalid resource dampening configuration", buf, 2u);
      }

      uint64_t v24 = 0;
      id v15 = v21;
    }
    id v16 = v36;
  }
  else
  {
    v26 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningManagerInit", "Invalid default signature configuration", buf, 2u);
    }

    uint64_t v24 = 0;
  }

  return v24;
}

- (id)_predicateForUndampenedRequestsMatchingSignatureOfRequest:(id)a3 afterDate:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x263F08A98];
  id v7 = a4;
  BOOL v8 = v7;
  if (v5)
  {
    uint64_t v9 = [v5 teamID];
    id v10 = [v5 issueCategory];
    id v11 = [v6 predicateWithFormat:@"(requestDate >= %@) AND (requestState < %llu OR requestState > %llu) AND (teamID == %@) AND (issueCategory == %@)", v8, 4096, 4103, v9, v10];

    BOOL v8 = (void *)v9;
  }
  else
  {
    id v11 = [v6 predicateWithFormat:@"(requestDate >= %@) AND (requestState < %llu OR requestState > %llu)", v7, 4096, 4103];
  }

  return v11;
}

- (BOOL)_request:(id)a3 passesHysteresis:(double)a4 countCap:(unint64_t)a5 usesSignature:(BOOL)a6 usesRequestClass:(BOOL)a7 managedObjectContext:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a8;
  if (a4 == 0.0)
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    id v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-a4];
    if (v10) {
      id v17 = v14;
    }
    else {
      id v17 = 0;
    }
    id v18 = [(DRSDampeningManager *)self _predicateForUndampenedRequestsMatchingSignatureOfRequest:v17 afterDate:v16];
    if (v9) {
      id v19 = v14;
    }
    else {
      id v19 = 0;
    }
    LODWORD(a5) = ![(DRSDampeningManager *)self _hasRequestsRecordCountGreaterThanOrEqualToThreshold:a5 matchingPredicate:v18 inContext:v15 filterToObjectsMatchingClassOfRequest:v19];
  }
  return a5;
}

- (BOOL)_passesResourceHysteresis:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DRSDampeningManager *)self enforcementSettings];
  char v12 = [v11 enforcesResourceHysteresis];

  if ((v12 & 1) == 0)
  {
    id v14 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v14))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceHysteresisSkipped", "Resource hysteresis is disabled", (uint8_t *)&v19, 2u);
    }
    goto LABEL_8;
  }
  if (!v9)
  {
    char v13 = 1;
    goto LABEL_10;
  }
  [v9 hysteresis];
  char v13 = 1;
  if (!-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, 1, 0, 1, v10))
  {
    id v14 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v14))
    {
      id v15 = [v8 debugDescription];
      id v16 = [(id)objc_opt_class() requiredSystemResourceName];
      [v9 hysteresis];
      int v19 = 138543874;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v16;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestResourceRejection", "Rejecting %{public}@ due to falling within resource (%{public}@) window of %.1f seconds", (uint8_t *)&v19, 0x20u);
    }
LABEL_8:
    char v13 = v12 ^ 1;
  }
LABEL_10:

  return v13;
}

- (BOOL)_passesSignatureHysteresis:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DRSDampeningManager *)self enforcementSettings];
  char v12 = [v11 enforcesSignatureHysteresis];

  if ((v12 & 1) == 0)
  {
    id v15 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureHysteresisSkipped", "Signature hysteresis is disabled", (uint8_t *)&v19, 2u);
    }
LABEL_6:
    char v14 = v12 ^ 1;

    goto LABEL_7;
  }
  [v9 hysteresis];
  if (v13 != 0.0)
  {
    [v9 hysteresis];
    char v14 = 1;
    if (-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, 1, 1, 0, v10))
    {
      goto LABEL_7;
    }
    id v15 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v15))
    {
      uint64_t v17 = [v8 debugDescription];
      [v9 hysteresis];
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2048;
      uint64_t v22 = v18;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureHysteresisRejection", "Rejecting %{public}@ due to falling within signature hysteresis window of %.1f seconds", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_6;
  }
  char v14 = 1;
LABEL_7:

  return v14;
}

- (double)_24HoursHysteresis
{
  return 86400.0;
}

- (BOOL)_passesSignatureCap:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DRSDampeningManager *)self enforcementSettings];
  char v12 = [v11 enforcesSignatureCap];

  if ((v12 & 1) == 0)
  {
    char v14 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v14))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureCapSkipped", "Signature cap is disabled", (uint8_t *)&v18, 2u);
    }
    goto LABEL_9;
  }
  if ([v9 countCap] != 0x7FFFFFFF)
  {
    [(DRSDampeningManager *)self _24HoursHysteresis];
    char v13 = 1;
    if (-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, [v9 countCap], 1, 0, v10, v15))
    {
      goto LABEL_10;
    }
    char v14 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v14))
    {
      id v16 = [v8 debugDescription];
      int v18 = 138543618;
      int v19 = v16;
      __int16 v20 = 2048;
      uint64_t v21 = [v9 countCap];
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureCapRejection", "Rejecting %{public}@ due to reaching signature cap of %llu within the last 24 hours.", (uint8_t *)&v18, 0x16u);
    }
LABEL_9:
    char v13 = v12 ^ 1;

    goto LABEL_10;
  }
  char v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)_passesResourceCap:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DRSDampeningManager *)self enforcementSettings];
  char v12 = [v11 enforcesResourceCap];

  if ((v12 & 1) == 0)
  {
    char v14 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v14))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceCapSkipped", "Signature cap is disabled", (uint8_t *)&v18, 2u);
    }
    goto LABEL_9;
  }
  if ([v9 countCap] != 0x7FFFFFFF)
  {
    [(DRSDampeningManager *)self _24HoursHysteresis];
    char v13 = 1;
    if (-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, [v9 countCap], 0, 1, v10, v15))
    {
      goto LABEL_10;
    }
    char v14 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v14))
    {
      id v16 = [v8 debugDescription];
      int v18 = 138543618;
      int v19 = v16;
      __int16 v20 = 2048;
      uint64_t v21 = [v9 countCap];
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceCapRejection", "Rejecting %{public}@ due to reaching resource cap of %llu within the last 24 hours.", (uint8_t *)&v18, 0x16u);
    }
LABEL_9:
    char v13 = v12 ^ 1;

    goto LABEL_10;
  }
  char v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)_passesTotalCap:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DRSDampeningManager *)self enforcementSettings];
  char v9 = [v8 enforcesTotalCap];

  if ((v9 & 1) == 0)
  {
    char v12 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v12))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TotalCapSkipped", "Total cap is disabled", (uint8_t *)&v15, 2u);
    }
    goto LABEL_8;
  }
  [(DRSDampeningManager *)self _24HoursHysteresis];
  if (![(DRSDampeningManager *)self _request:0 passesHysteresis:[(DRSDampeningManager *)self totalCap] countCap:0 usesSignature:0 usesRequestClass:v7 managedObjectContext:v10])
  {
    char v12 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v12))
    {
      char v13 = [v6 debugDescription];
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2048;
      unint64_t v18 = [(DRSDampeningManager *)self totalCap];
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TotalCapRejection", "Rejecting %{public}@ due to reaching cap of %llu within the last 24 hours.", (uint8_t *)&v15, 0x16u);
    }
LABEL_8:
    char v11 = v9 ^ 1;

    goto LABEL_9;
  }
  char v11 = 1;
LABEL_9:

  return v11;
}

+ (BOOL)passesAcceptanceRate:(double)a3
{
  if (a3 >= 1.0) {
    return 1;
  }
  if (a3 <= 0.0) {
    return 0;
  }
  return a3 * 1000.0 >= (double)arc4random_uniform(0x3E8u);
}

- (BOOL)_passesSignatureRandomDownsampling:(id)a3 config:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DRSDampeningManager *)self enforcementSettings];
  char v9 = [v8 enforcesSignatureDownsampling];

  if ((v9 & 1) == 0)
  {
    char v12 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v12))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureDownsamplingSkipped", "Downsampling is disabled", (uint8_t *)&v16, 2u);
    }
    goto LABEL_8;
  }
  double v10 = objc_opt_class();
  [v7 acceptanceRate];
  if ((objc_msgSend(v10, "passesAcceptanceRate:") & 1) == 0)
  {
    char v12 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v12))
    {
      char v13 = [v6 debugDescription];
      [v7 acceptanceRate];
      int v16 = 138543618;
      __int16 v17 = v13;
      __int16 v18 = 2048;
      double v19 = v14 * 100.0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureDownsamplingRejection", "Rejecting %{public}@ due failing to pass the acceptance threshold of %.1f%%", (uint8_t *)&v16, 0x16u);
    }
LABEL_8:
    char v11 = v9 ^ 1;

    goto LABEL_9;
  }
  char v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)_passesResourceRandomDownsampling:(id)a3 config:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DRSDampeningManager *)self enforcementSettings];
  char v9 = [v8 enforcesResourceDownsampling];

  if ((v9 & 1) == 0)
  {
    char v12 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v12))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceDownsamplingSkipped", "Downsampling is disabled", (uint8_t *)&v16, 2u);
    }
    goto LABEL_8;
  }
  double v10 = objc_opt_class();
  [v7 acceptanceRate];
  if ((objc_msgSend(v10, "passesAcceptanceRate:") & 1) == 0)
  {
    char v12 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v12))
    {
      char v13 = [v6 debugDescription];
      [v7 acceptanceRate];
      int v16 = 138543618;
      __int16 v17 = v13;
      __int16 v18 = 2048;
      double v19 = v14 * 100.0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureDownsamplingRejection", "Rejecting %{public}@ due failing to pass the acceptance threshold of %.1f%%", (uint8_t *)&v16, 0x16u);
    }
LABEL_8:
    char v11 = v9 ^ 1;

    goto LABEL_9;
  }
  char v11 = 1;
LABEL_9:

  return v11;
}

- (id)dampeningConfigurationForResource:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(DRSDampeningManager *)self resourceDampeningConfigDict];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_resourceConfigurationForRequest:(id)a3
{
  id v4 = [(id)objc_opt_class() requiredSystemResourceName];
  id v5 = [(DRSDampeningManager *)self dampeningConfigurationForResource:v4];

  return v5;
}

- (unint64_t)dampeningOutcomeForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(DRSDampeningManager *)self persistentContainer];

  if (v5)
  {
    uint64_t v17 = 0;
    __int16 v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    id v6 = [(DRSDampeningManager *)self persistentContainer];
    id v7 = (void *)[v6 newBackgroundContext];

    id v8 = (void *)MEMORY[0x21050DCE0]();
    char v9 = [(DRSDampeningManager *)self workQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__DRSDampeningManager_dampeningOutcomeForRequest___block_invoke;
    v13[3] = &unk_263FCA7F0;
    v13[4] = self;
    id v14 = v4;
    id v10 = v7;
    id v15 = v10;
    int v16 = &v17;
    dispatch_sync(v9, v13);

    unint64_t v11 = v18[3];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    unint64_t v11 = 8;
  }

  return v11;
}

void __50__DRSDampeningManager_dampeningOutcomeForRequest___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _resourceConfigurationForRequest:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_5;
  }
  id v8 = v2;
  if (![*(id *)(a1 + 32) _passesResourceHysteresis:*(void *)(a1 + 40) config:v2 managedObjectContext:*(void *)(a1 + 48)])
  {
    uint64_t v6 = 1;
LABEL_15:
    v2 = v8;
LABEL_16:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;

    return;
  }
  if (![*(id *)(a1 + 32) _passesResourceCap:*(void *)(a1 + 40) config:v8 managedObjectContext:*(void *)(a1 + 48)])
  {
    uint64_t v6 = 2;
    goto LABEL_15;
  }
  char v3 = [*(id *)(a1 + 32) _passesResourceRandomDownsampling:*(void *)(a1 + 40) config:v8];
  v2 = v8;
  if ((v3 & 1) == 0)
  {
    uint64_t v6 = 3;
    goto LABEL_16;
  }
LABEL_5:

  id v9 = [*(id *)(a1 + 32) dampeningConfigurationForRequestSignature:*(void *)(a1 + 40)];
  if (objc_msgSend(*(id *)(a1 + 32), "_passesSignatureHysteresis:config:managedObjectContext:", *(void *)(a1 + 40)))
  {
    if ([*(id *)(a1 + 32) _passesSignatureCap:*(void *)(a1 + 40) config:v9 managedObjectContext:*(void *)(a1 + 48)])
    {
      if ([*(id *)(a1 + 32) _passesSignatureRandomDownsampling:*(void *)(a1 + 40) config:v9])
      {

        if ([*(id *)(a1 + 32) _passesTotalCap:*(void *)(a1 + 40) managedObjectContext:*(void *)(a1 + 48)])
        {
          id v4 = DPLogHandle_DampeningManager();
          if (os_signpost_enabled(v4))
          {
            id v5 = [*(id *)(a1 + 40) debugDescription];
            *(_DWORD *)buf = 138543362;
            unint64_t v11 = v5;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptingRequest", "Accepted %{public}@", buf, 0xCu);
          }
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        }
        else
        {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 7;
        }
        return;
      }
      uint64_t v7 = 6;
    }
    else
    {
      uint64_t v7 = 5;
    }
  }
  else
  {
    uint64_t v7 = 4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
}

+ (unint64_t)defaultTotalCapForIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5
{
  unint64_t v5 = 20;
  if (a4 || a5) {
    unint64_t v5 = 50;
  }
  if (a3) {
    return 100;
  }
  else {
    return v5;
  }
}

+ (unint64_t)defaultTotalCapForCurrentDevice
{
  char v3 = +[DRSSystemProfile sharedInstance];
  unint64_t v4 = objc_msgSend(a1, "defaultTotalCapForIsInternal:isSeed:isCarrier:", objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), objc_msgSend(v3, "isCarrier"));

  return v4;
}

+ (id)defaultTeamConfigurationForTeamForCurrentDevice:(id)a3 teamConfigurationDirectory:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 defaultTeamConfigurationsForCurrentDevice:a4];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

+ (id)defaultTeamConfigurationForTeam:(id)a3 isInternal:(BOOL)a4 isSeed:(BOOL)a5 isCarrier:(BOOL)a6 platform:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  char v13 = [a1 defaultTeamConfigurations:v10 isSeed:v9 isCarrier:v8 platform:v7];
  id v14 = [v13 objectForKeyedSubscript:v12];

  return v14;
}

+ (id)_nandTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  id v6 = 0;
  if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
  {
    uint64_t v7 = +[DRSDampeningConfiguration nandDefaultConfiguration];
    id v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:v7 issueCategoryToConfigurationDict:0];
  }

  return v6;
}

+ (id)_memoryToolsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = a3;
  if (a3 || a4)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v9 = +[DRSDampeningConfiguration memoryToolsDefaultConfiguration];
    [v8 setObject:v9 forKeyedSubscript:kDRSDMMemoryToolsMemgraphDmonThresholdCategory];

    if (v6) {
      +[DRSDampeningConfiguration memoryToolsInternalMemgraphOverTimeConfiguration];
    }
    else {
    BOOL v10 = +[DRSDampeningConfiguration memoryToolsDefaultConfiguration];
    }
    [v8 setObject:v10 forKeyedSubscript:kDRSDMMemoryToolsMemgraphOverTimeCategory];

    uint64_t v7 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v8];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_nonWatchOShangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v5)
  {
    uint64_t v7 = +[DRSDampeningConfiguration hangTracerNonWatchOSInternalDownsamplingConfiguration];
    id v8 = +[DRSDampeningConfiguration hangTracerNonWatchOSInternalNoDownsamplingConfiguration];
    [v6 setObject:v8 forKeyedSubscript:kDRSDMHangTracerFirstPartyMicroHangIssueCategory];
    [v6 setObject:v7 forKeyedSubscript:kDRSDMHangTracerFirstPartyNormalHangIssueCategory];
    [v6 setObject:v8 forKeyedSubscript:kDRSDMHangTracerFirstPartyLongHangIssueCategory];
    [v6 setObject:v7 forKeyedSubscript:kDRSDMHangTracerThirdPartyNormalHangIssueCategory];
    [v6 setObject:v8 forKeyedSubscript:kDRSDMHangTracerThirdPartyLongHangIssueCategory];
    BOOL v9 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v6];
  }
  else
  {
    if (v4) {
      +[DRSDampeningConfiguration hangTracerNonWatchOSSeedConfiguration];
    }
    else {
    BOOL v10 = +[DRSDampeningConfiguration hangTracerNonWatchOSCustomerConfiguration];
    }
    [v6 setObject:v10 forKeyedSubscript:kDRSDMHangTracerFirstPartyLongHangIssueCategory];

    BOOL v9 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v6];
  }

  return v9;
}

+ (id)_watchOS_hangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4
{
  if (a3 || a4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v6 = +[DRSDampeningConfiguration hangTracerWatchOSInternalOrSeedDownsamplingConfiguration];
    uint64_t v7 = +[DRSDampeningConfiguration hangTracerWatchOSInternalOrSeedNoDownsamplingConfiguration];
    [v5 setObject:v6 forKeyedSubscript:kDRSDMHangTracerFirstPartyNormalHangIssueCategory];
    [v5 setObject:v7 forKeyedSubscript:kDRSDMHangTracerFirstPartyLongHangIssueCategory];
    BOOL v4 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v5];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)_hangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v7 = 0;
  switch(a6)
  {
    case 2u:
    case 4u:
    case 6u:
      uint64_t v7 = objc_msgSend(a1, "_nonWatchOShangTracerTeamConfiguration:isSeed:", a3, a4, a5);
      break;
    case 3u:
      uint64_t v7 = objc_msgSend(a1, "_watchOS_hangTracerTeamConfiguration:isSeed:", a3, a4, a5);
      break;
    default:
      break;
  }

  return v7;
}

+ (id)_sentryTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  if (a5)
  {
    id v6 = 0;
  }
  else if (a6 == 1 && a3 || (id v6 = 0, a3 || a4) && a6 == 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = +[DRSDampeningConfiguration sentryAppLaunchConfiguration];
    [v7 setObject:v8 forKeyedSubscript:kDRSDMSentryAppLaunchIssueCategory];

    id v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v7];
  }

  return v6;
}

+ (id)_coreAudioTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && a3)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = +[DRSDampeningConfiguration coreAudioOverloadConfiguration];
    [v7 setObject:v8 forKeyedSubscript:kDRSDMCoreAudioOverloadIssueCategory];

    BOOL v9 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)_drmTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  if (!a5)
  {
    int v7 = a6;
    BOOL v8 = a3;
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if ((v7 - 1) < 3) {
      goto LABEL_6;
    }
    if (v7 == 4) {
      goto LABEL_8;
    }
    if (v7 == 6)
    {
LABEL_6:
      BOOL v10 = +[DRSDampeningConfiguration drmResourceUsageConfiguration];
      [v9 setObject:v10 forKeyedSubscript:kDRSDMDRMResourceUsageIssueCategory];

      if ((v7 - 1) < 4 || v7 == 6)
      {
LABEL_8:
        if (v8)
        {
          unint64_t v11 = +[DRSDampeningConfiguration drmRogueTaskConfiguration];
          [v9 setObject:v11 forKeyedSubscript:kDRSDMDRMRogueTaskIssueCategory];
        }
      }
    }
    if ([v9 count]) {
      BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v9];
    }
    else {
      BOOL v6 = 0;
    }

    goto LABEL_14;
  }
  BOOL v6 = 0;
LABEL_14:

  return v6;
}

+ (id)_coreAnimationTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  if (a6 <= 6u && ((1 << a6) & 0x5C) != 0)
  {
    if (a5)
    {
LABEL_4:
      BOOL v6 = 0;
      goto LABEL_11;
    }
    if (a6 == 2)
    {
      if (!a3 && !a4) {
        goto LABEL_4;
      }
    }
    else if (!a3)
    {
      goto LABEL_4;
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v8 = +[DRSDampeningConfiguration caHitchesConfiguration];
    [v7 setObject:v8 forKeyedSubscript:kDRSDMCoreAnimationHitchesCategory];

    BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v7];
  }
LABEL_11:

  return v6;
}

+ (id)_skylightTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  if ((a3 || a4) && a6 == 1 && !a5)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v10 = +[DRSDampeningConfiguration skylightHitchesConfiguration];
    [v9 setObject:v10 forKeyedSubscript:kDRSDMSkylightHitchesCategory];

    BOOL v8 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v9];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_rapidTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && !a5)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v9 = +[DRSDampeningConfiguration rapidMicroDiagnosticsConfiguration];
    [v8 setObject:v9 forKeyedSubscript:kDRSDMRapidMicroDiagnosticIssueCategory[0]];

    id v7 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_nandGBBTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
  {
    BOOL v6 = 0;
    if (a3 && !a5)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v8 = +[DRSDampeningConfiguration nandAutoGBBSweepConfiguration];
      [v7 setObject:v8 forKeyedSubscript:kDRSDMNandAutoGBBSweepIssueCategory];

      BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v7];
    }
  }

  return v6;
}

+ (id)_workflowResponsivenessDampeningConfiguration:(BOOL)a3
{
  if (a3) {
    +[DRSDampeningConfiguration spindumpWorkflowResponsivenessConfiguration_Internal];
  }
  else {
  char v3 = +[DRSDampeningConfiguration spindumpWorkflowResponsivenessConfiguration_External];
  }

  return v3;
}

+ (id)_spindumpTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  if (a5)
  {
    BOOL v6 = 0;
  }
  else
  {
    int v7 = a6;
    BOOL v8 = a3;
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v7 == 1)
    {
      if (v8) {
        +[DRSDampeningConfiguration spindumpMacOSSlowHIDConfiguration_Internal];
      }
      else {
      unint64_t v11 = +[DRSDampeningConfiguration spindumpMacOSSlowHIDConfiguration_SeedRC];
      }
      [v10 setObject:v11 forKeyedSubscript:kDRSDMSpindumpSlowHIDIssueCategory];
    }
    id v12 = [a1 _workflowResponsivenessDampeningConfiguration:v8];
    [v10 setObject:v12 forKeyedSubscript:kDRSDMSpindumpWorkflowResponsivenessCategory];

    BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v10];
  }

  return v6;
}

+ (id)_ppsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && !a5)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v9 = +[DRSDampeningConfiguration ppsArchiveConfiguration];
    [v8 setObject:v9 forKeyedSubscript:kDRSDMPPSArchiveIssueCategory];

    id v10 = +[DRSDampeningConfiguration ppsCEArchiveConfiguration];
    [v8 setObject:v10 forKeyedSubscript:kDRSDMPPSCEArchiveIssueCategory];

    unint64_t v11 = +[DRSDampeningConfiguration ppsXCArchiveConfiguration];
    [v8 setObject:v11 forKeyedSubscript:kDRSDMPPSXCArchiveIssueCategory[0]];

    id v12 = +[DRSDampeningConfiguration ppsSafeguardArchiveConfiguration];
    [v8 setObject:v12 forKeyedSubscript:kDRSDMPPSSafeguardArchiveIssueCategory[0]];

    char v13 = +[DRSDampeningConfiguration ppsBGArchiveConfiguration];
    [v8 setObject:v13 forKeyedSubscript:kDRSDMPPSBGArchiveIssueCategory];

    id v14 = +[DRSDampeningConfiguration ppsUpgradeArchiveConfiguration];
    [v8 setObject:v14 forKeyedSubscript:kDRSDMPPSUpgradeArchiveIssueCategory];

    int v7 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v8];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)_watchdogdTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  BOOL v7 = (a6 - 1) < 4 || a6 == 6;
  if (v7 && a3 && !a5)
  {
    id v8 = +[DRSDampeningConfiguration watchdogdDefaultConfiguration];
    BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:v8 issueCategoryToConfigurationDict:0];
  }

  return v6;
}

+ (id)_mailTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  v15[1] = *MEMORY[0x263EF8340];
  if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
  {
    if (a5)
    {
      BOOL v6 = 0;
    }
    else
    {
      BOOL v7 = a4;
      uint64_t v14 = kDRSDMMailSQLQueryPerformanceIssueCategory;
      id v9 = +[DRSDampeningConfiguration sqlQueryPerformanceConfiguration];
      v15[0] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      unint64_t v11 = (void *)[v10 mutableCopy];

      if (a3 || v7)
      {
        id v12 = +[DRSDampeningConfiguration mailIssueCategoryConfiguration];
        [v11 setObject:v12 forKeyedSubscript:kDRSDMMailMessageListIssueCategory];
        [v11 setObject:v12 forKeyedSubscript:kDRSDMMailConversationViewIssueCategory];
        [v11 setObject:v12 forKeyedSubscript:kDRSDMMailMiscResponsivenessIssueCategory];
      }
      BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v11];
    }
  }

  return v6;
}

+ (id)_RMETeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  v13[1] = *MEMORY[0x263EF8340];
  if ((a3 || a4) && a6 == 6 && !a5)
  {
    id v9 = +[DRSDampeningConfiguration RMEIssueCategoryConfiguration];
    uint64_t v12 = kDRSDMRMEMemoryExceptionIssueCategory;
    v13[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v8 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_abcTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && (a3 || a4 || a5))
  {
    id v8 = +[DRSDampeningConfiguration abcDefaultConfiguration];
    BOOL v7 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:v8 issueCategoryToConfigurationDict:0];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)_newsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  v11[1] = *MEMORY[0x263EF8340];
  if (a3 && !a5 && (a6 - 3) >= 0xFFFFFFFE)
  {
    uint64_t v10 = kDRSDMNewsSlowFeedIssueCategory;
    BOOL v7 = +[DRSDampeningConfiguration newsConfiguration];
    v11[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

    BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v8];
  }

  return v6;
}

+ (id)_libtraceTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  v12[2] = *MEMORY[0x263EF8340];
  if (a3 && !a5)
  {
    v11[0] = kDRSDMLibtraceQuarantineIssueCategory;
    BOOL v7 = +[DRSDampeningConfiguration libtraceQuarantineConfiguration];
    v11[1] = kDRSDMLibtraceLoggingSampleIssueCategory;
    v12[0] = v7;
    id v8 = +[DRSDampeningConfiguration libtraceLoggingSampleConfiguration];
    v12[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

    BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v9];
  }

  return v6;
}

+ (id)_spotlightTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  v11[1] = *MEMORY[0x263EF8340];
  if (a3 && !a5)
  {
    BOOL v6 = 0;
    if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
    {
      uint64_t v10 = kDRSDMSpotlightInternalWatchdogIssueCategory;
      BOOL v7 = +[DRSDampeningConfiguration spotlightInternalWatchdogConfiguration];
      v11[0] = v7;
      id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

      BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v8];
    }
  }

  return v6;
}

+ (id)_softwareUpdateTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  v11[1] = *MEMORY[0x263EF8340];
  if (!a5 && a3 && a6 == 1)
  {
    uint64_t v10 = kDRSDMSoftwareUpdateLogoutInterruptedIssueCategory;
    BOOL v7 = +[DRSDampeningConfiguration softwareUpdateLogoutInterruptedConfiguration];
    v11[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

    BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v8];
  }

  return v6;
}

+ (id)_appIntentsServicesTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6 = 0;
  v11[1] = *MEMORY[0x263EF8340];
  if (a3 && !a5)
  {
    if (a6 == 4 || a6 == 2)
    {
      uint64_t v10 = kDRSDMAppIntentsServicesSlowActivityCategory;
      BOOL v7 = +[DRSDampeningConfiguration appIntentsServicesSlowActivityConfiguration];
      v11[0] = v7;
      id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

      BOOL v6 = [[DRSTeamDampeningConfiguration alloc] initWithDefaultConfiguration:0 issueCategoryToConfigurationDict:v8];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (id)defaultTeamConfigurationsForCurrentDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[DRSSystemProfile sharedInstance];
  id v10 = 0;
  BOOL v6 = objc_msgSend(a1, "defaultTeamConfigurations:isSeed:isCarrier:platform:plistDirectoryPath:errorOut:", objc_msgSend(v5, "isInternal"), objc_msgSend(v5, "isSeed"), objc_msgSend(v5, "isCarrier"), objc_msgSend(v5, "platform"), v4, &v10);

  id v7 = v10;
  if (v7)
  {
    id v8 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamConfigFetchFailed", "Failed due to error %{public}@", buf, 0xCu);
    }
  }

  return v6;
}

+ (id)defaultTeamConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v12 = [a1 _nandTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v12) {
    [v11 setObject:v12 forKeyedSubscript:kDRSDMNandTeamID[0]];
  }

  uint64_t v13 = [a1 _hangTracerTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v13) {
    [v11 setObject:v13 forKeyedSubscript:kDRSDMHangTracerTeamID];
  }

  uint64_t v14 = [a1 _memoryToolsTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v14) {
    [v11 setObject:v14 forKeyedSubscript:kDRSDMMemoryToolsTeamID];
  }

  id v15 = [a1 _sentryTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v15) {
    [v11 setObject:v15 forKeyedSubscript:kDRSDMSentryTeamID];
  }

  int v16 = [a1 _coreAudioTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v16) {
    [v11 setObject:v16 forKeyedSubscript:kDRSDMCoreAudioTeamID];
  }

  uint64_t v17 = [a1 _spindumpTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v17) {
    [v11 setObject:v17 forKeyedSubscript:kDRSDMSpindumpTeamID];
  }

  __int16 v18 = [a1 _drmTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v18) {
    [v11 setObject:v18 forKeyedSubscript:kDRSDMDRMTeamID];
  }

  uint64_t v19 = [a1 _coreAnimationTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v19) {
    [v11 setObject:v19 forKeyedSubscript:kDRSDMCoreAnimationTeamID];
  }

  uint64_t v20 = [a1 _skylightTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v20) {
    [v11 setObject:v20 forKeyedSubscript:kDRSDMSkylightTeamID];
  }

  uint64_t v21 = [a1 _watchdogdTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v21) {
    [v11 setObject:v21 forKeyedSubscript:kDRSDMWatchdogdTeamID];
  }

  uint64_t v22 = [a1 _rapidTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v22) {
    [v11 setObject:v22 forKeyedSubscript:kDRSDMRapidTeamID[0]];
  }

  uint64_t v23 = [a1 _ppsTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v23) {
    [v11 setObject:v23 forKeyedSubscript:kDRSDMPPSTeamID[0]];
  }

  uint64_t v24 = [a1 _nandGBBTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v24) {
    [v11 setObject:v24 forKeyedSubscript:kDRSDMNandGBBTeamID];
  }

  uint64_t v25 = [a1 _mailTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v25) {
    [v11 setObject:v25 forKeyedSubscript:kDRSDMMailTeamID];
  }

  v26 = [a1 _RMETeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v26) {
    [v11 setObject:v26 forKeyedSubscript:kDRSDMReportMemoryExceptionTeamID];
  }

  uint64_t v27 = [a1 _abcTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v27) {
    [v11 setObject:v27 forKeyedSubscript:kDRSDMAutoBugCaptureTeamID];
  }

  v28 = [a1 _newsTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v28) {
    [v11 setObject:v28 forKeyedSubscript:kDRSDMNewsTeamID];
  }

  v29 = [a1 _libtraceTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v29) {
    [v11 setObject:v29 forKeyedSubscript:kDRSDMLibtraceTeamID];
  }

  uint64_t v30 = [a1 _spotlightTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v30) {
    [v11 setObject:v30 forKeyedSubscript:kDRSDMSpotlightTeamID];
  }

  v31 = [a1 _softwareUpdateTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v31) {
    [v11 setObject:v31 forKeyedSubscript:kDRSDMSoftwareUpdateTeamID];
  }

  uint64_t v32 = [a1 _appIntentsServicesTeamConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v32) {
    [v11 setObject:v32 forKeyedSubscript:kDRSDMAppIntentsServicesTeamID];
  }

  if (![v11 count])
  {

    id v11 = 0;
  }

  return v11;
}

+ (id)defaultTeamConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6 plistDirectoryPath:(id)a7 errorOut:(id *)a8
{
  uint64_t v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  BOOL v12 = a3;
  id v14 = a7;
  id v15 = [a1 defaultTeamConfigurations:v12 isSeed:v11 isCarrier:v10 platform:v9];
  int v16 = v15;
  if (v14)
  {
    uint64_t v17 = +[DRSTeamDampeningConfiguration teamIdToTeamDampeningConfigFromPlistDirectoryPath:v14 errorOut:a8];
    if (v17)
    {
      id v18 = (id)[v16 mutableCopy];
      [v18 addEntriesFromDictionary:v17];
    }
    else
    {
      id v18 = v16;
    }
  }
  else
  {
    id v18 = v15;
  }

  return v18;
}

+ (id)_defaultTailspinConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v6 = [[DRSDampeningConfiguration alloc] initWithHysteresis:0x7FFFFFFFLL cap:300.0 acceptanceRate:1.0];

  return v6;
}

+ (id)defaultResourceConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v12 = [a1 _defaultTailspinConfiguration:v9 isSeed:v8 isCarrier:v7 platform:v6];
  if (v12)
  {
    uint64_t v13 = +[DRSTailspinRequest requiredSystemResourceName];
    [v11 setObject:v12 forKeyedSubscript:v13];
  }
  if (![v11 count])
  {

    id v11 = 0;
  }

  return v11;
}

- (BOOL)writeConfigurationPlistsToDirectory:(id)a3 createDirIfMissing:(BOOL)a4 errorOut:(id *)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v41 = 0;
  BOOL v9 = [MEMORY[0x263F08850] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8 isDirectory:&v41];

  if (v10)
  {
    if (!v41)
    {
      if (a5)
      {
        id v11 = [NSString stringWithFormat:@"'%@' already exists but it's a file", v8];
        _dampeningManagerError(v11);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v12 = DPLogHandle_DampeningManagerError();
      if (!os_signpost_enabled(v12)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      uint64_t v13 = "'%{public}@' exists and is not a directory";
LABEL_25:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationPlistDirWritingError", v13, buf, 0xCu);
LABEL_26:
      BOOL v18 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    if (!a4)
    {
      if (a5)
      {
        uint64_t v23 = [NSString stringWithFormat:@"'%@' doesn't exist and we have not been told to create it", v8];
        _dampeningManagerError(v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v12 = DPLogHandle_DampeningManagerError();
      if (!os_signpost_enabled(v12)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      uint64_t v13 = "'%{public}@' does not exist and we have not been told to create it";
      goto LABEL_25;
    }
    id v14 = [MEMORY[0x263F08850] defaultManager];
    id v40 = 0;
    int v15 = [v14 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v40];
    BOOL v12 = v40;

    if (!v15)
    {
      v26 = DPLogHandle_DampeningManagerError();
      if (os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v12;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationPlistDirCreationError", "Failed to create '%{public}@' due to error: %{public}@", buf, 0x16u);
      }

      if (a5)
      {
        BOOL v12 = v12;
        BOOL v18 = 0;
        *a5 = v12;
        goto LABEL_31;
      }
      goto LABEL_26;
    }
    int v16 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationPlistDirCreation", "Created '%{public}@'", buf, 0xCu);
    }
  }
  BOOL v12 = [(DRSDampeningManager *)self jsonCompatibleDictRepresentation];
  uint64_t v17 = [v12 objectForKeyedSubscript:@"TeamDampeningConfigurations"];
  if (v17)
  {
    uint64_t v36 = 0;
    objc_super v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    int v35 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__8;
    v46 = __Block_byref_object_dispose__8;
    id v47 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __87__DRSDampeningManager_writeConfigurationPlistsToDirectory_createDirIfMissing_errorOut___block_invoke;
    v27[3] = &unk_263FCA818;
    id v28 = v8;
    v29 = &v32;
    uint64_t v30 = &v36;
    v31 = buf;
    [v17 enumerateKeysAndObjectsUsingBlock:v27];
    BOOL v18 = *((unsigned char *)v37 + 24) == 0;
    if (*((unsigned char *)v37 + 24))
    {
      uint64_t v19 = DPLogHandle_DampeningManagerError();
      if (os_signpost_enabled(v19))
      {
        int v20 = *((_DWORD *)v33 + 6);
        *(_DWORD *)v42 = 67240192;
        int v43 = v20;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerPlistWriteFailure", "Failed after writing %{public}u plists", v42, 8u);
      }

      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        uint64_t v21 = _dampeningManagerError(@"Unknown error");
        uint64_t v22 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v21;
      }
      if (a5) {
        *a5 = *(id *)(*(void *)&buf[8] + 40);
      }
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    uint64_t v24 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoTeamConfigurationsToWrite", (const char *)&unk_209EEADD1, buf, 2u);
    }

    BOOL v18 = 1;
  }

LABEL_31:
  return v18;
}

void __87__DRSDampeningManager_writeConfigurationPlistsToDirectory_createDirIfMissing_errorOut___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = [v7 stringByAppendingPathExtension:@"plist"];
  char v10 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v9];
  id v21 = 0;
  id v11 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:&v21];

  id v12 = v21;
  id v13 = v21;
  if (v11)
  {
    if ([v11 writeToFile:v10 atomically:1])
    {
      id v14 = DPLogHandle_DampeningManager();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v10;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamPlistWriteSuccess", "Wrote %{public}@", buf, 0xCu);
      }

      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
      int v16 = DPLogHandle_DampeningManagerError();
      if (os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138543618;
        id v23 = v7;
        __int16 v24 = 2114;
        uint64_t v25 = v10;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamPlistWriteFailure", "Failed to write plist for %{public}@ to path %{public}@", buf, 0x16u);
      }

      uint64_t v17 = [NSString stringWithFormat:@"Failed to write plist to path '%@'", v10];
      uint64_t v18 = _dampeningManagerError(v17);
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
      int v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    int v15 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v7;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamPlistSerializationFailure", "Failed to serialize config for %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v12);
  }
}

+ (id)defaultResourceConfigurationsForCurrentDevice
{
  char v3 = +[DRSSystemProfile sharedInstance];
  id v4 = objc_msgSend(a1, "defaultResourceConfigurations:isSeed:isCarrier:platform:", objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), objc_msgSend(v3, "isCarrier"), objc_msgSend(v3, "platform"));

  return v4;
}

- (DRSDampeningManager)initWithPersistentContainer:(id)a3 teamConfigurationDirectory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(DRSDampeningEnforcementSettings);
  BOOL v9 = [(id)objc_opt_class() defaultResourceConfigurationsForCurrentDevice];
  char v10 = +[DRSDampeningConfiguration defaultSignatureDampeningConfiguration];
  uint64_t v11 = [(id)objc_opt_class() defaultTotalCapForCurrentDevice];
  id v12 = [(id)objc_opt_class() defaultTeamConfigurationsForCurrentDevice:v6];

  id v13 = [(DRSDampeningManager *)self initWithPersistentContainer:v7 enforcementSettings:v8 defaultSignatureConfiguration:v10 totalCap:v11 teamDampeningConfigDict:v12 resourceDampeningConfigDict:v9];
  return v13;
}

- (id)dampeningConfigurationForTeamID:(id)a3 issueCategory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DRSDampeningManager *)self teamDampeningConfigDict];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    char v10 = [v9 configurationForIssueCategory:v6];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
    }
    id v13 = v12;
  }
  else
  {
    id v13 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
  }

  return v13;
}

- (id)dampeningConfigurationForRequestSignature:(id)a3
{
  id v4 = a3;
  id v5 = [v4 teamID];
  id v6 = [v4 issueCategory];

  id v7 = [(DRSDampeningManager *)self dampeningConfigurationForTeamID:v5 issueCategory:v6];

  return v7;
}

+ (id)_ON_MOC_QUEUE_existingMOFromContext:(id)a3 errorOut:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263EFF260];
  id v7 = a3;
  id v8 = [a1 _entityName];
  BOOL v9 = [v6 fetchRequestWithEntityName:v8];

  char v10 = [v7 executeFetchRequest:v9 error:a4];

  if (*a4)
  {
    uint64_t v11 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v11))
    {
      uint64_t v12 = [*a4 localizedDescription];
      id v13 = (void *)v12;
      id v14 = @"Unknown";
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      int v17 = 138543362;
      uint64_t v18 = v14;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerRemoveFailure", "Encountered error when fetching dampening manager from store: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    id v15 = 0;
  }
  else
  {
    id v15 = v10;
  }

  return v15;
}

+ (BOOL)removeExistingDampeningManagerStateFromManagedObjectContext:(id)a3 errorOut:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__8;
  v14[4] = __Block_byref_object_dispose__8;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __92__DRSDampeningManager_removeExistingDampeningManagerStateFromManagedObjectContext_errorOut___block_invoke;
  v9[3] = &unk_263FC9EC0;
  id v13 = a1;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = v14;
  uint64_t v12 = &v16;
  [v6 performBlockAndWait:v9];
  char v7 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __92__DRSDampeningManager_removeExistingDampeningManagerStateFromManagedObjectContext_errorOut___block_invoke(uint64_t *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[7];
  uint64_t v3 = a1[4];
  id v17 = 0;
  id v4 = objc_msgSend(v2, "_ON_MOC_QUEUE_existingMOFromContext:errorOut:", v3, &v17);
  id v5 = v17;
  id v6 = v17;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v5);
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend((id)a1[4], "deleteObject:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), (void)v13);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }

    uint64_t v12 = *(void *)(a1[6] + 8);
  }
  else
  {
    uint64_t v12 = *(void *)(a1[6] + 8);
    if (*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      *(unsigned char *)(v12 + 24) = 0;
      goto LABEL_13;
    }
  }
  *(unsigned char *)(v12 + 24) = 1;
LABEL_13:
}

+ (id)dampeningManagerFromPersistentContainer:(id)a3 deleteBadState:(BOOL)a4 errorOut:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[v8 newBackgroundContext];
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__8;
  char v41 = __Block_byref_object_dispose__8;
  id v42 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__8;
  int v35 = __Block_byref_object_dispose__8;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  id v30 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke;
  v18[3] = &unk_263FCA840;
  id v21 = &v31;
  id v24 = a1;
  id v10 = v9;
  id v19 = v10;
  uint64_t v22 = &v25;
  id v23 = &v37;
  id v11 = v8;
  id v20 = v11;
  [v10 performBlockAndWait:v18];
  if (v6 && v26[5] && [(id)v32[5] count])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke_509;
    v14[3] = &unk_263FCA868;
    long long v16 = &v31;
    id v15 = v10;
    id v17 = &v25;
    [v15 performBlockAndWait:v14];
  }
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v12 = (id)v38[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);

  return v12;
}

void __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[9];
  uint64_t v3 = a1[4];
  id v27 = 0;
  uint64_t v4 = objc_msgSend(v2, "_ON_MOC_QUEUE_existingMOFromContext:errorOut:", v3, &v27);
  id v5 = v27;
  id v6 = v27;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;

  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v9 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v9))
    {
      uint64_t v10 = [*(id *)(*(void *)(a1[7] + 8) + 40) localizedDescription];
      id v11 = (void *)v10;
      id v12 = @"Unknown";
      if (v10) {
        id v12 = (__CFString *)v10;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchFailure", "Encountered error when fetching dampening manager from store: %{public}@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (![*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    uint64_t v9 = DPLogHandle_CoreData();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchMiss", "No persisted dampening manager", buf, 2u);
    }
    goto LABEL_18;
  }
  if ((unint64_t)[*(id *)(*(void *)(a1[6] + 8) + 40) count] >= 2)
  {
    long long v13 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchMultiples", "Found more than one manager", buf, 2u);
    }

    long long v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v31 = @"Found more than one persisted dampening manager";
    id v15 = NSDictionary;
    long long v16 = &v31;
    id v17 = &v30;
LABEL_17:
    uint64_t v9 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    uint64_t v24 = [v14 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v9];
    uint64_t v25 = *(void *)(a1[7] + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v18 = [DRSDampeningManager alloc];
  id v19 = [*(id *)(*(void *)(a1[6] + 8) + 40) firstObject];
  uint64_t v20 = [(DRSDampeningManager *)v18 _ON_MOC_QUEUE_initWith:v19 persistentContainer:a1[5]];
  uint64_t v21 = *(void *)(a1[8] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  if (!*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    id v23 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchInitFailure", "Failed to initialize dampening manager", buf, 2u);
    }

    long long v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = @"Failed to create MO for dampening manager";
    id v15 = NSDictionary;
    long long v16 = &v29;
    id v17 = &v28;
    goto LABEL_17;
  }
LABEL_19:
}

void __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke_509(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = DPLogHandle_CoreDataError();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerBadStateClean", "Cleaning bad persisted state and starting over.", buf, 2u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
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
        [*(id *)(a1 + 32) deleteObject:*(void *)(*((void *)&v17 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }

  id v8 = *(void **)(a1 + 32);
  id v16 = 0;
  char v9 = [v8 save:&v16];
  id v10 = v16;
  id v11 = v16;
  if ((v9 & 1) == 0)
  {
    id v12 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v12))
    {
      uint64_t v13 = [v11 localizedDescription];
      long long v14 = (void *)v13;
      id v15 = @"Unknown";
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v15;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerDeleteFailure", "Failed to save deletion of multiple dampening managers due to error: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
  }
}

- (id)_ON_MOC_QUEUE_initWith:(id)a3 persistentContainer:(id)a4
{
  uint64_t v33 = self;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v34 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = [v5 teamConfigurations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v13 = -[DRSTeamDampeningConfiguration _initWithTeamDampeningConfigMO_ON_MOC_QUEUE:]([DRSTeamDampeningConfiguration alloc], "_initWithTeamDampeningConfigMO_ON_MOC_QUEUE:", v12, v33);
        if (!v13)
        {
          id v16 = DPLogHandle_DampeningManagerError();
          if (os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerMORestoreFailure", "Failed to initialize dampening manager from persistence", buf, 2u);
          }
          uint64_t v31 = 0;
          uint64_t v25 = v34;
          goto LABEL_29;
        }
        long long v14 = v13;
        id v15 = [v12 teamID];
        [v6 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (![v6 count])
  {

    id v6 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = [v5 resourceConfigurations];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        id v22 = [[DRSDampeningConfiguration alloc] _initWithMO_ON_MOC_QUEUE:v21];
        if (!v22)
        {
          uint64_t v30 = DPLogHandle_DampeningManagerError();
          if (os_signpost_enabled(v30))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerMORestoreFailure", "Failed to initialize resource dampening configurations from persistence", buf, 2u);
          }
          uint64_t v31 = 0;
          uint64_t v25 = v34;
          goto LABEL_28;
        }
        id v23 = v22;
        uint64_t v24 = [v21 identifier];
        [v7 setObject:v23 forKeyedSubscript:v24];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  if (![v7 count])
  {

    id v7 = 0;
  }
  uint64_t v25 = v34;
  uint64_t v26 = [DRSDampeningConfiguration alloc];
  id v27 = [v5 defaultSignatureConfiguration];
  id v16 = [(DRSDampeningConfiguration *)v26 _initWithMO_ON_MOC_QUEUE:v27];

  uint64_t v28 = [DRSDampeningEnforcementSettings alloc];
  v29 = [v5 enforcementSettings];
  uint64_t v30 = [(DRSDampeningEnforcementSettings *)v28 initWithMO:v29];

  uint64_t v31 = -[DRSDampeningManager initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:](v33, "initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:", v34, v30, v16, [v5 totalCap], v6, v7);
LABEL_28:

LABEL_29:

  return v31;
}

- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3
{
  id v4 = a3;
  id v5 = [[DRSDampeningManagerMO alloc] initWithContext:v4];
  id v6 = [(DRSDampeningManager *)self defaultSignatureConfiguration];
  id v7 = objc_msgSend(v6, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", v4, @"DEFAULT_CONFIGURATION");
  [(DRSDampeningManagerMO *)v5 setDefaultSignatureConfiguration:v7];

  uint64_t v8 = [(DRSDampeningManager *)self enforcementSettings];
  uint64_t v9 = [v8 _moRepresentation:v4];
  [(DRSDampeningManagerMO *)v5 setEnforcementSettings:v9];

  [(DRSDampeningManagerMO *)v5 setTotalCap:[(DRSDampeningManager *)self totalCap]];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v10 = [(DRSDampeningManager *)self teamDampeningConfigDict];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke;
  v21[3] = &unk_263FCA890;
  id v11 = v4;
  id v22 = v11;
  uint64_t v24 = &v25;
  id v12 = v5;
  id v23 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v21];

  if (*((unsigned char *)v26 + 24))
  {
    id v13 = 0;
  }
  else
  {
    long long v14 = [(DRSDampeningManager *)self resourceDampeningConfigDict];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke_514;
    v17[3] = &unk_263FCA7A0;
    id v18 = v11;
    long long v20 = &v25;
    id v15 = v12;
    uint64_t v19 = v15;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];

    if (*((unsigned char *)v26 + 24)) {
      id v13 = 0;
    }
    else {
      id v13 = v15;
    }
  }
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = objc_msgSend(a3, "_ON_MOC_QUEUE_moRepresentationInContext:teamID:", *(void *)(a1 + 32), a2);
  id v7 = (id)v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addTeamConfigurationsObject:v6];
  }
  else
  {
    DPLogHandle_DampeningManagerError();

    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke_514(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = objc_msgSend(a3, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", *(void *)(a1 + 32), a2);
  id v7 = (id)v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addResourceConfigurationsObject:v6];
  }
  else
  {
    DPLogHandle_DampeningManagerError();

    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)saveToPersistentContainerWithErrorOut:(id *)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v5 = [(DRSDampeningManager *)self persistentContainer];

  if (v5)
  {
    uint64_t v6 = [(DRSDampeningManager *)self persistentContainer];
    id v7 = (id)[v6 newBackgroundContext];

    if ([(id)objc_opt_class() removeExistingDampeningManagerStateFromManagedObjectContext:v7 errorOut:a3])
    {
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      uint64_t v15 = 0;
      id v16 = &v15;
      uint64_t v17 = 0x3032000000;
      id v18 = __Block_byref_object_copy__8;
      uint64_t v19 = __Block_byref_object_dispose__8;
      id v20 = 0;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __61__DRSDampeningManager_saveToPersistentContainerWithErrorOut___block_invoke;
      v11[3] = &unk_263FC9AA0;
      v11[4] = self;
      id v7 = v7;
      id v12 = v7;
      id v13 = &v15;
      long long v14 = &v21;
      [v7 performBlockAndWait:v11];
      BOOL v8 = *((unsigned char *)v22 + 24) != 0;
      if (*((unsigned char *)v22 + 24))
      {
        DPLogHandle_CoreData();
      }
      else
      {
        DPLogHandle_CoreDataError();

        if (a3) {
          *a3 = (id) v16[5];
        }
      }

      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      BOOL v8 = 0;
    }
    goto LABEL_12;
  }
  if (a3)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    v26[0] = @"Tried to save a dampening manager with no persistent containter";
    id v7 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    [v9 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v7];
    BOOL v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v8;
  }
  return 0;
}

void __61__DRSDampeningManager_saveToPersistentContainerWithErrorOut___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_QUEUE_moRepresentationInContext:", *(void *)(a1 + 40));
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    obuint64_t j = *(id *)(v4 + 40);
    char v5 = [v3 save:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"Failed to create MO for dampening manager";
    id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (DRSDampeningConfiguration)defaultSignatureConfiguration
{
  return self->_defaultSignatureConfiguration;
}

- (void)setDefaultSignatureConfiguration:(id)a3
{
}

- (DRSDampeningEnforcementSettings)enforcementSettings
{
  return self->_enforcementSettings;
}

- (unint64_t)totalCap
{
  return self->_totalCap;
}

- (void)setTotalCap:(unint64_t)a3
{
  self->_totalCap = a3;
}

- (NSMutableDictionary)teamDampeningConfigDict
{
  return self->_teamDampeningConfigDict;
}

- (NSDictionary)resourceDampeningConfigDict
{
  return self->_resourceDampeningConfigDict;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_resourceDampeningConfigDict, 0);
  objc_storeStrong((id *)&self->_teamDampeningConfigDict, 0);
  objc_storeStrong((id *)&self->_enforcementSettings, 0);

  objc_storeStrong((id *)&self->_defaultSignatureConfiguration, 0);
}

@end