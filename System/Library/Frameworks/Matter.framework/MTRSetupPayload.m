@interface MTRSetupPayload
+ (BOOL)supportsSecureCoding;
+ (MTRSetupPayload)new;
+ (MTRSetupPayload)setupPayloadWithOnboardingPayload:(NSString *)onboardingPayload error:(NSError *)error;
+ (NSNumber)generateRandomSetupPasscode;
+ (NSUInteger)generateRandomPIN;
- (BOOL)hasShortDiscriminator;
- (BOOL)isEqual:(id)a3;
- (MTRCommissioningFlow)commissioningFlow;
- (MTRDiscoveryCapabilities)discoveryCapabilities;
- (MTRSetupPayload)init;
- (MTRSetupPayload)initWithCoder:(id)a3;
- (MTRSetupPayload)initWithPayload:(id)a3;
- (MTRSetupPayload)initWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator;
- (NSArray)getAllOptionalVendorData:(NSError *)error;
- (NSArray)vendorElements;
- (NSNumber)discriminator;
- (NSNumber)productID;
- (NSNumber)rendezvousInformation;
- (NSNumber)setupPasscode;
- (NSNumber)vendorID;
- (NSNumber)version;
- (NSString)manualEntryCode;
- (NSString)qrCodeString:(NSError *)error;
- (NSString)serialNumber;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)qrCodeString;
- (id)vendorElementWithTag:(id)a3;
- (unint64_t)hash;
- (void)addOrReplaceVendorElement:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeVendorElementWithTag:(id)a3;
- (void)setCommissioningFlow:(MTRCommissioningFlow)commissioningFlow;
- (void)setDiscoveryCapabilities:(MTRDiscoveryCapabilities)discoveryCapabilities;
- (void)setDiscriminator:(NSNumber *)discriminator;
- (void)setHasShortDiscriminator:(BOOL)hasShortDiscriminator;
- (void)setProductID:(NSNumber *)productID;
- (void)setRendezvousInformation:(NSNumber *)rendezvousInformation;
- (void)setSerialNumber:(NSString *)serialNumber;
- (void)setSetupPasscode:(NSNumber *)setupPasscode;
- (void)setVendorID:(NSNumber *)vendorID;
- (void)setVersion:(NSNumber *)version;
@end

@implementation MTRSetupPayload

- (MTRSetupPayload)initWithPayload:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, @"MT:")) {
    v6 = (MTRSetupPayload *)sub_244BDB7E4(self, v4);
  }
  else {
    v6 = (MTRSetupPayload *)sub_244BDBA20(self, v4);
  }
  v7 = v6;

  return v7;
}

- (MTRSetupPayload)initWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator
{
  v6 = setupPasscode;
  v7 = discriminator;
  v13.receiver = self;
  v13.super_class = (Class)MTRSetupPayload;
  v8 = [(MTRSetupPayload *)&v13 init];
  objc_msgSend_setSetupPasscode_(v8, v9, (uint64_t)v6);
  objc_msgSend_setDiscriminator_(v8, v10, (uint64_t)v7);
  objc_msgSend_setDiscoveryCapabilities_(v8, v11, 7);

  return v8;
}

- (NSNumber)version
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, self->_payload.version);
}

- (void)setVersion:(NSNumber *)version
{
  self->_payload.version = objc_msgSend_unsignedIntegerValue(version, a2, (uint64_t)version);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, self->_payload.vendorID);
}

- (void)setVendorID:(NSNumber *)vendorID
{
  self->_payload.vendorID = objc_msgSend_unsignedIntegerValue(vendorID, a2, (uint64_t)vendorID);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, self->_payload.productID);
}

- (void)setProductID:(NSNumber *)productID
{
  self->_payload.productID = objc_msgSend_unsignedIntegerValue(productID, a2, (uint64_t)productID);
}

- (MTRCommissioningFlow)commissioningFlow
{
  return (unint64_t)self->_payload.commissioningFlow;
}

- (void)setCommissioningFlow:(MTRCommissioningFlow)commissioningFlow
{
  self->_payload.commissioningFlow = commissioningFlow;
}

- (MTRDiscoveryCapabilities)discoveryCapabilities
{
  BOOL mHasValue = self->_payload.rendezvousInformation.mHasValue;
  p_rendezvousInformation = &self->_payload.rendezvousInformation;
  if (!mHasValue) {
    return 0;
  }
  id v4 = sub_244BDC0F4(p_rendezvousInformation);
  if (*v4) {
    return *v4;
  }
  else {
    return 4;
  }
}

- (void)setDiscoveryCapabilities:(MTRDiscoveryCapabilities)discoveryCapabilities
{
  if (discoveryCapabilities)
  {
    self->_payload.rendezvousInformation.mValue.mData = discoveryCapabilities;
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  self->_payload.rendezvousInformation.BOOL mHasValue = v3;
}

- (NSNumber)discriminator
{
  shadowDiscriminator = self->_shadowDiscriminator;
  if (shadowDiscriminator)
  {
    BOOL v3 = shadowDiscriminator;
  }
  else
  {
    p_discriminator = &self->_payload.discriminator;
    v6 = NSNumber;
    if (self->_payload.discriminator.mIsShortDiscriminator)
    {
      objc_msgSend_numberWithInt_(NSNumber, a2, LOBYTE(p_discriminator->mDiscriminator));
    }
    else
    {
      uint64_t v7 = sub_244BDC1A4(p_discriminator);
      objc_msgSend_numberWithInt_(v6, v8, v7);
    }
    BOOL v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setDiscriminator:(NSNumber *)discriminator
{
  v10 = discriminator;
  __int16 v6 = objc_msgSend_unsignedIntegerValue(v10, v4, v5);
  int hasShortDiscriminator = objc_msgSend_hasShortDiscriminator(self, v7, v8);
  sub_244BDC1C8((uint64_t)self, v6 & 0xFFF, hasShortDiscriminator);
}

- (BOOL)hasShortDiscriminator
{
  return self->_payload.discriminator.mIsShortDiscriminator;
}

- (void)setHasShortDiscriminator:(BOOL)hasShortDiscriminator
{
  BOOL v3 = hasShortDiscriminator;
  if (objc_msgSend_hasShortDiscriminator(self, a2, hasShortDiscriminator) != hasShortDiscriminator)
  {
    objc_msgSend_discriminator(self, v5, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = objc_msgSend_unsignedShortValue(v10, v7, v8);
    sub_244BDC1C8((uint64_t)self, v9, v3);
  }
}

- (NSNumber)setupPasscode
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, self->_payload.setUpPINCode);
}

- (void)setSetupPasscode:(NSNumber *)setupPasscode
{
  self->_payload.setUpPINCode = objc_msgSend_unsignedIntegerValue(setupPasscode, a2, (uint64_t)setupPasscode);
}

- (NSString)serialNumber
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
  sub_244D82960((uint64_t)&self->_payload, (uint64_t)__p, (uint64_t)v5);
  if (v5[0])
  {
    BOOL v3 = 0;
  }
  else
  {
    if (v7 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v2, (uint64_t)__p);
    }
    else {
    BOOL v3 = objc_msgSend_stringWithUTF8String_(NSString, v2, (uint64_t)__p[0]);
    }
  }
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }

  return (NSString *)v3;
}

- (void)setSerialNumber:(NSString *)serialNumber
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = serialNumber;
  if (!v6)
  {
    sub_244D82B10((uint64_t)&self->_payload, (uint64_t)&v20);
    goto LABEL_15;
  }
  uint64_t v7 = objc_msgSend_serialNumber(self, v4, v5);
  uint64_t v9 = v7;
  if (v7)
  {
    if (objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v6))
    {

      goto LABEL_15;
    }
    sub_244D82B10((uint64_t)&self->_payload, (uint64_t)&v20);
  }
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  id v10 = v6;
  objc_super v13 = (char *)objc_msgSend_UTF8String(v10, v11, v12);
  sub_2446DBD28(__p, v13);
  sub_244D827F4((std::string *)&self->_payload, (uint64_t)__p, (uint64_t)&v18);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (v18)
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v20 = v18;
      uint64_t v21 = v19;
      v15 = sub_244CB7B34((const char **)&v20, 1);
      *(_DWORD *)buf = 136315138;
      v23 = v15;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "Ignoring unexpected error in SetupPayload::addSerialNumber: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v20 = v18;
      uint64_t v21 = v19;
      sub_244CB7B34((const char **)&v20, 1);
      sub_244CC4DE0(0, 1);
    }
  }

LABEL_15:
}

- (NSArray)vendorElements
{
  sub_244D825B8((uint64_t)&self->_payload, &v10);
  if (v10 == v11)
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v2 = objc_alloc(MEMORY[0x263EFF980]);
    id v4 = objc_msgSend_initWithCapacity_(v2, v3, 0xCCCCCCCCCCCCCCCDLL * ((v11 - v10) >> 3));
    uint64_t v5 = v10;
    for (uint64_t i = v11; v5 != i; v5 += 40)
    {
      uint64_t v8 = sub_244BDB230([MTROptionalQRCodeInfo alloc], v5);
      if (v8) {
        objc_msgSend_addObject_(v4, v7, (uint64_t)v8);
      }
    }
  }
  uint64_t v12 = (void **)&v10;
  sub_244BDE050(&v12);

  return (NSArray *)v4;
}

- (id)vendorElementWithTag:(id)a3
{
  id v4 = a3;
  __p = 0;
  uint64_t v11 = 0;
  int v13 = 0;
  uint64_t v12 = 0;
  unsigned int v5 = sub_244BDB0E0(v4);
  sub_244D82C54((uint64_t)&self->_payload, v5, (uint64_t)v9, (uint64_t)v8);
  if (v8[0]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = sub_244BDB230([MTROptionalQRCodeInfo alloc], (uint64_t)v9);
  }
  if (SHIBYTE(v12) < 0) {
    operator delete(__p);
  }

  return v6;
}

- (void)removeVendorElementWithTag:(id)a3
{
  unsigned int v4 = sub_244BDB0E0(a3);
  sub_244D82754((uint64_t)&self->_payload, v4, (uint64_t)v5);
}

- (void)addOrReplaceVendorElement:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = v4;
  if (!v4) {
    sub_244B27D00(@"element");
  }
  long long v8 = 0uLL;
  uint64_t v9 = 0;
  sub_244BDB2F4((uint64_t)v4, (std::string *)&self->_payload, (uint64_t)&v8);
  if (v8)
  {
    uint64_t v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      long long v10 = v8;
      uint64_t v11 = v9;
      uint64_t v7 = sub_244CB7B34((const char **)&v10, 1);
      *(_DWORD *)buf = 136315138;
      int v13 = v7;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "Internal error: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v10 = v8;
      uint64_t v11 = v9;
      sub_244CB7B34((const char **)&v10, 1);
      sub_244CC4DE0(0, 1);
    }
    abort();
  }
}

- (NSString)manualEntryCode
{
  *(_DWORD *)long long v8 = *(_DWORD *)&self->_payload.version;
  *(_DWORD *)&v8[3] = *(_DWORD *)((char *)&self->_payload.vendorID + 1);
  if (self->_payload.rendezvousInformation.mHasValue) {
    v10.mData = self->_payload.rendezvousInformation.mValue;
  }
  uint64_t v11 = *(void *)&self->_payload.discriminator.mDiscriminator;
  __int16 setUpPINCode_high = HIWORD(self->_payload.setUpPINCode);
  __int16 v13 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
  sub_244D7F744((uint64_t)v8, (uint64_t)__p, v5);
  if (LODWORD(v5[0]))
  {
    BOOL v3 = 0;
  }
  else
  {
    if (v7 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v2, (uint64_t)__p);
    }
    else {
    BOOL v3 = objc_msgSend_stringWithUTF8String_(NSString, v2, (uint64_t)__p[0]);
    }
  }
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }

  return (NSString *)v3;
}

- (id)qrCodeString
{
  return sub_244BDCB3C((uint64_t)self, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MTRSetupPayload alloc];
  *(_DWORD *)uint64_t v7 = *(_DWORD *)&self->_payload.version;
  *(_DWORD *)&v7[3] = *(_DWORD *)((char *)&self->_payload.vendorID + 1);
  if (self->_payload.rendezvousInformation.mHasValue) {
    v9.mData = self->_payload.rendezvousInformation.mValue;
  }
  uint64_t v10 = *(void *)&self->_payload.discriminator.mDiscriminator;
  __int16 setUpPINCode_high = HIWORD(self->_payload.setUpPINCode);
  sub_2447E5E38(v12, (uint64_t)&self->_payload.optionalVendorData);
  sub_2447E62FC(v13, (uint64_t)&self->_payload.optionalExtensionData);
  unsigned int v5 = (id *)sub_244BDBF10(v4, v7);
  sub_2447E6298((uint64_t)v13, (char *)v13[1]);
  sub_2447E6298((uint64_t)v12, (char *)v12[1]);
  objc_storeStrong(v5 + 10, self->_shadowDiscriminator);
  return v5;
}

- (unint64_t)hash
{
  BOOL v3 = objc_msgSend_discriminator(self, a2, v2);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    if (sub_244D82E9C((uint64_t)&self->_payload, (unsigned __int8 *)v7 + 8)) {
      char v6 = sub_2446BE670(self->_shadowDiscriminator, *((void **)v7 + 10));
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v4 = (void *)MEMORY[0x263F089D8];
  int hasShortDiscriminator = objc_msgSend_hasShortDiscriminator(self, a2, v2);
  long long v8 = objc_msgSend_discriminator(self, v6, v7);
  uint64_t v11 = objc_msgSend_unsignedIntValue(v8, v9, v10);
  uint64_t v13 = 3;
  if (hasShortDiscriminator) {
    uint64_t v13 = 1;
  }
  uint64_t v14 = objc_msgSend_stringWithFormat_(v4, v12, @"<MTRSetupPayload: discriminator=0x%0*x", v13, v11);

  uint64_t v19 = objc_msgSend_discoveryCapabilities(self, v15, v16);
  if (v19)
  {
    long long v20 = objc_msgSend_string(MEMORY[0x263F089D8], v17, v18);
    v22 = v20;
    if (v19)
    {
      objc_msgSend_appendString_(v20, v21, @"|SoftAP");
      v19 &= ~1uLL;
    }
    if ((v19 & 2) != 0)
    {
      objc_msgSend_appendString_(v22, v21, @"|BLE");
      v19 &= ~2uLL;
    }
    if ((v19 & 4) != 0)
    {
      objc_msgSend_appendString_(v22, v21, @"|OnNetwork");
      v19 &= ~4uLL;
    }
    if (v19) {
      objc_msgSend_appendFormat_(v22, v21, @"|0x%llx", v19);
    }
    v23 = objc_msgSend_substringFromIndex_(v22, v21, 1);

    objc_msgSend_appendFormat_(v14, v24, @" discoveryCapabilities=%@", v23);
  }
  uint64_t v25 = objc_msgSend_commissioningFlow(self, v17, v18);
  if (v25) {
    objc_msgSend_appendFormat_(v14, v26, @" commissioningFlow=0x%llx", v25);
  }
  objc_msgSend_appendString_(v14, v26, @">");

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v42 = a3;
  id v4 = sub_244BDCB3C((uint64_t)self, 1);
  objc_msgSend_encodeObject_forKey_(v42, v5, (uint64_t)v4, @"qr");

  long long v8 = objc_msgSend_version(self, v6, v7);
  objc_msgSend_encodeObject_forKey_(v42, v9, (uint64_t)v8, @"MTRSP.ck.version");

  uint64_t v12 = objc_msgSend_vendorID(self, v10, v11);
  objc_msgSend_encodeObject_forKey_(v42, v13, (uint64_t)v12, @"MTRSP.ck.vendorID");

  uint64_t v16 = objc_msgSend_productID(self, v14, v15);
  objc_msgSend_encodeObject_forKey_(v42, v17, (uint64_t)v16, @"MTRSP.ck.productID");

  uint64_t v20 = objc_msgSend_commissioningFlow(self, v18, v19);
  objc_msgSend_encodeInteger_forKey_(v42, v21, v20, @"MTRSP.ck.commissioningFlow");
  uint64_t v24 = objc_msgSend_rendezvousInformation(self, v22, v23);
  objc_msgSend_encodeObject_forKey_(v42, v25, (uint64_t)v24, @"MTRSP.ck.rendezvousFlags");

  unsigned int hasShortDiscriminator = objc_msgSend_hasShortDiscriminator(self, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v42, v29, hasShortDiscriminator, @"MTRSP.ck.hasShortDiscriminator");
  v32 = objc_msgSend_discriminator(self, v30, v31);
  objc_msgSend_encodeObject_forKey_(v42, v33, (uint64_t)v32, @"MTRSP.ck.discriminator");

  v36 = objc_msgSend_setupPasscode(self, v34, v35);
  objc_msgSend_encodeObject_forKey_(v42, v37, (uint64_t)v36, @"MTRSP.ck.setupPINCode");

  v40 = objc_msgSend_serialNumber(self, v38, v39);
  objc_msgSend_encodeObject_forKey_(v42, v41, (uint64_t)v40, @"MTRSP.ck.serialNumber");
}

- (MTRSetupPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MTRSetupPayload;
  uint64_t v5 = [(MTRSetupPayload *)&v45 init];
  uint64_t v6 = objc_opt_class();
  long long v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"qr");
  if (v8)
  {
    sub_244BDBD34((uint64_t)v5, v8, v44);
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"MTRSP.ck.version");
    objc_msgSend_setVersion_(v5, v13, (uint64_t)v12);

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"MTRSP.ck.vendorID");
    objc_msgSend_setVendorID_(v5, v17, (uint64_t)v16);

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"MTRSP.ck.productID");
    objc_msgSend_setProductID_(v5, v21, (uint64_t)v20);

    uint64_t v23 = objc_msgSend_decodeIntegerForKey_(v4, v22, @"MTRSP.ck.commissioningFlow");
    objc_msgSend_setCommissioningFlow_(v5, v24, v23);
    uint64_t v25 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"MTRSP.ck.setupPINCode");
    objc_msgSend_setSetupPasscode_(v5, v28, (uint64_t)v27);

    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"MTRSP.ck.serialNumber");
    objc_msgSend_setSerialNumber_(v5, v32, (uint64_t)v31);
  }
  BOOL v33 = objc_msgSend_decodeIntegerForKey_(v4, v9, @"MTRSP.ck.hasShortDiscriminator") != 0;
  objc_msgSend_setHasShortDiscriminator_(v5, v34, v33);
  uint64_t v35 = objc_opt_class();
  v37 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, @"MTRSP.ck.discriminator");
  objc_msgSend_setDiscriminator_(v5, v38, (uint64_t)v37);

  uint64_t v39 = objc_opt_class();
  v41 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"MTRSP.ck.rendezvousFlags");
  objc_msgSend_setRendezvousInformation_(v5, v42, (uint64_t)v41);

  return v5;
}

+ (NSUInteger)generateRandomPIN
{
  do
  {
    uint32_t v2 = arc4random_uniform(0x5F5E0FEu);
    NSUInteger v3 = v2 + 1;
  }
  while (!sub_244D82360(v2 + 1));
  return v3;
}

+ (NSNumber)generateRandomSetupPasscode
{
  NSUInteger v3 = NSNumber;
  uint64_t RandomPIN = objc_msgSend_generateRandomPIN(a1, a2, v2);

  return (NSNumber *)objc_msgSend_numberWithUnsignedInteger_(v3, v4, RandomPIN);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowDiscriminator, 0);
  sub_2447E6298((uint64_t)&self->_payload.optionalExtensionData, (char *)self->_payload.optionalExtensionData.__tree_.__pair1_.__value_.__left_);
  left = (char *)self->_payload.optionalVendorData.__tree_.__pair1_.__value_.__left_;

  sub_2447E6298((uint64_t)&self->_payload.optionalVendorData, left);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((_WORD *)self + 9) = 0;
  *((unsigned char *)self + 20) = 0;
  *((_DWORD *)self + 6) = 0;
  *(_DWORD *)((char *)self + 10) = 0;
  *((_WORD *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 4) = (char *)self + 40;
  *((void *)self + 9) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = (char *)self + 64;
  return self;
}

- (MTRSetupPayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTRSetupPayload;
  return [(MTRSetupPayload *)&v3 init];
}

+ (MTRSetupPayload)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MTRSetupPayload;
  return (MTRSetupPayload *)objc_msgSendSuper2(&v3, "new");
}

+ (MTRSetupPayload)setupPayloadWithOnboardingPayload:(NSString *)onboardingPayload error:(NSError *)error
{
  uint64_t v5 = onboardingPayload;
  uint64_t v6 = [MTRSetupPayload alloc];
  uint64_t v8 = objc_msgSend_initWithPayload_(v6, v7, (uint64_t)v5);
  Value v9 = (void *)v8;
  if (error && !v8)
  {
    sub_244B268BC((uint64_t)MTRError, 4);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return (MTRSetupPayload *)v9;
}

- (NSNumber)rendezvousInformation
{
  objc_super v3 = objc_msgSend_discoveryCapabilities(self, a2, v2);
  if (v3)
  {
    objc_super v3 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, (uint64_t)v3);
  }

  return (NSNumber *)v3;
}

- (void)setRendezvousInformation:(NSNumber *)rendezvousInformation
{
  id v4 = rendezvousInformation;
  Value v9 = v4;
  if (v4)
  {
    uint64_t v7 = objc_msgSend_unsignedIntegerValue(v4, v5, v6);
    if (v7) {
      objc_msgSend_setDiscoveryCapabilities_(self, v8, v7);
    }
    else {
      objc_msgSend_setDiscoveryCapabilities_(self, v8, 4);
    }
  }
  else
  {
    objc_msgSend_setDiscoveryCapabilities_(self, v5, 0);
  }
}

- (NSString)qrCodeString:(NSError *)error
{
  uint64_t v4 = objc_msgSend_qrCodeString(self, a2, (uint64_t)error);
  uint64_t v5 = (void *)v4;
  if (error && !v4)
  {
    LODWORD(v7) = 3;
    *((void *)&v7 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/MTRSetupPayload.mm";
    int v8 = 716;
    sub_244B26908((uint64_t)MTRError, &v7);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (NSArray)getAllOptionalVendorData:(NSError *)error
{
  return (NSArray *)MEMORY[0x270F9A6D0](self, sel_vendorElements, error);
}

@end