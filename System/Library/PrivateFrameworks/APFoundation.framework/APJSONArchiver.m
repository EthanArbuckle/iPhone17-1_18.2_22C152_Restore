@interface APJSONArchiver
+ (id)JSONObjectWithObject:(id)a3;
- (APJSONArchiver)initWithArray;
- (APJSONArchiver)initWithDictionary;
- (BOOL)_containerIsArray;
- (BOOL)allowsKeyedCoding;
- (id)_JSONObjectWithObject:(id)a3;
- (id)_valueForNumber:(id)a3;
- (id)object;
- (void)_addClassToContainer:(Class)a3;
- (void)_addValueToContainer:(id)a3 forKey:(id)a4;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation APJSONArchiver

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (APJSONArchiver)initWithArray
{
  v6.receiver = self;
  v6.super_class = (Class)APJSONArchiver;
  v2 = [(APJSONArchiver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    id container = v2->_container;
    v2->_id container = (id)v3;
  }
  return v2;
}

- (APJSONArchiver)initWithDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)APJSONArchiver;
  v2 = [(APJSONArchiver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    id container = v2->_container;
    v2->_id container = (id)v3;
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
  [(APJSONArchiver *)self _addValueToContainer:v4 forKey:@"$"];
}

- (void)_addValueToContainer:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    BOOL v7 = [(APJSONArchiver *)self _containerIsArray];
    id container = self->_container;
    if (v7) {
      [container addObject:v9];
    }
    else {
      [container setValue:v9 forKey:v6];
    }
  }
}

- (id)_JSONObjectWithObject:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_9;
  }
  id v5 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v4)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = v4;
LABEL_8:
    id v7 = v6;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(APJSONArchiver *)self _valueForNumber:v4];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [MEMORY[0x1E4F28D48] apDefaultSharedFormatter];
    uint64_t v10 = [v9 stringFromDate:v4];
LABEL_18:
    id v7 = (id)v10;
LABEL_19:

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v4 base64EncodedStringWithOptions:0];
    uint64_t v10 = [NSString stringWithFormat:@"data:;base64,%@", v9];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 UUIDString];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)MEMORY[0x1E4F1CA48];
    id v12 = v4;
    v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1D70C604C;
    v33[3] = &unk_1E6A6B5B8;
    v33[4] = self;
    id v14 = v13;
    id v34 = v14;
    [v12 enumerateObjectsUsingBlock:v33];

    v15 = v34;
LABEL_30:
    id v7 = v14;

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)MEMORY[0x1E4F1CA60];
    id v17 = v4;
    v18 = objc_msgSend(v16, "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1D70C60B0;
    v31[3] = &unk_1E6A6B5E0;
    v31[4] = self;
    id v14 = v18;
    id v32 = v14;
    [v17 enumerateKeysAndObjectsUsingBlock:v31];

    v15 = v32;
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v4 allObjects];
    v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1D70C6124;
    v29[3] = &unk_1E6A6B5B8;
    v29[4] = self;
    id v20 = v19;
    id v30 = v20;
    [v9 enumerateObjectsUsingBlock:v29];
    v21 = v30;
    id v7 = v20;

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)MEMORY[0x1E4F1CA48];
    id v23 = v4;
    v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1D70C6188;
    v27[3] = &unk_1E6A6B5B8;
    v27[4] = self;
    id v14 = v24;
    id v28 = v14;
    [v23 enumerateObjectsUsingBlock:v27];

    v15 = v28;
    goto LABEL_30;
  }
  v25 = (void *)MEMORY[0x1D9469B60]();
  v26 = [[APJSONArchiver alloc] initWithDictionary];
  [(APJSONArchiver *)v26 _addClassToContainer:objc_opt_class()];
  [v4 encodeWithCoder:v26];
  id v7 = [(APJSONArchiver *)v26 object];

LABEL_9:

  return v7;
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(APJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(APJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(APJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v9 = [v6 numberWithDouble:a3];
  id v8 = [(APJSONArchiver *)self _valueForNumber:v9];
  [(APJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(APJSONArchiver *)self _addValueToContainer:v8 forKey:v7];
}

- (id)_valueForNumber:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(APJSONArchiver *)self _JSONObjectWithObject:a3];
  [(APJSONArchiver *)self _addValueToContainer:v7 forKey:v6];
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
}

- (id)object
{
  return self->_container;
}

+ (id)JSONObjectWithObject:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(APJSONArchiver);
  id v5 = [(APJSONArchiver *)v4 _JSONObjectWithObject:v3];

  return v5;
}

- (void).cxx_destruct
{
}

@end