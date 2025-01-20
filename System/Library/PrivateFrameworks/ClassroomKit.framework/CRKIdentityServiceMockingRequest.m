@interface CRKIdentityServiceMockingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldDisable;
- (CRKIdentityServiceMockingRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldDisable:(BOOL)a3;
@end

@implementation CRKIdentityServiceMockingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKIdentityServiceMockingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKIdentityServiceMockingRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shouldDisable"];
    *(&v5->super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKIdentityServiceMockingRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKIdentityServiceMockingRequest shouldDisable](self, "shouldDisable", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"shouldDisable"];
}

- (BOOL)shouldDisable
{
  return *(&self->super._handlesNotifications + 1);
}

- (void)setShouldDisable:(BOOL)a3
{
  *(&self->super._handlesNotifications + 1) = a3;
}

@end