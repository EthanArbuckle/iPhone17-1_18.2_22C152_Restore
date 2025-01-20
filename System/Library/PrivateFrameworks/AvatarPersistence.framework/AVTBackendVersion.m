@interface AVTBackendVersion
+ (BOOL)supportsSecureCoding;
+ (id)currentVersion;
+ (id)versionFileLocationForStoreLocation:(id)a3;
+ (id)versionFromDiskAtLocation:(id)a3 error:(id *)a4;
- (AVTBackendVersion)initWithBackendVersion:(double)a3 avatarKitVersion:(double)a4;
- (AVTBackendVersion)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)saveToDiskAtLocation:(id)a3 error:(id *)a4;
- (double)avatarKitVersion;
- (double)backendVersion;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVTBackendVersion

+ (id)versionFileLocationForStoreLocation:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"avatars.version"];
}

+ (id)currentVersion
{
  v2 = (void *)[objc_alloc((Class)a1) initWithBackendVersion:0.6 avatarKitVersion:12.0];

  return v2;
}

- (AVTBackendVersion)initWithBackendVersion:(double)a3 avatarKitVersion:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVTBackendVersion;
  result = [(AVTBackendVersion *)&v7 init];
  if (result)
  {
    result->_backendVersion = a3;
    result->_avatarKitVersion = a4;
  }
  return result;
}

- (BOOL)saveToDiskAtLocation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
  if (v7)
  {
    v8 = [(id)objc_opt_class() versionFileLocationForStoreLocation:v6];
    char v9 = [v7 writeToURL:v8 options:0 error:a4];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)versionFromDiskAtLocation:(id)a3 error:(id *)a4
{
  v5 = [a1 versionFileLocationForStoreLocation:a3];
  id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:0 error:a4];
  if (v6)
  {
    objc_super v7 = (void *)MEMORY[0x263F08928];
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:a4];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [AVTBackendVersion alloc];
      [v11 doubleValue];
      v13 = -[AVTBackendVersion initWithBackendVersion:avatarKitVersion:](v12, "initWithBackendVersion:avatarKitVersion:");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Version object is not of expected class"];
      }
      v13 = v11;
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTBackendVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"backendVersion"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"avatarKitVersion"];
  double v8 = v7;

  return [(AVTBackendVersion *)self initWithBackendVersion:v6 avatarKitVersion:v8];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AVTBackendVersion *)self backendVersion];
  objc_msgSend(v4, "encodeDouble:forKey:", @"backendVersion");
  [(AVTBackendVersion *)self avatarKitVersion];
  objc_msgSend(v4, "encodeDouble:forKey:", @"avatarKitVersion");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  double v7 = v6;
  if ((isKindOfClass & 1) != 0
    && ([v6 backendVersion],
        double v9 = v8,
        [(AVTBackendVersion *)self backendVersion],
        v9 == v10))
  {
    [v7 avatarKitVersion];
    double v12 = v11;
    [(AVTBackendVersion *)self avatarKitVersion];
    BOOL v14 = v12 == v13;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)AVTBackendVersion;
  v3 = [(AVTBackendVersion *)&v10 description];
  id v4 = (void *)[v3 mutableCopy];

  [(AVTBackendVersion *)self backendVersion];
  uint64_t v6 = v5;
  [(AVTBackendVersion *)self avatarKitVersion];
  objc_msgSend(v4, "appendFormat:", @" backend:%2.2f avatarKit:%2.2f", v6, v7);
  double v8 = (void *)[v4 copy];

  return v8;
}

- (double)backendVersion
{
  return self->_backendVersion;
}

- (double)avatarKitVersion
{
  return self->_avatarKitVersion;
}

@end