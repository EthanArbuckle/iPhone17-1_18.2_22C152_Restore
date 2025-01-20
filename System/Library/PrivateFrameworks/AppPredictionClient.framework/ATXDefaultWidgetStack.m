@interface ATXDefaultWidgetStack
+ (BOOL)supportsSecureCoding;
- (ATXDefaultWidgetStack)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)extraLargeDefaultStack;
- (NSArray)largeDefaultStack;
- (NSArray)mediumDefaultStack;
- (NSArray)smallDefaultStack;
- (NSString)description;
- (id)_JSONCompatible:(id)a3;
- (id)_JSONCompatible:(id)a3 compact:(BOOL)a4;
- (id)compactDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)suggestedSize;
- (void)encodeWithCoder:(id)a3;
- (void)setExtraLargeDefaultStack:(id)a3;
- (void)setLargeDefaultStack:(id)a3;
- (void)setMediumDefaultStack:(id)a3;
- (void)setSmallDefaultStack:(id)a3;
- (void)setSuggestedSize:(unint64_t)a3;
@end

@implementation ATXDefaultWidgetStack

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSArray *)self->_smallDefaultStack copyWithZone:a3];
  [v5 setSmallDefaultStack:v6];

  v7 = (void *)[(NSArray *)self->_mediumDefaultStack copyWithZone:a3];
  [v5 setMediumDefaultStack:v7];

  v8 = (void *)[(NSArray *)self->_largeDefaultStack copyWithZone:a3];
  [v5 setLargeDefaultStack:v8];

  v9 = (void *)[(NSArray *)self->_extraLargeDefaultStack copyWithZone:a3];
  [v5 setExtraLargeDefaultStack:v9];

  [v5 setSuggestedSize:self->_suggestedSize];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  smallDefaultStack = self->_smallDefaultStack;
  id v5 = a3;
  [v5 encodeObject:smallDefaultStack forKey:@"smallDefaultStack"];
  [v5 encodeObject:self->_mediumDefaultStack forKey:@"mediumDefaultStack"];
  [v5 encodeObject:self->_largeDefaultStack forKey:@"largeDefaultStack"];
  [v5 encodeObject:self->_extraLargeDefaultStack forKey:@"extraLargeDefaultStack"];
  [v5 encodeInteger:self->_suggestedSize forKey:@"suggestedSize"];
}

- (ATXDefaultWidgetStack)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ATXDefaultWidgetStack;
  id v5 = [(ATXDefaultWidgetStack *)&v27 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"smallDefaultStack"];
    smallDefaultStack = v5->_smallDefaultStack;
    v5->_smallDefaultStack = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"mediumDefaultStack"];
    mediumDefaultStack = v5->_mediumDefaultStack;
    v5->_mediumDefaultStack = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"largeDefaultStack"];
    largeDefaultStack = v5->_largeDefaultStack;
    v5->_largeDefaultStack = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"extraLargeDefaultStack"];
    extraLargeDefaultStack = v5->_extraLargeDefaultStack;
    v5->_extraLargeDefaultStack = (NSArray *)v24;

    v5->_suggestedSize = [v4 decodeIntegerForKey:@"suggestedSize"];
  }

  return v5;
}

- (id)_JSONCompatible:(id)a3
{
  return [(ATXDefaultWidgetStack *)self _JSONCompatible:a3 compact:0];
}

- (id)_JSONCompatible:(id)a3 compact:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v4) {
          [v12 compactDescription];
        }
        else {
        v13 = objc_msgSend(v12, "dictionaryRepresentation", (void)v15);
        }
        objc_msgSend(v6, "addObject:", v13, (void)v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  BOOL v4 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_smallDefaultStack];
  [v3 setObject:v4 forKeyedSubscript:@"smallDefaultStack"];

  id v5 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_mediumDefaultStack];
  [v3 setObject:v5 forKeyedSubscript:@"mediumDefaultStack"];

  v6 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_largeDefaultStack];
  [v3 setObject:v6 forKeyedSubscript:@"largeDefaultStack"];

  id v7 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_extraLargeDefaultStack];
  [v3 setObject:v7 forKeyedSubscript:@"extraLargeDefaultStack"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_suggestedSize];
  [v3 setObject:v8 forKeyedSubscript:@"suggestedSize"];

  return v3;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(ATXDefaultWidgetStack *)self dictionaryRepresentation];
  BOOL v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (id)compactDescription
{
  v3 = objc_opt_new();
  BOOL v4 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_smallDefaultStack compact:1];
  [v3 setObject:v4 forKeyedSubscript:@"smallDefaultStack"];

  id v5 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_mediumDefaultStack compact:1];
  [v3 setObject:v5 forKeyedSubscript:@"mediumDefaultStack"];

  v6 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_largeDefaultStack compact:1];
  [v3 setObject:v6 forKeyedSubscript:@"largeDefaultStack"];

  id v7 = [(ATXDefaultWidgetStack *)self _JSONCompatible:self->_extraLargeDefaultStack compact:1];
  [v3 setObject:v7 forKeyedSubscript:@"extraLargeDefaultStack"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_suggestedSize];
  [v3 setObject:v8 forKeyedSubscript:@"suggestedSize"];

  uint64_t v9 = [NSString stringWithFormat:@"%@", v3];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_smallDefaultStack hash];
  uint64_t v4 = [(NSArray *)self->_mediumDefaultStack hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSArray *)self->_largeDefaultStack hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_extraLargeDefaultStack hash];
  return self->_suggestedSize - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXDefaultWidgetStack *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      smallDefaultStack = self->_smallDefaultStack;
      id v7 = (NSArray *)v5[1];
      if (smallDefaultStack == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        uint64_t v9 = smallDefaultStack;
        char v10 = [(NSArray *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_19;
        }
      }
      mediumDefaultStack = self->_mediumDefaultStack;
      v13 = (NSArray *)v5[2];
      if (mediumDefaultStack == v13)
      {
      }
      else
      {
        uint64_t v14 = v13;
        long long v15 = mediumDefaultStack;
        char v16 = [(NSArray *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_19;
        }
      }
      largeDefaultStack = self->_largeDefaultStack;
      long long v18 = (NSArray *)v5[3];
      if (largeDefaultStack == v18)
      {
      }
      else
      {
        uint64_t v19 = v18;
        uint64_t v20 = largeDefaultStack;
        char v21 = [(NSArray *)v20 isEqual:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_19;
        }
      }
      extraLargeDefaultStack = self->_extraLargeDefaultStack;
      v23 = (NSArray *)v5[4];
      if (extraLargeDefaultStack == v23)
      {
      }
      else
      {
        uint64_t v24 = v23;
        v25 = extraLargeDefaultStack;
        char v26 = [(NSArray *)v25 isEqual:v24];

        if ((v26 & 1) == 0)
        {
LABEL_19:
          BOOL v11 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      unint64_t suggestedSize = self->_suggestedSize;
      BOOL v11 = suggestedSize == [v5 suggestedSize];
      goto LABEL_22;
    }
    BOOL v11 = 0;
  }
LABEL_23:

  return v11;
}

- (NSArray)smallDefaultStack
{
  return self->_smallDefaultStack;
}

- (void)setSmallDefaultStack:(id)a3
{
}

- (NSArray)mediumDefaultStack
{
  return self->_mediumDefaultStack;
}

- (void)setMediumDefaultStack:(id)a3
{
}

- (NSArray)largeDefaultStack
{
  return self->_largeDefaultStack;
}

- (void)setLargeDefaultStack:(id)a3
{
}

- (NSArray)extraLargeDefaultStack
{
  return self->_extraLargeDefaultStack;
}

- (void)setExtraLargeDefaultStack:(id)a3
{
}

- (unint64_t)suggestedSize
{
  return self->_suggestedSize;
}

- (void)setSuggestedSize:(unint64_t)a3
{
  self->_unint64_t suggestedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeDefaultStack, 0);
  objc_storeStrong((id *)&self->_largeDefaultStack, 0);
  objc_storeStrong((id *)&self->_mediumDefaultStack, 0);

  objc_storeStrong((id *)&self->_smallDefaultStack, 0);
}

@end