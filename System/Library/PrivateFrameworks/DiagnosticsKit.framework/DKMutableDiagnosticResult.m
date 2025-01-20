@interface DKMutableDiagnosticResult
- (DKMutableDiagnosticResult)init;
- (NSArray)fileSandboxTokens;
- (NSArray)files;
- (NSArray)uploadStatus;
- (NSDictionary)data;
- (NSNumber)statusCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setData:(id)a3;
- (void)setFileSandboxTokens:(id)a3;
- (void)setFiles:(id)a3;
- (void)setStatusCode:(id)a3;
- (void)setUploadStatus:(id)a3;
@end

@implementation DKMutableDiagnosticResult

- (DKMutableDiagnosticResult)init
{
  v11.receiver = self;
  v11.super_class = (Class)DKMutableDiagnosticResult;
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

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[DKDiagnosticResult allocWithZone:a3];
  return [(DKDiagnosticResult *)v4 initWithMutableResult:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DKMutableDiagnosticResult;
  id v5 = -[DKDiagnosticResult mutableCopyWithZone:](&v11, sel_mutableCopyWithZone_);
  uint64_t v6 = (void *)[(NSDictionary *)self->_data mutableCopyWithZone:a3];
  [v5 setData:v6];

  v7 = (void *)[(NSArray *)self->_files mutableCopyWithZone:a3];
  [v5 setFiles:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_fileSandboxTokens mutableCopyWithZone:a3];
  [v5 setFileSandboxTokens:v8];

  [v5 setStatusCode:self->_statusCode];
  v9 = (void *)[(NSArray *)self->_uploadStatus mutableCopyWithZone:a3];
  [v5 setUploadStatus:v9];

  return v5;
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
}

- (NSArray)fileSandboxTokens
{
  return self->_fileSandboxTokens;
}

- (void)setFileSandboxTokens:(id)a3
{
}

- (NSArray)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setUploadStatus:(id)a3
{
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