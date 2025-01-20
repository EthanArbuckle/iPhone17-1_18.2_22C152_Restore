@interface CKDContainerServerInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKDContainerServerInfo)init;
- (CKDContainerServerInfo)initWithCoder:(id)a3;
- (NSString)containerScopedUserID;
- (NSString)orgAdminUserID;
- (NSURL)publicCloudDBURL;
- (NSURL)publicCodeServiceURL;
- (NSURL)publicDeviceServiceURL;
- (NSURL)publicMetricsServiceURL;
- (NSURL)publicShareServiceURL;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)environment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerScopedUserID:(id)a3;
- (void)setEnvironment:(int64_t)a3;
- (void)setOrgAdminUserID:(id)a3;
- (void)setPublicCloudDBURL:(id)a3;
- (void)setPublicCodeServiceURL:(id)a3;
- (void)setPublicDeviceServiceURL:(id)a3;
- (void)setPublicMetricsServiceURL:(id)a3;
- (void)setPublicShareServiceURL:(id)a3;
@end

@implementation CKDContainerServerInfo

- (CKDContainerServerInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDContainerServerInfo;
  result = [(CKDContainerServerInfo *)&v3 init];
  if (result) {
    result->_environment = -1;
  }
  return result;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_publicCloudDBURL(self, a2, v2);
  v8 = objc_msgSend_publicShareServiceURL(self, v6, v7);
  v11 = objc_msgSend_publicDeviceServiceURL(self, v9, v10);
  v14 = objc_msgSend_publicCodeServiceURL(self, v12, v13);
  v17 = objc_msgSend_publicMetricsServiceURL(self, v15, v16);
  v20 = objc_msgSend_containerScopedUserID(self, v18, v19);
  v23 = objc_msgSend_orgAdminUserID(self, v21, v22);
  objc_msgSend_environment(self, v24, v25);
  v26 = CKStringFromServerEnvironment();
  v28 = objc_msgSend_stringWithFormat_(v4, v27, @"publicCloudDBURL=%@, publicShareServiceURL=%@, publicDeviceServiceURL=%@, publicCodeServiceURL=%@, publicMetricsServiceURL=%@, containerScopedUserID=%@, orgAdminUserID=%@, environment=%@", v5, v8, v11, v14, v17, v20, v23, v26);

  return v28;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDContainerServerInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDContainerServerInfo *)a3;
  if (self == v4)
  {
    BOOL v60 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v8 = objc_msgSend_publicCloudDBURL(self, v6, v7);
      v11 = objc_msgSend_publicCloudDBURL(v5, v9, v10);
      int v12 = CKObjectsAreBothNilOrEqual();

      if (!v12) {
        goto LABEL_13;
      }
      v15 = objc_msgSend_publicShareServiceURL(self, v13, v14);
      v18 = objc_msgSend_publicShareServiceURL(v5, v16, v17);
      int v19 = CKObjectsAreBothNilOrEqual();

      if (!v19) {
        goto LABEL_13;
      }
      uint64_t v22 = objc_msgSend_publicDeviceServiceURL(self, v20, v21);
      uint64_t v25 = objc_msgSend_publicDeviceServiceURL(v5, v23, v24);
      int v26 = CKObjectsAreBothNilOrEqual();

      if (!v26) {
        goto LABEL_13;
      }
      v29 = objc_msgSend_publicCodeServiceURL(self, v27, v28);
      v32 = objc_msgSend_publicCodeServiceURL(v5, v30, v31);
      int v33 = CKObjectsAreBothNilOrEqual();

      if (!v33) {
        goto LABEL_13;
      }
      v36 = objc_msgSend_publicMetricsServiceURL(self, v34, v35);
      v39 = objc_msgSend_publicMetricsServiceURL(v5, v37, v38);
      int v40 = CKObjectsAreBothNilOrEqual();

      if (!v40) {
        goto LABEL_13;
      }
      v43 = objc_msgSend_containerScopedUserID(self, v41, v42);
      v46 = objc_msgSend_containerScopedUserID(v5, v44, v45);
      int v47 = CKObjectsAreBothNilOrEqual();

      if (!v47) {
        goto LABEL_13;
      }
      v50 = objc_msgSend_orgAdminUserID(self, v48, v49);
      v53 = objc_msgSend_orgAdminUserID(v5, v51, v52);
      int v54 = CKObjectsAreBothNilOrEqual();

      if (v54)
      {
        uint64_t v57 = objc_msgSend_environment(self, v55, v56);
        BOOL v60 = v57 == objc_msgSend_environment(v5, v58, v59);
      }
      else
      {
LABEL_13:
        BOOL v60 = 0;
      }
    }
    else
    {
      BOOL v60 = 0;
    }
  }

  return v60;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_publicCloudDBURL(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  uint64_t v10 = objc_msgSend_publicShareServiceURL(self, v8, v9);
  uint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  uint64_t v16 = objc_msgSend_publicDeviceServiceURL(self, v14, v15);
  uint64_t v19 = objc_msgSend_hash(v16, v17, v18);
  uint64_t v22 = objc_msgSend_publicCodeServiceURL(self, v20, v21);
  uint64_t v25 = v13 ^ v19 ^ objc_msgSend_hash(v22, v23, v24);
  uint64_t v28 = objc_msgSend_publicMetricsServiceURL(self, v26, v27);
  uint64_t v31 = objc_msgSend_hash(v28, v29, v30);
  v34 = objc_msgSend_containerScopedUserID(self, v32, v33);
  uint64_t v37 = v31 ^ objc_msgSend_hash(v34, v35, v36);
  int v40 = objc_msgSend_orgAdminUserID(self, v38, v39);
  uint64_t v43 = v25 ^ v37 ^ objc_msgSend_hash(v40, v41, v42);
  unint64_t v46 = v43 ^ objc_msgSend_environment(self, v44, v45);

  return v46;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_publicCloudDBURL(self, v5, v6);
  uint64_t v10 = objc_msgSend_copy(v7, v8, v9);
  v11 = (void *)v4[1];
  v4[1] = v10;

  uint64_t v14 = objc_msgSend_publicShareServiceURL(self, v12, v13);
  uint64_t v17 = objc_msgSend_copy(v14, v15, v16);
  uint64_t v18 = (void *)v4[2];
  v4[2] = v17;

  uint64_t v21 = objc_msgSend_publicDeviceServiceURL(self, v19, v20);
  uint64_t v24 = objc_msgSend_copy(v21, v22, v23);
  uint64_t v25 = (void *)v4[3];
  v4[3] = v24;

  uint64_t v28 = objc_msgSend_publicCodeServiceURL(self, v26, v27);
  uint64_t v31 = objc_msgSend_copy(v28, v29, v30);
  v32 = (void *)v4[4];
  v4[4] = v31;

  uint64_t v35 = objc_msgSend_publicMetricsServiceURL(self, v33, v34);
  uint64_t v38 = objc_msgSend_copy(v35, v36, v37);
  uint64_t v39 = (void *)v4[5];
  v4[5] = v38;

  uint64_t v42 = objc_msgSend_containerScopedUserID(self, v40, v41);
  uint64_t v45 = objc_msgSend_copy(v42, v43, v44);
  unint64_t v46 = (void *)v4[6];
  v4[6] = v45;

  uint64_t v49 = objc_msgSend_orgAdminUserID(self, v47, v48);
  uint64_t v52 = objc_msgSend_copy(v49, v50, v51);
  v53 = (void *)v4[7];
  v4[7] = v52;

  v4[8] = objc_msgSend_environment(self, v54, v55);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDContainerServerInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CKDContainerServerInfo;
  v5 = [(CKDContainerServerInfo *)&v37 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"PublicCloudDBURL");
    publicCloudDBURL = v5->_publicCloudDBURL;
    v5->_publicCloudDBURL = (NSURL *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"PublicShareServiceURL");
    publicShareServiceURL = v5->_publicShareServiceURL;
    v5->_publicShareServiceURL = (NSURL *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"PublicDeviceServiceURL");
    publicDeviceServiceURL = v5->_publicDeviceServiceURL;
    v5->_publicDeviceServiceURL = (NSURL *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"PublicCodeServiceURL");
    publicCodeServiceURL = v5->_publicCodeServiceURL;
    v5->_publicCodeServiceURL = (NSURL *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"PublicMetricsServiceURL");
    publicMetricsServiceURL = v5->_publicMetricsServiceURL;
    v5->_publicMetricsServiceURL = (NSURL *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"ContainerScopedUserID");
    containerScopedUserID = v5->_containerScopedUserID;
    v5->_containerScopedUserID = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"OrgAdminUserID");
    orgAdminUserID = v5->_orgAdminUserID;
    v5->_orgAdminUserID = (NSString *)v33;

    v5->_environment = objc_msgSend_decodeIntegerForKey_(v4, v35, @"Environment");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v37 = a3;
  id v4 = (void *)MEMORY[0x1C8789E70]();
  uint64_t v7 = objc_msgSend_publicCloudDBURL(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v37, v8, (uint64_t)v7, @"PublicCloudDBURL");

  uint64_t v11 = objc_msgSend_publicShareServiceURL(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(v37, v12, (uint64_t)v11, @"PublicShareServiceURL");

  uint64_t v15 = objc_msgSend_publicDeviceServiceURL(self, v13, v14);
  objc_msgSend_encodeObject_forKey_(v37, v16, (uint64_t)v15, @"PublicDeviceServiceURL");

  uint64_t v19 = objc_msgSend_publicCodeServiceURL(self, v17, v18);
  objc_msgSend_encodeObject_forKey_(v37, v20, (uint64_t)v19, @"PublicCodeServiceURL");

  uint64_t v23 = objc_msgSend_publicMetricsServiceURL(self, v21, v22);
  objc_msgSend_encodeObject_forKey_(v37, v24, (uint64_t)v23, @"PublicMetricsServiceURL");

  uint64_t v27 = objc_msgSend_containerScopedUserID(self, v25, v26);
  objc_msgSend_encodeObject_forKey_(v37, v28, (uint64_t)v27, @"ContainerScopedUserID");

  uint64_t v31 = objc_msgSend_orgAdminUserID(self, v29, v30);
  objc_msgSend_encodeObject_forKey_(v37, v32, (uint64_t)v31, @"OrgAdminUserID");

  uint64_t v35 = objc_msgSend_environment(self, v33, v34);
  objc_msgSend_encodeInteger_forKey_(v37, v36, v35, @"Environment");
}

- (NSURL)publicCloudDBURL
{
  return self->_publicCloudDBURL;
}

- (void)setPublicCloudDBURL:(id)a3
{
}

- (NSURL)publicShareServiceURL
{
  return self->_publicShareServiceURL;
}

- (void)setPublicShareServiceURL:(id)a3
{
}

- (NSURL)publicDeviceServiceURL
{
  return self->_publicDeviceServiceURL;
}

- (void)setPublicDeviceServiceURL:(id)a3
{
}

- (NSURL)publicCodeServiceURL
{
  return self->_publicCodeServiceURL;
}

- (void)setPublicCodeServiceURL:(id)a3
{
}

- (NSURL)publicMetricsServiceURL
{
  return self->_publicMetricsServiceURL;
}

- (void)setPublicMetricsServiceURL:(id)a3
{
}

- (NSString)containerScopedUserID
{
  return self->_containerScopedUserID;
}

- (void)setContainerScopedUserID:(id)a3
{
}

- (NSString)orgAdminUserID
{
  return self->_orgAdminUserID;
}

- (void)setOrgAdminUserID:(id)a3
{
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orgAdminUserID, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID, 0);
  objc_storeStrong((id *)&self->_publicMetricsServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCodeServiceURL, 0);
  objc_storeStrong((id *)&self->_publicDeviceServiceURL, 0);
  objc_storeStrong((id *)&self->_publicShareServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCloudDBURL, 0);
}

@end