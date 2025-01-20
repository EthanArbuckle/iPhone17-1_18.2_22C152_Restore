@interface NEAppInfo
+ (BOOL)supportsSecureCoding;
- (NEAppInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEAppInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdHash, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (self)
  {
    int pid = self->_pid;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int pid = 0;
  if (v4) {
LABEL_3:
  }
    v4[2] = pid;
LABEL_4:
  if (self)
  {
    uuid = self->_uuid;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uuid = 0;
  if (v4) {
LABEL_6:
  }
    objc_setProperty_nonatomic_copy(v4, v5, uuid, 16);
LABEL_7:
  if (self)
  {
    bundleID = self->_bundleID;
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  bundleID = 0;
  if (v6) {
LABEL_9:
  }
    objc_setProperty_nonatomic_copy(v6, v5, bundleID, 24);
LABEL_10:
  if (self)
  {
    appVersion = self->_appVersion;
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  appVersion = 0;
  if (v6) {
LABEL_12:
  }
    objc_setProperty_nonatomic_copy(v6, v5, appVersion, 32);
LABEL_13:
  if (!self)
  {
    cdHash = 0;
    if (!v6) {
      return v6;
    }
    goto LABEL_15;
  }
  cdHash = self->_cdHash;
  if (v6) {
LABEL_15:
  }
    objc_setProperty_nonatomic_copy(v6, v5, cdHash, 40);
  return v6;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  if (self)
  {
    uint64_t pid = self->_pid;
    v5 = self->_uuid;
    v6 = self->_bundleID;
    v7 = self->_appVersion;
    v8 = self->_cdHash;
    BOOL v9 = self->_cdHash != 0;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    uint64_t pid = 0;
    v5 = 0;
    v7 = 0;
    BOOL v9 = 0;
  }
  v10 = (void *)[v3 initWithFormat:@"\nNEAppInfo:\n\tPid:\t\t%d\n\tUUID:\t\t%@\n\tBundle ID:\t%@\n\tApp Version:\t%@\n\tCDHash:\t\t%@\n\tComplete:\t%d\n", pid, v5, v6, v7, v8, v9];

  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self)
  {
    uint64_t pid = self->_pid;
    v5 = self->_uuid;
    v6 = self->_bundleID;
    v7 = self->_appVersion;
    v8 = self->_cdHash;
    BOOL v9 = self->_cdHash != 0;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    uint64_t pid = 0;
    v5 = 0;
    v7 = 0;
    BOOL v9 = 0;
  }
  v10 = (void *)[v3 initWithFormat:@"\nNEAppInfo:\n\tPid:\t\t%d\n\tUUID:\t\t%@\n\tBundle ID:\t%@\n\tApp Version:\t%@\n\tCDHash:\t\t%@\n\tComplete:\t%d\n", pid, v5, v6, v7, v8, v9];

  return v10;
}

- (NEAppInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEAppInfo;
  v5 = [(NEAppInfo *)&v15 init];
  if (v5)
  {
    v5->_uint64_t pid = [v4 decodeIntForKey:@"Pid"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    objc_setProperty_nonatomic_copy(v5, v7, v6, 16);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleID"];
    objc_setProperty_nonatomic_copy(v5, v9, v8, 24);

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppVersion"];
    objc_setProperty_nonatomic_copy(v5, v11, v10, 32);

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CDHash"];
    objc_setProperty_nonatomic_copy(v5, v13, v12, 40);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeInt:self->_pid forKey:@"Pid"];
    [v5 encodeObject:self->_uuid forKey:@"UUID"];
    [v5 encodeObject:self->_bundleID forKey:@"BundleID"];
    [v5 encodeObject:self->_appVersion forKey:@"AppVersion"];
    cdHash = self->_cdHash;
  }
  else
  {
    [v5 encodeInt:0 forKey:@"Pid"];
    [v5 encodeObject:0 forKey:@"UUID"];
    [v5 encodeObject:0 forKey:@"BundleID"];
    [v5 encodeObject:0 forKey:@"AppVersion"];
    cdHash = 0;
  }
  [v5 encodeObject:cdHash forKey:@"CDHash"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end