@interface LNCompoundPropertyQuery
+ (BOOL)supportsSecureCoding;
+ (id)andComparisons:(id)a3;
+ (id)orComparisons:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LNCompoundPropertyQuery)initWithCoder:(id)a3;
- (LNCompoundPropertyQuery)initWithType:(unint64_t)a3 comparisons:(id)a4;
- (NSArray)comparisons;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNCompoundPropertyQuery

- (void).cxx_destruct
{
}

- (NSArray)comparisons
{
  return self->_comparisons;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_comparisons forKey:@"comparisons"];
}

- (LNCompoundPropertyQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"comparisons"];

  if (v9)
  {
    self = [(LNCompoundPropertyQuery *)self initWithType:v5 comparisons:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(LNCompoundPropertyQuery *)self comparisons];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(LNCompoundPropertyQuery *)self type] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNCompoundPropertyQuery *)a3;
  unint64_t v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [(LNCompoundPropertyQuery *)self comparisons];
        uint64_t v8 = [v7 count];
        v9 = [(LNCompoundPropertyQuery *)v6 comparisons];
        uint64_t v10 = [v9 count];

        if (v8 != v10)
        {
          char v13 = 0;
          goto LABEL_10;
        }
        v11 = [(LNCompoundPropertyQuery *)self comparisons];
        v12 = [(LNCompoundPropertyQuery *)v6 comparisons];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
        v11 = v6;
        v6 = 0;
      }
    }
    else
    {
      v11 = 0;
      char v13 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  char v13 = 1;
LABEL_11:

  return v13;
}

- (id)description
{
  v3 = (void *)[@"<" mutableCopy];
  uint64_t v4 = [(LNCompoundPropertyQuery *)self comparisons];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __38__LNCompoundPropertyQuery_description__block_invoke;
  v11 = &unk_1E590D898;
  id v12 = v3;
  char v13 = self;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

uint64_t __38__LNCompoundPropertyQuery_description__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(a1 + 32) appendFormat:@"%@", a2];
  id v5 = [*(id *)(a1 + 40) comparisons];
  unint64_t v6 = [v5 count] - 1;

  uint64_t v7 = *(void **)(a1 + 32);
  if (v6 <= a3)
  {
    id v12 = *(void **)(a1 + 32);
    return [v12 appendString:@">"];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = [v8 type];
      uint64_t v10 = @"OR";
      if (!v9) {
        uint64_t v10 = @"AND";
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    return [v7 appendFormat:@" %@ ", v10];
  }
}

- (LNCompoundPropertyQuery)initWithType:(unint64_t)a3 comparisons:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNCompoundPropertyQuery;
  uint64_t v7 = [(LNPropertyQuery *)&v12 _init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_unint64_t type = a3;
    uint64_t v9 = [v6 copy];
    comparisons = v8->_comparisons;
    v8->_comparisons = (NSArray *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)orComparisons:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithType:1 comparisons:v4];

  return v5;
}

+ (id)andComparisons:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithType:0 comparisons:v4];

  return v5;
}

@end