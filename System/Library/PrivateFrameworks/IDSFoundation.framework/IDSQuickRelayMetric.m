@interface IDSQuickRelayMetric
- (IDSQuickRelayMetric)initWithType:(id)a3 eventSubType:(id)a4 duration:(id)a5 resultCode:(id)a6 providerType:(id)a7 transportType:(id)a8 interfaceType:(id)a9 skeEnabled:(id)a10 isInitiator:(id)a11 protocolVersion:(id)a12 retryCount:(id)a13 serviceName:(id)a14 subServiceName:(id)a15 participantCount:(id)a16;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)duration;
- (NSNumber)interfaceType;
- (NSNumber)isInitiator;
- (NSNumber)participantCount;
- (NSNumber)protocolVersion;
- (NSNumber)providerType;
- (NSNumber)resultCode;
- (NSNumber)retryCount;
- (NSNumber)skeEnabled;
- (NSNumber)subType;
- (NSNumber)transportType;
- (NSNumber)type;
- (NSString)name;
- (NSString)serviceName;
- (NSString)subServiceName;
@end

@implementation IDSQuickRelayMetric

- (NSString)name
{
  return (NSString *)@"IDSQuickRelayEvent";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_type(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"type", v7);
  }

  v11 = objc_msgSend_subType(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"subType", v11);
  }

  v15 = objc_msgSend_duration(self, v12, v13, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"duration", v15);
  }

  v19 = objc_msgSend_resultCode(self, v16, v17, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"resultCode", v19);
  }

  v23 = objc_msgSend_providerType(self, v20, v21, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"providerType", v23);
  }

  v27 = objc_msgSend_transportType(self, v24, v25, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"transportType", v27);
  }

  v31 = objc_msgSend_interfaceType(self, v28, v29, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"interfaceType", v31);
  }

  v35 = objc_msgSend_skeEnabled(self, v32, v33, v34);
  if (v35) {
    CFDictionarySetValue(v3, @"skeEnabled", v35);
  }

  v39 = objc_msgSend_isInitiator(self, v36, v37, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"isInitiator", v39);
  }

  v43 = objc_msgSend_protocolVersion(self, v40, v41, v42);
  if (v43) {
    CFDictionarySetValue(v3, @"protocolVersion", v43);
  }

  v47 = objc_msgSend_retryCount(self, v44, v45, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"retryCount", v47);
  }

  v51 = objc_msgSend_serviceName(self, v48, v49, v50);
  if (v51) {
    CFDictionarySetValue(v3, @"serviceName", v51);
  }

  v55 = objc_msgSend_subServiceName(self, v52, v53, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"subServiceName", v55);
  }

  v59 = objc_msgSend_participantCount(self, v56, v57, v58);
  if (v59) {
    CFDictionarySetValue(v3, @"participantCount", v59);
  }

  return (NSDictionary *)v3;
}

- (IDSQuickRelayMetric)initWithType:(id)a3 eventSubType:(id)a4 duration:(id)a5 resultCode:(id)a6 providerType:(id)a7 transportType:(id)a8 interfaceType:(id)a9 skeEnabled:(id)a10 isInitiator:(id)a11 protocolVersion:(id)a12 retryCount:(id)a13 serviceName:(id)a14 subServiceName:(id)a15 participantCount:(id)a16
{
  id v41 = a3;
  id v40 = a4;
  id v30 = a5;
  id v39 = a5;
  id v31 = a6;
  id v38 = a6;
  id v37 = a7;
  id v36 = a8;
  id v35 = a9;
  id v34 = a10;
  id v33 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  v42.receiver = self;
  v42.super_class = (Class)IDSQuickRelayMetric;
  double v26 = [(IDSQuickRelayMetric *)&v42 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_type, a3);
    objc_storeStrong((id *)&v27->_subType, a4);
    objc_storeStrong((id *)&v27->_duration, v30);
    objc_storeStrong((id *)&v27->_resultCode, v31);
    objc_storeStrong((id *)&v27->_providerType, a7);
    objc_storeStrong((id *)&v27->_transportType, a8);
    objc_storeStrong((id *)&v27->_interfaceType, a9);
    objc_storeStrong((id *)&v27->_skeEnabled, a10);
    objc_storeStrong((id *)&v27->_isInitiator, a11);
    objc_storeStrong((id *)&v27->_protocolVersion, a12);
    objc_storeStrong((id *)&v27->_retryCount, a13);
    objc_storeStrong((id *)&v27->_serviceName, a14);
    objc_storeStrong((id *)&v27->_subServiceName, a15);
    objc_storeStrong((id *)&v27->_participantCount, a16);
  }

  return v27;
}

- (NSNumber)type
{
  return self->_type;
}

- (NSNumber)subType
{
  return self->_subType;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)resultCode
{
  return self->_resultCode;
}

- (NSNumber)providerType
{
  return self->_providerType;
}

- (NSNumber)transportType
{
  return self->_transportType;
}

- (NSNumber)interfaceType
{
  return self->_interfaceType;
}

- (NSNumber)skeEnabled
{
  return self->_skeEnabled;
}

- (NSNumber)isInitiator
{
  return self->_isInitiator;
}

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (NSNumber)retryCount
{
  return self->_retryCount;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)subServiceName
{
  return self->_subServiceName;
}

- (NSNumber)participantCount
{
  return self->_participantCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantCount, 0);
  objc_storeStrong((id *)&self->_subServiceName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_isInitiator, 0);
  objc_storeStrong((id *)&self->_skeEnabled, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_providerType, 0);
  objc_storeStrong((id *)&self->_resultCode, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_subType, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end