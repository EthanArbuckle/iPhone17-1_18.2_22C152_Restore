@interface EARSpeechRecognition
+ (BOOL)supportsSecureCoding;
- (EARSpeechRecognition)initWithCoder:(id)a3;
- (EARSpeechRecognition)initWithRecognition:(id)a3;
- (NSArray)interpretationIndices;
- (NSArray)nBest;
- (NSArray)oneBest;
- (NSArray)tokenSausage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARSpeechRecognition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nBest, 0);
  objc_storeStrong((id *)&self->_oneBest, 0);
  objc_storeStrong((id *)&self->_interpretationIndices, 0);

  objc_storeStrong((id *)&self->_tokenSausage, 0);
}

- (NSArray)nBest
{
  return self->_nBest;
}

- (NSArray)oneBest
{
  return self->_oneBest;
}

- (NSArray)interpretationIndices
{
  return self->_interpretationIndices;
}

- (NSArray)tokenSausage
{
  return self->_tokenSausage;
}

- (EARSpeechRecognition)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EARSpeechRecognition;
  v5 = [(EARSpeechRecognition *)&v26 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tokenSausage"];
    tokenSausage = v5->_tokenSausage;
    v5->_tokenSausage = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"interpretationIndices"];
    interpretationIndices = v5->_interpretationIndices;
    v5->_interpretationIndices = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"nBest"];
    nBest = v5->_nBest;
    v5->_nBest = (NSArray *)v19;

    v21 = [(NSArray *)v5->_nBest firstObject];
    uint64_t v22 = [v21 copy];
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_oneBest, v24);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tokenSausage = self->_tokenSausage;
  id v5 = a3;
  [v5 encodeObject:tokenSausage forKey:@"tokenSausage"];
  [v5 encodeObject:self->_interpretationIndices forKey:@"interpretationIndices"];
  [v5 encodeObject:self->_nBest forKey:@"nBest"];
}

- (EARSpeechRecognition)initWithRecognition:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)EARSpeechRecognition;
  id v5 = [(EARSpeechRecognition *)&v31 init];
  if (v5)
  {
    v6 = [v4 tokenSausage];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke;
    v29[3] = &unk_1E6154EC0;
    id v30 = v7;
    id v8 = v7;
    [v6 enumerateObjectsUsingBlock:v29];
    uint64_t v9 = [v4 nBest];
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    objc_super v26 = __44__EARSpeechRecognition_initWithRecognition___block_invoke_4;
    v27 = &unk_1E6154EC0;
    id v28 = v10;
    id v11 = v10;
    [v9 enumerateObjectsUsingBlock:&v24];
    uint64_t v12 = objc_msgSend(v8, "copy", v24, v25, v26, v27);
    tokenSausage = v5->_tokenSausage;
    v5->_tokenSausage = (NSArray *)v12;

    uint64_t v14 = [v4 interpretationIndices];
    uint64_t v15 = [v14 copy];
    interpretationIndices = v5->_interpretationIndices;
    v5->_interpretationIndices = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    nBest = v5->_nBest;
    v5->_nBest = (NSArray *)v17;

    uint64_t v19 = [v11 firstObject];
    uint64_t v20 = [v19 copy];
    v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = (void *)v20;
    }
    else {
      uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_oneBest, v22);
  }
  return v5;
}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke_2;
  v9[3] = &unk_1E6154EC0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = (void *)[v6 copy];
  [v7 addObject:v8];
}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke_5;
  v9[3] = &unk_1E6154E98;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = (void *)[v6 copy];
  [v7 addObject:v8];
}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[EARSpeechRecognitionToken alloc] initWithToken:v3];

  [v2 addObject:v4];
}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke_3;
  v9[3] = &unk_1E6154E98;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = (void *)[v6 copy];
  [v7 addObject:v8];
}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[EARSpeechRecognitionToken alloc] initWithToken:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end