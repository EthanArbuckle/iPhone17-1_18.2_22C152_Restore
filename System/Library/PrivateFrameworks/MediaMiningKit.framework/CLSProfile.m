@interface CLSProfile
+ (id)classIdentifier;
+ (id)identifier;
+ (id)informantDependenciesIdentifiers;
+ (id)profileDependenciesIdentifiers;
+ (id)supportedMeaningClueKeys;
- (CLSProfile)init;
- (NSString)uuid;
- (id)description;
- (id)uniqueIdentifier;
@end

@implementation CLSProfile

- (void).cxx_destruct
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)uniqueIdentifier
{
  v3 = [(id)objc_opt_class() identifier];
  v4 = [v3 stringByAppendingFormat:@".%@", self->_uuid];

  return v4;
}

- (id)description
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"<Profile> [%@]", v4];

  return v5;
}

- (CLSProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSProfile;
  v2 = [(CLSProfile *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(NSString, "cls_generateUUID");
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v3;
  }
  return v2;
}

+ (id)supportedMeaningClueKeys
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

+ (id)profileDependenciesIdentifiers
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
  v2 = [(id)objc_opt_class() classIdentifier];
  uint64_t v3 = [@"com.apple.mediaminingkit.profile" stringByAppendingFormat:@".%@", v2];

  return v3;
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

@end