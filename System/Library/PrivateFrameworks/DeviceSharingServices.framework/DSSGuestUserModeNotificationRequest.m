@interface DSSGuestUserModeNotificationRequest
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (DSSGuestUserModeNotificationRequest)init;
- (DSSGuestUserModeNotificationRequest)initWithCoder:(id)a3;
- (DSSGuestUserModeNotificationRequest)initWithReason:(id)a3 withType:(unint64_t)a4;
- (NSString)reason;
- (id)description;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DSSGuestUserModeNotificationRequest

+ (id)new
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DSSGuestUserModeNotificationRequest)init
{
}

- (DSSGuestUserModeNotificationRequest)initWithReason:(id)a3 withType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DSSGuestUserModeNotificationRequest;
  v8 = [(DSSGuestUserModeNotificationRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_reason, a3);
    v9->_notificationType = a4;
  }

  return v9;
}

- (DSSGuestUserModeNotificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSSGuestUserModeNotificationRequest;
  v5 = [(DSSGuestUserModeNotificationRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DSSGuestUserModeNotificationRequest.Reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_notificationType = [v4 decodeIntegerForKey:@"DSSGuestUserModeNotificationRequest.Type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  reason = self->_reason;
  id v5 = a3;
  [v5 encodeObject:reason forKey:@"DSSGuestUserModeNotificationRequest.Reason"];
  [v5 encodeInteger:self->_notificationType forKey:@"DSSGuestUserModeNotificationRequest.Type"];
}

- (id)description
{
  v3 = NSString;
  ClassName = object_getClassName(self);
  unint64_t notificationType = self->_notificationType;
  if (notificationType > 4) {
    uint64_t v6 = @"Invalid";
  }
  else {
    uint64_t v6 = off_2652F5B38[notificationType];
  }
  return (id)[v3 stringWithFormat:@"<%s: %p, { Reason: %@ NotificationType: %@}>", ClassName, self, self->_reason, v6];
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (void).cxx_destruct
{
}

@end