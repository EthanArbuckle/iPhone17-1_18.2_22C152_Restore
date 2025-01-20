@interface JEDeresURLTreatmentAction
- (JEDeresURLTreatmentAction)initWithField:(id)a3 configuration:(id)a4;
- (id)allowedQueryItemsFromItems:(id)a3;
- (id)performAction:(id)a3 context:(id)a4;
@end

@implementation JEDeresURLTreatmentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedParameters, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

- (JEDeresURLTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)JEDeresURLTreatmentAction;
  v7 = [(JETreatmentAction *)&v29 initWithField:a3 configuration:v6];
  if (!v7)
  {
LABEL_19:
    v9 = v7;
    goto LABEL_20;
  }
  v8 = [v6 objectForKeyedSubscript:@"scope"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }

  if (v9)
  {
    uint64_t v10 = [(JEDeresURLTreatmentAction *)v9 copy];
    scope = v7->_scope;
    v7->_scope = (NSString *)v10;

    v12 = [v6 objectForKeyedSubscript:@"allowedParams"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v15 = (NSDictionary *)v13;
      uint64_t v16 = [(NSDictionary *)v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        uint64_t v19 = MEMORY[0x1E4F1CC08];
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *(void *)(*((void *)&v25 + 1) + 8 * v20++), (void)v25);
          }
          while (v17 != v20);
          uint64_t v17 = [(NSDictionary *)v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v17);
      }

      uint64_t v21 = [v14 copy];
      allowedParameters = v7->_allowedParameters;
      v7->_allowedParameters = (NSDictionary *)v21;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [v12 copy];
        v15 = v7->_allowedParameters;
        v7->_allowedParameters = (NSDictionary *)v23;
      }
      else
      {
        v15 = v7->_allowedParameters;
        v7->_allowedParameters = (NSDictionary *)MEMORY[0x1E4F1CC08];
      }
    }

    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

- (id)performAction:(id)a3 context:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)JEDeresURLTreatmentAction;
  v5 = [(JETreatmentAction *)&v24 performAction:a3 context:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6)
  {
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  v7 = [MEMORY[0x1E4F29088] componentsWithString:v6];
  if (self) {
    scope = self->_scope;
  }
  else {
    scope = 0;
  }
  if (![(NSString *)scope isEqualToString:@"hostname"])
  {
    [v7 setPassword:0];
    [v7 setUser:0];
    if (self) {
      v11 = self->_scope;
    }
    else {
      v11 = 0;
    }
    v12 = v11;
    if ([(NSString *)v12 isEqualToString:@"urlWithoutParams"])
    {
    }
    else
    {
      if (self) {
        id v13 = self->_scope;
      }
      else {
        id v13 = 0;
      }
      BOOL v14 = [(NSString *)v13 isEqualToString:@"fullWithoutParams"];

      if (!v14)
      {
        if (self) {
          uint64_t v18 = self->_scope;
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = v18;
        if ([(NSString *)v19 isEqualToString:@"urlWithoutPath"])
        {
        }
        else
        {
          if (self) {
            uint64_t v20 = self->_scope;
          }
          else {
            uint64_t v20 = 0;
          }
          BOOL v21 = [(NSString *)v20 isEqualToString:@"fullWithoutPath"];

          if (!v21) {
            goto LABEL_18;
          }
        }
        [v7 setFragment:0];
        v22 = [v7 queryItems];
        uint64_t v23 = [(JEDeresURLTreatmentAction *)self allowedQueryItemsFromItems:v22];
        [v7 setQueryItems:v23];

        [v7 setPath:0];
LABEL_18:
        uint64_t v9 = [v7 string];
        goto LABEL_19;
      }
    }
    [v7 setFragment:0];
    v15 = [v7 queryItems];
    uint64_t v16 = [(JEDeresURLTreatmentAction *)self allowedQueryItemsFromItems:v15];
    [v7 setQueryItems:v16];

    goto LABEL_18;
  }
  uint64_t v9 = [v7 host];
LABEL_19:
  uint64_t v10 = (void *)v9;

LABEL_20:
  return v10;
}

- (id)allowedQueryItemsFromItems:(id)a3
{
  id v4 = a3;
  if (self) {
    allowedParameters = self->_allowedParameters;
  }
  else {
    allowedParameters = 0;
  }
  if (-[NSDictionary count](allowedParameters, "count") && [v4 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__JEDeresURLTreatmentAction_allowedQueryItemsFromItems___block_invoke;
    v11[3] = &unk_1E59B50A0;
    v11[4] = self;
    id v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v11];
    v7 = [v4 filteredArrayUsingPredicate:v6];
    if ([v7 count]) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __56__JEDeresURLTreatmentAction_allowedQueryItemsFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[12];
  }
  v5 = v4;
  id v6 = [v3 name];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [v7 objectForKeyedSubscript:@"allowedValues"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9)
    {
      v11 = [v3 value];
      uint64_t v10 = [v9 containsObject:v11];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end