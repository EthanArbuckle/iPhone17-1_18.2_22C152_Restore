@interface HMDAppleAccountContext
- (BOOL)isEqual:(id)a3;
- (HMDAppleAccountContext)init;
- (HMDAppleAccountContext)initWithAccount:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)alternateDSID;
- (NSString)identifier;
- (NSString)username;
- (unint64_t)hash;
@end

@implementation HMDAppleAccountContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)alternateDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDAppleAccountContext *)self identifier];
  v5 = [MEMORY[0x1E4F65538] defaultFormatter];
  v6 = (void *)[v3 initWithName:@"ID" value:v4 options:0 formatter:v5];
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDAppleAccountContext *)self username];
  v9 = +[HMDAccountHandleFormatter defaultFormatter];
  v10 = (void *)[v7 initWithName:@"UN" value:v8 options:0 formatter:v9];
  v17[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v12 = [(HMDAppleAccountContext *)self alternateDSID];
  v13 = [MEMORY[0x1E4F65538] defaultFormatter];
  v14 = (void *)[v11 initWithName:@"ADSID" value:v12 options:0 formatter:v13];
  v17[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];

  return (NSArray *)v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDAppleAccountContext *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (!v6) {
      goto LABEL_9;
    }
    id v7 = [(HMDAppleAccountContext *)self identifier];
    v8 = [(HMDAppleAccountContext *)v6 identifier];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_9;
    }
    v10 = [(HMDAppleAccountContext *)self username];
    id v11 = [(HMDAppleAccountContext *)v6 username];
    int v12 = HMFEqualObjects();

    if (v12)
    {
      v13 = [(HMDAppleAccountContext *)self alternateDSID];
      v14 = [(HMDAppleAccountContext *)v6 alternateDSID];
      char v15 = HMFEqualObjects();
    }
    else
    {
LABEL_9:
      char v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  v2 = [(HMDAppleAccountContext *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDAppleAccountContext)initWithAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDAppleAccountContext;
    v5 = [(HMDAppleAccountContext *)&v17 init];
    if (v5)
    {
      v6 = [v4 username];
      uint64_t v7 = [v6 copy];
      username = v5->_username;
      v5->_username = (NSString *)v7;

      int v9 = objc_msgSend(v4, "aa_personID");
      uint64_t v10 = [v9 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

      int v12 = objc_msgSend(v4, "aa_altDSID");
      uint64_t v13 = [v12 copy];
      alternateDSID = v5->_alternateDSID;
      v5->_alternateDSID = (NSString *)v13;
    }
    self = v5;
    char v15 = self;
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (HMDAppleAccountContext)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end