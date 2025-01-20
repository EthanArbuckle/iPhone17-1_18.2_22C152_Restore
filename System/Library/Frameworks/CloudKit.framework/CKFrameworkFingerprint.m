@interface CKFrameworkFingerprint
+ (BOOL)supportsSecureCoding;
- (BOOL)isLikelyEqual:(id)a3;
- (CKFrameworkFingerprint)init;
- (CKFrameworkFingerprint)initWithCoder:(id)a3;
- (NSNumber)cpuSubtype;
- (NSNumber)cpuType;
- (NSNumber)version;
- (NSUUID)uuid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCpuSubtype:(id)a3;
- (void)setCpuType:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation CKFrameworkFingerprint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKFrameworkFingerprint)init
{
  v40[2] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)CKFrameworkFingerprint;
  v2 = [(CKFrameworkFingerprint *)&v35 init];
  if (v2)
  {
    v3 = CKHeaderForLibraryName(@"CloudKit");
    if (v3)
    {
      v4 = (mach_header *)v3;
      v40[0] = 0;
      v40[1] = 0;
      if (_dyld_get_image_uuid())
      {
        id v5 = objc_alloc(MEMORY[0x1E4F29128]);
        v8 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)v40, v7);
        objc_msgSend_setUuid_(v2, v9, (uint64_t)v8, v10);
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v17 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v37 = (__CFString *)v4;
          __int16 v38 = 2112;
          v39 = @"CloudKit";
          _os_log_error_impl(&dword_18AF10000, v17, OS_LOG_TYPE_ERROR, "Failed to get image uuid for header %p in library name %@", buf, 0x16u);
        }
      }
      v18 = objc_msgSend_numberWithInt_(NSNumber, v11, v4->cputype, v12);
      objc_msgSend_setCpuType_(v2, v19, (uint64_t)v18, v20);

      v23 = objc_msgSend_numberWithInt_(NSNumber, v21, v4->cpusubtype, v22);
      objc_msgSend_setCpuSubtype_(v2, v24, (uint64_t)v23, v25);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v13 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = @"CloudKit";
        _os_log_error_impl(&dword_18AF10000, v13, OS_LOG_TYPE_ERROR, "Couldn't get mach_header for library name %@", buf, 0xCu);
      }
    }
    v26 = (const char *)objc_msgSend_UTF8String(@"CloudKit", v14, v15, v16);
    uint64_t v27 = NSVersionOfRunTimeLibrary(v26);
    if (v27 == -1)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v33 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = @"CloudKit";
        _os_log_error_impl(&dword_18AF10000, v33, OS_LOG_TYPE_ERROR, "Couldn't get runtime version for library name %@", buf, 0xCu);
      }
    }
    else
    {
      v30 = objc_msgSend_numberWithInt_(NSNumber, v28, v27, v29);
      objc_msgSend_setVersion_(v2, v31, (uint64_t)v30, v32);
    }
  }
  return v2;
}

- (CKFrameworkFingerprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKFrameworkFingerprint;
  id v5 = [(CKFrameworkFingerprint *)&v27 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_uuid);
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(sel_version);
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, (uint64_t)v12);
    version = v5->_version;
    v5->_version = (NSNumber *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_cpuType);
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v16, (uint64_t)v17);
    cpuType = v5->_cpuType;
    v5->_cpuType = (NSNumber *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = NSStringFromSelector(sel_cpuSubtype);
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v21, (uint64_t)v22);
    cpuSubtype = v5->_cpuSubtype;
    v5->_cpuSubtype = (NSNumber *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_uuid(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_uuid);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_version(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_version);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_cpuType(self, v17, v18, v19);
  uint64_t v21 = NSStringFromSelector(sel_cpuType);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);

  objc_msgSend_cpuSubtype(self, v23, v24, v25);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  v26 = NSStringFromSelector(sel_cpuSubtype);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v28, (uint64_t)v26);
}

- (id)description
{
  id v4 = self;
  v8 = objc_msgSend_cpuType(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_cpuSubtype(v4, v5, v6, v7);

    if (v9)
    {
      uint64_t v10 = objc_msgSend_cpuType(v4, v5, v6, v7);
      cpu_type_t v14 = objc_msgSend_intValue(v10, v11, v12, v13);
      uint64_t v18 = objc_msgSend_cpuSubtype(v4, v15, v16, v17);
      cpu_subtype_t v22 = objc_msgSend_intValue(v18, v19, v20, v21);
      v8 = (void *)macho_arch_name_for_cpu_type(v14, v22);

      if (v8)
      {
        v8 = objc_msgSend_stringWithCString_encoding_(NSString, v5, (uint64_t)v8, 4);
      }
    }
    else
    {
      v8 = 0;
    }
  }
  v23 = NSString;
  objc_super v27 = objc_msgSend_uuid(v4, v5, v6, v7);
  if (v4)
  {
    id v28 = objc_msgSend_version(v4, v24, v25, v26);

    if (v28)
    {
      v30 = NSString;
      v31 = objc_msgSend_version(v4, v24, v29, v26);
      uint64_t v35 = objc_msgSend_unsignedIntValue(v31, v32, v33, v34) >> 16;
      v39 = objc_msgSend_version(v4, v36, v37, v38);
      uint64_t v43 = ((unsigned __int16)objc_msgSend_unsignedIntValue(v39, v40, v41, v42) >> 8);
      v47 = objc_msgSend_version(v4, v44, v45, v46);
      unsigned __int8 v51 = objc_msgSend_unsignedIntValue(v47, v48, v49, v50);
      id v4 = objc_msgSend_stringWithFormat_(v30, v52, @"%u.%u.%u", v53, v35, v43, v51);
    }
    else
    {
      id v4 = 0;
    }
  }
  v54 = objc_msgSend_stringWithFormat_(v23, v24, @"%@, %@, %@", v26, v27, v4, v8);

  return v54;
}

- (BOOL)isLikelyEqual:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_uuid(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_uuid(v4, v9, v10, v11);
  char isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if (isEqual)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    uint64_t v20 = objc_msgSend_version(self, v16, v17, v18);
    uint64_t v24 = objc_msgSend_version(v4, v21, v22, v23);
    int v27 = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);

    if (v27)
    {
      uint64_t v34 = objc_msgSend_cpuType(self, v28, v29, v30);
      if (v34)
      {
        uint64_t v38 = objc_msgSend_cpuSubtype(self, v31, v32, v33);
        if (v38)
        {
          v39 = objc_msgSend_cpuType(self, v35, v36, v37);
          uint64_t v43 = objc_msgSend_cpuType(v4, v40, v41, v42);
          if (objc_msgSend_isEqual_(v39, v44, (uint64_t)v43, v45))
          {
            uint64_t v49 = objc_msgSend_cpuSubtype(self, v46, v47, v48);
            uint64_t v53 = objc_msgSend_cpuSubtype(v4, v50, v51, v52);
            int v19 = objc_msgSend_isEqual_(v49, v54, (uint64_t)v53, v55) ^ 1;
          }
          else
          {
            LOBYTE(v19) = 1;
          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)cpuType
{
  return self->_cpuType;
}

- (void)setCpuType:(id)a3
{
}

- (NSNumber)cpuSubtype
{
  return self->_cpuSubtype;
}

- (void)setCpuSubtype:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuSubtype, 0);
  objc_storeStrong((id *)&self->_cpuType, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end