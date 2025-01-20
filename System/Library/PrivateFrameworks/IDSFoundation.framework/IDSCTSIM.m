@interface IDSCTSIM
- (BOOL)isDefaultVoiceSIM;
- (CTXPCServiceSubscriptionContext)context;
- (IDSCTSIM)initWithContext:(id)a3;
- (NSString)SIMIdentifier;
- (NSString)description;
- (NSString)label;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)phoneNumber;
- (unint64_t)hardwareType;
- (unint64_t)slot;
- (void)setContext:(id)a3;
@end

@implementation IDSCTSIM

- (IDSCTSIM)initWithContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSCTSIM;
  v6 = [(IDSCTSIM *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    mobileCountryCode = v7->_mobileCountryCode;
    v7->_mobileCountryCode = 0;

    mobileNetworkCode = v7->_mobileNetworkCode;
    v7->_mobileNetworkCode = 0;

    hardwareType = v7->_hardwareType;
    v7->_hardwareType = 0;
  }
  return v7;
}

- (NSString)label
{
  v4 = objc_msgSend_context(self, a2, v2, v3);
  v8 = objc_msgSend_label(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)phoneNumber
{
  v4 = objc_msgSend_context(self, a2, v2, v3);
  v8 = objc_msgSend_phoneNumber(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)SIMIdentifier
{
  v4 = objc_msgSend_context(self, a2, v2, v3);
  v8 = objc_msgSend_labelID(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (unint64_t)slot
{
  v4 = objc_msgSend_context(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_slotID(v4, v5, v6, v7);

  if (v8) {
    return v8 == 2;
  }
  else {
    return 2;
  }
}

- (BOOL)isDefaultVoiceSIM
{
  v4 = objc_msgSend_context(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_userDefaultVoice(v4, v5, v6, v7);
  BOOL v9 = v8 != 0;

  return v9;
}

- (NSString)mobileCountryCode
{
  mobileCountryCode = self->_mobileCountryCode;
  if (!mobileCountryCode)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F23A80]);
    double v7 = objc_msgSend_initWithQueue_(v4, v5, 0, v6);
    v11 = objc_msgSend_context(self, v8, v9, v10);
    id v23 = 0;
    v14 = (NSString *)objc_msgSend_copyMobileSubscriberCountryCode_error_(v7, v12, (uint64_t)v11, v13, &v23);
    id v15 = v23;

    if (v14) {
      BOOL v19 = v15 == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (!v19)
    {
      v20 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v16, v17, v18);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_19DB81698((uint64_t)v15, v20);
      }
    }
    v21 = self->_mobileCountryCode;
    self->_mobileCountryCode = v14;

    mobileCountryCode = self->_mobileCountryCode;
  }
  return mobileCountryCode;
}

- (NSString)mobileNetworkCode
{
  mobileNetworkCode = self->_mobileNetworkCode;
  if (!mobileNetworkCode)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F23A80]);
    double v7 = objc_msgSend_initWithQueue_(v4, v5, 0, v6);
    v11 = objc_msgSend_context(self, v8, v9, v10);
    id v23 = 0;
    v14 = (NSString *)objc_msgSend_copyMobileSubscriberNetworkCode_error_(v7, v12, (uint64_t)v11, v13, &v23);
    id v15 = v23;

    if (v14) {
      BOOL v19 = v15 == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (!v19)
    {
      v20 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v16, v17, v18);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_19DB81710((uint64_t)v15, v20);
      }
    }
    v21 = self->_mobileNetworkCode;
    self->_mobileNetworkCode = v14;

    mobileNetworkCode = self->_mobileNetworkCode;
  }
  return mobileNetworkCode;
}

- (unint64_t)hardwareType
{
  hardwareType = self->_hardwareType;
  if (!hardwareType)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F23A80]);
    uint64_t v9 = objc_msgSend_initWithQueue_(v6, v7, 0, v8);
    double v13 = objc_msgSend_context(self, v10, v11, v12);
    id v24 = 0;
    v16 = objc_msgSend_getSimHardwareInfo_error_(v9, v14, (uint64_t)v13, v15, &v24);
    id v17 = v24;

    unint64_t v21 = objc_msgSend_hardwareType(v16, v18, v19, v20);
    if (v21 <= 2)
    {
      v22 = self->_hardwareType;
      self->_hardwareType = (NSNumber *)qword_1E5975818[v21];
    }
    hardwareType = self->_hardwareType;
  }
  return objc_msgSend_integerValue(hardwareType, a2, v2, v3);
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  mobileCountryCode = self->_mobileCountryCode;
  mobileNetworkCode = self->_mobileNetworkCode;
  double v10 = objc_msgSend_context(self, v7, v8, v9);
  double v13 = objc_msgSend_stringWithFormat_(v3, v11, @"<%@:%p mcc: %@, mnc: %@, context: %@", v12, v4, self, mobileCountryCode, mobileNetworkCode, v10);

  return (NSString *)v13;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_hardwareType, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
}

@end