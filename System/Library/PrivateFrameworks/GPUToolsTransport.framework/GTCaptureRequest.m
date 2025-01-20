@interface GTCaptureRequest
+ (BOOL)supportsSecureCoding;
- (GTCaptureRequest)init;
- (GTCaptureRequest)initWithCoder:(id)a3;
- (GTCaptureRequest)initWithRequestID:(unint64_t)a3;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTCaptureRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTCaptureRequest;
  v2 = [(GTCaptureRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_requestID = atomic_fetch_add(g_requestID, 1u);
    v4 = v2;
  }

  return v3;
}

- (GTCaptureRequest)initWithRequestID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTCaptureRequest;
  result = [(GTCaptureRequest *)&v5 init];
  if (result) {
    result->_requestID = a3;
  }
  return result;
}

- (GTCaptureRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureRequest;
  objc_super v5 = [(GTCaptureRequest *)&v8 init];
  if (v5)
  {
    v5->_requestID = [v4 decodeInt64ForKey:@"requestID"];
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)requestID
{
  return self->_requestID;
}

@end