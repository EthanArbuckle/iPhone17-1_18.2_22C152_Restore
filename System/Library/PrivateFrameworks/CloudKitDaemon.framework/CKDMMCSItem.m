@interface CKDMMCSItem
- (BOOL)canBeRegistered;
- (BOOL)downloadLooksOkay;
- (BOOL)finished;
- (BOOL)hasOffset;
- (BOOL)hasSize;
- (BOOL)isAlreadyRegistered;
- (BOOL)isPackageManifest;
- (BOOL)isReaderReadFrom;
- (BOOL)isTemporary;
- (BOOL)shouldReadAssetContentUsingClientProxy;
- (BOOL)shouldReadRawEncryptedData;
- (BOOL)usesAssetDownloadStagingManager;
- (CKAsset)asset;
- (CKAssetDownloadPreauthorization)downloadPreauthorization;
- (CKDAssetZoneKey)assetZoneKey;
- (CKDMMCSItem)initWithAsset:(id)a3;
- (CKDMMCSItem)initWithAsset:(id)a3 temporary:(BOOL)a4;
- (CKDMMCSItem)initWithPackage:(id)a3;
- (CKDMMCSItem)initWithPackage:(id)a3 temporary:(BOOL)a4;
- (CKDMMCSItemCommandWriter)writer;
- (CKPackage)package;
- (CKRecordID)recordID;
- (NSData)assetKey;
- (NSData)boundaryKey;
- (NSData)clearAssetKey;
- (NSData)referenceSignature;
- (NSData)signature;
- (NSData)verificationKey;
- (NSData)wrappedAssetKey;
- (NSDictionary)assetChunkerOptions;
- (NSError)error;
- (NSFileHandle)fileHandle;
- (NSMutableArray)sectionItems;
- (NSNumber)deviceID;
- (NSNumber)fileID;
- (NSNumber)generationID;
- (NSNumber)modTimeInSeconds;
- (NSString)authToken;
- (NSString)itemTypeHint;
- (NSString)owner;
- (NSString)putPackageSectionIdentifier;
- (NSString)recordKey;
- (NSString)recordType;
- (NSString)requestor;
- (NSString)trackingUUID;
- (NSString)uploadReceipt;
- (NSURL)constructedAssetDownloadURL;
- (NSURL)contentBaseURL;
- (NSURL)fileURL;
- (double)progress;
- (double)uploadReceiptExpiration;
- (id)CKPropertiesDescription;
- (id)_openInfo;
- (id)clonedFileURLInDestinationDirectory:(id)a3;
- (id)description;
- (id)getFileMetadataWithContainer:(id)a3 fileHandle:(id)a4 error:(id *)a5;
- (id)getFileMetadataWithFileHandle:(id)a3 error:(id *)a4;
- (id)getFileSizeWithError:(id *)a3;
- (id)getFileSizeWithOperation:(id)a3 error:(id *)a4;
- (id)init:(BOOL)a3;
- (id)openWithError:(id *)a3;
- (id)openWithOperation:(id)a3 error:(id *)a4;
- (id)readBytesOfInMemoryAssetContentWithContainer:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6;
- (int64_t)packageIndex;
- (unint64_t)MMCSEncoding;
- (unint64_t)constructedAssetEstimatedSize;
- (unint64_t)downloadTokenExpiration;
- (unint64_t)fileSize;
- (unint64_t)itemID;
- (unint64_t)offset;
- (unint64_t)paddedFileSize;
- (unint64_t)uploadTokenExpiration;
- (unsigned)chunkCount;
- (void)clearFileSize;
- (void)setAssetChunkerOptions:(id)a3;
- (void)setAssetKey:(id)a3;
- (void)setAssetZoneKey:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setBoundaryKey:(id)a3;
- (void)setChunkCount:(unsigned int)a3;
- (void)setClearAssetKey:(id)a3;
- (void)setConstructedAssetDownloadURL:(id)a3;
- (void)setConstructedAssetEstimatedSize:(unint64_t)a3;
- (void)setContentBaseURL:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDownloadLooksOkay:(BOOL)a3;
- (void)setDownloadPreauthorization:(id)a3;
- (void)setDownloadTokenExpiration:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setFileID:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileURL:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGenerationID:(id)a3;
- (void)setHasOffset:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setIsAlreadyRegistered:(BOOL)a3;
- (void)setIsPackageManifest:(BOOL)a3;
- (void)setIsReaderReadFrom:(BOOL)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setItemTypeHint:(id)a3;
- (void)setModTimeInSeconds:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setOwner:(id)a3;
- (void)setPackage:(id)a3;
- (void)setPackageIndex:(int64_t)a3;
- (void)setPaddedFileSize:(unint64_t)a3;
- (void)setProgress:(double)a3;
- (void)setPutPackageSectionIdentifier:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordKey:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setReferenceSignature:(id)a3;
- (void)setRequestor:(id)a3;
- (void)setSectionItems:(id)a3;
- (void)setShouldReadAssetContentUsingClientProxy:(BOOL)a3;
- (void)setShouldReadRawEncryptedData:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setTrackingUUID:(id)a3;
- (void)setUploadReceipt:(id)a3;
- (void)setUploadReceiptExpiration:(double)a3;
- (void)setUploadTokenExpiration:(unint64_t)a3;
- (void)setUsesAssetDownloadStagingManager:(BOOL)a3;
- (void)setVerificationKey:(id)a3;
- (void)setWrappedAssetKey:(id)a3;
- (void)setWriter:(id)a3;
- (void)setupForReReferenceWithAsset:(id)a3 destinationDatabaseScope:(int64_t)a4;
@end

@implementation CKDMMCSItem

- (id)init:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKDMMCSItem;
  id result = [(CKDMMCSItem *)&v5 init];
  if (result)
  {
    *((unsigned char *)result + 13) = a3;
    *((void *)result + 15) = -1;
  }
  return result;
}

- (CKDMMCSItem)initWithAsset:(id)a3
{
  return (CKDMMCSItem *)objc_msgSend_initWithAsset_temporary_(self, a2, (uint64_t)a3, 0);
}

- (CKDMMCSItem)initWithAsset:(id)a3 temporary:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v13 = objc_msgSend_record(v8, v9, v10);
  if (!v13)
  {
    v126 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v126, v127, (uint64_t)a2, self, @"CKDMMCSItem.m", 46, @"Expected non-nil record for %@", v8);
  }
  uint64_t v14 = objc_msgSend_init_(self, v11, v4);
  v15 = (CKDMMCSItem *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 136), a3);
    uint64_t v18 = objc_msgSend_recordID(v13, v16, v17);
    recordID = v15->_recordID;
    v15->_recordID = (CKRecordID *)v18;

    uint64_t v22 = objc_msgSend_recordType(v13, v20, v21);
    recordType = v15->_recordType;
    v15->_recordType = (NSString *)v22;

    uint64_t v26 = objc_msgSend_recordKey(v8, v24, v25);
    recordKey = v15->_recordKey;
    v15->_recordKey = (NSString *)v26;

    uint64_t v30 = objc_msgSend_fileURL(v8, v28, v29);
    fileURL = v15->_fileURL;
    v15->_fileURL = (NSURL *)v30;

    uint64_t v34 = objc_msgSend_deviceID(v8, v32, v33);
    deviceID = v15->_deviceID;
    v15->_deviceID = (NSNumber *)v34;

    uint64_t v38 = objc_msgSend_fileID(v8, v36, v37);
    fileID = v15->_fileID;
    v15->_fileID = (NSNumber *)v38;

    uint64_t v42 = objc_msgSend_generationCountToSave(v8, v40, v41);
    generationID = v15->_generationID;
    v15->_generationID = (NSNumber *)v42;

    uint64_t v46 = objc_msgSend_fileHandle(v8, v44, v45);
    fileHandle = v15->_fileHandle;
    v15->_fileHandle = (NSFileHandle *)v46;

    uint64_t v50 = objc_msgSend_signature(v8, v48, v49);
    signature = v15->_signature;
    v15->_signature = (NSData *)v50;

    uint64_t v54 = objc_msgSend_itemTypeHint(v8, v52, v53);
    itemTypeHint = v15->_itemTypeHint;
    v15->_itemTypeHint = (NSString *)v54;

    uint64_t v58 = objc_msgSend_contentBaseURL(v8, v56, v57);
    contentBaseURL = v15->_contentBaseURL;
    v15->_contentBaseURL = (NSURL *)v58;

    uint64_t v62 = objc_msgSend_owner(v8, v60, v61);
    owner = v15->_owner;
    v15->_owner = (NSString *)v62;

    uint64_t v66 = objc_msgSend_requestor(v8, v64, v65);
    requestor = v15->_requestor;
    v15->_requestor = (NSString *)v66;

    uint64_t v70 = objc_msgSend_authToken(v8, v68, v69);
    authToken = v15->_authToken;
    v15->_authToken = (NSString *)v70;

    uint64_t v74 = objc_msgSend_downloadPreauthorization(v8, v72, v73);
    downloadPreauthorization = v15->_downloadPreauthorization;
    v15->_downloadPreauthorization = (CKAssetDownloadPreauthorization *)v74;

    uint64_t v78 = objc_msgSend_assetKey(v8, v76, v77);
    assetKey = v15->_assetKey;
    v15->_assetKey = (NSData *)v78;

    uint64_t v82 = objc_msgSend_wrappedAssetKey(v8, v80, v81);
    wrappedAssetKey = v15->_wrappedAssetKey;
    v15->_wrappedAssetKey = (NSData *)v82;

    uint64_t v86 = objc_msgSend_clearAssetKey(v8, v84, v85);
    clearAssetKey = v15->_clearAssetKey;
    v15->_clearAssetKey = (NSData *)v86;

    uint64_t v90 = objc_msgSend_boundaryKey(v8, v88, v89);
    boundaryKey = v15->_boundaryKey;
    v15->_boundaryKey = (NSData *)v90;

    uint64_t v94 = objc_msgSend_referenceSignature(v8, v92, v93);
    referenceSignature = v15->_referenceSignature;
    v15->_referenceSignature = (NSData *)v94;

    v15->_shouldReadRawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v8, v96, v97);
    v15->_shouldReadAssetContentUsingClientProxy = objc_msgSend_shouldReadAssetContentUsingClientProxy(v8, v98, v99);
    v15->_downloadTokenExpiration = objc_msgSend_downloadTokenExpiration(v8, v100, v101);
    uint64_t v104 = objc_msgSend_assetChunkerOptions(v8, v102, v103);
    assetChunkerOptions = v15->_assetChunkerOptions;
    v15->_assetChunkerOptions = (NSDictionary *)v104;

    uint64_t v108 = objc_msgSend_constructedAssetDownloadURL(v8, v106, v107);
    constructedAssetDownloadURL = v15->_constructedAssetDownloadURL;
    v15->_constructedAssetDownloadURL = (NSURL *)v108;

    v15->_constructedAssetEstimatedSize = objc_msgSend_constructedAssetEstimatedSize(v8, v110, v111);
    v112 = [CKDAssetZoneKey alloc];
    v115 = objc_msgSend_zoneID(v15->_recordID, v113, v114);
    v116 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v119 = objc_msgSend_useMMCSEncryptionV2(v8, v117, v118);
    v121 = objc_msgSend_numberWithBool_(v116, v120, v119);
    uint64_t v123 = objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_(v112, v122, (uint64_t)v115, 0, v121);
    assetZoneKey = v15->_assetZoneKey;
    v15->_assetZoneKey = (CKDAssetZoneKey *)v123;
  }
  return v15;
}

- (unint64_t)MMCSEncoding
{
  v3 = (void *)MEMORY[0x1E4F1A3B8];
  BOOL v4 = objc_msgSend_signature(self, a2, v2);
  if (objc_msgSend_isValidV2Signature_(v3, v5, (uint64_t)v4)) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = 1;
  }

  return v6;
}

- (void)setupForReReferenceWithAsset:(id)a3 destinationDatabaseScope:(int64_t)a4
{
  id v6 = a3;
  v9 = objc_msgSend_assetRereferenceInfo(v6, v7, v8);
  objc_msgSend_contentBaseURL(v9, v10, v11);
  uint64_t v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
  contentBaseURL = self->_contentBaseURL;
  self->_contentBaseURL = v12;

  v16 = objc_msgSend_assetRereferenceInfo(v6, v14, v15);
  objc_msgSend_requestor(v16, v17, v18);
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestor = self->_requestor;
  self->_requestor = v19;

  v23 = objc_msgSend_assetRereferenceInfo(v6, v21, v22);
  objc_msgSend_downloadToken(v23, v24, v25);
  uint64_t v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  authToken = self->_authToken;
  self->_authToken = v26;

  uint64_t v30 = objc_msgSend_assetRereferenceInfo(v6, v28, v29);
  self->_downloadTokenExpiration = objc_msgSend_downloadTokenExpiration(v30, v31, v32);

  uint64_t v35 = objc_msgSend_useMMCSEncryptionV2(v6, v33, v34);
  objc_msgSend_assetReference(v6, v36, v37);
  id v59 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v38 = [CKDAssetZoneKey alloc];
  uint64_t v41 = objc_msgSend_zoneID(self->_recordID, v39, v40);
  v43 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v42, v35);
  uint64_t v46 = objc_msgSend_recordID(v59, v44, v45);
  uint64_t v49 = objc_msgSend_zoneID(v46, v47, v48);
  uint64_t v52 = objc_msgSend_databaseScope(v59, v50, v51);
  uint64_t isPackageMember = objc_msgSend_isPackageMember(v59, v53, v54);
  isPackageRereference = (CKDAssetZoneKey *)objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_sourceZoneID_sourceDatabaseScope_isPackageRereference_(v38, v56, (uint64_t)v41, a4, v43, v49, v52, isPackageMember);
  assetZoneKey = self->_assetZoneKey;
  self->_assetZoneKey = isPackageRereference;
}

- (CKDMMCSItem)initWithPackage:(id)a3
{
  return (CKDMMCSItem *)objc_msgSend_initWithPackage_temporary_(self, a2, (uint64_t)a3, 0);
}

- (CKDMMCSItem)initWithPackage:(id)a3 temporary:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v13 = objc_msgSend_record(v8, v9, v10);
  if (!v13)
  {
    uint64_t v48 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, self, @"CKDMMCSItem.m", 113, @"Expected non-nil record for %@", v8);
  }
  uint64_t v14 = objc_msgSend_init_(self, v11, v4);
  uint64_t v15 = (CKDMMCSItem *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 144), a3);
    uint64_t v18 = objc_msgSend_recordID(v13, v16, v17);
    recordID = v15->_recordID;
    v15->_recordID = (CKRecordID *)v18;

    uint64_t v22 = objc_msgSend_recordType(v13, v20, v21);
    recordType = v15->_recordType;
    v15->_recordType = (NSString *)v22;

    uint64_t v26 = objc_msgSend_recordKey(v8, v24, v25);
    recordKey = v15->_recordKey;
    v15->_recordKey = (NSString *)v26;

    if (objc_msgSend_useMMCSEncryptionV2(v8, v28, v29))
    {
      uint64_t v32 = objc_msgSend_boundaryKey(v8, v30, v31);
      boundaryKey = v15->_boundaryKey;
      v15->_boundaryKey = (NSData *)v32;

      if (!v15->_boundaryKey)
      {
        uint64_t v50 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v30, v31);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, v15, @"CKDMMCSItem.m", 122, @"Expected non-nil boundary key for %@", v8);
      }
    }
    v15->_shouldReadRawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v8, v30, v31);
    uint64_t v34 = [CKDAssetZoneKey alloc];
    uint64_t v37 = objc_msgSend_zoneID(v15->_recordID, v35, v36);
    uint64_t v38 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v41 = objc_msgSend_useMMCSEncryptionV2(v8, v39, v40);
    v43 = objc_msgSend_numberWithBool_(v38, v42, v41);
    uint64_t v45 = objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_(v34, v44, (uint64_t)v37, 0, v43);
    assetZoneKey = v15->_assetZoneKey;
    v15->_assetZoneKey = (CKDAssetZoneKey *)v45;
  }
  return v15;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_hasSize = 1;
  self->_fileSize = a3;
}

- (BOOL)canBeRegistered
{
  return objc_msgSend_fileSize(self, a2, v2) != 0;
}

- (void)clearFileSize
{
  self->_hasSize = 0;
  self->_fileSize = 0;
}

- (void)setOffset:(unint64_t)a3
{
  self->_hasOffset = 1;
  self->_offset = a3;
}

- (id)CKPropertiesDescription
{
  v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 17);
  if (objc_msgSend_itemID(self, v4, v5))
  {
    id v8 = NSString;
    uint64_t v9 = objc_msgSend_itemID(self, v6, v7);
    uint64_t v11 = objc_msgSend_stringWithFormat_(v8, v10, @"itemID=%llu", v9);
    objc_msgSend_addObject_(v3, v12, (uint64_t)v11);
  }
  v13 = objc_msgSend_putPackageSectionIdentifier(self, v6, v7);

  if (v13)
  {
    v16 = NSString;
    uint64_t v17 = objc_msgSend_putPackageSectionIdentifier(self, v14, v15);
    v19 = objc_msgSend_stringWithFormat_(v16, v18, @"putPackageSectionIdentifier=%@", v17);
    objc_msgSend_addObject_(v3, v20, (uint64_t)v19);
  }
  uint64_t v21 = objc_msgSend_trackingUUID(self, v14, v15);

  if (v21)
  {
    v24 = NSString;
    uint64_t v25 = objc_msgSend_trackingUUID(self, v22, v23);
    v27 = objc_msgSend_stringWithFormat_(v24, v26, @"trackingUUID=%@", v25);
    objc_msgSend_addObject_(v3, v28, (uint64_t)v27);
  }
  if (objc_msgSend_hasSize(self, v22, v23))
  {
    uint64_t v31 = NSString;
    uint64_t v32 = objc_msgSend_fileSize(self, v29, v30);
    uint64_t v34 = objc_msgSend_stringWithFormat_(v31, v33, @"size=%llu", v32);
    objc_msgSend_addObject_(v3, v35, (uint64_t)v34);
  }
  if (objc_msgSend_paddedFileSize(self, v29, v30))
  {
    uint64_t v38 = NSString;
    uint64_t v39 = objc_msgSend_paddedFileSize(self, v36, v37);
    uint64_t v41 = objc_msgSend_stringWithFormat_(v38, v40, @"paddedSize=%llu", v39);
    objc_msgSend_addObject_(v3, v42, (uint64_t)v41);
  }
  if (objc_msgSend_hasOffset(self, v36, v37))
  {
    uint64_t v45 = NSString;
    uint64_t v46 = objc_msgSend_offset(self, v43, v44);
    uint64_t v48 = objc_msgSend_stringWithFormat_(v45, v47, @"offset=%llu", v46);
    objc_msgSend_addObject_(v3, v49, (uint64_t)v48);
  }
  uint64_t v50 = objc_msgSend_recordKey(self, v43, v44);

  if (v50)
  {
    uint64_t v53 = NSString;
    uint64_t v54 = objc_msgSend_recordKey(self, v51, v52);
    v56 = objc_msgSend_stringWithFormat_(v53, v55, @"recordKey=%@", v54);
    objc_msgSend_addObject_(v3, v57, (uint64_t)v56);
  }
  uint64_t v58 = objc_msgSend_fileURL(self, v51, v52);

  if (v58)
  {
    uint64_t v61 = NSString;
    uint64_t v62 = objc_msgSend_fileURL(self, v59, v60);
    uint64_t v65 = objc_msgSend_CKSanitizedPath(v62, v63, v64);
    v67 = objc_msgSend_stringWithFormat_(v61, v66, @"path=\"%@\"", v65);
    objc_msgSend_addObject_(v3, v68, (uint64_t)v67);
  }
  uint64_t v69 = objc_msgSend_signature(self, v59, v60);

  if (v69)
  {
    v72 = NSString;
    uint64_t v73 = objc_msgSend_signature(self, v70, v71);
    v75 = objc_msgSend_stringWithFormat_(v72, v74, @"signature=%@", v73);
    objc_msgSend_addObject_(v3, v76, (uint64_t)v75);
  }
  uint64_t v77 = objc_msgSend_deviceID(self, v70, v71);

  if (v77)
  {
    v80 = NSString;
    uint64_t v81 = objc_msgSend_deviceID(self, v78, v79);
    v83 = objc_msgSend_stringWithFormat_(v80, v82, @"deviceID=%@", v81);
    objc_msgSend_addObject_(v3, v84, (uint64_t)v83);
  }
  uint64_t v85 = objc_msgSend_fileID(self, v78, v79);

  if (v85)
  {
    v88 = NSString;
    uint64_t v89 = objc_msgSend_fileID(self, v86, v87);
    v91 = objc_msgSend_stringWithFormat_(v88, v90, @"fileID=%@", v89);
    objc_msgSend_addObject_(v3, v92, (uint64_t)v91);
  }
  uint64_t v93 = objc_msgSend_generationID(self, v86, v87);

  if (v93)
  {
    v96 = NSString;
    uint64_t v97 = objc_msgSend_generationID(self, v94, v95);
    uint64_t v99 = objc_msgSend_stringWithFormat_(v96, v98, @"generationID=%@", v97);
    objc_msgSend_addObject_(v3, v100, (uint64_t)v99);
  }
  uint64_t v101 = objc_msgSend_fileHandle(self, v94, v95);

  if (v101)
  {
    uint64_t v104 = NSString;
    v105 = objc_msgSend_fileHandle(self, v102, v103);
    uint64_t v107 = objc_msgSend_stringWithFormat_(v104, v106, @"fileHandle=\"%@\"", v105);
    objc_msgSend_addObject_(v3, v108, (uint64_t)v107);
  }
  v109 = objc_msgSend_contentBaseURL(self, v102, v103);

  if (v109)
  {
    v112 = NSString;
    v113 = objc_msgSend_contentBaseURL(self, v110, v111);
    v115 = objc_msgSend_stringWithFormat_(v112, v114, @"contentBaseURL=%@", v113);
    objc_msgSend_addObject_(v3, v116, (uint64_t)v115);
  }
  v117 = objc_msgSend_owner(self, v110, v111);

  if (v117)
  {
    v120 = NSString;
    v121 = objc_msgSend_owner(self, v118, v119);
    uint64_t v123 = objc_msgSend_stringWithFormat_(v120, v122, @"owner=%@", v121);
    objc_msgSend_addObject_(v3, v124, (uint64_t)v123);
  }
  uint64_t v125 = objc_msgSend_requestor(self, v118, v119);
  if (v125)
  {
    v128 = (void *)v125;
    uint64_t v129 = objc_msgSend_owner(self, v126, v127);
    if (v129)
    {
      v132 = (void *)v129;
      v133 = objc_msgSend_requestor(self, v130, v131);
      v136 = objc_msgSend_owner(self, v134, v135);
      char isEqualToString = objc_msgSend_isEqualToString_(v133, v137, (uint64_t)v136);

      if (isEqualToString) {
        goto LABEL_37;
      }
    }
    else
    {
    }
    v139 = NSString;
    v140 = objc_msgSend_requestor(self, v126, v127);
    v142 = objc_msgSend_stringWithFormat_(v139, v141, @"requestor=%@", v140);
    objc_msgSend_addObject_(v3, v143, (uint64_t)v142);
  }
LABEL_37:
  v144 = objc_msgSend_authToken(self, v126, v127);

  if (v144)
  {
    v147 = NSString;
    v148 = objc_msgSend_authToken(self, v145, v146);
    v150 = objc_msgSend_stringWithFormat_(v147, v149, @"authToken=%@", v148);
    objc_msgSend_addObject_(v3, v151, (uint64_t)v150);
  }
  v152 = objc_msgSend_uploadReceipt(self, v145, v146);

  if (v152)
  {
    v155 = NSString;
    v156 = objc_msgSend_uploadReceipt(self, v153, v154);
    v158 = objc_msgSend_stringWithFormat_(v155, v157, @"uploadReceipt=%@", v156);
    objc_msgSend_addObject_(v3, v159, (uint64_t)v158);
  }
  objc_msgSend_uploadReceiptExpiration(self, v153, v154);
  if (v161 != 0.0)
  {
    v162 = NSString;
    id v163 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    objc_msgSend_uploadReceiptExpiration(self, v164, v165);
    v168 = objc_msgSend_initWithTimeIntervalSince1970_(v163, v166, v167);
    v170 = objc_msgSend_stringWithFormat_(v162, v169, @"uploadReceiptExpiration=%@", v168);
    objc_msgSend_addObject_(v3, v171, (uint64_t)v170);
  }
  v172 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v160, 5);
  if (objc_msgSend_finished(self, v173, v174)) {
    objc_msgSend_addObject_(v172, v175, @"finished");
  }
  if (objc_msgSend_isTemporary(self, v175, v176)) {
    objc_msgSend_addObject_(v172, v177, @"temporary");
  }
  if (objc_msgSend_shouldReadRawEncryptedData(self, v177, v178)) {
    objc_msgSend_addObject_(v172, v179, @"read-encrypted");
  }
  if (objc_msgSend_shouldReadAssetContentUsingClientProxy(self, v179, v180)) {
    objc_msgSend_addObject_(v172, v181, @"read-from-client-proxy");
  }
  v183 = objc_msgSend_downloadPreauthorization(self, v181, v182);

  if (v183) {
    objc_msgSend_addObject_(v172, v184, @"has-download-preauth");
  }
  if (objc_msgSend_count(v172, v184, v185))
  {
    v188 = NSString;
    v189 = objc_msgSend_componentsJoinedByString_(v172, v186, @"|");
    v191 = objc_msgSend_stringWithFormat_(v188, v190, @"flags=%@", v189);
    objc_msgSend_addObject_(v3, v192, (uint64_t)v191);
  }
  v193 = objc_msgSend_error(self, v186, v187);

  if (v193)
  {
    v196 = NSString;
    v197 = objc_msgSend_error(self, v194, v195);
    v199 = objc_msgSend_stringWithFormat_(v196, v198, @"error=%@", v197);
    objc_msgSend_addObject_(v3, v200, (uint64_t)v199);
  }
  v201 = objc_msgSend_componentsJoinedByString_(v3, v194, @", ");

  return v201;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSItem *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)_openInfo
{
  if (objc_msgSend_usesAssetDownloadStagingManager(self, a2, v2))
  {
    id v4 = objc_alloc(MEMORY[0x1E4F19E60]);
    uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v8 = objc_msgSend_itemID(self, v6, v7);
    uint64_t v10 = objc_msgSend_numberWithUnsignedLongLong_(v5, v9, v8);
    v13 = objc_msgSend_trackingUUID(self, v11, v12);
    v16 = objc_msgSend_signature(self, v14, v15);
    uint64_t v18 = objc_msgSend_initWithItemID_trackingUUID_signature_(v4, v17, (uint64_t)v10, v13, v16);
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F1A120]);
  uint64_t v22 = objc_msgSend_trackingUUID(self, v20, v21);
  uint64_t v25 = objc_msgSend_fileURL(self, v23, v24);
  v28 = objc_msgSend_path(v25, v26, v27);
  uint64_t v31 = objc_msgSend_deviceID(self, v29, v30);
  uint64_t v34 = objc_msgSend_fileID(self, v32, v33);
  uint64_t v37 = objc_msgSend_generationID(self, v35, v36);
  uint64_t RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(self, v38, v39);
  v43 = objc_msgSend_fileHandle(self, v41, v42);
  RawEncryptedData_fileHandle_assetDownloadStagingInfo = objc_msgSend_initWithUUID_path_deviceID_fileID_generationID_shouldReadRawEncryptedData_fileHandle_assetDownloadStagingInfo_(v19, v44, (uint64_t)v22, v28, v31, v34, v37, RawEncryptedData, v43, v18);

  return RawEncryptedData_fileHandle_assetDownloadStagingInfo;
}

- (id)openWithOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend__openInfo(self, v7, v8);
  uint64_t v10 = (void *)MEMORY[0x1C8789E70]();
  if (objc_msgSend_isTemporary(self, v11, v12))
  {
    id v15 = 0;
  }
  else
  {
    v16 = objc_msgSend_path(v9, v13, v14);
    uint64_t v19 = objc_msgSend_UUID(v9, v17, v18);
    if (v19)
    {
      uint64_t v22 = (void *)v19;
      uint64_t v23 = objc_msgSend_operationInfo(v6, v20, v21);
      int v26 = objc_msgSend_usesAssetDownloadStagingManager(v23, v24, v25);

      if (v26)
      {
        id v39 = 0;
        uint64_t v29 = objc_msgSend_openFileWithOpenInfo_error_(v6, v27, (uint64_t)v9, &v39);
        id v15 = v39;
      }
      else
      {
        uint64_t v30 = objc_msgSend_container(v6, v27, v28);
        id v38 = 0;
        uint64_t v29 = objc_msgSend_openFileWithOpenInfo_error_(v30, v31, (uint64_t)v9, &v38);
        id v15 = v38;
      }
      if (v29)
      {
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v20, *MEMORY[0x1E4F19DD8], 3001, v16, @"nil UUID");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  char isTemporary = objc_msgSend_isTemporary(self, v13, v14);
  if (!v6 || (isTemporary & 1) != 0 || objc_msgSend_isLongLived(v6, v33, v34))
  {
    id v37 = v15;
    uint64_t v29 = objc_msgSend_openWithOpenInfo_error_(MEMORY[0x1E4F19E50], v33, (uint64_t)v9, &v37);
    id v35 = v37;

    id v15 = v35;
  }
  else
  {
    uint64_t v29 = 0;
  }
  if (a4 && !v29)
  {
    id v15 = v15;
    *a4 = v15;
  }
LABEL_18:

  return v29;
}

- (id)openWithError:(id *)a3
{
  return (id)objc_msgSend_openWithOperation_error_(self, a2, 0, a3);
}

- (id)getFileSizeWithOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_shouldReadAssetContentUsingClientProxy(self, v7, v8))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = objc_msgSend_asset(self, v9, v10);
    uint64_t v15 = objc_msgSend_size(v12, v13, v14);
    uint64_t v17 = objc_msgSend_numberWithUnsignedLongLong_(v11, v16, v15);
  }
  else if ((objc_msgSend_isTemporary(self, v9, v10) & 1) != 0 {
         || (objc_msgSend_openWithOperation_error_(self, v18, (uint64_t)v6, a4),
  }
             (v20 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F19E50];
    uint64_t v12 = objc_msgSend__openInfo(self, v18, v19);
    uint64_t v17 = objc_msgSend_getFileSizeWithOpenInfo_error_(v21, v22, (uint64_t)v12, a4);
  }
  else
  {
    uint64_t v12 = v20;
    uint64_t v17 = objc_msgSend_fileSize(v20, v18, v19);
  }
  uint64_t v23 = (void *)v17;

  return v23;
}

- (id)getFileSizeWithError:(id *)a3
{
  return (id)objc_msgSend_getFileSizeWithOperation_error_(self, a2, 0, a3);
}

- (id)getFileMetadataWithContainer:(id)a3 fileHandle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1C8789E70]();
  if (objc_msgSend_isTemporary(self, v11, v12))
  {
    id v15 = 0;
  }
  else
  {
    v16 = objc_msgSend__openInfo(self, v13, v14);
    id v25 = 0;
    uint64_t v18 = objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v8, v17, (uint64_t)v9, v16, &v25);
    id v15 = v25;

    if (v18)
    {
      goto LABEL_8;
    }
  }
  uint64_t v19 = v15;
  v20 = (void *)MEMORY[0x1E4F19E50];
  uint64_t v21 = objc_msgSend__openInfo(self, v13, v14);
  id v24 = v15;
  uint64_t v18 = objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v20, v22, (uint64_t)v9, v21, &v24);
  id v15 = v24;

  if (a5 && !v18)
  {
    id v15 = v15;
    *a5 = v15;
  }
LABEL_8:

  return v18;
}

- (id)getFileMetadataWithFileHandle:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F19E50];
  id v7 = a3;
  uint64_t v10 = objc_msgSend__openInfo(self, v8, v9);
  uint64_t v12 = objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v6, v11, (uint64_t)v7, v10, a4);

  return v12;
}

- (id)readBytesOfInMemoryAssetContentWithContainer:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = (void *)MEMORY[0x1C8789E70]();
  if (objc_msgSend_shouldReadAssetContentUsingClientProxy(self, v12, v13))
  {
    v16 = objc_msgSend_trackingUUID(self, v14, v15);
    id v21 = 0;
    uint64_t v18 = objc_msgSend_readBytesOfInMemoryAssetContentWithUUID_offset_length_error_(v10, v17, (uint64_t)v16, a4, a5, &v21);
    id v19 = v21;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 3001, @"Requested to read bytes using client proxy when shouldReadAssetContentUsingClientProxy is NO");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 0;
  }
  if (a6 && !v18) {
    *a6 = v19;
  }

  return v18;
}

- (id)clonedFileURLInDestinationDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1C8789E70]();
  id v8 = objc_msgSend_fileHandle(self, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = v5;
    id v42 = 0;
    int v13 = objc_msgSend_fileDescriptor(v8, v9, v10);
LABEL_5:
    int v20 = v13;
    id v21 = [NSString alloc];
    id v24 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v22, v23);
    uint64_t v27 = objc_msgSend_UUIDString(v24, v25, v26);
    uint64_t v30 = objc_msgSend_signature(self, v28, v29);
    uint64_t v31 = CKStringWithData();
    uint64_t v33 = objc_msgSend_initWithFormat_(v21, v32, @"%@.%@", v27, v31);

    id v35 = objc_msgSend_stringByAppendingPathComponent_(v4, v34, (uint64_t)v33);
    id v38 = (const char *)objc_msgSend_fileSystemRepresentation(v35, v36, v37);
    if (fclonefileat(v20, -1, v38, 0))
    {
      uint64_t v40 = 0;
    }
    else
    {
      uint64_t v40 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v39, (uint64_t)v35);
    }
    uint64_t v5 = v12;

    id v15 = v42;
    goto LABEL_9;
  }
  id v43 = 0;
  uint64_t v14 = objc_msgSend_openWithError_(self, v9, (uint64_t)&v43);
  id v15 = v43;
  uint64_t v11 = objc_msgSend_fileHandle(v14, v16, v17);

  if (v11)
  {
    id v42 = v15;
    uint64_t v12 = v5;
    int v13 = objc_msgSend_fileDescriptor(v11, v18, v19);
    goto LABEL_5;
  }
  uint64_t v40 = 0;
LABEL_9:

  return v40;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (NSNumber)modTimeInSeconds
{
  return self->_modTimeInSeconds;
}

- (void)setModTimeInSeconds:(id)a3
{
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
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
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unsigned)chunkCount
{
  return self->_chunkCount;
}

- (void)setChunkCount:(unsigned int)a3
{
  self->_chunkCount = a3;
}

- (int64_t)packageIndex
{
  return self->_packageIndex;
}

- (void)setPackageIndex:(int64_t)a3
{
  self->_packageIndex = a3;
}

- (NSString)putPackageSectionIdentifier
{
  return self->_putPackageSectionIdentifier;
}

- (void)setPutPackageSectionIdentifier:(id)a3
{
}

- (CKAsset)asset
{
  return self->_asset;
}

- (CKPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
}

- (BOOL)isPackageManifest
{
  return self->_isPackageManifest;
}

- (void)setIsPackageManifest:(BOOL)a3
{
  self->_isPackageManifest = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (void)setRecordKey:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)itemTypeHint
{
  return self->_itemTypeHint;
}

- (void)setItemTypeHint:(id)a3
{
}

- (NSURL)contentBaseURL
{
  return self->_contentBaseURL;
}

- (void)setContentBaseURL:(id)a3
{
}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSString)requestor
{
  return self->_requestor;
}

- (void)setRequestor:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (CKAssetDownloadPreauthorization)downloadPreauthorization
{
  return self->_downloadPreauthorization;
}

- (void)setDownloadPreauthorization:(id)a3
{
}

- (NSString)uploadReceipt
{
  return self->_uploadReceipt;
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

- (NSMutableArray)sectionItems
{
  return self->_sectionItems;
}

- (void)setSectionItems:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSData)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
}

- (NSData)wrappedAssetKey
{
  return self->_wrappedAssetKey;
}

- (void)setWrappedAssetKey:(id)a3
{
}

- (NSData)clearAssetKey
{
  return self->_clearAssetKey;
}

- (void)setClearAssetKey:(id)a3
{
}

- (NSData)boundaryKey
{
  return self->_boundaryKey;
}

- (void)setBoundaryKey:(id)a3
{
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void)setReferenceSignature:(id)a3
{
}

- (CKDMMCSItemCommandWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(id)a3
{
}

- (BOOL)downloadLooksOkay
{
  return self->_downloadLooksOkay;
}

- (void)setDownloadLooksOkay:(BOOL)a3
{
  self->_downloadLooksOkay = a3;
}

- (unint64_t)uploadTokenExpiration
{
  return self->_uploadTokenExpiration;
}

- (void)setUploadTokenExpiration:(unint64_t)a3
{
  self->_uploadTokenExpiration = a3;
}

- (unint64_t)downloadTokenExpiration
{
  return self->_downloadTokenExpiration;
}

- (void)setDownloadTokenExpiration:(unint64_t)a3
{
  self->_downloadTokenExpiration = a3;
}

- (NSDictionary)assetChunkerOptions
{
  return self->_assetChunkerOptions;
}

- (void)setAssetChunkerOptions:(id)a3
{
}

- (CKDAssetZoneKey)assetZoneKey
{
  return self->_assetZoneKey;
}

- (void)setAssetZoneKey:(id)a3
{
}

- (NSURL)constructedAssetDownloadURL
{
  return self->_constructedAssetDownloadURL;
}

- (void)setConstructedAssetDownloadURL:(id)a3
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

- (NSString)trackingUUID
{
  return self->_trackingUUID;
}

- (void)setTrackingUUID:(id)a3
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

- (BOOL)hasOffset
{
  return self->_hasOffset;
}

- (void)setHasOffset:(BOOL)a3
{
  self->_hasOffset = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (void)setShouldReadRawEncryptedData:(BOOL)a3
{
  self->_shouldReaduint64_t RawEncryptedData = a3;
}

- (BOOL)shouldReadAssetContentUsingClientProxy
{
  return self->_shouldReadAssetContentUsingClientProxy;
}

- (void)setShouldReadAssetContentUsingClientProxy:(BOOL)a3
{
  self->_shouldReadAssetContentUsingClientProxy = a3;
}

- (BOOL)usesAssetDownloadStagingManager
{
  return self->_usesAssetDownloadStagingManager;
}

- (void)setUsesAssetDownloadStagingManager:(BOOL)a3
{
  self->_usesAssetDownloadStagingManager = a3;
}

- (BOOL)isAlreadyRegistered
{
  return self->_isAlreadyRegistered;
}

- (void)setIsAlreadyRegistered:(BOOL)a3
{
  self->_isAlreadyRegistered = a3;
}

- (BOOL)isReaderReadFrom
{
  return self->_isReaderReadFrom;
}

- (void)setIsReaderReadFrom:(BOOL)a3
{
  self->_isReaderReadFrom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingUUID, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadURL, 0);
  objc_storeStrong((id *)&self->_assetZoneKey, 0);
  objc_storeStrong((id *)&self->_assetChunkerOptions, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_clearAssetKey, 0);
  objc_storeStrong((id *)&self->_wrappedAssetKey, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
  objc_storeStrong((id *)&self->_downloadPreauthorization, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_itemTypeHint, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_putPackageSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_modTimeInSeconds, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end