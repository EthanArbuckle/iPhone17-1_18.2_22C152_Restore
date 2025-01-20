@interface IDSSessionEndedMetric
- (BOOL)isInitiator;
- (BOOL)usesRelay;
- (IDSSessionEndedMetric)initWithGuid:(id)a3 endedReason:(unsigned int)a4 genericError:(unsigned int)a5 gameKitError:(unsigned int)a6 conferenceMiscError:(unsigned int)a7 callDuration:(id)a8 networkCheckResult:(unsigned int)a9 dataRate:(id)a10 gksError:(id)a11 connectDuration:(id)a12 remoteNetworkConnection:(unsigned int)a13 localNetworkConnection:(unsigned int)a14 connectionType:(unsigned int)a15 usesRelay:(BOOL)a16 currentNATType:(id)a17 remoteNATType:(id)a18 relayConnectDuration:(id)a19 isInitiator:(BOOL)a20 linkQuality:(id)a21 gksReturnCode:(id)a22;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)callDuration;
- (NSNumber)connectDuration;
- (NSNumber)currentNATType;
- (NSNumber)dataRate;
- (NSNumber)gksError;
- (NSNumber)gksReturnCode;
- (NSNumber)linkQuality;
- (NSNumber)relayConnectDuration;
- (NSNumber)remoteNATType;
- (NSString)guid;
- (NSString)name;
- (unsigned)conferenceMiscError;
- (unsigned)connectionType;
- (unsigned)endedReason;
- (unsigned)gameKitError;
- (unsigned)genericError;
- (unsigned)localNetworkConnection;
- (unsigned)networkCheckResult;
- (unsigned)remoteNetworkConnection;
@end

@implementation IDSSessionEndedMetric

- (NSString)name
{
  return (NSString *)@"IDSSessionEnded";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_endedReason(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithUnsignedInt_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"endedReason", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_genericError(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"genericError", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_gameKitError(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedInt_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"gameKitError", v31);
  }

  v32 = NSNumber;
  uint64_t v36 = objc_msgSend_conferenceMiscError(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithUnsignedInt_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"conferenceMiscError", v39);
  }

  v43 = objc_msgSend_callDuration(self, v40, v41, v42);
  if (v43) {
    CFDictionarySetValue(v3, @"callDuration", v43);
  }

  v44 = NSNumber;
  uint64_t v48 = objc_msgSend_networkCheckResult(self, v45, v46, v47);
  v51 = objc_msgSend_numberWithUnsignedInt_(v44, v49, v48, v50);
  if (v51) {
    CFDictionarySetValue(v3, @"networkCheckResult", v51);
  }

  v55 = objc_msgSend_dataRate(self, v52, v53, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"dataRate", v55);
  }

  v59 = objc_msgSend_gksError(self, v56, v57, v58);
  if (v59) {
    CFDictionarySetValue(v3, @"gksError", v59);
  }

  v63 = objc_msgSend_connectDuration(self, v60, v61, v62);
  if (v63) {
    CFDictionarySetValue(v3, @"connectDuration", v63);
  }

  v64 = NSNumber;
  uint64_t v68 = objc_msgSend_remoteNetworkConnection(self, v65, v66, v67);
  v71 = objc_msgSend_numberWithUnsignedInt_(v64, v69, v68, v70);
  if (v71) {
    CFDictionarySetValue(v3, @"remoteNetworkConnection", v71);
  }

  v72 = NSNumber;
  uint64_t v76 = objc_msgSend_localNetworkConnection(self, v73, v74, v75);
  v79 = objc_msgSend_numberWithUnsignedInt_(v72, v77, v76, v78);
  if (v79) {
    CFDictionarySetValue(v3, @"localNetworkConnection", v79);
  }

  v80 = NSNumber;
  uint64_t v84 = objc_msgSend_connectionType(self, v81, v82, v83);
  v87 = objc_msgSend_numberWithUnsignedInt_(v80, v85, v84, v86);
  if (v87) {
    CFDictionarySetValue(v3, @"connectionType", v87);
  }

  v88 = NSNumber;
  uint64_t v92 = objc_msgSend_usesRelay(self, v89, v90, v91);
  v95 = objc_msgSend_numberWithBool_(v88, v93, v92, v94);
  if (v95) {
    CFDictionarySetValue(v3, @"usesRelay", v95);
  }

  v99 = objc_msgSend_currentNATType(self, v96, v97, v98);
  if (v99) {
    CFDictionarySetValue(v3, @"currentNATType", v99);
  }

  v103 = objc_msgSend_remoteNATType(self, v100, v101, v102);
  if (v103) {
    CFDictionarySetValue(v3, @"remoteNATType", v103);
  }

  v107 = objc_msgSend_relayConnectDuration(self, v104, v105, v106);
  if (v107) {
    CFDictionarySetValue(v3, @"relayConnectDuration", v107);
  }

  v108 = NSNumber;
  uint64_t isInitiator = objc_msgSend_isInitiator(self, v109, v110, v111);
  v115 = objc_msgSend_numberWithBool_(v108, v113, isInitiator, v114);
  if (v115) {
    CFDictionarySetValue(v3, @"isInitiator", v115);
  }

  v119 = objc_msgSend_linkQuality(self, v116, v117, v118);
  if (v119) {
    CFDictionarySetValue(v3, @"linkQuality", v119);
  }

  v123 = objc_msgSend_gksReturnCode(self, v120, v121, v122);
  if (v123) {
    CFDictionarySetValue(v3, @"gksReturnCode", v123);
  }

  return (NSDictionary *)v3;
}

- (IDSSessionEndedMetric)initWithGuid:(id)a3 endedReason:(unsigned int)a4 genericError:(unsigned int)a5 gameKitError:(unsigned int)a6 conferenceMiscError:(unsigned int)a7 callDuration:(id)a8 networkCheckResult:(unsigned int)a9 dataRate:(id)a10 gksError:(id)a11 connectDuration:(id)a12 remoteNetworkConnection:(unsigned int)a13 localNetworkConnection:(unsigned int)a14 connectionType:(unsigned int)a15 usesRelay:(BOOL)a16 currentNATType:(id)a17 remoteNATType:(id)a18 relayConnectDuration:(id)a19 isInitiator:(BOOL)a20 linkQuality:(id)a21 gksReturnCode:(id)a22
{
  id v39 = a3;
  id v38 = a8;
  id v41 = a8;
  id v40 = a10;
  id v24 = a11;
  id v25 = a12;
  id v42 = a17;
  id v26 = a18;
  id v27 = a19;
  id v28 = a21;
  id v29 = a22;
  v43.receiver = self;
  v43.super_class = (Class)IDSSessionEndedMetric;
  double v30 = [(IDSSessionEndedMetric *)&v43 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_guid, a3);
    v31->_endedReason = a4;
    v31->_genericError = a5;
    v31->_gameKitError = a6;
    v31->_conferenceMiscError = a7;
    objc_storeStrong((id *)&v31->_callDuration, v38);
    v31->_networkCheckResult = a9;
    objc_storeStrong((id *)&v31->_dataRate, a10);
    objc_storeStrong((id *)&v31->_gksError, a11);
    objc_storeStrong((id *)&v31->_connectDuration, a12);
    v31->_remoteNetworkConnection = a13;
    v31->_localNetworkConnection = a14;
    v31->_connectionType = a15;
    v31->_usesRelay = a16;
    objc_storeStrong((id *)&v31->_currentNATType, a17);
    objc_storeStrong((id *)&v31->_remoteNATType, a18);
    objc_storeStrong((id *)&v31->_relayConnectDuration, a19);
    v31->_uint64_t isInitiator = a20;
    objc_storeStrong((id *)&v31->_linkQuality, a21);
    objc_storeStrong((id *)&v31->_gksReturnCode, a22);
  }

  return v31;
}

- (NSString)guid
{
  return self->_guid;
}

- (unsigned)endedReason
{
  return self->_endedReason;
}

- (unsigned)genericError
{
  return self->_genericError;
}

- (unsigned)gameKitError
{
  return self->_gameKitError;
}

- (unsigned)conferenceMiscError
{
  return self->_conferenceMiscError;
}

- (NSNumber)callDuration
{
  return self->_callDuration;
}

- (unsigned)networkCheckResult
{
  return self->_networkCheckResult;
}

- (NSNumber)dataRate
{
  return self->_dataRate;
}

- (NSNumber)gksError
{
  return self->_gksError;
}

- (NSNumber)connectDuration
{
  return self->_connectDuration;
}

- (unsigned)remoteNetworkConnection
{
  return self->_remoteNetworkConnection;
}

- (unsigned)localNetworkConnection
{
  return self->_localNetworkConnection;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (BOOL)usesRelay
{
  return self->_usesRelay;
}

- (NSNumber)currentNATType
{
  return self->_currentNATType;
}

- (NSNumber)remoteNATType
{
  return self->_remoteNATType;
}

- (NSNumber)relayConnectDuration
{
  return self->_relayConnectDuration;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (NSNumber)linkQuality
{
  return self->_linkQuality;
}

- (NSNumber)gksReturnCode
{
  return self->_gksReturnCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gksReturnCode, 0);
  objc_storeStrong((id *)&self->_linkQuality, 0);
  objc_storeStrong((id *)&self->_relayConnectDuration, 0);
  objc_storeStrong((id *)&self->_remoteNATType, 0);
  objc_storeStrong((id *)&self->_currentNATType, 0);
  objc_storeStrong((id *)&self->_connectDuration, 0);
  objc_storeStrong((id *)&self->_gksError, 0);
  objc_storeStrong((id *)&self->_dataRate, 0);
  objc_storeStrong((id *)&self->_callDuration, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end