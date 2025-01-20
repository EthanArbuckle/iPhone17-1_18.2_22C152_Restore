@interface DCBGSTask
- (DCBGSTask)initWithTaskIdentifier:(id)a3 observerIdentifier:(id)a4;
- (NSNumber)refreshInterval;
- (NSString)observerID;
- (NSString)taskID;
- (id)taskHandler;
- (void)setObserverID:(id)a3;
- (void)setRefreshInterval:(id)a3;
- (void)setTaskHandler:(id)a3;
- (void)setTaskID:(id)a3;
@end

@implementation DCBGSTask

- (DCBGSTask)initWithTaskIdentifier:(id)a3 observerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DCBGSTask;
  v8 = [(DCBGSTask *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(DCBGSTask *)v8 setTaskID:v6];
    [(DCBGSTask *)v9 setObserverID:v7];
  }

  return v9;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
}

- (NSString)observerID
{
  return self->_observerID;
}

- (void)setObserverID:(id)a3
{
}

- (NSNumber)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(id)a3
{
}

- (id)taskHandler
{
  return self->_taskHandler;
}

- (void)setTaskHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskHandler, 0);
  objc_storeStrong((id *)&self->_refreshInterval, 0);
  objc_storeStrong((id *)&self->_observerID, 0);

  objc_storeStrong((id *)&self->_taskID, 0);
}

@end