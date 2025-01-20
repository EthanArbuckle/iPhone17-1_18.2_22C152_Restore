@interface IDSSessionStartedMetric
- (IDSSessionStartedMetric)initWithGuid:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(unsigned int)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)protocolVersionNumber;
- (NSString)guid;
- (NSString)name;
- (NSString)serviceName;
- (unsigned)clientType;
@end

@implementation IDSSessionStartedMetric

- (NSString)name
{
  return (NSString *)@"SessionStarted";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  v11 = objc_msgSend_protocolVersionNumber(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"protocolVersionNumber", v11);
  }

  v15 = objc_msgSend_serviceName(self, v12, v13, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"serviceName", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_clientType(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"clientType", v23);
  }

  return (NSDictionary *)v3;
}

- (IDSSessionStartedMetric)initWithGuid:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSSessionStartedMetric;
  double v14 = [(IDSSessionStartedMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_guid, a3);
    objc_storeStrong((id *)&v15->_protocolVersionNumber, a4);
    objc_storeStrong((id *)&v15->_serviceName, a5);
    v15->_clientType = a6;
  }

  return v15;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSNumber)protocolVersionNumber
{
  return self->_protocolVersionNumber;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_protocolVersionNumber, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end