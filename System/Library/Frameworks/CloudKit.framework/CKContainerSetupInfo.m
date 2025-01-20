@interface CKContainerSetupInfo
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (CKAccountOverrideInfo)accountOverrideInfo;
- (CKContainerID)containerID;
- (CKContainerOptions)containerOptions;
- (CKContainerSetupInfo)initWithCoder:(id)a3;
- (CKContainerSetupInfo)initWithContainerID:(id)a3 options:(id)a4;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutAccountInfo;
- (id)hashString;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)redactedDescription;
- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)_stripAccountInfo;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKContainerSetupInfo

- (id)hashString
{
  uint64_t v13 = 0;
  v4 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)self, 0, &v13);
  v8 = v4;
  if (v13 || (objc_msgSend_CKSHA256(v4, v5, v6, v7), (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, @"CKContainerSetupInfo.m", 55, @"Couldn't encode %@", self);

    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_containerID(self, v5, v6, v7);
  v9 = NSStringFromSelector(sel_containerID);
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v8, (uint64_t)v9);

  v14 = objc_msgSend_containerOptions(self, v11, v12, v13);
  v15 = NSStringFromSelector(sel_containerOptions);
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v14, (uint64_t)v15);
}

- (CKContainerOptions)containerOptions
{
  return self->_containerOptions;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (CKContainerSetupInfo)initWithContainerID:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKContainerSetupInfo;
  v11 = [(CKContainerSetupInfo *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    containerID = v11->_containerID;
    v11->_containerID = (CKContainerID *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    containerOptions = v11->_containerOptions;
    v11->_containerOptions = (CKContainerOptions *)v17;
  }
  return v11;
}

- (CKAccountOverrideInfo)accountOverrideInfo
{
  v4 = objc_msgSend_containerOptions(self, a2, v2, v3);
  v8 = objc_msgSend_accountOverrideInfo(v4, v5, v6, v7);

  return (CKAccountOverrideInfo *)v8;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_containerID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_containerOptions(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKContainerSetupInfo *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_containerID(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_containerID(v5, v10, v11, v12);
      if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
      {
        v19 = objc_msgSend_containerOptions(self, v16, v17, v18);
        v23 = objc_msgSend_containerOptions(v5, v20, v21, v22);
        char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_containerID(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"containerID", (uint64_t)v8, 0);

  uint64_t v13 = objc_msgSend_containerOptions(self, v10, v11, v12);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"containerOptions", (uint64_t)v13, 0);

  objc_msgSend_accountOverrideInfo(self, v15, v16, v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v18, @"accountOverrideInfo", (uint64_t)v19, 1);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKContainerSetupInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKContainerSetupInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (id)copyWithoutAccountInfo
{
  id v4 = objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend__stripAccountInfo(v4, v5, v6, v7);
  return v4;
}

- (void)_stripAccountInfo
{
  v5 = objc_msgSend_containerOptions(self, a2, v2, v3);
  objc_msgSend_setAccountOverrideInfo_(v5, v6, 0, v7);

  objc_msgSend_containerOptions(self, v8, v9, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPersonaIdentifier_(v13, v11, 0, v12);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKContainerSetupInfo alloc];
  uint64_t v8 = objc_msgSend_containerID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_containerOptions(self, v9, v10, v11);
  v14 = objc_msgSend_initWithContainerID_options_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  return v14;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.cloudkit.sharingsupport.container";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v4, 1);

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v9, v8, (uint64_t)v7, a5);

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.cloudkit.sharingsupport.container";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v4, 1);

  return (NSArray *)v2;
}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = (void (**)(id, void *, id))a4;
  id v10 = 0;
  id v7 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v6, (uint64_t)self, 1, &v10);
  id v8 = v10;
  if (v5) {
    v5[2](v5, v7, v8);
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContainerSetupInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_containerID);
  id v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);

  uint64_t v9 = objc_opt_class();
  id v10 = NSStringFromSelector(sel_containerOptions);
  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);

  v14 = (CKContainerSetupInfo *)objc_msgSend_initWithContainerID_options_(self, v13, (uint64_t)v8, (uint64_t)v12);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);

  objc_storeStrong((id *)&self->_containerOptions, 0);
}

@end