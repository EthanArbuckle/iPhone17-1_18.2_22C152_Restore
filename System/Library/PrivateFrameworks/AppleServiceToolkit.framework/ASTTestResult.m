@interface ASTTestResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithTestId:(id)a3 parameters:(id)a4;
- (ASTTestResult)init;
- (ASTTestResult)initWithCoder:(id)a3;
- (ASTTestResult)initWithTestId:(id)a3 parameters:(id)a4;
- (ASTUploadFilesResult)uploadFiles;
- (BOOL)sealWithFileSigner:(id)a3 error:(id *)a4;
- (NSArray)files;
- (NSDictionary)data;
- (NSDictionary)dictionary;
- (NSDictionary)predicates;
- (NSNumber)allowCellularSizeThreshold;
- (NSNumber)statusCode;
- (NSNumber)testId;
- (double)testDuration;
- (id)generatePayload;
- (void)encodeWithCoder:(id)a3;
- (void)sealWithPayload:(id)a3 signature:(id)a4;
- (void)sealWithSealableFiles:(id)a3;
- (void)setAllowCellularSizeThreshold:(id)a3;
- (void)setData:(id)a3;
- (void)setFiles:(id)a3;
- (void)setPredicates:(id)a3;
- (void)setStatusCode:(id)a3;
- (void)setTestDuration:(double)a3;
- (void)setUploadFiles:(id)a3;
- (void)setUploadStatusFromSource:(id)a3 withArray:(id)a4;
@end

@implementation ASTTestResult

- (ASTTestResult)init
{
  v3 = [MEMORY[0x263EFF9D0] null];
  v4 = [(ASTTestResult *)self initWithTestId:v3 parameters:MEMORY[0x263EFFA78]];

  return v4;
}

- (ASTTestResult)initWithTestId:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASTTestResult;
  v9 = [(ASTTestResult *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testId, a3);
    uint64_t v11 = [v8 objectForKeyedSubscript:@"predicates"];
    predicates = v10->_predicates;
    v10->_predicates = (NSDictionary *)v11;

    v10->_testDuration = 0.0;
    statusCode = v10->_statusCode;
    v10->_statusCode = (NSNumber *)&unk_26F0B58F8;
  }
  return v10;
}

+ (id)resultWithTestId:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTestId:v7 parameters:v6];

  return v8;
}

- (id)generatePayload
{
  v41[7] = *MEMORY[0x263EF8340];
  v3 = [(ASTTestResult *)self testId];
  if (v3) {
    [(ASTTestResult *)self testId];
  }
  else {
  uint64_t v4 = [MEMORY[0x263EFF9D0] null];
  }

  v5 = [(ASTTestResult *)self statusCode];
  if (v5) {
    [(ASTTestResult *)self statusCode];
  }
  else {
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  }

  v40[0] = @"_id";
  v38 = @"sd";
  v36 = @"$date";
  id v7 = NSNumber;
  v31 = [MEMORY[0x263EFF910] date];
  [v31 timeIntervalSince1970];
  v30 = [v7 numberWithDouble:v8 * 1000.0];
  v37 = v30;
  v29 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v39 = v29;
  v28 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v41[0] = v28;
  v40[1] = @"d";
  v9 = [(ASTTestResult *)self predicates];
  if (v9)
  {
    v10 = [(ASTTestResult *)self predicates];
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA78];
  }
  v41[1] = v10;
  v41[2] = v4;
  v33 = (void *)v4;
  v40[2] = @"k";
  v40[3] = @"e";
  uint64_t v11 = NSNumber;
  v12 = +[ASTEnvironment currentEnvironment];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "environmentType"));
  v41[3] = v13;
  v40[4] = @"t";
  v14 = NSNumber;
  [(ASTTestResult *)self testDuration];
  objc_super v15 = objc_msgSend(v14, "numberWithDouble:");
  v41[4] = v15;
  v41[5] = v6;
  v32 = (void *)v6;
  v40[5] = @"s";
  v40[6] = @"data";
  v16 = [(ASTTestResult *)self data];
  if (v16)
  {
    v17 = [(ASTTestResult *)self data];
  }
  else
  {
    v17 = (void *)MEMORY[0x263EFFA78];
  }
  v41[6] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:7];
  v19 = (void *)[v18 mutableCopy];

  if (v16) {
  if (v9)
  }

  uint64_t v20 = [(ASTTestResult *)self uploadFiles];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(ASTTestResult *)self uploadFiles];
    char v23 = [v22 isEmpty];

    if ((v23 & 1) == 0)
    {
      v24 = [(ASTTestResult *)self uploadFiles];
      v25 = [v24 generatePayload];
      [v19 setValue:v25 forKey:@"f"];
    }
  }
  v34[0] = @"results";
  v34[1] = @"test";
  v35[0] = v19;
  v35[1] = v33;
  v26 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  return v26;
}

- (BOOL)sealWithFileSigner:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(ASTTestResult *)self files];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (v11) {
          char v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) sealWithFileSigner:v6 error:a4];
        }
        else {
          char v11 = 0;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    char v11 = 1;
  }

  [(ASTSealablePayload *)self setSealed:1];
  return v11;
}

- (void)sealWithPayload:(id)a3 signature:(id)a4
{
  id v6 = a4;
  [(ASTSealablePayload *)self setPayload:a3];
  [(ASTSealablePayload *)self setSignature:v6];

  id v7 = [(ASTSealablePayload *)self signature];

  if (v7)
  {
    uint64_t v8 = [(ASTSealablePayload *)self signature];
    uint64_t v9 = [v8 base64EncodedStringWithOptions:0];
    [(ASTSealablePayload *)self setBase64Signature:v9];
  }

  [(ASTSealablePayload *)self setSealed:1];
}

- (void)sealWithSealableFiles:(id)a3
{
  [(ASTTestResult *)self setFiles:a3];

  [(ASTTestResult *)self sealWithFileSigner:0 error:0];
}

- (void)setStatusCode:(id)a3
{
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setData:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setFiles:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setUploadFiles:(id)a3
{
}

- (ASTUploadFilesResult)uploadFiles
{
  return self->_uploadFiles;
}

- (void)setTestDuration:(double)a3
{
  self->_testDuration = a3;
}

- (double)testDuration
{
  return self->_testDuration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTTestResult)initWithCoder:(id)a3
{
  v23[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ASTTestResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testId"];
    testId = v5->_testId;
    v5->_testId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusCode"];
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v8;

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"files"];
    files = v5->_files;
    v5->_files = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadFiles"];
    uploadFiles = v5->_uploadFiles;
    v5->_uploadFiles = (ASTUploadFilesResult *)v17;

    [v4 decodeDoubleForKey:@"testDuration"];
    v5->_testDuration = v19;
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowCellularSizeThreshold"];
    allowCellularSizeThreshold = v5->_allowCellularSizeThreshold;
    v5->_allowCellularSizeThreshold = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTTestResult *)self testId];
  [v4 encodeObject:v5 forKey:@"testId"];

  uint64_t v6 = [(ASTTestResult *)self statusCode];
  [v4 encodeObject:v6 forKey:@"statusCode"];

  id v7 = [(ASTTestResult *)self data];
  [v4 encodeObject:v7 forKey:@"data"];

  uint64_t v8 = [(ASTTestResult *)self files];
  [v4 encodeObject:v8 forKey:@"files"];

  uint64_t v9 = [(ASTTestResult *)self uploadFiles];
  [v4 encodeObject:v9 forKey:@"uploadFiles"];

  [(ASTTestResult *)self testDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"testDuration");
  id v10 = [(ASTTestResult *)self allowCellularSizeThreshold];
  [v4 encodeObject:v10 forKey:@"allowCellularSizeThreshold"];
}

- (void)setUploadStatusFromSource:(id)a3 withArray:(id)a4
{
  if (a4)
  {
    +[ASTUploadFilesResult resultFromSource:andUploadDictionaries:](ASTUploadFilesResult, "resultFromSource:andUploadDictionaries:", a3);
    self->_uploadFiles = (ASTUploadFilesResult *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x270F9A758]();
  }
  else
  {
    v5 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ASTTestResult setUploadStatusFromSource:withArray:](v5);
    }
  }
}

- (NSNumber)allowCellularSizeThreshold
{
  return self->_allowCellularSizeThreshold;
}

- (void)setAllowCellularSizeThreshold:(id)a3
{
}

- (NSNumber)testId
{
  return self->_testId;
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_testId, 0);
  objc_storeStrong((id *)&self->_allowCellularSizeThreshold, 0);
  objc_storeStrong((id *)&self->_uploadFiles, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_statusCode, 0);
}

- (void)setUploadStatusFromSource:(os_log_t)log withArray:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "Invalid format for upload files array.", v1, 2u);
}

@end