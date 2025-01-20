@interface _ATXAppLaunchSequence
- (BOOL)previousAppDeleted;
- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 dataStore:(id)a4;
- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 dataStore:(id)a4 allowSimulatedCrashes:(BOOL)a5;
- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 subsequentAppActionLaunchCounts:(id)a4 dataStore:(id)a5 allowSimulatedCrashes:(BOOL)a6;
- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 dataStore:(id)a4;
- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 dataStore:(id)a4 allowSimulatedCrashes:(BOOL)a5;
- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 subsequentLaunchCounts:(id)a4 dataStore:(id)a5 allowSimulatedCrashes:(BOOL)a6 launchType:(int)a7;
- (double)launchCount:(id)a3;
- (double)likelihoodForLaunch:(id)a3;
- (double)subsequentLaunchTotalCount;
- (void)_deleteDataForLaunchLocked:(id)a3;
- (void)addSubsequentLaunch:(id)a3;
- (void)dealloc;
- (void)decayByFactor:(double)a3;
- (void)decayWithHalfLifeInDays:(double)a3;
- (void)deleteAllInformation;
- (void)deleteDataForLaunch:(id)a3;
- (void)deleteDataForLaunches:(id)a3;
- (void)save;
@end

@implementation _ATXAppLaunchSequence

- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 dataStore:(id)a4
{
  return [(_ATXAppLaunchSequence *)self initWithPreviousLaunch:a3 dataStore:a4 allowSimulatedCrashes:1];
}

- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 dataStore:(id)a4 allowSimulatedCrashes:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 loadLaunchesFollowingBundle:v9];
  v11 = [(_ATXAppLaunchSequence *)self initWithPreviousLaunch:v9 subsequentLaunchCounts:v10 dataStore:v8 allowSimulatedCrashes:v5 launchType:0];

  return v11;
}

- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 subsequentLaunchCounts:(id)a4 dataStore:(id)a5 allowSimulatedCrashes:(BOOL)a6 launchType:(int)a7
{
  BOOL v8 = a6;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v39.receiver = self;
  v39.super_class = (Class)_ATXAppLaunchSequence;
  v16 = [(_ATXAppLaunchSequence *)&v39 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_17;
  }
  id v33 = v15;
  v16->_launchType = a7;
  objc_storeStrong((id *)&v16->_previousLaunch, a3);
  objc_storeStrong((id *)&v17->_datastore, a5);
  id v34 = v14;
  uint64_t v18 = [v14 mutableCopy];
  subsequentLaunchCountMap = v17->_subsequentLaunchCountMap;
  v17->_subsequentLaunchCountMap = (NSMutableDictionary *)v18;

  v17->_previousAppDeleted = 0;
  pthread_rwlock_init(&v17->_rwlock, 0);
  v20 = objc_opt_new();
  v17->_subsequentLaunchTotalCount = 0.0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v21 = v17->_subsequentLaunchCountMap;
  uint64_t v22 = [(NSMutableDictionary *)v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v22) {
    goto LABEL_14;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v36 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
      v27 = [(NSMutableDictionary *)v17->_subsequentLaunchCountMap objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [(NSMutableDictionary *)v17->_subsequentLaunchCountMap objectForKeyedSubscript:v26];
        [v28 doubleValue];
        v17->_subsequentLaunchTotalCount = v29 + v17->_subsequentLaunchTotalCount;
      }
      else
      {
        [v20 addObject:v26];
        if (!v8) {
          goto LABEL_12;
        }
        v28 = [NSString stringWithFormat:@"Launch count not of type NSNumber. Of type: %@", objc_opt_class()];
        [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:v28];
      }

LABEL_12:
    }
    uint64_t v23 = [(NSMutableDictionary *)v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
  }
  while (v23);
LABEL_14:

  if ([v20 count])
  {
    v30 = v17->_subsequentLaunchCountMap;
    v31 = [v20 allObjects];
    [(NSMutableDictionary *)v30 removeObjectsForKeys:v31];

    [(_ATXAppLaunchSequence *)v17 save];
  }

  id v14 = v34;
  id v15 = v33;
LABEL_17:

  return v17;
}

- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 dataStore:(id)a4
{
  return [(_ATXAppLaunchSequence *)self initWithPreviousAppActionLaunch:a3 dataStore:a4 allowSimulatedCrashes:1];
}

- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 dataStore:(id)a4 allowSimulatedCrashes:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 loadAppActionLaunchesFollowing:v9];
  v11 = [(_ATXAppLaunchSequence *)self initWithPreviousAppActionLaunch:v9 subsequentAppActionLaunchCounts:v10 dataStore:v8 allowSimulatedCrashes:v5];

  return v11;
}

- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 subsequentAppActionLaunchCounts:(id)a4 dataStore:(id)a5 allowSimulatedCrashes:(BOOL)a6
{
  return [(_ATXAppLaunchSequence *)self initWithPreviousLaunch:a3 subsequentLaunchCounts:a4 dataStore:a5 allowSimulatedCrashes:a6 launchType:1];
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_rwlock);
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchSequence;
  [(_ATXAppLaunchSequence *)&v3 dealloc];
}

- (void)addSubsequentLaunch:(id)a3
{
  id v8 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (!self->_previousAppDeleted)
  {
    v4 = NSNumber;
    BOOL v5 = [(NSMutableDictionary *)self->_subsequentLaunchCountMap objectForKeyedSubscript:v8];
    [v5 doubleValue];
    v7 = [v4 numberWithDouble:v6 + 1.0];
    [(NSMutableDictionary *)self->_subsequentLaunchCountMap setObject:v7 forKeyedSubscript:v8];

    self->_subsequentLaunchTotalCount = self->_subsequentLaunchTotalCount + 1.0;
    [(_ATXAppLaunchSequence *)self save];
  }
  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)deleteDataForLaunch:(id)a3
{
  id v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (!self->_previousAppDeleted)
  {
    [(_ATXAppLaunchSequence *)self _deleteDataForLaunchLocked:v4];
    [(_ATXAppLaunchSequence *)self save];
  }
  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)deleteDataForLaunches:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_ATXAppLaunchSequence _deleteDataForLaunchLocked:](self, "_deleteDataForLaunchLocked:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(_ATXAppLaunchSequence *)self save];
  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)_deleteDataForLaunchLocked:(id)a3
{
  subsequentLaunchCountMap = self->_subsequentLaunchCountMap;
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)subsequentLaunchCountMap objectForKeyedSubscript:v5];
  [v6 doubleValue];
  double v8 = v7;

  [(NSMutableDictionary *)self->_subsequentLaunchCountMap removeObjectForKey:v5];
  self->_subsequentLaunchTotalCount = self->_subsequentLaunchTotalCount - v8;
}

- (double)launchCount:(id)a3
{
  id v4 = a3;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  if (self->_previousAppDeleted)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_subsequentLaunchCountMap objectForKeyedSubscript:v4];
  }
  pthread_rwlock_unlock(p_rwlock);
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (double)likelihoodForLaunch:(id)a3
{
  id v4 = a3;
  pthread_rwlock_rdlock(&self->_rwlock);
  double v5 = 0.0;
  if (!self->_previousAppDeleted && self->_subsequentLaunchTotalCount != 0.0)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_subsequentLaunchCountMap objectForKeyedSubscript:v4];
    [v6 doubleValue];
    double v5 = v7 / self->_subsequentLaunchTotalCount;
  }
  pthread_rwlock_unlock(&self->_rwlock);

  return v5;
}

- (void)decayByFactor:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_rwlock = &self->_rwlock;
  uint64_t v6 = pthread_rwlock_wrlock(&self->_rwlock);
  if (!self->_previousAppDeleted)
  {
    double v7 = (void *)MEMORY[0x1D25F6CC0](v6);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v8 = [(NSMutableDictionary *)self->_subsequentLaunchCountMap allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v14 = [(NSMutableDictionary *)self->_subsequentLaunchCountMap objectForKeyedSubscript:v13];
          [v14 doubleValue];
          double v16 = v15;

          v17 = [NSNumber numberWithDouble:v16 * a3];
          [(NSMutableDictionary *)self->_subsequentLaunchCountMap setObject:v17 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    self->_subsequentLaunchTotalCount = self->_subsequentLaunchTotalCount * a3;
    [(_ATXAppLaunchSequence *)self save];
  }
  pthread_rwlock_unlock(p_rwlock);
}

- (void)decayWithHalfLifeInDays:(double)a3
{
  double v4 = exp2(-1.0 / a3);
  [(_ATXAppLaunchSequence *)self decayByFactor:v4];
}

- (void)save
{
  if (self->_subsequentLaunchCountMap)
  {
    int launchType = self->_launchType;
    if (launchType == 1)
    {
      -[_ATXDataStore writeAppActionLaunches:followingAppAction:](self->_datastore, "writeAppActionLaunches:followingAppAction:");
    }
    else if (!launchType)
    {
      -[_ATXDataStore writeLaunches:followingBundle:](self->_datastore, "writeLaunches:followingBundle:");
    }
  }
}

- (void)deleteAllInformation
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  int launchType = self->_launchType;
  if (launchType == 1)
  {
    [(_ATXDataStore *)self->_datastore deleteLaunchesFollowingAppAction:self->_previousLaunch];
  }
  else if (!launchType)
  {
    [(_ATXDataStore *)self->_datastore deleteLaunchesFollowingBundle:self->_previousLaunch];
  }
  self->_previousAppDeleted = 1;
  self->_subsequentLaunchTotalCount = 0.0;
  previousLaunch = self->_previousLaunch;
  self->_previousLaunch = 0;

  subsequentLaunchCountMap = self->_subsequentLaunchCountMap;
  self->_subsequentLaunchCountMap = 0;

  self->_int launchType = -1;
  pthread_rwlock_unlock(p_rwlock);
}

- (double)subsequentLaunchTotalCount
{
  return self->_subsequentLaunchTotalCount;
}

- (BOOL)previousAppDeleted
{
  return self->_previousAppDeleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsequentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->_previousLaunch, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

@end