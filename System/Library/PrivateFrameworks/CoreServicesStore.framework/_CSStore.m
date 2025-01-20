@interface _CSStore
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (void)initialize;
- (BOOL)isReadOnly;
- (_CSStore)init;
- (_CSStore)initWithCoder:(id)a3;
- (_CSStore)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (_CSStore)initWithError:(id *)a3;
- (id).cxx_construct;
- (id)description;
- (id)initByMovingStore:(void *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessContext:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setUnitIdentifierExhaustionHandler:(id)a3;
@end

@implementation _CSStore

- (void)setUnitIdentifierExhaustionHandler:(id)a3
{
  id v4 = a3;
  if (performMutatingAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (**(void (***)(CSStoreAccessContextInterface *))accessContext->_impl.__ptr_)(accessContext->_impl.__ptr_);
      if (performMutatingAssertions)
      {
        v6 = self->_accessContext;
        if (v6) {
          (**(void (***)(CSStoreAccessContextInterface *))v6->_impl.__ptr_)(v6->_impl.__ptr_);
        }
      }
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47___CSStore_setUnitIdentifierExhaustionHandler___block_invoke;
  v11[3] = &unk_1E5D2A6B8;
  id v7 = v4;
  id v12 = v7;
  v8 = v11;
  v9 = (void *)[v8 copy];
  id unitIdentifierExhaustionHandler = self->_store.unitIdentifierExhaustionHandler;
  self->_store.id unitIdentifierExhaustionHandler = v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessContext, 0);

  dataContainer = self->_store.dataContainer;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = getenv("CS_ENABLE_IO_LOGGING");
    if (v2)
    {
      v3 = [NSString stringWithUTF8String:v2];
      int v4 = [v3 BOOLValue];

      if (v4) {
        CSStore2::Writer::logIO = 1;
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isReadOnly
{
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(void *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_, a2);
      if (performConstantAssertions)
      {
        int v4 = self->_accessContext;
        if (v4) {
          (*(void (**)(CSStoreAccessContextInterface *))(*(void *)v4->_impl.__ptr_ + 8))(v4->_impl.__ptr_);
        }
      }
    }
  }
  return *(unsigned char *)&self->_store.flags & 1;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 320) = 0;
  *((unsigned char *)self + 324) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 1) = 0;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *((_OWORD *)self + 1) = v2;
  *((_OWORD *)self + 2) = v2;
  *((_OWORD *)self + 3) = v2;
  *((_OWORD *)self + 4) = v2;
  *((_OWORD *)self + 5) = v2;
  *((_OWORD *)self + 6) = v2;
  *((_OWORD *)self + 7) = v2;
  *((_OWORD *)self + 8) = v2;
  *((_OWORD *)self + 9) = v2;
  *((_OWORD *)self + 10) = v2;
  *((_OWORD *)self + 11) = v2;
  *((_OWORD *)self + 12) = v2;
  *((_OWORD *)self + 13) = v2;
  *((_OWORD *)self + 14) = v2;
  *((_OWORD *)self + 15) = v2;
  *((_OWORD *)self + 16) = v2;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0;
  atomic_store(0, (unint64_t *)self + 37);
  atomic_store(0, (unint64_t *)self + 38);
  *((void *)self + 39) = atomic_fetch_add(&CSStore2::Store::Store(void)::nextFamily, 1uLL);
  *((unsigned char *)self + 320) = 0;
  *(_WORD *)((char *)self + 321) = v5;
  *((unsigned char *)self + 323) = v6;
  *((unsigned char *)self + 324) = 0;
  *(_WORD *)((char *)self + 325) = v3;
  *((unsigned char *)self + 327) = v4;
  *((unsigned char *)self + 336) = 0;
  return self;
}

- (_CSStore)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2, a3, a4);
  char v6 = v5;
  id v7 = (void *)v4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v9 = v8;
  v10 = v9;
  v70 = 0;
  if (!v9 || ![v9 isFileURL])
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    *(void *)buf = *MEMORY[0x1E4F28228];
    *(void *)&buf[8] = @"Line";
    *(void *)&long long __ptr = @"paramErr";
    *((void *)&__ptr + 1) = &unk_1EFE435F0;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&__ptr forKeys:buf count:2];
    v13 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v19];
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  id v72 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v10 options:1 error:&v72];
  id v12 = (CSStore2 *)v72;
  v13 = v12;
  if (!v11)
  {
    uint64_t v18 = 0;
    id v19 = 0;
    goto LABEL_10;
  }
  v14 = CSStore2::GetLog(v12);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v52 = [v11 length];
    LODWORD(__ptr) = 134217984;
    *(void *)((char *)&__ptr + 4) = v52;
    _os_log_debug_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_DEBUG, "Creating CSStore from file with length %llu", (uint8_t *)&__ptr, 0xCu);
  }

  if ((unint64_t)[v11 length] >> 32)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    *(void *)buf = *MEMORY[0x1E4F28228];
    *(void *)&buf[8] = @"Line";
    *(void *)&long long __ptr = @"fileBoundsErr";
    *((void *)&__ptr + 1) = &unk_1EFE435D8;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&__ptr forKeys:buf count:2];
    uint64_t v17 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -1309);

    v13 = (void *)v17;
    goto LABEL_8;
  }
  id v19 = v11;
  id v71 = v13;
  CSStore2::Store::_Create((CSStore2 *)&__ptr, (Bytef *)[v19 bytes], objc_msgSend(v19, "length"), 1, 1, &v71);
  id v69 = v71;

  uint64_t v18 = __ptr;
  v70 = (id *)__ptr;
  if ((void)__ptr) {
    goto LABEL_30;
  }
  v37 = [v69 userInfo];
  v38 = [v37 objectForKey:@"ZeroedRanges"];
  BOOL v39 = v38 == 0;

  if (v39)
  {
    uint64_t v18 = 0;
LABEL_30:
    v13 = v69;
    goto LABEL_10;
  }
  v40 = [v69 userInfo];
  v68 = (void *)[v40 mutableCopy];

  id v67 = v19;
  uint64_t v66 = [v67 bytes];
  unsigned int v41 = [v67 length];
  id v65 = v10;
  v42 = fopen((const char *)[v65 fileSystemRepresentation], "rb");
  if (!v42)
  {
    v53 = CSStore2::GetLog(0);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__ptr) = 138412290;
      *(void *)((char *)&__ptr + 4) = v65;
      _os_log_error_impl(&dword_1A7DB2000, v53, OS_LOG_TYPE_ERROR, "verifying map with file: URL %@ could not be opened", (uint8_t *)&__ptr, 0xCu);
    }

    unsigned int v44 = 4;
    goto LABEL_62;
  }
  uint64_t v43 = 0;
  unsigned int v44 = 0;
  uint64_t v45 = v41;
  while (!feof(v42) && !ferror(v42))
  {
    v46 = (CSStore2 *)fread(&__ptr, 1uLL, 0x1000uLL, v42);
    v47 = v46;
    if (!v46) {
      goto LABEL_46;
    }
    if ((unint64_t)v46 <= v45 - v43)
    {
      v49 = (CSStore2 *)memcmp(&__ptr, (const void *)(v66 + v43), (size_t)v46);
      if (!v49) {
        goto LABEL_46;
      }
      v48 = CSStore2::GetLog(v49);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = (char *)v47 + v43;
        _os_log_error_impl(&dword_1A7DB2000, v48, OS_LOG_TYPE_ERROR, "file/map mismatch between offsets %#zx and %#zx", buf, 0x16u);
      }
      unsigned int v44 = 1;
    }
    else
    {
      v48 = CSStore2::GetLog(v46);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v45;
        _os_log_error_impl(&dword_1A7DB2000, v48, OS_LOG_TYPE_ERROR, "file/map mismatch: file longer than map of length %#zx", buf, 0xCu);
      }
      unsigned int v44 = 3;
    }

LABEL_46:
    v43 += (uint64_t)v47;
  }
  v50 = (CSStore2 *)ferror(v42);
  if (v50)
  {
    v51 = CSStore2::GetLog(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__ptr) = 0;
      _os_log_error_impl(&dword_1A7DB2000, v51, OS_LOG_TYPE_ERROR, "file/map comparison read error", (uint8_t *)&__ptr, 2u);
    }
    unsigned int v44 = 4;
    goto LABEL_51;
  }
  if (v45 != v43)
  {
    v54 = (CSStore2 *)feof(v42);
    if (v54)
    {
      v51 = CSStore2::GetLog(v54);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__ptr) = 134217984;
        *(void *)((char *)&__ptr + 4) = v45;
        _os_log_error_impl(&dword_1A7DB2000, v51, OS_LOG_TYPE_ERROR, "file/map mismatch: file shorter than map of length %#zx", (uint8_t *)&__ptr, 0xCu);
      }
      unsigned int v44 = 2;
LABEL_51:
    }
  }
  fclose(v42);
LABEL_62:

  v55 = [NSNumber numberWithUnsignedInteger:v44];
  [v68 setObject:v55 forKeyedSubscript:@"filecmp"];

  id v56 = v67;
  CSStore2::Store::_Create((CSStore2 *)buf, (Bytef *)[v56 bytes], objc_msgSend(v56, "length"), 1, 0, 0);
  v57 = *(atomic_ullong **)buf;
  if (*(void *)buf)
  {
    *(void *)&long long __ptr = MEMORY[0x1E4F143A8];
    *((void *)&__ptr + 1) = 3221225472;
    v75 = ___ZN8CSStore25Store23CreateWithContentsOfURLEP5NSURLPU15__autoreleasingP7NSError_block_invoke;
    v76 = &unk_1E5D2A5A8;
    uint64_t v78 = *(void *)buf;
    id v58 = v68;
    id v77 = v58;
    CSStore2::Store::enumerateTables(v57, &__ptr);
    v60 = CSStore2::String::GetDebugDescriptionOfCache((CSStore2::String *)v57, v59);
    [v58 setObject:v60 forKeyedSubscript:@"string$"];
  }
  id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
  v62 = [v69 domain];
  uint64_t v63 = [v69 code];
  v64 = (void *)[v68 copy];
  v13 = (void *)[v61 initWithDomain:v62 code:v63 userInfo:v64];

  if (v57) {
    std::default_delete<CSStore2::Store>::operator()[abi:nn180100]((id *)v57);
  }
  v16 = v68;
LABEL_8:

  uint64_t v18 = 0;
  id v19 = v11;
LABEL_10:

  v21 = (void *)MEMORY[0x1AD0DB160]();
  BOOL v22 = v10 == 0;
  if (v18) {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    if (v13)
    {
      v23 = [v13 userInfo];
      uint64_t v24 = *MEMORY[0x1E4F289D0];
      v25 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F289D0]];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        v27 = [v13 userInfo];
        v28 = (void *)[v27 mutableCopy];

        [v28 setObject:v10 forKeyedSubscript:v24];
        v29 = (void *)MEMORY[0x1E4F28C58];
        v30 = [v13 domain];
        uint64_t v31 = objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v13, "code"), v28);

        v13 = (void *)v31;
      }
    }
  }
  if (v18) {
    id v32 = 0;
  }
  else {
    id v32 = v13;
  }

  id v33 = v32;
  v34 = v70;
  if (v70)
  {
    v35 = (_CSStore *)[v7 initByMovingStore:v70];
    if (!v6) {
      goto LABEL_25;
    }
  }
  else
  {

    v35 = 0;
    if (!v6) {
      goto LABEL_25;
    }
  }
  if (!v35)
  {
    void *v6 = v33;
    v34 = v70;
  }
LABEL_25:
  if (v34)
  {

    MEMORY[0x1AD0DACB0](v34, 0x10A0C40D11E5446);
  }

  return v35;
}

- (id)mutableCopyWithZone:(_NSZone *)a3 error:(id *)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext) {
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(void *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_, a2);
    }
  }
  dataContainer = self->_store.dataContainer;
  if (dataContainer)
  {
    id v9 = (Bytef *)*((void *)dataContainer + 1);
    v10 = (void *)*((unsigned int *)dataContainer + 4);
  }
  else
  {
    id v9 = 0;
    v10 = 0;
  }
  CSStore2::Store::CreateWithBytes(&v18, v9, v10, a4);
  v11 = v18;
  if (!v18) {
    return 0;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__81;
  uint64_t v24 = __Block_byref_object_dispose__82;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = ___ZNK8CSStore25Store4copyEPU15__autoreleasingP7NSError_block_invoke;
  v19[3] = &unk_1E5D2A580;
  v19[4] = &v20;
  CSStore2::Store::enumerateTables(v18, v19);
  uint64_t v12 = v21[5];
  if (v12)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      v26[0] = *MEMORY[0x1E4F28228];
      v26[1] = @"Line";
      v27[0] = @"kCSStoreValidationErr";
      v27[1] = &unk_1EFE43530;
      v26[2] = @"FullTable";
      v27[2] = v12;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
      *a4 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-9491 userInfo:v14];
    }
    uint64_t v18 = 0;
    std::default_delete<CSStore2::Store>::operator()[abi:nn180100]((id *)v11);
    v11 = 0;
  }
  _Block_object_dispose(&v20, 8);

  if (!v11) {
    return 0;
  }
  int v15 = *(_DWORD *)(*((void *)self->_store.dataContainer + 1) + 8);
  v11[38] = self->_store.pedigree.family;
  *((_DWORD *)v11 + 78) = v15;
  *((unsigned char *)v11 + 316) = 1;
  v16 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initByMovingStore:", v11);

  MEMORY[0x1AD0DACB0](v11, 0x10A0C40D11E5446);
  return v16;
}

- (_CSStore)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self) {
      goto LABEL_3;
    }
LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"CSStore.mm", 253, @"Invalid parameter not satisfying: %@", @"[aDecoder isKindOfClass:[NSXPCCoder class]]" object file lineNumber description];

  if (!self) {
    goto LABEL_16;
  }
LABEL_3:
  id v19 = 0;
  id v6 = v5;
  id v7 = @"XPCRepresentation";
  uint64_t v20 = 0;
  if (!v6)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v21[0] = *MEMORY[0x1E4F28228];
    v21[1] = @"Line";
    v22[0] = @"paramErr";
    v22[1] = &unk_1EFE43548;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v10 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v14];
LABEL_9:

    id v9 = 0;
    BOOL v12 = 1;
LABEL_10:
    id v11 = v10;
    id v19 = v11;
    goto LABEL_11;
  }
  id v8 = [v6 decodeXPCObjectOfType:MEMORY[0x1E4F14580] forKey:@"XPCRepresentation"];
  if (!v8)
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:0];
    v14 = 0;
    goto LABEL_9;
  }
  CSStore2::Store::CreateWithXPCObject(v22, v8, &v19);
  id v9 = (id *)v22[0];
  uint64_t v20 = v22[0];

  v10 = 0;
  id v11 = 0;
  BOOL v12 = v9 == 0;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_11:

  id v15 = v19;
  if (v12)
  {
    [v6 failWithError:v15];

    v16 = 0;
  }
  else
  {
    v16 = [(_CSStore *)self initByMovingStore:v9];

    MEMORY[0x1AD0DACB0](v9, 0x10A0C40D11E5446);
  }

LABEL_17:
  return v16;
}

- (id)initByMovingStore:(void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_CSStore;
  uint64_t v4 = [(_CSStore *)&v21 init];
  id v5 = (id *)(v4 + 8);
  if (v4) {
    BOOL v6 = v5 == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    objc_storeStrong(v5, *(id *)a3);
    id v7 = *(id *)a3;
    *(void *)a3 = 0;

    long long v8 = *(_OWORD *)((char *)a3 + 8);
    long long v9 = *(_OWORD *)((char *)a3 + 24);
    long long v10 = *(_OWORD *)((char *)a3 + 56);
    *((_OWORD *)v4 + 3) = *(_OWORD *)((char *)a3 + 40);
    *((_OWORD *)v4 + 4) = v10;
    *((_OWORD *)v4 + 1) = v8;
    *((_OWORD *)v4 + 2) = v9;
    long long v11 = *(_OWORD *)((char *)a3 + 72);
    long long v12 = *(_OWORD *)((char *)a3 + 88);
    long long v13 = *(_OWORD *)((char *)a3 + 120);
    *((_OWORD *)v4 + 7) = *(_OWORD *)((char *)a3 + 104);
    *((_OWORD *)v4 + 8) = v13;
    *((_OWORD *)v4 + 5) = v11;
    *((_OWORD *)v4 + 6) = v12;
    long long v14 = *(_OWORD *)((char *)a3 + 136);
    long long v15 = *(_OWORD *)((char *)a3 + 152);
    long long v16 = *(_OWORD *)((char *)a3 + 184);
    *((_OWORD *)v4 + 11) = *(_OWORD *)((char *)a3 + 168);
    *((_OWORD *)v4 + 12) = v16;
    *((_OWORD *)v4 + 9) = v14;
    *((_OWORD *)v4 + 10) = v15;
    long long v17 = *(_OWORD *)((char *)a3 + 200);
    long long v18 = *(_OWORD *)((char *)a3 + 216);
    long long v19 = *(_OWORD *)((char *)a3 + 248);
    *((_OWORD *)v4 + 15) = *(_OWORD *)((char *)a3 + 232);
    *((_OWORD *)v4 + 16) = v19;
    *((_OWORD *)v4 + 13) = v17;
    *((_OWORD *)v4 + 14) = v18;
    *((void *)v4 + 34) = *((void *)a3 + 33);
    *(_OWORD *)(v4 + 280) = *((_OWORD *)a3 + 17);
    atomic_store(0, (unint64_t *)v4 + 37);
    atomic_store(0, (unint64_t *)v4 + 38);
    *(_OWORD *)(v4 + 312) = *((_OWORD *)a3 + 19);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CSStore.mm", 246, @"Invalid parameter not satisfying: %@", @"[aCoder isKindOfClass:[NSXPCCoder class]]" object file lineNumber description];
  }
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext) {
      (*(void (**)(CSStoreAccessContextInterface *))(*(void *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_);
    }
  }
  id v13 = v5;
  id v7 = @"XPCRepresentation";
  if (v13)
  {
    id v14 = 0;
    long long v8 = CSStore2::Store::encodeAsXPCObject((uint64_t)self->_store.dataContainer, &v14);
    long long v9 = (CSStore2 *)v14;
    long long v10 = v9;
    if (v8)
    {
      [v13 encodeXPCObject:v8 forKey:@"XPCRepresentation"];
    }
    else
    {
      long long v11 = CSStore2::GetLog(v9);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v16 = v10;
        _os_log_fault_impl(&dword_1A7DB2000, v11, OS_LOG_TYPE_FAULT, "Unexpectedly could not encode store: %@", buf, 0xCu);
      }
    }
  }
}

- (void)setReadOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (performMutatingAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (**(void (***)(CSStoreAccessContextInterface *, SEL))accessContext->_impl.__ptr_)(accessContext->_impl.__ptr_, a2);
      if (performMutatingAssertions)
      {
        BOOL v6 = self->_accessContext;
        if (v6) {
          (**(void (***)(CSStoreAccessContextInterface *))v6->_impl.__ptr_)(v6->_impl.__ptr_);
        }
      }
    }
  }
  if (((((*(unsigned char *)&self->_store.flags & 1) == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 3;
    }
    dataContainer = self->_store.dataContainer;
    if (dataContainer)
    {
      uint64_t v9 = *((void *)dataContainer + 1);
      uint64_t v10 = *((unsigned int *)dataContainer + 4);
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
    long long v11 = (CSStore2 *)MEMORY[0x1AD0DB5E0](*MEMORY[0x1E4F14960], v9, v10, 0, v7);
    if (v11)
    {
      int v12 = (int)v11;
      id v13 = CSStore2::GetLog(v11);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 134218752;
        uint64_t v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 2048;
        uint64_t v19 = v7;
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        _os_log_error_impl(&dword_1A7DB2000, v13, OS_LOG_TYPE_ERROR, "Failed to set protection of region at %p length %zu to %lx: %lx", (uint8_t *)&v14, 0x2Au);
      }
    }
    *(unsigned char *)&self->_store.flags = *(unsigned char *)&self->_store.flags & 0xFE | v3;
  }
}

- (id)description
{
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext) {
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(void *)accessContext->_impl.__ptr_ + 8))(accessContext->_impl.__ptr_, a2);
    }
  }
  uint64_t v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  dataContainer = self->_store.dataContainer;
  long long v8 = [v4 stringWithFormat:@"<%@ %p> { p = %p, gen = %llu, length = %llu/%llu/%llu }", v6, self, *((void *)dataContainer + 1), *(unsigned int *)(*((void *)dataContainer + 1) + 8), *((unsigned int *)dataContainer + 4), *(unsigned int *)(*((void *)dataContainer + 1) + 12), *(unsigned int *)(*((void *)dataContainer + 1) + 16)];

  return v8;
}

- (void)setAccessContext:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_accessContext, a3);
  accessContext = self->_accessContext;
  if (accessContext
    && (*(unsigned int (**)(CSStoreAccessContextInterface *))(*(void *)accessContext->_impl.__ptr_ + 40))(accessContext->_impl.__ptr_)
    && -[_CSStore setAccessContext:]::once != -1)
  {
    dispatch_once(&-[_CSStore setAccessContext:]::once, &__block_literal_global_115);
  }
}

- (_CSStore)initWithError:(id *)a3
{
  id v9 = 0;
  CSStore2::Store::_Create((CSStore2 *)&v10, 0, 0, 0, 0, &v9);
  id v5 = v9;
  id v6 = v10;
  if (v10)
  {
    uint64_t v7 = [(_CSStore *)self initByMovingStore:v10];
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {

    uint64_t v7 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v7) {
    *a3 = v5;
  }
LABEL_7:
  if (v6)
  {

    MEMORY[0x1AD0DACB0](v6, 0x10A0C40D11E5446);
  }

  return v7;
}

- (_CSStore)init
{
}

+ (id)new
{
}

@end