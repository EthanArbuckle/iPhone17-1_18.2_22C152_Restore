@interface CRKRemoteConnectionRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKRemoteConnectionRequest)initWithCoder:(id)a3;
- (double)notificationDuration;
- (void)encodeWithCoder:(id)a3;
- (void)setNotificationDuration:(double)a3;
@end

@implementation CRKRemoteConnectionRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKRemoteConnectionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKRemoteConnectionRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationDuration"];
    [v6 doubleValue];
    v5->_notificationDuration = v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKRemoteConnectionRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = NSNumber;
  [(CRKRemoteConnectionRequest *)self notificationDuration];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 encodeObject:v6 forKey:@"notificationDuration"];
}

- (double)notificationDuration
{
  return self->_notificationDuration;
}

- (void)setNotificationDuration:(double)a3
{
  self->_notificationDuration = a3;
}

@end