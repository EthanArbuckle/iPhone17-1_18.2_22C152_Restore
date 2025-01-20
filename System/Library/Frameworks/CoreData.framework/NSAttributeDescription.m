@interface NSAttributeDescription
+ (BOOL)supportsSecureCoding;
+ (NSString)_classNameForType:(uint64_t)a1;
+ (id)stringForAttributeType:(unint64_t)a3;
+ (void)initialize;
- (BOOL)_attributeTypeIsSchemaEqual:(unint64_t)a3;
- (BOOL)_comparePredicatesAndWarnings:(id)a3;
- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5;
- (BOOL)_isAttribute;
- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4;
- (BOOL)_isEqualWithoutIndex:(id)a3;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndexed;
- (BOOL)usesMergeableStorage;
- (Class)_attributeValueClass;
- (NSAttributeDescription)initWithCoder:(id)a3;
- (NSAttributeType)attributeType;
- (NSData)versionHash;
- (NSString)attributeValueClassName;
- (NSString)valueTransformerName;
- (id)_initWithName:(id)a3 type:(unint64_t)a4;
- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5;
- (id)_initWithType:(unint64_t)a3;
- (id)_rawValidationPredicates;
- (id)_rawValidationWarnings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValue;
- (id)description;
- (id)validationPredicates;
- (id)validationWarnings;
- (int)_encodedAttributeFlagsForFlags:(int)a3;
- (uint64_t)_attributeValueClasses;
- (uint64_t)_canConvertPredicate:(void *)a3 andWarning:;
- (uint64_t)_comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:(uint64_t)result;
- (uint64_t)_sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests;
- (unint64_t)_propertyType;
- (void)_createCachesAndOptimizeState;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsCloudEncryption:(BOOL)allowsCloudEncryption;
- (void)setAllowsExternalBinaryDataStorage:(BOOL)allowsExternalBinaryDataStorage;
- (void)setAttributeType:(NSAttributeType)attributeType;
- (void)setAttributeValueClassName:(NSString *)attributeValueClassName;
- (void)setDefaultValue:(id)defaultValue;
- (void)setIsFileBackedFuture:(BOOL)a3;
- (void)setPreserveValueOnDeletionInPersistentHistory:(BOOL)a3;
- (void)setPreservesValueInHistoryOnDeletion:(BOOL)preservesValueInHistoryOnDeletion;
- (void)setValueTransformerName:(NSString *)valueTransformerName;
@end

@implementation NSAttributeDescription

- (BOOL)_isAttribute
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSAttributeType)attributeType
{
  return (unint64_t)self->_type;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)usesMergeableStorage
{
  if ([(NSAttributeDescription *)self attributeType] != NSTransformableAttributeType) {
    return 0;
  }
  if (![(NSAttributeDescription *)self valueTransformerName]) {
    return 0;
  }
  if (![(NSAttributeDescription *)self attributeValueClassName]) {
    return 0;
  }
  Class v3 = NSClassFromString([(NSAttributeDescription *)self attributeValueClassName]);
  if (!v3) {
    return 0;
  }
  Class v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(objc_class *)v4 supportsSecureCoding]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }

  return [(objc_class *)v4 supportsMergeableTransformable];
}

- (unint64_t)_propertyType
{
  return 2;
}

- (void)_createCachesAndOptimizeState
{
  v42.receiver = self;
  v42.super_class = (Class)NSAttributeDescription;
  [(NSPropertyDescription *)&v42 _createCachesAndOptimizeState];
  id v3 = [(NSDictionary *)[[(NSEntityDescription *)[(NSPropertyDescription *)self entity] superentity] propertiesByName] objectForKey:[(NSPropertyDescription *)self name]];
  if (v3)
  {
    int v4 = [v3 allowsCloudEncryption];
    if (v4 != [(NSAttributeDescription *)self allowsCloudEncryption]) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"%@:%@ - Encryption must also be applied to all inherited attributes from the parent entity (%@)", -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name"), -[NSPropertyDescription name](self, "name"), -[NSEntityDescription name](-[NSEntityDescription superentity](-[NSPropertyDescription entity](self, "entity"), "superentity"), "name")), 0 reason userInfo]);
    }
  }
  if (self->_type == 1800)
  {
    valueTransformerName = self->_valueTransformerName;
    if ([(NSString *)valueTransformerName length]
      && ![MEMORY[0x1E4F29248] valueTransformerForName:valueTransformerName])
    {
      if ([(NSString *)valueTransformerName isEqualToString:@"NSSecureUnarchiveFromDataTransformerName"])
      {
        self->_valueTransformerName = (NSString *)*MEMORY[0x1E4F288C0];
      }
      else if (!PFUseToolchainBehaviors())
      {
        v6 = self->_valueTransformerName;
        [(NSPropertyDescription *)self name];
        [(NSEntityDescription *)[(NSPropertyDescription *)self entity] name];
        _NSCoreDataLog(5, @"no NSValueTransformer with class name '%@' was found for attribute '%@' on entity '%@'", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      }
    }
    if (!PFUseToolchainBehaviors())
    {
      v33 = self->_valueTransformerName;
      if (!v33
        || [(NSString *)self->_valueTransformerName isEqualToString:*MEMORY[0x1E4F28A40]]
        || [(NSString *)v33 isEqualToString:*MEMORY[0x1E4F284F0]])
      {
        v34 = (void *)[MEMORY[0x1E4F28F80] processInfo];
        if ((objc_msgSend(@"xctest", "isEqual:", objc_msgSend(v34, "processName")) & 1) != 0
          || (objc_msgSend(@"cplctl", "isEqual:", objc_msgSend(v34, "processName")) & 1) != 0)
        {
          return;
        }
        if (_createCachesAndOptimizeState_token != -1) {
          dispatch_once(&_createCachesAndOptimizeState_token, &__block_literal_global_294);
        }
        v35 = [(NSPropertyDescription *)self name];
        [(NSEntityDescription *)[(NSPropertyDescription *)self entity] name];
        _NSCoreDataLog(5, @"Property '%@' on Entity '%@' is using nil or an insecure NSValueTransformer.  Please switch to using \"%@\" or a subclass of NSSecureUnarchiveFromDataTransformer instead.", v36, v37, v38, v39, v40, v41, (uint64_t)v35);
      }
    }
  }
  id v13 = [(NSDictionary *)[(NSPropertyDescription *)self userInfo] objectForKey:@"NSTriggerKey"];
  if ([v13 isNSString] && objc_msgSend(v13, "length")) {
    *(_WORD *)&self->super._propertyDescriptionFlags |= 0x2000u;
  }
  id v14 = [(NSAttributeDescription *)self validationWarnings];
  uint64_t v15 = [v14 count];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [(NSAttributeDescription *)self validationPredicates];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v20 = 0;
    while (1)
    {
      v21 = (void *)[v17 objectAtIndex:v20];
      v22 = (void *)[v14 objectAtIndex:v20];
      uint64_t v23 = -[NSAttributeDescription _canConvertPredicate:andWarning:]((uint64_t)self, v21, v22);
      if (v23)
      {
        uint64_t v24 = v23;
        if (v23 <= 0) {
          __int16 v25 = 1024;
        }
        else {
          __int16 v25 = 512;
        }
        *(_WORD *)&self->super._propertyDescriptionFlags |= v25;
        v26 = objc_msgSend((id)objc_msgSend(v21, "rightExpression"), "constantValue");
        v27 = [(NSPropertyDescription *)self _extraIVars];
        unsigned int type = self->_type;
        if (type > 0x12B)
        {
          if (type == 700 || type == 300)
          {
LABEL_27:
            if (v24 <= 0) {
              uint64_t v29 = 8;
            }
            else {
              uint64_t v29 = 16;
            }
            *(id *)((char *)&v27->var0 + v29) = (id)[v26 longLongValue];
            goto LABEL_35;
          }
        }
        else if (type == 100 || type == 200)
        {
          goto LABEL_27;
        }
        if (v24 <= 0) {
          uint64_t v30 = 8;
        }
        else {
          uint64_t v30 = 16;
        }
        [v26 doubleValue];
        *(id *)((char *)&v27->var0 + v30) = v31;
      }
      else
      {
        [v18 addObject:v21];
        [v19 addObject:v22];
      }
LABEL_35:
      if (v16 == ++v20)
      {
        uint64_t v32 = [v14 count];
        if (v32 == [v19 count])
        {
        }
        else
        {
          [(NSPropertyDescription *)self _replaceValidationPredicates:v18 andWarnings:v19];
        }
        return;
      }
    }
  }
}

- (NSString)valueTransformerName
{
  return self->_valueTransformerName;
}

- (NSString)attributeValueClassName
{
  return self->_attributeValueClassName;
}

- (uint64_t)_canConvertPredicate:(void *)a3 andWarning:
{
  if (result)
  {
    uint64_t v4 = result;
    if (![a3 isNSNumber]) {
      return 0;
    }
    result = 0;
    unsigned int v5 = *(unsigned __int16 *)(v4 + 80);
    if (v5 > 0x1F3)
    {
      if (*(unsigned __int16 *)(v4 + 80) > 0x2BBu)
      {
        if (v5 == 700)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return 0;
          }
          uint64_t v11 = (void *)[a2 leftExpression];
          if ([v11 expressionType] != 3) {
            return 0;
          }
          uint64_t v8 = [v11 keyPath];
          uint64_t v7 = @"length";
        }
        else
        {
          if (v5 != 900) {
            return result;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return 0;
          }
          uint64_t v10 = (void *)[a2 leftExpression];
          if ([v10 expressionType] != 3) {
            return 0;
          }
          uint64_t v8 = [v10 keyPath];
          uint64_t v7 = @"timeIntervalSinceReferenceDate";
        }
LABEL_16:
        if ([(__CFString *)v7 isEqual:v8]
          && !objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "expressionType"))
        {
          uint64_t v9 = [a2 predicateOperatorType];
          if (v9 == 3) {
            return -1;
          }
          else {
            return v9 == 1;
          }
        }
        return 0;
      }
      if (v5 == 500 || v5 == 600) {
        goto LABEL_14;
      }
    }
    else
    {
      if (*(unsigned __int16 *)(v4 + 80) <= 0x12Bu)
      {
        if (v5 != 100 && v5 != 200) {
          return result;
        }
        goto LABEL_14;
      }
      if (v5 == 300 || v5 == 400)
      {
LABEL_14:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        uint64_t v6 = [a2 leftExpression];
        uint64_t v7 = (__CFString *)[MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
        uint64_t v8 = v6;
        goto LABEL_16;
      }
    }
  }
  return result;
}

- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5
{
  if (a3 == a4 || a5 == 1 && [(NSPropertyDescription *)self _isTriggerBacked]) {
    return 1;
  }
  NSAttributeType v9 = [(NSAttributeDescription *)self attributeType];
  if (v9 == NSDateAttributeType)
  {
    if ([a3 isNSDate] && objc_msgSend(a4, "isNSDate"))
    {
      [a3 timeIntervalSinceReferenceDate];
      double v11 = v13;
      [a4 timeIntervalSinceReferenceDate];
LABEL_14:
      if (v11 != v12) {
        return vabdd_f64(v11, v12) <= 2.22044605e-16;
      }
      return 1;
    }
  }
  else if (v9 == NSFloatAttributeType)
  {
    if ([a3 isNSNumber] && objc_msgSend(a4, "isNSNumber"))
    {
      [a3 floatValue];
      float v16 = v15;
      [a4 floatValue];
      if (v16 != v17) {
        return vabds_f32(v16, v17) <= 0.00000011921;
      }
      return 1;
    }
  }
  else if (v9 == NSDoubleAttributeType {
         && [a3 isNSNumber]
  }
         && [a4 isNSNumber])
  {
    [a3 doubleValue];
    double v11 = v10;
    [a4 doubleValue];
    goto LABEL_14;
  }

  return [a3 isEqual:a4];
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v9.receiver = self;
  v9.super_class = (Class)NSAttributeDescription;
  [(NSPropertyDescription *)&v9 _versionHash:data inStyle:a4];
  CC_SHA256_Update(&c, data, 0x20u);
  int v8 = [(NSAttributeDescription *)self attributeType];
  CC_SHA256_Update(&c, &v8, 4u);
  if ([(NSAttributeDescription *)self allowsExternalBinaryDataStorage])
  {
    char v7 = 1;
    CC_SHA256_Update(&c, &v7, 1u);
  }
  if ([(NSAttributeDescription *)self preservesValueInHistoryOnDeletion])
  {
    char v7 = 1;
    CC_SHA256_Update(&c, &v7, 1u);
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (NSAttributeDescription)initWithCoder:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)NSAttributeDescription;
  uint64_t v4 = -[NSPropertyDescription initWithCoder:](&v37, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  unsigned int v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  char v7 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"NSValueTransformerName");
  v4->_valueTransformerName = v7;
  if (v7)
  {
    if (![(NSString *)v7 isNSString])
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F281F8];
      v28 = &unk_1ED7E1858;
LABEL_32:
      objc_msgSend(a3, "failWithError:", objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 4866, v28));

      return 0;
    }
    if ([(NSString *)v4->_valueTransformerName isEqualToString:@"NSSecureUnarchiveFromDataTransformerName"])
    {

      v4->_valueTransformerName = (NSString *)[(id)*MEMORY[0x1E4F288C0] copy];
    }
  }
  v4->_unsigned int type = [a3 decodeIntForKey:@"NSAttributeType"];
  int v8 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSAttributeValueClassName"];
  v4->_attributeValueClassName = v8;
  if (v8 && ([(NSString *)v8 isNSString] & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F281F8];
    v28 = &unk_1ED7E1880;
    goto LABEL_32;
  }
  objc_super v9 = (void *)+[_PFRoutines attributeClassesForSecureCoding]();
  if (v4->_type == 1800)
  {
    double v10 = (void *)-[NSAttributeDescription _attributeValueClasses]((id *)&v4->super.super.isa);
    if (!v10) {
      double v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    }
    Class v11 = NSClassFromString(v4->_valueTransformerName);
    if (v11)
    {
      uint64_t v12 = v11;
      if (!-[objc_class instancesRespondToSelector:](v11, "instancesRespondToSelector:", sel_transformedValue_)|| ([v12 instancesRespondToSelector:sel_reverseTransformedValue_] & 1) == 0)
      {
        uint64_t v13 = [(NSPropertyDescription *)v4 name];
        [(NSEntityDescription *)[(NSPropertyDescription *)v4 entity] name];

        v4->_valueTransformerName = (NSString *)[(id)*MEMORY[0x1E4F288C0] copy];
        uint64_t v12 = objc_opt_class();
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v20 = [v12 allowedTopLevelClasses];
        if (v20) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = MEMORY[0x1E4F1CBF0];
        }
        [v10 addObjectsFromArray:v21];
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v22 = [v12 transformedValueClass];
        if (v22) {
          [v10 addObject:v22];
        }
      }
    }
    objc_super v9 = (void *)[v9 setByAddingObjectsFromArray:v10];
  }
  v4->_defaultValue = (id)[a3 decodeObjectOfClasses:v9 forKey:@"NSDefaultValue"];
  -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests]((uint64_t)v4);
  unsigned int v23 = [a3 decodeInt32ForKey:@"NSFlagsKey"];
  if (!v23) {
    goto LABEL_47;
  }
  int v24 = v23 & 2;
  *(_WORD *)&v4->super._propertyDescriptionFlags = *(_WORD *)&v4->super._propertyDescriptionFlags & 0xA1FF | ((v23 & 3) << 9) & 0xA7FF | (((v23 >> 2) & 1) << 11) & 0xAFFF | (((v23 >> 4) & 1) << 12) & 0xBFFF | (((v23 >> 5) & 1) << 14);
  if ((v23 & 1) == 0)
  {
LABEL_36:
    if (!v24) {
      goto LABEL_47;
    }
LABEL_37:
    unsigned int type = v4->_type;
    if (type > 0x12B)
    {
      if (type != 700 && type != 300) {
        goto LABEL_46;
      }
    }
    else if (type != 100 && type != 200)
    {
LABEL_46:
      uint64_t v34 = [(NSPropertyDescription *)v4 _extraIVars];
      [a3 decodeDoubleForKey:@"NSMinValueName"];
      *(void *)(v34 + 8) = v35;
      goto LABEL_47;
    }
    uint64_t v31 = [a3 decodeInt64ForKey:@"NSMinValueName"];
    *(void *)([(NSPropertyDescription *)v4 _extraIVars] + 8) = v31;
    goto LABEL_47;
  }
  unsigned int v25 = v4->_type;
  if (v25 <= 0x12B)
  {
    if (v25 != 100 && v25 != 200) {
      goto LABEL_44;
    }
    goto LABEL_35;
  }
  if (v25 == 700 || v25 == 300)
  {
LABEL_35:
    uint64_t v29 = [a3 decodeInt64ForKey:@"NSMaxValueName"];
    *(void *)([(NSPropertyDescription *)v4 _extraIVars] + 16) = v29;
    goto LABEL_36;
  }
LABEL_44:
  uint64_t v32 = [(NSPropertyDescription *)v4 _extraIVars];
  [a3 decodeDoubleForKey:@"NSMaxValueName"];
  *(void *)(v32 + 16) = v33;
  if (v24) {
    goto LABEL_37;
  }
LABEL_47:
  if (![(NSPropertyDescription *)v4 _isFileBackedFuture]
    && objc_msgSend(-[NSDictionary valueForKey:](-[NSPropertyDescription userInfo](v4, "userInfo"), "valueForKey:", @"NSIsFileBackedFuture"), "BOOLValue"))
  {
    *(_WORD *)&v4->super._propertyDescriptionFlags |= 0x4800u;
  }
  if ([a3 decodeBoolForKey:@"NSIsIndexed"]) {
    [(NSPropertyDescription *)v4 setIndexed:1];
  }
  return v4;
}

- (uint64_t)_sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 112);
    if (result)
    {
      result = [(id)result isNSNumber];
      if (result)
      {
        result = [*(id *)(v1 + 112) objCType];
        int v2 = *(unsigned __int16 *)(v1 + 80);
        if (v2 == 600)
        {
          result = strcmp("d", (const char *)result);
          if (result) {
            return result;
          }
          [*(id *)(v1 + 112) doubleValue];
          double v7 = v6;

          *(float *)&double v8 = v7;
          unsigned int v5 = (void *)[NSNumber numberWithFloat:v8];
          goto LABEL_10;
        }
        if (v2 == 500)
        {
          result = strcmp("f", (const char *)result);
          if (!result)
          {
            [*(id *)(v1 + 112) floatValue];
            float v4 = v3;

            unsigned int v5 = (void *)[NSNumber numberWithDouble:v4];
LABEL_10:
            result = v5;
            *(void *)(v1 + 112) = result;
          }
        }
      }
    }
  }
  return result;
}

- (id)validationPredicates
{
  BOOL v3 = [(NSPropertyDescription *)self _hasMinValueInExtraIvars];
  BOOL v4 = [(NSPropertyDescription *)self _hasMaxValueInExtraIvars];
  BOOL v5 = v4;
  if (!v3 && !v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)NSAttributeDescription;
    return [(NSPropertyDescription *)&v20 validationPredicates];
  }
  v21.receiver = self;
  v21.super_class = (Class)NSAttributeDescription;
  double v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[NSPropertyDescription validationPredicates](&v21, sel_validationPredicates));
  double v7 = [(NSPropertyDescription *)self _extraIVars];
  NSAttributeType v8 = [(NSAttributeDescription *)self attributeType];
  if ((uint64_t)v8 <= 399)
  {
    if (v8 == NSInteger16AttributeType || v8 == NSInteger32AttributeType || v8 == NSInteger64AttributeType)
    {
      if (v3)
      {
        uint64_t v9 = [NSNumber numberWithLongLong:v7->var1];
        [v6 addObject:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF >= %@", v9)];
      }
      if (!v5) {
        goto LABEL_33;
      }
      uint64_t v10 = [NSNumber numberWithLongLong:v7->var2];
      goto LABEL_23;
    }
LABEL_28:
    if (v3)
    {
      uint64_t v17 = [NSNumber numberWithDouble:*(double *)&v7->var1];
      [v6 addObject:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"self >= %@", v17)];
    }
    if (!v5) {
      goto LABEL_33;
    }
    uint64_t v18 = [NSNumber numberWithDouble:*(double *)&v7->var2];
    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self =< %@", v18];
    goto LABEL_32;
  }
  if (v8 != NSDecimalAttributeType)
  {
    if (v8 == NSStringAttributeType)
    {
      if (v3)
      {
        uint64_t v15 = [NSNumber numberWithLongLong:v7->var1];
        [v6 addObject:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"length >= %@", v15)];
      }
      if (!v5) {
        goto LABEL_33;
      }
      uint64_t v16 = [NSNumber numberWithLongLong:v7->var2];
      uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"length =< %@", v16];
      goto LABEL_32;
    }
    if (v8 == NSDateAttributeType)
    {
      if (v3)
      {
        uint64_t v11 = [NSNumber numberWithDouble:*(double *)&v7->var1];
        [v6 addObject:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"timeIntervalSinceReferenceDate >= %@", v11)];
      }
      if (!v5) {
        goto LABEL_33;
      }
      uint64_t v12 = [NSNumber numberWithDouble:*(double *)&v7->var2];
      uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"timeIntervalSinceReferenceDate =< %@", v12];
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F28C28] numberWithDouble:*(double *)&v7->var1];
    [v6 addObject:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF >= %@", v14)];
  }
  if (!v5) {
    goto LABEL_33;
  }
  uint64_t v10 = [MEMORY[0x1E4F28C28] numberWithDouble:*(double *)&v7->var2];
LABEL_23:
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF =< %@", v10];
LABEL_32:
  [v6 addObject:v13];
LABEL_33:
  if ([(NSAttributeDescription *)self attributeType] == NSURIAttributeType) {
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", &__block_literal_global_5));
  }
  return v6;
}

- (id)_rawValidationWarnings
{
  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  return [(NSPropertyDescription *)&v3 validationWarnings];
}

- (id)_rawValidationPredicates
{
  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  return [(NSPropertyDescription *)&v3 validationPredicates];
}

- (id)validationWarnings
{
  BOOL v3 = [(NSPropertyDescription *)self _hasMinValueInExtraIvars];
  BOOL v4 = [(NSPropertyDescription *)self _hasMaxValueInExtraIvars];
  BOOL v5 = v4;
  if (!v3 && !v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSAttributeDescription;
    return [(NSPropertyDescription *)&v11 validationWarnings];
  }
  v12.receiver = self;
  v12.super_class = (Class)NSAttributeDescription;
  double v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[NSPropertyDescription validationWarnings](&v12, sel_validationWarnings));
  NSAttributeType v7 = [(NSAttributeDescription *)self attributeType];
  if ((uint64_t)v7 <= 399)
  {
    if (v7 != NSInteger16AttributeType && v7 != NSInteger32AttributeType && v7 != NSInteger64AttributeType)
    {
LABEL_12:
      if (v3) {
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", 1640));
      }
      if (v5)
      {
        NSAttributeType v8 = NSNumber;
        uint64_t v9 = 1630;
LABEL_22:
        objc_msgSend(v6, "addObject:", objc_msgSend(v8, "numberWithInteger:", v9));
        return v6;
      }
      return v6;
    }
  }
  else if ((uint64_t)v7 > 599)
  {
    if (v7 == NSStringAttributeType)
    {
      if (v3) {
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", 1670));
      }
      if (v5)
      {
        NSAttributeType v8 = NSNumber;
        uint64_t v9 = 1660;
        goto LABEL_22;
      }
      return v6;
    }
    if (v7 != NSFloatAttributeType) {
      goto LABEL_12;
    }
  }
  else if (v7 != NSDecimalAttributeType && v7 != NSDoubleAttributeType)
  {
    goto LABEL_12;
  }
  if (v3) {
    objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", 1620));
  }
  if (v5)
  {
    NSAttributeType v8 = NSNumber;
    uint64_t v9 = 1610;
    goto LABEL_22;
  }
  return v6;
}

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)NSAttributeDescription;
  LODWORD(v10) = -[NSPropertyDescription _nonPredicateValidateValue:forKey:inObject:error:](&v31, sel__nonPredicateValidateValue_forKey_inObject_error_, a3, a4);
  if (!v10) {
    return v10;
  }
  if (!*a3)
  {
    LOBYTE(v10) = 1;
    return v10;
  }
  BOOL v11 = [(NSPropertyDescription *)self _hasMaxValueInExtraIvars];
  BOOL v12 = [(NSPropertyDescription *)self _hasMinValueInExtraIvars];
  BOOL v13 = v12;
  if (v11 || v12 || self->_type == 700)
  {
    uint64_t v14 = [(NSPropertyDescription *)self _extraIVars];
    uint64_t v15 = 0;
    unsigned int type = self->_type;
    if (type > 0x1F3)
    {
      if (self->_type <= 0x2BBu)
      {
        if (type != 500 && type != 600) {
          goto LABEL_42;
        }
        goto LABEL_19;
      }
      if (type == 700)
      {
        if (v11)
        {
          if ([*a3 length] <= v14->var2) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = 1660;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        if (v13 && [*a3 length] < v14->var1) {
          uint64_t v15 = 1670;
        }
        unint64_t v26 = [*a3 length];
        if (CFStringGetCharactersPtr((CFStringRef)*a3))
        {
          if (CFStringEncodingUnicodeToBytes()) {
            uint64_t v15 = 1671;
          }
        }
        else
        {
          MEMORY[0x1F4188790](0);
          v28 = (UniChar *)((char *)&v30 - v27);
          if (v26 >= 0x80) {
            v28 = (UniChar *)malloc_type_malloc(4 * v26, 0x49586F69uLL);
          }
          v33.location = 0;
          v33.length = v26;
          CFStringGetCharacters((CFStringRef)*a3, v33, v28);
          if (CFStringEncodingUnicodeToBytes()) {
            uint64_t v15 = 1671;
          }
          if (v26 >= 0x80) {
            free(v28);
          }
        }
        goto LABEL_42;
      }
      if (type == 900)
      {
        if (v11)
        {
          [*a3 timeIntervalSinceReferenceDate];
          uint64_t v15 = v18 <= *(double *)&v14->var2 ? 0 : 1630;
        }
        else
        {
          uint64_t v15 = 0;
        }
        if (v13)
        {
          [*a3 timeIntervalSinceReferenceDate];
          BOOL v20 = v25 < *(double *)&v14->var1;
          uint64_t v21 = 1640;
LABEL_40:
          if (v20) {
            uint64_t v15 = v21;
          }
        }
      }
    }
    else
    {
      if (self->_type <= 0x12Bu)
      {
        if (type != 100 && type != 200) {
          goto LABEL_42;
        }
        goto LABEL_23;
      }
      if (type == 300)
      {
LABEL_23:
        if (v11)
        {
          if ([*a3 longLongValue] <= v14->var2) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = 1610;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        if (!v13) {
          goto LABEL_42;
        }
        BOOL v20 = [*a3 longLongValue] < v14->var1;
        goto LABEL_39;
      }
      if (type == 400)
      {
LABEL_19:
        if (v11)
        {
          [*a3 doubleValue];
          if (v17 <= *(double *)&v14->var2) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = 1610;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        if (!v13) {
          goto LABEL_42;
        }
        [*a3 doubleValue];
        BOOL v20 = v19 < *(double *)&v14->var1;
LABEL_39:
        uint64_t v21 = 1620;
        goto LABEL_40;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_42:
  if ([(NSAttributeDescription *)self attributeType] == NSURIAttributeType)
  {
    uint64_t v22 = [*a3 absoluteString];
    uint64_t v23 = 1560;
    if (!v15) {
      uint64_t v23 = 1690;
    }
    if (!v22) {
      uint64_t v15 = v23;
    }
  }
  LOBYTE(v10) = v15 == 0;
  if (a6 && v15)
  {
    if (a5) {
      uint64_t v10 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)a5, v15, 0, (uint64_t)[(NSPropertyDescription *)self name], (uint64_t)*a3, 0);
    }
    else {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:v15 userInfo:0];
    }
    int v24 = (void *)v10;
    LOBYTE(v10) = 0;
    *a6 = v24;
  }
  return v10;
}

- (uint64_t)_attributeValueClasses
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v2 = (NSString *)a1[13];
  if (!v2) {
    return 0;
  }
  Class v3 = NSClassFromString(v2);
  if (v3)
  {
    Class v4 = v3;
    BOOL v5 = (void *)MEMORY[0x1E4F1CA48];
    return [v5 arrayWithObject:v4];
  }
  NSAttributeType v7 = (void *)[MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"$_"];
  objc_msgSend(v7, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E4F28B88], "alphanumericCharacterSet"));
  [v7 invert];
  if (objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1[13], "characterAtIndex:", 0)))
  {
    if (!byte_1EB270ABE) {
      return 0;
    }
    uint64_t v8 = [NSString stringWithUTF8String:"Declared Objective-C type \"%@\" for attribute named %@ is not valid"];
    uint64_t v9 = (uint64_t)a1[13];
    [a1 name];
    _NSCoreDataLog(17, v8, v10, v11, v12, v13, v14, v15, v9);
    uint64_t v16 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    double v17 = (NSString *)a1[13];
    *(_DWORD *)buf = 138412546;
    v53 = v17;
    __int16 v54 = 2112;
    uint64_t v55 = [a1 name];
    double v18 = "CoreData: Declared Objective-C type \"%@\" for attribute named %@ is not valid";
LABEL_11:
    double v19 = v16;
    uint32_t v20 = 22;
LABEL_33:
    _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, v18, buf, v20);
    return 0;
  }
  uint64_t v21 = (void *)[a1[13] componentsSeparatedByCharactersInSet:v7];
  if ([v21 count] == 1
    && objc_msgSend(a1[13], "isEqualToString:", objc_msgSend(v21, "firstObject")))
  {
    if (!byte_1EB270ABE) {
      return 0;
    }
    uint64_t v22 = [NSString stringWithUTF8String:"Could not materialize Objective-C class for declared attribute value class name \"%@\" of attribute named %@"];
    uint64_t v23 = (uint64_t)a1[13];
    [a1 name];
    _NSCoreDataLog(17, v22, v24, v25, v26, v27, v28, v29, v23);
    uint64_t v16 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    uint64_t v30 = (NSString *)a1[13];
    *(_DWORD *)buf = 138412546;
    v53 = v30;
    __int16 v54 = 2112;
    uint64_t v55 = [a1 name];
    double v18 = "CoreData: Could not materialize Objective-C class for declared attribute value class name \"%@\" of attribute named %@";
    goto LABEL_11;
  }
  objc_super v31 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v32 = [v21 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (!v32) {
    return (uint64_t)v31;
  }
  uint64_t v33 = v32;
  uint64_t v34 = *(void *)v49;
LABEL_19:
  uint64_t v35 = 0;
  while (1)
  {
    if (*(void *)v49 != v34) {
      objc_enumerationMutation(v21);
    }
    uint64_t v36 = *(NSString **)(*((void *)&v48 + 1) + 8 * v35);
    if (![(NSString *)v36 length]) {
      goto LABEL_25;
    }
    Class v37 = NSClassFromString(v36);
    if (!v37) {
      break;
    }
    [v31 addObject:v37];
LABEL_25:
    if (v33 == ++v35)
    {
      uint64_t v33 = [v21 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v33) {
        goto LABEL_19;
      }
      return (uint64_t)v31;
    }
  }
  if (byte_1EB270ABE)
  {
    uint64_t v38 = [NSString stringWithUTF8String:"Could not materialize Objective-C class named \"%@\" from declared attribute value type \"%@\" of attribute named %@"];
    [a1 name];
    _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)v36);
    uint64_t v45 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      id v46 = a1[13];
      uint64_t v47 = [a1 name];
      *(_DWORD *)buf = 138412802;
      v53 = v36;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v46;
      __int16 v56 = 2112;
      uint64_t v57 = v47;
      double v18 = "CoreData: Could not materialize Objective-C class named \"%@\" from declared attribute value type \"%@\" of "
            "attribute named %@";
      double v19 = v45;
      uint32_t v20 = 32;
      goto LABEL_33;
    }
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return [(NSAttributeDescription *)self _isEqual:a3 skipIndexCheck:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSAttributeDescription;
  Class v4 = [(NSPropertyDescription *)&v7 copyWithZone:a3];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4[40] = self->_type;
    *((void *)v4 + 13) = [(NSString *)self->_attributeValueClassName copy];
    *(void *)(v5 + 112) = self->_defaultValue;
    -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests](v5);
    *(void *)(v5 + 96) = self->_valueTransformerName;
    if ([(NSPropertyDescription *)self _storeBinaryDataExternally]) {
      *(_WORD *)(v5 + 72) |= 0x800u;
    }
    if ([(NSAttributeDescription *)self preservesValueInHistoryOnDeletion]) {
      *(_WORD *)(v5 + 72) |= 0x1000u;
    }
    if ([(NSAttributeDescription *)self isFileBackedFuture]) {
      *(_WORD *)(v5 + 72) |= 0x4000u;
    }
    if ([(NSAttributeDescription *)self allowsCloudEncryption]) {
      *(_WORD *)(v5 + 72) |= 0x8000u;
    }
  }
  return (id)v5;
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5
{
  __int16 v6 = a4;
  objc_super v7 = [(NSPropertyDescription *)self _initWithName:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    *((_WORD *)v7 + 40) = v6;
    v7[13] = [a5 copy];
    v8[14] = 0;
    v8[12] = 0;
  }
  return v8;
}

- (void)setAttributeType:(NSAttributeType)attributeType
{
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (self->_type == attributeType) {
    return;
  }
  if (attributeType)
  {
    if (attributeType == NSObjectIDAttributeType)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      objc_super v7 = NSString;
      id v8 = +[NSAttributeDescription stringForAttributeType:2000];
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = (__CFString *)[v7 stringWithFormat:@"'%@' is only supported for use with '%@'.", v8, NSStringFromClass(v9)];
      uint64_t v11 = v5;
      uint64_t v12 = v6;
      goto LABEL_12;
    }
  }
  else if (![(NSPropertyDescription *)self isTransient])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Can't set attribute type to undefined for non-transient attribute.";
LABEL_12:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v10 userInfo:0]);
  }
  uint64_t v13 = +[NSAttributeDescription _classNameForType:]((uint64_t)NSAttributeDescription, attributeType);
  if (v13 == (NSString *)NSKeyValueCoding_NullValue)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    uint64_t v10 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Can't find class for type %lu", attributeType);
    uint64_t v11 = v14;
    uint64_t v12 = v15;
    goto LABEL_12;
  }
  self->_unsigned int type = attributeType;

  [(NSAttributeDescription *)self setAttributeValueClassName:v13];
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4
{
  objc_super v7 = +[NSAttributeDescription _classNameForType:]((uint64_t)NSAttributeDescription, a4);
  if (v7 == (NSString *)NSKeyValueCoding_NullValue)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Can't find class for type %lu", a4), 0 reason userInfo]);
  }

  return [(NSAttributeDescription *)self _initWithName:a3 type:a4 withClassName:v7];
}

+ (NSString)_classNameForType:(uint64_t)a1
{
  self;
  result = 0;
  if (a2 <= 699)
  {
    if (a2 <= 299)
    {
      if (!a2) {
        return result;
      }
      if (a2 != 100 && a2 != 200) {
        return (NSString *)NSKeyValueCoding_NullValue;
      }
    }
    else if (a2 > 499)
    {
      if (a2 != 500 && a2 != 600) {
        return (NSString *)NSKeyValueCoding_NullValue;
      }
    }
    else if (a2 != 300 && a2 != 400)
    {
      return (NSString *)NSKeyValueCoding_NullValue;
    }
  }
  else if (a2 > 1099)
  {
    if (a2 > 1799)
    {
      if (a2 == 1800) {
        return result;
      }
      if (a2 != 2100) {
        return (NSString *)NSKeyValueCoding_NullValue;
      }
    }
    else if (a2 != 1100 && a2 != 1200)
    {
      return (NSString *)NSKeyValueCoding_NullValue;
    }
  }
  else if (a2 > 899)
  {
    if (a2 != 900 && a2 != 1000) {
      return (NSString *)NSKeyValueCoding_NullValue;
    }
  }
  else if (a2 != 700 && a2 != 800)
  {
    return (NSString *)NSKeyValueCoding_NullValue;
  }
  Class v4 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v4);
}

- (Class)_attributeValueClass
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  attributeValueClass = self->_attributeValueClass;
  if (byte_1EB270ABE)
  {
    if (!attributeValueClass)
    {
      if (!self->_attributeValueClassName {
        || (Class v4 = (void *)MEMORY[0x18C127630](),
      }
      {
        attributeValueClass = (objc_class *)objc_opt_class();
        self->_attributeValueClass = attributeValueClass;
      }
    }
  }
  else if (!attributeValueClass)
  {
    attributeValueClassName = self->_attributeValueClassName;
    if (attributeValueClassName)
    {
      attributeValueClass = NSClassFromString(attributeValueClassName);
      self->_attributeValueClass = attributeValueClass;
      if (!attributeValueClass)
      {
        if (byte_1EB270ABE)
        {
          uint64_t v7 = [NSString stringWithUTF8String:"Could not materialize Objective-C class \"%@\" for attribute named \"%@\", property setter will not validate type"];
          id v8 = self->_attributeValueClassName;
          [(NSPropertyDescription *)self name];
          _NSCoreDataLog(17, v7, v9, v10, v11, v12, v13, v14, (uint64_t)v8);
          uint64_t v15 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = self->_attributeValueClassName;
            *(_DWORD *)buf = 138412546;
            double v18 = v16;
            __int16 v19 = 2112;
            uint32_t v20 = [(NSPropertyDescription *)self name];
            _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Could not materialize Objective-C class \"%@\" for attribute named \"%@\", property setter will not validate type", buf, 0x16u);
          }
        }
        attributeValueClass = (objc_class *)objc_opt_class();
        self->_attributeValueClass = attributeValueClass;
      }
    }
    else
    {
      attributeValueClass = 0;
    }
  }
  if (attributeValueClass == (objc_class *)objc_opt_class()) {
    return 0;
  }
  else {
    return self->_attributeValueClass;
  }
}

- (void)setDefaultValue:(id)defaultValue
{
  [(NSPropertyDescription *)self _throwIfNotEditable];
  id v5 = self->_defaultValue;
  if (v5 != defaultValue)
  {

    self->_defaultValue = defaultValue;
    -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests]((uint64_t)self);
  }
}

- (void)setAttributeValueClassName:(NSString *)attributeValueClassName
{
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (!attributeValueClassName && ![(NSPropertyDescription *)self isTransient])
  {
    int type = self->_type;
    if (type != 1800 && type != 2100) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't set attributeValueClassName to nil for a non-transient attribute." userInfo:0]);
    }
  }
  if (self->_attributeValueClassName != attributeValueClassName)
  {
    self->_attributeValueClass = 0;

    self->_attributeValueClassName = (NSString *)[(NSString *)attributeValueClassName copy];
  }
}

- (void)dealloc
{
  self->_attributeValueClassName = 0;
  self->_valueTransformerName = 0;

  self->_defaultValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  [(NSPropertyDescription *)&v3 dealloc];
}

+ (void)initialize
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    self;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSAttributeDescription;
  objc_msgSendSuper2(&v4, sel_initialize);
}

- (void)setValueTransformerName:(NSString *)valueTransformerName
{
  uint64_t v3 = self->_valueTransformerName;
  if (v3 != valueTransformerName)
  {

    if (valueTransformerName)
    {
      BOOL v6 = [(NSString *)valueTransformerName isEqualToString:@"NSSecureUnarchiveFromDataTransformerName"];
      uint64_t v7 = (NSString *)*MEMORY[0x1E4F288C0];
      if (!v6) {
        uint64_t v7 = valueTransformerName;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    self->_valueTransformerName = v7;
  }
}

- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    v21.receiver = self;
    v21.super_class = (Class)NSAttributeDescription;
    LODWORD(v8) = [(NSPropertyDescription *)&v21 _isEqual:a3 skipIndexCheck:a4];
    if (v8)
    {
      NSAttributeType v9 = [(NSAttributeDescription *)self attributeType];
      if (v9 != [a3 attributeType])
      {
LABEL_19:
        LOBYTE(v8) = 0;
        return v8;
      }
      uint64_t v10 = [(NSAttributeDescription *)self attributeValueClassName];
      uint64_t v8 = [a3 attributeValueClassName];
      if (v10 == (NSString *)v8
        || (uint64_t v11 = v8, LOBYTE(v8) = 0, v10) && v11 && (LODWORD(v8) = -[NSString isEqual:](v10, "isEqual:"), v8))
      {
        id v12 = [(NSAttributeDescription *)self defaultValue];
        uint64_t v8 = [a3 defaultValue];
        if (v12 == (id)v8
          || (uint64_t v13 = v8, LOBYTE(v8) = 0, v12) && v13 && (LODWORD(v8) = objc_msgSend(v12, "isEqual:"), v8))
        {
          uint64_t v14 = [(NSAttributeDescription *)self valueTransformerName];
          uint64_t v8 = [a3 valueTransformerName];
          if (v14 == (NSString *)v8
            || (uint64_t v15 = v8, LOBYTE(v8) = 0, v14)
            && v15
            && (LODWORD(v8) = -[NSString isEqual:](v14, "isEqual:"), v8))
          {
            int v16 = [(NSAttributeDescription *)self preservesValueInHistoryOnDeletion];
            if (v16 != [a3 preservesValueInHistoryOnDeletion]) {
              goto LABEL_19;
            }
            int v17 = [(NSAttributeDescription *)self isFileBackedFuture];
            if (v17 != [a3 isFileBackedFuture]) {
              goto LABEL_19;
            }
            int v18 = [(NSAttributeDescription *)self allowsCloudEncryption];
            if (v18 != [a3 allowsCloudEncryption]) {
              goto LABEL_19;
            }
            BOOL v19 = [(NSAttributeDescription *)self usesMergeableStorage];
            LOBYTE(v8) = v19 ^ [a3 usesMergeableStorage] ^ 1;
          }
        }
      }
    }
  }
  return v8;
}

- (void)setIsFileBackedFuture:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (v3) {
    __int16 v5 = 18432;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->super._propertyDescriptionFlags = v5 | *(_WORD *)&self->super._propertyDescriptionFlags & 0xB7FF;
}

- (int)_encodedAttributeFlagsForFlags:(int)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  __int16 v5 = (void *)MEMORY[0x18C127630](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)NSAttributeDescription;
  [(NSPropertyDescription *)&v8 encodeWithCoder:a3];
  objc_msgSend(a3, "encodeInt:forKey:", -[NSAttributeDescription attributeType](self, "attributeType"), @"NSAttributeType");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName"), @"NSAttributeValueClassName");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSAttributeDescription defaultValue](self, "defaultValue"), @"NSDefaultValue");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSAttributeDescription valueTransformerName](self, "valueTransformerName"), @"NSValueTransformerName");
  if ([(NSAttributeDescription *)self isIndexed]) {
    [a3 encodeBool:1 forKey:@"NSIsIndexed"];
  }
  if ([(NSPropertyDescription *)self _storeBinaryDataExternally]) {
    unsigned int v6 = 4;
  }
  else {
    unsigned int v6 = 0;
  }
  if ([(NSAttributeDescription *)self preservesValueInHistoryOnDeletion]) {
    v6 |= 0x10u;
  }
  if ([(NSAttributeDescription *)self isFileBackedFuture]) {
    uint64_t v7 = v6 | 0x20;
  }
  else {
    uint64_t v7 = v6;
  }
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSAttributeDescription _encodedAttributeFlagsForFlags:](self, "_encodedAttributeFlagsForFlags:", v7), @"NSFlagsKey");
}

- (BOOL)_isSchemaEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSAttributeDescription;
  unsigned int v5 = -[NSPropertyDescription _isSchemaEqual:](&v9, sel__isSchemaEqual_);
  if (v5)
  {
    unsigned int v5 = -[NSAttributeDescription _attributeTypeIsSchemaEqual:](self, "_attributeTypeIsSchemaEqual:", [a3 attributeType]);
    if (v5)
    {
      int v6 = [(NSAttributeDescription *)self isFileBackedFuture];
      if (v6 == [a3 isFileBackedFuture])
      {
        BOOL v7 = [(NSAttributeDescription *)self storesBinaryDataExternally];
        LOBYTE(v5) = v7 ^ [a3 storesBinaryDataExternally] ^ 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  BOOL v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)NSAttributeDescription;
  id v4 = [(NSPropertyDescription *)&v13 description];
  NSAttributeType v5 = [(NSAttributeDescription *)self attributeType];
  int v6 = [(NSAttributeDescription *)self attributeValueClassName];
  id v7 = [(NSAttributeDescription *)self defaultValue];
  objc_super v8 = @"NO";
  if ([(NSAttributeDescription *)self preservesValueInHistoryOnDeletion]) {
    objc_super v9 = @"YES";
  }
  else {
    objc_super v9 = @"NO";
  }
  if ([(NSAttributeDescription *)self allowsCloudEncryption]) {
    objc_super v8 = @"YES";
  }
  BOOL v10 = [(NSAttributeDescription *)self usesMergeableStorage];
  uint64_t v11 = &stru_1ED787880;
  if (v10) {
    uint64_t v11 = @", usesMergeableStorage YES";
  }
  return (id)[v3 stringWithFormat:@"%@, attributeType %lu, attributeValueClassName %@, defaultValue %@, preservesValueInHistoryOnDeletion %@, allowsCloudEncryption %@%@", v4, v5, v6, v7, v9, v8, v11];
}

- (BOOL)isIndexed
{
  v4.receiver = self;
  v4.super_class = (Class)NSAttributeDescription;
  return [(NSPropertyDescription *)&v4 isIndexed]
      || [(NSDictionary *)[(NSPropertyDescription *)self userInfo] objectForKey:@"_NSCreateIndex"] != 0;
}

- (NSData)versionHash
{
  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDescription;
  return [(NSPropertyDescription *)&v3 versionHash];
}

BOOL __46__NSAttributeDescription_validationPredicates__block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 absoluteString] != 0;
}

- (void)setAllowsExternalBinaryDataStorage:(BOOL)allowsExternalBinaryDataStorage
{
  BOOL v3 = allowsExternalBinaryDataStorage;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (v3) {
    __int16 v5 = 2048;
  }
  else {
    __int16 v5 = 0;
  }
  __int16 v6 = *(_WORD *)&self->super._propertyDescriptionFlags & 0xF7FF | v5;
  __int16 v7 = *(_WORD *)&self->super._propertyDescriptionFlags & 0xB7FF | v5 & 0xBFFF;
  if (!v3) {
    __int16 v6 = v7;
  }
  *(_WORD *)&self->super._propertyDescriptionFlags = v6;
}

- (void)setAllowsCloudEncryption:(BOOL)allowsCloudEncryption
{
  BOOL v3 = allowsCloudEncryption;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (v3) {
    __int16 v5 = 0x8000;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->super._propertyDescriptionFlags = v5 & 0x8000 | *(_WORD *)&self->super._propertyDescriptionFlags & 0x7FFF;
}

- (void)setPreservesValueInHistoryOnDeletion:(BOOL)preservesValueInHistoryOnDeletion
{
  BOOL v3 = preservesValueInHistoryOnDeletion;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (self)
  {
    if (v3) {
      __int16 v5 = 4096;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->super._propertyDescriptionFlags = *(_WORD *)&self->super._propertyDescriptionFlags & 0xEFFF | v5;
  }
}

- (void)setPreserveValueOnDeletionInPersistentHistory:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (self)
  {
    if (v3) {
      __int16 v5 = 4096;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->super._propertyDescriptionFlags = *(_WORD *)&self->super._propertyDescriptionFlags & 0xEFFF | v5;
  }
}

- (BOOL)_attributeTypeIsSchemaEqual:(unint64_t)a3
{
  uint64_t type = self->_type;
  if (type == a3) {
    return 1;
  }
  if (type == 100) {
    return a3 == 300 || a3 == 200;
  }
  if (a3 == 300 && type == 200 || a3 == 500 && type == 600) {
    return 1;
  }
  if (type != 800) {
    return 0;
  }
  BOOL result = 1;
  if (a3 != 100 && a3 != 200 && a3 != 300) {
    return 0;
  }
  return result;
}

- (BOOL)_isEqualWithoutIndex:(id)a3
{
  return [(NSAttributeDescription *)self _isEqual:a3 skipIndexCheck:1];
}

+ (id)stringForAttributeType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 799)
  {
    if ((uint64_t)a3 <= 399)
    {
      switch(a3)
      {
        case 0x64uLL:
          return @"NSInteger16AttributeType";
        case 0xC8uLL:
          return @"NSInteger32AttributeType";
        case 0x12CuLL:
          return @"NSInteger64AttributeType";
      }
    }
    else if ((uint64_t)a3 > 599)
    {
      if (a3 == 600) {
        return @"NSFloatAttributeType";
      }
      if (a3 == 700) {
        return @"NSStringAttributeType";
      }
    }
    else
    {
      if (a3 == 400) {
        return @"NSDecimalAttributeType";
      }
      if (a3 == 500) {
        return @"NSDoubleAttributeType";
      }
    }
  }
  else if ((uint64_t)a3 > 1199)
  {
    if ((uint64_t)a3 > 1999)
    {
      if (a3 == 2000) {
        return @"NSObjectIDAttributeType";
      }
      if (a3 == 2100) {
        return @"NSCompositeAttributeType";
      }
    }
    else
    {
      if (a3 == 1200) {
        return @"NSURIAttributeType";
      }
      if (a3 == 1800) {
        return @"NSTransformableAttributeType";
      }
    }
  }
  else if ((uint64_t)a3 > 999)
  {
    if (a3 == 1000) {
      return @"NSBinaryDataAttributeType";
    }
    if (a3 == 1100) {
      return @"NSUUIDAttributeType";
    }
  }
  else
  {
    if (a3 == 800) {
      return @"NSBooleanAttributeType";
    }
    if (a3 == 900) {
      return @"NSDateAttributeType";
    }
  }
  return @"NSUndefinedAttributeType";
}

- (uint64_t)_comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:(uint64_t)result
{
  if (result)
  {
    BOOL v3 = (unsigned __int16 *)result;
    objc_super v4 = (void *)[a2 _rawValidationPredicates];
    __int16 v5 = (void *)[a2 _rawValidationWarnings];
    __int16 v6 = (void *)[v3 _rawValidationPredicates];
    uint64_t v24 = (void *)[v3 _rawValidationWarnings];
    uint64_t v7 = [v3 _extraIVars];
    uint64_t v8 = [v4 count];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = (double *)(v7 + 16);
      id v12 = (double *)(v7 + 8);
      do
      {
        objc_super v13 = (void *)[v4 objectAtIndex:v10];
        uint64_t v14 = -[NSAttributeDescription _canConvertPredicate:andWarning:]((uint64_t)v3, v13, (void *)[v5 objectAtIndex:v10]);
        if (!v14)
        {
          if (!v6) {
            return 0;
          }
          uint64_t v18 = [v6 indexOfObject:v13];
          if (v18 == 0x7FFFFFFFFFFFFFFFLL
            || (objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", v18), "isEqual:", objc_msgSend(v5, "objectAtIndex:", v10)) & 1) == 0)
          {
            return 0;
          }
          goto LABEL_19;
        }
        uint64_t v15 = v14;
        int v16 = objc_msgSend((id)objc_msgSend(v13, "rightExpression"), "constantValue");
        unsigned int v17 = v3[40];
        if (v17 > 0x12B)
        {
          if (v17 != 700 && v17 != 300)
          {
LABEL_21:
            if (v15 <= 0) {
              objc_super v21 = v12;
            }
            else {
              objc_super v21 = v11;
            }
            double v22 = *v21;
            [v16 doubleValue];
            if (v22 != v23) {
              return 0;
            }
            goto LABEL_19;
          }
        }
        else if (v17 != 100 && v17 != 200)
        {
          goto LABEL_21;
        }
        if (v15 <= 0) {
          BOOL v19 = v12;
        }
        else {
          BOOL v19 = v11;
        }
        uint64_t v20 = *(void *)v19;
        if (v20 != [v16 longLongValue]) {
          return 0;
        }
LABEL_19:
        ++v10;
      }
      while (v9 != v10);
    }
    return 1;
  }
  return result;
}

- (BOOL)_comparePredicatesAndWarnings:(id)a3
{
  BOOL v5 = [(NSPropertyDescription *)self _hasMaxValueInExtraIvars]
    || [(NSPropertyDescription *)self _hasMinValueInExtraIvars];
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    a3 = (id)[a3 _underlyingProperty];
  }
  if (([a3 _hasMaxValueInExtraIvars] & 1) != 0
    || ([a3 _hasMinValueInExtraIvars] & 1) != 0)
  {
    if (v5)
    {
      uint64_t v7 = [(NSPropertyDescription *)self _extraIVars];
      uint64_t v8 = [a3 _extraIVars];
      if (v7->var1 != *(void *)(v8 + 8) || v7->var2 != *(void *)(v8 + 16)) {
        return 0;
      }
      goto LABEL_19;
    }
    uint64_t v10 = a3;
    uint64_t v11 = self;
  }
  else
  {
    if (!v5)
    {
LABEL_19:
      v12.receiver = self;
      v12.super_class = (Class)NSAttributeDescription;
      return [(NSPropertyDescription *)&v12 _comparePredicatesAndWarnings:a3];
    }
    uint64_t v10 = self;
    uint64_t v11 = a3;
  }

  return -[NSAttributeDescription _comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:]((uint64_t)v10, v11);
}

void __75__NSAttributeDescription__NSInternalMethods___createCachesAndOptimizeState__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [NSString stringWithUTF8String:"One or more models in this application are using transformable properties with transformer names that are either unset, or set to NSKeyedUnarchiveFromDataTransformerName. Please switch to using \"%@\" or a subclass of NSSecureUnarchiveFromDataTransformer instead. At some point, Core Data will default to using \"%@\" when nil is specified, and transformable properties containing classes that do not support NSSecureCoding will become unreadable."];
  uint64_t v1 = *MEMORY[0x1E4F288C0];
  _NSCoreDataLog(17, v0, v2, v3, v4, v5, v6, v7, *MEMORY[0x1E4F288C0]);
  uint64_t v8 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v1;
    __int16 v11 = 2112;
    uint64_t v12 = v1;
    _os_log_fault_impl(&dword_18AB82000, v8, OS_LOG_TYPE_FAULT, "CoreData: One or more models in this application are using transformable properties with transformer names that are either unset, or set to NSKeyedUnarchiveFromDataTransformerName. Please switch to using \"%@\" or a subclass of NSSecureUnarchiveFromDataTransformer instead. At some point, Core Data will default to using \"%@\" when nil is specified, and transformable properties containing classes that do not support NSSecureCoding will become unreadable.", buf, 0x16u);
  }
}

- (id)_initWithType:(unint64_t)a3
{
  return [(NSAttributeDescription *)self _initWithName:0 type:a3];
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16 = [a3 length];
  _writeInt32IntoData(a3, 0);
  uint64_t v17 = [a3 length];
  v39.receiver = self;
  v39.super_class = (Class)NSAttributeDescription;
  [(NSPropertyDescription *)&v39 _appendPropertyFieldsToData:a3 propertiesDict:a4 uniquedPropertyNames:a5 uniquedStrings:a6 uniquedData:a7 entitiesSlots:a8];
  if (self->_valueTransformerName) {
    unsigned int v18 = objc_msgSend((id)objc_msgSend(a6, "valueForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v18 = 0;
  }
  _writeInt32IntoData(a3, v18);
  _writeInt32IntoData(a3, self->_type);
  if (self->_attributeValueClassName) {
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v19 = 0;
  }
  _writeInt32IntoData(a3, v19);
  if (self->_defaultValue)
  {
    _writeInt32IntoData(a3, 1u);
    unsigned int type = self->_type;
    if (type <= 0x1F3)
    {
      if (self->_type > 0x12Bu)
      {
        if (type == 300)
        {
          _writeInt64IntoData(a3, [self->_defaultValue longLongValue]);
          goto LABEL_40;
        }
        if (type == 400)
        {
          id defaultValue = (id)[self->_defaultValue stringValue];
          id v22 = a5;
          goto LABEL_37;
        }
LABEL_36:
        id defaultValue = self->_defaultValue;
        id v22 = a7;
        goto LABEL_37;
      }
      if (type != 100 && type != 200) {
        goto LABEL_36;
      }
LABEL_18:
      unsigned int v25 = [self->_defaultValue integerValue];
LABEL_38:
      unsigned int v24 = v25;
      id v23 = a3;
      goto LABEL_39;
    }
    if (self->_type <= 0x2BBu)
    {
      if (type != 500)
      {
        if (type != 600) {
          goto LABEL_36;
        }
        uint64_t v26 = [a3 length];
        unint64_t v27 = (v26 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        if (v27 != v26)
        {
          unint64_t v38 = 0;
          [a3 appendBytes:&v38 length:v27 - v26];
        }
        [self->_defaultValue floatValue];
        LODWORD(v38) = bswap32(v28);
        id v29 = a3;
        uint64_t v30 = 4;
LABEL_35:
        [v29 appendBytes:&v38 length:v30];
        goto LABEL_40;
      }
      uint64_t v34 = [a3 length];
      unint64_t v35 = (v34 + 7) & 0xFFFFFFFFFFFFFFF8;
      if (v35 != v34)
      {
        unint64_t v38 = 0;
        [a3 appendBytes:&v38 length:v35 - v34];
      }
      [self->_defaultValue doubleValue];
    }
    else
    {
      if (type != 900)
      {
        if (type != 800)
        {
          if (type == 700)
          {
            id defaultValue = self->_defaultValue;
            id v22 = a6;
LABEL_37:
            unsigned int v25 = objc_msgSend((id)objc_msgSend(v22, "objectForKey:", defaultValue), "unsignedIntegerValue");
            goto LABEL_38;
          }
          goto LABEL_36;
        }
        goto LABEL_18;
      }
      uint64_t v31 = [a3 length];
      unint64_t v32 = (v31 + 7) & 0xFFFFFFFFFFFFFFF8;
      if (v32 != v31)
      {
        unint64_t v38 = 0;
        [a3 appendBytes:&v38 length:v32 - v31];
      }
      [self->_defaultValue timeIntervalSinceReferenceDate];
    }
    unint64_t v38 = bswap64(v33);
    id v29 = a3;
    uint64_t v30 = 8;
    goto LABEL_35;
  }
  id v23 = a3;
  unsigned int v24 = 0;
LABEL_39:
  _writeInt32IntoData(v23, v24);
LABEL_40:
  unsigned int v36 = [(NSPropertyDescription *)self _hasMaxValueInExtraIvars];
  if ([(NSPropertyDescription *)self _hasMinValueInExtraIvars]) {
    v36 |= 2u;
  }
  if ([(NSPropertyDescription *)self _storeBinaryDataExternally]) {
    v36 |= 4u;
  }
  if ([(NSPropertyDescription *)self _isTriggerBacked]) {
    v36 |= 8u;
  }
  if ([(NSAttributeDescription *)self preservesValueInHistoryOnDeletion]) {
    v36 |= 0x10u;
  }
  if ([(NSPropertyDescription *)self _isFileBackedFuture])
  {
    v36 |= 0x20u;
  }
  else if (objc_msgSend(-[NSDictionary valueForKey:](-[NSPropertyDescription userInfo](self, "userInfo"), "valueForKey:", @"NSIsFileBackedFuture"), "BOOLValue"))
  {
    v36 |= 0x24u;
  }
  if ([(NSPropertyDescription *)self _allowsCloudEncryption]) {
    unsigned int v37 = v36 | 0x40;
  }
  else {
    unsigned int v37 = v36;
  }
  _writeInt32IntoData(a3, v37);
  unint64_t v38 = bswap32([a3 length] - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v17 - 4, 4, &v38);
}

@end