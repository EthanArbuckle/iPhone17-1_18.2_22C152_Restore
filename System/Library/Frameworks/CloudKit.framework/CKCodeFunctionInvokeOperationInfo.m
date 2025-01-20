@interface CKCodeFunctionInvokeOperationInfo
+ (BOOL)supportsSecureCoding;
+ (void)applyDefaultParametersToServiceURLComponents:(id)a3;
- (BOOL)enqueuedOnContainerService;
- (BOOL)legacyIsLocalBit;
- (BOOL)shouldFetchAssetContentInMemory;
- (BOOL)shouldSendRecordPCSKeys;
- (CKCodeFunctionInvokeOperationInfo)initWithCoder:(id)a3;
- (NSArray)requestLocalEnvelopes;
- (NSArray)requestLocalSerializations;
- (NSData)permittedRemoteMeasurement;
- (NSString)functionName;
- (NSString)serviceName;
- (NSString)trustedTargetDomain;
- (NSString)trustedTargetOID;
- (NSURL)clientRuntimeProvidedServiceURL;
- (unint64_t)dataProtectionType;
- (void)encodeWithCoder:(id)a3;
- (void)setClientRuntimeProvidedServiceURL:(id)a3;
- (void)setDataProtectionType:(unint64_t)a3;
- (void)setEnqueuedOnContainerService:(BOOL)a3;
- (void)setFunctionName:(id)a3;
- (void)setLegacyIsLocalBit:(BOOL)a3;
- (void)setPermittedRemoteMeasurement:(id)a3;
- (void)setRequestLocalEnvelopes:(id)a3;
- (void)setRequestLocalSerializations:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setShouldFetchAssetContentInMemory:(BOOL)a3;
- (void)setShouldSendRecordPCSKeys:(BOOL)a3;
- (void)setTrustedTargetDomain:(id)a3;
- (void)setTrustedTargetOID:(id)a3;
@end

@implementation CKCodeFunctionInvokeOperationInfo

+ (void)applyDefaultParametersToServiceURLComponents:(id)a3
{
  id v21 = a3;
  v6 = objc_msgSend_scheme(v21, v3, v4, v5);

  if (!v6) {
    objc_msgSend_setScheme_(v21, v7, @"http", v9);
  }
  v10 = objc_msgSend_port(v21, v7, v8, v9);

  if (!v10) {
    objc_msgSend_setPort_(v21, v11, (uint64_t)&unk_1ED846960, v13);
  }
  v14 = objc_msgSend_path(v21, v11, v12, v13);
  uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);

  if (!v18) {
    objc_msgSend_setPath_(v21, v19, @"/route", v20);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_serviceName(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"ServiceName");

  uint64_t v13 = objc_msgSend_functionName(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"FunctionName");

  uint64_t v18 = objc_msgSend_requestLocalSerializations(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"RequestLocalSerializations");

  v23 = objc_msgSend_requestLocalEnvelopes(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"RequestLocalEnvelopes");

  uint64_t v28 = objc_msgSend_dataProtectionType(self, v25, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v4, v29, v28, @"DataProtectionType");
  v33 = objc_msgSend_permittedRemoteMeasurement(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"PermittedRemoteMeasurement");

  v38 = objc_msgSend_trustedTargetDomain(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"TrustedTargetDomain");

  v43 = objc_msgSend_trustedTargetOID(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v43, @"TrustedTargetOID");

  uint64_t shouldSendRecordPCSKeys = objc_msgSend_shouldSendRecordPCSKeys(self, v45, v46, v47);
  objc_msgSend_encodeBool_forKey_(v4, v49, shouldSendRecordPCSKeys, @"SendRecordPCSKeys");
  uint64_t IsLocalBit = objc_msgSend_legacyIsLocalBit(self, v50, v51, v52);
  objc_msgSend_encodeBool_forKey_(v4, v54, IsLocalBit, @"LegacyLocal");
  v58 = objc_msgSend_clientRuntimeProvidedServiceURL(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v4, v59, (uint64_t)v58, @"ClientRuntimeProvidedServiceURL");

  uint64_t AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v60, v61, v62);
  objc_msgSend_encodeBool_forKey_(v4, v64, AssetContentInMemory, @"ShouldFetchAssetContentInMemory");
  uint64_t v68 = objc_msgSend_enqueuedOnContainerService(self, v65, v66, v67);
  v69 = NSStringFromSelector(sel_enqueuedOnContainerService);
  objc_msgSend_encodeBool_forKey_(v4, v70, v68, (uint64_t)v69);

  v71.receiver = self;
  v71.super_class = (Class)CKCodeFunctionInvokeOperationInfo;
  [(CKDatabaseOperationInfo *)&v71 encodeWithCoder:v4];
}

- (CKCodeFunctionInvokeOperationInfo)initWithCoder:(id)a3
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CKCodeFunctionInvokeOperationInfo;
  uint64_t v5 = [(CKDatabaseOperationInfo *)&v60 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"ServiceName");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"FunctionName");
    functionName = v5->_functionName;
    v5->_functionName = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v62, 2);
    v19 = objc_msgSend_setWithArray_(v14, v17, (uint64_t)v16, v18);
    uint64_t v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v20, (uint64_t)v19, @"RequestLocalSerializations");
    requestLocalSerializations = v5->_requestLocalSerializations;
    v5->_requestLocalSerializations = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v61, 2);
    uint64_t v28 = objc_msgSend_setWithArray_(v23, v26, (uint64_t)v25, v27);
    uint64_t v30 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, @"RequestLocalEnvelopes");
    requestLocalEnvelopes = v5->_requestLocalEnvelopes;
    v5->_requestLocalEnvelopes = (NSArray *)v30;

    v5->_dataProtectionType = objc_msgSend_decodeIntegerForKey_(v4, v32, @"DataProtectionType", v33);
    uint64_t v34 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"PermittedRemoteMeasurement");
    permittedRemoteMeasurement = v5->_permittedRemoteMeasurement;
    v5->_permittedRemoteMeasurement = (NSData *)v36;

    uint64_t v38 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"TrustedTargetDomain");
    trustedTargetDomain = v5->_trustedTargetDomain;
    v5->_trustedTargetDomain = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"TrustedTargetOID");
    trustedTargetOID = v5->_trustedTargetOID;
    v5->_trustedTargetOID = (NSString *)v44;

    v5->_uint64_t shouldSendRecordPCSKeys = objc_msgSend_decodeBoolForKey_(v4, v46, @"SendRecordPCSKeys", v47);
    v5->_legacyuint64_t IsLocalBit = objc_msgSend_decodeBoolForKey_(v4, v48, @"LegacyLocal", v49);
    uint64_t v50 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"ClientRuntimeProvidedServiceURL");
    clientRuntimeProvidedServiceURL = v5->_clientRuntimeProvidedServiceURL;
    v5->_clientRuntimeProvidedServiceURL = (NSURL *)v52;

    v5->_shouldFetchuint64_t AssetContentInMemory = objc_msgSend_decodeBoolForKey_(v4, v54, @"ShouldFetchAssetContentInMemory", v55);
    uint64_t v56 = NSStringFromSelector(sel_enqueuedOnContainerService);
    v5->_enqueuedOnContainerService = objc_msgSend_decodeBoolForKey_(v4, v57, (uint64_t)v56, v58);
  }
  return v5;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (NSArray)requestLocalSerializations
{
  return self->_requestLocalSerializations;
}

- (void)setRequestLocalSerializations:(id)a3
{
}

- (NSArray)requestLocalEnvelopes
{
  return self->_requestLocalEnvelopes;
}

- (void)setRequestLocalEnvelopes:(id)a3
{
}

- (unint64_t)dataProtectionType
{
  return self->_dataProtectionType;
}

- (void)setDataProtectionType:(unint64_t)a3
{
  self->_dataProtectionType = a3;
}

- (NSData)permittedRemoteMeasurement
{
  return self->_permittedRemoteMeasurement;
}

- (void)setPermittedRemoteMeasurement:(id)a3
{
}

- (NSString)trustedTargetDomain
{
  return self->_trustedTargetDomain;
}

- (void)setTrustedTargetDomain:(id)a3
{
}

- (NSString)trustedTargetOID
{
  return self->_trustedTargetOID;
}

- (void)setTrustedTargetOID:(id)a3
{
}

- (BOOL)shouldSendRecordPCSKeys
{
  return self->_shouldSendRecordPCSKeys;
}

- (void)setShouldSendRecordPCSKeys:(BOOL)a3
{
  self->_uint64_t shouldSendRecordPCSKeys = a3;
}

- (BOOL)enqueuedOnContainerService
{
  return self->_enqueuedOnContainerService;
}

- (void)setEnqueuedOnContainerService:(BOOL)a3
{
  self->_enqueuedOnContainerService = a3;
}

- (NSURL)clientRuntimeProvidedServiceURL
{
  return self->_clientRuntimeProvidedServiceURL;
}

- (void)setClientRuntimeProvidedServiceURL:(id)a3
{
}

- (BOOL)legacyIsLocalBit
{
  return self->_legacyIsLocalBit;
}

- (void)setLegacyIsLocalBit:(BOOL)a3
{
  self->_legacyuint64_t IsLocalBit = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContentInMemory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRuntimeProvidedServiceURL, 0);
  objc_storeStrong((id *)&self->_trustedTargetOID, 0);
  objc_storeStrong((id *)&self->_trustedTargetDomain, 0);
  objc_storeStrong((id *)&self->_permittedRemoteMeasurement, 0);
  objc_storeStrong((id *)&self->_requestLocalEnvelopes, 0);
  objc_storeStrong((id *)&self->_requestLocalSerializations, 0);
  objc_storeStrong((id *)&self->_functionName, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end