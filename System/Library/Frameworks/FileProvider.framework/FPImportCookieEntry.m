@interface FPImportCookieEntry
+ (BOOL)supportsSecureCoding;
- (FPImportCookieEntry)initWithCoder:(id)a3;
- (FPImportCookieEntry)initWithDomainPathRelativeToVolumeRoot:(id)a3 displayName:(id)a4 creationTime:(double)a5 andFileID:(unint64_t)a6;
- (FPImportCookieEntry)initWithDomainURL:(id)a3 displayName:(id)a4 error:(id *)a5;
- (NSString)displayName;
- (NSString)domainPathRelativeToVolumeRoot;
- (double)creationTime;
- (id)description;
- (unint64_t)fileID;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationTime:(double)a3;
@end

@implementation FPImportCookieEntry

- (FPImportCookieEntry)initWithDomainPathRelativeToVolumeRoot:(id)a3 displayName:(id)a4 creationTime:(double)a5 andFileID:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPImportCookieEntry;
  v13 = [(FPImportCookieEntry *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_domainPathRelativeToVolumeRoot, a3);
    objc_storeStrong((id *)&v14->_displayName, a4);
    v14->_creationTime = a5;
    v14->_fileID = a6;
  }

  return v14;
}

- (FPImportCookieEntry)initWithDomainURL:(id)a3 displayName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v13 = 0;
  v9 = FPPathRelativeToVolumeRoot(a3, &v13, a5);
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceReferenceDate];
    self = -[FPImportCookieEntry initWithDomainPathRelativeToVolumeRoot:displayName:creationTime:andFileID:](self, "initWithDomainPathRelativeToVolumeRoot:displayName:creationTime:andFileID:", v9, v8, v13);

    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  domainPathRelativeToVolumeRoot = self->_domainPathRelativeToVolumeRoot;
  id v5 = a3;
  [v5 encodeObject:domainPathRelativeToVolumeRoot forKey:@"_domainPathRelativeToVolumeRoot"];
  [v5 encodeObject:self->_displayName forKey:@"_displayName"];
  [v5 encodeDouble:@"_creationTime" forKey:self->_creationTime];
  [v5 encodeInt64:self->_fileID forKey:@"_fileID"];
}

- (FPImportCookieEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"_fileID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domainPathRelativeToVolumeRoot"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
  [v4 decodeDoubleForKey:@"_creationTime"];
  double v9 = v8;

  v10 = [(FPImportCookieEntry *)self initWithDomainPathRelativeToVolumeRoot:v6 displayName:v7 creationTime:v5 andFileID:v9];
  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FPImportCookieEntry *)self displayName];
  uint64_t v5 = [(FPImportCookieEntry *)self domainPathRelativeToVolumeRoot];
  v6 = objc_msgSend(v5, "fp_obfuscatedPath");
  unint64_t v7 = [(FPImportCookieEntry *)self fileID];
  [(FPImportCookieEntry *)self creationTime];
  double v9 = [v3 stringWithFormat:@"<n:%@ d:%@ f:%llu ct:%f>", v4, v6, v7, v8];

  return v9;
}

- (NSString)domainPathRelativeToVolumeRoot
{
  return self->_domainPathRelativeToVolumeRoot;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_domainPathRelativeToVolumeRoot, 0);
}

@end