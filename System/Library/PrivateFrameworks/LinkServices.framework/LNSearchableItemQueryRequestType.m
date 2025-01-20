@interface LNSearchableItemQueryRequestType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNSearchableItemQueryRequestType)initWithCoder:(id)a3;
- (LNSearchableItemQueryRequestType)initWithSearchableItems:(id)a3;
- (NSArray)items;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSearchableItemQueryRequestType

- (void).cxx_destruct
{
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNSearchableItemQueryRequestType *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNSearchableItemQueryRequestType *)self items];
      v8 = [(LNSearchableItemQueryRequestType *)v6 items];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10)
        {
          v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
          v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
          char v12 = [v13 isEqualToSet:v14];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_items hash];
}

- (LNSearchableItemQueryRequestType)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"items"];

  if (v8)
  {
    self = [(LNSearchableItemQueryRequestType *)self initWithSearchableItems:v8];
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNSearchableItemQueryRequestType *)self items];
  [v4 encodeObject:v5 forKey:@"items"];
}

- (id)description
{
  return @"SearchableItemQuery";
}

- (LNSearchableItemQueryRequestType)initWithSearchableItems:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNQueryRequestConfiguration.m", 295, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNSearchableItemQueryRequestType;
  v7 = [(LNQueryRequestTypeBase *)&v12 _init];
  v8 = (LNSearchableItemQueryRequestType *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    id v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end