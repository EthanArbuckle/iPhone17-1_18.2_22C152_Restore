@interface HDAnalysisResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAnalysisResult:(id)a3;
- (HDAnalysisResult)init;
- (HDAnalysisResult)initWithCoder:(id)a3;
- (NSMutableArray)measuredResults;
- (NSMutableDictionary)auxiliaryData;
- (NSMutableDictionary)files;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDAnalysisResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDAnalysisResult)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDAnalysisResult;
  v2 = [(HDAnalysisResult *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    measuredResults = v2->_measuredResults;
    v2->_measuredResults = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    auxiliaryData = v2->_auxiliaryData;
    v2->_auxiliaryData = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    files = v2->_files;
    v2->_files = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (HDAnalysisResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDAnalysisResult;
  uint64_t v5 = [(HDAnalysisResult *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HDAnalysisResult.measuredResults"];
    measuredResults = v5->_measuredResults;
    v5->_measuredResults = (NSMutableArray *)v9;

    v11 = HDAuxDataDecodingClassAllowList();
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"HDAnalysisResult.auxiliaryData"];
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSMutableDictionary *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"HDAnalysisResult.files"];
    files = v5->_files;
    v5->_files = (NSMutableDictionary *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  measuredResults = self->_measuredResults;
  id v5 = a3;
  [v5 encodeObject:measuredResults forKey:@"HDAnalysisResult.measuredResults"];
  [v5 encodeObject:self->_auxiliaryData forKey:@"HDAnalysisResult.auxiliaryData"];
  [v5 encodeObject:self->_files forKey:@"HDAnalysisResult.files"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [v4 measuredResults];
  [v5 addObjectsFromArray:self->_measuredResults];

  v6 = [v4 auxiliaryData];
  [v6 addEntriesFromDictionary:self->_auxiliaryData];

  uint64_t v7 = [v4 files];
  [v7 addEntriesFromDictionary:self->_files];

  return v4;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  if ([(NSMutableDictionary *)self->_auxiliaryData count])
  {
    id v4 = (void *)[(NSMutableDictionary *)self->_auxiliaryData copy];
    [v3 setObject:v4 forKeyedSubscript:@"auxiliary-data"];
  }
  if ([(NSMutableDictionary *)self->_files count])
  {
    id v5 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v6 = self->_files;
    uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v12 = [(NSMutableDictionary *)self->_files objectForKeyedSubscript:v11];
          v13 = [v12 absoluteString];
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
        uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v8);
    }

    v14 = (void *)[v5 copy];
    [v3 setObject:v14 forKeyedSubscript:@"files"];
  }
  if ([(NSMutableArray *)self->_measuredResults count])
  {
    uint64_t v15 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v16 = self->_measuredResults;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_super v21 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (void)v25);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }

    v22 = (void *)[v15 copy];
    [v3 setObject:v22 forKeyedSubscript:@"measured-results"];
  }
  v23 = objc_msgSend(v3, "copy", (void)v25);

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDAnalysisResult *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HDAnalysisResult *)self isEqualToAnalysisResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToAnalysisResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 measuredResults];
  v6 = [(HDAnalysisResult *)self measuredResults];
  if ([v5 isEqualToArray:v6])
  {
    uint64_t v7 = [v4 auxiliaryData];
    uint64_t v8 = [(HDAnalysisResult *)self auxiliaryData];
    if ([v7 isEqualToDictionary:v8])
    {
      uint64_t v9 = [v4 files];
      objc_super v10 = [(HDAnalysisResult *)self files];
      char v11 = [v9 isEqualToDictionary:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSMutableArray)measuredResults
{
  return self->_measuredResults;
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
  objc_storeStrong((id *)&self->_measuredResults, 0);
}

@end