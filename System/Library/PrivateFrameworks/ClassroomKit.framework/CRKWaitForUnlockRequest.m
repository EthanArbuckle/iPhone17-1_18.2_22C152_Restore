@interface CRKWaitForUnlockRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldBecomeExclusive;
- (CRKWaitForUnlockRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldBecomeExclusive:(BOOL)a3;
@end

@implementation CRKWaitForUnlockRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKWaitForUnlockRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKWaitForUnlockRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shouldBecomeExclusive"];
    *(&v5->super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKWaitForUnlockRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKWaitForUnlockRequest shouldBecomeExclusive](self, "shouldBecomeExclusive", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"shouldBecomeExclusive"];
}

- (BOOL)shouldBecomeExclusive
{
  return *(&self->super._handlesNotifications + 1);
}

- (void)setShouldBecomeExclusive:(BOOL)a3
{
  *(&self->super._handlesNotifications + 1) = a3;
}

@end