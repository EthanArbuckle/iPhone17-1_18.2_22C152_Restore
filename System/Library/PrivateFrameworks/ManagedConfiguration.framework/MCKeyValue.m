@interface MCKeyValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isStringValue;
- (MCKeyValue)initWithCoder:(id)a3;
- (MCKeyValue)initWithData:(id)a3 localizedKey:(id)a4;
- (MCKeyValue)initWithDate:(id)a3 localizedKey:(id)a4;
- (MCKeyValue)initWithLocalizedArray:(id)a3 localizedKey:(id)a4;
- (MCKeyValue)initWithLocalizedString:(id)a3 localizedKey:(id)a4;
- (MCKeyValue)initWithValue:(id)a3 localizedKey:(id)a4;
- (NSString)key;
- (id)value;
- (unint64_t)valueType;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3 localizedKey:(id)a4;
- (void)setDate:(id)a3 localizedKey:(id)a4;
- (void)setLocalizedArray:(id)a3 localizedKey:(id)a4;
- (void)setLocalizedString:(id)a3 localizedKey:(id)a4;
- (void)setValue:(id)a3 localizedKey:(id)a4;
- (void)setValueType:(unint64_t)a3;
@end

@implementation MCKeyValue

- (MCKeyValue)initWithData:(id)a3 localizedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = [(MCKeyValue *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MCKeyValue *)v8 setData:v6 localizedKey:v7];
  }

  return v9;
}

- (MCKeyValue)initWithDate:(id)a3 localizedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = [(MCKeyValue *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MCKeyValue *)v8 setDate:v6 localizedKey:v7];
  }

  return v9;
}

- (MCKeyValue)initWithLocalizedArray:(id)a3 localizedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = [(MCKeyValue *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MCKeyValue *)v8 setLocalizedArray:v6 localizedKey:v7];
  }

  return v9;
}

- (MCKeyValue)initWithLocalizedString:(id)a3 localizedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCKeyValue;
  v8 = [(MCKeyValue *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MCKeyValue *)v8 setLocalizedString:v6 localizedKey:v7];
  }

  return v9;
}

- (MCKeyValue)initWithValue:(id)a3 localizedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(MCKeyValue *)self initWithData:v6 localizedKey:v7];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(MCKeyValue *)self initWithDate:v6 localizedKey:v7];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v6 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [(MCKeyValue *)self initWithLocalizedArray:v6 localizedKey:v7];
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v11 = self;
    id v12 = v6;
LABEL_15:
    v8 = [(MCKeyValue *)v11 initWithLocalizedString:v12 localizedKey:v7];
    goto LABEL_16;
  }
  if (!v6)
  {
    objc_super v11 = self;
    id v12 = 0;
    goto LABEL_15;
  }
  v13 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "Failed to set key & value of MCKeyValue as value was unrecognized type", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)MCKeyValue;
  v8 = [(MCKeyValue *)&v16 init];
LABEL_16:
  v14 = v8;

  return v14;
}

- (void)setData:(id)a3 localizedKey:(id)a4
{
  id v8 = a3;
  id v7 = (NSString *)a4;
  if (self->_key != v7) {
    objc_storeStrong((id *)&self->_key, a4);
  }
  if (self->_value != v8)
  {
    objc_storeStrong(&self->_value, a3);
    self->_valueType = 1;
  }
}

- (void)setDate:(id)a3 localizedKey:(id)a4
{
  id v8 = a3;
  id v7 = (NSString *)a4;
  if (self->_key != v7) {
    objc_storeStrong((id *)&self->_key, a4);
  }
  if (self->_value != v8)
  {
    objc_storeStrong(&self->_value, a3);
    self->_valueType = 2;
  }
}

- (void)setLocalizedArray:(id)a3 localizedKey:(id)a4
{
  id v10 = a3;
  id v7 = (NSString *)a4;
  id v8 = [v10 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (self->_key != v7) {
      objc_storeStrong((id *)&self->_key, a4);
    }
    if (self->_value != v10)
    {
      objc_storeStrong(&self->_value, a3);
      self->_valueType = 0;
    }
  }
}

- (void)setLocalizedString:(id)a3 localizedKey:(id)a4
{
  id v8 = a3;
  id v7 = (NSString *)a4;
  if (self->_key != v7) {
    objc_storeStrong((id *)&self->_key, a4);
  }
  if (self->_value != v8)
  {
    objc_storeStrong(&self->_value, a3);
    self->_valueType = 3;
  }
}

- (void)setValue:(id)a3 localizedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [(MCKeyValue *)self setDate:v6 localizedKey:v7];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(MCKeyValue *)self setLocalizedArray:v6 localizedKey:v7];
      goto LABEL_4;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = self;
    id v11 = v6;
LABEL_14:
    [(MCKeyValue *)v10 setLocalizedString:v11 localizedKey:v7];
    goto LABEL_4;
  }
  if (!v6)
  {
    id v10 = self;
    id v11 = 0;
    goto LABEL_14;
  }
  id v12 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_ERROR, "Failed to set key & value of MCKeyValue as value was unrecognized type", v13, 2u);
  }
LABEL_4:
}

- (BOOL)isStringValue
{
  return self->_valueType == 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MCKeyValue *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MCKeyValue valueType](self, "valueType"));
  [v4 encodeObject:v6 forKey:@"valueType"];

  id v7 = [(MCKeyValue *)self value];
  [v4 encodeObject:v7 forKey:@"value"];
}

- (MCKeyValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MCKeyValue;
  v5 = [(MCKeyValue *)&v18 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueType"];
    v5->_valueType = [v9 unsignedIntegerValue];

    switch(v5->_valueType)
    {
      case 0uLL:
        id v10 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v11 = objc_opt_class();
        objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
        goto LABEL_8;
      case 1uLL:
        id v12 = (void *)MEMORY[0x1E4F1CAD0];
        goto LABEL_7;
      case 2uLL:
        id v12 = (void *)MEMORY[0x1E4F1CAD0];
        goto LABEL_7;
      case 3uLL:
        id v12 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_7:
        objc_msgSend(v12, "setWithObjects:", objc_opt_class(), 0, v17);
        v13 = LABEL_8:;
        uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"value"];
        id value = v5->_value;
        v5->_id value = (id)v14;

        break;
      default:
        break;
    }
  }

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end