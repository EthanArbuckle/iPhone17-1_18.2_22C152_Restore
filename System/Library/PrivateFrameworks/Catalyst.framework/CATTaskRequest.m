@interface CATTaskRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (Class)whitelistedClassForResultObject;
- (BOOL)handlesNotifications;
- (CATTaskRequest)init;
- (CATTaskRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHandlesNotifications:(BOOL)a3;
@end

@implementation CATTaskRequest

+ (Class)allowlistedClassForResultObject
{
  return 0;
}

+ (Class)whitelistedClassForResultObject
{
  return 0;
}

- (CATTaskRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)CATTaskRequest;
  return [(CATTaskRequest *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CATTaskRequest;
  v5 = [(CATTaskRequest *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handlesNotifications"];
    v5->_handlesNotifications = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[CATTaskRequest handlesNotifications](self, "handlesNotifications"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"handlesNotifications"];
}

- (BOOL)handlesNotifications
{
  return self->_handlesNotifications;
}

- (void)setHandlesNotifications:(BOOL)a3
{
  self->_handlesNotifications = a3;
}

@end