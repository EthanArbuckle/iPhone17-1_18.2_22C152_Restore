@interface HKUserDomainConceptPropertyCollection
+ (BOOL)supportsSecureCoding;
+ (id)propertyCollectionByMergingCollection:(id)a3 otherCollection:(id)a4;
+ (id)propertyCollectionByMergingCollection:(id)a3 otherCollection:(id)a4 options:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptPropertyCollection)init;
- (HKUserDomainConceptPropertyCollection)initWithCoder:(id)a3;
- (HKUserDomainConceptPropertyCollection)initWithProperties:(id)a3;
- (NSArray)allBasicProperties;
- (NSArray)basicProperties;
- (NSArray)properties;
- (id)_basicPropertiesIncludeDeleted:(BOOL)a3;
- (id)_propertiesByType;
- (id)_propertiesWithType:(int64_t)a3 includeDeleted:(BOOL)a4;
- (id)allPropertiesWithType:(int64_t)a3;
- (id)collectionByAddingProperties:(id)a3;
- (id)description;
- (id)firstBasicPropertyWithType:(int64_t)a3;
- (id)firstPropertyWithType:(int64_t)a3;
- (id)propertiesWithType:(int64_t)a3;
- (id)propertyCollectionByMerging:(id)a3 options:(unint64_t)a4;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserDomainConceptPropertyCollection

- (HKUserDomainConceptPropertyCollection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptPropertyCollection)initWithProperties:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKUserDomainConceptPropertyCollection.m", 29, @"Invalid parameter not satisfying: %@", @"properties != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptPropertyCollection;
  v6 = [(HKUserDomainConceptPropertyCollection *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    properties = v6->_properties;
    v6->_properties = (NSArray *)v7;
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  NSUInteger v5 = [(NSArray *)self->_properties count];
  NSUInteger v6 = [(NSArray *)self->_properties count];
  uint64_t v7 = @"properties";
  if (v6 == 1) {
    uint64_t v7 = @"property";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p with %ld %@: %@>", v4, self, v5, v7, self->_properties];
}

- (int64_t)count
{
  return [(NSArray *)self->_properties count];
}

- (unint64_t)hash
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_properties];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKUserDomainConceptPropertyCollection *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      if ([(NSArray *)self->_properties isEqualToArray:v5->_properties])
      {
        char v6 = 1;
      }
      else
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_properties];
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5->_properties];
        char v6 = [v7 isEqual:v8];
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKUserDomainConceptPropertyCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKUserDomainConceptPropertyCollection;
  NSUInteger v5 = [(HKUserDomainConceptPropertyCollection *)&v10 init];
  if (v5)
  {
    char v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (NSArray *)v7;
  }
  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_properties countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)collectionByAddingProperties:(id)a3
{
  unint64_t v3 = [(NSArray *)self->_properties arrayByAddingObjectsFromArray:a3];
  id v4 = [[HKUserDomainConceptPropertyCollection alloc] initWithProperties:v3];

  return v4;
}

- (id)firstPropertyWithType:(int64_t)a3
{
  if (HKIsDeprecatedPropertyType(a3))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKUserDomainConceptPropertyCollection.m", 123, @"Invalid parameter not satisfying: %@", @"HKIsDeprecatedPropertyType(type) == NO" object file lineNumber description];
  }
  properties = self->_properties;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HKUserDomainConceptPropertyCollection_firstPropertyWithType___block_invoke;
  v10[3] = &__block_descriptor_40_e37_B16__0__HKUserDomainConceptProperty_8l;
  v10[4] = a3;
  uint64_t v7 = [(NSArray *)properties hk_firstObjectPassingTest:v10];

  return v7;
}

uint64_t __63__HKUserDomainConceptPropertyCollection_firstPropertyWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32)) {
    uint64_t v4 = [v3 isDeleted] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)propertiesWithType:(int64_t)a3
{
  return [(HKUserDomainConceptPropertyCollection *)self _propertiesWithType:a3 includeDeleted:0];
}

- (id)allPropertiesWithType:(int64_t)a3
{
  return [(HKUserDomainConceptPropertyCollection *)self _propertiesWithType:a3 includeDeleted:1];
}

- (id)_propertiesWithType:(int64_t)a3 includeDeleted:(BOOL)a4
{
  if (HKIsDeprecatedPropertyType(a3))
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKUserDomainConceptPropertyCollection.m", 142, @"Invalid parameter not satisfying: %@", @"HKIsDeprecatedPropertyType(type) == NO" object file lineNumber description];
  }
  properties = self->_properties;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__HKUserDomainConceptPropertyCollection__propertiesWithType_includeDeleted___block_invoke;
  v12[3] = &__block_descriptor_41_e37_B16__0__HKUserDomainConceptProperty_8l;
  v12[4] = a3;
  BOOL v13 = a4;
  v9 = [(NSArray *)properties hk_filter:v12];

  return v9;
}

uint64_t __76__HKUserDomainConceptPropertyCollection__propertiesWithType_includeDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v3 isDeleted] ^ 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)propertyCollectionByMergingCollection:(id)a3 otherCollection:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      id v10 = [v7 propertyCollectionByMerging:v8 options:a5];
    }
    else
    {
      id v10 = v8;
    }
  }
  else
  {
    id v10 = v7;
  }
  objc_super v11 = v10;

  return v11;
}

+ (id)propertyCollectionByMergingCollection:(id)a3 otherCollection:(id)a4
{
  return (id)[a1 propertyCollectionByMergingCollection:a3 otherCollection:a4 options:0];
}

- (id)propertyCollectionByMerging:(id)a3 options:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    v29 = self;
    goto LABEL_26;
  }
  id v7 = [(HKUserDomainConceptPropertyCollection *)self _propertiesByType];
  id v8 = [v6 _propertiesByType];
  v35 = v7;
  v34 = (void *)[v7 mutableCopy];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v31 = self;
    id v32 = v6;
    char v33 = 0;
    uint64_t v12 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v15 = [v9 objectForKeyedSubscript:v14];
        v16 = [v15 firstObject];
        v17 = objc_opt_class();

        uint64_t v18 = [v35 objectForKeyedSubscript:v14];
        v19 = (void *)v18;
        v20 = (void *)MEMORY[0x1E4F1CBF0];
        if (v18) {
          v20 = (void *)v18;
        }
        id v21 = v20;

        objc_msgSend(v17, "mergeListsOfPropertiesWithType:intoListOfProperties:fromListOfProperties:options:", objc_msgSend(v14, "integerValue"), v21, v15, a4);
        id v22 = (id)objc_claimAutoreleasedReturnValue();

        if (v22 != v21)
        {
          [v34 setObject:v22 forKeyedSubscript:v14];
          char v33 = 1;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v11);

    self = v31;
    id v6 = v32;
    if (v33)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v24 = [v34 allValues];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v37 != v27) {
              objc_enumerationMutation(v24);
            }
            [v23 addObjectsFromArray:*(void *)(*((void *)&v36 + 1) + 8 * j)];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v26);
      }

      v29 = [[HKUserDomainConceptPropertyCollection alloc] initWithProperties:v23];
      goto LABEL_25;
    }
  }
  else
  {
  }
  v29 = self;
LABEL_25:

LABEL_26:

  return v29;
}

- (id)_propertiesByType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_properties;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "type", (void)v14));
        id v11 = [v3 objectForKeyedSubscript:v10];
        if (!v11)
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v3 setObject:v11 forKeyedSubscript:v10];
        }
        [v11 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

- (NSArray)basicProperties
{
  return (NSArray *)[(HKUserDomainConceptPropertyCollection *)self _basicPropertiesIncludeDeleted:0];
}

- (NSArray)allBasicProperties
{
  return (NSArray *)[(HKUserDomainConceptPropertyCollection *)self _basicPropertiesIncludeDeleted:1];
}

- (id)_basicPropertiesIncludeDeleted:(BOOL)a3
{
  uint64_t v4 = [(HKUserDomainConceptPropertyCollection *)self properties];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__HKUserDomainConceptPropertyCollection_HKUserDomainConceptBasicProperty___basicPropertiesIncludeDeleted___block_invoke;
  v7[3] = &__block_descriptor_33_e37_B16__0__HKUserDomainConceptProperty_8l;
  BOOL v8 = a3;
  uint64_t v5 = objc_msgSend(v4, "hk_filter:", v7);

  return v5;
}

uint64_t __106__HKUserDomainConceptPropertyCollection_HKUserDomainConceptBasicProperty___basicPropertiesIncludeDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v3 isDeleted] ^ 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)firstBasicPropertyWithType:(int64_t)a3
{
  if (HKIsBasicUserDomainConceptPropertyType(a3))
  {
    uint64_t v5 = [(HKUserDomainConceptPropertyCollection *)self firstPropertyWithType:a3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end