@interface CRKSetMuteStateRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldMute;
- (CRKSetMuteStateRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMute:(BOOL)a3;
@end

@implementation CRKSetMuteStateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKSetMuteStateRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKSetMuteStateRequest shouldMute](self, "shouldMute", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"mute"];
}

- (CRKSetMuteStateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKSetMuteStateRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mute"];
    *(&v5->super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (BOOL)shouldMute
{
  return *(&self->super._handlesNotifications + 1);
}

- (void)setMute:(BOOL)a3
{
  *(&self->super._handlesNotifications + 1) = a3;
}

@end