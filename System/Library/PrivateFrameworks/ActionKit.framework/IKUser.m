@interface IKUser
- (BOOL)isSubscribed;
- (IKUser)init;
- (NSString)username;
- (id)description;
- (unint64_t)userID;
- (void)dealloc;
- (void)setSubscribed:(BOOL)a3;
- (void)setUserID:(unint64_t)a3;
- (void)setUsername:(id)a3;
@end

@implementation IKUser

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUserID:(unint64_t)a3
{
  self->_userID = a3;
}

- (unint64_t)userID
{
  return self->_userID;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IKUser;
  [(IKUser *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %@ (%lu), subscribed:%d>", NSStringFromClass(v4), -[IKUser username](self, "username"), -[IKUser userID](self, "userID"), -[IKUser isSubscribed](self, "isSubscribed")];
}

- (IKUser)init
{
  v3.receiver = self;
  v3.super_class = (Class)IKUser;
  result = [(IKUser *)&v3 init];
  if (result)
  {
    result->_userID = 0x7FFFFFFFFFFFFFFFLL;
    result->_username = 0;
    result->_subscribed = 0;
  }
  return result;
}

@end