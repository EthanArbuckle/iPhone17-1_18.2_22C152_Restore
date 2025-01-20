@interface SGTokenJoiningTransformer
+ (id)withSeparator:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSGTokenJoiningTransformer:(id)a3;
- (NSString)separator;
- (SGTokenJoiningTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (SGTokenJoiningTransformer)initWithSeparator:(id)a3;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
- (void)setSeparator:(id)a3;
@end

@implementation SGTokenJoiningTransformer

- (void).cxx_destruct
{
}

- (void)setSeparator:(id)a3
{
}

- (NSString)separator
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  return [(NSString *)self->_separator hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGTokenJoiningTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGTokenJoiningTransformer *)self isEqualToSGTokenJoiningTransformer:v5];

  return v6;
}

- (BOOL)isEqualToSGTokenJoiningTransformer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(SGTokenJoiningTransformer *)self separator];
    BOOL v6 = [v4 separator];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      v7 = [(SGTokenJoiningTransformer *)self separator];
      v8 = [v4 separator];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (SGTokenJoiningTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  BOOL v6 = objc_msgSend(a3, "objectForKeyedSubscript:", @"SEPARATOR", a4, a5);
  v7 = [(SGTokenJoiningTransformer *)self initWithSeparator:v6];

  return v7;
}

- (id)toPlistWithChunks:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  separator = self->_separator;
  BOOL v6 = @"SEPARATOR";
  v7[0] = separator;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return v4;
}

- (id)transform:(id)a3
{
  id v5 = a3;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    char v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"SGTokenJoiningTransformer.m", 40, @"Unexpected input: %@. %@ requires an NSArray.", v5, v10 object file lineNumber description];
  }
  BOOL v6 = objc_msgSend(v5, "_pas_componentsJoinedByString:", self->_separator);

  return v6;
}

- (SGTokenJoiningTransformer)initWithSeparator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGTokenJoiningTransformer;
  BOOL v6 = [(SGTokenJoiningTransformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_separator, a3);
  }

  return v7;
}

+ (id)withSeparator:(id)a3
{
  id v3 = a3;
  id v4 = [[SGTokenJoiningTransformer alloc] initWithSeparator:v3];

  return v4;
}

@end