@interface IDSMessageContext
- (BOOL)deviceBlackedOut;
- (BOOL)expectsPeerResponse;
- (BOOL)fromServerStorage;
- (BOOL)isDirectMessage;
- (BOOL)isFromTrustedSender;
- (BOOL)messageHadEncryptedData;
- (BOOL)usedEngram;
- (BOOL)wantsAppAck;
- (BOOL)wantsManualAck;
- (IDSCertifiedDeliveryContext)certifiedDeliveryContext;
- (IDSMessageContext)initWithDictionary:(id)a3 boostContext:(id)a4;
- (IDSPseudonym)targettedPseudonym;
- (NSData)engramGroupID;
- (NSDate)serverReceivedTime;
- (NSDictionary)resourceTransferMetadata;
- (NSError)wpConnectionError;
- (NSNumber)broadcastTime;
- (NSNumber)bytesSent;
- (NSNumber)messageSequenceNumber;
- (NSNumber)originalCommand;
- (NSNumber)originalTimestamp;
- (NSNumber)priority;
- (NSNumber)publicIntentAction;
- (NSNumber)serverTimestamp;
- (NSNumber)totalBytes;
- (NSString)destinationCorrelationIdentifier;
- (NSString)fromID;
- (NSString)incomingResponseIdentifier;
- (NSString)originalDestinationDevice;
- (NSString)originalGUID;
- (NSString)outgoingResponseIdentifier;
- (NSString)resourceTransferSandboxExtension;
- (NSString)resourceTransferURLString;
- (NSString)senderCorrelationIdentifier;
- (NSString)serviceIdentifier;
- (NSString)storageGuid;
- (NSString)toID;
- (double)averageLocalRTT;
- (id)boostContext;
- (id)objectForKey:(id)a3;
- (int64_t)broadcastID;
- (int64_t)connectionType;
- (int64_t)endpointState;
- (int64_t)fileSize;
- (int64_t)localMessageState;
- (void)setBoostContext:(id)a3;
- (void)setBroadcastID:(int64_t)a3;
- (void)setBroadcastTime:(id)a3;
- (void)setBytesSent:(id)a3;
- (void)setConnectionType:(int64_t)a3;
- (void)setDestinationCorrelationIdentifier:(id)a3;
- (void)setEngramGroupID:(id)a3;
- (void)setExpectsPeerResponse:(BOOL)a3;
- (void)setFromID:(id)a3;
- (void)setFromServerStorage:(BOOL)a3;
- (void)setIncomingResponseIdentifier:(id)a3;
- (void)setIsDirectMessage:(BOOL)a3;
- (void)setIsFromTrustedSender:(BOOL)a3;
- (void)setMessageHadEncryptedData:(BOOL)a3;
- (void)setOriginalCommand:(id)a3;
- (void)setOriginalDestinationDevice:(id)a3;
- (void)setOriginalGUID:(id)a3;
- (void)setOriginalGuid:(id)a3;
- (void)setOriginalTimestamp:(id)a3;
- (void)setOutgoingResponseIdentifier:(id)a3;
- (void)setPriority:(id)a3;
- (void)setPublicIntentAction:(id)a3;
- (void)setResourceTransferMetadata:(id)a3;
- (void)setResourceTransferSandboxExtension:(id)a3;
- (void)setResourceTransferURLString:(id)a3;
- (void)setSenderCorrelationIdentifier:(id)a3;
- (void)setServerTimestamp:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setStorageGuid:(id)a3;
- (void)setToID:(id)a3;
- (void)setTotalBytes:(id)a3;
- (void)setUsedEngram:(BOOL)a3;
- (void)setWPConnectionError:(id)a3;
- (void)setWantsAppAck:(BOOL)a3;
- (void)setWantsManualAck:(BOOL)a3;
@end

@implementation IDSMessageContext

- (IDSMessageContext)initWithDictionary:(id)a3 boostContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v253.receiver = self;
  v253.super_class = (Class)IDSMessageContext;
  v8 = [(IDSMessageContext *)&v253 init];
  if (v8)
  {
    uint64_t v9 = os_transaction_create();
    transaction = v8->_transaction;
    v8->_transaction = (OS_os_transaction *)v9;

    objc_storeStrong(&v8->_boostContext, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
    v13 = objc_msgSend_objectForKey_(v6, v11, @"IDSMessageContextOutgoingResponseIdentifierKey", v12);
    uint64_t v14 = self;
    outgoingResponseIdentifier = v8->_outgoingResponseIdentifier;
    v8->_outgoingResponseIdentifier = (NSString *)v14;

    v18 = objc_msgSend_objectForKey_(v6, v16, @"IDSMessageContextIncomingResponseIdentifierKey", v17);
    uint64_t v19 = self;
    incomingResponseIdentifier = v8->_incomingResponseIdentifier;
    v8->_incomingResponseIdentifier = (NSString *)v19;

    v23 = objc_msgSend_objectForKey_(v6, v21, @"IDSMessageContextServiceIdentifierKey", v22);
    uint64_t v24 = self;
    serviceIdentifier = v8->_serviceIdentifier;
    v8->_serviceIdentifier = (NSString *)v24;

    v28 = objc_msgSend_objectForKey_(v6, v26, @"IDSMessageContextStorageGuidKey", v27);
    uint64_t v29 = self;
    storageGuid = v8->_storageGuid;
    v8->_storageGuid = (NSString *)v29;

    v33 = objc_msgSend_objectForKey_(v6, v31, @"IDSMessageContextFromIDKey", v32);
    uint64_t v34 = self;
    fromID = v8->_fromID;
    v8->_fromID = (NSString *)v34;

    v38 = objc_msgSend_objectForKey_(v6, v36, @"IDSMessageContextToIDKey", v37);
    uint64_t v39 = self;
    toID = v8->_toID;
    v8->_toID = (NSString *)v39;

    v43 = objc_msgSend_objectForKey_(v6, v41, @"IDSMessageContextOriginalDestinationDeviceKey", v42);
    uint64_t v44 = self;
    originalDestinationDevice = v8->_originalDestinationDevice;
    v8->_originalDestinationDevice = (NSString *)v44;

    v48 = objc_msgSend_objectForKey_(v6, v46, @"IDSMessageContextOriginalGUIDKey", v47);
    uint64_t v49 = self;
    originalGUID = v8->_originalGUID;
    v8->_originalGUID = (NSString *)v49;

    v53 = objc_msgSend_objectForKey_(v6, v51, @"IDSMessageContextEngramGroupIDKey", v52);
    uint64_t v54 = self;
    engramGroupID = v8->_engramGroupID;
    v8->_engramGroupID = (NSData *)v54;

    v58 = objc_msgSend_objectForKey_(v6, v56, @"IDSMessageContextOriginalCommandKey", v57);
    uint64_t v59 = self;
    originalCommand = v8->_originalCommand;
    v8->_originalCommand = (NSNumber *)v59;

    v63 = objc_msgSend_objectForKey_(v6, v61, @"IDSMessageContextPublicIntentActionKey", v62);
    uint64_t v64 = self;
    publicIntentAction = v8->_publicIntentAction;
    v8->_publicIntentAction = (NSNumber *)v64;

    v68 = objc_msgSend_objectForKey_(v6, v66, @"IDSMessageContextBroadcastTimeKey", v67);
    uint64_t v69 = self;
    broadcastTime = v8->_broadcastTime;
    v8->_broadcastTime = (NSNumber *)v69;

    v73 = objc_msgSend_objectForKey_(v6, v71, @"IDSMessageContextPriorityKey", v72);
    uint64_t v74 = self;
    priority = v8->_priority;
    v8->_priority = (NSNumber *)v74;

    v78 = objc_msgSend_objectForKey_(v6, v76, @"IDSMessageContextServerTimestampKey", v77);
    uint64_t v79 = self;
    serverTimestamp = v8->_serverTimestamp;
    v8->_serverTimestamp = (NSNumber *)v79;

    v83 = objc_msgSend_objectForKey_(v6, v81, @"IDSMessageContextOriginalTimestampKey", v82);
    uint64_t v84 = self;
    originalTimestamp = v8->_originalTimestamp;
    v8->_originalTimestamp = (NSNumber *)v84;

    v88 = objc_msgSend_objectForKey_(v6, v86, @"IDSMessageContextSenderCorrelationIdentifierKey", v87);
    uint64_t v89 = self;
    senderCorrelationIdentifier = v8->_senderCorrelationIdentifier;
    v8->_senderCorrelationIdentifier = (NSString *)v89;

    v93 = objc_msgSend_objectForKey_(v6, v91, @"IDSMessageContextDestinationCorrelationIdentifierKey", v92);
    uint64_t v94 = self;
    destinationCorrelationIdentifier = v8->_destinationCorrelationIdentifier;
    v8->_destinationCorrelationIdentifier = (NSString *)v94;

    v98 = objc_msgSend_objectForKey_(v6, v96, @"IDSMessageContextSequenceNumberKey", v97);
    uint64_t v99 = self;
    messageSequenceNumber = v8->_messageSequenceNumber;
    v8->_messageSequenceNumber = (NSNumber *)v99;

    v103 = objc_msgSend_objectForKey_(v6, v101, @"IDSMessageContextBytesSent", v102);
    uint64_t v104 = self;
    bytesSent = v8->_bytesSent;
    v8->_bytesSent = (NSNumber *)v104;

    v108 = objc_msgSend_objectForKey_(v6, v106, @"IDSMessageContextTotalBytes", v107);
    uint64_t v109 = self;
    totalBytes = v8->_totalBytes;
    v8->_totalBytes = (NSNumber *)v109;

    v113 = objc_msgSend_objectForKey_(v6, v111, @"IDSMessageContextTargettedPseudonymKey", v112);
    uint64_t v114 = self;
    targettedPseudonymDict = v8->_targettedPseudonymDict;
    v8->_targettedPseudonymDict = (NSDictionary *)v114;

    v118 = objc_msgSend_objectForKey_(v6, v116, @"IDSMessageContextExpectsPeerResponseKey", v117);
    v8->_expectsPeerResponse = objc_msgSend_BOOLValue(v118, v119, v120, v121);

    v124 = objc_msgSend_objectForKey_(v6, v122, @"IDSMessageContextWantsAppAckKey", v123);
    v8->_wantsAppAck = objc_msgSend_BOOLValue(v124, v125, v126, v127);

    v130 = objc_msgSend_objectForKey_(v6, v128, @"IDSMessageContextIsDirectMessage", v129);
    v8->_isDirectMessage = objc_msgSend_BOOLValue(v130, v131, v132, v133);

    v136 = objc_msgSend_objectForKey_(v6, v134, @"IDSMessageContextBroadcastIDKey", v135);
    v8->_broadcastID = objc_msgSend_longLongValue(v136, v137, v138, v139);

    v142 = objc_msgSend_objectForKey_(v6, v140, @"IDSMessageContextWantsManualAckKey", v141);
    v8->_wantsManualAck = objc_msgSend_BOOLValue(v142, v143, v144, v145);

    v148 = objc_msgSend_objectForKey_(v6, v146, @"IDSMessageContextFromServerStorageKey", v147);
    v8->_fromServerStorage = objc_msgSend_BOOLValue(v148, v149, v150, v151);

    v154 = objc_msgSend_objectForKey_(v6, v152, @"IDSMessageContextConnectionTypeKey", v153);
    v8->_connectionType = objc_msgSend_longLongValue(v154, v155, v156, v157);

    v160 = objc_msgSend_objectForKey_(v6, v158, @"IDSMessageContextUsedEngramKey", v159);
    v8->_usedEngram = objc_msgSend_BOOLValue(v160, v161, v162, v163);

    v166 = objc_msgSend_objectForKey_(v6, v164, @"IDSMessageContextAverageLocalRTTKey", v165);
    objc_msgSend_doubleValue(v166, v167, v168, v169);
    v8->_averageLocalRTT = v170;

    v173 = objc_msgSend_objectForKey_(v6, v171, @"IDSMessageContextLocalMessageStateKey", v172);
    v8->_localMessageState = objc_msgSend_integerValue(v173, v174, v175, v176);

    v179 = objc_msgSend_objectForKey_(v6, v177, @"IDSMessageContextEndpointStateKey", v178);
    v8->_endpointState = objc_msgSend_integerValue(v179, v180, v181, v182);

    v185 = objc_msgSend_objectForKey_(v6, v183, @"IDSMessageContextDeviceBlackedOutKey", v184);
    v8->_deviceBlackedOut = objc_msgSend_BOOLValue(v185, v186, v187, v188);

    v191 = objc_msgSend_objectForKey_(v6, v189, @"IDSMessageContextMessageHadEncryptedData", v190);
    v8->_messageHadEncryptedData = objc_msgSend_BOOLValue(v191, v192, v193, v194);

    v197 = objc_msgSend_objectForKey_(v6, v195, @"IDSMessageContextIsFromTrustedSender", v196);
    v8->_isFromTrustedSender = objc_msgSend_BOOLValue(v197, v198, v199, v200);

    v203 = objc_msgSend_objectForKey_(v6, v201, @"IDSMessageContextFileSize", v202);
    v8->_fileSize = objc_msgSend_integerValue(v203, v204, v205, v206);

    v209 = objc_msgSend_objectForKey_(v6, v207, @"IDSMessageContextWPConnectionErrorDomainKey", v208);
    self;
    v210 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v213 = objc_msgSend_objectForKey_(v6, v211, @"IDSMessageContextWPConnectionErrorCodeKey", v212);
    v214 = self;

    v217 = objc_msgSend_objectForKey_(v6, v215, @"IDSMessageContextWPConnectionErrorUserInfoKey", v216);
    v218 = self;

    v222 = (void *)MEMORY[0x1E4F28C58];
    if (v210) {
      v223 = v210;
    }
    else {
      v223 = @"com.apple.ids.idssenderrordomain";
    }
    uint64_t v224 = objc_msgSend_integerValue(v214, v219, v220, v221);
    uint64_t v227 = objc_msgSend_errorWithDomain_code_userInfo_(v222, v225, (uint64_t)v223, v226, v224, v218);
    wpConnectionError = v8->_wpConnectionError;
    v8->_wpConnectionError = (NSError *)v227;

    v232 = objc_msgSend_objectForKey_(v6, v229, @"IDSMessageContextCertifiedDeliveryContextKey", v230);
    if (v232)
    {
      v234 = [IDSCertifiedDeliveryContext alloc];
      uint64_t v237 = objc_msgSend_initWithDictionaryRepresentation_(v234, v235, (uint64_t)v232, v236);
      certifiedDeliveryContext = v8->_certifiedDeliveryContext;
      v8->_certifiedDeliveryContext = (IDSCertifiedDeliveryContext *)v237;
    }
    v239 = objc_msgSend_objectForKey_(v6, v231, @"ids-message-resource-transfer-url", v233);
    uint64_t v240 = self;
    resourceTransferURLString = v8->_resourceTransferURLString;
    v8->_resourceTransferURLString = (NSString *)v240;

    v244 = objc_msgSend_objectForKey_(v6, v242, @"ids-message-resource-transfer-metadata", v243);
    uint64_t v245 = self;
    resourceTransferMetadata = v8->_resourceTransferMetadata;
    v8->_resourceTransferMetadata = (NSDictionary *)v245;

    v249 = objc_msgSend_objectForKey_(v6, v247, @"ids-message-resource-transfer-sandbox-extension", v248);
    uint64_t v250 = self;
    resourceTransferSandboxExtension = v8->_resourceTransferSandboxExtension;
    v8->_resourceTransferSandboxExtension = (NSString *)v250;
  }
  return v8;
}

- (id)objectForKey:(id)a3
{
  id v3 = a3;
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_19DB7D938((uint64_t)v3, v7);
  }

  return 0;
}

- (NSDate)serverReceivedTime
{
  v4 = objc_msgSend_serverTimestamp(self, a2, v2, v3);
  v8 = v4;
  if (v4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_doubleValue(v4, v5, v6, v7);
    v13 = objc_msgSend_dateWithTimeIntervalSince1970_(v9, v10, v11, v12);
  }
  else
  {
    v13 = 0;
  }

  return (NSDate *)v13;
}

- (void)setOutgoingResponseIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  outgoingResponseIdentifier = self->_outgoingResponseIdentifier;
  self->_outgoingResponseIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)outgoingResponseIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_outgoingResponseIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIncomingResponseIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  incomingResponseIdentifier = self->_incomingResponseIdentifier;
  self->_incomingResponseIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)incomingResponseIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_incomingResponseIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setServiceIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  serviceIdentifier = self->_serviceIdentifier;
  self->_serviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)serviceIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serviceIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStorageGuid:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  storageGuid = self->_storageGuid;
  self->_storageGuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)storageGuid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_storageGuid;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFromID:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  fromID = self->_fromID;
  self->_fromID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)fromID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_fromID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setToID:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  toID = self->_toID;
  self->_toID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)toID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_toID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalDestinationDevice:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalDestinationDevice = self->_originalDestinationDevice;
  self->_originalDestinationDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)originalDestinationDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalDestinationDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalGuid:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalGUID = self->_originalGUID;
  self->_originalGUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)originalGUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalGUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEngramGroupID:(id)a3
{
  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  engramGroupID = self->_engramGroupID;
  self->_engramGroupID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)engramGroupID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_engramGroupID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalCommand:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalCommand = self->_originalCommand;
  self->_originalCommand = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)originalCommand
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalCommand;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBroadcastTime:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  broadcastTime = self->_broadcastTime;
  self->_broadcastTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)broadcastTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_broadcastTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPriority:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  priority = self->_priority;
  self->_priority = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)priority
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_priority;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setServerTimestamp:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  serverTimestamp = self->_serverTimestamp;
  self->_serverTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)serverTimestamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serverTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalTimestamp:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalTimestamp = self->_originalTimestamp;
  self->_originalTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)originalTimestamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  senderCorrelationIdentifier = self->_senderCorrelationIdentifier;
  self->_senderCorrelationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)senderCorrelationIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_senderCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDestinationCorrelationIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  destinationCorrelationIdentifier = self->_destinationCorrelationIdentifier;
  self->_destinationCorrelationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)destinationCorrelationIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_destinationCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPublicIntentAction:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  publicIntentAction = self->_publicIntentAction;
  self->_publicIntentAction = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)publicIntentAction
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_publicIntentAction;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setWPConnectionError:(id)a3
{
  v4 = (NSError *)a3;
  os_unfair_lock_lock(&self->_lock);
  wpConnectionError = self->_wpConnectionError;
  self->_wpConnectionError = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSError)wpConnectionError
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_wpConnectionError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBytesSent:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  bytesSent = self->_bytesSent;
  self->_bytesSent = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)bytesSent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_bytesSent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTotalBytes:(id)a3
{
  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  totalBytes = self->_totalBytes;
  self->_totalBytes = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)totalBytes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_totalBytes;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResourceTransferURLString:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  resourceTransferURLString = self->_resourceTransferURLString;
  self->_resourceTransferURLString = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)resourceTransferURLString
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_resourceTransferURLString;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResourceTransferMetadata:(id)a3
{
  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  resourceTransferMetadata = self->_resourceTransferMetadata;
  self->_resourceTransferMetadata = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)resourceTransferMetadata
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_resourceTransferMetadata;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResourceTransferSandboxExtension:(id)a3
{
  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  resourceTransferSandboxExtension = self->_resourceTransferSandboxExtension;
  self->_resourceTransferSandboxExtension = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)resourceTransferSandboxExtension
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_resourceTransferSandboxExtension;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setExpectsPeerResponse:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_expectsPeerResponse = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)expectsPeerResponse
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_expectsPeerResponse;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWantsAppAck:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_wantsAppAck = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)wantsAppAck
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_wantsAppAck;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsDirectMessage:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isDirectMessage = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isDirectMessage
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isDirectMessage;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBroadcastID:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_broadcastID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)broadcastID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t broadcastID = self->_broadcastID;
  os_unfair_lock_unlock(p_lock);
  return broadcastID;
}

- (void)setWantsManualAck:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_wantsManualAck = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)wantsManualAck
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_wantsManualAck;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFromServerStorage:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_fromServerStorage = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)fromServerStorage
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fromServerStorage;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setConnectionType:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_connectionType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)connectionType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t connectionType = self->_connectionType;
  os_unfair_lock_unlock(p_lock);
  return connectionType;
}

- (void)setUsedEngram:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_usedEngram = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)usedEngram
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_usedEngram;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsFromTrustedSender:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isFromTrustedSender = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFromTrustedSender
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isFromTrustedSender;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (IDSPseudonym)targettedPseudonym
{
  if (self->_targettedPseudonymDict)
  {
    double v3 = [IDSPseudonym alloc];
    uint64_t v6 = objc_msgSend_initWithDictionaryRepresentation_(v3, v4, (uint64_t)self->_targettedPseudonymDict, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (IDSPseudonym *)v6;
}

- (void)setOriginalGUID:(id)a3
{
}

- (BOOL)messageHadEncryptedData
{
  return self->_messageHadEncryptedData;
}

- (void)setMessageHadEncryptedData:(BOOL)a3
{
  self->_messageHadEncryptedData = a3;
}

- (double)averageLocalRTT
{
  return self->_averageLocalRTT;
}

- (int64_t)localMessageState
{
  return self->_localMessageState;
}

- (BOOL)deviceBlackedOut
{
  return self->_deviceBlackedOut;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (id)boostContext
{
  return self->_boostContext;
}

- (void)setBoostContext:(id)a3
{
}

- (NSNumber)messageSequenceNumber
{
  return self->_messageSequenceNumber;
}

- (int64_t)endpointState
{
  return self->_endpointState;
}

- (IDSCertifiedDeliveryContext)certifiedDeliveryContext
{
  return self->_certifiedDeliveryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targettedPseudonymDict, 0);
  objc_storeStrong((id *)&self->_totalBytes, 0);
  objc_storeStrong((id *)&self->_bytesSent, 0);
  objc_storeStrong((id *)&self->_messageSequenceNumber, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_broadcastTime, 0);
  objc_storeStrong((id *)&self->_resourceTransferMetadata, 0);
  objc_storeStrong((id *)&self->_resourceTransferSandboxExtension, 0);
  objc_storeStrong((id *)&self->_resourceTransferURLString, 0);
  objc_storeStrong((id *)&self->_destinationCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_wpConnectionError, 0);
  objc_storeStrong((id *)&self->_publicIntentAction, 0);
  objc_storeStrong((id *)&self->_originalTimestamp, 0);
  objc_storeStrong((id *)&self->_serverTimestamp, 0);
  objc_storeStrong((id *)&self->_originalCommand, 0);
  objc_storeStrong((id *)&self->_engramGroupID, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
  objc_storeStrong((id *)&self->_originalDestinationDevice, 0);
  objc_storeStrong((id *)&self->_toID, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_storageGuid, 0);
  objc_storeStrong((id *)&self->_certifiedDeliveryContext, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_boostContext, 0);
}

@end