@interface IDSMPPublicLegacyIdentity
+ (BOOL)supportsSecureCoding;
+ (IDSMPPublicLegacyIdentity)identityWithData:(id)a3 error:(id *)a4;
+ (_SecMPPublicIdentity)_createPublicIdentityFromData:(id)a3 error:(id *)a4;
- (IDSMPPublicLegacyIdentity)initWithCoder:(id)a3;
- (IDSMPPublicLegacyIdentity)initWithPublicIdentity:(_SecMPPublicIdentity *)a3;
- (id)dataRepresentationWithError:(id *)a3;
- (id)signAndProtectData:(id)a3 withSigner:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSMPPublicLegacyIdentity

+ (IDSMPPublicLegacyIdentity)identityWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3AEEF0]();
  id v17 = 0;
  v10 = (const void *)objc_msgSend__createPublicIdentityFromData_error_(a1, v8, (uint64_t)v6, v9, &v17);
  id v11 = v17;
  if (v10)
  {
    id v12 = objc_alloc((Class)a1);
    v15 = objc_msgSend_initWithPublicIdentity_(v12, v13, (uint64_t)v10, v14);
    CFRelease(v10);
  }
  else
  {
    v15 = 0;
  }
  if (a4 && v11) {
    *a4 = v11;
  }

  return (IDSMPPublicLegacyIdentity *)v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSMPPublicLegacyIdentity)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSMPPublicLegacyIdentityData");

  double v9 = objc_opt_class();
  id v21 = 0;
  id v12 = (const void *)objc_msgSend__createPublicIdentityFromData_error_(v9, v10, (uint64_t)v8, v11, &v21);
  id v15 = v21;
  if (v12)
  {
    id v17 = objc_msgSend_initWithPublicIdentity_(self, v13, (uint64_t)v12, v16);
    CFRelease(v12);
    self = v17;
    v18 = self;
  }
  else
  {
    v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14, v16);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v23 = v15;
      __int16 v24 = 2113;
      v25 = v8;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "initWithCoder failed {error: %{public}@, data: %{private}@}", buf, 0x16u);
    }

    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  double v7 = objc_msgSend_dataRepresentationWithError_(self, v5, (uint64_t)&v15, v6);
  id v10 = v15;
  if (v7)
  {
    objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, v11, @"kIDSMPPublicLegacyIdentityData");
  }
  else
  {
    id v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "Failed to encode with coder {error: %{public}@}", buf, 0xCu);
    }

    objc_msgSend_failWithError_(v4, v13, (uint64_t)v10, v14);
  }
}

- (IDSMPPublicLegacyIdentity)initWithPublicIdentity:(_SecMPPublicIdentity *)a3
{
  return (IDSMPPublicLegacyIdentity *)((uint64_t (*)(IDSMPPublicLegacyIdentity *, char *, _SecMPPublicIdentity *))MEMORY[0x1F4181798])(self, sel_initWithBackingValue_, a3);
}

- (id)signAndProtectData:(id)a3 withSigner:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v26 = 0;
  uint64_t v14 = objc_msgSend_fullIdentity(v9, v11, v12, v13);
  uint64_t v20 = objc_msgSend_publicIdentity(self, v15, v16, v17);
  if (qword_1E944F2B8 != -1) {
    dispatch_once(&qword_1E944F2B8, &unk_1EEFCD9D8);
  }
  if (!off_1E944F2B0)
  {
    id v23 = 0;
    if (!a5) {
      goto LABEL_8;
    }
LABEL_7:
    *a5 = v23;
    goto LABEL_8;
  }
  if (off_1E944F2B0(v8, v14, v20, v10, &v26))
  {
    id v22 = v10;
    goto LABEL_11;
  }
  id v23 = v26;
  if (a5) {
    goto LABEL_7;
  }
LABEL_8:
  __int16 v24 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19, v21);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478595;
    id v28 = v8;
    __int16 v29 = 2113;
    id v30 = v9;
    __int16 v31 = 2114;
    v32 = self;
    __int16 v33 = 2114;
    v34 = v23;
    _os_log_error_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_ERROR, "Failed to encrypt with message protection {data: %{private}@, fullKey: %{private}@, publicKey: %{public}@, error: %{public}@}", buf, 0x2Au);
  }

  id v22 = 0;
LABEL_11:

  return v22;
}

+ (_SecMPPublicIdentity)_createPublicIdentityFromData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v13 = 0;
  if (qword_1E944EEB8 != -1) {
    dispatch_once(&qword_1E944EEB8, &unk_1EEFCDA58);
  }
  if (!off_1E944EEB0)
  {
    id v10 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v10;
    goto LABEL_9;
  }
  id v9 = (_SecMPPublicIdentity *)off_1E944EEB0(0, v7, &v13);
  if (v9) {
    goto LABEL_12;
  }
  id v10 = v13;
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  double v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DD84();
  }

  id v9 = 0;
LABEL_12:

  return v9;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  double v17 = 0;
  uint64_t v11 = objc_msgSend_publicIdentity(self, v6, v7, v8);
  if (qword_1E944EE98 != -1) {
    dispatch_once(&qword_1E944EE98, &unk_1EEFCDA98);
  }
  if (!off_1E944EE90)
  {
    uint64_t v14 = 0;
    if (!a3) {
      goto LABEL_8;
    }
LABEL_7:
    *a3 = v14;
    goto LABEL_8;
  }
  if (off_1E944EE90(v11, v5, &v17))
  {
    id v13 = v5;
    goto LABEL_11;
  }
  uint64_t v14 = v17;
  if (a3) {
    goto LABEL_7;
  }
LABEL_8:
  id v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10, v12);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DDF0();
  }

  id v13 = 0;
LABEL_11:

  return v13;
}

@end