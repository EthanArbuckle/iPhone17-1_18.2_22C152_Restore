@interface DESInternalDodMLTaskResult
- (BOOL)deferred;
- (DESInternalDodMLTaskResult)initWithJSONResult:(id)a3 binaryResult:(id)a4 deferred:(BOOL)a5 deferralURL:(id)a6 duration:(double)a7;
- (NSData)binaryResult;
- (NSDictionary)JSONResult;
- (NSURL)deferralURL;
- (double)duration;
- (id)description;
@end

@implementation DESInternalDodMLTaskResult

- (DESInternalDodMLTaskResult)initWithJSONResult:(id)a3 binaryResult:(id)a4 deferred:(BOOL)a5 deferralURL:(id)a6 duration:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DESInternalDodMLTaskResult;
  v16 = [(DESInternalDodMLTaskResult *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_JSONResult, a3);
    objc_storeStrong((id *)&v17->_binaryResult, a4);
    v17->_deferred = a5;
    objc_storeStrong((id *)&v17->_deferralURL, a6);
    v17->_duration = a7;
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(DESInternalDodMLTaskResult *)self binaryResult];
  uint64_t v7 = [v6 length];
  v8 = [(DESInternalDodMLTaskResult *)self deferralURL];
  v9 = [(DESInternalDodMLTaskResult *)self JSONResult];
  [(DESInternalDodMLTaskResult *)self duration];
  v11 = [v3 stringWithFormat:@"%@(binaryResult.length=%lu, deferralURL=%@, JSONResult=%@, duration=%.1f)", v5, v7, v8, v9, v10];

  return v11;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSData)binaryResult
{
  return self->_binaryResult;
}

- (BOOL)deferred
{
  return self->_deferred;
}

- (NSURL)deferralURL
{
  return self->_deferralURL;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferralURL, 0);
  objc_storeStrong((id *)&self->_binaryResult, 0);

  objc_storeStrong((id *)&self->_JSONResult, 0);
}

@end