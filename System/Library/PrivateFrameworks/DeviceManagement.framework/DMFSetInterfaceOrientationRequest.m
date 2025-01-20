@interface DMFSetInterfaceOrientationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)lockOrientation;
- (DMFSetInterfaceOrientationRequest)init;
- (DMFSetInterfaceOrientationRequest)initWithCoder:(id)a3;
- (unint64_t)interfaceOrientation;
- (void)encodeWithCoder:(id)a3;
- (void)setInterfaceOrientation:(unint64_t)a3;
- (void)setLockOrientation:(BOOL)a3;
@end

@implementation DMFSetInterfaceOrientationRequest

- (DMFSetInterfaceOrientationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFSetInterfaceOrientationRequest;
  result = [(CATTaskRequest *)&v3 init];
  if (result) {
    result->_interfaceOrientation = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetInterfaceOrientationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFSetInterfaceOrientationRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockOrientation"];
    v5->_lockOrientation = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interfaceOrientation"];
    v5->_interfaceOrientation = [v7 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFSetInterfaceOrientationRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFSetInterfaceOrientationRequest lockOrientation](self, "lockOrientation", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"lockOrientation"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFSetInterfaceOrientationRequest interfaceOrientation](self, "interfaceOrientation"));
  [v4 encodeObject:v6 forKey:@"interfaceOrientation"];
}

- (BOOL)lockOrientation
{
  return self->_lockOrientation;
}

- (void)setLockOrientation:(BOOL)a3
{
  self->_lockOrientation = a3;
}

- (unint64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(unint64_t)a3
{
  self->_interfaceOrientation = a3;
}

@end