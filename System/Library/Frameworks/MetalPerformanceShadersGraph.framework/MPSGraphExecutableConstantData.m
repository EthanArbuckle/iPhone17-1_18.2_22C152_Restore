@interface MPSGraphExecutableConstantData
+ (BOOL)supportsSecureCoding;
- (MPSGraphExecutableConstantData)initWithCoder:(id)a3;
- (NSDictionary)ioSurfaces;
- (NSURL)mpsgraphPackageURL;
- (id)initForRequest:(id)a3;
- (uint64_t)loadResources:;
- (void)encodeWithCoder:(id)a3;
- (void)extendWithRequest:(id)a3;
- (void)loadIntoResourceManager:(void *)a3;
- (void)loadResources:(id)a3;
- (void)setIoSurfaces:(id)a3;
- (void)setMpsgraphPackageURL:(id)a3;
@end

@implementation MPSGraphExecutableConstantData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPSGraphExecutableConstantData)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[MPSGraphExecutableConstantData initWithCoder:]", "MPSGraphConstantData.mm", 27, "[coder allowsKeyedCoding]");
  }
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphExecutableConstantData;
  v5 = [(MPSGraphExecutableConstantData *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mpsgraphPackageURL"];
    [(MPSGraphExecutableConstantData *)v5 setMpsgraphPackageURL:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"ioSurfaces"];
    [(MPSGraphExecutableConstantData *)v5 setIoSurfaces:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[MPSGraphExecutableConstantData encodeWithCoder:]", "MPSGraphConstantData.mm", 39, "[coder allowsKeyedCoding]");
  }
  id v4 = [(MPSGraphExecutableConstantData *)self mpsgraphPackageURL];
  [v6 encodeObject:v4 forKey:@"mpsgraphPackageURL"];

  v5 = [(MPSGraphExecutableConstantData *)self ioSurfaces];
  [v6 encodeObject:v5 forKey:@"ioSurfaces"];
}

- (void)loadResources:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [v19 resourceOffsets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v10 = [(NSDictionary *)self->_ioSurfaces objectForKeyedSubscript:v9];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          v12 = [v19 resourceOffsets];
          objc_super v13 = [v12 objectForKeyedSubscript:v9];
          [v4 setObject:v13 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  p_ioSurfaces = &self->_ioSurfaces;
  v15 = (void *)[(NSDictionary *)self->_ioSurfaces mutableCopy];
  p_id obj = &obj;
  id obj = v15;
  mpsgraphPackageURL = self->_mpsgraphPackageURL;
  v17 = +[MPSGraphPackage getResourceFileName];
  v18 = [(NSURL *)mpsgraphPackageURL URLByAppendingPathComponent:v17];

  +[MPSGraphPackage readResources:fromURL:usingAllocator:](MPSGraphPackage, "readResources:fromURL:usingAllocator:", v4, v18, llvm::function_ref<char * ()(llvm::StringRef,unsigned long long,unsigned long long)>::callback_fn<-[MPSGraphExecutableConstantData loadResources:]::$_0>, &p_obj);
  objc_storeStrong((id *)p_ioSurfaces, obj);
}

- (id)initForRequest:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphExecutableConstantData;
  v5 = [(MPSGraphExecutableConstantData *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 mpsgraphPackageURL];
    mpsgraphPackageURL = v5->_mpsgraphPackageURL;
    v5->_mpsgraphPackageURL = (NSURL *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    ioSurfaces = v5->_ioSurfaces;
    v5->_ioSurfaces = (NSDictionary *)v8;

    [(MPSGraphExecutableConstantData *)v5 loadResources:v4];
    v10 = v5;
  }

  return v5;
}

- (void)loadIntoResourceManager:(void *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    __assert_rtn("-[MPSGraphExecutableConstantData loadIntoResourceManager:]", "MPSGraphConstantData.mm", 89, "resourceManager");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = self->_ioSurfaces;
  uint64_t v3 = [(NSDictionary *)obj countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v7 = [(NSDictionary *)self->_ioSurfaces objectForKeyedSubscript:v6];
        uint64_t v8 = [v7 baseAddress];
        uint64_t v9 = [v7 allocationSize];
        v10 = (const char *)[v6 UTF8String];
        BOOL v11 = (int8x16_t *)v10;
        if (v10) {
          objc_super v12 = (const unsigned __int8 *)strlen(v10);
        }
        else {
          objc_super v12 = 0;
        }
        uint64_t v13 = [v7 bytesPerElement];
        unint64_t v27 = (unint64_t)llvm::detail::UniqueFunctionBase<void,void *,unsigned long,unsigned long>::CallbacksHolder<-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,void>::Callbacks
            + 2;
        *(void *)&long long v28 = v8;
        *((void *)&v28 + 1) = v9;
        uint64_t v29 = v13;
        unint64_t v32 = (unint64_t)llvm::detail::UniqueFunctionBase<void,void *,unsigned long,unsigned long>::CallbacksHolder<-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,void>::Callbacks
            + 2;
        if ((unint64_t)llvm::detail::UniqueFunctionBase<void,void *,unsigned long,unsigned long>::CallbacksHolder<-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,void>::Callbacks
           + 2 >= 8)
        {
          long long v30 = *(_OWORD *)v26;
          unint64_t v31 = *(void *)&v26[16];
          memset(v26, 173, sizeof(v26));
          unint64_t v27 = 0;
        }
        char v33 = 0;
        mlir::mps::MPSResourceBlobManagerInterface::defineEntryValue((uint64_t)a3, v11, v12, &v28);
        if (v32 >= 8)
        {
          v14 = (v32 & 2) != 0 ? &v30 : (long long *)v30;
          (*(void (**)(long long *))(v32 & 0xFFFFFFFFFFFFFFF8))(v14);
          char v15 = v32;
          if (v32 >= 8)
          {
            if ((v32 & 4) != 0)
            {
              if ((v32 & 2) != 0) {
                v16 = &v30;
              }
              else {
                v16 = (long long *)v30;
              }
              (*(void (**)(long long *))((v32 & 0xFFFFFFFFFFFFFFF8) + 16))(v16);
            }
            if ((v15 & 2) == 0) {
              llvm::deallocate_buffer((llvm *)v30, *((void **)&v30 + 1));
            }
          }
        }
        char v17 = v27;
        if (v27 >= 8)
        {
          if ((v27 & 4) != 0)
          {
            if ((v27 & 2) != 0) {
              v18 = v26;
            }
            else {
              v18 = *(unsigned char **)v26;
            }
            (*(void (**)(unsigned char *))((v27 & 0xFFFFFFFFFFFFFFF8) + 16))(v18);
          }
          if ((v17 & 2) == 0) {
            llvm::deallocate_buffer(*(llvm **)v26, *(void **)&v26[8]);
          }
        }
      }
      uint64_t v3 = [(NSDictionary *)obj countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v3);
  }
}

- (void)extendWithRequest:(id)a3
{
  id v6 = a3;
  [v6 mpsgraphPackageURL];

  uint64_t v4 = [v6 mpsgraphPackageURL];
  mpsgraphPackageURL = self->_mpsgraphPackageURL;

  if (v4 != mpsgraphPackageURL && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  [(MPSGraphExecutableConstantData *)self loadResources:v6];
}

- (NSURL)mpsgraphPackageURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMpsgraphPackageURL:(id)a3
{
}

- (NSDictionary)ioSurfaces
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIoSurfaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioSurfaces, 0);

  objc_storeStrong((id *)&self->_mpsgraphPackageURL, 0);
}

- (uint64_t)loadResources:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F2EF08];
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a4];
  v27[0] = v9;
  v26[1] = *MEMORY[0x1E4F2EF10];
  v10 = [NSNumber numberWithUnsignedLongLong:a5];
  v27[1] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4F2EF78]) initWithProperties:v11];
  uint64_t v13 = **a1;
  v14 = NSString;
  if (!a2)
  {
    __p = 0;
    size_t v24 = 0;
    p_p = &__p;
    int64_t v25 = 0;
    goto LABEL_14;
  }
  if (a3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a3 >= 0x17)
  {
    uint64_t v17 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v17 = a3 | 7;
    }
    uint64_t v18 = v17 + 1;
    char v15 = operator new(v17 + 1);
    size_t v24 = a3;
    int64_t v25 = v18 | 0x8000000000000000;
    __p = v15;
    goto LABEL_10;
  }
  HIBYTE(v25) = a3;
  char v15 = &__p;
  if (a3) {
LABEL_10:
  }
    memmove(v15, a2, a3);
  *((unsigned char *)v15 + a3) = 0;
  if (v25 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
LABEL_14:
  id v19 = objc_msgSend(v14, "stringWithUTF8String:", p_p, __p, v24, v25);
  [v13 setObject:v12 forKeyedSubscript:v19];

  if (SHIBYTE(v25) < 0) {
    operator delete(__p);
  }
  id v20 = v12;
  uint64_t v21 = [v20 baseAddress];

  return v21;
}

@end