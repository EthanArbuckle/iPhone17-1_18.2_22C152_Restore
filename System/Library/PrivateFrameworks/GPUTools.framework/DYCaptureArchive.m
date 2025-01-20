@interface DYCaptureArchive
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)isFunctionStreamFilename:(id)a3;
+ (BOOL)isInternalFilename:(id)a3;
+ (BOOL)isNotSpecialFilename:(id)a3;
+ (id)coreArchiveBundleFilesPredicate;
+ (id)createArchiveInTemporaryDirectory:(id *)a3;
+ (id)createArchiveInTemporaryDirectoryWithName:(id)a3 deleteOnClose:(BOOL)a4 error:(id *)a5;
+ (id)createArchiveInTemporaryDirectoryWithName:(id)a3 error:(id *)a4;
+ (id)getReturnAllFilesPredicate;
+ (id)internalFilenamePredicate;
+ (id)standardFunctionStreamFilenamePredicate;
+ (id)standardFunctionStreamFilenamePrefixes;
+ (unint64_t)contextFromFilename:(id)a3;
- ($26580380F16D6530B01F933C495FCEE1)_fileTable;
- ($55969086526AB00ED573B0A7B58FA2BF)_header;
- ($7E080378D8F67055EE0984892F39872B)_nameTable;
- ($938B03310D06493B2963E5A84CB75A7E)_hashTable;
- (BOOL)_createNewArchiveAtPath:(id)a3 error:(id *)a4;
- (BOOL)_flushWriteBuffer:(id *)a3;
- (BOOL)_getInfo:(id *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5;
- (BOOL)_loadArchiveAtPath:(id)a3 error:(id *)a4;
- (BOOL)_performAddAlias:(id)a3 targetting:(id)a4 error:(id *)a5;
- (BOOL)_performCommit:(id *)a3;
- (BOOL)_performFinalizeAddFileAtPosition:(unsigned int)a3 name:(id)a4 data:(id)a5 error:(id *)a6;
- (BOOL)_performReplaceDataOfFile:(id)a3 withData:(id)a4 error:(id *)a5;
- (BOOL)_requestDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t *)a5 error:(id *)a6;
- (BOOL)_writeIndexInPath:(id)a3 error:(id *)a4;
- (BOOL)_writeMetadataInPath:(id)a3 error:(id *)a4;
- (BOOL)acceptCaptureVisitor:(id)a3;
- (BOOL)addAlias:(id)a3 forName:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)addAlias:(id)a3 forName:(id)a4 options:(id)a5 error:(id *)a6 waitUntilDone:(BOOL)a7;
- (BOOL)addCaptureFile:(id)a3 options:(id)a4 error:(id *)a5 waitUntilDone:(BOOL)a6;
- (BOOL)addFileWithName:(id)a3 data:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)addFileWithName:(id)a3 data:(id)a4 options:(id)a5 error:(id *)a6 waitUntilDone:(BOOL)a7;
- (BOOL)addFilesFromArchive:(id)a3 error:(id *)a4 passingTest:(id)a5;
- (BOOL)addTempFileWithName:(id)a3 options:(id)a4 fromLocation:(id)a5 error:(id *)a6;
- (BOOL)adjunctFileExistsForFilename:(id)a3 error:(id *)a4;
- (BOOL)allocatePageAlignedMemory:(void *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5;
- (BOOL)commit:(id *)a3;
- (BOOL)commitForExport:(id *)a3 progressHandler:(id)a4;
- (BOOL)deleteOnClose;
- (BOOL)fileExistsForFilename:(id)a3 error:(id *)a4;
- (BOOL)fileExistsForFilenameBuffer:(const char *)a3 error:(id *)a4;
- (BOOL)getInfo:(id *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5;
- (BOOL)getInfo:(id *)a3 forFilename:(id)a4 error:(id *)a5;
- (BOOL)getInfo:(id *)a3 forFilenameBuffer:(const char *)a4 error:(id *)a5;
- (BOOL)isClosed;
- (BOOL)isReadOnly;
- (BOOL)replaceDataOfFile:(id)a3 withData:(id)a4 error:(id *)a5;
- (BOOL)requestBuffer:(void *)a3 forFilePosition:(unint64_t)a4 cacheEntry:(id *)a5 needsData:(BOOL *)a6 error:(id *)a7;
- (BOOL)requestDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t *)a5 error:(id *)a6;
- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)storeAdjunctData:(id)a3 filename:(id)a4 error:(id *)a5;
- (BOOL)updateDataReferenceCounts:(id)a3 error:(id *)a4;
- (DYCaptureArchive)init;
- (DYCaptureArchive)initWithURL:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (NSString)path;
- (NSURL)url;
- (__CFUUID)uuid;
- (id).cxx_construct;
- (id)_copyDataForFilePosition:(unint64_t)a3 error:(id *)a4;
- (id)_getCFilename:(id)a3 outSize:(unint64_t *)a4 error:(id *)a5;
- (id)_readRawDataForFilePosition:(unsigned int)a3 error:(id *)a4;
- (id)_resolveCFilename:(const char *)a3 error:(id *)a4;
- (id)copyAdjunctDataForFilename:(id)a3 error:(id *)a4;
- (id)copyDataForFilePosition:(unint64_t)a3 error:(id *)a4;
- (id)copyDataForFilename:(id)a3 error:(id *)a4;
- (id)copyDataForFilenameBuffer:(const char *)a3 error:(id *)a4;
- (id)filenamesAtIndexes:(id)a3;
- (id)filenamesWithPredicate:(id)a3 error:(id *)a4;
- (id)filenamesWithPrefix:(id)a3 error:(id *)a4;
- (id)getFilenameForFilePosition:(unint64_t)a3 error:(id *)a4;
- (id)metadataValueForKey:(id)a3;
- (id)objectInFilenamesAtIndex:(unint64_t)a3;
- (id)openFileWithFilename:(id)a3 error:(id *)a4;
- (id)resolveFilename:(id)a3 error:(id *)a4;
- (int)_storeFileDescriptor;
- (int)_tryAgain:(id *)a3;
- (int64_t)_readDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6;
- (int64_t)_writeBufferToBackingStore:(const void *)a3 size:(int64_t)a4 error:(id *)a5;
- (int64_t)readDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6;
- (int64_t)readDataForFilename:(id)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6;
- (int64_t)readDataForFilenameBuffer:(const char *)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6;
- (uint64_t)cacheAllResources;
- (unint64_t)_reserveStringStorageSize:(unint64_t)a3;
- (unint64_t)_stringTableOffsets;
- (unint64_t)countOfFilenames;
- (unsigned)_createNewFileEntry;
- (unsigned)_createNewHashEntry:(const char *)a3 didGrowTable:(BOOL *)a4;
- (unsigned)_createNewNameEntry;
- (unsigned)_findHashEntry:(const char *)a3;
- (unsigned)_performAddFileWithName:(id)a3 dataSize:(unsigned int)a4 error:(id *)a5;
- (unsigned)_performAddFileWithName:(id)a3 dataSize:(unsigned int)a4 withFlags:(unsigned int)a5 error:(id *)a6;
- (vector<unsigned)getSortedFilePositionsForDataCaching;
- (void)_cleanBytes:(unint64_t)a3 andSkip:(id *)a4;
- (void)_fileObjectDidDeallocate;
- (void)_fileObjectDidInitialize;
- (void)_fillStringTableNSCacheForRange:(_NSRange)a3;
- (void)_growHashTable;
- (void)_performEmptyStringTableNSCache;
- (void)_springCleaning;
- (void)_stringTableStorage;
- (void)_swapFileTable;
- (void)_swapHashTable;
- (void)_swapNameTable;
- (void)allocateAndReadDataForFilenameBuffer:(const char *)a3 outSize:(unint64_t *)a4 error:(id *)a5;
- (void)cacheAllResources;
- (void)close;
- (void)dealloc;
- (void)discardAndClose;
- (void)getFilenames:(id *)a3 range:(_NSRange)a4;
- (void)initCache;
- (void)markMetadataModified;
- (void)releaseBytesForFilePosition:(unint64_t)a3;
- (void)resizeCache;
- (void)setDeleteOnClose:(BOOL)a3;
- (void)setMetadataFromArchive:(id)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation DYCaptureArchive

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)standardFunctionStreamFilenamePrefixes
{
  if (+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes_once != -1) {
    dispatch_once(&+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes_once, &__block_literal_global);
  }
  return (id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes;
}

uint64_t __58__DYCaptureArchive_standardFunctionStreamFilenamePrefixes__block_invoke()
{
  +[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes = objc_opt_new();
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:*MEMORY[0x263F3FBB0]];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:*MEMORY[0x263F3FB78]];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:*MEMORY[0x263F3FBC0]];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:*MEMORY[0x263F3FB98]];
  uint64_t v0 = *MEMORY[0x263F3FBA0];
  uint64_t v1 = *MEMORY[0x263F3FBA8];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", *MEMORY[0x263F3FBA0], *MEMORY[0x263F3FBA8])];
  uint64_t v2 = *MEMORY[0x263F3FBB8];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", v0, *MEMORY[0x263F3FBB8])];
  uint64_t v3 = *MEMORY[0x263F3FB88];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", v0, *MEMORY[0x263F3FB88])];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:v1];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:v2];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:v3];
  uint64_t v4 = *MEMORY[0x263F3FB80];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", *MEMORY[0x263F3FB80], v1)];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", v4, v2)];
  [(id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", v4, v3)];
  v5 = (void *)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes;
  uint64_t v6 = [NSString stringWithFormat:@"%@-%@", *MEMORY[0x263F3FBC8], v3];
  return [v5 addObject:v6];
}

+ (id)standardFunctionStreamFilenamePredicate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke;
  block[3] = &unk_265333698;
  block[4] = a1;
  if (+[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate_once != -1) {
    dispatch_once(&+[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate_once, block);
  }
  return (id)+[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate;
}

id __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) standardFunctionStreamFilenamePrefixes];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_2;
  v3[3] = &unk_265333670;
  v3[4] = v1;
  id result = (id)[MEMORY[0x263F08A98] predicateWithBlock:v3];
  +[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate = (uint64_t)result;
  return result;
}

BOOL __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_3;
  v5[3] = &unk_265333648;
  v5[4] = a2;
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectsPassingTest:", v5), "count") != 0;
}

uint64_t __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) hasPrefix:a2];
  *a3 = result;
  return result;
}

+ (id)internalFilenamePredicate
{
  if (+[DYCaptureArchive internalFilenamePredicate]::predicate_once != -1) {
    dispatch_once(&+[DYCaptureArchive internalFilenamePredicate]::predicate_once, &__block_literal_global_10);
  }
  return (id)+[DYCaptureArchive internalFilenamePredicate]::predicate;
}

id __45__DYCaptureArchive_internalFilenamePredicate__block_invoke()
{
  id result = (id)[MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_12];
  +[DYCaptureArchive internalFilenamePredicate]::predicate = (uint64_t)result;
  return result;
}

BOOL __45__DYCaptureArchive_internalFilenamePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && [a2 characterAtIndex:0] == 40
      && objc_msgSend(a2, "characterAtIndex:", objc_msgSend(a2, "length") - 1) == 41;
}

+ (BOOL)isFunctionStreamFilename:(id)a3
{
  uint64_t v4 = (void *)[a1 standardFunctionStreamFilenamePredicate];
  return [v4 evaluateWithObject:a3];
}

+ (BOOL)isInternalFilename:(id)a3
{
  uint64_t v4 = (void *)[a1 internalFilenamePredicate];
  return [v4 evaluateWithObject:a3];
}

+ (BOOL)isNotSpecialFilename:(id)a3
{
  return (objc_msgSend(a1, "isInternalFilename:") & 1) == 0
      && ![a1 isFunctionStreamFilename:a3];
}

+ (unint64_t)contextFromFilename:(id)a3
{
  unint64_t v6 = 0;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", @"-"), "lastObject");
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v3];
  [v4 scanHexLongLong:&v6];

  return v6;
}

+ (id)coreArchiveBundleFilesPredicate
{
  return +[DYCaptureArchive getReturnAllFilesPredicate];
}

+ (id)getReturnAllFilesPredicate
{
  if (+[DYCaptureArchive getReturnAllFilesPredicate]::predicate_once != -1) {
    dispatch_once(&+[DYCaptureArchive getReturnAllFilesPredicate]::predicate_once, &__block_literal_global_19);
  }
  return (id)+[DYCaptureArchive getReturnAllFilesPredicate]::predicate;
}

id __46__DYCaptureArchive_getReturnAllFilesPredicate__block_invoke()
{
  id result = (id)[MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_21];
  +[DYCaptureArchive getReturnAllFilesPredicate]::predicate = (uint64_t)result;
  return result;
}

uint64_t __46__DYCaptureArchive_getReturnAllFilesPredicate__block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)createArchiveInTemporaryDirectory:(id *)a3
{
  return (id)[a1 createArchiveInTemporaryDirectoryWithName:0 error:a3];
}

+ (id)createArchiveInTemporaryDirectoryWithName:(id)a3 error:(id *)a4
{
  return (id)[a1 createArchiveInTemporaryDirectoryWithName:a3 deleteOnClose:0 error:a4];
}

+ (id)createArchiveInTemporaryDirectoryWithName:(id)a3 deleteOnClose:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v7 = (void *)[MEMORY[0x263F086E0] mainBundle];
  if (![v7 bundleIdentifier]) {
    objc_msgSend((id)objc_msgSend(v7, "executablePath"), "lastPathComponent");
  }
  id result = (id)DYFSCreateTempFileURL();
  if (result)
  {
    v9 = [[DYCaptureArchive alloc] initWithURL:result options:2562 error:a5];
    [(DYCaptureArchive *)v9 setDeleteOnClose:v6];
    return v9;
  }
  return result;
}

- (BOOL)_createNewArchiveAtPath:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  if (([(id)objc_opt_new() createDirectoryAtPath:a3 withIntermediateDirectories:0 attributes:0 error:a4] & 1) == 0)
  {
LABEL_9:
    DYLog();
    return 0;
  }
  self->_header.fourcc = 1667851384;
  *(_OWORD *)&self->_header.version = xmmword_24F644BF0;
  v7 = ($938B03310D06493B2963E5A84CB75A7E *)malloc_type_malloc(0x3000uLL, 0xCFDB4047uLL);
  self->_hash_table = v7;
  if (v7)
  {
    int __pattern4 = -1;
    memset_pattern4(v7, &__pattern4, 0x3000uLL);
    unint64_t hash_table_length = self->_header.hash_table_length;
    self->_uint64_t file_table_capacity = self->_header.hash_table_length >> 1;
    size_t v9 = 24 * (hash_table_length >> 1);
    v10 = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_malloc(v9, 0xEB3DFD82uLL);
    self->_file_table = v10;
    if (v10)
    {
      bzero(v10, v9);
      uint64_t file_table_capacity = self->_file_table_capacity;
      self->_name_table_capacity = file_table_capacity;
      size_t v12 = 2 * file_table_capacity;
      v13 = ($7E080378D8F67055EE0984892F39872B *)malloc_type_malloc(2 * file_table_capacity, 0x252E420DuLL);
      self->_name_table = v13;
      if (v13)
      {
        bzero(v13, v12);
        unint64_t v14 = 4 * *MEMORY[0x263EF8AF8];
        self->_string_table_capacity = v14;
        v15 = malloc_type_malloc(v14, 0xFED10AD7uLL);
        self->_string_table_storage = v15;
        if (v15)
        {
          bzero(v15, self->_string_table_capacity);
          size_t v16 = 8 * self->_name_table_capacity;
          v17 = (unint64_t *)malloc_type_malloc(v16, 0x730F8FD4uLL);
          self->_string_table_offsets = v17;
          if (v17)
          {
            bzero(v17, v16);
            int v18 = open((const char *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", @"store0"), "fileSystemRepresentation"), 2578, 420);
            self->_backingStoreFD = v18;
            if (v18 != -1)
            {
              self->_backingStoreSize = 0;
              self->_backingStoreWritePosition = 0;
              self->_metadata = (NSMutableDictionary *)objc_opt_new();
              self->_uuid = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
              BOOL result = 1;
              self->_modified = 1;
              return result;
            }
            if (a4)
            {
              v21 = (void *)MEMORY[0x263F087E8];
              uint64_t v22 = *MEMORY[0x263F08438];
              uint64_t v23 = *__error();
              uint64_t v25 = *MEMORY[0x263F08320];
              v26[0] = @"Failed to create backing store.";
              *a4 = (id)objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
            }
            goto LABEL_9;
          }
        }
      }
    }
  }
  if (a4)
  {
    v20 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:4 userInfo:0];
    BOOL result = 0;
    *a4 = v20;
    return result;
  }
  return 0;
}

- (BOOL)_loadArchiveAtPath:(id)a3 error:(id *)a4
{
  v122[1] = *MEMORY[0x263EF8340];
  BOOL v7 = [(DYCaptureArchive *)self isReadOnly];
  if (v7) {
    int v8 = 20;
  }
  else {
    int v8 = 22;
  }
  int v9 = open((const char *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", @"index"), "fileSystemRepresentation"), v8);
  if (v9 == -1)
  {
    if (a4)
    {
      int v17 = *__error();
      if (v17 == 2)
      {
        v19 = @"The index file does not exist. The capture may be incomplete or corrupt.";
      }
      else if (v17 == 13)
      {
        int v18 = @"read/write";
        if (v7) {
          int v18 = @"read";
        }
        v19 = (__CFString *)[NSString stringWithFormat:@"The index file could not be opened because %@ permission was denied.", v18];
      }
      else
      {
        v19 = @"The index file could not be opened. The file may be in use.";
      }
      uint64_t v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08438];
      uint64_t v25 = *__error();
      uint64_t v121 = *MEMORY[0x263F08320];
      v122[0] = v19;
      *a4 = (id)objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v122, &v121, 1));
    }
    __error();
    goto LABEL_27;
  }
  int v10 = v9;
  int v11 = fcntl(v9, 3);
  fcntl(v10, 4, v11 & 0xFFFFFFFB);
  fcntl(v10, 48, 1);
  if (fstat(v10, &v104) == -1)
  {
    if (a4)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F08438];
      uint64_t v22 = *__error();
      uint64_t v119 = *MEMORY[0x263F08320];
      v120 = @"Failed to stat index.";
      *a4 = (id)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
    }
    goto LABEL_109;
  }
  ssize_t v12 = read(v10, &self->_header, 0x14uLL);
  if (v12 <= 19)
  {
    ssize_t v13 = v12;
    close(v10);
    if (v13 != -1) {
      goto LABEL_8;
    }
    if (a4)
    {
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08438];
      uint64_t v29 = *__error();
      uint64_t v117 = *MEMORY[0x263F08320];
      v118 = @"Failed to read index.";
      *a4 = (id)objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v29, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1));
    }
    goto LABEL_109;
  }
  if (self->_header.fourcc != 1667851384) {
    goto LABEL_100;
  }
  if (self->_header.version)
  {
    close(v10);
    if (a4)
    {
      uint64_t v14 = *MEMORY[0x263F3F9C0];
      v15 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v16 = 11;
      goto LABEL_102;
    }
LABEL_28:
    LOBYTE(metadata) = 0;
    return (char)metadata;
  }
  unsigned int file_table_length = self->_header.file_table_length;
  if (file_table_length > self->_header.name_table_length) {
    goto LABEL_100;
  }
  uint64_t hash_table_length = self->_header.hash_table_length;
  if (file_table_length > hash_table_length || !hash_table_length) {
    goto LABEL_100;
  }
  int64_t v32 = 12 * hash_table_length;
  v33 = ($938B03310D06493B2963E5A84CB75A7E *)malloc_type_malloc(12 * hash_table_length, 0x24A97E3DuLL);
  self->_hash_table = v33;
  if (!v33) {
    goto LABEL_103;
  }
  ssize_t v34 = read(v10, v33, v32);
  if (v34 < v32)
  {
    ssize_t v35 = v34;
    close(v10);
    if (v35 == -1)
    {
      if (a4)
      {
        v36 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F08438];
        uint64_t v38 = *__error();
        uint64_t v115 = *MEMORY[0x263F08320];
        v116 = @"Failed to read index for hash table.";
        *a4 = (id)objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, v38, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1));
      }
LABEL_109:
      __error();
LABEL_27:
      DYLog();
      goto LABEL_28;
    }
    goto LABEL_8;
  }
  uint64_t v39 = self->_header.file_table_length;
  if (v39)
  {
    int64_t v40 = 24 * v39;
    v41 = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_malloc(24 * v39, 0xA9A54A9EuLL);
    self->_file_table = v41;
    if (!v41) {
      goto LABEL_103;
    }
    ssize_t v42 = read(v10, v41, v40);
    if (v42 < v40)
    {
      ssize_t v43 = v42;
      close(v10);
      if (v43 == -1)
      {
        if (a4)
        {
          v44 = (void *)MEMORY[0x263F087E8];
          uint64_t v45 = *MEMORY[0x263F08438];
          uint64_t v46 = *__error();
          uint64_t v113 = *MEMORY[0x263F08320];
          v114 = @"Failed to read index for file table.";
          *a4 = (id)objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, v46, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1));
        }
        goto LABEL_109;
      }
LABEL_8:
      if (a4)
      {
        uint64_t v14 = *MEMORY[0x263F3F9C0];
        v15 = (void *)MEMORY[0x263F3F9C8];
        uint64_t v16 = 9;
LABEL_102:
        v96 = (void *)[v15 errorWithDomain:v14 code:v16 userInfo:0];
        LOBYTE(metadata) = 0;
        *a4 = v96;
        return (char)metadata;
      }
      goto LABEL_28;
    }
    unsigned int file_table_capacity = self->_header.file_table_length;
    unsigned int name_table_length = self->_header.name_table_length;
    self->_unsigned int file_table_capacity = file_table_capacity;
    if (!name_table_length)
    {
      if (v7) {
        goto LABEL_91;
      }
LABEL_70:
      self->_name_table_capacity = file_table_capacity;
      size_t v60 = 2 * file_table_capacity;
      v61 = ($7E080378D8F67055EE0984892F39872B *)malloc_type_malloc(v60, 0xB021DF3DuLL);
      self->_name_table = v61;
      bzero(v61, v60);
      if (!self->_name_table) {
        goto LABEL_103;
      }
      if (self->_header.name_table_length) {
        goto LABEL_72;
      }
      goto LABEL_79;
    }
  }
  else if (v7)
  {
    unsigned int name_table_length = self->_header.name_table_length;
    if (!name_table_length) {
      goto LABEL_91;
    }
  }
  else
  {
    unsigned int v49 = self->_header.hash_table_length;
    if (v49 <= 3) {
      unsigned int v50 = 1;
    }
    else {
      unsigned int v50 = v49 >> 1;
    }
    self->_unsigned int file_table_capacity = v50;
    v51 = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_malloc(24 * v50, 0x733F178BuLL);
    self->_file_table = v51;
    if (!v51) {
      goto LABEL_103;
    }
    unsigned int name_table_length = self->_header.name_table_length;
    if (!name_table_length)
    {
      unsigned int file_table_capacity = self->_file_table_capacity;
      goto LABEL_70;
    }
  }
  int64_t v52 = 2 * name_table_length;
  v53 = ($7E080378D8F67055EE0984892F39872B *)malloc_type_malloc(v52, 0x58CC46D2uLL);
  self->_name_table = v53;
  if (!v53) {
    goto LABEL_103;
  }
  bzero(v53, v52);
  ssize_t v54 = read(v10, self->_name_table, v52);
  if (v54 < v52)
  {
    ssize_t v55 = v54;
    close(v10);
    if (v55 == -1)
    {
      if (a4)
      {
        v56 = (void *)MEMORY[0x263F087E8];
        uint64_t v57 = *MEMORY[0x263F08438];
        uint64_t v58 = *__error();
        uint64_t v111 = *MEMORY[0x263F08320];
        v112 = @"Failed to read index for name table.";
        *a4 = (id)objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, v58, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1));
      }
      goto LABEL_109;
    }
    goto LABEL_8;
  }
  unsigned int v59 = self->_header.name_table_length;
  self->_name_table_capacity = v59;
  if (v59)
  {
LABEL_72:
    off_t v62 = lseek(v10, 0, 1);
    if (v62 == -1)
    {
      if (a4)
      {
        v76 = (void *)MEMORY[0x263F087E8];
        uint64_t v77 = *MEMORY[0x263F08438];
        uint64_t v78 = *__error();
        uint64_t v109 = *MEMORY[0x263F08320];
        v110 = @"Failed to lseek for index.";
        *a4 = (id)objc_msgSend(v76, "errorWithDomain:code:userInfo:", v77, v78, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1));
      }
      __error();
      DYLog();
      close(v10);
      goto LABEL_28;
    }
    int64_t v63 = v104.st_size - v62;
    off_t v64 = (v104.st_size - v62 + *MEMORY[0x263EF8AF8]) & -*MEMORY[0x263EF8AF8];
    self->_string_table_capacity = v64;
    v65 = (char *)malloc_type_malloc(v64, 0x57BD109CuLL);
    self->_string_table_storage = v65;
    if (v65)
    {
      bzero(&v65[v63], self->_string_table_capacity - v63);
      ssize_t v66 = read(v10, self->_string_table_storage, v63);
      if (v66 < v63)
      {
        ssize_t v67 = v66;
        close(v10);
        if (v67 == -1)
        {
          if (a4)
          {
            v68 = (void *)MEMORY[0x263F087E8];
            uint64_t v69 = *MEMORY[0x263F08438];
            uint64_t v70 = *__error();
            uint64_t v107 = *MEMORY[0x263F08320];
            v108 = @"Failed to read index for string index.";
            *a4 = (id)objc_msgSend(v68, "errorWithDomain:code:userInfo:", v69, v70, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1));
          }
          goto LABEL_109;
        }
        goto LABEL_8;
      }
      size_t v79 = 8 * self->_name_table_capacity;
      v80 = (unint64_t *)malloc_type_malloc(v79, 0x471809AAuLL);
      self->_string_table_offsets = v80;
      if (v80)
      {
        unint64_t v75 = v63 + 1;
        bzero(v80, v79);
        goto LABEL_87;
      }
    }
    goto LABEL_103;
  }
  if (!v7)
  {
LABEL_79:
    unint64_t v71 = 4 * *MEMORY[0x263EF8AF8];
    self->_string_table_capacity = v71;
    v72 = malloc_type_malloc(v71, 0xD0D46F0BuLL);
    self->_string_table_storage = v72;
    if (v72)
    {
      bzero(v72, self->_string_table_capacity);
      size_t v73 = 8 * self->_name_table_capacity;
      v74 = (unint64_t *)malloc_type_malloc(v73, 0xBA3B9CD6uLL);
      self->_string_table_offsets = v74;
      if (v74)
      {
        bzero(v74, v73);
        unint64_t v75 = 0;
LABEL_87:
        uint64_t v81 = self->_header.name_table_length;
        if (v81 < 2) {
          goto LABEL_91;
        }
        string_table_offsets = self->_string_table_offsets;
        name_table = self->_name_table;
        unint64_t v86 = *string_table_offsets;
        v84 = string_table_offsets + 1;
        unint64_t v85 = v86;
        uint64_t v87 = v81 - 1;
        while (1)
        {
          unsigned int var0 = name_table->var0;
          ++name_table;
          v85 += var0;
          if (v85 > v75) {
            break;
          }
          *v84++ = v85;
          if (!--v87) {
            goto LABEL_91;
          }
        }
LABEL_100:
        close(v10);
        if (a4)
        {
          uint64_t v14 = *MEMORY[0x263F3F9C0];
          v15 = (void *)MEMORY[0x263F3F9C8];
          uint64_t v16 = 10;
          goto LABEL_102;
        }
        goto LABEL_28;
      }
    }
LABEL_103:
    close(v10);
    if (a4)
    {
      uint64_t v14 = *MEMORY[0x263F3F9C0];
      v15 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v16 = 4;
      goto LABEL_102;
    }
    goto LABEL_28;
  }
LABEL_91:
  close(v10);
  int v89 = open((const char *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", @"store0"), "fileSystemRepresentation"), v8);
  self->_backingStoreFD = v89;
  if (v89 == -1)
  {
    if (a4)
    {
      v99 = (void *)MEMORY[0x263F087E8];
      uint64_t v100 = *MEMORY[0x263F08438];
      uint64_t v101 = *__error();
      uint64_t v105 = *MEMORY[0x263F08320];
      v106 = @"Failed to open backing store.";
      *a4 = (id)objc_msgSend(v99, "errorWithDomain:code:userInfo:", v100, v101, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1));
    }
    goto LABEL_109;
  }
  int v90 = v89;
  int v91 = fcntl(v89, 3);
  fcntl(v90, 4, v91 & 0xFFFFFFFB);
  if (fstat(self->_backingStoreFD, &v103) == -1
    || (off_t st_size = v103.st_size,
        self->_backingStoreSize = v103.st_size,
        self->_backingStoreWritePosition = st_size,
        lseek(self->_backingStoreFD, st_size, 0) == -1))
  {
    if (a4)
    {
      v97 = (void *)MEMORY[0x263F087E8];
      uint64_t v98 = *MEMORY[0x263F08438];
      uint64_t v16 = *__error();
      v15 = v97;
      uint64_t v14 = v98;
      goto LABEL_102;
    }
    goto LABEL_28;
  }
  metadata = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithContentsOfFile:options:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", @"metadata"), 0, a4);
  if (metadata)
  {
    v93 = metadata;
    self->_metadata = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AC0], "propertyListWithData:options:format:error:", metadata, 0, 0, a4), "mutableCopy");

    metadata = self->_metadata;
    if (metadata)
    {
      CFStringRef v94 = (const __CFString *)[(NSMutableDictionary *)metadata objectForKey:@"(uuid)"];
      v95 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
      if (v94)
      {
        self->_uuid = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x263EFFB08], v94);
        [(NSMutableDictionary *)self->_metadata removeObjectForKey:@"(uuid)"];
      }
      if (self->_uuid)
      {
        LOBYTE(metadata) = 1;
      }
      else
      {
        self->_uuid = CFUUIDCreate(*v95);
        LOBYTE(metadata) = 1;
        if (!v7) {
          self->_modified = 1;
        }
      }
    }
  }
  return (char)metadata;
}

- (void)_swapHashTable
{
  uint64_t hash_table_length = self->_header.hash_table_length;
  if (hash_table_length)
  {
    p_var2 = &self->_hash_table->var2;
    do
    {
      *((int8x8_t *)p_var2 - 1) = vrev32_s8(*(int8x8_t *)(p_var2 - 2));
      unsigned int *p_var2 = bswap32(*p_var2);
      p_var2 += 3;
      --hash_table_length;
    }
    while (hash_table_length);
  }
}

- (void)_swapFileTable
{
  if (self->_header.file_table_length)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = &self->_file_table[v2];
      *(int8x8_t *)&v4->unsigned int var0 = vrev32_s8(*(int8x8_t *)&v4->var0);
      v4->var2 = bswap64(v4->var2);
      *(int8x8_t *)&v4->var3 = vrev32_s8(*(int8x8_t *)&v4->var3);
      ++v3;
      ++v2;
    }
    while (v3 < self->_header.file_table_length);
  }
}

- (void)_swapNameTable
{
  uint64_t name_table_length = self->_header.name_table_length;
  if (name_table_length)
  {
    name_table = self->_name_table;
    do
    {
      name_table->unsigned int var0 = bswap32(name_table->var0) >> 16;
      ++name_table;
      --name_table_length;
    }
    while (name_table_length);
  }
}

- (DYCaptureArchive)init
{
  return 0;
}

- (DYCaptureArchive)initWithURL:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  v45[1] = *MEMORY[0x263EF8340];
  self->_lock_readers = 0;
  self->_lock_global_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  self->_blocking_readers = 0;
  int v9 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(self)), self), "UTF8String"];
  self->_write_queue = (OS_dispatch_queue *)dispatch_queue_create(v9, 0);
  self->_add_group = (OS_dispatch_group *)dispatch_group_create();
  v39.receiver = self;
  v39.super_class = (Class)DYCaptureArchive;
  int v10 = [(DYCaptureArchive *)&v39 init];
  int v11 = v10;
  if (!v10) {
    return v11;
  }
  v10->_backingStoreFD = -1;
  v10->_options = a4;
  if ((a4 & 0xFFFFFFFFFFFFF5FCLL) != 0)
  {
    if (a5)
    {
      ssize_t v12 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v13 = *MEMORY[0x263F08438];
      uint64_t v44 = *MEMORY[0x263F08320];
      v45[0] = @"Received unexpected options.";
      uint64_t v14 = NSDictionary;
      v15 = (__CFString **)v45;
      uint64_t v16 = &v44;
LABEL_5:
      uint64_t v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
      int v18 = v12;
      uint64_t v19 = v13;
      uint64_t v20 = 22;
LABEL_30:
      *a5 = (id)[v18 errorWithDomain:v19 code:v20 userInfo:v17];
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  uint64_t v21 = objc_msgSend((id)objc_msgSend(a3, "URLByResolvingSymlinksInPath"), "path");
  if (!v21) {
    goto LABEL_27;
  }
  uint64_t v22 = v21;
  int v23 = DYFSDirectoryExists();
  char v24 = v23;
  if (v23)
  {
    if ((~a4 & 0xA00) == 0)
    {
      if (a5)
      {
        uint64_t v25 = (void *)MEMORY[0x263F3F9C8];
        uint64_t v26 = *MEMORY[0x263F08438];
        uint64_t v42 = *MEMORY[0x263F08320];
        ssize_t v43 = @"File already exists.";
        uint64_t v17 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        int v18 = v25;
        uint64_t v19 = v26;
        uint64_t v20 = 17;
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    if (![(DYCaptureArchive *)v11 _loadArchiveAtPath:v22 error:a5]) {
      goto LABEL_31;
    }
  }
  else
  {
    if ((a4 & 0x200) == 0)
    {
      if (!a5) {
        goto LABEL_31;
      }
      int v18 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v19 = *MEMORY[0x263F08438];
      uint64_t v20 = 2;
LABEL_29:
      uint64_t v17 = 0;
      goto LABEL_30;
    }
    if ((a4 & 3) == 0)
    {
      if (!a5) {
        goto LABEL_31;
      }
      ssize_t v12 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v13 = *MEMORY[0x263F08438];
      uint64_t v40 = *MEMORY[0x263F08320];
      v41 = @"File exists and is read only.";
      uint64_t v14 = NSDictionary;
      v15 = &v41;
      uint64_t v16 = &v40;
      goto LABEL_5;
    }
    if (![(DYCaptureArchive *)v11 _createNewArchiveAtPath:v22 error:a5])
    {
LABEL_31:

      return 0;
    }
  }
  v27 = (NSURL *)(id)objc_msgSend((id)objc_msgSend(NSURL, "fileURLWithPath:isDirectory:", v22, 1), "fileReferenceURL");
  v11->_url = v27;
  if (!v27)
  {
    uint64_t v28 = (NSURL *)(id)[NSURL fileURLWithPath:v22 isDirectory:1];
    v11->_url = v28;
    if (!v28)
    {
LABEL_27:
      if (!a5) {
        goto LABEL_31;
      }
      int v18 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v19 = *MEMORY[0x263F3F9C0];
      uint64_t v20 = 1;
      goto LABEL_29;
    }
  }
  size_t v29 = 8 * v11->_name_table_capacity;
  v30 = (id *)malloc_type_malloc(v29, 0x1C89C020uLL);
  v11->_string_table_nscache = v30;
  bzero(v30, v29);
  if (![(DYCaptureArchive *)v11 isReadOnly])
  {
    v31 = malloc_type_malloc(0x40000uLL, 0x8EAE2729uLL);
    v11->_store_write_buffer = v31;
    v11->_store_write_ptr = v31;
    v11->_aliasCreationMap = (NSMutableDictionary *)objc_opt_new();
  }
  uint64_t v32 = *MEMORY[0x263EF8AF8];
  v11->_read_buffer_capacity = 25 * *MEMORY[0x263EF8AF8];
  v11->_read_buffer = malloc_type_malloc(400 * v32, 0x786B05F4uLL);
  v11->_read_buffer_sem = (OS_dispatch_semaphore *)dispatch_semaphore_create(16);
  v11->_read_buffer_tokens_lock = 0;
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)&v11->_read_buffer_tokens, 0x10uLL);
  uint64_t v33 = 0;
  int32x4_t v34 = (int32x4_t)xmmword_24F644C00;
  begin = v11->_read_buffer_tokens.__begin_;
  v36.i64[0] = 0x400000004;
  v36.i64[1] = 0x400000004;
  do
  {
    *(int32x4_t *)&begin[v33] = v34;
    int32x4_t v34 = vaddq_s32(v34, v36);
    v33 += 4;
  }
  while (v33 != 16);
  if ((v24 & 1) == 0 && !-[DYCaptureArchive _performCommit:](v11, "_performCommit:", a5, *(double *)v34.i64)) {
    goto LABEL_31;
  }
  size_t v37 = compression_decode_scratch_buffer_size(COMPRESSION_ZLIB);
  v11->_scratchSize = v37;
  v11->_scratch = (char *)malloc_type_malloc(16 * v37, 0xF033740FuLL);
  [(DYCaptureArchive *)v11 initCache];
  return v11;
}

- (void)dealloc
{
  if (self->_modified)
  {
    uint64_t v21 = self;
    DYLog();
  }
  [(DYCaptureArchive *)self discardAndClose];
  write_queue = self->_write_queue;
  if (write_queue)
  {
    dispatch_release(write_queue);
    self->_write_queue = 0;
  }
  add_group = self->_add_group;
  if (add_group)
  {
    dispatch_release(add_group);
    self->_add_group = 0;
  }
  hash_table = self->_hash_table;
  if (hash_table) {
    free(hash_table);
  }
  file_table = self->_file_table;
  if (file_table) {
    free(file_table);
  }
  name_table = self->_name_table;
  if (name_table) {
    free(name_table);
  }
  begin = self->_cacheTable.__begin_;
  if (begin != self->_cacheTable.__end_)
  {
    if (self->_header.file_table_length)
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      int v11 = (vm_map_t *)MEMORY[0x263EF8960];
      do
      {
        ssize_t v12 = (char *)self->_cacheTable.__begin_ + v9;
        dispatch_release(*((dispatch_object_t *)v12 + 3));
        *((void *)v12 + 3) = 0;
        if (*(void *)v12)
        {
          mach_vm_deallocate(*v11, *(void *)v12, *((void *)v12 + 1));
          *(void *)ssize_t v12 = 0;
          *((void *)v12 + 1) = 0;
        }
        ++v10;
        v9 += 32;
      }
      while (v10 < self->_header.file_table_length);
      begin = self->_cacheTable.__begin_;
    }
    self->_cacheTable.__end_ = begin;
  }
  free(self->_scratch);
  self->_scratch = 0;
  string_table_storage = self->_string_table_storage;
  if (string_table_storage) {
    free(string_table_storage);
  }
  string_table_offsets = self->_string_table_offsets;
  if (string_table_offsets) {
    free(string_table_offsets);
  }
  string_table_nscache = self->_string_table_nscache;
  if (string_table_nscache) {
    free(string_table_nscache);
  }
  read_buffer = self->_read_buffer;
  if (read_buffer) {
    free(read_buffer);
  }
  store_write_buffer = self->_store_write_buffer;
  if (store_write_buffer) {
    free(store_write_buffer);
  }

  uuid = self->_uuid;
  if (uuid) {
    CFRelease(uuid);
  }
  lock_global_semaphore = self->_lock_global_semaphore;
  if (lock_global_semaphore)
  {
    dispatch_release(lock_global_semaphore);
    self->_lock_global_semaphore = 0;
  }
  read_buffer_sem = self->_read_buffer_sem;
  if (read_buffer_sem)
  {
    dispatch_release(read_buffer_sem);
    self->_read_buffer_sem = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)DYCaptureArchive;
  [(DYCaptureArchive *)&v22 dealloc];
}

- (void)setTargetQueue:(id)a3
{
}

- (NSURL)url
{
  uint64_t v2 = [(NSURL *)self->_url filePathURL];
  return v2;
}

- (NSString)path
{
  uint64_t v2 = [(NSURL *)self->_url filePathURL];
  return [(NSURL *)v2 path];
}

- (BOOL)isReadOnly
{
  return (self->_options & 3) == 0;
}

- (BOOL)isClosed
{
  return self->_backingStoreFD == -1;
}

- (int)_storeFileDescriptor
{
  return self->_backingStoreFD;
}

- ($55969086526AB00ED573B0A7B58FA2BF)_header
{
  return ($55969086526AB00ED573B0A7B58FA2BF *)&self->_header;
}

- ($938B03310D06493B2963E5A84CB75A7E)_hashTable
{
  return self->_hash_table;
}

- ($26580380F16D6530B01F933C495FCEE1)_fileTable
{
  return self->_file_table;
}

- ($7E080378D8F67055EE0984892F39872B)_nameTable
{
  return self->_name_table;
}

- (void)_stringTableStorage
{
  return self->_string_table_storage;
}

- (unint64_t)_stringTableOffsets
{
  return self->_string_table_offsets;
}

- (void)_fileObjectDidInitialize
{
  if (!atomic_fetch_add((atomic_uint *volatile)&self->_open_file_count, 1u)) {
    uint64_t v2 = self;
  }
}

- (void)_fileObjectDidDeallocate
{
  if (atomic_fetch_add((atomic_uint *volatile)&self->_open_file_count, 0xFFFFFFFF) == 1) {
}
  }

- (id)_getCFilename:(id)a3 outSize:(unint64_t *)a4 error:(id *)a5
{
  unint64_t v8 = [a3 lengthOfBytesUsingEncoding:1] + 1;
  uint64_t v9 = (void *)[MEMORY[0x263EFF990] dataWithLength:v8];
  if (objc_msgSend(a3, "getCString:maxLength:encoding:", objc_msgSend(v9, "mutableBytes"), v8, 1))
  {
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a5) {
      *a5 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:1 userInfo:0];
    }
  }
  return v9;
}

- (void)_growHashTable
{
  char v17 = 0;
  uint64_t hash_table_length = self->_header.hash_table_length;
  hash_table = self->_hash_table;
  v5 = ($938B03310D06493B2963E5A84CB75A7E *)malloc_type_malloc(12 * (2 * hash_table_length), 0x2817264AuLL);
  self->_hash_table = v5;
  self->_header.uint64_t hash_table_length = 2 * hash_table_length;
  int __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, 12 * (2 * hash_table_length));
  if (hash_table_length)
  {
    string_table_storage = (char *)self->_string_table_storage;
    uint64_t v7 = hash_table_length;
    unint64_t v8 = hash_table;
    do
    {
      if (v8->var2 == -1)
      {
        unsigned int v9 = [(DYCaptureArchive *)self _createNewHashEntry:&string_table_storage[self->_string_table_offsets[v8->var1]] didGrowTable:&v17];
        unint64_t v10 = &self->_hash_table[v9];
        unsigned int var2 = v8->var2;
        *(void *)&v10->unsigned int var0 = *(void *)&v8->var0;
        v10->unsigned int var2 = var2;
        v8->unsigned int var0 = v9;
      }
      ++v8;
      --v7;
    }
    while (v7);
    p_unsigned int var2 = &hash_table->var2;
    do
    {
      if (*p_var2 != -1)
      {
        unsigned int v13 = [(DYCaptureArchive *)self _createNewHashEntry:&string_table_storage[self->_string_table_offsets[*(p_var2 - 1)]] didGrowTable:&v17];
        uint64_t v14 = &self->_hash_table[v13];
        unsigned int v15 = *p_var2;
        *(void *)&v14->unsigned int var0 = *((void *)p_var2 - 1);
        v14->unsigned int var2 = v15;
        self->_hash_table[v13].unsigned int var2 = hash_table[*p_var2].var0;
      }
      p_var2 += 3;
      --hash_table_length;
    }
    while (hash_table_length);
  }
  free(hash_table);
}

- (unsigned)_createNewHashEntry:(const char *)a3 didGrowTable:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  unsigned int v7 = -1640531527;
  int v8 = *(unsigned __int8 *)a3;
  if (*a3)
  {
    unsigned int v9 = a3 + 2;
    while (1)
    {
      int v10 = *((unsigned __int8 *)v9 - 1);
      if (!*(v9 - 1)) {
        break;
      }
      unsigned int v11 = v7 + v8;
      int v12 = *(unsigned __int8 *)v9;
      v9 += 2;
      int v8 = v12;
      unsigned int v7 = ((v11 << 16) ^ (v10 << 11) ^ v11) + (((v11 << 16) ^ (v10 << 11) ^ v11) >> 11);
      if (!v12) {
        goto LABEL_9;
      }
    }
    unsigned int v7 = ((v7 + v8) ^ ((v7 + v8) << 11)) + (((v7 + v8) ^ ((v7 + v8) << 11)) >> 17);
  }
LABEL_9:
  unsigned int v13 = (v7 ^ (8 * v7)) + ((v7 ^ (8 * v7)) >> 5);
  unsigned int v14 = (v13 ^ (4 * v13)) + ((v13 ^ (4 * v13)) >> 15);
  unsigned int v15 = v14 ^ (v14 << 10);
  if (!v15) {
    unsigned int v15 = 0x40000000;
  }
  unsigned int hash_table_length = self->_header.hash_table_length;
  unsigned int v17 = v15 % hash_table_length;
  hash_table = self->_hash_table;
  if (hash_table[v17].var0 == -1) {
    return v17;
  }
  if (v17 + 1 == hash_table_length) {
    unsigned int result = 0;
  }
  else {
    unsigned int result = v17 + 1;
  }
  if (result == v17)
  {
LABEL_21:
    [(DYCaptureArchive *)self _growHashTable];
    if (a4) {
      *a4 = 1;
    }
    return [(DYCaptureArchive *)self _createNewHashEntry:a3 didGrowTable:0];
  }
  else
  {
    while (hash_table[result].var0 != -1)
    {
      if (result + 1 == hash_table_length) {
        unsigned int result = 0;
      }
      else {
        ++result;
      }
      if (result == v17) {
        goto LABEL_21;
      }
    }
  }
  return result;
}

- (unsigned)_createNewFileEntry
{
  unsigned int file_table_length = self->_header.file_table_length;
  if (file_table_length == self->_file_table_capacity)
  {
    self->_unsigned int file_table_capacity = 2 * file_table_length;
    self->_file_table = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_realloc(self->_file_table, 48 * file_table_length, 0x1000040504FFAC1uLL);
    unsigned int file_table_length = self->_header.file_table_length;
  }
  self->_header.unsigned int file_table_length = file_table_length + 1;
  [(DYCaptureArchive *)self resizeCache];
  return file_table_length;
}

- (unsigned)_createNewNameEntry
{
  uint64_t name_table_length = self->_header.name_table_length;
  if (name_table_length == self->_name_table_capacity)
  {
    self->_name_table_capacity = 2 * name_table_length;
    self->_name_table = ($7E080378D8F67055EE0984892F39872B *)malloc_type_realloc(self->_name_table, 2 * (2 * name_table_length), 0x1000040BDFB0063uLL);
    self->_string_table_offsets = (unint64_t *)malloc_type_realloc(self->_string_table_offsets, 8 * self->_name_table_capacity, 0x100004000313F17uLL);
    uint64_t v4 = (id *)malloc_type_realloc(self->_string_table_nscache, 8 * self->_name_table_capacity, 0x80040B8603338uLL);
    self->_string_table_nscache = v4;
    bzero(&v4[name_table_length], 8 * name_table_length);
    LODWORD(name_table_length) = self->_header.name_table_length;
  }
  self->_header.uint64_t name_table_length = name_table_length + 1;
  return name_table_length;
}

- (unint64_t)_reserveStringStorageSize:(unint64_t)a3
{
  unsigned int name_table_length = self->_header.name_table_length;
  if (name_table_length)
  {
    uint64_t v5 = name_table_length - 1;
    unint64_t string_table_capacity = self->_string_table_capacity;
    unint64_t v7 = self->_string_table_offsets[v5];
    uint64_t var0 = self->_name_table[v5].var0;
    if (v7 + a3 + var0 > string_table_capacity)
    {
      size_t v9 = ((a3 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8]) + string_table_capacity;
      int v10 = (char *)malloc_type_realloc(self->_string_table_storage, v9, 0x921731F9uLL);
      self->_string_table_storage = v10;
      bzero(&v10[self->_string_table_capacity], v9 - self->_string_table_capacity);
      self->_unint64_t string_table_capacity = v9;
      unint64_t v7 = self->_string_table_offsets[v5];
      uint64_t var0 = self->_name_table[v5].var0;
    }
    return v7 + var0;
  }
  else
  {
    unint64_t v12 = self->_string_table_capacity;
    if (v12 >= a3)
    {
      return 0;
    }
    else
    {
      size_t v13 = ((a3 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8]) + v12;
      unsigned int v14 = (char *)malloc_type_realloc(self->_string_table_storage, v13, 0x52000063uLL);
      self->_string_table_storage = v14;
      bzero(&v14[self->_string_table_capacity], v13 - self->_string_table_capacity);
      unint64_t result = 0;
      self->_unint64_t string_table_capacity = v13;
    }
  }
  return result;
}

- (unsigned)_findHashEntry:(const char *)a3
{
  int v3 = *(unsigned __int8 *)a3;
  if (*a3)
  {
    uint64_t v5 = a3 + 2;
    unsigned int v6 = -1640531527;
    while (1)
    {
      int v7 = *((unsigned __int8 *)v5 - 1);
      if (!*(v5 - 1)) {
        break;
      }
      unsigned int v8 = v6 + v3;
      int v9 = *(unsigned __int8 *)v5;
      v5 += 2;
      int v3 = v9;
      unsigned int v6 = ((v8 << 16) ^ (v7 << 11) ^ v8) + (((v8 << 16) ^ (v7 << 11) ^ v8) >> 11);
      if (!v9) {
        goto LABEL_7;
      }
    }
    unsigned int v6 = ((v6 + v3) ^ ((v6 + v3) << 11)) + (((v6 + v3) ^ ((v6 + v3) << 11)) >> 17);
LABEL_7:
    unsigned int v10 = (v6 ^ (8 * v6)) + ((v6 ^ (8 * v6)) >> 5);
    unsigned int v11 = (v10 ^ (4 * v10)) + ((v10 ^ (4 * v10)) >> 15);
    unsigned int v12 = v11 ^ (v11 << 10);
    if (!v12) {
      unsigned int v12 = 0x40000000;
    }
    unsigned int hash_table_length = self->_header.hash_table_length;
    unsigned int v14 = v12 % hash_table_length;
    hash_table = self->_hash_table;
    if (hash_table[v12 % hash_table_length].var0 != -1)
    {
      string_table_storage = (const char *)self->_string_table_storage;
      string_table_offsets = self->_string_table_offsets;
      if (!strcmp(a3, &string_table_storage[string_table_offsets[hash_table[v14].var1]])) {
        return v14;
      }
      if (v14 + 1 == hash_table_length) {
        unsigned int v18 = 0;
      }
      else {
        unsigned int v18 = v14 + 1;
      }
      while (v18 != v14)
      {
        if (hash_table[v18].var0 == -1) {
          break;
        }
        if (!strcmp(a3, &string_table_storage[string_table_offsets[hash_table[v18].var1]])) {
          return v18;
        }
        if (v18 + 1 == hash_table_length) {
          unsigned int v18 = 0;
        }
        else {
          ++v18;
        }
      }
    }
  }
  return -1;
}

- (void)_performEmptyStringTableNSCache
{
  if (self->_string_table_nscache)
  {
    uint64_t name_table_length = self->_header.name_table_length;
    if (name_table_length)
    {
      unint64_t v4 = 0;
      uint64_t v5 = 8 * name_table_length;
      do
      {

        self->_string_table_nscache[v4 / 8] = 0;
        v4 += 8;
      }
      while (v5 != v4);
    }
  }
}

- (void)_fillStringTableNSCacheForRange:(_NSRange)a3
{
  int length = a3.length;
  if (LODWORD(a3.location) < LODWORD(a3.location) + LODWORD(a3.length))
  {
    string_table_storage = (char *)self->_string_table_storage;
    uint64_t location_low = LODWORD(a3.location);
    do
    {
      if (!self->_string_table_nscache[location_low])
      {
        int v7 = &string_table_storage[self->_string_table_offsets[location_low]];
        BOOL v8 = [(DYCaptureArchive *)self isReadOnly];
        id v9 = [NSString alloc];
        uint64_t v10 = self->_name_table[location_low].var0 - 1;
        if (v8) {
          unsigned int v11 = (void *)[v9 initWithBytesNoCopy:v7 length:v10 encoding:1 freeWhenDone:0];
        }
        else {
          unsigned int v11 = (void *)[v9 initWithBytes:v7 length:v10 encoding:1];
        }
        self->_string_table_nscache[location_low] = v11;
      }
      ++location_low;
      --length;
    }
    while (length);
  }
}

- (unint64_t)countOfFilenames
{
  return self->_header.name_table_length;
}

- (id)objectInFilenamesAtIndex:(unint64_t)a3
{
  return self->_string_table_nscache[a3];
}

- (id)filenamesAtIndexes:(id)a3
{
  v12[50] = *MEMORY[0x263EF8340];
  v11[0] = 0;
  v11[1] = [(DYCaptureArchive *)self countOfFilenames];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  do
  {
    unint64_t v6 = [a3 getIndexes:v12 maxCount:50 inIndexRange:v11];
    -[DYCaptureArchive _fillStringTableNSCacheForRange:](self, "_fillStringTableNSCacheForRange:");
    if (!v6) {
      break;
    }
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      [v5 addObject:self->_string_table_nscache[v12[v7]]];
      uint64_t v7 = v8;
    }
    while (v6 > v8++);
  }
  while (v6 >= 0x32);
  return v5;
}

- (void)getFilenames:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[DYCaptureArchive _fillStringTableNSCacheForRange:](self, "_fillStringTableNSCacheForRange:", a4.location, a4.length);
  unsigned int v8 = &self->_string_table_nscache[location];
  memmove(a3, v8, 8 * length);
}

- (vector<unsigned)getSortedFilePositionsForDataCaching
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  std::vector<unsigned long long>::reserve((void **)&retstr->__begin_, self->_header.file_table_length);
  if (self->_header.file_table_length)
  {
    unsigned int v5 = 0;
    p_end_cap = &retstr->__end_cap_;
    end = retstr->__end_;
    do
    {
      if (end >= p_end_cap->__value_)
      {
        begin = retstr->__begin_;
        uint64_t v10 = end - retstr->__begin_;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = (char *)p_end_cap->__value_ - (char *)begin;
        if (v12 >> 2 > v11) {
          unint64_t v11 = v12 >> 2;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v11;
        }
        if (v13)
        {
          unsigned int v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&retstr->__end_cap_, v13);
          begin = retstr->__begin_;
          end = retstr->__end_;
        }
        else
        {
          unsigned int v14 = 0;
        }
        unsigned int v15 = (unint64_t *)&v14[8 * v10];
        unint64_t *v15 = v5;
        unsigned int v8 = v15 + 1;
        while (end != begin)
        {
          unint64_t v16 = *--end;
          *--unsigned int v15 = v16;
        }
        retstr->__begin_ = v15;
        retstr->__end_ = v8;
        retstr->__end_cap_.__value_ = (unint64_t *)&v14[8 * v13];
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        unint64_t *end = v5;
        unsigned int v8 = end + 1;
      }
      retstr->__end_ = v8;
      ++v5;
      end = v8;
    }
    while (v5 != self->_header.file_table_length);
  }
  else
  {
    unsigned int v8 = retstr->__end_;
  }
  unsigned int v17 = retstr->__begin_;
  unint64_t v18 = 126 - 2 * __clz(v8 - retstr->__begin_);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__DYCaptureArchive_getSortedFilePositionsForDataCaching__block_invoke;
  v21[3] = &unk_2653336E0;
  v21[4] = self;
  objc_super v22 = v21;
  if (v8 == v17) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v18;
  }
  return (vector<unsigned long long, std::allocator<unsigned long long>> *)std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *,false>((uint64_t)v17, (uint64_t *)v8, (uint64_t)&v22, v19, 1);
}

BOOL __56__DYCaptureArchive_getSortedFilePositionsForDataCaching__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64);
  unsigned int v4 = *(_DWORD *)(v3 + 24 * a2 + 20);
  unsigned int v5 = *(_DWORD *)(v3 + 24 * a3 + 20);
  BOOL v6 = v4 > v5;
  if (v4 == v5) {
    return *(_DWORD *)(v3 + 24 * a2) > *(_DWORD *)(v3 + 24 * a3);
  }
  return v6;
}

- (id)filenamesWithPrefix:(id)a3 error:(id *)a4
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v22, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  lock_global_semaphore = 0;
  unsigned int v8 = (unsigned char *)objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a3, &lock_global_semaphore, a4), "bytes");
  if (v8)
  {
    lock_global_semaphore = (OS_dispatch_semaphore *)((char *)lock_global_semaphore - 1);
    string_table_storage = (char *)self->_string_table_storage;
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t name_table_length = self->_header.name_table_length;
    if (name_table_length)
    {
      for (uint64_t i = 0; i != name_table_length; ++i)
      {
        unint64_t v13 = &string_table_storage[self->_string_table_offsets[i]];
        int v14 = *v8;
        BOOL v15 = *v8 != 0;
        int v16 = *v13;
        if (*v13) {
          BOOL v17 = v14 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
LABEL_15:
          if (v16) {
            goto LABEL_19;
          }
        }
        else
        {
          unsigned int v18 = 1;
          while (v16 == v14)
          {
            int v14 = v8[v18];
            BOOL v15 = v8[v18] != 0;
            int v16 = v13[v18++];
            if (v16) {
              BOOL v19 = v14 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19) {
              goto LABEL_15;
            }
          }
          BOOL v15 = 1;
        }
        if (!v15) {
LABEL_19:
        }
          objc_msgSend(v10, "addObject:", -[DYCaptureArchive objectInFilenamesAtIndex:](self, "objectInFilenamesAtIndex:", i));
      }
    }
    id v20 = v10;
  }
  else
  {
    id v20 = 0;
  }
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v22, v7);
  return v20;
}

- (id)filenamesWithPredicate:(id)a3 error:(id *)a4
{
  -[DYCaptureArchive _fillStringTableNSCacheForRange:](self, "_fillStringTableNSCacheForRange:", 0, self->_header.name_table_length);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t name_table_length = self->_header.name_table_length;
  if (name_table_length)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 8 * name_table_length;
    do
    {
      id v10 = self->_string_table_nscache[v8 / 8];
      if ([a3 evaluateWithObject:v10]) {
        [v6 addObject:v10];
      }
      v8 += 8;
    }
    while (v9 != v8);
  }
  return v6;
}

- (id)_resolveCFilename:(const char *)a3 error:(id *)a4
{
  unsigned int v7 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:");
  if (v7 == -1)
  {
    if (a4) {
      *a4 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:0];
    }
    return 0;
  }
  else
  {
    hash_table = self->_hash_table;
    unsigned int var2 = hash_table[v7].var2;
    if (var2 == -1)
    {
      uint64_t v12 = NSString;
      return (id)[v12 stringWithCString:a3 encoding:1];
    }
    else
    {
      uint64_t var1 = hash_table[var2].var1;
      return [(DYCaptureArchive *)self objectInFilenamesAtIndex:var1];
    }
  }
}

- (id)resolveFilename:(id)a3 error:(id *)a4
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v12, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (![a3 length])
  {
    if (a4)
    {
      uint64_t v8 = 1;
      goto LABEL_7;
    }
LABEL_10:
    id v9 = 0;
    goto LABEL_11;
  }
  if (![(DYCaptureArchive *)self isClosed])
  {
    uint64_t v10 = objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a3, 0, a4), "bytes");
    if (v10)
    {
      id v9 = [(DYCaptureArchive *)self _resolveCFilename:v10 error:a4];
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_10;
  }
  uint64_t v8 = 20;
LABEL_7:
  id v9 = 0;
  *a4 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:v8 userInfo:0];
LABEL_11:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v12, v7);
  return v9;
}

- (BOOL)_writeMetadataInPath:(id)a3 error:(id *)a4
{
  CFStringRef v7 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x263EFFB08], self->_uuid);
  if (v7)
  {
    CFStringRef v8 = v7;
    [(NSMutableDictionary *)self->_metadata setObject:v7 forKey:@"(uuid)"];
    CFRelease(v8);
  }
  id v9 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:self->_metadata format:200 options:0 error:a4];
  [(NSMutableDictionary *)self->_metadata removeObjectForKey:@"(uuid)"];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = [a3 stringByAppendingPathComponent:@"metadata"];
  return [v9 writeToFile:v10 options:1 error:a4];
}

- (BOOL)_writeIndexInPath:(id)a3 error:(id *)a4
{
  CFStringRef v7 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", @".index"), "fileSystemRepresentation");
  int v8 = open((const char *)v7, 1570, 420);
  if (v8 == -1) {
    goto LABEL_39;
  }
  int v9 = v8;
  uint64_t hash_table_length = self->_header.hash_table_length;
  uint64_t v11 = 12 * hash_table_length;
  uint64_t v12 = 24 * self->_header.file_table_length;
  uint64_t name_table_length = self->_header.name_table_length;
  uint64_t v14 = 2 * name_table_length;
  unsigned int v33 = self->_header.name_table_length;
  unsigned int file_table_length = self->_header.file_table_length;
  int64_t v15 = name_table_length
      ? self->_string_table_offsets[(name_table_length - 1)]
      + self->_name_table[(name_table_length - 1)].var0
      : 0;
  if (ftruncate(v8, v11 + v12 + v14 + v15 + 20) == -1)
  {
LABEL_39:
    if (!a4) {
      return 0;
    }
LABEL_40:
    v31 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    BOOL result = 0;
    *a4 = v31;
    return result;
  }
  uint64_t v32 = a4;
  uint64_t v16 = 0;
  do
  {
    ssize_t v17 = write(v9, (char *)&self->_header + v16, 20 - v16);
    if (v17 == -1)
    {
      if (*__error() != 4)
      {
LABEL_38:
        a4 = v32;
        goto LABEL_39;
      }
    }
    else
    {
      v16 += v17;
    }
  }
  while (v16 < 20);
  if (hash_table_length)
  {
    uint64_t v18 = 0;
    do
    {
      ssize_t v19 = write(v9, (char *)self->_hash_table + v18, v11 - v18);
      if (v19 == -1)
      {
        if (*__error() != 4) {
          goto LABEL_38;
        }
      }
      else
      {
        v18 += v19;
      }
    }
    while (v18 < v11);
  }
  if (file_table_length)
  {
    uint64_t v20 = 0;
    do
    {
      ssize_t v21 = write(v9, (char *)self->_file_table + v20, v12 - v20);
      if (v21 == -1)
      {
        if (*__error() != 4) {
          goto LABEL_38;
        }
      }
      else
      {
        v20 += v21;
      }
    }
    while (v20 < v12);
  }
  if (v33)
  {
    uint64_t v22 = 0;
    do
    {
      ssize_t v23 = write(v9, (char *)self->_name_table + v22, v14 - v22);
      if (v23 == -1)
      {
        if (*__error() != 4) {
          goto LABEL_38;
        }
      }
      else
      {
        v22 += v23;
      }
    }
    while (v22 < v14);
  }
  if (v15 >= 1)
  {
    int64_t v24 = 0;
    do
    {
      ssize_t v25 = write(v9, (char *)self->_string_table_storage + v24, v15 - v24);
      if (v25 == -1)
      {
        if (*__error() != 4) {
          goto LABEL_38;
        }
      }
      else
      {
        v24 += v25;
      }
    }
    while (v24 < v15);
  }
  fcntl(self->_backingStoreFD, 51);
  close(v9);
  uint64_t v26 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", @"index"), "fileSystemRepresentation");
  rename(v7, v26, v27);
  BOOL v29 = v28 == -1;
  BOOL result = v28 != -1;
  a4 = v32;
  if (v32 && v29) {
    goto LABEL_40;
  }
  return result;
}

- (BOOL)_performCommit:(id *)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  if (!self->_modified) {
    goto LABEL_17;
  }
  if ([(DYCaptureArchive *)self isReadOnly])
  {
    if (a3)
    {
      uint64_t v5 = *MEMORY[0x263F3F9C0];
      id v6 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v7 = 7;
LABEL_5:
      uint64_t v8 = 0;
LABEL_6:
      int v9 = (void *)[v6 errorWithDomain:v5 code:v7 userInfo:v8];
      LOBYTE(v10) = 0;
      *a3 = v9;
      return v10;
    }
    goto LABEL_22;
  }
  uint64_t v11 = [(DYCaptureArchive *)self path];
  if (self->_store_write_ptr != self->_store_write_buffer)
  {
    if (-[DYCaptureArchive _writeBufferToBackingStore:size:error:](self, "_writeBufferToBackingStore:size:error:") == -1) {
      goto LABEL_22;
    }
    self->_store_write_ptr = self->_store_write_buffer;
  }
  fcntl(self->_backingStoreFD, 51);
  off_t backingStoreWritePosition = self->_backingStoreWritePosition;
  if (self->_backingStoreSize > backingStoreWritePosition)
  {
    if (ftruncate(self->_backingStoreFD, backingStoreWritePosition) == -1)
    {
      if (a3)
      {
        int64_t v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = *MEMORY[0x263F08438];
        uint64_t v7 = *__error();
        id v6 = v15;
        uint64_t v5 = v16;
        goto LABEL_5;
      }
LABEL_22:
      LOBYTE(v10) = 0;
      return v10;
    }
    self->_backingStoreSize = self->_backingStoreWritePosition;
  }
  if (!v11)
  {
    if (a3)
    {
      unint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F3F9C0];
      uint64_t v18 = *MEMORY[0x263F08320];
      v19[0] = @"Capture archive path is nil";
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v6 = v13;
      uint64_t v5 = v14;
      uint64_t v7 = 14;
      goto LABEL_6;
    }
    goto LABEL_22;
  }
  BOOL v10 = [(DYCaptureArchive *)self _writeMetadataInPath:v11 error:a3];
  if (v10)
  {
    BOOL v10 = [(DYCaptureArchive *)self _writeIndexInPath:v11 error:a3];
    if (v10)
    {
      self->_modified = 0;
LABEL_17:
      LOBYTE(v10) = 1;
    }
  }
  return v10;
}

- (BOOL)commit:(id *)a3
{
  if (self->_backingStoreFD == -1)
  {
    BOOL v9 = 0;
    if (a3) {
      *a3 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:20 userInfo:0];
    }
  }
  else
  {
    uint64_t v24 = 0;
    ssize_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v18 = 0;
    ssize_t v19 = &v18;
    uint64_t v20 = 0x3052000000;
    ssize_t v21 = __Block_byref_object_copy_;
    uint64_t v22 = __Block_byref_object_dispose_;
    uint64_t v23 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = &v12;
    uint64_t v14 = 0x3052000000;
    int64_t v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v17 = 0;
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    write_queue = self->_write_queue;
    add_group = self->_add_group;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __27__DYCaptureArchive_commit___block_invoke;
    v11[3] = &unk_265333708;
    v11[4] = self;
    v11[5] = &v24;
    v11[6] = &v18;
    v11[7] = &v12;
    dispatch_group_notify(add_group, write_queue, v11);
    dispatch_semaphore_wait((dispatch_semaphore_t)v13[5], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release((dispatch_object_t)v13[5]);
    uint64_t v7 = v19;
    if (a3) {
      *a3 = (id)v19[5];
    }
    id v8 = (id)v7[5];
    BOOL v9 = *((unsigned char *)v25 + 24) != 0;
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  return v9;
}

intptr_t __27__DYCaptureArchive_commit___block_invoke(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performCommit:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)commitForExport:(id *)a3 progressHandler:(id)a4
{
  unsigned int v4 = self;
  LODWORD(hash_table_length) = self->_header.hash_table_length;
  if (hash_table_length)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      if (a4) {
        self = (DYCaptureArchive *)(*((uint64_t (**)(id, SEL, float))a4 + 2))(a4, a2, (float)(v8 + 1) / (float)hash_table_length);
      }
      BOOL v9 = &v4->_hash_table[v7];
      unsigned int var0 = v9->var0;
      if (v9->var0 != -1)
      {
        file_table = v4->_file_table;
        uint64_t v12 = &file_table[var0];
        unsigned int var3 = v12->var3;
        p_unsigned int var3 = &v12->var3;
        unsigned int v14 = var3;
        if ((var3 & 2) != 0)
        {
          unsigned int *p_var3 = v14 & 0xFFFFFFFC | 1;
          uint64_t v16 = (char *)v4->_string_table_storage + v4->_string_table_offsets[file_table[var0].var1.var0];
          dispatch_semaphore_t v17 = (void *)MEMORY[0x2533604C0](self, a2);
          uint64_t v18 = [NSString stringWithUTF8String:v16];
          ssize_t v19 = [(NSURL *)v4->_url URLByAppendingPathComponent:v18];
          memset(&v28, 0, sizeof(v28));
          uint64_t v20 = [(NSURL *)v19 fileSystemRepresentation];
          memset(&v29, 0, sizeof(v29));
          if (lstat(v20, &v29)
            || (v29.st_mode & 0xF000) != 0xA000
            || ((std::string::resize(&v28, v29.st_size, 0),
                 (v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              ? (ssize_t v21 = &v28)
              : (ssize_t v21 = (std::string *)v28.__r_.__value_.__r.__words[0]),
                readlink(v20, (char *)v21, v29.st_size + 1) < 0))
          {
            uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v19];
            dispatch_group_enter((dispatch_group_t)v4->_add_group);
            global_queue = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke;
            block[3] = &unk_265333758;
            block[4] = v23;
            void block[5] = v4;
            block[8] = a3;
            block[9] = v9;
            block[6] = v18;
            block[7] = v19;
            dispatch_async(global_queue, block);
          }
          else
          {
            if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              uint64_t v22 = &v28;
            }
            else {
              uint64_t v22 = (std::string *)v28.__r_.__value_.__r.__words[0];
            }
            v9->unsigned int var0 = v4->_hash_table[[(DYCaptureArchive *)v4 _findHashEntry:v22]].var0;
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v19, 0);
          }
          if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v28.__r_.__value_.__l.__data_);
          }
        }
      }
      ++v8;
      unint64_t hash_table_length = v4->_header.hash_table_length;
      ++v7;
    }
    while (v8 < hash_table_length);
  }
  return -[DYCaptureArchive commit:](v4, "commit:", a3, a4);
}

void __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8F8], "dy_dataByCompressingData:error:", *(void *)(a1 + 32), *(void *)(a1 + 64));
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke_2;
    block[3] = &unk_265333730;
    uint64_t v3 = *(void *)(a1 + 72);
    long long v7 = *(_OWORD *)(a1 + 40);
    unsigned int v4 = *(NSObject **)(v7 + 208);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v8 = v2;
    uint64_t v9 = v5;
    uint64_t v10 = v3;
    dispatch_async(v4, block);
  }
}

intptr_t __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke_2(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = 0;
  if (([*(id *)(a1 + 32) _performFinalizeAddFileAtPosition:**(unsigned int **)(a1 + 64) name:*(void *)(a1 + 40) data:*(void *)(a1 + 48) error:&v6] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = v6;
    _DYOLog();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager", v3, v4), "removeItemAtURL:error:", *(void *)(a1 + 56), 0);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 216));
  return dispatch_semaphore_signal(dsema);
}

- (void)discardAndClose
{
  if (self->_backingStoreFD != -1)
  {
    write_queue = self->_write_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__DYCaptureArchive_discardAndClose__block_invoke;
    block[3] = &unk_265333698;
    void block[4] = self;
    dispatch_sync(write_queue, block);
  }
}

intptr_t __35__DYCaptureArchive_discardAndClose__block_invoke(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  close(*(_DWORD *)(*(void *)(a1 + 32) + 264));
  *(_DWORD *)(*(void *)(a1 + 32) + 264) = -1;
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[273])
  {
    [(id)objc_opt_new() removeItemAtURL:*(void *)(*(void *)(a1 + 32) + 8) error:0];
    uint64_t v2 = *(unsigned char **)(a1 + 32);
  }
  [v2 _performEmptyStringTableNSCache];

  *(void *)(*(void *)(a1 + 32) + 144) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0;
  *(_DWORD *)(v3 + 48) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 272) = 0;
  return dispatch_semaphore_signal(dsema);
}

- (void)close
{
  if (self->_modified) {
    _DYOLog();
  }
  [(DYCaptureArchive *)self discardAndClose];
}

- (int64_t)_writeBufferToBackingStore:(const void *)a3 size:(int64_t)a4 error:(id *)a5
{
  int64_t backingStoreSize = self->_backingStoreSize;
  int64_t v10 = self->_backingStoreWritePosition + a4;
  if (v10 > backingStoreSize)
  {
    off_t v11 = backingStoreSize + 40960;
    int64_t v12 = (v10 & 0xFFFFFFFFFFFFF000) + 4096;
    if (v11 <= v12) {
      off_t v13 = v12;
    }
    else {
      off_t v13 = v11;
    }
    if (ftruncate(self->_backingStoreFD, v13) == -1)
    {
LABEL_16:
      if (a5) {
        *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      }
      return -1;
    }
    self->_int64_t backingStoreSize = v13;
  }
  if (a4 < 1)
  {
    int64_t v14 = 0;
  }
  else
  {
    int64_t v14 = 0;
    do
    {
      ssize_t v15 = pwrite(self->_backingStoreFD, (char *)a3 + v14, a4 - v14, self->_backingStoreWritePosition);
      if (v15 == -1)
      {
        if (*__error() != 4) {
          goto LABEL_16;
        }
      }
      else
      {
        v14 += v15;
      }
    }
    while (v14 < a4);
  }
  self->_backingStoreWritePosition += v14;
  return v14;
}

- (BOOL)_flushWriteBuffer:(id *)a3
{
  int64_t v4 = [(DYCaptureArchive *)self _writeBufferToBackingStore:self->_store_write_buffer size:(char *)self->_store_write_ptr - (char *)self->_store_write_buffer error:a3];
  if (v4 != -1) {
    self->_store_write_ptr = self->_store_write_buffer;
  }
  return v4 != -1;
}

- (BOOL)_performAddAlias:(id)a3 targetting:(id)a4 error:(id *)a5
{
  uint64_t v26 = 0;
  uint64_t v9 = [-[DYCaptureArchive _getCFilename:outSize:error:](self _getCFilename:a4 outSize:&v26) error:"bytes"];
  if (v9)
  {
    uint64_t v10 = v9;
    unsigned int var2 = [(DYCaptureArchive *)self _findHashEntry:v9];
    if (var2 == -1)
    {
      uint64_t v20 = (void *)[(NSMutableDictionary *)self->_aliasCreationMap objectForKey:a4];
      if (!v20)
      {
        uint64_t v20 = objc_opt_new();
        [(NSMutableDictionary *)self->_aliasCreationMap setObject:v20 forKey:a4];
      }
      [v20 addObject:a3];
      LOBYTE(v9) = 1;
    }
    else
    {
      do
      {
        unsigned int v12 = var2;
        unsigned int var2 = self->_hash_table[var2].var2;
      }
      while (var2 != -1);
      uint64_t v13 = [a3 lengthOfBytesUsingEncoding:1] + 1;
      unint64_t v14 = [(DYCaptureArchive *)self _reserveStringStorageSize:v13];
      ssize_t v15 = (char *)self->_string_table_storage + v14;
      if ([a3 getCString:v15 maxLength:v13 encoding:1])
      {
        if ([(DYCaptureArchive *)self _findHashEntry:v15] == -1)
        {
          char v25 = 0;
          unsigned int v16 = [(DYCaptureArchive *)self _createNewHashEntry:v15 didGrowTable:&v25];
          if (v25)
          {
            unsigned int v17 = [(DYCaptureArchive *)self _findHashEntry:v10];
            hash_table = self->_hash_table;
            do
            {
              unsigned int v12 = v17;
              unsigned int v17 = hash_table[v17].var2;
            }
            while (v17 != -1);
            unsigned int v19 = v12;
          }
          else
          {
            unsigned int v19 = v12;
            hash_table = self->_hash_table;
          }
          uint64_t v22 = &hash_table[v16];
          v22->unsigned int var0 = hash_table[v19].var0;
          unsigned int v23 = [(DYCaptureArchive *)self _createNewNameEntry];
          self->_name_table[v23].unsigned int var0 = v13;
          v22->uint64_t var1 = v23;
          v22->unsigned int var2 = v12;
          self->_string_table_offsets[v23] = v14;
        }
        LOBYTE(v9) = 1;
        self->_modified = 1;
      }
      else if (a5)
      {
        ssize_t v21 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:1 userInfo:0];
        LOBYTE(v9) = 0;
        *a5 = v21;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (BOOL)addAlias:(id)a3 forName:(id)a4 options:(id)a5 error:(id *)a6 waitUntilDone:(BOOL)a7
{
  BOOL v7 = a7;
  if (![a4 length] || !objc_msgSend(a3, "length"))
  {
    if (a6)
    {
      uint64_t v12 = *MEMORY[0x263F3F9C0];
      uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v14 = 1;
      goto LABEL_8;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isReadOnly])
  {
    if (a6)
    {
      uint64_t v12 = *MEMORY[0x263F3F9C0];
      uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v14 = 7;
LABEL_8:
      BOOL v15 = 0;
      *a6 = (id)[v13 errorWithDomain:v12 code:v14 userInfo:0];
      return v15;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isClosed])
  {
    if (a6)
    {
      uint64_t v12 = *MEMORY[0x263F3F9C0];
      uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v14 = 20;
      goto LABEL_8;
    }
    return 0;
  }
  if (v7)
  {
    uint64_t v22 = 0;
    unsigned int v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    dispatch_group_enter((dispatch_group_t)self->_add_group);
    write_queue = self->_write_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke;
    block[3] = &unk_265333780;
    void block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    block[7] = &v22;
    block[8] = a6;
    dispatch_sync(write_queue, block);
    dispatch_group_leave((dispatch_group_t)self->_add_group);
    BOOL v15 = *((unsigned char *)v23 + 24) != 0;
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    unsigned int v19 = self->_write_queue;
    add_group = self->_add_group;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke_2;
    v20[3] = &unk_2653337A8;
    v20[4] = self;
    v20[5] = a3;
    v20[6] = a4;
    dispatch_group_async(add_group, v19, v20);
    return 1;
  }
  return v15;
}

intptr_t __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _performAddAlias:*(void *)(a1 + 40) targetting:*(void *)(a1 + 48) error:*(void *)(a1 + 64)];
  return dispatch_semaphore_signal(dsema);
}

intptr_t __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke_2(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v4 = 0;
  if (([*(id *)(a1 + 32) _performAddAlias:*(void *)(a1 + 40) targetting:*(void *)(a1 + 48) error:&v4] & 1) == 0)_DYOLog(); {
  return dispatch_semaphore_signal(dsema);
  }
}

- (BOOL)addAlias:(id)a3 forName:(id)a4 options:(id)a5 error:(id *)a6
{
  return [(DYCaptureArchive *)self addAlias:a3 forName:a4 options:a5 error:a6 waitUntilDone:1];
}

- (unsigned)_performAddFileWithName:(id)a3 dataSize:(unsigned int)a4 error:(id *)a5
{
  return [(DYCaptureArchive *)self _performAddFileWithName:a3 dataSize:*(void *)&a4 withFlags:0 error:a5];
}

- (unsigned)_performAddFileWithName:(id)a3 dataSize:(unsigned int)a4 withFlags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v11 = [a3 lengthOfBytesUsingEncoding:1] + 1;
  unint64_t v12 = [(DYCaptureArchive *)self _reserveStringStorageSize:v11];
  uint64_t v13 = (char *)self->_string_table_storage + v12;
  if (([a3 getCString:v13 maxLength:v11 encoding:1] & 1) == 0)
  {
    if (a6)
    {
      uint64_t v14 = *MEMORY[0x263F3F9C0];
      BOOL v15 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v16 = 1;
      goto LABEL_7;
    }
    return -1;
  }
  if ([(DYCaptureArchive *)self _findHashEntry:v13] != -1)
  {
    if (a6)
    {
      uint64_t v14 = *MEMORY[0x263F3F9C0];
      BOOL v15 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v16 = 12;
LABEL_7:
      *a6 = (id)[v15 errorWithDomain:v14 code:v16 userInfo:0];
      return -1;
    }
    return -1;
  }
  uint64_t v18 = &self->_hash_table[[(DYCaptureArchive *)self _createNewHashEntry:v13 didGrowTable:0]];
  v18->unsigned int var0 = [(DYCaptureArchive *)self _createNewFileEntry];
  unsigned int v19 = [(DYCaptureArchive *)self _createNewNameEntry];
  file_table = self->_file_table;
  self->_name_table[v19].unsigned int var0 = v11;
  v18->uint64_t var1 = v19;
  v18->unsigned int var2 = -1;
  self->_string_table_offsets[v19] = v12;
  unsigned int result = v18->var0;
  ssize_t v21 = &file_table[v18->var0];
  v21->unsigned int var0 = a4;
  *(void *)&v21->unsigned int var3 = a5 | 1;
  if ((a5 & 2) != 0)
  {
    file_table[result].var1.unsigned int var0 = v19;
    return v18->var0;
  }
  return result;
}

- (BOOL)_performFinalizeAddFileAtPosition:(unsigned int)a3 name:(id)a4 data:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  file_table = self->_file_table;
  unsigned int v12 = [a5 length];
  uint64_t v13 = &file_table[a3];
  v13->var1.unsigned int var0 = v12;
  v13->unsigned int var2 = (char *)self->_store_write_ptr + self->_backingStoreWritePosition - (char *)self->_store_write_buffer;
  if (![a5 length]) {
    goto LABEL_23;
  }
  uint64_t v14 = (char *)[a5 bytes];
  size_t v15 = [a5 length];
  store_write_ptr = self->_store_write_ptr;
  unsigned int v17 = (char *)((char *)self->_store_write_buffer - (char *)store_write_ptr);
  uint64_t v18 = v17 + 0x40000;
  size_t v19 = v15 - (void)(v17 + 0x40000);
  if (v15 <= (unint64_t)(v17 + 0x40000))
  {
    memcpy(store_write_ptr, v14, v15);
    if ((char *)v15 == v18)
    {
      if ([(DYCaptureArchive *)self _writeBufferToBackingStore:self->_store_write_buffer size:0x40000 error:a6] == -1)
      {
LABEL_9:
        LOBYTE(v21) = 0;
        return v21;
      }
      store_write_buffer = (char *)self->_store_write_buffer;
    }
    else
    {
      store_write_buffer = (char *)self->_store_write_ptr + v15;
    }
    self->_store_write_ptr = store_write_buffer;
  }
  else
  {
    memcpy(store_write_ptr, v14, (size_t)(v17 + 0x40000));
    if ([(DYCaptureArchive *)self _writeBufferToBackingStore:self->_store_write_buffer size:0x40000 error:a6] == -1)goto LABEL_9; {
    self->_store_write_ptr = self->_store_write_buffer;
    }
    if ([(DYCaptureArchive *)self _writeBufferToBackingStore:&v14[(void)v18] size:v19 error:a6] == -1)goto LABEL_9; {
  }
    }
  uint64_t v22 = (void *)[(NSMutableDictionary *)self->_aliasCreationMap objectForKey:a4];
  if (!v22
    || (unsigned int v23 = v22, ![v22 count])
    || (long long v31 = 0u,
        long long v32 = 0u,
        long long v29 = 0u,
        long long v30 = 0u,
        (uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16]) == 0))
  {
LABEL_22:
    self;
LABEL_23:
    LOBYTE(v21) = 1;
    self->_modified = 1;
    return v21;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v30;
LABEL_16:
  uint64_t v27 = 0;
  while (1)
  {
    if (*(void *)v30 != v26) {
      objc_enumerationMutation(v23);
    }
    BOOL v21 = [(DYCaptureArchive *)self _performAddAlias:*(void *)(*((void *)&v29 + 1) + 8 * v27) targetting:a4 error:a6];
    if (!v21) {
      return v21;
    }
    if (v25 == ++v27)
    {
      uint64_t v25 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v25) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }
}

- (BOOL)addFileWithName:(id)a3 data:(id)a4 options:(id)a5 error:(id *)a6 waitUntilDone:(BOOL)a7
{
  BOOL v7 = a7;
  if (![a3 length])
  {
    if (a6)
    {
      uint64_t v12 = *MEMORY[0x263F3F9C0];
      uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v14 = 1;
      goto LABEL_13;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isReadOnly])
  {
    if (a6)
    {
      uint64_t v12 = *MEMORY[0x263F3F9C0];
      uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v14 = 7;
LABEL_13:
      BOOL v15 = 0;
      *a6 = (id)[v13 errorWithDomain:v12 code:v14 userInfo:0];
      return v15;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isClosed])
  {
    if (a6)
    {
      uint64_t v12 = *MEMORY[0x263F3F9C0];
      uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v14 = 20;
      goto LABEL_13;
    }
    return 0;
  }
  if ((unint64_t)[a4 length] >> 31)
  {
    if (a6)
    {
      uint64_t v12 = *MEMORY[0x263F3F9C0];
      uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v14 = 2;
      goto LABEL_13;
    }
    return 0;
  }
  if (v7)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    dispatch_group_enter((dispatch_group_t)self->_add_group);
    write_queue = self->_write_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke;
    block[3] = &unk_2653337D0;
    void block[4] = self;
    void block[5] = a3;
    block[7] = &v21;
    block[8] = a6;
    block[6] = a4;
    dispatch_sync(write_queue, block);
    dispatch_group_leave((dispatch_group_t)self->_add_group);
    BOOL v15 = *((unsigned char *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_add_group);
    uint64_t v18 = self->_write_queue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_2;
    v19[3] = &unk_2653337A8;
    v19[4] = self;
    v19[5] = a3;
    v19[6] = a4;
    dispatch_async(v18, v19);
    return 1;
  }
  return v15;
}

intptr_t __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_performAddFileWithName:dataSize:error:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "length"), *(void *)(a1 + 64));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2 != -1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F8], "dy_dataByCompressingData:error:", *(void *)(a1 + 48), *(void *)(a1 + 64));
    if (v3) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _performFinalizeAddFileAtPosition:v2 name:*(void *)(a1 + 40) data:v3 error:*(void *)(a1 + 64)];
    }
  }
  return dispatch_semaphore_signal(dsema);
}

void __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 264) == -1)
  {
    uint64_t v5 = *(NSObject **)(v1 + 216);
    dispatch_group_leave(v5);
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v1 + 232), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v9 = 0;
    int v3 = objc_msgSend(*(id *)(a1 + 32), "_performAddFileWithName:dataSize:error:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "length"), &v9);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 232));
    if (v3 == -1)
    {
      _DYOLog();
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 216));
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_3;
      block[3] = &unk_2653337F8;
      void block[4] = *(void *)(a1 + 32);
      int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      int v8 = v3;
      dispatch_async(global_queue, block);
    }
  }
}

void __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 264) == -1)
  {
    int8x16_t v7 = *(NSObject **)(v1 + 216);
    dispatch_group_leave(v7);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F8], "dy_dataByCompressingData:error:", *(void *)(a1 + 40), &v10);
    uint64_t v4 = *(void *)(a1 + 32);
    if (v3)
    {
      uint64_t v5 = *(NSObject **)(v4 + 208);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_4;
      block[3] = &unk_2653337F8;
      int v9 = *(_DWORD *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 48);
      void block[4] = v4;
      void block[5] = v6;
      block[6] = v3;
      dispatch_async(v5, block);
    }
    else
    {
      _DYOLog();
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 216));
    }
  }
}

void __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 264) == -1)
  {
    uint64_t v3 = *(NSObject **)(v1 + 216);
    dispatch_group_leave(v3);
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v1 + 232), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v4 = 0;
    if (([*(id *)(a1 + 32) _performFinalizeAddFileAtPosition:*(unsigned int *)(a1 + 56) name:*(void *)(a1 + 40) data:*(void *)(a1 + 48) error:&v4] & 1) == 0)_DYOLog(); {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 232));
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 216));
  }
}

- (BOOL)addTempFileWithName:(id)a3 options:(id)a4 fromLocation:(id)a5 error:(id *)a6
{
  if (![a3 length])
  {
    if (a6)
    {
      uint64_t v11 = *MEMORY[0x263F3F9C0];
      uint64_t v12 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v13 = 1;
      goto LABEL_20;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isReadOnly])
  {
    if (a6)
    {
      uint64_t v11 = *MEMORY[0x263F3F9C0];
      uint64_t v12 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v13 = 7;
LABEL_20:
      BOOL v20 = 0;
      *a6 = (id)[v12 errorWithDomain:v11 code:v13 userInfo:0];
      return v20;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isClosed])
  {
    if (a6)
    {
      uint64_t v11 = *MEMORY[0x263F3F9C0];
      uint64_t v12 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v13 = 20;
      goto LABEL_20;
    }
    return 0;
  }
  uint64_t v14 = (void *)[MEMORY[0x263F08850] defaultManager];
  unint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"Size"), "unsignedIntegerValue");
  if (!v15)
  {
    uint64_t v23 = 0;
    uint64_t v16 = (void *)[v14 attributesOfItemAtPath:a5 error:&v23];
    unint64_t v15 = objc_msgSend((id)objc_msgSend(v16, "objectForKey:", *MEMORY[0x263F080B8]), "longLongValue");
  }
  if (HIDWORD(v15))
  {
    if (a6)
    {
      uint64_t v11 = *MEMORY[0x263F3F9C0];
      uint64_t v12 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v13 = 2;
      goto LABEL_20;
    }
    return 0;
  }
  unsigned int v17 = [(NSURL *)self->_url URLByAppendingPathComponent:a3];
  uint64_t v18 = [(NSURL *)v17 path];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", -[NSURL URLByDeletingLastPathComponent](v17, "URLByDeletingLastPathComponent"), 1, 0, 0);
  if (([a5 isEqualToString:v18] & 1) == 0
    && ![v14 moveItemAtPath:a5 toPath:v18 error:a6])
  {
    if (a6)
    {
      uint64_t v11 = *MEMORY[0x263F3F9C0];
      uint64_t v12 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v13 = 3;
      goto LABEL_20;
    }
    return 0;
  }
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  dispatch_group_enter((dispatch_group_t)self->_add_group);
  write_queue = self->_write_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__DYCaptureArchive_addTempFileWithName_options_fromLocation_error___block_invoke;
  block[3] = &unk_265333820;
  void block[4] = self;
  void block[5] = a3;
  void block[7] = v15;
  block[8] = a6;
  block[6] = &v23;
  dispatch_sync(write_queue, block);
  dispatch_group_leave((dispatch_group_t)self->_add_group);
  BOOL v20 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  return v20;
}

intptr_t __67__DYCaptureArchive_addTempFileWithName_options_fromLocation_error___block_invoke(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _performAddFileWithName:*(void *)(a1 + 40) dataSize:*(unsigned int *)(a1 + 56) withFlags:2 error:*(void *)(a1 + 64)] != -1;
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)addFileWithName:(id)a3 data:(id)a4 options:(id)a5 error:(id *)a6
{
  return [(DYCaptureArchive *)self addFileWithName:a3 data:a4 options:a5 error:a6 waitUntilDone:1];
}

- (BOOL)addCaptureFile:(id)a3 options:(id)a4 error:(id *)a5 waitUntilDone:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v11 = [a3 copyMutableData:a5];
  if (!v11) {
    return 1;
  }
  uint64_t v12 = (void *)v11;
  BOOL v13 = -[DYCaptureArchive addFileWithName:data:options:error:waitUntilDone:](self, "addFileWithName:data:options:error:waitUntilDone:", [a3 name], v11, a4, a5, v6);

  return v13;
}

- (BOOL)addFilesFromArchive:(id)a3 error:(id *)a4 passingTest:(id)a5
{
  if (![(DYCaptureArchive *)self isReadOnly])
  {
    if (![(DYCaptureArchive *)self isClosed])
    {
      BOOL v13 = (void *)[a3 valueForKey:@"filenames"];
      uint64_t v14 = objc_opt_new();
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke;
      v22[3] = &unk_265333848;
      v22[4] = v14;
      v22[5] = a5;
      [v13 enumerateObjectsUsingBlock:v22];
      uint64_t v18 = 0;
      size_t v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 1;
      dispatch_group_enter((dispatch_group_t)self->_add_group);
      write_queue = self->_write_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_2;
      block[3] = &unk_265333780;
      void block[7] = &v18;
      block[8] = a4;
      void block[4] = self;
      void block[5] = v14;
      block[6] = a3;
      dispatch_sync(write_queue, block);
      dispatch_group_leave((dispatch_group_t)self->_add_group);

      BOOL v12 = *((unsigned char *)v19 + 24) != 0;
      _Block_object_dispose(&v18, 8);
      return v12;
    }
    if (a4)
    {
      uint64_t v9 = *MEMORY[0x263F3F9C0];
      uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v11 = 20;
      goto LABEL_7;
    }
    return 0;
  }
  if (!a4) {
    return 0;
  }
  uint64_t v9 = *MEMORY[0x263F3F9C0];
  uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
  uint64_t v11 = 7;
LABEL_7:
  BOOL v12 = 0;
  *a4 = (id)[v10 errorWithDomain:v9 code:v11 userInfo:0];
  return v12;
}

uint64_t __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 addObject:a2];
  }
  return result;
}

intptr_t __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v15 = *(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_t v16 = v15;
  dispatch_semaphore_t v14 = v15;
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _flushWriteBuffer:*(void *)(a1 + 64)];
  uint64_t v2 = *(void *)(a1 + 56);
  if (*(unsigned char *)(*(void *)(v2 + 8) + 24))
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_3;
    v13[3] = &unk_265333870;
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 64);
    v13[6] = v2;
    v13[7] = v5;
    uint64_t v6 = *(void *)(a1 + 32);
    v13[4] = v4;
    v13[5] = v6;
    [v3 enumerateObjectsUsingBlock:v13];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      int8x16_t v7 = objc_opt_new();
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_4;
      v11[3] = &unk_265333898;
      int v8 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      long long v12 = *(_OWORD *)(a1 + 56);
      v11[4] = v9;
      v11[5] = v7;
      v11[6] = *(void *)(a1 + 32);
      [v8 enumerateObjectsUsingBlock:v11];
    }
  }
  return dispatch_semaphore_signal(v14);
}

void __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", a2, 0, *(void *)(a1 + 56)), "bytes");
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = v6;
  unsigned int v8 = [*(id *)(a1 + 32) _findHashEntry:v6];
  if (v8 != -1)
  {
    unsigned int v9 = v8;
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[7];
    if (*(_DWORD *)(v11 + 12 * v9 + 8) != -1) {
      return;
    }
    uint64_t v12 = [v10 copyDataForFilePosition:*(unsigned int *)(v11 + 12 * v9) error:*(void *)(a1 + 56)];
    if (v12)
    {
      BOOL v13 = (void *)v12;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "addFileWithName:data:options:error:waitUntilDone:", objc_msgSend(NSString, "stringWithUTF8String:", v7), v12, 0, *(void *)(a1 + 56), 0);

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a4 = 1;
      }
      return;
    }
LABEL_7:
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  *a4 = 1;
  dispatch_semaphore_t v14 = *(void **)(a1 + 56);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  if (v14) {
    *dispatch_semaphore_t v14 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:0];
  }
}

void *__58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", a2, 0, *(void *)(a1 + 64)), "bytes");
  if (!result) {
    goto LABEL_19;
  }
  uint64_t result = (void *)[*(id *)(a1 + 32) _findHashEntry:result];
  if (result == -1)
  {
    *a4 = 1;
    dispatch_semaphore_t v14 = *(void **)(a1 + 64);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    if (v14)
    {
      uint64_t result = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:0];
      *dispatch_semaphore_t v14 = result;
    }
    return result;
  }
  unsigned int v8 = result;
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v9 = result[7];
  uint64_t v10 = (unsigned int *)(v9 + 12 * v8);
  unsigned int v11 = v10[2];
  if (v11 == -1) {
    return result;
  }
  uint64_t v12 = [result objectInFilenamesAtIndex:*(unsigned int *)(v9 + 12 * v11 + 4)];
  uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v12];
  if (v13) {
    uint64_t v12 = v13;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", v12, 0, *(void *)(a1 + 64)), "bytes");
  if (!result) {
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 48) _findHashEntry:result] != -1)
  {
    uint64_t result = (void *)[*(id *)(a1 + 48) _performAddAlias:a2 targetting:v12 error:*(void *)(a1 + 64)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)result;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      return result;
    }
    goto LABEL_9;
  }
  uint64_t v15 = [*(id *)(a1 + 48) _performAddFileWithName:a2 dataSize:*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 64) + 24 * *v10) error:*(void *)(a1 + 64)];
  if (v15 == -1)
  {
    uint64_t result = (void *)_DYOLog();
    goto LABEL_19;
  }
  uint64_t v16 = v15;
  uint64_t result = (void *)[*(id *)(a1 + 32) _readRawDataForFilePosition:*v10 error:*(void *)(a1 + 64)];
  if (!result)
  {
LABEL_19:
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    return result;
  }
  uint64_t result = (void *)[*(id *)(a1 + 48) _performFinalizeAddFileAtPosition:v16 name:a2 data:result error:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
LABEL_9:
    *a4 = 1;
    return result;
  }
  unsigned int v17 = *(void **)(a1 + 40);
  return (void *)[v17 setObject:a2 forKey:v12];
}

- (BOOL)_performReplaceDataOfFile:(id)a3 withData:(id)a4 error:(id *)a5
{
  uint64_t v8 = [-[DYCaptureArchive _getCFilename:outSize:error:](self _getCFilename:a3 outSize:0) error:"bytes"];
  if (!v8) {
    return 0;
  }
  unsigned int v9 = [(DYCaptureArchive *)self _findHashEntry:v8];
  if (v9 == -1)
  {
    if (a5)
    {
      uint64_t v21 = *MEMORY[0x263F3F9C0];
      uint64_t v22 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v23 = 13;
      goto LABEL_10;
    }
    return 0;
  }
  file_table = self->_file_table;
  unsigned int var0 = self->_hash_table[v9].var0;
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF8F8], "dy_dataByCompressingData:error:", a4, a5);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  uint64_t v14 = [v12 bytes];
  uint64_t v15 = [v13 length];
  uint64_t v16 = v15;
  unsigned int v17 = &file_table[var0];
  unsigned int v19 = v17->var1.var0;
  p_uint64_t var1 = &v17->var1;
  if (v15 > (unint64_t)v19)
  {
    if ([(DYCaptureArchive *)self _flushWriteBuffer:0])
    {
      int64_t backingStoreWritePosition = self->_backingStoreWritePosition;
      if ([(DYCaptureArchive *)self _writeBufferToBackingStore:v14 size:v16 error:a5] != -1)
      {
        long long v30 = file_table;
        file_table[var0].unsigned int var2 = backingStoreWritePosition;
LABEL_17:
        p_var1->unsigned int var0 = v16;
        v30[var0].unsigned int var0 = [a4 length];
        BOOL v24 = 1;
        self->_modified = 1;
        self;
        return v24;
      }
    }
    return 0;
  }
  long long v30 = file_table;
  if (v15 < 1) {
    goto LABEL_17;
  }
  uint64_t v25 = 0;
  while (1)
  {
    ssize_t v26 = pwrite(self->_backingStoreFD, (const void *)(v25 + v14), v16 - v25, v30[var0].var2);
    if (v26 == -1) {
      break;
    }
    v25 += v26;
LABEL_16:
    if (v25 >= v16) {
      goto LABEL_17;
    }
  }
  if (*__error() == 4) {
    goto LABEL_16;
  }
  if (!a5) {
    return 0;
  }
  uint64_t v27 = (void *)MEMORY[0x263F087E8];
  uint64_t v28 = *MEMORY[0x263F08438];
  uint64_t v23 = *__error();
  uint64_t v22 = v27;
  uint64_t v21 = v28;
LABEL_10:
  BOOL v24 = 0;
  *a5 = (id)[v22 errorWithDomain:v21 code:v23 userInfo:0];
  return v24;
}

- (BOOL)replaceDataOfFile:(id)a3 withData:(id)a4 error:(id *)a5
{
  if (![a3 length])
  {
    if (a5)
    {
      uint64_t v9 = *MEMORY[0x263F3F9C0];
      uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v11 = 1;
      goto LABEL_13;
    }
    return 0;
  }
  if ((unint64_t)[a4 length] >> 31)
  {
    if (a5)
    {
      uint64_t v9 = *MEMORY[0x263F3F9C0];
      uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v11 = 2;
LABEL_13:
      BOOL v12 = 0;
      *a5 = (id)[v10 errorWithDomain:v9 code:v11 userInfo:0];
      return v12;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isReadOnly])
  {
    if (a5)
    {
      uint64_t v9 = *MEMORY[0x263F3F9C0];
      uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v11 = 7;
      goto LABEL_13;
    }
    return 0;
  }
  if ([(DYCaptureArchive *)self isClosed])
  {
    if (a5)
    {
      uint64_t v9 = *MEMORY[0x263F3F9C0];
      uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v11 = 20;
      goto LABEL_13;
    }
    return 0;
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  uint64_t v23 = 0;
  dispatch_group_enter((dispatch_group_t)self->_add_group);
  write_queue = self->_write_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DYCaptureArchive_replaceDataOfFile_withData_error___block_invoke;
  block[3] = &unk_2653338C0;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = &v24;
  block[8] = &v18;
  dispatch_sync(write_queue, block);
  dispatch_group_leave((dispatch_group_t)self->_add_group);
  uint64_t v15 = v19;
  if (a5) {
    *a5 = (id)v19[5];
  }
  id v16 = (id)v15[5];
  BOOL v12 = *((unsigned char *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v12;
}

intptr_t __53__DYCaptureArchive_replaceDataOfFile_withData_error___block_invoke(uint64_t a1)
{
  dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _performReplaceDataOfFile:*(void *)(a1 + 40) withData:*(void *)(a1 + 48) error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)updateDataReferenceCounts:(id)a3 error:(id *)a4
{
  if ([(DYCaptureArchive *)self isClosed])
  {
    BOOL v7 = 0;
    if (a4) {
      *a4 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:20 userInfo:0];
    }
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3052000000;
    uint64_t v18 = __Block_byref_object_copy_;
    unsigned int v19 = __Block_byref_object_dispose_;
    uint64_t v20 = 0;
    uint64_t v8 = dispatch_semaphore_create(0);
    write_queue = self->_write_queue;
    add_group = self->_add_group;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__DYCaptureArchive_updateDataReferenceCounts_error___block_invoke;
    v14[3] = &unk_2653338E8;
    v14[4] = self;
    v14[5] = a3;
    v14[8] = &v21;
    v14[9] = a4;
    v14[6] = v8;
    v14[7] = &v15;
    dispatch_group_notify(add_group, write_queue, v14);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
    uint64_t v11 = v16;
    if (a4) {
      *a4 = (id)v16[5];
    }
    id v12 = (id)v11[5];
    BOOL v7 = *((unsigned char *)v22 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }
  return v7;
}

intptr_t __52__DYCaptureArchive_updateDataReferenceCounts_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v23 = *(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_t v24 = v23;
  dispatch_semaphore_t dsema = v23;
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", v6, 0, *(void *)(a1 + 72)), "bytes");
        if (!v7)
        {
          id v12 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          goto LABEL_13;
        }
        unsigned int v8 = [*(id *)(a1 + 32) _findHashEntry:v7];
        if (v8 == -1)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          uint64_t v13 = (void *)MEMORY[0x263F3F9C8];
          uint64_t v14 = NSDictionary;
          uint64_t v15 = [NSString stringWithFormat:@"Could not update ref counts for file: %@", v6];
          uint64_t v16 = [v14 dictionaryWithObject:v15 forKey:*MEMORY[0x263F08320]];
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[v13 errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:v16];
          goto LABEL_13;
        }
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(v9 + 64);
        unsigned int v11 = *(_DWORD *)(*(void *)(v9 + 56) + 12 * v8);
        *(_DWORD *)(v10 + 24 * v11 + 20) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6), "unsignedIntValue");
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v25 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return dispatch_semaphore_signal(dsema);
}

- (void)initCache
{
  unint64_t file_table_length = self->_header.file_table_length;
  self->_cacheSize = file_table_length;
  std::vector<DYCaptureArchiveCacheEntry>::resize((uint64_t)&self->_cacheTable, file_table_length);
  if (self->_header.file_table_length)
  {
    unint64_t v4 = 0;
    uint64_t v5 = 24;
    do
    {
      begin = self->_cacheTable.__begin_;
      *(void *)((char *)begin + v5) = dispatch_semaphore_create(1);
      ++v4;
      v5 += 32;
    }
    while (v4 < self->_header.file_table_length);
  }
}

- (void)resizeCache
{
  std::vector<DYCaptureArchiveCacheEntry>::resize((uint64_t)&self->_cacheTable, self->_header.file_table_length);
  unint64_t cacheSize = self->_cacheSize;
  unint64_t file_table_length = self->_header.file_table_length;
  if (cacheSize < file_table_length)
  {
    uint64_t v5 = 32 * cacheSize;
    do
    {
      uint64_t v6 = (char *)self->_cacheTable.__begin_ + v5;
      *(_OWORD *)uint64_t v6 = 0u;
      *((_OWORD *)v6 + 1) = 0u;
      *((void *)v6 + 3) = dispatch_semaphore_create(1);
      ++cacheSize;
      unint64_t file_table_length = self->_header.file_table_length;
      v5 += 32;
    }
    while (cacheSize < file_table_length);
  }
  self->_unint64_t cacheSize = file_table_length;
}

- (void)cacheAllResources
{
  self->_useCache = 1;
  atomic_store(0, &self->_preloadAtomicIndex.__a_.__a_value);
  operator new();
}

- (void)releaseBytesForFilePosition:(unint64_t)a3
{
  uint64_t v3 = a3;
  if (a3 >= (unint64_t)self->_header.file_table_length) {
    __assert_rtn("-[DYCaptureArchive releaseBytesForFilePosition:]", ", 0, "position < _header.file_table_length"");
  }
  begin = self->_cacheTable.__begin_;
  uint64_t v6 = (char *)begin + 32 * a3;
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v6 + 3), 0xFFFFFFFFFFFFFFFFLL);
  int v7 = *((_DWORD *)v6 + 4);
  BOOL v8 = __OFSUB__(v7--, 1);
  *((_DWORD *)v6 + 4) = v7;
  if ((v7 < 0) ^ v8 | (v7 == 0))
  {
    if (self->_useCache)
    {
      int state = 1;
      mach_vm_purgable_control(*MEMORY[0x263EF8960], *(void *)v6, 0, &state);
    }
    else
    {
      mach_vm_deallocate(*MEMORY[0x263EF8960], *(void *)v6, *((void *)begin + 4 * v3 + 1));
      *(void *)uint64_t v6 = 0;
      *((void *)v6 + 1) = 0;
      *((_DWORD *)v6 + 4) = 0;
    }
  }
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v6 + 3));
  [(DYCaptureArchive *)self _printUsage];
}

- (BOOL)allocatePageAlignedMemory:(void *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5
{
  kern_return_t v8;
  BOOL v9;
  mach_vm_address_t address;

  mach_vm_size_t v6 = ~*MEMORY[0x263EF8AE8] & (*MEMORY[0x263EF8AE8] + self->_file_table[a4].var0);
  if (!v6) {
    return 0;
  }
  address = 0;
  BOOL v8 = mach_vm_allocate(*MEMORY[0x263EF8960], &address, v6, 3);
  uint64_t v9 = v8 == 0;
  if (v8) {
    *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08350] code:v8 userInfo:0];
  }
  else {
    *a3 = (void *)address;
  }
  return v9;
}

- (void)_cleanBytes:(unint64_t)a3 andSkip:(id *)a4
{
  begin = self->_cacheTable.__begin_;
  end = self->_cacheTable.__end_;
  if (begin != end && a3)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = (end - begin) >> 5;
    unint64_t v12 = 1;
    uint64_t v13 = (vm_map_t *)MEMORY[0x263EF8960];
    do
    {
      uint64_t v14 = self->_cacheTable.__begin_;
      uint64_t v15 = (char *)v14 + v9;
      if (($FE1E04DC213CC14599BC0197C507E86A *)((char *)v14 + v9) != a4
        && !dispatch_semaphore_wait(*((dispatch_semaphore_t *)v15 + 3), 0))
      {
        uint64_t v16 = (char *)v14 + v9;
        if (!*((_DWORD *)v16 + 4))
        {
          mach_vm_deallocate(*v13, *(void *)v16, *((void *)v16 + 1));
          v10 += *((void *)v16 + 1);
          *((_DWORD *)v15 + 4) = 0;
          *(void *)uint64_t v15 = 0;
          *((void *)v15 + 1) = 0;
        }
        dispatch_semaphore_signal(*((dispatch_semaphore_t *)v15 + 3));
      }
      if (v12 >= v11) {
        break;
      }
      ++v12;
      v9 += 32;
    }
    while (v10 < a3);
  }
}

- (void)_springCleaning
{
  vm_size_t v7 = 0;
  host_t v3 = MEMORY[0x2533603B0](self, a2);
  mach_msg_type_number_t host_info_outCnt = 15;
  host_page_size(v3, &v7);
  if (!host_statistics(v3, 2, host_info_out, &host_info_outCnt))
  {
    vm_size_t v4 = v7 * host_info_out[0];
    if (!(v4 >> 27)) {
      [(DYCaptureArchive *)self _cleanBytes:0x8000000 - v4 andSkip:0];
    }
  }
}

- (int)_tryAgain:(id *)a3
{
  [(DYCaptureArchive *)self _cleanBytes:a3->var1 andSkip:a3];
  vm_map_t v4 = *MEMORY[0x263EF8960];
  mach_vm_size_t var1 = a3->var1;
  return mach_vm_allocate(v4, &a3->var0, var1, 3);
}

- (BOOL)requestBuffer:(void *)a3 forFilePosition:(unint64_t)a4 cacheEntry:(id *)a5 needsData:(BOOL *)a6 error:(id *)a7
{
  kern_return_t v21;
  int v23;
  unint64_t var1;
  int v26;
  int state;

  unint64_t var0 = self->_file_table[a4].var0;
  uint64_t v13 = (void *)a5->var0;
  if (a5->var0)
  {
    int var2 = a5->var2;
    if (var2 >= 1)
    {
      a5->int var2 = var2 + 1;
      *a3 = v13;
      *a6 = 0;
      if (a5->var1 >= var0) {
        return 1;
      }
LABEL_25:
      __assert_rtn("-[DYCaptureArchive requestBuffer:forFilePosition:cacheEntry:needsData:error:]", ", 0, "(size_t)bytes_to_copy <= entry->map_size"");
    }
    int state = 0;
    if (mach_vm_purgable_control(*MEMORY[0x263EF8960], (mach_vm_address_t)v13, 0, &state)) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = state == 2;
    }
    if (!v16)
    {
      ++a5->var2;
      mach_vm_size_t var1 = a5->var1;
      *a3 = (void *)a5->var0;
      *a6 = 0;
      if (var1 >= var0) {
        return 1;
      }
      goto LABEL_25;
    }
  }
  unint64_t v17 = ~*MEMORY[0x263EF8AE8] & (*MEMORY[0x263EF8AE8] + var0);
  a5->mach_vm_size_t var1 = v17;
  if (!v17) {
    return 0;
  }
  a5->int var2 = 1;
  long long v18 = (vm_map_t *)MEMORY[0x263EF8960];
  if (mach_vm_allocate(*MEMORY[0x263EF8960], &a5->var0, v17, 3)
    && (int v19 = [(DYCaptureArchive *)self _tryAgain:a5]) != 0)
  {
    long long v20 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08350] code:v19 userInfo:0];
    BOOL v15 = 0;
  }
  else
  {
    uint64_t v26 = 0;
    long long v21 = mach_vm_purgable_control(*v18, a5->var0, 0, &v26);
    if (v26 == 2 && v21 == 0) {
      dispatch_semaphore_t v23 = 2;
    }
    else {
      dispatch_semaphore_t v23 = v21;
    }
    BOOL v15 = v23 == 0;
    if (!v23)
    {
      *a3 = (void *)a5->var0;
      *a6 = 1;
      return v15;
    }
    long long v20 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08350] code:v23 userInfo:0];
  }
  *a7 = v20;
  return v15;
}

- (BOOL)_requestDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t *)a5 error:(id *)a6
{
  if (!a4)
  {
    if (!a6) {
      goto LABEL_13;
    }
    uint64_t v19 = *MEMORY[0x263F08438];
    long long v20 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v21 = 14;
    goto LABEL_12;
  }
  uint64_t v8 = a3;
  if (a3 >= (unint64_t)self->_header.file_table_length) {
    __assert_rtn("-[DYCaptureArchive _requestDataForFilePosition:buffer:size:error:]", ", 0, "position < _header.file_table_length"");
  }
  uint64_t v9 = a5;
  file_table = self->_file_table;
  unint64_t v12 = &file_table[a3];
  if ((v12->var3 & 2) != 0)
  {
    LOBYTE(strm.next_in) = 1;
    begin = self->_cacheTable.__begin_;
    if (begin == self->_cacheTable.__end_)
    {
      LODWORD(v9) = [(DYCaptureArchive *)self allocatePageAlignedMemory:a4 forFilePosition:a3 error:a6];
      dispatch_semaphore_t v23 = 0;
      BOOL v24 = 1;
      if (!v9) {
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_semaphore_t v23 = (dispatch_semaphore_t *)((char *)begin + 32 * a3);
      dispatch_semaphore_wait(v23[3], 0xFFFFFFFFFFFFFFFFLL);
      if (![(DYCaptureArchive *)self requestBuffer:a4 forFilePosition:v8 cacheEntry:v23 needsData:&strm error:a6]|| !*a4)
      {
        LOBYTE(v9) = 0;
        goto LABEL_26;
      }
      unint64_t *v9 = v12->var0;
      BOOL v24 = LOBYTE(strm.next_in) != 0;
      LOBYTE(v9) = 1;
    }
    if (!v24)
    {
LABEL_26:
      if (self->_cacheTable.__begin_ != self->_cacheTable.__end_) {
        dispatch_semaphore_signal(v23[3]);
      }
      return (char)v9;
    }
    uint64_t v28 = -[NSURL URLByAppendingPathComponent:](self->_url, "URLByAppendingPathComponent:", [NSString stringWithUTF8String:(char *)self->_string_table_storage + self->_string_table_offsets[file_table[v8].var1.var0]]);
    long long v29 = (void *)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v28];
    if (v29)
    {
      memcpy(*a4, (const void *)[v29 bytes], v12->var0);
      LOBYTE(v9) = 1;
      goto LABEL_26;
    }
    if (self->_cacheTable.__begin_ != self->_cacheTable.__end_) {
      dispatch_semaphore_signal(v23[3]);
    }
    if (!a6) {
      goto LABEL_13;
    }
    uint64_t v19 = *MEMORY[0x263F3F9C0];
    long long v20 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v21 = 13;
LABEL_12:
    *a6 = (id)[v20 errorWithDomain:v19 code:v21 userInfo:0];
    goto LABEL_13;
  }
  uint64_t v13 = &file_table[a3];
  unsigned int var0 = v13->var1.var0;
  p_mach_vm_size_t var1 = &v13->var1;
  int64_t v14 = var0;
  size_t v17 = v12->var0;
  if (v17) {
    BOOL v18 = v14 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    *a5 = 0;
    *a4 = 0;
LABEL_13:
    LOBYTE(v9) = 1;
    return (char)v9;
  }
  uint64_t v84 = *(void *)&p_var1[1].var0;
  v86[0] = 1;
  uint64_t v25 = self->_cacheTable.__begin_;
  if (v25 == self->_cacheTable.__end_)
  {
    BOOL v30 = [(DYCaptureArchive *)self allocatePageAlignedMemory:a4 forFilePosition:a3 error:a6];
    uint64_t v26 = 0;
    int v27 = 1;
    if (!v30)
    {
LABEL_35:
      if (self->_cacheTable.__begin_ == self->_cacheTable.__end_)
      {
LABEL_86:
        unint64_t *v9 = v17;
        goto LABEL_13;
      }
      uint64_t v46 = 0;
LABEL_78:
      dispatch_semaphore_signal(*((dispatch_semaphore_t *)v26 + 3));
      [(DYCaptureArchive *)self _printUsage];
      if (v46) {
        goto LABEL_79;
      }
      goto LABEL_86;
    }
  }
  else
  {
    uint64_t v26 = (char *)v25 + 32 * a3;
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)v26 + 3), 0xFFFFFFFFFFFFFFFFLL);
    if (![(DYCaptureArchive *)self requestBuffer:a4 forFilePosition:v8 cacheEntry:v26 needsData:v86 error:a6])goto LABEL_81; {
    int v27 = v86[0];
    }
  }
  if (!v27) {
    goto LABEL_35;
  }
  v82 = v26;
  long long v31 = (Bytef *)*a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_read_buffer_sem, 0xFFFFFFFFFFFFFFFFLL);
  GPUTools::DYLockUtils::Lock((GPUTools::DYLockUtils *)&self->_read_buffer_tokens_lock, v32);
  end = self->_read_buffer_tokens.__end_;
  uint64_t v34 = *(end - 1);
  self->_read_buffer_tokens.__end_ = end - 1;
  p_read_buffer_tokens_lock = (GPUTools::DYLockUtils *)&self->_read_buffer_tokens_lock;
  GPUTools::DYLockUtils::Unlock((GPUTools::DYLockUtils *)&self->_read_buffer_tokens_lock, v35);
  int32x4_t v36 = &self->_scratch[self->_scratchSize * v34];
  int64_t backingStoreWritePosition = self->_backingStoreWritePosition;
  BOOL v38 = __OFSUB__(v84, backingStoreWritePosition);
  uint64_t v39 = v84 - backingStoreWritePosition;
  size_t v83 = v17;
  unsigned int v79 = v34;
  v80 = v9;
  if (v39 < 0 == v38)
  {
    if (v39 >= 0)
    {
      v47 = (char *)self->_store_write_buffer + v39;
      if (self->_store_write_ptr > v47)
      {
        v48 = (const uint8_t *)(v47 + 2);
        size_t v49 = p_var1->var0 - 2;
        unsigned int v50 = v31;
LABEL_52:
        if (compression_decode_buffer(v50, v17, v48, v49, v36, COMPRESSION_ZLIB) == v17) {
          goto LABEL_53;
        }
      }
    }
    uint64_t v44 = (void *)MEMORY[0x263F087E8];
    ssize_t v43 = (__CFString *)*MEMORY[0x263F3F9C0];
    uint64_t v45 = 8;
LABEL_55:
    uint64_t v46 = (void *)[v44 errorWithDomain:v43 code:v45 userInfo:0];
    goto LABEL_56;
  }
  int64_t read_buffer_capacity = self->_read_buffer_capacity;
  v41 = (uint8_t *)self->_read_buffer + read_buffer_capacity * v34;
  if (read_buffer_capacity >= v14)
  {
    uint64_t v51 = 0;
    int64_t v52 = v14;
    while (1)
    {
      size_t v53 = self->_read_buffer_capacity >= v52 ? v52 : self->_read_buffer_capacity;
      ssize_t v54 = pread(self->_backingStoreFD, &v41[v51], v53, v51 + v84);
      if (v54 == -1 && *__error() != 4) {
        break;
      }
      v51 += v54;
      v52 -= v54;
      if (!v52) {
        goto LABEL_51;
      }
    }
    uint64_t v46 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    if (!v46)
    {
LABEL_51:
      v48 = v41 + 2;
      size_t v49 = v14 - 2;
      unsigned int v50 = v31;
      size_t v17 = v83;
      goto LABEL_52;
    }
    goto LABEL_56;
  }
  strm.next_in = 0;
  strm.avail_in = 0;
  strm.next_out = v31;
  strm.avail_out = v17;
  memset(&strm.zalloc, 0, 24);
  int v42 = inflateInit_(&strm, "1.2.12", 112);
  ssize_t v43 = @"ZlibErrorDomain";
  if (v42)
  {
    uint64_t v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = 1;
    goto LABEL_55;
  }
  unsigned int v69 = 0;
  uint64_t v70 = 0;
  while (2)
  {
    if (self->_read_buffer_capacity >= v14) {
      size_t v71 = v14;
    }
    else {
      size_t v71 = self->_read_buffer_capacity;
    }
    ssize_t v72 = pread(self->_backingStoreFD, v41, v71, v70 + v84);
    ssize_t v73 = v72;
    if (v72 != -1)
    {
      int64_t v74 = self->_read_buffer_capacity;
      if (v74 >= v14) {
        int64_t v74 = v14;
      }
      if (v72 < v74)
      {
        uint64_t v46 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3F9C0] code:8 userInfo:0];
        inflateEnd(&strm);
        if (v46) {
          goto LABEL_56;
        }
        goto LABEL_53;
      }
      goto LABEL_97;
    }
    if (*__error() == 4)
    {
LABEL_97:
      strm.next_in = v41;
      strm.avail_in = v73;
      if (v14 == v73) {
        int v75 = 4;
      }
      else {
        int v75 = 2;
      }
      while (strm.avail_in && v69 == 0)
      {
        unsigned int v69 = inflate(&strm, v75);
        if (v69 >= 2)
        {
          uint64_t v77 = [MEMORY[0x263F087E8] errorWithDomain:@"ZlibErrorDomain" code:1 userInfo:0];
          if (v77)
          {
            uint64_t v46 = (void *)v77;
            inflateEnd(&strm);
            goto LABEL_56;
          }
          break;
        }
      }
      v70 += v73;
      v14 -= v73;
      if (v14) {
        continue;
      }
      inflateEnd(&strm);
LABEL_53:
      uint64_t v46 = 0;
LABEL_56:
      GPUTools::DYLockUtils::Lock(p_read_buffer_tokens_lock, v55);
      value = self->_read_buffer_tokens.__end_cap_.__value_;
      uint64_t v58 = self->_read_buffer_tokens.__end_;
      uint64_t v9 = v80;
      if (v58 >= value)
      {
        size_t v60 = self->_read_buffer_tokens.__begin_;
        uint64_t v61 = v58 - v60;
        uint64_t v26 = v82;
        if ((unint64_t)(v61 + 1) >> 62) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v62 = (char *)value - (char *)v60;
        unint64_t v63 = ((char *)value - (char *)v60) >> 1;
        if (v63 <= v61 + 1) {
          unint64_t v63 = v61 + 1;
        }
        if (v62 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v56 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v56 = v63;
        }
        if (v56)
        {
          off_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&self->_read_buffer_tokens.__end_cap_, v56);
          size_t v60 = self->_read_buffer_tokens.__begin_;
          uint64_t v58 = self->_read_buffer_tokens.__end_;
        }
        else
        {
          off_t v64 = 0;
        }
        v65 = (unsigned int *)&v64[4 * v61];
        ssize_t v66 = (unsigned int *)&v64[4 * v56];
        unsigned int *v65 = v79;
        unsigned int v59 = v65 + 1;
        while (v58 != v60)
        {
          unsigned int v67 = *--v58;
          *--v65 = v67;
        }
        self->_read_buffer_tokens.__begin_ = v65;
        self->_read_buffer_tokens.__end_ = v59;
        self->_read_buffer_tokens.__end_cap_.__value_ = v66;
        if (v60) {
          operator delete(v60);
        }
      }
      else
      {
        *uint64_t v58 = v79;
        unsigned int v59 = v58 + 1;
        uint64_t v26 = v82;
      }
      self->_read_buffer_tokens.__end_ = v59;
      GPUTools::DYLockUtils::Unlock(p_read_buffer_tokens_lock, (volatile int *)v56);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_read_buffer_sem);
      size_t v17 = v83;
      if (self->_cacheTable.__begin_ == self->_cacheTable.__end_)
      {
        if (v46)
        {
          if (*a4) {
            free(*a4);
          }
LABEL_79:
          if (a6)
          {
            LOBYTE(v9) = 0;
            *a6 = v46;
            return (char)v9;
          }
LABEL_81:
          LOBYTE(v9) = 0;
          return (char)v9;
        }
        goto LABEL_86;
      }
      if (v46)
      {
        if (*a4 && *((int *)v26 + 4) <= 1)
        {
          mach_vm_deallocate(*MEMORY[0x263EF8960], *(void *)v26, *((void *)v26 + 1));
          *(void *)uint64_t v26 = 0;
          *((void *)v26 + 1) = 0;
          *((_DWORD *)v26 + 4) = 0;
        }
        *a4 = 0;
      }
      goto LABEL_78;
    }
    break;
  }
  uint64_t v78 = v9;
  inflateEnd(&strm);
  if (a6) {
    *a6 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  LOBYTE(v9) = 0;
  *uint64_t v78 = 0;
  *a4 = 0;
  return (char)v9;
}

- (BOOL)requestDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t *)a5 error:(id *)a6
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v13, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  LOBYTE(a6) = [(DYCaptureArchive *)self _requestDataForFilePosition:a3 buffer:a4 size:a5 error:a6];
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v13, v11);
  return (char)a6;
}

- (id)_readRawDataForFilePosition:(unsigned int)a3 error:(id *)a4
{
  vm_map_t v4 = &self->_file_table[a3];
  int64_t var0 = v4->var1.var0;
  if (!var0)
  {
    BOOL v18 = (void *)MEMORY[0x263EFF990];
    return (id)[v18 data];
  }
  int64_t var2 = v4->var2;
  int64_t backingStoreWritePosition = self->_backingStoreWritePosition;
  BOOL v10 = __OFSUB__(var2, backingStoreWritePosition);
  uint64_t v11 = var2 - backingStoreWritePosition;
  if (v11 < 0 == v10)
  {
    if (v11 >= 0 && self->_store_write_ptr > (char *)self->_store_write_buffer + v11)
    {
      long long v20 = (void *)MEMORY[0x263EFF990];
      return (id)objc_msgSend(v20, "dataWithBytesNoCopy:length:freeWhenDone:");
    }
LABEL_20:
    if (a4)
    {
      uint64_t v21 = *MEMORY[0x263F3F9C0];
      uint64_t v22 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v23 = 8;
      goto LABEL_26;
    }
    return 0;
  }
  unint64_t v12 = (void *)[MEMORY[0x263EFF990] dataWithLength:var0];
  if (!v12)
  {
    if (a4)
    {
      uint64_t v21 = *MEMORY[0x263F3F9C0];
      uint64_t v22 = (void *)MEMORY[0x263F3F9C8];
      uint64_t v23 = 4;
      goto LABEL_26;
    }
    return 0;
  }
  uint64_t v13 = v12;
  int64_t v14 = (void *)[v12 mutableBytes];
  uint64_t v15 = 0;
  while (1)
  {
    ssize_t v16 = pread(self->_backingStoreFD, v14, var0, v15 + var2);
    ssize_t v17 = v16;
    if (v16 != -1)
    {
      if (var0 > v16) {
        goto LABEL_20;
      }
      goto LABEL_10;
    }
    if (*__error() != 4) {
      break;
    }
LABEL_10:
    v15 += v17;
    var0 -= v17;
    if (!var0) {
      return v13;
    }
  }
  if (!a4) {
    return 0;
  }
  BOOL v24 = (void *)MEMORY[0x263F087E8];
  uint64_t v25 = *MEMORY[0x263F08438];
  uint64_t v23 = *__error();
  uint64_t v22 = v24;
  uint64_t v21 = v25;
LABEL_26:
  uint64_t v13 = 0;
  *a4 = (id)[v22 errorWithDomain:v21 code:v23 userInfo:0];
  return v13;
}

- (int64_t)readDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v14, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  int64_t v11 = [(DYCaptureArchive *)self _readDataForFilePosition:a3 buffer:a4 size:a5 error:a6];
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v14, v12);
  return v11;
}

- (int64_t)_readDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  if (!a4)
  {
    if (a6) {
      *a6 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F08438] code:14 userInfo:0];
    }
    return -1;
  }
  unint64_t v11 = 0;
  __src = 0;
  if (![(DYCaptureArchive *)self _requestDataForFilePosition:a3 buffer:&__src size:&v11 error:a6])return -1; {
  if (v11 < a5)
  }
    __assert_rtn("-[DYCaptureArchive _readDataForFilePosition:buffer:size:error:]", ", 0, "size <= dataSize"");
  memcpy(a4, __src, a5);
  [(DYCaptureArchive *)self releaseBytesForFilePosition:a3];
  return a5;
}

- (id)copyDataForFilePosition:(unint64_t)a3 error:(id *)a4
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v10, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  id v7 = [(DYCaptureArchive *)self _copyDataForFilePosition:a3 error:a4];
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v10, v8);
  return v7;
}

- (id)_copyDataForFilePosition:(unint64_t)a3 error:(id *)a4
{
  uint64_t v4 = a3;
  if (a3 >= (unint64_t)self->_header.file_table_length) {
    __assert_rtn("-[DYCaptureArchive _copyDataForFilePosition:error:]", ", 0, "position < _header.file_table_length"");
  }
  file_table = self->_file_table;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:file_table[a3].var0];
  [v8 setLength:file_table[v4].var0];
  if (-[DYCaptureArchive _readDataForFilePosition:buffer:size:error:](self, "_readDataForFilePosition:buffer:size:error:", v4, [v8 mutableBytes], file_table[v4].var0, a4) == -1)
  {

    return 0;
  }
  return v8;
}

- (id)openFileWithFilename:(id)a3 error:(id *)a4
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v14, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (![a3 length])
  {
    if (a4)
    {
      uint64_t v8 = 1;
      goto LABEL_7;
    }
LABEL_14:
    id v10 = 0;
    goto LABEL_15;
  }
  if (![(DYCaptureArchive *)self isClosed])
  {
    uint64_t v11 = objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a3, 0, a4), "bytes");
    if (v11)
    {
      uint64_t v12 = [(DYCaptureArchive *)self _findHashEntry:v11];
      if (v12 != -1)
      {
        id v10 = [[DYCaptureFile alloc] _initWithArchive:self hashPosition:v12 name:a3];
        goto LABEL_15;
      }
      if (a4)
      {
        uint64_t v9 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:0];
        goto LABEL_8;
      }
    }
    goto LABEL_14;
  }
  if (!a4) {
    goto LABEL_14;
  }
  uint64_t v8 = 20;
LABEL_7:
  uint64_t v9 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:v8 userInfo:0];
LABEL_8:
  id v10 = 0;
  *a4 = v9;
LABEL_15:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v14, v7);
  return v10;
}

- (int64_t)readDataForFilenameBuffer:(const char *)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v17, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (*a3)
  {
    if ([(DYCaptureArchive *)self isClosed])
    {
      if (a6)
      {
        uint64_t v12 = 20;
LABEL_7:
        uint64_t v13 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:v12 userInfo:0];
LABEL_8:
        *a6 = v13;
      }
    }
    else
    {
      unsigned int v16 = [(DYCaptureArchive *)self _findHashEntry:a3];
      if (v16 != -1)
      {
        int64_t v14 = [(DYCaptureArchive *)self readDataForFilePosition:self->_hash_table[v16].var0 buffer:a4 size:a5 error:a6];
        goto LABEL_10;
      }
      if (a6)
      {
        uint64_t v13 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:0];
        goto LABEL_8;
      }
    }
  }
  else if (a6)
  {
    uint64_t v12 = 1;
    goto LABEL_7;
  }
  int64_t v14 = -1;
LABEL_10:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v17, v11);
  return v14;
}

- (int64_t)readDataForFilename:(id)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  uint64_t v10 = [a3 cStringUsingEncoding:1];
  return [(DYCaptureArchive *)self readDataForFilenameBuffer:v10 buffer:a4 size:a5 error:a6];
}

- (id)copyDataForFilenameBuffer:(const char *)a3 error:(id *)a4
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v13, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!*a3)
  {
    if (a4)
    {
      uint64_t v8 = 1;
      goto LABEL_7;
    }
LABEL_13:
    id v10 = 0;
    goto LABEL_14;
  }
  if (![(DYCaptureArchive *)self isClosed])
  {
    unsigned int v11 = [(DYCaptureArchive *)self _findHashEntry:a3];
    if (v11 != -1)
    {
      id v10 = [(DYCaptureArchive *)self _copyDataForFilePosition:self->_hash_table[v11].var0 error:a4];
      goto LABEL_14;
    }
    if (a4)
    {
      uint64_t v9 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:0];
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (!a4) {
    goto LABEL_13;
  }
  uint64_t v8 = 20;
LABEL_7:
  uint64_t v9 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:v8 userInfo:0];
LABEL_8:
  id v10 = 0;
  *a4 = v9;
LABEL_14:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v13, v7);
  return v10;
}

- (id)copyDataForFilename:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 cStringUsingEncoding:1];
  return [(DYCaptureArchive *)self copyDataForFilenameBuffer:v6 error:a4];
}

- (void)allocateAndReadDataForFilenameBuffer:(const char *)a3 outSize:(unint64_t *)a4 error:(id *)a5
{
  if (!-[DYCaptureArchive getInfo:forFilenameBuffer:error:](self, "getInfo:forFilenameBuffer:error:", &v11, a3)) {
    return 0;
  }
  for (int i = 3; i; --i)
  {
    uint64_t v9 = malloc_type_malloc(size, 0x2F0C5437uLL);
    if (!v9) {
      break;
    }
    if ([(DYCaptureArchive *)self readDataForFilePosition:v11 buffer:v9 size:size error:a5] != -1)
    {
      if (a4) {
        *a4 = size;
      }
      return v9;
    }
    free(v9);
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)getFilenameForFilePosition:(unint64_t)a3 error:(id *)a4
{
  unsigned int v4 = a3;
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v16, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (self->_header.file_table_length <= (unint64_t)v4) {
    __assert_rtn("-[DYCaptureArchive getFilenameForFilePosition:error:]", ", 0, "position < _header.file_table_length"");
  }
  unint64_t hash_table_length = self->_header.hash_table_length;
  if (!hash_table_length)
  {
LABEL_12:
    int64_t v14 = 0;
    goto LABEL_13;
  }
  hash_table = self->_hash_table;
  if (hash_table->var0 != v4)
  {
    unint64_t v9 = 0;
    uint64_t v11 = hash_table + 1;
    while (hash_table_length - 1 != v9)
    {
      unsigned int var0 = v11->var0;
      ++v11;
      ++v9;
      if (var0 == v4)
      {
        BOOL v10 = v9 < hash_table_length;
        goto LABEL_9;
      }
    }
    goto LABEL_12;
  }
  unint64_t v9 = 0;
  BOOL v10 = 1;
LABEL_9:
  id v13 = [(DYCaptureArchive *)self objectInFilenamesAtIndex:hash_table[v9].var1];
  if (v10) {
    int64_t v14 = v13;
  }
  else {
    int64_t v14 = 0;
  }
LABEL_13:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v16, v6);
  return v14;
}

- (BOOL)getInfo:(id *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v11, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  LOBYTE(a5) = [(DYCaptureArchive *)self _getInfo:a3 forFilePosition:a4 error:a5];
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v11, v9);
  return (char)a5;
}

- (BOOL)_getInfo:(id *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5
{
  if (self->_header.file_table_length <= a4) {
    __assert_rtn("-[DYCaptureArchive _getInfo:forFilePosition:error:]", ", 0, "position_32 < _header.file_table_length"");
  }
  uint64_t v5 = &self->_file_table[a4];
  a3->unsigned int var0 = a4;
  *(int32x2_t *)&long long v6 = vrev64_s32(*(int32x2_t *)&v5->var0);
  *((void *)&v6 + 1) = *(void *)&v5->var3;
  *(_OWORD *)&a3->int64_t var2 = v6;
  a3->mach_vm_size_t var1 = v5->var2;
  return 1;
}

- (BOOL)getInfo:(id *)a3 forFilenameBuffer:(const char *)a4 error:(id *)a5
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v15, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!*a4)
  {
    if (a5)
    {
      uint64_t v10 = 1;
      goto LABEL_7;
    }
LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  if (![(DYCaptureArchive *)self isClosed])
  {
    unsigned int v13 = [(DYCaptureArchive *)self _findHashEntry:a4];
    if (v13 != -1)
    {
      BOOL v12 = [(DYCaptureArchive *)self _getInfo:a3 forFilePosition:self->_hash_table[v13].var0 error:a5];
      goto LABEL_14;
    }
    if (a5)
    {
      uint64_t v11 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:13 userInfo:0];
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (!a5) {
    goto LABEL_13;
  }
  uint64_t v10 = 20;
LABEL_7:
  uint64_t v11 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:v10 userInfo:0];
LABEL_8:
  BOOL v12 = 0;
  *a5 = v11;
LABEL_14:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v15, v9);
  return v12;
}

- (BOOL)getInfo:(id *)a3 forFilename:(id)a4 error:(id *)a5
{
  uint64_t v8 = [a4 cStringUsingEncoding:1];
  return [(DYCaptureArchive *)self getInfo:a3 forFilenameBuffer:v8 error:a5];
}

- (BOOL)fileExistsForFilenameBuffer:(const char *)a3 error:(id *)a4
{
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v11, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!*a3)
  {
    if (a4)
    {
      uint64_t v8 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:1 userInfo:0];
      goto LABEL_7;
    }
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if (![(DYCaptureArchive *)self isClosed])
  {
    BOOL v9 = [(DYCaptureArchive *)self _findHashEntry:a3] != -1;
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_9;
  }
  uint64_t v8 = (void *)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:20 userInfo:0];
LABEL_7:
  BOOL v9 = 0;
  *a4 = v8;
LABEL_10:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v11, v7);
  return v9;
}

- (BOOL)fileExistsForFilename:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 cStringUsingEncoding:1];
  return [(DYCaptureArchive *)self fileExistsForFilenameBuffer:v6 error:a4];
}

- (id)metadataValueForKey:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_metadata objectForKey:a3];
  return v3;
}

- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  BOOL v9 = [(DYCaptureArchive *)self isReadOnly];
  if (v9)
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:7 userInfo:0];
    }
  }
  else
  {
    uint64_t v10 = (void *)[a3 copyWithZone:0];
    [(NSMutableDictionary *)self->_metadata setObject:v10 forKey:a4];
  }
  return !v9;
}

- (void)setMetadataFromArchive:(id)a3
{
  self->_metadata = (NSMutableDictionary *)[*((id *)a3 + 18) mutableCopy];
}

- (void)markMetadataModified
{
  write_queue = self->_write_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__DYCaptureArchive_markMetadataModified__block_invoke;
  block[3] = &unk_265333698;
  void block[4] = self;
  dispatch_sync(write_queue, block);
}

intptr_t __40__DYCaptureArchive_markMetadataModified__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t dsema = *(NSObject **)(*(void *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(unsigned char *)(*(void *)(a1 + 32) + 272) = 1;
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)storeAdjunctData:(id)a3 filename:(id)a4 error:(id *)a5
{
  if (!a4)
  {
    unsigned int v16 = "filename != nil";
    goto LABEL_26;
  }
  if (!a3)
  {
    unsigned int v16 = "data != nil";
LABEL_26:
    __assert_rtn("-[DYCaptureArchive storeAdjunctData:filename:error:]", "", 0, v16);
  }
  if (![a4 length]
    || (unint64_t)objc_msgSend((id)objc_msgSend(a4, "pathComponents"), "count") >= 2)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v9 = *MEMORY[0x263F3F9C0];
    uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v11 = 1;
LABEL_7:
    *a5 = (id)[v10 errorWithDomain:v9 code:v11 userInfo:0];
    return 0;
  }
  if ([(DYCaptureArchive *)self isReadOnly])
  {
    if (!a5) {
      return 0;
    }
    uint64_t v9 = *MEMORY[0x263F3F9C0];
    uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v11 = 7;
    goto LABEL_7;
  }
  if ([(DYCaptureArchive *)self isClosed]) {
    goto LABEL_13;
  }
  if ((unint64_t)[a3 length] >> 31)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v9 = *MEMORY[0x263F3F9C0];
    uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v11 = 2;
    goto LABEL_7;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dy_dataByCompressingData:error:", a3, a5);
  if (!v13) {
    return 0;
  }
  int64_t v14 = (void *)v13;
  if ([(DYCaptureArchive *)self isClosed])
  {
LABEL_13:
    if (!a5) {
      return 0;
    }
    uint64_t v9 = *MEMORY[0x263F3F9C0];
    uint64_t v10 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v11 = 20;
    goto LABEL_7;
  }
  uint64_t v15 = [(NSString *)[(DYCaptureArchive *)self path] stringByAppendingPathComponent:a4];
  if (!v15) {
    return 0;
  }
  return [v14 writeToFile:v15 options:0 error:a5];
}

- (id)copyAdjunctDataForFilename:(id)a3 error:(id *)a4
{
  if (!a3) {
    __assert_rtn("-[DYCaptureArchive copyAdjunctDataForFilename:error:]", ", 0, "filename != nil"");
  }
  if ([a3 length] && (unint64_t)objc_msgSend((id)objc_msgSend(a3, "pathComponents"), "count") < 2)
  {
    if ([(DYCaptureArchive *)self isClosed])
    {
      if (a4)
      {
        uint64_t v7 = *MEMORY[0x263F3F9C0];
        uint64_t v8 = (void *)MEMORY[0x263F3F9C8];
        uint64_t v9 = 20;
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v11 = [(NSString *)[(DYCaptureArchive *)self path] stringByAppendingPathComponent:a3];
      if (v11)
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v11 options:0 error:a4];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
          char v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dy_decompressData:inMutableData:error:", v13, v10, a4);

          if (v14) {
            return v10;
          }
        }
      }
      else if (a4)
      {
        uint64_t v7 = *MEMORY[0x263F3F9C0];
        uint64_t v8 = (void *)MEMORY[0x263F3F9C8];
        uint64_t v9 = 14;
        goto LABEL_6;
      }
    }
    return 0;
  }
  if (!a4) {
    return 0;
  }
  uint64_t v7 = *MEMORY[0x263F3F9C0];
  uint64_t v8 = (void *)MEMORY[0x263F3F9C8];
  uint64_t v9 = 1;
LABEL_6:
  id v10 = 0;
  *a4 = (id)[v8 errorWithDomain:v7 code:v9 userInfo:0];
  return v10;
}

- (BOOL)adjunctFileExistsForFilename:(id)a3 error:(id *)a4
{
  if (!a3) {
    __assert_rtn("-[DYCaptureArchive adjunctFileExistsForFilename:error:]", ", 0, "filename != nil"");
  }
  if ([a3 length])
  {
    uint64_t v7 = [(NSString *)[(DYCaptureArchive *)self path] stringByAppendingPathComponent:a3];
    id v8 = (id)objc_opt_new();
    return [v8 fileExistsAtPath:v7];
  }
  else
  {
    if (a4) {
      *a4 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:1 userInfo:0];
    }
    return 0;
  }
}

- (BOOL)acceptCaptureVisitor:(id)a3
{
  return 1;
}

- (__CFUUID)uuid
{
  return self->_uuid;
}

- (BOOL)deleteOnClose
{
  return self->_deleteOnClose;
}

- (void)setDeleteOnClose:(BOOL)a3
{
  self->_deleteOnClose = a3;
}

- (void).cxx_destruct
{
  begin = self->_cacheTable.__begin_;
  if (begin)
  {
    self->_cacheTable.__end_ = begin;
    operator delete(begin);
  }
  unsigned int v4 = self->_read_buffer_tokens.__begin_;
  if (v4)
  {
    self->_read_buffer_tokens.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 39) = 0;
  *((void *)self + 37) = 0;
  return self;
}

- (uint64_t)cacheAllResources
{
  id v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](v2, 0);
    MEMORY[0x25335FE80](v2, 0xA0C40AFF93C70);
  }
  return a1;
}

@end