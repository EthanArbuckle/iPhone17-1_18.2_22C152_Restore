@interface APSSystemUser
+ (id)allConsoleUserIDs;
+ (id)allDaemonUserIDs;
+ (id)allSystemUsers;
+ (id)systemUserWithUID:(unsigned int)a3;
+ (id)systemUserWithUserID:(id)a3;
- (APSSystemUser)initWithUserID:(id)a3;
- (BOOL)isDaemonUser;
- (BOOL)isDifferentUser;
- (BOOL)isGuestUser;
- (BOOL)isLoggedIn;
- (BOOL)isLoggedOut;
- (BOOL)isRootUser;
- (NSString)status;
- (NSString)userID;
- (id)debugDescription;
- (unsigned)uid;
- (void)removeUser;
- (void)setStatus:(id)a3;
@end

@implementation APSSystemUser

+ (id)systemUserWithUserID:(id)a3
{
  id v3 = a3;
  if (qword_10015A958 != -1) {
    dispatch_once(&qword_10015A958, &stru_10012BE88);
  }
  v4 = [(id)qword_10015A950 objectForKey:v3];
  if (!v4)
  {
    v4 = [[APSSystemUser alloc] initWithUserID:v3];
    [(id)qword_10015A950 setObject:v4 forKey:v3];
  }

  return v4;
}

+ (id)systemUserWithUID:(unsigned int)a3
{
  v4 = +[NSString stringWithFormat:@"%lld", a3];
  v5 = [a1 systemUserWithUserID:v4];

  return v5;
}

- (APSSystemUser)initWithUserID:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)APSSystemUser;
  v6 = [(APSSystemUser *)&v15 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v6->_userID, a3);
  if ([v5 isEqualToString:APSDefaultUserID])
  {
    BOOL v8 = 1;
    goto LABEL_21;
  }
  unsigned int v9 = [(APSSystemUser *)v7 uid];
  if (qword_10015A960 != -1) {
    dispatch_once(&qword_10015A960, &stru_10012BEA8);
  }
  if (v9 > 0x1F3)
  {
    BOOL v8 = 0;
    goto LABEL_21;
  }
  size_t v10 = qword_100159E48;
  if (qword_100159E48 <= 0)
  {
    size_t v10 = 0x4000;
    qword_100159E48 = 0x4000;
  }
  v11 = (char *)malloc_type_calloc(v10, 1uLL, 0x66A7D5D5uLL);
  v16 = 0;
  memset(&v17, 0, sizeof(v17));
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (getpwuid_r(v9, &v17, v11, qword_100159E48, &v16) || !v16 || !v17.pw_name)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_18:
    }
      sub_1000CAF30(v9);
LABEL_19:
    BOOL v8 = 0;
    goto LABEL_20;
  }
  BOOL v8 = *v17.pw_name == 95;
LABEL_20:
  free(v11);
LABEL_21:
  v7->_daemonUser = v8;
  status = v7->_status;
  v7->_status = (NSString *)@"logged out";

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    userID = (char *)v7->_userID;
    LODWORD(v17.pw_name) = 138412546;
    *(char **)((char *)&v17.pw_name + 4) = (char *)v7;
    WORD2(v17.pw_passwd) = 2112;
    *(char **)((char *)&v17.pw_passwd + 6) = userID;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Initializing system user with uid %@", (uint8_t *)&v17, 0x16u);
  }
LABEL_23:

  return v7;
}

- (unsigned)uid
{
  return [(NSString *)self->_userID longLongValue];
}

- (BOOL)isLoggedIn
{
  return [(NSString *)self->_status isEqualToString:@"logged in"];
}

- (BOOL)isLoggedOut
{
  return [(NSString *)self->_status isEqualToString:@"logged out"];
}

- (BOOL)isDaemonUser
{
  return self->_daemonUser;
}

- (BOOL)isGuestUser
{
  return 0;
}

- (BOOL)isRootUser
{
  return [(NSString *)self->_userID isEqualToString:@"0"];
}

- (BOOL)isDifferentUser
{
  return 0;
}

- (void)removeUser
{
}

- (void)setStatus:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (self->_daemonUser && [v5 isEqualToString:@"logged out"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      userID = self->_userID;
      status = self->_status;
      int v17 = 138413058;
      v18 = self;
      __int16 v19 = 2112;
      v20 = userID;
      __int16 v21 = 2112;
      v22 = status;
      __int16 v23 = 2112;
      v24 = v6;
      unsigned int v9 = "%@: Not changing status for uid %@ from %@ to %@";
      uint32_t v10 = 42;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v10);
    }
  }
  else
  {
    unsigned __int8 v11 = [v6 isEqualToString:self->_status];
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        v13 = self->_userID;
        v14 = self->_status;
        int v17 = 138412802;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v13;
        __int16 v21 = 2112;
        v22 = v14;
        unsigned int v9 = "%@: Not changing status for uid %@, status remains %@";
        uint32_t v10 = 32;
        goto LABEL_8;
      }
    }
    else
    {
      if (v12)
      {
        objc_super v15 = self->_userID;
        v16 = self->_status;
        int v17 = 138413058;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2112;
        v22 = v16;
        __int16 v23 = 2112;
        v24 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Changing status for uid %@ from %@ to %@", (uint8_t *)&v17, 0x2Au);
      }
      objc_storeStrong((id *)&self->_status, a3);
    }
  }
}

+ (id)allConsoleUserIDs
{
  return +[NSMutableSet set];
}

+ (id)allDaemonUserIDs
{
  v2 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [(id)qword_10015A950 count]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend((id)qword_10015A950, "allValues", 0);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isDaemonUser])
        {
          unsigned int v9 = [v8 userID];
          [v2 addObject:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (id)allSystemUsers
{
  return [(id)qword_10015A950 allValues];
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if (self->_daemonUser) {
    id v4 = "yes";
  }
  else {
    id v4 = "no";
  }
  return +[NSString stringWithFormat:@"<<%@: %p>: { userID=%@, status=%@, daemonUser=%s>", v3, self, self->_userID, self->_status, v4];
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestUserCache, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end