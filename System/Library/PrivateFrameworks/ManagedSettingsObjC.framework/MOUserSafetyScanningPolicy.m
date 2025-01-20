@interface MOUserSafetyScanningPolicy
+ (BOOL)isValidPersistableRepresentation:(id)a3;
+ (id)communicationSafetyWithInterventionType:(id)a3;
+ (id)initializeWithPersistableValue:(id)a3;
+ (id)nonePolicy;
+ (id)nudityDetectionPolicyWithAllServices:(id)a3 allApplications:(id)a4;
+ (id)nudityDetectionPolicyWithServices:(id)a3 applications:(id)a4;
- (MOUserSafetyScanningPolicy)initWithAllServices:(id)a3 allApplications:(id)a4 interventionType:(id)a5;
- (NSDictionary)allApplications;
- (NSDictionary)allServices;
- (NSSet)applications;
- (NSSet)services;
- (NSString)interventionType;
- (id)persistableValue;
- (int64_t)policy;
@end

@implementation MOUserSafetyScanningPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interventionType, 0);
  objc_storeStrong((id *)&self->_allApplications, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
}

- (id)persistableValue
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MOUserSafetyScanningPolicy *)self policy];
  if (v3 == 2)
  {
    v28 = [(MOUserSafetyScanningPolicy *)self interventionType];
    v26 = (void *)[v28 copy];

    v41 = @"interventionType";
    v42 = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
LABEL_25:

    goto LABEL_27;
  }
  if (v3 == 1)
  {
    uint64_t v32 = objc_opt_new();
    v31 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v4 = [(MOUserSafetyScanningPolicy *)self allServices];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v38 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v10 = [(MOUserSafetyScanningPolicy *)self allServices];
          v11 = [v10 objectForKeyedSubscript:v9];
          int v12 = [v11 BOOLValue];

          if (v12) {
            v13 = (void *)v32;
          }
          else {
            v13 = v31;
          }
          [v13 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v6);
    }

    v14 = objc_opt_new();
    v15 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = [(MOUserSafetyScanningPolicy *)self allApplications];
    uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          v21 = [(MOUserSafetyScanningPolicy *)self allApplications];
          v22 = [v21 objectForKeyedSubscript:v20];
          int v23 = [v22 BOOLValue];

          v24 = [v20 persistableValue];
          if (v23) {
            v25 = v14;
          }
          else {
            v25 = v15;
          }
          [v25 addObject:v24];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v17);
    }

    v43[0] = @"onServices";
    v43[1] = @"offServices";
    v26 = (void *)v32;
    v44[0] = v32;
    v44[1] = v31;
    v43[2] = @"onApplications";
    v43[3] = @"offApplications";
    v44[2] = v14;
    v44[3] = v15;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:4];

    goto LABEL_25;
  }
  v27 = (void *)MEMORY[0x1E4F1CC08];
LABEL_27:
  return v27;
}

- (int64_t)policy
{
  return self->_policy;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"interventionType"];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v29 = 0;
LABEL_56:

        goto LABEL_57;
      }
    }
    uint64_t v6 = [v4 objectForKeyedSubscript:@"onServices"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"offServices"];
    v8 = [v4 objectForKeyedSubscript:@"onApplications"];
    uint64_t v9 = [v4 objectForKeyedSubscript:@"offApplications"];
    v10 = (void *)v9;
    if (v6 && v7 && v8 && v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v29 = 0;
        goto LABEL_55;
      }
      v31 = v8;
      uint64_t v32 = v7;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v46;
LABEL_11:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_53;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v52 count:16];
            if (v13) {
              goto LABEL_11;
            }
            break;
          }
        }
      }

      objc_opt_class();
      uint64_t v7 = v32;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v29 = 0;
        goto LABEL_55;
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v11 = v32;
      uint64_t v16 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v42;
LABEL_20:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v11);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
            if (v17) {
              goto LABEL_20;
            }
            goto LABEL_26;
          }
        }
LABEL_53:

        BOOL v29 = 0;
        uint64_t v7 = v32;
        goto LABEL_55;
      }
LABEL_26:

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v29 = 0;
        uint64_t v7 = v32;
        goto LABEL_55;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v20 = v8;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v38;
LABEL_29:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          if (!+[MOApplication isValidPersistableRepresentation:*(void *)(*((void *)&v37 + 1) + 8 * v24)])goto LABEL_59; {
          if (v22 == ++v24)
          }
          {
            uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
            if (v22) {
              goto LABEL_29;
            }
            break;
          }
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_60:
        BOOL v29 = 0;
        v8 = v31;
        uint64_t v7 = v32;
        goto LABEL_55;
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v20 = v10;
      uint64_t v25 = [v20 countByEnumeratingWithState:&v33 objects:v49 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v34;
LABEL_38:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v20);
          }
          if (!+[MOApplication isValidPersistableRepresentation:*(void *)(*((void *)&v33 + 1) + 8 * v28)])break; {
          if (v26 == ++v28)
          }
          {
            uint64_t v26 = [v20 countByEnumeratingWithState:&v33 objects:v49 count:16];
            if (v26) {
              goto LABEL_38;
            }
            goto LABEL_44;
          }
        }
LABEL_59:

        goto LABEL_60;
      }
LABEL_44:

      v8 = v31;
      uint64_t v7 = v32;
    }
    else
    {
      BOOL v29 = 0;
      if (v6 || v7 || v8 || v9) {
        goto LABEL_55;
      }
    }
    BOOL v29 = 1;
LABEL_55:

    goto LABEL_56;
  }
  BOOL v29 = 0;
LABEL_57:

  return v29;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = 0x1E61CB000uLL;
  if (+[MOUserSafetyScanningPolicy isValidPersistableRepresentation:v3])
  {
    id v5 = v3;
    uint64_t v6 = [v5 objectForKeyedSubscript:@"onServices"];
    uint64_t v7 = [v5 objectForKeyedSubscript:@"offServices"];
    v8 = [v5 objectForKeyedSubscript:@"onApplications"];
    uint64_t v9 = [v5 objectForKeyedSubscript:@"offApplications"];
    v10 = 0;
    long long v48 = v8;
    v49 = (void *)v7;
    long long v47 = (void *)v9;
    if (v6 && v7 && v8)
    {
      id v11 = 0;
      if (v9)
      {
        id v46 = v3;
        id v11 = objc_opt_new();
        v10 = objc_opt_new();
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v12 = v6;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v62 objects:v69 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v63;
          uint64_t v16 = MEMORY[0x1E4F1CC38];
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v63 != v15) {
                objc_enumerationMutation(v12);
              }
              [v11 setObject:v16 forKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * i)];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v62 objects:v69 count:16];
          }
          while (v14);
        }

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v18 = v49;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v59;
          uint64_t v22 = MEMORY[0x1E4F1CC28];
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v59 != v21) {
                objc_enumerationMutation(v18);
              }
              [v11 setObject:v22 forKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * j)];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v20);
        }
        long long v45 = v6;

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v24 = v8;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v67 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v55;
          uint64_t v28 = MEMORY[0x1E4F1CC38];
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v55 != v27) {
                objc_enumerationMutation(v24);
              }
              v30 = +[MOApplication initializeWithPersistableValue:*(void *)(*((void *)&v54 + 1) + 8 * k)];
              [v10 setObject:v28 forKeyedSubscript:v30];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v67 count:16];
          }
          while (v26);
        }

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v31 = v47;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v51;
          uint64_t v35 = MEMORY[0x1E4F1CC28];
          do
          {
            for (uint64_t m = 0; m != v33; ++m)
            {
              if (*(void *)v51 != v34) {
                objc_enumerationMutation(v31);
              }
              long long v37 = +[MOApplication initializeWithPersistableValue:*(void *)(*((void *)&v50 + 1) + 8 * m)];
              [v10 setObject:v35 forKeyedSubscript:v37];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v66 count:16];
          }
          while (v33);
        }

        uint64_t v6 = v45;
        id v3 = v46;
        unint64_t v4 = 0x1E61CB000;
      }
    }
    else
    {
      id v11 = 0;
    }
    long long v39 = [v5 objectForKeyedSubscript:@"interventionType"];
    id v40 = objc_alloc(*(Class *)(v4 + 2952));
    long long v41 = (void *)[v11 copy];
    long long v42 = (void *)[v10 copy];
    long long v43 = (void *)[v39 copy];
    long long v38 = (void *)[v40 initWithAllServices:v41 allApplications:v42 interventionType:v43];
  }
  else
  {
    long long v38 = 0;
  }

  return v38;
}

- (MOUserSafetyScanningPolicy)initWithAllServices:(id)a3 allApplications:(id)a4 interventionType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MOUserSafetyScanningPolicy;
  id v12 = [(MOUserSafetyScanningPolicy *)&v17 init];
  uint64_t v13 = v12;
  if (v11)
  {
    v12->_policy = 2;
    p_interventionType = (id *)&v12->_interventionType;
    id v15 = a5;
  }
  else
  {
    if (!v9 || !v10)
    {
      v12->_policy = 0;
      goto LABEL_8;
    }
    v12->_policy = 1;
    objc_storeStrong((id *)&v12->_allServices, a3);
    p_interventionType = (id *)&v13->_allApplications;
    id v15 = a4;
  }
  objc_storeStrong(p_interventionType, v15);
LABEL_8:

  return v13;
}

+ (id)nonePolicy
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAllServices:0 allApplications:0 interventionType:0];
  return v2;
}

- (NSSet)services
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_allServices)
  {
    id v3 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v4 = self->_allServices;
    uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v10 = -[NSDictionary objectForKeyedSubscript:](self->_allServices, "objectForKeyedSubscript:", v9, (void)v13);
          int v11 = [v10 BOOLValue];

          if (v11) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSSet)applications
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_allApplications)
  {
    id v3 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v4 = self->_allApplications;
    uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v10 = -[NSDictionary objectForKeyedSubscript:](self->_allApplications, "objectForKeyedSubscript:", v9, (void)v13);
          int v11 = [v10 BOOLValue];

          if (v11) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSSet *)v3;
}

+ (id)nudityDetectionPolicyWithServices:(id)a3 applications:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 setObject:v12 forKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    uint64_t v19 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  uint64_t v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAllServices:v7 allApplications:v14 interventionType:0];
  return v21;
}

+ (id)nudityDetectionPolicyWithAllServices:(id)a3 allApplications:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAllServices:v6 allApplications:v5 interventionType:0];

  return v7;
}

+ (id)communicationSafetyWithInterventionType:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAllServices:0 allApplications:0 interventionType:v3];

  return v4;
}

- (NSDictionary)allServices
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)allApplications
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)interventionType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

@end