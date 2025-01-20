@interface MIBundleMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataFromURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (MIBundleMetadata)initWithCoder:(id)a3;
- (NSDate)installDate;
- (NSError)placeholderFailureUnderlyingError;
- (NSSet)linkedChildBundleIDs;
- (NSString)alternateIconName;
- (NSString)installBuildVersion;
- (NSString)linkedParentBundleID;
- (NSString)watchKitAppExecutableHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)autoInstallOverride;
- (unint64_t)installType;
- (unint64_t)placeholderFailureReason;
- (unint64_t)placeholderFailureUnderlyingErrorSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateIconName:(id)a3;
- (void)setAutoInstallOverride:(unint64_t)a3;
- (void)setInstallBuildVersion:(id)a3;
- (void)setInstallDate:(id)a3;
- (void)setInstallType:(unint64_t)a3;
- (void)setLinkedChildBundleIDs:(id)a3;
- (void)setLinkedParentBundleID:(id)a3;
- (void)setPlaceholderFailureReason:(unint64_t)a3;
- (void)setPlaceholderFailureUnderlyingError:(id)a3;
- (void)setPlaceholderFailureUnderlyingErrorSource:(unint64_t)a3;
- (void)setWatchKitAppExecutableHash:(id)a3;
@end

@implementation MIBundleMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIBundleMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIBundleMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installDate"];
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installBuildVersion"];
    installBuildVersion = v5->_installBuildVersion;
    v5->_installBuildVersion = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installType"];
    v5->_installType = [v10 unsignedIntegerValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureReason"];
    v5->_placeholderFailureReason = [v11 unsignedIntegerValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureUnderlyingError"];
    placeholderFailureUnderlyingError = v5->_placeholderFailureUnderlyingError;
    v5->_placeholderFailureUnderlyingError = (NSError *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureUnderlyingErrorSource"];
    v5->_placeholderFailureUnderlyingErrorSource = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchKitAppExecutableHash"];
    watchKitAppExecutableHash = v5->_watchKitAppExecutableHash;
    v5->_watchKitAppExecutableHash = (NSString *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoInstallOverride"];
    v5->_autoInstallOverride = [v17 unsignedIntegerValue];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateIconName"];
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkedParentBundleID"];
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"linkedChildBundleIDs"];
    linkedChildBundleIDs = v5->_linkedChildBundleIDs;
    v5->_linkedChildBundleIDs = (NSSet *)v25;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(MIBundleMetadata *)self installDate];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setInstallDate:v6];

  v7 = [(MIBundleMetadata *)self installBuildVersion];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setInstallBuildVersion:v8];

  objc_msgSend(v4, "setInstallType:", -[MIBundleMetadata installType](self, "installType"));
  objc_msgSend(v4, "setPlaceholderFailureReason:", -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason"));
  v9 = [(MIBundleMetadata *)self placeholderFailureUnderlyingError];
  v10 = (void *)[v9 copy];
  [v4 setPlaceholderFailureUnderlyingError:v10];

  objc_msgSend(v4, "setPlaceholderFailureUnderlyingErrorSource:", -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource"));
  v11 = [(MIBundleMetadata *)self watchKitAppExecutableHash];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setWatchKitAppExecutableHash:v12];

  objc_msgSend(v4, "setAutoInstallOverride:", -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride"));
  v13 = [(MIBundleMetadata *)self alternateIconName];
  v14 = (void *)[v13 copy];
  [v4 setAlternateIconName:v14];

  uint64_t v15 = [(MIBundleMetadata *)self linkedParentBundleID];
  v16 = (void *)[v15 copy];
  [v4 setLinkedParentBundleID:v16];

  v17 = [(MIBundleMetadata *)self linkedChildBundleIDs];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setLinkedChildBundleIDs:v18];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIBundleMetadata *)self installDate];
  [v4 encodeObject:v5 forKey:@"installDate"];

  uint64_t v6 = [(MIBundleMetadata *)self installBuildVersion];
  [v4 encodeObject:v6 forKey:@"installBuildVersion"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBundleMetadata installType](self, "installType"));
  [v4 encodeObject:v7 forKey:@"installType"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason"));
  [v4 encodeObject:v8 forKey:@"placeholderFailureReason"];

  v9 = [(MIBundleMetadata *)self placeholderFailureUnderlyingError];
  [v4 encodeObject:v9 forKey:@"placeholderFailureUnderlyingError"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource"));
  [v4 encodeObject:v10 forKey:@"placeholderFailureUnderlyingErrorSource"];

  v11 = [(MIBundleMetadata *)self watchKitAppExecutableHash];
  [v4 encodeObject:v11 forKey:@"watchKitAppExecutableHash"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride"));
  [v4 encodeObject:v12 forKey:@"autoInstallOverride"];

  v13 = [(MIBundleMetadata *)self alternateIconName];
  [v4 encodeObject:v13 forKey:@"alternateIconName"];

  v14 = [(MIBundleMetadata *)self linkedParentBundleID];
  [v4 encodeObject:v14 forKey:@"linkedParentBundleID"];

  id v15 = [(MIBundleMetadata *)self linkedChildBundleIDs];
  [v4 encodeObject:v15 forKey:@"linkedChildBundleIDs"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIBundleMetadata *)a3;
  if (v4 == self)
  {
    BOOL v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MIBundleMetadata *)self installDate];
      v7 = [(MIBundleMetadata *)v5 installDate];
      BOOL v8 = MICompareObjects(v6, v7);

      if (!v8) {
        goto LABEL_16;
      }
      v9 = [(MIBundleMetadata *)self installBuildVersion];
      v10 = [(MIBundleMetadata *)v5 installBuildVersion];
      BOOL v11 = MICompareObjects(v9, v10);

      if (!v11) {
        goto LABEL_16;
      }
      unint64_t v12 = [(MIBundleMetadata *)self installType];
      if (v12 != [(MIBundleMetadata *)v5 installType]) {
        goto LABEL_16;
      }
      unint64_t v13 = [(MIBundleMetadata *)self placeholderFailureReason];
      if (v13 != [(MIBundleMetadata *)v5 placeholderFailureReason]) {
        goto LABEL_16;
      }
      v14 = [(MIBundleMetadata *)self placeholderFailureUnderlyingError];
      id v15 = [(MIBundleMetadata *)v5 placeholderFailureUnderlyingError];
      BOOL v16 = MICompareObjects(v14, v15);

      if (!v16) {
        goto LABEL_16;
      }
      unint64_t v17 = [(MIBundleMetadata *)self placeholderFailureUnderlyingErrorSource];
      if (v17 != [(MIBundleMetadata *)v5 placeholderFailureUnderlyingErrorSource])goto LABEL_16; {
      uint64_t v18 = [(MIBundleMetadata *)self watchKitAppExecutableHash];
      }
      v19 = [(MIBundleMetadata *)v5 watchKitAppExecutableHash];
      BOOL v20 = MICompareObjects(v18, v19);

      if (!v20) {
        goto LABEL_16;
      }
      unint64_t v21 = [(MIBundleMetadata *)self autoInstallOverride];
      if (v21 != [(MIBundleMetadata *)v5 autoInstallOverride]) {
        goto LABEL_16;
      }
      v22 = [(MIBundleMetadata *)self alternateIconName];
      uint64_t v23 = [(MIBundleMetadata *)v5 alternateIconName];
      BOOL v24 = MICompareObjects(v22, v23);

      if (!v24) {
        goto LABEL_16;
      }
      uint64_t v25 = [(MIBundleMetadata *)self linkedParentBundleID];
      v26 = [(MIBundleMetadata *)v5 linkedParentBundleID];
      BOOL v27 = MICompareObjects(v25, v26);

      if (v27)
      {
        v28 = [(MIBundleMetadata *)self linkedChildBundleIDs];
        v29 = [(MIBundleMetadata *)v5 linkedChildBundleIDs];
        BOOL v30 = MICompareObjects(v28, v29);
      }
      else
      {
LABEL_16:
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }

  return v30;
}

- (id)description
{
  unint64_t v21 = NSString;
  v3 = (objc_class *)objc_opt_class();
  BOOL v20 = NSStringFromClass(v3);
  id v4 = [(MIBundleMetadata *)self installDate];
  v5 = [(MIBundleMetadata *)self installBuildVersion];
  unint64_t v6 = [(MIBundleMetadata *)self installType];
  unint64_t v7 = [(MIBundleMetadata *)self placeholderFailureReason];
  BOOL v8 = [(MIBundleMetadata *)self placeholderFailureUnderlyingError];
  unint64_t v9 = [(MIBundleMetadata *)self placeholderFailureUnderlyingErrorSource];
  v10 = [(MIBundleMetadata *)self watchKitAppExecutableHash];
  unint64_t v11 = [(MIBundleMetadata *)self autoInstallOverride];
  unint64_t v12 = [(MIBundleMetadata *)self alternateIconName];
  unint64_t v13 = [v21 stringWithFormat:@"<%@<%p> installDate=%@, installBuildVersion=%@, installType=%lu, placeholderFailureReason=%lu, placeholderFailureUnderlyingError=%@, placeholderFailureUnderlyingErrorSource=%lu, watchKitAppExecutableHash=%@, autoInstallOverride=%lu, alternateIconName=%@", v20, self, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  v14 = NSString;
  id v15 = [(MIBundleMetadata *)self linkedParentBundleID];
  BOOL v16 = [(MIBundleMetadata *)self linkedChildBundleIDs];
  unint64_t v17 = [v14 stringWithFormat:@"%@, linkedParentBundleID=%@ linkedChildBundleIDs=%@", v13, v15, v16];

  uint64_t v18 = [v17 stringByAppendingString:@">"];

  return v18;
}

+ (id)metadataFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v26 = 0;
  unint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:3 error:&v26];
  id v7 = v26;
  BOOL v8 = v7;
  if (!v6)
  {
    BOOL v16 = [v7 domain];
    if ([v16 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v17 = [v8 code];

      if (v17 == 260) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    BOOL v20 = [v5 path];
    uint64_t v22 = _CreateAndLogError((uint64_t)"+[MIBundleMetadata metadataFromURL:error:]", 156, @"MIInstallerErrorDomain", 130, v8, 0, @"Failed to read bundle metadata from %@", v21, (uint64_t)v20);

    unint64_t v9 = 0;
    unint64_t v11 = 0;
    BOOL v8 = (void *)v22;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  id v25 = v7;
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v25];
  id v10 = v25;

  if (!v9)
  {
    uint64_t v18 = [v5 path];
    BOOL v8 = _CreateAndLogError((uint64_t)"+[MIBundleMetadata metadataFromURL:error:]", 163, @"MIInstallerErrorDomain", 130, v10, 0, @"Failed to read bundle metadata from %@", v19, (uint64_t)v18);

LABEL_11:
    unint64_t v9 = 0;
    unint64_t v11 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  unint64_t v11 = [v9 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  if (!v11)
  {
    unint64_t v12 = [v9 error];
    unint64_t v13 = [v5 path];
    uint64_t v15 = _CreateAndLogError((uint64_t)"+[MIBundleMetadata metadataFromURL:error:]", 169, @"MIInstallerErrorDomain", 130, v12, 0, @"Failed to decode bundle metadata from %@", v14, (uint64_t)v13);

    id v10 = (id)v15;
  }
  [v9 finishDecoding];
  BOOL v8 = v10;
  if (a4)
  {
LABEL_15:
    if (!v11) {
      *a4 = v8;
    }
  }
LABEL_17:
  id v23 = v11;

  return v23;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v7 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  BOOL v8 = [v7 encodedData];

  if (v8)
  {
    id v15 = 0;
    char v9 = [v8 writeToURL:v6 options:268435457 error:&v15];
    id v10 = v15;
    if ((v9 & 1) == 0)
    {
      unint64_t v11 = [v6 path];
      uint64_t v13 = _CreateAndLogError((uint64_t)"-[MIBundleMetadata serializeToURL:error:]", 207, @"MIInstallerErrorDomain", 4, v10, 0, @"Failed to write serialized MIBundleMetadata to %@", v12, (uint64_t)v11);

      id v10 = (id)v13;
    }
    if (a4 && v10)
    {
      id v10 = v10;
      *a4 = v10;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10 == 0;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
}

- (NSString)installBuildVersion
{
  return self->_installBuildVersion;
}

- (void)setInstallBuildVersion:(id)a3
{
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (unint64_t)placeholderFailureReason
{
  return self->_placeholderFailureReason;
}

- (void)setPlaceholderFailureReason:(unint64_t)a3
{
  self->_placeholderFailureReason = a3;
}

- (NSError)placeholderFailureUnderlyingError
{
  return self->_placeholderFailureUnderlyingError;
}

- (void)setPlaceholderFailureUnderlyingError:(id)a3
{
}

- (unint64_t)placeholderFailureUnderlyingErrorSource
{
  return self->_placeholderFailureUnderlyingErrorSource;
}

- (void)setPlaceholderFailureUnderlyingErrorSource:(unint64_t)a3
{
  self->_placeholderFailureUnderlyingErrorSource = a3;
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  self->_autoInstallOverride = a3;
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
}

- (NSSet)linkedChildBundleIDs
{
  return self->_linkedChildBundleIDs;
}

- (void)setLinkedChildBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedChildBundleIDs, 0);
  objc_storeStrong((id *)&self->_linkedParentBundleID, 0);
  objc_storeStrong((id *)&self->_alternateIconName, 0);
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, 0);
  objc_storeStrong((id *)&self->_placeholderFailureUnderlyingError, 0);
  objc_storeStrong((id *)&self->_installBuildVersion, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
}

@end