@interface MPSGraphPackage
+ (id)getResourceFileName;
+ (void)readResources:(id)a3 fromURL:(id)a4 usingAllocator:(function_ref<char *)(llvm:(unsigned long)long :(unsigned long)long StringRef;
- (MPSGraphPackage)initWithPackageURL:(id)a3 temporaryPackageURL:(id)a4 append:(BOOL)a5;
- (MPSGraphPackage)initWithSourcePackageURL:(id)a3;
- (MPSGraphPackage)initWithSourcePackageURL:(id)a3 error:(id *)a4;
- (id)createFileHandle;
- (id)findLatestPackage;
- (id)findLatestPackageKey;
- (id)getMLIRLibrary;
- (id)getPackageKeyForPlatform:(unint64_t)a3 andMinimumDeploymentTarget:(optional<MPSGraphOperatingSystemVersion> *)a4;
- (id)getPlistData;
- (id)writeResources:(ArrayRef<mlir::mps::MPSResourceBlobEntry *>)a3;
- (void)createBytecodeFromMlirModule:(ModuleOp)a3 fileHandle:(id)a4 resourceStorageMode:(unint64_t)a5;
- (void)createVersionedBytecodeFromMlirModule:(ModuleOp)a3 packageKey:(id)a4 fileHandle:(id)a5 resourceStorageMode:(unint64_t)a6 downgradedModuleCallback:(function_ref<void)(mlir::mps::serialization::ModuleOp;
- (void)setMLIRLibrary:(id)a3 withPackageKey:(id)a4;
@end

@implementation MPSGraphPackage

- (MPSGraphPackage)initWithSourcePackageURL:(id)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MPSGraphPackage;
  v8 = [(MPSGraphPackage *)&v29 init];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  fileManager = v8->_fileManager;
  v8->_fileManager = (NSFileManager *)v9;

  p_packageURL = (id *)&v8->_packageURL;
  objc_storeStrong((id *)&v8->_packageURL, a3);
  temporaryPackageURL = v8->_temporaryPackageURL;
  v8->_temporaryPackageURL = 0;

  v8->_mlirFileCount = 0;
  char v28 = 0;
  v13 = v8->_fileManager;
  v14 = [(NSURL *)v8->_packageURL path];
  LODWORD(v13) = [(NSFileManager *)v13 fileExistsAtPath:v14 isDirectory:&v28];

  if (!v13)
  {
    if (!a4) {
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v21 = NSString;
    v22 = [*p_packageURL absoluteString];
    v23 = [v21 stringWithFormat:@"Error: did not find file at url: %@", v22];
    v31 = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    *a4 = [v20 errorWithDomain:@"com.apple.mps" code:-19 userInfo:v24];

LABEL_10:
    a4 = 0;
    goto LABEL_11;
  }
  if (!v28)
  {
    if (!a4) {
      goto LABEL_11;
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Error: file is unexpectedly not a directory";
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    *a4 = [v25 errorWithDomain:@"com.apple.mps" code:-19 userInfo:v26];

    goto LABEL_10;
  }
  v15 = [*p_packageURL URLByAppendingPathComponent:@"manifest.plist"];
  v16 = loadPlistAtURL((uint64_t)v15, a4);
  v17 = v16;
  if (!v16)
  {

    goto LABEL_10;
  }
  uint64_t v18 = [v16 mutableCopy];
  plistRoot = v8->_plistRoot;
  v8->_plistRoot = (NSMutableDictionary *)v18;

  a4 = v8;
LABEL_11:

  return (MPSGraphPackage *)a4;
}

- (MPSGraphPackage)initWithSourcePackageURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphPackage;
  id v10 = 0;
  v5 = [[(MPSGraphPackage *)&v11 init] initWithSourcePackageURL:v4 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      [v6 localizedDescription];

      if (MTLReportFailureTypeEnabled())
      {
        uint64_t v9 = [v7 localizedDescription];
        MTLReportFailure();
      }
    }
    else if (MTLReportFailureTypeEnabled())
    {
      MTLReportFailure();
    }
  }

  return v5;
}

- (MPSGraphPackage)initWithPackageURL:(id)a3 temporaryPackageURL:(id)a4 append:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v52 = a4;
  v62.receiver = self;
  v62.super_class = (Class)MPSGraphPackage;
  uint64_t v9 = [(MPSGraphPackage *)&v62 init];
  objc_storeStrong((id *)&v9->_packageURL, a3);
  objc_storeStrong((id *)&v9->_temporaryPackageURL, a4);
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  fileManager = v9->_fileManager;
  v9->_fileManager = (NSFileManager *)v10;

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  plistRoot = v9->_plistRoot;
  v9->_plistRoot = v12;

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSMutableDictionary *)v9->_plistRoot setObject:v14 forKeyedSubscript:@"Package Version"];

  v9->_unint64_t mlirFileCount = 0;
  char v61 = 0;
  v15 = v9->_fileManager;
  v16 = [v52 path];
  LODWORD(v15) = [(NSFileManager *)v15 fileExistsAtPath:v16 isDirectory:&v61];

  if (v15)
  {
    if (v61 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    v17 = v9->_fileManager;
    uint64_t v18 = [v52 path];
    id v60 = 0;
    LOBYTE(v17) = [(NSFileManager *)v17 removeItemAtPath:v18 error:&v60];
    id v50 = v60;

    if ((v17 & 1) == 0 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  else
  {
    id v50 = 0;
  }
  v19 = v9->_fileManager;
  v20 = [v51 path];
  LODWORD(v19) = [(NSFileManager *)v19 fileExistsAtPath:v20 isDirectory:&v61];

  if ((v19 & v5) != 0)
  {
    if (!v61 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    [v51 URLByAppendingPathComponent:@"manifest.plist"];
    v45 = id v59 = 0;
    v21 = loadPlistAtURL((uint64_t)v45, &v59);
    id v22 = v59;
    v48 = v22;
    v49 = v21;
    if (!v21)
    {
      if (v22)
      {
        [v22 localizedDescription];

        if (MTLReportFailureTypeEnabled())
        {
          v43 = [v48 localizedDescription];
          v44 = @"\n";
          MTLReportFailure();
        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }
    uint64_t v23 = objc_msgSend(v21, "mutableCopy", v44);
    v24 = v9->_plistRoot;
    v9->_plistRoot = (NSMutableDictionary *)v23;

    v46 = [(NSFileManager *)v9->_fileManager contentsOfDirectoryAtURL:v51 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:4 error:0];
    v47 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"pathExtension='mpsgraph'"];
    objc_msgSend(v46, "filteredArrayUsingPredicate:");
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v56 != v27) {
            objc_enumerationMutation(v25);
          }
          id v29 = *(id *)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v30 = [v29 lastPathComponent];
          v31 = [v30 stringByDeletingPathExtension];
          uint64_t v32 = [v31 substringFromIndex:6];
          unint64_t v33 = [v32 integerValue];
          unint64_t mlirFileCount = v9->_mlirFileCount;
          if (v33 > mlirFileCount) {
            unint64_t mlirFileCount = v33;
          }
          v9->_unint64_t mlirFileCount = mlirFileCount;
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v26);
    }

    v35 = v9->_fileManager;
    id v54 = v48;
    BOOL v36 = [(NSFileManager *)v35 copyItemAtURL:v51 toURL:v52 error:&v54];
    id v37 = v54;

    if (!v36 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }

    id v38 = v50;
  }
  else
  {
    v39 = v9->_fileManager;
    v40 = [v52 path];
    id v53 = v50;
    BOOL v41 = [(NSFileManager *)v39 createDirectoryAtPath:v40 withIntermediateDirectories:1 attributes:0 error:&v53];
    id v38 = v53;

    if (!v41 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }

  return v9;
}

- (id)getPackageKeyForPlatform:(unint64_t)a3 andMinimumDeploymentTarget:(optional<MPSGraphOperatingSystemVersion> *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (qword_1E8EBF1B0 != -1) {
    dispatch_once(&qword_1E8EBF1B0, &__block_literal_global_2);
  }
  id v6 = (id)_MergedGlobals_3;
  uint64_t v26 = v6;
  if (a3 >= 4)
  {
    if (MTLReportFailureTypeEnabled())
    {
      unint64_t v24 = a3;
      MTLReportFailure();
    }
  }
  else
  {
    int64_t var1 = qword_1811306D0[a3];
    int64_t var0 = qword_1811306F0[a3];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  objc_msgSend(v6, "allKeys", v24);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v7)
  {
    int64_t var2 = 0;
    goto LABEL_40;
  }
  int64_t var2 = 0;
  uint64_t v8 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "componentsSeparatedByString:", @"OS", v25);
      objc_super v11 = [v10 objectAtIndexedSubscript:0];
      v12 = [v11 stringByAppendingString:@"OS"];

      id v13 = v12;
      if ([v13 isEqualToString:@"macOS"])
      {
LABEL_13:
        uint64_t v14 = 0;
        goto LABEL_22;
      }
      if ([v13 isEqualToString:@"iOS"])
      {
        uint64_t v14 = 1;
      }
      else if ([v13 isEqualToString:@"tvOS"])
      {
        uint64_t v14 = 2;
      }
      else if ([v13 isEqualToString:@"visionOS"])
      {
        uint64_t v14 = 3;
      }
      else
      {
        if (!MTLReportFailureTypeEnabled()) {
          goto LABEL_13;
        }
        id v25 = v13;
        MTLReportFailure();
        uint64_t v14 = 0;
      }
LABEL_22:

      if (v14 == a3)
      {
        v15 = [v10 objectAtIndexedSubscript:1];
        MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v32, v15);

        if (v32.var0 > var0 || v32.var0 == var0 && (v32.var1 > var1 || v32.var1 == var1 && v32.var2 > var2))
        {
          if (!a4->var1
            || v32.var0 < a4->var0.var1.var0
            || v32.var0 == a4->var0.var1.var0
            && ((int64_t v16 = a4->var0.var1.var1, v32.var1 < v16) || v32.var1 == v16 && v32.var2 <= a4->var0.var1.var2))
          {
            int64_t var2 = v32.var2;
            int64_t var1 = v32.var1;
            int64_t var0 = v32.var0;
          }
        }
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v7);
LABEL_40:

  v31.int64_t var0 = var0;
  v31.int64_t var1 = var1;
  v31.int64_t var2 = var2;
  id v17 = objc_alloc_init(NSString);
  uint64_t v18 = v17;
  if (a3 >= 4)
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  else
  {
    uint64_t v19 = [v17 stringByAppendingString:off_1E4FC12A8[a3]];

    uint64_t v18 = (void *)v19;
  }
  v20 = MPSGraphOperatingSystemVersion::asString(&v31);
  v21 = [v18 stringByAppendingString:v20];

  id v22 = [v26 objectForKey:v21];
  if (!v22 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }

  return v22;
}

- (void)createVersionedBytecodeFromMlirModule:(ModuleOp)a3 packageKey:(id)a4 fileHandle:(id)a5 resourceStorageMode:(unint64_t)a6 downgradedModuleCallback:(function_ref<void)(mlir::mps::serialization::ModuleOp
{
  state = a3.state;
  id v9 = a4;
  id v10 = a5;
  if (qword_1E8EBF1C0 != -1) {
    dispatch_once(&qword_1E8EBF1C0, &__block_literal_global_133);
  }
  objc_super v11 = [(id)qword_1E8EBF1B8 objectForKey:v9];
  if (!v11 && MTLReportFailureTypeEnabled())
  {
    id v29 = v9;
    MTLReportFailure();
  }
  v12 = objc_msgSend(v11, "objectForKey:", @"kMPSDialect", v29);
  id v13 = [v12 componentsSeparatedByString:@"."];
  [v13 count];
  if ([v13 count] != 3 && MTLReportFailureTypeEnabled())
  {
    uint64_t v30 = v12;
    MTLReportFailure();
  }
  uint64_t v14 = -[NSURL URLByAppendingPathComponent:](self->_temporaryPackageURL, "URLByAppendingPathComponent:", v10, v30);
  id v15 = [v14 path];
  int64_t v16 = (const char *)[v15 cStringUsingEncoding:4];
  size_t v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v18 = v17;
  if (v17 >= 0x17)
  {
    uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v20 = v17 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = operator new(v20 + 1);
    size_t v37 = v18;
    int64_t v38 = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v38) = v17;
    p_dst = &__dst;
    if (!v17)
    {
LABEL_13:
      *((unsigned char *)p_dst + v18) = 0;

      __p = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      if (v38 >= 0) {
        id v22 = &__dst;
      }
      else {
        id v22 = __dst;
      }
      if (v38 >= 0) {
        std::string::size_type v23 = HIBYTE(v38);
      }
      else {
        std::string::size_type v23 = v37;
      }
      mlir::openOutputFile(v22, v23, (uint64_t)&__p, &v32);
      uint64_t v24 = HIBYTE(v35);
      if (v35 < 0) {
        uint64_t v24 = v34;
      }
      if (v24 && MTLReportFailureTypeEnabled())
      {
        if (v35 >= 0) {
          p_p = &__p;
        }
        else {
          p_p = __p;
        }
        MPSGraphOperatingSystemVersion v31 = [NSString stringWithCString:p_p encoding:4];
        MTLReportFailure();
      }
      id v25 = objc_msgSend(v13, "objectAtIndexedSubscript:", 0, v31);
      [v25 intValue];

      uint64_t v26 = [v13 objectAtIndexedSubscript:1];
      [v26 intValue];

      uint64_t v27 = [v13 objectAtIndexedSubscript:2];
      [v27 intValue];

      mlir::Op<mlir::ModuleOp,mlir::OpTrait::OneRegion,mlir::OpTrait::ZeroResults,mlir::OpTrait::ZeroSuccessors,mlir::OpTrait::ZeroOperands,mlir::OpTrait::NoRegionArguments,mlir::OpTrait::NoTerminator,mlir::OpTrait::SingleBlock,mlir::OpTrait::OpInvariants,mlir::BytecodeOpInterface::Trait,mlir::OpTrait::AffineScope,mlir::OpTrait::IsIsolatedFromAbove,mlir::OpTrait::SymbolTable,mlir::SymbolOpInterface::Trait,mlir::OpAsmOpInterface::Trait,mlir::RegionKindInterface::Trait,mlir::OpTrait::HasOnlyGraphRegion>::clone((mlir::Operation::CloneOptions *)&state);
    }
  }
  memmove(p_dst, v16, v18);
  goto LABEL_13;
}

- (void)createBytecodeFromMlirModule:(ModuleOp)a3 fileHandle:(id)a4 resourceStorageMode:(unint64_t)a5
{
  uint64_t v7 = [(NSURL *)self->_temporaryPackageURL URLByAppendingPathComponent:a4];
  id v8 = [v7 path];
  id v9 = (const char *)[v8 cStringUsingEncoding:4];
  size_t v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    p_dst = operator new(v13 + 1);
    size_t v27 = v11;
    int64_t v28 = v14 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v28) = v10;
    p_dst = &__dst;
    if (!v10)
    {
LABEL_9:
      *((unsigned char *)p_dst + v11) = 0;

      __p = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      if (v28 >= 0) {
        id v15 = &__dst;
      }
      else {
        id v15 = __dst;
      }
      if (v28 >= 0) {
        std::string::size_type v16 = HIBYTE(v28);
      }
      else {
        std::string::size_type v16 = v27;
      }
      mlir::openOutputFile(v15, v16, (uint64_t)&__p, &v22);
      uint64_t v17 = HIBYTE(v25);
      if (v25 < 0) {
        uint64_t v17 = v24;
      }
      if (v17 && MTLReportFailureTypeEnabled())
      {
        if (v25 >= 0) {
          p_p = &__p;
        }
        else {
          p_p = __p;
        }
        uint64_t v20 = [NSString stringWithCString:p_p encoding:4];
        MTLReportFailure();
      }
      mlir::BytecodeWriterConfig::BytecodeWriterConfig(&v21, (uint64_t)"MLIR18.0.0git", 13);
      if (a5 == 1) {
        mlir::BytecodeWriterConfig::setElideResourceDataFlag((uint64_t)&v21, 1);
      }
      mlir::writeBytecodeToFile(a3.state, *((mlir::Operation **)v22 + 17), (llvm::raw_ostream *)&v21, v18);
    }
  }
  memmove(p_dst, v9, v11);
  goto LABEL_9;
}

- (id)createFileHandle
{
  v3 = NSString;
  unint64_t mlirFileCount = self->_mlirFileCount;
  self->_unint64_t mlirFileCount = mlirFileCount + 1;
  BOOL v5 = objc_msgSend(v3, "stringWithFormat:", @"model_%lu.mpsgraph", mlirFileCount);
  id v6 = [(NSURL *)self->_packageURL URLByAppendingPathComponent:v5];
  fileManager = self->_fileManager;
  id v8 = [v6 path];
  [(NSFileManager *)fileManager fileExistsAtPath:v8];

  id v9 = self->_fileManager;
  size_t v10 = [v6 path];
  LODWORD(v9) = [(NSFileManager *)v9 fileExistsAtPath:v10];

  if (v9 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }

  return v5;
}

+ (id)getResourceFileName
{
  return @"resources.bin";
}

- (id)writeResources:(ArrayRef<mlir::mps::MPSResourceBlobEntry *>)a3
{
  unint64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v107[60] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a3.var1];
  uint64_t v7 = v6;
  if (!var1)
  {
    id v16 = v6;
    goto LABEL_128;
  }
  v105 = v107;
  uint64_t v106 = 0xA00000000;
  if (var1 >= 0xB)
  {
    __dst = 0;
    id v8 = (char *)llvm::SmallVectorBase<unsigned int>::mallocForGrow((uint64_t)&v105, v107, var1, 48, (unint64_t *)&__dst);
    id v9 = v8;
    size_t v10 = (char *)v105;
    if (v106)
    {
      size_t v11 = (char *)v105 + 48 * v106;
      v12 = v8;
      do
      {
        long long v13 = *(_OWORD *)v10;
        *((void *)v12 + 2) = *((void *)v10 + 2);
        *(_OWORD *)v12 = v13;
        *((void *)v10 + 1) = 0;
        *((void *)v10 + 2) = 0;
        *(void *)size_t v10 = 0;
        long long v14 = *(_OWORD *)(v10 + 24);
        *((void *)v12 + 5) = *((void *)v10 + 5);
        *(_OWORD *)(v12 + 24) = v14;
        v10 += 48;
        v12 += 48;
      }
      while (v10 != v11);
      size_t v10 = (char *)v105;
      if (v106)
      {
        uint64_t v15 = 48 * v106;
        do
        {
          if (v10[v15 - 25] < 0) {
            operator delete(*(void **)&v10[v15 - 48]);
          }
          v15 -= 48;
        }
        while (v15);
        size_t v10 = (char *)v105;
      }
    }
    int v17 = (int)__dst;
    if (v10 != (char *)v107) {
      free(v10);
    }
    v105 = v9;
    HIDWORD(v106) = v17;
  }
  v90 = v7;
  size_t v18 = &var0[var1];
  do
  {
    uint64_t v19 = *var0;
    if (!*((unsigned char *)*var0 + 80)) {
      __assert_rtn("-[MPSGraphPackage writeResources:]", "MPSGraphComputePackage.mm", 601, "blob");
    }
    size_t v20 = *((void *)v19 + 1);
    if (v20 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    uint64_t v21 = *(const void **)v19;
    long long v91 = *((_OWORD *)v19 + 1);
    uint64_t v22 = *((void *)v19 + 4);
    if (v20 >= 0x17)
    {
      uint64_t v24 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v20 | 7) != 0x17) {
        uint64_t v24 = v20 | 7;
      }
      uint64_t v25 = v24 + 1;
      p_dst = (void **)operator new(v24 + 1);
      v101 = (void *)v20;
      int64_t v102 = v25 | 0x8000000000000000;
      __dst = p_dst;
LABEL_26:
      memmove(p_dst, v21, v20);
      goto LABEL_27;
    }
    HIBYTE(v102) = *((void *)v19 + 1);
    p_dst = (void **)&__dst;
    if (v20) {
      goto LABEL_26;
    }
LABEL_27:
    *((unsigned char *)p_dst + v20) = 0;
    long long v103 = v91;
    uint64_t v104 = v22;
    uint64_t v26 = v105;
    if (v106 >= HIDWORD(v106))
    {
      unint64_t v32 = v106 + 1;
      if (v105 <= &__dst && (char *)v105 + 48 * v106 > (char *)&__dst)
      {
        v98[0] = 0;
        BOOL v41 = (char *)llvm::SmallVectorBase<unsigned int>::mallocForGrow((uint64_t)&v105, v107, v32, 48, (unint64_t *)v98);
        int64_t v28 = v41;
        v42 = (char *)v105;
        if (v106)
        {
          v43 = (char *)v105 + 48 * v106;
          v44 = v41;
          do
          {
            long long v45 = *(_OWORD *)v42;
            *((void *)v44 + 2) = *((void *)v42 + 2);
            *(_OWORD *)v44 = v45;
            *((void *)v42 + 1) = 0;
            *((void *)v42 + 2) = 0;
            *(void *)v42 = 0;
            long long v46 = *(_OWORD *)(v42 + 24);
            *((void *)v44 + 5) = *((void *)v42 + 5);
            *(_OWORD *)(v44 + 24) = v46;
            v42 += 48;
            v44 += 48;
          }
          while (v42 != v43);
          v42 = (char *)v105;
          if (v106)
          {
            uint64_t v47 = 48 * v106;
            do
            {
              if (v42[v47 - 25] < 0) {
                operator delete(*(void **)&v42[v47 - 48]);
              }
              v47 -= 48;
            }
            while (v47);
            v42 = (char *)v105;
          }
        }
        int v48 = (int)v98[0];
        if (v42 != (char *)v107) {
          free(v42);
        }
        v105 = v28;
        HIDWORD(v106) = v48;
        size_t v27 = (void **)&v28[16 * (((char *)&__dst - v26) >> 4)];
      }
      else
      {
        v98[0] = 0;
        long long v33 = (char *)llvm::SmallVectorBase<unsigned int>::mallocForGrow((uint64_t)&v105, v107, v32, 48, (unint64_t *)v98);
        int64_t v28 = v33;
        uint64_t v34 = (char *)v105;
        if (v106)
        {
          uint64_t v35 = (char *)v105 + 48 * v106;
          long long v36 = v33;
          do
          {
            long long v37 = *(_OWORD *)v34;
            *((void *)v36 + 2) = *((void *)v34 + 2);
            *(_OWORD *)long long v36 = v37;
            *((void *)v34 + 1) = 0;
            *((void *)v34 + 2) = 0;
            *(void *)uint64_t v34 = 0;
            long long v38 = *(_OWORD *)(v34 + 24);
            *((void *)v36 + 5) = *((void *)v34 + 5);
            *(_OWORD *)(v36 + 24) = v38;
            v34 += 48;
            v36 += 48;
          }
          while (v34 != v35);
          uint64_t v34 = (char *)v105;
          if (v106)
          {
            uint64_t v39 = 48 * v106;
            do
            {
              if (v34[v39 - 25] < 0) {
                operator delete(*(void **)&v34[v39 - 48]);
              }
              v39 -= 48;
            }
            while (v39);
            uint64_t v34 = (char *)v105;
          }
        }
        int v40 = (int)v98[0];
        if (v34 != (char *)v107) {
          free(v34);
        }
        v105 = v28;
        HIDWORD(v106) = v40;
        size_t v27 = (void **)&__dst;
      }
    }
    else
    {
      size_t v27 = (void **)&__dst;
      int64_t v28 = (char *)v105;
    }
    id v29 = &v28[48 * v106];
    long long v30 = *(_OWORD *)v27;
    *((void *)v29 + 2) = v27[2];
    *(_OWORD *)id v29 = v30;
    v27[1] = 0;
    v27[2] = 0;
    *size_t v27 = 0;
    long long v31 = *(_OWORD *)(v27 + 3);
    *((void *)v29 + 5) = v27[5];
    *(_OWORD *)(v29 + 24) = v31;
    if (v106 >= HIDWORD(v106)) {
      __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
    }
    LODWORD(v106) = v106 + 1;
    if (SHIBYTE(v102) < 0) {
      operator delete(__dst);
    }
    ++var0;
  }
  while (var0 != v18);
  temporaryPackageURL = self->_temporaryPackageURL;
  id v50 = +[MPSGraphPackage getResourceFileName];
  id v51 = [(NSURL *)temporaryPackageURL URLByAppendingPathComponent:v50];
  id v52 = [v51 path];
  id v53 = (const char *)[v52 cStringUsingEncoding:4];
  size_t v54 = strlen(v53);
  if (v54 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v55 = v54;
  if (v54 >= 0x17)
  {
    uint64_t v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v54 | 7) != 0x17) {
      uint64_t v57 = v54 | 7;
    }
    uint64_t v58 = v57 + 1;
    long long v56 = (void **)operator new(v57 + 1);
    v101 = (void *)v55;
    int64_t v102 = v58 | 0x8000000000000000;
    __dst = v56;
    goto LABEL_65;
  }
  HIBYTE(v102) = v54;
  long long v56 = (void **)&__dst;
  if (v54) {
LABEL_65:
  }
    memmove(v56, v53, v55);
  uint64_t v7 = v90;
  *((unsigned char *)v56 + v55) = 0;

  v98[0] = 0;
  v98[1] = 0;
  uint64_t v99 = 0;
  v95 = 0;
  uint64_t v96 = 0;
  uint64_t v97 = 0x1000000000;
  if (v102 >= 0) {
    id v59 = (void **)&__dst;
  }
  else {
    id v59 = __dst;
  }
  if (v102 >= 0) {
    id v60 = (void *)HIBYTE(v102);
  }
  else {
    id v60 = v101;
  }
  __p = v105;
  size_t v93 = v106;
  if ((support::ResourceStorage::add(v59, v60, (long long **)&__p, (uint64_t)&v95, (uint64_t)v98) & 1) == 0
    && MTLReportFailureTypeEnabled())
  {
    if (v99 >= 0) {
      v88 = v98;
    }
    else {
      v88 = (void **)v98[0];
    }
    v89 = [NSString stringWithCString:v88 encoding:4];
    MTLReportFailure();
  }
  if (v96)
  {
    char v61 = (char *)v95;
    if (*(void *)v95) {
      BOOL v62 = *(void *)v95 == -8;
    }
    else {
      BOOL v62 = 1;
    }
    if (v62)
    {
      do
      {
        uint64_t v64 = *((void *)v61 + 1);
        v61 += 8;
        uint64_t v63 = v64;
        if (v64) {
          BOOL v65 = v63 == -8;
        }
        else {
          BOOL v65 = 1;
        }
      }
      while (v65);
    }
    v66 = (char *)v95 + 8 * v96;
    if (v61 != v66)
    {
      v67 = *(size_t **)v61;
      unint64_t v68 = 0x1E4F29000uLL;
      do
      {
        size_t v69 = *v67;
        if (*v67 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        v70 = *(void **)(v68 + 24);
        if (v69 >= 0x17)
        {
          unint64_t v72 = v68;
          uint64_t v73 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v69 | 7) != 0x17) {
            uint64_t v73 = v69 | 7;
          }
          uint64_t v74 = v73 + 1;
          p_p = operator new(v73 + 1);
          size_t v93 = v69;
          int64_t v94 = v74 | 0x8000000000000000;
          __p = p_p;
          unint64_t v68 = v72;
        }
        else
        {
          HIBYTE(v94) = *v67;
          p_p = &__p;
          if (!v69) {
            goto LABEL_95;
          }
        }
        memmove(p_p, v67 + 2, v69);
LABEL_95:
        uint64_t v7 = v90;
        *((unsigned char *)p_p + v69) = 0;
        if (v94 >= 0) {
          v75 = &__p;
        }
        else {
          v75 = __p;
        }
        v76 = objc_msgSend(v70, "stringWithCString:encoding:", v75, 4, v89);
        if (SHIBYTE(v94) < 0) {
          operator delete(__p);
        }
        v77 = [NSNumber numberWithUnsignedLongLong:v67[1]];
        [v90 setObject:v77 forKeyedSubscript:v76];

        do
        {
          v78 = (size_t *)*((void *)v61 + 1);
          v61 += 8;
          v67 = v78;
          if (v78) {
            BOOL v79 = v67 + 1 == 0;
          }
          else {
            BOOL v79 = 1;
          }
        }
        while (v79);
      }
      while (v61 != v66);
    }
  }
  id v80 = v7;
  if (HIDWORD(v96) && v96)
  {
    uint64_t v81 = 0;
    do
    {
      v82 = *(llvm **)((char *)v95 + v81);
      if (v82 != (llvm *)-8 && v82 != 0) {
        llvm::deallocate_buffer(v82, (void *)(*(void *)v82 + 17));
      }
      v81 += 8;
    }
    while (8 * v96 != v81);
  }
  free(v95);
  if ((SHIBYTE(v99) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v102) & 0x80000000) == 0) {
      goto LABEL_117;
    }
LABEL_125:
    operator delete(__dst);
    v84 = (char *)v105;
    uint64_t v85 = v106;
    if (!v106) {
      goto LABEL_126;
    }
LABEL_118:
    uint64_t v86 = 48 * v85;
    do
    {
      if (v84[v86 - 25] < 0) {
        operator delete(*(void **)&v84[v86 - 48]);
      }
      v86 -= 48;
    }
    while (v86);
    v84 = (char *)v105;
    if (v105 == v107) {
      goto LABEL_128;
    }
LABEL_127:
    free(v84);
    goto LABEL_128;
  }
  operator delete(v98[0]);
  if (SHIBYTE(v102) < 0) {
    goto LABEL_125;
  }
LABEL_117:
  v84 = (char *)v105;
  uint64_t v85 = v106;
  if (v106) {
    goto LABEL_118;
  }
LABEL_126:
  if (v84 != (char *)v107) {
    goto LABEL_127;
  }
LABEL_128:

  return v7;
}

+ (void)readResources:(id)a3 fromURL:(id)a4 usingAllocator:(function_ref<char *)(llvm:(unsigned long)long :(unsigned long)long StringRef
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v46 = v6;
  if ([v6 count])
  {
    id v44 = v7;
    id v8 = [v7 path];
    id v9 = (const char *)[v8 cStringUsingEncoding:4];
    size_t v10 = strlen(v9);
    if (v10 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v11 = v10;
    if (v10 >= 0x17)
    {
      uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17) {
        uint64_t v13 = v10 | 7;
      }
      uint64_t v14 = v13 + 1;
      p_dst = (void **)operator new(v13 + 1);
      id v60 = (uint64_t *)v11;
      int64_t v61 = v14 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v61) = v10;
      p_dst = (void **)&__dst;
      if (!v10)
      {
LABEL_10:
        *((unsigned char *)p_dst + v11) = 0;

        __p[0] = 0;
        __p[1] = 0;
        uint64_t v58 = 0;
        size_t v54 = 0;
        uint64_t v55 = 0;
        uint64_t v56 = 0x1000000000;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v15 = v6;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v64 count:16];
        if (v16)
        {
          id v47 = v15;
          uint64_t v48 = *(void *)v51;
          do
          {
            uint64_t v17 = 0;
            uint64_t v49 = v16;
            do
            {
              if (*(void *)v51 != v48) {
                objc_enumerationMutation(v15);
              }
              size_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * v17);
              uint64_t v19 = [v15 objectForKeyedSubscript:v18];
              uint64_t v20 = [v19 unsignedLongLongValue];
              uint64_t v21 = (const char *)[v18 UTF8String];
              uint64_t v22 = (int8x16_t *)v21;
              if (v21) {
                std::string::size_type v23 = (const unsigned __int8 *)strlen(v21);
              }
              else {
                std::string::size_type v23 = 0;
              }
              uint64_t v24 = llvm::StringMapImpl::LookupBucketFor((uint64_t *)&v54, v22, v23);
              uint64_t v25 = v54;
              uint64_t v26 = *((void *)v54 + v24);
              if (v26 == -8)
              {
                LODWORD(v56) = v56 - 1;
              }
              else if (v26)
              {
                goto LABEL_20;
              }
              buffer = llvm::allocate_buffer((size_t)(v23 + 17), (std::align_val_t)8uLL);
              int64_t v28 = (const unsigned __int8 **)buffer;
              id v29 = (char *)(buffer + 2);
              if (v23) {
                memcpy(buffer + 2, v22, (size_t)v23);
              }
              v23[(void)v29] = 0;
              *int64_t v28 = v23;
              v28[1] = 0;
              v25[v24] = v28;
              ++HIDWORD(v55);
              if ((int)v56 + HIDWORD(v55) > v55) {
                __assert_rtn("try_emplace", "StringMap.h", 353, "NumItems + NumTombstones <= NumBuckets");
              }
              id v15 = v47;
              unsigned int v30 = llvm::StringMapImpl::RehashTable((llvm::StringMapImpl *)&v54, v24);
              long long v31 = (uint64_t *)((char *)v54 + 8 * v30);
              uint64_t v26 = *v31;
              if (*v31) {
                BOOL v32 = v26 == -8;
              }
              else {
                BOOL v32 = 1;
              }
              if (v32)
              {
                do
                {
                  uint64_t v33 = v31[1];
                  ++v31;
                  uint64_t v26 = v33;
                  if (v33) {
                    BOOL v34 = v26 == -8;
                  }
                  else {
                    BOOL v34 = 1;
                  }
                }
                while (v34);
              }
LABEL_20:
              *(void *)(v26 + 8) = v20;

              ++v17;
            }
            while (v17 != v49);
            uint64_t v35 = [v15 countByEnumeratingWithState:&v50 objects:v64 count:16];
            uint64_t v16 = v35;
          }
          while (v35);
        }

        if (v61 >= 0) {
          long long v36 = (uint64_t **)&__dst;
        }
        else {
          long long v36 = (uint64_t **)__dst;
        }
        if (v61 >= 0) {
          long long v37 = (uint64_t *)HIBYTE(v61);
        }
        else {
          long long v37 = v60;
        }
        if (!support::ResourceStorage::read(v36, v37, (uint64_t)&v54, (uint64_t (*)(uint64_t, uint64_t, uint64_t, size_t, unint64_t))a5.var0, a5.var1, (uint64_t)__p))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v42 = __p;
            if (v58 < 0) {
              v42 = (void **)__p[0];
            }
            *(_DWORD *)buf = 136315138;
            uint64_t v63 = v42;
            _os_log_error_impl(&dword_180159000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
          }
          if (MTLReportFailureTypeEnabled())
          {
            if (v58 >= 0) {
              long long v38 = __p;
            }
            else {
              long long v38 = (void **)__p[0];
            }
            v43 = [NSString stringWithCString:v38 encoding:4];
            MTLReportFailure();
          }
        }
        if (HIDWORD(v55) && v55)
        {
          uint64_t v39 = 0;
          do
          {
            int v40 = *(llvm **)((char *)v54 + v39);
            if (v40 != (llvm *)-8 && v40 != 0) {
              llvm::deallocate_buffer(v40, (void *)(*(void *)v40 + 17));
            }
            v39 += 8;
          }
          while (8 * v55 != v39);
        }
        free(v54);
        if (SHIBYTE(v58) < 0)
        {
          operator delete(__p[0]);
          id v7 = v44;
          if ((SHIBYTE(v61) & 0x80000000) == 0) {
            goto LABEL_61;
          }
        }
        else
        {
          id v7 = v44;
          if ((SHIBYTE(v61) & 0x80000000) == 0) {
            goto LABEL_61;
          }
        }
        operator delete(__dst);
        goto LABEL_61;
      }
    }
    memmove(p_dst, v9, v11);
    goto LABEL_10;
  }
LABEL_61:
}

- (void)setMLIRLibrary:(id)a3 withPackageKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(MPSGraphPackage *)self getMLIRLibrary];
  [v7 updateWithMLIRLibrary:v10];
  id v8 = [v7 getDict];
  id v9 = [(NSMutableDictionary *)self->_plistRoot objectForKeyedSubscript:@"Package Version"];
  [v9 setObject:v8 forKeyedSubscript:v6];
}

- (id)findLatestPackageKey
{
  v2 = [(NSMutableDictionary *)self->_plistRoot objectForKeyedSubscript:@"Package Version"];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MPSGraphPackage_findLatestPackageKey__block_invoke;
  v5[3] = &unk_1E4FC1288;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__MPSGraphPackage_findLatestPackageKey__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v16, v4);
  if (v16.var0 < 4 || (v16.var0 == 4 ? (v5 = v16.var1 == 0) : (v5 = 0), v5 ? (BOOL v6 = v16.var2 <= 20) : (BOOL v6 = 0), v6))
  {
    *(_OWORD *)&v16.int64_t var0 = xmmword_1811306C0;
    v16.int64_t var2 = 21;
  }
  id v7 = [NSString stringWithUTF8String:"5.2.3"];
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v15, v7);
  if (v15.var0 < 4 || *(_OWORD *)&v15.var0 == 4 && v15.var2 <= 20)
  {
    *(_OWORD *)&v15.int64_t var0 = xmmword_1811306C0;
    v15.int64_t var2 = 21;
  }

  if (v16.var0 < v15.var0
    || v16.var0 == v15.var0 && (v16.var1 < v15.var1 || v16.var1 == v15.var1 && v16.var2 <= v15.var2))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = *(NSString **)(v8 + 40);
    id v9 = (id *)(v8 + 40);
    id v10 = v11;
    if (!v11)
    {
LABEL_31:
      objc_storeStrong(v9, a2);
      goto LABEL_32;
    }
    MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v15, v10);
    int64_t var0 = v15.var0;
    if (v15.var0 < 4 || (var1 = v15.var1, int64_t var2 = v15.var2, *(_OWORD *)&v15.var0 == 4) && v15.var2 <= 20)
    {
      int64_t var1 = 0;
      int64_t var0 = 4;
      int64_t var2 = 21;
    }
    if (v16.var0 > var0 || v16.var0 == var0 && (v16.var1 > var1 || v16.var1 == var1 && v16.var2 > var2))
    {
      id v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      goto LABEL_31;
    }
  }
LABEL_32:
}

- (id)findLatestPackage
{
  id v3 = [(NSMutableDictionary *)self->_plistRoot objectForKeyedSubscript:@"Package Version"];
  if (v3)
  {
    id v4 = [(MPSGraphPackage *)self findLatestPackageKey];
    BOOL v5 = [v3 objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)getMLIRLibrary
{
  v2 = [(MPSGraphPackage *)self findLatestPackage];
  if (v2) {
    id v3 = [[MPSGraphPackageMLIRLibrary alloc] initWithMLIRLibraryDict:v2];
  }
  else {
    id v3 = objc_alloc_init(MPSGraphPackageMLIRLibrary);
  }
  id v4 = v3;

  return v4;
}

- (id)getPlistData
{
  plistRoot = self->_plistRoot;
  id v6 = 0;
  id v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:plistRoot format:100 options:0 error:&v6];
  id v4 = v6;
  if (!v3 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistRoot, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_temporaryPackageURL, 0);

  objc_storeStrong((id *)&self->_packageURL, 0);
}

@end