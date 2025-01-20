@interface SGEntityMatchingTransformer
+ (id)withTargetMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 addressMapping:(id)a6 andDateMapping:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntityMatchingTransformer:(id)a3;
- (NSString)addressMapping;
- (NSString)dateMapping;
- (NSString)emailMapping;
- (NSString)phoneMapping;
- (NSString)targetMapping;
- (SGEntityMatchingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (SGEntityMatchingTransformer)initWithTargetMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 addressMapping:(id)a6 andDateMapping:(id)a7;
- (id)extendMatchArray:(id)a3 withTarget:(id)a4;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
- (void)setAddressMapping:(id)a3;
- (void)setDateMapping:(id)a3;
- (void)setEmailMapping:(id)a3;
- (void)setPhoneMapping:(id)a3;
- (void)setTargetMapping:(id)a3;
@end

@implementation SGEntityMatchingTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateMapping, 0);
  objc_storeStrong((id *)&self->_addressMapping, 0);
  objc_storeStrong((id *)&self->_emailMapping, 0);
  objc_storeStrong((id *)&self->_phoneMapping, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
}

- (void)setDateMapping:(id)a3
{
}

- (NSString)dateMapping
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAddressMapping:(id)a3
{
}

- (NSString)addressMapping
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEmailMapping:(id)a3
{
}

- (NSString)emailMapping
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPhoneMapping:(id)a3
{
}

- (NSString)phoneMapping
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTargetMapping:(id)a3
{
}

- (NSString)targetMapping
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(SGEntityMatchingTransformer *)self targetMapping];
  uint64_t v4 = [v3 hash];

  v5 = [(SGEntityMatchingTransformer *)self phoneMapping];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(SGEntityMatchingTransformer *)self emailMapping];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  v9 = [(SGEntityMatchingTransformer *)self addressMapping];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  v11 = [(SGEntityMatchingTransformer *)self dateMapping];
  unint64_t v12 = [v11 hash] - v10 + 32 * v10;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGEntityMatchingTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGEntityMatchingTransformer *)self isEqualToEntityMatchingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToEntityMatchingTransformer:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(SGEntityMatchingTransformer *)self targetMapping];
    v9 = [v7 targetMapping];
    if (v8 != v9)
    {
      uint64_t v10 = [(SGEntityMatchingTransformer *)self targetMapping];
      [v7 targetMapping];
      v38 = v37 = v10;
      if (!objc_msgSend(v10, "isEqual:"))
      {
        char v11 = 0;
        goto LABEL_29;
      }
    }
    unint64_t v12 = [(SGEntityMatchingTransformer *)self phoneMapping];
    v13 = [v7 phoneMapping];
    if (v12 != v13)
    {
      v5 = [(SGEntityMatchingTransformer *)self phoneMapping];
      v3 = [v7 phoneMapping];
      if (![v5 isEqual:v3])
      {
        char v11 = 0;
LABEL_27:

LABEL_28:
        if (v8 == v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    uint64_t v14 = [(SGEntityMatchingTransformer *)self emailMapping];
    uint64_t v35 = [v7 emailMapping];
    v36 = (void *)v14;
    if (v14 == v35)
    {
      v32 = v3;
    }
    else
    {
      v15 = [(SGEntityMatchingTransformer *)self emailMapping];
      v33 = [v7 emailMapping];
      v34 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        char v11 = 0;
        v19 = (void *)v35;
        v18 = v36;
LABEL_25:

LABEL_26:
        if (v12 == v13) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      v32 = v3;
    }
    v16 = [(SGEntityMatchingTransformer *)self addressMapping];
    v17 = [v7 addressMapping];
    if (v16 == v17)
    {
      v29 = v5;
      v30 = v13;
    }
    else
    {
      uint64_t v4 = [(SGEntityMatchingTransformer *)self addressMapping];
      v31 = [v7 addressMapping];
      if (!objc_msgSend(v4, "isEqual:"))
      {
        char v11 = 0;
        goto LABEL_23;
      }
      v29 = v5;
      v30 = v13;
    }
    v20 = [(SGEntityMatchingTransformer *)self dateMapping];
    uint64_t v21 = [v7 dateMapping];
    if (v20 == (void *)v21)
    {

      char v11 = 1;
    }
    else
    {
      v22 = (void *)v21;
      [(SGEntityMatchingTransformer *)self dateMapping];
      v23 = v27 = v4;
      [v7 dateMapping];
      v28 = v12;
      v25 = v24 = v16;
      char v11 = [v23 isEqual:v25];

      v16 = v24;
      unint64_t v12 = v28;

      uint64_t v4 = v27;
    }
    v5 = v29;
    v13 = v30;
    if (v16 == v17)
    {
LABEL_24:

      v19 = (void *)v35;
      v18 = v36;
      v3 = v32;
      if (v36 == (void *)v35) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  char v11 = 0;
LABEL_31:

  return v11;
}

- (SGEntityMatchingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"TARGET_MAPPING"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"PHONE_MAPPING"];
  v9 = [v6 objectForKeyedSubscript:@"EMAIL_MAPPING"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"ADDRESS_MAPPING"];
  char v11 = [v6 objectForKeyedSubscript:@"DATE_MAPPING"];

  unint64_t v12 = [(SGEntityMatchingTransformer *)self initWithTargetMapping:v7 phoneMapping:v8 emailMapping:v9 addressMapping:v10 andDateMapping:v11];
  return v12;
}

- (id)toPlistWithChunks:(id)a3
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v11[0] = @"TARGET_MAPPING";
  uint64_t v4 = [(SGEntityMatchingTransformer *)self targetMapping];
  v12[0] = v4;
  v11[1] = @"PHONE_MAPPING";
  v5 = [(SGEntityMatchingTransformer *)self phoneMapping];
  v12[1] = v5;
  v11[2] = @"EMAIL_MAPPING";
  id v6 = [(SGEntityMatchingTransformer *)self emailMapping];
  v12[2] = v6;
  v11[3] = @"ADDRESS_MAPPING";
  id v7 = [(SGEntityMatchingTransformer *)self addressMapping];
  v12[3] = v7;
  v11[4] = @"DATE_MAPPING";
  uint64_t v8 = [(SGEntityMatchingTransformer *)self dateMapping];
  v12[4] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

- (id)extendMatchArray:(id)a3 withTarget:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count") + 1);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9)
  {

    goto LABEL_17;
  }
  uint64_t v10 = v9;
  id obj = v8;
  int v11 = 0;
  uint64_t v12 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      v15 = (void *)MEMORY[0x1CB79B230]();
      if (v11) {
        goto LABEL_10;
      }
      uint64_t v16 = [v14 valueRange];
      if (v16 + v17 >= (unint64_t)[v6 valueRange])
      {
        [v7 addObject:v6];
LABEL_10:
        uint64_t v19 = objc_msgSend(v6, "valueRange", obj);
        int v18 = 0;
        int v21 = 0;
        int v11 = 1;
        if (v19 + v20 >= (unint64_t)[v14 valueRange]) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      int v11 = 0;
      int v18 = 1;
LABEL_11:
      objc_msgSend(v7, "addObject:", v14, obj);
      int v21 = v18;
LABEL_12:
    }
    id v8 = obj;
    uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v10);

  if (v21) {
LABEL_17:
  }
    [v7 addObject:v6];
  v22 = (void *)[v7 copy];

  return v22;
}

- (id)transform:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 objectForKeyedSubscript:@"INPUT_TEXT"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"SGEntityMatchingTransformer.m", 72, @"Unexpected input: %@. %@ requires dictionary with SG_MODEL_INPUT_TEXT key.", v5, v9 object file lineNumber description];
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"SG_MODEL_DISABLE_TARGET_MAPPING"];
  if (v10) {
    goto LABEL_13;
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"TARGET_MATCH"];
  if (v10)
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"DD_MATCHES"];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
  }
  v13 = [v5 objectForKeyedSubscript:@"SG_MODEL_INPUT_TARGET_RANGE"];

  if (v10) {
  if (!v13)
  }
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v14);
    [v10 handleFailureInMethod:a2, self, @"SGEntityMatchingTransformer.m", 81, @"Unexpected input: %@. %@ requires SG_MODEL_DISABLE_TARGET_MAPPING to be setif neither SG_MODEL_TARGET_DD_MATCH and SG_MODEL_INPUT_TARGET_RANGE are provied.", v5, v12 object file lineNumber description];
    goto LABEL_12;
  }
LABEL_14:
  v15 = [v5 objectForKeyedSubscript:@"INPUT_TEXT"];
  uint64_t v16 = [v5 objectForKeyedSubscript:@"TARGET_MATCH"];
  uint64_t v17 = [v5 objectForKeyedSubscript:@"DD_MATCHES"];
  if (!v16)
  {
    uint64_t v16 = [v5 objectForKeyedSubscript:@"SG_MODEL_INPUT_TARGET_RANGE"];

    if (v16)
    {
      int v18 = [v5 objectForKeyedSubscript:@"SG_MODEL_INPUT_TARGET_RANGE"];
      uint64_t v19 = [v18 rangeValue];
      uint64_t v21 = v20;

      uint64_t v16 = -[SGDataDetectorMatch initWithMatchType:range:labelRange:labelString:valueRange:valueString:]([SGDataDetectorMatch alloc], "initWithMatchType:range:labelRange:labelString:valueRange:valueString:", 9, 0, 0, 0, 0, 0, v19, v21, 0);
      if (v17 && [v17 count])
      {
        uint64_t v22 = [(SGEntityMatchingTransformer *)self extendMatchArray:v17 withTarget:v16];
      }
      else
      {
        v42[0] = v16;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      }
      v23 = (void *)v22;

      uint64_t v17 = v23;
    }
  }
  uint64_t v24 = [v15 range];
  if (v17)
  {
    uint64_t v26 = v24;
    uint64_t v27 = v25;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __41__SGEntityMatchingTransformer_transform___block_invoke;
    v36[3] = &unk_1E65BE308;
    long long v28 = v16;
    v37 = v28;
    v38 = self;
    id v39 = v15;
    v29 = objc_msgSend(v39, "stringByReplacingMatches:inRange:withBlock:", v17, v26, v27, v36);
    if (v28
      && ([(SGEntityMatchingTransformer *)self targetMapping],
          uint64_t v30 = objc_claimAutoreleasedReturnValue(),
          char v31 = [v29 containsString:v30],
          v30,
          (v31 & 1) == 0))
    {
      v33 = sgLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        uint64_t v35 = [(SGEntityMatchingTransformer *)self targetMapping];
        *(_DWORD *)buf = 138412290;
        v41 = v35;
        _os_log_fault_impl(&dword_1CA650000, v33, OS_LOG_TYPE_FAULT, "Could not find %@ in message", buf, 0xCu);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
      v32 = &stru_1F24EEF20;
    }
    else
    {
      v32 = v29;
    }
  }
  else
  {
    v32 = v15;
  }

  return v32;
}

id __41__SGEntityMatchingTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  id v5 = *(id *)(a1 + 32);
  if (v5) {
    BOOL v6 = v5 == v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) targetMapping];
LABEL_8:
    id v8 = (void *)v7;
  }
  else
  {
    switch([v3 matchType])
    {
      case 0u:
        uint64_t v7 = [*(id *)(a1 + 40) phoneMapping];
        goto LABEL_8;
      case 1u:
        uint64_t v7 = [*(id *)(a1 + 40) addressMapping];
        goto LABEL_8;
      case 2u:
        uint64_t v7 = [*(id *)(a1 + 40) emailMapping];
        goto LABEL_8;
      case 3u:
        uint64_t v7 = [*(id *)(a1 + 40) dateMapping];
        goto LABEL_8;
      default:
        uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v11 = [v4 valueString];
        uint64_t v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          uint64_t v14 = *(void **)(a1 + 48);
          uint64_t v15 = [v4 valueRange];
          objc_msgSend(v14, "substringWithRange:", v15, v16);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v8 = v13;

        break;
    }
  }

  return v8;
}

- (SGEntityMatchingTransformer)initWithTargetMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 addressMapping:(id)a6 andDateMapping:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SGEntityMatchingTransformer;
  uint64_t v17 = [(SGEntityMatchingTransformer *)&v20 init];
  int v18 = v17;
  if (v17)
  {
    [(SGEntityMatchingTransformer *)v17 setTargetMapping:v12];
    [(SGEntityMatchingTransformer *)v18 setPhoneMapping:v13];
    [(SGEntityMatchingTransformer *)v18 setEmailMapping:v14];
    [(SGEntityMatchingTransformer *)v18 setAddressMapping:v15];
    [(SGEntityMatchingTransformer *)v18 setDateMapping:v16];
  }

  return v18;
}

+ (id)withTargetMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 addressMapping:(id)a6 andDateMapping:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = (void *)[objc_alloc((Class)a1) initWithTargetMapping:v16 phoneMapping:v15 emailMapping:v14 addressMapping:v13 andDateMapping:v12];

  return v17;
}

@end