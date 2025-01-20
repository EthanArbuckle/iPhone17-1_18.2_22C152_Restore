@interface SGTextLabelTransformer
+ (id)_preprocessedLabelsWithLabels:(id)a3 andPreprocessor:(id)a4;
+ (id)withMethods:(id)a3 withLabelStrings:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextLabelTransformer:(id)a3;
- (SGTextLabelTransformer)initWithMethods:(id)a3 withLabelStrings:(id)a4;
- (SGTextLabelTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (SGTextLabelTransformer)initWithPreprocessor:(id)a3 labeler:(id)a4;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
@end

@implementation SGTextLabelTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeler, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(SGStringPreprocessingTransformer *)self->_preprocessor hash];
  return [(SGStringLabelingTransformer *)self->_labeler hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGTextLabelTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGTextLabelTransformer *)self isEqualToTextLabelTransformer:v5];

  return v6;
}

- (BOOL)isEqualToTextLabelTransformer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  preprocessor = self->_preprocessor;
  v7 = (SGStringPreprocessingTransformer *)*((id *)v4 + 1);
  if (preprocessor == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = preprocessor;
    BOOL v10 = [(SGStringPreprocessingTransformer *)v9 isEqual:v8];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_labeler;
  v13 = v12;
  if (v12 == (SGStringLabelingTransformer *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[SGStringLabelingTransformer isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (SGTextLabelTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F61970];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = (void *)[v12 initWithClassNameKey:*MEMORY[0x263F61990]];
  v14 = [v11 objectForKeyedSubscript:@"PREPROCESSOR"];
  v15 = [v13 readObjectWithPlist:v14 chunks:v10 context:v9];
  v16 = [v11 objectForKeyedSubscript:@"LABELER"];

  v17 = [v13 readObjectWithPlist:v16 chunks:v10 context:v9];

  v18 = [(SGTextLabelTransformer *)self initWithPreprocessor:v15 labeler:v17];
  return v18;
}

- (id)toPlistWithChunks:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F61970];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithClassNameKey:*MEMORY[0x263F61990]];
  v12[0] = @"PREPROCESSOR";
  v8 = [v7 writeToPlistWithObject:self->_preprocessor andChunks:v5];
  v12[1] = @"LABELER";
  v13[0] = v8;
  id v9 = [v7 writeToPlistWithObject:self->_labeler andChunks:v5];

  v13[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGTextLabelTransformer transform:]", "SGTextLabelTransformer.m", 71, "[input isKindOfClass:[NSString class]]");
  }
  labeler = self->_labeler;
  id v6 = [(SGStringPreprocessingTransformer *)self->_preprocessor transform:v4];
  v7 = [(SGStringLabelingTransformer *)labeler transform:v6];

  return v7;
}

- (SGTextLabelTransformer)initWithPreprocessor:(id)a3 labeler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGTextLabelTransformer.m", 43, @"Invalid parameter not satisfying: %@", @"preprocessor" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SGTextLabelTransformer.m", 44, @"Invalid parameter not satisfying: %@", @"labeler" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SGTextLabelTransformer;
  id v11 = [(SGTextLabelTransformer *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_preprocessor, a3);
    objc_storeStrong((id *)&v12->_labeler, a4);
  }

  return v12;
}

- (SGTextLabelTransformer)initWithMethods:(id)a3 withLabelStrings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGTextLabelTransformer.m", 31, @"Invalid parameter not satisfying: %@", @"methods" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SGTextLabelTransformer.m", 32, @"Invalid parameter not satisfying: %@", @"labels" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SGTextLabelTransformer;
  id v10 = [(SGTextLabelTransformer *)&v19 init];
  if (v10)
  {
    uint64_t v11 = +[SGStringPreprocessingTransformer withMethods:v7];
    preprocessor = v10->_preprocessor;
    v10->_preprocessor = (SGStringPreprocessingTransformer *)v11;

    v13 = +[SGTextLabelTransformer _preprocessedLabelsWithLabels:v9 andPreprocessor:v10->_preprocessor];
    uint64_t v14 = +[SGStringLabelingTransformer withLabelStrings:v13];
    labeler = v10->_labeler;
    v10->_labeler = (SGStringLabelingTransformer *)v14;
  }
  return v10;
}

+ (id)_preprocessedLabelsWithLabels:(id)a3 andPreprocessor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"SGTextLabelTransformer.m", 54, @"Invalid parameter not satisfying: %@", @"labels" object file lineNumber description];
  }
  uint64_t v9 = [v7 valueForKeyPath:@"@unionOfArrays.self"];
  if (!v9)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2 object:a1 file:@"SGTextLabelTransformer.m" lineNumber:56 description:@"SGTextLabelTransformer: Unexpected null value for flattened labels"];
  }
  v26 = (void *)v9;
  v27 = v8;
  id v10 = [v8 transformBatch:v9];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  if ([v7 count])
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      id v14 = objc_alloc(MEMORY[0x263EFF980]);
      v15 = [v7 objectAtIndexedSubscript:v13];
      objc_super v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

      v17 = [v7 objectAtIndexedSubscript:v13];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        unint64_t v19 = 0;
        do
        {
          v20 = [v10 objectAtIndexedSubscript:v12 + v19];
          [v16 addObject:v20];

          ++v19;
          v21 = [v7 objectAtIndexedSubscript:v13];
          unint64_t v22 = [v21 count];
        }
        while (v19 < v22);
        v12 += v19;
      }
      [v11 addObject:v16];

      ++v13;
    }
    while (v13 < [v7 count]);
  }

  return v11;
}

+ (id)withMethods:(id)a3 withLabelStrings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithMethods:v7 withLabelStrings:v6];

  return v8;
}

@end