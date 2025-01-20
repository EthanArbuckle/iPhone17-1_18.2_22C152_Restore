@interface CWFBonjourServiceRecord
+ (id)serviceRecordFromRecordName:(id)a3;
- (NSString)deviceName;
- (NSString)rawString;
- (NSString)serviceName;
- (id)description;
- (void)setDeviceName:(id)a3;
- (void)setRawString:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation CWFBonjourServiceRecord

+ (id)serviceRecordFromRecordName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CWFBonjourServiceRecord);
  v9 = objc_msgSend__bonjourServiceName(v3, v5, v6, v7, v8);
  objc_msgSend_setServiceName_(v4, v10, (uint64_t)v9, v11, v12);

  v17 = objc_msgSend__stringByRemovingServiceName(v3, v13, v14, v15, v16);
  objc_msgSend_setDeviceName_(v4, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_setRawString_(v4, v21, (uint64_t)v3, v22, v23);
  return v4;
}

- (id)description
{
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  objc_msgSend_appendFormat_(v6, v9, @"<%@ : %p", v10, v11, v8, self);

  uint64_t v16 = objc_msgSend_deviceName(self, v12, v13, v14, v15);

  if (v16)
  {
    v21 = objc_msgSend_deviceName(self, v17, v18, v19, v20);
    objc_msgSend_appendFormat_(v6, v22, @" deviceName='%@'", v23, v24, v21);
  }
  v25 = objc_msgSend_serviceName(self, v17, v18, v19, v20);

  if (v25)
  {
    v30 = objc_msgSend_serviceName(self, v26, v27, v28, v29);
    objc_msgSend_appendFormat_(v6, v31, @" serviceName='%@'", v32, v33, v30);
  }
  objc_msgSend_appendString_(v6, v26, @">", v28, v29);
  return v6;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)rawString
{
  return self->_rawString;
}

- (void)setRawString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawString, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end