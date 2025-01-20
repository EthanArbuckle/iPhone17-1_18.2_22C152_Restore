@interface DKDiagnosticResult
+ (BOOL)supportsSecureCoding;
- (DKDiagnosticResult)init;
- (DKDiagnosticResult)initWithCoder:(id)a3;
- (DKDiagnosticResult)initWithMutableResult:(id)a3;
- (NSArray)fileSandboxTokens;
- (NSArray)files;
- (NSArray)uploadStatus;
- (NSDictionary)data;
- (NSNumber)statusCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKDiagnosticResult

- (DKDiagnosticResult)init
{
  v11.receiver = self;
  v11.super_class = (Class)DKDiagnosticResult;
  v2 = [(DKDiagnosticResult *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(NSNumber) initWithInt:4294966395];
    statusCode = v2->_statusCode;
    v2->_statusCode = (NSNumber *)v3;

    data = v2->_data;
    v2->_data = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v6 = [MEMORY[0x263EFF8C0] array];
    files = v2->_files;
    v2->_files = (NSArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFF8C0] array];
    fileSandboxTokens = v2->_fileSandboxTokens;
    v2->_fileSandboxTokens = (NSArray *)v8;
  }
  return v2;
}

- (DKDiagnosticResult)initWithMutableResult:(id)a3
{
  id v4 = a3;
  v5 = [(DKDiagnosticResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 statusCode];
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v6;

    uint64_t v8 = [v4 data];
    data = v5->_data;
    v5->_data = (NSDictionary *)v8;

    uint64_t v10 = [v4 files];
    files = v5->_files;
    v5->_files = (NSArray *)v10;

    uint64_t v12 = [v4 fileSandboxTokens];
    fileSandboxTokens = v5->_fileSandboxTokens;
    v5->_fileSandboxTokens = (NSArray *)v12;

    uint64_t v14 = [v4 uploadStatus];
    uploadStatus = v5->_uploadStatus;
    v5->_uploadStatus = (NSArray *)v14;
  }
  return v5;
}

- (DKDiagnosticResult)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(DKDiagnosticResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusCode"];
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v6;

    uint64_t v8 = +[DKUtilities acceptableDecoderClasses];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSDictionary *)v9;

    objc_super v11 = +[DKUtilities acceptableDecoderClasses];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"files"];
    files = v5->_files;
    v5->_files = (NSArray *)v12;

    uint64_t v14 = +[DKUtilities acceptableDecoderClasses];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"fileSandboxTokens"];
    fileSandboxTokens = v5->_fileSandboxTokens;
    v5->_fileSandboxTokens = (NSArray *)v15;

    v17 = +[DKUtilities acceptableDecoderClasses];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"uploadStatus"];
    uploadStatus = v5->_uploadStatus;
    v5->_uploadStatus = (NSArray *)v18;

    v20 = DiagnosticsKitLogHandleForCategory(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      v23 = v5;
      _os_log_impl(&dword_23D039000, v20, OS_LOG_TYPE_DEFAULT, "Doing decode of DKDiagnosticResult: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "Doing encode of DKDiagnosticResult: %@", buf, 0xCu);
  }

  uint64_t v6 = [(DKDiagnosticResult *)self statusCode];
  [v4 encodeObject:v6 forKey:@"statusCode"];

  v7 = [(DKDiagnosticResult *)self data];
  id v24 = 0;
  uint64_t v8 = [v7 dropNonSerializableDataWithError:&v24];
  id v9 = v24;
  [v4 encodeObject:v8 forKey:@"data"];

  uint64_t v10 = [(DKDiagnosticResult *)self files];
  id v23 = v9;
  objc_super v11 = [v10 dropNonSerializableDataWithError:&v23];
  id v12 = v23;

  [v4 encodeObject:v11 forKey:@"files"];
  v13 = [(DKDiagnosticResult *)self fileSandboxTokens];
  id v22 = v12;
  uint64_t v14 = [v13 dropNonSerializableDataWithError:&v22];
  id v15 = v22;

  [v4 encodeObject:v14 forKey:@"fileSandboxTokens"];
  v16 = [(DKDiagnosticResult *)self uploadStatus];
  id v21 = v15;
  v17 = [v16 dropNonSerializableDataWithError:&v21];
  id v18 = v21;

  [v4 encodeObject:v17 forKey:@"uploadStatus"];
  if (v18)
  {
    v19 = DiagnosticsKitLogHandleForCategory(4);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v18 description];
      *(_DWORD *)buf = 138412290;
      v26 = v20;
      _os_log_impl(&dword_23D039000, v19, OS_LOG_TYPE_DEFAULT, "DKDiagnosticResult decoding error encountered: %@", buf, 0xCu);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(DKDiagnosticResult *)self statusCode];
  v5 = [(DKDiagnosticResult *)self data];
  uint64_t v6 = [(DKDiagnosticResult *)self files];
  v7 = [(DKDiagnosticResult *)self fileSandboxTokens];
  uint64_t v8 = [(DKDiagnosticResult *)self uploadStatus];
  id v9 = [v3 stringWithFormat:@"Status Code: %@, Data: %@, Files: %@, Sandbox Tokens: %@ Upload Status: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSNumber *)self->_statusCode copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDictionary *)self->_data copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSArray *)self->_files copyWithZone:a3];
  objc_super v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSArray *)self->_fileSandboxTokens copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSArray *)self->_uploadStatus copyWithZone:a3];
  id v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_23D039000, v16, OS_LOG_TYPE_DEFAULT, "Copied DKDiagnosticResult: %@ -> %@", (uint8_t *)&v18, 0x16u);
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[DKMutableDiagnosticResult allocWithZone:](DKMutableDiagnosticResult, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSDictionary *)self->_data mutableCopyWithZone:a3];
  [(DKMutableDiagnosticResult *)v5 setData:v6];

  v7 = (void *)[(NSArray *)self->_files mutableCopyWithZone:a3];
  [(DKMutableDiagnosticResult *)v5 setFiles:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_fileSandboxTokens mutableCopyWithZone:a3];
  [(DKMutableDiagnosticResult *)v5 setFileSandboxTokens:v8];

  [(DKMutableDiagnosticResult *)v5 setStatusCode:self->_statusCode];
  id v9 = (void *)[(NSArray *)self->_uploadStatus mutableCopyWithZone:a3];
  [(DKMutableDiagnosticResult *)v5 setUploadStatus:v9];

  return v5;
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSArray)files
{
  return self->_files;
}

- (NSArray)fileSandboxTokens
{
  return self->_fileSandboxTokens;
}

- (NSArray)uploadStatus
{
  return self->_uploadStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadStatus, 0);
  objc_storeStrong((id *)&self->_fileSandboxTokens, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
}

@end