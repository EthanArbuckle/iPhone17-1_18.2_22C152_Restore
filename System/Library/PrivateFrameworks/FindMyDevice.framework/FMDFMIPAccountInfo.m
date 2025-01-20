@interface FMDFMIPAccountInfo
+ (BOOL)supportsSecureCoding;
- (FMDFMIPAccountInfo)initWithCoder:(id)a3;
- (FMDFMIPAccountInfo)initWithUserName:(id)a3 dsid:(id)a4 oneTimeRemoveAuthToken:(id)a5 serverURL:(id)a6;
- (NSString)dsid;
- (NSString)oneTimeRemoveAuthToken;
- (NSString)username;
- (NSURL)serverURL;
- (void)encodeWithCoder:(id)a3;
- (void)setDsid:(id)a3;
- (void)setOneTimeRemoveAuthToken:(id)a3;
- (void)setServerURL:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation FMDFMIPAccountInfo

- (FMDFMIPAccountInfo)initWithUserName:(id)a3 dsid:(id)a4 oneTimeRemoveAuthToken:(id)a5 serverURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMDFMIPAccountInfo;
  v14 = [(FMDFMIPAccountInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(FMDFMIPAccountInfo *)v14 setUsername:v10];
    [(FMDFMIPAccountInfo *)v15 setDsid:v11];
    [(FMDFMIPAccountInfo *)v15 setOneTimeRemoveAuthToken:v12];
    [(FMDFMIPAccountInfo *)v15 setServerURL:v13];
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDFMIPAccountInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDFMIPAccountInfo;
  v5 = [(FMDFMIPAccountInfo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_username);
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDFMIPAccountInfo *)v5 setUsername:v8];

    uint64_t v9 = objc_opt_class();
    id v10 = NSStringFromSelector(sel_dsid);
    id v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDFMIPAccountInfo *)v5 setDsid:v11];

    uint64_t v12 = objc_opt_class();
    id v13 = NSStringFromSelector(sel_oneTimeRemoveAuthToken);
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDFMIPAccountInfo *)v5 setOneTimeRemoveAuthToken:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_serverURL);
    objc_super v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(FMDFMIPAccountInfo *)v5 setServerURL:v17];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDFMIPAccountInfo *)self username];
  uint64_t v6 = NSStringFromSelector(sel_username);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(FMDFMIPAccountInfo *)self dsid];
  v8 = NSStringFromSelector(sel_dsid);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDFMIPAccountInfo *)self oneTimeRemoveAuthToken];
  id v10 = NSStringFromSelector(sel_oneTimeRemoveAuthToken);
  [v4 encodeObject:v9 forKey:v10];

  id v12 = [(FMDFMIPAccountInfo *)self serverURL];
  id v11 = NSStringFromSelector(sel_serverURL);
  [v4 encodeObject:v12 forKey:v11];
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)oneTimeRemoveAuthToken
{
  return self->_oneTimeRemoveAuthToken;
}

- (void)setOneTimeRemoveAuthToken:(id)a3
{
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_oneTimeRemoveAuthToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end