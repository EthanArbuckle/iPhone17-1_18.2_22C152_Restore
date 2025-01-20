@interface MIOVersionInfo
- (BOOL)isEqual:(id)a3;
- (MIOVersionInfo)initWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5;
- (NSString)versionNumberString;
- (int64_t)compare:(id)a3;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
- (int64_t)patchVersion;
- (unint64_t)hash;
@end

@implementation MIOVersionInfo

- (MIOVersionInfo)initWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MIOVersionInfo;
  result = [(MIOVersionInfo *)&v9 init];
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_patchVersion = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOVersionInfo *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(MIOVersionInfo *)self majorVersion];
      if (v6 == [(MIOVersionInfo *)v5 majorVersion]
        && (int64_t v7 = [(MIOVersionInfo *)self minorVersion],
            v7 == [(MIOVersionInfo *)v5 minorVersion]))
      {
        int64_t v8 = [(MIOVersionInfo *)self patchVersion];
        BOOL v9 = v8 == [(MIOVersionInfo *)v5 patchVersion];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(MIOVersionInfo *)self majorVersion];
  int64_t v4 = [(MIOVersionInfo *)self minorVersion] ^ v3;
  return v4 ^ [(MIOVersionInfo *)self patchVersion];
}

- (NSString)versionNumberString
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%zd.%zd.%zd", -[MIOVersionInfo majorVersion](self, "majorVersion"), -[MIOVersionInfo minorVersion](self, "minorVersion"), -[MIOVersionInfo patchVersion](self, "patchVersion"));
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MIOVersionInfo *)self majorVersion];
  uint64_t v6 = v5 - [v4 majorVersion];
  int64_t v7 = [(MIOVersionInfo *)self minorVersion];
  uint64_t v8 = v7 - [v4 minorVersion];
  int64_t v9 = [(MIOVersionInfo *)self patchVersion];
  uint64_t v10 = [v4 patchVersion];

  uint64_t v11 = v9 - v10;
  uint64_t v12 = v6 >> 63;
  if (v6 > 0) {
    LODWORD(v12) = v12 + 1;
  }
  uint64_t v13 = v8 >> 63;
  if (v8 > 0) {
    LODWORD(v13) = v13 + 1;
  }
  BOOL v14 = v11 < 0;
  uint64_t v15 = v11 >> 63;
  int v16 = 3 * v13 + 9 * v12;
  if (!v14 && v9 != v10) {
    ++v16;
  }
  return (v16 + v15 != 0) | ((v16 + (int)v15) >> 31);
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

@end