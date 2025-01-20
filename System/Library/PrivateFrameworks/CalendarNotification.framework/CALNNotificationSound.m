@interface CALNNotificationSound
+ (BOOL)supportsSecureCoding;
+ (CALNNotificationSound)soundWithAlertType:(int64_t)a3 alertTopic:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSound:(id)a3;
- (CALNNotificationSound)init;
- (CALNNotificationSound)initWithCoder:(id)a3;
- (NSString)alertTopic;
- (id)_initWithAlertType:(int64_t)a3 alertTopic:(id)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)alertType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CALNNotificationSound

+ (CALNNotificationSound)soundWithAlertType:(int64_t)a3 alertTopic:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) _initWithAlertType:a3 alertTopic:v6];

  return (CALNNotificationSound *)v7;
}

- (id)_initWithAlertType:(int64_t)a3 alertTopic:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNNotificationSound;
  v7 = [(CALNNotificationSound *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_alertType = a3;
    uint64_t v9 = [v6 copy];
    alertTopic = v8->_alertTopic;
    v8->_alertTopic = (NSString *)v9;
  }
  return v8;
}

- (CALNNotificationSound)init
{
  return 0;
}

- (unint64_t)hash
{
  int64_t v3 = [(CALNNotificationSound *)self alertType];
  v4 = [(CALNNotificationSound *)self alertTopic];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationSound *)self isEqualToSound:v4];

  return v5;
}

- (BOOL)isEqualToSound:(id)a3
{
  id v4 = (CALNNotificationSound *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    int64_t v5 = [(CALNNotificationSound *)self alertType];
    if (v5 == [(CALNNotificationSound *)v4 alertType])
    {
      id v6 = [(CALNNotificationSound *)self alertTopic];
      v7 = [(CALNNotificationSound *)v4 alertTopic];
      char v8 = CalEqualStrings();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CALNNotificationSound alertType](self, "alertType"));
  id v6 = [(CALNNotificationSound *)self alertTopic];
  v7 = [v3 stringWithFormat:@"<%@: %p>(alertType = %@, alertTopic = %@)", v4, self, v5, v6];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CALNMutableNotificationSound allocWithZone:a3];
  int64_t v5 = [(CALNNotificationSound *)self alertType];
  id v6 = [(CALNNotificationSound *)self alertTopic];
  id v7 = [(CALNNotificationSound *)v4 _initWithAlertType:v5 alertTopic:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(CALNNotificationSound *)self alertTopic];
  [v5 encodeObject:v4 forKey:@"alertTopic"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CALNNotificationSound alertType](self, "alertType"), @"alertType");
}

- (CALNNotificationSound)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertTopic"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"alertType"];

  id v7 = [(CALNNotificationSound *)self _initWithAlertType:v6 alertTopic:v5];
  return v7;
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)alertTopic
{
  return self->_alertTopic;
}

- (void).cxx_destruct
{
}

@end