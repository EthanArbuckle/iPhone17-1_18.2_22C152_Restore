@interface CKProcessScopedMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isClientMainBundleAppleExecutable;
- (CKFrameworkFingerprint)frameworkFingerprint;
- (CKProcessScopedMetadata)initWithCoder:(id)a3;
- (unsigned)clientSDKVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setClientSDKVersion:(unsigned int)a3;
- (void)setFrameworkFingerprint:(id)a3;
- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3;
@end

@implementation CKProcessScopedMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKProcessScopedMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKProcessScopedMetadata;
  v5 = [(CKProcessScopedMetadata *)&v18 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_clientSDKVersion);
    v5->_clientSDKVersion = objc_msgSend_decodeInt64ForKey_(v4, v7, (uint64_t)v6, v8);

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_frameworkFingerprint);
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);
    frameworkFingerprint = v5->_frameworkFingerprint;
    v5->_frameworkFingerprint = (CKFrameworkFingerprint *)v12;

    v14 = NSStringFromSelector(sel_isClientMainBundleAppleExecutable);
    v5->_isClientMainBundleAppleExecutable = objc_msgSend_decodeBoolForKey_(v4, v15, (uint64_t)v14, v16);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_clientSDKVersion(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_clientSDKVersion);
  objc_msgSend_encodeInt64_forKey_(v4, v10, v8, (uint64_t)v9);

  v14 = objc_msgSend_frameworkFingerprint(self, v11, v12, v13);
  v15 = NSStringFromSelector(sel_frameworkFingerprint);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(self, v17, v18, v19);
  NSStringFromSelector(sel_isClientMainBundleAppleExecutable);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v4, v21, isClientMainBundleAppleExecutable, (uint64_t)v22);
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (CKFrameworkFingerprint)frameworkFingerprint
{
  return self->_frameworkFingerprint;
}

- (void)setFrameworkFingerprint:(id)a3
{
}

- (BOOL)isClientMainBundleAppleExecutable
{
  return self->_isClientMainBundleAppleExecutable;
}

- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3
{
  self->_uint64_t isClientMainBundleAppleExecutable = a3;
}

- (void).cxx_destruct
{
}

@end