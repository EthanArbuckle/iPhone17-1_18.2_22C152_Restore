@interface SSAnnotationUser
+ (id)userWithDisplayName:(id)a3;
- (NSString)displayName;
- (NSString)userID;
- (SSAnnotationUser)initWithDisplayName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation SSAnnotationUser

+ (id)userWithDisplayName:(id)a3
{
  id v3 = a3;
  v4 = [[SSAnnotationUser alloc] initWithDisplayName:v3];

  return v4;
}

- (SSAnnotationUser)initWithDisplayName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSAnnotationUser;
  v5 = [(SSAnnotationUser *)&v10 init];
  if (v5)
  {
    v6 = +[NSUUID UUID];
    v7 = [v6 UUIDString];
    [(SSAnnotationUser *)v5 setUserID:v7];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(SSAnnotationUser *)v5 userID];
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "userID = %@", buf, 0xCu);
    }
    [(SSAnnotationUser *)v5 setDisplayName:v4];
  }

  return v5;
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserID:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

@end