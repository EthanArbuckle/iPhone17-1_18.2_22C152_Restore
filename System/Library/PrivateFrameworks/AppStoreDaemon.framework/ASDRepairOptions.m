@interface ASDRepairOptions
+ (BOOL)supportsSecureCoding;
- (ASDRepairOptions)initWithBundleID:(id)a3;
- (ASDRepairOptions)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5;
- (ASDRepairOptions)initWithBundlePath:(id)a3;
- (ASDRepairOptions)initWithCoder:(id)a3;
- (BOOL)forceRevoke;
- (BOOL)forceUpsell;
- (BOOL)isBackground;
- (NSDictionary)relaunchOptions;
- (NSNumber)accountDSID;
- (NSString)bundleID;
- (NSString)bundlePath;
- (id)copyUserInfoDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (int)fairplayStatus;
- (int64_t)claimStyle;
- (unint64_t)exitReason;
- (void)encodeWithCoder:(id)a3;
- (void)setExitReason:(unint64_t)a3;
- (void)setFairplayStatus:(int)a3;
- (void)setForceRevoke:(BOOL)a3;
- (void)setForceUpsell:(BOOL)a3;
- (void)setIsBackground:(BOOL)a3;
- (void)setRelaunchOptions:(id)a3;
@end

@implementation ASDRepairOptions

- (ASDRepairOptions)initWithBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDRepairOptions;
  v6 = [(ASDRepairOptions *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_INFO, "(RepairService) Created repair options with bundleID: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (ASDRepairOptions)initWithBundlePath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDRepairOptions;
  v6 = [(ASDRepairOptions *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundlePath, a3);
    v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_INFO, "(RepairService) Created repair options with path: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (ASDRepairOptions)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDRepairOptions;
  v11 = [(ASDRepairOptions *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountDSID, a4);
    objc_storeStrong((id *)&v12->_bundleID, a3);
    v12->_claimStyle = a5;
  }

  return v12;
}

- (id)copyUserInfoDictionary
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [a1 bundleID];
  [v2 setObject:v3 forKeyedSubscript:@"bundleID"];

  v4 = [a1 bundlePath];
  [v2 setObject:v4 forKeyedSubscript:@"bundlePath"];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "exitReason"));
  [v2 setObject:v5 forKeyedSubscript:@"exitReason"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isBackground"));
  [v2 setObject:v6 forKeyedSubscript:@"isBackground"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "fairplayStatus"));
  [v2 setObject:v7 forKeyedSubscript:@"status"];

  if (os_variant_has_internal_content())
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "forceRevoke"));
    [v2 setObject:v8 forKeyedSubscript:@"forceRevoke"];

    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "forceUpsell"));
    [v2 setObject:v9 forKeyedSubscript:@"forceUpsell"];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDRepairOptions allocWithZone:](ASDRepairOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_accountDSID copyWithZone:a3];
  accountDSID = v5->_accountDSID;
  v5->_accountDSID = (NSNumber *)v6;

  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_bundlePath copyWithZone:a3];
  bundlePath = v5->_bundlePath;
  v5->_bundlePath = (NSString *)v10;

  v5->_claimStyle = self->_claimStyle;
  v5->_exitReason = self->_exitReason;
  v5->_fairplayStatus = self->_fairplayStatus;
  v5->_isBackground = self->_isBackground;
  uint64_t v12 = [(NSDictionary *)self->_relaunchOptions copyWithZone:a3];
  relaunchOptions = v5->_relaunchOptions;
  v5->_relaunchOptions = (NSDictionary *)v12;

  if (os_variant_has_internal_content())
  {
    v5->_forceRevoke = self->_forceRevoke;
    v5->_forceUpsell = self->_forceUpsell;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRepairOptions)initWithCoder:(id)a3
{
  v22[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDRepairOptions;
  id v5 = [(ASDRepairOptions *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountDSID"];
    accountDSID = v5->_accountDSID;
    v5->_accountDSID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimStyle"];
    v5->_claimStyle = [v12 integerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exitReason"];
    v5->_exitReason = [v13 unsignedIntegerValue];

    objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fairplayStatus"];
    v5->_fairplayStatus = [v14 unsignedIntValue];

    v5->_isBackground = [v4 decodeBoolForKey:@"isBackground"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v22[4] = objc_opt_class();
    v22[5] = objc_opt_class();
    v22[6] = objc_opt_class();
    v22[7] = objc_opt_class();
    v22[8] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:9];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"relaunchOptions"];
    relaunchOptions = v5->_relaunchOptions;
    v5->_relaunchOptions = (NSDictionary *)v18;

    if (os_variant_has_internal_content())
    {
      v5->_forceRevoke = [v4 decodeBoolForKey:@"forceRevoke"];
      v5->_forceUpsell = [v4 decodeBoolForKey:@"forceUpsell"];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(ASDRepairOptions *)self accountDSID];
  [v11 encodeObject:v4 forKey:@"accountDSID"];

  id v5 = [(ASDRepairOptions *)self bundleID];
  [v11 encodeObject:v5 forKey:@"bundleID"];

  uint64_t v6 = [(ASDRepairOptions *)self bundlePath];
  [v11 encodeObject:v6 forKey:@"bundlePath"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[ASDRepairOptions claimStyle](self, "claimStyle"));
  [v11 encodeObject:v7 forKey:@"claimStyle"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ASDRepairOptions exitReason](self, "exitReason"));
  [v11 encodeObject:v8 forKey:@"exitReason"];

  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ASDRepairOptions fairplayStatus](self, "fairplayStatus"));
  [v11 encodeObject:v9 forKey:@"fairplayStatus"];

  objc_msgSend(v11, "encodeBool:forKey:", -[ASDRepairOptions isBackground](self, "isBackground"), @"isBackground");
  uint64_t v10 = [(ASDRepairOptions *)self relaunchOptions];
  [v11 encodeObject:v10 forKey:@"relaunchOptions"];

  if (os_variant_has_internal_content())
  {
    objc_msgSend(v11, "encodeBool:forKey:", -[ASDRepairOptions forceRevoke](self, "forceRevoke"), @"forceRevoke");
    objc_msgSend(v11, "encodeBool:forKey:", -[ASDRepairOptions forceUpsell](self, "forceUpsell"), @"forceUpsell");
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unint64_t)a3
{
  self->_exitReason = a3;
}

- (int)fairplayStatus
{
  return self->_fairplayStatus;
}

- (void)setFairplayStatus:(int)a3
{
  self->_fairplayStatus = a3;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->_isBackground = a3;
}

- (NSDictionary)relaunchOptions
{
  return self->_relaunchOptions;
}

- (void)setRelaunchOptions:(id)a3
{
}

- (BOOL)forceRevoke
{
  return self->_forceRevoke;
}

- (void)setForceRevoke:(BOOL)a3
{
  self->_forceRevoke = a3;
}

- (BOOL)forceUpsell
{
  return self->_forceUpsell;
}

- (void)setForceUpsell:(BOOL)a3
{
  self->_forceUpsell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relaunchOptions, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end