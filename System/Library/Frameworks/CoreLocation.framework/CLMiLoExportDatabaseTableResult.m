@interface CLMiLoExportDatabaseTableResult
+ (BOOL)supportsSecureCoding;
- (CLMiLoExportDatabaseTableResult)initWithCoder:(id)a3;
- (CLMiLoExportDatabaseTableResult)initWithExportDir:(id)a3 fileName:(id)a4 sandboxExtensionTok:(id)a5;
- (NSString)exportDir;
- (NSString)fileName;
- (NSString)sandboxExtensionTok;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoExportDatabaseTableResult

- (CLMiLoExportDatabaseTableResult)initWithExportDir:(id)a3 fileName:(id)a4 sandboxExtensionTok:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLMiLoExportDatabaseTableResult;
  v8 = [(CLMiLoExportDatabaseTableResult *)&v10 init];
  if (v8)
  {
    v8->_exportDir = (NSString *)a3;
    v8->_fileName = (NSString *)a4;
    v8->_sandboxExtensionTok = (NSString *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoExportDatabaseTableResult;
  [(CLMiLoExportDatabaseTableResult *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithExportDir_fileName_sandboxExtensionTok_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoExportDatabaseTableResult)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResultExportDir"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResultFileName"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResultsandboxExtensionTok"];

  return (CLMiLoExportDatabaseTableResult *)MEMORY[0x1F4181798](self, sel_initWithExportDir_fileName_sandboxExtensionTok_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_exportDir forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResultExportDir"];
  [a3 encodeObject:self->_fileName forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResultFileName"];
  sandboxExtensionTok = self->_sandboxExtensionTok;

  [a3 encodeObject:sandboxExtensionTok forKey:@"kCLMiLoConnectionCodingKeyExportDatabaseTableResultsandboxExtensionTok"];
}

- (NSString)exportDir
{
  return self->_exportDir;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSString)sandboxExtensionTok
{
  return self->_sandboxExtensionTok;
}

@end