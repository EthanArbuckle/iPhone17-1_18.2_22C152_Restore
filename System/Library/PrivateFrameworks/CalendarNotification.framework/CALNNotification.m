@interface CALNNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationWithRequest:(id)a3 date:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNotification:(id)a3;
- (CALNNotification)initWithCoder:(id)a3;
- (CALNNotification)initWithNotificationRequest:(id)a3 date:(id)a4;
- (CALNNotificationRequest)request;
- (NSDate)date;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CALNNotification

+ (id)notificationWithRequest:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CALNNotification alloc] initWithNotificationRequest:v6 date:v5];

  return v7;
}

- (CALNNotification)initWithNotificationRequest:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNNotification;
  v8 = [(CALNNotification *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    uint64_t v11 = [v6 copy];
    request = v8->_request;
    v8->_request = (CALNNotificationRequest *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = [(CALNNotification *)self date];
  uint64_t v4 = [v3 hash];
  id v5 = [(CALNNotification *)self request];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotification *)self isEqualToNotification:v4];

  return v5;
}

- (BOOL)isEqualToNotification:(id)a3
{
  id v4 = (CALNNotification *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    BOOL v5 = [(CALNNotification *)self date];
    unint64_t v6 = [(CALNNotification *)v4 date];
    int v7 = CalEqualObjects();

    if (v7)
    {
      v8 = [(CALNNotification *)self request];
      uint64_t v9 = [(CALNNotification *)v4 request];
      char v10 = CalEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CALNNotification *)self date];
  unint64_t v6 = [(CALNNotification *)self request];
  int v7 = [v3 stringWithFormat:@"<%@: %p(date: %@, request: %@)", v4, self, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNNotification *)self date];
  [v4 encodeObject:v5 forKey:@"date"];

  id v6 = [(CALNNotification *)self request];
  [v4 encodeObject:v6 forKey:@"request"];
}

- (CALNNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];

  int v7 = [(CALNNotification *)self initWithNotificationRequest:v6 date:v5];
  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (CALNNotificationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end