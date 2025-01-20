@interface JETreatmentProfile
+ (id)treatmentProfileWithConfiguration:(id)a3;
+ (id)treatmentProfileWithConfiguration:(id)a3 topic:(id)a4;
- (JETreatmentProfile)initWithConfigDictionary:(id)a3 topic:(id)a4;
- (id)performTreatments:(id)a3;
@end

@implementation JETreatmentProfile

- (void).cxx_destruct
{
}

+ (id)treatmentProfileWithConfiguration:(id)a3 topic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v7) {
    v9 = [[JETreatmentProfile alloc] initWithConfigDictionary:v8 topic:v6];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (JETreatmentProfile)initWithConfigDictionary:(id)a3 topic:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)JETreatmentProfile;
  id v8 = [(JETreatmentProfile *)&v33 init];
  if (!v8) {
    goto LABEL_28;
  }
  v9 = [v6 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10 && [v10 integerValue] > 1)
  {
    v14 = [v6 objectForKeyedSubscript:@"treatments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [v6 objectForKeyedSubscript:@"treatments"];

    if (v16 && !v15)
    {
      v11 = JEMetricsOSLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      v12 = "JetEngine: Treatment profile doesn't have valid treatments configuration";
      goto LABEL_9;
    }
    v27 = v10;
    v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = +[JETreatment treatmentWithConfiguration:*(void *)(*((void *)&v28 + 1) + 8 * i) topic:v7];
          if (v23) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v20);
    }

    uint64_t v24 = [v17 copy];
    treatments = v8->_treatments;
    v8->_treatments = (NSArray *)v24;

LABEL_28:
    v13 = v8;
    goto LABEL_29;
  }
  v11 = JEMetricsOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v12 = "JetEngine: Treatment profile configuration is empty or the format version is not supported";
LABEL_9:
    _os_log_impl(&dword_19EE14000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
  }
LABEL_10:

  v13 = 0;
LABEL_29:

  return v13;
}

- (id)performTreatments:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  if (self) {
    treatments = self->_treatments;
  }
  else {
    treatments = 0;
  }
  id v6 = treatments;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  id v8 = v4;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v15;
    id v8 = v4;
    while (2)
    {
      uint64_t v11 = 0;
      v12 = v8;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        if (!v12)
        {
          id v8 = 0;
          goto LABEL_13;
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "performTreatment:", v12, (void)v14);

        ++v11;
        v12 = v8;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v8;
}

+ (id)treatmentProfileWithConfiguration:(id)a3
{
  return (id)[a1 treatmentProfileWithConfiguration:a3 topic:0];
}

@end