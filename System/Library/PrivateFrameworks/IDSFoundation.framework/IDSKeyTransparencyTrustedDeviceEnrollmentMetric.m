@interface IDSKeyTransparencyTrustedDeviceEnrollmentMetric
- (BOOL)accountKeySuccess;
- (BOOL)cloudKitSuccess;
- (BOOL)isKVSMetric;
- (BOOL)kvsSuccess;
- (IDSKeyTransparencyTrustedDeviceEnrollmentMetric)initWithKeyTransparencyVersion:(unint64_t)a3 cloudKitSuccess:(BOOL)a4 cloudKitErrorDomain:(id)a5 cloudKitErrorCode:(int64_t)a6 cloudKitUnderlyingErrorDomain:(id)a7 cloudKitUnderlyingErrorCode:(int64_t)a8 cloudKitOperationTimeInterval:(double)a9 accountKeySuccess:(BOOL)a10 accountKeyErrorDomain:(id)a11 accountKeyErrorCode:(int64_t)a12 accountKeyUnderlyingErrorDomain:(id)a13 accountKeyUnderlyingErrorCode:(int64_t)a14 accountKeyOperationTimeInterval:(double)a15;
- (IDSKeyTransparencyTrustedDeviceEnrollmentMetric)initWithKeyTransparencyVersion:(unint64_t)a3 kvsSuccess:(BOOL)a4 kvsErrorDomain:(id)a5 kvsErrorCode:(int64_t)a6 kvsSyncTimeInterval:(double)a7 kvsUnderlyingErrorDomain:(id)a8 kvsUnderlyingErrorCode:(int64_t)a9;
- (NSDictionary)dictionaryRepresentation;
- (NSString)accountKeyErrorDomain;
- (NSString)accountKeyUnderlyingErrorDomain;
- (NSString)cloudKitErrorDomain;
- (NSString)cloudKitUnderlyingErrorDomain;
- (NSString)description;
- (NSString)kvsErrorDomain;
- (NSString)kvsUnderlyingErrorDomain;
- (NSString)name;
- (double)accountKeyOperationTimeInterval;
- (double)cloudKitOperationTimeInterval;
- (double)kvsSyncTimeInterval;
- (int64_t)accountKeyErrorCode;
- (int64_t)accountKeyUnderlyingErrorCode;
- (int64_t)cloudKitErrorCode;
- (int64_t)cloudKitUnderlyingErrorCode;
- (int64_t)kvsErrorCode;
- (int64_t)kvsUnderlyingErrorCode;
- (unint64_t)keyTransparencyVersion;
- (unsigned)rtcType;
@end

@implementation IDSKeyTransparencyTrustedDeviceEnrollmentMetric

- (IDSKeyTransparencyTrustedDeviceEnrollmentMetric)initWithKeyTransparencyVersion:(unint64_t)a3 cloudKitSuccess:(BOOL)a4 cloudKitErrorDomain:(id)a5 cloudKitErrorCode:(int64_t)a6 cloudKitUnderlyingErrorDomain:(id)a7 cloudKitUnderlyingErrorCode:(int64_t)a8 cloudKitOperationTimeInterval:(double)a9 accountKeySuccess:(BOOL)a10 accountKeyErrorDomain:(id)a11 accountKeyErrorCode:(int64_t)a12 accountKeyUnderlyingErrorDomain:(id)a13 accountKeyUnderlyingErrorCode:(int64_t)a14 accountKeyOperationTimeInterval:(double)a15
{
  id v23 = a5;
  id v24 = a7;
  id v25 = a11;
  id v26 = a13;
  v50.receiver = self;
  v50.super_class = (Class)IDSKeyTransparencyTrustedDeviceEnrollmentMetric;
  v27 = [(IDSKeyTransparencyTrustedDeviceEnrollmentMetric *)&v50 init];
  v31 = v27;
  if (v27)
  {
    v27->_isKVSMetric = 0;
    v27->_keyTransparencyVersion = a3;
    v27->_cloudKitSuccess = a4;
    uint64_t v32 = objc_msgSend_copy(v23, v28, v29, v30);
    cloudKitErrorDomain = v31->_cloudKitErrorDomain;
    v31->_cloudKitErrorDomain = (NSString *)v32;

    v31->_cloudKitErrorCode = a6;
    uint64_t v37 = objc_msgSend_copy(v24, v34, v35, v36);
    cloudKitUnderlyingErrorDomain = v31->_cloudKitUnderlyingErrorDomain;
    v31->_cloudKitUnderlyingErrorDomain = (NSString *)v37;

    v31->_cloudKitUnderlyingErrorCode = a8;
    double v39 = ceil(a9);
    v31->_cloudKitOperationTimeInterval = v39;
    v31->_accountKeySuccess = a10;
    uint64_t v42 = objc_msgSend_copy(v25, v40, v41, v39);
    accountKeyErrorDomain = v31->_accountKeyErrorDomain;
    v31->_accountKeyErrorDomain = (NSString *)v42;

    v31->_accountKeyErrorCode = a12;
    uint64_t v47 = objc_msgSend_copy(v26, v44, v45, v46);
    accountKeyUnderlyingErrorDomain = v31->_accountKeyUnderlyingErrorDomain;
    v31->_accountKeyUnderlyingErrorDomain = (NSString *)v47;

    v31->_accountKeyUnderlyingErrorCode = a14;
    v31->_accountKeyOperationTimeInterval = ceil(a15);
  }

  return v31;
}

- (IDSKeyTransparencyTrustedDeviceEnrollmentMetric)initWithKeyTransparencyVersion:(unint64_t)a3 kvsSuccess:(BOOL)a4 kvsErrorDomain:(id)a5 kvsErrorCode:(int64_t)a6 kvsSyncTimeInterval:(double)a7 kvsUnderlyingErrorDomain:(id)a8 kvsUnderlyingErrorCode:(int64_t)a9
{
  id v16 = a5;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)IDSKeyTransparencyTrustedDeviceEnrollmentMetric;
  v18 = [(IDSKeyTransparencyTrustedDeviceEnrollmentMetric *)&v26 init];
  v22 = v18;
  if (v18)
  {
    v18->_isKVSMetric = 1;
    v18->_keyTransparencyVersion = a3;
    v18->_kvsSuccess = a4;
    uint64_t v23 = objc_msgSend_copy(v16, v19, v20, v21);
    kvsErrorDomain = v22->_kvsErrorDomain;
    v22->_kvsErrorDomain = (NSString *)v23;

    v22->_kvsErrorCode = a6;
    v22->_kvsSyncTimeInterval = ceil(a7);
    objc_storeStrong((id *)&v22->_kvsUnderlyingErrorDomain, a8);
    v22->_kvsUnderlyingErrorCode = a9;
  }

  return v22;
}

- (NSString)description
{
  BOOL isKVSMetric = self->_isKVSMetric;
  v6 = NSString;
  v7 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v13 = objc_msgSend_keyTransparencyVersion(self, v8, v9, v10);
  if (isKVSMetric)
  {
    uint64_t v15 = objc_msgSend_kvsSuccess(self, v11, v12, v14);
    v19 = objc_msgSend_kvsErrorDomain(self, v16, v17, v18);
    uint64_t v23 = objc_msgSend_kvsErrorCode(self, v20, v21, v22);
    objc_msgSend_kvsSyncTimeInterval(self, v24, v25, v26);
    uint64_t v28 = (int)v27;
    v31 = objc_msgSend_kvsUnderlyingErrorDomain(self, v29, v30, v27);
    uint64_t v35 = objc_msgSend_kvsUnderlyingErrorCode(self, v32, v33, v34);
    v38 = objc_msgSend_stringWithFormat_(v6, v36, @"%@, <vers: %ld, kvs-success: %ld, kvs-error-d: %@, kvs-error-c: %ld, kvs-time: %d, kvs-uerror-d: %@, kvs-uerror-c: %ld>", v37, v7, v13, v15, v19, v23, v28, v31, v35);
  }
  else
  {
    uint64_t v84 = objc_msgSend_cloudKitSuccess(self, v11, v12, v14);
    v19 = objc_msgSend_cloudKitErrorDomain(self, v39, v40, v41);
    uint64_t v83 = objc_msgSend_cloudKitErrorCode(self, v42, v43, v44);
    v31 = objc_msgSend_cloudKitUnderlyingErrorDomain(self, v45, v46, v47);
    uint64_t v82 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v48, v49, v50);
    objc_msgSend_cloudKitOperationTimeInterval(self, v51, v52, v53);
    uint64_t v80 = (int)v54;
    v81 = v6;
    uint64_t v57 = objc_msgSend_accountKeySuccess(self, v55, v56, v54);
    v61 = objc_msgSend_accountKeyErrorDomain(self, v58, v59, v60);
    uint64_t v65 = objc_msgSend_accountKeyErrorCode(self, v62, v63, v64);
    v69 = objc_msgSend_accountKeyUnderlyingErrorDomain(self, v66, v67, v68);
    uint64_t v73 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v70, v71, v72);
    objc_msgSend_accountKeyOperationTimeInterval(self, v74, v75, v76);
    v38 = objc_msgSend_stringWithFormat_(v81, v77, @"%@: <vers: %ld, ck-success: %ld, ck-error-d: %@, ck-error-c: %ld, ck-uerror-d: %@, ck-uerror-c: %ld, ck-time: %d, ak-success: %ld, ak-error-d: %@, ak-error-c: %ld, ak-uerror-d: %@, ak-uerror-c: %ld, ak-time: %d>", v78, v7, v13, v84, v19, v83, v31, v82, v80, v57, v61, v65, v69, v73, (int)v78);
  }
  return (NSString *)v38;
}

- (NSString)name
{
  return (NSString *)@"KeyTransparencyTrustedDeviceEnrollment";
}

- (NSDictionary)dictionaryRepresentation
{
  double v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_keyTransparencyVersion(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"KTVersion", v11);
  }

  uint64_t v15 = NSNumber;
  if (self->_isKVSMetric)
  {
    uint64_t v16 = objc_msgSend_kvsSuccess(self, v12, v13, v14);
    v19 = objc_msgSend_numberWithBool_(v15, v17, v16, v18);
    if (v19) {
      CFDictionarySetValue(v3, @"KVSSuccess", v19);
    }

    uint64_t v23 = objc_msgSend_kvsErrorDomain(self, v20, v21, v22);
    id v24 = (void *)v23;
    uint64_t v25 = &stru_1EEFDAD58;
    if (v23) {
      uint64_t v25 = (__CFString *)v23;
    }
    double v26 = v25;

    CFDictionarySetValue(v3, @"KVSErrorDomain", v26);
    double v27 = NSNumber;
    uint64_t v31 = objc_msgSend_kvsErrorCode(self, v28, v29, v30);
    double v34 = objc_msgSend_numberWithInteger_(v27, v32, v31, v33);
    if (v34) {
      CFDictionarySetValue(v3, @"KVSErrorCode", v34);
    }

    uint64_t v35 = NSNumber;
    objc_msgSend_kvsSyncTimeInterval(self, v36, v37, v38);
    double v41 = objc_msgSend_numberWithInt_(v35, v40, (int)v39, v39);
    if (v41) {
      CFDictionarySetValue(v3, @"KVSSyncTimeInterval", v41);
    }

    uint64_t v45 = objc_msgSend_kvsUnderlyingErrorDomain(self, v42, v43, v44);
    if (v45) {
      CFDictionarySetValue(v3, @"KVSUnderlyingErrDomain", v45);
    }

    uint64_t v46 = NSNumber;
    uint64_t v50 = objc_msgSend_kvsUnderlyingErrorCode(self, v47, v48, v49);
    double v53 = objc_msgSend_numberWithInteger_(v46, v51, v50, v52);
    if (v53)
    {
      double v54 = @"KVSUnderlyingErrCode";
LABEL_44:
      CFDictionarySetValue(v3, v54, v53);
    }
  }
  else
  {
    uint64_t v55 = objc_msgSend_cloudKitSuccess(self, v12, v13, v14);
    v58 = objc_msgSend_numberWithBool_(v15, v56, v55, v57);
    if (v58) {
      CFDictionarySetValue(v3, @"CKSuccess", v58);
    }

    uint64_t v62 = objc_msgSend_cloudKitErrorDomain(self, v59, v60, v61);
    uint64_t v63 = (void *)v62;
    if (v62) {
      double v64 = (__CFString *)v62;
    }
    else {
      double v64 = &stru_1EEFDAD58;
    }
    uint64_t v65 = v64;

    CFDictionarySetValue(v3, @"CKErrorDomain", v65);
    v66 = NSNumber;
    uint64_t v70 = objc_msgSend_cloudKitErrorCode(self, v67, v68, v69);
    uint64_t v73 = objc_msgSend_numberWithInteger_(v66, v71, v70, v72);
    if (v73) {
      CFDictionarySetValue(v3, @"CKErrorCode", v73);
    }

    uint64_t v77 = objc_msgSend_cloudKitUnderlyingErrorDomain(self, v74, v75, v76);
    double v78 = (void *)v77;
    if (v77) {
      v79 = (__CFString *)v77;
    }
    else {
      v79 = &stru_1EEFDAD58;
    }
    uint64_t v80 = v79;

    CFDictionarySetValue(v3, @"CKUnderlyingErrorDomain", v80);
    v81 = NSNumber;
    uint64_t v85 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v82, v83, v84);
    v88 = objc_msgSend_numberWithInteger_(v81, v86, v85, v87);
    if (v88) {
      CFDictionarySetValue(v3, @"CKUnderlyingErrorCode", v88);
    }

    v89 = NSNumber;
    objc_msgSend_cloudKitOperationTimeInterval(self, v90, v91, v92);
    v95 = objc_msgSend_numberWithInt_(v89, v94, (int)v93, v93);
    if (v95) {
      CFDictionarySetValue(v3, @"CKTimeInterval", v95);
    }

    v96 = NSNumber;
    uint64_t v100 = objc_msgSend_accountKeySuccess(self, v97, v98, v99);
    v103 = objc_msgSend_numberWithBool_(v96, v101, v100, v102);
    if (v103) {
      CFDictionarySetValue(v3, @"AKSuccess", v103);
    }

    uint64_t v107 = objc_msgSend_accountKeyErrorDomain(self, v104, v105, v106);
    v108 = (void *)v107;
    if (v107) {
      v109 = (__CFString *)v107;
    }
    else {
      v109 = &stru_1EEFDAD58;
    }
    v110 = v109;

    CFDictionarySetValue(v3, @"AKErrorDomain", v110);
    v111 = NSNumber;
    uint64_t v115 = objc_msgSend_accountKeyErrorCode(self, v112, v113, v114);
    v118 = objc_msgSend_numberWithInteger_(v111, v116, v115, v117);
    if (v118) {
      CFDictionarySetValue(v3, @"AKErrorCode", v118);
    }

    uint64_t v122 = objc_msgSend_accountKeyUnderlyingErrorDomain(self, v119, v120, v121);
    v123 = (void *)v122;
    if (v122) {
      v124 = (__CFString *)v122;
    }
    else {
      v124 = &stru_1EEFDAD58;
    }
    v125 = v124;

    CFDictionarySetValue(v3, @"AKUnderlyingErrorDomain", v125);
    v126 = NSNumber;
    uint64_t v130 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v127, v128, v129);
    v133 = objc_msgSend_numberWithInteger_(v126, v131, v130, v132);
    if (v133) {
      CFDictionarySetValue(v3, @"AKUnderlyingErrorCode", v133);
    }

    v134 = NSNumber;
    objc_msgSend_accountKeyOperationTimeInterval(self, v135, v136, v137);
    double v53 = objc_msgSend_numberWithInt_(v134, v139, (int)v138, v138);
    if (v53)
    {
      double v54 = @"AKTimeInterval";
      goto LABEL_44;
    }
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeKeyTransparencyTrustedDeviceEnrollment;
}

- (unint64_t)keyTransparencyVersion
{
  return self->_keyTransparencyVersion;
}

- (BOOL)cloudKitSuccess
{
  return self->_cloudKitSuccess;
}

- (NSString)cloudKitErrorDomain
{
  return self->_cloudKitErrorDomain;
}

- (int64_t)cloudKitErrorCode
{
  return self->_cloudKitErrorCode;
}

- (NSString)cloudKitUnderlyingErrorDomain
{
  return self->_cloudKitUnderlyingErrorDomain;
}

- (int64_t)cloudKitUnderlyingErrorCode
{
  return self->_cloudKitUnderlyingErrorCode;
}

- (double)cloudKitOperationTimeInterval
{
  return self->_cloudKitOperationTimeInterval;
}

- (BOOL)accountKeySuccess
{
  return self->_accountKeySuccess;
}

- (NSString)accountKeyErrorDomain
{
  return self->_accountKeyErrorDomain;
}

- (int64_t)accountKeyErrorCode
{
  return self->_accountKeyErrorCode;
}

- (NSString)accountKeyUnderlyingErrorDomain
{
  return self->_accountKeyUnderlyingErrorDomain;
}

- (int64_t)accountKeyUnderlyingErrorCode
{
  return self->_accountKeyUnderlyingErrorCode;
}

- (double)accountKeyOperationTimeInterval
{
  return self->_accountKeyOperationTimeInterval;
}

- (BOOL)isKVSMetric
{
  return self->_isKVSMetric;
}

- (BOOL)kvsSuccess
{
  return self->_kvsSuccess;
}

- (NSString)kvsErrorDomain
{
  return self->_kvsErrorDomain;
}

- (int64_t)kvsErrorCode
{
  return self->_kvsErrorCode;
}

- (double)kvsSyncTimeInterval
{
  return self->_kvsSyncTimeInterval;
}

- (NSString)kvsUnderlyingErrorDomain
{
  return self->_kvsUnderlyingErrorDomain;
}

- (int64_t)kvsUnderlyingErrorCode
{
  return self->_kvsUnderlyingErrorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvsUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_kvsErrorDomain, 0);
  objc_storeStrong((id *)&self->_accountKeyUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_accountKeyErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitErrorDomain, 0);
}

@end