@interface CRKPostUserNotificationRequest
+ (BOOL)supportsSecureCoding;
- (CRKPostUserNotificationRequest)initWithCoder:(id)a3;
- (int64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setNotificationType:(int64_t)a3;
@end

@implementation CRKPostUserNotificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKPostUserNotificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKPostUserNotificationRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationType"];
    v5->_notificationType = [v6 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKPostUserNotificationRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKPostUserNotificationRequest notificationType](self, "notificationType", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"notificationType"];
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int64_t)a3
{
  self->_notificationType = a3;
}

@end