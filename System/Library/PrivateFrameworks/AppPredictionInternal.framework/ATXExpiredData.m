@interface ATXExpiredData
- (ATXExpiredData)initWithExpiredBundleIds:(id)a3 expiredActionKeys:(id)a4;
- (NSSet)expiredActionKeys;
- (NSSet)expiredBundleIds;
@end

@implementation ATXExpiredData

- (ATXExpiredData)initWithExpiredBundleIds:(id)a3 expiredActionKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXExpiredData;
  v9 = [(ATXExpiredData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expiredBundleIds, a3);
    objc_storeStrong((id *)&v10->_expiredActionKeys, a4);
  }

  return v10;
}

- (NSSet)expiredBundleIds
{
  return self->_expiredBundleIds;
}

- (NSSet)expiredActionKeys
{
  return self->_expiredActionKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiredActionKeys, 0);
  objc_storeStrong((id *)&self->_expiredBundleIds, 0);
}

@end