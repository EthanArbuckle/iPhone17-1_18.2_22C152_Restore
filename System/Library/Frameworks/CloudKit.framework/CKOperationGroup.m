@interface CKOperationGroup
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (CKOperationConfiguration)defaultConfiguration;
- (CKOperationGroup)init;
- (CKOperationGroup)initWithCoder:(NSCoder *)aDecoder;
- (CKOperationGroupSystemImposedInfo)systemImposedInfo;
- (CKOperationGroupTransferSize)expectedReceiveSize;
- (CKOperationGroupTransferSize)expectedSendSize;
- (NSNumber)quantityNumber;
- (NSString)authPromptReason;
- (NSString)name;
- (NSString)operationGroupID;
- (NSUInteger)quantity;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)description;
- (int64_t)approximateReceiveBytes;
- (int64_t)approximateSendBytes;
- (unint64_t)resolvedNetworkServiceTypeForConfig:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthPromptReason:(id)a3;
- (void)setDefaultConfiguration:(CKOperationConfiguration *)defaultConfiguration;
- (void)setExpectedReceiveSize:(CKOperationGroupTransferSize)expectedReceiveSize;
- (void)setExpectedSendSize:(CKOperationGroupTransferSize)expectedSendSize;
- (void)setName:(NSString *)name;
- (void)setQuantity:(NSUInteger)quantity;
- (void)setQuantityNumber:(id)a3;
- (void)setSystemImposedInfo:(id)a3;
@end

@implementation CKOperationGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authPromptReason, 0);
  objc_storeStrong((id *)&self->_quantityNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_operationGroupID, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);

  objc_storeStrong((id *)&self->_systemImposedInfo_locked, 0);
}

- (NSString)operationGroupID
{
  return self->_operationGroupID;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setName:(NSString *)name
{
}

- (void)setDefaultConfiguration:(CKOperationConfiguration *)defaultConfiguration
{
  v4 = defaultConfiguration;
  if (!v4) {
    v4 = (CKOperationConfiguration *)objc_opt_new();
  }
  v11 = v4;
  uint64_t v8 = objc_msgSend_copy(v4, v5, v6, v7);
  v9 = self;
  objc_sync_enter(v9);
  v10 = v9->_defaultConfiguration;
  v9->_defaultConfiguration = (CKOperationConfiguration *)v8;

  objc_sync_exit(v9);
}

- (CKOperationGroup)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKOperationGroup;
  v2 = [(CKOperationGroup *)&v8 init];
  if (v2)
  {
    uint64_t v3 = CKShortRandomID();
    operationGroupID = v2->_operationGroupID;
    v2->_operationGroupID = (NSString *)v3;

    uint64_t v5 = objc_opt_new();
    defaultConfiguration = v2->_defaultConfiguration;
    v2->_defaultConfiguration = (CKOperationConfiguration *)v5;

    v2->_expectedSendSize = 0;
    v2->_expectedReceiveSize = 0;
  }
  return v2;
}

- (CKOperationConfiguration)defaultConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_defaultConfiguration;
  objc_sync_exit(v2);

  return v3;
}

- (void)setExpectedSendSize:(CKOperationGroupTransferSize)expectedSendSize
{
  obj = self;
  objc_sync_enter(obj);
  systemImposedInfo_locked = obj->_systemImposedInfo_locked;
  if (systemImposedInfo_locked)
  {
    CKOperationGroupTransferSize v8 = objc_msgSend_expectedSendSize(systemImposedInfo_locked, v4, v5, v6);
    if (expectedSendSize == CKOperationGroupTransferSizeUnknown || v8 < expectedSendSize)
    {
      v9 = obj->_systemImposedInfo_locked;
      obj->_systemImposedInfo_locked = 0;
    }
  }
  obj->_expectedSendSize = expectedSendSize;
  objc_sync_exit(obj);
}

- (void)setExpectedReceiveSize:(CKOperationGroupTransferSize)expectedReceiveSize
{
  obj = self;
  objc_sync_enter(obj);
  systemImposedInfo_locked = obj->_systemImposedInfo_locked;
  if (systemImposedInfo_locked)
  {
    CKOperationGroupTransferSize v8 = objc_msgSend_expectedReceiveSize(systemImposedInfo_locked, v4, v5, v6);
    if (expectedReceiveSize == CKOperationGroupTransferSizeUnknown || v8 < expectedReceiveSize)
    {
      v9 = obj->_systemImposedInfo_locked;
      obj->_systemImposedInfo_locked = 0;
    }
  }
  obj->_expectedReceiveSize = expectedReceiveSize;
  objc_sync_exit(obj);
}

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKOperationGroupSystemImposedInfo)systemImposedInfo
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_systemImposedInfo_locked;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSystemImposedInfo:(id)a3
{
  id v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
  systemImposedInfo_locked = v4->_systemImposedInfo_locked;
  v4->_systemImposedInfo_locked = (CKOperationGroupSystemImposedInfo *)v8;

  objc_sync_exit(v4);
}

- (NSUInteger)quantity
{
  v4 = objc_msgSend_quantityNumber(self, a2, v2, v3);
  NSUInteger v8 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7);

  return v8;
}

- (void)setQuantity:(NSUInteger)quantity
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, quantity, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQuantityNumber_(self, v5, (uint64_t)v7, v6);
}

- (CKOperationGroupTransferSize)expectedSendSize
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  CKOperationGroupTransferSize expectedSendSize = v2->_expectedSendSize;
  objc_sync_exit(v2);

  return expectedSendSize;
}

- (CKOperationGroupTransferSize)expectedReceiveSize
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  CKOperationGroupTransferSize expectedReceiveSize = v2->_expectedReceiveSize;
  objc_sync_exit(v2);

  return expectedReceiveSize;
}

- (int64_t)approximateSendBytes
{
  uint64_t v5 = objc_msgSend_expectedSendSize(self, a2, v2, v3);
  if (!self) {
    return 0;
  }
  if ((unint64_t)(v5 - 1) > 6) {
    return -1;
  }
  return qword_18B1F3C90[v5 - 1];
}

- (int64_t)approximateReceiveBytes
{
  uint64_t v5 = objc_msgSend_expectedReceiveSize(self, a2, v2, v3);
  if (!self) {
    return 0;
  }
  if ((unint64_t)(v5 - 1) > 6) {
    return -1;
  }
  return qword_18B1F3C90[v5 - 1];
}

- (unint64_t)resolvedNetworkServiceTypeForConfig:(id)a3
{
  id v4 = a3;
  NSUInteger v8 = objc_msgSend_systemImposedInfo(self, v5, v6, v7);
  v12 = objc_msgSend_networkServiceTypePerConfig(v8, v9, v10, v11);
  v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v4, v14);

  if (v15) {
    unint64_t v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  }
  else {
    unint64_t v19 = 0;
  }

  return v19;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v15 = objc_msgSend_name(self, v9, v10, v11);
  if (v6)
  {
    v16 = objc_msgSend_operationGroupID(self, v12, v13, v14);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v17, @"operationGroupID", (uint64_t)v16);

    v22 = objc_msgSend_quantityNumber(self, v18, v19, v20);
    if (v22) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v21, @"quantity", (uint64_t)v22);
    }

    if (!v5 && v15)
    {
      if ((unint64_t)objc_msgSend_length(v15, v12, v13, v14) <= 0x80)
      {
        id v25 = v15;
      }
      else
      {
        objc_msgSend_substringToIndex_(v15, v23, 128, v24);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v29 = v25;
      v30 = NSString;
      unint64_t v31 = objc_msgSend_length(v15, v26, v27, v28);
      v34 = &stru_1ED7F5C98;
      if (v31 > 0x80) {
        v34 = @"...";
      }
      v35 = objc_msgSend_stringWithFormat_(v30, v32, @"%@%@", v33, v29, v34);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v36, @"shortened-name", (uint64_t)v35);
    }
  }
  if (v5)
  {
    v37 = objc_msgSend_defaultConfiguration(self, v12, v13, v14);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v38, @"defaultConfiguration", (uint64_t)v37);

    if (v15) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v39, @"full-name", (uint64_t)v15);
    }
    uint64_t v42 = objc_msgSend_expectedSendSize(self, v39, v40, v41);
    if (v42)
    {
      v46 = CKStringForTransferSize(v42);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v47, @"send-size", (uint64_t)v46);
    }
    uint64_t v48 = objc_msgSend_expectedReceiveSize(self, v43, v44, v45);
    if (v48)
    {
      v52 = CKStringForTransferSize(v48);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v53, @"recv-size", (uint64_t)v52);
    }
    v54 = objc_msgSend_systemImposedInfo(self, v49, v50, v51);
    v58 = objc_msgSend_networkServiceTypePerConfig(v54, v55, v56, v57);
    v61 = objc_msgSend_CKMap_(v58, v59, (uint64_t)&unk_1ED7EF3F8, v60);

    if (objc_msgSend_count(v61, v62, v63, v64))
    {
      v68 = objc_msgSend_componentsJoinedByString_(v61, v65, @"", v67);;
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v69, @"configs", (uint64_t)v68);
    }
    v71 = objc_msgSend_authPromptReason(self, v65, v66, v67);
    if (v71) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v70, @"authPromptReason", (uint64_t)v71);
    }
  }

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKOperationGroup *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v45 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  id v8 = objc_msgSend_operationGroupID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v45, v9, (uint64_t)v8, @"OperationGroupID");

  uint64_t v13 = objc_msgSend_defaultConfiguration(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v45, v14, (uint64_t)v13, @"DefaultConfiguration");

  uint64_t v18 = objc_msgSend_authPromptReason(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v45, v19, (uint64_t)v18, @"AuthPromptReason");

  v23 = objc_msgSend_name(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v45, v24, (uint64_t)v23, @"Name");

  uint64_t v28 = objc_msgSend_quantityNumber(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v45, v29, (uint64_t)v28, @"Quantity");

  uint64_t v33 = objc_msgSend_expectedSendSize(self, v30, v31, v32);
  objc_msgSend_encodeInt64_forKey_(v45, v34, v33, @"ExpectedSendSize");
  uint64_t v38 = objc_msgSend_expectedReceiveSize(self, v35, v36, v37);
  objc_msgSend_encodeInt64_forKey_(v45, v39, v38, @"ExpectedReceiveSize");
  v43 = objc_msgSend_systemImposedInfo(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v45, v44, (uint64_t)v43, @"SystemImposedInfo");
}

- (CKOperationGroup)initWithCoder:(NSCoder *)aDecoder
{
  id v4 = aDecoder;
  v36.receiver = self;
  v36.super_class = (Class)CKOperationGroup;
  BOOL v5 = [(CKOperationGroup *)&v36 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"OperationGroupID");
    operationGroupID = v5->_operationGroupID;
    v5->_operationGroupID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"DefaultConfiguration");
    defaultConfiguration = v5->_defaultConfiguration;
    v5->_defaultConfiguration = (CKOperationConfiguration *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"AuthPromptReason");
    authPromptReason = v5->_authPromptReason;
    v5->_authPromptReason = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"Name");
    name = v5->_name;
    v5->_name = (NSString *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"Quantity");
    quantityNumber = v5->_quantityNumber;
    v5->_quantityNumber = (NSNumber *)v25;

    v5->_CKOperationGroupTransferSize expectedSendSize = objc_msgSend_decodeInt64ForKey_(v4, v27, @"ExpectedSendSize", v28);
    v5->_CKOperationGroupTransferSize expectedReceiveSize = objc_msgSend_decodeInt64ForKey_(v4, v29, @"ExpectedReceiveSize", v30);
    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"SystemImposedInfo");
    systemImposedInfo_locked = v5->_systemImposedInfo_locked;
    v5->_systemImposedInfo_locked = (CKOperationGroupSystemImposedInfo *)v33;
  }

  return v5;
}

- (NSNumber)quantityNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQuantityNumber:(id)a3
{
}

- (NSString)authPromptReason
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuthPromptReason:(id)a3
{
}

@end