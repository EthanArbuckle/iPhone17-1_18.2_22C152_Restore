@interface CLMiLoDebugResponse
+ (BOOL)supportsSecureCoding;
- (CLMiLoDebugResponse)initWithCoder:(id)a3;
- (CLMiLoDebugResponse)initWithExportDatabaseTablesResult:(id)a3 requestIdentifier:(id)a4 error:(id)a5;
- (CLMiLoExportDatabaseTableResult)exportDatabaseTablesResult;
- (NSError)error;
- (NSUUID)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoDebugResponse

- (CLMiLoDebugResponse)initWithExportDatabaseTablesResult:(id)a3 requestIdentifier:(id)a4 error:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLMiLoDebugResponse;
  v8 = [(CLMiLoDebugResponse *)&v10 init];
  if (v8)
  {
    v8->_exportDatabaseTablesResult = (CLMiLoExportDatabaseTableResult *)a3;
    v8->_requestIdentifier = (NSUUID *)a4;
    v8->_error = (NSError *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoDebugResponse;
  [(CLMiLoDebugResponse *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithExportDatabaseTablesResult_requestIdentifier_error_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoDebugResponse)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResult"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyDebugRequestIdentifier"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyDebugRequestError"];

  return (CLMiLoDebugResponse *)MEMORY[0x1F4181798](self, sel_initWithExportDatabaseTablesResult_requestIdentifier_error_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_exportDatabaseTablesResult forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResult"];
  [a3 encodeObject:self->_requestIdentifier forKey:@"kCLMiLoConnectionCodingKeyDebugRequestIdentifier"];
  error = self->_error;

  [a3 encodeObject:error forKey:@"kCLMiLoConnectionCodingKeyDebugRequestError"];
}

- (CLMiLoExportDatabaseTableResult)exportDatabaseTablesResult
{
  return self->_exportDatabaseTablesResult;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSError)error
{
  return self->_error;
}

@end