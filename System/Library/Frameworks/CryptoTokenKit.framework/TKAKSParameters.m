@interface TKAKSParameters
+ (void)_dumpPlist:(id)a3 into:(id)a4;
- (NSData)data;
- (TKAKSParameters)init;
- (TKAKSParameters)initWithParameters:(id)a3;
- (const)bytes;
- (id)description;
- (unint64_t)length;
- (void)data;
- (void)dealloc;
- (void)setData:(id)a3 forKey:(unsigned int)a4;
- (void)setNumber:(int64_t)a3 forKey:(unsigned int)a4;
@end

@implementation TKAKSParameters

- (void)setData:(id)a3 forKey:(unsigned int)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  aks_params_set_data();
  encoded = self->_encoded;
  self->_encoded = 0;
}

- (const)bytes
{
  id v2 = [(TKAKSParameters *)self data];
  v3 = (const void *)[v2 bytes];

  return v3;
}

- (NSData)data
{
  encoded = self->_encoded;
  if (!encoded)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v4 = MEMORY[0x1C189C460](self->_params, &v11, &v10);
    if (v4)
    {
      uint64_t v5 = v4;
      v6 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TKAKSParameters data]();
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"failed to get DER-encoded aks_params_t (err=%d)", v5);
    }
    v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:v10];
    v8 = self->_encoded;
    self->_encoded = v7;

    encoded = self->_encoded;
  }

  return encoded;
}

- (TKAKSParameters)initWithParameters:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKAKSParameters;
  uint64_t v5 = [(TKAKSParameters *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    v5->_params = (aks_params_s *)aks_params_create();
  }

  return v5;
}

- (void)dealloc
{
  aks_params_free();
  v3.receiver = self;
  v3.super_class = (Class)TKAKSParameters;
  [(TKAKSParameters *)&v3 dealloc];
}

- (unint64_t)length
{
  id v2 = [(TKAKSParameters *)self data];
  unint64_t v3 = [v2 length];

  return v3;
}

- (TKAKSParameters)init
{
  return [(TKAKSParameters *)self initWithParameters:0];
}

+ (void)_dumpPlist:(id)a3 into:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = v7;
    v9 = v6;
LABEL_26:
    [v8 appendString:v9];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = v6;
    uint64_t v11 = [(__CFString *)v10 bytes];
    if ([(__CFString *)v10 length])
    {
      unint64_t v12 = 0;
      do
        objc_msgSend(v7, "appendFormat:", @"%02x", *(unsigned __int8 *)(v11 + v12++));
      while (v12 < [(__CFString *)v10 length]);
    }

    goto LABEL_27;
  }
  CFTypeID v13 = CFGetTypeID(v6);
  if (v13 == CFBooleanGetTypeID())
  {
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
      v9 = @"true";
    }
    else {
      v9 = @"false";
    }
LABEL_25:
    objc_super v8 = v7;
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 appendFormat:@"%@", v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 appendString:@"["];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = v6;
    uint64_t v15 = [(__CFString *)v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      char v18 = 1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          if ((v18 & 1) == 0) {
            [v7 appendString:@","];
          }
          [a1 _dumpPlist:v20 into:v7];
          char v18 = 0;
        }
        uint64_t v16 = [(__CFString *)v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
        char v18 = 0;
      }
      while (v16);
    }

    v9 = @"]";
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 appendString:@"{"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v29 = v6;
    v21 = v6;
    uint64_t v22 = [(__CFString *)v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      char v24 = 1;
      uint64_t v25 = *(void *)v31;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * v26);
          if ((v24 & 1) == 0) {
            [v7 appendString:@","];
          }
          [a1 _dumpPlist:v27 into:v7];
          [v7 appendString:@":"];
          if (_dumpPlist_into__onceToken != -1) {
            dispatch_once(&_dumpPlist_into__onceToken, &__block_literal_global_7);
          }
          if ([(id)_dumpPlist_into__deniedKeys containsObject:v27])
          {
            [v7 appendFormat:@"###"];
          }
          else
          {
            v28 = [(__CFString *)v21 objectForKeyedSubscript:v27];
            [a1 _dumpPlist:v28 into:v7];
          }
          char v24 = 0;
          ++v26;
        }
        while (v23 != v26);
        uint64_t v23 = [(__CFString *)v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
        char v24 = 0;
      }
      while (v23);
    }

    [v7 appendString:@"}"];
    id v6 = v29;
  }
LABEL_27:
}

void __35__TKAKSParameters__dumpPlist_into___block_invoke()
{
  v0 = (void *)_dumpPlist_into__deniedKeys;
  _dumpPlist_into__deniedKeys = (uint64_t)&unk_1F19F82B8;
}

- (id)description
{
  unint64_t v3 = (void *)[@"<AKSp:" mutableCopy];
  id v4 = [(TKAKSParameters *)self data];
  uint64_t v5 = +[TKTLVRecord recordFromData:v4];
  id v6 = [v5 propertyList];

  if (v6)
  {
    [(id)objc_opt_class() _dumpPlist:v6 into:v3];
  }
  else
  {
    id v7 = [(TKAKSParameters *)self data];
    uint64_t v8 = [v7 bytes];

    v9 = [(TKAKSParameters *)self data];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        objc_msgSend(v3, "appendFormat:", @"%02x", *(unsigned __int8 *)(v8 + v11++));
        unint64_t v12 = [(TKAKSParameters *)self data];
        unint64_t v13 = [v12 length];
      }
      while (v11 < v13);
    }
  }
  [v3 appendString:@">"];
  v14 = (void *)[v3 copy];

  return v14;
}

- (void)setNumber:(int64_t)a3 forKey:(unsigned int)a4
{
  aks_params_set_number();
  encoded = self->_encoded;
  self->_encoded = 0;
}

- (void).cxx_destruct
{
}

- (void)data
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "failed to get DER-encoded aks_params_t (err=%d)", v1, 8u);
}

@end