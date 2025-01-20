@interface COStateReadResponse
+ (BOOL)supportsSecureCoding;
- (COStateReadResponse)initWithCoder:(id)a3;
- (COStateReadResponse)initWithState:(id)a3;
- (NSDictionary)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COStateReadResponse

- (COStateReadResponse)initWithState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COStateReadResponse;
  v6 = [(COMeshCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_state, a3);
  }

  return v7;
}

- (COStateReadResponse)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)COStateReadResponse;
  id v5 = [(COMeshResponse *)&v38 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSDictionary *)v11;

    if (v5->_state)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v13 = [(NSDictionary *)v5->_state allKeys];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v35;
          v28 = v13;
          v29 = v10;
          uint64_t v26 = *(void *)v35;
          while (2)
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v27 = v17;
              uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_25;
              }
              v19 = [(NSDictionary *)v5->_state objectForKeyedSubscript:v18];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
LABEL_24:

LABEL_25:
                goto LABEL_26;
              }
              long long v32 = 0u;
              long long v33 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              id v20 = v19;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v39 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v31;
                while (2)
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v31 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      v13 = v28;
                      v10 = v29;
                      goto LABEL_24;
                    }
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v39 count:16];
                  if (v22) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v17 = v27 + 1;
              v13 = v28;
              v10 = v29;
              uint64_t v16 = v26;
            }
            while (v27 + 1 != v15);
            uint64_t v15 = [v28 countByEnumeratingWithState:&v34 objects:v40 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v13 = v5;
LABEL_26:
        id v5 = 0;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COStateReadResponse;
  id v4 = a3;
  [(COMeshResponse *)&v6 encodeWithCoder:v4];
  id v5 = [(COStateReadResponse *)self state];
  [v4 encodeObject:v5 forKey:@"state"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end