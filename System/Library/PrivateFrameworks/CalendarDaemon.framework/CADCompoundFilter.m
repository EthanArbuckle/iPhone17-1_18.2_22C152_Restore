@interface CADCompoundFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)applicableToEntityType:(int)a3;
- (BOOL)validate;
- (CADCompoundFilter)initWithCoder:(id)a3;
- (CADCompoundFilter)initWithFilters:(id)a3 operation:(int64_t)a4;
- (NSArray)filters;
- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6;
- (int64_t)operation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADCompoundFilter

- (CADCompoundFilter)initWithFilters:(id)a3 operation:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADCompoundFilter;
  v7 = [(CADCompoundFilter *)&v11 init];
  if (v7)
  {
    if (![v6 count]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"filters must contain at least one value"];
    }
    uint64_t v8 = [v6 copy];
    filters = v7->_filters;
    v7->_filters = (NSArray *)v8;

    v7->_operation = a4;
  }

  return v7;
}

- (BOOL)validate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_filters count]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_filters;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "validate", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)applicableToEntityType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_filters;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "applicableToEntityType:", v3, (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (![(NSArray *)self->_filters count])
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"CADCompoundFilter.m" lineNumber:46 description:@"No filters"];
  }
  long long v14 = _CADPropertySearchPredicateExtendWhereClause(v11, a4, @"(");

  BOOL v15 = self->_operation != 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v16 = self->_filters;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    uint64_t v20 = 2;
    do
    {
      uint64_t v21 = 0;
      v22 = v14;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v21), "extendWhereClause:usingOperation:withValues:andTypes:", v22, v20, v12, v13, (void)v26);

        ++v21;
        uint64_t v20 = v15;
        v22 = v14;
      }
      while (v18 != v21);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v20 = v15;
    }
    while (v18);
  }

  v23 = _CADPropertySearchPredicateExtendWhereClause(v14, 2, @""));

  return v23;
}

- (CADCompoundFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADCompoundFilter;
  uint64_t v5 = [(CADFilter *)&v11 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = _CADPropertySearchPredicateGetAllowedFilterTypes();
  uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"filters"];
  filters = v5->_filters;
  v5->_filters = (NSArray *)v7;

  v5->_operation = [v4 decodeIntegerForKey:@"operation"];
  if (![(CADCompoundFilter *)v5 validate]) {
    BOOL v9 = 0;
  }
  else {
LABEL_3:
  }
    BOOL v9 = v5;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADCompoundFilter;
  id v4 = a3;
  [(CADFilter *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_filters, @"filters", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_operation forKey:@"operation"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)filters
{
  return self->_filters;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
}

@end