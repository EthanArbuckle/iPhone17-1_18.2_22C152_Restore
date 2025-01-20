@interface DNDModeSymbolDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDModeSymbolDescriptor)initWithCoder:(id)a3;
- (DNDModeSymbolDescriptor)initWithTintStyle:(unint64_t)a3 tintColorNames:(id)a4 imageName:(id)a5;
- (NSArray)tintColorNames;
- (NSString)imageName;
- (NSString)primaryTintColorName;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)tintStyle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeSymbolDescriptor

- (DNDModeSymbolDescriptor)initWithTintStyle:(unint64_t)a3 tintColorNames:(id)a4 imageName:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DNDModeSymbolDescriptor;
  v11 = [(DNDModeSymbolDescriptor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_tintStyle = a3;
    objc_storeStrong((id *)&v11->_tintColorNames, a4);
    objc_storeStrong((id *)&v12->_imageName, a5);
  }

  return v12;
}

- (NSString)primaryTintColorName
{
  v3 = [(NSArray *)self->_tintColorNames count];
  if (v3)
  {
    v3 = [(NSArray *)self->_tintColorNames firstObject];
  }
  return (NSString *)v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDModeSymbolDescriptor *)self tintStyle];
  v4 = [(DNDModeSymbolDescriptor *)self tintColorNames];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(DNDModeSymbolDescriptor *)self imageName];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDModeSymbolDescriptor *)a3;
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
      unint64_t v6 = [(DNDModeSymbolDescriptor *)self tintStyle];
      if (v6 != [(DNDModeSymbolDescriptor *)v5 tintStyle])
      {
        char v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      unint64_t v7 = [(DNDModeSymbolDescriptor *)self tintColorNames];
      v8 = [(DNDModeSymbolDescriptor *)v5 tintColorNames];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDModeSymbolDescriptor *)self tintColorNames];
        if (!v9)
        {
          char v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        id v10 = (void *)v9;
        v11 = [(DNDModeSymbolDescriptor *)v5 tintColorNames];
        if (!v11)
        {
          char v14 = 0;
LABEL_25:

          goto LABEL_26;
        }
        v12 = [(DNDModeSymbolDescriptor *)self tintColorNames];
        v13 = [(DNDModeSymbolDescriptor *)v5 tintColorNames];
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
      v15 = [(DNDModeSymbolDescriptor *)self imageName];
      uint64_t v16 = [(DNDModeSymbolDescriptor *)v5 imageName];
      if (v15 == (void *)v16)
      {

        char v14 = 1;
      }
      else
      {
        v17 = (void *)v16;
        uint64_t v18 = [(DNDModeSymbolDescriptor *)self imageName];
        if (v18)
        {
          v19 = (void *)v18;
          v20 = [(DNDModeSymbolDescriptor *)v5 imageName];
          if (v20)
          {
            v23 = [(DNDModeSymbolDescriptor *)self imageName];
            v21 = [(DNDModeSymbolDescriptor *)v5 imageName];
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
      id v10 = v27;
      v13 = v24;
      v12 = v25;
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
  unint64_t v5 = [(DNDModeSymbolDescriptor *)self tintStyle];
  unint64_t v6 = [(DNDModeSymbolDescriptor *)self tintColorNames];
  unint64_t v7 = [(DNDModeSymbolDescriptor *)self imageName];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; tintStyle: %lu; tintColorNames: %@; imageName: %@>",
    v4,
    self,
    v5,
    v6,
  v8 = v7);

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableModeSymbolDescriptor alloc];
  unint64_t v5 = [(DNDModeSymbolDescriptor *)self tintStyle];
  unint64_t v6 = [(DNDModeSymbolDescriptor *)self tintColorNames];
  unint64_t v7 = [(DNDModeSymbolDescriptor *)self imageName];
  v8 = [(DNDMutableModeSymbolDescriptor *)v4 initWithTintStyle:v5 tintColorNames:v6 imageName:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeSymbolDescriptor tintStyle](self, "tintStyle"), @"style");
  unint64_t v5 = [(DNDModeSymbolDescriptor *)self tintColorNames];
  [v4 encodeObject:v5 forKey:@"colors"];

  id v6 = [(DNDModeSymbolDescriptor *)self imageName];
  [v4 encodeObject:v6 forKey:@"imageName"];
}

- (DNDModeSymbolDescriptor)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"style"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"colors"];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];

  v11 = [(DNDModeSymbolDescriptor *)self initWithTintStyle:v5 tintColorNames:v9 imageName:v10];
  return v11;
}

- (unint64_t)tintStyle
{
  return self->_tintStyle;
}

- (NSArray)tintColorNames
{
  return self->_tintColorNames;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_tintColorNames, 0);
}

@end