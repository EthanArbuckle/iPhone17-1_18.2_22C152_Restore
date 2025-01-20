@interface CKDApplicationMetadata
- (BOOL)isClientMainBundleAppleExecutable;
- (CKDApplicationMetadata)init;
- (CKDApplicationMetadata)initWithAdopterProcessType:(int64_t)a3 containingBundleID:(id)a4 applicationContainerPath:(id)a5 entitlements:(id)a6 clientSDKVersion:(unsigned int)a7 isClientMainBundleAppleExecutable:(BOOL)a8;
- (CKEntitlements)entitlements;
- (NSString)applicationContainerPath;
- (NSString)containingBundleID;
- (int64_t)adopterProcessType;
- (unsigned)clientSDKVersion;
- (void)setAdopterProcessType:(int64_t)a3;
- (void)setApplicationContainerPath:(id)a3;
- (void)setClientSDKVersion:(unsigned int)a3;
- (void)setContainingBundleID:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3;
@end

@implementation CKDApplicationMetadata

- (CKEntitlements)entitlements
{
  return self->_entitlements;
}

- (BOOL)isClientMainBundleAppleExecutable
{
  return self->_isClientMainBundleAppleExecutable;
}

- (NSString)containingBundleID
{
  return self->_containingBundleID;
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (NSString)applicationContainerPath
{
  return self->_applicationContainerPath;
}

- (int64_t)adopterProcessType
{
  return self->_adopterProcessType;
}

- (CKDApplicationMetadata)initWithAdopterProcessType:(int64_t)a3 containingBundleID:(id)a4 applicationContainerPath:(id)a5 entitlements:(id)a6 clientSDKVersion:(unsigned int)a7 isClientMainBundleAppleExecutable:(BOOL)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CKDApplicationMetadata;
  v17 = [(CKDApplicationMetadata *)&v28 init];
  v20 = v17;
  if (v17)
  {
    v17->_adopterProcessType = a3;
    uint64_t v21 = objc_msgSend_copy(v14, v18, v19);
    containingBundleID = v20->_containingBundleID;
    v20->_containingBundleID = (NSString *)v21;

    uint64_t v25 = objc_msgSend_copy(v15, v23, v24);
    applicationContainerPath = v20->_applicationContainerPath;
    v20->_applicationContainerPath = (NSString *)v25;

    objc_storeStrong((id *)&v20->_entitlements, a6);
    v20->_clientSDKVersion = a7;
    v20->_isClientMainBundleAppleExecutable = a8;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_applicationContainerPath, 0);
  objc_storeStrong((id *)&self->_containingBundleID, 0);
}

- (CKDApplicationMetadata)init
{
  return (CKDApplicationMetadata *)objc_msgSend_initWithAdopterProcessType_containingBundleID_applicationContainerPath_entitlements_clientSDKVersion_isClientMainBundleAppleExecutable_(self, a2, 4, 0, 0, 0, 0, 0);
}

- (void)setAdopterProcessType:(int64_t)a3
{
  self->_adopterProcessType = a3;
}

- (void)setContainingBundleID:(id)a3
{
}

- (void)setApplicationContainerPath:(id)a3
{
}

- (void)setEntitlements:(id)a3
{
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3
{
  self->_isClientMainBundleAppleExecutable = a3;
}

@end