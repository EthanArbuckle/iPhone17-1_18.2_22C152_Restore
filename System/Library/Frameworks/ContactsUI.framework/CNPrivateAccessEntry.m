@interface CNPrivateAccessEntry
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isForClientWithBundleIdentifier:(id)a3;
- (BOOL)isPrivateAccessTipDismissedByUser;
- (CNPrivateAccessEntry)initWithBundleIdentifier:(id)a3 privateAccessTipDismissedByUser:(BOOL)a4;
- (CNPrivateAccessEntry)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (double)lastAccessTimestamp;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLastAccessTimeToNow;
@end

@implementation CNPrivateAccessEntry

- (void).cxx_destruct
{
}

- (BOOL)isPrivateAccessTipDismissedByUser
{
  return self->_isPrivateAccessTipDismissedByUser;
}

- (double)lastAccessTimestamp
{
  return self->_lastAccessTimestamp;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isExpired
{
  v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v4 = [v3 timeProvider];
  [v4 timestamp];
  LOBYTE(self) = v5 - self->_lastAccessTimestamp > 2592000.0;

  return (char)self;
}

- (void)setLastAccessTimeToNow
{
  id v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v3 = [v5 timeProvider];
  [v3 timestamp];
  self->_lastAccessTimestamp = v4;
}

- (BOOL)isForClientWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPrivateAccessEntry *)self bundleIdentifier];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNPrivateAccessEntry *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      char v6 = v5;
    }
    else {
      char v6 = 0;
    }
    v7 = v6;

    if (v7)
    {
      v8 = [(CNPrivateAccessEntry *)self bundleIdentifier];
      v9 = [(CNPrivateAccessEntry *)v7 bundleIdentifier];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v2 = [(CNPrivateAccessEntry *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (CNPrivateAccessEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNPrivateAccessEntry;
  id v5 = [(CNPrivateAccessEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"kPrivateAccessEntryBundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    [v4 decodeDoubleForKey:@"kPrivateAccessEntryTimeStamp"];
    v5->_lastAccessTimestamp = v8;
    v5->_isPrivateAccessTipDismissedByUser = [v4 decodeBoolForKey:@"kPrivateAccessEntryPrivateAccessTipDismissedByUser"];
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CNPrivateAccessEntry *)self bundleIdentifier];
  [v5 encodeObject:v4 forKey:@"kPrivateAccessEntryBundleIdentifier"];

  [(CNPrivateAccessEntry *)self lastAccessTimestamp];
  objc_msgSend(v5, "encodeDouble:forKey:", @"kPrivateAccessEntryTimeStamp");
  objc_msgSend(v5, "encodeBool:forKey:", -[CNPrivateAccessEntry isPrivateAccessTipDismissedByUser](self, "isPrivateAccessTipDismissedByUser"), @"kPrivateAccessEntryPrivateAccessTipDismissedByUser");
}

- (CNPrivateAccessEntry)initWithBundleIdentifier:(id)a3 privateAccessTipDismissedByUser:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPrivateAccessEntry;
  double v8 = [(CNPrivateAccessEntry *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    char v10 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    objc_super v11 = [v10 timeProvider];
    [v11 timestamp];
    v9->_lastAccessTimestamp = v12;

    v9->_isPrivateAccessTipDismissedByUser = a4;
    v13 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)log
{
  if (log_cn_once_token_1_21924 != -1) {
    dispatch_once(&log_cn_once_token_1_21924, &__block_literal_global_21925);
  }
  v2 = (void *)log_cn_once_object_1_21926;

  return v2;
}

void __27__CNPrivateAccessEntry_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "PrivateAccess");
  v1 = (void *)log_cn_once_object_1_21926;
  log_cn_once_object_1_21926 = (uint64_t)v0;
}

@end