@interface CKApplicationPermissionGroup
+ (BOOL)supportsSecureCoding;
- (CKApplicationPermissionGroup)init;
- (CKApplicationPermissionGroup)initWithCoder:(id)a3;
- (NSArray)applicationBundleIDs;
- (NSArray)containerIDs;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)enabledPermissions;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIDs:(id)a3;
- (void)setContainerIDs:(id)a3;
- (void)setEnabledPermissions:(unint64_t)a3;
@end

@implementation CKApplicationPermissionGroup

- (CKApplicationPermissionGroup)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKApplicationPermissionGroup;
  v2 = [(CKApplicationPermissionGroup *)&v8 init];
  v3 = v2;
  if (v2)
  {
    containerIDs = v2->_containerIDs;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_containerIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    applicationBundleIDs = v3->_applicationBundleIDs;
    v3->_applicationBundleIDs = v5;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKApplicationPermissionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKApplicationPermissionGroup;
  v5 = [(CKApplicationPermissionGroup *)&v33 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"containerIDs");
    objc_msgSend_setContainerIDs_(v5, v15, (uint64_t)v14, v16);

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"applicationBundleIDs");
    objc_msgSend_setApplicationBundleIDs_(v5, v25, (uint64_t)v24, v26);

    uint64_t v29 = objc_msgSend_decodeInt64ForKey_(v4, v27, @"enabledPermissions", v28);
    objc_msgSend_setEnabledPermissions_(v5, v30, v29, v31);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_containerIDs(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, @"containerIDs");

  v13 = objc_msgSend_applicationBundleIDs(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, @"applicationBundleIDs");

  uint64_t v18 = objc_msgSend_enabledPermissions(self, v15, v16, v17);
  objc_msgSend_encodeInt64_forKey_(v20, v19, v18, @"enabledPermissions");
}

- (id)CKPropertiesDescription
{
  v5 = NSString;
  uint64_t v6 = objc_msgSend_containerIDs(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_enabledPermissions(self, v7, v8, v9);
  v14 = objc_msgSend_applicationBundleIDs(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v5, v15, @"containerIDs=%@, enabledPermissions=%ld, applicationBundleIDs=%@", v16, v6, v10, v14);

  return v17;
}

- (id)description
{
  return (id)((uint64_t (*)(CKApplicationPermissionGroup *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSArray)containerIDs
{
  return self->_containerIDs;
}

- (void)setContainerIDs:(id)a3
{
}

- (NSArray)applicationBundleIDs
{
  return self->_applicationBundleIDs;
}

- (void)setApplicationBundleIDs:(id)a3
{
}

- (unint64_t)enabledPermissions
{
  return self->_enabledPermissions;
}

- (void)setEnabledPermissions:(unint64_t)a3
{
  self->_enabledPermissions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIDs, 0);

  objc_storeStrong((id *)&self->_containerIDs, 0);
}

@end