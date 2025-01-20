@interface ASCViewMetricsInstruction
+ (BOOL)supportsSecureCoding;
- (ASCMetricsData)data;
- (ASCViewMetricsInstruction)initWithCoder:(id)a3;
- (ASCViewMetricsInstruction)initWithData:(id)a3 invocationPoints:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)invocationPoints;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCViewMetricsInstruction

- (ASCViewMetricsInstruction)initWithData:(id)a3 invocationPoints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F3C4();
  v14.receiver = self;
  v14.super_class = (Class)ASCViewMetricsInstruction;
  v8 = [(ASCViewMetricsInstruction *)&v14 init];
  if (v8)
  {
    v9 = (ASCMetricsData *)[v6 copy];
    data = v8->_data;
    v8->_data = v9;

    v11 = (NSSet *)[v7 copy];
    invocationPoints = v8->_invocationPoints;
    v8->_invocationPoints = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCViewMetricsInstruction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSSet);
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"invocationPoints"];
    if (v9)
    {
      self = [(ASCViewMetricsInstruction *)self initWithData:v5 invocationPoints:v9];
      v10 = self;
    }
    else
    {
      BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v19) {
        sub_10013F6CC(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      v10 = 0;
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_10013F690(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCViewMetricsInstruction *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  id v6 = [(ASCViewMetricsInstruction *)self invocationPoints];
  [v4 encodeObject:v6 forKey:@"invocationPoints"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCViewMetricsInstruction *)self data];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCViewMetricsInstruction *)self invocationPoints];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(ASCViewMetricsInstruction *)self data];
    uint64_t v9 = [v7 data];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      BOOL v11 = [(ASCViewMetricsInstruction *)self invocationPoints];
      uint64_t v12 = [v7 invocationPoints];
      uint64_t v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v14 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    unsigned __int8 v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCViewMetricsInstruction *)self data];
  [(ASCDescriber *)v3 addObject:v4 withName:@"data"];

  id v5 = [(ASCViewMetricsInstruction *)self invocationPoints];
  [(ASCDescriber *)v3 addObject:v5 withName:@"invocationPoints"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (ASCMetricsData)data
{
  return self->_data;
}

- (NSSet)invocationPoints
{
  return self->_invocationPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationPoints, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end