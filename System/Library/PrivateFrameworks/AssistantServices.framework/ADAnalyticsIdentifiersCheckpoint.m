@interface ADAnalyticsIdentifiersCheckpoint
+ (BOOL)supportsSecureCoding;
+ (id)unarchive:(id)a3;
- (ADAnalyticsIdentifiersCheckpoint)initWithCoder:(id)a3;
- (ADAnalyticsIdentifiersCheckpoint)initWithCurrentUserSeed:(id)a3 currentUserSeedExpirationDate:(id)a4 nextUserSeed:(id)a5 nextUserSeedEffectiveFromDate:(id)a6 nextUserSeedExpirationDate:(id)a7;
- (BOOL)hasValidCurrentUserSeed:(id)a3;
- (BOOL)hasValidNextUserSeed:(id)a3;
- (NSDate)currentUserSeedExpirationDate;
- (NSDate)nextUserSeedEffectiveFromDate;
- (NSDate)nextUserSeedExpirationDate;
- (NSUUID)currentUserSeed;
- (NSUUID)nextUserSeed;
- (id)archive;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAnalyticsIdentifiersCheckpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUserSeedExpirationDate, 0);
  objc_storeStrong((id *)&self->_nextUserSeedEffectiveFromDate, 0);
  objc_storeStrong((id *)&self->_nextUserSeed, 0);
  objc_storeStrong((id *)&self->_currentUserSeedExpirationDate, 0);
  objc_storeStrong((id *)&self->_currentUserSeed, 0);
}

- (NSDate)nextUserSeedExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)nextUserSeedEffectiveFromDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)nextUserSeed
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)currentUserSeedExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)currentUserSeed
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)archive
{
  id v7 = 0;
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  if (v3)
  {
    v4 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Checkpoint could not be archived; Error:%@",
        buf,
        0xCu);
    }

    id v5 = 0;
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  currentUserSeed = self->_currentUserSeed;
  id v5 = a3;
  [v5 encodeObject:currentUserSeed forKey:@"_currentUserSeed"];
  [v5 encodeObject:self->_currentUserSeedExpirationDate forKey:@"_currentUserSeedExpirationDate"];
  [v5 encodeObject:self->_nextUserSeed forKey:@"_nextUserSeed"];
  [v5 encodeObject:self->_nextUserSeedEffectiveFromDate forKey:@"_nextUserSeedEffectiveFromDate"];
  [v5 encodeObject:self->_nextUserSeedExpirationDate forKey:@"_nextUserSeedExpirationDate"];
}

- (ADAnalyticsIdentifiersCheckpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ADAnalyticsIdentifiersCheckpoint;
  id v5 = [(ADAnalyticsIdentifiersCheckpoint *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentUserSeed"];
    currentUserSeed = v5->_currentUserSeed;
    v5->_currentUserSeed = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentUserSeedExpirationDate"];
    currentUserSeedExpirationDate = v5->_currentUserSeedExpirationDate;
    v5->_currentUserSeedExpirationDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nextUserSeed"];
    nextUserSeed = v5->_nextUserSeed;
    v5->_nextUserSeed = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nextUserSeedEffectiveFromDate"];
    nextUserSeedEffectiveFromDate = v5->_nextUserSeedEffectiveFromDate;
    v5->_nextUserSeedEffectiveFromDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nextUserSeedExpirationDate"];
    nextUserSeedExpirationDate = v5->_nextUserSeedExpirationDate;
    v5->_nextUserSeedExpirationDate = (NSDate *)v14;
  }
  return v5;
}

- (BOOL)hasValidNextUserSeed:(id)a3
{
  id v4 = a3;
  id v5 = [(ADAnalyticsIdentifiersCheckpoint *)self nextUserSeed];
  if (v5)
  {
    uint64_t v6 = [(ADAnalyticsIdentifiersCheckpoint *)self nextUserSeedEffectiveFromDate];
    if ([v6 compare:v4] == (id)1)
    {
      BOOL v7 = 0;
    }
    else
    {
      uint64_t v8 = [(ADAnalyticsIdentifiersCheckpoint *)self nextUserSeedExpirationDate];
      BOOL v7 = [v8 compare:v4] == (id)1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasValidCurrentUserSeed:(id)a3
{
  id v4 = a3;
  id v5 = [(ADAnalyticsIdentifiersCheckpoint *)self currentUserSeed];
  if (v5)
  {
    uint64_t v6 = [(ADAnalyticsIdentifiersCheckpoint *)self currentUserSeedExpirationDate];
    BOOL v7 = [v6 compare:v4] == (id)1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (ADAnalyticsIdentifiersCheckpoint)initWithCurrentUserSeed:(id)a3 currentUserSeedExpirationDate:(id)a4 nextUserSeed:(id)a5 nextUserSeedEffectiveFromDate:(id)a6 nextUserSeedExpirationDate:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ADAnalyticsIdentifiersCheckpoint;
  objc_super v17 = [(ADAnalyticsIdentifiersCheckpoint *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_currentUserSeed, a3);
    if (v18->_currentUserSeed) {
      objc_storeStrong((id *)&v18->_currentUserSeedExpirationDate, a4);
    }
    objc_storeStrong((id *)&v18->_nextUserSeed, a5);
    if (v18->_nextUserSeed)
    {
      objc_storeStrong((id *)&v18->_nextUserSeedEffectiveFromDate, a6);
      objc_storeStrong((id *)&v18->_nextUserSeedExpirationDate, a7);
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)unarchive:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v9];

  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Checkpoint object could not be decoded; Error: %@",
        buf,
        0xCu);
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

@end