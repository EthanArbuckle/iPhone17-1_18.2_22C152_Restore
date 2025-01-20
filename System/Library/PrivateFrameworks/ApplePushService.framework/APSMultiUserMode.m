@interface APSMultiUserMode
+ (BOOL)_getIsCurrentlyLoggedIn;
+ (BOOL)_getMultiUserMode;
+ (id)sharedInstance;
- (APSMultiUserMode)initWithIsMultiUserMode:(BOOL)a3 loggedInUser:(BOOL)a4;
- (BOOL)isLoggedInUser;
- (BOOL)isMultiAndLoggedIn;
- (BOOL)isMultiUser;
@end

@implementation APSMultiUserMode

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC60;
  block[3] = &unk_100129C08;
  block[4] = a1;
  if (qword_10015A800 != -1) {
    dispatch_once(&qword_10015A800, block);
  }
  v2 = (void *)qword_10015A808;
  return v2;
}

+ (BOOL)_getMultiUserMode
{
  v2 = [(id)CUTWeakLinkClass() sharedManager];
  unsigned __int8 v3 = [v2 isMultiUser];

  return v3;
}

+ (BOOL)_getIsCurrentlyLoggedIn
{
  v2 = [(id)CUTWeakLinkClass() sharedManager];
  unsigned __int8 v3 = [v2 currentUser];
  char v4 = [v3 isLoginUser] ^ 1;

  return v4;
}

- (APSMultiUserMode)initWithIsMultiUserMode:(BOOL)a3 loggedInUser:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)APSMultiUserMode;
  result = [(APSMultiUserMode *)&v7 init];
  if (result)
  {
    result->_isMultiUser = a3;
    result->_isLoggedInUser = a4;
  }
  return result;
}

- (BOOL)isMultiAndLoggedIn
{
  return self->_isMultiUser && self->_isLoggedInUser;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (BOOL)isLoggedInUser
{
  return self->_isLoggedInUser;
}

@end