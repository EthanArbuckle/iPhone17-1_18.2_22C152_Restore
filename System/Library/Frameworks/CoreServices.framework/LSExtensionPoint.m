@interface LSExtensionPoint
+ (BOOL)supportsSecureCoding;
+ (NSString)identifierForCurrentProcess;
+ (id)_synthesizedExtensionPointWithIdentifier:(id)a3;
+ (id)extensionPointForIdentifier:(id)a3;
+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (LSExtensionPoint)initWithCoder:(id)a3;
- (NSDictionary)sdkEntry;
- (NSNumber)platform;
- (id)_initWithRecord:(id)a3 resolveAndDetach:(BOOL)a4;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSExtensionPoint

+ (id)extensionPointForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [NSNumber numberWithUnsignedInt:dyld_get_active_platform()];
  v5 = +[LSExtensionPoint extensionPointForIdentifier:v3 platform:v4];

  return v5;
}

+ (id)_synthesizedExtensionPointWithIdentifier:(id)a3
{
  return 0;
}

+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [LSExtensionPointRecord alloc];
  if (v7) {
    uint64_t v9 = [v7 unsignedLongLongValue];
  }
  else {
    uint64_t v9 = 0;
  }
  id v16 = 0;
  v10 = [(LSExtensionPointRecord *)v8 initWithIdentifier:v6 platform:v9 parentAppRecord:0 error:&v16];
  id v11 = v16;
  if (v10)
  {
    v12 = (void *)[objc_alloc((Class)a1) _initWithRecord:v10 resolveAndDetach:1];
    v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[LSExtensionPoint extensionPointForIdentifier:platform:]((uint64_t)v12, (uint64_t)v6, v13);
    }
  }
  else
  {
    v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[LSExtensionPoint extensionPointForIdentifier:platform:]((uint64_t)v6, (uint64_t)v11, v13);
    }
    v12 = 0;
  }

  id v14 = v12;
  return v14;
}

+ (NSString)identifierForCurrentProcess
{
  return +[LSExtensionPointRecord identifierForCurrentProcess];
}

- (id)_initWithRecord:(id)a3 resolveAndDetach:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSExtensionPoint;
  v8 = [(_LSQueryResult *)&v11 _init];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v4 && _LSDatabaseContextGetDetachProxyObjects((LaunchServices::DatabaseContext *)v8))
    {
      [v7 _resolveAllProperties];
      [v7 detach];
    }
    objc_storeStrong(v9 + 1, a3);
  }

  return v9;
}

- (NSNumber)platform
{
  uint64_t v2 = [(LSExtensionPointRecord *)self->_record platform];
  if (v2)
  {
    id v3 = [NSNumber numberWithUnsignedInt:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSDictionary)sdkEntry
{
  uint64_t v2 = [(LSExtensionPointRecord *)self->_record SDKDictionary];
  id v3 = [v2 _expensiveDictionaryRepresentation];
  BOOL v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  v5 = v3;

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_record;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LSExtensionPoint;
  if (-[LSExtensionPoint respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return +[LSExtensionPointRecord instancesRespondToSelector:a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSExtensionPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSExtensionPoint;
  objc_super v5 = [(_LSQueryResult *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"record");
    record = v5->_record;
    v5->_record = (LSExtensionPointRecord *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)LSExtensionPoint;
  id v4 = [(LSExtensionPoint *)&v10 description];
  objc_super v5 = [(LSExtensionPoint *)self identifier];
  uint64_t v6 = [(LSExtensionPoint *)self platform];
  id v7 = [(LSExtensionPoint *)self sdkEntry];
  v8 = [v3 stringWithFormat:@"%@ %@ %@ <%@>", v4, v5, v6, v7];

  return v8;
}

- (void).cxx_destruct
{
}

+ (void)extensionPointForIdentifier:(os_log_t)log platform:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Failed to find extension point for identifier %{public}@: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)extensionPointForIdentifier:(os_log_t)log platform:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "Found LSExtensionPoint %@ for identifier %{public}@", (uint8_t *)&v3, 0x16u);
}

@end