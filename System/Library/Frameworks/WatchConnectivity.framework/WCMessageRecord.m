@interface WCMessageRecord
- (BOOL)expectsResponse;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (OS_dispatch_source)timeoutTimer;
- (WCMessageRecord)initWithIdentifier:(id)a3 errorHandler:(id)a4;
- (id)description;
- (id)errorHandler;
- (unint64_t)hash;
- (void)dealloc;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation WCMessageRecord

- (WCMessageRecord)initWithIdentifier:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WCMessageRecord;
  v8 = [(WCMessageRecord *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    id errorHandler = v8->_errorHandler;
    v8->_id errorHandler = (id)v11;
  }
  return v8;
}

- (void)dealloc
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_source_cancel(timeoutTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)WCMessageRecord;
  [(WCMessageRecord *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WCMessageRecord *)self identifier];
  id v7 = (void *)v6;
  if (self->_errorHandler) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, hasErrorHandler: %s>", v5, self, v6, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (WCMessageRecord *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(WCMessageRecord *)self identifier];
      id v7 = [(WCMessageRecord *)v5 identifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(WCMessageRecord *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_source)timeoutTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_errorHandler, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end