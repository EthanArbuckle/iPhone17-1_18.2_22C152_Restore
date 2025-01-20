@interface HMBCloudZoneFetchRecordsContext
- (HMBCloudZoneFetchRecordsContext)initWithRecordIDs:(id)a3 future:(id)a4;
- (NAFuture)future;
- (NSSet)recordIDs;
@end

@implementation HMBCloudZoneFetchRecordsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

- (NAFuture)future
{
  return (NAFuture *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)recordIDs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (HMBCloudZoneFetchRecordsContext)initWithRecordIDs:(id)a3 future:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBCloudZoneFetchRecordsContext;
  v9 = [(HMBCloudZoneFetchRecordsContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordIDs, a3);
    objc_storeStrong((id *)&v10->_future, a4);
  }

  return v10;
}

@end