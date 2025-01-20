@interface HDCloudSyncUpdateLastPullDateOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDCloudSyncUpdateLastPullDateOperation)initWithCoder:(id)a3;
- (HDCloudSyncUpdateLastPullDateOperation)initWithPullCompleteDate:(id)a3 lastSuccessfulPullKey:(id)a4;
- (NSDate)pullCompleteDate;
- (NSString)lastSuccessfulPullKey;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLastSuccessfulPullKey:(id)a3;
- (void)setPullCompleteDate:(id)a3;
@end

@implementation HDCloudSyncUpdateLastPullDateOperation

- (HDCloudSyncUpdateLastPullDateOperation)initWithPullCompleteDate:(id)a3 lastSuccessfulPullKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncUpdateLastPullDateOperation;
  v9 = [(HDCloudSyncUpdateLastPullDateOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pullCompleteDate, a3);
    objc_storeStrong((id *)&v10->_lastSuccessfulPullKey, a4);
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = HDCloudSyncKeyValueDomainWithProfile(v7);
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
  v10 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Recording successful cloud sync pull", buf, 0xCu);
  }
  pullCompleteDate = self->_pullCompleteDate;
  lastSuccessfulPullKey = self->_lastSuccessfulPullKey;
  id v19 = 0;
  int v13 = [v8 setDate:pullCompleteDate forKey:lastSuccessfulPullKey error:&v19];
  v14 = (HDCloudSyncUpdateLastPullDateOperation *)v19;
  if (v13)
  {
    v15 = [v7 cloudSyncManager];
    [(HDCloudSyncUpdateLastPullDateOperation *)v15 didCompleteSuccessfulPullWithDate:self->_pullCompleteDate];
  }
  else
  {
    _HKInitializeLogging();
    v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Failed to record successful pull: %{public}@.", buf, 0xCu);
    }
    v17 = v14;
    v15 = v17;
    if (v17)
    {
      if (a5)
      {
        v15 = v17;
        *a5 = v15;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCloudSyncUpdateLastPullDateOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pullCompleteDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSuccessfulPullKey"];

  id v7 = [(HDCloudSyncUpdateLastPullDateOperation *)self initWithPullCompleteDate:v5 lastSuccessfulPullKey:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  pullCompleteDate = self->_pullCompleteDate;
  id v5 = a3;
  [v5 encodeObject:pullCompleteDate forKey:@"pullCompleteDate"];
  [v5 encodeObject:self->_lastSuccessfulPullKey forKey:@"lastSuccessfulPullKey"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p> { pullCompleteDate: %@, lastSuccessfulPullKey: %@ }", v5, self, self->_pullCompleteDate, self->_lastSuccessfulPullKey];

  return v6;
}

- (NSDate)pullCompleteDate
{
  return self->_pullCompleteDate;
}

- (void)setPullCompleteDate:(id)a3
{
}

- (NSString)lastSuccessfulPullKey
{
  return self->_lastSuccessfulPullKey;
}

- (void)setLastSuccessfulPullKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSuccessfulPullKey, 0);

  objc_storeStrong((id *)&self->_pullCompleteDate, 0);
}

@end