@interface CLSInformant
+ (id)classIdentifier;
+ (id)familyIdentifier;
+ (id)identifier;
+ (id)informantDependenciesIdentifiers;
+ (id)supportedOutputClueKeys;
- (CLSInformant)init;
- (NSString)uuid;
- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4;
- (id)uniqueIdentifier;
@end

@implementation CLSInformant

- (void).cxx_destruct
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  return 0;
}

- (id)uniqueIdentifier
{
  v3 = [(id)objc_opt_class() identifier];
  v4 = [v3 stringByAppendingFormat:@".%@", self->_uuid];

  return v4;
}

- (CLSInformant)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSInformant;
  v2 = [(CLSInformant *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(NSString, "cls_generateUUID");
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v3;
  }
  return v2;
}

+ (id)supportedOutputClueKeys
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CLSLogging sharedLogging];
  v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1D2150000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

+ (id)informantDependenciesIdentifiers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CLSLogging sharedLogging];
  v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1D2150000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)identifier
{
  v2 = [(id)objc_opt_class() familyIdentifier];
  uint64_t v3 = [(id)objc_opt_class() classIdentifier];
  v4 = [v2 stringByAppendingFormat:@".%@", v3];

  return v4;
}

+ (id)classIdentifier
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CLSLogging sharedLogging];
  v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1D2150000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);
  }
  return @"unknown";
}

+ (id)familyIdentifier
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CLSLogging sharedLogging];
  v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1D2150000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);
  }
  return @"com.apple.mediaminingkit.informant.unknown";
}

@end