@interface LNAvailabilityChecker
+ (BOOL)isInternalInstall;
- (BOOL)availableForCurrentPlatformVersion;
- (LNAvailabilityChecker)initWithAvailabilityAnnotations:(id)a3;
- (NSDictionary)availabilityAnnotations;
- (id)availabilityWithPlatform:(id)a3 platformVersion:(id)a4;
- (id)currentPlatformName;
- (id)currentSystemVersion;
@end

@implementation LNAvailabilityChecker

- (void).cxx_destruct
{
}

- (LNAvailabilityChecker)initWithAvailabilityAnnotations:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNAvailabilityChecker;
  v5 = [(LNAvailabilityChecker *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    availabilityAnnotations = v5->_availabilityAnnotations;
    v5->_availabilityAnnotations = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)availableForCurrentPlatformVersion
{
  v3 = [(LNAvailabilityChecker *)self currentPlatformName];
  id v4 = [(LNAvailabilityChecker *)self currentSystemVersion];
  v5 = [(LNAvailabilityChecker *)self availabilityWithPlatform:v3 platformVersion:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:v3];
  if (v6) {
    BOOL v7 = v6 == @"LNAvailabilityResultUnavailable";
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;

  return v8;
}

- (id)availabilityWithPlatform:(id)a3 platformVersion:(id)a4
{
  v33[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(LNAvailabilityChecker *)self availabilityAnnotations];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F72580]];
  uint64_t v10 = [v9 _availabilityResultWithoutSystemVersion];
  v11 = (void *)v10;
  v12 = @"LNAvailabilityResultAvailable";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  id v14 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = *MEMORY[0x1E4F72578];
  v32[0] = *MEMORY[0x1E4F72558];
  v32[1] = v15;
  v33[0] = v13;
  v33[1] = v13;
  uint64_t v16 = *MEMORY[0x1E4F72568];
  v32[2] = *MEMORY[0x1E4F72560];
  v32[3] = v16;
  v33[2] = v13;
  v33[3] = v13;
  v32[4] = *MEMORY[0x1E4F72570];
  v33[4] = v13;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:5];
  v18 = (void *)[v14 initWithDictionary:v17];

  v19 = [(LNAvailabilityChecker *)self availabilityAnnotations];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__LNAvailabilityChecker_availabilityWithPlatform_platformVersion___block_invoke;
  v27[3] = &unk_1E5B38E88;
  id v28 = v6;
  id v20 = v18;
  id v29 = v20;
  v30 = v13;
  id v31 = v7;
  id v21 = v7;
  v22 = v13;
  id v23 = v6;
  [v19 enumerateKeysAndObjectsUsingBlock:v27];

  v24 = v31;
  id v25 = v20;

  return v25;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

void __66__LNAvailabilityChecker_availabilityWithPlatform_platformVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (([v14 isEqualToString:*MEMORY[0x1E4F72580]] & 1) == 0)
  {
    int v6 = [v14 isEqualToString:*(void *)(a1 + 32)];
    id v7 = *(__CFString **)(a1 + 48);
    if (v6) {
      [v5 _availabilityResultWithSystemVersion:*(void *)(a1 + 56)];
    }
    else {
    BOOL v8 = [v5 _availabilityResultWithoutSystemVersion];
    }
    v9 = v8;
    uint64_t v10 = @"LNAvailabilityResultDeprecated";
    if (v8 != @"LNAvailabilityResultDeprecated" && v7 != @"LNAvailabilityResultDeprecated") {
      uint64_t v10 = @"LNAvailabilityResultAvailable";
    }
    if (v8 == @"LNAvailabilityResultUnavailable" || v7 == @"LNAvailabilityResultUnavailable") {
      v13 = @"LNAvailabilityResultUnavailable";
    }
    else {
      v13 = v10;
    }
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v14];
  }
}

- (id)currentSystemVersion
{
  if (currentSystemVersion_onceToken != -1) {
    dispatch_once(&currentSystemVersion_onceToken, &__block_literal_global_4700);
  }
  if (currentSystemVersion_systemVersion) {
    v2 = (__CFString *)currentSystemVersion_systemVersion;
  }
  else {
    v2 = @"Unknown";
  }
  return v2;
}

- (id)currentPlatformName
{
  return (id)*MEMORY[0x1E4F72558];
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_29);
  }
  return isInternalInstall_isInternal;
}

uint64_t __42__LNAvailabilityChecker_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isInternalInstall_isInternal = result;
  return result;
}

void __45__LNAvailabilityChecker_currentSystemVersion__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  v2 = (void *)currentSystemVersion_systemVersion;
  currentSystemVersion_systemVersion = (uint64_t)v1;
}

@end