@interface CALNNotificationRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithIdentifier:(id)a3 content:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (CALNNotificationContent)content;
- (CALNNotificationRequest)initWithCoder:(id)a3;
- (NSString)identifier;
- (id)_initWithIdentifier:(id)a3 content:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CALNNotificationRequest

+ (id)requestWithIdentifier:(id)a3 content:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CALNNotificationRequest alloc] _initWithIdentifier:v6 content:v5];

  return v7;
}

- (id)_initWithIdentifier:(id)a3 content:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNNotificationRequest;
  v8 = [(CALNNotificationRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    content = v8->_content;
    v8->_content = (CALNNotificationContent *)v9;

    uint64_t v11 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = [(CALNNotificationRequest *)self content];
  uint64_t v4 = [v3 hash];
  id v5 = [(CALNNotificationRequest *)self identifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationRequest *)self isEqualToRequest:v4];

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = (CALNNotificationRequest *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    BOOL v5 = [(CALNNotificationRequest *)self identifier];
    unint64_t v6 = [(CALNNotificationRequest *)v4 identifier];
    int v7 = CalEqualStrings();

    if (v7)
    {
      v8 = [(CALNNotificationRequest *)self content];
      uint64_t v9 = [(CALNNotificationRequest *)v4 content];
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
  BOOL v5 = [(CALNNotificationRequest *)self identifier];
  unint64_t v6 = [(CALNNotificationRequest *)self content];
  int v7 = [v3 stringWithFormat:@"<%@: %p>(identifier = %@, content = %@)", v4, self, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNNotificationRequest *)self content];
  [v4 encodeObject:v5 forKey:@"content"];

  id v6 = [(CALNNotificationRequest *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (CALNNotificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  int v7 = [(CALNNotificationRequest *)self _initWithIdentifier:v6 content:v5];
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CALNNotificationContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end