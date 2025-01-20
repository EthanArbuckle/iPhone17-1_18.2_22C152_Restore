@interface IDSMPFullLegacyIdentity
+ (BOOL)supportsSecureCoding;
+ (IDSMPFullLegacyIdentity)identityWithData:(id)a3 error:(id *)a4;
+ (IDSMPFullLegacyIdentity)identityWithDataProtectionClass:(unsigned int)a3 error:(id *)a4;
+ (IDSMPFullLegacyIdentity)identityWithError:(id *)a3;
+ (_SecMPFullIdentity)_createFullIdentityFromData:(id)a3 error:(id *)a4;
+ (_SecMPFullIdentity)_createFullIdentityWithDataProtectionClass:(unsigned int)a3 error:(id *)a4;
+ (_SecMPFullIdentity)_createFullIdentityWithError:(id *)a3;
+ (_SecMPPublicIdentity)_copyPublicIdentityFromFullIdentity:(_SecMPFullIdentity *)a3 error:(id *)a4;
- (BOOL)didDataRepresentationFormatChangeFromDataRepresentation:(id)a3 error:(id *)a4;
- (BOOL)purgeFromKeychain:(id *)a3;
- (BOOL)updateIdentityToDataProtectionClass:(unsigned int)a3 error:(id *)a4;
- (IDSMPFullLegacyIdentity)initWithCoder:(id)a3;
- (IDSMPFullLegacyIdentity)initWithFullIdentity:(_SecMPFullIdentity *)a3;
- (id)dataRepresentationWithError:(id *)a3;
- (id)protectedHashOfMessageData:(id)a3 error:(id *)a4;
- (id)publicIdentityWithError:(id *)a3;
- (id)verifyAndExposeData:(id)a3 withSigner:(id)a4 error:(id *)a5;
- (unsigned)dataProtectionClassWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSMPFullLegacyIdentity

+ (IDSMPFullLegacyIdentity)identityWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3AEEF0]();
  id v17 = 0;
  v10 = (const void *)objc_msgSend__createFullIdentityFromData_error_(a1, v8, (uint64_t)v6, v9, &v17);
  id v11 = v17;
  if (v10)
  {
    id v12 = objc_alloc((Class)a1);
    v15 = objc_msgSend_initWithFullIdentity_(v12, v13, (uint64_t)v10, v14);
    CFRelease(v10);
  }
  else
  {
    v15 = 0;
  }
  if (a4 && v11) {
    *a4 = v11;
  }

  return (IDSMPFullLegacyIdentity *)v15;
}

+ (IDSMPFullLegacyIdentity)identityWithError:(id *)a3
{
  uint64_t FullIdentityWithError = objc_msgSend__createFullIdentityWithError_(a1, a2, (uint64_t)a3, v3);
  if (FullIdentityWithError)
  {
    id v6 = (const void *)FullIdentityWithError;
    id v7 = objc_alloc((Class)a1);
    v10 = objc_msgSend_initWithFullIdentity_(v7, v8, (uint64_t)v6, v9);
    CFRelease(v6);
  }
  else
  {
    v10 = 0;
  }
  return (IDSMPFullLegacyIdentity *)v10;
}

+ (IDSMPFullLegacyIdentity)identityWithDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  uint64_t FullIdentityWithDataProtectionClass_error = objc_msgSend__createFullIdentityWithDataProtectionClass_error_(a1, a2, *(uint64_t *)&a3, v4, a4);
  if (FullIdentityWithDataProtectionClass_error)
  {
    id v7 = (const void *)FullIdentityWithDataProtectionClass_error;
    id v8 = objc_alloc((Class)a1);
    id v11 = objc_msgSend_initWithFullIdentity_(v8, v9, (uint64_t)v7, v10);
    CFRelease(v7);
  }
  else
  {
    id v11 = 0;
  }
  return (IDSMPFullLegacyIdentity *)v11;
}

- (IDSMPFullLegacyIdentity)initWithFullIdentity:(_SecMPFullIdentity *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IDSMPFullLegacyIdentity;
  return [(IDSMPIdentity *)&v4 initWithBackingValue:a3];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  id v7 = objc_msgSend_dataRepresentationWithError_(self, v5, (uint64_t)&v15, v6);
  id v10 = v15;
  if (v7)
  {
    objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, v11, @"kIDSMPFullLegacyIdentityData");
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

- (IDSMPFullLegacyIdentity)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSMPFullLegacyIdentityData");

  uint64_t v9 = objc_opt_class();
  id v21 = 0;
  id v12 = (const void *)objc_msgSend__createFullIdentityFromData_error_(v9, v10, (uint64_t)v8, v11, &v21);
  id v15 = v21;
  if (v12)
  {
    id v17 = objc_msgSend_initWithFullIdentity_(self, v13, (uint64_t)v12, v16);
    CFRelease(v12);
    self = v17;
    uint64_t v18 = self;
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

    uint64_t v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)publicIdentityWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_fullIdentity(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend__copyPublicIdentityFromFullIdentity_error_(v5, v10, v9, v11, a3);
  if (v12)
  {
    v13 = (const void *)v12;
    uint64_t v14 = [IDSMPPublicLegacyIdentity alloc];
    id v17 = objc_msgSend_initWithPublicIdentity_(v14, v15, (uint64_t)v13, v16);
    CFRelease(v13);
  }
  else
  {
    id v17 = 0;
  }
  return v17;
}

- (id)verifyAndExposeData:(id)a3 withSigner:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v26 = 0;
  uint64_t v14 = objc_msgSend_publicIdentity(v9, v11, v12, v13);
  uint64_t v20 = objc_msgSend_fullIdentity(self, v15, v16, v17);
  if (qword_1E944F2C8 != -1) {
    dispatch_once(&qword_1E944F2C8, &unk_1EEFCD618);
  }
  if (!off_1E944F2C0)
  {
    id v23 = 0;
    if (!a5) {
      goto LABEL_8;
    }
LABEL_7:
    *a5 = v23;
    goto LABEL_8;
  }
  if (off_1E944F2C0(v8, v14, v20, v10, &v26))
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
    v30 = self;
    __int16 v31 = 2114;
    id v32 = v9;
    __int16 v33 = 2114;
    v34 = v23;
    _os_log_error_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_ERROR, "Failed to decrypt with message protection {data: %{private}@, fullKey: %{private}@, publicKey: %{public}@, error: %{public}@}", buf, 0x2Au);
  }

  id v22 = 0;
LABEL_11:

  return v22;
}

- (id)protectedHashOfMessageData:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = 0;
  uint64_t v12 = objc_msgSend_fullIdentity(self, v7, v8, v9);
  if (qword_1E944F190 != -1) {
    dispatch_once(&qword_1E944F190, &unk_1EEFCE6D8);
  }
  if (!off_1E944F188)
  {
    id v15 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v15;
    goto LABEL_9;
  }
  uint64_t v14 = (void *)off_1E944F188(v6, v12, &v18);
  if (v14) {
    goto LABEL_12;
  }
  id v15 = v18;
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11, v13);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478339;
    id v20 = v6;
    __int16 v21 = 2113;
    id v22 = self;
    __int16 v23 = 2114;
    id v24 = v15;
    _os_log_error_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_ERROR, "Failed to hash message with message protection {data: %{private}@, fullKey: %{private}@, error: %{public}@}", buf, 0x20u);
  }

  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

- (unsigned)dataProtectionClassWithError:(id *)a3
{
  id v15 = 0;
  uint64_t v7 = objc_msgSend_fullIdentity(self, a2, (uint64_t)a3, v3);
  if (qword_1E944EE68 != -1) {
    dispatch_once(&qword_1E944EE68, &unk_1EEFCE718);
  }
  if (off_1E944EE60 && (uint64_t v9 = off_1E944EE60(v7, &v15)) != 0)
  {
    id v10 = (const void *)v9;
    unsigned int v11 = IMGetKeychainDataProtectionClassFromSecAttrDataProtectionClass();
    CFRelease(v10);
    id v12 = 0;
  }
  else
  {
    double v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_19DB7D9DC();
    }

    id v12 = v15;
    if (a3)
    {
      id v12 = v15;
      *a3 = v12;
    }
    unsigned int v11 = 2;
  }

  return v11;
}

- (BOOL)updateIdentityToDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass();
  id v20 = 0;
  uint64_t v13 = objc_msgSend_fullIdentity(self, v8, v9, v10);
  if (qword_1E944EE78 != -1) {
    dispatch_once(&qword_1E944EE78, &unk_1EEFCE798);
  }
  if (off_1E944EE70 && off_1E944EE70(v13, v7, &v20))
  {
    id v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      id v22 = self;
      __int16 v23 = 1024;
      unsigned int v24 = a3;
      _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "Updated identity data protectionClass {identity: %{private}@, dataProtectionClass: %d}", buf, 0x12u);
    }

    id v16 = 0;
    BOOL v17 = 1;
  }
  else
  {
    id v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12, v14);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_19DB7DA48();
    }

    id v16 = v20;
    if (a4)
    {
      id v16 = v20;
      BOOL v17 = 0;
      *a4 = v16;
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (BOOL)purgeFromKeychain:(id *)a3
{
  uint64_t v6 = objc_msgSend_description(self, a2, (uint64_t)a3, v3);
  id v18 = 0;
  uint64_t v12 = objc_msgSend_fullIdentity(self, v7, v8, v9);
  if (qword_1E944F668 != -1) {
    dispatch_once(&qword_1E944F668, &unk_1EEFCE7F8);
  }
  if (!off_1E944F660)
  {
    id v15 = 0;
    if (!a3) {
      goto LABEL_8;
    }
LABEL_7:
    *a3 = v15;
    goto LABEL_8;
  }
  if (off_1E944F660(v12, &v18))
  {
    BOOL v14 = 1;
    goto LABEL_11;
  }
  id v15 = v18;
  if (a3) {
    goto LABEL_7;
  }
LABEL_8:
  id v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11, v13);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DACC();
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)didDataRepresentationFormatChangeFromDataRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v11 = objc_msgSend_dataRepresentationWithError_(self, v7, (uint64_t)a4, v8);
  if (v11)
  {
    int isEqualToData = objc_msgSend_isEqualToData_(v6, v9, (uint64_t)v11, v12);
    char v14 = isEqualToData ^ 1;
    id v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v15, v16, v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = @"YES";
      if (isEqualToData) {
        uint64_t v19 = @"NO";
      }
      int v22 = 138412290;
      __int16 v23 = v19;
      _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "Serialization of message protection identity completed for updated check {dataIsDifferent: %@}", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    id v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10, v12);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        __int16 v21 = (__CFString *)*a4;
      }
      else {
        __int16 v21 = 0;
      }
      int v22 = 138543875;
      __int16 v23 = v21;
      __int16 v24 = 2113;
      uint64_t v25 = self;
      __int16 v26 = 2113;
      id v27 = v6;
      _os_log_error_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_ERROR, "Failed to serialize IDSMPFullLegacyIdentity - Failed to determine didDataRepresentationFormatChangeFromDataRepresentation {error: %{public}@, fullIdentity: %{private}@, originalDataRepresentation: %{private}@}", (uint8_t *)&v22, 0x20u);
    }
    char v14 = 0;
  }

  return v14;
}

+ (_SecMPFullIdentity)_createFullIdentityFromData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v13 = 0;
  if (qword_1E944EE88 != -1) {
    dispatch_once(&qword_1E944EE88, &unk_1EEFCE838);
  }
  if (!off_1E944EE80)
  {
    id v10 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v10;
    goto LABEL_9;
  }
  double v9 = (_SecMPFullIdentity *)off_1E944EE80(0, v7, &v13);
  if (v9) {
    goto LABEL_12;
  }
  id v10 = v13;
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DB3C();
  }

  double v9 = 0;
LABEL_12:

  return v9;
}

+ (_SecMPFullIdentity)_createFullIdentityWithError:(id *)a3
{
  id v8 = 0;
  if (qword_1E944F678 != -1) {
    dispatch_once(&qword_1E944F678, &unk_1EEFCE898);
  }
  if (!off_1E944F670)
  {
    id v6 = 0;
    if (!a3) {
      goto LABEL_9;
    }
LABEL_8:
    *a3 = v6;
    goto LABEL_9;
  }
  result = (_SecMPFullIdentity *)off_1E944F670(0, &v8);
  if (result) {
    return result;
  }
  id v6 = v8;
  if (a3) {
    goto LABEL_8;
  }
LABEL_9:
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DBA8((uint64_t)v6, v7);
  }

  return 0;
}

+ (_SecMPFullIdentity)_createFullIdentityWithDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  id v13 = 0;
  uint64_t v8 = IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass();
  if (qword_1E944F688 != -1) {
    dispatch_once(&qword_1E944F688, &unk_1EEFCE938);
  }
  if (!off_1E944F680)
  {
    id v11 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v11;
    goto LABEL_9;
  }
  result = (_SecMPFullIdentity *)off_1E944F680(0, v8, &v13);
  if (result) {
    return result;
  }
  id v11 = v13;
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  double v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7, v9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DC20((uint64_t)v11, a3, v12);
  }

  return 0;
}

+ (_SecMPPublicIdentity)_copyPublicIdentityFromFullIdentity:(_SecMPFullIdentity *)a3 error:(id *)a4
{
  id v10 = 0;
  if (qword_1E944EEA8 != -1) {
    dispatch_once(&qword_1E944EEA8, &unk_1EEFCE978);
  }
  if (!off_1E944EEA0)
  {
    id v8 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v8;
    goto LABEL_9;
  }
  result = (_SecMPPublicIdentity *)off_1E944EEA0(0, a3, &v10);
  if (result) {
    return result;
  }
  id v8 = v10;
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  double v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DCA8();
  }

  return 0;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  double v17 = 0;
  uint64_t v11 = objc_msgSend_fullIdentity(self, v6, v7, v8);
  if (qword_1E944EE58 != -1) {
    dispatch_once(&qword_1E944EE58, &unk_1EEFCD998);
  }
  if (!off_1E944EE50)
  {
    char v14 = 0;
    if (!a3) {
      goto LABEL_8;
    }
LABEL_7:
    *a3 = v14;
    goto LABEL_8;
  }
  if (off_1E944EE50(v11, v5, &v17))
  {
    id v13 = v5;
    goto LABEL_11;
  }
  char v14 = v17;
  if (a3) {
    goto LABEL_7;
  }
LABEL_8:
  id v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10, v12);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_19DB7DD14();
  }

  id v13 = 0;
LABEL_11:

  return v13;
}

@end