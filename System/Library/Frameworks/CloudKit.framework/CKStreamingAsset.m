@interface CKStreamingAsset
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)hasSize;
- (C2RequestOptions)immutableRequestOptions;
- (C2RequestOptions)requestOptions;
- (CKStreamingAsset)init;
- (CKStreamingAsset)initWithCoder:(id)a3;
- (CKStreamingAsset)initWithExpectedSizeBytes:(int64_t)a3;
- (NSData)fileSignature;
- (NSData)referenceSignature;
- (NSDate)downloadURLExpirationDate;
- (NSDate)uploadURLExpirationDate;
- (NSString)description;
- (NSString)owner;
- (NSString)uploadReceipt;
- (NSURL)downloadURL;
- (NSURL)uploadURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (id)redactedDescription;
- (int64_t)expectedSizeBytes;
- (int64_t)reservedSize;
- (int64_t)size;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)copyServerFieldsFromStreamingAsset:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadURL:(id)a3;
- (void)setDownloadURLExpirationDate:(id)a3;
- (void)setExpectedSizeBytes:(int64_t)a3;
- (void)setFileSignature:(id)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setImmutableRequestOptions:(id)a3;
- (void)setOwner:(id)a3;
- (void)setReferenceSignature:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setReservedSize:(int64_t)a3;
- (void)setSize:(int64_t)a3;
- (void)setUploadReceipt:(id)a3;
- (void)setUploadURL:(id)a3;
- (void)setUploadURLExpirationDate:(id)a3;
@end

@implementation CKStreamingAsset

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKStreamingAsset)initWithExpectedSizeBytes:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKStreamingAsset;
  result = [(CKStreamingAsset *)&v5 init];
  if (result) {
    result->_expectedSizeBytes = a3;
  }
  return result;
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKStreamingAsset;
  return [(CKStreamingAsset *)&v3 init];
}

- (CKStreamingAsset)init
{
  v2 = [CKException alloc];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"You must call -[%@ initWithExpectedSizeBytes:]", v5);

  objc_exception_throw(v7);
}

- (void)copyServerFieldsFromStreamingAsset:(id)a3
{
  id v55 = a3;
  v54 = objc_msgSend_fileSignature(v55, v4, v5, v6);
  v10 = objc_msgSend_referenceSignature(v55, v7, v8, v9);
  v14 = objc_msgSend_downloadURL(v55, v11, v12, v13);
  v18 = objc_msgSend_uploadURL(v55, v15, v16, v17);
  v22 = objc_msgSend_uploadURLExpirationDate(v55, v19, v20, v21);
  v26 = objc_msgSend_downloadURLExpirationDate(v55, v23, v24, v25);
  uint64_t v30 = objc_msgSend_expectedSizeBytes(v55, v27, v28, v29);
  uint64_t v34 = objc_msgSend_reservedSize(v55, v31, v32, v33);
  v38 = objc_msgSend_uploadReceipt(v55, v35, v36, v37);
  v45 = objc_msgSend_immutableRequestOptions(v55, v39, v40, v41);
  if (v18) {
    objc_msgSend_setUploadURL_(self, v42, (uint64_t)v18, v44);
  }
  if (v22) {
    objc_msgSend_setUploadURLExpirationDate_(self, v42, (uint64_t)v22, v44);
  }
  if (v14) {
    objc_msgSend_setDownloadURL_(self, v42, (uint64_t)v14, v44);
  }
  if (v26) {
    objc_msgSend_setDownloadURLExpirationDate_(self, v42, (uint64_t)v26, v44);
  }
  if (objc_msgSend_hasSize(v55, v42, v43, v44))
  {
    objc_msgSend_setHasSize_(self, v46, 1, v47);
    uint64_t v51 = objc_msgSend_size(v55, v48, v49, v50);
    objc_msgSend_setSize_(self, v52, v51, v53);
  }
  if (v30) {
    objc_msgSend_setExpectedSizeBytes_(self, v46, v30, v47);
  }
  if (v34) {
    objc_msgSend_setReservedSize_(self, v46, v34, v47);
  }
  if (v54) {
    objc_msgSend_setFileSignature_(self, v46, (uint64_t)v54, v47);
  }
  if (v10) {
    objc_msgSend_setReferenceSignature_(self, v46, (uint64_t)v10, v47);
  }
  if (v38) {
    objc_msgSend_setUploadReceipt_(self, v46, (uint64_t)v38, v47);
  }
  if (v45) {
    objc_msgSend_setRequestOptions_(self, v46, (uint64_t)v45, v47);
  }
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v103 = a3;
  id v7 = objc_msgSend_owner(self, v4, v5, v6);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v8, @"owner", (uint64_t)v7, 0);

  uint64_t v12 = objc_msgSend_fileSignature(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_CKHexString(v12, v13, v14, v15);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v17, @"fileSignature", (uint64_t)v16, 0);

  uint64_t v21 = objc_msgSend_referenceSignature(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_CKHexString(v21, v22, v23, v24);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v26, @"referenceSignature", (uint64_t)v25, 0);

  uint64_t v30 = objc_msgSend_downloadURL(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_absoluteString(v30, v31, v32, v33);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v35, @"downloadURL", (uint64_t)v34, 0);

  v39 = objc_msgSend_uploadURL(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_absoluteString(v39, v40, v41, v42);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v44, @"uploadURL", (uint64_t)v43, 0);

  v48 = objc_msgSend_uploadURLExpirationDate(self, v45, v46, v47);
  v52 = objc_msgSend_description(v48, v49, v50, v51);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v53, @"uploadURLExpirationDate", (uint64_t)v52, 0);

  v57 = objc_msgSend_downloadURLExpirationDate(self, v54, v55, v56);
  v61 = objc_msgSend_description(v57, v58, v59, v60);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v62, @"downloadURLExpirationDate", (uint64_t)v61, 0);

  if (objc_msgSend_hasSize(self, v63, v64, v65))
  {
    v69 = NSNumber;
    uint64_t v70 = objc_msgSend_size(self, v66, v67, v68);
    v73 = objc_msgSend_numberWithInteger_(v69, v71, v70, v72);
    objc_msgSend_addProperty_value_shouldRedact_(v103, v74, @"size", (uint64_t)v73, 0);
  }
  v75 = objc_msgSend_uploadReceipt(self, v66, v67, v68);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v76, @"uploadReceipt", (uint64_t)v75, 0);

  v80 = objc_msgSend_immutableRequestOptions(self, v77, v78, v79);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v103, v81, @"requestOptions", (uint64_t)v80, 0);

  if (objc_msgSend_expectedSizeBytes(self, v82, v83, v84))
  {
    v88 = NSNumber;
    uint64_t v89 = objc_msgSend_expectedSizeBytes(self, v85, v86, v87);
    v92 = objc_msgSend_numberWithInteger_(v88, v90, v89, v91);
    objc_msgSend_addProperty_value_shouldRedact_(v103, v93, @"expectedSizeBytes", (uint64_t)v92, 0);
  }
  if (objc_msgSend_reservedSize(self, v85, v86, v87))
  {
    v97 = NSNumber;
    uint64_t v98 = objc_msgSend_reservedSize(self, v94, v95, v96);
    v101 = objc_msgSend_numberWithInteger_(v97, v99, v98, v100);
    objc_msgSend_addProperty_value_shouldRedact_(v103, v102, @"reservedSize", (uint64_t)v101, 0);
  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKStreamingAsset *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKStreamingAsset *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v64 = a3;
  uint64_t v7 = objc_msgSend_expectedSizeBytes(self, v4, v5, v6);
  objc_msgSend_encodeInt64_forKey_(v64, v8, v7, @"ExpectedSizeBytes");
  if (objc_msgSend_hasSize(self, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend_size(self, v12, v13, v14);
    objc_msgSend_encodeInt64_forKey_(v64, v16, v15, @"Size");
  }
  uint64_t v17 = objc_msgSend_downloadURL(self, v12, v13, v14);
  objc_msgSend_encodeObject_forKey_(v64, v18, (uint64_t)v17, @"DownloadURL");

  v22 = objc_msgSend_downloadURLExpirationDate(self, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v64, v23, (uint64_t)v22, @"DownloadURLExpirationDate");

  v27 = objc_msgSend_fileSignature(self, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v64, v28, (uint64_t)v27, @"FileSignature");

  uint64_t v32 = objc_msgSend_referenceSignature(self, v29, v30, v31);
  objc_msgSend_encodeObject_forKey_(v64, v33, (uint64_t)v32, @"ReferenceSignature");

  uint64_t v37 = objc_msgSend_owner(self, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v64, v38, (uint64_t)v37, @"Owner");

  uint64_t v42 = objc_msgSend_uploadURL(self, v39, v40, v41);
  objc_msgSend_encodeObject_forKey_(v64, v43, (uint64_t)v42, @"UploadURL");

  uint64_t v47 = objc_msgSend_uploadURLExpirationDate(self, v44, v45, v46);
  objc_msgSend_encodeObject_forKey_(v64, v48, (uint64_t)v47, @"UploadURLExpirationDate");

  uint64_t v52 = objc_msgSend_reservedSize(self, v49, v50, v51);
  objc_msgSend_encodeInt64_forKey_(v64, v53, v52, @"ReservedSize");
  v57 = objc_msgSend_uploadReceipt(self, v54, v55, v56);
  objc_msgSend_encodeObject_forKey_(v64, v58, (uint64_t)v57, @"UploadReceipt");

  v62 = objc_msgSend_immutableRequestOptions(self, v59, v60, v61);
  objc_msgSend_encodeObject_forKey_(v64, v63, (uint64_t)v62, @"RequestOptions");
}

- (CKStreamingAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CKStreamingAsset;
  uint64_t v7 = [(CKStreamingAsset *)&v51 init];
  if (v7)
  {
    v7->_expectedSizeBytes = objc_msgSend_decodeInt64ForKey_(v4, v5, @"ExpectedSizeBytes", v6);
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"DownloadURL");
    downloadURL = v7->_downloadURL;
    v7->_downloadURL = (NSURL *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"DownloadURLExpirationDate");
    downloadURLExpirationDate = v7->_downloadURLExpirationDate;
    v7->_downloadURLExpirationDate = (NSDate *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"FileSignature");
    fileSignature = v7->_fileSignature;
    v7->_fileSignature = (NSData *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"ReferenceSignature");
    referenceSignature = v7->_referenceSignature;
    v7->_referenceSignature = (NSData *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, @"Owner");
    owner = v7->_owner;
    v7->_owner = (NSString *)v26;

    uint64_t v28 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"UploadURL");
    uploadURL = v7->_uploadURL;
    v7->_uploadURL = (NSURL *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"UploadURLExpirationDate");
    uploadURLExpirationDate = v7->_uploadURLExpirationDate;
    v7->_uploadURLExpirationDate = (NSDate *)v34;

    v7->_reservedSize = objc_msgSend_decodeInt64ForKey_(v4, v36, @"ReservedSize", v37);
    uint64_t v38 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"UploadReceipt");
    uploadReceipt = v7->_uploadReceipt;
    v7->_uploadReceipt = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"RequestOptions");
    immutableRequestOptions = v7->_immutableRequestOptions;
    v7->_immutableRequestOptions = (C2RequestOptions *)v44;

    if (objc_msgSend_containsValueForKey_(v4, v46, @"Size", v47))
    {
      v7->_hasSize = 1;
      v7->_size = objc_msgSend_decodeInt64ForKey_(v4, v48, @"Size", v49);
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKStreamingAsset alloc];
  uint64_t inited = objc_msgSend_initInternal(v4, v5, v6, v7);
  *(void *)(inited + 56) = objc_msgSend_expectedSizeBytes(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_downloadURL(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
  uint64_t v20 = *(void **)(inited + 88);
  *(void *)(inited + 88) = v19;

  uint64_t v24 = objc_msgSend_downloadURLExpirationDate(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_copy(v24, v25, v26, v27);
  uint64_t v29 = *(void **)(inited + 96);
  *(void *)(inited + 96) = v28;

  uint64_t v33 = objc_msgSend_fileSignature(self, v30, v31, v32);
  uint64_t v37 = objc_msgSend_copy(v33, v34, v35, v36);
  uint64_t v38 = *(void **)(inited + 32);
  *(void *)(inited + 32) = v37;

  uint64_t v42 = objc_msgSend_referenceSignature(self, v39, v40, v41);
  uint64_t v46 = objc_msgSend_copy(v42, v43, v44, v45);
  uint64_t v47 = *(void **)(inited + 40);
  *(void *)(inited + 40) = v46;

  objc_super v51 = objc_msgSend_owner(self, v48, v49, v50);
  uint64_t v55 = objc_msgSend_copy(v51, v52, v53, v54);
  uint64_t v56 = *(void **)(inited + 48);
  *(void *)(inited + 48) = v55;

  uint64_t v60 = objc_msgSend_uploadURL(self, v57, v58, v59);
  uint64_t v64 = objc_msgSend_copy(v60, v61, v62, v63);
  uint64_t v65 = *(void **)(inited + 64);
  *(void *)(inited + 64) = v64;

  v69 = objc_msgSend_uploadURLExpirationDate(self, v66, v67, v68);
  uint64_t v73 = objc_msgSend_copy(v69, v70, v71, v72);
  v74 = *(void **)(inited + 72);
  *(void *)(inited + 72) = v73;

  *(void *)(inited + 80) = objc_msgSend_reservedSize(self, v75, v76, v77);
  v81 = objc_msgSend_uploadReceipt(self, v78, v79, v80);
  uint64_t v85 = objc_msgSend_copy(v81, v82, v83, v84);
  uint64_t v86 = *(void **)(inited + 104);
  *(void *)(inited + 104) = v85;

  uint64_t v90 = objc_msgSend_immutableRequestOptions(self, v87, v88, v89);
  uint64_t v91 = *(void **)(inited + 24);
  *(void *)(inited + 24) = v90;

  *(unsigned char *)(inited + 8) = objc_msgSend_hasSize(self, v92, v93, v94);
  *(void *)(inited + 16) = objc_msgSend_size(self, v95, v96, v97);
  return (id)inited;
}

- (int64_t)size
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t size = v2->_size;
  objc_sync_exit(v2);

  return size;
}

- (void)setSize:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_setHasSize_(obj, v4, 1, v5);
  obj->_int64_t size = a3;
  objc_sync_exit(obj);
}

- (C2RequestOptions)requestOptions
{
  id v4 = objc_msgSend_immutableRequestOptions(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_copy(v4, v5, v6, v7);

  return (C2RequestOptions *)v8;
}

- (void)setRequestOptions:(id)a3
{
}

- (C2RequestOptions)immutableRequestOptions
{
  return (C2RequestOptions *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImmutableRequestOptions:(id)a3
{
}

- (NSData)fileSignature
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileSignature:(id)a3
{
}

- (NSData)referenceSignature
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReferenceSignature:(id)a3
{
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOwner:(id)a3
{
}

- (int64_t)expectedSizeBytes
{
  return self->_expectedSizeBytes;
}

- (void)setExpectedSizeBytes:(int64_t)a3
{
  self->_expectedSizeBytes = a3;
}

- (NSURL)uploadURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUploadURL:(id)a3
{
}

- (NSDate)uploadURLExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUploadURLExpirationDate:(id)a3
{
}

- (int64_t)reservedSize
{
  return self->_reservedSize;
}

- (void)setReservedSize:(int64_t)a3
{
  self->_reservedSize = a3;
}

- (NSURL)downloadURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDownloadURL:(id)a3
{
}

- (NSDate)downloadURLExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDownloadURLExpirationDate:(id)a3
{
}

- (BOOL)hasSize
{
  return self->_hasSize;
}

- (void)setHasSize:(BOOL)a3
{
  self->_hasSize = a3;
}

- (NSString)uploadReceipt
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUploadReceipt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
  objc_storeStrong((id *)&self->_downloadURLExpirationDate, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_uploadURLExpirationDate, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);

  objc_storeStrong((id *)&self->_immutableRequestOptions, 0);
}

@end