@interface _DKIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)_identifierFromManagedObject:(id)a3 readMetadata:(BOOL)a4 cache:(id)a5;
+ (id)entityName;
+ (id)fromPBCodable:(id)a3;
+ (id)identifierWithString:(id)a3 type:(id)a4;
+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)stringValue;
- (_DKIdentifier)initWithCoder:(id)a3;
- (_DKIdentifier)initWithString:(id)a3 type:(id)a4;
- (_DKIdentifierType)identifierType;
- (double)doubleValue;
- (id)objectType;
- (id)primaryValue;
- (id)toPBCodable;
- (int64_t)compareValue:(id)a3;
- (int64_t)integerValue;
- (int64_t)typeCode;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifierType:(id)a3;
- (void)setStringValue:(id)a3;
@end

@implementation _DKIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierType, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DKIdentifier;
  id v4 = a3;
  [(_DKObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, @"stringValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_identifierType forKey:@"identifierType"];
}

+ (id)identifierWithString:(id)a3 type:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_DKIdentifier alloc] initWithString:v6 type:v5];

  return v7;
}

- (_DKIdentifier)initWithString:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKIdentifier;
  v9 = [(_DKObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stringValue, a3);
    objc_storeStrong((id *)&v10->_identifierType, a4);
  }

  return v10;
}

- (id)toPBCodable
{
  v3 = objc_alloc_init(_DKPRValue);
  id v4 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValue setType:]((uint64_t)v3, v4);
  id v5 = -[_DKPRValue type]((uint64_t)v3);
  -[_DKPRValueType setType:]((uint64_t)v5, 2);

  id v6 = [(_DKIdentifier *)self identifierType];
  uint64_t v7 = [v6 typeCode];
  id v8 = -[_DKPRValue type]((uint64_t)v3);
  -[_DKPRValueType setTypeCode:]((uint64_t)v8, v7);

  v9 = [(_DKIdentifier *)self stringValue];
  -[_DKPRValue setStringValue:]((uint64_t)v3, v9);

  return v3;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (_DKIdentifierType)identifierType
{
  return (_DKIdentifierType *)objc_getProperty(self, a2, 48, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DKIdentifier;
  id v5 = [(_DKObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifierType"];
    identifierType = v5->_identifierType;
    v5->_identifierType = (_DKIdentifierType *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  stringValue = self->_stringValue;
  identifierType = self->_identifierType;
  v11.receiver = self;
  v11.super_class = (Class)_DKIdentifier;
  uint64_t v8 = [(_DKObject *)&v11 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { stringValue=%@, identifierType=%@; %@}",
    v5,
    stringValue,
    identifierType,
  v9 = v8);

  return (NSString *)v9;
}

- (id)objectType
{
  return self->_identifierType;
}

- (int64_t)compareValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 identifierType];
    uint64_t v7 = [(_DKIdentifier *)self identifierType];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      v9 = [v5 stringValue];
      v10 = [(_DKIdentifier *)self stringValue];
      unsigned int v11 = [v9 isEqualToString:v10];

      int64_t v12 = v11 - 1;
    }
    else
    {
      int64_t v12 = -1;
    }
  }
  else
  {
    int64_t v12 = -1;
  }

  return v12;
}

- (id)primaryValue
{
  return self->_stringValue;
}

- (double)doubleValue
{
  v2 = [(_DKIdentifier *)self stringValue];
  double v3 = (double)(unint64_t)[v2 hash];

  return v3;
}

- (int64_t)integerValue
{
  v2 = [(_DKIdentifier *)self stringValue];
  int64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (_DKIdentifier *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18.receiver = self;
        v18.super_class = (Class)_DKIdentifier;
        if ([(_DKObject *)&v18 isEqual:v6])
        {
          uint64_t v7 = v6;
          int v8 = [(_DKIdentifier *)self stringValue];
          v9 = [(_DKIdentifier *)v7 stringValue];
          if (v8 != v9)
          {
            v10 = [(_DKIdentifier *)self stringValue];
            int64_t v3 = [(_DKIdentifier *)v7 stringValue];
            if (![v10 isEqualToString:v3])
            {
              char v11 = 0;
LABEL_15:

LABEL_16:
              goto LABEL_17;
            }
            v17 = v10;
          }
          int64_t v12 = [(_DKIdentifier *)self identifierType];
          v13 = [(_DKIdentifier *)v7 identifierType];
          if (v12 == v13)
          {
            char v11 = 1;
          }
          else
          {
            v14 = [(_DKIdentifier *)self identifierType];
            v15 = [(_DKIdentifier *)v7 identifierType];
            char v11 = [v14 isEqual:v15];
          }
          v10 = v17;
          if (v8 == v9) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
      }
    }
    char v11 = 0;
  }
LABEL_17:

  return v11;
}

- (void)setStringValue:(id)a3
{
}

- (void)setIdentifierType:(id)a3
{
}

+ (id)fromPBCodable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = -[_DKPRValue stringValue]((uint64_t)v4);
    uint64_t v6 = -[_DKPRValue type]((uint64_t)v4);

    uint64_t v7 = +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", -[_DKPRValueType typeCode]((uint64_t)v6));
    int v8 = +[_DKIdentifier identifierWithString:v5 type:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (id)entityName
{
  return @"Identifier";
}

- (int64_t)typeCode
{
  v2 = [(_DKIdentifier *)self identifierType];
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
    int64_t v12 = v11;
    if (v10)
    {
      v13 = [v11 string];
      v14 = NSString;
      v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "identifierType"));
      v16 = [v14 stringWithFormat:@"id-%@", v15];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __95___DKIdentifier_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke;
      v19[3] = &unk_1E56102E0;
      id v22 = a1;
      id v20 = v12;
      BOOL v23 = v7;
      v21 = (id *)v10;
      v17 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v21, v13, v16, v19);
    }
    else
    {
      v17 = [a1 _identifierFromManagedObject:v11 readMetadata:v7 cache:0];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_identifierFromManagedObject:(id)a3 readMetadata:(BOOL)a4 cache:(id)a5
{
  id v6 = a3;
  BOOL v7 = (id *)a5;
  int v8 = [v6 string];
  if (v7)
  {
    uint64_t v9 = -[_DKObjectFromMOCache deduplicateString:](v7, v8);

    id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "identifierType"));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79___DKIdentifier_MOConversion___identifierFromManagedObject_readMetadata_cache___block_invoke;
    v15[3] = &unk_1E56102B8;
    id v16 = v6;
    id v11 = -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v7, v10, @"_DKid", v15);

    int v8 = (void *)v9;
  }
  else
  {
    id v11 = +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", [v6 identifierType]);
  }
  int64_t v12 = +[_DKIdentifier identifierWithString:v8 type:v11];
  if ([v12 copyBaseObjectInfoFromManagedObject:v6 cache:v7]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)_DKIdentifier,
        [(_DKObject *)&v10 copyToManagedObject:v4]))
  {
    id v5 = v4;
    id v6 = [(_DKIdentifier *)self stringValue];
    [v5 setString:v6];

    BOOL v7 = [(_DKIdentifier *)self identifierType];
    objc_msgSend(v5, "setIdentifierType:", objc_msgSend(v7, "typeCode"));

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end