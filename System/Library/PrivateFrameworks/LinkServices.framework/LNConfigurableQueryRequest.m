@interface LNConfigurableQueryRequest
+ (BOOL)supportsSecureCoding;
+ (NSSet)xpcClasses;
+ (id)queryTypes;
+ (id)targetTypes;
- (BOOL)isEqual:(id)a3;
- (LNConfigurableQueryRequest)initWithCoder:(id)a3;
- (LNConfigurableQueryRequest)initWithQueryType:(id)a3 target:(id)a4 options:(id)a5;
- (LNQueryRequestOptions)options;
- (LNQueryRequestTargetBase)target;
- (LNQueryRequestTypeBase)queryType;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConfigurableQueryRequest

+ (NSSet)xpcClasses
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v10 = [a1 queryTypes];
  [v9 unionSet:v10];

  v11 = [a1 targetTypes];
  [v9 unionSet:v11];

  v12 = (void *)[v9 copy];
  return (NSSet *)v12;
}

+ (id)targetTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)queryTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_queryType, 0);
}

- (LNQueryRequestOptions)options
{
  return self->_options;
}

- (LNQueryRequestTargetBase)target
{
  return self->_target;
}

- (LNQueryRequestTypeBase)queryType
{
  return self->_queryType;
}

- (LNConfigurableQueryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() queryTypes];
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:@"queryType"];

  uint64_t v7 = [(id)objc_opt_class() targetTypes];
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"target"];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];

  v10 = 0;
  if (v6 && v8)
  {
    self = [(LNConfigurableQueryRequest *)self initWithQueryType:v6 target:v8 options:v9];
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LNConfigurableQueryRequest *)self queryType];
  [v4 encodeObject:v5 forKey:@"queryType"];

  uint64_t v6 = [(LNConfigurableQueryRequest *)self target];
  [v4 encodeObject:v6 forKey:@"target"];

  id v7 = [(LNConfigurableQueryRequest *)self options];
  [v4 encodeObject:v7 forKey:@"options"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNConfigurableQueryRequest *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v7 = [(LNConfigurableQueryRequest *)self queryType];
    uint64_t v8 = [(LNConfigurableQueryRequest *)v6 queryType];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(LNConfigurableQueryRequest *)self target];
    v17 = [(LNConfigurableQueryRequest *)v6 target];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(LNConfigurableQueryRequest *)self options];
    v22 = [(LNConfigurableQueryRequest *)v6 options];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqual:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(LNQueryRequestTypeBase *)self->_queryType hash];
  uint64_t v4 = [(LNQueryRequestTargetBase *)self->_target hash] ^ v3;
  return v4 ^ [(LNQueryRequestOptions *)self->_options hash];
}

- (id)description
{
  uint64_t v3 = [(LNConfigurableQueryRequest *)self queryType];
  uint64_t v4 = [v3 description];

  uint64_t v5 = [(LNConfigurableQueryRequest *)self target];
  uint64_t v6 = [v5 description];

  id v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = [(LNConfigurableQueryRequest *)self options];
  v11 = [v7 stringWithFormat:@"<%@: %p, type: %@, target: %@, options: %@>", v9, self, v4, v6, v10];

  return v11;
}

- (LNConfigurableQueryRequest)initWithQueryType:(id)a3 target:(id)a4 options:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNConfigurableQueryRequest.m", 19, @"Invalid parameter not satisfying: %@", @"queryType" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"LNConfigurableQueryRequest.m", 20, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)LNConfigurableQueryRequest;
  v13 = [(LNConfigurableQueryRequest *)&v21 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queryType, a3);
    objc_storeStrong((id *)&v14->_target, a4);
    if (v12) {
      int v15 = (LNQueryRequestOptions *)v12;
    }
    else {
      int v15 = objc_alloc_init(LNQueryRequestOptions);
    }
    options = v14->_options;
    v14->_options = v15;

    v17 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end