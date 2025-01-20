@interface IDSCertifiedDeliveryContext
+ (BOOL)supportsSecureCoding;
- (BOOL)generateDeliveryReceipt;
- (IDSCertifiedDeliveryContext)initWithCertifiedDeliveryContext:(id)a3 queryHash:(id)a4;
- (IDSCertifiedDeliveryContext)initWithCoder:(id)a3;
- (IDSCertifiedDeliveryContext)initWithDataRepresentation:(id)a3;
- (IDSCertifiedDeliveryContext)initWithDictionaryRepresentation:(id)a3;
- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 certifiedDeliveryVersion:(int64_t)a5 certifiedDeliveryRTS:(id)a6 senderToken:(id)a7;
- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 failureReason:(id)a9 failureReasonMessage:(id)a10;
- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 failureReason:(id)a9 failureReasonMessage:(id)a10 replayKey:(id)a11 generateDeliveryReceipt:(BOOL)a12 deliveryStatusContext:(id)a13 localURI:(id)a14 remoteURI:(id)a15 queryHash:(id)a16;
- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 localURI:(id)a9 remoteURI:(id)a10;
- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 localURI:(id)a9 remoteURI:(id)a10 replayKey:(id)a11;
- (IDSCertifiedDeliveryReplayKey)replayKey;
- (NSData)certifiedDeliveryRTS;
- (NSData)queryHash;
- (NSData)senderToken;
- (NSDictionary)deliveryStatusContext;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)failureReason;
- (NSString)failureReasonMessage;
- (NSString)localURI;
- (NSString)originalGUID;
- (NSString)remoteURI;
- (NSString)service;
- (id)dataRepresentation;
- (id)description;
- (int64_t)certifiedDeliveryVersion;
- (int64_t)originalEncryptionType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryStatusContext:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setFailureReasonMessage:(id)a3;
- (void)setGenerateDeliveryReceipt:(BOOL)a3;
@end

@implementation IDSCertifiedDeliveryContext

- (IDSCertifiedDeliveryContext)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)IDSCertifiedDeliveryContext;
  v6 = [(IDSCertifiedDeliveryContext *)&v74 init];
  if (v6)
  {
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"IDSCertifiedDeliveryContextGUIDKey", v7);
    originalGUID = v6->_originalGUID;
    v6->_originalGUID = (NSString *)v8;

    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"IDSCertifiedDeliveryContextServiceKey", v11);
    service = v6->_service;
    v6->_service = (NSString *)v12;

    v17 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"IDSCertifiedDeliveryContextReplayKeyKey", v15);
    if (v17)
    {
      v19 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v20 = objc_opt_class();
      uint64_t v23 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v19, v21, v20, v22, v17, 0);
      replayKey = v6->_replayKey;
      v6->_replayKey = (IDSCertifiedDeliveryReplayKey *)v23;
    }
    v25 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"IDSCertifiedDeliveryContextOriginalEncryptionTypeKey", v18);
    v6->_originalEncryptionType = objc_msgSend_integerValue(v25, v26, v27, v28);

    v31 = objc_msgSend_objectForKeyedSubscript_(v4, v29, @"IDSCertifiedDeliveryContextVersionKey", v30);
    v6->_certifiedDeliveryVersion = objc_msgSend_integerValue(v31, v32, v33, v34);

    uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v4, v35, @"IDSCertifiedDeliveryContextRTSKey", v36);
    certifiedDeliveryRTS = v6->_certifiedDeliveryRTS;
    v6->_certifiedDeliveryRTS = (NSData *)v37;

    uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v4, v39, @"IDSCertifiedDeliveryContextSenderTokenKey", v40);
    senderToken = v6->_senderToken;
    v6->_senderToken = (NSData *)v41;

    v45 = objc_msgSend_objectForKeyedSubscript_(v4, v43, @"IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey", v44);
    v6->_generateDeliveryReceipt = objc_msgSend_BOOLValue(v45, v46, v47, v48);

    uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v4, v49, @"IDSCertifiedDeliveryContextDeliveryStatusContextKey", v50);
    deliveryStatusContext = v6->_deliveryStatusContext;
    v6->_deliveryStatusContext = (NSDictionary *)v51;

    uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v4, v53, @"IDSCertifiedDeliveryContextLocalURIKey", v54);
    localURI = v6->_localURI;
    v6->_localURI = (NSString *)v55;

    uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v4, v57, @"IDSCertifiedDeliveryContextRemoteURIKey", v58);
    remoteURI = v6->_remoteURI;
    v6->_remoteURI = (NSString *)v59;

    uint64_t v63 = objc_msgSend_objectForKeyedSubscript_(v4, v61, @"IDSCertifiedDeliveryContextQueryHashKey", v62);
    queryHash = v6->_queryHash;
    v6->_queryHash = (NSData *)v63;

    uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v4, v65, @"IDSCertifiedDeliveryContextFailureReasonKey", v66);
    failureReason = v6->_failureReason;
    v6->_failureReason = (NSNumber *)v67;

    uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(v4, v69, @"IDSCertifiedDeliveryContextFailureReasonMessageKey", v70);
    failureReasonMessage = v6->_failureReasonMessage;
    v6->_failureReasonMessage = (NSString *)v71;
  }
  return v6;
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 certifiedDeliveryVersion:(int64_t)a5 certifiedDeliveryRTS:(id)a6 senderToken:(id)a7
{
  char v8 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, 0.0, a4, 2, a5, a6, a7, 0, 0, 0, v8, 0, 0, 0, 0);
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 localURI:(id)a9 remoteURI:(id)a10
{
  char v12 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, v10, a4, a5, a6, a7, a8, 0, 0, 0, v12, 0, a9, a10, 0);
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 failureReason:(id)a9 failureReasonMessage:(id)a10
{
  char v11 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, 0.0, a4, a5, a6, a7, a8, a9, a10, 0, v11, 0, 0, 0, 0);
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 localURI:(id)a9 remoteURI:(id)a10 replayKey:(id)a11
{
  char v13 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, v11, a4, a5, a6, a7, a8, 0, 0, a11, v13, 0, a9, a10, 0);
}

- (IDSCertifiedDeliveryContext)initWithCertifiedDeliveryContext:(id)a3 queryHash:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v64 = objc_msgSend_originalGUID(v7, v8, v9, v10);
  uint64_t v63 = objc_msgSend_service(v7, v11, v12, v13);
  uint64_t v61 = objc_msgSend_originalEncryptionType(v7, v14, v15, v16);
  uint64_t v60 = objc_msgSend_certifiedDeliveryVersion(v7, v17, v18, v19);
  uint64_t v59 = objc_msgSend_certifiedDeliveryRTS(v7, v20, v21, v22);
  double v58 = objc_msgSend_senderToken(v7, v23, v24, v25);
  v57 = objc_msgSend_failureReason(v7, v26, v27, v28);
  v32 = objc_msgSend_failureReasonMessage(v7, v29, v30, v31);
  double v36 = objc_msgSend_replayKey(v7, v33, v34, v35);
  char DeliveryReceipt = objc_msgSend_generateDeliveryReceipt(v7, v37, v38, v39);
  double v44 = objc_msgSend_deliveryStatusContext(v7, v41, v42, v43);
  double v48 = objc_msgSend_localURI(v7, v45, v46, v47);
  v52 = objc_msgSend_remoteURI(v7, v49, v50, v51);

  char v56 = DeliveryReceipt;
  DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash = (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, v53, (uint64_t)v64, v54, v63, v61, v60, v59, v58, v57, v32, v36, v56, v44, v48, v52, v6);

  return DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash;
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 failureReason:(id)a9 failureReasonMessage:(id)a10 replayKey:(id)a11 generateDeliveryReceipt:(BOOL)a12 deliveryStatusContext:(id)a13 localURI:(id)a14 remoteURI:(id)a15 queryHash:(id)a16
{
  id v34 = a3;
  id v33 = a4;
  id v30 = a7;
  id v19 = a7;
  id v31 = a8;
  id v38 = a8;
  id v37 = a9;
  id v36 = a10;
  id v35 = a11;
  id v20 = a13;
  id v21 = a14;
  id v22 = a15;
  id v23 = a16;
  v39.receiver = self;
  v39.super_class = (Class)IDSCertifiedDeliveryContext;
  uint64_t v24 = [(IDSCertifiedDeliveryContext *)&v39 init];
  double v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_originalGUID, a3);
    objc_storeStrong((id *)&v25->_service, a4);
    v25->_originalEncryptionType = a5;
    v25->_certifiedDeliveryVersion = a6;
    objc_storeStrong((id *)&v25->_certifiedDeliveryRTS, v30);
    objc_storeStrong((id *)&v25->_senderToken, v31);
    objc_storeStrong((id *)&v25->_failureReason, a9);
    objc_storeStrong((id *)&v25->_failureReasonMessage, a10);
    objc_storeStrong((id *)&v25->_replayKey, a11);
    v25->_generatechar DeliveryReceipt = a12;
    objc_storeStrong((id *)&v25->_deliveryStatusContext, a13);
    objc_storeStrong((id *)&v25->_localURI, a14);
    objc_storeStrong((id *)&v25->_remoteURI, a15);
    objc_storeStrong((id *)&v25->_queryHash, a16);
  }

  return v25;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = self->_originalGUID;
  if (v4)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextGUIDKey", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80B10();
  }

  v5 = self->_service;
  if (v5)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextServiceKey", v5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80A88();
  }

  char v8 = objc_msgSend_numberWithInteger_(NSNumber, v6, self->_originalEncryptionType, v7);
  if (v8) {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextOriginalEncryptionTypeKey", v8);
  }

  double v11 = objc_msgSend_numberWithInteger_(NSNumber, v9, self->_certifiedDeliveryVersion, v10);
  if (v11)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextVersionKey", v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80A00();
  }

  uint64_t v12 = self->_certifiedDeliveryRTS;
  if (v12)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextRTSKey", v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80978();
  }

  double v13 = self->_senderToken;
  if (v13)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextSenderTokenKey", v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB808F0();
  }

  double v16 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v14, (uint64_t)self->_replayKey, v15, 1, 0);
  if (v16)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextReplayKeyKey", v16);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80868();
  }

  failureReason = self->_failureReason;
  if (failureReason) {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextFailureReasonKey", failureReason);
  }
  failureReasonMessage = self->_failureReasonMessage;
  if (failureReasonMessage) {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextFailureReasonMessageKey", failureReasonMessage);
  }
  id v21 = objc_msgSend_numberWithBool_(NSNumber, v17, self->_generateDeliveryReceipt, v18);
  if (v21)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey", v21);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB807E0();
  }

  deliveryStatusContext = self->_deliveryStatusContext;
  if (deliveryStatusContext) {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextDeliveryStatusContextKey", deliveryStatusContext);
  }
  id v23 = self->_localURI;
  if (v23)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextLocalURIKey", v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80758();
  }

  uint64_t v24 = self->_remoteURI;
  if (v24)
  {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextRemoteURIKey", v24);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB806D0();
  }

  queryHash = self->_queryHash;
  if (queryHash) {
    CFDictionarySetValue(v3, @"IDSCertifiedDeliveryContextQueryHashKey", queryHash);
  }
  return (NSDictionary *)v3;
}

- (IDSCertifiedDeliveryContext)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  id v16 = 0;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v5, v7, v6, v8, v4, &v16);
  uint64_t v9 = (IDSCertifiedDeliveryContext *)objc_claimAutoreleasedReturnValue();
  id v12 = v16;
  if (!v9)
  {
    v14 = objc_msgSend_delivery(IDSFoundationLog, v10, v11, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB80B98((uint64_t)v4, (uint64_t)v12, v14);
    }
  }
  return v9;
}

- (id)dataRepresentation
{
  id v10 = 0;
  v3 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)self, v2, 1, &v10);
  id v6 = v10;
  if (!v3)
  {
    double v8 = objc_msgSend_delivery(IDSFoundationLog, v4, v5, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_19DB80C20((uint64_t)v6, v8);
    }
  }
  return v3;
}

- (IDSCertifiedDeliveryContext)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  char v56 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, v6, @"IDSCertifiedDeliveryContextGUIDKey");
  uint64_t v7 = objc_opt_class();
  double v62 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v8, v7, v9, @"IDSCertifiedDeliveryContextServiceKey");
  uint64_t v12 = objc_msgSend_decodeIntegerForKey_(v3, v10, @"IDSCertifiedDeliveryContextOriginalEncryptionTypeKey", v11);
  uint64_t v60 = objc_msgSend_decodeIntegerForKey_(v3, v13, @"IDSCertifiedDeliveryContextVersionKey", v14);
  uint64_t v15 = objc_opt_class();
  uint64_t v59 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v16, v15, v17, @"IDSCertifiedDeliveryContextRTSKey");
  uint64_t v18 = objc_opt_class();
  double v58 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v19, v18, v20, @"IDSCertifiedDeliveryContextSenderTokenKey");
  uint64_t v21 = objc_opt_class();
  uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v22, v21, v23, @"IDSCertifiedDeliveryContextFailureReasonKey");
  uint64_t v25 = objc_opt_class();
  double v28 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v26, v25, v27, @"IDSCertifiedDeliveryContextFailureReasonMessageKey");
  uint64_t v29 = objc_opt_class();
  v32 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v30, v29, v31, @"IDSCertifiedDeliveryContextReplayKeyKey");
  char v35 = objc_msgSend_decodeBoolForKey_(v3, v33, @"IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey", v34);
  uint64_t v36 = objc_opt_class();
  uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v37, v36, v38, @"IDSCertifiedDeliveryContextDeliveryStatusContextKey");
  uint64_t v39 = objc_opt_class();
  uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v40, v39, v41, @"IDSCertifiedDeliveryContextLocalURIKey");
  uint64_t v43 = objc_opt_class();
  uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v44, v43, v45, @"IDSCertifiedDeliveryContextRemoteURIKey");
  uint64_t v47 = objc_opt_class();
  uint64_t v50 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v48, v47, v49, @"IDSCertifiedDeliveryContextQueryHashKey");

  char v54 = v35;
  DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash = (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, v51, (uint64_t)v56, v52, v62, v12, v60, v59, v58, v24, v28, v32, v54, v55, v42, v46, v50);

  return DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash;
}

- (void)encodeWithCoder:(id)a3
{
  originalGUID = self->_originalGUID;
  id v33 = a3;
  objc_msgSend_encodeObject_forKey_(v33, v5, (uint64_t)originalGUID, v6, @"IDSCertifiedDeliveryContextGUIDKey");
  objc_msgSend_encodeObject_forKey_(v33, v7, (uint64_t)self->_service, v8, @"IDSCertifiedDeliveryContextServiceKey");
  objc_msgSend_encodeInteger_forKey_(v33, v9, self->_originalEncryptionType, v10, @"IDSCertifiedDeliveryContextOriginalEncryptionTypeKey");
  objc_msgSend_encodeInteger_forKey_(v33, v11, self->_certifiedDeliveryVersion, v12, @"IDSCertifiedDeliveryContextVersionKey");
  objc_msgSend_encodeObject_forKey_(v33, v13, (uint64_t)self->_certifiedDeliveryRTS, v14, @"IDSCertifiedDeliveryContextRTSKey");
  objc_msgSend_encodeObject_forKey_(v33, v15, (uint64_t)self->_senderToken, v16, @"IDSCertifiedDeliveryContextSenderTokenKey");
  objc_msgSend_encodeObject_forKey_(v33, v17, (uint64_t)self->_failureReason, v18, @"IDSCertifiedDeliveryContextFailureReasonKey");
  objc_msgSend_encodeObject_forKey_(v33, v19, (uint64_t)self->_failureReasonMessage, v20, @"IDSCertifiedDeliveryContextFailureReasonMessageKey");
  objc_msgSend_encodeObject_forKey_(v33, v21, (uint64_t)self->_replayKey, v22, @"IDSCertifiedDeliveryContextReplayKeyKey");
  objc_msgSend_encodeBool_forKey_(v33, v23, self->_generateDeliveryReceipt, v24, @"IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey");
  objc_msgSend_encodeObject_forKey_(v33, v25, (uint64_t)self->_deliveryStatusContext, v26, @"IDSCertifiedDeliveryContextDeliveryStatusContextKey");
  objc_msgSend_encodeObject_forKey_(v33, v27, (uint64_t)self->_localURI, v28, @"IDSCertifiedDeliveryContextLocalURIKey");
  objc_msgSend_encodeObject_forKey_(v33, v29, (uint64_t)self->_remoteURI, v30, @"IDSCertifiedDeliveryContextRemoteURIKey");
  objc_msgSend_encodeObject_forKey_(v33, v31, (uint64_t)self->_queryHash, v32, @"IDSCertifiedDeliveryContextQueryHashKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  originalGUID = self->_originalGUID;
  service = self->_service;
  int64_t certifiedDeliveryVersion = self->_certifiedDeliveryVersion;
  senderToken = self->_senderToken;
  if (self->_generateDeliveryReceipt) {
    double v9 = @"YES";
  }
  else {
    double v9 = @"NO";
  }
  double v10 = IDSLoggableDescriptionForHandleOnService(self->_localURI, self->_service);
  double v11 = IDSLoggableDescriptionForHandleOnService(self->_remoteURI, self->_service);
  double v13 = objc_msgSend_stringWithFormat_(v3, v12, @"<%@: %p guid: %@, service: %@, version: %lu, senderToken: %@, generateDeliveryReceipt: %@, localURI: %@, remoteURI: %@, failureReason: %@, failureReasonMessage: %@, rts: %@, replayKey: %@, queryHash: %@, deliveryStatusContext: %@>", *(double *)&self->_failureReason, v4, self, originalGUID, service, certifiedDeliveryVersion, senderToken, v9, v10, v11, self->_failureReason, self->_failureReasonMessage, self->_certifiedDeliveryRTS, self->_replayKey, self->_queryHash, self->_deliveryStatusContext);

  return v13;
}

- (NSString)originalGUID
{
  return self->_originalGUID;
}

- (int64_t)originalEncryptionType
{
  return self->_originalEncryptionType;
}

- (NSString)service
{
  return self->_service;
}

- (int64_t)certifiedDeliveryVersion
{
  return self->_certifiedDeliveryVersion;
}

- (NSData)certifiedDeliveryRTS
{
  return self->_certifiedDeliveryRTS;
}

- (NSData)senderToken
{
  return self->_senderToken;
}

- (NSNumber)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(id)a3
{
}

- (NSString)failureReasonMessage
{
  return self->_failureReasonMessage;
}

- (void)setFailureReasonMessage:(id)a3
{
}

- (IDSCertifiedDeliveryReplayKey)replayKey
{
  return self->_replayKey;
}

- (BOOL)generateDeliveryReceipt
{
  return self->_generateDeliveryReceipt;
}

- (void)setGenerateDeliveryReceipt:(BOOL)a3
{
  self->_generatechar DeliveryReceipt = a3;
}

- (NSDictionary)deliveryStatusContext
{
  return self->_deliveryStatusContext;
}

- (void)setDeliveryStatusContext:(id)a3
{
}

- (NSString)localURI
{
  return self->_localURI;
}

- (NSString)remoteURI
{
  return self->_remoteURI;
}

- (NSData)queryHash
{
  return self->_queryHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryHash, 0);
  objc_storeStrong((id *)&self->_remoteURI, 0);
  objc_storeStrong((id *)&self->_localURI, 0);
  objc_storeStrong((id *)&self->_deliveryStatusContext, 0);
  objc_storeStrong((id *)&self->_replayKey, 0);
  objc_storeStrong((id *)&self->_failureReasonMessage, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_senderToken, 0);
  objc_storeStrong((id *)&self->_certifiedDeliveryRTS, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
}

@end