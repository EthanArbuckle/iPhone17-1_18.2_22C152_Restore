@interface DMFLogOutUserRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (BOOL)forceLogout;
- (Class)classForCoder;
- (DMFLogOutUserRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setForceLogout:(BOOL)a3;
@end

@implementation DMFLogOutUserRequest

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB9A0;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFLogOutUserRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFLogOutUserRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"forceLogout"];
    *(&v5->super.super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFLogOutUserRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFLogOutUserRequest forceLogout](self, "forceLogout", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"forceLogout"];
}

- (BOOL)forceLogout
{
  return *(&self->super.super._handlesNotifications + 1);
}

- (void)setForceLogout:(BOOL)a3
{
  *(&self->super.super._handlesNotifications + 1) = a3;
}

@end