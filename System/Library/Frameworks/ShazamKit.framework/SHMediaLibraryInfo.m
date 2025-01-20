@interface SHMediaLibraryInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEncrypted;
- (NSString)identityToken;
- (SHMediaLibraryInfo)initWithCoder:(id)a3;
- (SHMediaLibraryInfo)initWithStatus:(int64_t)a3 encrypted:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityToken:(id)a3;
@end

@implementation SHMediaLibraryInfo

- (SHMediaLibraryInfo)initWithStatus:(int64_t)a3 encrypted:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SHMediaLibraryInfo;
  result = [(SHMediaLibraryInfo *)&v7 init];
  if (result)
  {
    result->_status = a3;
    result->_isEncrypted = a4;
  }
  return result;
}

- (SHMediaLibraryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[SHMediaLibraryInfo initWithStatus:encrypted:](self, "initWithStatus:encrypted:", [v4 decodeIntegerForKey:@"SHMediaLibraryInfoStatus"], objc_msgSend(v4, "decodeBoolForKey:", @"SHMediaLibraryInfoEncrypted"));
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryInfoIdentifier"];

  [(SHMediaLibraryInfo *)v5 setIdentityToken:v6];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identityToken = self->_identityToken;
  id v5 = a3;
  [v5 encodeObject:identityToken forKey:@"SHMediaLibraryInfoIdentifier"];
  [v5 encodeInteger:self->_status forKey:@"SHMediaLibraryInfoStatus"];
  [v5 encodeBool:self->_isEncrypted forKey:@"SHMediaLibraryInfoEncrypted"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[SHMediaLibraryInfo allocWithZone:](SHMediaLibraryInfo, "allocWithZone:") initWithStatus:[(SHMediaLibraryInfo *)self status] encrypted:[(SHMediaLibraryInfo *)self isEncrypted]];
  v6 = [(SHMediaLibraryInfo *)self identityToken];
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [(SHMediaLibraryInfo *)v5 setIdentityToken:v7];

  return v5;
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void).cxx_destruct
{
}

@end