@interface HDKeyedObjectParameter
- (BOOL)required;
- (BOOL)validateValue:(id)a3 error:(id *)a4;
- (HDKeyedObjectParameter)init;
- (HDKeyedObjectParameter)initWithSummary:(id)a3 required:(BOOL)a4;
- (NSDictionary)keys;
- (NSString)summary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addKey:(id)a3 forName:(id)a4;
- (void)addKeys:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setSummary:(id)a3;
@end

@implementation HDKeyedObjectParameter

- (HDKeyedObjectParameter)init
{
  return [(HDKeyedObjectParameter *)self initWithSummary:&stru_26EAEABB8 required:1];
}

- (HDKeyedObjectParameter)initWithSummary:(id)a3 required:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDKeyedObjectParameter;
  v8 = [(HDKeyedObjectParameter *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_summary, a3);
    uint64_t v10 = objc_opt_new();
    keys = v9->_keys;
    v9->_keys = (NSMutableDictionary *)v10;

    v9->_required = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HDKeyedObjectParameter *)self summary];
  v6 = (void *)[v4 initWithSummary:v5 required:self->_required];

  keys = self->_keys;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__HDKeyedObjectParameter_copyWithZone___block_invoke;
  v10[3] = &unk_264D001A8;
  id v8 = v6;
  id v11 = v8;
  [(NSMutableDictionary *)keys enumerateKeysAndObjectsUsingBlock:v10];

  return v8;
}

uint64_t __39__HDKeyedObjectParameter_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addKey:a3 forName:a2];
}

- (void)addKey:(id)a3 forName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (([v6 isAlphaNumeric] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Name for key in keyed object parameter must be alphanumeric: \"%@\"", v6 format];
  }
  id v7 = (void *)[v8 copy];
  [(NSMutableDictionary *)self->_keys setObject:v7 forKeyedSubscript:v6];
}

- (void)addKeys:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__HDKeyedObjectParameter_addKeys___block_invoke;
  v3[3] = &unk_264D001A8;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __34__HDKeyedObjectParameter_addKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addKey:a3 forName:a2];
}

- (BOOL)validateValue:(id)a3 error:(id *)a4
{
  v67[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v23 = NSString;
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      id v7 = [v23 stringWithFormat:@"Expected Dictionary value for keyed object parameter, not %@.", v25];

      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v66 = *MEMORY[0x263F08320];
      v67[0] = v7;
      v27 = [NSDictionary dictionaryWithObjects:v67 forKeys:&v66 count:1];
      v28 = [v26 errorWithDomain:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain" code:4 userInfo:v27];

      id v8 = v28;
      BOOL v22 = 0;
      *a4 = v8;
      goto LABEL_40;
    }
    BOOL v22 = 0;
    goto LABEL_41;
  }
  id v47 = v6;
  id v7 = v6;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v8 = [v7 allKeys];
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v29 = NSString;
            v30 = (objc_class *)objc_opt_class();
            v31 = NSStringFromClass(v30);
            v20 = [v29 stringWithFormat:@"Expected String keys in dictionary value for keyed object parameter, not %@.", v31];

            v32 = (void *)MEMORY[0x263F087E8];
            uint64_t v63 = *MEMORY[0x263F08320];
            v64 = v20;
            v33 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
            v34 = v32;
            uint64_t v35 = 4;
            goto LABEL_30;
          }
LABEL_31:
          BOOL v22 = 0;
          goto LABEL_35;
        }
        v14 = [(NSMutableDictionary *)self->_keys objectForKeyedSubscript:v13];

        if (!v14)
        {
          if (a4)
          {
            v20 = [NSString stringWithFormat:@"Unexpected key (%@) for keyed object parameter.", v13];
            v36 = (void *)MEMORY[0x263F087E8];
            uint64_t v61 = *MEMORY[0x263F08320];
            v62 = v20;
            v33 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
            v34 = v36;
            uint64_t v35 = 3;
LABEL_30:
            v37 = [v34 errorWithDomain:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain" code:v35 userInfo:v33];

            id v21 = v37;
            *a4 = v21;
LABEL_39:
            id v6 = v47;

            BOOL v22 = 0;
            goto LABEL_40;
          }
          goto LABEL_31;
        }
      }
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v10);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = self->_keys;
  uint64_t v15 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (!v15)
  {
    BOOL v22 = 1;
    goto LABEL_35;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v49;
  while (2)
  {
    for (uint64_t j = 0; j != v16; ++j)
    {
      if (*(void *)v49 != v17) {
        objc_enumerationMutation(v8);
      }
      uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * j);
      v20 = [(NSMutableDictionary *)self->_keys objectForKeyedSubscript:v19];
      id v21 = [v7 objectForKeyedSubscript:v19];
      if (v21)
      {
        if (([v20 validateValue:v21 error:a4] & 1) == 0)
        {
          if (!a4) {
            goto LABEL_39;
          }
          v38 = [NSString stringWithFormat:@"Key (%@) has invalid value for keyed object parameter.", v19];
          v39 = (void *)MEMORY[0x263F087E8];
          uint64_t v56 = *MEMORY[0x263F08320];
          v57 = v38;
          v40 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          v41 = v39;
          uint64_t v42 = 4;
LABEL_38:
          v44 = [v41 errorWithDomain:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain" code:v42 userInfo:v40];

          id v45 = v44;
          *a4 = v45;

          goto LABEL_39;
        }
      }
      else if ([v20 required])
      {
        if (!a4) {
          goto LABEL_39;
        }
        v38 = [NSString stringWithFormat:@"Missing required key (%@) in keyed object parameter.", v19];
        v43 = (void *)MEMORY[0x263F087E8];
        uint64_t v58 = *MEMORY[0x263F08320];
        v59 = v38;
        v40 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        v41 = v43;
        uint64_t v42 = 2;
        goto LABEL_38;
      }
    }
    uint64_t v16 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v48 objects:v60 count:16];
    BOOL v22 = 1;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_35:
  id v6 = v47;
LABEL_40:

LABEL_41:
  return v22;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (BOOL)required
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (NSDictionary)keys
{
  return &self->_keys->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end