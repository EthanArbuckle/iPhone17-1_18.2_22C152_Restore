@interface ASDInstallManifestRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDInstallManifestRequestOptions)init;
- (ASDInstallManifestRequestOptions)initWithCoder:(id)a3;
- (ASDInstallManifestRequestOptions)initWithManifest:(id)a3;
- (ASDJobManifest)manifest;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setManifest:(id)a3;
@end

@implementation ASDInstallManifestRequestOptions

- (ASDInstallManifestRequestOptions)init
{
  return [(ASDInstallManifestRequestOptions *)self initWithManifest:0];
}

- (ASDInstallManifestRequestOptions)initWithManifest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDInstallManifestRequestOptions;
  v5 = [(ASDInstallManifestRequestOptions *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 copy];
      p_super = &v5->_manifest->super;
      v5->_manifest = (ASDJobManifest *)v6;
    }
    else
    {
      p_super = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        id v10 = v9;
        _os_log_error_impl(&dword_19BF6A000, p_super, OS_LOG_TYPE_ERROR, "[%{public}@]: Request contained a nil manifest", buf, 0xCu);
      }
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ASDInstallManifestRequestOptions allocWithZone:a3];
  manifest = self->_manifest;
  return [(ASDInstallManifestRequestOptions *)v4 initWithManifest:manifest];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDInstallManifestRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDInstallManifestRequestOptions *)self initWithManifest:0];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifest"];
    manifest = v5->_manifest;
    v5->_manifest = (ASDJobManifest *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASDJobManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end