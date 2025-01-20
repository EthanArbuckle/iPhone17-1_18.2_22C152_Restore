@interface HDExtractionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDExtractionResult)initWithCoder:(id)a3;
- (HDExtractionResult)initWithItems:(id)a3;
- (NSArray)allUnits;
- (NSArray)items;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDExtractionResult

- (HDExtractionResult)initWithItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDExtractionResult;
  v5 = [(HDExtractionResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)allUnits
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_items;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "units", (void)v13);
        [v3 addObjectsFromArray:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    v10 = v3;
  }
  else {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDExtractionResult *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      items = self->_items;
      uint64_t v7 = [(HDExtractionResult *)v5 items];
      if (items == v7)
      {
        char v11 = 1;
      }
      else
      {
        uint64_t v8 = [(HDExtractionResult *)v5 items];
        if (v8)
        {
          objc_super v9 = self->_items;
          v10 = [(HDExtractionResult *)v5 items];
          char v11 = [(NSArray *)v9 isEqualToArray:v10];
        }
        else
        {
          char v11 = 0;
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_items hash];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p, %lu items>", v5, self, -[NSArray count](self->_items, "count")];

  return v6;
}

- (id)debugDescription
{
  id v3 = [(NSArray *)self->_items hk_map:&__block_literal_global_3];
  id v4 = [v3 componentsJoinedByString:@"\n\t"];

  uint64_t v5 = NSString;
  uint64_t v6 = [(HDExtractionResult *)self description];
  uint64_t v7 = [v5 stringWithFormat:@"<%@\n\t%@>", v6, v4];

  return v7;
}

uint64_t __38__HDExtractionResult_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugDescription];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExtractionResult)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  uint64_t v7 = [v5 decodeObjectOfClasses:v6 forKey:@"Items"];

  uint64_t v8 = [(HDExtractionResult *)self initWithItems:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end