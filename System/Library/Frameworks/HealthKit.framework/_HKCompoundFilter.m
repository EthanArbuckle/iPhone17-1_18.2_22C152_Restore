@interface _HKCompoundFilter
+ (BOOL)supportsSecureCoding;
+ (id)andFilterWithSubfilters:(id)a3;
+ (id)compoundFilterWithFilter:(id)a3 otherFilter:(id)a4;
+ (id)notFilterWithSubfilter:(id)a3;
+ (id)orFilterWithSubfilters:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (BOOL)acceptsWorkoutActivity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)subfilters;
- (_HKCompoundFilter)init;
- (_HKCompoundFilter)initWithCoder:(id)a3;
- (_HKCompoundFilter)initWithType:(unint64_t)a3 subfilters:(id)a4;
- (id)description;
- (int64_t)acceptsActivitySummary:(id)a3;
- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5;
- (unint64_t)compoundPredicateType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKCompoundFilter

- (_HKCompoundFilter)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"subfilters"];

  uint64_t v8 = [v5 decodeIntegerForKey:@"compoundType"];
  v9 = [(_HKCompoundFilter *)self initWithType:v8 subfilters:v7];

  return v9;
}

- (void).cxx_destruct
{
}

- (NSArray)subfilters
{
  return self->_subfilters;
}

- (BOOL)acceptsDataObject:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_subfilterCount)
  {
LABEL_29:
    LOBYTE(v11) = 1;
    goto LABEL_30;
  }
  unint64_t compoundPredicateType = self->_compoundPredicateType;
  switch(compoundPredicateType)
  {
    case 0uLL:
      v6 = [(NSArray *)self->_subfilters firstObject];
      int v11 = [(NSArray *)v6 acceptsDataObject:v4] ^ 1;
LABEL_27:

      goto LABEL_30;
    case 2uLL:
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v12 = self->_subfilters;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "acceptsDataObject:", v4, (void)v19))
            {

              goto LABEL_29;
            }
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      break;
    case 1uLL:
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v6 = self->_subfilters;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        while (2)
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            if (![*(id *)(*((void *)&v23 + 1) + 8 * j) acceptsDataObject:v4])
            {
              LOBYTE(v11) = 0;
              goto LABEL_27;
            }
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v11) = 1;
      goto LABEL_27;
    default:
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"-[_HKCompoundFilter acceptsDataObject:]"];
      [(NSArray *)v12 handleFailureInFunction:v17 file:@"_HKCompoundFilter.m" lineNumber:114 description:@"Unreachable code has been executed"];

      break;
  }

  LOBYTE(v11) = 0;
LABEL_30:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCompoundFilter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (_HKCompoundFilter)initWithType:(unint64_t)a3 subfilters:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (a3 >= 3)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_HKCompoundFilter.m", 46, @"Invalid parameter not satisfying: %@", @"_IsValidCompoundType(type)" object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  if (!a3 && (unint64_t)[v7 count] >= 2)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_HKCompoundFilter.m", 47, @"Invalid parameter not satisfying: %@", @"type != NSNotPredicateType || subfilters.count <= 1" object file lineNumber description];
    goto LABEL_9;
  }
LABEL_4:
  v14.receiver = self;
  v14.super_class = (Class)_HKCompoundFilter;
  uint64_t v9 = [(_HKCompoundFilter *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    subfilters = v9->_subfilters;
    v9->_subfilters = (NSArray *)v10;

    v9->_subfilterCount = [(NSArray *)v9->_subfilters count];
    v9->_unint64_t compoundPredicateType = a3;
  }

  return v9;
}

+ (id)compoundFilterWithFilter:(id)a3 otherFilter:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = [_HKCompoundFilter alloc];
    v13[0] = v5;
    v13[1] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    uint64_t v10 = [(_HKCompoundFilter *)v8 initWithType:1 subfilters:v9];
  }
  else
  {
    if (v5) {
      int v11 = v5;
    }
    else {
      int v11 = v6;
    }
    uint64_t v10 = v11;
  }

  return v10;
}

+ (id)andFilterWithSubfilters:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[_HKCompoundFilter alloc] initWithType:1 subfilters:v3];

  return v4;
}

+ (id)orFilterWithSubfilters:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[_HKCompoundFilter alloc] initWithType:2 subfilters:v3];

  return v4;
}

+ (id)notFilterWithSubfilter:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [_HKCompoundFilter alloc];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  id v6 = [(_HKCompoundFilter *)v4 initWithType:0 subfilters:v5];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = HKStringFromCompoundOperatorType(self->_compoundPredicateType);
  id v6 = [(NSArray *)self->_subfilters componentsJoinedByString:@", "];
  id v7 = [v3 stringWithFormat:@"<%@: %@ [%@]>", v4, v5, v6];

  return v7;
}

- (int64_t)acceptsActivitySummary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_subfilterCount)
  {
LABEL_31:
    int64_t v15 = 1;
    goto LABEL_36;
  }
  unint64_t compoundPredicateType = self->_compoundPredicateType;
  if (compoundPredicateType)
  {
    if (compoundPredicateType == 2)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v6 = self->_subfilters;
      uint64_t v16 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        LOBYTE(v19) = 1;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v6);
            }
            uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "acceptsActivitySummary:", v4, (void)v27);
            if (v21 == 1)
            {

              goto LABEL_31;
            }
            int v19 = (v21 == 2) & v19;
          }
          uint64_t v17 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v17) {
            continue;
          }
          break;
        }

        if (!v19) {
          goto LABEL_35;
        }
        goto LABEL_29;
      }
LABEL_28:

LABEL_29:
      int64_t v15 = 2;
      goto LABEL_36;
    }
    if (compoundPredicateType == 1)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = self->_subfilters;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v32;
        LOBYTE(v10) = 1;
LABEL_7:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v31 + 1) + 8 * v11) acceptsActivitySummary:v4];
          if (!v12) {
            goto LABEL_34;
          }
          int v10 = (v12 == 2) & v10;
          if (v8 == ++v11)
          {
            uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
            if (v8) {
              goto LABEL_7;
            }

            if (v10) {
              goto LABEL_29;
            }
            goto LABEL_31;
          }
        }
      }
      goto LABEL_28;
    }
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v22 = [NSString stringWithUTF8String:"-[_HKCompoundFilter acceptsActivitySummary:]"];
    long long v23 = v6;
    long long v24 = v22;
    uint64_t v25 = 162;
LABEL_33:
    [(NSArray *)v23 handleFailureInFunction:v24 file:@"_HKCompoundFilter.m" lineNumber:v25 description:@"Unreachable code has been executed"];

LABEL_34:
LABEL_35:
    int64_t v15 = 0;
    goto LABEL_36;
  }
  uint64_t v13 = [(NSArray *)self->_subfilters firstObject];
  unint64_t v14 = [v13 acceptsActivitySummary:v4];

  if (v14 >= 3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v22 = [NSString stringWithUTF8String:"-[_HKCompoundFilter acceptsActivitySummary:]"];
    long long v23 = v6;
    long long v24 = v22;
    uint64_t v25 = 159;
    goto LABEL_33;
  }
  int64_t v15 = qword_19C3D4EF8[v14];
LABEL_36:

  return v15;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!self->_subfilterCount) {
    return 1;
  }
  unint64_t compoundPredicateType = self->_compoundPredicateType;
  if (compoundPredicateType)
  {
    if (compoundPredicateType == 2)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v9 = self->_subfilters;
      uint64_t v19 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        LOBYTE(v22) = 1;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v9);
            }
            uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", a3, a4, a5, (void)v29);
            if (v24 == 1)
            {

              return 1;
            }
            int v22 = (v24 == 2) & v22;
          }
          uint64_t v20 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v20) {
            continue;
          }
          break;
        }

        if (!v22) {
          return 0;
        }
        return 2;
      }
LABEL_28:

      return 2;
    }
    if (compoundPredicateType == 1)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v9 = self->_subfilters;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v34;
        LOBYTE(v13) = 1;
LABEL_7:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = [*(id *)(*((void *)&v33 + 1) + 8 * v14) acceptsDataObjectWithStartTimestamp:a3 endTimestamp:a4 valueInCanonicalUnit:a5];
          if (!v15) {
            goto LABEL_34;
          }
          int v13 = (v15 == 2) & v13;
          if (v11 == ++v14)
          {
            uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
            if (v11) {
              goto LABEL_7;
            }

            if (v13) {
              return 2;
            }
            return 1;
          }
        }
      }
      goto LABEL_28;
    }
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"-[_HKCompoundFilter acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:]"];
    long long v26 = v9;
    long long v27 = v25;
    uint64_t v28 = 210;
  }
  else
  {
    uint64_t v16 = [(NSArray *)self->_subfilters firstObject];
    unint64_t v17 = [v16 acceptsDataObjectWithStartTimestamp:a3 endTimestamp:a4 valueInCanonicalUnit:a5];

    if (v17 < 3) {
      return qword_19C3D4EF8[v17];
    }
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"-[_HKCompoundFilter acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:]"];
    long long v26 = v9;
    long long v27 = v25;
    uint64_t v28 = 207;
  }
  [(NSArray *)v26 handleFailureInFunction:v27 file:@"_HKCompoundFilter.m" lineNumber:v28 description:@"Unreachable code has been executed"];

LABEL_34:
  return 0;
}

- (BOOL)acceptsWorkoutActivity:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_subfilterCount)
  {
LABEL_29:
    LOBYTE(v11) = 1;
    goto LABEL_30;
  }
  unint64_t compoundPredicateType = self->_compoundPredicateType;
  switch(compoundPredicateType)
  {
    case 0uLL:
      id v6 = [(NSArray *)self->_subfilters firstObject];
      int v11 = [(NSArray *)v6 acceptsWorkoutActivity:v4] ^ 1;
LABEL_27:

      goto LABEL_30;
    case 2uLL:
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v12 = self->_subfilters;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "acceptsWorkoutActivity:", v4, (void)v19))
            {

              goto LABEL_29;
            }
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      break;
    case 1uLL:
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = self->_subfilters;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        while (2)
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            if (![*(id *)(*((void *)&v23 + 1) + 8 * j) acceptsWorkoutActivity:v4])
            {
              LOBYTE(v11) = 0;
              goto LABEL_27;
            }
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v11) = 1;
      goto LABEL_27;
    default:
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v17 = [NSString stringWithUTF8String:"-[_HKCompoundFilter acceptsWorkoutActivity:]"];
      [(NSArray *)v12 handleFailureInFunction:v17 file:@"_HKCompoundFilter.m" lineNumber:243 description:@"Unreachable code has been executed"];

      break;
  }

  LOBYTE(v11) = 0;
LABEL_30:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HKCompoundFilter *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_compoundPredicateType == v4->_compoundPredicateType
      && (NSUInteger v5 = [(NSArray *)self->_subfilters count], v5 == [(NSArray *)v4->_subfilters count])
      && [(NSArray *)self->_subfilters isEqualToArray:v4->_subfilters];
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t compoundPredicateType = self->_compoundPredicateType;
  return [(NSArray *)self->_subfilters hash] ^ compoundPredicateType;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKCompoundFilter;
  id v4 = a3;
  [(_HKFilter *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_subfilters, @"subfilters", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_compoundPredicateType forKey:@"compoundType"];
}

- (unint64_t)compoundPredicateType
{
  return self->_compoundPredicateType;
}

@end