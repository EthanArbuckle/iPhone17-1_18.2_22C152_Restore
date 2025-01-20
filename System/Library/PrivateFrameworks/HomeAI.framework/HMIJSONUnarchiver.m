@interface HMIJSONUnarchiver
+ (id)objectWithJSONData:(id)a3 classMap:(id)a4;
+ (id)objectWithJSONObject:(id)a3 classMap:(id)a4;
+ (id)objectWithJSONObjectString:(id)a3 classMap:(id)a4;
- (BOOL)allowsKeyedCoding;
- (BOOL)decodeBoolForKey:(id)a3;
- (HMIJSONUnarchiver)initWithJSONObject:(id)a3;
- (NSDictionary)classMap;
- (double)decodeDoubleForKey:(id)a3;
- (id)_objectWithJSONObject:(id)a3 allowedClasses:(id)a4;
- (id)container;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (int)decodeInt32ForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (void)setClassMap:(id)a3;
@end

@implementation HMIJSONUnarchiver

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (HMIJSONUnarchiver)initWithJSONObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIJSONUnarchiver;
  v6 = [(HMIJSONUnarchiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_container, a3);
  }

  return v7;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  v3 = [self->_container objectForKeyedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  v3 = [self->_container objectForKeyedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  v3 = [self->_container objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (double)decodeDoubleForKey:(id)a3
{
  v3 = [self->_container objectForKeyedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)_objectWithJSONObject:(id)a3 allowedClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_22;
  }
  id v8 = [MEMORY[0x263EFF9D0] null];

  if (v8 == v6) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    if (![v9 hasPrefix:@"data:;base64,"]
      || ([NSURL URLWithString:v9],
          v10 = objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v10],
          id v11 = (id)objc_claimAutoreleasedReturnValue(),
          v10,
          !v11))
    {
      if (![v9 hasSuffix:@"Z"]
        || (id v12 = objc_alloc_init(MEMORY[0x263F088C0]),
            [v12 dateFromString:v9],
            id v11 = (id)objc_claimAutoreleasedReturnValue(),
            v12,
            !v11))
      {
        id v11 = v9;
      }
    }
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_11:
    id v11 = v6;
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke;
    v29[3] = &unk_26477D658;
    v29[4] = self;
    id v30 = v7;
    objc_msgSend(v6, "na_map:", v29);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x263EFF940];
    uint64_t v20 = *MEMORY[0x263EFF498];
    v21 = [NSString stringWithFormat:@"Invalid JSONObject: %@", objc_opt_class()];
    id v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];

    objc_exception_throw(v22);
  }
  id v9 = v6;
  v13 = [v9 objectForKeyedSubscript:@"$"];
  if (v13)
  {
    v14 = [(HMIJSONUnarchiver *)self classMap];
    v15 = (objc_class *)[v14 objectForKeyedSubscript:v13];

    if (!v15)
    {
      v15 = NSClassFromString(v13);
      if (!v15)
      {
        v23 = (void *)MEMORY[0x263EFF940];
        uint64_t v24 = *MEMORY[0x263EFF498];
        v25 = [NSString stringWithFormat:@"Invalid JSONObject class name: %@", v13];
        id v26 = [v23 exceptionWithName:v24 reason:v25 userInfo:0];

        objc_exception_throw(v26);
      }
    }
    v16 = [[HMIJSONUnarchiver alloc] initWithJSONObject:v9];
    v17 = [(HMIJSONUnarchiver *)self classMap];
    [(HMIJSONUnarchiver *)v16 setClassMap:v17];

    id v11 = (id)[[v15 alloc] initWithCoder:v16];
  }
  else
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke_2;
    v27[3] = &unk_26477D680;
    v27[4] = self;
    id v28 = v7;
    objc_msgSend(v9, "na_dictionaryByMappingValues:", v27);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

LABEL_22:
  return v11;
}

uint64_t __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _objectWithJSONObject:a2 allowedClasses:*(void *)(a1 + 40)];
}

uint64_t __58__HMIJSONUnarchiver__objectWithJSONObject_allowedClasses___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _objectWithJSONObject:a3 allowedClasses:*(void *)(a1 + 40)];
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = [self->_container objectForKeyedSubscript:a4];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:a3];
  id v8 = [(HMIJSONUnarchiver *)self _objectWithJSONObject:v6 allowedClasses:v7];

  return v8;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id container = self->_container;
  id v7 = a3;
  id v8 = [container objectForKeyedSubscript:a4];
  id v9 = [(HMIJSONUnarchiver *)self _objectWithJSONObject:v8 allowedClasses:v7];

  return v9;
}

+ (id)objectWithJSONObject:(id)a3 classMap:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(HMIJSONUnarchiver);
  [(HMIJSONUnarchiver *)v7 setClassMap:v5];

  id v8 = [(HMIJSONUnarchiver *)v7 _objectWithJSONObject:v6 allowedClasses:0];

  return v8;
}

+ (id)objectWithJSONObjectString:(id)a3 classMap:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  id v8 = [a1 objectWithJSONData:v7 classMap:v6];

  return v8;
}

+ (id)objectWithJSONData:(id)a3 classMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:4 error:&v16];
  id v9 = v16;
  if (!v8)
  {
    id v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF498];
    v14 = [NSString stringWithFormat:@"Cannot parse JSON data: %@", v9];
    id v15 = [v12 exceptionWithName:v13 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  v10 = [a1 objectWithJSONObject:v8 classMap:v7];

  return v10;
}

- (NSDictionary)classMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClassMap:(id)a3
{
}

- (id)container
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_container, 0);
  objc_storeStrong((id *)&self->_classMap, 0);
}

@end