@interface BMDSLFilter
+ (BOOL)supportsSecureCoding;
+ (id)name;
- (BMDSL)upstream;
- (BMDSLFilter)initWithCoder:(id)a3;
- (BMDSLFilter)initWithDictionary:(id)a3 error:(id *)a4;
- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 comparison:(int64_t)a5 negation:(BOOL)a6 value:(id)a7;
- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 comparison:(int64_t)a5 negation:(BOOL)a6 value:(id)a7 name:(id)a8 version:(unsigned int)a9;
- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 value:(id)a5;
- (BOOL)negation;
- (NSSecureCoding)value;
- (NSString)keyPath;
- (id)bpsPublisher;
- (id)upstreams;
- (int64_t)comparison;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLFilter

uint64_t __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) comparison];
  if (v4 < 0xB)
  {
    v7 = [*(id *)(a1 + 32) keyPath];
    v5 = BMDSLValueForKeyPath(v3, v7);

    v8 = [*(id *)(a1 + 32) value];
    v9 = v8;
    if (v8)
    {
      switch(v4)
      {
        case 0uLL:
          int v23 = [v5 isEqual:v8];
          goto LABEL_34;
        case 1uLL:
          uint64_t v24 = objc_opt_class();
          v25 = BMDSLFilterCast(v9, v24);
          v26 = v25;
          if (v25)
          {
            if ([v25 BOOLValue]) {
              BOOL v15 = v5 == 0;
            }
            else {
              BOOL v15 = v5 != 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }

          goto LABEL_45;
        case 2uLL:
          if (!BMDSLFilterCheckResponds(v5, sel_containsObject_)) {
            goto LABEL_29;
          }
          v27 = v5;
          v28 = v9;
          goto LABEL_33;
        case 3uLL:
          BOOL v15 = 0;
          if (!BMDSLFilterCheckResponds(v8, sel_containsObject_) || !v5) {
            goto LABEL_45;
          }
          v27 = v9;
          v28 = v5;
LABEL_33:
          int v23 = [v27 containsObject:v28];
LABEL_34:
          BOOL v15 = v23;
          goto LABEL_45;
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          uint64_t v10 = objc_opt_class();
          v11 = BMDSLFilterCast(v5, v10);
          uint64_t v12 = objc_opt_class();
          uint64_t v13 = BMDSLFilterCast(v9, v12);
          v14 = (void *)v13;
          BOOL v15 = 0;
          if (!v11 || !v13) {
            goto LABEL_44;
          }
          uint64_t v16 = [v11 compare:v13];
          switch(v16)
          {
            case 1:
              BOOL v17 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 6;
              break;
            case 0:
              BOOL v15 = v4 - 5 < 2;
              goto LABEL_44;
            case -1:
              BOOL v17 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 4;
              break;
            default:
              goto LABEL_35;
          }
          BOOL v15 = v17;
          goto LABEL_44;
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
          uint64_t v19 = objc_opt_class();
          v11 = BMDSLFilterCast(v5, v19);
          uint64_t v20 = objc_opt_class();
          uint64_t v21 = BMDSLFilterCast(v9, v20);
          v14 = (void *)v21;
          BOOL v15 = 0;
          if (!v11 || !v21) {
            goto LABEL_44;
          }
          switch(v4)
          {
            case 0xAuLL:
              int v22 = [v5 hasSuffix:v21];
              break;
            case 9uLL:
              int v22 = [v5 hasPrefix:v21];
              break;
            case 8uLL:
              int v22 = [v5 containsString:v9];
              break;
            default:
LABEL_35:
              BOOL v15 = 0;
              goto LABEL_44;
          }
          BOOL v15 = v22;
LABEL_44:

LABEL_45:
          uint64_t v6 = v15 ^ [*(id *)(a1 + 32) negation];
          break;
        default:
LABEL_29:
          BOOL v15 = 0;
          goto LABEL_45;
      }
    }
    else
    {
      v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_2(v18);
      }

      uint64_t v6 = 0;
    }
  }
  else
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_1(v4, v5);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSSecureCoding)value
{
  return self->_value;
}

- (BOOL)negation
{
  return self->_negation;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (int64_t)comparison
{
  return self->_comparison;
}

- (id)bpsPublisher
{
  id v3 = [(BMDSLFilter *)self upstream];
  unint64_t v4 = [v3 bpsPublisher];

  id v5 = objc_alloc(MEMORY[0x1E4F50208]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke;
  v8[3] = &unk_1E60216B0;
  v8[4] = self;
  uint64_t v6 = (void *)[v5 initWithUpstream:v4 isIncluded:v8];

  return v6;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

+ (id)name
{
  return @"filter";
}

- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 comparison:(int64_t)a5 negation:(BOOL)a6 value:(id)a7 name:(id)a8 version:(unsigned int)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  if (a9 == 1)
  {
    v26.receiver = self;
    v26.super_class = (Class)BMDSLFilter;
    uint64_t v19 = [(BMDSLBaseCodable *)&v26 initWithName:a8 version:1];
    uint64_t v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_upstream, a3);
      uint64_t v21 = [v17 copy];
      keyPath = v20->_keyPath;
      v20->_keyPath = (NSString *)v21;

      v20->_comparison = a5;
      v20->_negation = a6;
      objc_storeStrong((id *)&v20->_value, a7);
    }
    self = v20;
    int v23 = self;
  }
  else
  {
    uint64_t v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[BMDSLFilter initWithUpstream:keyPath:comparison:negation:value:name:version:](a9, v24);
    }

    int v23 = 0;
  }

  return v23;
}

- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 value:(id)a5
{
  return [(BMDSLFilter *)self initWithUpstream:a3 keyPath:a4 comparison:0 negation:0 value:a5];
}

- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 comparison:(int64_t)a5 negation:(BOOL)a6 value:(id)a7
{
  LODWORD(v8) = 1;
  return [(BMDSLFilter *)self initWithUpstream:a3 keyPath:a4 comparison:a5 negation:a6 value:a7 name:@"filter" version:v8];
}

- (BMDSLFilter)initWithDictionary:(id)a3 error:(id *)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"upstream"];
  id v29 = 0;
  uint64_t v8 = [(BMDSLBaseCodable *)[BMDSL alloc] initWithDictionary:v7 error:&v29];
  id v9 = v29;
  if (!v9)
  {
    v36[0] = @"keyPath";
    v37[0] = objc_opt_class();
    v36[1] = @"value";
    v37[1] = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    BMDSLValidateDictionary(@"filter", 1, v6, v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v28 = [v6 objectForKeyedSubscript:@"keyPath"];
      uint64_t v12 = [v6 objectForKeyedSubscript:@"comparison"];
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v26 = [v12 integerValue];
          if (v26 < 0xB) {
            goto LABEL_15;
          }
          uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v13 = *MEMORY[0x1E4F281F8];
          uint64_t v34 = *MEMORY[0x1E4F28568];
          v14 = [NSString stringWithFormat:@"BMDSLFilter error, unknown comparison %@ in dictionary %@", v12, v6];
          v35 = v14;
          BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          id v9 = [v24 errorWithDomain:v13 code:4866 userInfo:v15];
        }
        else
        {
          v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v16 = *MEMORY[0x1E4F281F8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v14 = [NSString stringWithFormat:@"BMDSLFilter error, invalid comparison type %@ (must be number) in dictionary %@", v12, v6];
          v33 = v14;
          BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          id v9 = [v27 errorWithDomain:v16 code:4866 userInfo:v15];
          unint64_t v26 = 0;
        }

        if (v9)
        {
          if (a4)
          {
            id v9 = v9;
            v11 = 0;
            *a4 = v9;
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_24;
        }
      }
      else
      {
        unint64_t v26 = 0;
      }
LABEL_15:
      id v17 = [v6 objectForKeyedSubscript:@"negation"];
      if (v17)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = [v17 BOOLValue];
LABEL_22:
          int v22 = [v6 objectForKeyedSubscript:@"value"];
          self = [(BMDSLFilter *)self initWithUpstream:v8 keyPath:v28 comparison:v26 negation:v18 value:v22];

          id v9 = 0;
          v11 = self;
LABEL_23:

LABEL_24:
          goto LABEL_25;
        }
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F281F8];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        uint64_t v20 = [NSString stringWithFormat:@"BMDSLFilter error, invalid negation type %@ (must be number) in dictionary %@", v12, v6];
        v31 = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v9 = [v25 errorWithDomain:v19 code:4866 userInfo:v21];

        if (v9)
        {
          if (a4)
          {
            id v9 = v9;
            v11 = 0;
            *a4 = v9;
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_23;
        }
      }
      uint64_t v18 = 0;
      goto LABEL_22;
    }
  }
  if (a4)
  {
    id v9 = v9;
    v11 = 0;
    *a4 = v9;
  }
  else
  {
    v11 = 0;
  }
LABEL_25:

  return v11;
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLFilter *)self upstream];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BMDSLFilter;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v8 encodeWithCoder:v4];
  id v5 = [(BMDSLFilter *)self upstream];
  [v4 encodeObject:v5 forKey:@"upstream"];

  id v6 = [(BMDSLFilter *)self value];
  [v4 encodeObject:v6 forKey:@"value"];

  v7 = [(BMDSLFilter *)self keyPath];
  [v4 encodeObject:v7 forKey:@"keyPath"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BMDSLFilter comparison](self, "comparison"), @"comparison");
  objc_msgSend(v4, "encodeBool:forKey:", -[BMDSLFilter negation](self, "negation"), @"negation");
}

- (BMDSLFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BMDSLFilter;
  id v5 = [(BMDSLBaseCodable *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = +[BMDSLClasses allowed];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"upstream"];

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"comparison"];
    uint64_t v10 = [v4 decodeBoolForKey:@"negation"];
    v11 = +[BMDSLClasses allowed];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"value"];

    uint64_t v13 = [(BMDSLBaseCodable *)v5 name];
    LODWORD(v15) = [(BMDSLBaseCodable *)v5 version];
    id v5 = [(BMDSLFilter *)v5 initWithUpstream:v7 keyPath:v8 comparison:v9 negation:v10 value:v12 name:v13 version:v15];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (void)initWithUpstream:(int)a1 keyPath:(NSObject *)a2 comparison:negation:value:name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLFilter", (uint8_t *)v2, 8u);
}

void __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unrecognized comparison %@ when evaluating BMDSLFilter isIncluded", (uint8_t *)&v4, 0xCu);
}

void __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3086000, log, OS_LOG_TYPE_ERROR, "BMDSLFilter value must be non-nil", v1, 2u);
}

@end