@interface VNCVMLFaceprint_LegacySupportDoNotChange
+ (BOOL)supportsSecureCoding;
- (NSData)faceprint;
- (NSString)faceprintInputPath;
- (NSString)key;
- (VNCVMLFaceprint_LegacySupportDoNotChange)initWithCoder:(id)a3;
- (unsigned)platform;
- (unsigned)profile;
- (void)encodeWithCoder:(id)a3;
- (void)setFaceprint:(id)a3;
- (void)setFaceprintInputPath:(id)a3;
- (void)setKey:(id)a3;
- (void)setPlatform:(unsigned int)a3;
- (void)setProfile:(unsigned int)a3;
@end

@implementation VNCVMLFaceprint_LegacySupportDoNotChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintInputPath, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_faceprint, 0);
}

- (void)setFaceprintInputPath:(id)a3
{
}

- (NSString)faceprintInputPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfile:(unsigned int)a3
{
  self->_profile = a3;
}

- (unsigned)profile
{
  return self->_profile;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_platform = a3;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFaceprint:(id)a3
{
}

- (NSData)faceprint
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
}

- (VNCVMLFaceprint_LegacySupportDoNotChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNCVMLFaceprint_LegacySupportDoNotChange;
  v5 = [(VNCVMLFaceprint_LegacySupportDoNotChange *)&v15 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLFaceprint_CodingVersionCodingKey"];
  if (![v6 unsignedIntegerValue])
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLFaceprint_FaceprintCodingKey"];
    faceprint = v5->_faceprint;
    v5->_faceprint = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLFaceprint_KeyCodingKey"];
    key = v5->_key;
    v5->_key = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLFaceprint_PlatformCodingKey"];
    v5->_platform = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLFaceprint_ProfileCodingKey"];
    v5->_profile = [v13 unsignedIntegerValue];

LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }

  v7 = 0;
LABEL_6:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end