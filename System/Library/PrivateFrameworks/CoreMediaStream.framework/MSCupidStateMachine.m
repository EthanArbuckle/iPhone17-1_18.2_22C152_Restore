@interface MSCupidStateMachine
- (BOOL)hasDeactivated;
- (MSCupidStateMachine)initWithPersonID:(id)a3;
- (NSMutableDictionary)_userManifest;
- (NSString)personID;
- (id)_latestNextActivityDate;
- (void)_abort;
- (void)_backoffMMCSBackoffTimer;
- (void)_backoffStreamsBackoffTimer;
- (void)_commitUserManifest;
- (void)_didReceiveMMCSRetryAfterDate:(id)a3;
- (void)_didReceiveStreamsRetryAfterDate:(id)a3;
- (void)_forget;
- (void)_resetMMCSBackoffTimer;
- (void)_resetStreamsBackoffTimer;
- (void)_updateMasterManifest;
- (void)deactivate;
- (void)dealloc;
- (void)forget;
- (void)protocol:(id)a3 didReceiveRetryAfterDate:(id)a4;
- (void)setHasDeactivated:(BOOL)a3;
- (void)set_userManifest:(id)a3;
@end

@implementation MSCupidStateMachine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSBackoffManager, 0);
  objc_storeStrong((id *)&self->_streamsBackoffManager, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_manifestPath, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

- (void)setHasDeactivated:(BOOL)a3
{
  self->_hasDeactivated = a3;
}

- (BOOL)hasDeactivated
{
  return self->_hasDeactivated;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)set_userManifest:(id)a3
{
}

- (NSMutableDictionary)_userManifest
{
  return self->_userManifest;
}

- (void)protocol:(id)a3 didReceiveRetryAfterDate:(id)a4
{
}

- (void)_forget
{
}

- (void)_abort
{
}

- (void)_updateMasterManifest
{
}

- (id)_latestNextActivityDate
{
  v3 = [(MSBackoffManager *)self->_streamsBackoffManager nextExpiryDate];
  v4 = [(MSBackoffManager *)self->_MMCSBackoffManager nextExpiryDate];
  if ([v4 compare:v3] == 1)
  {
    id v5 = v4;

    v3 = v5;
  }

  return v3;
}

- (void)_didReceiveMMCSRetryAfterDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(MSCupidStateMachine *)self personID];
    int v10 = 138543874;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Received an MMCS server retry-after date of: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(MSBackoffManager *)self->_MMCSBackoffManager didReceiveRetryAfterDate:v4];
  v8 = [(MSBackoffManager *)self->_MMCSBackoffManager retryAfterDate];
  userManifest = self->_userManifest;
  if (v8) {
    [(NSMutableDictionary *)userManifest setObject:v8 forKey:@"MMCSRetryAfterDate"];
  }
  else {
    [(NSMutableDictionary *)userManifest removeObjectForKey:@"MMCSRetryAfterDate"];
  }
  [(MSCupidStateMachine *)self _commitUserManifest];
}

- (void)_backoffMMCSBackoffTimer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(MSBackoffManager *)self->_MMCSBackoffManager backoff];
  userManifest = self->_userManifest;
  id v4 = NSNumber;
  [(MSBackoffManager *)self->_MMCSBackoffManager currentInterval];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  [(NSMutableDictionary *)userManifest setObject:v5 forKey:@"MMCSBackoffInterval"];

  id v6 = self->_userManifest;
  v7 = [(MSBackoffManager *)self->_MMCSBackoffManager nextExpiryDate];
  [(NSMutableDictionary *)v6 setObject:v7 forKey:@"MMCSBackoffDate"];

  [(MSCupidStateMachine *)self _commitUserManifest];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    int v10 = [(MSCupidStateMachine *)self personID];
    [(MSBackoffManager *)self->_MMCSBackoffManager currentInterval];
    uint64_t v12 = v11;
    v13 = [(MSBackoffManager *)self->_MMCSBackoffManager nextExpiryDate];
    int v14 = 138544130;
    id v15 = v8;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Backing off the MMCS server. Interval: %lf, next fire date: %{public}@", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)_resetMMCSBackoffTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(MSBackoffManager *)self->_MMCSBackoffManager currentInterval];
  if (v3 != 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_opt_class();
      id v5 = v4;
      id v6 = [(MSCupidStateMachine *)self personID];
      int v7 = 138543618;
      v8 = v4;
      __int16 v9 = 2112;
      int v10 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Resetting MMCS backoff timer.", (uint8_t *)&v7, 0x16u);
    }
    [(MSBackoffManager *)self->_MMCSBackoffManager reset];
    [(NSMutableDictionary *)self->_userManifest removeObjectForKey:@"MMCSBackoffDate"];
    [(NSMutableDictionary *)self->_userManifest removeObjectForKey:@"MMCSBackoffInterval"];
    [(MSCupidStateMachine *)self _commitUserManifest];
  }
}

- (void)_didReceiveStreamsRetryAfterDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    int v7 = [(MSCupidStateMachine *)self personID];
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Received a metadata server retry-after date of: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(MSBackoffManager *)self->_streamsBackoffManager didReceiveRetryAfterDate:v4];
  v8 = [(MSBackoffManager *)self->_streamsBackoffManager retryAfterDate];
  userManifest = self->_userManifest;
  if (v8) {
    [(NSMutableDictionary *)userManifest setObject:v8 forKey:@"streamsRetryAfterDate"];
  }
  else {
    [(NSMutableDictionary *)userManifest removeObjectForKey:@"streamsRetryAfterDate"];
  }
  [(MSCupidStateMachine *)self _commitUserManifest];
}

- (void)_backoffStreamsBackoffTimer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(MSBackoffManager *)self->_streamsBackoffManager backoff];
  double v3 = NSNumber;
  userManifest = self->_userManifest;
  [(MSBackoffManager *)self->_streamsBackoffManager currentInterval];
  id v5 = objc_msgSend(v3, "numberWithDouble:");
  [(NSMutableDictionary *)userManifest setObject:v5 forKey:@"streamsBackoffInterval"];

  id v6 = self->_userManifest;
  int v7 = [(MSBackoffManager *)self->_streamsBackoffManager nextExpiryDate];
  [(NSMutableDictionary *)v6 setObject:v7 forKey:@"streamsBackoffDate"];

  [(MSCupidStateMachine *)self _commitUserManifest];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    int v10 = [(MSCupidStateMachine *)self personID];
    [(MSBackoffManager *)self->_streamsBackoffManager currentInterval];
    uint64_t v12 = v11;
    v13 = [(MSBackoffManager *)self->_streamsBackoffManager nextExpiryDate];
    int v14 = 138544130;
    id v15 = v8;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Backing off the metadata server. Interval: %lf, next fire date: %{public}@", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)_resetStreamsBackoffTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(MSBackoffManager *)self->_streamsBackoffManager currentInterval];
  if (v3 != 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_opt_class();
      id v5 = v4;
      id v6 = [(MSCupidStateMachine *)self personID];
      int v7 = 138543618;
      v8 = v4;
      __int16 v9 = 2112;
      int v10 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Resetting metadata stream backoff timer.", (uint8_t *)&v7, 0x16u);
    }
    [(MSBackoffManager *)self->_streamsBackoffManager reset];
    [(NSMutableDictionary *)self->_userManifest removeObjectForKey:@"streamsBackoffDate"];
    [(NSMutableDictionary *)self->_userManifest removeObjectForKey:@"streamsBackoffInterval"];
    [(MSCupidStateMachine *)self _commitUserManifest];
  }
}

- (void)_commitUserManifest
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  userManifest = self->_userManifest;
  id v9 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:userManifest requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to archive userManifest, error: %@", buf, 0xCu);
  }
  if (([v4 writeToFile:self->_manifestPath atomically:1] & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot save user manifest.", buf, 0x16u);
  }
  [(MSCupidStateMachine *)self _updateMasterManifest];
}

- (void)forget
{
  [(MSCupidStateMachine *)self _resetStreamsBackoffTimer];
  [(MSCupidStateMachine *)self _resetMMCSBackoffTimer];
  [(MSCupidStateMachine *)self _abort];
  [(MSCupidStateMachine *)self _forget];
}

- (void)deactivate
{
  [(MSCupidStateMachine *)self setHasDeactivated:1];
  MMCSBackoffManager = self->_MMCSBackoffManager;
  self->_MMCSBackoffManager = 0;

  streamsBackoffManager = self->_streamsBackoffManager;
  self->_streamsBackoffManager = 0;

  userManifest = self->_userManifest;
  self->_userManifest = 0;

  manifestPath = self->_manifestPath;
  self->_manifestPath = 0;

  personID = self->_personID;
  self->_personID = 0;
}

- (void)dealloc
{
  [(MSCupidStateMachine *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)MSCupidStateMachine;
  [(MSCupidStateMachine *)&v3 dealloc];
}

- (MSCupidStateMachine)initWithPersonID:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MSCupidStateMachine;
  id v6 = [(MSCupidStateMachine *)&v30 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personID, a3);
    v8 = [[MSBackoffManager alloc] initWithInitialInterval:0 backoffFactor:5.0 randomizeFactor:2.0 maxBackoffInterval:0.15 retryAfterDate:1200.0];
    streamsBackoffManager = v7->_streamsBackoffManager;
    v7->_streamsBackoffManager = v8;

    int v10 = [[MSBackoffManager alloc] initWithInitialInterval:0 backoffFactor:5.0 randomizeFactor:2.0 maxBackoffInterval:0.15 retryAfterDate:1200.0];
    MMCSBackoffManager = v7->_MMCSBackoffManager;
    v7->_MMCSBackoffManager = v10;

    uint64_t v12 = MSPathSubscriberManifestForPersonID(v5);
    manifestPath = v7->_manifestPath;
    v7->_manifestPath = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v15 = [v14 fileExistsAtPath:v7->_manifestPath];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithFile:v7->_manifestPath outError:0];
      userManifest = v7->_userManifest;
      v7->_userManifest = (NSMutableDictionary *)v16;
    }
    __int16 v18 = v7->_userManifest;
    if (!v18)
    {
      uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      __int16 v20 = v7->_userManifest;
      v7->_userManifest = v19;

      __int16 v18 = v7->_userManifest;
    }
    v21 = [(NSMutableDictionary *)v18 objectForKey:@"streamsBackoffInterval"];
    uint64_t v22 = [(NSMutableDictionary *)v7->_userManifest objectForKey:@"streamsBackoffDate"];
    v23 = [(NSMutableDictionary *)v7->_userManifest objectForKey:@"streamsBackoffDate"];
    if (v21 && v22)
    {
      v24 = v7->_streamsBackoffManager;
      [v21 doubleValue];
      -[MSBackoffManager setCurrentInterval:](v24, "setCurrentInterval:");
      [(MSBackoffManager *)v7->_streamsBackoffManager setNextExpiryDate:v22];
      [(MSBackoffManager *)v7->_streamsBackoffManager setRetryAfterDate:v23];
    }
    v25 = [(NSMutableDictionary *)v7->_userManifest objectForKey:@"MMCSBackoffInterval"];
    v26 = [(NSMutableDictionary *)v7->_userManifest objectForKey:@"MMCSBackoffDate"];
    v27 = [(NSMutableDictionary *)v7->_userManifest objectForKey:@"MMCSRetryAfterDate"];
    if (v25 && v26)
    {
      v28 = v7->_MMCSBackoffManager;
      [v25 doubleValue];
      -[MSBackoffManager setCurrentInterval:](v28, "setCurrentInterval:");
      [(MSBackoffManager *)v7->_MMCSBackoffManager setNextExpiryDate:v26];
      [(MSBackoffManager *)v7->_MMCSBackoffManager setRetryAfterDate:v27];
    }
  }
  return v7;
}

@end