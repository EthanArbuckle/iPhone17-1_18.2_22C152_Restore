@interface _DKCategory
+ (BOOL)supportsSecureCoding;
+ (id)_categoryFromManagedObject:(id)a3 readMetadata:(BOOL)a4 cache:(id)a5;
+ (id)categoryWithInteger:(int64_t)a3 type:(id)a4;
+ (id)entityName;
+ (id)fromPBCodable:(id)a3;
+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_DKCategory)initWithCoder:(id)a3;
- (_DKCategory)initWithInteger:(int64_t)a3 type:(id)a4 cache:(id)a5;
- (_DKCategoryType)categoryType;
- (double)doubleValue;
- (id)objectType;
- (id)primaryValue;
- (id)stringValue;
- (id)toPBCodable;
- (int64_t)compareValue:(id)a3;
- (int64_t)integerValue;
- (int64_t)typeCode;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryType:(id)a3;
- (void)setIntegerValue:(int64_t)a3;
@end

@implementation _DKCategory

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DKCategory;
  id v4 = a3;
  [(_DKObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_integerValue, @"integerValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_categoryType forKey:@"categoryType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

+ (id)categoryWithInteger:(int64_t)a3 type:(id)a4
{
  id v5 = a4;
  v6 = [_DKCategory alloc];
  v7 = +[_DKCategoryCache sharedCached];
  v8 = [(_DKCategory *)v6 initWithInteger:a3 type:v5 cache:v7];

  return v8;
}

- (int64_t)compareValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 categoryType];
    v7 = [(_DKCategory *)self categoryType];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      uint64_t v9 = [v5 integerValue];
      if (v9 == [(_DKCategory *)self integerValue]) {
        int64_t v10 = 0;
      }
      else {
        int64_t v10 = -1;
      }
    }
    else
    {
      int64_t v10 = -1;
    }
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (_DKCategoryType)categoryType
{
  return (_DKCategoryType *)objc_getProperty(self, a2, 48, 1);
}

- (_DKCategory)initWithInteger:(int64_t)a3 type:(id)a4 cache:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v10
    || ([v10 categoryWithInteger:a3 type:v9],
        (v12 = (_DKCategory *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)_DKCategory;
    v13 = [(_DKObject *)&v17 init];
    v14 = v13;
    if (v13)
    {
      v13->_integerValue = a3;
      objc_storeStrong((id *)&v13->_categoryType, a4);
    }
    v12 = v14;
    self = v12;
  }
  v15 = v12;

  return v15;
}

- (_DKCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DKCategory;
  id v5 = [(_DKObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_integerValue = [v4 decodeInt64ForKey:@"integerValue"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryType"];
    categoryType = v5->_categoryType;
    v5->_categoryType = (_DKCategoryType *)v6;

    int v8 = +[_DKCategoryCache sharedCached];
    id v9 = [v8 categoryWithInteger:v5->_integerValue type:v5->_categoryType];

    if (v9) {
      id v10 = v9;
    }
    else {
      id v10 = v5;
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t integerValue = self->_integerValue;
  categoryType = self->_categoryType;
  v11.receiver = self;
  v11.super_class = (Class)_DKCategory;
  int v8 = [(_DKObject *)&v11 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { integerValue=%d; categoryType=%@; %@}",
    v5,
    integerValue,
    categoryType,
  id v9 = v8);

  return (NSString *)v9;
}

- (id)objectType
{
  return self->_categoryType;
}

- (id)primaryValue
{
  return (id)[NSNumber numberWithInteger:self->_integerValue];
}

- (double)doubleValue
{
  return (double)self->_integerValue;
}

- (id)stringValue
{
  v2 = [NSNumber numberWithInteger:self->_integerValue];
  v3 = [v2 stringValue];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DKCategory *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v14.receiver = self,
             v14.super_class = (Class)_DKCategory,
             [(_DKObject *)&v14 isEqual:v5]))
  {
    uint64_t v6 = v5;
    int64_t v7 = [(_DKCategory *)self integerValue];
    if (v7 == [(_DKCategory *)v6 integerValue])
    {
      int v8 = [(_DKCategory *)self categoryType];
      id v9 = [(_DKCategory *)v6 categoryType];
      if (v8 == v9)
      {
        char v12 = 1;
      }
      else
      {
        id v10 = [(_DKCategory *)self categoryType];
        objc_super v11 = [(_DKCategory *)v6 categoryType];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)setIntegerValue:(int64_t)a3
{
  self->_int64_t integerValue = a3;
}

- (void)setCategoryType:(id)a3
{
}

- (id)toPBCodable
{
  v3 = objc_alloc_init(_DKPRValue);
  id v4 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValue setType:]((uint64_t)v3, v4);
  id v5 = -[_DKPRValue type]((uint64_t)v3);
  -[_DKPRValueType setType:]((uint64_t)v5, 0);

  uint64_t v6 = [(_DKCategory *)self categoryType];
  uint64_t v7 = [v6 typeCode];
  int v8 = -[_DKPRValue type]((uint64_t)v3);
  -[_DKPRValueType setTypeCode:]((uint64_t)v8, v7);

  -[_DKPRValue setIntegerValue:]((uint64_t)v3, [(_DKCategory *)self integerValue]);
  return v3;
}

+ (id)fromPBCodable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = -[_DKPRValue integerValue]((uint64_t)v4);
    uint64_t v6 = -[_DKPRValue type]((uint64_t)v4);

    uint64_t v7 = +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", -[_DKPRValueType typeCode]((uint64_t)v6));
    int v8 = +[_DKCategory categoryWithInteger:v5 type:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (id)entityName
{
  return @"Category";
}

- (int64_t)typeCode
{
  v2 = [(_DKCategory *)self categoryType];
  int64_t v3 = [v2 typeCode];

  return v3;
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    char v12 = v11;
    if (v10)
    {
      objc_super v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "integerValue"));
      objc_super v14 = [v13 stringValue];

      v15 = NSString;
      v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "categoryType"));
      objc_super v17 = [v15 stringWithFormat:@"category-%@", v16];

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __93___DKCategory_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke;
      v20[3] = &unk_1E56102E0;
      id v23 = a1;
      id v21 = v12;
      BOOL v24 = v7;
      v22 = (id *)v10;
      v18 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v22, v14, v17, v20);
    }
    else
    {
      v18 = [a1 _categoryFromManagedObject:v11 readMetadata:v7 cache:0];
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_categoryFromManagedObject:(id)a3 readMetadata:(BOOL)a4 cache:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  int v8 = +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", [v7 categoryType]);
  id v9 = +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", [v7 integerValue], v8);
  int v10 = [v9 copyBaseObjectInfoFromManagedObject:v7 cache:v6];

  if (v10) {
    id v11 = v9;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)_DKCategory,
        [(_DKObject *)&v9 copyToManagedObject:v4]))
  {
    id v5 = v4;
    objc_msgSend(v5, "setIntegerValue:", -[_DKCategory integerValue](self, "integerValue"));
    id v6 = [(_DKCategory *)self categoryType];
    objc_msgSend(v5, "setCategoryType:", objc_msgSend(v6, "typeCode"));

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end