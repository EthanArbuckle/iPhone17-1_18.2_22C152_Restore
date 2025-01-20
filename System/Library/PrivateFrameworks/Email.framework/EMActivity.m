@interface EMActivity
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
+ (id)keyPathsForValuesAffectingLocalizedDescription;
- (BOOL)isEqualToActivityWithType:(int64_t)a3 userInfo:(id)a4;
- (BOOL)needsPersistentHistory;
- (EMActivity)initWithActivityType:(int64_t)a3 userInfo:(id)a4;
- (EMActivity)initWithCoder:(id)a3;
- (EMActivityObjectID)objectID;
- (NSDate)finished;
- (NSDate)started;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSProgress)progress;
- (NSString)description;
- (NSString)localizedDescription;
- (double)fractionCompleted;
- (id)_localizedDescriptionForFetchState:(int64_t)a3;
- (int64_t)activityType;
- (void)_observeProgress;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finishWithError:(id)a3;
- (void)setCompletedCount:(int64_t)a3 totalCount:(int64_t)a4;
- (void)setFractionCompleted:(double)a3;
- (void)setProgress:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
@end

@implementation EMActivity

- (EMActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)EMActivity;
  v5 = [(EMActivity *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_objectID"];
    objectID = v5->_objectID;
    v5->_objectID = (EMActivityObjectID *)v6;

    v5->_activityType = [v4 decodeIntegerForKey:@"EFPropertyKey_activityType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_started"];
    started = v5->_started;
    v5->_started = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_finished"];
    finished = v5->_finished;
    v5->_finished = (NSDate *)v10;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v29, "setWithObjects:", v28, v27, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"EFPropertyKey_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_error"];
    error = v5->_error;
    v5->_error = (NSError *)v22;

    if (!v5->_error)
    {
      uint64_t v24 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
      progress = v5->_progress;
      v5->_progress = (NSProgress *)v24;

      [(EMActivity *)v5 _observeProgress];
    }
  }

  return v5;
}

- (void)_observeProgress
{
  v3 = [(EMActivity *)self progress];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__EMActivity__observeProgress__block_invoke;
  v7[3] = &unk_1E63E27D8;
  objc_copyWeak(&v9, &location);
  id v8 = v3;
  id v4 = v3;
  objc_msgSend(v4, "ef_observeKeyPath:options:usingBlock:", @"fractionCompleted", 1, v7);
  v5 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  progressKVOCancellation = self->_progressKVOCancellation;
  self->_progressKVOCancellation = v5;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(EMActivity *)self objectID];
  [v9 encodeObject:v4 forKey:@"EFPropertyKey_objectID"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[EMActivity activityType](self, "activityType"), @"EFPropertyKey_activityType");
  v5 = [(EMActivity *)self started];
  [v9 encodeObject:v5 forKey:@"EFPropertyKey_started"];

  uint64_t v6 = [(EMActivity *)self finished];
  [v9 encodeObject:v6 forKey:@"EFPropertyKey_finished"];

  v7 = [(EMActivity *)self userInfo];
  [v9 encodeObject:v7 forKey:@"EFPropertyKey_userInfo"];

  id v8 = [(EMActivity *)self error];
  [v9 encodeObject:v8 forKey:@"EFPropertyKey_error"];
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (NSDate)started
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)finished
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (NSString)localizedDescription
{
  switch(self->_activityType)
  {
    case 0:
    case 2:
    case 3:
      _EFLocalizedString();
      self = (EMActivity *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v2 = self;
      v3 = [(EMActivity *)self userInfo];
      id v4 = [v3 objectForKeyedSubscript:@"activityFetchState"];
      uint64_t v5 = [v4 integerValue];

      uint64_t v6 = [(EMActivity *)v2 userInfo];
      v7 = [v6 objectForKeyedSubscript:@"useIsIndeterminateForFetchState"];
      int v8 = [v7 BOOLValue];

      if (v8)
      {
        if (v5 == 2)
        {
          if ([(NSProgress *)v2->_progress isIndeterminate]) {
            uint64_t v5 = 1;
          }
          else {
            uint64_t v5 = 2;
          }
        }
      }
      else
      {
        uint64_t v9 = [(NSProgress *)v2->_progress totalUnitCount];
        if (v5 != 3 && v9 < 1) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = v5;
        }
        uint64_t v12 = [(NSProgress *)v2->_progress completedUnitCount];
        if (v11 != 3 && v12 < 1) {
          uint64_t v5 = 1;
        }
        else {
          uint64_t v5 = v11;
        }
      }
      self = [(EMActivity *)v2 _localizedDescriptionForFetchState:v5];
      break;
    default:
      break;
  }
  return (NSString *)self;
}

- (NSDictionary)userInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSDictionary *)self->_userInfo copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (id)_localizedDescriptionForFetchState:(int64_t)a3
{
  id v4 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  switch(a3)
  {
    case 0:
      uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"ESTABLISHING_CONNECTION" value:&stru_1F1A3DFB0 table:@"Main"];
      goto LABEL_11;
    case 1:
      uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"CHECKING_FOR_MAIL" value:&stru_1F1A3DFB0 table:@"Main"];
      goto LABEL_11;
    case 2:
      if ([(NSProgress *)v4->_progress completedUnitCount])
      {
        int v8 = NSString;
        uint64_t v6 = _EFLocalizedString();
        objc_msgSend(v8, "localizedStringWithFormat:", v6, -[NSProgress completedUnitCount](v4->_progress, "completedUnitCount"), -[NSProgress totalUnitCount](v4->_progress, "totalUnitCount"));
      }
      else
      {
        uint64_t v6 = _EFLocalizedString();
        objc_msgSend(NSString, "localizedStringWithFormat:", v6, -[NSProgress totalUnitCount](v4->_progress, "totalUnitCount"));
      uint64_t v7 = };
      goto LABEL_11;
    case 3:
      statusUpdateProvider = v4->_statusUpdateProvider;
      if (!statusUpdateProvider)
      {
        uint64_t v10 = objc_alloc_init(EMStatusUpdateProvider);
        uint64_t v11 = v4->_statusUpdateProvider;
        v4->_statusUpdateProvider = v10;

        statusUpdateProvider = v4->_statusUpdateProvider;
      }
      finished = v4->_finished;
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v7 = [(EMStatusUpdateProvider *)statusUpdateProvider statusUpdateStringWithDate:finished now:v6 nextTransition:0];
LABEL_11:
      id v4 = (EMActivity *)v7;

      break;
    default:
      break;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (EMActivityObjectID)objectID
{
  return (EMActivityObjectID *)objc_getProperty(self, a2, 88, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  [(EFCancelable *)self->_progressKVOCancellation cancel];
  progressKVOCancellation = self->_progressKVOCancellation;
  self->_progressKVOCancellation = 0;

  v4.receiver = self;
  v4.super_class = (Class)EMActivity;
  [(EMActivity *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_finished, 0);
  objc_storeStrong((id *)&self->_started, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_progressKVOCancellation, 0);
  objc_storeStrong((id *)&self->_statusUpdateProvider, 0);
}

+ (id)keyPathsForValuesAffectingLocalizedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"error", @"fractionCompleted", @"finished", @"userInfo", 0);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __17__EMActivity_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return (OS_os_log *)v2;
}

void __17__EMActivity_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

- (EMActivity)initWithActivityType:(int64_t)a3 userInfo:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EMActivity;
  int v8 = [(EMActivity *)&v16 init];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(EMActivityObjectID);
    objectID = v8->_objectID;
    v8->_objectID = v9;

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    started = v8->_started;
    v8->_started = (NSDate *)v11;

    v8->_activityType = a3;
    objc_storeStrong((id *)&v8->_userInfo, a4);
    uint64_t v13 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v13;

    [(EMActivity *)v8 _observeProgress];
  }

  return v8;
}

void __30__EMActivity__observeProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) fractionCompleted];
  objc_msgSend(WeakRetained, "setFractionCompleted:");
}

- (BOOL)isEqualToActivityWithType:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  if (a3 == 1 && [(EMActivity *)self activityType] == 1)
  {
    id v7 = [(EMActivity *)self userInfo];
    int v8 = [v7 objectForKeyedSubscript:@"mailboxObjectID"];
    uint64_t v9 = [v6 objectForKeyedSubscript:@"mailboxObjectID"];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)setCompletedCount:(int64_t)a3 totalCount:(int64_t)a4
{
  [(EMActivity *)self willChangeValueForKey:@"localizedDescription"];
  id v7 = [(EMActivity *)self progress];
  [v7 setCompletedUnitCount:a3];

  int v8 = [(EMActivity *)self progress];
  [v8 setTotalUnitCount:a4];

  [(EMActivity *)self didChangeValueForKey:@"localizedDescription"];
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(EMActivity *)self willChangeValueForKey:@"userInfo"];
  os_unfair_lock_lock(&self->_lock);
  id v7 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_userInfo];
  int v8 = (void *)[v10 copy];
  [(NSDictionary *)v7 setObject:v8 forKeyedSubscript:v6];

  userInfo = self->_userInfo;
  self->_userInfo = v7;

  os_unfair_lock_unlock(&self->_lock);
  [(EMActivity *)self didChangeValueForKey:@"userInfo"];
}

- (void)finishWithError:(id)a3
{
  id v8 = a3;
  [(EMActivity *)self willChangeValueForKey:@"progress"];
  [(EMActivity *)self willChangeValueForKey:@"finished"];
  [(EMActivity *)self willChangeValueForKey:@"error"];
  os_unfair_lock_lock(&self->_lock);
  if (!self->_finished)
  {
    progress = self->_progress;
    self->_progress = 0;

    id v6 = [MEMORY[0x1E4F1C9C8] date];
    finished = self->_finished;
    self->_finished = v6;

    objc_storeStrong((id *)&self->_error, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  [(EMActivity *)self setUserInfoObject:&unk_1F1A61CE0 forKey:@"activityFetchState"];
  [(EMActivity *)self didChangeValueForKey:@"error"];
  [(EMActivity *)self didChangeValueForKey:@"finished"];
  [(EMActivity *)self didChangeValueForKey:@"progress"];
}

- (BOOL)needsPersistentHistory
{
  return [(EMActivity *)self activityType] == 1;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t activityType = self->_activityType;
  if (activityType > 3) {
    id v6 = @"EMActivityTypeFetch";
  }
  else {
    id v6 = off_1E63E27F8[activityType];
  }
  id v7 = [(EMActivity *)self userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"mailboxObjectID"];
  uint64_t v9 = [(EMActivity *)self localizedDescription];
  id v10 = [v3 stringWithFormat:@"<%@: %p> %@: %@ - %@", v4, self, v6, v8, v9];

  return (NSString *)v10;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setProgress:(id)a3
{
}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

- (void)setFractionCompleted:(double)a3
{
  self->_fractionCompleted = a3;
}

@end