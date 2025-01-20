@interface GTTelemetryRequest
+ (BOOL)supportsSecureCoding;
- (GTTelemetryRequest)init;
- (GTTelemetryRequest)initWithCoder:(id)a3;
- (id)initNoRequestID;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestID:(unint64_t)a3;
@end

@implementation GTTelemetryRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryRequest;
  v2 = [(GTTelemetryRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_requestID = atomic_fetch_add(globalRequestID_0, 1u);
    v4 = v2;
  }

  return v3;
}

- (id)initNoRequestID
{
  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryRequest;
  v2 = [(GTTelemetryRequest *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (GTTelemetryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTTelemetryRequest;
  v5 = [(GTTelemetryRequest *)&v8 init];
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

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

@end