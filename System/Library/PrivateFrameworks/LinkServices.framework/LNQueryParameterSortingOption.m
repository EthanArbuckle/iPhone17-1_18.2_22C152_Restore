@interface LNQueryParameterSortingOption
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNQueryParameterSortingOption)initWithCoder:(id)a3;
- (LNQueryParameterSortingOption)initWithOrder:(int64_t)a3 parameterIdentifier:(id)a4;
- (LNQueryParameterSortingOption)initWithOrder:(int64_t)a3 sortParameterIndex:(id)a4;
- (NSNumber)sortParameterIndex;
- (NSString)parameterIdentifier;
- (int64_t)order;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNQueryParameterSortingOption

- (void).cxx_destruct
{
}

- (NSNumber)sortParameterIndex
{
  return self->_sortParameterIndex;
}

- (int64_t)order
{
  return self->_order;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNQueryParameterSortingOption *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v7 = [(LNQueryParameterSortingOption *)self order];
        if (v7 != [(LNQueryParameterSortingOption *)v6 order])
        {
          char v13 = 0;
LABEL_16:

          goto LABEL_17;
        }
        v8 = [(LNQueryParameterSortingOption *)self sortParameterIndex];
        v9 = [(LNQueryParameterSortingOption *)v6 sortParameterIndex];
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
          char v13 = 1;
        }
        else
        {
          char v13 = 0;
          if (v10 && v11) {
            char v13 = [(LNQueryParameterSortingOption *)v10 isEqual:v11];
          }
        }
      }
      else
      {
        char v13 = 0;
        v10 = v6;
        v6 = 0;
      }
    }
    else
    {
      v10 = 0;
      char v13 = 0;
    }

    goto LABEL_16;
  }
  char v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = [(LNQueryParameterSortingOption *)self order];
  v4 = [(LNQueryParameterSortingOption *)self sortParameterIndex];
  unint64_t v5 = [v4 hash] + v3;

  return v5;
}

- (LNQueryParameterSortingOption)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"order"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortParameterIndex"];

  if (v6)
  {
    self = [(LNQueryParameterSortingOption *)self initWithOrder:v5 sortParameterIndex:v6];
    int64_t v7 = self;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNQueryParameterSortingOption order](self, "order"), @"order");
  id v5 = [(LNQueryParameterSortingOption *)self sortParameterIndex];
  [v4 encodeObject:v5 forKey:@"sortParameterIndex"];
}

- (LNQueryParameterSortingOption)initWithOrder:(int64_t)a3 sortParameterIndex:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNQueryParameterSortingOption.m", 18, @"Invalid parameter not satisfying: %@", @"sortParameterIndex" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNQueryParameterSortingOption;
  v9 = [(LNQueryParameterSortingOption *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_order = a3;
    objc_storeStrong((id *)&v9->_sortParameterIndex, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)parameterIdentifier
{
  return (NSString *)&stru_1EF7D9D20;
}

- (LNQueryParameterSortingOption)initWithOrder:(int64_t)a3 parameterIdentifier:(id)a4
{
  return [(LNQueryParameterSortingOption *)self initWithOrder:a3 sortParameterIndex:&unk_1EF7F4178];
}

@end