@interface COStateUpdateRequest
+ (BOOL)supportsSecureCoding;
+ (id)acceptableResponses;
- (COStateUpdateRequest)initWithCoder:(id)a3;
- (COStateUpdateRequest)initWithUpdates:(id)a3 removals:(id)a4;
- (NSDictionary)removals;
- (NSDictionary)updates;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COStateUpdateRequest

- (COStateUpdateRequest)initWithUpdates:(id)a3 removals:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COStateUpdateRequest;
  v9 = [(COMeshCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updates, a3);
    objc_storeStrong((id *)&v10->_removals, a4);
  }

  return v10;
}

- (COStateUpdateRequest)initWithCoder:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)COStateUpdateRequest;
  v5 = [(COMeshCommand *)&v59 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"updates"];
    updates = v5->_updates;
    v5->_updates = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"removals"];
    removals = v5->_removals;
    v5->_removals = (NSDictionary *)v14;

    if (v5->_updates)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_42;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v16 = [(NSDictionary *)v5->_updates allKeys];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v56;
        v41 = v16;
        v42 = v11;
        uint64_t v36 = *(void *)v56;
LABEL_6:
        uint64_t v19 = 0;
        uint64_t v37 = v17;
        while (1)
        {
          if (*(void *)v56 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v39 = v19;
          uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          v21 = [(NSDictionary *)v5->_updates objectForKeyedSubscript:v20];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_44:

            break;
          }
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v22 = [v21 allKeys];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v52;
            while (2)
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v52 != v25) {
                  objc_enumerationMutation(v22);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_43:

                  v16 = v41;
                  v11 = v42;
                  goto LABEL_44;
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v62 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

          uint64_t v19 = v39 + 1;
          v16 = v41;
          v11 = v42;
          uint64_t v18 = v36;
          if (v39 + 1 == v37)
          {
            uint64_t v17 = [v41 countByEnumeratingWithState:&v55 objects:v63 count:16];
            if (v17) {
              goto LABEL_6;
            }
            goto LABEL_21;
          }
        }
LABEL_45:

        goto LABEL_46;
      }
LABEL_21:
    }
    if (!v5->_removals)
    {
LABEL_48:

      goto LABEL_49;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v16 = [(NSDictionary *)v5->_removals allKeys];
      uint64_t v27 = [v16 countByEnumeratingWithState:&v47 objects:v61 count:16];
      if (!v27)
      {
LABEL_47:

        goto LABEL_48;
      }
      uint64_t v28 = *(void *)v48;
      v41 = v16;
      v42 = v11;
      uint64_t v38 = *(void *)v48;
LABEL_26:
      uint64_t v29 = 0;
      uint64_t v40 = v27;
      while (1)
      {
        if (*(void *)v48 != v28) {
          objc_enumerationMutation(v16);
        }
        uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * v29);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_45;
        }
        v21 = [(NSDictionary *)v5->_removals objectForKeyedSubscript:v30];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_44;
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v22 = v21;
        uint64_t v31 = [v22 countByEnumeratingWithState:&v43 objects:v60 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v44;
LABEL_33:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v44 != v33) {
              objc_enumerationMutation(v22);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_43;
            }
            if (v32 == ++v34)
            {
              uint64_t v32 = [v22 countByEnumeratingWithState:&v43 objects:v60 count:16];
              if (v32) {
                goto LABEL_33;
              }
              break;
            }
          }
        }

        ++v29;
        v16 = v41;
        v11 = v42;
        uint64_t v28 = v38;
        if (v29 == v40)
        {
          uint64_t v27 = [v41 countByEnumeratingWithState:&v47 objects:v61 count:16];
          if (v27) {
            goto LABEL_26;
          }
          goto LABEL_47;
        }
      }
    }
LABEL_42:
    v16 = v5;
LABEL_46:
    v5 = 0;
    goto LABEL_47;
  }
LABEL_49:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COStateUpdateRequest;
  id v4 = a3;
  [(COMeshCommand *)&v7 encodeWithCoder:v4];
  v5 = [(COStateUpdateRequest *)self updates];
  [v4 encodeObject:v5 forKey:@"updates"];

  v6 = [(COStateUpdateRequest *)self removals];
  [v4 encodeObject:v6 forKey:@"removals"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acceptableResponses
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  return v2;
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (NSDictionary)removals
{
  return self->_removals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

@end