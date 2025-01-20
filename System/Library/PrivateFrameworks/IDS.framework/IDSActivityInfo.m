@interface IDSActivityInfo
+ (BOOL)supportsSecureCoding;
+ (id)activityInfoWithSubActivity:(id)a3 URIs:(id)a4;
+ (id)activityInfoWithSubActivity:(id)a3 devices:(id)a4;
+ (id)activityInfoWithSubActivity:(id)a3 tokens:(id)a4;
- (BOOL)isIdentical:(id)a3;
- (IDSActivityInfo)initWithCoder:(id)a3;
- (NSArray)URIs;
- (NSArray)deviceUniqueIDs;
- (NSArray)tokens;
- (NSData)appContext;
- (NSDate)expirationDate;
- (NSString)subActivity;
- (id)_initWithSubActivity:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppContext:(id)a3;
@end

@implementation IDSActivityInfo

+ (id)activityInfoWithSubActivity:(id)a3 tokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ([v6 length])
    {
      v9 = (void *)[objc_alloc((Class)a1) _initWithSubActivity:v6];
      if (v9)
      {
        uint64_t v10 = [v8 copy];
        v11 = (void *)v9[5];
        v9[5] = v10;
      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)activityInfoWithSubActivity:(id)a3 URIs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ([v6 length])
    {
      v9 = (void *)[objc_alloc((Class)a1) _initWithSubActivity:v6];
      if (v9)
      {
        uint64_t v10 = [v8 copy];
        v11 = (void *)v9[6];
        v9[6] = v10;
      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)activityInfoWithSubActivity:(id)a3 devices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ([v6 length])
    {
      v9 = (void *)[objc_alloc((Class)a1) _initWithSubActivity:v6];
      if (v9)
      {
        uint64_t v10 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &unk_1EE246368);
        v11 = (void *)v9[4];
        v9[4] = v10;
      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)_initWithSubActivity:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IDSActivityInfo;
  id v6 = [(IDSActivityInfo *)&v22 init];
  p_isa = (id *)&v6->super.isa;
  if (!v6) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_subActivity, a3);
  v8 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  v9 = [v8 objectForKey:@"presence-subscription-ttl-sec"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [NSNumber numberWithLong:3888000];
  }
  v11 = v10;
  v12 = [MEMORY[0x1E4F1C9C8] date];
  v13 = objc_opt_new();
  objc_msgSend(v13, "setSecond:", objc_msgSend(v11, "unsignedLongValue"));
  v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v15 = [v14 dateByAddingComponents:v13 toDate:v12 options:0];
  id v16 = p_isa[2];
  p_isa[2] = (id)v15;

  [p_isa[2] timeIntervalSinceNow];
  if (v17 >= 0.0)
  {

LABEL_7:
    v18 = p_isa;
    goto LABEL_11;
  }
  v19 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = p_isa[2];
    *(_DWORD *)buf = 138412290;
    id v24 = v20;
    _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Expiration dates in the past are not allowed: %@", buf, 0xCu);
  }

  v18 = 0;
LABEL_11:

  return v18;
}

- (id)description
{
  tokens = self->_tokens;
  if (tokens)
  {
    [NSString stringWithFormat:@" tokens: %@", tokens];
LABEL_7:
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (self->_URIs)
  {
    [NSString stringWithFormat:@" URIs: %@", self->_URIs];
    goto LABEL_7;
  }
  if (self->_deviceUniqueIDs)
  {
    [NSString stringWithFormat:@" deviceUniqueIDs: %@", self->_deviceUniqueIDs];
    goto LABEL_7;
  }
  v4 = &stru_1EE2476E8;
LABEL_8:
  objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; subactivity: %@ expirationDate: %@%@>",
    objc_opt_class(),
    self,
    self->_subActivity,
    self->_expirationDate,
  id v5 = v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  subActivity = self->_subActivity;
  id v5 = a3;
  [v5 encodeObject:subActivity forKey:@"subActivity"];
  [v5 encodeObject:self->_appContext forKey:@"appcontext"];
  [v5 encodeObject:self->_deviceUniqueIDs forKey:@"deviceids"];
  [v5 encodeObject:self->_tokens forKey:@"tokens"];
  [v5 encodeObject:self->_URIs forKey:@"uris"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (IDSActivityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subActivity"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appcontext"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"deviceids"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"tokens"];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  double v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v18 = [v4 decodeObjectOfClasses:v17 forKey:@"uris"];

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];

  id v20 = [(IDSActivityInfo *)self _initWithSubActivity:v5];
  v21 = (IDSActivityInfo *)v20;
  if (v20)
  {
    objc_storeStrong(v20 + 3, v6);
    objc_storeStrong((id *)&v21->_deviceUniqueIDs, v10);
    objc_storeStrong((id *)&v21->_tokens, v14);
    objc_storeStrong((id *)&v21->_URIs, v18);
    objc_storeStrong((id *)&v21->_expirationDate, v19);
  }

  return v21;
}

- (BOOL)isIdentical:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tokens];

  if (v5)
  {
    id v6 = [v4 tokens];
    uint64_t v7 = [(IDSActivityInfo *)self tokens];
    goto LABEL_5;
  }
  uint64_t v8 = [v4 URIs];

  if (v8)
  {
    id v6 = [v4 URIs];
    uint64_t v7 = [(IDSActivityInfo *)self URIs];
LABEL_5:
    v9 = (void *)v7;
    char v10 = [v6 isEqual:v7];

    if (v10)
    {
LABEL_6:
      v11 = [v4 subActivity];
      uint64_t v12 = [(IDSActivityInfo *)self subActivity];
      LODWORD(v13) = [v11 isEqualToString:v12];

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v13 = [v4 deviceUniqueIDs];

  if (!v13) {
    goto LABEL_10;
  }
  v14 = [v4 deviceUniqueIDs];
  uint64_t v15 = [(IDSActivityInfo *)self deviceUniqueIDs];
  int v16 = [v14 isEqual:v15];

  if (v16) {
    goto LABEL_6;
  }
LABEL_9:
  LODWORD(v13) = 0;
LABEL_10:
  double v17 = [v4 appContext];

  if (v17) {
    char v18 = 0;
  }
  else {
    char v18 = (char)v13;
  }
  if (v17 && v13)
  {
    v19 = [v4 appContext];
    id v20 = [(IDSActivityInfo *)self appContext];
    char v18 = [v19 isEqualToData:v20];
  }
  return v18;
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSData)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
}

- (NSArray)deviceUniqueIDs
{
  return self->_deviceUniqueIDs;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSArray)URIs
{
  return self->_URIs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URIs, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_deviceUniqueIDs, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_subActivity, 0);
}

@end