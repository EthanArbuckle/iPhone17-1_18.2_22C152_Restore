@interface PHPersistentChangeToken
+ (BOOL)supportsSecureCoding;
+ (PHPersistentChangeToken)tokenWithPersistentHistoryToken:(id)a3;
+ (id)currentTokenForContext:(id)a3;
+ (int)currentVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersistentChangeToken:(id)a3;
- (NSPersistentHistoryToken)persistentHistoryToken;
- (PHPersistentChangeToken)initWithCoder:(id)a3;
- (PHPersistentChangeToken)initWithPersistentHistoryToken:(id)a3;
- (PHPersistentChangeToken)initWithPersistentHistoryToken:(id)a3 version:(int)a4;
- (id)description;
- (int)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHPersistentChangeToken

- (void).cxx_destruct
{
}

- (int)version
{
  return self->_version;
}

- (NSPersistentHistoryToken)persistentHistoryToken
{
  return self->_persistentHistoryToken;
}

- (PHPersistentChangeToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersistentHistoryToken"];
  uint64_t v6 = [v4 decodeIntForKey:@"Version"];

  v7 = [(PHPersistentChangeToken *)self initWithPersistentHistoryToken:v5 version:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  persistentHistoryToken = self->_persistentHistoryToken;
  id v5 = a3;
  [v5 encodeObject:persistentHistoryToken forKey:@"PersistentHistoryToken"];
  [v5 encodeInt:self->_version forKey:@"Version"];
}

- (unint64_t)hash
{
  id v4 = [(PHPersistentChangeToken *)self persistentHistoryToken];

  if (!v4)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PHPersistentChangeToken.m", 93, @"Invalid parameter not satisfying: %@", @"self.persistentHistoryToken" object file lineNumber description];
  }
  id v5 = [(PHPersistentChangeToken *)self persistentHistoryToken];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = v6 ^ [(PHPersistentChangeToken *)self version];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHPersistentChangeToken *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PHPersistentChangeToken *)self isEqualToPersistentChangeToken:v4];
  }

  return v5;
}

- (BOOL)isEqualToPersistentChangeToken:(id)a3
{
  id v4 = a3;
  int v5 = [v4 version];
  if (v5 == [(PHPersistentChangeToken *)self version])
  {
    uint64_t v6 = [v4 persistentHistoryToken];
    unint64_t v7 = [(PHPersistentChangeToken *)self persistentHistoryToken];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F8A7A8] descriptionBuilderWithObject:self];
  [v3 appendName:@"persistentHistoryToken" typeCode:"@" value:&self->_persistentHistoryToken];
  [v3 appendName:@"version" typeCode:"i" value:&self->_version];
  id v4 = [v3 build];

  return v4;
}

- (PHPersistentChangeToken)initWithPersistentHistoryToken:(id)a3
{
  return [(PHPersistentChangeToken *)self initWithPersistentHistoryToken:a3 version:1];
}

- (PHPersistentChangeToken)initWithPersistentHistoryToken:(id)a3 version:(int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PHPersistentChangeToken;
  unint64_t v7 = [(PHPersistentChangeToken *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    persistentHistoryToken = v7->_persistentHistoryToken;
    v7->_persistentHistoryToken = (NSPersistentHistoryToken *)v8;

    v7->_version = a4;
    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PHPersistentChangeToken)tokenWithPersistentHistoryToken:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[PHPersistentChangeToken alloc] initWithPersistentHistoryToken:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)currentTokenForContext:(id)a3
{
  id v4 = [a3 persistentStoreCoordinator];
  int v5 = [v4 currentPersistentHistoryTokenFromStores:0];

  id v6 = [a1 tokenWithPersistentHistoryToken:v5];

  return v6;
}

+ (int)currentVersion
{
  return 1;
}

@end