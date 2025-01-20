@interface ASTSuiteResult
- (ASTSuiteResult)initWithDictionary:(id)a3 error:(id *)a4;
- (ASTSuiteResult)initWithName:(id)a3 components:(id)a4;
- (NSArray)components;
- (NSString)suiteName;
- (void)setComponents:(id)a3;
- (void)setSuiteName:(id)a3;
@end

@implementation ASTSuiteResult

- (ASTSuiteResult)initWithName:(id)a3 components:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTSuiteResult;
  v9 = [(ASTSuiteResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suiteName, a3);
    objc_storeStrong((id *)&v10->_components, a4);
  }

  return v10;
}

- (ASTSuiteResult)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ASTSuiteResult;
  id v7 = [(ASTSuiteResult *)&v29 init];
  if (!v7)
  {
LABEL_19:
    v11 = v7;
    goto LABEL_20;
  }
  id v8 = [v6 objectForKeyedSubscript:@"suiteName"];
  v9 = [v6 objectForKeyedSubscript:@"components"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = v8;
      objc_super v12 = [MEMORY[0x263EFF980] array];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        while (2)
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = [[ASTSuiteResultComponent alloc] initWithDictionary:*(void *)(*((void *)&v25 + 1) + 8 * v17) error:a4];
            if (!v18)
            {

              goto LABEL_9;
            }
            v19 = v18;
            [(NSArray *)v12 addObject:v18];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      suiteName = v7->_suiteName;
      v7->_suiteName = (NSString *)v24;
      id v21 = v24;

      components = v7->_components;
      v7->_components = v12;

      goto LABEL_19;
    }
  }
  v10 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[ASTSuiteResult initWithDictionary:error:]((uint64_t)v7, v10);
  }

  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
  }

LABEL_9:
  v11 = 0;
LABEL_20:

  return v11;
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_suiteName, 0);
}

- (void)initWithDictionary:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "[%@] Bad dictionary format", (uint8_t *)&v4, 0xCu);
}

@end