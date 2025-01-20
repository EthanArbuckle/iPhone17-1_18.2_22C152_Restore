@interface iCloudStorageSummary
- (BOOL)isiCloudPlusSubscriber;
- (NSNumber)totalStorage;
- (NSNumber)usedStorage;
- (iCloudStorageSummary)initWithStorageSummary:(id)a3;
- (void)setIsiCloudPlusSubscriber:(BOOL)a3;
- (void)setTotalStorage:(id)a3;
- (void)setUsedStorage:(id)a3;
@end

@implementation iCloudStorageSummary

- (iCloudStorageSummary)initWithStorageSummary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)iCloudStorageSummary;
  v5 = [(iCloudStorageSummary *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 totalStorage];
    totalStorage = v5->_totalStorage;
    v5->_totalStorage = (NSNumber *)v6;

    uint64_t v8 = [v4 usedStorage];
    usedStorage = v5->_usedStorage;
    v5->_usedStorage = (NSNumber *)v8;

    v10 = [v4 subscriptionInfo];
    v5->_isiCloudPlusSubscriber = [v10 isiCloudPlusSubscriber];
  }
  return v5;
}

- (NSNumber)totalStorage
{
  return self->_totalStorage;
}

- (void)setTotalStorage:(id)a3
{
}

- (NSNumber)usedStorage
{
  return self->_usedStorage;
}

- (void)setUsedStorage:(id)a3
{
}

- (BOOL)isiCloudPlusSubscriber
{
  return self->_isiCloudPlusSubscriber;
}

- (void)setIsiCloudPlusSubscriber:(BOOL)a3
{
  self->_isiCloudPlusSubscriber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedStorage, 0);
  objc_storeStrong((id *)&self->_totalStorage, 0);
}

@end