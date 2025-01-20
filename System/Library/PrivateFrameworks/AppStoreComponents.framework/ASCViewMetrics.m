@interface ASCViewMetrics
+ (BOOL)supportsSecureCoding;
- (ASCViewMetrics)initWithCoder:(id)a3;
- (ASCViewMetrics)initWithInstructions:(id)a3 pageFields:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)instructions;
- (NSDictionary)pageFields;
- (id)dataForInvocationPoint:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCViewMetrics

- (ASCViewMetrics)initWithInstructions:(id)a3 pageFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCViewMetrics;
  v8 = [(ASCViewMetrics *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    instructions = v8->_instructions;
    v8->_instructions = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    pageFields = v8->_pageFields;
    v8->_pageFields = (NSDictionary *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCViewMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"instructions"];
  if (v8)
  {
    uint64_t v9 = ASCMetricsFieldsDecodeForKey(v4, @"pageFields");
    if (v9)
    {
      self = [(ASCViewMetrics *)self initWithInstructions:v8 pageFields:v9];
      v10 = self;
    }
    else
    {
      BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v19) {
        -[ASCViewMetrics initWithCoder:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
      v10 = 0;
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[ASCViewMetrics initWithCoder:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCViewMetrics *)self instructions];
  [v4 encodeObject:v5 forKey:@"instructions"];

  id v6 = [(ASCViewMetrics *)self pageFields];
  [v4 encodeObject:v6 forKey:@"pageFields"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCViewMetrics *)self instructions];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCViewMetrics *)self pageFields];
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
    v8 = [(ASCViewMetrics *)self instructions];
    uint64_t v9 = [v7 instructions];
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
      BOOL v11 = [(ASCViewMetrics *)self pageFields];
      uint64_t v12 = [v7 pageFields];
      uint64_t v13 = (void *)v12;
      if (v11 && v12) {
        char v14 = [v11 isEqual:v12];
      }
      else {
        char v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    char v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCViewMetrics *)self instructions];
  [(ASCDescriber *)v3 addObject:v4 withName:@"instructions"];

  id v5 = [(ASCViewMetrics *)self pageFields];
  [(ASCDescriber *)v3 addSensitiveObject:v5 withName:@"pageFields"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (id)dataForInvocationPoint:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v6 = [(ASCViewMetrics *)self instructions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 invocationPoints];
        int v13 = [v12 containsObject:v4];

        if (v13)
        {
          char v14 = [v11 data];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v15 = (void *)[v5 copy];

  return v15;
}

- (NSArray)instructions
{
  return self->_instructions;
}

- (NSDictionary)pageFields
{
  return self->_pageFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageFields, 0);

  objc_storeStrong((id *)&self->_instructions, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end