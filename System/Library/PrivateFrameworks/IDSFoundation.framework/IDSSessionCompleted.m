@interface IDSSessionCompleted
- (BOOL)isCellularInterfaceDisallowed;
- (BOOL)isInitiator;
- (BOOL)isQREnabled;
- (BOOL)isScreenSharingSessionType;
- (BOOL)isUsingQRDirectly;
- (BOOL)isWifiInterfaceDisallowed;
- (BOOL)isWithDefaultPairedDevice;
- (IDSSessionCompleted)initWithGuid:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(unsigned int)a6 isQREnabled:(BOOL)a7 isUsingQRDirectly:(BOOL)a8 isInitiator:(BOOL)a9 isScreenSharingSessionType:(BOOL)a10 isWithDefaultPairedDevice:(BOOL)a11 transportType:(unsigned int)a12 linkType:(unsigned int)a13 linkProtocol:(unsigned int)a14 endedReason:(unsigned int)a15 destinationType:(unsigned int)a16 durationOfSession:(id)a17 durationToConnect:(id)a18 isWifiInterfaceDisallowed:(BOOL)a19 isCellularInterfaceDisallowed:(BOOL)a20;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)durationOfSession;
- (NSNumber)durationToConnect;
- (NSNumber)protocolVersionNumber;
- (NSString)guid;
- (NSString)name;
- (NSString)serviceName;
- (unsigned)clientType;
- (unsigned)destinationType;
- (unsigned)endedReason;
- (unsigned)linkProtocol;
- (unsigned)linkType;
- (unsigned)transportType;
@end

@implementation IDSSessionCompleted

- (NSString)name
{
  return (NSString *)@"SessionCompleted";
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

  v24 = NSNumber;
  uint64_t isQREnabled = objc_msgSend_isQREnabled(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithBool_(v24, v29, isQREnabled, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"isQREnabled", v31);
  }

  v32 = NSNumber;
  uint64_t isUsingQRDirectly = objc_msgSend_isUsingQRDirectly(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithBool_(v32, v37, isUsingQRDirectly, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"isUsingQRDirectly", v39);
  }

  v40 = NSNumber;
  uint64_t isInitiator = objc_msgSend_isInitiator(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithBool_(v40, v45, isInitiator, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"isInitiator", v47);
  }

  v48 = NSNumber;
  uint64_t isScreenSharingSessionType = objc_msgSend_isScreenSharingSessionType(self, v49, v50, v51);
  v55 = objc_msgSend_numberWithBool_(v48, v53, isScreenSharingSessionType, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"isScreenSharingSessionType", v55);
  }

  v56 = NSNumber;
  uint64_t v60 = objc_msgSend_isWithDefaultPairedDevice(self, v57, v58, v59);
  v63 = objc_msgSend_numberWithBool_(v56, v61, v60, v62);
  if (v63) {
    CFDictionarySetValue(v3, @"isWithDefaultPairedDevice", v63);
  }

  v64 = NSNumber;
  uint64_t v68 = objc_msgSend_transportType(self, v65, v66, v67);
  v71 = objc_msgSend_numberWithUnsignedInt_(v64, v69, v68, v70);
  if (v71) {
    CFDictionarySetValue(v3, @"transportType", v71);
  }

  v72 = NSNumber;
  uint64_t v76 = objc_msgSend_linkType(self, v73, v74, v75);
  v79 = objc_msgSend_numberWithUnsignedInt_(v72, v77, v76, v78);
  if (v79) {
    CFDictionarySetValue(v3, @"linkType", v79);
  }

  v80 = NSNumber;
  uint64_t v84 = objc_msgSend_linkProtocol(self, v81, v82, v83);
  v87 = objc_msgSend_numberWithUnsignedInt_(v80, v85, v84, v86);
  if (v87) {
    CFDictionarySetValue(v3, @"linkProtocol", v87);
  }

  v88 = NSNumber;
  uint64_t v92 = objc_msgSend_destinationType(self, v89, v90, v91);
  v95 = objc_msgSend_numberWithUnsignedInt_(v88, v93, v92, v94);
  if (v95) {
    CFDictionarySetValue(v3, @"destinationType", v95);
  }

  v99 = objc_msgSend_durationOfSession(self, v96, v97, v98);
  if (v99) {
    CFDictionarySetValue(v3, @"durationOfSession", v99);
  }

  v103 = objc_msgSend_durationToConnect(self, v100, v101, v102);
  if (v103) {
    CFDictionarySetValue(v3, @"durationToConnect", v103);
  }

  v104 = NSNumber;
  uint64_t isWifiInterfaceDisallowed = objc_msgSend_isWifiInterfaceDisallowed(self, v105, v106, v107);
  v111 = objc_msgSend_numberWithBool_(v104, v109, isWifiInterfaceDisallowed, v110);
  if (v111) {
    CFDictionarySetValue(v3, @"isWifiInterfaceDisallowed", v111);
  }

  v112 = NSNumber;
  uint64_t isCellularInterfaceDisallowed = objc_msgSend_isCellularInterfaceDisallowed(self, v113, v114, v115);
  v119 = objc_msgSend_numberWithBool_(v112, v117, isCellularInterfaceDisallowed, v118);
  if (v119) {
    CFDictionarySetValue(v3, @"isCellularInterfaceDisallowed", v119);
  }

  return (NSDictionary *)v3;
}

- (IDSSessionCompleted)initWithGuid:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(unsigned int)a6 isQREnabled:(BOOL)a7 isUsingQRDirectly:(BOOL)a8 isInitiator:(BOOL)a9 isScreenSharingSessionType:(BOOL)a10 isWithDefaultPairedDevice:(BOOL)a11 transportType:(unsigned int)a12 linkType:(unsigned int)a13 linkProtocol:(unsigned int)a14 endedReason:(unsigned int)a15 destinationType:(unsigned int)a16 durationOfSession:(id)a17 durationToConnect:(id)a18 isWifiInterfaceDisallowed:(BOOL)a19 isCellularInterfaceDisallowed:(BOOL)a20
{
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v34 = a17;
  id v33 = a18;
  v35.receiver = self;
  v35.super_class = (Class)IDSSessionCompleted;
  v28 = [(IDSSessionCompleted *)&v35 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_guid, a3);
    objc_storeStrong((id *)&v29->_protocolVersionNumber, a4);
    objc_storeStrong((id *)&v29->_serviceName, a5);
    v29->_uint64_t isQREnabled = a7;
    v29->_uint64_t isUsingQRDirectly = a8;
    v29->_uint64_t isInitiator = a9;
    v29->_uint64_t isScreenSharingSessionType = a10;
    v29->_isWithDefaultPairedDevice = a11;
    v29->_clientType = a6;
    v29->_transportType = a12;
    v29->_linkType = a13;
    v29->_linkProtocol = a14;
    v29->_endedReason = a15;
    v29->_destinationType = a16;
    objc_storeStrong((id *)&v29->_durationOfSession, a17);
    objc_storeStrong((id *)&v29->_durationToConnect, a18);
  }

  return v29;
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

- (BOOL)isQREnabled
{
  return self->_isQREnabled;
}

- (BOOL)isUsingQRDirectly
{
  return self->_isUsingQRDirectly;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (BOOL)isScreenSharingSessionType
{
  return self->_isScreenSharingSessionType;
}

- (BOOL)isWithDefaultPairedDevice
{
  return self->_isWithDefaultPairedDevice;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (unsigned)linkProtocol
{
  return self->_linkProtocol;
}

- (unsigned)endedReason
{
  return self->_endedReason;
}

- (unsigned)destinationType
{
  return self->_destinationType;
}

- (NSNumber)durationOfSession
{
  return self->_durationOfSession;
}

- (NSNumber)durationToConnect
{
  return self->_durationToConnect;
}

- (BOOL)isWifiInterfaceDisallowed
{
  return self->_isWifiInterfaceDisallowed;
}

- (BOOL)isCellularInterfaceDisallowed
{
  return self->_isCellularInterfaceDisallowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationToConnect, 0);
  objc_storeStrong((id *)&self->_durationOfSession, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_protocolVersionNumber, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end