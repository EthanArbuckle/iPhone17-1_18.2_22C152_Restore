@interface DRSSubmitLogRequest
+ (Class)_moClass;
+ (id)entityName;
- (BOOL)isEqualToRequest:(id)a3;
- (id)_initWithSubmitLogRequestMO_ON_MOC_QUEUE:(id)a3;
- (id)replyForMessage:(id)a3;
- (id)requestType;
- (unint64_t)expectedType;
- (void)_configureRequestMO:(id)a3;
@end

@implementation DRSSubmitLogRequest

- (void)_configureRequestMO:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DRSSubmitLogRequest;
  [(DRSRequest *)&v7 _configureRequestMO:v4];
  id v5 = v4;
  v6 = [(DRSRequest *)self logType];
  [v5 setLogType:v6];
}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return @"DRSSubmitLogRequestMO";
}

- (unint64_t)expectedType
{
  return 2;
}

- (id)_initWithSubmitLogRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DRSSubmitLogRequest;
  id v5 = [(DRSRequest *)&v8 _initWithRequestMO_ON_MOC_QUEUE:v4];
  if (v5)
  {
    v6 = [v4 logType];
    [v5 setLogType:v6];
  }
  return v5;
}

- (id)requestType
{
  return @"SubmitLog";
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSSubmitLogRequest;
  if ([(DRSRequest *)&v10 isEqualToRequest:v4])
  {
    id v5 = v4;
    v6 = [(DRSRequest *)self logType];
    objc_super v7 = [v5 logType];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)replyForMessage:(id)a3
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    uint64_t v5 = [(DRSRequest *)self requestState];
    if (DRSRequestOutcomeForState(v5) == 1 && (v5 == 4357 || v5 == 4352))
    {
      xpc_dictionary_set_BOOL(reply, "SubmitLog_DidSucceed", 0);
      uint64_t v6 = [(DRSRequest *)self errorDescription];
      objc_super v7 = (void *)v6;
      char v8 = @"Unknown";
      if (v6) {
        char v8 = (__CFString *)v6;
      }
      v9 = v8;

      objc_super v10 = v9;
      v11 = (const char *)[(__CFString *)v10 UTF8String];

      xpc_dictionary_set_string(reply, "SubmitLog_FailureReason", v11);
    }
    else
    {
      xpc_dictionary_set_BOOL(reply, "SubmitLog_DidSucceed", 1);
    }
    id v12 = reply;
  }

  return reply;
}

@end