@interface DMFSetVoiceRoamingEnabledRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (BOOL)enabled;
- (DMFSetVoiceRoamingEnabledRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation DMFSetVoiceRoamingEnabledRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABCE8;
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

- (DMFSetVoiceRoamingEnabledRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFSetVoiceRoamingEnabledRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enabled"];
    *(&v5->super.super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetVoiceRoamingEnabledRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFSetVoiceRoamingEnabledRequest enabled](self, "enabled", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"enabled"];
}

- (BOOL)enabled
{
  return *(&self->super.super._handlesNotifications + 1);
}

- (void)setEnabled:(BOOL)a3
{
  *(&self->super.super._handlesNotifications + 1) = a3;
}

@end