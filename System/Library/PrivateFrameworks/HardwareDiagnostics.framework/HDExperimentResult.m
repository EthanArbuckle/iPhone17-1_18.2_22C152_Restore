@interface HDExperimentResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExperimentResult:(id)a3;
- (HDExperimentResult)init;
- (HDExperimentResult)initWithCoder:(id)a3;
- (NSMutableDictionary)auxiliaryData;
- (NSMutableDictionary)files;
- (NSMutableDictionary)measurements;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDExperimentResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExperimentResult)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDExperimentResult;
  v2 = [(HDExperimentResult *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    measurements = v2->_measurements;
    v2->_measurements = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    auxiliaryData = v2->_auxiliaryData;
    v2->_auxiliaryData = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    files = v2->_files;
    v2->_files = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (HDExperimentResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HDExperimentResult;
  uint64_t v5 = [(HDExperimentResult *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HDExperimentResult.measurement"];
    measurements = v5->_measurements;
    v5->_measurements = (NSMutableDictionary *)v10;

    v12 = HDAuxDataDecodingClassAllowList();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"HDExperimentResult.auxiliaryData"];
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSMutableDictionary *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"HDExperimentResult.files"];
    files = v5->_files;
    v5->_files = (NSMutableDictionary *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  measurements = self->_measurements;
  id v5 = a3;
  [v5 encodeObject:measurements forKey:@"HDExperimentResult.measurement"];
  [v5 encodeObject:self->_auxiliaryData forKey:@"HDExperimentResult.auxiliaryData"];
  [v5 encodeObject:self->_files forKey:@"HDExperimentResult.files"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [v4 measurements];
  [v5 addEntriesFromDictionary:self->_measurements];

  v6 = [v4 auxiliaryData];
  [v6 addEntriesFromDictionary:self->_auxiliaryData];

  uint64_t v7 = [v4 files];
  [v7 addEntriesFromDictionary:self->_files];

  return v4;
}

- (id)dictionaryRepresentation
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  if ([(NSMutableDictionary *)self->_auxiliaryData count])
  {
    id v4 = (void *)[(NSMutableDictionary *)self->_auxiliaryData copy];
    [v3 setObject:v4 forKeyedSubscript:@"auxiliary-data"];
  }
  if ([(NSMutableDictionary *)self->_files count])
  {
    id v5 = v3;
    v6 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v7 = self->_files;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v13 = [(NSMutableDictionary *)self->_files objectForKeyedSubscript:v12];
          v14 = [v13 absoluteString];
          [v6 setObject:v14 forKeyedSubscript:v12];
        }
        uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v9);
    }

    v15 = (void *)[v6 copy];
    uint64_t v3 = v5;
    [v5 setObject:v15 forKeyedSubscript:@"files"];
  }
  if ([(NSMutableDictionary *)self->_measurements count])
  {
    v30 = v3;
    v33 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = self->_measurements;
    uint64_t v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v32 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * j);
          v42[0] = @"value";
          v20 = NSNumber;
          v21 = -[NSMutableDictionary objectForKeyedSubscript:](self->_measurements, "objectForKeyedSubscript:", v19, v30);
          [v21 doubleValue];
          objc_super v22 = objc_msgSend(v20, "numberWithDouble:");
          v42[1] = @"units";
          v43[0] = v22;
          v23 = [(NSMutableDictionary *)self->_measurements objectForKeyedSubscript:v19];
          v24 = [v23 unit];
          v25 = [v24 symbol];
          v43[1] = v25;
          v26 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
          [v33 setObject:v26 forKey:v19];
        }
        uint64_t v17 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v17);
    }

    v27 = (void *)[v33 copy];
    uint64_t v3 = v30;
    [v30 setObject:v27 forKeyedSubscript:@"measurements"];
  }
  v28 = objc_msgSend(v3, "copy", v30);

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDExperimentResult *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HDExperimentResult *)self isEqualToExperimentResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToExperimentResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 auxiliaryData];
  v6 = [(HDExperimentResult *)self auxiliaryData];
  char v7 = [v5 isEqualToDictionary:v6];

  uint64_t v8 = [v4 files];
  uint64_t v9 = [(HDExperimentResult *)self files];
  char v10 = [v8 isEqualToDictionary:v9];

  v11 = [v4 measurements];
  uint64_t v12 = [(HDExperimentResult *)self measurements];
  int v13 = [v11 isEqualToDictionary:v12];

  if (v13)
  {
    char v14 = v7 & v10;
  }
  else
  {
    v15 = [v4 measurements];
    uint64_t v16 = (void *)[v15 copy];

    uint64_t v17 = [(HDExperimentResult *)self measurements];
    v18 = (void *)[v17 copy];

    uint64_t v19 = (void *)MEMORY[0x263EFFA08];
    v20 = [v16 allKeys];
    v21 = [v19 setWithArray:v20];
    objc_super v22 = (void *)MEMORY[0x263EFFA08];
    v23 = [v18 allKeys];
    v24 = [v22 setWithArray:v23];
    int v25 = [v21 isEqualToSet:v24];

    if (v25)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 1;
      v26 = [v4 measurements];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __48__HDExperimentResult_isEqualToExperimentResult___block_invoke;
      v29[3] = &unk_264D00158;
      id v30 = v18;
      v31 = &v32;
      [v26 enumerateKeysAndObjectsUsingBlock:v29];

      if (*((unsigned char *)v33 + 24)) {
        char v27 = v7;
      }
      else {
        char v27 = 0;
      }
      char v14 = v27 & v10;

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

void __48__HDExperimentResult_isEqualToExperimentResult___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
  uint64_t v9 = v8;
  if (!v8)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Unexpectedly missing measurement for key %@", v14 format];
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_7;
  }
  char v10 = [v8 unit];
  int v11 = [v7 canBeConvertedToUnit:v10];

  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = [v9 unit];
  int v13 = [v7 measurementByConvertingToUnit:v12];

  id v7 = v13;
  if (([v13 isEqual:v9] & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
}

- (NSMutableDictionary)measurements
{
  return self->_measurements;
}

- (NSMutableDictionary)auxiliaryData
{
  return self->_auxiliaryData;
}

- (NSMutableDictionary)files
{
  return self->_files;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_auxiliaryData, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
}

@end