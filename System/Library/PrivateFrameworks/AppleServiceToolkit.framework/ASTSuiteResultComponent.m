@interface ASTSuiteResultComponent
- (ASTSuiteResultComponent)initWithDictionary:(id)a3 error:(id *)a4;
- (ASTSuiteResultComponent)initWithName:(id)a3 assetLocator:(id)a4 status:(id)a5 sections:(id)a6;
- (ASTSuiteResultStatus)status;
- (NSArray)sections;
- (NSString)assetLocator;
- (NSString)name;
- (void)setAssetLocator:(id)a3;
- (void)setName:(id)a3;
- (void)setSections:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation ASTSuiteResultComponent

- (ASTSuiteResultComponent)initWithName:(id)a3 assetLocator:(id)a4 status:(id)a5 sections:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASTSuiteResultComponent;
  v15 = [(ASTSuiteResultComponent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_assetLocator, a4);
    objc_storeStrong((id *)&v16->_status, a5);
    objc_storeStrong((id *)&v16->_sections, a6);
  }

  return v16;
}

- (ASTSuiteResultComponent)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ASTSuiteResultComponent;
  v7 = [(ASTSuiteResultComponent *)&v35 init];
  if (!v7) {
    goto LABEL_13;
  }
  v8 = [v6 objectForKeyedSubscript:@"name"];
  v9 = [v6 objectForKeyedSubscript:@"assetLocator"];
  v10 = [v6 objectForKeyedSubscript:@"sections"];
  id v11 = [v6 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASTSuiteResult initWithDictionary:error:]((uint64_t)v7, v12);
    }

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
    }
    int v13 = 1;
  }
  else
  {
    v16 = [[ASTSuiteResultStatus alloc] initWithDictionary:v11 error:a4];
    v17 = v16;
    if (v16)
    {
      v27 = v16;
      v28 = v11;
      v30 = [MEMORY[0x263EFF980] array];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      obj = v10;
      uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = [[ASTSuiteResultSection alloc] initWithDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i) error:a4];
            if (!v22)
            {
              int v13 = 1;
              v17 = v27;
              sections = obj;
              v24 = v30;
              goto LABEL_26;
            }
            v23 = v22;
            [v30 addObject:v22];
          }
          uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      objc_storeStrong((id *)&v7->_name, v8);
      objc_storeStrong((id *)&v7->_assetLocator, v9);
      v17 = v27;
      objc_storeStrong((id *)&v7->_status, v27);
      v24 = v30;
      v25 = v30;
      int v13 = 0;
      sections = v7->_sections;
      v7->_sections = v25;
LABEL_26:

      id v11 = v28;
    }
    else
    {
      int v13 = 1;
    }
  }
  if (v13) {
    id v14 = 0;
  }
  else {
LABEL_13:
  }
    id v14 = v7;

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)assetLocator
{
  return self->_assetLocator;
}

- (void)setAssetLocator:(id)a3
{
}

- (ASTSuiteResultStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_assetLocator, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end