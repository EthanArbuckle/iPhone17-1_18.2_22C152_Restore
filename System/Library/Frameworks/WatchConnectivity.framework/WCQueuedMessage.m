@interface WCQueuedMessage
- (NSDate)creationDate;
- (WCMessage)message;
- (WCQueuedMessage)initWithMessage:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)retryCount;
- (void)setCompletionHandler:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation WCQueuedMessage

- (WCQueuedMessage)initWithMessage:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WCQueuedMessage;
  v9 = [(WCQueuedMessage *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_retryCount = 0;
    objc_storeStrong((id *)&v9->_message, a3);
    uint64_t v11 = objc_opt_new();
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v11;

    uint64_t v13 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v13;
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WCQueuedMessage *)self message];
  id v7 = [v6 identifier];
  id v8 = [(WCQueuedMessage *)self creationDate];
  v9 = [v3 stringWithFormat:@"<%@: %p, message id: %@, creation date: %@>", v5, self, v7, v8];

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(WCQueuedMessage *)self creationDate];
  v6 = [v4 creationDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (WCMessage)message
{
  return (WCMessage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessage:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end