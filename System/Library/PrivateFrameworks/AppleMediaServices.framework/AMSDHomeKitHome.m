@interface AMSDHomeKitHome
- (AMSDHomeKitDataSource)dataSource;
- (AMSDHomeKitHome)initWithHome:(id)a3 dataSource:(id)a4;
- (AMSDHomeUser)currentUser;
- (AMSDHomeUser)owner;
- (BOOL)currentUserNeedsTokenRepair;
- (BOOL)isCurrentDeviceAccessory;
- (BOOL)isCurrentUserOwner;
- (BOOL)isCurrentUserRestrictedGuest;
- (BOOL)isMultiUserEnabled;
- (BOOL)isPrimary;
- (BOOL)isRestrictedGuestUserIdentifier:(id)a3;
- (HMHome)home;
- (NSArray)users;
- (NSString)hashedDescription;
- (NSString)name;
- (NSUUID)identifier;
- (id)listeningHistoryUpdateEnabledForUser:(id)a3;
- (id)setCurrentUserNeedsTokenRepair:(BOOL)a3;
- (id)userWithIdentifier:(id)a3;
- (unint64_t)mediaProfileEnabledForUser:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation AMSDHomeKitHome

- (AMSDHomeKitHome)initWithHome:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDHomeKitHome;
  v9 = [(AMSDHomeKitHome *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a4);
    objc_storeStrong((id *)&v10->_home, a3);
  }

  return v10;
}

- (NSString)hashedDescription
{
  uint64_t v17 = objc_opt_class();
  v18 = [(AMSDHomeKitHome *)self name];
  v16 = AMSHashIfNeeded();
  v3 = [(AMSDHomeKitHome *)self identifier];
  v4 = AMSHashIfNeeded();
  if ([(AMSDHomeKitHome *)self isPrimary]) {
    CFStringRef v5 = @"true";
  }
  else {
    CFStringRef v5 = @"false";
  }
  v6 = [(AMSDHomeKitHome *)self owner];
  id v7 = [v6 identifier];
  id v8 = AMSHashIfNeeded();
  v9 = [(AMSDHomeKitHome *)self currentUser];
  v10 = [v9 identifier];
  v11 = AMSHashIfNeeded();
  unsigned int v12 = [(AMSDHomeKitHome *)self isCurrentUserOwner];
  CFStringRef v13 = @"true";
  if (!v12) {
    CFStringRef v13 = @"false";
  }
  v14 = +[NSString stringWithFormat:@"<%@: %p name = %@ | homeIdentifier = %@ | isPrimary = %@ | owner = %@ | currentUser = %@ | isCurrentUserOwner = %@>", v17, self, v16, v4, v5, v8, v11, v13];

  return (NSString *)v14;
}

- (BOOL)isCurrentDeviceAccessory
{
  v3 = [(AMSDHomeKitHome *)self dataSource];
  v4 = [(AMSDHomeKitHome *)self home];
  CFStringRef v5 = [v3 currentDeviceIsAccessoryForHome:v4];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isCurrentUserOwner
{
  v3 = [(AMSDHomeKitHome *)self currentUser];
  v4 = [v3 identifier];
  CFStringRef v5 = [(AMSDHomeKitHome *)self owner];
  unsigned __int8 v6 = [v5 identifier];
  unsigned __int8 v7 = [v4 isEqual:v6];

  return v7;
}

- (AMSDHomeUser)currentUser
{
  v3 = [AMSDHomeKitHomeUser alloc];
  v4 = [(AMSDHomeKitHome *)self home];
  CFStringRef v5 = [v4 currentUser];
  unsigned __int8 v6 = [(AMSDHomeKitHomeUser *)v3 initWithUser:v5];

  return (AMSDHomeUser *)v6;
}

- (BOOL)currentUserNeedsTokenRepair
{
  v2 = [(AMSDHomeKitHome *)self home];
  v3 = [v2 currentUser];
  unsigned __int8 v4 = [v3 needsiTunesMultiUserRepair];

  return v4;
}

- (NSUUID)identifier
{
  v2 = [(AMSDHomeKitHome *)self home];
  v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (BOOL)isPrimary
{
  v2 = [(AMSDHomeKitHome *)self home];
  unsigned __int8 v3 = [v2 isPrimary];

  return v3;
}

- (BOOL)isMultiUserEnabled
{
  v2 = [(AMSDHomeKitHome *)self home];
  unsigned __int8 v3 = [v2 isMultiUserEnabled];

  return v3;
}

- (NSString)name
{
  v2 = [(AMSDHomeKitHome *)self home];
  unsigned __int8 v3 = [v2 name];

  return (NSString *)v3;
}

- (AMSDHomeUser)owner
{
  v2 = [(AMSDHomeKitHome *)self home];
  unsigned __int8 v3 = [v2 owner];

  if (v3) {
    unsigned __int8 v4 = [[AMSDHomeKitHomeUser alloc] initWithUser:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return (AMSDHomeUser *)v4;
}

- (NSArray)users
{
  unsigned __int8 v3 = [(AMSDHomeKitHome *)self dataSource];
  unsigned __int8 v4 = [(AMSDHomeKitHome *)self home];
  CFStringRef v5 = [v3 allUsersInHome:v4];
  unsigned __int8 v6 = objc_msgSend(v5, "ams_mapWithTransform:", &stru_100112FF8);

  return (NSArray *)v6;
}

- (BOOL)isRestrictedGuestUserIdentifier:(id)a3
{
  unsigned __int8 v4 = [(AMSDHomeKitHome *)self userWithIdentifier:a3];
  CFStringRef v5 = [(AMSDHomeKitHome *)self home];
  unsigned __int8 v6 = [v4 user];
  unsigned __int8 v7 = [v5 homeAccessControlForUser:v6];

  LOBYTE(v5) = [v7 isRestrictedGuest];
  return (char)v5;
}

- (BOOL)isCurrentUserRestrictedGuest
{
  v2 = self;
  unsigned __int8 v3 = [(AMSDHomeKitHome *)self currentUser];
  unsigned __int8 v4 = [v3 identifier];
  LOBYTE(v2) = [(AMSDHomeKitHome *)v2 isRestrictedGuestUserIdentifier:v4];

  return (char)v2;
}

- (unint64_t)mediaProfileEnabledForUser:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(AMSDHomeKitHome *)self dataSource];
  unsigned __int8 v6 = [(AMSDHomeKitHome *)self identifier];
  unsigned __int8 v7 = [v5 homeWithIdentifier:v6];
  id v8 = [v7 resultWithError:0];

  v9 = [(AMSDHomeKitHome *)self dataSource];
  v10 = [v9 allUsersInHome:v8];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003817C;
  v20[3] = &unk_100112ED8;
  id v11 = v4;
  id v21 = v11;
  unsigned int v12 = objc_msgSend(v10, "ams_firstObjectPassingTest:", v20);

  CFStringRef v13 = [(AMSDHomeKitHome *)self dataSource];
  id v14 = [v13 mediaProfileEnabledForUser:v12 home:v8];

  if (!v14)
  {
    v15 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine if a user's media profile is enabled.", buf, 0x16u);
    }
  }

  return (unint64_t)v14;
}

- (id)setCurrentUserNeedsTokenRepair:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)AMSMutableBinaryPromise);
  unsigned __int8 v6 = [(AMSDHomeKitHome *)self home];
  unsigned __int8 v7 = [v6 currentUser];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000382C4;
  v10[3] = &unk_100111F20;
  id v8 = v5;
  id v11 = v8;
  [v7 setNeedsiTunesMultiUserRepair:v3 completion:v10];

  return v8;
}

- (id)userWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDHomeKitHome *)self users];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000383A8;
  v9[3] = &unk_1001122D0;
  id v10 = v4;
  id v6 = v4;
  unsigned __int8 v7 = objc_msgSend(v5, "ams_firstObjectPassingTest:", v9);

  return v7;
}

- (id)listeningHistoryUpdateEnabledForUser:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDHomeKitHome *)self dataSource];
  id v6 = [(AMSDHomeKitHome *)self identifier];
  unsigned __int8 v7 = [v5 homeWithIdentifier:v6];
  id v8 = [v7 resultWithError:0];

  v9 = [(AMSDHomeKitHome *)self dataSource];
  id v10 = [v9 allUsersInHome:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100038558;
  v16[3] = &unk_100112ED8;
  id v17 = v4;
  id v11 = v4;
  unsigned int v12 = objc_msgSend(v10, "ams_firstObjectPassingTest:", v16);

  CFStringRef v13 = [(AMSDHomeKitHome *)self dataSource];
  id v14 = [v13 listeningHistoryUpdateEnabledForUser:v12 home:v8];

  return v14;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (AMSDHomeKitDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end