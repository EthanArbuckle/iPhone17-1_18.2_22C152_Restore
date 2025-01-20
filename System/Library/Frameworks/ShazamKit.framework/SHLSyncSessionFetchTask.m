@interface SHLSyncSessionFetchTask
+ (BOOL)supportsSecureCoding;
- (NSProgress)progress;
- (NSString)identifier;
- (NSString)syncStartCondition;
- (SHLSyncSession)session;
- (SHLSyncSessionFetchTask)init;
- (SHLSyncSessionFetchTask)initWithCoder:(id)a3;
- (SHLSyncSessionFetchTaskDelegate)delegate;
- (int64_t)fetchType;
- (int64_t)retryCount;
- (int64_t)size;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchType:(int64_t)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSyncStartCondition:(id)a3;
@end

@implementation SHLSyncSessionFetchTask

- (SHLSyncSessionFetchTask)init
{
  v9.receiver = self;
  v9.super_class = (Class)SHLSyncSessionFetchTask;
  v2 = [(SHLSyncSessionFetchTask *)&v9 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    uint64_t v6 = +[NSProgress progressWithTotalUnitCount:1];
    progress = v2->_progress;
    v2->_progress = (NSProgress *)v6;

    v2->_retryCount = 0;
  }
  return v2;
}

- (int64_t)type
{
  return 1;
}

- (int64_t)size
{
  return 1;
}

- (SHLSyncSessionFetchTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLSyncSessionFetchTask;
  v5 = [(SHLSyncSessionFetchTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLSyncSessionFetchTaskIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_fetchType = (int64_t)[v4 decodeIntegerForKey:@"SHLSyncSessionFetchTaskFetchType"];
    v5->_syncStartCondition = (NSString *)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLSyncSessionFetchTaskSyncTrigger"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"SHLSyncSessionFetchTaskIdentifier"];
  [v5 encodeInteger:self->_fetchType forKey:@"SHLSyncSessionFetchTaskFetchType"];
  [v5 encodeObject:self->_syncStartCondition forKey:@"SHLSyncSessionFetchTaskSyncTrigger"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (SHLSyncSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->session);

  return (SHLSyncSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (NSString)syncStartCondition
{
  return self->_syncStartCondition;
}

- (void)setSyncStartCondition:(id)a3
{
  self->_syncStartCondition = (NSString *)a3;
}

- (int64_t)fetchType
{
  return self->_fetchType;
}

- (void)setFetchType:(int64_t)a3
{
  self->_fetchType = a3;
}

- (SHLSyncSessionFetchTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHLSyncSessionFetchTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->session);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end