@interface CRKRemoteConnectionResultObject
+ (BOOL)supportsSecureCoding;
- (CRKRemoteConnectionResultObject)initWithCoder:(id)a3;
- (int64_t)response;
- (void)encodeWithCoder:(id)a3;
- (void)setResponse:(int64_t)a3;
@end

@implementation CRKRemoteConnectionResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKRemoteConnectionResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKRemoteConnectionResultObject;
  v5 = [(CATTaskResultObject *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"response"];
    v5->_response = [v6 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKRemoteConnectionResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKRemoteConnectionResultObject response](self, "response", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"response"];
}

- (int64_t)response
{
  return self->_response;
}

- (void)setResponse:(int64_t)a3
{
  self->_response = a3;
}

@end