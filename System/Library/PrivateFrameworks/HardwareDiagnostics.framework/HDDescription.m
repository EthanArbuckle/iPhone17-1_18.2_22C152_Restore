@interface HDDescription
+ (id)descriptionWithSummary:(id)a3;
- (BOOL)validateAgainstValues:(id)a3 error:(id *)a4;
- (HDDescription)init;
- (HDDescription)initWithSummary:(id)a3;
- (NSDictionary)metadata;
- (NSDictionary)parameters;
- (NSString)summary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addParameter:(id)a3 forName:(id)a4;
- (void)setMetadata:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation HDDescription

+ (id)descriptionWithSummary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSummary:v4];

  return v5;
}

- (HDDescription)init
{
  return [(HDDescription *)self initWithSummary:&stru_26EAEABB8];
}

- (HDDescription)initWithSummary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDescription;
  v6 = [(HDDescription *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_summary, a3);
    uint64_t v8 = objc_opt_new();
    metadata = v7->_metadata;
    v7->_metadata = (NSDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    parameters = v7->_parameters;
    v7->_parameters = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (NSDictionary)parameters
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_parameters, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_parameters;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v9, (void)v14);
        v11 = (void *)[v10 copy];

        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v12;
}

- (void)addParameter:(id)a3 forName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (([v6 isAlphaNumeric] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Name for parameter in description must be alphanumeric: \"%@\"", v6 format];
  }
  uint64_t v7 = (void *)[v8 copy];
  [(NSMutableDictionary *)self->_parameters setObject:v7 forKeyedSubscript:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDDescription *)self summary];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setSummary:v7];

  id v8 = [(HDDescription *)self metadata];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setMetadata:v9];

  parameters = self->_parameters;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __30__HDDescription_copyWithZone___block_invoke;
  v13[3] = &unk_264D001D0;
  id v11 = v5;
  id v14 = v11;
  [(NSMutableDictionary *)parameters enumerateKeysAndObjectsUsingBlock:v13];

  return v11;
}

uint64_t __30__HDDescription_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addParameter:a3 forName:a2];
}

- (BOOL)validateAgainstValues:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [v6 count];
  if (v7 <= [(NSMutableDictionary *)self->_parameters count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = [v6 allKeys];
    uint64_t v13 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (!v13)
    {
LABEL_12:

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v8 = self->_parameters;
      uint64_t v19 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v37 != v21) {
              objc_enumerationMutation(v8);
            }
            uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            id v12 = [(NSMutableDictionary *)self->_parameters objectForKeyedSubscript:v23];
            v24 = [v6 objectForKeyedSubscript:v23];
            if (v24)
            {
              if (![v12 validateValue:v24 error:a4]) {
                goto LABEL_30;
              }
            }
            else if ([v12 required])
            {
              if (a4)
              {
                v30 = [NSString stringWithFormat:@"Missing required parameter %@", v23];
                v31 = (void *)MEMORY[0x263F087E8];
                uint64_t v44 = *MEMORY[0x263F08320];
                v45 = v30;
                v32 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
                v33 = [v31 errorWithDomain:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain" code:2 userInfo:v32];

                id v34 = v33;
                *a4 = v34;
              }
LABEL_30:

              goto LABEL_31;
            }
          }
          uint64_t v20 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
          BOOL v25 = 1;
          if (v20) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v25 = 1;
      }
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
LABEL_6:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v41 != v15) {
        objc_enumerationMutation(v8);
      }
      uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * v16);
      v18 = [(NSMutableDictionary *)self->_parameters objectForKeyedSubscript:v17];

      if (!v18) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v14) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
    if (!a4) {
      goto LABEL_32;
    }
    id v12 = [NSString stringWithFormat:@"Unexpected parameter (%@)", v17];
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F08320];
    id v48 = v12;
    v27 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v28 = [v26 errorWithDomain:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain" code:3 userInfo:v27];

    id v29 = v28;
    *a4 = v29;

LABEL_31:
LABEL_32:
    BOOL v25 = 0;
    goto LABEL_33;
  }
  if (a4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Expected at most %lu parameters but have %lu.", -[NSMutableDictionary count](self->_parameters, "count"), objc_msgSend(v6, "count"));
    id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08320];
    v51[0] = v8;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
    id v11 = [v9 errorWithDomain:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain" code:3 userInfo:v10];

    id v12 = v11;
    *a4 = v12;
    goto LABEL_31;
  }
  BOOL v25 = 0;
LABEL_34:

  return v25;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end