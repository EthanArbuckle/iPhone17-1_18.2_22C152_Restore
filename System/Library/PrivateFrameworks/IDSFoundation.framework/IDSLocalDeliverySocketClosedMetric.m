@interface IDSLocalDeliverySocketClosedMetric
- (BOOL)isToDefaultPairedDevice;
- (IDSLocalDeliverySocketClosedMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 closeError:(unint64_t)a5 socketError:(unint64_t)a6 bytesSent:(unint64_t)a7 packetsSent:(unint64_t)a8 bytesReceived:(unint64_t)a9 packetsReceived:(unint64_t)a10;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (unint64_t)bytesReceived;
- (unint64_t)bytesSent;
- (unint64_t)closeError;
- (unint64_t)packetsReceived;
- (unint64_t)packetsSent;
- (unint64_t)socketError;
@end

@implementation IDSLocalDeliverySocketClosedMetric

- (NSString)name
{
  return (NSString *)@"LocalDeliverySocketClosed";
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
  uint64_t v20 = objc_msgSend_closeError(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"closeError", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_socketError(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"socketError", v31);
  }

  v32 = NSNumber;
  uint64_t v36 = objc_msgSend_bytesSent(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithUnsignedLongLong_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"bytesSent", v39);
  }

  v40 = NSNumber;
  uint64_t v44 = objc_msgSend_packetsSent(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithUnsignedLongLong_(v40, v45, v44, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"packetsSent", v47);
  }

  v48 = NSNumber;
  uint64_t v52 = objc_msgSend_bytesReceived(self, v49, v50, v51);
  v55 = objc_msgSend_numberWithUnsignedLongLong_(v48, v53, v52, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"bytesReceived", v55);
  }

  v56 = NSNumber;
  uint64_t v60 = objc_msgSend_packetsReceived(self, v57, v58, v59);
  v63 = objc_msgSend_numberWithUnsignedLongLong_(v56, v61, v60, v62);
  if (v63) {
    CFDictionarySetValue(v3, @"packetsReceived", v63);
  }

  return (NSDictionary *)v3;
}

- (IDSLocalDeliverySocketClosedMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 closeError:(unint64_t)a5 socketError:(unint64_t)a6 bytesSent:(unint64_t)a7 packetsSent:(unint64_t)a8 bytesReceived:(unint64_t)a9 packetsReceived:(unint64_t)a10
{
  id v17 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IDSLocalDeliverySocketClosedMetric;
  uint64_t v18 = [(IDSLocalDeliverySocketClosedMetric *)&v21 init];
  double v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_service, a3);
    v19->_isToDefaultPairedDevice = a4;
    v19->_closeError = a5;
    v19->_socketError = a6;
    v19->_bytesSent = a7;
    v19->_packetsSent = a8;
    v19->_bytesReceived = a9;
    v19->_packetsReceived = a10;
  }

  return v19;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)closeError
{
  return self->_closeError;
}

- (unint64_t)socketError
{
  return self->_socketError;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (void).cxx_destruct
{
}

@end