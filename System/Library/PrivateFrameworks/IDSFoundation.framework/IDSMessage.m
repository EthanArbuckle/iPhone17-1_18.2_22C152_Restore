@interface IDSMessage
- (BOOL)_shouldUseJSONForEncoding;
- (BOOL)wantsAPSRetries;
- (BOOL)wantsCertifiedDelivery;
- (BOOL)wantsHTTPHeaders;
- (BOOL)wantsUserAgentInHeaders;
- (IDSMessage)init;
- (NSDictionary)deliveryStatusContext;
- (NSNumber)version;
- (NSNumber)wantsDeliveryStatus;
- (id)_madridServerBag;
- (id)_objectForKeyFromMadridBag:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)userAgentHeaderString;
- (void)setDeliveryStatusContext:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWantsCertifiedDelivery:(BOOL)a3;
- (void)setWantsDeliveryStatus:(id)a3;
@end

@implementation IDSMessage

- (IDSMessage)init
{
  v15.receiver = self;
  v15.super_class = (Class)IDSMessage;
  v2 = [(IDSBaseMessage *)&v15 init];
  v5 = v2;
  if (v2)
  {
    objc_msgSend_setTimeout_(v2, v3, v4, 120.0);
    objc_msgSend_setWantsIntegerUniqueIDs_(v5, v6, 1, v7);
    int shouldUseJSONForEncoding = objc_msgSend__shouldUseJSONForEncoding(v5, v8, v9, v10);
    objc_msgSend_setWantsBinaryPush_(v5, v12, shouldUseJSONForEncoding ^ 1u, v13);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v30.receiver = self;
  v30.super_class = (Class)IDSMessage;
  id v4 = [(IDSBaseMessage *)&v30 copyWithZone:a3];
  v8 = objc_msgSend_wantsDeliveryStatus(self, v5, v6, v7);
  objc_msgSend_setWantsDeliveryStatus_(v4, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_deliveryStatusContext(self, v11, v12, v13);
  objc_msgSend_setDeliveryStatusContext_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_wantsCertifiedDelivery(self, v17, v18, v19);
  objc_msgSend_setWantsCertifiedDelivery_(v4, v21, v20, v22);
  v26 = objc_msgSend_version(self, v23, v24, v25);
  objc_msgSend_setVersion_(v4, v27, (uint64_t)v26, v28);

  return v4;
}

- (BOOL)wantsAPSRetries
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (id)messageBody
{
  v44.receiver = self;
  v44.super_class = (Class)IDSMessage;
  v3 = [(IDSBaseMessage *)&v44 messageBody];
  double v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  v11 = objc_msgSend_wantsDeliveryStatus(self, v8, v9, v10);
  int v15 = objc_msgSend_intValue(v11, v12, v13, v14);

  if (v15 >= 1)
  {
    double v19 = objc_msgSend_wantsDeliveryStatus(self, v16, v17, v18);
    if (v19)
    {
      CFDictionarySetValue(v7, @"D", v19);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB766F8();
    }

    v23 = objc_msgSend_deliveryStatusContext(self, v20, v21, v22);
    if (v23) {
      CFDictionarySetValue(v7, @"Dc", v23);
    }
  }
  if (objc_msgSend_wantsCertifiedDelivery(self, v16, v17, v18))
  {
    v27 = objc_msgSend_sharedInstance(IDSServerBag, v24, v25, v26);
    objc_super v30 = objc_msgSend_objectForKey_(v27, v28, @"certified-delivery-probability", v29);

    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v31 = v30;
    }
    else {
      id v31 = &unk_1EF02B330;
    }
    float v32 = (float)arc4random_uniform(0x64u);
    objc_msgSend_floatValue(v31, v33, v34, v35);
    if ((float)(v36 * 100.0) > v32)
    {
      v37 = NSNumber;
      uint64_t v38 = _IDSCertifiedDeliveryVersion();
      v41 = objc_msgSend_numberWithInteger_(v37, v39, v38, v40);
      if (v41)
      {
        CFDictionarySetValue(v7, @"cdv", v41);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_19DB7666C();
      }
    }
  }
  v42 = _IDSTransportVersionNumber();
  if (v42)
  {
    CFDictionarySetValue(v7, @"v", v42);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB765E4();
  }

  return v7;
}

- (id)userAgentHeaderString
{
  return @"ua";
}

- (BOOL)wantsUserAgentInHeaders
{
  return 0;
}

- (BOOL)_shouldUseJSONForEncoding
{
  v3 = objc_msgSend__objectForKeyFromMadridBag_(self, a2, @"md-use-json", v2);
  if (objc_msgSend_intValue(v3, v4, v5, v6)) {
    char v7 = 1;
  }
  else {
    char v7 = IMGetCachedDomainBoolForKey();
  }

  return v7;
}

- (id)_madridServerBag
{
  return (id)objc_msgSend_sharedInstanceForBagType_(IDSServerBag, a2, 1, v2);
}

- (id)_objectForKeyFromMadridBag:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    v11 = objc_msgSend__madridServerBag(self, v8, v9, v10);
    double v14 = objc_msgSend_objectForKey_(v11, v12, (uint64_t)v4, v13);
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (NSNumber)wantsDeliveryStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setWantsDeliveryStatus:(id)a3
{
}

- (BOOL)wantsCertifiedDelivery
{
  return self->_wantsCertifiedDelivery;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  self->_wantsCertifiedDelivery = a3;
}

- (NSDictionary)deliveryStatusContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDeliveryStatusContext:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryStatusContext, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_wantsDeliveryStatus, 0);
}

@end