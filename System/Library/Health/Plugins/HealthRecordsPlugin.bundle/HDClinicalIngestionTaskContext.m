@interface HDClinicalIngestionTaskContext
- (BOOL)_unitTesting_shouldSkipAttachmentDownload;
- (BOOL)isBackgroundTask;
- (BOOL)shouldFetchImmediately;
- (BOOL)shouldSkipFetch;
- (BOOL)shouldSkipGatewaysUpdate;
- (BOOL)shouldSkipIngestionMetricsSubmission;
- (HDClinicalIngestionTaskContext)initWithOptions:(unint64_t)a3 reason:(id)a4;
- (HDClinicalIngestionTaskContext)initWithOptions:(unint64_t)a3 unitTesting_options:(unint64_t)a4 reason:(id)a5;
- (NSFileHandle)inputFileHandle;
- (NSString)reason;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)queryModeFromOptionsGivenQueryMode:(int64_t)a3;
- (unint64_t)options;
- (unint64_t)unitTesting_options;
- (void)setUnitTesting_options:(unint64_t)a3;
@end

@implementation HDClinicalIngestionTaskContext

- (HDClinicalIngestionTaskContext)initWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDClinicalIngestionTaskContext;
  v7 = [(HDClinicalIngestionTaskContext *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a3;
    v9 = (NSString *)[v6 copy];
    reason = v8->_reason;
    v8->_reason = v9;
  }
  return v8;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(HDClinicalIngestionTaskContext *)self options];
  id v6 = [(HDClinicalIngestionTaskContext *)self reason];
  id v7 = [v3 initWithFormat:@"<%@:%p; options: %lX; reason: %@;>", v4, self, v5, v6, 0];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [HDClinicalIngestionTaskMutableContext alloc];
  unint64_t v5 = [(HDClinicalIngestionTaskContext *)self options];
  id v6 = [(HDClinicalIngestionTaskContext *)self reason];
  id v7 = [(HDClinicalIngestionTaskContext *)v4 initWithOptions:v5 reason:v6];

  objc_storeStrong(v7 + 1, self->_inputFileHandle);
  return v7;
}

- (int64_t)queryModeFromOptionsGivenQueryMode:(int64_t)a3
{
  if (([(HDClinicalIngestionTaskContext *)self options] & 0x20) != 0) {
    return 1;
  }
  if (([(HDClinicalIngestionTaskContext *)self options] & 0x40) != 0) {
    return 2;
  }
  return a3;
}

- (BOOL)isBackgroundTask
{
  return [(HDClinicalIngestionTaskContext *)self options] & 1;
}

- (BOOL)shouldFetchImmediately
{
  return ([(HDClinicalIngestionTaskContext *)self options] >> 4) & 1;
}

- (BOOL)shouldSkipFetch
{
  return ([(HDClinicalIngestionTaskContext *)self options] >> 2) & 1;
}

- (BOOL)shouldSkipGatewaysUpdate
{
  return ([(HDClinicalIngestionTaskContext *)self options] >> 1) & 1;
}

- (BOOL)shouldSkipIngestionMetricsSubmission
{
  return ([(HDClinicalIngestionTaskContext *)self options] >> 3) & 1;
}

- (NSFileHandle)inputFileHandle
{
  return self->_inputFileHandle;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)unitTesting_options
{
  return self->_unitTesting_options;
}

- (void)setUnitTesting_options:(unint64_t)a3
{
  self->_unitTesting_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_inputFileHandle, 0);
}

- (HDClinicalIngestionTaskContext)initWithOptions:(unint64_t)a3 unitTesting_options:(unint64_t)a4 reason:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDClinicalIngestionTaskContext;
  v9 = [(HDClinicalIngestionTaskContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_options = a3;
    v11 = (NSString *)[v8 copy];
    reason = v10->_reason;
    v10->_reason = v11;

    v10->_unitTesting_options = a4;
  }

  return v10;
}

- (BOOL)_unitTesting_shouldSkipAttachmentDownload
{
  return [(HDClinicalIngestionTaskContext *)self unitTesting_options] & 1;
}

@end