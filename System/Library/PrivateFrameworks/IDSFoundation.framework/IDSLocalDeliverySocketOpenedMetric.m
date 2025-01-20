@interface IDSLocalDeliverySocketOpenedMetric
- (BOOL)isToDefaultPairedDevice;
- (IDSLocalDeliverySocketOpenedMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 openError:(unint64_t)a5 socketError:(unint64_t)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (unint64_t)openError;
- (unint64_t)socketError;
@end

@implementation IDSLocalDeliverySocketOpenedMetric

- (NSString)name
{
  return (NSString *)@"LocalDeliverySocketOpened";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_service(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"service", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_isToDefaultPairedDevice(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"isToDefaultPairedDevice", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_openError(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"openError", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_socketError(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"socketError", v31);
  }

  return (NSDictionary *)v3;
}

- (IDSLocalDeliverySocketOpenedMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 openError:(unint64_t)a5 socketError:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSLocalDeliverySocketOpenedMetric;
  uint64_t v12 = [(IDSLocalDeliverySocketOpenedMetric *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    v13->_isToDefaultPairedDevice = a4;
    v13->_openError = a5;
    v13->_socketError = a6;
  }

  return v13;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)openError
{
  return self->_openError;
}

- (unint64_t)socketError
{
  return self->_socketError;
}

- (void).cxx_destruct
{
}

@end