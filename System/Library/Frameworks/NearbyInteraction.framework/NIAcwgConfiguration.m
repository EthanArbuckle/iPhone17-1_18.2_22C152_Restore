@interface NIAcwgConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIAcwgConfiguration)initWithCoder:(id)a3;
- (NIAcwgConfiguration)initWithConfiguration:(id)a3;
- (NIAcwgConfiguration)initWithLockIdentifier:(id)a3;
- (NSDictionary)debugOptions;
- (NSString)lockIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)configurationType;
- (unint64_t)hash;
- (unsigned)lockBtConnHandle;
- (void)encodeWithCoder:(id)a3;
- (void)setDebugOptions:(id)a3;
- (void)setLockBtConnHandle:(unsigned __int16)a3;
- (void)setLockIdentifier:(id)a3;
@end

@implementation NIAcwgConfiguration

- (NIAcwgConfiguration)initWithLockIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NIAcwgConfiguration.mm", 18, @"Invalid parameter not satisfying: %@", @"lockIdentifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)NIAcwgConfiguration;
  v7 = [(NIConfiguration *)&v11 initInternal];
  v8 = (NIAcwgConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 6, a3);
    v8->_lockBtConnHandle = -1;
    v8->_configurationTypeInternal = 1;
  }

  return v8;
}

- (NIAcwgConfiguration)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NIAcwgConfiguration.mm", 30, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)NIAcwgConfiguration;
  id v6 = [(NIConfiguration *)&v13 initInternal];
  if (v6)
  {
    uint64_t v7 = [v5 lockIdentifier];
    lockIdentifier = v6->_lockIdentifier;
    v6->_lockIdentifier = (NSString *)v7;

    v6->_lockBtConnHandle = [v5 lockBtConnHandle];
    uint64_t v9 = [v5 debugOptions];
    debugOptions = v6->_debugOptions;
    v6->_debugOptions = (NSDictionary *)v9;

    v6->_configurationTypeInternal = [v5 configurationType];
  }

  return v6;
}

- (int64_t)configurationType
{
  return self->_configurationTypeInternal;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NIAcwgConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  [v5 setLockIdentifier:self->_lockIdentifier];
  [v5 setLockBtConnHandle:self->_lockBtConnHandle];
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugOptions, 1);
    uint64_t v7 = (void *)v5[7];
    v5[7] = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_lockIdentifier forKey:@"lockIdentifier"];
  [v4 encodeInt:self->_lockBtConnHandle forKey:@"lockBtConnHandle"];
  [v4 encodeObject:self->_debugOptions forKey:@"debugOptions"];
  [v4 encodeInteger:self->_configurationTypeInternal forKey:@"configurationType"];
}

- (NIAcwgConfiguration)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self)
  {
    v15 = 0;
LABEL_9:
    self = v15;
    id v5 = self;
    goto LABEL_10;
  }
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockIdentifier"];
  if (v5)
  {
    unsigned __int16 v6 = [v4 decodeIntForKey:@"lockBtConnHandle"];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    objc_super v9 = [v7 setWithArray:v8];

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    v12 = [v10 setWithArray:v11];

    objc_super v13 = [v4 decodeDictionaryWithKeysOfClasses:v9 objectsOfClasses:v12 forKey:@"debugOptions"];
    if ([v4 decodeIntegerForKey:@"configurationType"] == 1)
    {
      v14 = [(NIAcwgConfiguration *)self initWithLockIdentifier:v5];
      v15 = v14;
      if (v14)
      {
        [(NIAcwgConfiguration *)v14 setLockBtConnHandle:v6];
        [(NIAcwgConfiguration *)v15 setDebugOptions:v13];
      }
    }
    else
    {

      v15 = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (NIAcwgConfiguration *)v4;
    unsigned __int16 v6 = v5;
    if (v5 == self)
    {
      BOOL v14 = 1;
    }
    else
    {
      lockIdentifier = self->_lockIdentifier;
      v8 = [(NIAcwgConfiguration *)v5 lockIdentifier];
      BOOL v9 = [(NSString *)lockIdentifier isEqualToString:v8];

      int lockBtConnHandle = self->_lockBtConnHandle;
      int v11 = [(NIAcwgConfiguration *)v6 lockBtConnHandle];
      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        BOOL v13 = 0;
      }
      else
      {
        v15 = [(NIAcwgConfiguration *)v6 debugOptions];
        BOOL v13 = v15 == 0;

        debugOptions = self->_debugOptions;
      }
      v16 = [(NIAcwgConfiguration *)v6 debugOptions];
      BOOL v17 = [(NSDictionary *)debugOptions isEqualToDictionary:v16];

      int64_t configurationTypeInternal = self->_configurationTypeInternal;
      uint64_t v19 = [(NIAcwgConfiguration *)v6 configurationType];
      BOOL v20 = v17 || v13;
      BOOL v21 = lockBtConnHandle == v11 && v9;
      if (configurationTypeInternal != v19) {
        BOOL v20 = 0;
      }
      BOOL v14 = v21 && v20;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_lockIdentifier hash] ^ self->_lockBtConnHandle;
  return v3 ^ [(NSDictionary *)self->_debugOptions hash] ^ self->_configurationTypeInternal;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unsigned __int16 v6 = [(NIAcwgConfiguration *)self descriptionInternal];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  return (id)[NSString stringWithFormat:@"<lock identifier: %@, BT conn handle: 0x%04x, debug options: <%@>>", self->_lockIdentifier, self->_lockBtConnHandle, self->_debugOptions];
}

- (NSString)lockIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLockIdentifier:(id)a3
{
}

- (unsigned)lockBtConnHandle
{
  return self->_lockBtConnHandle;
}

- (void)setLockBtConnHandle:(unsigned __int16)a3
{
  self->_int lockBtConnHandle = a3;
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDebugOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOptions, 0);

  objc_storeStrong((id *)&self->_lockIdentifier, 0);
}

@end