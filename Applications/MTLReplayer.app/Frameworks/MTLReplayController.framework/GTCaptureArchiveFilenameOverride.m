@interface GTCaptureArchiveFilenameOverride
+ (BOOL)supportsSecureCoding;
- (GTCaptureArchiveFilenameOverride)initWithCoder:(id)a3;
- (NSString)originalFilename;
- (NSString)overrideFilename;
- (unint64_t)exportToolVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setExportToolVersion:(unint64_t)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setOverrideFilename:(id)a3;
@end

@implementation GTCaptureArchiveFilenameOverride

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFilename, 0);

  objc_storeStrong((id *)&self->_originalFilename, 0);
}

- (void)setExportToolVersion:(unint64_t)a3
{
  self->_exportToolVersion = a3;
}

- (unint64_t)exportToolVersion
{
  return self->_exportToolVersion;
}

- (void)setOverrideFilename:(id)a3
{
}

- (NSString)overrideFilename
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOriginalFilename:(id)a3
{
}

- (NSString)originalFilename
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (GTCaptureArchiveFilenameOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTCaptureArchiveFilenameOverride;
  v5 = [(GTCaptureArchiveFilenameOverride *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalFilename"];
    originalFilename = v5->_originalFilename;
    v5->_originalFilename = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideFilename"];
    overrideFilename = v5->_overrideFilename;
    v5->_overrideFilename = (NSString *)v8;

    v5->_exportToolVersion = (unint64_t)[v4 decodeInt64ForKey:@"exportToolVersion"];
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  originalFilename = self->_originalFilename;
  id v5 = a3;
  [v5 encodeObject:originalFilename forKey:@"originalFilename"];
  [v5 encodeObject:self->_overrideFilename forKey:@"overrideFilename"];
  [v5 encodeInt64:self->_exportToolVersion forKey:@"exportToolVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end