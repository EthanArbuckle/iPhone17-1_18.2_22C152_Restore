@interface DKCanonicalVersion
+ (BOOL)supportsSecureCoding;
+ (DKCanonicalVersion)canonicalVersionWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCanonicalVersion:(id)a3;
- (BOOL)isNewerThan:(id)a3;
- (DKCanonicalVersion)initWithCoder:(id)a3;
- (DKCanonicalVersion)initWithString:(id)a3;
- (NSArray)parts;
- (NSString)string;
- (id)_parseParts:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setParts:(id)a3;
@end

@implementation DKCanonicalVersion

+ (DKCanonicalVersion)canonicalVersionWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return (DKCanonicalVersion *)v5;
}

- (DKCanonicalVersion)initWithString:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKCanonicalVersion;
  v6 = [(DKCanonicalVersion *)&v11 init];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(DKCanonicalVersion *)v6 _parseParts:v5];
    parts = v7->_parts;
    v7->_parts = (NSArray *)v8;

    objc_storeStrong((id *)&v7->_string, a3);
  }

  return v7;
}

- (BOOL)isNewerThan:(id)a3
{
  id v4 = a3;
  id v5 = [(DKCanonicalVersion *)self parts];
  unint64_t v6 = [v5 count];

  v7 = [v4 parts];
  unint64_t v8 = [v7 count];

  if (v6 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  if (v9)
  {
    uint64_t v10 = 0;
    int v11 = 1;
    do
    {
      v12 = [(DKCanonicalVersion *)self parts];
      v13 = [v12 objectAtIndexedSubscript:v10];
      v14 = [v4 parts];
      v15 = [v14 objectAtIndexedSubscript:v10];
      uint64_t v16 = [v13 compare:v15];

      if (v16 == 1)
      {
        BOOL v25 = 1;
        goto LABEL_12;
      }
      v17 = [(DKCanonicalVersion *)self parts];
      v18 = [v17 objectAtIndexedSubscript:v10];
      v19 = [v4 parts];
      v20 = [v19 objectAtIndexedSubscript:v10];
      int v21 = [v18 isEqual:v20];

      v11 &= v21;
      ++v10;
    }
    while (v9 != v10);
    if (v11) {
      goto LABEL_9;
    }
    BOOL v25 = 0;
  }
  else
  {
LABEL_9:
    v22 = [(DKCanonicalVersion *)self parts];
    unint64_t v23 = [v22 count];
    v24 = [v4 parts];
    BOOL v25 = v23 > [v24 count];
  }
LABEL_12:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKCanonicalVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DKCanonicalVersion;
  id v5 = [(DKCanonicalVersion *)&v14 init];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parts"];
    parts = v5->_parts;
    v5->_parts = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    string = v5->_string;
    v5->_string = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DKCanonicalVersion *)self parts];
  [v4 encodeObject:v5 forKey:@"parts"];

  id v6 = [(DKCanonicalVersion *)self string];
  [v4 encodeObject:v6 forKey:@"string"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSArray *)self->_parts copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_string copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (unint64_t)hash
{
  v2 = [(DKCanonicalVersion *)self parts];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToCanonicalVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(DKCanonicalVersion *)self parts];
  uint64_t v6 = [v4 parts];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DKCanonicalVersion *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(DKCanonicalVersion *)self isEqualToCanonicalVersion:v4];
  }

  return v5;
}

- (id)_parseParts:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    BOOL v5 = (void *)MEMORY[0x23ECF6A10]();
    uint64_t v6 = [v3 componentsSeparatedByString:@"."];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue"));
          [v4 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v4;
}

- (NSString)string
{
  return self->_string;
}

- (NSArray)parts
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setParts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end