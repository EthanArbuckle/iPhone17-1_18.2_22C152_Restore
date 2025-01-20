@interface NSCompositeAttributeDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransient;
- (NSArray)elements;
- (NSCompositeAttributeDescription)init;
- (NSCompositeAttributeDescription)initWithCoder:(id)a3;
- (id)_buildDefaultValue;
- (id)_flattenElements:(id)a3;
- (id)_flattenedElements;
- (id)_initWithName:(id)a3;
- (id)_initWithName:(id)a3 type:(unint64_t)a4;
- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5;
- (id)_initWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_buildDefaultValue:(void *)a3 usingElements:;
- (uint64_t)_checkElements:(uint64_t)result;
- (unint64_t)_propertyType;
- (unint64_t)attributeType;
- (void)_addElement:(id)a3;
- (void)_createCachesAndOptimizeState;
- (void)_setEntityAndMaintainIndices:(id)a3;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeType:(unint64_t)a3;
- (void)setDefaultValue:(id)a3;
- (void)setElements:(NSArray *)elements;
@end

@implementation NSCompositeAttributeDescription

- (NSCompositeAttributeDescription)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSCompositeAttributeDescription;
  v2 = [(NSPropertyDescription *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NSCompositeAttributeDescription *)v2 setAttributeType:2100];
  }
  return v3;
}

- (id)_initWithName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSCompositeAttributeDescription;
  id v3 = [(NSPropertyDescription *)&v6 _initWithName:a3];
  v4 = v3;
  if (v3) {
    [v3 setAttributeType:2100];
  }
  return v4;
}

- (id)_initWithType:(unint64_t)a3
{
  if (a3 != 2100)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type." userInfo:0]);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCompositeAttributeDescription;
  return -[NSAttributeDescription _initWithType:](&v4, sel__initWithType_);
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4
{
  if (a4 != 2100)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type." userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSCompositeAttributeDescription;
  return -[NSAttributeDescription _initWithName:type:](&v5, sel__initWithName_type_, a3);
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5
{
  if (a4 != 2100)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCompositeAttributeDescription only supports NSCompositeAttributeType as a type." userInfo:0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSCompositeAttributeDescription;
  return [(NSAttributeDescription *)&v6 _initWithName:a3 type:2100 withClassName:a5];
}

- (void)dealloc
{
  self->_elements = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCompositeAttributeDescription;
  [(NSAttributeDescription *)&v3 dealloc];
}

- (unint64_t)_propertyType
{
  return 7;
}

- (unint64_t)attributeType
{
  return 2100;
}

- (void)setAttributeType:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3 != 2100)
  {
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    objc_super v5 = @"offending attribute";
    v6[0] = self;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v3, @"The attribute type of a composite cannot be changed from NSCompositeAttributeType.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription setAttributeType:](&v4, sel_setAttributeType_);
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)NSCompositeAttributeDescription;
  id v4 = [(NSAttributeDescription *)&v10 description];
  unint64_t v5 = [(NSCompositeAttributeDescription *)self attributeType];
  objc_super v6 = [(NSCompositeAttributeDescription *)self elements];
  BOOL v7 = [(NSAttributeDescription *)self preservesValueInHistoryOnDeletion];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"%@, attributeType %lu, elements %@, preservesValueInHistoryOnDeletion %@", v4, v5, v6, v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isTransient
{
  return 0;
}

- (NSCompositeAttributeDescription)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSCompositeAttributeDescription;
  id v4 = -[NSAttributeDescription initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_elements = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"NSCompositeElements");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSCompositeAttributeDescription;
  -[NSAttributeDescription encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_elements forKey:@"NSCompositeElements"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  id v4 = [(NSAttributeDescription *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4) {
    [v4 setElements:self->_elements];
  }
  return v5;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(NSArray *)elements
{
  v35[2] = *MEMORY[0x1E4F143B8];
  [(NSPropertyDescription *)self _throwIfNotEditable];
  -[NSCompositeAttributeDescription _checkElements:]((uint64_t)self, elements);
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](elements, "count"));
  BOOL v6 = [(NSAttributeDescription *)self preservesValueInHistoryOnDeletion];
  [v5 addObjectsFromArray:elements];
  objc_super v7 = 0;
  unint64_t v8 = 0;
  while ([v5 count])
  {
    v9 = (void *)[v5 firstObject];
    if ([v9 preservesValueInHistoryOnDeletion]) {
      objc_super v7 = v9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 preservesValueInHistoryOnDeletion]
        && ![(NSAttributeDescription *)self preservesValueInHistoryOnDeletion])
      {
        v16 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v17 = [NSString stringWithFormat:@"Nested composite %@ is not eligible for preserving values on deletion (only allowed for root composite and leaves).", objc_msgSend(v9, "_qualifiedName")];
        v34[0] = @"Composite";
        v34[1] = @"Element";
        v35[0] = self;
        v35[1] = v9;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
LABEL_29:
        objc_exception_throw((id)[v16 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:v18]);
      }
      int v10 = [v9 preservesValueInHistoryOnDeletion];
      if (v10 != [(NSAttributeDescription *)self preservesValueInHistoryOnDeletion])
      {
        v16 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v17 = [NSString stringWithFormat:@"Nested composite %@ is not eligible for preserving values on deletion (only allowed for root composite and leaves).", objc_msgSend(v9, "_qualifiedName")];
        v32[0] = @"Composite";
        v32[1] = @"Element";
        v33[0] = self;
        v33[1] = v9;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
        goto LABEL_29;
      }
    }
    if (v6)
    {
      if (!v7)
      {
        v16 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v17 = [NSString stringWithFormat:@"Composite %@ that is preserved on deletion but element %@ is not.", -[NSPropertyDescription _qualifiedName](self, "_qualifiedName"), objc_msgSend(v9, "_qualifiedName")];
        v28[0] = @"Composite";
        v28[1] = @"Element";
        v29[0] = self;
        v29[1] = v9;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
        goto LABEL_29;
      }
    }
    else if ([v9 preservesValueInHistoryOnDeletion])
    {
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = [NSString stringWithFormat:@"Element %@ is preserved on deletion but its composite %@ is not.", objc_msgSend(v9, "_qualifiedName"), -[NSPropertyDescription _qualifiedName](self, "_qualifiedName")];
      v30[0] = @"Element";
      v30[1] = @"Composite";
      v31[0] = v9;
      v31[1] = self;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v9, "elements"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        __break(1u);
      }
    }
    ++v8;
    [v5 removeObject:v9];
  }
  if (v8 >= 0x3EA)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = [NSString stringWithFormat:@"%@ does not yet support more than 1000 total attributes as part of the modeled composite attribute graph. This attribute, %@, has %lu.", +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", -[NSCompositeAttributeDescription attributeType](self, "attributeType")), -[NSPropertyDescription _qualifiedName](self, "_qualifiedName"), v8];
    objc_exception_throw((id)[v19 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0]);
  }

  v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](elements, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [(NSArray *)elements countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(elements);
        }
        v15 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copy];
        [(NSArray *)v11 addObject:v15];
      }
      uint64_t v12 = [(NSArray *)elements countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  self->_elements = v11;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3052000000;
  v22[3] = __Block_byref_object_copy__61;
  v22[4] = __Block_byref_object_dispose__61;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__NSCompositeAttributeDescription_setElements___block_invoke;
  v21[3] = &unk_1E544FAC8;
  v21[4] = v22;
  v22[5] = v21;
  __47__NSCompositeAttributeDescription_setElements___block_invoke((uint64_t)v21, v11, (uint64_t)self);
  _Block_object_dispose(v22, 8);
}

- (uint64_t)_checkElements:(uint64_t)result
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    result = [a2 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v28;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v28 != v5) {
            objc_enumerationMutation(a2);
          }
          objc_super v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ([v7 isNSArray]) {
              -[NSCompositeAttributeDescription _checkElements:](v3, v7);
            }
            long long v25 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v26 = *MEMORY[0x1E4F1C3C8];
            v31 = @"Attribute";
            v32 = v7;
            uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            long long v24 = @"Unsupported attribute type for composite.";
            v22 = v25;
            uint64_t v23 = v26;
LABEL_48:
            objc_exception_throw((id)[v22 exceptionWithName:v23 reason:v24 userInfo:v21]);
          }
          uint64_t v8 = [v7 attributeType];
          uint64_t v9 = v8;
          if (v8 > 799)
          {
            if (v8 > 1199)
            {
              if (v8 > 1999)
              {
                if (v8 != 2100)
                {
                  if (v8 != 2000) {
                    goto LABEL_45;
                  }
                  goto LABEL_47;
                }
              }
              else if (v8 != 1200 && v8 != 1800)
              {
                goto LABEL_45;
              }
            }
            else if (v8 > 999)
            {
              if (v8 == 1000)
              {
                if (([v7 allowsExternalBinaryDataStorage] & 1) != 0
                  || ([v7 isFileBackedFuture] & 1) != 0)
                {
                  goto LABEL_47;
                }
              }
              else if (v8 != 1100)
              {
                goto LABEL_45;
              }
            }
            else if (v8 != 800 && v8 != 900)
            {
              goto LABEL_45;
            }
          }
          else if (v8 <= 399)
          {
            if (v8 <= 199)
            {
              if (v8 != 100)
              {
                if (v8)
                {
LABEL_45:
                  uint64_t v10 = [NSString stringWithUTF8String:"New attribute type? %@"];
                  _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v7);
                  uint64_t v17 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v36 = v7;
                    _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: New attribute type? %@", buf, 0xCu);
                  }
                }
LABEL_47:
                uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v19 = *MEMORY[0x1E4F1C3C8];
                uint64_t v20 = [NSString stringWithFormat:@"%@ does not yet support elements of type %@. Please file a radar for this support and assign it to CoreData | (New Bugs).", +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", 2100), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", v9)];
                v33 = @"offendingAttribute";
                v34 = v7;
                uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
                v22 = v18;
                uint64_t v23 = v19;
                long long v24 = (__CFString *)v20;
                goto LABEL_48;
              }
            }
            else if (v8 != 200 && v8 != 300)
            {
              goto LABEL_45;
            }
          }
          else if (v8 > 599)
          {
            if (v8 != 600 && v8 != 700) {
              goto LABEL_45;
            }
          }
          else if (v8 != 400 && v8 != 500)
          {
            goto LABEL_45;
          }
          ++v6;
        }
        while (v4 != v6);
        result = [a2 countByEnumeratingWithState:&v27 objects:v37 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __47__NSCompositeAttributeDescription_setElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16);
LABEL_10:
          v11();
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 setSuperCompositeAttribute:a3];
          uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          [v10 elements];
          uint64_t v11 = *(void (**)(void))(v12 + 16);
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setSuperCompositeAttribute:a3];
        }
LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  -[NSPropertyDescription _setEntityAndMaintainIndices:](&v7, sel__setEntityAndMaintainIndices_);
  v6[0] = 0;
  v6[1] = v6;
  void v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__61;
  v6[4] = __Block_byref_object_dispose__61;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke;
  v5[3] = &unk_1E544FAF0;
  v5[4] = a3;
  v5[5] = v6;
  v6[5] = v5;
  __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke((uint64_t)v5, self->_elements, (uint64_t)a3);
  _Block_object_dispose(v6, 8);
}

uint64_t __64__NSCompositeAttributeDescription__setEntityAndMaintainIndices___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16);
LABEL_10:
          v11();
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 _setEntityAndMaintainIndices:a3];
          uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          [v10 elements];
          uint64_t v11 = *(void (**)(void))(v12 + 16);
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 _setEntityAndMaintainIndices:*(void *)(a1 + 32)];
        }
LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_addElement:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_elements];
  [v5 addObject:a3];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

  [(NSCompositeAttributeDescription *)self setElements:v6];
}

- (BOOL)_isSchemaEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  unsigned int v5 = -[NSAttributeDescription _isSchemaEqual:](&v7, sel__isSchemaEqual_);
  if (v5) {
    LOBYTE(v5) = -[NSArray isEqual:](self->_elements, "isEqual:", [a3 elements]);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    v12.receiver = self;
    v12.super_class = (Class)NSCompositeAttributeDescription;
    unsigned int v7 = -[NSAttributeDescription isEqual:](&v12, sel_isEqual_);
    if (v7)
    {
      elements = self->_elements;
      uint64_t v9 = [a3 elements];
      if (elements == (NSArray *)v9)
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        if (elements) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          LOBYTE(v7) = 0;
        }
        else {
          LOBYTE(v7) = [(NSArray *)elements isEqual:v9];
        }
      }
    }
  }
  return v7;
}

- (void)setDefaultValue:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (([a3 isNSDictionary] & 1) == 0)
  {
    unsigned int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = @"Attribute";
    v9[0] = [(NSPropertyDescription *)self name];
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, @"Unsupported default value for composite. Must be an NSDictionary.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  [(NSAttributeDescription *)&v7 setDefaultValue:a3];
}

- (id)_buildDefaultValue
{
  uint64_t v3 = objc_msgSend(-[NSAttributeDescription defaultValue](self, "defaultValue"), "mutableCopy");
  id v4 = (id)v3;
  if (!v3) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  -[NSCompositeAttributeDescription _buildDefaultValue:usingElements:]((uint64_t)self, v4, [(NSCompositeAttributeDescription *)self elements]);
  unsigned int v5 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  if (!v3 && ![v5 count]) {
    return 0;
  }
  return v5;
}

- (uint64_t)_buildDefaultValue:(void *)a3 usingElements:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = result;
  if (result)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t result = [a3 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v33;
      v22 = a2;
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v6 = 0;
        uint64_t v21 = v4;
        do
        {
          if (*(void *)v33 != v5) {
            objc_enumerationMutation(a3);
          }
          objc_super v7 = *(__CFString **)(*((void *)&v32 + 1) + 8 * v6);
          uint64_t v8 = (void *)MEMORY[0x18C127630]();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            -[NSCompositeAttributeDescription _buildDefaultValue:usingElements:](v23, a2, [(__CFString *)v7 elements]);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v19 = *MEMORY[0x1E4F1C3C8];
              v36 = @"Attribute";
              v37 = v7;
              objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v19, @"Unsupported attribute type for composite.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1)));
            }
            uint64_t v25 = [(__CFString *)v7 defaultValue];
            if (v25)
            {
              long long v27 = v8;
              uint64_t v26 = -[NSPropertyDescription _elementPath](v7);
              uint64_t v9 = (void *)[(__CFString *)v26 componentsSeparatedByString:@"."];
              if ((unint64_t)[v9 count] >= 2)
              {
                long long v30 = 0u;
                long long v31 = 0u;
                long long v28 = 0u;
                long long v29 = 0u;
                uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
                if (v10)
                {
                  uint64_t v11 = v10;
                  uint64_t v12 = *(void *)v29;
                  uint64_t v13 = (uint64_t)v22;
                  do
                  {
                    uint64_t v14 = 0;
                    long long v15 = (void *)v13;
                    do
                    {
                      if (*(void *)v29 != v12) {
                        objc_enumerationMutation(v9);
                      }
                      uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * v14);
                      uint64_t v13 = objc_msgSend(v15, "objectForKey:", v16, v20);
                      if (!v13)
                      {
                        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                        [v15 setObject:v17 forKey:v16];
                      }
                      ++v14;
                      long long v15 = (void *)v13;
                    }
                    while (v11 != v14);
                    uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
                  }
                  while (v11);
                }
              }
              a2 = v22;
              uint64_t v18 = objc_msgSend(v22, "valueForKeyPath:", v26, v20);
              uint64_t v5 = v20;
              uint64_t v4 = v21;
              uint64_t v8 = v27;
              if (!v18) {
                [v22 setValue:v25 forKeyPath:v26];
              }
            }
          }
          ++v6;
        }
        while (v6 != v4);
        uint64_t result = [a3 countByEnumeratingWithState:&v32 objects:v39 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)_flattenedElements
{
  uint64_t v3 = [(NSCompositeAttributeDescription *)self elements];

  return [(NSCompositeAttributeDescription *)self _flattenElements:v3];
}

- (id)_flattenElements:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v5, "addObjectsFromArray:", -[NSCompositeAttributeDescription _flattenElements:](self, "_flattenElements:", objc_msgSend(v10, "elements")));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v13 = *MEMORY[0x1E4F1C3C8];
            uint64_t v18 = @"Attribute";
            uint64_t v19 = v10;
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v13, @"Unsupported attribute type for composite.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)));
          }
          [v5 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:v5];

  return v11;
}

- (void)_createCachesAndOptimizeState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v7.receiver = self;
  v7.super_class = (Class)NSCompositeAttributeDescription;
  [(NSAttributeDescription *)&v7 _createCachesAndOptimizeState];
  -[NSCompositeAttributeDescription _checkElements:]((uint64_t)self, self->_elements);
  v6[0] = 0;
  v6[1] = v6;
  void v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__61;
  v6[4] = __Block_byref_object_dispose__61;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke;
  v5[3] = &unk_1E544FAC8;
  v5[4] = v6;
  v6[5] = v5;
  __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke((uint64_t)v5, self->_elements, (uint64_t)self);
  _Block_object_dispose(v6, 8);
  [v3 drain];
  id v4 = 0;
}

uint64_t __64__NSCompositeAttributeDescription__createCachesAndOptimizeState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16);
LABEL_10:
          v11();
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 setSuperCompositeAttribute:a3];
          uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          [v10 elements];
          uint64_t v11 = *(void (**)(void))(v12 + 16);
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setSuperCompositeAttribute:a3];
        }
LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v26.receiver = self;
  v26.super_class = (Class)NSCompositeAttributeDescription;
  [(NSAttributeDescription *)&v26 _versionHash:data inStyle:a4];
  if (self->_elements)
  {
    uint64_t v6 = objc_msgSend(-[NSCompositeAttributeDescription _flattenElements:](self, "_flattenElements:", -[NSCompositeAttributeDescription elements](self, "elements")), "sortedArrayUsingFunction:context:", _comparePropertiesByName, 0);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v11 isNSArray])
          {
            uint64_t v12 = (void *)[v11 sortedArrayUsingFunction:_comparePropertiesByName context:0];
            long long v18 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v28 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v19;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v19 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  [*(id *)(*((void *)&v18 + 1) + 8 * j) _versionHash:data inStyle:a4];
                  CC_SHA256_Update(&c, data, 0x20u);
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v28 count:16];
              }
              while (v14);
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ([v11 isTransient] & 1) == 0)
            {
              [v11 _versionHash:data inStyle:a4];
              CC_SHA256_Update(&c, data, 0x20u);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v8);
    }
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16 = [a3 length];
  uint64_t v17 = [a3 length];
  v20.receiver = self;
  v20.super_class = (Class)NSCompositeAttributeDescription;
  [(NSAttributeDescription *)&v20 _writeIntoData:a3 propertiesDict:a4 uniquedPropertyNames:a5 uniquedStrings:a6 uniquedData:a7 entitiesSlots:a8 fetchRequests:a9];
  if (self->_elements) {
    unsigned int v18 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v18 = 0;
  }
  _writeInt32IntoData(a3, v18);
  uint64_t v19 = bswap32([a3 length] - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v17, 4, &v19);
}

@end