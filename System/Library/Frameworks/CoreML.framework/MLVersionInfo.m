@interface MLVersionInfo
+ (MLVersionInfo)versionInfoWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5 variant:(id)a6;
+ (MLVersionInfo)versionInfoWithString:(id)a3;
+ (MLVersionInfo)versionInfoWithStringProgressive:(id)a3;
- (BOOL)olderThan:(id)a3;
- (MLVersionInfo)initWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5 variant:(id)a6;
- (NSString)variantString;
- (NSString)versionNumberString;
- (NSString)versionString;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
- (int64_t)patchVersion;
@end

@implementation MLVersionInfo

- (void).cxx_destruct
{
}

- (BOOL)olderThan:(id)a3
{
  id v4 = a3;
  int64_t majorVersion = self->_majorVersion;
  if (majorVersion < [v4 majorVersion]
    || (int64_t v7 = self->_majorVersion, v7 == [v4 majorVersion])
    && (int64_t v8 = self->_minorVersion, v8 < [v4 minorVersion]))
  {
    BOOL v6 = 1;
  }
  else
  {
    int64_t v9 = self->_majorVersion;
    if (v9 == [v4 majorVersion]
      && (int64_t minorVersion = self->_minorVersion, minorVersion == [v4 minorVersion]))
    {
      int64_t patchVersion = self->_patchVersion;
      BOOL v6 = patchVersion < [v4 patchVersion];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)patchVersion
{
  return self->_patchVersion;
}

+ (MLVersionInfo)versionInfoWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5 variant:(id)a6
{
  id v9 = a6;
  v10 = [[MLVersionInfo alloc] initWithMajor:a3 minor:a4 patch:a5 variant:v9];

  return v10;
}

- (MLVersionInfo)initWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5 variant:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MLVersionInfo;
  v12 = [(MLVersionInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_int64_t majorVersion = a3;
    v12->_int64_t minorVersion = a4;
    v12->_int64_t patchVersion = a5;
    objc_storeStrong((id *)&v12->_variantString, a6);
  }

  return v13;
}

- (NSString)versionNumberString
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%lld.%lld.%lld", self->_majorVersion, self->_minorVersion, self->_patchVersion);
}

- (NSString)variantString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)versionString
{
  v3 = NSString;
  uint64_t v4 = [(MLVersionInfo *)self versionNumberString];
  v5 = (void *)v4;
  variantString = (__CFString *)self->_variantString;
  if (!variantString) {
    variantString = &stru_1EF0E81D0;
  }
  int64_t v7 = [v3 stringWithFormat:@"%@%@", v4, variantString];

  return (NSString *)v7;
}

+ (MLVersionInfo)versionInfoWithStringProgressive:(id)a3
{
  v3 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  uint64_t v17 = 0;
  if (([v3 scanInteger:&v17] & 1) == 0)
  {
    v10 = [MLVersionInfo alloc];
    uint64_t v11 = 0;
LABEL_10:
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v16 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  [v3 scanUpToCharactersFromSet:v4 intoString:0];

  if (([v3 scanInteger:&v16] & 1) == 0)
  {
    v10 = [MLVersionInfo alloc];
    uint64_t v11 = v17;
    goto LABEL_10;
  }
  uint64_t v15 = 0;
  v5 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  [v3 scanUpToCharactersFromSet:v5 intoString:0];

  if ([v3 scanInteger:&v15])
  {
    id v14 = 0;
    [v3 scanUpToString:&stru_1EF0E81D0 intoString:&v14];
    BOOL v6 = (__CFString *)v14;
    if (v6) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = &stru_1EF0E81D0;
    }
    int64_t v8 = [MLVersionInfo alloc];
    id v9 = [(MLVersionInfo *)v8 initWithMajor:v17 minor:v16 patch:v15 variant:v7];

    goto LABEL_12;
  }
  v10 = [MLVersionInfo alloc];
  uint64_t v12 = v16;
  uint64_t v11 = v17;
LABEL_11:
  id v9 = [(MLVersionInfo *)v10 initWithMajor:v11 minor:v12 patch:0 variant:&stru_1EF0E81D0];
LABEL_12:

  return v9;
}

+ (MLVersionInfo)versionInfoWithString:(id)a3
{
  v3 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  uint64_t v14 = 0;
  uint64_t v4 = 0;
  if ([v3 scanInteger:&v14])
  {
    uint64_t v13 = 0;
    v5 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    [v3 scanUpToCharactersFromSet:v5 intoString:0];

    uint64_t v4 = 0;
    if ([v3 scanInteger:&v13])
    {
      uint64_t v12 = 0;
      BOOL v6 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      [v3 scanUpToCharactersFromSet:v6 intoString:0];

      uint64_t v4 = 0;
      if ([v3 scanInteger:&v12])
      {
        id v11 = 0;
        [v3 scanUpToString:&stru_1EF0E81D0 intoString:&v11];
        int64_t v7 = (__CFString *)v11;
        if (v7) {
          int64_t v8 = v7;
        }
        else {
          int64_t v8 = &stru_1EF0E81D0;
        }
        id v9 = [MLVersionInfo alloc];
        uint64_t v4 = [(MLVersionInfo *)v9 initWithMajor:v14 minor:v13 patch:v12 variant:v8];
      }
    }
  }

  return v4;
}

@end