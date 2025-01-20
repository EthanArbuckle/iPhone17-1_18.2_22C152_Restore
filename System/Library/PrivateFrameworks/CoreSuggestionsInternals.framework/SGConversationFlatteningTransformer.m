@interface SGConversationFlatteningTransformer
+ (id)withPerMessageTransformer:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationFlatteningTransformer:(id)a3;
- (SGConversationFlatteningTransformer)initWithPerMessageTransformer:(id)a3;
- (SGConversationFlatteningTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
@end

@implementation SGConversationFlatteningTransformer

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(PMLTransformerProtocol *)self->_perMessageTranformer hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGConversationFlatteningTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGConversationFlatteningTransformer *)self isEqualToConversationFlatteningTransformer:v5];

  return v6;
}

- (BOOL)isEqualToConversationFlatteningTransformer:(id)a3
{
  v4 = a3;
  if (v4)
  {
    v5 = self->_perMessageTranformer;
    BOOL v6 = v5;
    if (v5 == (PMLTransformerProtocol *)v4[1]) {
      char v7 = 1;
    }
    else {
      char v7 = -[PMLTransformerProtocol isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (SGConversationFlatteningTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F93838];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = (void *)[v12 initWithClassNameKey:*MEMORY[0x1E4F93868]];
  v14 = [v11 objectForKeyedSubscript:@"PER_MESSAGE_TRANSFORMER"];

  v15 = [v13 readObjectWithPlist:v14 chunks:v10 context:v9];

  v16 = [(SGConversationFlatteningTransformer *)self initWithPerMessageTransformer:v15];
  return v16;
}

- (id)toPlistWithChunks:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F93838];
  id v5 = a3;
  id v6 = [v4 alloc];
  char v7 = (void *)[v6 initWithClassNameKey:*MEMORY[0x1E4F93868]];
  id v11 = @"PER_MESSAGE_TRANSFORMER";
  v8 = [v7 writeToPlistWithObject:self->_perMessageTranformer andChunks:v5];

  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  return v9;
}

- (id)transform:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    [v38 handleFailureInMethod:a2, self, @"SGConversationFlatteningTransformer.m", 47, @"Unexpected input type for %@: %@, ", v4, v40 object file lineNumber description];
  }
  id v5 = [v4 objectForKeyedSubscript:@"INPUT_CONVERSATION"];
  v41 = v4;
  id v6 = [v4 objectForKeyedSubscript:@"SG_MODEL_INPUT_TARGET_MESSAGE_INDEX"];
  char v7 = objc_opt_new();
  v45 = v6;
  v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "integerValue"));
  id v9 = [v8 message];
  char v42 = [v9 senderIsAccountOwner];

  int v10 = [v5 count];
  if (v10 <= 3) {
    int v11 = 3;
  }
  else {
    int v11 = v10;
  }
  unint64_t v12 = (v11 - 3);
  if ([v5 count] > v12)
  {
    v43 = v5;
    do
    {
      uint64_t v13 = MEMORY[0x1CB79B230]();
      v14 = [v5 objectAtIndexedSubscript:v12];
      uint64_t v15 = [v14 text];

      v16 = [v5 objectAtIndexedSubscript:v12];
      v17 = [v16 message];
      char v18 = [v17 senderIsAccountOwner];

      id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v54 = @"INPUT_TEXT";
      v55[0] = v15;
      v46 = (void *)v15;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
      v21 = (void *)[v19 initWithDictionary:v20];

      context = (void *)v13;
      v48 = v21;
      if (v12 == [v45 intValue])
      {
        v22 = [v41 objectForKeyedSubscript:@"DD_MATCHES"];
        [v21 setObject:v22 forKeyedSubscript:@"DD_MATCHES"];

        v23 = [v41 objectForKeyedSubscript:@"TARGET_MATCH"];
        [v21 setObject:v23 forKeyedSubscript:@"TARGET_MATCH"];

        v24 = [v41 objectForKeyedSubscript:@"SG_MODEL_INPUT_TARGET_RANGE"];
        [v21 setObject:v24 forKeyedSubscript:@"SG_MODEL_INPUT_TARGET_RANGE"];
      }
      else
      {
        v25 = [v5 objectAtIndexedSubscript:v12];
        v26 = [v25 detectedData];
        [v21 setObject:v26 forKeyedSubscript:@"DD_MATCHES"];

        [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SG_MODEL_DISABLE_TARGET_MAPPING"];
      }
      v27 = [(PMLTransformerProtocol *)self->_perMessageTranformer transform:v21];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        char v31 = v42 ^ v18;
        uint64_t v32 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v50 != v32) {
              objc_enumerationMutation(v28);
            }
            uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x1CB79B230]();
            if (v31)
            {
              [v7 addObject:v34];
            }
            else
            {
              v36 = [@"SG_FEATURE_TARGET_SENT__" stringByAppendingString:v34];
              [v7 addObject:v36];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v30);
      }

      [v7 addObject:@"SG_FEATURE_END_OF_MESSAGE"];
      ++v12;
      id v5 = v43;
    }
    while ([v43 count] > v12);
  }

  return v7;
}

- (SGConversationFlatteningTransformer)initWithPerMessageTransformer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGConversationFlatteningTransformer;
  id v6 = [(SGConversationFlatteningTransformer *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_perMessageTranformer, a3);
  }

  return v7;
}

+ (id)withPerMessageTransformer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPerMessageTransformer:v4];

  return v5;
}

@end