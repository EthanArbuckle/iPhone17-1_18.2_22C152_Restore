@interface CKRepairAssetsOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKRepairAssetsOperationInfo)initWithCoder:(id)a3;
- (CKUploadRequestConfiguration)uploadRequestConfiguration;
- (NSArray)assetMetadata;
- (NSArray)assets;
- (NSArray)packageMetadata;
- (NSArray)packages;
- (NSArray)unavailableAssets;
- (NSArray)unavailablePackages;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetMetadata:(id)a3;
- (void)setAssets:(id)a3;
- (void)setPackageMetadata:(id)a3;
- (void)setPackages:(id)a3;
- (void)setUnavailableAssets:(id)a3;
- (void)setUnavailablePackages:(id)a3;
- (void)setUploadRequestConfiguration:(id)a3;
@end

@implementation CKRepairAssetsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v48.receiver = self;
  v48.super_class = (Class)CKRepairAssetsOperationInfo;
  [(CKDatabaseOperationInfo *)&v48 encodeWithCoder:v4];
  v9 = objc_msgSend_assets(self, v6, v7, v8);
  v10 = NSStringFromSelector(sel_assets);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  v15 = objc_msgSend_packages(self, v12, v13, v14);
  v16 = NSStringFromSelector(sel_packages);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  v21 = objc_msgSend_assetMetadata(self, v18, v19, v20);
  v22 = NSStringFromSelector(sel_assetMetadata);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v21, (uint64_t)v22);

  v27 = objc_msgSend_packageMetadata(self, v24, v25, v26);
  v28 = NSStringFromSelector(sel_packageMetadata);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v27, (uint64_t)v28);

  v33 = objc_msgSend_unavailableAssets(self, v30, v31, v32);
  v34 = NSStringFromSelector(sel_unavailableAssets);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v33, (uint64_t)v34);

  v39 = objc_msgSend_unavailablePackages(self, v36, v37, v38);
  v40 = NSStringFromSelector(sel_unavailablePackages);
  objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v39, (uint64_t)v40);

  v45 = objc_msgSend_uploadRequestConfiguration(self, v42, v43, v44);
  v46 = NSStringFromSelector(sel_uploadRequestConfiguration);
  objc_msgSend_encodeObject_forKey_(v4, v47, (uint64_t)v45, (uint64_t)v46);
}

- (CKRepairAssetsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)CKRepairAssetsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v73 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v13 = NSStringFromSelector(sel_assets);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    assets = v5->_assets;
    v5->_assets = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v23 = NSStringFromSelector(sel_packages);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    packages = v5->_packages;
    v5->_packages = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v32 = objc_msgSend_setWithObjects_(v27, v30, v28, v31, v29, 0);
    v33 = NSStringFromSelector(sel_assetMetadata);
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v32, (uint64_t)v33);
    assetMetadata = v5->_assetMetadata;
    v5->_assetMetadata = (NSArray *)v35;

    uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    v42 = objc_msgSend_setWithObjects_(v37, v40, v38, v41, v39, 0);
    uint64_t v43 = NSStringFromSelector(sel_packageMetadata);
    uint64_t v45 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v44, (uint64_t)v42, (uint64_t)v43);
    packageMetadata = v5->_packageMetadata;
    v5->_packageMetadata = (NSArray *)v45;

    v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    v52 = objc_msgSend_setWithObjects_(v47, v50, v48, v51, v49, 0);
    v53 = NSStringFromSelector(sel_unavailableAssets);
    uint64_t v55 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v52, (uint64_t)v53);
    unavailableAssets = v5->_unavailableAssets;
    v5->_unavailableAssets = (NSArray *)v55;

    v57 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v58 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    v62 = objc_msgSend_setWithObjects_(v57, v60, v58, v61, v59, 0);
    v63 = NSStringFromSelector(sel_unavailablePackages);
    uint64_t v65 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v64, (uint64_t)v62, (uint64_t)v63);
    unavailablePackages = v5->_unavailablePackages;
    v5->_unavailablePackages = (NSArray *)v65;

    uint64_t v67 = objc_opt_class();
    v68 = NSStringFromSelector(sel_uploadRequestConfiguration);
    uint64_t v70 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v67, (uint64_t)v68);
    uploadRequestConfiguration = v5->_uploadRequestConfiguration;
    v5->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v70;
  }

  return v5;
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)packages
{
  return self->_packages;
}

- (void)setPackages:(id)a3
{
}

- (NSArray)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
}

- (NSArray)packageMetadata
{
  return self->_packageMetadata;
}

- (void)setPackageMetadata:(id)a3
{
}

- (NSArray)unavailableAssets
{
  return self->_unavailableAssets;
}

- (void)setUnavailableAssets:(id)a3
{
}

- (NSArray)unavailablePackages
{
  return self->_unavailablePackages;
}

- (void)setUnavailablePackages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailablePackages, 0);
  objc_storeStrong((id *)&self->_unavailableAssets, 0);
  objc_storeStrong((id *)&self->_packageMetadata, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_packages, 0);
  objc_storeStrong((id *)&self->_assets, 0);

  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
}

@end