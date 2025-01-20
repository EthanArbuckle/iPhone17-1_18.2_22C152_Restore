@interface CKDContainerPrivacySettings
- (BOOL)isEqual:(id)a3;
- (CKContainerID)containerID;
- (CKDContainerPrivacySettings)initWithContainerID:(id)a3 applicationBundleIDs:(id)a4 discoverable:(int64_t)a5;
- (NSSet)applicationBundleIDs;
- (id)CKPropertiesDescription;
- (id)description;
- (int64_t)discoverable;
- (unint64_t)hash;
@end

@implementation CKDContainerPrivacySettings

- (CKDContainerPrivacySettings)initWithContainerID:(id)a3 applicationBundleIDs:(id)a4 discoverable:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKDContainerPrivacySettings;
  v12 = [(CKDContainerPrivacySettings *)&v20 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v10, v11);
    containerID = v12->_containerID;
    v12->_containerID = (CKContainerID *)v13;

    uint64_t v17 = objc_msgSend_copy(v9, v15, v16);
    applicationBundleIDs = v12->_applicationBundleIDs;
    v12->_applicationBundleIDs = (NSSet *)v17;

    v12->_discoverable = a5;
  }

  return v12;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_containerID(self, a2, v2);
  id v8 = objc_msgSend_applicationBundleIDs(self, v6, v7);
  uint64_t v11 = objc_msgSend_discoverable(self, v9, v10);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v4, v12, @"containerID=%@, applicationBundleIDs=%@, discoverable=%ld", v5, v8, v11);

  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDContainerPrivacySettings *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDContainerPrivacySettings *)a3;
  if (self == v4)
  {
    BOOL v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v8 = objc_msgSend_containerID(self, v6, v7);
      uint64_t v11 = objc_msgSend_containerID(v5, v9, v10);
      int v12 = CKObjectsAreBothNilOrEqual();

      if (v12
        && (objc_msgSend_applicationBundleIDs(self, v13, v14),
            v15 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_applicationBundleIDs(v5, v16, v17),
            v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = CKObjectsAreBothNilOrEqual(),
            v18,
            v15,
            v19))
      {
        uint64_t v22 = objc_msgSend_discoverable(self, v20, v21);
        BOOL v25 = v22 == objc_msgSend_discoverable(v5, v23, v24);
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }

  return v25;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_containerID(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  uint64_t v10 = objc_msgSend_applicationBundleIDs(self, v8, v9);
  uint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  unint64_t v16 = v13 ^ objc_msgSend_discoverable(self, v14, v15);

  return v16;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSSet)applicationBundleIDs
{
  return self->_applicationBundleIDs;
}

- (int64_t)discoverable
{
  return self->_discoverable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end