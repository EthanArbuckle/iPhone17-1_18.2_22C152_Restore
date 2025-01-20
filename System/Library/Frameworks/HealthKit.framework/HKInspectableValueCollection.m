@interface HKInspectableValueCollection
+ (BOOL)hasNoValue:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_unitStringForValue:(id)a3;
+ (id)_unitStringForValueCollection:(id)a3;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
+ (id)inspectableValueCollectionListWithValues:(id)a3;
+ (id)inspectableValueCollectionRangeWithMax:(id)a3;
+ (id)inspectableValueCollectionRangeWithMin:(id)a3;
+ (id)inspectableValueCollectionRangeWithMin:(id)a3 max:(id)a4;
+ (id)inspectableValueCollectionSingleWithValue:(id)a3;
+ (id)inspectableValueCollectionTaggedListWithValues:(id)a3 tags:(id)a4;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKInspectableValue)inspectableValue;
- (HKInspectableValue)max;
- (HKInspectableValue)min;
- (HKInspectableValueCollection)init;
- (HKInspectableValueCollection)initWithCoder:(id)a3;
- (NSArray)collection;
- (NSArray)elementTags;
- (NSArray)inspectableValues;
- (NSString)description;
- (NSString)unitString;
- (id)_initWithCollectionType:(int64_t)a3 collection:(id)a4;
- (id)_initWithCollectionType:(int64_t)a3 collection:(id)a4 tags:(id)a5;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)valueInRangeWithReferenceRanges:(id)a3 includeUnitString:(BOOL)a4;
- (id)valueInRangeWithReferenceRanges:(id)a3 includeUnitString:(BOOL)a4 allowsNullRange:(BOOL)a5;
- (id)valuesWithTag:(id)a3;
- (int64_t)collectionType;
- (int64_t)referenceRangeStatusWithRanges:(id)a3;
- (unint64_t)hash;
- (void)_assertCollectionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKInspectableValueCollection

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"inspectableValue";
  v10[1] = @"min";
  v10[2] = @"max";
  v10[3] = @"inspectableValues";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v10 count:4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = objc_msgSend(v5, "hk_foldRightFrom:with:", v6, &__block_literal_global_110);

  v8 = +[HKConceptIndexUtilities keyPaths:v7 prefix:v4];

  return v8;
}

id __60__HKInspectableValueCollection_indexableKeyPathsWithPrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v5 = +[HKInspectableValue indexableKeyPathsWithPrefix:a3];
  if (v5)
  {
    id v6 = [v4 arrayByAddingObjectsFromArray:v5];
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (HKInspectableValueCollection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)inspectableValueCollectionSingleWithValue:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  v7 = (void *)[v5 _initWithCollectionType:0 collection:v6];

  return v7;
}

+ (id)inspectableValueCollectionRangeWithMin:(id)a3 max:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v12[0] = v7;
  v12[1] = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  v10 = (void *)[v8 _initWithCollectionType:1 collection:v9];

  return v10;
}

+ (id)inspectableValueCollectionRangeWithMin:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v10[0] = v4;
  id v6 = +[HKInspectableValue inspectableValueWithNull];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  id v8 = (void *)[v5 _initWithCollectionType:1 collection:v7];

  return v8;
}

+ (id)inspectableValueCollectionRangeWithMax:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = +[HKInspectableValue inspectableValueWithNull];
  v10[0] = v6;
  v10[1] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  id v8 = (void *)[v5 _initWithCollectionType:1 collection:v7];

  return v8;
}

+ (id)inspectableValueCollectionListWithValues:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initWithCollectionType:2 collection:v4];

  return v5;
}

+ (id)inspectableValueCollectionTaggedListWithValues:(id)a3 tags:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) _initWithCollectionType:3 collection:v7 tags:v6];

  return v8;
}

+ (BOOL)hasNoValue:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 collectionType])
    {
      BOOL v5 = 0;
    }
    else
    {
      id v6 = [v4 inspectableValue];
      BOOL v5 = [v6 valueType] == 5;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_initWithCollectionType:(int64_t)a3 collection:(id)a4
{
  return [(HKInspectableValueCollection *)self _initWithCollectionType:a3 collection:a4 tags:0];
}

- (id)_initWithCollectionType:(int64_t)a3 collection:(id)a4 tags:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKInspectableValueCollection;
  v11 = [(HKInspectableValueCollection *)&v14 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_collectionType = a3;
    objc_storeStrong((id *)&v11->_collection, a4);
    objc_storeStrong(p_isa + 3, a5);
    [p_isa _assertCollectionType];
  }

  return p_isa;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%li: %@", self->_collectionType, self->_collection];
}

- (HKInspectableValue)inspectableValue
{
  if (self->_collectionType)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(NSArray *)self->_collection objectAtIndexedSubscript:0];
  }

  return (HKInspectableValue *)v2;
}

- (HKInspectableValue)min
{
  if (self->_collectionType == 1)
  {
    v2 = [(NSArray *)self->_collection objectAtIndexedSubscript:0];
  }
  else
  {
    v2 = 0;
  }

  return (HKInspectableValue *)v2;
}

- (HKInspectableValue)max
{
  if (self->_collectionType == 1)
  {
    v2 = [(NSArray *)self->_collection objectAtIndexedSubscript:1];
  }
  else
  {
    v2 = 0;
  }

  return (HKInspectableValue *)v2;
}

- (NSArray)inspectableValues
{
  if (self->_collectionType == 2) {
    v2 = self->_collection;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)valueInRangeWithReferenceRanges:(id)a3 includeUnitString:(BOOL)a4 allowsNullRange:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(HKInspectableValueCollection *)self collectionType]) {
    goto LABEL_2;
  }
  objc_super v14 = [(HKInspectableValueCollection *)self inspectableValue];
  uint64_t v15 = [v14 valueType];

  id v9 = 0;
  id v10 = 0;
  if (v8 && v15)
  {
    if ([v8 count] != 1)
    {
LABEL_2:
      id v9 = 0;
      id v10 = 0;
      goto LABEL_3;
    }
    v16 = [v8 firstObject];
    v17 = [v16 valueRange];
    v18 = v17;
    if (v17 && [v17 collectionType] == 1)
    {
      id v9 = [v18 min];
      if (v9)
      {
        v19 = [v18 min];
        uint64_t v20 = [v19 valueType];

        if (v20)
        {
          id v9 = [v18 min];
        }
        else
        {
          id v9 = 0;
        }
      }
      id v10 = [v18 max];
      if (!v10) {
        goto LABEL_24;
      }
      v21 = [v18 max];
      uint64_t v22 = [v21 valueType];

      if (v22)
      {
        id v10 = [v18 max];
        goto LABEL_24;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = 0;
LABEL_24:
  }
LABEL_3:
  if (v6)
  {
    v11 = [(id)objc_opt_class() _unitStringForValueCollection:self];
    if (a5) {
      goto LABEL_10;
    }
  }
  else
  {
    v11 = 0;
    if (a5) {
      goto LABEL_10;
    }
  }
  if (!v9 && !v10)
  {
    v12 = 0;
    goto LABEL_11;
  }
LABEL_10:
  v12 = +[HKInspectableValueInRange valueInRangeWithLow:v9 high:v10 currentValue:self unit:v11];
LABEL_11:

  return v12;
}

- (id)valueInRangeWithReferenceRanges:(id)a3 includeUnitString:(BOOL)a4
{
  return [(HKInspectableValueCollection *)self valueInRangeWithReferenceRanges:a3 includeUnitString:a4 allowsNullRange:0];
}

- (int64_t)referenceRangeStatusWithRanges:(id)a3
{
  id v3 = [(HKInspectableValueCollection *)self valueInRangeWithReferenceRanges:a3 includeUnitString:0];
  id v4 = v3;
  if (v3 && (unint64_t v5 = [v3 currentValueRelation], v5 <= 2)) {
    int64_t v6 = qword_19C3D4890[v5];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSString)unitString
{
  int64_t collectionType = self->_collectionType;
  if ((unint64_t)(collectionType - 2) >= 2)
  {
    if (!collectionType)
    {
      int64_t v6 = [(HKInspectableValueCollection *)self inspectableValue];
      id v8 = [v6 unitString];
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = [(HKInspectableValueCollection *)self inspectableValues];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      int64_t v6 = [(HKInspectableValueCollection *)self inspectableValues];
      id v7 = [v6 firstObject];
      id v8 = [v7 unitString];

LABEL_6:
      goto LABEL_8;
    }
  }
  id v8 = &stru_1EEC60288;
LABEL_8:

  return (NSString *)v8;
}

+ (id)_unitStringForValueCollection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 collectionType];
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (!v4)
    {
      v11 = objc_opt_class();
      id v8 = [v3 inspectableValue];
      id v10 = [v11 _unitStringForValue:v8];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = [v3 inspectableValues];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = objc_opt_class();
      id v8 = [v3 inspectableValues];
      id v9 = [v8 firstObject];
      id v10 = [v7 _unitStringForValue:v9];

LABEL_6:
      goto LABEL_8;
    }
  }
  id v10 = &stru_1EEC60288;
LABEL_8:

  return v10;
}

+ (id)_unitStringForValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueType];
  if (v4 == 8 || v4 == 6)
  {
    uint64_t v6 = [v3 unitString];
  }
  else if (v4 == 1)
  {
    id v7 = [v3 ratioValue];
    id v8 = [v7 numerator];
    id v9 = [v8 unitCoding];

    id v10 = [v9 code];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [v9 displayString];
    }
    uint64_t v6 = v12;
  }
  else
  {
    uint64_t v6 = &stru_1EEC60288;
  }
  if ([(__CFString *)v6 length])
  {
    v13 = +[HKUCUMUnitDisplayConverter sharedConverter];
    uint64_t v14 = [v13 synonymForUCUMUnitString:v6];

    uint64_t v6 = (__CFString *)v14;
  }

  return v6;
}

- (id)valuesWithTag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)self->_elementTags count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [(NSArray *)self->_elementTags objectAtIndexedSubscript:v6];
      int v8 = [v7 isEqual:v4];

      if (v8)
      {
        id v9 = [(NSArray *)self->_collection objectAtIndexedSubscript:v6];
        [v5 addObject:v9];
      }
      ++v6;
    }
    while (v6 < [(NSArray *)self->_elementTags count]);
  }
  id v10 = (void *)[v5 copy];

  return v10;
}

- (void)_assertCollectionType
{
  int64_t collectionType = self->_collectionType;
  if (collectionType == 3)
  {
    NSUInteger v4 = [(NSArray *)self->_collection count];
    if (v4 != [(NSArray *)self->_elementTags count]) {
      [MEMORY[0x1E4F1CA00] raise:@"HKInconsistentInspectableCollectionTypeException", @"Tagged collection requires the same number of element and tags, number of tags:%lu, number of elements: %lu", -[NSArray count](self->_elementTags, "count"), -[NSArray count](self->_collection, "count") format];
    }
  }
  else if (collectionType == 1)
  {
    if ([(NSArray *)self->_collection count] != 2) {
      [MEMORY[0x1E4F1CA00] raise:@"HKInconsistentInspectableCollectionTypeException", @"Inconsistent number of values found in collection, expect two values, have %lu values", -[NSArray count](self->_collection, "count"), v5 format];
    }
  }
  else if (!collectionType && [(NSArray *)self->_collection count] != 1)
  {
    [MEMORY[0x1E4F1CA00] raise:@"HKInconsistentInspectableCollectionTypeException", @"Inconsistent number of values found in collection, expect single value, have %lu values", -[NSArray count](self->_collection, "count"), v5 format];
  }
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (HKInspectableValueCollection *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t collectionType = self->_collectionType;
      if (collectionType == [(HKInspectableValueCollection *)v5 collectionType])
      {
        collection = self->_collection;
        int v8 = [(HKInspectableValueCollection *)v5 collection];
        char v9 = [(NSArray *)collection isEqualToArray:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(HKInspectableValueCollection *)self collectionType];
  NSUInteger v4 = [(HKInspectableValueCollection *)self collection];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKInspectableValueCollection)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKInspectableValueCollection;
  unint64_t v5 = [(HKInspectableValueCollection *)&v17 init];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    int v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CollectionKey"];
    collection = v5->_collection;
    v5->_collection = (NSArray *)v9;

    v5->_int64_t collectionType = [v4 decodeIntegerForKey:@"CollectionTypeKey"];
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ElementTagsKey"];
    elementTags = v5->_elementTags;
    v5->_elementTags = (NSArray *)v14;

    [(HKInspectableValueCollection *)v5 _assertCollectionType];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  collection = self->_collection;
  id v5 = a3;
  [v5 encodeObject:collection forKey:@"CollectionKey"];
  [v5 encodeInteger:self->_collectionType forKey:@"CollectionTypeKey"];
  [v5 encodeObject:self->_elementTags forKey:@"ElementTagsKey"];
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKConceptIndexKeyPath conceptIndexKeyPathWithFullKeyPath:v6 error:a4];
  int v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 head];
    int v10 = [v9 isEqualToString:@"inspectableValue"];

    if (v10)
    {
      uint64_t v11 = [(HKInspectableValueCollection *)self inspectableValue];
LABEL_10:
      v18 = (void *)v11;
      v19 = [v8 tail];
      uint64_t v20 = +[HKConceptIndexUtilities medicalCodingCollectionForIndexableObject:v18 keyPath:v19 error:a4];

      goto LABEL_13;
    }
    v12 = [v8 head];
    int v13 = [v12 isEqualToString:@"min"];

    if (v13)
    {
      uint64_t v11 = [(HKInspectableValueCollection *)self min];
      goto LABEL_10;
    }
    uint64_t v14 = [v8 head];
    int v15 = [v14 isEqualToString:@"max"];

    if (v15)
    {
      uint64_t v11 = [(HKInspectableValueCollection *)self max];
      goto LABEL_10;
    }
    v16 = [v8 head];
    int v17 = [v16 isEqualToString:@"inspectableValues"];

    if (v17)
    {
      uint64_t v11 = [(HKInspectableValueCollection *)self inspectableValues];
      goto LABEL_10;
    }
    +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v6 inClass:objc_opt_class()];
  }
  uint64_t v20 = 0;
LABEL_13:

  return v20;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = +[HKConceptIndexKeyPath conceptIndexKeyPathWithFullKeyPath:v9 error:a5];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_12;
  }
  v12 = [v10 head];
  int v13 = [v12 isEqualToString:@"inspectableValue"];

  if (!v13)
  {
    int v15 = [v11 head];
    int v16 = [v15 isEqualToString:@"min"];

    if (v16)
    {
      uint64_t v14 = [(HKInspectableValueCollection *)self min];
      goto LABEL_10;
    }
    int v17 = [v11 head];
    int v18 = [v17 isEqualToString:@"max"];

    if (v18)
    {
      uint64_t v14 = [(HKInspectableValueCollection *)self max];
      goto LABEL_10;
    }
    v19 = [v11 head];
    int v20 = [v19 isEqualToString:@"inspectableValues"];

    if (v20)
    {
      uint64_t v14 = [(HKInspectableValueCollection *)self inspectableValues];
      goto LABEL_10;
    }
    +[HKConceptIndexUtilities assignError:a5 forInvalidKeyPath:v9 inClass:objc_opt_class()];
LABEL_12:
    BOOL v23 = 0;
    goto LABEL_13;
  }
  uint64_t v14 = [(HKInspectableValueCollection *)self inspectableValue];
LABEL_10:
  v21 = (void *)v14;
  uint64_t v22 = [v11 tail];
  BOOL v23 = +[HKConceptIndexUtilities applyConcepts:v8 toIndexableObject:v21 keyPath:v22 error:a5];

LABEL_13:
  return v23;
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (NSArray)collection
{
  return self->_collection;
}

- (NSArray)elementTags
{
  return self->_elementTags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementTags, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end