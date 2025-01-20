@interface FFMinimumPhaseInReleaseSubscription
+ (id)decodeFromDictionary:(id)a3;
+ (id)mergeSubscriptions:(id)a3;
- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5;
- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5;
- (BOOL)matchesFeatureWithState:(id)a3 inConfigurationOfUnknownLockState:(id)a4;
- (FFMinimumPhaseInReleaseSubscription)initWithPhase:(id)a3 targetRelease:(id)a4;
- (NSString)minimumPhase;
- (NSString)targetRelease;
- (id)encodeToDictionary;
- (id)nameOfClass;
@end

@implementation FFMinimumPhaseInReleaseSubscription

- (FFMinimumPhaseInReleaseSubscription)initWithPhase:(id)a3 targetRelease:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FFMinimumPhaseInReleaseSubscription;
  v9 = [(FFSubscription *)&v12 initPrivate];
  v10 = (FFMinimumPhaseInReleaseSubscription *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_targetRelease, a4);
  }

  return v10;
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5
{
  id v8 = a5;
  v9 = [v8 stateForFeature:a3 domain:a4];
  if (v9) {
    BOOL v10 = [(FFMinimumPhaseInReleaseSubscription *)self matchesFeatureWithState:v9 inConfigurationOfUnknownLockState:v8];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5
{
  id v8 = a5;
  v9 = [v8 resolvedStateForFeature:a3 domain:a4];
  if (v9) {
    BOOL v10 = [(FFMinimumPhaseInReleaseSubscription *)self matchesFeatureWithState:v9 inConfigurationOfUnknownLockState:v8];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)matchesFeatureWithState:(id)a3 inConfigurationOfUnknownLockState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 attributes];
  v9 = [v8 objectForKeyedSubscript:@"TargetRelease"];
  BOOL v10 = [v9 value];

  if (v10
    && ([(FFMinimumPhaseInReleaseSubscription *)self targetRelease],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v10 isEqualToString:v11],
        v11,
        v12))
  {
    v13 = [v6 phase];
    if (v13)
    {
      unsigned int v14 = [v7 sortValueForPhase:v13];
      v15 = [(FFMinimumPhaseInReleaseSubscription *)self minimumPhase];
      unsigned int v16 = [v7 sortValueForPhase:v15];

      if (v14 && v16)
      {
        char v17 = v14 >= v16;
      }
      else
      {
        v18 = [(FFMinimumPhaseInReleaseSubscription *)self minimumPhase];
        char v17 = [v13 isEqualToString:v18];
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (id)mergeSubscriptions:(id)a3
{
  id v3 = a3;
  abort();
}

- (id)encodeToDictionary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"MinimumPhase";
  id v3 = [(FFMinimumPhaseInReleaseSubscription *)self minimumPhase];
  v7[1] = @"TargetRelease";
  v8[0] = v3;
  v4 = [(FFMinimumPhaseInReleaseSubscription *)self targetRelease];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)decodeFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"MinimumPhase"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 objectForKeyedSubscript:@"TargetRelease"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = [[FFMinimumPhaseInReleaseSubscription alloc] initWithPhase:v4 targetRelease:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)nameOfClass
{
  return @"FFMinimumPhaseInReleaseSubscription";
}

- (NSString)targetRelease
{
  return self->_targetRelease;
}

- (NSString)minimumPhase
{
  return self->_minimumPhase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumPhase, 0);
  objc_storeStrong((id *)&self->_targetRelease, 0);
}

@end