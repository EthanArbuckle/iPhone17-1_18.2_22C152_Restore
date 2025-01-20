@interface CXCallDirectoryExtension
+ (BOOL)supportsSecureCoding;
- (BOOL)isOnlyExtensionInContainingApp;
- (CXCallDirectoryExtension)initWithCoder:(id)a3;
- (LSPlugInKitProxy)plugInKitProxy;
- (NSString)identifier;
- (NSString)localizedContainingAppName;
- (NSString)localizedName;
- (id)description;
- (int64_t)priority;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedContainingAppName:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setOnlyExtensionInContainingApp:(BOOL)a3;
- (void)setPlugInKitProxy:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation CXCallDirectoryExtension

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXCallDirectoryExtension *)self identifier];
  int64_t v6 = [(CXCallDirectoryExtension *)self state];
  int64_t v7 = [(CXCallDirectoryExtension *)self priority];
  v8 = [(CXCallDirectoryExtension *)self localizedName];
  v9 = [v3 stringWithFormat:@"<%@ %p: identifier=%@ state=%ld priority=%lld localizedName=%@>", v4, self, v5, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryExtension)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CXCallDirectoryExtension;
  v5 = [(CXCallDirectoryExtension *)&v26 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    int64_t v7 = NSStringFromSelector(sel_identifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = NSStringFromSelector(sel_state);
    v5->_state = [v4 decodeIntegerForKey:v10];

    v11 = NSStringFromSelector(sel_priority);
    v5->_priority = [v4 decodeInt64ForKey:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_localizedName);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_localizedContainingAppName);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    localizedContainingAppName = v5->_localizedContainingAppName;
    v5->_localizedContainingAppName = (NSString *)v18;

    uint64_t v20 = objc_opt_class();
    v21 = NSStringFromSelector(sel_plugInKitProxy);
    uint64_t v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
    plugInKitProxy = v5->_plugInKitProxy;
    v5->_plugInKitProxy = (LSPlugInKitProxy *)v22;

    v24 = NSStringFromSelector(sel_isOnlyExtensionInContainingApp);
    v5->_onlyExtensionInContainingApp = [v4 decodeBoolForKey:v24];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryExtension *)self identifier];
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(CXCallDirectoryExtension *)self state];
  uint64_t v8 = NSStringFromSelector(sel_state);
  [v4 encodeInteger:v7 forKey:v8];

  int64_t v9 = [(CXCallDirectoryExtension *)self priority];
  v10 = NSStringFromSelector(sel_priority);
  [v4 encodeInt64:v9 forKey:v10];

  v11 = [(CXCallDirectoryExtension *)self localizedName];
  uint64_t v12 = NSStringFromSelector(sel_localizedName);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(CXCallDirectoryExtension *)self localizedContainingAppName];
  uint64_t v14 = NSStringFromSelector(sel_localizedContainingAppName);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(CXCallDirectoryExtension *)self plugInKitProxy];
  uint64_t v16 = NSStringFromSelector(sel_plugInKitProxy);
  [v4 encodeObject:v15 forKey:v16];

  BOOL v17 = [(CXCallDirectoryExtension *)self isOnlyExtensionInContainingApp];
  NSStringFromSelector(sel_isOnlyExtensionInContainingApp);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v17 forKey:v18];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedContainingAppName
{
  return self->_localizedContainingAppName;
}

- (void)setLocalizedContainingAppName:(id)a3
{
}

- (LSPlugInKitProxy)plugInKitProxy
{
  return self->_plugInKitProxy;
}

- (void)setPlugInKitProxy:(id)a3
{
}

- (BOOL)isOnlyExtensionInContainingApp
{
  return self->_onlyExtensionInContainingApp;
}

- (void)setOnlyExtensionInContainingApp:(BOOL)a3
{
  self->_onlyExtensionInContainingApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugInKitProxy, 0);
  objc_storeStrong((id *)&self->_localizedContainingAppName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end