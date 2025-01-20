@interface ASTSuiteResultSection
- (ASTSuiteResultSection)initWithDictionary:(id)a3 error:(id *)a4;
- (ASTSuiteResultSection)initWithTitle:(id)a3 tests:(id)a4;
- (NSArray)tests;
- (NSString)title;
- (void)setTests:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ASTSuiteResultSection

- (ASTSuiteResultSection)initWithTitle:(id)a3 tests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTSuiteResultSection;
  v9 = [(ASTSuiteResultSection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_tests, a4);
  }

  return v10;
}

- (ASTSuiteResultSection)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ASTSuiteResultSection;
  id v7 = [(ASTSuiteResultSection *)&v29 init];
  if (!v7)
  {
LABEL_19:
    v11 = v7;
    goto LABEL_21;
  }
  id v8 = [v6 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"tests"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = v6;
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
          v18 = [[ASTSuiteResultTest alloc] initWithDictionary:*(void *)(*((void *)&v25 + 1) + 8 * v17) error:a4];
          if (!v18)
          {

            v11 = 0;
            id v6 = v24;
            goto LABEL_21;
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

    title = v7->_title;
    v7->_title = (NSString *)v8;
    id v21 = v8;

    tests = v7->_tests;
    v7->_tests = v12;

    id v6 = v24;
    goto LABEL_19;
  }
  v10 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[ASTSuiteResult initWithDictionary:error:]((uint64_t)v7, v10);
  }

  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
  }

  v11 = 0;
LABEL_21:

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tests, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end