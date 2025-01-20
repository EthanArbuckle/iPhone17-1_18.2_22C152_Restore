@interface PFUbiquityLocation
+ (PFUbiquityLocation)createLocalContainerRootLocationWithLocalPeerID:(__CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:;
+ (PFUbiquityLocation)createUbiquityExternalDataReferenceStoreLocationForStoreName:(uint64_t)a3 withUbiquityRootLocation:;
+ (PFUbiquityLocation)createUbiquityLocationForRootPath:(int)a3 checkIsUbiquitous:;
+ (PFUbiquityLocation)createUbiquityLocationForRootPath:(uint64_t)a1;
+ (PFUbiquityLocation)createUbiquityLocationForRootURL:(uint64_t)a1;
+ (_BYTE)createUbiquityLocationForPath:(unsigned char *)a3 withUbiquityRootLocation:;
+ (_BYTE)createUbiquityLocationForURL:(unsigned char *)a3 withUbiquityRootLocation:;
+ (id)createArrayOfSubLocationsAtLocation:(uint64_t)a3 error:;
+ (id)createMapOfLocationsForOldManagedObjectModel:(void *)a3 andNewManagedObjectModel:(uint64_t)a4 inUbiquityPeerStoreLocation:;
+ (uint64_t)createVersionHashStringForModel:(uint64_t)a1;
+ (uint64_t)pathByTruncatingBeforeLibraryMobileDocuments:(uint64_t)a1;
+ (void)createBaselineLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:;
+ (void)createBaselineStagingLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 modelVersionHash:(uint64_t)a5 andFilename:(void *)a6 withUbiquityRootLocation:;
+ (void)createCurrentBaselineLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 peerID:(uint64_t)a5 andModelVersionHash:(uint64_t)a6 forFileNamed:(void *)a7 withUbiquityRootLocation:;
+ (void)createLocalBasePathWithLocalPeerID:(__CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:;
+ (void)createLocalStoresPathWithLocalPeerID:(__CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:;
+ (void)createMetadataPeerStoreLocationForLocalPeerID:(uint64_t)a3 storeName:(void *)a4 andUbiquityRootLocation:;
+ (void)createMetadataStoreFileLocationForLocalPeerID:(uint64_t)a3 storeName:(void *)a4 andUbiquityRootLocation:;
+ (void)createMetadataUUIDLocationForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 UUID:(void *)a5 andUbiquityRootLocation:;
+ (void)createPeerBaselineFileLocationForLocalPeerID:(void *)a3 andBaselineFileLocation:;
+ (void)createPeerBaselineFileSafeSaveLocationForLocalPeerID:(void *)a3 andBaselineFileLocation:;
+ (void)createPeerRootLocationForPeerID:(void *)a3 withUbiquityRootLocation:;
+ (void)createPeerStoreLocationForPeerID:(uint64_t)a3 andStoreName:(void *)a4 withUbiquityRootLocation:;
+ (void)createPeerStoreVersionLocationForPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:;
+ (void)createStagingPeerStoreVersionLocationForExportingPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:;
+ (void)createStringByAppendingSubpath:(uint64_t)a3 toPath:;
+ (void)createTransactionLogLocationForPeerID:(uint64_t)a3 storeName:(uint64_t)a4 modelVersionHash:(uint64_t)a5 logFilename:(void *)a6 andUbiquityRootLocation:;
+ (void)createUbiquityExternalDataReferenceFileLocationForUUID:(uint64_t)a3 andLog:;
+ (void)createUbiquityExternalDataReferenceFileLocationForUUID:(void *)a3 andStore:(void *)a4 withUbiquityRootLocation:;
+ (void)createUbiquityPeerReceiptFileLocationForPeerWithID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:;
+ (void)createUbiquityPeerReceiptSafeSaveLocationFromReceiptFileLocation:(uint64_t)a1;
+ (void)initialize;
- (BOOL)fileExistsAtLocationWithLocalPeerID:(void *)a3 error:;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToURL:(id)a3;
- (BOOL)removeFileAtLocation:(void *)a3 error:;
- (PFUbiquityLocation)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)createFullURL;
- (uint64_t)fileAtLocationIsDownloaded:(uint64_t)result;
- (uint64_t)fileAtLocationIsUploaded:(uint64_t)result;
- (unint64_t)hash;
- (void)createFullPath;
- (void)createRelativePath;
- (void)dealloc;
- (void)setExportingPeerID:(id)a3;
- (void)setFilename:(id)a3;
- (void)setHash:(unint64_t)a3;
- (void)setIsRootUbiquitous:(BOOL)a3;
- (void)setModelVersionHash:(id)a3;
- (void)setOtherPathComponents:(id)a3;
- (void)setStoreName:(id)a3;
- (void)setUbiquityLocationType:(int)a3;
- (void)setUbiquityRootLocation:(id)a3;
- (void)setUbiquityRootLocationPath:(id)a3;
- (void)updateHash;
@end

@implementation PFUbiquityLocation

+ (void)initialize
{
  self;
  objc_opt_class();
  if ((id)objc_opt_class() == a1)
  {
    self;
    if (_usesCloudDocs == 1) {
      uint64_t v3 = [(id)+[PFUbiquityFilePresenter cloudDocsRootFolder]() copy];
    }
    else {
      uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "URLForUbiquityContainerIdentifier:", 0);
    }
    _PFUbiquityLocationSentinel = v3;
    _PFUbiquityLocationLocalSentinel = @"CoreDataUbiquitySupport";
  }
}

- (PFUbiquityLocation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocation;
  result = [(PFUbiquityLocation *)&v3 init];
  if (result)
  {
    result->_ubiquityRootLocation = 0;
    result->_ubiquityRootLocationPath = 0;
    result->_ubiquityLocationType = 1;
    result->_isRootUbiquitous = 0;
    *(_OWORD *)&result->_exportingPeerID = 0u;
    *(_OWORD *)&result->_modelVersionHash = 0u;
    *(_OWORD *)((char *)&result->_filename + 1) = 0u;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PFUbiquityLocation allocWithZone:a3] init];
  v5 = v4;
  if (self)
  {
    ubiquityRootLocation = self;
    if (self->_ubiquityLocationType != 1) {
      ubiquityRootLocation = self->_ubiquityRootLocation;
    }
    [(PFUbiquityLocation *)v4 setUbiquityRootLocation:ubiquityRootLocation];
    v7 = self;
    while (v7->_ubiquityLocationType != 1)
    {
      v7 = v7->_ubiquityRootLocation;
      if (!v7)
      {
        ubiquityRootLocationPath = 0;
        goto LABEL_9;
      }
    }
    ubiquityRootLocationPath = v7->_ubiquityRootLocationPath;
LABEL_9:
    [(PFUbiquityLocation *)v5 setUbiquityRootLocationPath:ubiquityRootLocationPath];
    [(PFUbiquityLocation *)v5 setExportingPeerID:self->_exportingPeerID];
    [(PFUbiquityLocation *)v5 setStoreName:self->_storeName];
    [(PFUbiquityLocation *)v5 setModelVersionHash:self->_modelVersionHash];
    [(PFUbiquityLocation *)v5 setFilename:self->_filename];
    [(PFUbiquityLocation *)v5 setOtherPathComponents:self->_otherPathComponents];
    uint64_t ubiquityLocationType = self->_ubiquityLocationType;
  }
  else
  {
    [(PFUbiquityLocation *)v4 setUbiquityRootLocation:0];
    [(PFUbiquityLocation *)v5 setUbiquityRootLocationPath:0];
    [(PFUbiquityLocation *)v5 setExportingPeerID:0];
    [(PFUbiquityLocation *)v5 setStoreName:0];
    [(PFUbiquityLocation *)v5 setModelVersionHash:0];
    [(PFUbiquityLocation *)v5 setFilename:0];
    [(PFUbiquityLocation *)v5 setOtherPathComponents:0];
    uint64_t ubiquityLocationType = 0;
  }
  [(PFUbiquityLocation *)v5 setUbiquityLocationType:ubiquityLocationType];
  [(PFUbiquityLocation *)v5 setHash:[(PFUbiquityLocation *)self hash]];
  if (self) {
    BOOL isRootUbiquitous = self->_isRootUbiquitous;
  }
  else {
    BOOL isRootUbiquitous = 0;
  }
  [(PFUbiquityLocation *)v5 setIsRootUbiquitous:isRootUbiquitous];
  return v5;
}

- (void)dealloc
{
  self->_ubiquityRootLocation = 0;
  self->_ubiquityRootLocationPath = 0;

  self->_exportingPeerID = 0;
  self->_storeName = 0;

  self->_modelVersionHash = 0;
  self->_filename = 0;

  self->_otherPathComponents = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocation;
  [(PFUbiquityLocation *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = -[PFUbiquityLocation createFullPath]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityLocation;
  v4 = (void *)[NSString stringWithFormat:@"%@: %@", -[PFUbiquityLocation description](&v6, sel_description), v3];

  return v4;
}

- (void)createFullPath
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  uint64_t v2 = a1;
  while (*(_DWORD *)(v2 + 24) != 1)
  {
    uint64_t v2 = *(void *)(v2 + 8);
    if (!v2) {
      return 0;
    }
  }
  if (!*(void *)(v2 + 16)) {
    return 0;
  }
  objc_super v3 = -[PFUbiquityLocation createRelativePath](a1);
  while (*(_DWORD *)(v1 + 24) != 1)
  {
    uint64_t v1 = *(void *)(v1 + 8);
    if (!v1)
    {
      uint64_t v4 = 0;
      goto LABEL_12;
    }
  }
  uint64_t v4 = *(void *)(v1 + 16);
LABEL_12:
  v5 = +[PFUbiquityLocation createStringByAppendingSubpath:toPath:]((uint64_t)PFUbiquityLocation, v3, v4);

  return v5;
}

- (BOOL)fileExistsAtLocationWithLocalPeerID:(void *)a3 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  objc_super v6 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a1, a2);
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v8 = -[PFUbiquityLocation createFullPath](a1);
  char v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v8);
  *((unsigned char *)v23 + 24) = v9;
  if (([*(id *)(a1 + 32) isEqual:a2] & 1) != 0 || !*((unsigned char *)v23 + 24))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__PFUbiquityLocation_fileExistsAtLocationWithLocalPeerID_error___block_invoke;
    v20[3] = &unk_1E544E928;
    v20[5] = &v22;
    id v21 = 0;
    v20[4] = v7;
    -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v6, a1, 1, 1, &v21, (uint64_t)v20);
    if (v21)
    {
      if ([v21 code] == 134320)
      {
        *((unsigned char *)v23 + 24) = 0;
      }
      else if (v21)
      {
        if (a3) {
          *a3 = v21;
        }
      }
      else
      {
        uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquityLocation.m");
        v17 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquityLocation.m";
          __int16 v28 = 1024;
          int v29 = 327;
          _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  BOOL v18 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);
  return v18;
}

uint64_t __64__PFUbiquityLocation_fileExistsAtLocationWithLocalPeerID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (uint64_t)fileAtLocationIsUploaded:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned char *)(result + 88))
    {
      objc_super v3 = (void *)-[PFUbiquityLocation createFullURL](result);
      uint64_t v4 = +[_PFRoutines isUbiquitousURLUploaded:error:]((uint64_t)_PFRoutines, v3, a2);

      return v4;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)createFullURL
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = -[PFUbiquityLocation createFullPath](a1);
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v2 isDirectory:*(unsigned __int8 *)(a1 + 72)];

  return v4;
}

- (uint64_t)fileAtLocationIsDownloaded:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned char *)(result + 88))
    {
      objc_super v3 = (void *)-[PFUbiquityLocation createFullURL](result);
      uint64_t v4 = +[_PFRoutines isUbiquitousURLDownloaded:error:]((uint64_t)_PFRoutines, v3, a2);

      return v4;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)removeFileAtLocation:(void *)a3 error:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v22 = 0;
  v5 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a1, a2);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  __int16 v28 = __Block_byref_object_copy__55;
  int v29 = __Block_byref_object_dispose__55;
  uint64_t v30 = 0;
  objc_super v6 = (void *)-[PFUbiquityLocation createFullURL](a1);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__PFUbiquityLocation_removeFileAtLocation_error___block_invoke;
  v17[3] = &unk_1E544F7C8;
  v17[4] = &v18;
  v17[5] = &v23;
  v17[6] = buf;
  [v5 coordinateWritingItemAtURL:v6 options:1 error:&v22 byAccessor:v17];
  if (*((unsigned char *)v24 + 24))
  {
    if (!*((unsigned char *)v19 + 24)) {
      *((unsigned char *)v24 + 24) = 0;
    }
  }
  else
  {
    uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v18, 8);
  if (!*((unsigned char *)v24 + 24))
  {
    if (v22)
    {
      if (a3) {
        *a3 = v22;
      }
    }
    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquityLocation.m");
      uint64_t v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structu"
                             "re/PFUbiquityLocation.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 382;
        _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  BOOL v7 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  return v7;
}

uint64_t __49__PFUbiquityLocation_removeFileAtLocation_error___block_invoke(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a2, *(void *)(a1[6] + 8) + 40);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)createRelativePath
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_super v3 = v2;
  switch(*(_DWORD *)(a1 + 24))
  {
    case 2:
      goto LABEL_51;
    case 3:
      goto LABEL_16;
    case 4:
      goto LABEL_21;
    case 5:
      goto LABEL_19;
    case 6:
      goto LABEL_18;
    case 7:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_18:
      [v3 insertString:*(void *)(a1 + 48) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_19:
      [v3 insertString:*(void *)(a1 + 40) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      goto LABEL_20;
    case 8:
      goto LABEL_23;
    case 9:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_23:
      [v3 insertString:@"stores" atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      [v3 insertString:*(void *)(a1 + 48) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      [v3 insertString:*(void *)(a1 + 40) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      [v3 insertString:*(void *)(a1 + 32) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      v8 = @"current.nosync";
      goto LABEL_50;
    case 0xA:
    case 0x28:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      goto LABEL_15;
    case 0xB:
LABEL_15:
      [v3 insertString:*(void *)(a1 + 48) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_16:
      v8 = *(__CFString **)(a1 + 40);
      goto LABEL_50;
    case 0xC:
      goto LABEL_7;
    case 0xD:
      goto LABEL_5;
    case 0xE:
    case 0x21:
    case 0x22:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      goto LABEL_4;
    case 0xF:
      goto LABEL_40;
    case 0x10:
      goto LABEL_13;
    case 0x11:
      goto LABEL_12;
    case 0x12:
      goto LABEL_30;
    case 0x13:
      goto LABEL_29;
    case 0x14:
      goto LABEL_28;
    case 0x15:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      if ([*(id *)(a1 + 64) count])
      {
        uint64_t v9 = [*(id *)(a1 + 64) count] - 1;
        if (v9 >= 0)
        {
          do
          {
            uint64_t v10 = [*(id *)(a1 + 64) objectAtIndex:v9];
            [v3 insertString:@"/" atIndex:0];
            [v3 insertString:v10 atIndex:0];
            --v9;
          }
          while (v9 != -1);
        }
      }
      [v3 insertString:@"/" atIndex:0];
LABEL_28:
      [v3 insertString:*(void *)(a1 + 48) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_29:
      [v3 insertString:*(void *)(a1 + 40) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_30:
      uint64_t v11 = PFUbiquityTransactionLogTemporaryDirectoryName;
      goto LABEL_38;
    case 0x16:
    case 0x20:
    case 0x29:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      if ([*(id *)(a1 + 64) count])
      {
        uint64_t v5 = [*(id *)(a1 + 64) count] - 1;
        if (v5 >= 0)
        {
          do
          {
            uint64_t v6 = [*(id *)(a1 + 64) objectAtIndex:v5];
            [v3 insertString:@"/" atIndex:0];
            [v3 insertString:v6 atIndex:0];
            --v5;
          }
          while (v5 != -1);
        }
      }
      [v3 insertString:@"/" atIndex:0];
LABEL_12:
      [v3 insertString:*(void *)(a1 + 48) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_13:
      BOOL v7 = *(__CFString **)(a1 + 40);
      goto LABEL_39;
    case 0x17:
      goto LABEL_37;
    case 0x18:
      goto LABEL_36;
    case 0x19:
      goto LABEL_35;
    case 0x1A:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      if ([*(id *)(a1 + 64) count])
      {
        uint64_t v12 = [*(id *)(a1 + 64) count] - 1;
        if (v12 >= 0)
        {
          do
          {
            uint64_t v13 = [*(id *)(a1 + 64) objectAtIndex:v12];
            [v3 insertString:@"/" atIndex:0];
            [v3 insertString:v13 atIndex:0];
            --v12;
          }
          while (v12 != -1);
        }
      }
      [v3 insertString:@"/" atIndex:0];
LABEL_35:
      [v3 insertString:*(void *)(a1 + 48) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_36:
      [v3 insertString:*(void *)(a1 + 40) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_37:
      uint64_t v11 = &PFUbiquityTransactionLogStagingDirectoryName;
LABEL_38:
      BOOL v7 = *v11;
LABEL_39:
      [v3 insertString:v7 atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_40:
      uint64_t v14 = *(__CFString **)(a1 + 32);
      goto LABEL_53;
    case 0x1B:
      goto LABEL_43;
    case 0x1C:
      goto LABEL_42;
    case 0x1D:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_42:
      [v3 insertString:*(void *)(a1 + 40) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_43:
      uint64_t v14 = @".externalData";
      goto LABEL_53;
    case 0x1E:
      goto LABEL_49;
    case 0x1F:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      goto LABEL_49;
    case 0x23:
LABEL_4:
      [v3 insertString:*(void *)(a1 + 40) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_5:
      [v3 insertString:*(void *)(a1 + 32) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      goto LABEL_6;
    case 0x24:
LABEL_6:
      [v3 insertString:@"metadata.nosync" atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_7:
      uint64_t v4 = PFUbiquityStackMetadataDirectoryName;
      goto LABEL_52;
    case 0x25:
    case 0x26:
      goto LABEL_46;
    case 0x27:
      [v2 insertString:*(void *)(a1 + 56) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_46:
      if ([*(id *)(a1 + 64) count])
      {
        uint64_t v15 = [*(id *)(a1 + 64) count] - 1;
        if (v15 >= 0)
        {
          do
          {
            objc_msgSend(v3, "insertString:atIndex:", objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", v15), 0);
            [v3 insertString:@"/" atIndex:0];
            --v15;
          }
          while (v15 != -1);
        }
      }
LABEL_49:
      [v3 insertString:@"staging.nosync" atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      [v3 insertString:*(void *)(a1 + 48) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
      v8 = *(__CFString **)(a1 + 40);
      goto LABEL_50;
    case 0x2A:
LABEL_20:
      [v3 insertString:*(void *)(a1 + 32) atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_21:
      v8 = @"current.nosync";
LABEL_50:
      [v3 insertString:v8 atIndex:0];
      [v3 insertString:@"/" atIndex:0];
LABEL_51:
      uint64_t v4 = PFUbiquityBaselineDirectory;
LABEL_52:
      uint64_t v14 = *v4;
LABEL_53:
      [v3 insertString:v14 atIndex:0];
      break;
    default:
      return v3;
  }
  return v3;
}

+ (void)createStringByAppendingSubpath:(uint64_t)a3 toPath:
{
  self;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:a3];
  if ([a2 length])
  {
    int v6 = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1);
    int v7 = [a2 characterAtIndex:0];
    if (v6 == 47 && v7 == 47)
    {
      a2 = (void *)[a2 substringFromIndex:1];
    }
    else if (v6 != 47 && v7 != 47)
    {
      [v5 appendString:@"/"];
    }
    [v5 appendString:a2];
  }
  return v5;
}

- (void)setUbiquityLocationType:(int)a3
{
  self->_uint64_t ubiquityLocationType = a3;
  self->_isDirectory = (a3 > 0x2A) | (0x4785B9FB97FuLL >> a3) & 1;
}

- (void)setExportingPeerID:(id)a3
{
  exportingPeerID = self->_exportingPeerID;
  if (exportingPeerID != a3)
  {

    self->_exportingPeerID = (NSString *)a3;
  }
}

- (void)setStoreName:(id)a3
{
  storeName = self->_storeName;
  if (storeName != a3)
  {

    self->_storeName = (NSString *)a3;
  }
}

- (void)setModelVersionHash:(id)a3
{
  modelVersionHash = self->_modelVersionHash;
  if (modelVersionHash != a3)
  {

    self->_modelVersionHash = (NSString *)a3;
  }
}

- (void)setFilename:(id)a3
{
  filename = self->_filename;
  if (filename != a3)
  {

    self->_filename = (NSString *)a3;
  }
}

- (void)setOtherPathComponents:(id)a3
{
  otherPathComponents = self->_otherPathComponents;
  if (otherPathComponents != a3)
  {

    self->_otherPathComponents = (NSArray *)a3;
  }
}

- (void)setUbiquityRootLocationPath:(id)a3
{
  ubiquityRootLocationPath = self->_ubiquityRootLocationPath;
  if (ubiquityRootLocationPath != a3)
  {

    self->_ubiquityRootLocationPath = (NSString *)a3;
  }
}

- (void)setUbiquityRootLocation:(id)a3
{
  ubiquityRootLocation = self->_ubiquityRootLocation;
  if (ubiquityRootLocation != a3)
  {

    int v6 = (PFUbiquityLocation *)a3;
    self->_ubiquityRootLocation = v6;
    if (v6) {
      BOOL isRootUbiquitous = v6->_isRootUbiquitous;
    }
    else {
      BOOL isRootUbiquitous = 0;
    }
    self->_BOOL isRootUbiquitous = isRootUbiquitous;
  }
}

- (void)setHash:(unint64_t)a3
{
  self->_hash = a3;
}

- (void)setIsRootUbiquitous:(BOOL)a3
{
  self->_BOOL isRootUbiquitous = a3;
}

- (void)updateHash
{
  if (a1)
  {
    id v2 = (void *)MEMORY[0x18C127630]();
    objc_super v3 = -[PFUbiquityLocation createFullPath]((uint64_t)a1);
    uint64_t v4 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v3);
    objc_msgSend(a1, "setHash:", +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v4));
  }
}

+ (uint64_t)pathByTruncatingBeforeLibraryMobileDocuments:(uint64_t)a1
{
  self;
  self;
  uint64_t v3 = [a2 rangeOfString:_PFUbiquityLocationSentinel options:1];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    self;
    uint64_t v3 = [a2 rangeOfString:_PFUbiquityLocationLocalSentinel options:1];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [NSString stringWithFormat:@"Core Data's ubiquity integration requires that the value for NSPersistentStoreUbiquitousContentURLKey point inside ~/Library/Mobile Documents. Given value: %@", a2];
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      if (!a2) {
        a2 = (void *)[MEMORY[0x1E4F1CA98] null];
      }
      objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v7, objc_msgSend(v10, "dictionaryWithObject:forKey:", a2, @"offendingPath")));
    }
  }
  uint64_t v5 = (void *)[a2 substringFromIndex:v3 + v4];
  if (![v5 length] || objc_msgSend(v5, "characterAtIndex:", 0) != 47) {
    return (uint64_t)v5;
  }

  return [v5 substringFromIndex:1];
}

+ (PFUbiquityLocation)createUbiquityLocationForRootPath:(uint64_t)a1
{
  self;

  return +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, a2, 1);
}

+ (PFUbiquityLocation)createUbiquityLocationForRootPath:(int)a3 checkIsUbiquitous:
{
  self;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:a2];
  if (objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1) == 47) {
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
  }
  if ([v5 hasPrefix:@"/private"]) {
    [v5 deleteCharactersInRange:0, objc_msgSend(@"/private", "length")];
  }
  int v6 = objc_alloc_init(PFUbiquityLocation);
  [(PFUbiquityLocation *)v6 setUbiquityRootLocationPath:v5];

  [(PFUbiquityLocation *)v6 setUbiquityLocationType:1];
  -[PFUbiquityLocation updateHash](v6);
  if (a3 && [a2 rangeOfString:_PFUbiquityLocationLocalSentinel] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v6);
    -[PFUbiquityLocation setIsRootUbiquitous:](v6, "setIsRootUbiquitous:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isUbiquitousItemAtURL:", v7));
  }
  return v6;
}

+ (PFUbiquityLocation)createUbiquityLocationForRootURL:(uint64_t)a1
{
  self;
  uint64_t v3 = (void *)[a2 path];
  self;

  return +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, v3, 1);
}

+ (_BYTE)createUbiquityLocationForURL:(unsigned char *)a3 withUbiquityRootLocation:
{
  self;
  uint64_t v5 = (void *)[a2 path];

  return +[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v5, a3);
}

+ (_BYTE)createUbiquityLocationForPath:(unsigned char *)a3 withUbiquityRootLocation:
{
  self;
  uint64_t v4 = a3;
  if (a3)
  {
    while (*((_DWORD *)v4 + 6) != 1)
    {
      uint64_t v4 = (unsigned char *)*((void *)v4 + 1);
      if (!v4) {
        goto LABEL_4;
      }
    }
    id v5 = (id)*((void *)v4 + 2);
  }
  else
  {
LABEL_4:
    id v5 = 0;
  }
  if (!a2) {
    return a2;
  }
  if (objc_msgSend(a2, "characterAtIndex:", objc_msgSend(a2, "length") - 1) == 47)
  {
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:a2];
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(a2, "length") - 1, 1);
    a2 = v6;
  }
  if (objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1) == 47)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v5];
    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
    id v5 = v7;
  }
  if (![v5 isEqualToString:a2])
  {
    p_cache = PFUbiquityMetadataFactory.cache;
    uint64_t v9 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v5);
    uint64_t v10 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, a2);
    if ([v9 length])
    {
      if ([v10 rangeOfString:v9] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Path: %@ does not appear to be a descendant of the root url: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 851, a2, v5);
        }
        return 0;
      }
      if (a3 && a3[88] && [v10 rangeOfString:_PFUbiquityLocationLocalSentinel] != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  It appears the store file is nested inside the container log directory. This is a really bad idea: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 856, v10);
        }
        a2 = (id)[a3 copy];
        [a2 setUbiquityLocationType:0];
        return a2;
      }
    }
    if ([v10 isEqualToString:v9])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Truncated path: %@ is a ubiquity root url.\nMatches: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 866, v10, v9);
      }
      goto LABEL_25;
    }
    uint64_t v12 = (void *)[v10 pathComponents];
    unint64_t v13 = [v12 count];
    unint64_t v14 = objc_msgSend((id)objc_msgSend(v9, "pathComponents"), "count");
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = [NSString stringWithUTF8String:".icloud"];
    if (v14 >= v13)
    {
      v19 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      uint64_t v20 = 1;
    }
    else
    {
      uint64_t v17 = v16;
      char v18 = 0;
      uint64_t v45 = 0;
      char v46 = 0;
      v19 = 0;
      v44 = 0;
      v47 = 0;
      v48 = 0;
      uint64_t v20 = 1;
      do
      {
        char v21 = v18;
        uint64_t v22 = (void *)[v12 objectAtIndex:v14];
        if ([v22 hasSuffix:v17])
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Changing path component to remove promise suffix previous: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 899, v22);
          }
          uint64_t v22 = (void *)[v22 stringByDeletingPathExtension];
          if ((unint64_t)[v22 length] >= 2
            && [v22 characterAtIndex:0] == 46)
          {
            uint64_t v22 = (void *)[v22 substringFromIndex:1];
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Changing path component to remove promise suffix new: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 904, v22);
          }
        }
        uint64_t v23 = 42;
        uint64_t v24 = v22;
        switch((int)v20)
        {
          case 1:
            if ([v22 isEqualToString:@".baseline"])
            {
              uint64_t v23 = 2;
              goto LABEL_151;
            }
            if ([v22 isEqualToString:@".cdmetadata"])
            {
              uint64_t v23 = 12;
              goto LABEL_151;
            }
            if ([v22 isEqualToString:@".externalData"])
            {
              uint64_t v23 = 27;
              goto LABEL_151;
            }
            BOOL v31 = [v22 isEqualToString:@".cdmetadata.nosync"] == 0;
            unsigned int v32 = 15;
            unsigned int v33 = 12;
            goto LABEL_89;
          case 2:
            int v29 = [v22 isEqualToString:@"current.nosync"];
            if (v29) {
              uint64_t v20 = 4;
            }
            else {
              uint64_t v20 = 3;
            }
            uint64_t v30 = v47;
            if (!v29) {
              uint64_t v30 = v22;
            }
            v47 = v30;
            LOBYTE(v45) = v29 | v45;
            if (v21) {
              goto LABEL_159;
            }
            goto LABEL_141;
          case 3:
          case 5:
            BOOL v26 = (v45 & 1) == 0;
            unsigned int v25 = 11;
            unsigned int v27 = 6;
            goto LABEL_62;
          case 4:
            goto LABEL_137;
          case 6:
          case 11:
            if ([v22 isEqualToString:@"staging.nosync"])
            {
              uint64_t v23 = 30;
              goto LABEL_151;
            }
            if (v45)
            {
              if ([v22 isEqualToString:@"stores"]) {
                uint64_t v20 = 8;
              }
              else {
                uint64_t v20 = 7;
              }
              LOBYTE(v45) = 1;
              if (v21) {
                goto LABEL_158;
              }
              goto LABEL_122;
            }
            int v37 = [v22 isEqualToString:@"baseline.zip"];
            LOBYTE(v45) = 0;
            char v18 = 0;
            if (v37) {
              uint64_t v20 = 10;
            }
            else {
              uint64_t v20 = 40;
            }
            v38 = v48;
            if (!v37) {
              v38 = v22;
            }
            v48 = v38;
            v19 = v22;
            if (v21) {
              goto LABEL_159;
            }
            break;
          case 8:
            uint64_t v20 = 9;
            if (v21) {
              goto LABEL_158;
            }
            goto LABEL_122;
          case 12:
            BOOL v31 = [v22 isEqualToString:@"metadata.nosync"] == 0;
            unsigned int v32 = 13;
            unsigned int v33 = 36;
LABEL_89:
            if (v31) {
              uint64_t v20 = v32;
            }
            else {
              uint64_t v20 = v33;
            }
            v34 = v48;
            if (v31) {
              v34 = v22;
            }
            v48 = v34;
            if (v21) {
              goto LABEL_159;
            }
            goto LABEL_141;
          case 13:
            uint64_t v20 = 35;
            if ((v21 & 1) == 0) {
              goto LABEL_116;
            }
            goto LABEL_74;
          case 15:
            if (([v22 isEqualToString:@"tempLogs.nosync"] & 1) == 0)
            {
              int v35 = [v22 isEqualToString:@".stage.nosync"];
              if (v35) {
                uint64_t v20 = 23;
              }
              else {
                uint64_t v20 = 16;
              }
              v36 = v47;
              if (!v35) {
                v36 = v22;
              }
              v47 = v36;
              BYTE4(v45) |= v35;
              if ((v21 & 1) == 0) {
                goto LABEL_141;
              }
              goto LABEL_159;
            }
            char v46 = 1;
            uint64_t v23 = 18;
LABEL_151:
            uint64_t v24 = v48;
            if (v21) {
              goto LABEL_138;
            }
            goto LABEL_152;
          case 16:
          case 19:
          case 24:
            if ((v45 & 0x100000000) != 0) {
              unsigned int v25 = 25;
            }
            else {
              unsigned int v25 = 17;
            }
            BOOL v26 = (v46 & 1) == 0;
            unsigned int v27 = 20;
LABEL_62:
            if (v26) {
              uint64_t v20 = v25;
            }
            else {
              uint64_t v20 = v27;
            }
            if (v21)
            {
              v44 = v22;
              goto LABEL_159;
            }
            char v18 = 0;
            v44 = v22;
            break;
          case 17:
          case 20:
          case 25:
            if ((v45 & 0x100000000) != 0) {
              unsigned int v28 = 26;
            }
            else {
              unsigned int v28 = 22;
            }
            if (v46) {
              uint64_t v20 = 21;
            }
            else {
              uint64_t v20 = v28;
            }
            if (v14 < v13 - 1 && ++v14 < v13)
            {
              do
              {
                [v15 addObject:v22];
                uint64_t v22 = (void *)[v12 objectAtIndex:v14++];
              }
              while (v13 != v14);
              unint64_t v14 = v13;
            }
            v19 = v22;
            if (([v22 hasSuffix:@".0.cdt"] & 1) != 0
              || [v22 hasSuffix:@".0.cdt.nosync"])
            {
              if ([v22 isEqualToString:@"receipt.0.cdt"]) {
                uint64_t v20 = 32;
              }
              else {
                uint64_t v20 = 41;
              }
            }
            if ([v22 hasSuffix:@".cdt"])
            {
              uint64_t v23 = v20;
              uint64_t v24 = v48;
              if (v21) {
                goto LABEL_138;
              }
              goto LABEL_152;
            }
            if (!(v21 & 1 | (([v22 hasSuffix:@".cdt.nosync"] & 1) == 0))) {
              goto LABEL_141;
            }
            goto LABEL_159;
          case 18:
          case 23:
            if (v46) {
              uint64_t v20 = 19;
            }
            else {
              uint64_t v20 = 24;
            }
            if (v21) {
              goto LABEL_74;
            }
            goto LABEL_116;
          case 27:
            uint64_t v20 = 28;
            if ((v21 & 1) == 0) {
              goto LABEL_116;
            }
            goto LABEL_74;
          case 28:
            uint64_t v20 = 29;
            if (v21) {
              goto LABEL_158;
            }
            goto LABEL_122;
          case 30:
            if ([v22 rangeOfString:@"_SUPPORT"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v23 = 31;
              goto LABEL_136;
            }
            [v15 addObject:v22];
            uint64_t v20 = 37;
            if (v21) {
              goto LABEL_159;
            }
            goto LABEL_141;
          case 35:
            if ([v22 isEqualToString:@"metadata.store"])
            {
              uint64_t v23 = 14;
            }
            else
            {
              if (([v22 hasPrefix:@"metadata.store"] & 1) == 0)
              {
                v39 = (void *)[v22 componentsSeparatedByString:@"."];
                if ([v39 count] == 2)
                {
                  char v40 = objc_msgSend((id)objc_msgSend(v39, "lastObject"), "isEqualToString:", @"cid");
                  uint64_t v20 = 33;
                  if (!(v21 & 1 | ((v40 & 1) == 0)))
                  {
LABEL_122:
                    char v18 = 0;
                    v19 = v22;
                    break;
                  }
                }
                else
                {
                  uint64_t v20 = 33;
                }
LABEL_158:
                v19 = v22;
                goto LABEL_159;
              }
              uint64_t v23 = 34;
            }
LABEL_136:
            uint64_t v24 = v48;
            v19 = v22;
LABEL_137:
            if (v21)
            {
LABEL_138:
              v48 = v24;
              uint64_t v20 = v23;
              goto LABEL_159;
            }
LABEL_152:
            char v18 = 0;
            v48 = v24;
            uint64_t v20 = v23;
            break;
          case 36:
            uint64_t v20 = 13;
            if (v21)
            {
              v48 = v22;
              goto LABEL_159;
            }
            char v18 = 0;
            v48 = v22;
            break;
          case 37:
            if ([v22 rangeOfString:@"EXTERNAL_DATA"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v20 = 37;
              goto LABEL_159;
            }
            [v15 addObject:v22];
            uint64_t v20 = 38;
            if (v21) {
              goto LABEL_159;
            }
LABEL_141:
            char v18 = 0;
            break;
          case 38:
            uint64_t v20 = 39;
            if (v21) {
              goto LABEL_158;
            }
            goto LABEL_122;
          case 42:
            uint64_t v20 = 5;
            if (v21)
            {
LABEL_74:
              v47 = v22;
LABEL_159:
              if ((![v19 length] || objc_msgSend(v19, "characterAtIndex:", 0) != 46)
                && +[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to continue parse components of URL: %@\nConfused by: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 1139, a2, v22);
              }
              char v18 = 1;
            }
            else
            {
LABEL_116:
              char v18 = 0;
              v47 = v22;
            }
            break;
          default:
            goto LABEL_159;
        }
        ++v14;
      }
      while (v14 < v13);
      p_cache = (void **)(PFUbiquityMetadataFactory + 16);
      v41 = v44;
      v42 = v47;
      v43 = v48;
      if (v18) {
        goto LABEL_172;
      }
    }
    if (![v19 length] || objc_msgSend(v19, "characterAtIndex:", 0) != 46)
    {
      a2 = objc_alloc_init((Class)(p_cache + 248));
      [a2 setUbiquityRootLocation:a3];
      [a2 setUbiquityLocationType:v20];
      [a2 setExportingPeerID:v43];
      [a2 setStoreName:v42];
      [a2 setModelVersionHash:v41];
      [a2 setFilename:v19];
      [a2 setOtherPathComponents:v15];
      -[PFUbiquityLocation updateHash](a2);
      goto LABEL_174;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Ignoring private file: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 1151, a2);
    }
LABEL_172:
    a2 = 0;
LABEL_174:

    return a2;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Path: %@ is a ubiquity root url.\nMatches: %@", "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 841, a2, v5);
  }
LABEL_25:

  return a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self == a3) {
        return 1;
      }
      unint64_t hash = self->_hash;
      if (hash == [a3 hash])
      {
        int v6 = -[PFUbiquityLocation createFullPath]((uint64_t)self);
        uint64_t v7 = -[PFUbiquityLocation createFullPath]((uint64_t)a3);
        v8 = v7;
        if (v6)
        {
          uint64_t v9 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v6);
          if (v8)
          {
LABEL_7:
            uint64_t v10 = +[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v8);
            char v11 = 0;
            if (v9 && v10) {
              char v11 = [v9 isEqualToString:v10];
            }
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v9 = 0;
          if (v7) {
            goto LABEL_7;
          }
        }
        char v11 = 0;
LABEL_15:

        return v11;
      }
    }
  }
  return 0;
}

- (BOOL)isEqualToURL:(id)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 || (isKindOfClass & 1) == 0) {
    return 0;
  }
  int v6 = (void *)[a3 path];
  uint64_t v7 = -[PFUbiquityLocation createFullPath]((uint64_t)self);
  self;
  v8 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v6);
  LOBYTE(v8) = objc_msgSend(v8, "isEqualToString:", +[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v7));

  return (char)v8;
}

+ (uint64_t)createVersionHashStringForModel:(uint64_t)a1
{
  self;
  uint64_t v3 = (void *)[a2 versionHash];

  return +[_PFRoutines _createNicksBase64EncodedStringFromData:]((uint64_t)_PFRoutines, v3);
}

+ (void)createMetadataStoreFileLocationForLocalPeerID:(uint64_t)a3 storeName:(void *)a4 andUbiquityRootLocation:
{
  self;
  uint64_t v7 = (void *)[a4 copy];
  [v7 setExportingPeerID:a2];
  [v7 setStoreName:a3];
  [v7 setFilename:@"metadata.store"];
  [v7 setUbiquityLocationType:14];
  -[PFUbiquityLocation updateHash](v7);
  return v7;
}

+ (void)createMetadataPeerStoreLocationForLocalPeerID:(uint64_t)a3 storeName:(void *)a4 andUbiquityRootLocation:
{
  self;
  uint64_t v7 = (void *)[a4 copy];
  [v7 setStoreName:a3];
  [v7 setExportingPeerID:a2];
  [v7 setUbiquityLocationType:35];
  -[PFUbiquityLocation updateHash](a4);
  return v7;
}

+ (void)createMetadataUUIDLocationForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 UUID:(void *)a5 andUbiquityRootLocation:
{
  self;
  uint64_t v9 = (void *)[a5 copy];
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", a4, @"cid"];
  [v9 setFilename:v10];

  [v9 setStoreName:a3];
  [v9 setExportingPeerID:a2];
  [v9 setUbiquityLocationType:33];
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createPeerBaselineFileLocationForLocalPeerID:(void *)a3 andBaselineFileLocation:
{
  self;
  id v5 = (void *)[a3 copy];
  [v5 setFilename:a2];
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createPeerBaselineFileSafeSaveLocationForLocalPeerID:(void *)a3 andBaselineFileLocation:
{
  self;
  id v5 = (void *)[a3 copy];
  self;
  if (_usesCloudDocs == 1) {
    a2 = (void *)[a2 stringByAppendingString:@".nosync"];
  }
  [v5 setFilename:a2];
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createBaselineLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  self;
  uint64_t v9 = (void *)[a5 copy];
  [v9 setUbiquityLocationType:a2];
  switch((int)a2)
  {
    case 2:
      goto LABEL_5;
    case 3:
      goto LABEL_4;
    case 10:
      [v9 setFilename:@"baseline.zip"];
      goto LABEL_3;
    case 11:
LABEL_3:
      [v9 setModelVersionHash:a4];
LABEL_4:
      [v9 setStoreName:a3];
LABEL_5:
      -[PFUbiquityLocation updateHash](v9);
      return v9;
    default:

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%d is not a valid baseline location type.", a2), 0 reason userInfo]);
  }
}

+ (void)createBaselineStagingLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 modelVersionHash:(uint64_t)a5 andFilename:(void *)a6 withUbiquityRootLocation:
{
  self;
  char v11 = (void *)[a6 copy];
  [v11 setUbiquityLocationType:a2];
  if ((int)a2 > 10)
  {
    if (a2 == 11 || a2 == 30) {
      goto LABEL_6;
    }
    if (a2 == 31)
    {
      [v11 setFilename:a5];
LABEL_6:
      [v11 setModelVersionHash:a4];
LABEL_9:
      [v11 setStoreName:a3];
      goto LABEL_10;
    }
LABEL_11:

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%d is not a valid baseline location type.", a2), 0 reason userInfo]);
  }
  if (a2 != 2)
  {
    if (a2 == 3) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }
LABEL_10:
  -[PFUbiquityLocation updateHash](v11);
  return v11;
}

+ (void)createCurrentBaselineLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 peerID:(uint64_t)a5 andModelVersionHash:(uint64_t)a6 forFileNamed:(void *)a7 withUbiquityRootLocation:
{
  self;
  unint64_t v13 = (void *)[a7 copy];
  [v13 setUbiquityLocationType:a2];
  switch((int)a2)
  {
    case 4:
      goto LABEL_6;
    case 5:
      goto LABEL_4;
    case 6:
      goto LABEL_3;
    case 7:
    case 8:
    case 9:
      [v13 setFilename:a6];
LABEL_3:
      [v13 setModelVersionHash:a5];
LABEL_4:
      [v13 setStoreName:a3];
      break;
    default:
      if (a2 != 42)
      {

        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%d is not a valid current baseline location type.", a2), 0 reason userInfo]);
      }
      return result;
  }
  [v13 setExportingPeerID:a4];
LABEL_6:
  -[PFUbiquityLocation updateHash](v13);
  return v13;
}

+ (void)createTransactionLogLocationForPeerID:(uint64_t)a3 storeName:(uint64_t)a4 modelVersionHash:(uint64_t)a5 logFilename:(void *)a6 andUbiquityRootLocation:
{
  self;
  char v11 = (void *)[a6 copy];
  [v11 setExportingPeerID:a2];
  [v11 setStoreName:a3];
  [v11 setModelVersionHash:a4];
  [v11 setFilename:a5];
  [v11 setUbiquityLocationType:22];
  -[PFUbiquityLocation updateHash](v11);
  return v11;
}

+ (void)createStagingPeerStoreVersionLocationForExportingPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  self;
  uint64_t v9 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a2, a3, a4, a5);
  [v9 setUbiquityLocationType:25];
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createPeerStoreVersionLocationForPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  self;
  uint64_t v9 = (void *)[a5 copy];
  [v9 setUbiquityLocationType:17];
  [v9 setExportingPeerID:a2];
  [v9 setStoreName:a3];
  [v9 setModelVersionHash:a4];
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createPeerRootLocationForPeerID:(void *)a3 withUbiquityRootLocation:
{
  self;
  id v5 = (void *)[a3 copy];
  [v5 setUbiquityLocationType:15];
  [v5 setExportingPeerID:a2];
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createPeerStoreLocationForPeerID:(uint64_t)a3 andStoreName:(void *)a4 withUbiquityRootLocation:
{
  self;
  uint64_t v7 = (void *)[a4 copy];
  [v7 setUbiquityLocationType:16];
  [v7 setExportingPeerID:a2];
  [v7 setStoreName:a3];
  -[PFUbiquityLocation updateHash](v7);
  return v7;
}

+ (PFUbiquityLocation)createUbiquityExternalDataReferenceStoreLocationForStoreName:(uint64_t)a3 withUbiquityRootLocation:
{
  self;
  id v5 = objc_alloc_init(PFUbiquityLocation);
  [(PFUbiquityLocation *)v5 setUbiquityRootLocation:a3];
  [(PFUbiquityLocation *)v5 setStoreName:a2];
  [(PFUbiquityLocation *)v5 setUbiquityLocationType:28];
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createUbiquityExternalDataReferenceFileLocationForUUID:(void *)a3 andStore:(void *)a4 withUbiquityRootLocation:
{
  self;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
  self;
  v8 = (void *)[a4 copy];
  [v8 setUbiquityRootLocation:a4];
  [v8 setFilename:a2];
  [v8 setStoreName:v7];
  [v8 setUbiquityLocationType:29];
  -[PFUbiquityLocation updateHash](v8);
  return v8;
}

+ (void)createUbiquityExternalDataReferenceFileLocationForUUID:(uint64_t)a3 andLog:
{
  self;
  if (a3) {
    id v5 = *(void **)(a3 + 24);
  }
  else {
    id v5 = 0;
  }
  int v6 = (void *)[v5 copy];
  [v6 setFilename:a2];
  [v6 setModelVersionHash:0];
  [v6 setUbiquityLocationType:29];
  -[PFUbiquityLocation updateHash](v6);
  return v6;
}

+ (void)createUbiquityPeerReceiptFileLocationForPeerWithID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  self;
  uint64_t v9 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a2, a3, a4, @"receipt.0.cdt", a5);
  [v9 setUbiquityLocationType:32];
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createUbiquityPeerReceiptSafeSaveLocationFromReceiptFileLocation:(uint64_t)a1
{
  self;
  uint64_t v3 = (void *)[a2 copy];
  [v3 setUbiquityLocationType:41];
  self;
  int v4 = _usesCloudDocs;
  id v5 = [NSString alloc];
  if (v4 == 1)
  {
    if (a2) {
      uint64_t v6 = a2[4];
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = [v5 initWithFormat:@"%@.0.cdt.nosync", v6];
  }
  else
  {
    if (a2) {
      uint64_t v8 = a2[4];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v7 = [v5 initWithFormat:@"%@.0.cdt", v8];
  }
  uint64_t v9 = (void *)v7;
  [v3 setFilename:v7];

  -[PFUbiquityLocation updateHash](v3);
  return v3;
}

+ (id)createMapOfLocationsForOldManagedObjectModel:(void *)a3 andNewManagedObjectModel:(uint64_t)a4 inUbiquityPeerStoreLocation:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  self;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self;
  uint64_t v23 = (void *)+[_PFRoutines _createNicksBase64EncodedStringFromData:]((uint64_t)_PFRoutines, (void *)[a2 versionHash]);
  self;
  unsigned int v25 = (void *)+[_PFRoutines _createNicksBase64EncodedStringFromData:]((uint64_t)_PFRoutines, (void *)[a3 versionHash]);
  if (a4)
  {
    uint64_t v7 = *(void *)(a4 + 32);
    uint64_t v8 = *(void *)(a4 + 40);
    if (*(_DWORD *)(a4 + 24) == 1) {
      uint64_t v9 = (void *)a4;
    }
    else {
      uint64_t v9 = *(void **)(a4 + 8);
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v10 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v7, v8, (uint64_t)v23, v9);
  unsigned int v27 = -[PFUbiquityLocation createFullPath]((uint64_t)v10);
  uint64_t v22 = v10;
  char v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "subpathsAtPath:", v27);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    id obj = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v27, *(void *)(*((void *)&v28 + 1) + 8 * i)];
        if (a4)
        {
          uint64_t v16 = a4;
          while (*(_DWORD *)(v16 + 24) != 1)
          {
            uint64_t v16 = *(void *)(v16 + 8);
            if (!v16) {
              goto LABEL_14;
            }
          }
          uint64_t v17 = *(void **)(v16 + 16);
        }
        else
        {
LABEL_14:
          uint64_t v17 = 0;
        }
        self;
        self;
        char v18 = +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, v17, 1);
        v19 = +[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v15, v18);

        if (v19 && v19[6] == 32)
        {
        }
        else
        {
          uint64_t v20 = (void *)[v19 copy];
          [v20 setModelVersionHash:v25];
          [v24 setObject:v20 forKey:v19];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  return v24;
}

+ (void)createLocalStoresPathWithLocalPeerID:(__CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:
{
  self;
  uint64_t v9 = +[PFUbiquityLocation createLocalBasePathWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, a2, a3, a4, a5);
  [v9 appendString:@"store"];
  [v9 appendString:@"/"];
  return v9;
}

+ (void)createLocalBasePathWithLocalPeerID:(__CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:
{
  self;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", objc_msgSend((id)objc_msgSend(a5, "path"), "stringByDeletingLastPathComponent"));
  uint64_t v10 = [v9 rangeOfString:@"CoreDataUbiquitySupport"];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v9, "deleteCharactersInRange:", v10, objc_msgSend(v9, "length") - v10);
  }
  if (objc_msgSend(v9, "characterAtIndex:", objc_msgSend(v9, "length") - 1) != 47) {
    [v9 appendString:@"/"];
  }
  [v9 appendString:_PFUbiquityLocationLocalSentinel];
  [v9 appendString:@"/"];
  [v9 appendString:a2];
  [v9 appendString:@"/"];
  [v9 appendString:a4];
  [v9 appendString:@"/"];
  if (a3)
  {
    char v11 = v9;
    uint64_t v12 = a3;
  }
  else
  {
    uint64_t v12 = @"local";
    char v11 = v9;
  }
  [v11 appendString:v12];
  [v9 appendString:@"/"];
  return v9;
}

+ (PFUbiquityLocation)createLocalContainerRootLocationWithLocalPeerID:(__CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:
{
  self;
  uint64_t v9 = +[PFUbiquityLocation createLocalBasePathWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, a2, a3, a4, a5);
  [v9 appendString:@"container"];
  uint64_t v10 = +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, v9, 0);

  return v10;
}

+ (id)createArrayOfSubLocationsAtLocation:(uint64_t)a3 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  self;
  id v5 = -[PFUbiquityLocation createFullPath](a2);
  uint64_t v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    uint64_t v7 = (void *)[v6 subpathsOfDirectoryAtPath:v5 error:a3];
    if (v7)
    {
      uint64_t v8 = v7;
      id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        do
        {
          uint64_t v12 = v8;
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v12);
            }
            unint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
            id v15 = +[PFUbiquityLocation createStringByAppendingSubpath:toPath:]((uint64_t)PFUbiquityLocation, v14, (uint64_t)v5);
            if (a2)
            {
              uint64_t v16 = (unsigned char *)a2;
              if (*(_DWORD *)(a2 + 24) != 1) {
                uint64_t v16 = *(unsigned char **)(a2 + 8);
              }
            }
            else
            {
              uint64_t v16 = 0;
            }
            uint64_t v17 = +[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v15, v16);
            if (v17)
            {
              char v18 = v17;
              [v21 addObject:v17];
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got nil location for subpath: %@ of location: %@", "+[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]", 1678, v14, a2);
            }

            ++v13;
          }
          while (v10 != v13);
          uint64_t v8 = v12;
          uint64_t v19 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          uint64_t v10 = v19;
        }
        while (v19);
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  return v21;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end