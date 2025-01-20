@interface SGPipelineTransformer
+ (id)withTransformers:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPipelineTransformer:(id)a3;
- (NSArray)transformers;
- (SGPipelineTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (SGPipelineTransformer)initWithTransformers:(id)a3;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (id)transform:(id)a3 stopAfterTransformerWithIndex:(unint64_t)a4;
- (unint64_t)hash;
- (void)setTransformers:(id)a3;
@end

@implementation SGPipelineTransformer

- (void).cxx_destruct
{
}

- (void)setTransformers:(id)a3
{
}

- (NSArray)transformers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(SGPipelineTransformer *)self transformers];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGPipelineTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPipelineTransformer *)self isEqualToPipelineTransformer:v5];

  return v6;
}

- (BOOL)isEqualToPipelineTransformer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(SGPipelineTransformer *)self transformers];
    BOOL v6 = [v4 transformers];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      v7 = [(SGPipelineTransformer *)self transformers];
      v8 = [v4 transformers];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (SGPipelineTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x263F61970];
  id v11 = a3;
  id v12 = [v10 alloc];
  v13 = (void *)[v12 initWithClassNameKey:*MEMORY[0x263F61990]];
  v14 = [v11 objectForKeyedSubscript:@"TRANSFORMERS"];

  v21 = v13;
  v22 = v8;
  v23 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v13;
  v18 = sgMap();
  v19 = [(SGPipelineTransformer *)self initWithTransformers:v18];

  return v19;
}

uint64_t __54__SGPipelineTransformer_initWithPlist_chunks_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) readObjectWithPlist:a2 chunks:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (id)toPlistWithChunks:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F61970]);
  BOOL v6 = (void *)[v5 initWithClassNameKey:*MEMORY[0x263F61990]];
  v7 = [(SGPipelineTransformer *)self transformers];
  v13 = v6;
  v14 = v4;
  id v8 = v4;
  id v9 = v6;
  v10 = sgMap();

  id v15 = @"TRANSFORMERS";
  v16[0] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  return v11;
}

uint64_t __43__SGPipelineTransformer_toPlistWithChunks___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeToPlistWithObject:a2 andChunks:*(void *)(a1 + 40)];
}

- (id)transform:(id)a3 stopAfterTransformerWithIndex:(unint64_t)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__261;
  id v15 = __Block_byref_object_dispose__262;
  id v6 = a3;
  id v16 = v6;
  v7 = [(SGPipelineTransformer *)self transformers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__SGPipelineTransformer_transform_stopAfterTransformerWithIndex___block_invoke;
  v10[3] = &unk_2647EA458;
  v10[4] = &v11;
  v10[5] = a4;
  [v7 enumerateObjectsUsingBlock:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __65__SGPipelineTransformer_transform_stopAfterTransformerWithIndex___block_invoke(uint64_t result, void *a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) >= a3)
  {
    uint64_t v4 = result;
    *(void *)(*(void *)(*(void *)(v4 + 32) + 8) + 40) = [a2 transform:*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40)];
    return MEMORY[0x270F9A758]();
  }
  else if (a4)
  {
    *a4 = 1;
  }
  return result;
}

- (id)transform:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__261;
  uint64_t v13 = __Block_byref_object_dispose__262;
  id v4 = a3;
  id v14 = v4;
  id v5 = [(SGPipelineTransformer *)self transformers];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SGPipelineTransformer_transform___block_invoke;
  v8[3] = &unk_2647EA430;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __35__SGPipelineTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 transform:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  return MEMORY[0x270F9A758]();
}

- (SGPipelineTransformer)initWithTransformers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGPipelineTransformer;
  id v5 = [(SGPipelineTransformer *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(SGPipelineTransformer *)v5 setTransformers:v4];
  }

  return v6;
}

+ (id)withTransformers:(id)a3
{
  id v3 = a3;
  id v4 = [[SGPipelineTransformer alloc] initWithTransformers:v3];

  return v4;
}

@end