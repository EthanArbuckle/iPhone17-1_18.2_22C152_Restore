@interface DDSAssetPolicy
+ (BOOL)supportsSecureCoding;
+ (id)assetPolicy;
- (BOOL)downloadOverCellular;
- (BOOL)downloadWithoutPower;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssetPolicy:(id)a3;
- (DDSAssetPolicy)init;
- (DDSAssetPolicy)initWithCoder:(id)a3;
- (NSDateComponents)idleUsageEvictionPeriod;
- (NSSet)notificationDownloadTriggers;
- (NSString)downloadCompletionNotification;
- (id)description;
- (id)dumpDescription;
- (id)stringForAssetDownloadFrequency:(int64_t)a3;
- (int64_t)preferredDownloadFrequency;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadCompletionNotification:(id)a3;
- (void)setDownloadOverCellular:(BOOL)a3;
- (void)setDownloadWithoutPower:(BOOL)a3;
- (void)setIdleUsageEvictionPeriod:(id)a3;
- (void)setNotificationDownloadTriggers:(id)a3;
- (void)setPreferredDownloadFrequency:(int64_t)a3;
@end

@implementation DDSAssetPolicy

+ (id)assetPolicy
{
  objc_opt_class();
  v2 = (void *)[(id)objc_claimAutoreleasedReturnValue() init];
  return v2;
}

- (DDSAssetPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)DDSAssetPolicy;
  v2 = [(DDSAssetPolicy *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_preferredDownloadFrequency = 0;
    *(_WORD *)&v2->_downloadOverCellular = 256;
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    notificationDownloadTriggers = v3->_notificationDownloadTriggers;
    v3->_notificationDownloadTriggers = v4;
  }
  return v3;
}

- (DDSAssetPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DDSAssetPolicy;
  v5 = [(DDSAssetPolicy *)&v35 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_preferredDownloadFrequency);
    v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    v5->_preferredDownloadFrequency = [v9 integerValue];

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_downloadOverCellular);
    v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    v5->_downloadOverCellular = [v12 BOOLValue];

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_downloadWithoutPower);
    v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    v5->_downloadWithoutPower = [v15 BOOLValue];

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_downloadCompletionNotification);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    downloadCompletionNotification = v5->_downloadCompletionNotification;
    v5->_downloadCompletionNotification = (NSString *)v18;

    uint64_t v20 = objc_opt_class();
    v21 = NSStringFromSelector(sel_idleUsageEvictionPeriod);
    uint64_t v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
    idleUsageEvictionPeriod = v5->_idleUsageEvictionPeriod;
    v5->_idleUsageEvictionPeriod = (NSDateComponents *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v27 = NSStringFromSelector(sel_notificationDownloadTriggers);
    id v34 = 0;
    uint64_t v28 = [v4 decodeTopLevelObjectOfClasses:v26 forKey:v27 error:&v34];
    id v29 = v34;
    notificationDownloadTriggers = v5->_notificationDownloadTriggers;
    v5->_notificationDownloadTriggers = (NSSet *)v28;

    v6 = v5;
    if (v29)
    {
      v31 = DefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        [(DDSAssetPolicy *)(uint64_t)v5 initWithCoder:v31];
      }

      v6 = 0;
    }
  }
  v32 = v6;

  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", -[DDSAssetPolicy preferredDownloadFrequency](self, "preferredDownloadFrequency"));
  uint64_t v7 = NSStringFromSelector(sel_preferredDownloadFrequency);
  [v5 encodeObject:v6 forKey:v7];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[DDSAssetPolicy downloadOverCellular](self, "downloadOverCellular"));
  v9 = NSStringFromSelector(sel_downloadOverCellular);
  [v5 encodeObject:v8 forKey:v9];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DDSAssetPolicy downloadWithoutPower](self, "downloadWithoutPower"));
  v11 = NSStringFromSelector(sel_downloadWithoutPower);
  [v5 encodeObject:v10 forKey:v11];

  v12 = [(DDSAssetPolicy *)self notificationDownloadTriggers];
  uint64_t v13 = NSStringFromSelector(sel_notificationDownloadTriggers);
  [v5 encodeObject:v12 forKey:v13];

  v14 = [(DDSAssetPolicy *)self downloadCompletionNotification];
  v15 = NSStringFromSelector(sel_downloadCompletionNotification);
  [v5 encodeObject:v14 forKey:v15];

  id v17 = [(DDSAssetPolicy *)self idleUsageEvictionPeriod];
  uint64_t v16 = NSStringFromSelector(sel_idleUsageEvictionPeriod);
  [v5 encodeObject:v17 forKey:v16];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, pdf: %ld, doc: %d, dwp: %d>", objc_opt_class(), self, -[DDSAssetPolicy preferredDownloadFrequency](self, "preferredDownloadFrequency"), -[DDSAssetPolicy downloadOverCellular](self, "downloadOverCellular"), -[DDSAssetPolicy downloadWithoutPower](self, "downloadWithoutPower")];
}

- (id)dumpDescription
{
  v3 = objc_opt_new();
  if (DDS_IS_INTERNAL_INSTALL())
  {
    id v4 = NSString;
    id v5 = [(DDSAssetPolicy *)self stringForAssetDownloadFrequency:[(DDSAssetPolicy *)self preferredDownloadFrequency]];
    v6 = [v4 stringWithFormat:@"Frequency: %@", v5];

    uint64_t v7 = NSString;
    BOOL v8 = [(DDSAssetPolicy *)self downloadOverCellular];
    v9 = @"5G+Inexpensive";
    if (v8) {
      v9 = @"all";
    }
    uint64_t v10 = [v7 stringWithFormat:@"Cellular: %@", v9];
    v11 = NSString;
    BOOL v12 = [(DDSAssetPolicy *)self downloadWithoutPower];
    uint64_t v13 = @"required";
    if (v12) {
      uint64_t v13 = @"not required";
    }
    v14 = [v11 stringWithFormat:@"Power: %@", v13];
    id v15 = [NSString stringWithFormat:@"%@, %@, %@", v6, v10, v14];
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

- (id)stringForAssetDownloadFrequency:(int64_t)a3
{
  v3 = @"Immediate";
  if (a3 == 1) {
    v3 = @"Daily";
  }
  if (a3 == 2) {
    return @"Weekly";
  }
  else {
    return v3;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(DDSAssetPolicy *)self isEqualToAssetPolicy:v4];

  return v5;
}

- (BOOL)isEqualToAssetPolicy:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DDSAssetPolicy *)self notificationDownloadTriggers];
  v6 = [v4 notificationDownloadTriggers];
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    uint64_t v7 = [(DDSAssetPolicy *)self downloadCompletionNotification];
    BOOL v8 = [v4 downloadCompletionNotification];
    if (DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = [(DDSAssetPolicy *)self idleUsageEvictionPeriod];
      uint64_t v10 = [v4 idleUsageEvictionPeriod];
      if (DDSObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10)
        && (int64_t v11 = [(DDSAssetPolicy *)self preferredDownloadFrequency],
            v11 == [v4 preferredDownloadFrequency])
        && (int v12 = [(DDSAssetPolicy *)self downloadWithoutPower],
            v12 == [v4 downloadWithoutPower]))
      {
        BOOL v15 = [(DDSAssetPolicy *)self downloadOverCellular];
        int v13 = v15 ^ [v4 downloadOverCellular] ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(DDSAssetPolicy *)self notificationDownloadTriggers];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(DDSAssetPolicy *)self downloadCompletionNotification];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(DDSAssetPolicy *)self idleUsageEvictionPeriod];
  uint64_t v8 = v6 ^ [v7 hash];
  if ([(DDSAssetPolicy *)self downloadOverCellular]) {
    uint64_t v9 = 1231;
  }
  else {
    uint64_t v9 = 1237;
  }
  if ([(DDSAssetPolicy *)self downloadWithoutPower]) {
    uint64_t v10 = 1231;
  }
  else {
    uint64_t v10 = 1237;
  }
  unint64_t v11 = v8 ^ v9 ^ v10 ^ [(DDSAssetPolicy *)self preferredDownloadFrequency];

  return v11;
}

- (int64_t)preferredDownloadFrequency
{
  return self->_preferredDownloadFrequency;
}

- (void)setPreferredDownloadFrequency:(int64_t)a3
{
  self->_preferredDownloadFrequency = a3;
}

- (BOOL)downloadOverCellular
{
  return self->_downloadOverCellular;
}

- (void)setDownloadOverCellular:(BOOL)a3
{
  self->_downloadOverCellular = a3;
}

- (BOOL)downloadWithoutPower
{
  return self->_downloadWithoutPower;
}

- (void)setDownloadWithoutPower:(BOOL)a3
{
  self->_downloadWithoutPower = a3;
}

- (NSSet)notificationDownloadTriggers
{
  return self->_notificationDownloadTriggers;
}

- (void)setNotificationDownloadTriggers:(id)a3
{
}

- (NSString)downloadCompletionNotification
{
  return self->_downloadCompletionNotification;
}

- (void)setDownloadCompletionNotification:(id)a3
{
}

- (NSDateComponents)idleUsageEvictionPeriod
{
  return self->_idleUsageEvictionPeriod;
}

- (void)setIdleUsageEvictionPeriod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleUsageEvictionPeriod, 0);
  objc_storeStrong((id *)&self->_downloadCompletionNotification, 0);
  objc_storeStrong((id *)&self->_notificationDownloadTriggers, 0);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138543618;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1E41D6000, a3, OS_LOG_TYPE_ERROR, "Error decoding %{public}@ (%{public}@)", (uint8_t *)&v5, 0x16u);
}

@end