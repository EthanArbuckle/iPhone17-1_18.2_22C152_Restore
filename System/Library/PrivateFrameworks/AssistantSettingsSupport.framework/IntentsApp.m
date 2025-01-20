@interface IntentsApp
- (BOOL)accessGranted;
- (IntentsApp)initWithAppId:(id)a3 displayName:(id)a4 accessGranted:(BOOL)a5;
- (NSString)appID;
- (NSString)displayName;
- (int64_t)compareWithIntentsApp:(id)a3;
@end

@implementation IntentsApp

- (IntentsApp)initWithAppId:(id)a3 displayName:(id)a4 accessGranted:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IntentsApp;
  v11 = [(IntentsApp *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appID, a3);
    objc_storeStrong((id *)&v12->_displayName, a4);
    v12->_accessGranted = a5;
  }

  return v12;
}

- (int64_t)compareWithIntentsApp:(id)a3
{
  id v4 = a3;
  v5 = [(IntentsApp *)self displayName];
  v6 = [v4 displayName];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)appID
{
  return self->_appID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)accessGranted
{
  return self->_accessGranted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_appID, 0);
}

@end