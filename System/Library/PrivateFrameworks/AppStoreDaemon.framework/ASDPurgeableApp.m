@interface ASDPurgeableApp
+ (BOOL)supportsSecureCoding;
- (ASDPurgeableApp)initWithCoder:(id)a3;
- (NSNumber)storeItemID;
- (NSString)bundleID;
- (NSString)purgeableReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)diagnosticDescription;
- (int64_t)purgeableType;
- (int64_t)staticDiskUsage;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setPurgeableReason:(id)a3;
- (void)setPurgeableType:(int64_t)a3;
- (void)setStaticDiskUsage:(int64_t)a3;
- (void)setStoreItemID:(id)a3;
@end

@implementation ASDPurgeableApp

- (id)description
{
  return (id)[NSString stringWithFormat:@"<id: %@ itemID: %@ storage usage: %lld reason: %@ type: %ld>", self->_bundleID, self->_storeItemID, self->_staticDiskUsage, self->_purgeableReason, self->_purgeableType];
}

- (id)diagnosticDescription
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v11[0] = self->_storeItemID;
  v10[0] = @"itemID";
  v10[1] = @"bundleID";
  v3 = [(ASDPurgeableApp *)self bundleID];
  v11[1] = v3;
  v10[2] = @"Disk Usage";
  v4 = [NSNumber numberWithLongLong:self->_staticDiskUsage];
  purgeableReason = self->_purgeableReason;
  int64_t purgeableType = self->_purgeableType;
  v11[2] = v4;
  v11[3] = purgeableReason;
  v10[3] = @"Reason";
  v10[4] = @"Type";
  v7 = [NSNumber numberWithInteger:purgeableType];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_purgeableReason copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[3] = self->_purgeableType;
  v5[4] = self->_staticDiskUsage;
  uint64_t v10 = [(NSNumber *)self->_storeItemID copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeableApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDPurgeableApp *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purgeableReason"];
    purgeableReason = v5->_purgeableReason;
    v5->_purgeableReason = (NSString *)v8;

    v5->_int64_t purgeableType = [v4 decodeIntegerForKey:@"purgeableType"];
    v5->_staticDiskUsage = [v4 decodeInt64ForKey:@"staticDiskUsage"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeItemID"];
    storeItemID = v5->_storeItemID;
    v5->_storeItemID = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDPurgeableApp *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleID"];

  uint64_t v6 = [(ASDPurgeableApp *)self purgeableReason];
  [v4 encodeObject:v6 forKey:@"purgeableReason"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPurgeableApp purgeableType](self, "purgeableType"), @"purgeableType");
  objc_msgSend(v4, "encodeInt64:forKey:", -[ASDPurgeableApp staticDiskUsage](self, "staticDiskUsage"), @"staticDiskUsage");
  id v7 = [(ASDPurgeableApp *)self storeItemID];
  [v4 encodeObject:v7 forKey:@"storeItemID"];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)purgeableReason
{
  return self->_purgeableReason;
}

- (void)setPurgeableReason:(id)a3
{
}

- (int64_t)purgeableType
{
  return self->_purgeableType;
}

- (void)setPurgeableType:(int64_t)a3
{
  self->_int64_t purgeableType = a3;
}

- (int64_t)staticDiskUsage
{
  return self->_staticDiskUsage;
}

- (void)setStaticDiskUsage:(int64_t)a3
{
  self->_staticDiskUsage = a3;
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_purgeableReason, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end