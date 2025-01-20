@interface ASTSuiteResultTest
- (ASTSuiteResultStatus)status;
- (ASTSuiteResultTest)initWithDictionary:(id)a3 error:(id *)a4;
- (ASTSuiteResultTest)initWithTestID:(id)a3 name:(id)a4 value:(id)a5 status:(id)a6 result:(id)a7 description:(id)a8;
- (NSNumber)testID;
- (NSString)name;
- (NSString)result;
- (NSString)testDescription;
- (NSString)value;
- (void)setName:(id)a3;
- (void)setResult:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTestDescription:(id)a3;
- (void)setTestID:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ASTSuiteResultTest

- (ASTSuiteResultTest)initWithTestID:(id)a3 name:(id)a4 value:(id)a5 status:(id)a6 result:(id)a7 description:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ASTSuiteResultTest;
  v18 = [(ASTSuiteResultTest *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_testID, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_value, a5);
    objc_storeStrong((id *)&v19->_status, a6);
    objc_storeStrong((id *)&v19->_result, a7);
    objc_storeStrong((id *)&v19->_testDescription, a8);
  }

  return v19;
}

- (ASTSuiteResultTest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ASTSuiteResultTest;
  v7 = [(ASTSuiteResultTest *)&v29 init];
  if (!v7) {
    goto LABEL_15;
  }
  v8 = [v6 objectForKeyedSubscript:@"testID"];
  v28 = [v6 objectForKeyedSubscript:@"name"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v9 = 0;
  }
  v10 = [v6 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    v10 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  if (!v10) {
    goto LABEL_8;
  }
  v11 = [[ASTSuiteResultStatus alloc] initWithDictionary:v10 error:a4];
LABEL_9:
  v12 = [v6 objectForKeyedSubscript:@"summary"];
  v13 = [v6 objectForKeyedSubscript:@"testDescription"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v9 | (unint64_t)v11)
          {
            testID = v7->_testID;
            v7->_testID = v8;
            v27 = v8;

            name = v7->_name;
            v7->_name = v28;
            id v16 = v28;

            value = v7->_value;
            v7->_value = (NSString *)v9;
            id v18 = (id)v9;

            status = v7->_status;
            v7->_status = v11;
            v20 = v11;

            id v21 = v7->_result;
            v7->_result = v12;
            id v22 = v12;

            testDescription = v7->_testDescription;
            v7->_testDescription = v13;

LABEL_15:
            objc_super v24 = v7;
            goto LABEL_21;
          }
        }
      }
    }
  }
  v25 = ASTLogHandleForCategory(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[ASTSuiteResult initWithDictionary:error:]((uint64_t)v7, v25);
  }

  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-7000 userInfo:0];
  }

  objc_super v24 = 0;
LABEL_21:

  return v24;
}

- (NSNumber)testID
{
  return self->_testID;
}

- (void)setTestID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (ASTSuiteResultStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSString)testDescription
{
  return self->_testDescription;
}

- (void)setTestDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDescription, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_testID, 0);
}

@end