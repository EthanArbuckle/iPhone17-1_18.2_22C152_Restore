@interface SGSelectiveTransformer
+ (id)withTransformer:(id)a3 appliedToInputKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSGSelectiveTransformer:(id)a3;
- (NSString)inputKey;
- (PMLTransformerProtocol)transformer;
- (SGSelectiveTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (SGSelectiveTransformer)initWithTransformer:(id)a3 appliedToInputKey:(id)a4;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
- (void)setInputKey:(id)a3;
- (void)setTransformer:(id)a3;
@end

@implementation SGSelectiveTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputKey, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

- (void)setInputKey:(id)a3
{
}

- (NSString)inputKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransformer:(id)a3
{
}

- (PMLTransformerProtocol)transformer
{
  return (PMLTransformerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(SGSelectiveTransformer *)self transformer];
  uint64_t v4 = [v3 hash];

  v5 = [(SGSelectiveTransformer *)self inputKey];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGSelectiveTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSelectiveTransformer *)self isEqualToSGSelectiveTransformer:v5];

  return v6;
}

- (BOOL)isEqualToSGSelectiveTransformer:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(SGSelectiveTransformer *)self transformer];
    v8 = [v6 transformer];
    if (v7 == v8
      || ([(SGSelectiveTransformer *)self transformer],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 transformer],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v10 = [(SGSelectiveTransformer *)self inputKey];
      uint64_t v11 = [v6 inputKey];
      if (v10 == (void *)v11)
      {

        char v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        v13 = [(SGSelectiveTransformer *)self inputKey];
        v14 = [v6 inputKey];
        char v9 = [v13 isEqual:v14];
      }
      if (v7 == v8) {
        goto LABEL_11;
      }
    }
    else
    {
      char v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char v9 = 0;
LABEL_12:

  return v9;
}

- (SGSelectiveTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F61970];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = (void *)[v12 initWithClassNameKey:*MEMORY[0x263F61990]];
  v14 = [v11 objectForKeyedSubscript:@"TRANSFORMER"];
  v15 = [v13 readObjectWithPlist:v14 chunks:v10 context:v9];

  v16 = [v11 objectForKeyedSubscript:@"INPUTKEY"];

  v17 = [(SGSelectiveTransformer *)self initWithTransformer:v15 appliedToInputKey:v16];
  return v17;
}

- (id)toPlistWithChunks:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)MEMORY[0x263F61970];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithClassNameKey:*MEMORY[0x263F61990]];
  v13[0] = @"TRANSFORMER";
  v8 = [(SGSelectiveTransformer *)self transformer];
  id v9 = [v7 writeToPlistWithObject:v8 andChunks:v5];

  v13[1] = @"INPUTKEY";
  v14[0] = v9;
  id v10 = [(SGSelectiveTransformer *)self inputKey];
  v14[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

- (id)transform:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(SGSelectiveTransformer *)self inputKey],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v6],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = [(SGSelectiveTransformer *)self inputKey];
    [v8 handleFailureInMethod:a2, self, @"SGSelectiveTransformer.m", 46, @"Unexpected input: %@. %@ requires dictionary with inputKey: %@.", v5, v10, v11 object file lineNumber description];
  }
  id v12 = (void *)[v5 mutableCopy];
  v13 = [(SGSelectiveTransformer *)self inputKey];
  v14 = [v5 objectForKeyedSubscript:v13];

  v15 = [(SGSelectiveTransformer *)self transformer];
  v16 = [v15 transform:v14];
  v17 = [(SGSelectiveTransformer *)self inputKey];
  [v12 setObject:v16 forKeyedSubscript:v17];

  return v12;
}

- (SGSelectiveTransformer)initWithTransformer:(id)a3 appliedToInputKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SGSelectiveTransformer;
  v8 = [(SGSelectiveTransformer *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(SGSelectiveTransformer *)v8 setTransformer:v6];
    [(SGSelectiveTransformer *)v9 setInputKey:v7];
  }

  return v9;
}

+ (id)withTransformer:(id)a3 appliedToInputKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SGSelectiveTransformer alloc] initWithTransformer:v6 appliedToInputKey:v5];

  return v7;
}

@end