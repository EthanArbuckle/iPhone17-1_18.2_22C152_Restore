@interface IDSKeyTransparencyTrustedDeviceVerificationMetric
- (BOOL)accountKeySuccess;
- (BOOL)cloudKitSuccess;
- (IDSKeyTransparencyTrustedDeviceVerificationMetric)initWithKeyTransparencyVersion:(unint64_t)a3 cloudKitSuccess:(BOOL)a4 cloudKitErrorDomain:(id)a5 cloudKitErrorCode:(int64_t)a6 cloudKitUnderlyingErrorDomain:(id)a7 cloudKitUnderlyingErrorCode:(int64_t)a8 cloudKitOperationTimeInterval:(double)a9 accountKeySuccess:(BOOL)a10 accountKeyErrorDomain:(id)a11 accountKeyErrorCode:(int64_t)a12 accountKeyUnderlyingErrorDomain:(id)a13 accountKeyUnderlyingErrorCode:(int64_t)a14 accountKeyOperationTimeInterval:(double)a15 numberOfTotalDevices:(unint64_t)a16 numberOfCandidateDevices:(unint64_t)a17 numberOfMatchesFromCloudKit:(unint64_t)a18 numberOfMatchesFromAccountKey:(unint64_t)a19;
- (NSDictionary)dictionaryRepresentation;
- (NSString)accountKeyErrorDomain;
- (NSString)accountKeyUnderlyingErrorDomain;
- (NSString)cloudKitErrorDomain;
- (NSString)cloudKitUnderlyingErrorDomain;
- (NSString)description;
- (NSString)name;
- (double)accountKeyOperationTimeInterval;
- (double)cloudKitOperationTimeInterval;
- (int64_t)accountKeyErrorCode;
- (int64_t)accountKeyUnderlyingErrorCode;
- (int64_t)cloudKitErrorCode;
- (int64_t)cloudKitUnderlyingErrorCode;
- (unint64_t)keyTransparencyVersion;
- (unint64_t)numberOfCandidateDevices;
- (unint64_t)numberOfMatchesFromAccountKey;
- (unint64_t)numberOfMatchesFromCloudKit;
- (unint64_t)numberOfTotalDevices;
- (unsigned)rtcType;
@end

@implementation IDSKeyTransparencyTrustedDeviceVerificationMetric

- (IDSKeyTransparencyTrustedDeviceVerificationMetric)initWithKeyTransparencyVersion:(unint64_t)a3 cloudKitSuccess:(BOOL)a4 cloudKitErrorDomain:(id)a5 cloudKitErrorCode:(int64_t)a6 cloudKitUnderlyingErrorDomain:(id)a7 cloudKitUnderlyingErrorCode:(int64_t)a8 cloudKitOperationTimeInterval:(double)a9 accountKeySuccess:(BOOL)a10 accountKeyErrorDomain:(id)a11 accountKeyErrorCode:(int64_t)a12 accountKeyUnderlyingErrorDomain:(id)a13 accountKeyUnderlyingErrorCode:(int64_t)a14 accountKeyOperationTimeInterval:(double)a15 numberOfTotalDevices:(unint64_t)a16 numberOfCandidateDevices:(unint64_t)a17 numberOfMatchesFromCloudKit:(unint64_t)a18 numberOfMatchesFromAccountKey:(unint64_t)a19
{
  id v53 = a5;
  id v27 = a7;
  id v28 = a11;
  id v29 = a13;
  v54.receiver = self;
  v54.super_class = (Class)IDSKeyTransparencyTrustedDeviceVerificationMetric;
  v30 = [(IDSKeyTransparencyTrustedDeviceVerificationMetric *)&v54 init];
  v34 = v30;
  if (v30)
  {
    v30->_keyTransparencyVersion = a3;
    v30->_cloudKitSuccess = a4;
    uint64_t v35 = objc_msgSend_copy(v53, v31, v32, v33);
    cloudKitErrorDomain = v34->_cloudKitErrorDomain;
    v34->_cloudKitErrorDomain = (NSString *)v35;

    v34->_cloudKitErrorCode = a6;
    uint64_t v40 = objc_msgSend_copy(v27, v37, v38, v39);
    cloudKitUnderlyingErrorDomain = v34->_cloudKitUnderlyingErrorDomain;
    v34->_cloudKitUnderlyingErrorDomain = (NSString *)v40;

    v34->_cloudKitUnderlyingErrorCode = a8;
    double v42 = ceil(a9);
    v34->_cloudKitOperationTimeInterval = v42;
    v34->_accountKeySuccess = a10;
    uint64_t v45 = objc_msgSend_copy(v28, v43, v44, v42);
    accountKeyErrorDomain = v34->_accountKeyErrorDomain;
    v34->_accountKeyErrorDomain = (NSString *)v45;

    v34->_accountKeyErrorCode = a12;
    uint64_t v50 = objc_msgSend_copy(v29, v47, v48, v49);
    accountKeyUnderlyingErrorDomain = v34->_accountKeyUnderlyingErrorDomain;
    v34->_accountKeyUnderlyingErrorDomain = (NSString *)v50;

    v34->_accountKeyUnderlyingErrorCode = a14;
    v34->_accountKeyOperationTimeInterval = ceil(a15);
    v34->_numberOfTotalDevices = a16;
    v34->_numberOfCandidateDevices = a17;
    v34->_numberOfMatchesFromCloudKit = a18;
    v34->_numberOfMatchesFromAccountKey = a19;
  }

  return v34;
}

- (NSString)description
{
  v78 = NSString;
  v77 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v76 = objc_msgSend_keyTransparencyVersion(self, v5, v6, v7);
  uint64_t v75 = objc_msgSend_cloudKitSuccess(self, v8, v9, v10);
  v74 = objc_msgSend_cloudKitErrorDomain(self, v11, v12, v13);
  uint64_t v73 = objc_msgSend_cloudKitErrorCode(self, v14, v15, v16);
  v20 = objc_msgSend_cloudKitUnderlyingErrorDomain(self, v17, v18, v19);
  uint64_t v72 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v21, v22, v23);
  objc_msgSend_cloudKitOperationTimeInterval(self, v24, v25, v26);
  uint64_t v71 = (int)v27;
  uint64_t v70 = objc_msgSend_accountKeySuccess(self, v28, v29, v27);
  double v33 = objc_msgSend_accountKeyErrorDomain(self, v30, v31, v32);
  uint64_t v37 = objc_msgSend_accountKeyErrorCode(self, v34, v35, v36);
  v41 = objc_msgSend_accountKeyUnderlyingErrorDomain(self, v38, v39, v40);
  uint64_t v45 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v42, v43, v44);
  objc_msgSend_accountKeyOperationTimeInterval(self, v46, v47, v48);
  uint64_t v50 = (int)v49;
  uint64_t v53 = objc_msgSend_numberOfTotalDevices(self, v51, v52, v49);
  uint64_t v57 = objc_msgSend_numberOfCandidateDevices(self, v54, v55, v56);
  uint64_t v61 = objc_msgSend_numberOfMatchesFromCloudKit(self, v58, v59, v60);
  uint64_t v65 = objc_msgSend_numberOfMatchesFromAccountKey(self, v62, v63, v64);
  objc_msgSend_stringWithFormat_(v78, v66, @"%@: <vers: %ld, ck-success: %ld, ck-error-d: %@, ck-error-c: %ld, ck-uerror-d: %@, ck-uerror-c: %ld, ck-time: %d, ak-success: %ld, ak-error-d: %@, ak-error-c: %ld, ak-uerror-d: %@, ak-uerror-c: %ld, ak-time: %d, devices: %ld, candidates: %ld, ck-matches: %ld, ak-matches: %ld>", v67, v77, v76, v75, v74, v73, v20, v72, v71, v70, v33, v37, v41, v45, v50, v53,
    v57,
    v61,
  v68 = v65);

  return (NSString *)v68;
}

- (NSString)name
{
  return (NSString *)@"KeyTransparencyTrustedDeviceVerification";
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

  uint64_t v12 = NSNumber;
  uint64_t v16 = objc_msgSend_cloudKitSuccess(self, v13, v14, v15);
  double v19 = objc_msgSend_numberWithBool_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"CKSuccess", v19);
  }

  uint64_t v23 = objc_msgSend_cloudKitErrorDomain(self, v20, v21, v22);
  v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  else {
    uint64_t v25 = &stru_1EEFDAD58;
  }
  double v26 = v25;

  CFDictionarySetValue(v3, @"CKErrorDomain", v26);
  double v27 = NSNumber;
  uint64_t v31 = objc_msgSend_cloudKitErrorCode(self, v28, v29, v30);
  v34 = objc_msgSend_numberWithInteger_(v27, v32, v31, v33);
  if (v34) {
    CFDictionarySetValue(v3, @"CKErrorCode", v34);
  }

  uint64_t v38 = objc_msgSend_cloudKitUnderlyingErrorDomain(self, v35, v36, v37);
  uint64_t v39 = (void *)v38;
  if (v38) {
    double v40 = (__CFString *)v38;
  }
  else {
    double v40 = &stru_1EEFDAD58;
  }
  v41 = v40;

  CFDictionarySetValue(v3, @"CKUnderlyingErrorDomain", v41);
  double v42 = NSNumber;
  uint64_t v46 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v43, v44, v45);
  double v49 = objc_msgSend_numberWithInteger_(v42, v47, v46, v48);
  if (v49) {
    CFDictionarySetValue(v3, @"CKUnderlyingErrorCode", v49);
  }

  uint64_t v50 = NSNumber;
  objc_msgSend_cloudKitOperationTimeInterval(self, v51, v52, v53);
  double v56 = objc_msgSend_numberWithInt_(v50, v55, (int)v54, v54);
  if (v56) {
    CFDictionarySetValue(v3, @"CKTimeInterval", v56);
  }

  uint64_t v57 = NSNumber;
  uint64_t v61 = objc_msgSend_accountKeySuccess(self, v58, v59, v60);
  double v64 = objc_msgSend_numberWithBool_(v57, v62, v61, v63);
  if (v64) {
    CFDictionarySetValue(v3, @"AKSuccess", v64);
  }

  uint64_t v68 = objc_msgSend_accountKeyErrorDomain(self, v65, v66, v67);
  v69 = (void *)v68;
  if (v68) {
    uint64_t v70 = (__CFString *)v68;
  }
  else {
    uint64_t v70 = &stru_1EEFDAD58;
  }
  uint64_t v71 = v70;

  CFDictionarySetValue(v3, @"AKErrorDomain", v71);
  uint64_t v72 = NSNumber;
  uint64_t v76 = objc_msgSend_accountKeyErrorCode(self, v73, v74, v75);
  v79 = objc_msgSend_numberWithInteger_(v72, v77, v76, v78);
  if (v79) {
    CFDictionarySetValue(v3, @"AKErrorCode", v79);
  }

  uint64_t v83 = objc_msgSend_accountKeyUnderlyingErrorDomain(self, v80, v81, v82);
  v84 = (void *)v83;
  if (v83) {
    v85 = (__CFString *)v83;
  }
  else {
    v85 = &stru_1EEFDAD58;
  }
  v86 = v85;

  CFDictionarySetValue(v3, @"AKUnderlyingErrorDomain", v86);
  v87 = NSNumber;
  uint64_t v91 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v88, v89, v90);
  v94 = objc_msgSend_numberWithInteger_(v87, v92, v91, v93);
  if (v94) {
    CFDictionarySetValue(v3, @"AKUnderlyingErrorCode", v94);
  }

  v95 = NSNumber;
  objc_msgSend_accountKeyOperationTimeInterval(self, v96, v97, v98);
  v101 = objc_msgSend_numberWithInt_(v95, v100, (int)v99, v99);
  if (v101) {
    CFDictionarySetValue(v3, @"AKTimeInterval", v101);
  }

  v102 = NSNumber;
  uint64_t v106 = objc_msgSend_numberOfTotalDevices(self, v103, v104, v105);
  v109 = objc_msgSend_numberWithUnsignedInteger_(v102, v107, v106, v108);
  if (v109) {
    CFDictionarySetValue(v3, @"Devices", v109);
  }

  v110 = NSNumber;
  uint64_t v114 = objc_msgSend_numberOfCandidateDevices(self, v111, v112, v113);
  v117 = objc_msgSend_numberWithUnsignedInteger_(v110, v115, v114, v116);
  if (v117) {
    CFDictionarySetValue(v3, @"Candidates", v117);
  }

  v118 = NSNumber;
  uint64_t v122 = objc_msgSend_numberOfMatchesFromCloudKit(self, v119, v120, v121);
  v125 = objc_msgSend_numberWithUnsignedInteger_(v118, v123, v122, v124);
  if (v125) {
    CFDictionarySetValue(v3, @"CKMatches", v125);
  }

  v126 = NSNumber;
  uint64_t v130 = objc_msgSend_numberOfMatchesFromAccountKey(self, v127, v128, v129);
  v133 = objc_msgSend_numberWithUnsignedInteger_(v126, v131, v130, v132);
  if (v133) {
    CFDictionarySetValue(v3, @"AKMatches", v133);
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeKeyTransparencyTrustedDeviceVerification;
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

- (unint64_t)numberOfTotalDevices
{
  return self->_numberOfTotalDevices;
}

- (unint64_t)numberOfCandidateDevices
{
  return self->_numberOfCandidateDevices;
}

- (unint64_t)numberOfMatchesFromCloudKit
{
  return self->_numberOfMatchesFromCloudKit;
}

- (unint64_t)numberOfMatchesFromAccountKey
{
  return self->_numberOfMatchesFromAccountKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountKeyUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_accountKeyErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitErrorDomain, 0);
}

@end