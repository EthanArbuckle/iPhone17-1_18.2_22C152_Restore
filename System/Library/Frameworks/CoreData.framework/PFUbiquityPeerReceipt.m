@interface PFUbiquityPeerReceipt
- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4;
- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4;
- (PFUbiquityPeerReceipt)init;
- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 andKnowledgeVector:(id)a4 forPeerID:(id)a5 storeName:(id)a6 modelVersionHash:(id)a7 andUbiquityRootLocation:(id)a8;
- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 andReceiptFileLocation:(id)a4;
- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 receiptPeerID:(id)a4 storeName:(id)a5 modelVersionHash:(id)a6 andUbiquityRootLocation:(id)a7;
- (id)description;
- (void)dealloc;
@end

@implementation PFUbiquityPeerReceipt

- (PFUbiquityPeerReceipt)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityPeerReceipt;
  v2 = [(PFUbiquitySafeSaveFile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_kv = 0;
    v2->_writeDate = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 receiptPeerID:(id)a4 storeName:(id)a5 modelVersionHash:(id)a6 andUbiquityRootLocation:(id)a7
{
  v9 = +[PFUbiquityLocation createUbiquityPeerReceiptFileLocationForPeerWithID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
  v10 = [(PFUbiquityPeerReceipt *)self initWithLocalPeerID:a3 andReceiptFileLocation:v9];

  return v10;
}

- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 andKnowledgeVector:(id)a4 forPeerID:(id)a5 storeName:(id)a6 modelVersionHash:(id)a7 andUbiquityRootLocation:(id)a8
{
  v9 = [(PFUbiquityPeerReceipt *)self initWithLocalPeerID:a3 receiptPeerID:a5 storeName:a6 modelVersionHash:a7 andUbiquityRootLocation:a8];
  if (v9) {
    v9->_kv = (PFUbiquityKnowledgeVector *)a4;
  }
  return v9;
}

- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 andReceiptFileLocation:(id)a4
{
  v7 = +[PFUbiquityLocation createUbiquityPeerReceiptSafeSaveLocationFromReceiptFileLocation:]((uint64_t)PFUbiquityLocation, a4);
  v8 = [(PFUbiquitySafeSaveFile *)self initWithPermanentLocation:a4 safeSaveLocation:v7 andLocalPeerID:a3];

  return v8;
}

- (void)dealloc
{
  self->_kv = 0;
  self->_writeDate = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerReceipt;
  [(PFUbiquitySafeSaveFile *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerReceipt;
  return (id)[NSString stringWithFormat:@"%@\n\tkv: %@\n", -[PFUbiquitySafeSaveFile description](&v3, sel_description), self->_kv];
}

- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v4 = 1;
  if (!self->_kv)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 1;
    id v31 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__60;
    v29 = __Block_byref_object_dispose__60;
    uint64_t v30 = 0;
    if (a3) {
      uint64_t v8 = *((void *)a3 + 4);
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a3, v8);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    v37 = __Block_byref_object_copy__60;
    v38 = __Block_byref_object_dispose__60;
    uint64_t v39 = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__PFUbiquityPeerReceipt_loadFileFromLocation_error___block_invoke;
    v20[3] = &unk_1E544FA98;
    v20[6] = buf;
    v20[7] = &v25;
    v20[8] = &v32;
    v20[4] = self;
    v20[5] = &v21;
    -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v9, (uint64_t)a3, 1, 1, &v31, (uint64_t)v20);
    if (*((unsigned char *)v33 + 24))
    {
      v10 = [PFUbiquityKnowledgeVector alloc];
      self->_kv = [(PFUbiquityKnowledgeVector *)v10 initWithKnowledgeVectorString:v26[5]];
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Successfully loaded receipt: %@", "-[PFUbiquityPeerReceipt loadFileFromLocation:error:]", 123, self);
      }
    }
    else
    {
      if (*((unsigned char *)v22 + 24)) {
        id v31 = *(id *)(*(void *)&buf[8] + 40);
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to load knowledge vector from location: %@. Error (%d): %@\nuserInfo: %@", "-[PFUbiquityPeerReceipt loadFileFromLocation:error:]", 129, a3, *((unsigned __int8 *)v22 + 24), v31, [v31 userInfo]);
      }
    }
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);

    if (!*((unsigned char *)v33 + 24))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to load receipt file: %@\nuserInfo: %@", "-[PFUbiquityPeerReceipt loadFileFromLocation:error:]", 134, v31, [v31 userInfo]);
      }
      if (v31)
      {
        if (a4) {
          *a4 = v31;
        }
      }
      else
      {
        uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeVector/PFUbiquityPeerReceipt.m");
        v19 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeV"
                               "ector/PFUbiquityPeerReceipt.m";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 135;
          _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }

    v26[5] = 0;
    BOOL v4 = *((unsigned char *)v33 + 24) != 0;
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v32, 8);
  }
  return v4;
}

void __52__PFUbiquityPeerReceipt_loadFileFromLocation_error___block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  objc_super v3 = (void *)[a2 path];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3))
  {
    id v7 = (id)-[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], v3, 0, *(void *)(a1[6] + 8) + 40);
    *(void *)(*(void *)(a1[7] + 8) + 40) = [[NSString alloc] initWithData:-[_PFZipFileArchive contentsForEntryName:]((uint64_t)v7, @"kv"), 4 encoding];
    if (!*(void *)(*(void *)(a1[7] + 8) + 40)) {
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    }
    BOOL v4 = (void *)-[_PFZipFileArchive contentsForEntryName:]((uint64_t)v7, @"date");
    if (v4)
    {
      objc_super v5 = v4;
      if ([v4 length])
      {
        double v6 = *(double *)[v5 bytes];

        *(void *)(a1[4] + 96) = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v6];
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
  }
}

- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v33 = 0;
  id v34 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3052000000;
  id v31 = __Block_byref_object_copy__60;
  uint64_t v32 = __Block_byref_object_dispose__60;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3052000000;
  v23[3] = __Block_byref_object_copy__60;
  kv = self->_kv;
  v23[4] = __Block_byref_object_dispose__60;
  v23[5] = kv;
  uint64_t v8 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)a3);
  if (a3) {
    uint64_t v9 = *((void *)a3 + 4);
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a3, v9);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__PFUbiquityPeerReceipt_writeFileToLocation_error___block_invoke;
  v22[3] = &unk_1E544FA98;
  v11 = v10;
  v22[6] = &v35;
  v22[7] = &v28;
  v22[8] = v23;
  v22[4] = self;
  v22[5] = &v24;
  [v10 coordinateWritingItemAtURL:v8 options:8 error:&v34 byAccessor:v22];
  if (*((unsigned char *)v36 + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@: Successfully wrote to file.", "-[PFUbiquityPeerReceipt writeFileToLocation:error:]", 182, self);
    }
  }
  else
  {
    if (*((unsigned char *)v25 + 24)) {
      id v34 = (id)v29[5];
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@: Unable to write receipt file. Error: %@\nuserInfo: %@", "-[PFUbiquityPeerReceipt writeFileToLocation:error:]", 188, self, v34, [v34 userInfo]);
    }
  }
  if (!*((unsigned char *)v36 + 24))
  {
    if (v34)
    {
      if (a4) {
        *a4 = v34;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeVector/PFUbiquityPeerReceipt.m");
      uint64_t v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeVector/PFUbiquityPeerReceipt.m";
        __int16 v41 = 1024;
        int v42 = 192;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  char v12 = *((unsigned char *)v36 + 24);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v35, 8);
  return v12;
}

void __51__PFUbiquityPeerReceipt_writeFileToLocation_error___block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  BOOL v4 = (void *)[a2 URLByDeletingLastPathComponent];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v4, "path")) & 1) == 0)*(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, *(void *)(a1[7] + 8) + 40); {
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  }
  {
    uint64_t v5 = *(void *)(*(void *)(a1[8] + 8) + 40);
    if (v5) {
      id v6 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](v5);
    }
    else {
      id v6 = objc_alloc_init(NSString);
    }
    id v7 = v6;
    uint64_t v8 = [v6 dataUsingEncoding:4];
    [*(id *)(a1[4] + 96) timeIntervalSince1970];
    uint64_t v13 = v9;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v13 length:8];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"kv", v10, @"date", 0);
    char v12 = (void *)-[_PFZipFileArchive initWithEntryNames:contents:properties:options:]((uint64_t)[_PFZipFileArchive alloc], (void *)[v11 allKeys], v11, 0);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = -[_PFZipFileArchive writeToFile:options:error:]((uint64_t)v12, (void *)[a2 path], 1, *(void *)(a1[7] + 8) + 40);
  }
}

@end