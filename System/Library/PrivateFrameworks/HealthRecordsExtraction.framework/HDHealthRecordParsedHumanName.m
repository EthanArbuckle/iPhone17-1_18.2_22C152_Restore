@interface HDHealthRecordParsedHumanName
+ (id)parsedNamesWithHumanNames:(id)a3 FHIRVersion:(id)a4 error:(id *)a5;
+ (id)preferredNameInNames:(id)a3 FHIRVersion:(id)a4;
- (HDHealthRecordParsedHumanName)initWithHumanNameDictionary:(id)a3 FHIRVersion:(id)a4 error:(id *)a5;
- (HKMedicalDateInterval)period;
- (NSArray)given;
- (NSArray)prefix;
- (NSArray)suffix;
- (NSString)family;
- (NSString)fullName;
- (NSString)text;
- (NSString)use;
- (id)description;
@end

@implementation HDHealthRecordParsedHumanName

- (HDHealthRecordParsedHumanName)initWithHumanNameDictionary:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)HDHealthRecordParsedHumanName;
  v10 = [(HDHealthRecordParsedHumanName *)&v39 init];
  if (!v10) {
    goto LABEL_12;
  }
  if ([v8 count])
  {
    v11 = [v8 objectForKeyedSubscript:@"use"];
    uint64_t v12 = objc_msgSend(v11, "hd_stringValue");
    use = v10->_use;
    v10->_use = (NSString *)v12;

    v14 = [v8 objectForKeyedSubscript:@"text"];
    uint64_t v15 = objc_msgSend(v14, "hd_stringValue");
    text = v10->_text;
    v10->_text = (NSString *)v15;

    v17 = [v9 FHIRRelease];
    v18 = (void *)*MEMORY[0x263F09550];

    v19 = [v8 objectForKeyedSubscript:@"family"];
    v20 = v19;
    if (v17 == v18)
    {
      v22 = objc_msgSend(v19, "hd_stringArrayValue");
      uint64_t v23 = [v22 componentsJoinedByString:@" "];
      family = v10->_family;
      v10->_family = (NSString *)v23;
    }
    else
    {
      uint64_t v21 = objc_msgSend(v19, "hd_stringValue");
      v22 = v10->_family;
      v10->_family = (NSString *)v21;
    }

    v25 = [v8 objectForKeyedSubscript:@"given"];
    uint64_t v26 = objc_msgSend(v25, "hd_stringArrayValue");
    given = v10->_given;
    v10->_given = (NSArray *)v26;

    v28 = [v8 objectForKeyedSubscript:@"prefix"];
    uint64_t v29 = objc_msgSend(v28, "hd_stringArrayValue");
    prefix = v10->_prefix;
    v10->_prefix = (NSArray *)v29;

    v31 = [v8 objectForKeyedSubscript:@"suffix"];
    uint64_t v32 = objc_msgSend(v31, "hd_stringArrayValue");
    suffix = v10->_suffix;
    v10->_suffix = (NSArray *)v32;

    v34 = [v8 objectForKeyedSubscript:@"period"];
    if (v34)
    {
      uint64_t v35 = +[HDHealthRecordsExtractionUtilities medicalDateIntervalWithPeriod:v34 error:a5];
      period = v10->_period;
      v10->_period = (HKMedicalDateInterval *)v35;

      if (!v10->_period)
      {

LABEL_16:
        v37 = 0;
        goto LABEL_13;
      }
    }
  }
  if (![(NSString *)v10->_family length]
    && ![(NSArray *)v10->_given count]
    && ![(NSString *)v10->_text length])
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"Neither given nor family name nor text is present on HumanName dictionary");
    goto LABEL_16;
  }
LABEL_12:
  v37 = v10;
LABEL_13:

  return v37;
}

- (NSString)fullName
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSArray *)self->_prefix count]) {
    [v3 addObjectsFromArray:self->_prefix];
  }
  if ([(NSArray *)self->_given count]) {
    [v3 addObjectsFromArray:self->_given];
  }
  if ([(NSString *)self->_family length]) {
    [v3 addObject:self->_family];
  }
  if ([(NSArray *)self->_suffix count]) {
    [v3 addObjectsFromArray:self->_suffix];
  }
  if ([v3 count])
  {
    uint64_t v4 = [v3 componentsJoinedByString:@" "];
    v5 = (void *)v4;
    v6 = &stru_26E6ADF80;
    if (v4) {
      v6 = (__CFString *)v4;
    }
    v7 = v6;
  }
  else
  {
    text = (__CFString *)self->_text;
    if (!text) {
      text = &stru_26E6ADF80;
    }
    v7 = text;
  }

  return (NSString *)v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(HDHealthRecordParsedHumanName *)self fullName];
  v6 = (void *)[v3 initWithFormat:@"<%@:%p name: \"%@\"; use: %@>", v4, self, v5, self->_use];

  return v6;
}

+ (id)parsedNamesWithHumanNames:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  id v9 = HKSafeObject();
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      v22 = v9;
      id v23 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_opt_class();
          uint64_t v16 = HKSafeObject();
          if (!v16) {
            goto LABEL_14;
          }
          v17 = (void *)v16;
          v18 = [[HDHealthRecordParsedHumanName alloc] initWithHumanNameDictionary:v16 FHIRVersion:v8 error:a5];
          if (!v18)
          {

LABEL_14:
            id v20 = 0;
            id v9 = v22;
            id v7 = v23;
            goto LABEL_15;
          }
          v19 = v18;
          [v10 addObject:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        id v9 = v22;
        id v7 = v23;
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v20 = v10;
LABEL_15:
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

+ (id)preferredNameInNames:(id)a3 FHIRVersion:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"HDHealthRecordParsedHumanName.m", 116, @"Invalid parameter not satisfying: %@", @"[names isKindOfClass:[NSArray class]]" object file lineNumber description];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF910]);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __66__HDHealthRecordParsedHumanName_preferredNameInNames_FHIRVersion___block_invoke;
  v41[3] = &unk_264BD9A00;
  id v8 = v7;
  id v42 = v8;
  id v9 = objc_msgSend(v6, "hk_filter:", v41);
  if ([v9 count])
  {
    id v31 = v8;
    id v32 = v6;
    v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:7];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v30 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v17 = [v16 use];
          v18 = (void *)v17;
          if (v17) {
            v19 = (__CFString *)v17;
          }
          else {
            v19 = @"{none}";
          }
          id v20 = v19;

          if ([&unk_26E6B3688 containsObject:v20])
          {
            uint64_t v21 = [v10 objectForKeyedSubscript:v20];

            if (!v21) {
              [v10 setObject:v16 forKeyedSubscript:v20];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v13);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v22 = [&unk_26E6B3688 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      id v9 = v30;
      while (2)
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(&unk_26E6B3688);
          }
          uint64_t v26 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          if (v26)
          {
            long long v27 = (void *)v26;
            goto LABEL_29;
          }
        }
        uint64_t v23 = [&unk_26E6B3688 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v23) {
          continue;
        }
        break;
      }
      long long v27 = 0;
    }
    else
    {
      long long v27 = 0;
      id v9 = v30;
    }
LABEL_29:

    id v8 = v31;
    id v6 = v32;
  }
  else
  {
    long long v27 = 0;
  }

  return v27;
}

uint64_t __66__HDHealthRecordParsedHumanName_preferredNameInNames_FHIRVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 period];
    uint64_t v5 = [v4 endDate];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = *(void **)(a1 + 32);
      id v8 = [v3 period];
      id v9 = [v8 endDate];
      v10 = [v9 dateForUTC];
      id v11 = [v10 laterDate:*(void *)(a1 + 32)];
      BOOL v12 = v7 == v11;

      char v13 = !v12;
    }
    else
    {

      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (NSString)use
{
  return self->_use;
}

- (NSString)family
{
  return self->_family;
}

- (NSArray)given
{
  return self->_given;
}

- (NSArray)prefix
{
  return self->_prefix;
}

- (NSArray)suffix
{
  return self->_suffix;
}

- (NSString)text
{
  return self->_text;
}

- (HKMedicalDateInterval)period
{
  return self->_period;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_period, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_given, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_use, 0);
}

@end