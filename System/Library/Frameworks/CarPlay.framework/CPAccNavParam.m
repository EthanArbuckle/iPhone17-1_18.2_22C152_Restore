@interface CPAccNavParam
+ (CPAccNavParam)paramWithProperty:(id)a3 keys:(id)a4;
+ (Class)_objcTypeForUpdate:(Class)a3 parameter:(id)a4;
+ (id)_encodedTypeForClass:(Class)a3 property:(id)a4;
+ (int64_t)_accNavTypeForUpdate:(Class)a3 parameter:(id)a4 key:(id)a5;
- (BOOL)encodeable;
- (CPAccNavParam)init;
- (CPAccNavParamKey)primaryKey;
- (Class)collectionGeneric;
- (Class)objcType;
- (NSArray)keys;
- (NSString)property;
- (id)copySettingCollectionGeneric:(Class)a3;
- (id)copySettingEncodeable:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)configureTypesForUpdate:(Class)a3;
- (void)setCollectionGeneric:(Class)a3;
- (void)setEncodeable:(BOOL)a3;
- (void)setKeys:(id)a3;
- (void)setObjcType:(Class)a3;
- (void)setProperty:(id)a3;
@end

@implementation CPAccNavParam

+ (CPAccNavParam)paramWithProperty:(id)a3 keys:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setProperty:v6];

  [v7 setKeys:v5];

  return (CPAccNavParam *)v7;
}

- (CPAccNavParam)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPAccNavParam;
  result = [(CPAccNavParam *)&v3 init];
  if (result) {
    result->_encodeable = 1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = NSStringFromClass([(CPAccNavParam *)self objcType]);
  id v5 = &stru_26C93EB30;
  if ([(CPAccNavParam *)self collectionGeneric])
  {
    id v6 = NSString;
    v7 = NSStringFromClass([(CPAccNavParam *)self collectionGeneric]);
    v8 = [v6 stringWithFormat:@"(%@)", v7];
    [v3 stringWithFormat:@" objcType=%@%@", v4, v8];
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [v3 stringWithFormat:@" objcType=%@%@", v4, &stru_26C93EB30];
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  v12 = [(CPAccNavParam *)self property];
  if ([(CPAccNavParam *)self objcType]) {
    id v5 = v9;
  }
  v13 = [(CPAccNavParam *)self keys];
  v14 = [v10 stringWithFormat:@"<%@: %p property=%@%@ %@>", v11, self, v12, v5, v13];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  id v5 = [(CPAccNavParam *)self property];
  [v4 setProperty:v5];

  id v6 = [(CPAccNavParam *)self keys];
  [v4 setKeys:v6];

  objc_msgSend(v4, "setCollectionGeneric:", -[CPAccNavParam collectionGeneric](self, "collectionGeneric"));
  objc_msgSend(v4, "setEncodeable:", -[CPAccNavParam encodeable](self, "encodeable"));
  objc_msgSend(v4, "setObjcType:", -[CPAccNavParam objcType](self, "objcType"));
  return v4;
}

- (CPAccNavParamKey)primaryKey
{
  v2 = [(CPAccNavParam *)self keys];
  objc_super v3 = [v2 firstObject];

  return (CPAccNavParamKey *)v3;
}

- (id)copySettingCollectionGeneric:(Class)a3
{
  v4 = (void *)[(CPAccNavParam *)self copy];
  [v4 setCollectionGeneric:a3];
  return v4;
}

- (id)copySettingEncodeable:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)[(CPAccNavParam *)self copy];
  [v4 setEncodeable:v3];
  return v4;
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (Class)collectionGeneric
{
  return self->_collectionGeneric;
}

- (void)setCollectionGeneric:(Class)a3
{
}

- (BOOL)encodeable
{
  return self->_encodeable;
}

- (void)setEncodeable:(BOOL)a3
{
  self->_encodeable = a3;
}

- (Class)objcType
{
  return self->_objcType;
}

- (void)setObjcType:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcType, 0);
  objc_storeStrong((id *)&self->_collectionGeneric, 0);
  objc_storeStrong((id *)&self->_keys, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

- (void)configureTypesForUpdate:(Class)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(CPAccNavParam *)self objcType]
    && [(objc_class *)a3 conformsToProtocol:&unk_26C95C978])
  {
    [(CPAccNavParam *)self setObjcType:+[CPAccNavParam _objcTypeForUpdate:a3 parameter:self]];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(CPAccNavParam *)self keys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_msgSend(v10, "setAccNavType:", +[CPAccNavParam _accNavTypeForUpdate:parameter:key:](CPAccNavParam, "_accNavTypeForUpdate:parameter:key:", a3, self, v10));
          [v10 setParam:self];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

+ (Class)_objcTypeForUpdate:(Class)a3 parameter:(id)a4
{
  uint64_t v6 = [a4 property];
  uint64_t v7 = [a1 _encodedTypeForClass:a3 property:v6];

  int v8 = [v7 characterAtIndex:0];
  id v9 = 0;
  uint64_t v10 = (v8 - 64);
  if (v10 <= 0x3B)
  {
    if (((1 << (v8 - 64)) & 0xA1258000A120CLL) != 0)
    {
LABEL_3:
      objc_opt_class();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (v8 == 64)
    {
      if ((unint64_t)[v7 length] < 3)
      {
        id v9 = 0;
      }
      else
      {
        objc_msgSend(v7, "substringWithRange:", 2, objc_msgSend(v7, "length") - 3);
        long long v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        long long v13 = NSClassFromString(v12);
        if (!v13) {
          long long v13 = objc_opt_class();
        }
        id v9 = v13;
      }
    }
    else if (v10 == 59)
    {
      goto LABEL_3;
    }
  }
LABEL_4:

  return (Class)v9;
}

+ (int64_t)_accNavTypeForUpdate:(Class)a3 parameter:(id)a4 key:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v9 accNavType] != -1)
  {
    int64_t v10 = [v9 accNavType];
    goto LABEL_6;
  }
  uint64_t v11 = [v8 objcType];
  if [v9 enumType] || (objc_msgSend(v9, "isBoolValue"))
  {
    int64_t v10 = 3;
    goto LABEL_6;
  }
  if ([v9 isTimeIntervalValue])
  {
    int64_t v10 = 0;
    goto LABEL_6;
  }
  long long v13 = [v9 dimension];
  long long v14 = [MEMORY[0x263F08C70] degrees];
  char v15 = [v13 isEqual:v14];

  if (v15)
  {
    int64_t v10 = 6;
    goto LABEL_6;
  }
  uint64_t v16 = [v9 dimension];
  v17 = [MEMORY[0x263F08CE8] meters];
  char v18 = [v16 isEqual:v17];

  if (v18) {
    goto LABEL_12;
  }
  v19 = [v9 dimension];
  v20 = [MEMORY[0x263F08CB0] volts];
  char v21 = [v19 isEqual:v20];

  if (v21)
  {
    int64_t v10 = 2;
    goto LABEL_6;
  }
  v22 = [v9 dimension];
  v23 = [MEMORY[0x263F08D08] watts];
  char v24 = [v22 isEqual:v23];

  if ((v24 & 1) != 0
    || ([v9 dimension],
        v25 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x263F08CC0] wattHours],
        v26 = objc_claimAutoreleasedReturnValue(),
        char v27 = [v25 isEqual:v26],
        v26,
        v25,
        (v27 & 1) != 0))
  {
LABEL_12:
    int64_t v10 = 1;
    goto LABEL_6;
  }
  if ([v9 hasVariants]) {
    uint64_t v11 = [v8 collectionGeneric];
  }
  if (v11 == objc_opt_class())
  {
    v28 = [v8 property];
    v29 = [a1 _encodedTypeForClass:a3 property:v28];

    int v30 = [v29 characterAtIndex:0];
    if (v30 > 98)
    {
      int64_t v10 = 7;
      switch(v30)
      {
        case 'c':
          goto LABEL_47;
        case 'd':
        case 'f':
          goto LABEL_37;
        case 'e':
        case 'g':
        case 'h':
          goto LABEL_44;
        case 'i':
          int64_t v10 = 5;
          goto LABEL_47;
        default:
          if (v30 == 113)
          {
            int64_t v10 = 4;
          }
          else
          {
            if (v30 != 115) {
              goto LABEL_44;
            }
            int64_t v10 = 6;
          }
          break;
      }
      goto LABEL_47;
    }
    if (v30 <= 72)
    {
      if (v30 == 66 || v30 == 67)
      {
        int64_t v10 = 3;
        goto LABEL_47;
      }
    }
    else
    {
      switch(v30)
      {
        case 'I':
          int64_t v10 = 1;
          goto LABEL_47;
        case 'Q':
LABEL_37:
          int64_t v10 = 0;
          goto LABEL_47;
        case 'S':
          int64_t v10 = 2;
LABEL_47:

          goto LABEL_6;
      }
    }
LABEL_44:
    int64_t v10 = -1;
    goto LABEL_47;
  }
  if (v11 == objc_opt_class() || v11 == objc_opt_class())
  {
    int64_t v10 = 10;
  }
  else if (v11 == objc_opt_class() || v11 == objc_opt_class())
  {
    int64_t v10 = 8;
  }
  else if (v11 == objc_opt_class())
  {
    int64_t v10 = 0;
  }
  else
  {
    int64_t v10 = -1;
  }
LABEL_6:

  return v10;
}

+ (id)_encodedTypeForClass:(Class)a3 property:(id)a4
{
  Property = class_getProperty(a3, (const char *)[a4 UTF8String]);
  id v5 = property_copyAttributeValue(Property, "T");
  uint64_t v6 = [NSString stringWithUTF8String:v5];
  free(v5);

  return v6;
}

@end