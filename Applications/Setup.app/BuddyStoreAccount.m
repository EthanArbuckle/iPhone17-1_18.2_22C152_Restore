@interface BuddyStoreAccount
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRestoreStoreAccount:(id)a3;
- (BuddyStoreAccount)initWithUsername:(id)a3 dsid:(id)a4 altDSID:(id)a5;
- (NSString)altDSID;
- (NSString)dsid;
- (NSString)username;
- (id)description;
- (unint64_t)hash;
- (void)setAltDSID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation BuddyStoreAccount

- (BuddyStoreAccount)initWithUsername:(id)a3 dsid:(id)a4 altDSID:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v7 = v15;
  id v15 = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyStoreAccount;
  v8 = [(BuddyStoreAccount *)&v11 init];
  id v15 = v8;
  objc_storeStrong(&v15, v8);
  if (v8)
  {
    [v15 setUsername:location[0]];
    [v15 setDsid:v13];
    [v15 setAltDSID:v12];
  }
  v9 = (BuddyStoreAccount *)v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (id)description
{
  uint64_t v2 = objc_opt_class();
  v3 = [(BuddyStoreAccount *)self username];
  v4 = [(BuddyStoreAccount *)self dsid];
  v5 = [(BuddyStoreAccount *)self altDSID];
  v6 = +[NSString stringWithFormat:@"<%@: %p> Username: %@, DSID: %@, altDSID: %@", v2, self, v3, v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5 == location[0])
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v6 = [(BuddyStoreAccount *)v5 isEqualToRestoreStoreAccount:location[0]];
    }
    else {
      char v6 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isEqualToRestoreStoreAccount:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyStoreAccount *)v17 dsid];
  char v14 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    id v15 = [location[0] dsid];
    char v14 = 1;
    BOOL v4 = v15 != 0;
  }
  if (v14) {

  }
  if (v4)
  {
    v5 = [(BuddyStoreAccount *)v17 dsid];
    id v6 = [location[0] dsid];
    char v18 = [(NSString *)v5 isEqualToString:v6];
  }
  else
  {
    id v7 = [(BuddyStoreAccount *)v17 altDSID];
    char v12 = 0;
    BOOL v8 = 0;
    if (v7)
    {
      id v13 = [location[0] altDSID];
      char v12 = 1;
      BOOL v8 = v13 != 0;
    }
    if (v12) {

    }
    if (v8)
    {
      v9 = [(BuddyStoreAccount *)v17 altDSID];
      id v10 = [location[0] altDSID];
    }
    else
    {
      v9 = [(BuddyStoreAccount *)v17 username];
      id v10 = [location[0] username];
    }
    char v18 = [(NSString *)v9 isEqualToString:v10];
  }
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (unint64_t)hash
{
  uint64_t v2 = [(BuddyStoreAccount *)self username];
  NSUInteger v3 = [(NSString *)v2 hash];
  BOOL v4 = [(BuddyStoreAccount *)self dsid];
  unint64_t v5 = v3 ^ [(NSString *)v4 hash];
  id v6 = [(BuddyStoreAccount *)self altDSID];
  unint64_t v7 = v5 ^ [(NSString *)v6 hash];

  return v7;
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUsername:(id)a3
{
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end