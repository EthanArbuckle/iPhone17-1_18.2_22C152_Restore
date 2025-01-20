@interface GDRelationshipIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)prefixedIdentifierStringForIdentifierString:(id)a3;
+ (id)prefixedIdentifierStringForIdentifierValue:(unint64_t)a3;
+ (id)unprefixedIdentifierStringForIdentifierString:(id)a3;
+ (int64_t)entityClassOffset;
- (GDRelationshipIdentifier)initWithCoder:(id)a3;
- (GDRelationshipIdentifier)initWithString:(id)a3;
- (GDRelationshipIdentifier)initWithValue:(unint64_t)a3;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)entityClass;
- (unint64_t)intValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDRelationshipIdentifier

- (void).cxx_destruct
{
}

- (unint64_t)intValue
{
  return self->_intValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (GDRelationshipIdentifier)initWithCoder:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GDRelationshipIdentifier;
  v6 = [(GDRelationshipIdentifier *)&v28 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v7, @"stringValue", v9);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)v6, @"GDEntityIdentifier.m", 194, @"Invalid parameter not satisfying: %@", @"stringValue");
    }
    stringValue = v6->_stringValue;
    v6->_stringValue = v14;
    v16 = v14;

    v20 = objc_msgSend_unprefixedIdentifierStringForIdentifierString_(GDEntityIdentifier, v17, (uint64_t)v16, v18, v19);

    v6->_intValue = objc_msgSend_longLongValue(v20, v21, v22, v23, v24);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_stringValue, @"stringValue", v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  stringValue = self->_stringValue;

  return (id)objc_msgSend_initWithString_(v9, v10, (uint64_t)stringValue, v11, v12);
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDRelationshipIdentifier: %@>", v10, v11, v8);

  return v12;
}

- (int64_t)entityClass
{
  unint64_t intValue = self->_intValue;
  return intValue >> objc_msgSend_entityClassOffset(GDRelationshipIdentifier, a2, v2, v3, v4);
}

- (GDRelationshipIdentifier)initWithValue:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GDRelationshipIdentifier;
  uint64_t v4 = [(GDRelationshipIdentifier *)&v12 init];
  uint64_t v8 = v4;
  if (v4)
  {
    v4->_unint64_t intValue = a3;
    uint64_t v9 = objc_msgSend_prefixedIdentifierStringForIdentifierValue_(GDRelationshipIdentifier, v5, a3, v6, v7);
    stringValue = v8->_stringValue;
    v8->_stringValue = (NSString *)v9;
  }
  return v8;
}

- (GDRelationshipIdentifier)initWithString:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GDRelationshipIdentifier;
  uint64_t v8 = [(GDRelationshipIdentifier *)&v20 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_prefixedIdentifierStringForIdentifierString_(GDRelationshipIdentifier, v5, (uint64_t)v4, v6, v7);
    stringValue = v8->_stringValue;
    v8->_stringValue = (NSString *)v9;

    v14 = objc_msgSend_unprefixedIdentifierStringForIdentifierString_(GDRelationshipIdentifier, v11, (uint64_t)v4, v12, v13);
    v8->_unint64_t intValue = objc_msgSend_longLongValue(v14, v15, v16, v17, v18);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)entityClassOffset
{
  return objc_msgSend_entityClassOffset(_TtC20IntelligencePlatform21GDIdentifierConstants, a2, v2, v3, v4);
}

+ (id)unprefixedIdentifierStringForIdentifierString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1B3EB26F0]();
  if (objc_msgSend_hasPrefix_(v3, v5, @"ri:", v6, v7))
  {
    uint64_t v12 = objc_msgSend_length(@"ri:", v8, v9, v10, v11);
    objc_msgSend_substringFromIndex_(v3, v13, v12, v14, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v3;
  }
  uint64_t v17 = v16;

  return v17;
}

+ (id)prefixedIdentifierStringForIdentifierValue:(unint64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1B3EB26F0](a1, a2);
  id v5 = [NSString alloc];
  uint64_t v9 = objc_msgSend_initWithFormat_(v5, v6, @"%@%llu", v7, v8, @"ri:", a3);

  return v9;
}

+ (id)prefixedIdentifierStringForIdentifierString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1B3EB26F0]();
  if (objc_msgSend_hasPrefix_(v3, v5, @"ri:", v6, v7))
  {
    id v11 = v3;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(@"ri:", v8, (uint64_t)v3, v9, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = v11;

  return v12;
}

@end