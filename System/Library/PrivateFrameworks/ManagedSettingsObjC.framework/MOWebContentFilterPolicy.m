@interface MOWebContentFilterPolicy
+ (BOOL)isValidPersistableRepresentation:(id)a3;
+ (id)allPolicyWithExceptions:(id)a3;
+ (id)autoPolicyWithDomains:(id)a3 exceptions:(id)a4;
+ (id)initializeWithPersistableValue:(id)a3;
+ (id)nonePolicy;
+ (id)specificPolicyWithDomains:(id)a3;
- (MOWebContentFilterPolicy)initWithAutoAllow:(id)a3 neverAllow:(id)a4 onlyAllow:(id)a5;
- (NSSet)autoAllow;
- (NSSet)neverAllow;
- (NSSet)onlyAllow;
- (id)persistableValue;
- (int64_t)policy;
@end

@implementation MOWebContentFilterPolicy

- (id)persistableValue
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MOWebContentFilterPolicy *)self policy];
  switch(v3)
  {
    case 3:
      id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v17 = [(MOWebContentFilterPolicy *)self onlyAllow];
      v6 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v18 = [(MOWebContentFilterPolicy *)self onlyAllow];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v61 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v44 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [*(id *)(*((void *)&v43 + 1) + 8 * i) persistableValue];
            [v6 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v61 count:16];
        }
        while (v20);
      }

      v59 = @"onlyAllow";
      v60 = v6;
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = &v60;
      v15 = &v59;
      goto LABEL_20;
    case 2:
      id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v26 = [(MOWebContentFilterPolicy *)self autoAllow];
      v6 = objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v27 = [(MOWebContentFilterPolicy *)self autoAllow];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v65 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v52 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = [*(id *)(*((void *)&v51 + 1) + 8 * j) persistableValue];
            [v6 addObject:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v65 count:16];
        }
        while (v29);
      }

      id v33 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v34 = [(MOWebContentFilterPolicy *)self neverAllow];
      v35 = objc_msgSend(v33, "initWithCapacity:", objc_msgSend(v34, "count"));

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v36 = [(MOWebContentFilterPolicy *)self neverAllow];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v64 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v48;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v48 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = [*(id *)(*((void *)&v47 + 1) + 8 * k) persistableValue];
            [v35 addObject:v41];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v64 count:16];
        }
        while (v38);
      }

      v62[0] = @"autoAllow";
      v62[1] = @"neverAllow";
      v63[0] = v6;
      v63[1] = v35;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];

      goto LABEL_36;
    case 1:
      id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v5 = [(MOWebContentFilterPolicy *)self neverAllow];
      v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v7 = [(MOWebContentFilterPolicy *)self neverAllow];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v68 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v56;
        do
        {
          for (uint64_t m = 0; m != v9; ++m)
          {
            if (*(void *)v56 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = [*(id *)(*((void *)&v55 + 1) + 8 * m) persistableValue];
            [v6 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v68 count:16];
        }
        while (v9);
      }

      v66 = @"neverAllow";
      v67 = v6;
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = &v67;
      v15 = &v66;
LABEL_20:
      v24 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
LABEL_36:

      goto LABEL_38;
  }
  v24 = (void *)MEMORY[0x1E4F1CC08];
LABEL_38:
  return v24;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[MOWebContentFilterPolicy isValidPersistableRepresentation:v3])
  {
    id v4 = v3;
    v5 = [v4 objectForKeyedSubscript:@"autoAllow"];
    uint64_t v39 = v5;
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
      if (v7)
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v50 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = +[MOWebDomain initializeWithPersistableValue:*(void *)(*((void *)&v49 + 1) + 8 * i)];
              [v7 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
          }
          while (v10);
        }
      }
    }
    else
    {
      v7 = 0;
    }
    v15 = [v4 objectForKeyedSubscript:@"neverAllow"];
    v40 = v4;
    uint64_t v38 = v15;
    if (v15)
    {
      id v16 = v15;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v15, "count"));
      if (v17)
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v46 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = +[MOWebDomain initializeWithPersistableValue:*(void *)(*((void *)&v45 + 1) + 8 * j)];
              [v17 addObject:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v20);
        }
      }
    }
    else
    {
      v17 = 0;
    }
    v24 = [v4 objectForKeyedSubscript:@"onlyAllow"];
    if (v24)
    {
      id v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v24, "count"));
      if (v25)
      {
        id v37 = v3;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v26 = v24;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v42;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v42 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = +[MOWebDomain initializeWithPersistableValue:](MOWebDomain, "initializeWithPersistableValue:", *(void *)(*((void *)&v41 + 1) + 8 * k), v37, v38, v39);
              [v25 addObject:v31];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
          }
          while (v28);
        }

        id v3 = v37;
      }
    }
    else
    {
      id v25 = 0;
    }
    v32 = [MOWebContentFilterPolicy alloc];
    id v33 = (void *)[v7 copy];
    v34 = (void *)[v17 copy];
    v35 = (void *)[v25 copy];
    v14 = [(MOWebContentFilterPolicy *)v32 initWithAutoAllow:v33 neverAllow:v34 onlyAllow:v35];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 objectForKeyedSubscript:@"autoAllow"];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v21 = 0;
LABEL_44:

        goto LABEL_45;
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v32;
LABEL_6:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!+[MOWebDomain isValidPersistableRepresentation:*(void *)(*((void *)&v31 + 1) + 8 * v10)])goto LABEL_36; {
          if (v8 == ++v10)
          }
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
            if (v8) {
              goto LABEL_6;
            }
            break;
          }
        }
      }
    }
    id v6 = [v4 objectForKeyedSubscript:@"neverAllow"];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_36:
        BOOL v21 = 0;
LABEL_43:

        goto LABEL_44;
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
LABEL_17:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          if (!+[MOWebDomain isValidPersistableRepresentation:*(void *)(*((void *)&v27 + 1) + 8 * v15)])goto LABEL_38; {
          if (v13 == ++v15)
          }
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
            if (v13) {
              goto LABEL_17;
            }
            break;
          }
        }
      }
    }
    id v11 = [v4 objectForKeyedSubscript:@"onlyAllow"];
    if (!v11)
    {
      BOOL v21 = 1;
      goto LABEL_42;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v16 = v11;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v16);
            }
            if (!+[MOWebDomain isValidPersistableRepresentation:](MOWebDomain, "isValidPersistableRepresentation:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23))
            {
              BOOL v21 = 0;
              goto LABEL_41;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
      BOOL v21 = 1;
LABEL_41:

      goto LABEL_42;
    }
LABEL_38:
    BOOL v21 = 0;
LABEL_42:

    goto LABEL_43;
  }
  BOOL v21 = 0;
LABEL_45:

  return v21;
}

- (MOWebContentFilterPolicy)initWithAutoAllow:(id)a3 neverAllow:(id)a4 onlyAllow:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MOWebContentFilterPolicy;
  uint64_t v12 = [(MOWebContentFilterPolicy *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    if (v11)
    {
      v12->_policy = 3;
      p_onlyAllow = (id *)&v12->_onlyAllow;
      id v15 = a5;
LABEL_10:
      objc_storeStrong(p_onlyAllow, v15);
      goto LABEL_11;
    }
    if (v9)
    {
      v12->_policy = 2;
      objc_storeStrong((id *)&v12->_autoAllow, a3);
      if (!v10)
      {
        uint64_t v16 = objc_opt_new();
        neverAllow = v13->_neverAllow;
        v13->_neverAllow = (NSSet *)v16;

        goto LABEL_11;
      }
    }
    else
    {
      if (!v10)
      {
        v12->_policy = 0;
        goto LABEL_11;
      }
      v12->_policy = 1;
    }
    p_onlyAllow = (id *)&v13->_neverAllow;
    id v15 = a4;
    goto LABEL_10;
  }
LABEL_11:

  return v13;
}

+ (id)nonePolicy
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAutoAllow:0 neverAllow:0 onlyAllow:0];
  return v2;
}

+ (id)specificPolicyWithDomains:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAutoAllow:0 neverAllow:v3 onlyAllow:0];

  return v4;
}

+ (id)autoPolicyWithDomains:(id)a3 exceptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAutoAllow:v5 neverAllow:v6 onlyAllow:0];

  return v7;
}

+ (id)allPolicyWithExceptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAutoAllow:0 neverAllow:0 onlyAllow:v3];

  return v4;
}

- (int64_t)policy
{
  return self->_policy;
}

- (NSSet)autoAllow
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)neverAllow
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)onlyAllow
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onlyAllow, 0);
  objc_storeStrong((id *)&self->_neverAllow, 0);
  objc_storeStrong((id *)&self->_autoAllow, 0);
}

@end