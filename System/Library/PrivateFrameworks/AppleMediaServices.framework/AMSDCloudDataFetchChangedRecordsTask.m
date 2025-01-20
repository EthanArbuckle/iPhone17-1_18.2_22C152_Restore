@interface AMSDCloudDataFetchChangedRecordsTask
- (AMSDCloudDataDatabase)database;
- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4;
- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4 batchSize:(int64_t)a5;
- (NSArray)identifiers;
- (id)performFetch;
- (int64_t)batchSize;
@end

@implementation AMSDCloudDataFetchChangedRecordsTask

- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4
{
  return [(AMSDCloudDataFetchChangedRecordsTask *)self initWithRecordZoneIdentifiers:a3 inDatabase:a4 batchSize:400];
}

- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4 batchSize:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSDCloudDataFetchChangedRecordsTask;
  v11 = [(AMSDCloudDataFetchChangedRecordsTask *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifiers, a3);
    objc_storeStrong((id *)&v12->_database, a4);
    v12->_batchSize = a5;
  }

  return v12;
}

- (id)performFetch
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021BA4;
  v4[3] = &unk_100111EF8;
  v4[4] = self;
  v2 = [(AMSDCloudDataFetchChangedRecordsTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

- (AMSDCloudDataDatabase)database
{
  return self->_database;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end