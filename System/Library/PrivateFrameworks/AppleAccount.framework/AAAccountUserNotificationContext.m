@interface AAAccountUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (AAAccountUserNotificationContext)initWithCoder:(id)a3;
- (NSString)altDSID;
- (NSString)message;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setAltDSID:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAAccountUserNotificationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAccountUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AAAccountUserNotificationContext;
  v5 = [(AAAccountUserNotificationContext *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_message"];
    message = v5->_message;
    v5->_message = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    v5->_action = [v4 decodeIntegerForKey:@"_action"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeObject:self->_message forKey:@"_message"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeInteger:self->_action forKey:@"_action"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AAAccountUserNotificationContext allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_message copy];
  message = v4->_message;
  v4->_message = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_altDSID copy];
  altDSID = v4->_altDSID;
  v4->_altDSID = (NSString *)v9;

  v4->_action = self->_action;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Notification Context with title: %@ \nmessage: %@ \naltDSID: %@ ", self->_title, self->_message, self->_altDSID];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end