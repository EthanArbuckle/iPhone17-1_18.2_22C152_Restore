@interface CKAssetRereferenceInfo
- (CKAssetRereferenceInfo)initWithSourceZoneID:(id)a3;
- (CKRecordZoneID)sourceZoneID;
- (NSData)assetKey;
- (NSData)referenceSignature;
- (NSError)error;
- (NSString)destinationFieldName;
- (NSString)downloadToken;
- (NSString)owner;
- (NSString)requestor;
- (NSURL)contentBaseURL;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)description;
- (unint64_t)downloadTokenExpiration;
- (void)setAssetKey:(id)a3;
- (void)setContentBaseURL:(id)a3;
- (void)setDestinationFieldName:(id)a3;
- (void)setDownloadToken:(id)a3;
- (void)setDownloadTokenExpiration:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setOwner:(id)a3;
- (void)setReferenceSignature:(id)a3;
- (void)setRequestor:(id)a3;
@end

@implementation CKAssetRereferenceInfo

- (CKAssetRereferenceInfo)initWithSourceZoneID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKAssetRereferenceInfo;
  v8 = [(CKAssetRereferenceInfo *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    sourceZoneID = v8->_sourceZoneID;
    v8->_sourceZoneID = (CKRecordZoneID *)v9;
  }
  return v8;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a4;
  v10 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 12, a4, a5);
  if (v5)
  {
    v11 = objc_msgSend_contentBaseURL(self, v7, v8, v9);
    v15 = v11;
    if (v11)
    {
      v16 = objc_msgSend_description(v11, v12, v13, v14);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v17, @"contentBaseURL", (uint64_t)v16);
    }
    v18 = objc_msgSend_owner(self, v12, v13, v14);
    v22 = v18;
    if (v18)
    {
      v23 = objc_msgSend_description(v18, v19, v20, v21);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v24, @"owner", (uint64_t)v23);
    }
    v25 = objc_msgSend_requestor(self, v19, v20, v21);
    v29 = v25;
    if (v25)
    {
      v30 = objc_msgSend_description(v25, v26, v27, v28);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v31, @"requestor", (uint64_t)v30);
    }
    v32 = objc_msgSend_assetKey(self, v26, v27, v28);

    if (v32) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v33, @"assetKey", @"Yes");
    }
    v36 = objc_msgSend_referenceSignature(self, v33, v34, v35);
    v40 = v36;
    if (v36)
    {
      v41 = objc_msgSend_description(v36, v37, v38, v39);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v42, @"referenceSignature", (uint64_t)v41);
    }
    v43 = objc_msgSend_downloadToken(self, v37, v38, v39);
    v47 = v43;
    if (v43)
    {
      v48 = objc_msgSend_description(v43, v44, v45, v46);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v49, @"downloadToken", (uint64_t)v48);
    }
    uint64_t v50 = objc_msgSend_downloadTokenExpiration(self, v44, v45, v46);
    if (v50)
    {
      v54 = objc_msgSend_stringWithFormat_(NSString, v51, @"%llu", v53, v50);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v55, @"downloadTokenExpiration", (uint64_t)v54);
    }
    v56 = objc_msgSend_error(self, v51, v52, v53);
    v60 = v56;
    if (v56)
    {
      v61 = objc_msgSend_description(v56, v57, v58, v59);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v62, @"error", (uint64_t)v61);
    }
  }

  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetRereferenceInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (NSURL)contentBaseURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentBaseURL:(id)a3
{
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOwner:(id)a3
{
}

- (NSString)requestor
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequestor:(id)a3
{
}

- (NSData)assetKey
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssetKey:(id)a3
{
}

- (NSData)referenceSignature
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReferenceSignature:(id)a3
{
}

- (NSString)downloadToken
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDownloadToken:(id)a3
{
}

- (unint64_t)downloadTokenExpiration
{
  return self->_downloadTokenExpiration;
}

- (void)setDownloadTokenExpiration:(unint64_t)a3
{
  self->_downloadTokenExpiration = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)destinationFieldName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDestinationFieldName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationFieldName, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);

  objc_storeStrong((id *)&self->_sourceZoneID, 0);
}

@end