@interface WCDataMessageRecord
- (BOOL)expectsResponse;
- (WCDataMessageRecord)initWithIdentifier:(id)a3 responseHandler:(id)a4 errorHandler:(id)a5;
- (id)description;
- (id)responseHandler;
@end

@implementation WCDataMessageRecord

- (WCDataMessageRecord)initWithIdentifier:(id)a3 responseHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WCDataMessageRecord;
  v9 = [(WCMessageRecord *)&v13 initWithIdentifier:a3 errorHandler:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id responseHandler = v9->_responseHandler;
    v9->_id responseHandler = (id)v10;
  }
  return v9;
}

- (BOOL)expectsResponse
{
  v2 = [(WCDataMessageRecord *)self responseHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WCMessageRecord *)self identifier];
  v7 = [(WCDataMessageRecord *)self responseHandler];
  if (v7) {
    id v8 = "YES";
  }
  else {
    id v8 = "NO";
  }
  v9 = [(WCMessageRecord *)self errorHandler];
  if (v9) {
    uint64_t v10 = "YES";
  }
  else {
    uint64_t v10 = "NO";
  }
  v11 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, hasResponseHandler %s, hasErrorHandler: %s>", v5, self, v6, v8, v10];

  return v11;
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
}

@end