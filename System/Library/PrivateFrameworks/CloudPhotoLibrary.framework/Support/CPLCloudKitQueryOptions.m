@interface CPLCloudKitQueryOptions
- (CKQuery)query;
- (CPLCloudKitQueryOptions)initWithRecordType:(id)a3 predicate:(id)a4 resultsLimit:(int64_t)a5;
- (int64_t)resultsLimit;
@end

@implementation CPLCloudKitQueryOptions

- (CPLCloudKitQueryOptions)initWithRecordType:(id)a3 predicate:(id)a4 resultsLimit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLCloudKitQueryOptions;
  v10 = [(CPLCloudKitQueryOptions *)&v14 init];
  if (v10)
  {
    v11 = (CKQuery *)[objc_alloc((Class)CKQuery) initWithRecordType:v8 predicate:v9];
    query = v10->_query;
    v10->_query = v11;

    v10->_resultsLimit = a5;
  }

  return v10;
}

- (CKQuery)query
{
  return self->_query;
}

- (int64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void).cxx_destruct
{
}

@end