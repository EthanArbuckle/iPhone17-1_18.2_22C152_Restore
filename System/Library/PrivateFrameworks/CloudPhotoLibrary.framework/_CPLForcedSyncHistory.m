@interface _CPLForcedSyncHistory
- (BOOL)discarded;
- (CPLScopeFilter)filter;
- (Class)taskClass;
- (NSDate)creationDate;
- (NSString)errorDescription;
- (_CPLForcedSyncHistory)initWithForcedSyncTask:(id)a3 discarded:(BOOL)a4 error:(id)a5;
- (id)descriptionWithNow:(id)a3;
@end

@implementation _CPLForcedSyncHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_taskClass, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (Class)taskClass
{
  return self->_taskClass;
}

- (CPLScopeFilter)filter
{
  return self->_filter;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (id)descriptionWithNow:(id)a3
{
  filter = self->_filter;
  v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = +[CPLDateFormatter stringFromDateAgo:self->_creationDate now:v6];

  Class taskClass = self->_taskClass;
  if (filter)
  {
    uint64_t v10 = [(CPLScopeFilter *)self->_filter simpleDescription];
    v11 = (void *)v10;
    if (self->_discarded) {
      v12 = " (discarded)";
    }
    else {
      v12 = "";
    }
    errorDescription = (__CFString *)self->_errorDescription;
    if (!errorDescription) {
      errorDescription = @"no errors";
    }
    v14 = (void *)[v7 initWithFormat:@"%@: %@ %@%s - %@", v8, taskClass, v10, v12, errorDescription];
  }
  else
  {
    if (self->_discarded) {
      v15 = " (discarded)";
    }
    else {
      v15 = "";
    }
    v16 = (__CFString *)self->_errorDescription;
    if (!v16) {
      v16 = @"no errors";
    }
    v14 = (void *)[v7 initWithFormat:@"%@: %@%s - %@", v8, taskClass, v15, v16];
  }

  return v14;
}

- (_CPLForcedSyncHistory)initWithForcedSyncTask:(id)a3 discarded:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_CPLForcedSyncHistory;
  uint64_t v10 = [(_CPLForcedSyncHistory *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [v8 filter];
    filter = v10->_filter;
    v10->_filter = (CPLScopeFilter *)v11;

    uint64_t v13 = [v8 creationDate];
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v13;

    uint64_t v15 = objc_opt_class();
    Class taskClass = v10->_taskClass;
    v10->_Class taskClass = (Class)v15;

    v10->_discarded = a4;
    uint64_t v17 = [v9 localizedDescription];
    errorDescription = v10->_errorDescription;
    v10->_errorDescription = (NSString *)v17;
  }
  return v10;
}

@end