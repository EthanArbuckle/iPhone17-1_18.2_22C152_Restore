@interface HMIJSONArchiver
+ (id)JSONObjectStringWithObject:(id)a3;
+ (id)JSONObjectStringWithObject:(id)a3 pretty:(BOOL)a4 options:(int64_t)a5;
+ (id)JSONObjectWithObject:(id)a3 options:(int64_t)a4;
- (BOOL)_containerIsArray;
- (BOOL)allowsKeyedCoding;
- (HMIJSONArchiver)init;
- (HMIJSONArchiver)initWithArray;
- (HMIJSONArchiver)initWithDictionary;
- (NSString)objectJSON;
- (NSString)objectPrettyJSON;
- (id)_JSONObjectWithObject:(id)a3 options:(int64_t)a4;
- (id)_valueForNumber:(id)a3;
- (id)object;
- (int64_t)options;
- (void)_addClassToContainer:(Class)a3;
- (void)_addValueToContainer:(id)a3 forKey:(id)a4;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)setOptions:(int64_t)a3;
@end

@implementation HMIJSONArchiver

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (HMIJSONArchiver)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMIJSONArchiver;
  v2 = [(HMIJSONArchiver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    id container = v2->_container;
    v2->_id container = (id)v3;

    v2->_options = 0;
  }
  return v2;
}

- (HMIJSONArchiver)initWithArray
{
  v6.receiver = self;
  v6.super_class = (Class)HMIJSONArchiver;
  v2 = [(HMIJSONArchiver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    id container = v2->_container;
    v2->_id container = (id)v3;

    v2->_options = 0;
  }
  return v2;
}

- (HMIJSONArchiver)initWithDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)HMIJSONArchiver;
  v2 = [(HMIJSONArchiver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    id container = v2->_container;
    v2->_id container = (id)v3;

    v2->_options = 0;
  }
  return v2;
}

- (BOOL)_containerIsArray
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)_addClassToContainer:(Class)a3
{
  NSStringFromClass(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HMIJSONArchiver *)self _addValueToContainer:v4 forKey:@"$"];
}

- (void)_addValueToContainer:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(HMIJSONArchiver *)self _containerIsArray])
  {
    [self->_container addObject:v7];
  }
  else if (v7)
  {
    [self->_container setValue:v7 forKey:v6];
  }
}

- (id)_JSONObjectWithObject:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  if (!v6) {
    goto LABEL_12;
  }
  id v7 = [MEMORY[0x263EFF9D0] null];

  if (v7 == v6) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [(HMIJSONArchiver *)self _valueForNumber:v6];
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (HMIJSONArchiver *)objc_alloc_init(MEMORY[0x263F088C0]);
        uint64_t v10 = [(HMIJSONArchiver *)v9 stringFromDate:v6];
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_12:
        v11 = 0;
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke;
          v14[3] = &unk_26477D608;
          v14[4] = self;
          v14[5] = a4;
          objc_msgSend(v6, "na_map:", v14);
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke_2;
          v13[3] = &unk_26477D630;
          v13[4] = self;
          v13[5] = a4;
          objc_msgSend(v6, "na_dictionaryByMappingValues:", v13);
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v9 = [[HMIJSONArchiver alloc] initWithDictionary];
        [(HMIJSONArchiver *)v9 setOptions:a4];
        [(HMIJSONArchiver *)v9 _addClassToContainer:objc_opt_class()];
        [v6 encodeWithCoder:v9];
        uint64_t v10 = [(HMIJSONArchiver *)v9 object];
LABEL_10:
        v11 = (void *)v10;

        goto LABEL_17;
      }
      if (a4)
      {
        v9 = [v6 base64EncodedStringWithOptions:0];
        uint64_t v10 = [NSString stringWithFormat:@"data:;base64,%@", v9];
        goto LABEL_10;
      }
LABEL_15:
      id v8 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_16;
    }
  }
  id v8 = v6;
LABEL_16:
  v11 = v8;
LABEL_17:

  return v11;
}

uint64_t __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _JSONObjectWithObject:a2 options:*(void *)(a1 + 40)];
}

uint64_t __49__HMIJSONArchiver__JSONObjectWithObject_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _JSONObjectWithObject:a3 options:*(void *)(a1 + 40)];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(HMIJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(HMIJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v9 = [v6 numberWithDouble:a3];
  id v8 = [(HMIJSONArchiver *)self _valueForNumber:v9];
  [(HMIJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(HMIJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (id)_valueForNumber:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087B0];
  BOOL v4 = NSString;
  [a3 floatValue];
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"%.6f", v5);
  id v7 = [v3 decimalNumberWithString:v6];

  return v7;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  int64_t options = self->_options;
  id v7 = a4;
  id v8 = [(HMIJSONArchiver *)self _JSONObjectWithObject:a3 options:options];
  [(HMIJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (NSString)objectJSON
{
  id v3 = [NSString alloc];
  BOOL v4 = (void *)MEMORY[0x263F08900];
  float v5 = [(HMIJSONArchiver *)self object];
  id v6 = [v4 dataWithJSONObject:v5 options:10 error:0];
  id v7 = (void *)[v3 initWithData:v6 encoding:4];

  return (NSString *)v7;
}

- (NSString)objectPrettyJSON
{
  id v3 = [NSString alloc];
  BOOL v4 = (void *)MEMORY[0x263F08900];
  float v5 = [(HMIJSONArchiver *)self object];
  id v6 = [v4 dataWithJSONObject:v5 options:11 error:0];
  id v7 = (void *)[v3 initWithData:v6 encoding:4];

  return (NSString *)v7;
}

- (id)object
{
  return self->_container;
}

+ (id)JSONObjectWithObject:(id)a3 options:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMIJSONArchiver);
  [(HMIJSONArchiver *)v6 setOptions:a4];
  id v7 = [(HMIJSONArchiver *)v6 _JSONObjectWithObject:v5 options:a4];

  return v7;
}

+ (id)JSONObjectStringWithObject:(id)a3
{
  return (id)[a1 JSONObjectStringWithObject:a3 pretty:0 options:0];
}

+ (id)JSONObjectStringWithObject:(id)a3 pretty:(BOOL)a4 options:(int64_t)a5
{
  BOOL v5 = a4;
  id v6 = [a1 JSONObjectWithObject:a3 options:a5];
  if (v5) {
    uint64_t v7 = 15;
  }
  else {
    uint64_t v7 = 14;
  }
  id v8 = [NSString alloc];
  id v9 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:v7 error:0];
  uint64_t v10 = (void *)[v8 initWithData:v9 encoding:4];

  return v10;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_int64_t options = a3;
}

- (void).cxx_destruct
{
}

@end