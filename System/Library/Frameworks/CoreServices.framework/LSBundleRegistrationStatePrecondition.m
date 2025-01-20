@interface LSBundleRegistrationStatePrecondition
+ (BOOL)supportsSecureCoding;
- (BOOL)isMet;
- (LSBundleRegistrationStatePrecondition)initWithCoder:(id)a3;
- (id)description;
- (id)initForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSBundleRegistrationStatePrecondition

- (id)initForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LSBundleRegistrationStatePrecondition;
  v11 = [(LSBundleRegistrationStatePrecondition *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_placeholderInstalled, a4);
    objc_storeStrong((id *)&v11->_fullAppInstalled, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v4 encodeObject:self->_placeholderInstalled forKey:@"placeholderInstalled"];
  [v4 encodeObject:self->_fullAppInstalled forKey:@"fullAppInstalled"];
}

- (LSBundleRegistrationStatePrecondition)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderInstalled"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppInstalled"];
  id v8 = [(LSBundleRegistrationStatePrecondition *)self initForBundleWithIdentifier:v5 placeholderInstalled:v6 fullApplicationInstalled:v7];

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<LSBundleRegistrationStatePrecondition: %@ placeholder: %@ fullApp: %@>", self->_bundleID, self->_placeholderInstalled, self->_fullAppInstalled];
}

- (BOOL)isMet
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v20 = 0;
  char v21 = 0;
  id v22 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v3 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v3, 0);

  if (!v4)
  {
    uint64_t v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v16, 0);

      if (v17) {
        id v18 = 0;
      }
      else {
        id v18 = v22;
      }
      *(_DWORD *)buf = 138412290;
      id v24 = v18;
      _os_log_error_impl(&dword_182959000, v12, OS_LOG_TYPE_ERROR, "Cannot reach database! %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  bundleID = self->_bundleID;
  memset(v26, 0, sizeof(v26));
  int v6 = _LSBundleFindWithInfo(v4, 0, bundleID, 0, v26, 2, 1024, 0, 0);
  v7 = self->_bundleID;
  memset(v25, 0, sizeof(v25));
  int v8 = _LSBundleFindWithInfo(v4, 0, v7, 0, v25, 2, 0, 0, 0);
  placeholderInstalled = self->_placeholderInstalled;
  if (placeholderInstalled && (v6 != 0) == [(NSNumber *)placeholderInstalled BOOLValue])
  {
LABEL_8:
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }
  fullAppInstalled = self->_fullAppInstalled;
  if (fullAppInstalled) {
    unsigned int v11 = (v8 != 0) ^ [(NSNumber *)fullAppInstalled BOOLValue];
  }
  else {
    LOBYTE(v11) = 1;
  }
LABEL_10:
  if (CurrentContext && v21) {
    _LSContextDestroy(CurrentContext);
  }
  id v13 = v20;
  CurrentContext = 0;
  id v20 = 0;

  char v21 = 0;
  id v14 = v22;
  id v22 = 0;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullAppInstalled, 0);
  objc_storeStrong((id *)&self->_placeholderInstalled, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end