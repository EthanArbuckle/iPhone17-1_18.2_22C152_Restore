@interface CKAsset
+ (BOOL)_templateURLRequiresAssetKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CKAsset)assetWithFileURL:(id)a3;
+ (id)_canonicalizeTemplateURL:(id)a3;
+ (id)_downloadURLWithTemplate:(id)a3 fileName:(id)a4;
+ (id)_expandTemplateURL:(id)a3 fieldValues:(id)a4;
+ (id)_openUnencryptedWithOpenInfo:(id)a3 genCountCheck:(BOOL)a4 error:(id *)a5;
+ (id)getFileMetadataAtPath:(id)a3 error:(id *)a4;
+ (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5;
+ (id)getFileSizeWithOpenInfo:(id)a3 error:(id *)a4;
+ (id)openToReadRawEncryptedDataWithOpenInfo:(id)a3 error:(id *)a4;
+ (id)openWithOpenInfo:(id)a3 error:(id *)a4;
+ (int)errorCodeFromPOSIXCode:(int)a3;
+ (void)initialize;
- (BOOL)downloaded;
- (BOOL)exposeAssetKey;
- (BOOL)hasSize;
- (BOOL)isConstructedAsset;
- (BOOL)isReference;
- (BOOL)shouldReadAssetContentUsingClientProxy;
- (BOOL)shouldReadRawEncryptedData;
- (BOOL)uploaded;
- (BOOL)useMMCSEncryptionV2;
- (BOOL)wasCached;
- (CKAsset)init;
- (CKAsset)initWithAssetContent:(id)a3 itemTypeHint:(id)a4;
- (CKAsset)initWithAssetReference:(id)a3;
- (CKAsset)initWithCoder:(id)a3;
- (CKAsset)initWithDeviceID:(id)a3 fileID:(id)a4 generationID:(id)a5;
- (CKAsset)initWithFileDescriptor:(int)a3;
- (CKAsset)initWithFileURL:(NSURL *)fileURL;
- (CKAsset)initWithFileURL:(id)a3 signature:(id)a4;
- (CKAsset)initWithFileURL:(id)a3 signature:(id)a4 assetHandleUUID:(id)a5;
- (CKAssetDownloadPreauthorization)downloadPreauthorization;
- (CKAssetReference)assetReference;
- (CKAssetRereferenceInfo)assetRereferenceInfo;
- (CKAssetTransferOptions)assetTransferOptions;
- (CKMediaItemMaker)mediaItemMaker;
- (CKMergeableDeltaID)mergeableDeltaID;
- (CKRecord)record;
- (CKRecordID)recordID;
- (NSData)assetContent;
- (NSData)assetKey;
- (NSData)boundaryKey;
- (NSData)clearAssetKey;
- (NSData)constructedAssetDownloadParameters;
- (NSData)referenceSignature;
- (NSData)signature;
- (NSData)verificationKey;
- (NSData)wrappedAssetKey;
- (NSDate)downloadURLExpiration;
- (NSDictionary)assetChunkerOptions;
- (NSFileHandle)fileHandle;
- (NSNumber)deviceID;
- (NSNumber)fileID;
- (NSNumber)generationCountToSave;
- (NSString)UUID;
- (NSString)authToken;
- (NSString)constructedAssetDownloadURLTemplate;
- (NSString)description;
- (NSString)downloadBaseURL;
- (NSString)downloadURLTemplate;
- (NSString)itemTypeHint;
- (NSString)owner;
- (NSString)recordKey;
- (NSString)requestor;
- (NSString)uploadReceipt;
- (NSURL)constructedAssetDownloadURL;
- (NSURL)contentBaseURL;
- (NSURL)fileURL;
- (NSURL)realPathURL;
- (double)uploadReceiptExpiration;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)downloadURL;
- (id)downloadURLWithFileName:(id)a3;
- (id)initInternal;
- (id)openWithError:(id *)a3;
- (int64_t)arrayIndex;
- (int64_t)storageGroupingPolicy;
- (int64_t)uploadRank;
- (unint64_t)constructedAssetEstimatedSize;
- (unint64_t)downloadTokenExpiration;
- (unint64_t)paddedFileSize;
- (unint64_t)reReferenceItemID;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setArrayIndex:(int64_t)a3;
- (void)setAssetChunkerOptions:(id)a3;
- (void)setAssetContent:(id)a3;
- (void)setAssetContent_modelMutation:(id)a3;
- (void)setAssetKey:(id)a3;
- (void)setAssetReference:(id)a3;
- (void)setAssetRereferenceInfo:(id)a3;
- (void)setAssetTransferOptions:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setBoundaryKey:(id)a3;
- (void)setClearAssetKey:(id)a3;
- (void)setConstructedAssetDownloadParameters:(id)a3;
- (void)setConstructedAssetDownloadURL:(id)a3;
- (void)setConstructedAssetDownloadURLTemplate:(id)a3;
- (void)setConstructedAssetEstimatedSize:(unint64_t)a3;
- (void)setContentBaseURL:(id)a3;
- (void)setDeviceID_modelMutation:(id)a3;
- (void)setDownloadBaseURL:(id)a3;
- (void)setDownloadPreauthorization:(id)a3;
- (void)setDownloadTokenExpiration:(unint64_t)a3;
- (void)setDownloadURLExpiration:(id)a3;
- (void)setDownloadURLTemplate:(id)a3;
- (void)setDownloaded:(BOOL)a3;
- (void)setExposeAssetKey:(BOOL)a3;
- (void)setFileHandle:(id)a3;
- (void)setFileID_modelMutation:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setGenerationCountToSave:(id)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setItemTypeHint:(id)a3;
- (void)setMediaItemMaker:(id)a3;
- (void)setMergeableDeltaID:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPaddedFileSize:(unint64_t)a3;
- (void)setReReferenceItemID:(unint64_t)a3;
- (void)setRealPathURL:(id)a3;
- (void)setRecord:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordKey:(id)a3;
- (void)setReferenceSignature:(id)a3;
- (void)setRequestor:(id)a3;
- (void)setShouldReadRawEncryptedData:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStorageGroupingPolicy:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUploadRank:(int64_t)a3;
- (void)setUploadReceipt:(id)a3;
- (void)setUploadReceiptExpiration:(double)a3;
- (void)setUploaded:(BOOL)a3;
- (void)setVerificationKey:(id)a3;
- (void)setWasCached:(BOOL)a3;
- (void)setWrappedAssetKey:(id)a3;
@end

@implementation CKAsset

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKAsset)init
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  v4 = [CKException alloc];
  id v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E4F1C3C8], @"You must call -[%@ initWithFileURL:] or -[%@ initWithData:]", v3, v3);
  objc_exception_throw(v6);
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)CKAsset;
  id result = [(CKAsset *)&v3 init];
  if (result)
  {
    *((void *)result + 44) = -1;
    *((void *)result + 47) = -1;
    *((void *)result + 13) = 2;
  }
  return result;
}

- (CKAsset)initWithFileURL:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (!v6) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v7, *MEMORY[0x1E4F1C3C8], @"Null fileURL");
  }
  if ((objc_msgSend_isFileURL(v6, v7, v8, v9) & 1) == 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v11, *MEMORY[0x1E4F1C3C8], @"Non-file URL");
  }
  if (!v10) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v11, *MEMORY[0x1E4F1C3C8], @"Null signature");
  }
  inited = (CKAsset *)objc_msgSend_initInternal(self, v11, v12, v13);
  if (inited)
  {
    uint64_t v18 = objc_msgSend_copy(v6, v14, v15, v16);
    fileURL = inited->_fileURL;
    inited->_fileURL = (NSURL *)v18;

    uint64_t v23 = objc_msgSend_copy(v10, v20, v21, v22);
    signature = inited->_signature;
    inited->_signature = (NSData *)v23;

    uint64_t v25 = CKCreateGUID();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v25;
  }
  return inited;
}

- (CKAsset)initWithFileURL:(id)a3 signature:(id)a4 assetHandleUUID:(id)a5
{
  id v8 = a3;
  id v10 = a4;
  if (!a5) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v9, *MEMORY[0x1E4F1C3C8], @"Null assetHandleUUID");
  }
  v11 = (CKAsset *)objc_msgSend_initWithFileURL_signature_(self, v9, (uint64_t)v8, (uint64_t)v10);

  return v11;
}

- (CKAsset)initWithFileURL:(NSURL *)fileURL
{
  v7 = fileURL;
  if (!v7) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3C8], @"Null fileURL");
  }
  if ((objc_msgSend_isFileURL(v7, v4, v5, v6) & 1) == 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v8, *MEMORY[0x1E4F1C3C8], @"Non-file URL");
  }
  inited = (CKAsset *)objc_msgSend_initInternal(self, v8, v9, v10);
  if (inited)
  {
    uint64_t v15 = objc_msgSend_copy(v7, v11, v12, v13);
    uint64_t v16 = inited->_fileURL;
    inited->_fileURL = (NSURL *)v15;

    uint64_t v17 = CKCreateGUID();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v17;
  }
  return inited;
}

- (CKAsset)initWithAssetReference:(id)a3
{
  id v4 = a3;
  id v40 = 0;
  char v5 = _CKCheckArgument((uint64_t)"assetReference", v4, 0, 0, 0, &v40);
  id v6 = v40;
  if ((v5 & 1) == 0)
  {
    v28 = v6;
    v29 = [CKException alloc];
    uint64_t v33 = objc_msgSend_code(v28, v30, v31, v32);
    v37 = objc_msgSend_localizedDescription(v28, v34, v35, v36);
    id v39 = (id)objc_msgSend_initWithCode_format_(v29, v38, v33, @"%@", v37);

    objc_exception_throw(v39);
  }

  inited = (CKAsset *)objc_msgSend_initInternal(self, v7, v8, v9);
  if (inited)
  {
    v14 = objc_msgSend_fileSignature(v4, v10, v11, v12);
    uint64_t v18 = objc_msgSend_copy(v14, v15, v16, v17);
    signature = inited->_signature;
    inited->_signature = (NSData *)v18;

    uint64_t v23 = objc_msgSend_copy(v4, v20, v21, v22);
    assetReference = inited->_assetReference;
    inited->_assetReference = (CKAssetReference *)v23;

    uint64_t v25 = CKCreateGUID();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v25;
  }
  return inited;
}

+ (CKAsset)assetWithFileURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v7 = objc_msgSend_initWithFileURL_(v4, v5, (uint64_t)v3, v6);

  return (CKAsset *)v7;
}

- (CKAsset)initWithDeviceID:(id)a3 fileID:(id)a4 generationID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v10, *MEMORY[0x1E4F1C3C8], @"Null deviceID");
    if (v9) {
      goto LABEL_3;
    }
  }
  objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v10, *MEMORY[0x1E4F1C3C8], @"Null fileID");
LABEL_3:
  uint64_t v14 = objc_msgSend_intValue(v8, v10, v11, v12);
  uint64_t v18 = objc_msgSend_unsignedLongLongValue(v9, v15, v16, v17);
  uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v19, @"/.vol/%u/%llu", v20, v14, v18);
  uint64_t v23 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v22, (uint64_t)v21, 0);
  v29 = (CKAsset *)objc_msgSend_initWithFileURL_(self, v24, (uint64_t)v23, v25);
  if (v29)
  {
    uint64_t v30 = objc_msgSend_copy(v8, v26, v27, v28);
    deviceID = v29->_deviceID;
    v29->_deviceID = (NSNumber *)v30;

    uint64_t v35 = objc_msgSend_copy(v9, v32, v33, v34);
    fileID = v29->_fileID;
    v29->_fileID = (NSNumber *)v35;

    uint64_t v40 = objc_msgSend_copy(v13, v37, v38, v39);
    generationCountToSave = v29->_generationCountToSave;
    v29->_generationCountToSave = (NSNumber *)v40;
  }
  return v29;
}

- (CKAsset)initWithFileDescriptor:(int)a3
{
  if (a3 <= 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3C8], @"Invalid fileDescriptor");
  }
  inited = (CKAsset *)objc_msgSend_initInternal(self, a2, *(uint64_t *)&a3, v3);
  if (inited)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28CB0]);
    uint64_t v8 = dup(a3);
    uint64_t v10 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v7, v9, v8, 1);
    fileHandle = inited->_fileHandle;
    inited->_fileHandle = (NSFileHandle *)v10;

    uint64_t v12 = CKCreateGUID();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v12;
  }
  return inited;
}

- (CKAsset)initWithAssetContent:(id)a3 itemTypeHint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = v7;
  uint64_t v12 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (v6)
  {
    if (!v7) {
      goto LABEL_6;
    }
LABEL_5:
    if (objc_msgSend_length(v11, v8, v9, v10)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v8, *MEMORY[0x1E4F1C3C8], @"Null assetContent");
  if (v11) {
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v8, *v12, @"Null itemTypeHint");
LABEL_7:
  uint64_t inited = objc_msgSend_initInternal(self, v8, v13, v14);
  v19 = (CKAsset *)inited;
  if (inited)
  {
    *(unsigned char *)(inited + 9) = 1;
    uint64_t v20 = objc_msgSend_copy(v6, v16, v17, v18);
    assetContent = v19->_assetContent;
    v19->_assetContent = (NSData *)v20;

    uint64_t v25 = objc_msgSend_copy(v11, v22, v23, v24);
    itemTypeHint = v19->_itemTypeHint;
    v19->_itemTypeHint = (NSString *)v25;

    v19->_hasSize = 1;
    v19->_size = objc_msgSend_length(v6, v27, v28, v29);
    uint64_t v30 = CKCreateGUID();
    UUID = v19->_UUID;
    v19->_UUID = (NSString *)v30;
  }
  return v19;
}

- (unint64_t)size
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t size = v2->_size;
  objc_sync_exit(v2);

  return size;
}

- (void)setSize:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_setHasSize_(obj, v4, 1, v5);
  obj->_unint64_t size = a3;
  objc_sync_exit(obj);
}

- (BOOL)isReference
{
  id v4 = objc_msgSend_assetReference(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isConstructedAsset
{
  id v4 = objc_msgSend_constructedAssetDownloadURLTemplate(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v11 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 19, a4);
  if (v6)
  {
    BOOL v215 = v5;
    uint64_t v15 = objc_msgSend_UUID(self, v8, v9, v10);
    if (v15) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v12, @"UUID", v15);
    }
    uint64_t v16 = objc_msgSend_arrayIndex(self, v12, v13, v14);
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v20 = objc_msgSend_numberWithLong_(NSNumber, v17, v16, v19);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v21, @"arrayIndex", (uint64_t)v20);
    }
    v226 = (void *)v15;
    if (objc_msgSend_hasSize(self, v17, v18, v19))
    {
      uint64_t v25 = NSNumber;
      uint64_t v26 = objc_msgSend_size(self, v22, v23, v24);
      uint64_t v29 = objc_msgSend_numberWithUnsignedLongLong_(v25, v27, v26, v28);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v30, @"size", (uint64_t)v29);
    }
    uint64_t v31 = objc_msgSend_assetContent(self, v22, v23, v24);
    uint64_t v35 = v31;
    if (v31)
    {
      uint64_t v36 = NSString;
      uint64_t v37 = objc_msgSend_length(v31, v32, v33, v34);
      uint64_t v40 = objc_msgSend_stringWithFormat_(v36, v38, @"<%lu bytes>", v39, v37);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v41, @"assetContent", (uint64_t)v40);
    }
    int isConstructedAsset = objc_msgSend_isConstructedAsset(self, v32, v33, v34);
    if (isConstructedAsset)
    {
      v46 = objc_msgSend_numberWithBool_(NSNumber, v42, 1, v44);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v47, @"constructedAssetEstimatedSize", (uint64_t)v46);
    }
    v48 = objc_msgSend_fileURL(self, v42, v43, v44);
    v52 = v48;
    if (v48)
    {
      v53 = objc_msgSend_CKSanitizedPath(v48, v49, v50, v51);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v54, @"path", (uint64_t)v53);
    }
    v55 = objc_msgSend_recordKey(self, v49, v50, v51);
    v59 = v55;
    if (v55)
    {
      v60 = objc_msgSend_description(v55, v56, v57, v58);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v61, @"recordKey", (uint64_t)v60);
    }
    v218 = v59;
    v62 = objc_msgSend_signature(self, v56, v57, v58);
    v66 = v62;
    if (v62)
    {
      v68 = objc_msgSend_description(v62, v63, v64, v65);
      if (isConstructedAsset) {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v67, @"sourceSignature", (uint64_t)v68);
      }
      else {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v67, @"signature", (uint64_t)v68);
      }
    }
    v225 = v35;
    uint64_t v72 = objc_msgSend_deviceID(self, v63, v64, v65);
    if (v72) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v69, @"deviceID", v72);
    }
    uint64_t v76 = objc_msgSend_fileID(self, v69, v70, v71);
    if (v76) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v73, @"fileID", v76);
    }
    v222 = (void *)v76;
    uint64_t v80 = objc_msgSend_fileHandle(self, v73, v74, v75);
    if (v80) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v77, @"fileHandle", v80);
    }
    v217 = v66;
    v227 = (void *)v80;
    uint64_t v84 = objc_msgSend_generationCountToSave(self, v77, v78, v79);
    if (v84) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v81, @"generationID", v84);
    }
    uint64_t v88 = objc_msgSend_owner(self, v81, v82, v83);
    if (v88) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v85, @"owner", v88);
    }
    v228 = (void *)v88;
    v89 = objc_msgSend_requestor(self, v85, v86, v87);
    v93 = v89;
    if (v89 && (objc_msgSend_isEqual_(v89, v90, (uint64_t)v228, v92) & 1) == 0) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v90, @"requestor", (uint64_t)v93);
    }
    v223 = (void *)v72;
    uint64_t v97 = objc_msgSend_authToken(self, v90, v91, v92);
    if (v97) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v94, @"authToken", v97);
    }
    v220 = (void *)v97;
    uint64_t v98 = objc_msgSend_downloadTokenExpiration(self, v94, v95, v96);
    if (v98)
    {
      v102 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v99, v98, v101);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v103, @"downloadTokenExpiration", (uint64_t)v102);
    }
    uint64_t v104 = objc_msgSend_uploadRank(self, v99, v100, v101);
    if ((v104 & 0x8000000000000000) == 0)
    {
      v108 = objc_msgSend_numberWithLong_(NSNumber, v105, v104, v107);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v109, @"uploadRank", (uint64_t)v108);
    }
    uint64_t v113 = objc_msgSend_uploadReceipt(self, v105, v106, v107);
    if (v113)
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v110, @"uploadReceipt", v113);
      v114 = NSNumber;
      objc_msgSend_uploadReceiptExpiration(self, v115, v116, v117);
      v121 = objc_msgSend_numberWithDouble_(v114, v118, v119, v120);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v122, @"uploadReceiptExpiration", (uint64_t)v121);
    }
    v219 = (void *)v113;
    v123 = objc_msgSend_wrappedAssetKey(self, v110, v111, v112);
    v127 = v123;
    if (v123)
    {
      v128 = NSString;
      uint64_t v129 = objc_msgSend_length(v123, v124, v125, v126);
      v132 = objc_msgSend_stringWithFormat_(v128, v130, @"<%lu bytes>", v131, v129);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v133, @"wrappedAssetKey", (uint64_t)v132);
    }
    v134 = objc_msgSend_clearAssetKey(self, v124, v125, v126);
    v138 = v134;
    if (v134)
    {
      v139 = NSString;
      uint64_t v140 = objc_msgSend_length(v134, v135, v136, v137);
      v143 = objc_msgSend_stringWithFormat_(v139, v141, @"<%lu bytes>", v142, v140);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v144, @"clearAssetKey", (uint64_t)v143);
    }
    v145 = objc_msgSend_referenceSignature(self, v135, v136, v137);
    v149 = v145;
    v221 = (void *)v84;
    if (v145)
    {
      v151 = objc_msgSend_description(v145, v146, v147, v148);
      if (isConstructedAsset) {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v150, @"sourceReferenceSignature", (uint64_t)v151);
      }
      else {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v150, @"referenceSignature", (uint64_t)v151);
      }
    }
    v224 = v52;
    v152 = objc_msgSend_downloadPreauthorization(self, v146, v147, v148);
    v156 = v152;
    if (v152)
    {
      v157 = objc_msgSend_responseUUID(v152, v153, v154, v155);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v158, @"downloadPreauthorizationUUID", (uint64_t)v157);
    }
    v159 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v153, 7, v155);
    if (objc_msgSend_uploaded(self, v160, v161, v162)) {
      objc_msgSend_addObject_(v159, v163, @"uploaded", v165);
    }
    v216 = v127;
    if (objc_msgSend_downloaded(self, v163, v164, v165)) {
      objc_msgSend_addObject_(v159, v166, @"downloaded", v168);
    }
    v169 = objc_msgSend_downloadURLExpiration(self, v166, v167, v168);
    v173 = objc_msgSend_downloadURLTemplate(self, v170, v171, v172);

    if (v173)
    {
      objc_msgSend_addObject_(v159, v174, @"has-download-url", v176);
      v180 = objc_msgSend_description(v169, v177, v178, v179);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v181, @"downloadURLExpiration", (uint64_t)v180);
    }
    v182 = objc_msgSend_constructedAssetDownloadURLTemplate(self, v174, v175, v176);

    if (v182)
    {
      objc_msgSend_addObject_(v159, v183, @"has-constructed-download-url", v185);
      v189 = objc_msgSend_description(v169, v186, v187, v188);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v190, @"downloadURLExpiration", (uint64_t)v189);
    }
    v191 = objc_msgSend_constructedAssetDownloadParameters(self, v183, v184, v185);
    v195 = v191;
    if (v191)
    {
      v196 = objc_msgSend_description(v191, v192, v193, v194);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v197, @"constructedAssetDownloadParameters", (uint64_t)v196);
    }
    v198 = objc_msgSend_downloadPreauthorization(self, v192, v193, v194);

    if (v198) {
      objc_msgSend_addObject_(v159, v199, @"has-download-preauth", v201);
    }
    if (objc_msgSend_shouldReadRawEncryptedData(self, v199, v200, v201)) {
      objc_msgSend_addObject_(v159, v202, @"read-encrypted", v204);
    }
    if (objc_msgSend_storageGroupingPolicy(self, v202, v203, v204) == 1) {
      objc_msgSend_addObject_(v159, v205, @"group-by-key", v207);
    }
    v210 = v227;
    if (objc_msgSend_count(v159, v205, v206, v207))
    {
      if (v215)
      {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v208, @"flags", (uint64_t)v159);
      }
      else
      {
        v211 = objc_msgSend_componentsJoinedByString_(v159, v208, @"|", v209);
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v212, @"flags", (uint64_t)v211);

        v210 = v227;
      }
    }
  }
  id v213 = v11;

  return v213;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAsset *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

+ (id)openToReadRawEncryptedDataWithOpenInfo:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_path(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    *__error() = 0;
    objc_msgSend_fileSystemRepresentation(v6, v7, v8, v9);
    uint64_t v10 = MKBBackupOpen();
    uint64_t v11 = __error();
    if (!v10)
    {
      uint64_t v19 = [CKFileOpenResult alloc];
      uint64_t v21 = objc_msgSend_initWithMobileKeyBagHandle_path_error_(v19, v20, 0, (uint64_t)v6, a4);
      uint64_t v18 = v21;
      if (v21) {
        id v22 = v21;
      }
      else {
        MKBBackupClose();
      }

      goto LABEL_16;
    }
    uint64_t v14 = *v11;
    if (a4)
    {
      int v15 = objc_msgSend_errorCodeFromPOSIXCode_(CKAsset, v12, v14, v13);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, @"CKInternalErrorDomain", v15, @"MKBBackupOpen failed with rc:%d errno:%d", v10, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v6;
      __int16 v26 = 1024;
      int v27 = v10;
      __int16 v28 = 1024;
      int v29 = v14;
      _os_log_error_impl(&dword_18AF10000, v17, OS_LOG_TYPE_ERROR, "MKBBackupOpen failed at \"%{public}@\" with rc:%d errno:%d", buf, 0x18u);
    }
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v5, @"CKInternalErrorDomain", 1017, @"nil path");
    uint64_t v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  uint64_t v18 = 0;
LABEL_16:

  return v18;
}

+ (int)errorCodeFromPOSIXCode:(int)a3
{
  int result = 3001;
  if (a3 > 12)
  {
    if (a3 == 45) {
      return 3009;
    }
    if (a3 != 35)
    {
      if (a3 != 13) {
        return result;
      }
      return 3010;
    }
    return 3002;
  }
  if (a3 == 1) {
    return 3010;
  }
  if (a3 == 2) {
    return 3002;
  }
  return result;
}

+ (id)_openUnencryptedWithOpenInfo:(id)a3 genCountCheck:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v8, v9, v10, v11);
  if (!v6)
  {
    if (RawEncryptedData) {
      goto LABEL_3;
    }
LABEL_14:
    __assert_rtn("+[CKAsset _openUnencryptedWithOpenInfo:genCountCheck:error:]", "CKAsset.m", 455, "(!genCountCheck && openInfo.shouldReadRawEncryptedData) || (genCountCheck && !openInfo.shouldReadRawEncryptedData)");
  }
  if (RawEncryptedData) {
    goto LABEL_14;
  }
LABEL_3:
  int v138 = -1;
  uint64_t v16 = objc_msgSend_path(v8, v13, v14, v15);
  uint64_t v20 = objc_msgSend_deviceID(v8, v17, v18, v19);
  uint64_t v24 = objc_msgSend_fileID(v8, v21, v22, v23);
  v130 = objc_msgSend_generationID(v8, v25, v26, v27);
  uint64_t v31 = objc_msgSend_fileHandle(v8, v28, v29, v30);
  uint64_t v35 = objc_msgSend_assetDownloadStagingInfo(v8, v32, v33, v34);
  uint64_t v39 = objc_msgSend_assetDownloadStagingManager(v8, v36, v37, v38);
  uint64_t v43 = v39;
  unsigned __int8 v137 = 1;
  uint64_t v131 = v24;
  if (!v20 && !v24 && !v16 && !v31 && (!v35 || !v39))
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v40, @"CKInternalErrorDomain", 1017, @"Invalid arguments: %@, %@, %@", 0, 0, 0);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v47 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412802;
      *(void *)&buf.st_mode = 0;
      WORD2(buf.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = 0;
      HIWORD(buf.st_gid) = 2114;
      *(void *)&buf.st_rdev = 0;
      _os_log_error_impl(&dword_18AF10000, v47, OS_LOG_TYPE_ERROR, "Invalid arguments, deviceID:%@, fileID:%{public}@, path:%{public}@", (uint8_t *)&buf, 0x20u);
    }
    uint64_t v31 = 0;
    goto LABEL_71;
  }
  uint64_t v129 = a5;
  if (!v35 || !v39)
  {
    if (v31)
    {
      int v46 = objc_msgSend_fileDescriptor(v31, v40, v41, v42);
      id v45 = 0;
      int v138 = v46;
      unsigned __int8 v137 = 0;
      if ((v46 & 0x80000000) == 0)
      {
LABEL_30:
        long long v133 = xmmword_18B1F3BB0;
        uint64_t v134 = 512;
        memset(v132, 0, 20);
        if (fgetattrlist(v46, &v133, v132, 0x14uLL, 0x20u))
        {
          v54 = __error();
          uint64_t v55 = *v54;
          v56 = strerror(*v54);
          objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v57, @"CKInternalErrorDomain", 3001, v16, @"fgetattrlist error: %d (%s)", v55, v56);
        }
        else if ((WORD2(v132[0]) & 0xF000) == 0x8000)
        {
          if (!v6
            || !objc_msgSend_unsignedIntegerValue(v130, v51, v52, v53)
            || (uint64_t v61 = LODWORD(v132[1]), objc_msgSend_unsignedIntegerValue(v130, v58, v59, v60) == v61))
          {
            id v65 = objc_alloc(MEMORY[0x1E4F28CB0]);
            uint64_t v67 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v65, v66, v138, v137);

            int v138 = -1;
            v68 = [CKFileOpenResult alloc];
            uint64_t v71 = objc_msgSend_numberWithLongLong_(NSNumber, v69, *(uint64_t *)((char *)&v132[1] + 4), v70);
            v73 = objc_msgSend_initWithFileHandle_fileSize_(v68, v72, v67, (uint64_t)v71);

            uint64_t v31 = (void *)v67;
            a5 = v129;
            if (v73) {
              goto LABEL_77;
            }
            goto LABEL_71;
          }
          uint64_t v76 = LODWORD(v132[1]);
          uint64_t v77 = objc_msgSend_unsignedIntegerValue(v130, v62, v63, v64);
          objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v78, @"CKInternalErrorDomain", 3003, v16, @"generation counter mismatch (%lu != %lu)", v76, v77);
        }
        else
        {
          objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v51, @"CKInternalErrorDomain", 1017, v16, @"Not a regular file");
        uint64_t v74 = };

        id v45 = (id)v74;
        goto LABEL_40;
      }
LABEL_49:
      uint64_t v80 = *__error();
      int v83 = objc_msgSend_errorCodeFromPOSIXCode_(a1, v81, v80, v82);
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      a5 = v129;
      uint64_t v128 = v83;
      uint64_t v84 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        buf.st_dev = 138413570;
        *(void *)&buf.st_mode = v20;
        WORD2(buf.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v131;
        HIWORD(buf.st_gid) = 2114;
        *(void *)&buf.st_rdev = v130;
        LOWORD(buf.st_atimespec.tv_sec) = 2114;
        *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = (__darwin_time_t)v16;
        WORD1(buf.st_atimespec.tv_nsec) = 2112;
        *(uint64_t *)((char *)&buf.st_atimespec.tv_nsec + 4) = (uint64_t)v31;
        WORD2(buf.st_mtimespec.tv_sec) = 1024;
        *(_DWORD *)((char *)&buf.st_mtimespec.tv_sec + 6) = v80;
        _os_log_debug_impl(&dword_18AF10000, v84, OS_LOG_TYPE_DEBUG, "open failed for deviceID:%@, fileID:%{public}@, generationID:%{public}@, path:%{public}@, fileHandle:%@: %{errno}d", (uint8_t *)&buf, 0x3Au);
      }
      if (v80 != 1 || v31)
      {
        if (v80 == 13)
        {
          memset(&buf, 0, sizeof(buf));
          v103 = (const char *)objc_msgSend_fileSystemRepresentation(v16, v85, v86, v87);
          if (!stat(v103, &buf))
          {
            id v104 = objc_alloc(NSNumber);
            BOOL v105 = getuid() == buf.st_uid;
            uint64_t v125 = objc_msgSend_initWithBool_(v104, v106, v105, v107);
            id v108 = objc_alloc(NSNumber);
            v127 = objc_msgSend_initWithBool_(v108, v109, HIBYTE(buf.st_mode) & 1, v110);
            id v111 = objc_alloc(NSNumber);
            v124 = objc_msgSend_initWithBool_(v111, v112, (buf.st_mode >> 5) & 1, v113);
            id v114 = objc_alloc(NSNumber);
            uint64_t v117 = objc_msgSend_initWithBool_(v114, v115, (buf.st_mode >> 2) & 1, v116);
            v118 = strerror(13);
            uint64_t v123 = objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v119, @"CKInternalErrorDomain", v128, v16, @"open error: %d (%s). isOwner:%@ canOwnerRead:%@ canGroupRead:%@ canOtherRead:%@", 13, v118, v125, v127, v124, v117);

            a5 = v129;
            id v45 = (id)v123;
          }
        }
      }
      else
      {
        if (v131) {
          BOOL v88 = v20 == 0;
        }
        else {
          BOOL v88 = 1;
        }
        if (v88 && v16)
        {
          uint64_t v126 = v80;
          v89 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v85, v86, v87);
          uint64_t v91 = objc_msgSend_attributesOfItemAtPath_error_(v89, v90, (uint64_t)v16, 0);
          v94 = objc_msgSend_objectForKey_(v91, v92, *MEMORY[0x1E4F28370], v93);

          uint64_t v95 = v94;
          if (v94
            && (objc_msgSend_isEqual_(v94, v96, *MEMORY[0x1E4F28358], v97) & 1) == 0
            && (objc_msgSend_isEqual_(v94, v98, *MEMORY[0x1E4F1C598], v99) & 1) == 0)
          {
            uint64_t v100 = strerror(1);
            uint64_t v102 = objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v101, @"CKInternalErrorDomain", v128, v16, @"open error: %d (%s). protection class %@ likely unavailable.", 1, v100, v94);

            id v45 = (id)v102;
            uint64_t v95 = v94;
          }
          a5 = v129;
          uint64_t v80 = v126;
        }
      }
      if (!v45)
      {
        uint64_t v120 = strerror(v80);
        a5 = v129;
        objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v121, @"CKInternalErrorDomain", v128, v16, @"open error: %d (%s)", v80, v120);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_71;
    }
    if (qword_1EB279C60 == -1)
    {
      if (!v20) {
        goto LABEL_48;
      }
    }
    else
    {
      dispatch_once(&qword_1EB279C60, &unk_1ED7EF1B8);
      if (!v20) {
        goto LABEL_48;
      }
    }
    if (v24 && byte_1EB279C58)
    {
      *(_DWORD *)&buf.st_mode = 0;
      buf.st_dev = objc_msgSend_intValue(v20, v40, v41, v42);
      uint64_t v135 = objc_msgSend_unsignedLongLongValue(v24, v48, v49, v50);
      int v138 = openbyid_np();
      if (v138 < 0)
      {
        int v75 = 30000;
        do
        {
          if (*__error() != 35) {
            break;
          }
          if (!--v75) {
            break;
          }
          usleep(0x3E8u);
          int v138 = openbyid_np();
        }
        while (v138 < 0);
      }
      id v45 = 0;
LABEL_29:
      int v46 = v138;
      if ((v138 & 0x80000000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_49;
    }
LABEL_48:
    uint64_t v79 = (const char *)objc_msgSend_fileSystemRepresentation(v16, v40, v41, v42);
    int v46 = open(v79, 260);
    id v45 = 0;
    int v138 = v46;
    if ((v46 & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_49;
  }
  id v136 = 0;
  char v44 = objc_msgSend_openWithAssetDownloadStagingInfo_fileDescriptor_closeOnDealloc_error_(v39, v40, (uint64_t)v35, (uint64_t)&v138, &v137, &v136);
  id v45 = v136;
  if (v44) {
    goto LABEL_29;
  }
LABEL_40:
  a5 = v129;
LABEL_71:
  if ((v138 & 0x80000000) == 0 && v137) {
    close(v138);
  }
  if (a5)
  {
    id v45 = v45;
    v73 = 0;
    *a5 = v45;
  }
  else
  {
    v73 = 0;
  }
LABEL_77:

  return v73;
}

+ (id)openWithOpenInfo:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_path(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_deviceID(v6, v11, v12, v13);
  uint64_t v18 = objc_msgSend_fileID(v6, v15, v16, v17);
  uint64_t v22 = objc_msgSend_fileHandle(v6, v19, v20, v21);
  uint64_t v26 = objc_msgSend_assetDownloadStagingInfo(v6, v23, v24, v25);
  uint64_t v30 = objc_msgSend_assetDownloadStagingManager(v6, v27, v28, v29);
  uint64_t v34 = (void *)v30;
  if (!v14 && !v18 && !v10 && !v22 && (!v26 || !v30))
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, @"CKInternalErrorDomain", 1017, @"Invalid arguments: %@, %@, %@", 0, 0, 0);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v39 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412802;
      uint64_t v43 = 0;
      __int16 v44 = 2114;
      uint64_t v45 = 0;
      __int16 v46 = 2114;
      uint64_t v47 = 0;
      _os_log_error_impl(&dword_18AF10000, v39, OS_LOG_TYPE_ERROR, "Invalid arguments, deviceID:%@, fileID:%{public}@, path:%{public}@", buf, 0x20u);
    }
    uint64_t v37 = 0;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (objc_msgSend_shouldReadRawEncryptedData(v6, v31, v32, v33))
  {
    objc_msgSend_openToReadRawEncryptedDataWithOpenInfo_error_(a1, v35, (uint64_t)v6, (uint64_t)a4);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v41 = 0;
  uint64_t v37 = objc_msgSend__openUnencryptedWithOpenInfo_genCountCheck_error_(a1, v35, (uint64_t)v6, 1, &v41);
  id v38 = v41;
  if (a4)
  {
LABEL_16:
    if (!v37) {
      *a4 = v38;
    }
  }
LABEL_18:
  id v36 = v37;

LABEL_19:

  return v36;
}

- (id)openWithError:(id *)a3
{
  id v4 = [CKFileOpenInfo alloc];
  uint64_t v8 = objc_msgSend_UUID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_fileURL(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_path(v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_deviceID(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_fileID(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_generationCountToSave(self, v25, v26, v27);
  uint64_t RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(self, v29, v30, v31);
  id v36 = objc_msgSend_fileHandle(self, v33, v34, v35);
  RawEncryptedData_fileHandle_assetDownloadStagingInfo = objc_msgSend_initWithUUID_path_deviceID_fileID_generationID_shouldReadRawEncryptedData_fileHandle_assetDownloadStagingInfo_(v4, v37, (uint64_t)v8, (uint64_t)v16, v20, v24, v28, RawEncryptedData, v36, 0);

  uint64_t v39 = objc_opt_class();
  id v41 = objc_msgSend_openWithOpenInfo_error_(v39, v40, (uint64_t)RawEncryptedData_fileHandle_assetDownloadStagingInfo, (uint64_t)a3);

  return v41;
}

+ (id)getFileSizeWithOpenInfo:(id)a3 error:(id *)a4
{
  id v13 = 0;
  BOOL v5 = objc_msgSend_openWithOpenInfo_error_(CKAsset, a2, (uint64_t)a3, (uint64_t)&v13);
  id v6 = v13;
  uint64_t v10 = v6;
  if (v5)
  {
    uint64_t v11 = objc_msgSend_fileSize(v5, v7, v8, v9);
  }
  else
  {
    uint64_t v11 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v11;
}

+ (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v13 = a4;
  if (!v9)
  {
    uint64_t v43 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, (uint64_t)a1, @"CKAsset.m", 674, @"Expected non-nil fileHandle");
  }
  uint64_t v49 = 512;
  long long v47 = 0u;
  long long v48 = xmmword_18B1F3BC8;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v14 = objc_msgSend_fileDescriptor(v9, v10, v11, v12);
  if (!fgetattrlist(v14, &v48, &v45, 0x30uLL, 0x20u))
  {
    uint64_t v25 = [CKFileMetadata alloc];
    uint64_t v28 = objc_msgSend_numberWithInt_(NSNumber, v26, DWORD1(v45), v27);
    uint64_t v31 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v29, v47, v30);
    uint64_t v34 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v32, HIDWORD(v46), v33);
    uint64_t v39 = objc_msgSend_numberWithLong_(NSNumber, v35, *((uint64_t *)&v45 + 1), v36);
    if ((WORD4(v46) & 0xF000) == 0x8000) {
      objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v37, *((uint64_t *)&v47 + 1), v38);
    }
    else {
    uint64_t v40 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v37, 0, v38);
    }
    uint64_t v24 = objc_msgSend_initWithDeviceID_fileID_generationID_modTimeInSeconds_fileSize_(v25, v41, (uint64_t)v28, (uint64_t)v31, v34, v39, v40);

    id v22 = 0;
    goto LABEL_15;
  }
  uint64_t v15 = *__error();
  uint64_t v19 = objc_msgSend_path(v13, v16, v17, v18);
  uint64_t v20 = strerror(v15);
  objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v21, @"CKInternalErrorDomain", 3001, v19, @"fgetattrlist(%d) failed: %d (%s)", v14, v15, v20);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v23 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 138412546;
    id v51 = v13;
    __int16 v52 = 2112;
    id v53 = v22;
    _os_log_error_impl(&dword_18AF10000, v23, OS_LOG_TYPE_ERROR, "Failed to get the attr list for %@: %@\n", buf, 0x16u);
    if (a5) {
      goto LABEL_8;
    }
  }
  else if (a5)
  {
LABEL_8:
    id v22 = v22;
    uint64_t v24 = 0;
    *a5 = v22;
    goto LABEL_15;
  }
  uint64_t v24 = 0;
LABEL_15:

  return v24;
}

+ (id)getFileMetadataAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [CKFileOpenInfo alloc];
  uint64_t v10 = objc_msgSend_initWithPath_(v7, v8, (uint64_t)v6, v9);

  id v22 = 0;
  uint64_t v12 = objc_msgSend_openWithOpenInfo_error_(CKAsset, v11, (uint64_t)v10, (uint64_t)&v22);
  id v13 = v22;
  uint64_t v17 = v13;
  if (v12)
  {
    uint64_t v18 = objc_msgSend_fileHandle(v12, v14, v15, v16);
    uint64_t v20 = objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(a1, v19, (uint64_t)v18, (uint64_t)v10, a4);
  }
  else
  {
    uint64_t v20 = 0;
    if (a4) {
      *a4 = v13;
    }
  }

  return v20;
}

+ (id)_expandTemplateURL:(id)a3 fieldValues:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v62 = a4;
  uint64_t v12 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v8, @"\\$\\{([^\\}]*?)\\}", 1, 0);
  if (!v12)
  {
    uint64_t v57 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v57, v58, (uint64_t)a2, (uint64_t)a1, @"CKAsset.m", 730, @"Couldn't create regex?");
  }
  id v63 = (id)objc_msgSend_mutableCopy(v7, v9, v10, v11);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v16 = objc_msgSend_length(v7, v13, v14, v15);
  objc_msgSend_matchesInString_options_range_(v12, v17, (uint64_t)v7, 0, 0, v16);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v64, (uint64_t)v68, 16);
  if (v61)
  {
    uint64_t v22 = 0;
    uint64_t v60 = *(void *)v65;
LABEL_5:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v65 != v60) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void **)(*((void *)&v64 + 1) + 8 * v23);
      if (objc_msgSend_numberOfRanges(v24, v19, v20, v21) != 2) {
        break;
      }
      uint64_t v27 = objc_msgSend_rangeAtIndex_(v24, v25, 1, v26);
      uint64_t v29 = objc_msgSend_substringWithRange_(v7, v28, v27, (uint64_t)v28);
      uint64_t v33 = objc_msgSend_range(v24, v30, v31, v32);
      uint64_t v35 = (uint64_t)v34;
      uint64_t v36 = objc_msgSend_replacementStringForResult_inString_offset_template_(v12, v34, (uint64_t)v24, (uint64_t)v63, v22, @"$0");
      if (!v36)
      {

        break;
      }
      uint64_t v40 = (void *)v36;
      id v41 = v12;
      id v42 = v7;
      uint64_t v43 = objc_msgSend_lowercaseString(v29, v37, v38, v39);
      long long v46 = objc_msgSend_objectForKeyedSubscript_(v62, v44, (uint64_t)v43, v45);

      if (v46)
      {
        uint64_t v50 = v33 + v22;
        id v51 = objc_msgSend_CKSafeStringForURLPathComponent(v46, v47, v48, v49);
        uint64_t v22 = v22 - v35 + objc_msgSend_length(v51, v52, v53, v54);
        objc_msgSend_replaceCharactersInRange_withString_(v63, v55, v50, v35, v51);
      }
      ++v23;
      id v7 = v42;
      uint64_t v12 = v41;
      if (v61 == v23)
      {
        uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v64, (uint64_t)v68, 16);
        if (v61) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  return v63;
}

+ (id)_canonicalizeTemplateURL:(id)a3
{
  BOOL v5 = (void *)MEMORY[0x1E4F28FD8];
  id v6 = a3;
  uint64_t v11 = objc_msgSend_regularExpressionWithPattern_options_error_(v5, v7, @"\\$\\{([^\\}]*?)\\}", 1, 0);
  if (!v11)
  {
    uint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)a1, @"CKAsset.m", 760, @"Couldn't create regex?");
  }
  uint64_t v12 = objc_msgSend_length(v6, v8, v9, v10);
  uint64_t v14 = objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(v11, v13, (uint64_t)v6, 0, 0, v12, &stru_1ED7F5C98);

  id v15 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v18 = objc_msgSend_initWithString_(v15, v16, (uint64_t)v14, v17);

  return v18;
}

+ (BOOL)_templateURLRequiresAssetKey:(id)a3
{
  return objc_msgSend_containsString_(a3, a2, @"${uk}", v3);
}

+ (id)_downloadURLWithTemplate:(id)a3 fileName:(id)a4
{
  id v4 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      BOOL v5 = (__CFString *)a4;
    }
    else {
      BOOL v5 = @"UNKNOWN_ASSET.dat";
    }
    uint64_t v16 = @"f";
    v17[0] = v5;
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = a4;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v6, v9, (uint64_t)v17, (uint64_t)&v16, 1);
    uint64_t v12 = objc_msgSend__expandTemplateURL_fieldValues_(CKAsset, v11, (uint64_t)v8, (uint64_t)v10);

    id v4 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v13, (uint64_t)v12, v14);
  }

  return v4;
}

- (id)downloadURLWithFileName:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_downloadURLTemplate(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend__downloadURLWithTemplate_fileName_(v5, v10, (uint64_t)v9, (uint64_t)v4);

  return v11;
}

- (id)downloadURL
{
  id v4 = objc_msgSend_downloadURLTemplate(self, a2, v2, v3);
  if (v4)
  {
    BOOL v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend__downloadURLWithTemplate_fileName_(v5, v6, (uint64_t)v4, @"UNKNOWN_ASSET.dat");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSURL)fileURL
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v6 = objc_msgSend_realPathURL(v2, v3, v4, v5);

  if (v6)
  {
    objc_msgSend_realPathURL(v2, v7, v8, v9);
    uint64_t v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = v2->_fileURL;
  }
  uint64_t v11 = v10;
  objc_sync_exit(v2);

  return v11;
}

- (void)setFileURL:(id)a3
{
  uint64_t v10 = (NSURL *)a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_fileURL != v10)
  {
    uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
    fileURL = v4->_fileURL;
    v4->_fileURL = (NSURL *)v8;
  }
  objc_sync_exit(v4);
}

- (NSDictionary)assetChunkerOptions
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_assetChunkerOptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAssetChunkerOptions:(id)a3
{
  id v10 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  assetChunkerOptions = v4->_assetChunkerOptions;
  v4->_assetChunkerOptions = (NSDictionary *)v8;

  objc_sync_exit(v4);
}

- (void)setDeviceID_modelMutation:(id)a3
{
  uint64_t v5 = (NSNumber *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  deviceID = self->_deviceID;
  self->_deviceID = v5;

  MEMORY[0x1F41817F8](v5, deviceID);
}

- (void)setFileID_modelMutation:(id)a3
{
  uint64_t v5 = (NSNumber *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  fileID = self->_fileID;
  self->_fileID = v5;

  MEMORY[0x1F41817F8](v5, fileID);
}

- (void)setAssetContent_modelMutation:(id)a3
{
  id v7 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend_setAssetContent_(self, v5, (uint64_t)v7, v6);
}

- (CKAssetTransferOptions)assetTransferOptions
{
  return self->_assetTransferOptions;
}

- (void)setAssetTransferOptions:(id)a3
{
  id v26 = a3;
  id v7 = (CKAssetTransferOptions *)objc_msgSend_copy(v26, v4, v5, v6);
  assetTransferOptions = self->_assetTransferOptions;
  self->_assetTransferOptions = v7;

  uint64_t isReference = objc_msgSend_isReference(self, v9, v10, v11);
  id v15 = v26;
  if (isReference)
  {
    uint64_t v16 = objc_msgSend_useMMCSEncryptionV2(v26, (const char *)v26, v13, v14);
    uint64_t v20 = v16;
    if (v16)
    {
      int v21 = objc_msgSend_BOOLValue(v16, v17, v18, v19);
      if (v21 != objc_msgSend_useMMCSEncryptionV2(self, v22, v23, v24)) {
        objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v25, *MEMORY[0x1E4F1C3C8], @"Value specified for CKAssetTransferOptions.useMMCSEncryptionV2 is inconsistent with referenced asset encryption.");
      }
    }

    id v15 = v26;
  }

  MEMORY[0x1F41817F8](isReference, v15);
}

- (BOOL)useMMCSEncryptionV2
{
  if (objc_msgSend_isReference(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_assetReference(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_fileSignature(v8, v9, v10, v11);
    char isValidV2Signature = objc_msgSend_isValidV2Signature_(CKSignatureGenerator, v13, (uint64_t)v12, v14);
  }
  else
  {
    uint64_t v8 = objc_msgSend_assetTransferOptions(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_useMMCSEncryptionV2(v8, v16, v17, v18);
    char isValidV2Signature = objc_msgSend_BOOLValue(v12, v19, v20, v21);
  }
  BOOL v22 = isValidV2Signature;

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v185 = a3;
  uint64_t v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_arrayIndex(self, v5, v6, v7);
  if ((v8 & 0x8000000000000000) == 0) {
    objc_msgSend_encodeInt64_forKey_(v185, v9, v8, @"AssetArrayIndex");
  }
  uint64_t v12 = objc_msgSend_UUID(self, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v185, v13, (uint64_t)v12, @"AssetUUID");

  uint64_t v14 = self;
  objc_sync_enter(v14);
  objc_msgSend_encodeObject_forKey_(v185, v15, (uint64_t)v14->_fileURL, @"AssetFileURL");
  objc_sync_exit(v14);

  uint64_t v19 = objc_msgSend_signature(v14, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v185, v20, (uint64_t)v19, @"AssetSignature");

  uint64_t v24 = objc_msgSend_itemTypeHint(v14, v21, v22, v23);
  objc_msgSend_encodeObject_forKey_(v185, v25, (uint64_t)v24, @"AssetTypeHint");

  uint64_t v29 = objc_msgSend_assetReference(v14, v26, v27, v28);
  objc_msgSend_encodeObject_forKey_(v185, v30, (uint64_t)v29, @"AssetReference");

  uint64_t v34 = objc_msgSend_paddedFileSize(v14, v31, v32, v33);
  objc_msgSend_encodeInt64_forKey_(v185, v35, v34, @"AssetPaddedSize");
  uint64_t v39 = objc_msgSend_verificationKey(v14, v36, v37, v38);
  objc_msgSend_encodeObject_forKey_(v185, v40, (uint64_t)v39, @"AssetVerificationKey");

  uint64_t v44 = objc_msgSend_size(v14, v41, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v185, v45, v44, @"AssetSize");
  uint64_t hasSize = objc_msgSend_hasSize(v14, v46, v47, v48);
  objc_msgSend_encodeBool_forKey_(v185, v50, hasSize, @"AssetHasSize");
  uint64_t v54 = objc_msgSend_uploadReceipt(v14, v51, v52, v53);
  objc_msgSend_encodeObject_forKey_(v185, v55, (uint64_t)v54, @"AssetUploadReceipt");

  objc_msgSend_uploadReceiptExpiration(v14, v56, v57, v58);
  objc_msgSend_encodeDouble_forKey_(v185, v59, @"AssetUploadReceiptExpiration", v60);
  long long v64 = objc_msgSend_deviceID(v14, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v185, v65, (uint64_t)v64, @"AssetDeviceID");

  uint64_t v69 = objc_msgSend_fileID(v14, v66, v67, v68);
  objc_msgSend_encodeObject_forKey_(v185, v70, (uint64_t)v69, @"AssetFileID");

  uint64_t v74 = objc_msgSend_fileHandle(v14, v71, v72, v73);
  objc_msgSend_encodeObject_forKey_(v185, v75, (uint64_t)v74, @"KeptAliveFileHandle");

  uint64_t v79 = objc_msgSend_generationCountToSave(v14, v76, v77, v78);
  objc_msgSend_encodeObject_forKey_(v185, v80, (uint64_t)v79, @"AssetGenerationID");

  uint64_t v84 = objc_msgSend_downloadURLTemplate(v14, v81, v82, v83);
  objc_msgSend_encodeObject_forKey_(v185, v85, (uint64_t)v84, @"AssetDownloadURLTemplate");

  v89 = objc_msgSend_downloadURLExpiration(v14, v86, v87, v88);
  objc_msgSend_encodeObject_forKey_(v185, v90, (uint64_t)v89, @"AssetDownloadURLExpiration");

  v94 = objc_msgSend_downloadBaseURL(v14, v91, v92, v93);
  objc_msgSend_encodeObject_forKey_(v185, v95, (uint64_t)v94, @"AssetDownloadBaseUrl");

  uint64_t v99 = objc_msgSend_contentBaseURL(v14, v96, v97, v98);
  objc_msgSend_encodeObject_forKey_(v185, v100, (uint64_t)v99, @"AssetContentBaseURL");

  id v104 = objc_msgSend_owner(v14, v101, v102, v103);
  objc_msgSend_encodeObject_forKey_(v185, v105, (uint64_t)v104, @"AssetOwner");

  v109 = objc_msgSend_authToken(v14, v106, v107, v108);
  objc_msgSend_encodeObject_forKey_(v185, v110, (uint64_t)v109, @"AssetAuthToken");

  id v114 = objc_msgSend_requestor(v14, v111, v112, v113);
  objc_msgSend_encodeObject_forKey_(v185, v115, (uint64_t)v114, @"AssetRequestor");

  uint64_t v119 = objc_msgSend_wasCached(v14, v116, v117, v118);
  objc_msgSend_encodeBool_forKey_(v185, v120, v119, @"WasCached");
  v124 = objc_msgSend_wrappedAssetKey(v14, v121, v122, v123);
  objc_msgSend_encodeObject_forKey_(v185, v125, (uint64_t)v124, @"WrappedAssetKey");

  uint64_t v129 = objc_msgSend_clearAssetKey(v14, v126, v127, v128);
  objc_msgSend_encodeObject_forKey_(v185, v130, (uint64_t)v129, @"ClearAssetKey");

  uint64_t v134 = objc_msgSend_exposeAssetKey(v14, v131, v132, v133);
  objc_msgSend_encodeBool_forKey_(v185, v135, v134, @"ExposeAssetKey");
  if (v134)
  {
    v139 = objc_msgSend_assetKey(v14, v136, v137, v138);
    objc_msgSend_encodeObject_forKey_(v185, v140, (uint64_t)v139, @"AssetKey");
  }
  v141 = objc_msgSend_referenceSignature(v14, v136, v137, v138);
  objc_msgSend_encodeObject_forKey_(v185, v142, (uint64_t)v141, @"ReferenceSignature");

  uint64_t v146 = objc_msgSend_uploaded(v14, v143, v144, v145);
  objc_msgSend_encodeBool_forKey_(v185, v147, v146, @"AssetUploaded");
  v151 = objc_msgSend_recordID(v14, v148, v149, v150);
  objc_msgSend_encodeObject_forKey_(v185, v152, (uint64_t)v151, @"RecordID");

  uint64_t RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v14, v153, v154, v155);
  objc_msgSend_encodeBool_forKey_(v185, v157, RawEncryptedData, @"ShouldReadRawEncryptedData");
  uint64_t v161 = objc_msgSend_assetTransferOptions(v14, v158, v159, v160);
  objc_msgSend_encodeObject_forKey_(v185, v162, (uint64_t)v161, @"AssetTransferOptions");

  uint64_t v166 = objc_msgSend_storageGroupingPolicy(v14, v163, v164, v165);
  objc_msgSend_encodeInteger_forKey_(v185, v167, v166, @"StorageGroupingPolicy");
  uint64_t v171 = objc_msgSend_assetChunkerOptions(v14, v168, v169, v170);
  objc_msgSend_encodeObject_forKey_(v185, v172, (uint64_t)v171, @"AssetChunkerOptions");

  uint64_t AssetContentUsingClientProxy = objc_msgSend_shouldReadAssetContentUsingClientProxy(v14, v173, v174, v175);
  objc_msgSend_encodeBool_forKey_(v185, v177, AssetContentUsingClientProxy, @"ShouldReadAssetContentUsingClientProxy");
  if ((AssetContentUsingClientProxy & 1) == 0)
  {
    v181 = objc_msgSend_assetContent(v14, v178, v179, v180);
    objc_msgSend_encodeObject_forKey_(v185, v182, (uint64_t)v181, @"InMemoryContent");
  }
  v183 = objc_msgSend_boundaryKey(v14, v178, v179, v180);
  objc_msgSend_encodeObject_forKey_(v185, v184, (uint64_t)v183, @"BoundaryKey");
}

- (CKAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v170.receiver = self;
  v170.super_class = (Class)CKAsset;
  uint64_t v5 = [(CKAsset *)&v170 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    if (objc_msgSend_containsValueForKey_(v4, v7, @"AssetArrayIndex", v8))
    {
      unint64_t v11 = objc_msgSend_decodeInt64ForKey_(v4, v9, @"AssetArrayIndex", v10);
      if (v11 >> 31) {
        uint64_t v12 = -1;
      }
      else {
        uint64_t v12 = v11;
      }
    }
    else
    {
      uint64_t v12 = -1;
    }
    v5->_arrayIndex = v12;
    uint64_t v13 = objc_opt_class();
    id v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"AssetUUID");
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = v15;
    }
    else
    {
      CKCreateGUID();
      uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    UUID = v5->_UUID;
    v5->_UUID = v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"AssetFileURL");
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"AssetSignature");
    signature = v5->_signature;
    v5->_signature = (NSData *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"AssetTypeHint");
    itemTypeHint = v5->_itemTypeHint;
    v5->_itemTypeHint = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"AssetReference");
    assetReference = v5->_assetReference;
    v5->_assetReference = (CKAssetReference *)v33;

    if (v5->_assetReference)
    {
      uint64_t v37 = [CKAssetRereferenceInfo alloc];
      id v41 = objc_msgSend_recordID(v5->_assetReference, v38, v39, v40);
      uint64_t v45 = objc_msgSend_zoneID(v41, v42, v43, v44);
      uint64_t v48 = objc_msgSend_initWithSourceZoneID_(v37, v46, (uint64_t)v45, v47);
      assetRereferenceInfo = v5->_assetRereferenceInfo;
      v5->_assetRereferenceInfo = (CKAssetRereferenceInfo *)v48;
    }
    v5->_uint64_t size = objc_msgSend_decodeInt64ForKey_(v4, v35, @"AssetSize", v36);
    v5->_uint64_t hasSize = objc_msgSend_decodeBoolForKey_(v4, v50, @"AssetHasSize", v51);
    if (objc_msgSend_containsValueForKey_(v4, v52, @"AssetPaddedSize", v53))
    {
      uint64_t size = objc_msgSend_decodeInt64ForKey_(v4, v54, @"AssetPaddedSize", v55);
    }
    else if (v5->_hasSize)
    {
      uint64_t size = v5->_size;
    }
    else
    {
      uint64_t size = 0;
    }
    v5->_paddedFileSize = size;
    uint64_t v57 = objc_opt_class();
    uint64_t v59 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, @"AssetVerificationKey");
    verificationKey = v5->_verificationKey;
    v5->_verificationKey = (NSData *)v59;

    uint64_t v61 = objc_opt_class();
    uint64_t v63 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, @"AssetUploadReceipt");
    uploadReceipt = v5->_uploadReceipt;
    v5->_uploadReceipt = (NSString *)v63;

    objc_msgSend_decodeDoubleForKey_(v4, v65, @"AssetUploadReceiptExpiration", v66);
    v5->_uploadReceiptExpiration = v67;
    uint64_t v68 = objc_opt_class();
    uint64_t v70 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, @"AssetDeviceID");
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v70;

    uint64_t v72 = objc_opt_class();
    uint64_t v74 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, @"AssetFileID");
    fileID = v5->_fileID;
    v5->_fileID = (NSNumber *)v74;

    uint64_t v76 = objc_opt_class();
    uint64_t v78 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, @"KeptAliveFileHandle");
    fileHandle = v5->_fileHandle;
    v5->_fileHandle = (NSFileHandle *)v78;

    uint64_t v80 = objc_opt_class();
    uint64_t v82 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, @"AssetGenerationID");
    generationCountToSave = v5->_generationCountToSave;
    v5->_generationCountToSave = (NSNumber *)v82;

    uint64_t v84 = objc_opt_class();
    uint64_t v86 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v85, v84, @"AssetDownloadURLTemplate");
    downloadURLTemplate = v5->_downloadURLTemplate;
    v5->_downloadURLTemplate = (NSString *)v86;

    uint64_t v88 = objc_opt_class();
    uint64_t v90 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v88, @"AssetDownloadURLExpiration");
    downloadURLExpiration = v5->_downloadURLExpiration;
    v5->_downloadURLExpiration = (NSDate *)v90;

    uint64_t v92 = objc_opt_class();
    uint64_t v94 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, @"AssetDownloadBaseUrl");
    downloadBaseURL = v5->_downloadBaseURL;
    v5->_downloadBaseURL = (NSString *)v94;

    uint64_t v96 = objc_opt_class();
    uint64_t v98 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, @"AssetContentBaseURL");
    contentBaseURL = v5->_contentBaseURL;
    v5->_contentBaseURL = (NSURL *)v98;

    uint64_t v100 = objc_opt_class();
    uint64_t v102 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v101, v100, @"AssetOwner");
    owner = v5->_owner;
    v5->_owner = (NSString *)v102;

    uint64_t v104 = objc_opt_class();
    uint64_t v106 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v105, v104, @"AssetRequestor");
    requestor = v5->_requestor;
    v5->_requestor = (NSString *)v106;

    uint64_t v108 = objc_opt_class();
    uint64_t v110 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v109, v108, @"AssetAuthToken");
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v110;

    v5->_wasCached = objc_msgSend_decodeBoolForKey_(v4, v112, @"WasCached", v113);
    uint64_t v114 = objc_opt_class();
    uint64_t v116 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v115, v114, @"WrappedAssetKey");
    wrappedAssetKey = v5->_wrappedAssetKey;
    v5->_wrappedAssetKey = (NSData *)v116;

    uint64_t v118 = objc_opt_class();
    uint64_t v120 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v119, v118, @"ClearAssetKey");
    clearAssetKey = v5->_clearAssetKey;
    v5->_clearAssetKey = (NSData *)v120;

    int v124 = objc_msgSend_decodeBoolForKey_(v4, v122, @"ExposeAssetKey", v123);
    v5->_exposeAssetKey = v124;
    if (v124)
    {
      uint64_t v125 = objc_opt_class();
      uint64_t v127 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v126, v125, @"AssetKey");
      assetKey = v5->_assetKey;
      v5->_assetKey = (NSData *)v127;
    }
    uint64_t v129 = objc_opt_class();
    uint64_t v131 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v130, v129, @"ReferenceSignature");
    referenceSignature = v5->_referenceSignature;
    v5->_referenceSignature = (NSData *)v131;

    BOOL v135 = (objc_msgSend_decodeBoolForKey_(v4, v133, @"AssetUploaded", v134) & 1) != 0
        || v5->_uploadReceipt != 0;
    v5->_uploaded = v135;
    uint64_t v136 = objc_opt_class();
    uint64_t v138 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v137, v136, @"RecordID");
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v138;

    v5->_shouldReaduint64_t RawEncryptedData = objc_msgSend_decodeBoolForKey_(v4, v140, @"ShouldReadRawEncryptedData", v141);
    uint64_t v142 = objc_opt_class();
    uint64_t v144 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v143, v142, @"AssetTransferOptions");
    assetTransferOptions = v5->_assetTransferOptions;
    v5->_assetTransferOptions = (CKAssetTransferOptions *)v144;

    v5->_storageGroupingPolicy = objc_msgSend_decodeIntegerForKey_(v4, v146, @"StorageGroupingPolicy", v147);
    id v148 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v149 = objc_opt_class();
    uint64_t v150 = objc_opt_class();
    uint64_t v151 = objc_opt_class();
    uint64_t v154 = objc_msgSend_initWithObjects_(v148, v152, v149, v153, v150, v151, 0);
    uint64_t v156 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v155, (uint64_t)v154, @"AssetChunkerOptions");
    assetChunkerOptions = v5->_assetChunkerOptions;
    v5->_assetChunkerOptions = (NSDictionary *)v156;

    char v160 = objc_msgSend_decodeBoolForKey_(v4, v158, @"ShouldReadAssetContentUsingClientProxy", v159);
    v5->_shouldReaduint64_t AssetContentUsingClientProxy = v160;
    if ((v160 & 1) == 0)
    {
      uint64_t v161 = objc_opt_class();
      uint64_t v163 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v162, v161, @"InMemoryContent");
      assetContent = v5->_assetContent;
      v5->_assetContent = (NSData *)v163;
    }
    uint64_t v165 = objc_opt_class();
    uint64_t v167 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v166, v165, @"BoundaryKey");
    boundaryKey = v5->_boundaryKey;
    v5->_boundaryKey = (NSData *)v167;
  }

  return v5;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (NSData)assetContent
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssetContent:(id)a3
{
}

- (NSString)itemTypeHint
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setItemTypeHint:(id)a3
{
}

- (NSDate)downloadURLExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDownloadURLExpiration:(id)a3
{
}

- (NSString)uploadReceipt
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUploadReceipt:(id)a3
{
}

- (double)uploadReceiptExpiration
{
  return self->_uploadReceiptExpiration;
}

- (void)setUploadReceiptExpiration:(double)a3
{
  self->_uploadReceiptExpiration = a3;
}

- (int64_t)storageGroupingPolicy
{
  return self->_storageGroupingPolicy;
}

- (void)setStorageGroupingPolicy:(int64_t)a3
{
  self->_storageGroupingPolicy = a3;
}

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (void)setShouldReadRawEncryptedData:(BOOL)a3
{
  self->_shouldReaduint64_t RawEncryptedData = a3;
}

- (CKAssetReference)assetReference
{
  return (CKAssetReference *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAssetReference:(id)a3
{
}

- (NSData)boundaryKey
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBoundaryKey:(id)a3
{
}

- (NSString)downloadURLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDownloadURLTemplate:(id)a3
{
}

- (CKRecord)record
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_record);

  return (CKRecord *)WeakRetained;
}

- (void)setRecord:(id)a3
{
}

- (NSString)recordKey
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRecordKey:(id)a3
{
}

- (NSURL)contentBaseURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setContentBaseURL:(id)a3
{
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOwner:(id)a3
{
}

- (NSString)requestor
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRequestor:(id)a3
{
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAuthToken:(id)a3
{
}

- (CKAssetDownloadPreauthorization)downloadPreauthorization
{
  return (CKAssetDownloadPreauthorization *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDownloadPreauthorization:(id)a3
{
}

- (NSString)downloadBaseURL
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDownloadBaseURL:(id)a3
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

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 208, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (NSURL)constructedAssetDownloadURL
{
  return (NSURL *)objc_getProperty(self, a2, 216, 1);
}

- (void)setConstructedAssetDownloadURL:(id)a3
{
}

- (NSString)constructedAssetDownloadURLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setConstructedAssetDownloadURLTemplate:(id)a3
{
}

- (CKMediaItemMaker)mediaItemMaker
{
  return (CKMediaItemMaker *)objc_getProperty(self, a2, 232, 1);
}

- (void)setMediaItemMaker:(id)a3
{
}

- (unint64_t)constructedAssetEstimatedSize
{
  return self->_constructedAssetEstimatedSize;
}

- (void)setConstructedAssetEstimatedSize:(unint64_t)a3
{
  self->_constructedAssetEstimatedSize = a3;
}

- (NSData)constructedAssetDownloadParameters
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setConstructedAssetDownloadParameters:(id)a3
{
}

- (NSURL)realPathURL
{
  return (NSURL *)objc_getProperty(self, a2, 256, 1);
}

- (void)setRealPathURL:(id)a3
{
}

- (CKAssetRereferenceInfo)assetRereferenceInfo
{
  return (CKAssetRereferenceInfo *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAssetRereferenceInfo:(id)a3
{
}

- (unint64_t)reReferenceItemID
{
  return self->_reReferenceItemID;
}

- (void)setReReferenceItemID:(unint64_t)a3
{
  self->_reReferenceItemID = a3;
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSignature:(id)a3
{
}

- (unint64_t)paddedFileSize
{
  return self->_paddedFileSize;
}

- (void)setPaddedFileSize:(unint64_t)a3
{
  self->_paddedFileSize = a3;
}

- (NSData)verificationKey
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setVerificationKey:(id)a3
{
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setUUID:(id)a3
{
}

- (NSNumber)generationCountToSave
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setGenerationCountToSave:(id)a3
{
}

- (BOOL)shouldReadAssetContentUsingClientProxy
{
  return self->_shouldReadAssetContentUsingClientProxy;
}

- (BOOL)exposeAssetKey
{
  return self->_exposeAssetKey;
}

- (void)setExposeAssetKey:(BOOL)a3
{
  self->_exposeAssetKey = a3;
}

- (NSData)assetKey
{
  return (NSData *)objc_getProperty(self, a2, 320, 1);
}

- (void)setAssetKey:(id)a3
{
}

- (NSData)wrappedAssetKey
{
  return (NSData *)objc_getProperty(self, a2, 328, 1);
}

- (void)setWrappedAssetKey:(id)a3
{
}

- (NSData)clearAssetKey
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setClearAssetKey:(id)a3
{
}

- (NSData)referenceSignature
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setReferenceSignature:(id)a3
{
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (void)setWasCached:(BOOL)a3
{
  self->_wasCached = a3;
}

- (BOOL)hasSize
{
  return self->_hasSize;
}

- (void)setHasSize:(BOOL)a3
{
  self->_uint64_t hasSize = a3;
}

- (BOOL)uploaded
{
  return self->_uploaded;
}

- (void)setUploaded:(BOOL)a3
{
  self->_uploaded = a3;
}

- (BOOL)downloaded
{
  return self->_downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (int64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (void)setArrayIndex:(int64_t)a3
{
  self->_arrayIndex = a3;
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 360, 1);
}

- (void)setRecordID:(id)a3
{
}

- (CKMergeableDeltaID)mergeableDeltaID
{
  return (CKMergeableDeltaID *)objc_getProperty(self, a2, 368, 1);
}

- (void)setMergeableDeltaID:(id)a3
{
}

- (int64_t)uploadRank
{
  return self->_uploadRank;
}

- (void)setUploadRank:(int64_t)a3
{
  self->_uploadRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableDeltaID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_clearAssetKey, 0);
  objc_storeStrong((id *)&self->_wrappedAssetKey, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_generationCountToSave, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_assetRereferenceInfo, 0);
  objc_storeStrong((id *)&self->_realPathURL, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadParameters, 0);
  objc_storeStrong((id *)&self->_mediaItemMaker, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadURLTemplate, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_downloadBaseURL, 0);
  objc_storeStrong((id *)&self->_downloadPreauthorization, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_destroyWeak((id *)&self->_record);
  objc_storeStrong((id *)&self->_downloadURLTemplate, 0);
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
  objc_storeStrong((id *)&self->_downloadURLExpiration, 0);
  objc_storeStrong((id *)&self->_itemTypeHint, 0);
  objc_storeStrong((id *)&self->_assetContent, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptions, 0);
  objc_storeStrong((id *)&self->_assetChunkerOptions, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end