@interface CALNFilteredNotificationManager
- (BOOL)isProtectedDataAvailable;
- (CALNFilteredNotificationManager)initWithWrappedNotificationManager:(id)a3 predicate:(id)a4;
- (CALNNotificationManager)wrappedNotificationManager;
- (id)fetchRecordsWithSourceIdentifier:(id)a3;
- (id)predicate;
- (void)addRecord:(id)a3;
- (void)removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4;
- (void)updateRecord:(id)a3;
@end

@implementation CALNFilteredNotificationManager

- (CALNFilteredNotificationManager)initWithWrappedNotificationManager:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNFilteredNotificationManager;
  v9 = [(CALNFilteredNotificationManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappedNotificationManager, a3);
    uint64_t v11 = [v8 copy];
    id predicate = v10->_predicate;
    v10->_id predicate = (id)v11;
  }
  return v10;
}

- (BOOL)isProtectedDataAvailable
{
  v2 = [(CALNFilteredNotificationManager *)self wrappedNotificationManager];
  char v3 = [v2 isProtectedDataAvailable];

  return v3;
}

- (void)addRecord:(id)a3
{
  id v7 = a3;
  v4 = [(CALNFilteredNotificationManager *)self predicate];
  int v5 = v4[2]();

  if (v5)
  {
    v6 = [(CALNFilteredNotificationManager *)self wrappedNotificationManager];
    [v6 addRecord:v7];
  }
}

- (id)fetchRecordsWithSourceIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(CALNFilteredNotificationManager *)self predicate];
  int v6 = v5[2]();

  if (v6)
  {
    id v7 = [(CALNFilteredNotificationManager *)self wrappedNotificationManager];
    id v8 = [v7 fetchRecordsWithSourceIdentifier:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CALNFilteredNotificationManager *)self predicate];
  int v8 = v7[2]();

  if (v8)
  {
    v9 = [(CALNFilteredNotificationManager *)self wrappedNotificationManager];
    [v9 removeRecordWithSourceIdentifier:v10 sourceClientIdentifier:v6];
  }
}

- (void)updateRecord:(id)a3
{
  id v7 = a3;
  id v4 = [(CALNFilteredNotificationManager *)self predicate];
  int v5 = v4[2]();

  if (v5)
  {
    id v6 = [(CALNFilteredNotificationManager *)self wrappedNotificationManager];
    [v6 updateRecord:v7];
  }
}

- (CALNNotificationManager)wrappedNotificationManager
{
  return self->_wrappedNotificationManager;
}

- (id)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
  objc_storeStrong((id *)&self->_wrappedNotificationManager, 0);
}

@end