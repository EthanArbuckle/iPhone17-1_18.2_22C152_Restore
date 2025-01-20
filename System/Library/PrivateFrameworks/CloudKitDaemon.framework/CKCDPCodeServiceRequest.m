@interface CKCDPCodeServiceRequest
+ (Class)clientConfigType;
- (BOOL)hasAccountConfig;
- (BOOL)hasAssetAuthorizeGetRequestOptions;
- (BOOL)hasAttestationRequest;
- (BOOL)hasAuthInformation;
- (BOOL)hasDataProtection;
- (BOOL)hasFunctionName;
- (BOOL)hasProtectedCloudComputeMetadata;
- (BOOL)hasRequestContext;
- (BOOL)hasSerializationFormat;
- (BOOL)hasSerializedParameters;
- (BOOL)hasServiceName;
- (BOOL)hasTrustedTargetCryptoMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCDPCodeServiceRequestAccountConfig)accountConfig;
- (CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions)assetAuthorizeGetRequestOptions;
- (CKCDPCodeServiceRequestAttestationRequest)attestationRequest;
- (CKCDPCodeServiceRequestAuthInformation)authInformation;
- (CKCDPCodeServiceRequestProtectedCloudComputeMetadata)protectedCloudComputeMetadata;
- (CKCDPCodeServiceRequestRequestContext)requestContext;
- (CKCDPTrustedTargetCryptoMetadata)trustedTargetCryptoMetadata;
- (Class)responseClass;
- (NSData)serializedParameters;
- (NSMutableArray)clientConfigs;
- (NSString)functionName;
- (NSString)serviceName;
- (id)clientConfigAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataProtectionAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serializationFormatAsString:(int)a3;
- (int)StringAsDataProtection:(id)a3;
- (int)StringAsSerializationFormat:(id)a3;
- (int)dataProtection;
- (int)serializationFormat;
- (unint64_t)clientConfigsCount;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)addClientConfig:(id)a3;
- (void)clearClientConfigs;
- (void)clearOneofValuesForDataProtection;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountConfig:(id)a3;
- (void)setAssetAuthorizeGetRequestOptions:(id)a3;
- (void)setAttestationRequest:(id)a3;
- (void)setAuthInformation:(id)a3;
- (void)setClientConfigs:(id)a3;
- (void)setDataProtection:(int)a3;
- (void)setFunctionName:(id)a3;
- (void)setHasDataProtection:(BOOL)a3;
- (void)setHasSerializationFormat:(BOOL)a3;
- (void)setProtectedCloudComputeMetadata:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setSerializationFormat:(int)a3;
- (void)setSerializedParameters:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setTrustedTargetCryptoMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequest

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasFunctionName
{
  return self->_functionName != 0;
}

- (BOOL)hasSerializedParameters
{
  return self->_serializedParameters != 0;
}

- (int)serializationFormat
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_serializationFormat;
  }
  else {
    return 1;
  }
}

- (void)setSerializationFormat:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_serializationFormat = a3;
}

- (void)setHasSerializationFormat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSerializationFormat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)serializationFormatAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"PROTO";
  }
  else if (a3 == 2)
  {
    v4 = @"JSON";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsSerializationFormat:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"PROTO") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"JSON")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (void)clearClientConfigs
{
  objc_msgSend_removeAllObjects(self->_clientConfigs, a2, v2);
}

- (void)addClientConfig:(id)a3
{
  v4 = (const char *)a3;
  clientConfigs = self->_clientConfigs;
  v8 = (char *)v4;
  if (!clientConfigs)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clientConfigs;
    self->_clientConfigs = v6;

    v4 = v8;
    clientConfigs = self->_clientConfigs;
  }
  objc_msgSend_addObject_(clientConfigs, v4, (uint64_t)v4);
}

- (unint64_t)clientConfigsCount
{
  return objc_msgSend_count(self->_clientConfigs, a2, v2);
}

- (id)clientConfigAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_clientConfigs, a2, a3);
}

+ (Class)clientConfigType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccountConfig
{
  return self->_accountConfig != 0;
}

- (BOOL)hasRequestContext
{
  return self->_requestContext != 0;
}

- (BOOL)hasAssetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions != 0;
}

- (BOOL)hasAttestationRequest
{
  return self->_attestationRequest != 0;
}

- (BOOL)hasAuthInformation
{
  return self->_authInformation != 0;
}

- (BOOL)hasProtectedCloudComputeMetadata
{
  return self->_protectedCloudComputeMetadata != 0;
}

- (void)setProtectedCloudComputeMetadata:(id)a3
{
  v4 = (CKCDPCodeServiceRequestProtectedCloudComputeMetadata *)a3;
  objc_msgSend_clearOneofValuesForDataProtection(self, v5, v6);
  *(unsigned char *)&self->_has |= 1u;
  self->_dataProtection = 1;
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  self->_protectedCloudComputeMetadata = v4;
}

- (BOOL)hasTrustedTargetCryptoMetadata
{
  return self->_trustedTargetCryptoMetadata != 0;
}

- (void)setTrustedTargetCryptoMetadata:(id)a3
{
  v4 = (CKCDPTrustedTargetCryptoMetadata *)a3;
  objc_msgSend_clearOneofValuesForDataProtection(self, v5, v6);
  *(unsigned char *)&self->_has |= 1u;
  self->_dataProtection = 2;
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  self->_trustedTargetCryptoMetadata = v4;
}

- (int)dataProtection
{
  if (*(unsigned char *)&self->_has) {
    return self->_dataProtection;
  }
  else {
    return 0;
  }
}

- (void)setDataProtection:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataProtection = a3;
}

- (void)setHasDataProtection:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataProtection
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)dataProtectionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E64F8938[a3];
  }
  return v3;
}

- (int)StringAsDataProtection:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"PBUNSET"))
  {
    int v6 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"protectedCloudComputeMetadata"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"trustedTargetCryptoMetadata"))
  {
    int v6 = 2;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForDataProtection
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_dataProtection = 0;
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  self->_protectedCloudComputeMetadata = 0;

  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  self->_trustedTargetCryptoMetadata = 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequest;
  v4 = [(CKCDPCodeServiceRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  serviceName = self->_serviceName;
  if (serviceName) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serviceName, @"serviceName");
  }
  functionName = self->_functionName;
  if (functionName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)functionName, @"functionName");
  }
  serializedParameters = self->_serializedParameters;
  if (serializedParameters) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)serializedParameters, @"serializedParameters");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int serializationFormat = self->_serializationFormat;
    if (serializationFormat == 1)
    {
      objc_super v11 = @"PROTO";
      objc_msgSend_setObject_forKey_(v6, v5, @"PROTO", @"serializationFormat");
    }
    else if (serializationFormat == 2)
    {
      objc_super v11 = @"JSON";
      objc_msgSend_setObject_forKey_(v6, v5, @"JSON", @"serializationFormat");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_serializationFormat);
      objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"serializationFormat");
    }
  }
  if (objc_msgSend_count(self->_clientConfigs, v5, (uint64_t)serializedParameters))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v18 = objc_msgSend_count(self->_clientConfigs, v16, v17);
    v20 = objc_msgSend_initWithCapacity_(v15, v19, v18);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v21 = self->_clientConfigs;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v56, v60, 16);
    if (v23)
    {
      uint64_t v26 = v23;
      uint64_t v27 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v57 != v27) {
            objc_enumerationMutation(v21);
          }
          v29 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v56 + 1) + 8 * i), v24, v25);
          objc_msgSend_addObject_(v20, v30, (uint64_t)v29);
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v56, v60, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v20, @"clientConfig");
  }
  accountConfig = self->_accountConfig;
  if (accountConfig)
  {
    v33 = objc_msgSend_dictionaryRepresentation(accountConfig, v13, v14);
    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v33, @"accountConfig");
  }
  requestContext = self->_requestContext;
  if (requestContext)
  {
    v36 = objc_msgSend_dictionaryRepresentation(requestContext, v13, v14);
    objc_msgSend_setObject_forKey_(v6, v37, (uint64_t)v36, @"requestContext");
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions)
  {
    v39 = objc_msgSend_dictionaryRepresentation(assetAuthorizeGetRequestOptions, v13, v14);
    objc_msgSend_setObject_forKey_(v6, v40, (uint64_t)v39, @"assetAuthorizeGetRequestOptions");
  }
  attestationRequest = self->_attestationRequest;
  if (attestationRequest)
  {
    v42 = objc_msgSend_dictionaryRepresentation(attestationRequest, v13, v14);
    objc_msgSend_setObject_forKey_(v6, v43, (uint64_t)v42, @"attestationRequest");
  }
  authInformation = self->_authInformation;
  if (authInformation)
  {
    v45 = objc_msgSend_dictionaryRepresentation(authInformation, v13, v14);
    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v45, @"authInformation");
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  if (protectedCloudComputeMetadata)
  {
    v48 = objc_msgSend_dictionaryRepresentation(protectedCloudComputeMetadata, v13, v14);
    objc_msgSend_setObject_forKey_(v6, v49, (uint64_t)v48, @"protectedCloudComputeMetadata");
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  if (trustedTargetCryptoMetadata)
  {
    v51 = objc_msgSend_dictionaryRepresentation(trustedTargetCryptoMetadata, v13, v14);
    objc_msgSend_setObject_forKey_(v6, v52, (uint64_t)v51, @"trustedTargetCryptoMetadata");
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t dataProtection = self->_dataProtection;
    if (dataProtection >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v13, @"(unknown: %i)", self->_dataProtection);
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v54 = off_1E64F8938[dataProtection];
    }
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v54, @"DataProtection");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      uint64_t v17 = v11 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      v19 = (const char *)(v11 >> 3);
      switch((v11 >> 3))
      {
        case 0u:
          unsigned int v20 = 0;
          do
          {
            uint64_t v21 = *v4;
            unint64_t v22 = *(void *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
              goto LABEL_63;
            }
            unint64_t v23 = v22 + 1;
            int v24 = *(char *)(*(void *)((char *)a3 + *v8) + v22);
            *(void *)((char *)a3 + v21) = v23;
            if ((v24 & 0x80000000) == 0) {
              break;
            }
          }
          while (v20++ <= 8);
          goto LABEL_63;
        case 4u:
          PBReaderReadString();
          uint64_t v27 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = 96;
          goto LABEL_31;
        case 5u:
          PBReaderReadString();
          uint64_t v27 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = 56;
          goto LABEL_31;
        case 6u:
          PBReaderReadData();
          uint64_t v27 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = 88;
LABEL_31:
          v29 = *(Class *)((char *)&self->super.super.super.isa + v28);
          *(Class *)((char *)&self->super.super.super.isa + v28) = v27;

          goto LABEL_63;
        case 8u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            uint64_t v33 = *v4;
            unint64_t v34 = *(void *)((char *)a3 + v33);
            if (v34 == -1 || v34 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v34);
              *(void *)((char *)a3 + v33) = v34 + 1;
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v15 = v31++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v32) = 0;
          }
LABEL_69:
          self->_int serializationFormat = v32;
          goto LABEL_63;
        case 9u:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestClientConfig);
          objc_msgSend_addClientConfig_(self, v37, (uint64_t)v36);
          if (!PBReaderPlaceMark() || (sub_1C5018444((uint64_t)v36, (uint64_t)a3) & 1) == 0) {
            goto LABEL_71;
          }
          goto LABEL_62;
        case 0xAu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAccountConfig);
          objc_storeStrong((id *)&self->_accountConfig, v36);
          if (!PBReaderPlaceMark() || (sub_1C4E24F08((uint64_t)v36, (uint64_t)a3) & 1) == 0) {
            goto LABEL_71;
          }
          goto LABEL_62;
        case 0xBu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestRequestContext);
          objc_storeStrong((id *)&self->_requestContext, v36);
          if (!PBReaderPlaceMark() || (sub_1C5036200((uint64_t)v36, (uint64_t)a3) & 1) == 0) {
            goto LABEL_71;
          }
          goto LABEL_62;
        case 0xCu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions);
          objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, v36);
          if (!PBReaderPlaceMark() || (sub_1C4F7B018((uint64_t)v36, (uint64_t)a3) & 1) == 0) {
            goto LABEL_71;
          }
          goto LABEL_62;
        case 0xDu:
          objc_msgSend_clearOneofValuesForDataProtection(self, v19, v17);
          *(unsigned char *)&self->_has |= 1u;
          self->_uint64_t dataProtection = 1;
          v36 = objc_alloc_init(CKCDPCodeServiceRequestProtectedCloudComputeMetadata);
          objc_storeStrong((id *)&self->_protectedCloudComputeMetadata, v36);
          if (!PBReaderPlaceMark() || (sub_1C4E18FF4(v36, (uint64_t)a3) & 1) == 0) {
            goto LABEL_71;
          }
          goto LABEL_62;
        case 0xFu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAttestationRequest);
          objc_storeStrong((id *)&self->_attestationRequest, v36);
          if (!PBReaderPlaceMark() || (sub_1C4E05624((uint64_t)v36, (uint64_t)a3) & 1) == 0) {
            goto LABEL_71;
          }
          goto LABEL_62;
        case 0x10u:
          objc_msgSend_clearOneofValuesForDataProtection(self, v19, v17);
          *(unsigned char *)&self->_has |= 1u;
          self->_uint64_t dataProtection = 2;
          v36 = objc_alloc_init(CKCDPTrustedTargetCryptoMetadata);
          objc_storeStrong((id *)&self->_trustedTargetCryptoMetadata, v36);
          if (!PBReaderPlaceMark() || (sub_1C4FFF4E0((uint64_t)v36, (uint64_t)a3) & 1) == 0) {
            goto LABEL_71;
          }
          goto LABEL_62;
        case 0x11u:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAuthInformation);
          objc_storeStrong((id *)&self->_authInformation, v36);
          if (!PBReaderPlaceMark() || (sub_1C4F02828((uint64_t)v36, (uint64_t)a3) & 1) == 0)
          {
LABEL_71:

            LOBYTE(v26) = 0;
            return v26;
          }
LABEL_62:
          PBReaderRecallMark();

LABEL_63:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_70;
          }
          break;
        default:
          int v26 = PBReaderSkipValueWithTag();
          if (!v26) {
            return v26;
          }
          goto LABEL_63;
      }
    }
  }
LABEL_70:
  LOBYTE(v26) = *((unsigned char *)a3 + *v6) == 0;
  return v26;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_serviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_functionName) {
    PBDataWriterWriteStringField();
  }
  if (self->_serializedParameters) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_clientConfigs;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_accountConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_requestContext) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_assetAuthorizeGetRequestOptions) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_protectedCloudComputeMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_attestationRequest) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_trustedTargetCryptoMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_authInformation) {
    PBDataWriterWriteSubmessage();
  }
}

- (unsigned)requestTypeCode
{
  return 85;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_dataProtection;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  serviceName = self->_serviceName;
  int v26 = v4;
  if (serviceName)
  {
    objc_msgSend_setServiceName_(v4, v5, (uint64_t)serviceName);
    id v4 = v26;
  }
  functionName = self->_functionName;
  if (functionName)
  {
    objc_msgSend_setFunctionName_(v26, v5, (uint64_t)functionName);
    id v4 = v26;
  }
  serializedParameters = self->_serializedParameters;
  if (serializedParameters)
  {
    objc_msgSend_setSerializedParameters_(v26, v5, (uint64_t)serializedParameters);
    id v4 = v26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[20] = self->_serializationFormat;
    *((unsigned char *)v4 + 112) |= 2u;
  }
  if (objc_msgSend_clientConfigsCount(self, v5, (uint64_t)serializedParameters))
  {
    objc_msgSend_clearClientConfigs(v26, v9, v10);
    uint64_t v13 = objc_msgSend_clientConfigsCount(self, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        int v16 = objc_msgSend_clientConfigAtIndex_(self, v9, i);
        objc_msgSend_addClientConfig_(v26, v17, (uint64_t)v16);
      }
    }
  }
  accountConfig = self->_accountConfig;
  if (accountConfig) {
    objc_msgSend_setAccountConfig_(v26, v9, (uint64_t)accountConfig);
  }
  requestContext = self->_requestContext;
  unsigned int v20 = v26;
  if (requestContext)
  {
    objc_msgSend_setRequestContext_(v26, v9, (uint64_t)requestContext);
    unsigned int v20 = v26;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions)
  {
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(v26, v9, (uint64_t)assetAuthorizeGetRequestOptions);
    unsigned int v20 = v26;
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  if (protectedCloudComputeMetadata)
  {
    objc_msgSend_setProtectedCloudComputeMetadata_(v26, v9, (uint64_t)protectedCloudComputeMetadata);
    unsigned int v20 = v26;
  }
  attestationRequest = self->_attestationRequest;
  if (attestationRequest)
  {
    objc_msgSend_setAttestationRequest_(v26, v9, (uint64_t)attestationRequest);
    unsigned int v20 = v26;
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  if (trustedTargetCryptoMetadata)
  {
    objc_msgSend_setTrustedTargetCryptoMetadata_(v26, v9, (uint64_t)trustedTargetCryptoMetadata);
    unsigned int v20 = v26;
  }
  authInformation = self->_authInformation;
  if (authInformation)
  {
    objc_msgSend_setAuthInformation_(v26, v9, (uint64_t)authInformation);
    unsigned int v20 = v26;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 48) = self->_dataProtection;
    *(unsigned char *)(v10 + 112) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_serviceName, v11, (uint64_t)a3);
  uint64_t v14 = *(void **)(v12 + 96);
  *(void *)(v12 + 96) = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_functionName, v15, (uint64_t)a3);
  uint64_t v17 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_serializedParameters, v18, (uint64_t)a3);
  unsigned int v20 = *(void **)(v12 + 88);
  *(void *)(v12 + 88) = v19;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v12 + 80) = self->_serializationFormat;
    *(unsigned char *)(v12 + 112) |= 2u;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v21 = self->_clientConfigs;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v52, v56, 16);
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v52 + 1) + 8 * i), v24, (uint64_t)a3, (void)v52);
        objc_msgSend_addClientConfig_((void *)v12, v29, (uint64_t)v28);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v52, v56, 16);
    }
    while (v25);
  }

  uint64_t v31 = objc_msgSend_copyWithZone_(self->_accountConfig, v30, (uint64_t)a3);
  uint64_t v32 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v31;

  uint64_t v34 = objc_msgSend_copyWithZone_(self->_requestContext, v33, (uint64_t)a3);
  char v35 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = v34;

  uint64_t v37 = objc_msgSend_copyWithZone_(self->_assetAuthorizeGetRequestOptions, v36, (uint64_t)a3);
  v38 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v37;

  uint64_t v40 = objc_msgSend_copyWithZone_(self->_protectedCloudComputeMetadata, v39, (uint64_t)a3);
  v41 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = v40;

  uint64_t v43 = objc_msgSend_copyWithZone_(self->_attestationRequest, v42, (uint64_t)a3);
  v44 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v43;

  uint64_t v46 = objc_msgSend_copyWithZone_(self->_trustedTargetCryptoMetadata, v45, (uint64_t)a3);
  v47 = *(void **)(v12 + 104);
  *(void *)(v12 + 104) = v46;

  uint64_t v49 = objc_msgSend_copyWithZone_(self->_authInformation, v48, (uint64_t)a3);
  v50 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v49;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[14] & 1) == 0 || self->_dataProtection != *((_DWORD *)v4 + 12)) {
      goto LABEL_34;
    }
  }
  else if (v4[14])
  {
LABEL_34:
    char isEqual = 0;
    goto LABEL_35;
  }
  serviceName = self->_serviceName;
  uint64_t v9 = v4[12];
  if ((unint64_t)serviceName | v9 && !objc_msgSend_isEqual_(serviceName, v7, v9)) {
    goto LABEL_34;
  }
  functionName = self->_functionName;
  uint64_t v11 = v4[7];
  if ((unint64_t)functionName | v11)
  {
    if (!objc_msgSend_isEqual_(functionName, v7, v11)) {
      goto LABEL_34;
    }
  }
  serializedParameters = self->_serializedParameters;
  uint64_t v13 = v4[11];
  if ((unint64_t)serializedParameters | v13)
  {
    if (!objc_msgSend_isEqual_(serializedParameters, v7, v13)) {
      goto LABEL_34;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[14] & 2) == 0 || self->_serializationFormat != *((_DWORD *)v4 + 20)) {
      goto LABEL_34;
    }
  }
  else if ((v4[14] & 2) != 0)
  {
    goto LABEL_34;
  }
  clientConfigs = self->_clientConfigs;
  uint64_t v15 = v4[5];
  if ((unint64_t)clientConfigs | v15 && !objc_msgSend_isEqual_(clientConfigs, v7, v15)) {
    goto LABEL_34;
  }
  accountConfig = self->_accountConfig;
  uint64_t v17 = v4[1];
  if ((unint64_t)accountConfig | v17)
  {
    if (!objc_msgSend_isEqual_(accountConfig, v7, v17)) {
      goto LABEL_34;
    }
  }
  requestContext = self->_requestContext;
  uint64_t v19 = v4[9];
  if ((unint64_t)requestContext | v19)
  {
    if (!objc_msgSend_isEqual_(requestContext, v7, v19)) {
      goto LABEL_34;
    }
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  uint64_t v21 = v4[2];
  if ((unint64_t)assetAuthorizeGetRequestOptions | v21)
  {
    if (!objc_msgSend_isEqual_(assetAuthorizeGetRequestOptions, v7, v21)) {
      goto LABEL_34;
    }
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  uint64_t v23 = v4[8];
  if ((unint64_t)protectedCloudComputeMetadata | v23)
  {
    if (!objc_msgSend_isEqual_(protectedCloudComputeMetadata, v7, v23)) {
      goto LABEL_34;
    }
  }
  attestationRequest = self->_attestationRequest;
  uint64_t v25 = v4[3];
  if ((unint64_t)attestationRequest | v25)
  {
    if (!objc_msgSend_isEqual_(attestationRequest, v7, v25)) {
      goto LABEL_34;
    }
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  uint64_t v27 = v4[13];
  if ((unint64_t)trustedTargetCryptoMetadata | v27)
  {
    if (!objc_msgSend_isEqual_(trustedTargetCryptoMetadata, v7, v27)) {
      goto LABEL_34;
    }
  }
  authInformation = self->_authInformation;
  uint64_t v29 = v4[4];
  if ((unint64_t)authInformation | v29) {
    char isEqual = objc_msgSend_isEqual_(authInformation, v7, v29);
  }
  else {
    char isEqual = 1;
  }
LABEL_35:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_dataProtection;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_serviceName, a2, v2);
  uint64_t v8 = objc_msgSend_hash(self->_functionName, v6, v7);
  uint64_t v11 = objc_msgSend_hash(self->_serializedParameters, v9, v10);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v14 = 2654435761 * self->_serializationFormat;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v5 ^ v4 ^ v8 ^ v11;
  uint64_t v16 = v14 ^ objc_msgSend_hash(self->_clientConfigs, v12, v13);
  uint64_t v19 = v15 ^ v16 ^ objc_msgSend_hash(self->_accountConfig, v17, v18);
  uint64_t v22 = objc_msgSend_hash(self->_requestContext, v20, v21);
  uint64_t v25 = v22 ^ objc_msgSend_hash(self->_assetAuthorizeGetRequestOptions, v23, v24);
  uint64_t v28 = v25 ^ objc_msgSend_hash(self->_protectedCloudComputeMetadata, v26, v27);
  uint64_t v31 = v19 ^ v28 ^ objc_msgSend_hash(self->_attestationRequest, v29, v30);
  uint64_t v34 = objc_msgSend_hash(self->_trustedTargetCryptoMetadata, v32, v33);
  return v31 ^ v34 ^ objc_msgSend_hash(self->_authInformation, v35, v36);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = v4;
  if (*((unsigned char *)v4 + 112))
  {
    self->_uint64_t dataProtection = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = *((void *)v4 + 12);
  if (v7) {
    objc_msgSend_setServiceName_(self, v5, v7);
  }
  uint64_t v8 = *((void *)v6 + 7);
  if (v8) {
    objc_msgSend_setFunctionName_(self, v5, v8);
  }
  uint64_t v9 = *((void *)v6 + 11);
  if (v9) {
    objc_msgSend_setSerializedParameters_(self, v5, v9);
  }
  if ((*((unsigned char *)v6 + 112) & 2) != 0)
  {
    self->_int serializationFormat = *((_DWORD *)v6 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = *((id *)v6 + 5);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v32, v36, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_addClientConfig_(self, v13, *(void *)(*((void *)&v32 + 1) + 8 * i), (void)v32);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v32, v36, 16);
    }
    while (v14);
  }

  accountConfig = self->_accountConfig;
  uint64_t v19 = *((void *)v6 + 1);
  if (accountConfig)
  {
    if (v19) {
      objc_msgSend_mergeFrom_(accountConfig, v17, v19);
    }
  }
  else if (v19)
  {
    objc_msgSend_setAccountConfig_(self, v17, v19);
  }
  requestContext = self->_requestContext;
  uint64_t v21 = *((void *)v6 + 9);
  if (requestContext)
  {
    if (v21) {
      objc_msgSend_mergeFrom_(requestContext, v17, v21);
    }
  }
  else if (v21)
  {
    objc_msgSend_setRequestContext_(self, v17, v21);
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  uint64_t v23 = *((void *)v6 + 2);
  if (assetAuthorizeGetRequestOptions)
  {
    if (v23) {
      objc_msgSend_mergeFrom_(assetAuthorizeGetRequestOptions, v17, v23);
    }
  }
  else if (v23)
  {
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(self, v17, v23);
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  uint64_t v25 = *((void *)v6 + 8);
  if (protectedCloudComputeMetadata)
  {
    if (v25) {
      objc_msgSend_mergeFrom_(protectedCloudComputeMetadata, v17, v25);
    }
  }
  else if (v25)
  {
    objc_msgSend_setProtectedCloudComputeMetadata_(self, v17, v25);
  }
  attestationRequest = self->_attestationRequest;
  uint64_t v27 = *((void *)v6 + 3);
  if (attestationRequest)
  {
    if (v27) {
      objc_msgSend_mergeFrom_(attestationRequest, v17, v27);
    }
  }
  else if (v27)
  {
    objc_msgSend_setAttestationRequest_(self, v17, v27);
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  uint64_t v29 = *((void *)v6 + 13);
  if (trustedTargetCryptoMetadata)
  {
    if (v29) {
      objc_msgSend_mergeFrom_(trustedTargetCryptoMetadata, v17, v29);
    }
  }
  else if (v29)
  {
    objc_msgSend_setTrustedTargetCryptoMetadata_(self, v17, v29);
  }
  authInformation = self->_authInformation;
  uint64_t v31 = *((void *)v6 + 4);
  if (authInformation)
  {
    if (v31) {
      objc_msgSend_mergeFrom_(authInformation, v17, v31);
    }
  }
  else if (v31)
  {
    objc_msgSend_setAuthInformation_(self, v17, v31);
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (NSData)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setSerializedParameters:(id)a3
{
}

- (NSMutableArray)clientConfigs
{
  return self->_clientConfigs;
}

- (void)setClientConfigs:(id)a3
{
}

- (CKCDPCodeServiceRequestAccountConfig)accountConfig
{
  return self->_accountConfig;
}

- (void)setAccountConfig:(id)a3
{
}

- (CKCDPCodeServiceRequestRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
}

- (CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions)assetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions;
}

- (void)setAssetAuthorizeGetRequestOptions:(id)a3
{
}

- (CKCDPCodeServiceRequestAttestationRequest)attestationRequest
{
  return self->_attestationRequest;
}

- (void)setAttestationRequest:(id)a3
{
}

- (CKCDPCodeServiceRequestAuthInformation)authInformation
{
  return self->_authInformation;
}

- (void)setAuthInformation:(id)a3
{
}

- (CKCDPCodeServiceRequestProtectedCloudComputeMetadata)protectedCloudComputeMetadata
{
  return self->_protectedCloudComputeMetadata;
}

- (CKCDPTrustedTargetCryptoMetadata)trustedTargetCryptoMetadata
{
  return self->_trustedTargetCryptoMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedTargetCryptoMetadata, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_protectedCloudComputeMetadata, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_clientConfigs, 0);
  objc_storeStrong((id *)&self->_authInformation, 0);
  objc_storeStrong((id *)&self->_attestationRequest, 0);
  objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, 0);
  objc_storeStrong((id *)&self->_accountConfig, 0);
}

@end