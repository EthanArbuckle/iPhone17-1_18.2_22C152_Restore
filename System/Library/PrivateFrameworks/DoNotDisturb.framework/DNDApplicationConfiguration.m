@interface DNDApplicationConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfiguration;
- (BOOL)isEqual:(id)a3;
- (DNDApplicationConfiguration)init;
- (DNDApplicationConfiguration)initWithCoder:(id)a3;
- (NSSet)allowedThreads;
- (NSSet)deniedThreads;
- (id)_initWithMinimumBreakthroughUrgency:(unint64_t)a3 allowedThreads:(id)a4 deniedThreads:(id)a5;
- (id)description;
- (id)diffDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)minimumBreakthroughUrgency;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDApplicationConfiguration

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(DNDApplicationConfiguration);
  return v2;
}

- (DNDApplicationConfiguration)init
{
  return (DNDApplicationConfiguration *)[(DNDApplicationConfiguration *)self _initWithMinimumBreakthroughUrgency:2 allowedThreads:0 deniedThreads:0];
}

- (id)_initWithMinimumBreakthroughUrgency:(unint64_t)a3 allowedThreads:(id)a4 deniedThreads:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DNDApplicationConfiguration;
  v10 = [(DNDApplicationConfiguration *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_minimumBreakthroughUrgency = a3;
    if (v8) {
      uint64_t v12 = [v8 mutableCopy];
    }
    else {
      uint64_t v12 = objc_opt_new();
    }
    allowedThreads = v11->_allowedThreads;
    v11->_allowedThreads = (NSMutableSet *)v12;

    if (v9) {
      uint64_t v14 = [v9 mutableCopy];
    }
    else {
      uint64_t v14 = objc_opt_new();
    }
    deniedThreads = v11->_deniedThreads;
    v11->_deniedThreads = (NSMutableSet *)v14;
  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDApplicationConfiguration *)self minimumBreakthroughUrgency];
  v4 = [(DNDApplicationConfiguration *)self allowedThreads];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(DNDApplicationConfiguration *)self deniedThreads];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDApplicationConfiguration *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(DNDApplicationConfiguration *)self minimumBreakthroughUrgency];
      if (v6 != [(DNDApplicationConfiguration *)v5 minimumBreakthroughUrgency])
      {
        char v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      unint64_t v7 = [(DNDApplicationConfiguration *)self allowedThreads];
      id v8 = [(DNDApplicationConfiguration *)v5 allowedThreads];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDApplicationConfiguration *)self allowedThreads];
        if (!v9)
        {
          char v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v10 = (void *)v9;
        v11 = [(DNDApplicationConfiguration *)v5 allowedThreads];
        if (!v11)
        {
          char v14 = 0;
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v12 = [(DNDApplicationConfiguration *)self allowedThreads];
        v13 = [(DNDApplicationConfiguration *)v5 allowedThreads];
        if (![v12 isEqual:v13])
        {
          char v14 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v24 = v13;
        v25 = v12;
        v26 = v11;
        v27 = v10;
      }
      v15 = [(DNDApplicationConfiguration *)self deniedThreads];
      uint64_t v16 = [(DNDApplicationConfiguration *)v5 deniedThreads];
      if (v15 == (void *)v16)
      {

        char v14 = 1;
      }
      else
      {
        objc_super v17 = (void *)v16;
        uint64_t v18 = [(DNDApplicationConfiguration *)self deniedThreads];
        if (v18)
        {
          v19 = (void *)v18;
          v20 = [(DNDApplicationConfiguration *)v5 deniedThreads];
          if (v20)
          {
            v23 = [(DNDApplicationConfiguration *)self deniedThreads];
            v21 = [(DNDApplicationConfiguration *)v5 deniedThreads];
            char v14 = [v23 isEqual:v21];
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {

          char v14 = 0;
        }
      }
      v11 = v26;
      v10 = v27;
      v13 = v24;
      uint64_t v12 = v25;
      if (v7 == v8) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    char v14 = 0;
  }
LABEL_28:

  return v14;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; minimumBreakthroughUrgency: %@; allowedThreads: %@; deniedThreads: %@; >",
    v4,
    self,
    v5,
    self->_allowedThreads,
  unint64_t v6 = self->_deniedThreads);

  return v6;
}

- (id)diffDescription
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
  [v3 appendFormat:@"minimumBreakthroughUrgency:%@;", v4];

  if ([(NSMutableSet *)self->_allowedThreads count]) {
    [v3 appendFormat:@"allowedThreads:%@;", self->_allowedThreads];
  }
  if ([(NSMutableSet *)self->_deniedThreads count]) {
    [v3 appendFormat:@"deniedThreads:%@;", self->_deniedThreads];
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableApplicationConfiguration alloc];
  unint64_t minimumBreakthroughUrgency = self->_minimumBreakthroughUrgency;
  allowedThreads = self->_allowedThreads;
  deniedThreads = self->_deniedThreads;
  return [(DNDApplicationConfiguration *)v4 _initWithMinimumBreakthroughUrgency:minimumBreakthroughUrgency allowedThreads:allowedThreads deniedThreads:deniedThreads];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDApplicationConfiguration)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"minimumBreakthroughUrgency"];
  unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"allowedThreads"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v12 = [v10 setWithArray:v11];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"deniedThreads"];

  char v14 = [(DNDApplicationConfiguration *)self _initWithMinimumBreakthroughUrgency:v5 allowedThreads:v9 deniedThreads:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t minimumBreakthroughUrgency = self->_minimumBreakthroughUrgency;
  id v5 = a3;
  [v5 encodeInteger:minimumBreakthroughUrgency forKey:@"minimumBreakthroughUrgency"];
  [v5 encodeObject:self->_allowedThreads forKey:@"allowedThreads"];
  [v5 encodeObject:self->_deniedThreads forKey:@"deniedThreads"];
}

- (unint64_t)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (NSSet)allowedThreads
{
  return &self->_allowedThreads->super;
}

- (NSSet)deniedThreads
{
  return &self->_deniedThreads->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedThreads, 0);
  objc_storeStrong((id *)&self->_allowedThreads, 0);
}

@end