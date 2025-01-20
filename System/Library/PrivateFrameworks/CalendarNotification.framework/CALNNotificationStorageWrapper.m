@interface CALNNotificationStorageWrapper
- (CALNNotificationStorage)wrappedStorage;
- (CALNNotificationStorageWrapper)initWithWrappedStorage:(id)a3;
- (id)notificationRecords;
- (void)addNotificationRecord:(id)a3;
- (void)addNotificationRecords:(id)a3;
- (void)removeAllNotificationRecords;
- (void)removeNotificationRecordsPassingTest:(id)a3;
- (void)setWrappedStorage:(id)a3;
@end

@implementation CALNNotificationStorageWrapper

- (CALNNotificationStorageWrapper)initWithWrappedStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNNotificationStorageWrapper;
  v6 = [(CALNNotificationStorageWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedStorage, a3);
  }

  return v7;
}

- (void)addNotificationRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNNotificationStorageWrapper *)self wrappedStorage];
  [v5 addNotificationRecord:v4];
}

- (id)notificationRecords
{
  v2 = [(CALNNotificationStorageWrapper *)self wrappedStorage];
  v3 = [v2 notificationRecords];

  return v3;
}

- (void)removeNotificationRecordsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNNotificationStorageWrapper *)self wrappedStorage];
  [v5 removeNotificationRecordsPassingTest:v4];
}

- (void)addNotificationRecords:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNNotificationStorageWrapper *)self wrappedStorage];
  [v5 addNotificationRecords:v4];
}

- (void)removeAllNotificationRecords
{
  id v2 = [(CALNNotificationStorageWrapper *)self wrappedStorage];
  [v2 removeAllNotificationRecords];
}

- (CALNNotificationStorage)wrappedStorage
{
  return (CALNNotificationStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWrappedStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end