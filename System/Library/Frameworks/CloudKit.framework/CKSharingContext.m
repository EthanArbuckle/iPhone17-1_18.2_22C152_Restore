@interface CKSharingContext
+ (BOOL)supportsSecureCoding;
- (CKAllowedSharingOptions)allowedOptions;
- (CKContainerSetupInfo)containerSetupInfo;
- (CKShare)share;
- (CKSharingContext)initWithCoder:(id)a3;
- (CKSharingContext)initWithShare:(id)a3 containerSetupInfo:(id)a4 allowedOptions:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedOptions:(id)a3;
- (void)setContainerSetupInfo:(id)a3;
- (void)setShare:(id)a3;
@end

@implementation CKSharingContext

- (CKSharingContext)initWithShare:(id)a3 containerSetupInfo:(id)a4 allowedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKSharingContext;
  v14 = [(CKSharingContext *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    share = v14->_share;
    v14->_share = (CKShare *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    containerSetupInfo = v14->_containerSetupInfo;
    v14->_containerSetupInfo = (CKContainerSetupInfo *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    allowedOptions = v14->_allowedOptions;
    v14->_allowedOptions = (CKAllowedSharingOptions *)v25;
  }
  return v14;
}

- (CKSharingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKSharingContext;
  v5 = [(CKSharingContext *)&v25 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"CKSharingContextShareKey");
    share = v5->_share;
    v5->_share = (CKShare *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"CKSharingContextContainerSetupInfoKey");
    containerSetupInfo = v5->_containerSetupInfo;
    v5->_containerSetupInfo = (CKContainerSetupInfo *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v20 = objc_msgSend_setWithObjects_(v14, v18, v15, v19, v16, v17, 0);
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, @"CKSharingContextAllowedOptionsKey");
    allowedOptions = v5->_allowedOptions;
    v5->_allowedOptions = (CKAllowedSharingOptions *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  share = self->_share;
  id v8 = a3;
  objc_msgSend_encodeObject_forKey_(v8, v5, (uint64_t)share, @"CKSharingContextShareKey");
  objc_msgSend_encodeObject_forKey_(v8, v6, (uint64_t)self->_containerSetupInfo, @"CKSharingContextContainerSetupInfoKey");
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->_allowedOptions, @"CKSharingContextAllowedOptionsKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKSharingContext);
  id v8 = objc_msgSend_share(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  share = v4->_share;
  v4->_share = (CKShare *)v12;

  uint64_t v17 = objc_msgSend_containerSetupInfo(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  containerSetupInfo = v4->_containerSetupInfo;
  v4->_containerSetupInfo = (CKContainerSetupInfo *)v21;

  v26 = objc_msgSend_allowedOptions(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_copy(v26, v27, v28, v29);
  allowedOptions = v4->_allowedOptions;
  v4->_allowedOptions = (CKAllowedSharingOptions *)v30;

  return v4;
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
}

- (CKAllowedSharingOptions)allowedOptions
{
  return self->_allowedOptions;
}

- (void)setAllowedOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedOptions, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

@end