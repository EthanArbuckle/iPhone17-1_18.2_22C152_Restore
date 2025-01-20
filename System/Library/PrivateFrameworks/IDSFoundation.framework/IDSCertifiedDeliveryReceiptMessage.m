@interface IDSCertifiedDeliveryReceiptMessage
- (BOOL)generateDeliveryReceipt;
- (BOOL)wantsResponse;
- (IDSCertifiedDeliveryReceiptMessage)initWithCertifiedDeliveryContext:(id)a3;
- (NSData)certifiedDeliveryRTS;
- (NSData)encryptedData;
- (NSData)queryHash;
- (NSData)senderToken;
- (NSDictionary)generatedDeliveryStatusContext;
- (NSNumber)failureReason;
- (NSString)encryptionType;
- (NSString)failureReasonMessage;
- (NSString)localURI;
- (NSString)originalGUID;
- (NSString)remoteURI;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)certifiedDeliveryVersion;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)setCertifiedDeliveryRTS:(id)a3;
- (void)setCertifiedDeliveryVersion:(int64_t)a3;
- (void)setEncryptedData:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setFailureReasonMessage:(id)a3;
- (void)setGenerateDeliveryReceipt:(BOOL)a3;
- (void)setGeneratedDeliveryStatusContext:(id)a3;
- (void)setLocalURI:(id)a3;
- (void)setOriginalGUID:(id)a3;
- (void)setQueryHash:(id)a3;
- (void)setRemoteURI:(id)a3;
- (void)setSenderToken:(id)a3;
@end

@implementation IDSCertifiedDeliveryReceiptMessage

- (IDSCertifiedDeliveryReceiptMessage)initWithCertifiedDeliveryContext:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)IDSCertifiedDeliveryReceiptMessage;
  v7 = [(IDSMessage *)&v60 init];
  if (v7)
  {
    uint64_t v9 = objc_msgSend_senderToken(v4, v5, v6, v8);
    originalGUID = v7->_originalGUID;
    v7->_originalGUID = (NSString *)v9;

    uint64_t v14 = objc_msgSend_certifiedDeliveryRTS(v4, v11, v12, v13);
    senderToken = v7->_senderToken;
    v7->_senderToken = (NSData *)v14;

    v7->_certifiedDeliveryRTS = (NSData *)objc_msgSend_certifiedDeliveryVersion(v4, v16, v17, v18);
    uint64_t v22 = objc_msgSend_originalGUID(v4, v19, v20, v21);
    v23 = *(void **)&v7->_generateDeliveryReceipt;
    *(void *)&v7->_generateDeliveryReceipt = v22;

    uint64_t v27 = objc_msgSend_failureReason(v4, v24, v25, v26);
    certifiedDeliveryVersion = (void *)v7->_certifiedDeliveryVersion;
    v7->_certifiedDeliveryVersion = v27;

    uint64_t v32 = objc_msgSend_failureReasonMessage(v4, v29, v30, v31);
    failureReason = v7->_failureReason;
    v7->_failureReason = (NSNumber *)v32;

    *(&v7->super._wantsCertifiedDelivery + 1) = objc_msgSend_generateDeliveryReceipt(v4, v34, v35, v36);
    uint64_t v40 = objc_msgSend_deliveryStatusContext(v4, v37, v38, v39);
    failureReasonMessage = v7->_failureReasonMessage;
    v7->_failureReasonMessage = (NSString *)v40;

    uint64_t v45 = objc_msgSend_localURI(v4, v42, v43, v44);
    generatedDeliveryStatusContext = v7->_generatedDeliveryStatusContext;
    v7->_generatedDeliveryStatusContext = (NSDictionary *)v45;

    uint64_t v50 = objc_msgSend_remoteURI(v4, v47, v48, v49);
    localURI = v7->_localURI;
    v7->_localURI = (NSString *)v50;

    uint64_t v55 = objc_msgSend_queryHash(v4, v52, v53, v54);
    remoteURI = v7->_remoteURI;
    v7->_remoteURI = (NSString *)v55;

    queryHash = v7->_queryHash;
    v7->_queryHash = 0;

    encryptedData = v7->_encryptedData;
    v7->_encryptedData = 0;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v68.receiver = self;
  v68.super_class = (Class)IDSCertifiedDeliveryReceiptMessage;
  id v4 = [(IDSMessage *)&v68 copyWithZone:a3];
  double v8 = objc_msgSend_copy(self->_originalGUID, v5, v6, v7);
  objc_msgSend_setSenderToken_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_copy(self->_senderToken, v11, v12, v13);
  objc_msgSend_setCertifiedDeliveryRTS_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_setCertifiedDeliveryVersion_(v4, v17, (uint64_t)self->_certifiedDeliveryRTS, v18);
  uint64_t v22 = objc_msgSend_copy(*(void **)&self->_generateDeliveryReceipt, v19, v20, v21);
  objc_msgSend_setOriginalGUID_(v4, v23, (uint64_t)v22, v24);

  objc_msgSend_setFailureReason_(v4, v25, self->_certifiedDeliveryVersion, v26);
  uint64_t v30 = objc_msgSend_copy(self->_failureReason, v27, v28, v29);
  objc_msgSend_setFailureReasonMessage_(v4, v31, (uint64_t)v30, v32);

  objc_msgSend_setGenerateDeliveryReceipt_(v4, v33, *((unsigned __int8 *)&self->super._wantsCertifiedDelivery + 1), v34);
  objc_msgSend_setGeneratedDeliveryStatusContext_(v4, v35, (uint64_t)self->_failureReasonMessage, v36);
  uint64_t v40 = objc_msgSend_copy(self->_generatedDeliveryStatusContext, v37, v38, v39);
  objc_msgSend_setLocalURI_(v4, v41, (uint64_t)v40, v42);

  v46 = objc_msgSend_copy(self->_localURI, v43, v44, v45);
  objc_msgSend_setRemoteURI_(v4, v47, (uint64_t)v46, v48);

  v52 = objc_msgSend_copy(self->_remoteURI, v49, v50, v51);
  objc_msgSend_setQueryHash_(v4, v53, (uint64_t)v52, v54);

  v58 = objc_msgSend_copy(self->_queryHash, v55, v56, v57);
  objc_msgSend_setEncryptedData_(v4, v59, (uint64_t)v58, v60);

  v64 = objc_msgSend_copy(self->_encryptedData, v61, v62, v63);
  objc_msgSend_setEncryptionType_(v4, v65, (uint64_t)v64, v66);

  return v4;
}

- (int64_t)command
{
  return 109;
}

- (BOOL)wantsResponse
{
  return 0;
}

- (int64_t)responseCommand
{
  return 109;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend_addObject_(v2, v3, @"U", v4);
  objc_msgSend_addObject_(v2, v5, @"cdr", v6);
  objc_msgSend_addObject_(v2, v7, @"cdv", v8);
  return v2;
}

- (id)messageBody
{
  v32.receiver = self;
  v32.super_class = (Class)IDSCertifiedDeliveryReceiptMessage;
  v3 = [(IDSMessage *)&v32 messageBody];
  double v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  IDSGetUUIDData(*(void **)&self->_generateDeliveryReceipt);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CFDictionarySetValue(v7, @"U", v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80520();
  }

  uint64_t v9 = self->_senderToken;
  if (v9)
  {
    CFDictionarySetValue(v7, @"cdr", v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80498();
  }

  originalGUID = self->_originalGUID;
  if (originalGUID) {
    CFDictionarySetValue(v7, @"t", originalGUID);
  }
  double v13 = objc_msgSend_numberWithInteger_(NSNumber, v10, (uint64_t)self->_certifiedDeliveryRTS, v11);
  if (v13)
  {
    CFDictionarySetValue(v7, @"cdv", v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB80410();
  }

  certifiedDeliveryVersion = (const void *)self->_certifiedDeliveryVersion;
  if (certifiedDeliveryVersion) {
    CFDictionarySetValue(v7, @"fR", certifiedDeliveryVersion);
  }
  failureReason = self->_failureReason;
  if (failureReason) {
    CFDictionarySetValue(v7, @"fRM", failureReason);
  }
  if (*(&self->super._wantsCertifiedDelivery + 1))
  {
    double v18 = objc_msgSend_numberWithBool_(NSNumber, v14, 1, v15);
    if (v18)
    {
      CFDictionarySetValue(v7, @"gd", v18);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB80388();
    }

    failureReasonMessage = self->_failureReasonMessage;
    if (failureReasonMessage) {
      CFDictionarySetValue(v7, @"Dc", failureReasonMessage);
    }
    uint64_t v20 = self->_generatedDeliveryStatusContext;
    if (v20)
    {
      CFDictionarySetValue(v7, @"sP", v20);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB80300();
    }

    double v21 = self->_localURI;
    if (v21)
    {
      CFDictionarySetValue(v7, @"tP", v21);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB80278();
    }

    remoteURI = self->_remoteURI;
    if (remoteURI) {
      CFDictionarySetValue(v7, @"qH", remoteURI);
    }
    if (_os_feature_enabled_impl())
    {
      double v26 = objc_msgSend_encryptedData(self, v23, v24, v25);
      if (v26) {
        CFDictionarySetValue(v7, @"P", v26);
      }

      uint64_t v30 = objc_msgSend_encryptionType(self, v27, v28, v29);
      if (v30) {
        CFDictionarySetValue(v7, @"E", v30);
      }
    }
  }

  return v7;
}

- (NSString)originalGUID
{
  return *(NSString **)&self->_generateDeliveryReceipt;
}

- (void)setOriginalGUID:(id)a3
{
}

- (NSData)senderToken
{
  return (NSData *)self->_originalGUID;
}

- (void)setSenderToken:(id)a3
{
}

- (NSData)certifiedDeliveryRTS
{
  return self->_senderToken;
}

- (void)setCertifiedDeliveryRTS:(id)a3
{
}

- (int64_t)certifiedDeliveryVersion
{
  return (int64_t)self->_certifiedDeliveryRTS;
}

- (void)setCertifiedDeliveryVersion:(int64_t)a3
{
  self->_certifiedDeliveryRTS = (NSData *)a3;
}

- (NSNumber)failureReason
{
  return (NSNumber *)self->_certifiedDeliveryVersion;
}

- (void)setFailureReason:(id)a3
{
}

- (NSString)failureReasonMessage
{
  return (NSString *)&self->_failureReason->super.super.isa;
}

- (void)setFailureReasonMessage:(id)a3
{
}

- (BOOL)generateDeliveryReceipt
{
  return *(&self->super._wantsCertifiedDelivery + 1);
}

- (void)setGenerateDeliveryReceipt:(BOOL)a3
{
  *(&self->super._wantsCertifiedDelivery + 1) = a3;
}

- (NSDictionary)generatedDeliveryStatusContext
{
  return (NSDictionary *)self->_failureReasonMessage;
}

- (void)setGeneratedDeliveryStatusContext:(id)a3
{
}

- (NSString)localURI
{
  return (NSString *)&self->_generatedDeliveryStatusContext->super.isa;
}

- (void)setLocalURI:(id)a3
{
}

- (NSString)remoteURI
{
  return self->_localURI;
}

- (void)setRemoteURI:(id)a3
{
}

- (NSData)queryHash
{
  return (NSData *)self->_remoteURI;
}

- (void)setQueryHash:(id)a3
{
}

- (NSData)encryptedData
{
  return self->_queryHash;
}

- (void)setEncryptedData:(id)a3
{
}

- (NSString)encryptionType
{
  return (NSString *)&self->_encryptedData->super.isa;
}

- (void)setEncryptionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_queryHash, 0);
  objc_storeStrong((id *)&self->_remoteURI, 0);
  objc_storeStrong((id *)&self->_localURI, 0);
  objc_storeStrong((id *)&self->_generatedDeliveryStatusContext, 0);
  objc_storeStrong((id *)&self->_failureReasonMessage, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_certifiedDeliveryVersion, 0);
  objc_storeStrong((id *)&self->_senderToken, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
  objc_storeStrong((id *)&self->_generateDeliveryReceipt, 0);
}

@end