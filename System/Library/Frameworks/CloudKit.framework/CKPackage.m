@interface CKPackage
+ (BOOL)supportsSecureCoding;
+ (id)clientPackageDatabaseDirectory;
+ (id)clonedPackageWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 error:(id *)a6;
+ (id)clonedPackageWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 signature:(id)a6 error:(id *)a7;
+ (id)packageInClientWithBasePath:(id)a3 error:(id *)a4;
+ (id)packageInDaemonWithBasePath:(id)a3 error:(id *)a4;
+ (id)packageProcessBasePath;
+ (id)packageWithError:(id *)a3;
+ (id)packageWithPackage:(id)a3 error:(id *)a4;
+ (id)stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier:(id)a3;
+ (void)destroyClientPackageWithDatabaseBasePath:(id)a3 UUID:(id)a4;
+ (void)gcPackagesInDirectory:(id)a3 dbInUseBlock:(id)a4;
- (BOOL)addItem:(id)a3;
- (BOOL)addSection:(id)a3;
- (BOOL)claimOwnershipWithError:(id *)a3;
- (BOOL)downloaded;
- (BOOL)handleChangeStateAction:(int64_t)a3 error:(id *)a4;
- (BOOL)hasSize;
- (BOOL)isOpen;
- (BOOL)isReference;
- (BOOL)movePackagesDatabaseInDirection:(BOOL)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)prepareDBWithError:(id *)a3;
- (BOOL)removeDBAndDeleteFilesWithError:(id *)a3;
- (BOOL)setArchiverInfo:(id)a3 error:(id *)a4;
- (BOOL)shouldReadRawEncryptedData;
- (BOOL)updateItemAtIndex:(int64_t)a3 withFileURL:(id)a4;
- (BOOL)updateItemAtIndex:(int64_t)a3 withSignature:(id)a4 size:(unint64_t)a5 paddedSize:(unint64_t)a6 itemID:(unint64_t)a7 sectionIndex:(unint64_t)a8;
- (BOOL)updateItemsAtIndexes:(id)a3 fileURLs:(id)a4;
- (BOOL)uploaded;
- (BOOL)useMMCSEncryptionV2;
- (BOOL)wasCached;
- (CKAssetTransferOptions)assetTransferOptions;
- (CKDMMCSItem)manifestItem;
- (CKPackage)init;
- (CKPackage)initWithCoder:(id)a3;
- (CKPackageReference)packageReference;
- (CKRecord)record;
- (CKSQLite)sqlite;
- (NSArray)assets;
- (NSData)archiverInfo;
- (NSData)boundaryKey;
- (NSData)signature;
- (NSData)verificationKey;
- (NSIndexSet)downloadItemIndices;
- (NSString)UUID;
- (NSString)databaseBasePath;
- (NSString)description;
- (NSString)recordKey;
- (NSString)rootDatabasePath;
- (_OpaquePCSShareProtection)recordPCS;
- (double)earliestUploadReceiptExpiration;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)_getFromPackagesDBValueForKey:(id)a3;
- (id)_initWithBasePath:(id)a3 UUID:(id)a4;
- (id)_itemOrNilAtIndex:(unint64_t)a3;
- (id)_itemWithColumnsByName:(id)a3;
- (id)_packageDatabasePath;
- (id)_packageDatabasePathWithState:(int64_t)a3;
- (id)clonedPackageInDaemonWithBasePath:(id)a3 filesDuplicatedIntoDirectory:(id)a4 error:(id *)a5;
- (id)initUnreachablePackageWithUUID:(id)a3;
- (id)itemAtIndex:(unint64_t)a3;
- (id)itemEnumerator;
- (id)itemEnumeratorForSectionAtIndex:(unint64_t)a3;
- (id)performTransactionBlock:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)testAddSectionConstraintViolation:(id)a3;
- (int64_t)packageID;
- (int64_t)state;
- (int64_t)storageGroupingPolicy;
- (int64_t)uploadRank;
- (unint64_t)itemCount;
- (unint64_t)itemCountWithError:(id *)a3;
- (unint64_t)nextItemIndex;
- (unint64_t)paddedSize;
- (unint64_t)sectionCount;
- (unint64_t)size;
- (void)_setPackagesDBForKey:(id)a3 data:(id)a4;
- (void)close;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleChangeStateAction:(int64_t)a3;
- (void)releaseDB;
- (void)releaseDBWithRemove:(BOOL)a3;
- (void)removeDB;
- (void)setArchiverInfo:(id)a3;
- (void)setAssetTransferOptions:(id)a3;
- (void)setAssets:(id)a3;
- (void)setBoundaryKey:(id)a3;
- (void)setDownloadItemIndices:(id)a3;
- (void)setDownloaded:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setManifestItem:(id)a3;
- (void)setNextItemIndex:(unint64_t)a3;
- (void)setOpen:(BOOL)a3;
- (void)setPackageID:(int64_t)a3;
- (void)setPackageReference:(id)a3;
- (void)setPaddedSize:(unint64_t)a3;
- (void)setRecord:(id)a3;
- (void)setRecordKey:(id)a3;
- (void)setRecordPCS:(_OpaquePCSShareProtection *)a3;
- (void)setRootDatabasePath:(id)a3;
- (void)setShouldReadRawEncryptedData:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setSqlite:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStorageGroupingPolicy:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUploadRank:(int64_t)a3;
- (void)setUploaded:(BOOL)a3;
- (void)setVerificationKey:(id)a3;
- (void)setWasCached:(BOOL)a3;
@end

@implementation CKPackage

+ (id)stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_CKSafeStringForPathComponent(v3, v4, v5, v6);
  v10 = objc_msgSend_stringByAppendingPathComponent_(&stru_1ED7F5C98, v8, (uint64_t)v7, v9);

  v14 = objc_msgSend_CKSafeHashStringForPathComponent(v3, v11, v12, v13);

  v17 = objc_msgSend_stringByAppendingPathComponent_(v10, v15, (uint64_t)v14, v16);

  return v17;
}

- (id)clonedPackageInDaemonWithBasePath:(id)a3 filesDuplicatedIntoDirectory:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v10 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v79 = 0;
  v11 = objc_msgSend_packageInDaemonWithBasePath_error_(CKPackage, v9, (uint64_t)v8, (uint64_t)&v79);
  id v12 = v79;
  v15 = v12;
  if (v12)
  {
    id v16 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    v70 = a5;
    id v71 = v8;
    id v78 = 0;
    uint64_t v17 = objc_msgSend_itemCountWithError_(self, v13, (uint64_t)&v78, v14);
    id v21 = v78;
    v72 = v11;
    if (v17)
    {
      for (uint64_t i = 0; v17 != i; ++i)
      {
        v23 = objc_msgSend_itemAtIndex_(self, v18, i, v20);
        v27 = v23;
        if (v10)
        {
          v28 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v24, v25, v26);
          v32 = objc_msgSend_UUIDString(v28, v29, v30, v31);

          id v33 = v10;
          v35 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v10, v34, (uint64_t)v32, 0);
          v39 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v36, v37, v38);
          v43 = objc_msgSend_fileURL(v27, v40, v41, v42);
          id v77 = v21;
          objc_msgSend_copyItemAtURL_toURL_error_(v39, v44, (uint64_t)v43, (uint64_t)v35, &v77);
          id v45 = v77;
          v46 = v21;
          id v21 = v45;

          if (v21)
          {

            v11 = v72;
LABEL_19:
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            v53 = objc_msgSend_itemEnumerator(v11, v18, v19, v20);
            uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v73, (uint64_t)v80, 16);
            if (v55)
            {
              uint64_t v59 = v55;
              uint64_t v60 = *(void *)v74;
              do
              {
                for (uint64_t j = 0; j != v59; ++j)
                {
                  if (*(void *)v74 != v60) {
                    objc_enumerationMutation(v53);
                  }
                  v62 = *(void **)(*((void *)&v73 + 1) + 8 * j);
                  v63 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v56, v57, v58);
                  v67 = objc_msgSend_fileURL(v62, v64, v65, v66);
                  objc_msgSend_removeItemAtURL_error_(v63, v68, (uint64_t)v67, 0);
                }
                uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v73, (uint64_t)v80, 16);
              }
              while (v59);
            }

            v11 = v72;
LABEL_27:
            objc_msgSend_removeDB(v11, v18, v19, v20);
            if (v70)
            {
              id v21 = v21;
              id v16 = 0;
              id *v70 = v21;
            }
            else
            {
              id v16 = 0;
            }
            id v8 = v71;
            id v10 = v33;
            goto LABEL_31;
          }
          id v10 = v33;
          v11 = v72;
        }
        else
        {
          v35 = objc_msgSend_fileURL(v23, v24, v25, v26);
        }
        v47 = [CKPackageItem alloc];
        v50 = objc_msgSend_initWithFileURL_(v47, v48, (uint64_t)v35, v49);
        objc_msgSend_addItem_(v11, v51, (uint64_t)v50, v52);
      }
    }
    if (v21)
    {
      id v33 = v10;
      if (v10) {
        goto LABEL_19;
      }
      goto LABEL_27;
    }
    id v16 = v11;
    id v8 = v71;
LABEL_31:
    v15 = 0;
  }

  return v16;
}

- (BOOL)removeDBAndDeleteFilesWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = objc_msgSend_itemEnumerator(self, a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    id v12 = 0;
    uint64_t v13 = *(void *)v32;
    do
    {
      uint64_t v14 = 0;
      v15 = v12;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v5);
        }
        id v16 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
        uint64_t v17 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v8, v9, v10);
        id v21 = objc_msgSend_fileURL(v16, v18, v19, v20);
        id v30 = 0;
        objc_msgSend_removeItemAtURL_error_(v17, v22, (uint64_t)v21, (uint64_t)&v30);
        id v23 = v30;

        if (v15) {
          v24 = v15;
        }
        else {
          v24 = v23;
        }
        id v12 = v24;

        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  objc_msgSend_removeDB(self, v25, v26, v27);
  if (a3) {
    *a3 = v12;
  }

  return v12 == 0;
}

- (CKPackage)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKPackage;
  return [(CKPackage *)&v3 init];
}

- (id)_initWithBasePath:(id)a3 UUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKPackage;
  id v8 = [(CKPackage *)&v21 init];
  id v12 = v8;
  if (v8)
  {
    v8->_state = 0;
    uint64_t v13 = objc_msgSend_copy(v6, v9, v10, v11);
    rootDatabasePath = v12->_rootDatabasePath;
    v12->_rootDatabasePath = (NSString *)v13;

    uint64_t v18 = objc_msgSend_copy(v7, v15, v16, v17);
    UUID = v12->_UUID;
    v12->_UUID = (NSString *)v18;

    v12->_packageID = 0;
    v12->_nextItemIndex = 0;
    v12->_storageGroupingPolicy = 2;
  }

  return v12;
}

- (id)initUnreachablePackageWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CKPackage alloc];
  id v7 = objc_msgSend__initWithBasePath_UUID_(v5, v6, @"/unreachable/package/", (uint64_t)v4);

  objc_msgSend_setState_(v7, v8, 6, v9);
  return v7;
}

+ (id)packageWithError:(id *)a3
{
  id v6 = objc_msgSend_packageProcessBasePath(a1, a2, (uint64_t)a3, v3);
  id v8 = objc_msgSend_packageInClientWithBasePath_error_(a1, v7, (uint64_t)v6, (uint64_t)a3);

  return v8;
}

+ (id)packageWithPackage:(id)a3 error:(id *)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (__sTestOverridesAvailable) {
    BOOL v10 = byte_1E9124EF0 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    v97 = [CKException alloc];
    id v99 = (id)objc_msgSend_initWithName_format_(v97, v98, *MEMORY[0x1E4F1C3B8], @"This initializer should only be called from the client, not cloudd");
    objc_exception_throw(v99);
  }
  uint64_t v11 = v6;
  id v12 = objc_msgSend__packageDatabasePath(v6, v7, v8, v9);
  uint64_t v13 = CKCreateGUID();
  uint64_t v17 = objc_msgSend_packageProcessBasePath(a1, v14, v15, v16);
  uint64_t v18 = [CKPackage alloc];
  uint64_t v20 = objc_msgSend__initWithBasePath_UUID_(v18, v19, (uint64_t)v17, (uint64_t)v13);
  objc_msgSend_setState_(v20, v21, 1, v22);
  uint64_t v26 = objc_msgSend__packageDatabasePath(v20, v23, v24, v25);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v27 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v88 = v27;
    v92 = objc_msgSend_UUID(v11, v89, v90, v91);
    v96 = objc_msgSend_UUID(v20, v93, v94, v95);
    *(_DWORD *)buf = 138544130;
    v102 = v92;
    __int16 v103 = 2114;
    v104 = v96;
    __int16 v105 = 2114;
    v106 = v12;
    __int16 v107 = 2114;
    v108 = v26;
    _os_log_debug_impl(&dword_18AF10000, v88, OS_LOG_TYPE_DEBUG, "Duplicating package: %{public}@ to %{public}@, with DB: %{public}@ to %{public}@", buf, 0x2Au);
  }
  id v100 = 0;
  char v29 = objc_msgSend_copySQLiteFileAtPath_toPath_timeout_error_(CKPackageDB, v28, (uint64_t)v12, (uint64_t)v26, &v100, 1.0);
  id v30 = v100;
  long long v34 = v30;
  if (v29)
  {
    objc_msgSend_setState_(v20, v31, 1, v33);
    uint64_t v38 = objc_msgSend_packageID(v11, v35, v36, v37);
    objc_msgSend_setPackageID_(v20, v39, v38, v40);
    uint64_t v44 = objc_msgSend_wasCached(v11, v41, v42, v43);
    objc_msgSend_setWasCached_(v20, v45, v44, v46);
    uint64_t v50 = objc_msgSend_storageGroupingPolicy(v11, v47, v48, v49);
    objc_msgSend_setStorageGroupingPolicy_(v20, v51, v50, v52);
    v56 = objc_msgSend_packageReference(v11, v53, v54, v55);
    objc_msgSend_setPackageReference_(v20, v57, (uint64_t)v56, v58);

    v62 = objc_msgSend_boundaryKey(v11, v59, v60, v61);
    uint64_t v66 = objc_msgSend_copy(v62, v63, v64, v65);
    objc_msgSend_setBoundaryKey_(v20, v67, (uint64_t)v66, v68);

    v72 = objc_msgSend_assetTransferOptions(v11, v69, v70, v71);
    objc_msgSend_setAssetTransferOptions_(v20, v73, (uint64_t)v72, v74);

    uint64_t v78 = objc_msgSend_paddedSize(v11, v75, v76, v77);
    objc_msgSend_setPaddedSize_(v20, v79, v78, v80);
    if (objc_msgSend_openWithError_(v20, v81, (uint64_t)a4, v82))
    {
      id v86 = v20;
      goto LABEL_17;
    }
    objc_msgSend_removeDB(v20, v83, v84, v85);
  }
  else
  {
    if (a4)
    {
      objc_msgSend_CKClientSuitableError(v30, v31, v32, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_releaseDB(v20, v31, v32, v33);
  }
  id v86 = 0;
LABEL_17:

  return v86;
}

+ (id)clonedPackageWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 signature:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v16 = objc_msgSend_packageWithError_(CKPackage, v14, (uint64_t)a7, v15);
  uint64_t v17 = [CKPackageReference alloc];
  uint64_t v19 = objc_msgSend_initWithRecordID_databaseScope_fieldName_signature_(v17, v18, (uint64_t)v13, a4, v12, v11);

  objc_msgSend_setPackageReference_(v16, v20, (uint64_t)v19, v21);

  return v16;
}

+ (id)clonedPackageWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1F4181798](a1, sel_clonedPackageWithRecordID_databaseScope_fieldName_signature_error_, a3, a4);
}

+ (id)packageInClientWithBasePath:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__sTestOverridesAvailable) {
    BOOL v6 = byte_1E9124EF0 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    long long v31 = [CKException alloc];
    id v33 = (id)objc_msgSend_initWithName_format_(v31, v32, *MEMORY[0x1E4F1C3B8], @"This initializer should only be called from the client, not cloudd");
    objc_exception_throw(v33);
  }
  id v7 = v5;
  uint64_t v8 = CKCreateGUID();
  uint64_t v9 = [CKPackage alloc];
  id v11 = objc_msgSend__initWithBasePath_UUID_(v9, v10, (uint64_t)v7, (uint64_t)v8);
  objc_msgSend_setState_(v11, v12, 1, v13);
  if (objc_msgSend_prepareDBWithError_(v11, v14, (uint64_t)a4, v15))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v19 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = v19;
      uint64_t v26 = objc_msgSend_rootDatabasePath(v11, v23, v24, v25);
      id v30 = objc_msgSend_CKSanitizedPath(v26, v27, v28, v29);
      int v34 = 138543618;
      v35 = v8;
      __int16 v36 = 2114;
      uint64_t v37 = v30;
      _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "Client created package with UUID=%{public}@, path=%{public}@", (uint8_t *)&v34, 0x16u);
    }
    id v20 = v11;
  }
  else
  {
    objc_msgSend_releaseDB(v11, v16, v17, v18);
    id v20 = 0;
  }

  return v20;
}

+ (id)packageInDaemonWithBasePath:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__sTestOverridesAvailable) {
    BOOL v6 = byte_1E9124EF0 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6 && byte_1E912FED0 == 0;
  if (v7 && (byte_1E912FED1 & 1) == 0)
  {
    uint64_t v24 = [CKException alloc];
    id v26 = (id)objc_msgSend_initWithName_format_(v24, v25, *MEMORY[0x1E4F1C3B8], @"This initializer should only be called from cloudd, not the client");
    objc_exception_throw(v26);
  }
  uint64_t v8 = CKCreateGUID();
  uint64_t v9 = [CKPackage alloc];
  id v11 = objc_msgSend__initWithBasePath_UUID_(v9, v10, (uint64_t)v5, (uint64_t)v8);
  objc_msgSend_setState_(v11, v12, 7, v13);
  if (objc_msgSend_prepareDBWithError_(v11, v14, (uint64_t)a4, v15))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v16 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = v16;
      id v23 = objc_msgSend_CKSanitizedPath(v5, v20, v21, v22);
      int v27 = 138543618;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      id v30 = v23;
      _os_log_debug_impl(&dword_18AF10000, v19, OS_LOG_TYPE_DEBUG, "Daemon created package with UUID=%{public}@, path=%{public}@", (uint8_t *)&v27, 0x16u);
    }
    id v17 = v11;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)isReference
{
  id v4 = objc_msgSend_packageReference(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x18C12ADA0]();
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  BOOL v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v62 = 138412290;
    v63 = self;
    _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "encoding package: %@", (uint8_t *)&v62, 0xCu);
  }
  objc_opt_class();
  int v9 = objc_opt_isKindOfClass() & 1;
  if (v9) {
    objc_msgSend_handleChangeStateAction_(self, v7, 0, v8);
  }
  else {
    objc_msgSend_handleChangeStateAction_(self, v7, 4, v8);
  }
  uint64_t v13 = objc_msgSend_state(self, v10, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v4, v14, v13, @"state");
  uint64_t v18 = objc_msgSend_UUID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"UUID");

  id v23 = objc_msgSend_rootDatabasePath(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"DBBase");

  uint64_t v28 = objc_msgSend_packageID(self, v25, v26, v27);
  objc_msgSend_encodeInt64_forKey_(v4, v29, v28, @"packageID");
  uint64_t v33 = objc_msgSend_wasCached(self, v30, v31, v32);
  objc_msgSend_encodeBool_forKey_(v4, v34, v33, @"wasCached");
  uint64_t v38 = objc_msgSend_storageGroupingPolicy(self, v35, v36, v37);
  objc_msgSend_encodeInteger_forKey_(v4, v39, v38, @"storageGroupingPolicy");
  uint64_t v43 = objc_msgSend_packageReference(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v43, @"packageReference");

  if (!v9)
  {
    uint64_t v48 = objc_msgSend_archiverInfo(self, v45, v46, v47);
    objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, @"archiverInfo");
  }
  uint64_t v50 = objc_msgSend_assetTransferOptions(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v50, @"assetTransferOptions");

  uint64_t v55 = objc_msgSend_boundaryKey(self, v52, v53, v54);
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, @"boundaryKey");

  uint64_t v60 = objc_msgSend_paddedSize(self, v57, v58, v59);
  objc_msgSend_encodeInt64_forKey_(v4, v61, v60, @"paddedSize");
}

- (CKPackage)initWithCoder:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)CKPackage;
  BOOL v5 = [(CKPackage *)&v62 init];
  if (!v5)
  {
LABEL_11:
    uint64_t v48 = v5;
    goto LABEL_12;
  }
  BOOL v6 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v7 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"UUID");
  UUID = v5->_UUID;
  v5->_UUID = (NSString *)v9;

  uint64_t v11 = objc_opt_class();
  uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"DBBase");
  rootDatabasePath = v5->_rootDatabasePath;
  v5->_rootDatabasePath = (NSString *)v13;

  v5->_packageID = objc_msgSend_decodeInt64ForKey_(v4, v15, @"packageID", v16);
  v5->_wasCached = objc_msgSend_decodeBoolForKey_(v4, v17, @"wasCached", v18);
  v5->_storageGroupingPolicy = objc_msgSend_decodeIntegerForKey_(v4, v19, @"storageGroupingPolicy", v20);
  v5->_state = objc_msgSend_decodeIntegerForKey_(v4, v21, @"state", v22);
  uint64_t v23 = objc_opt_class();
  uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"packageReference");
  packageReference = v5->_packageReference;
  v5->_packageReference = (CKPackageReference *)v25;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"archiverInfo");
    archiverInfo = v5->_archiverInfo;
    v5->_archiverInfo = (NSData *)v33;

    objc_msgSend_handleChangeStateAction_(v5, v35, 5, v36);
    goto LABEL_6;
  }
  id v61 = 0;
  char v28 = objc_msgSend_handleChangeStateAction_error_(v5, v27, 1, (uint64_t)&v61);
  __int16 v29 = (NSString *)v61;
  id v30 = v29;
  if (v28)
  {

LABEL_6:
    uint64_t v37 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, @"boundaryKey");
    boundaryKey = v5->_boundaryKey;
    v5->_boundaryKey = (NSData *)v39;

    uint64_t v41 = objc_opt_class();
    uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"assetTransferOptions");
    assetTransferOptions = v5->_assetTransferOptions;
    v5->_assetTransferOptions = (CKAssetTransferOptions *)v43;

    v5->_paddedSize = objc_msgSend_decodeInt64ForKey_(v4, v45, @"paddedSize", v46);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v47 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v51 = v5->_UUID;
      uint64_t v52 = v47;
      v56 = objc_msgSend_rootDatabasePath(v5, v53, v54, v55);
      uint64_t v60 = objc_msgSend_CKSanitizedPath(v56, v57, v58, v59);
      *(_DWORD *)buf = 138543618;
      uint64_t v64 = v51;
      __int16 v65 = 2114;
      uint64_t v66 = v60;
      _os_log_debug_impl(&dword_18AF10000, v52, OS_LOG_TYPE_DEBUG, "Decoded package with UUID=%{public}@, path=%{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v50 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v64 = v30;
    _os_log_impl(&dword_18AF10000, v50, OS_LOG_TYPE_INFO, "Warn: CKPackage decoding failed due to: %@", buf, 0xCu);
  }

  uint64_t v48 = 0;
LABEL_12:

  return v48;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, v2, v3) == 1 || objc_msgSend_state(self, v5, v6, v7) == 7)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v11 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = self;
      _os_log_fault_impl(&dword_18AF10000, v11, OS_LOG_TYPE_FAULT, "Package dealloced in wrong state: %@.", buf, 0xCu);
    }
  }
  objc_msgSend_close(self, v8, v9, v10);
  recordPCS = self->_recordPCS;
  if (recordPCS)
  {
    CFRelease(recordPCS);
    self->_recordPCS = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)CKPackage;
  [(CKPackage *)&v13 dealloc];
}

+ (id)packageProcessBasePath
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_sharedManager(CKProcessScopedStateManager, a2, v2, v3);
  uint64_t v8 = objc_msgSend_untrustedEntitlements(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_applicationBundleID(v8, v9, v10, v11);

  if (v12)
  {
    id v13 = v12;
    uint64_t v16 = self;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v35 = sub_18B175C74;
    uint64_t v36 = &unk_1E5465580;
    uint64_t v37 = sel__packagesBasePathForBundleID_;
    uint64_t v38 = v16;
    if (qword_1EB279F18 != -1) {
      dispatch_once(&qword_1EB279F18, &buf);
    }
    uint64_t v17 = (void *)qword_1EB279F10;
    uint64_t v18 = objc_msgSend_stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier_(v16, v14, (uint64_t)v13, v15);
    uint64_t v21 = objc_msgSend_stringByAppendingPathComponent_(v17, v19, (uint64_t)v18, v20);

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v22 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = v22;
      __int16 v29 = objc_msgSend_CKSanitizedPath(v21, v26, v27, v28);
      int v30 = 138543618;
      uint64_t v31 = v29;
      __int16 v32 = 2114;
      id v33 = v13;
      _os_log_debug_impl(&dword_18AF10000, v25, OS_LOG_TYPE_DEBUG, "Package base path=%{public}@, bundleIdentifier=%{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v23 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"application-identifier";
      _os_log_fault_impl(&dword_18AF10000, v23, OS_LOG_TYPE_FAULT, "Could not retrieve application bundle ID because the %@ entitlement is missing", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

+ (id)clientPackageDatabaseDirectory
{
  if (__sTestOverridesAvailable) {
    BOOL v4 = byte_1E9124EF0 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v8 = [CKException alloc];
    id v10 = (id)objc_msgSend_initWithName_format_(v8, v9, *MEMORY[0x1E4F1C3B8], @"This method should only be called from the client, not cloudd");
    objc_exception_throw(v10);
  }
  BOOL v5 = objc_msgSend_packageProcessBasePath(a1, a2, v2, v3);
  uint64_t v6 = sub_18B175D60((uint64_t)CKPackage, v5, 1uLL);

  return v6;
}

- (id)_packageDatabasePathWithState:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_rootDatabasePath(self, a2, a3, v3);
  id v10 = objc_msgSend_UUID(self, v7, v8, v9);
  uint64_t v11 = sub_18B175F2C((uint64_t)CKPackage, v6, v10, a3);

  return v11;
}

- (id)_packageDatabasePath
{
  uint64_t v6 = objc_msgSend_state(self, a2, v2, v3);

  return (id)objc_msgSend__packageDatabasePathWithState_(self, v5, v6, v7);
}

- (BOOL)movePackagesDatabaseInDirection:(BOOL)a3 error:(id *)a4
{
  BOOL v6 = !a3;
  if (a3) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v6) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v9 = objc_msgSend__packageDatabasePathWithState_(self, a2, v7, (uint64_t)a4);
  uint64_t v12 = objc_msgSend__packageDatabasePathWithState_(self, v10, v8, v11);
  objc_msgSend_close(self, v13, v14, v15);
  id v24 = 0;
  char v17 = objc_msgSend_moveSQLiteFileAtPath_toPath_timeout_error_(CKPackageDB, v16, (uint64_t)v9, (uint64_t)v12, &v24, 1.0);
  id v18 = v24;
  uint64_t v22 = v18;
  if (a4 && (v17 & 1) == 0)
  {
    objc_msgSend_CKClientSuitableError(v18, v19, v20, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)handleChangeStateAction:(int64_t)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v30 = off_1E54656D8[a3];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v52 = self;
    __int16 v53 = 2080;
    uint64_t v54 = v30;
    _os_log_debug_impl(&dword_18AF10000, v8, OS_LOG_TYPE_DEBUG, "%@ state change action: %s", buf, 0x16u);
  }
  uint64_t v12 = objc_msgSend_state(self, v9, v10, v11);
  unint64_t v16 = v12;
  switch(a3)
  {
    case 0:
      objc_msgSend_close(self, v13, v14, v15);
      if (v16 == 7)
      {
        objc_msgSend_setState_(self, v17, 8, v19);
        return 1;
      }
      if (v16 == 1)
      {
        objc_msgSend_setState_(self, v17, 2, v19);
        return 1;
      }
      uint64_t v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18, v19);
      uint64_t v25 = v31;
      if (v16 > 0xC) {
        id v33 = "Unknown";
      }
      else {
        id v33 = off_1E5465710[v16];
      }
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 592, @"%@, Unexpected state %s for state change action %s", self, v33, "kCKPackageStateChangeActionEncodeForXPC");
      goto LABEL_66;
    case 1:
      if (v12 == 8)
      {
        objc_msgSend_setState_(self, v13, 9, v15);
        return 1;
      }
      if (v12 == 2)
      {
        objc_msgSend_setState_(self, v13, 3, v15);
        return 1;
      }
      int v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
      uint64_t v25 = v34;
      if (v16 > 0xC) {
        uint64_t v36 = "Unknown";
      }
      else {
        uint64_t v36 = off_1E5465710[v16];
      }
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 603, @"%@, Unexpected state %s for state change action %s", self, v36, "kCKPackageStateChangeActionDecodeFromXPC");
      goto LABEL_66;
    case 2:
      switch(v12)
      {
        case 9:
          if (objc_msgSend_movePackagesDatabaseInDirection_error_(self, v13, 1, (uint64_t)a4)) {
            goto LABEL_13;
          }
          return 0;
        case 3:
          BOOL v22 = 0;
          if (!objc_msgSend_movePackagesDatabaseInDirection_error_(self, v13, 0, (uint64_t)a4)) {
            return v22;
          }
          objc_msgSend_setState_(self, v40, 7, v41);
          break;
        case 2:
          if (objc_msgSend_movePackagesDatabaseInDirection_error_(self, v13, 1, (uint64_t)a4))
          {
LABEL_13:
            BOOL v22 = 1;
            objc_msgSend_setState_(self, v20, 1, v21);
            return v22;
          }
          return 0;
        default:
          uint64_t v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
          uint64_t v25 = v42;
          if (v16 > 0xC) {
            uint64_t v44 = "Unknown";
          }
          else {
            uint64_t v44 = off_1E5465710[v16];
          }
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 629, @"%@, Unexpected state %s for state change action %s", self, v44, "kCKPackageStateChangeActionClaim");
LABEL_66:

          break;
      }
      return 1;
    case 3:
      if (v12 == 7) {
        goto LABEL_30;
      }
      if (v12 == 1) {
        goto LABEL_29;
      }
      uint64_t v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
      uint64_t v25 = v23;
      if (v16 > 0xC) {
        uint64_t v26 = "Unknown";
      }
      else {
        uint64_t v26 = off_1E5465710[v16];
      }
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 640, @"%@, Unexpected state %s for state change action %s", self, v26, "kCKPackageStateChangeActionRemoveDB");
      goto LABEL_66;
    case 4:
      objc_msgSend_close(self, v13, v14, v15);
      switch(v16)
      {
        case 1uLL:
        case 5uLL:
        case 6uLL:
          objc_msgSend_setState_(self, v27, 5, v29);
          break;
        case 7uLL:
        case 0xCuLL:
          objc_msgSend_setState_(self, v27, 11, v29);
          break;
        default:
          uint64_t v48 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v27, v28, v29);
          uint64_t v25 = v48;
          if (v16 > 0xC) {
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 675, @"%@, Unexpected state %s for state change action %s", self, "Unknown", "kCKPackageStateChangeActionArchive");
          }
          else {
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 675, @"%@, Unexpected state %s for state change action %s", self, off_1E5465710[v16], "kCKPackageStateChangeActionArchive");
          }
          goto LABEL_66;
      }
      return 1;
    case 5:
      if (v12 == 11)
      {
        objc_msgSend_setState_(self, v13, 12, v15);
        return 1;
      }
      if (v12 == 5)
      {
        objc_msgSend_setState_(self, v13, 6, v15);
        return 1;
      }
      uint64_t v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
      uint64_t v25 = v37;
      if (v16 > 0xC) {
        uint64_t v39 = "Unknown";
      }
      else {
        uint64_t v39 = off_1E5465710[v16];
      }
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 686, @"%@, Unexpected state %s for state change action %s", self, v39, "kCKPackageStateChangeActionUnarchive");
      goto LABEL_66;
    case 6:
      if (v12 == 8 || v12 == 7)
      {
LABEL_30:
        objc_msgSend_setState_(self, v13, 10, v15);
        return 1;
      }
      if (v12 == 1)
      {
LABEL_29:
        objc_msgSend_setState_(self, v13, 4, v15);
        return 1;
      }
      id v45 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
      uint64_t v25 = v45;
      if (v16 > 0xC) {
        uint64_t v47 = "Unknown";
      }
      else {
        uint64_t v47 = off_1E5465710[v16];
      }
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 654, @"%@, Unexpected state %s for state change action %s", self, v47, "kCKPackageStateChangeActionReleaseDB");
      goto LABEL_66;
    default:
      return 1;
  }
}

- (void)handleChangeStateAction:(int64_t)a3
{
  id v11 = 0;
  char v5 = objc_msgSend_handleChangeStateAction_error_(self, a2, a3, (uint64_t)&v11);
  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    id v7 = v6;
    uint64_t v8 = [CKException alloc];
    id v10 = (id)objc_msgSend_initWithCode_format_(v8, v9, 12, @"%@ state change action %s failed where success was expected. Error: %@", self, off_1E54656D8[a3], v7);
    objc_exception_throw(v10);
  }
}

- (BOOL)setArchiverInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_openWithError_(self, v7, (uint64_t)a4, v8))
  {
    uint64_t v12 = objc_msgSend_sqlite(self, v9, v10, v11);
    unint64_t v16 = objc_msgSend_copy(v6, v13, v14, v15);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_18B176D78;
    v24[3] = &unk_1E5462DC0;
    id v17 = v16;
    id v25 = v17;
    uint64_t v26 = self;
    uint64_t v20 = objc_msgSend_performDatabaseOperation_(v12, v18, (uint64_t)v24, v19);
    uint64_t v21 = v20;
    BOOL v22 = v20 == 0;
    if (v20)
    {
      if (a4) {
        *a4 = v20;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_archiverInfo, v16);
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)prepareDBWithError:(id *)a3
{
  if (!objc_msgSend_openWithError_(self, a2, (uint64_t)a3, v3)) {
    return 0;
  }
  uint64_t v12 = objc_msgSend_archiverInfo(self, v6, v7, v8);
  if (!v12)
  {
    uint64_t v12 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v9, v10, v11);
  }
  id v13 = objc_msgSend_sqlite(self, v9, v10, v11);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_18B176F9C;
  v20[3] = &unk_1E5462DC0;
  v20[4] = self;
  id v21 = v12;
  id v14 = v12;
  id v17 = objc_msgSend_performDatabaseOperation_(v13, v15, (uint64_t)v20, v16);

  if (a3 && v17) {
    *a3 = v17;
  }
  BOOL v18 = v17 == 0;

  return v18;
}

+ (void)destroyClientPackageWithDatabaseBasePath:(id)a3 UUID:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (__sTestOverridesAvailable) {
    BOOL v7 = byte_1E9124EF0 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v14 = [CKException alloc];
    id v16 = (id)objc_msgSend_initWithName_format_(v14, v15, *MEMORY[0x1E4F1C3B8], @"This method should only be called from the client, not cloudd");
    objc_exception_throw(v16);
  }
  uint64_t v8 = v6;
  uint64_t v9 = sub_18B175F2C((uint64_t)CKPackage, v17, v6, 1uLL);
  uint64_t v10 = sub_18B177088((uint64_t)a1, v9);
  objc_msgSend_remove(v10, v11, v12, v13);
}

- (void)releaseDBWithRemove:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  char v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = @"false";
    if (v3) {
      uint64_t v23 = @"true";
    }
    int v24 = 138412546;
    id v25 = self;
    __int16 v26 = 2114;
    uint64_t v27 = v23;
    _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "%@: Releasing DB with remove: %{public}@.", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v9 = objc_msgSend__packageDatabasePath(self, v6, v7, v8);
  objc_msgSend_close(self, v10, v11, v12);
  objc_msgSend_setRootDatabasePath_(self, v13, 0, v14);
  if (v3)
  {
    id v17 = sub_18B177088((uint64_t)CKPackage, v9);
    objc_msgSend_remove(v17, v18, v19, v20);
    objc_msgSend_handleChangeStateAction_(self, v21, 3, v22);
  }
  else
  {
    objc_msgSend_handleChangeStateAction_(self, v15, 6, v16);
  }
}

- (void)removeDB
{
}

- (void)releaseDB
{
}

- (void)setSize:(unint64_t)a3
{
  self->_hasSize = 1;
  self->_size = a3;
}

- (void)setPaddedSize:(unint64_t)a3
{
  self->_paddedSize = a3;
}

- (void)setRecordPCS:(_OpaquePCSShareProtection *)a3
{
  recordPCS = self->_recordPCS;
  if (recordPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      recordPCS = self->_recordPCS;
    }
    self->_recordPCS = a3;
    if (recordPCS)
    {
      CFRelease(recordPCS);
    }
  }
}

- (CKAssetTransferOptions)assetTransferOptions
{
  return self->_assetTransferOptions;
}

- (void)setAssetTransferOptions:(id)a3
{
  id v26 = a3;
  uint64_t v7 = (CKAssetTransferOptions *)objc_msgSend_copy(v26, v4, v5, v6);
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
        objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v25, *MEMORY[0x1E4F1C3C8], @"Value specified forCKAssetTransferOptions.useMMCSEncryptionV2 is inconsistent with referenced package encryption.");
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
    uint64_t v8 = objc_msgSend_packageReference(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_signature(v8, v9, v10, v11);

    if (v12)
    {
      char isValidV2Signature = objc_msgSend_isValidV2Signature_(CKSignatureGenerator, v13, (uint64_t)v12, v15);
    }
    else
    {
      uint64_t v24 = objc_msgSend_assetTransferOptions(self, v13, v14, v15);
      uint64_t v28 = objc_msgSend_useMMCSEncryptionV2(v24, v25, v26, v27);
      char isValidV2Signature = objc_msgSend_BOOLValue(v28, v29, v30, v31);

      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend_assetTransferOptions(self, v5, v6, v7);
    uint64_t v20 = objc_msgSend_useMMCSEncryptionV2(v12, v17, v18, v19);
    char isValidV2Signature = objc_msgSend_BOOLValue(v20, v21, v22, v23);
  }
  return isValidV2Signature;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 10, a4);
  uint64_t v9 = NSString;
  unint64_t v13 = objc_msgSend_state(self, v10, v11, v12);
  if (v13 > 0xC) {
    objc_msgSend_stringWithUTF8String_(v9, v14, (uint64_t)"Unknown", v15);
  }
  else {
  uint64_t v16 = objc_msgSend_stringWithUTF8String_(v9, v14, (uint64_t)off_1E5465710[v13], v15);
  }
  objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v17, @"state", (uint64_t)v16);

  int v21 = objc_msgSend_UUID(self, v18, v19, v20);
  objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v22, @"UUID", (uint64_t)v21);

  if (v6)
  {
    if (objc_msgSend_hasSize(self, v23, v24, v25))
    {
      uint64_t v29 = NSNumber;
      uint64_t v30 = objc_msgSend_size(self, v26, v27, v28);
      id v33 = objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v34, @"size", (uint64_t)v33);
    }
    if (objc_msgSend_paddedSize(self, v26, v27, v28))
    {
      uint64_t v38 = NSNumber;
      uint64_t v39 = objc_msgSend_paddedSize(self, v35, v36, v37);
      uint64_t v42 = objc_msgSend_numberWithUnsignedLongLong_(v38, v40, v39, v41);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v43, @"paddedSize", (uint64_t)v42);
    }
    uint64_t v44 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v35, self->_nextItemIndex, v37);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v45, @"itemCount", (uint64_t)v44);

    uint64_t v49 = objc_msgSend_recordKey(self, v46, v47, v48);

    if (v49)
    {
      __int16 v53 = objc_msgSend_recordKey(self, v50, v51, v52);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v54, @"recordKey", (uint64_t)v53);
    }
    if ((objc_msgSend_uploadRank(self, v50, v51, v52) & 0x8000000000000000) == 0)
    {
      uint64_t v58 = NSNumber;
      uint64_t v59 = objc_msgSend_uploadRank(self, v55, v56, v57);
      objc_super v62 = objc_msgSend_numberWithInteger_(v58, v60, v59, v61);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v63, @"uploadRank", (uint64_t)v62);
    }
    uint64_t v64 = objc_msgSend_rootDatabasePath(self, v55, v56, v57);

    if (v64)
    {
      uint64_t v68 = objc_msgSend_rootDatabasePath(self, v65, v66, v67);
      v72 = objc_msgSend_CKSanitizedPath(v68, v69, v70, v71);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v73, @"rootDatabasePath", (uint64_t)v72);
    }
    uint64_t v74 = objc_msgSend_assets(self, v65, v66, v67);

    if (v74)
    {
      if (v5)
      {
        uint64_t v76 = objc_msgSend_assets(self, v23, v75, v25);
        objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v77, @"assets", (uint64_t)v76);
      }
      else
      {
        uint64_t v78 = NSNumber;
        uint64_t v76 = objc_msgSend_assets(self, v23, v75, v25);
        uint64_t v82 = objc_msgSend_count(v76, v79, v80, v81);
        uint64_t v85 = objc_msgSend_numberWithUnsignedInteger_(v78, v83, v82, v84);
        objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v86, @"assetsCount", (uint64_t)v85);
      }
    }
  }
  v87 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v23, 5, v25);
  v88 = self;
  objc_sync_enter(v88);
  if (objc_msgSend_isOpen(v88, v89, v90, v91)) {
    objc_msgSend_addObject_(v87, v92, @"is-open", v93);
  }
  objc_sync_exit(v88);

  if (objc_msgSend_uploaded(v88, v94, v95, v96)) {
    objc_msgSend_addObject_(v87, v97, @"uploaded", v99);
  }
  if (objc_msgSend_downloaded(v88, v97, v98, v99)) {
    objc_msgSend_addObject_(v87, v100, @"downloaded", v102);
  }
  if (objc_msgSend_storageGroupingPolicy(v88, v100, v101, v102) == 1) {
    objc_msgSend_addObject_(v87, v103, @"group-by-key", v105);
  }
  if (objc_msgSend_count(v87, v103, v104, v105))
  {
    if (v5)
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v106, @"flags", (uint64_t)v87);
    }
    else
    {
      v108 = objc_msgSend_componentsJoinedByString_(v87, v106, @"|", v107);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v109, @"flags", (uint64_t)v108);
    }
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKPackage *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)openWithError:(id *)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend_isOpen(v4, v5, v6, v7))
  {
    BOOL v11 = 1;
  }
  else
  {
    unint64_t v13 = objc_msgSend__packageDatabasePath(v4, v8, v9, v10);
    if (v13)
    {
      uint64_t v14 = sub_18B177088((uint64_t)CKPackage, v13);
      objc_msgSend_setSynchronousMode_(v14, v15, 0, v16);
      objc_msgSend_setShouldVacuum_(v14, v17, 0, v18);
      id v48 = 0;
      objc_msgSend_openWithError_(v14, v19, (uint64_t)&v48, v20);
      id v24 = v48;
      if (!v24)
      {
        uint64_t v25 = NSNumber;
        uint64_t v26 = objc_msgSend_packageID(v4, v21, v22, v23);
        uint64_t v29 = objc_msgSend_numberWithInteger_(v25, v27, v26, v28);
        v49[0] = v29;
        uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)v49, 1);
        uint64_t v33 = objc_msgSend_selectCountFrom_where_bindings_(v14, v32, @"Items", @"packageID = ?", v31);

        if (v33 == -1)
        {
          uint64_t v38 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v21, @"CKInternalErrorDomain", 7000, @"database error initializing package index in %@", v4);
          objc_msgSend_CKClientSuitableError(v38, v39, v40, v41);
          id v24 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend_close(v14, v42, v43, v44);
        }
        else
        {
          id v24 = 0;
          v4->_nextItemIndex = v33;
        }
      }
      BOOL v11 = v24 == 0;
      objc_msgSend_setOpen_(v4, v21, v24 == 0, v23);
      if (v24)
      {
        if (a3) {
          *a3 = v24;
        }
      }
      else
      {
        objc_msgSend_setSqlite_(v4, v45, (uint64_t)v14, v46);
      }
    }
    else
    {
      if (a3)
      {
        int v34 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v12, @"CKInternalErrorDomain", 7000, @"database path is nil for %@", v4);
        objc_msgSend_CKClientSuitableError(v34, v35, v36, v37);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v11 = 0;
    }
  }
  objc_sync_exit(v4);

  return v11;
}

- (void)close
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (objc_msgSend_isOpen(obj, v2, v3, v4))
  {
    uint64_t v8 = objc_msgSend_sqlite(obj, v5, v6, v7);
    objc_msgSend_close(v8, v9, v10, v11);

    objc_msgSend_setSqlite_(obj, v12, 0, v13);
    objc_msgSend_setOpen_(obj, v14, 0, v15);
  }
  objc_sync_exit(obj);
}

- (void)setDownloadItemIndices:(id)a3
{
  BOOL v5 = (NSIndexSet *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  downloadItemIndices = self->_downloadItemIndices;
  self->_downloadItemIndices = v5;

  MEMORY[0x1F41817F8](v5, downloadItemIndices);
}

- (NSIndexSet)downloadItemIndices
{
  uint64_t v3 = self->_downloadItemIndices;
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28D60]);
    uint64_t v8 = objc_msgSend_itemCount(self, v5, v6, v7);
    uint64_t v3 = (NSIndexSet *)objc_msgSend_initWithIndexesInRange_(v4, v9, 0, v8);
  }

  return v3;
}

- (unint64_t)itemCount
{
  return objc_msgSend_itemCountWithError_(self, a2, 0, v2);
}

- (unint64_t)itemCountWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, (uint64_t)a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    if (objc_msgSend_openWithError_(self, v6, (uint64_t)a3, v8)) {
      return self->_nextItemIndex;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v10 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_fault_impl(&dword_18AF10000, v10, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", (uint8_t *)&v11, 0xCu);
    }
  }
  return 0;
}

- (id)_itemWithColumnsByName:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"fileURL", v5);
  uint64_t v7 = [CKPackageItem alloc];
  uint64_t v10 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v8, (uint64_t)v6, v9);
  uint64_t v13 = objc_msgSend_initWithFileURL_(v7, v11, (uint64_t)v10, v12);

  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v3, v14, @"itemID", v15);
  uint64_t v20 = objc_msgSend_integerValue(v16, v17, v18, v19);
  objc_msgSend_setItemID_(v13, v21, v20, v22);

  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v3, v23, @"packageIndex", v24);
  uint64_t v29 = objc_msgSend_integerValue(v25, v26, v27, v28);
  objc_msgSend_setPackageIndex_(v13, v30, v29, v31);

  int v34 = objc_msgSend_objectForKeyedSubscript_(v3, v32, @"signature", v33);
  objc_msgSend_setSignature_(v13, v35, (uint64_t)v34, v36);

  uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v3, v37, @"deviceID", v38);
  objc_msgSend_setDeviceID_(v13, v40, (uint64_t)v39, v41);

  uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v3, v42, @"fileID", v43);
  objc_msgSend_setFileID_(v13, v45, (uint64_t)v44, v46);

  uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v3, v47, @"generationID", v48);
  objc_msgSend_setGenerationID_(v13, v50, (uint64_t)v49, v51);

  uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v3, v52, @"size", v53);
  uint64_t v58 = objc_msgSend_unsignedLongLongValue(v54, v55, v56, v57);
  objc_msgSend_setSize_(v13, v59, v58, v60);

  v63 = objc_msgSend_objectForKeyedSubscript_(v3, v61, @"paddedSize", v62);
  uint64_t v67 = objc_msgSend_unsignedLongLongValue(v63, v64, v65, v66);
  objc_msgSend_setPaddedSize_(v13, v68, v67, v69);

  v72 = objc_msgSend_objectForKeyedSubscript_(v3, v70, @"offset", v71);
  uint64_t v76 = objc_msgSend_unsignedLongLongValue(v72, v73, v74, v75);
  objc_msgSend_setOffset_(v13, v77, v76, v78);

  uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v3, v79, @"sectionIndex", v80);
  uint64_t v85 = objc_msgSend_intValue(v81, v82, v83, v84);
  objc_msgSend_setSectionIndex_(v13, v86, v85, v87);

  uint64_t v90 = objc_msgSend_objectForKeyedSubscript_(v3, v88, @"itemTypeHint", v89);

  objc_msgSend_setItemTypeHint_(v13, v91, (uint64_t)v90, v92);

  return v13;
}

- (id)_itemOrNilAtIndex:(unint64_t)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  if (objc_msgSend_openWithError_(self, a2, 0, v3))
  {
    uint64_t v10 = objc_msgSend_sqlite(self, v6, v7, v8);
    int v11 = NSNumber;
    uint64_t v15 = objc_msgSend_packageID(self, v12, v13, v14);
    uint64_t v18 = objc_msgSend_numberWithInteger_(v11, v16, v15, v17);
    v40[0] = v18;
    int v21 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, a3, v20);
    v40[1] = v21;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v40, 2);
    uint64_t v25 = objc_msgSend_selectAllFrom_where_bindings_(v10, v24, @"Items", @"packageID = ? and packageIndex = ?", v23);

    uint64_t v29 = objc_msgSend_count(v25, v26, v27, v28);
    if (v29)
    {
      if (v29 == 1)
      {
        uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v25, v30, 0, v31);
        uint64_t v9 = objc_msgSend__itemWithColumnsByName_(self, v33, (uint64_t)v32, v34);

LABEL_10:
        goto LABEL_11;
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v35 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v37[0] = 67109378;
        v37[1] = a3;
        __int16 v38 = 2112;
        uint64_t v39 = self;
        _os_log_error_impl(&dword_18AF10000, v35, OS_LOG_TYPE_ERROR, "Duplicate items at index %d in package %@", (uint8_t *)v37, 0x12u);
      }
    }
    uint64_t v9 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (id)itemAtIndex:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    uint64_t v9 = objc_msgSend__itemOrNilAtIndex_(self, v6, a3, v8);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v10 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = self;
      _os_log_fault_impl(&dword_18AF10000, v10, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)itemEnumerator
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, v2, v3) == 7 || objc_msgSend_state(self, v5, v6, v7) == 1)
  {
    int v11 = 0;
    if (objc_msgSend_openWithError_(self, v5, 0, v7))
    {
      int v12 = NSString;
      uint64_t v13 = objc_msgSend_packageID(self, v8, v9, v10);
      uint64_t v16 = objc_msgSend_stringWithFormat_(v12, v14, @"packageID = %ld", v15, v13);
      uint64_t v17 = [CKSQLiteEnumerator alloc];
      int v21 = objc_msgSend_sqlite(self, v18, v19, v20);
      int v11 = objc_msgSend_initWithDatabase_columns_from_where_bindings_orderBy_(v17, v22, (uint64_t)v21, 0, @"Items", v16, 0, &unk_1ED846048);

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = sub_18B178620;
      v27[3] = &unk_1E54655A8;
      v27[4] = self;
      objc_msgSend_setObjectTranslator_(v11, v23, (uint64_t)v27, v24);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v25 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v29 = self;
      _os_log_fault_impl(&dword_18AF10000, v25, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    int v11 = 0;
  }

  return v11;
}

- (id)itemEnumeratorForSectionAtIndex:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    int v12 = 0;
    if (objc_msgSend_openWithError_(self, v6, 0, v8))
    {
      uint64_t v13 = NSString;
      uint64_t v14 = objc_msgSend_packageID(self, v9, v10, v11);
      uint64_t v17 = objc_msgSend_stringWithFormat_(v13, v15, @"packageID = %ld and sectionIndex = %ld", v16, v14, a3);
      uint64_t v18 = [CKSQLiteEnumerator alloc];
      uint64_t v22 = objc_msgSend_sqlite(self, v19, v20, v21);
      int v12 = objc_msgSend_initWithDatabase_columns_from_where_bindings_orderBy_(v18, v23, (uint64_t)v22, 0, @"Items", v17, 0, &unk_1ED846060);

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_18B178830;
      v28[3] = &unk_1E54655A8;
      v28[4] = self;
      objc_msgSend_setObjectTranslator_(v12, v24, (uint64_t)v28, v25);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v26 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v30 = self;
      _os_log_fault_impl(&dword_18AF10000, v26, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    int v12 = 0;
  }

  return v12;
}

- (BOOL)addItem:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7) != 7 && objc_msgSend_state(self, v8, v9, v10) != 1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v18 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v29 = self;
      _os_log_fault_impl(&dword_18AF10000, v18, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (!objc_msgSend_openWithError_(self, v8, 0, v10))
  {
LABEL_10:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend_packageIndex(v4, v11, v12, v13) == -1) {
    unint64_t nextItemIndex = self->_nextItemIndex;
  }
  else {
    unint64_t nextItemIndex = objc_msgSend_packageIndex(v4, v14, v15, v16);
  }
  uint64_t v20 = objc_msgSend_sqlite(self, v14, v15, v16);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_18B178A30;
  v25[3] = &unk_1E54655F8;
  v25[4] = self;
  unint64_t v27 = nextItemIndex;
  id v26 = v4;
  uint64_t v23 = objc_msgSend_performDatabaseOperation_(v20, v21, (uint64_t)v25, v22);
  BOOL v19 = v23 == 0;

  if (!v23) {
    ++self->_nextItemIndex;
  }

LABEL_15:
  return v19;
}

- (BOOL)updateItemAtIndex:(int64_t)a3 withSignature:(id)a4 size:(unint64_t)a5 paddedSize:(unint64_t)a6 itemID:(unint64_t)a7 sectionIndex:(unint64_t)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  if (objc_msgSend_state(self, v15, v16, v17) != 7 && objc_msgSend_state(self, v18, v19, v20) != 1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v29 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v40 = self;
      _os_log_fault_impl(&dword_18AF10000, v29, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!objc_msgSend_openWithError_(self, v18, 0, v20))
  {
LABEL_9:
    BOOL v28 = 0;
    goto LABEL_10;
  }
  uint64_t v24 = objc_msgSend_sqlite(self, v21, v22, v23);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B178F30;
  v31[3] = &unk_1E5465648;
  unint64_t v34 = a5;
  unint64_t v35 = a6;
  unint64_t v36 = a7;
  unint64_t v37 = a8;
  id v32 = v14;
  uint64_t v33 = self;
  int64_t v38 = a3;
  unint64_t v27 = objc_msgSend_performDatabaseOperation_(v24, v25, (uint64_t)v31, v26);
  BOOL v28 = v27 == 0;

LABEL_10:
  return v28;
}

- (BOOL)updateItemAtIndex:(int64_t)a3 withFileURL:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (objc_msgSend_state(self, v7, v8, v9) != 7 && objc_msgSend_state(self, v10, v11, v12) != 1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v21 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v28 = self;
      _os_log_fault_impl(&dword_18AF10000, v21, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!objc_msgSend_openWithError_(self, v10, 0, v12))
  {
LABEL_9:
    BOOL v20 = 0;
    goto LABEL_10;
  }
  uint64_t v16 = objc_msgSend_sqlite(self, v13, v14, v15);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_18B179258;
  v23[3] = &unk_1E54655F8;
  id v24 = v6;
  uint64_t v25 = self;
  int64_t v26 = a3;
  uint64_t v19 = objc_msgSend_performDatabaseOperation_(v16, v17, (uint64_t)v23, v18);
  BOOL v20 = v19 == 0;

LABEL_10:
  return v20;
}

- (BOOL)updateItemsAtIndexes:(id)a3 fileURLs:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_state(self, v9, v10, v11) != 7 && objc_msgSend_state(self, v12, v13, v14) != 1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v30 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v39 = self;
      _os_log_fault_impl(&dword_18AF10000, v30, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_11;
  }
  uint64_t v15 = objc_msgSend_count(v7, v12, v13, v14);
  if (v15 != objc_msgSend_count(v8, v16, v17, v18))
  {
    id v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20, v21);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 1122, @"Expected same count for %@ and %@", v7, v8);
  }
  if (!objc_msgSend_openWithError_(self, v19, 0, v21))
  {
LABEL_11:
    BOOL v29 = 0;
    goto LABEL_12;
  }
  uint64_t v25 = objc_msgSend_sqlite(self, v22, v23, v24);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_18B1795D0;
  v34[3] = &unk_1E5462E10;
  id v35 = v7;
  id v36 = v8;
  unint64_t v37 = self;
  BOOL v28 = objc_msgSend_performDatabaseOperation_(v25, v26, (uint64_t)v34, v27);
  BOOL v29 = v28 == 0;

LABEL_12:
  return v29;
}

- (unint64_t)sectionCount
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, v2, v3) == 7 || objc_msgSend_state(self, v5, v6, v7) == 1)
  {
    if (objc_msgSend_openWithError_(self, v5, 0, v7))
    {
      uint64_t v11 = objc_msgSend_sqlite(self, v8, v9, v10);
      uint64_t v12 = NSNumber;
      uint64_t v16 = objc_msgSend_packageID(self, v13, v14, v15);
      uint64_t v19 = objc_msgSend_numberWithInteger_(v12, v17, v16, v18);
      int64_t v26 = v19;
      uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v26, 1);
      unint64_t v23 = objc_msgSend_selectCountFrom_where_bindings_(v11, v22, @"Sections", @"packageID = ?", v21);
    }
    else
    {
      return -1;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v24 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v28 = self;
      _os_log_fault_impl(&dword_18AF10000, v24, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    return 0;
  }
  return v23;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v68[2] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    uint64_t v12 = 0;
    if (objc_msgSend_openWithError_(self, v6, 0, v8))
    {
      uint64_t v13 = objc_msgSend_sqlite(self, v9, v10, v11);
      uint64_t v14 = NSNumber;
      uint64_t v18 = objc_msgSend_packageID(self, v15, v16, v17);
      uint64_t v21 = objc_msgSend_numberWithInteger_(v14, v19, v18, v20);
      v68[0] = v21;
      uint64_t v24 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v22, a3, v23);
      v68[1] = v24;
      int64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v68, 2);
      BOOL v28 = objc_msgSend_select_from_where_bindings_(v13, v27, (uint64_t)&unk_1ED846078, @"Sections", @"packageID = ? and packageIndex = ?", v26);

      if (objc_msgSend_count(v28, v29, v30, v31) == 1)
      {
        unint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v28, v32, 0, v33);
        id v35 = [CKPackageSection alloc];
        int64_t v38 = objc_msgSend_objectForKeyedSubscript_(v34, v36, @"signature", v37);
        uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v34, v39, @"size", v40);
        uint64_t v45 = objc_msgSend_longLongValue(v41, v42, v43, v44);
        uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v34, v46, @"paddedSize", v47);
        uint64_t v52 = objc_msgSend_longLongValue(v48, v49, v50, v51);
        uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v34, v53, @"verificationKey", v54);
        uint64_t v12 = objc_msgSend_initWithIndex_signature_size_paddedSize_verificationKey_(v35, v56, a3, (uint64_t)v38, v45, v52, v55);
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v58 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
        {
          uint64_t v60 = v58;
          int v64 = 134218240;
          uint64_t v65 = objc_msgSend_count(v28, v61, v62, v63);
          __int16 v66 = 2048;
          unint64_t v67 = a3;
          _os_log_fault_impl(&dword_18AF10000, v60, OS_LOG_TYPE_FAULT, "Unexpected number of sections (%lu) with index %lu", (uint8_t *)&v64, 0x16u);
        }
        uint64_t v12 = 0;
      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v57 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      int v64 = 138412290;
      uint64_t v65 = (uint64_t)self;
      _os_log_fault_impl(&dword_18AF10000, v57, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", (uint8_t *)&v64, 0xCu);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)addSection:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7) != 7 && objc_msgSend_state(self, v8, v9, v10) != 1)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v37 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v81 = self;
      _os_log_fault_impl(&dword_18AF10000, v37, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (!objc_msgSend_openWithError_(self, v8, 0, v10))
  {
LABEL_10:
    BOOL v38 = 0;
    goto LABEL_20;
  }
  uint64_t v11 = (CKPackage *)objc_opt_new();
  uint64_t v12 = NSNumber;
  uint64_t v16 = objc_msgSend_packageID(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_numberWithInteger_(v12, v17, v16, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v11, v20, (uint64_t)v19, @"packageID");

  uint64_t v21 = NSNumber;
  uint64_t v25 = objc_msgSend_index(v4, v22, v23, v24);
  BOOL v28 = objc_msgSend_numberWithInteger_(v21, v26, v25, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v11, v29, (uint64_t)v28, @"packageIndex");

  id v36 = objc_msgSend_signature(v4, v30, v31, v32);
  if (v36)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v11, v33, (uint64_t)v36, @"signature");
  }
  else
  {
    uint64_t v39 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v33, v34, v35);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v40, (uint64_t)v39, @"signature");
  }
  uint64_t v47 = objc_msgSend_verificationKey(v4, v41, v42, v43);
  if (v47)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v11, v44, (uint64_t)v47, @"verificationKey");
  }
  else
  {
    uint64_t v48 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v44, v45, v46);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v49, (uint64_t)v48, @"verificationKey");
  }
  uint64_t v50 = NSNumber;
  uint64_t v54 = objc_msgSend_size(v4, v51, v52, v53);
  uint64_t v57 = objc_msgSend_numberWithUnsignedLongLong_(v50, v55, v54, v56);
  objc_msgSend_setObject_forKeyedSubscript_(v11, v58, (uint64_t)v57, @"size");

  uint64_t v59 = NSNumber;
  uint64_t v63 = objc_msgSend_paddedSize(v4, v60, v61, v62);
  __int16 v66 = objc_msgSend_numberWithUnsignedLongLong_(v59, v64, v63, v65);
  objc_msgSend_setObject_forKeyedSubscript_(v11, v67, (uint64_t)v66, @"paddedSize");

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v68 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v81 = v11;
    _os_log_debug_impl(&dword_18AF10000, v68, OS_LOG_TYPE_DEBUG, "Adding package section %@", buf, 0xCu);
  }
  v72 = objc_msgSend_sqlite(self, v69, v70, v71);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = sub_18B17A110;
  v78[3] = &unk_1E5462C58;
  id v79 = v11;
  long long v73 = v11;
  uint64_t v76 = objc_msgSend_performDatabaseOperation_(v72, v74, (uint64_t)v78, v75);
  BOOL v38 = v76 == 0;

LABEL_20:
  return v38;
}

- (id)testAddSectionConstraintViolation:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!__sTestOverridesAvailable)
  {
    long long v73 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v73, v74, (uint64_t)a2, (uint64_t)self, @"CKPackage.m", 1187, @"Only suitable for testing");
  }
  if (objc_msgSend_state(self, v5, v6, v7) == 7 || objc_msgSend_state(self, v9, v10, v11) == 1)
  {
    id v77 = 0;
    int v12 = objc_msgSend_openWithError_(self, v9, (uint64_t)&v77, v11);
    id v13 = v77;
    if (v12)
    {
      uint64_t v14 = (CKPackage *)objc_opt_new();
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)&unk_1ED846978, @"packageID");
      uint64_t v16 = NSNumber;
      uint64_t v20 = objc_msgSend_index(v8, v17, v18, v19);
      uint64_t v23 = objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
      objc_msgSend_setObject_forKeyedSubscript_(v14, v24, (uint64_t)v23, @"packageIndex");

      uint64_t v31 = objc_msgSend_signature(v8, v25, v26, v27);
      if (v31)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v14, v28, (uint64_t)v31, @"signature");
      }
      else
      {
        uint64_t v34 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v28, v29, v30);
        objc_msgSend_setObject_forKeyedSubscript_(v14, v35, (uint64_t)v34, @"signature");
      }
      uint64_t v42 = objc_msgSend_verificationKey(v8, v36, v37, v38);
      if (v42)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v14, v39, (uint64_t)v42, @"verificationKey");
      }
      else
      {
        uint64_t v43 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v39, v40, v41);
        objc_msgSend_setObject_forKeyedSubscript_(v14, v44, (uint64_t)v43, @"verificationKey");
      }
      uint64_t v45 = NSNumber;
      uint64_t v49 = objc_msgSend_size(v8, v46, v47, v48);
      uint64_t v52 = objc_msgSend_numberWithUnsignedLongLong_(v45, v50, v49, v51);
      objc_msgSend_setObject_forKeyedSubscript_(v14, v53, (uint64_t)v52, @"size");

      uint64_t v54 = NSNumber;
      uint64_t v58 = objc_msgSend_paddedSize(v8, v55, v56, v57);
      uint64_t v61 = objc_msgSend_numberWithUnsignedLongLong_(v54, v59, v58, v60);
      objc_msgSend_setObject_forKeyedSubscript_(v14, v62, (uint64_t)v61, @"paddedSize");

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v63 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v79 = v14;
        _os_log_debug_impl(&dword_18AF10000, v63, OS_LOG_TYPE_DEBUG, "Adding package section %@", buf, 0xCu);
      }
      unint64_t v67 = objc_msgSend_sqlite(self, v64, v65, v66);
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = sub_18B17A58C;
      v75[3] = &unk_1E5462C58;
      uint64_t v76 = v14;
      uint64_t v68 = v14;
      uint64_t v71 = objc_msgSend_performDatabaseOperation_(v67, v69, (uint64_t)v75, v70);

      id v13 = (id)v71;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v32 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v79 = self;
      _os_log_fault_impl(&dword_18AF10000, v32, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v33, @"CKErrorDomain", 1000, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)performTransactionBlock:(id)a3
{
  id v4 = a3;
  id v19 = 0;
  int v7 = objc_msgSend_openWithError_(self, v5, (uint64_t)&v19, v6);
  id v11 = v19;
  if (v7)
  {
    int v12 = objc_msgSend_sqlite(self, v8, v9, v10);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_18B17A698;
    v17[3] = &unk_1E5465698;
    v17[4] = self;
    id v18 = v4;
    uint64_t v15 = objc_msgSend_performDatabaseOperation_(v12, v13, (uint64_t)v17, v14);

    id v11 = (id)v15;
  }

  return v11;
}

- (void)_setPackagesDBForKey:(id)a3 data:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend_state(self, v8, v9, v10) == 7 || objc_msgSend_state(self, v11, v12, v13) == 1)
    && objc_msgSend_openWithError_(self, v11, 0, v13))
  {
    uint64_t v17 = objc_msgSend_sqlite(self, v14, v15, v16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_18B17A8E8;
    v22[3] = &unk_1E5462E10;
    id v23 = v6;
    id v24 = v7;
    uint64_t v25 = self;
    uint64_t v20 = objc_msgSend_performDatabaseOperation_(v17, v18, (uint64_t)v22, v19);

    if (v20)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v21 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v27 = self;
        __int16 v28 = 2112;
        uint64_t v29 = v20;
        _os_log_error_impl(&dword_18AF10000, v21, OS_LOG_TYPE_ERROR, "Failed to set package signature for %@, error = %@", buf, 0x16u);
      }
    }
  }
}

- (id)_getFromPackagesDBValueForKey:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7) == 7 || objc_msgSend_state(self, v8, v9, v10) == 1)
  {
    uint64_t v14 = 0;
    if (objc_msgSend_openWithError_(self, v8, 0, v10))
    {
      uint64_t v15 = objc_msgSend_sqlite(self, v11, v12, v13);
      id v41 = v4;
      uint64_t v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)&v41, 1);
      id v18 = NSNumber;
      uint64_t v22 = objc_msgSend_packageID(self, v19, v20, v21);
      uint64_t v25 = objc_msgSend_numberWithInteger_(v18, v23, v22, v24);
      uint64_t v40 = v25;
      uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)&v40, 1);
      uint64_t v29 = objc_msgSend_select_from_where_bindings_(v15, v28, (uint64_t)v17, @"Packages", @"packageID = ?", v27);

      if (objc_msgSend_count(v29, v30, v31, v32) == 1)
      {
        uint64_t v35 = objc_msgSend_objectAtIndexedSubscript_(v29, v33, 0, v34);
        uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)v4, v37);
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v38 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v43 = self;
      _os_log_fault_impl(&dword_18AF10000, v38, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (NSData)signature
{
  return (NSData *)((uint64_t (*)(CKPackage *, char *, __CFString *))MEMORY[0x1F4181798])(self, sel__getFromPackagesDBValueForKey_, @"signature");
}

- (void)setSignature:(id)a3
{
}

- (NSData)verificationKey
{
  return (NSData *)((uint64_t (*)(CKPackage *, char *, __CFString *))MEMORY[0x1F4181798])(self, sel__getFromPackagesDBValueForKey_, @"verificationKey");
}

- (void)setVerificationKey:(id)a3
{
}

- (BOOL)claimOwnershipWithError:(id *)a3
{
  return objc_msgSend_handleChangeStateAction_error_(self, a2, 2, (uint64_t)a3);
}

- (NSString)databaseBasePath
{
  objc_msgSend_rootDatabasePath(self, a2, v2, v3);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (!v4) {
    id v4 = @"/unreachable/package/";
  }
  uint64_t v6 = v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)gcPackagesInDirectory:(id)a3 dbInUseBlock:(id)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (uint64_t (**)(void, void *, uint64_t))a4;
  uint64_t v7 = (void *)MEMORY[0x18C12ADA0]();
  id v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v8, v9, v10);
  char v122 = 0;
  int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v11, v12, (uint64_t)v5, (uint64_t)&v122);
  if (isDirectory) {
    BOOL v15 = v122 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    int v16 = isDirectory;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      id v18 = @"false";
      if (v16) {
        uint64_t v19 = @"true";
      }
      else {
        uint64_t v19 = @"false";
      }
      *(_DWORD *)long long buf = 138412802;
      id v126 = v5;
      __int16 v127 = 2114;
      if (v122) {
        id v18 = @"true";
      }
      v128 = v19;
      __int16 v129 = 2114;
      double v130 = *(double *)&v18;
      _os_log_error_impl(&dword_18AF10000, v17, OS_LOG_TYPE_ERROR, "Package GC called on non-existant path or non-directory. Path: %@, exists: %{public}@, isDirectory: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v20 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v14, (uint64_t)v5, 1);
    uint64_t v21 = *MEMORY[0x1E4F1C530];
    uint64_t v22 = *MEMORY[0x1E4F1C528];
    v124[0] = *MEMORY[0x1E4F1C530];
    v124[1] = v22;
    uint64_t v112 = v22;
    uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v124, 2);
    uint64_t v107 = v11;
    uint64_t v26 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v11, v25, (uint64_t)v20, (uint64_t)v24, 4, &unk_1ED7EFCB8);

    uint64_t v30 = objc_msgSend_sharedOptions(CKBehaviorOptions, v27, v28, v29);
    double v31 = sub_18B0D4F9C((uint64_t)v30);

    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v32, v33, v34, -v31);
    v110 = v6;
    v111 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v108 = v7;
    uint64_t v35 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543874;
      id v126 = v5;
      __int16 v127 = 2114;
      v128 = v111;
      __int16 v129 = 2048;
      double v130 = v31;
      _os_log_impl(&dword_18AF10000, v35, OS_LOG_TYPE_INFO, "GCing packages in directory: %{public}@, with grace date of: %{public}@ (gracePeriod=%fs)", buf, 0x20u);
    }
    id v109 = v5;
    uint64_t v39 = objc_msgSend_nextObject(v26, v36, v37, v38);
    if (v39)
    {
      uint64_t v40 = (void *)v39;
      while (1)
      {
        id v41 = (void *)MEMORY[0x18C12ADA0]();
        uint64_t v45 = objc_msgSend_lastPathComponent(v40, v42, v43, v44);
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        uint64_t v46 = CKSQLiteJournalSuffixes();
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v118, (uint64_t)v123, 16);
        if (!v48) {
          break;
        }
        uint64_t v51 = v48;
        int v52 = 0;
        uint64_t v53 = *(void *)v119;
        do
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v119 != v53) {
              objc_enumerationMutation(v46);
            }
            v52 |= objc_msgSend_hasSuffix_(v45, v49, *(void *)(*((void *)&v118 + 1) + 8 * i), v50);
          }
          uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v118, (uint64_t)v123, 16);
        }
        while (v51);

        if ((v52 & 1) == 0) {
          goto LABEL_31;
        }
        uint64_t v58 = 0;
        uint64_t v59 = 0;
        uint64_t v60 = 0;
LABEL_48:
        uint64_t v74 = objc_msgSend_nextObject(v26, v55, v56, v57);

        uint64_t v40 = (void *)v74;
        if (!v74) {
          goto LABEL_76;
        }
      }

LABEL_31:
      id v116 = 0;
      id v117 = 0;
      char ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v40, v55, (uint64_t)&v117, v21, &v116);
      uint64_t v60 = (__CFString *)v117;
      uint64_t v58 = (__CFString *)v116;
      if ((ResourceValue_forKey_error & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v72 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          id v126 = v40;
          __int16 v127 = 2112;
          v128 = v58;
          _os_log_error_impl(&dword_18AF10000, v72, OS_LOG_TYPE_ERROR, "Failed to get modification date for package URL: %{public}@, error: %@. Ignoring.", buf, 0x16u);
        }
        uint64_t v59 = 0;
        goto LABEL_48;
      }
      id v114 = 0;
      id v115 = 0;
      char v63 = objc_msgSend_getResourceValue_forKey_error_(v40, v62, (uint64_t)&v115, v112, &v114);
      uint64_t v59 = (__CFString *)v115;
      int v64 = (__CFString *)v114;

      if ((v63 & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        long long v73 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          id v126 = v40;
          __int16 v127 = 2112;
          v128 = v64;
          _os_log_error_impl(&dword_18AF10000, v73, OS_LOG_TYPE_ERROR, "Failed to get access date for package URL: %{public}@, error: %@. Ignoring.", buf, 0x16u);
        }
        goto LABEL_47;
      }
      if (objc_msgSend_compare_(v60, v65, (uint64_t)v111, v66) == 1)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v69 = ck_log_facility_ck;
        if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_47;
        }
        *(_DWORD *)long long buf = 138412546;
        id v126 = v40;
        __int16 v127 = 2114;
        v128 = v60;
        uint64_t v70 = v69;
        uint64_t v71 = "Not GCing package: %@ as modification date: %{public}@ newer than grace date";
      }
      else
      {
        if (objc_msgSend_compare_(v59, v67, (uint64_t)v111, v68) != 1)
        {
          id v79 = objc_msgSend_path(v40, v75, v76, v77);
          uint64_t v80 = sub_18B177088((uint64_t)CKPackage, v79);

          v113 = v64;
          os_log_t log = (os_log_t)v80;
          LOBYTE(v80) = objc_msgSend_openWithError_((void *)v80, v81, (uint64_t)&v113, v82);
          uint64_t v58 = v113;

          if (v80)
          {
            if (v110)
            {
              __int16 v103 = objc_msgSend_select_from_(log, v83, (uint64_t)&unk_1ED846090, @"Packages");
              uint64_t v86 = objc_msgSend_CKMap_(v103, v84, (uint64_t)&unk_1ED7EFD58, v85);
              uint64_t v90 = objc_msgSend_path(v40, v87, v88, v89);
              uint64_t v104 = (void *)v86;
              LODWORD(v86) = v110[2](v110, v90, v86);

              if (v86)
              {
                if (ck_log_initialization_predicate != -1) {
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                }
                os_log_t v91 = log;
                loga = ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138543362;
                  id v126 = v40;
                  _os_log_debug_impl(&dword_18AF10000, loga, OS_LOG_TYPE_DEBUG, "Not removing package: %{public}@, as it was deemed in-use", buf, 0xCu);
                }
                objc_msgSend_close(v91, v92, v93, v94);

                goto LABEL_75;
              }
            }
            os_log_t v91 = log;
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            uint64_t v99 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138543362;
              id v126 = v40;
              _os_log_debug_impl(&dword_18AF10000, v99, OS_LOG_TYPE_DEBUG, "GCing package: %{public}@", buf, 0xCu);
            }
            objc_msgSend_close(log, v100, v101, v102);
          }
          else
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            os_log_t v91 = log;
            uint64_t v95 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412546;
              id v126 = v40;
              __int16 v127 = 2114;
              v128 = v58;
              _os_log_debug_impl(&dword_18AF10000, v95, OS_LOG_TYPE_DEBUG, "Failed to open package: %@, due to: %{public}@, removing it", buf, 0x16u);
            }
          }
          objc_msgSend_remove(v91, v96, v97, v98);
LABEL_75:

          goto LABEL_48;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v78 = ck_log_facility_ck;
        if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_47;
        }
        *(_DWORD *)long long buf = 138412546;
        id v126 = v40;
        __int16 v127 = 2114;
        v128 = v59;
        uint64_t v70 = v78;
        uint64_t v71 = "Not GCing package: %@ as access date: %{public}@ newer than grace date";
      }
      _os_log_debug_impl(&dword_18AF10000, v70, OS_LOG_TYPE_DEBUG, v71, buf, 0x16u);
LABEL_47:
      uint64_t v58 = v64;
      goto LABEL_48;
    }
LABEL_76:

    id v5 = v109;
    uint64_t v6 = v110;
    id v11 = v107;
    uint64_t v7 = v108;
  }
}

- (double)earliestUploadReceiptExpiration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend_assets(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v17;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_uploadReceiptExpiration(*(void **)(*((void *)&v16 + 1) + 8 * i), v7, v8, v9);
        if (v14 != 0.0 && (v12 == 0.0 || v12 > v14)) {
          double v12 = v14;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (_OpaquePCSShareProtection)recordPCS
{
  return self->_recordPCS;
}

- (NSData)boundaryKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBoundaryKey:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)rootDatabasePath
{
  return self->_rootDatabasePath;
}

- (void)setRootDatabasePath:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSData)archiverInfo
{
  return self->_archiverInfo;
}

- (void)setArchiverInfo:(id)a3
{
}

- (CKSQLite)sqlite
{
  return self->_sqlite;
}

- (void)setSqlite:(id)a3
{
}

- (unint64_t)nextItemIndex
{
  return self->_nextItemIndex;
}

- (void)setNextItemIndex:(unint64_t)a3
{
  self->_unint64_t nextItemIndex = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)paddedSize
{
  return self->_paddedSize;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (void)setWasCached:(BOOL)a3
{
  self->_wasCached = a3;
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

- (BOOL)hasSize
{
  return self->_hasSize;
}

- (void)setHasSize:(BOOL)a3
{
  self->_hasSize = a3;
}

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (void)setShouldReadRawEncryptedData:(BOOL)a3
{
  self->_shouldReadRawEncryptedData = a3;
}

- (int64_t)storageGroupingPolicy
{
  return self->_storageGroupingPolicy;
}

- (void)setStorageGroupingPolicy:(int64_t)a3
{
  self->_storageGroupingPolicy = a3;
}

- (int64_t)uploadRank
{
  return self->_uploadRank;
}

- (void)setUploadRank:(int64_t)a3
{
  self->_uploadRank = a3;
}

- (int64_t)packageID
{
  return self->_packageID;
}

- (void)setPackageID:(int64_t)a3
{
  self->_packageID = a3;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
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
  return self->_recordKey;
}

- (void)setRecordKey:(id)a3
{
}

- (CKDMMCSItem)manifestItem
{
  return self->_manifestItem;
}

- (void)setManifestItem:(id)a3
{
}

- (CKPackageReference)packageReference
{
  return self->_packageReference;
}

- (void)setPackageReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageReference, 0);
  objc_storeStrong((id *)&self->_manifestItem, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_destroyWeak((id *)&self->_record);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_sqlite, 0);
  objc_storeStrong((id *)&self->_archiverInfo, 0);
  objc_storeStrong((id *)&self->_rootDatabasePath, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptions, 0);
  objc_storeStrong((id *)&self->_boundaryKey, 0);

  objc_storeStrong((id *)&self->_downloadItemIndices, 0);
}

@end