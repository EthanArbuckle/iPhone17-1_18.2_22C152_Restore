@interface SGStringPreprocessingTransformer
+ (id)withMethods:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStringPreprocessingTransformer:(id)a3;
- (SEL)selectorForMethod:(id)a3 preprocessor:(id)a4;
- (SGStringPreprocessingTransformer)initWithMethods:(id)a3;
- (SGStringPreprocessingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (id)transformBatch:(id)a3;
- (unint64_t)hash;
- (void)applySelector:(SEL)a3 preprocesor:(id)a4 string:(id)a5 value:(id)a6;
@end

@implementation SGStringPreprocessingTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodSignatureWithValue, 0);
  objc_storeStrong((id *)&self->_methodSignatureNoValue, 0);
  objc_storeStrong((id *)&self->_methodValues, 0);
  objc_storeStrong((id *)&self->_methodNames, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_methodNames hash];
  return [(NSArray *)self->_methodValues hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGStringPreprocessingTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGStringPreprocessingTransformer *)self isEqualToStringPreprocessingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToStringPreprocessingTransformer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  methodNames = self->_methodNames;
  v7 = (NSArray *)*((id *)v4 + 1);
  if (methodNames == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = methodNames;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_methodValues;
  v13 = v12;
  if (v12 == (NSArray *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSArray isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (SGStringPreprocessingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  BOOL v6 = objc_msgSend(a3, "objectForKeyedSubscript:", @"METHODS", a4, a5);
  v7 = [(SGStringPreprocessingTransformer *)self initWithMethods:v6];

  return v7;
}

- (id)toPlistWithChunks:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  if ([(NSArray *)self->_methodNames count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [(NSArray *)self->_methodNames objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 rangeOfString:@":"];
      if (v9)
      {
        uint64_t v10 = v8;
        char v11 = (void *)MEMORY[0x22A66BDC0]();
        objc_msgSend(v7, "substringWithRange:", 0, v10);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = v7;
      }

      [v5 addObject:v12];
      v13 = [(NSArray *)self->_methodValues objectAtIndexedSubscript:v6];
      [v5 addObject:v13];

      ++v6;
    }
    while ([(NSArray *)self->_methodNames count] > v6);
  }
  v16 = @"METHODS";
  v17[0] = v5;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

  return v14;
}

- (void)applySelector:(SEL)a3 preprocesor:(id)a4 string:(id)a5 value:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v11 = (void (*)(id, SEL, id, id))[v12 methodForSelector:a3];
    if ([v10 length]) {
      v11(v12, a3, v9, v10);
    }
    else {
      ((void (*)(id, SEL, id))v11)(v12, a3, v9);
    }
  }
}

- (SEL)selectorForMethod:(id)a3 preprocessor:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = (NSString *)a3;
  id v6 = a4;
  SEL v7 = NSSelectorFromString(v5);
  if (!v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      id v9 = &_os_log_internal;
      id v10 = "SGStringPreprocessor error: NSSelectorFromString returned NULL";
      uint32_t v11 = 2;
      goto LABEL_9;
    }
LABEL_6:
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      v14 = v5;
      id v9 = &_os_log_internal;
      id v10 = "SGStringPreprocessor received an invalid method %@";
      uint32_t v11 = 12;
LABEL_9:
      _os_log_error_impl(&dword_226E32000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, v11);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (id)transformBatch:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  context = (void *)MEMORY[0x22A66BDC0]();
  v5 = objc_opt_new();
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "mutableCopy", context);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  if ([(NSArray *)self->_methodNames count])
  {
    uint64_t v13 = 0;
    do
    {
      v14 = -[NSArray objectAtIndexedSubscript:](self->_methodNames, "objectAtIndexedSubscript:", v13, context);
      uint64_t v15 = [(SGStringPreprocessingTransformer *)self selectorForMethod:v14 preprocessor:v5];

      uint64_t v24 = v13;
      v16 = [(NSArray *)self->_methodValues objectAtIndexedSubscript:v13];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v17 = v6;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            [(SGStringPreprocessingTransformer *)self applySelector:v15 preprocesor:v5 string:*(void *)(*((void *)&v25 + 1) + 8 * j) value:v16];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v19);
      }

      uint64_t v13 = v24 + 1;
    }
    while (v24 + 1 < [(NSArray *)self->_methodNames count]);
  }

  return v6;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGStringPreprocessingTransformer transform:]", "SGStringPreprocessingTransformer.m", 94, "[input isKindOfClass:[NSString class]]");
  }
  v5 = (void *)MEMORY[0x22A66BDC0]();
  id v6 = objc_opt_new();
  id v7 = (void *)[v4 mutableCopy];
  if ([(NSArray *)self->_methodNames count])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(NSArray *)self->_methodNames objectAtIndexedSubscript:v8];
      uint64_t v10 = [(SGStringPreprocessingTransformer *)self selectorForMethod:v9 preprocessor:v6];

      uint32_t v11 = [(NSArray *)self->_methodValues objectAtIndexedSubscript:v8];
      [(SGStringPreprocessingTransformer *)self applySelector:v10 preprocesor:v6 string:v7 value:v11];

      ++v8;
    }
    while (v8 < [(NSArray *)self->_methodNames count]);
  }

  return v7;
}

- (SGStringPreprocessingTransformer)initWithMethods:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    long long v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SGStringPreprocessingTransformer.m", 67, @"Invalid parameter not satisfying: %@", @"methods" object file lineNumber description];
  }
  if ([v5 count])
  {
    long long v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SGStringPreprocessingTransformer.m", 68, @"Invalid parameter not satisfying: %@", @"methods.count % 2 == 0" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)SGStringPreprocessingTransformer;
  id v6 = [(SGStringPreprocessingTransformer *)&v32 init];
  id v7 = v6;
  if (v6)
  {
    SEL v30 = a2;
    long long v31 = v6;
    unint64_t v8 = objc_opt_new();
    uint64_t v9 = objc_opt_new();
    if ([v5 count])
    {
      unint64_t v10 = 0;
      do
      {
        uint32_t v11 = [v5 objectAtIndexedSubscript:v10 + 1];
        id v12 = [v5 objectAtIndexedSubscript:v10];
        uint64_t v13 = v9;
        v14 = v8;
        uint64_t v15 = [v11 length];
        v16 = (objc_class *)MEMORY[0x263F089D8];
        id v17 = v12;
        uint64_t v18 = objc_msgSend([v16 alloc], "initWithCapacity:", objc_msgSend(v17, "length") + 11);
        [v18 appendString:v17];

        BOOL v19 = v15 == 0;
        unint64_t v8 = v14;
        uint64_t v9 = v13;
        if (v19) {
          uint64_t v20 = @":";
        }
        else {
          uint64_t v20 = @":withValue:";
        }
        [v18 appendString:v20];
        [v8 addObject:v18];

        [v13 addObject:v11];
        v10 += 2;
      }
      while (v10 < [v5 count]);
    }
    id v7 = v31;
    objc_storeStrong((id *)&v31->_methodNames, v8);
    objc_storeStrong((id *)&v31->_methodValues, v9);
    *(_OWORD *)__str = 0u;
    long long v34 = 0u;
    if (snprintf(__str, 0x20uLL, "%s%s%s%s", "v", "@", ":", "@") > 0x1F)
    {
      long long v28 = [MEMORY[0x263F08690] currentHandler];
      [v28 handleFailureInMethod:v30, v31, @"SGStringPreprocessingTransformer.m", 83, @"Invalid parameter not satisfying: %@", @"size >= 0 && size < TYPES_STRING_BUF_SIZE" object file lineNumber description];
    }
    uint64_t v21 = [MEMORY[0x263EFF970] signatureWithObjCTypes:__str];
    methodSignatureNoValue = v31->_methodSignatureNoValue;
    v31->_methodSignatureNoValue = (NSMethodSignature *)v21;

    if (snprintf(__str, 0x20uLL, "%s%s%s%s%s", "v", "@", ":", "@", "@") >= 0x20)
    {
      long long v29 = [MEMORY[0x263F08690] currentHandler];
      [v29 handleFailureInMethod:v30, v31, @"SGStringPreprocessingTransformer.m", 86, @"Invalid parameter not satisfying: %@", @"size >= 0 && size < TYPES_STRING_BUF_SIZE" object file lineNumber description];
    }
    uint64_t v23 = [MEMORY[0x263EFF970] signatureWithObjCTypes:__str];
    methodSignatureWithValue = v31->_methodSignatureWithValue;
    v31->_methodSignatureWithValue = (NSMethodSignature *)v23;
  }
  return v7;
}

+ (id)withMethods:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMethods:v4];

  return v5;
}

@end