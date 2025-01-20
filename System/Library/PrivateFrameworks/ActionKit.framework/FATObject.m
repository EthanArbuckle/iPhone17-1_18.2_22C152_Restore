@interface FATObject
+ (id)structFields;
+ (id)structName;
- (BOOL)isEqual:(id)a3;
- (FATObject)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)read:(id)a3;
- (void)write:(id)a3;
@end

@implementation FATObject

+ (id)structFields
{
  return 0;
}

+ (id)structName
{
  return 0;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  [v3 appendString:@"<"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  objc_msgSend(v3, "appendFormat:", @": %p;", self);
  v6 = [(id)objc_opt_class() structFields];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 name];
        v13 = [v11 name];
        v14 = [(FATObject *)self valueForKey:v13];
        [v3 appendFormat:@" %@ = %@;", v12, v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(id)objc_opt_class() structFields];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) name];
        v10 = [(FATObject *)self valueForKey:v9];

        if (v10)
        {
          [v3 addObject:v10];
        }
        else
        {
          v11 = [MEMORY[0x263EFF9D0] null];
          [v3 addObject:v11];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  unint64_t v12 = [v3 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(id)objc_opt_class() structFields];
    uint64_t v6 = [(id)objc_opt_class() structFields];
    if ([v5 isEqualToArray:v6])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        long long v17 = v6;
        uint64_t v10 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            unint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) name];
            v13 = [(FATObject *)self valueForKey:v12];
            long long v14 = [v4 valueForKey:v12];
            if (v13 != v14 && ![v13 isEqual:v14])
            {

              BOOL v15 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v9) {
            continue;
          }
          break;
        }
        BOOL v15 = 1;
LABEL_16:
        uint64_t v6 = v17;
      }
      else
      {
        BOOL v15 = 1;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() structFields];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) name];
        v11 = [(FATObject *)self valueForKey:v10];
        if (v11) {
          [v4 encodeObject:v11 forKey:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(id)objc_opt_class() structFields];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 name];
        long long v12 = [(FATObject *)self valueForKey:v11];
        long long v13 = [v10 name];
        [v4 setValue:v12 forKey:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)write:(id)a3
{
}

- (void)read:(id)a3
{
}

- (FATObject)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FATObject *)self init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() structFields];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) name];
          if ([v4 containsValueForKey:v11])
          {
            long long v12 = [v4 decodeObjectForKey:v11];
            [(FATObject *)v5 setValue:v12 forKey:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

@end