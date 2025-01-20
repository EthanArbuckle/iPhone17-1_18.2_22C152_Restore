@interface CKDPAsset
- (BOOL)hasAssetAuthorizationResponseUUID;
- (BOOL)hasClearAssetKey;
- (BOOL)hasConstructedAssetDownloadEstimatedSize;
- (BOOL)hasConstructedAssetDownloadParameters;
- (BOOL)hasConstructedAssetDownloadURL;
- (BOOL)hasConstructedAssetDownloadURLExpiration;
- (BOOL)hasContentBaseURL;
- (BOOL)hasDownloadBaseURL;
- (BOOL)hasDownloadRequest;
- (BOOL)hasDownloadToken;
- (BOOL)hasDownloadTokenExpiration;
- (BOOL)hasDownloadURLExpiration;
- (BOOL)hasOwner;
- (BOOL)hasProtectionInfo;
- (BOOL)hasRecordId;
- (BOOL)hasReferenceSignature;
- (BOOL)hasRequestor;
- (BOOL)hasSignature;
- (BOOL)hasSize;
- (BOOL)hasUploadReceipt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPProtectionInfo)protectionInfo;
- (CKDPRecordIdentifier)recordId;
- (NSData)clearAssetKey;
- (NSData)constructedAssetDownloadParameters;
- (NSData)downloadRequest;
- (NSData)referenceSignature;
- (NSData)signature;
- (NSString)assetAuthorizationResponseUUID;
- (NSString)constructedAssetDownloadURL;
- (NSString)contentBaseURL;
- (NSString)downloadBaseURL;
- (NSString)downloadToken;
- (NSString)owner;
- (NSString)requestor;
- (NSString)uploadReceipt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)constructedAssetDownloadEstimatedSize;
- (int64_t)constructedAssetDownloadURLExpiration;
- (int64_t)downloadTokenExpiration;
- (int64_t)downloadURLExpiration;
- (int64_t)size;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetAuthorizationResponseUUID:(id)a3;
- (void)setClearAssetKey:(id)a3;
- (void)setConstructedAssetDownloadEstimatedSize:(int64_t)a3;
- (void)setConstructedAssetDownloadParameters:(id)a3;
- (void)setConstructedAssetDownloadURL:(id)a3;
- (void)setConstructedAssetDownloadURLExpiration:(int64_t)a3;
- (void)setContentBaseURL:(id)a3;
- (void)setDownloadBaseURL:(id)a3;
- (void)setDownloadRequest:(id)a3;
- (void)setDownloadToken:(id)a3;
- (void)setDownloadTokenExpiration:(int64_t)a3;
- (void)setDownloadURLExpiration:(int64_t)a3;
- (void)setHasConstructedAssetDownloadEstimatedSize:(BOOL)a3;
- (void)setHasConstructedAssetDownloadURLExpiration:(BOOL)a3;
- (void)setHasDownloadTokenExpiration:(BOOL)a3;
- (void)setHasDownloadURLExpiration:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setProtectionInfo:(id)a3;
- (void)setRecordId:(id)a3;
- (void)setReferenceSignature:(id)a3;
- (void)setRequestor:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setUploadReceipt:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAsset

- (BOOL)hasOwner
{
  return self->_owner != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSize
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasDownloadToken
{
  return self->_downloadToken != 0;
}

- (BOOL)hasDownloadRequest
{
  return self->_downloadRequest != 0;
}

- (BOOL)hasContentBaseURL
{
  return self->_contentBaseURL != 0;
}

- (BOOL)hasRequestor
{
  return self->_requestor != 0;
}

- (BOOL)hasRecordId
{
  return self->_recordId != 0;
}

- (BOOL)hasUploadReceipt
{
  return self->_uploadReceipt != 0;
}

- (BOOL)hasDownloadBaseURL
{
  return self->_downloadBaseURL != 0;
}

- (void)setDownloadURLExpiration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_downloadURLExpiration = a3;
}

- (void)setHasDownloadURLExpiration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDownloadURLExpiration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasReferenceSignature
{
  return self->_referenceSignature != 0;
}

- (void)setDownloadTokenExpiration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_downloadTokenExpiration = a3;
}

- (void)setHasDownloadTokenExpiration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDownloadTokenExpiration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasClearAssetKey
{
  return self->_clearAssetKey != 0;
}

- (BOOL)hasAssetAuthorizationResponseUUID
{
  return self->_assetAuthorizationResponseUUID != 0;
}

- (BOOL)hasConstructedAssetDownloadURL
{
  return self->_constructedAssetDownloadURL != 0;
}

- (void)setConstructedAssetDownloadURLExpiration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_constructedAssetDownloadURLExpiration = a3;
}

- (void)setHasConstructedAssetDownloadURLExpiration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConstructedAssetDownloadURLExpiration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConstructedAssetDownloadEstimatedSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_constructedAssetDownloadEstimatedSize = a3;
}

- (void)setHasConstructedAssetDownloadEstimatedSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConstructedAssetDownloadEstimatedSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasConstructedAssetDownloadParameters
{
  return self->_constructedAssetDownloadParameters != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAsset;
  v4 = [(CKDPAsset *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  owner = self->_owner;
  if (owner) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)owner, @"owner");
  }
  signature = self->_signature;
  if (signature) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)signature, @"signature");
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v9 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_size);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"size");
  }
  downloadToken = self->_downloadToken;
  if (downloadToken) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)downloadToken, @"downloadToken");
  }
  downloadRequest = self->_downloadRequest;
  if (downloadRequest) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)downloadRequest, @"downloadRequest");
  }
  contentBaseURL = self->_contentBaseURL;
  if (contentBaseURL) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)contentBaseURL, @"contentBaseURL");
  }
  requestor = self->_requestor;
  if (requestor) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)requestor, @"requestor");
  }
  recordId = self->_recordId;
  if (recordId)
  {
    v16 = objc_msgSend_dictionaryRepresentation(recordId, v5, (uint64_t)requestor);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"recordId");
  }
  uploadReceipt = self->_uploadReceipt;
  if (uploadReceipt) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)uploadReceipt, @"uploadReceipt");
  }
  downloadBaseURL = self->_downloadBaseURL;
  if (downloadBaseURL) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)downloadBaseURL, @"downloadBaseURL");
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v20 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_downloadURLExpiration);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"downloadURLExpiration");
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    v23 = objc_msgSend_dictionaryRepresentation(protectionInfo, v5, (uint64_t)downloadBaseURL);
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, @"protectionInfo");
  }
  referenceSignature = self->_referenceSignature;
  if (referenceSignature) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)referenceSignature, @"referenceSignature");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v26 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_downloadTokenExpiration);
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, @"downloadTokenExpiration");
  }
  clearAssetKey = self->_clearAssetKey;
  if (clearAssetKey) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clearAssetKey, @"clearAssetKey");
  }
  assetAuthorizationResponseUUID = self->_assetAuthorizationResponseUUID;
  if (assetAuthorizationResponseUUID) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)assetAuthorizationResponseUUID, @"assetAuthorizationResponseUUID");
  }
  constructedAssetDownloadURL = self->_constructedAssetDownloadURL;
  if (constructedAssetDownloadURL) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)constructedAssetDownloadURL, @"constructedAssetDownloadURL");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v32 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_constructedAssetDownloadURLExpiration);
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, @"constructedAssetDownloadURLExpiration");

    char has = (char)self->_has;
  }
  if (has)
  {
    v34 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_constructedAssetDownloadEstimatedSize);
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, @"constructedAssetDownloadEstimatedSize");
  }
  constructedAssetDownloadParameters = self->_constructedAssetDownloadParameters;
  if (constructedAssetDownloadParameters) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)constructedAssetDownloadParameters, @"constructedAssetDownloadParameters");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_owner)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_downloadToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_downloadRequest)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_contentBaseURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_requestor)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_recordId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_uploadReceipt)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_downloadBaseURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_referenceSignature)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_clearAssetKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_assetAuthorizationResponseUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_constructedAssetDownloadURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_constructedAssetDownloadParameters)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  owner = self->_owner;
  id v22 = v4;
  if (owner)
  {
    objc_msgSend_setOwner_(v4, v5, (uint64_t)owner);
    id v4 = v22;
  }
  signature = self->_signature;
  if (signature)
  {
    objc_msgSend_setSignature_(v22, v5, (uint64_t)signature);
    id v4 = v22;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((void *)v4 + 5) = self->_size;
    *((unsigned char *)v4 + 168) |= 0x10u;
  }
  downloadToken = self->_downloadToken;
  if (downloadToken)
  {
    objc_msgSend_setDownloadToken_(v22, v5, (uint64_t)downloadToken);
    id v4 = v22;
  }
  downloadRequest = self->_downloadRequest;
  if (downloadRequest)
  {
    objc_msgSend_setDownloadRequest_(v22, v5, (uint64_t)downloadRequest);
    id v4 = v22;
  }
  contentBaseURL = self->_contentBaseURL;
  if (contentBaseURL)
  {
    objc_msgSend_setContentBaseURL_(v22, v5, (uint64_t)contentBaseURL);
    id v4 = v22;
  }
  requestor = self->_requestor;
  if (requestor)
  {
    objc_msgSend_setRequestor_(v22, v5, (uint64_t)requestor);
    id v4 = v22;
  }
  recordId = self->_recordId;
  if (recordId)
  {
    objc_msgSend_setRecordId_(v22, v5, (uint64_t)recordId);
    id v4 = v22;
  }
  uploadReceipt = self->_uploadReceipt;
  if (uploadReceipt)
  {
    objc_msgSend_setUploadReceipt_(v22, v5, (uint64_t)uploadReceipt);
    id v4 = v22;
  }
  downloadBaseURL = self->_downloadBaseURL;
  if (downloadBaseURL)
  {
    objc_msgSend_setDownloadBaseURL_(v22, v5, (uint64_t)downloadBaseURL);
    id v4 = v22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_downloadURLExpiration;
    *((unsigned char *)v4 + 168) |= 8u;
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v22, v5, (uint64_t)protectionInfo);
    id v4 = v22;
  }
  referenceSignature = self->_referenceSignature;
  if (referenceSignature)
  {
    objc_msgSend_setReferenceSignature_(v22, v5, (uint64_t)referenceSignature);
    id v4 = v22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_downloadTokenExpiration;
    *((unsigned char *)v4 + 168) |= 4u;
  }
  clearAssetKey = self->_clearAssetKey;
  if (clearAssetKey)
  {
    objc_msgSend_setClearAssetKey_(v22, v5, (uint64_t)clearAssetKey);
    id v4 = v22;
  }
  assetAuthorizationResponseUUID = self->_assetAuthorizationResponseUUID;
  if (assetAuthorizationResponseUUID)
  {
    objc_msgSend_setAssetAuthorizationResponseUUID_(v22, v5, (uint64_t)assetAuthorizationResponseUUID);
    id v4 = v22;
  }
  constructedAssetDownloadURL = self->_constructedAssetDownloadURL;
  if (constructedAssetDownloadURL)
  {
    objc_msgSend_setConstructedAssetDownloadURL_(v22, v5, (uint64_t)constructedAssetDownloadURL);
    id v4 = v22;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_constructedAssetDownloadURLExpiration;
    *((unsigned char *)v4 + 168) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_constructedAssetDownloadEstimatedSize;
    *((unsigned char *)v4 + 168) |= 1u;
  }
  constructedAssetDownloadParameters = self->_constructedAssetDownloadParameters;
  if (constructedAssetDownloadParameters)
  {
    objc_msgSend_setConstructedAssetDownloadParameters_(v22, v5, (uint64_t)constructedAssetDownloadParameters);
    id v4 = v22;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_owner, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 112);
  *(void *)(v10 + 112) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_signature, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 152);
  *(void *)(v10 + 152) = v15;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v10 + 40) = self->_size;
    *(unsigned char *)(v10 + 168) |= 0x10u;
  }
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_downloadToken, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 104);
  *(void *)(v10 + 104) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_downloadRequest, v20, (uint64_t)a3);
  id v22 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_contentBaseURL, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 80);
  *(void *)(v10 + 80) = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_requestor, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 144);
  *(void *)(v10 + 144) = v27;

  uint64_t v30 = objc_msgSend_copyWithZone_(self->_recordId, v29, (uint64_t)a3);
  v31 = *(void **)(v10 + 128);
  *(void *)(v10 + 128) = v30;

  uint64_t v33 = objc_msgSend_copyWithZone_(self->_uploadReceipt, v32, (uint64_t)a3);
  v34 = *(void **)(v10 + 160);
  *(void *)(v10 + 160) = v33;

  uint64_t v36 = objc_msgSend_copyWithZone_(self->_downloadBaseURL, v35, (uint64_t)a3);
  v37 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v36;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v10 + 32) = self->_downloadURLExpiration;
    *(unsigned char *)(v10 + 168) |= 8u;
  }
  uint64_t v39 = objc_msgSend_copyWithZone_(self->_protectionInfo, v38, (uint64_t)a3);
  v40 = *(void **)(v10 + 120);
  *(void *)(v10 + 120) = v39;

  uint64_t v42 = objc_msgSend_copyWithZone_(self->_referenceSignature, v41, (uint64_t)a3);
  v43 = *(void **)(v10 + 136);
  *(void *)(v10 + 136) = v42;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v10 + 24) = self->_downloadTokenExpiration;
    *(unsigned char *)(v10 + 168) |= 4u;
  }
  uint64_t v45 = objc_msgSend_copyWithZone_(self->_clearAssetKey, v44, (uint64_t)a3);
  v46 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v45;

  uint64_t v48 = objc_msgSend_copyWithZone_(self->_assetAuthorizationResponseUUID, v47, (uint64_t)a3);
  v49 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v48;

  uint64_t v51 = objc_msgSend_copyWithZone_(self->_constructedAssetDownloadURL, v50, (uint64_t)a3);
  v52 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = v51;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v10 + 16) = self->_constructedAssetDownloadURLExpiration;
    *(unsigned char *)(v10 + 168) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v10 + 8) = self->_constructedAssetDownloadEstimatedSize;
    *(unsigned char *)(v10 + 168) |= 1u;
  }
  uint64_t v55 = objc_msgSend_copyWithZone_(self->_constructedAssetDownloadParameters, v53, (uint64_t)a3);
  v56 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v55;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_57;
  }
  owner = self->_owner;
  uint64_t v9 = v4[14];
  if ((unint64_t)owner | v9)
  {
    if (!objc_msgSend_isEqual_(owner, v7, v9)) {
      goto LABEL_57;
    }
  }
  signature = self->_signature;
  uint64_t v11 = v4[19];
  if ((unint64_t)signature | v11)
  {
    if (!objc_msgSend_isEqual_(signature, v7, v11)) {
      goto LABEL_57;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[21] & 0x10) == 0 || self->_size != v4[5]) {
      goto LABEL_57;
    }
  }
  else if ((v4[21] & 0x10) != 0)
  {
LABEL_57:
    char isEqual = 0;
    goto LABEL_58;
  }
  downloadToken = self->_downloadToken;
  uint64_t v13 = v4[13];
  if ((unint64_t)downloadToken | v13 && !objc_msgSend_isEqual_(downloadToken, v7, v13)) {
    goto LABEL_57;
  }
  downloadRequest = self->_downloadRequest;
  uint64_t v15 = v4[12];
  if ((unint64_t)downloadRequest | v15)
  {
    if (!objc_msgSend_isEqual_(downloadRequest, v7, v15)) {
      goto LABEL_57;
    }
  }
  contentBaseURL = self->_contentBaseURL;
  uint64_t v17 = v4[10];
  if ((unint64_t)contentBaseURL | v17)
  {
    if (!objc_msgSend_isEqual_(contentBaseURL, v7, v17)) {
      goto LABEL_57;
    }
  }
  requestor = self->_requestor;
  uint64_t v19 = v4[18];
  if ((unint64_t)requestor | v19)
  {
    if (!objc_msgSend_isEqual_(requestor, v7, v19)) {
      goto LABEL_57;
    }
  }
  recordId = self->_recordId;
  uint64_t v21 = v4[16];
  if ((unint64_t)recordId | v21)
  {
    if (!objc_msgSend_isEqual_(recordId, v7, v21)) {
      goto LABEL_57;
    }
  }
  uploadReceipt = self->_uploadReceipt;
  uint64_t v23 = v4[20];
  if ((unint64_t)uploadReceipt | v23)
  {
    if (!objc_msgSend_isEqual_(uploadReceipt, v7, v23)) {
      goto LABEL_57;
    }
  }
  downloadBaseURL = self->_downloadBaseURL;
  uint64_t v25 = v4[11];
  if ((unint64_t)downloadBaseURL | v25)
  {
    if (!objc_msgSend_isEqual_(downloadBaseURL, v7, v25)) {
      goto LABEL_57;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[21] & 8) == 0 || self->_downloadURLExpiration != v4[4]) {
      goto LABEL_57;
    }
  }
  else if ((v4[21] & 8) != 0)
  {
    goto LABEL_57;
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v27 = v4[15];
  if ((unint64_t)protectionInfo | v27 && !objc_msgSend_isEqual_(protectionInfo, v7, v27)) {
    goto LABEL_57;
  }
  referenceSignature = self->_referenceSignature;
  uint64_t v29 = v4[17];
  if ((unint64_t)referenceSignature | v29)
  {
    if (!objc_msgSend_isEqual_(referenceSignature, v7, v29)) {
      goto LABEL_57;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[21] & 4) == 0 || self->_downloadTokenExpiration != v4[3]) {
      goto LABEL_57;
    }
  }
  else if ((v4[21] & 4) != 0)
  {
    goto LABEL_57;
  }
  clearAssetKey = self->_clearAssetKey;
  uint64_t v31 = v4[7];
  if ((unint64_t)clearAssetKey | v31 && !objc_msgSend_isEqual_(clearAssetKey, v7, v31)) {
    goto LABEL_57;
  }
  assetAuthorizationResponseUUID = self->_assetAuthorizationResponseUUID;
  uint64_t v33 = v4[6];
  if ((unint64_t)assetAuthorizationResponseUUID | v33)
  {
    if (!objc_msgSend_isEqual_(assetAuthorizationResponseUUID, v7, v33)) {
      goto LABEL_57;
    }
  }
  constructedAssetDownloadURL = self->_constructedAssetDownloadURL;
  uint64_t v35 = v4[9];
  if ((unint64_t)constructedAssetDownloadURL | v35)
  {
    if (!objc_msgSend_isEqual_(constructedAssetDownloadURL, v7, v35)) {
      goto LABEL_57;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[21] & 2) == 0 || self->_constructedAssetDownloadURLExpiration != v4[2]) {
      goto LABEL_57;
    }
  }
  else if ((v4[21] & 2) != 0)
  {
    goto LABEL_57;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[21] & 1) == 0 || self->_constructedAssetDownloadEstimatedSize != v4[1]) {
      goto LABEL_57;
    }
  }
  else if (v4[21])
  {
    goto LABEL_57;
  }
  constructedAssetDownloadParameters = self->_constructedAssetDownloadParameters;
  uint64_t v37 = v4[8];
  if ((unint64_t)constructedAssetDownloadParameters | v37) {
    char isEqual = objc_msgSend_isEqual_(constructedAssetDownloadParameters, v7, v37);
  }
  else {
    char isEqual = 1;
  }
LABEL_58:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v51 = objc_msgSend_hash(self->_owner, a2, v2);
  uint64_t v50 = objc_msgSend_hash(self->_signature, v4, v5);
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v49 = 2654435761 * self->_size;
  }
  else {
    uint64_t v49 = 0;
  }
  uint64_t v48 = objc_msgSend_hash(self->_downloadToken, v6, v7);
  uint64_t v47 = objc_msgSend_hash(self->_downloadRequest, v8, v9);
  uint64_t v46 = objc_msgSend_hash(self->_contentBaseURL, v10, v11);
  uint64_t v45 = objc_msgSend_hash(self->_requestor, v12, v13);
  uint64_t v44 = objc_msgSend_hash(self->_recordId, v14, v15);
  uint64_t v43 = objc_msgSend_hash(self->_uploadReceipt, v16, v17);
  uint64_t v22 = objc_msgSend_hash(self->_downloadBaseURL, v18, v19);
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v23 = 2654435761 * self->_downloadURLExpiration;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = objc_msgSend_hash(self->_protectionInfo, v20, v21);
  uint64_t v29 = objc_msgSend_hash(self->_referenceSignature, v25, v26);
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v30 = 2654435761 * self->_downloadTokenExpiration;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = objc_msgSend_hash(self->_clearAssetKey, v27, v28);
  uint64_t v34 = objc_msgSend_hash(self->_assetAuthorizationResponseUUID, v32, v33);
  uint64_t v37 = objc_msgSend_hash(self->_constructedAssetDownloadURL, v35, v36);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v40 = 2654435761 * self->_constructedAssetDownloadURLExpiration;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v41 = 0;
    return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v22 ^ v23 ^ v24 ^ v29 ^ v30 ^ v31 ^ v34 ^ v37 ^ v40 ^ v41 ^ objc_msgSend_hash(self->_constructedAssetDownloadParameters, v38, v39);
  }
  uint64_t v40 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v41 = 2654435761 * self->_constructedAssetDownloadEstimatedSize;
  return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v22 ^ v23 ^ v24 ^ v29 ^ v30 ^ v31 ^ v34 ^ v37 ^ v40 ^ v41 ^ objc_msgSend_hash(self->_constructedAssetDownloadParameters, v38, v39);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4[14];
  uint64_t v23 = v4;
  if (v5)
  {
    objc_msgSend_setOwner_(self, (const char *)v4, v5);
    id v4 = v23;
  }
  uint64_t v6 = v4[19];
  if (v6)
  {
    objc_msgSend_setSignature_(self, (const char *)v4, v6);
    id v4 = v23;
  }
  if ((v4[21] & 0x10) != 0)
  {
    self->_size = v4[5];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  uint64_t v7 = v4[13];
  if (v7)
  {
    objc_msgSend_setDownloadToken_(self, (const char *)v4, v7);
    id v4 = v23;
  }
  uint64_t v8 = v4[12];
  if (v8)
  {
    objc_msgSend_setDownloadRequest_(self, (const char *)v4, v8);
    id v4 = v23;
  }
  uint64_t v9 = v4[10];
  if (v9)
  {
    objc_msgSend_setContentBaseURL_(self, (const char *)v4, v9);
    id v4 = v23;
  }
  uint64_t v10 = v4[18];
  if (v10)
  {
    objc_msgSend_setRequestor_(self, (const char *)v4, v10);
    id v4 = v23;
  }
  recordId = self->_recordId;
  uint64_t v12 = v4[16];
  if (recordId)
  {
    if (!v12) {
      goto LABEL_21;
    }
    objc_msgSend_mergeFrom_(recordId, (const char *)v4, v12);
  }
  else
  {
    if (!v12) {
      goto LABEL_21;
    }
    objc_msgSend_setRecordId_(self, (const char *)v4, v12);
  }
  id v4 = v23;
LABEL_21:
  uint64_t v13 = v4[20];
  if (v13)
  {
    objc_msgSend_setUploadReceipt_(self, (const char *)v4, v13);
    id v4 = v23;
  }
  uint64_t v14 = v4[11];
  if (v14)
  {
    objc_msgSend_setDownloadBaseURL_(self, (const char *)v4, v14);
    id v4 = v23;
  }
  if ((v4[21] & 8) != 0)
  {
    self->_downloadURLExpiration = v4[4];
    *(unsigned char *)&self->_has |= 8u;
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v16 = v4[15];
  if (protectionInfo)
  {
    if (!v16) {
      goto LABEL_33;
    }
    objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v16);
  }
  else
  {
    if (!v16) {
      goto LABEL_33;
    }
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v16);
  }
  id v4 = v23;
LABEL_33:
  uint64_t v17 = v4[17];
  if (v17)
  {
    objc_msgSend_setReferenceSignature_(self, (const char *)v4, v17);
    id v4 = v23;
  }
  if ((v4[21] & 4) != 0)
  {
    self->_downloadTokenExpiration = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v18 = v4[7];
  if (v18)
  {
    objc_msgSend_setClearAssetKey_(self, (const char *)v4, v18);
    id v4 = v23;
  }
  uint64_t v19 = v4[6];
  if (v19)
  {
    objc_msgSend_setAssetAuthorizationResponseUUID_(self, (const char *)v4, v19);
    id v4 = v23;
  }
  uint64_t v20 = v4[9];
  if (v20)
  {
    objc_msgSend_setConstructedAssetDownloadURL_(self, (const char *)v4, v20);
    id v4 = v23;
  }
  char v21 = *((unsigned char *)v4 + 168);
  if ((v21 & 2) != 0)
  {
    self->_constructedAssetDownloadURLExpiration = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v21 = *((unsigned char *)v4 + 168);
  }
  if (v21)
  {
    self->_constructedAssetDownloadEstimatedSize = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v22 = v4[8];
  if (v22) {
    objc_msgSend_setConstructedAssetDownloadParameters_(self, (const char *)v4, v22);
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (NSString)downloadToken
{
  return self->_downloadToken;
}

- (void)setDownloadToken:(id)a3
{
}

- (NSData)downloadRequest
{
  return self->_downloadRequest;
}

- (void)setDownloadRequest:(id)a3
{
}

- (NSString)contentBaseURL
{
  return self->_contentBaseURL;
}

- (void)setContentBaseURL:(id)a3
{
}

- (NSString)requestor
{
  return self->_requestor;
}

- (void)setRequestor:(id)a3
{
}

- (CKDPRecordIdentifier)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
}

- (NSString)uploadReceipt
{
  return self->_uploadReceipt;
}

- (void)setUploadReceipt:(id)a3
{
}

- (NSString)downloadBaseURL
{
  return self->_downloadBaseURL;
}

- (void)setDownloadBaseURL:(id)a3
{
}

- (int64_t)downloadURLExpiration
{
  return self->_downloadURLExpiration;
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void)setReferenceSignature:(id)a3
{
}

- (int64_t)downloadTokenExpiration
{
  return self->_downloadTokenExpiration;
}

- (NSData)clearAssetKey
{
  return self->_clearAssetKey;
}

- (void)setClearAssetKey:(id)a3
{
}

- (NSString)assetAuthorizationResponseUUID
{
  return self->_assetAuthorizationResponseUUID;
}

- (void)setAssetAuthorizationResponseUUID:(id)a3
{
}

- (NSString)constructedAssetDownloadURL
{
  return self->_constructedAssetDownloadURL;
}

- (void)setConstructedAssetDownloadURL:(id)a3
{
}

- (int64_t)constructedAssetDownloadURLExpiration
{
  return self->_constructedAssetDownloadURLExpiration;
}

- (int64_t)constructedAssetDownloadEstimatedSize
{
  return self->_constructedAssetDownloadEstimatedSize;
}

- (NSData)constructedAssetDownloadParameters
{
  return self->_constructedAssetDownloadParameters;
}

- (void)setConstructedAssetDownloadParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_storeStrong((id *)&self->_downloadRequest, 0);
  objc_storeStrong((id *)&self->_downloadBaseURL, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadURL, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadParameters, 0);
  objc_storeStrong((id *)&self->_clearAssetKey, 0);
  objc_storeStrong((id *)&self->_assetAuthorizationResponseUUID, 0);
}

@end