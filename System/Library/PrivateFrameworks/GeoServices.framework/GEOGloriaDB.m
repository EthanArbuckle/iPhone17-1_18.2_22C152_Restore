@interface GEOGloriaDB
- (BOOL)_unsafeDataForQuadKey:(unint64_t)a3 ofType:(Class)a4 result:(id)a5;
- (BOOL)containsQuadKey:(unint64_t)a3;
- (BOOL)containsQuadKeyNum:(id)a3;
- (BOOL)enumerateDataAtLocation:(id)a3 radius:(double)a4 visitor:(id)a5;
- (BOOL)enumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 visitor:(id)a6;
- (BOOL)unsafeDataForQuadKey:(unint64_t)a3 result:(id)a4;
- (BOOL)unsafeDataForQuadKeyNum:(id)a3 result:(id)a4;
- (BOOL)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 visitor:(id)a5;
- (BOOL)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 visitor:(id)a6;
- (BOOL)unsafeMetadata:(id)a3;
- (GEOGloriaDB)initWithDBAccess:(shared_ptr<gloria:(unint64_t)a4 :(Class)a5 DbReader>)a3 rootQuadKey:(Class)a6 metadataClass:(id)a7 dataClass:log:;
- (GEOGloriaDB)initWithFileHandle:(id)a3 rootQuadKey:(unint64_t)a4 log:(id)a5;
- (GEOGloriaDB)initWithFileHandle:(id)a3 rootQuadKey:(unint64_t)a4 metadataClass:(Class)a5 dataClass:(Class)a6 log:(id)a7;
- (GEOGloriaDB)initWithFileURL:(id)a3 rootQuadKey:(unint64_t)a4 log:(id)a5;
- (GEOGloriaDB)initWithFileURL:(id)a3 rootQuadKey:(unint64_t)a4 metadataClass:(Class)a5 dataClass:(Class)a6 log:(id)a7;
- (id).cxx_construct;
- (id)_dataForQuadKey:(unint64_t)a3 ofType:(Class)a4;
- (id)dataForQuadKey:(unint64_t)a3;
- (id)dataForQuadKeyNum:(id)a3;
- (id)enumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 ifDifferentFrom:(id)a6 visitor:(id)a7;
- (id)metadata;
- (id)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 ifDifferentFrom:(id)a6 visitor:(id)a7;
@end

@implementation GEOGloriaDB

- (void).cxx_destruct
{
  value = self->_db.__ptr_.__value_;
  self->_db.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(DB *, SEL))(*(void *)&value->type + 8))(value, a2);
  }

  objc_storeStrong((id *)&self->_log, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = -1;
  *((unsigned char *)self + 32) = -1;
  return self;
}

- (id)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 ifDifferentFrom:(id)a6 visitor:(id)a7
{
  int v8 = a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v50 = a3;
  unsigned __int8 v49 = a5;
  id v36 = a6;
  id v15 = a7;
  if ((v8 - 31) < 0xE2u)
  {
    id v16 = 0;
  }
  else
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    if (a4 <= 0.0)
    {
      gloria::TileId::FromLatLng((gloria::TileId *)&v50, &v50.var1, (const double *)&v49, v14);
      uint64_t v19 = v18 | gloria::LEADING_BITS_VALUE_LUT[v17];
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v53) = 134283521;
        *(void *)((char *)&v53 + 4) = v19;
        _os_log_debug_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius 0, looking at exact tile only for key %{private}llu", (uint8_t *)&v53, 0xCu);
      }
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke;
      v41[3] = &unk_1E53DB6E8;
      id v42 = v15;
      v43 = &v45;
      uint64_t v44 = v19;
      if ([(GEOGloriaDB *)self unsafeDataForQuadKey:v19 result:v41])
      {
        v21 = (void *)MEMORY[0x1E4F1CAD0];
        v22 = [NSNumber numberWithUnsignedLongLong:v19];
        id v16 = [v21 setWithObject:v22];
      }
      else
      {

        id v16 = [MEMORY[0x1E4F1CAD0] set];
      }
    }
    else
    {
      *((void *)&v53 + 1) = 0;
      uint64_t v54 = 0;
      *(void *)&long long v53 = (char *)&v53 + 8;
      GEOGloriaPopulateQuadKeysWithinRadiusFromCoordinate(v8, (uint64_t **)&v53, var0, var1, a4, v13, v14);
      if (_quadKeySetsMatch(v36, &v53))
      {
        id v16 = v36;
      }
      else
      {
        id v16 = [MEMORY[0x1E4F1CA80] set];
        v23 = self->_log;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v52) = v54;
          _os_log_debug_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius > 0, looking at %d tiles", buf, 8u);
        }
        v24 = (void *)v53;
        if ((long long *)v53 != (long long *)((char *)&v53 + 8))
        {
          do
          {
            v25 = v24 + 4;
            if (_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, v24[4]))
            {
              v26 = [NSNumber numberWithUnsignedLongLong:*v25];
              [v16 addObject:v26];

              if (!*((unsigned char *)v46 + 24))
              {
                v27 = self->_log;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v33 = *v25;
                  *(_DWORD *)buf = 134283521;
                  uint64_t v52 = v33;
                  _os_log_debug_impl(&dword_188D96000, v27, OS_LOG_TYPE_DEBUG, "Checking quad key %{private}lld", buf, 0xCu);
                }
                uint64_t v28 = *v25;
                v37[0] = MEMORY[0x1E4F143A8];
                v37[1] = 3221225472;
                v37[2] = __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke_8;
                v37[3] = &unk_1E53DB710;
                v37[4] = self;
                v40 = v24 + 4;
                id v38 = v15;
                v39 = &v45;
                if (![(GEOGloriaDB *)self unsafeDataForQuadKey:v28 result:v37])
                {
                  v29 = self->_log;
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v34 = *v25;
                    *(_DWORD *)buf = 134283521;
                    uint64_t v52 = v34;
                    _os_log_debug_impl(&dword_188D96000, v29, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Got data (nil) quad key %{private}lld", buf, 0xCu);
                  }
                }
              }
            }
            v30 = (void *)v24[1];
            if (v30)
            {
              do
              {
                v31 = v30;
                v30 = (void *)*v30;
              }
              while (v30);
            }
            else
            {
              do
              {
                v31 = (_OWORD *)v24[2];
                BOOL v32 = *(void *)v31 == (void)v24;
                v24 = v31;
              }
              while (!v32);
            }
            v24 = v31;
          }
          while (v31 != (long long *)((char *)&v53 + 8));
        }
      }
      std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)&v53, *((void **)&v53 + 1));
    }
    _Block_object_dispose(&v45, 8);
  }

  return v16;
}

- (BOOL)unsafeDataForQuadKey:(unint64_t)a3 result:(id)a4
{
  return [(GEOGloriaDB *)self _unsafeDataForQuadKey:a3 ofType:self->_dataClass result:a4];
}

- (BOOL)_unsafeDataForQuadKey:(unint64_t)a3 ofType:(Class)a4 result:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v34 = a3;
  int v8 = (uint64_t (**)(id, id))a5;
  metadataClass = self->_metadataClass;
  BOOL v11 = metadataClass == a4 || a3 != 0x7FFFFFFFFFFFFFFFLL || metadataClass == 0;
  if (!v11
    || self->_rootTileId.zoom_
    && !_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, a3))
  {
    char v13 = 0;
    goto LABEL_32;
  }
  char v30 = 1;
  int v31 = 0;
  BOOL v32 = &v34;
  uint64_t v33 = 8;
  LOBYTE(v25) = 1;
  HIDWORD(v25) = 0;
  v26 = "";
  memset(v27, 0, sizeof(v27));
  uint64_t v28 = (char *)v27 + 8;
  __int16 v29 = 0;
  (*(void (**)(void **__return_ptr))(*(void *)self->_db.__ptr_.__value_ + 32))(v23);
  if (LODWORD(v23[0]))
  {
    gloria::Status::ToString((gloria::Status *)v23, &v39);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v20 = &v39;
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v20 = (std::string *)v39.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 134283779;
      unint64_t v36 = v34;
      __int16 v37 = 2082;
      id v38 = v20;
      _os_log_debug_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Failed to look up data for quad key %{private}llu: %{public}s", buf, 0x16u);
    }
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
    char v13 = 0;
    goto LABEL_29;
  }
  v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v26 length:*(void *)&v27[0] freeWhenDone:0];
  id v15 = v14;
  if (!v14)
  {
    uint64_t v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v39.__r_.__value_.__l.__data_) = 134283521;
      *(std::string::size_type *)((char *)v39.__r_.__value_.__r.__words + 4) = v34;
      _os_log_error_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to create data object for quad key %{private}llu", (uint8_t *)&v39, 0xCu);
    }
    char v13 = 0;
    goto LABEL_28;
  }
  if (a4)
  {
    id v16 = (id)[[a4 alloc] initWithData:v14];
    if (!v16)
    {
      unsigned __int8 v17 = self->_log;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        std::string::size_type v21 = v34;
        v22 = NSStringFromClass(a4);
        LODWORD(v39.__r_.__value_.__l.__data_) = 134283779;
        *(std::string::size_type *)((char *)v39.__r_.__value_.__r.__words + 4) = v21;
        WORD2(v39.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&v39.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v22;
        _os_log_error_impl(&dword_188D96000, (os_log_t)v17, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to decode object for quad key %{private}llu or type %{publie}@", (uint8_t *)&v39, 0x16u);
      }
      id v16 = 0;
      char v13 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    id v16 = v14;
  }
  char v13 = v8[2](v8, v16);
LABEL_27:

LABEL_28:
LABEL_29:
  if (v24 < 0) {
    operator delete(v23[1]);
  }
  gloria::ManagedSlice::~ManagedSlice(&v25);
LABEL_32:

  return v13;
}

uint64_t __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = **(void **)(a1 + 56);
    int v7 = 134218241;
    id v8 = v3;
    __int16 v9 = 2049;
    uint64_t v10 = v6;
    _os_log_debug_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Got data %p quad key %{private}lld", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 1;
}

uint64_t __60__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_visitor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (GEOGloriaDB)initWithFileURL:(id)a3 rootQuadKey:(unint64_t)a4 metadataClass:(Class)a5 dataClass:(Class)a6 log:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  char v13 = a7;
  char v30 = 0;
  v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = [v12 path];
  char v16 = [v14 fileExistsAtPath:v15 isDirectory:&v30];

  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v31.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
      _os_log_error_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Refusing to open non-existent file at %@", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_7;
  }
  if (v30)
  {
    id v17 = [v12 path];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v17 fileSystemRepresentation]);

    uint64_t v18 = (std::__shared_weak_count *)operator new(0x38uLL);
    v18->__shared_owners_ = 0;
    v18->__shared_weak_owners_ = 0;
    v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED518860;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v31, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }
    else {
      std::string v31 = __p;
    }
    v22 = v18 + 1;
    gloria::DbReaderDisk::DbReaderDisk((uint64_t)&v18[1], (uint64_t)&v31);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    goto LABEL_15;
  }
  id v20 = v12;
  int v21 = open((const char *)[v20 fileSystemRepresentation], 0);
  if (v21 < 0)
  {
    char v24 = v13;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = __error();
      v26 = strerror(*v25);
      LODWORD(v31.__r_.__value_.__l.__data_) = 138412546;
      *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 4) = (std::string::size_type)v20;
      WORD2(v31.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&v31.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v26;
      _os_log_error_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Error opening file at %@: %s", (uint8_t *)&v31, 0x16u);
    }

LABEL_7:
    uint64_t v19 = 0;
    goto LABEL_18;
  }
  uint64_t v18 = (std::__shared_weak_count *)operator new(0x90uLL);
  v18->__shared_owners_ = 0;
  v18->__shared_weak_owners_ = 0;
  v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED5187B8;
  v22 = v18 + 1;
  geo::DbReaderTarFileDescriptor::DbReaderTarFileDescriptor((uint64_t)&v18[1], v21, v13);
LABEL_15:
  v27 = v22;
  uint64_t v28 = v18;
  atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  self = [(GEOGloriaDB *)self initWithDBAccess:&v27 rootQuadKey:a4 metadataClass:a5 dataClass:a6 log:v13];
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  uint64_t v19 = self;
LABEL_18:

  return v19;
}

- (GEOGloriaDB)initWithDBAccess:(shared_ptr<gloria:(unint64_t)a4 :(Class)a5 DbReader>)a3 rootQuadKey:(Class)a6 metadataClass:(id)a7 dataClass:log:
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  char v13 = a6;
  if (a4)
  {
    uint64_t v14 = [(id)a4 superclass];
    if (v14 != objc_opt_class())
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
LABEL_16:
        v23 = 0;
        v22 = self;
        goto LABEL_12;
      }
      *(_WORD *)__int16 v29 = 0;
      v25 = MEMORY[0x1E4F14500];
      v26 = "Assertion failed: metadataClass == nullptr || metadataClass.superclass == PBCodable.class";
LABEL_18:
      _os_log_fault_impl(&dword_188D96000, v25, OS_LOG_TYPE_FAULT, v26, v29, 2u);
      goto LABEL_16;
    }
  }
  if (a5)
  {
    uint64_t v15 = [(objc_class *)a5 superclass];
    if (v15 != objc_opt_class())
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      *(_WORD *)__int16 v29 = 0;
      v25 = MEMORY[0x1E4F14500];
      v26 = "Assertion failed: dataClass == nullptr || dataClass.superclass == PBCodable.class";
      goto LABEL_18;
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)GEOGloriaDB;
  char v16 = [(GEOGloriaDB *)&v36 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_log, a6);
    int v18 = __clz((unint64_t)var1);
    LOBYTE(v18) = (int)((63 - v18 + (((63 - v18) & 0x80u) >> 7)) << 24) >> 25;
    v17->_rootTileId.tile_id_ = (unint64_t)var1 - gloria::LEADING_BITS_VALUE_LUT[v18];
    v17->_rootTileId.zoom_ = v18;
    v17->_metadataClass = (Class)a4;
    v17->_dataClass = a5;
    std::allocate_shared[abi:ne180100]<gloria::DbReaderDisk,std::allocator<gloria::DbReaderDisk>,char const(&)[1],void>("", &v27);
    uint64_t v19 = (std::__shared_weak_count *)v28;
    char v30 = (std::__shared_weak_count *)v28;
    long long v31 = xmmword_18A627730;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 8;
    char v35 = 0;
    uint64_t v20 = *(void *)var0;
    int v21 = (atomic_ullong *)*((void *)var0 + 1);
    if (v21)
    {
      atomic_fetch_add_explicit(v21 + 1, 1uLL, memory_order_relaxed);
      uint64_t v19 = v30;
    }
    *(void *)__int16 v29 = v20;
    char v30 = (std::__shared_weak_count *)v21;
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
    *(void *)((char *)&v31 + 4) = 0x200000002;
    operator new();
  }
  v22 = (GEOGloriaDB *)0;
  v23 = v22;
LABEL_12:

  return v23;
}

- (BOOL)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 visitor:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  Class metadataClass = self->_metadataClass;
  if (metadataClass != (Class)objc_opt_class())
  {
    char v13 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = [(GEOGloriaDB *)self metadata];
  id v12 = v11;
  if (!v11 || !v11[2])
  {
    char v13 = 0;
    goto LABEL_18;
  }
  std::string __p = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  char v13 = GEOGloriaPopulateAvailableZoomRange(v11, (unint64_t *)&__p);
  if (v13)
  {
    uint64_t v14 = v32;
    if (v32 == __p)
    {
      char v13 = 0;
      if (!v32) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_visitor___block_invoke;
    v24[3] = &unk_1E53DB6C0;
    id v25 = v9;
    v26 = &v27;
    uint64_t v15 = (void *)MEMORY[0x18C120660](v24);
    id v17 = (char *)v32;
    if (__p != v32)
    {
      int v18 = (char *)__p + 1;
      *(void *)&long long v16 = 67109120;
      long long v23 = v16;
      do
      {
        uint64_t v19 = *(v18 - 1);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v23;
          int v35 = v19;
          _os_log_debug_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Checking zoom %d", buf, 8u);
        }
        -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:zoom:visitor:](self, "unsafeEnumerateDataAtLocation:radius:zoom:visitor:", v19, v15, var0, var1, a4, v23);
        if (*((unsigned char *)v28 + 24)) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = v18 == v17;
        }
        ++v18;
      }
      while (!v21);
    }

    _Block_object_dispose(&v27, 8);
  }
  uint64_t v14 = __p;
  if (__p)
  {
LABEL_17:
    uint64_t v32 = v14;
    operator delete(v14);
  }
LABEL_18:

LABEL_19:
  return v13;
}

- (BOOL)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 visitor:(id)a6
{
  uint64_t v6 = -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:](self, "unsafeEnumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:", a5, 0, a6, a3.var0, a3.var1, a4);
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (id)metadata
{
  return [(GEOGloriaDB *)self _dataForQuadKey:0x7FFFFFFFFFFFFFFFLL ofType:self->_metadataClass];
}

- (GEOGloriaDB)initWithFileURL:(id)a3 rootQuadKey:(unint64_t)a4 log:(id)a5
{
  return [(GEOGloriaDB *)self initWithFileURL:a3 rootQuadKey:a4 metadataClass:0 dataClass:0 log:a5];
}

- (id)_dataForQuadKey:(unint64_t)a3 ofType:(Class)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v30 = a3;
  Class metadataClass = self->_metadataClass;
  BOOL v6 = metadataClass == a4 || a3 != 0x7FFFFFFFFFFFFFFFLL || metadataClass == 0;
  if (!v6
    || a3 != 0x7FFFFFFFFFFFFFFFLL
    && self->_rootTileId.zoom_
    && !_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, a3))
  {
    id v10 = 0;
    goto LABEL_31;
  }
  char v26 = 1;
  int v27 = 0;
  uint64_t v28 = &v30;
  uint64_t v29 = 8;
  LOBYTE(v21) = 1;
  HIDWORD(v21) = 0;
  v22 = "";
  memset(v23, 0, sizeof(v23));
  char v24 = (char *)v23 + 8;
  __int16 v25 = 0;
  (*(void (**)(void **__return_ptr))(*(void *)self->_db.__ptr_.__value_ + 32))(v19);
  if (LODWORD(v19[0]))
  {
    gloria::Status::ToString((gloria::Status *)v19, &v35);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = &v35;
      if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        long long v16 = (std::string *)v35.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 134283779;
      unint64_t v32 = v30;
      __int16 v33 = 2082;
      uint64_t v34 = v16;
      _os_log_debug_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Failed to look up data for quad key %{private}llu: %{public}s", buf, 0x16u);
    }
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
    id v10 = 0;
    goto LABEL_28;
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:*(void *)&v23[0]];
  id v12 = v11;
  if (!v11)
  {
    uint64_t v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v35.__r_.__value_.__l.__data_) = 134283521;
      *(std::string::size_type *)((char *)v35.__r_.__value_.__r.__words + 4) = v30;
      _os_log_error_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to create data object for quad key %{private}llu", (uint8_t *)&v35, 0xCu);
    }
    goto LABEL_25;
  }
  if (!a4)
  {
    id v10 = v11;
    goto LABEL_27;
  }
  id v10 = (id)[[a4 alloc] initWithData:v11];
  if (!v10)
  {
    char v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      std::string::size_type v17 = v30;
      int v18 = NSStringFromClass(a4);
      LODWORD(v35.__r_.__value_.__l.__data_) = 134283779;
      *(std::string::size_type *)((char *)v35.__r_.__value_.__r.__words + 4) = v17;
      WORD2(v35.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&v35.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v18;
      _os_log_error_impl(&dword_188D96000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to decode object for quad key %{private}llu or type %{publie}@", (uint8_t *)&v35, 0x16u);
    }
LABEL_25:
    id v10 = 0;
  }
LABEL_27:

LABEL_28:
  if (v20 < 0) {
    operator delete(v19[1]);
  }
  gloria::ManagedSlice::~ManagedSlice(&v21);
LABEL_31:

  return v10;
}

- (GEOGloriaDB)initWithFileHandle:(id)a3 rootQuadKey:(unint64_t)a4 log:(id)a5
{
  return [(GEOGloriaDB *)self initWithFileHandle:a3 rootQuadKey:a4 metadataClass:0 dataClass:0 log:a5];
}

- (GEOGloriaDB)initWithFileHandle:(id)a3 rootQuadKey:(unint64_t)a4 metadataClass:(Class)a5 dataClass:(Class)a6 log:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  int v14 = [v12 fileDescriptor];
  uint64_t v15 = (std::__shared_weak_count *)operator new(0x90uLL);
  v15->__shared_owners_ = 0;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED5187B8;
  uint64_t v18 = geo::DbReaderTarFileDescriptor::DbReaderTarFileDescriptor((uint64_t)&v15[1], v14, v13);
  uint64_t v19 = v15;
  long long v16 = [(GEOGloriaDB *)self initWithDBAccess:&v18 rootQuadKey:a4 metadataClass:a5 dataClass:a6 log:v13];
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }

  return v16;
}

- (BOOL)containsQuadKey:(unint64_t)a3
{
  unint64_t v10 = a3;
  if (!self->_rootTileId.zoom_
    || (int isAncestor = _isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, a3)) != 0)
  {
    v6[0] = 1;
    int v7 = 0;
    id v8 = &v10;
    uint64_t v9 = 8;
    LOBYTE(isAncestor) = (*(uint64_t (**)(DB *, char *))(*(void *)self->_db.__ptr_.__value_ + 16))(self->_db.__ptr_.__value_, v6);
  }
  return isAncestor;
}

- (BOOL)containsQuadKeyNum:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = -[GEOGloriaDB containsQuadKey:](self, "containsQuadKey:", [v4 unsignedLongLongValue]);

  return (char)self;
}

- (BOOL)unsafeMetadata:(id)a3
{
  return [(GEOGloriaDB *)self _unsafeDataForQuadKey:0x7FFFFFFFFFFFFFFFLL ofType:self->_metadataClass result:a3];
}

- (id)dataForQuadKey:(unint64_t)a3
{
  return [(GEOGloriaDB *)self _dataForQuadKey:a3 ofType:self->_dataClass];
}

- (id)dataForQuadKeyNum:(id)a3
{
  id v4 = a3;
  v5 = -[GEOGloriaDB _dataForQuadKey:ofType:](self, "_dataForQuadKey:ofType:", [v4 unsignedLongLongValue], self->_dataClass);

  return v5;
}

- (BOOL)unsafeDataForQuadKeyNum:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  LOBYTE(self) = -[GEOGloriaDB _unsafeDataForQuadKey:ofType:result:](self, "_unsafeDataForQuadKey:ofType:result:", [v6 unsignedLongLongValue], self->_dataClass, v7);

  return (char)self;
}

- (BOOL)enumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 visitor:(id)a6
{
  id v6 = -[GEOGloriaDB enumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:](self, "enumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:", a5, 0, a6, a3.var0, a3.var1, a4);
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (id)enumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 ifDifferentFrom:(id)a6 visitor:(id)a7
{
  int v8 = a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v37 = a3;
  unsigned __int8 v36 = a5;
  id v13 = a6;
  long long v16 = (void (**)(id, void, void *, char *))a7;
  if ((v8 - 31) < 0xE2u)
  {
    id v17 = 0;
  }
  else
  {
    char v35 = 0;
    if (a4 > 0.0)
    {
      *((void *)&v42 + 1) = 0;
      uint64_t v43 = 0;
      *(void *)&long long v42 = (char *)&v42 + 8;
      GEOGloriaPopulateQuadKeysWithinRadiusFromCoordinate(v8, (uint64_t **)&v42, var0, var1, a4, v14, v15);
      if (_quadKeySetsMatch(v13, &v42))
      {
        id v17 = v13;
LABEL_26:
        std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)&v42, *((void **)&v42 + 1));
        goto LABEL_29;
      }
      id v17 = [MEMORY[0x1E4F1CA80] set];
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v43;
        _os_log_debug_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius > 0, looking at %d tiles", buf, 8u);
      }
      char v26 = (void *)v42;
      if ((long long *)v42 == (long long *)((char *)&v42 + 8)) {
        goto LABEL_26;
      }
      while (1)
      {
        if (_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, v26[4]))
        {
          int v27 = [NSNumber numberWithUnsignedLongLong:v26[4]];
          [v17 addObject:v27];

          if (!v35)
          {
            uint64_t v28 = [(GEOGloriaDB *)self dataForQuadKey:v26[4]];
            uint64_t v29 = self->_log;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v33 = v26[4];
              *(_DWORD *)buf = 134218241;
              std::string v39 = v28;
              __int16 v40 = 2049;
              uint64_t v41 = v33;
              _os_log_debug_impl(&dword_188D96000, v29, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Got data %p quad key %{private}lld", buf, 0x16u);
              if (!v28) {
                goto LABEL_17;
              }
LABEL_16:
              v16[2](v16, v26[4], v28, &v35);

              goto LABEL_17;
            }
            if (v28) {
              goto LABEL_16;
            }
          }
        }
LABEL_17:
        unint64_t v30 = (void *)v26[1];
        if (v30)
        {
          do
          {
            long long v31 = v30;
            unint64_t v30 = (void *)*v30;
          }
          while (v30);
        }
        else
        {
          do
          {
            long long v31 = (_OWORD *)v26[2];
            BOOL v32 = *(void *)v31 == (void)v26;
            char v26 = v31;
          }
          while (!v32);
        }
        char v26 = v31;
        if (v31 == (long long *)((char *)&v42 + 8)) {
          goto LABEL_26;
        }
      }
    }
    gloria::TileId::FromLatLng((gloria::TileId *)&v37, &v37.var1, (const double *)&v36, v15);
    uint64_t v20 = v19 | gloria::LEADING_BITS_VALUE_LUT[v18];
    BOOL v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v42) = 134283521;
      *(void *)((char *)&v42 + 4) = v20;
      _os_log_debug_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius 0, looking at exact tile only for key %{private}llu", (uint8_t *)&v42, 0xCu);
    }
    v22 = [(GEOGloriaDB *)self dataForQuadKey:v20];
    if (v22)
    {
      v16[2](v16, v20, v22, &v35);
      long long v23 = (void *)MEMORY[0x1E4F1CAD0];
      char v24 = [NSNumber numberWithUnsignedLongLong:v20];
      id v17 = [v23 setWithObject:v24];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
LABEL_29:

  return v17;
}

- (BOOL)enumerateDataAtLocation:(id)a3 radius:(double)a4 visitor:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  Class metadataClass = self->_metadataClass;
  if (metadataClass != (Class)objc_opt_class())
  {
    char v13 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = [(GEOGloriaDB *)self metadata];
  id v12 = v11;
  if (!v11 || !v11[2])
  {
    char v13 = 0;
    goto LABEL_18;
  }
  std::string __p = 0;
  BOOL v32 = 0;
  uint64_t v33 = 0;
  char v13 = GEOGloriaPopulateAvailableZoomRange(v11, (unint64_t *)&__p);
  if (v13)
  {
    uint64_t v14 = v32;
    if (v32 == __p)
    {
      char v13 = 0;
      if (!v32) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__GEOGloriaDB_enumerateDataAtLocation_radius_visitor___block_invoke;
    v24[3] = &unk_1E53DB6C0;
    id v25 = v9;
    char v26 = &v27;
    uint64_t v15 = (void *)MEMORY[0x18C120660](v24);
    id v17 = (char *)v32;
    if (__p != v32)
    {
      unsigned __int8 v18 = (char *)__p + 1;
      *(void *)&long long v16 = 67109120;
      long long v23 = v16;
      do
      {
        uint64_t v19 = *(v18 - 1);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v23;
          int v35 = v19;
          _os_log_debug_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Checking zoom %d", buf, 8u);
        }
        -[GEOGloriaDB enumerateDataAtLocation:radius:zoom:visitor:](self, "enumerateDataAtLocation:radius:zoom:visitor:", v19, v15, var0, var1, a4, v23);
        if (*((unsigned char *)v28 + 24)) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = v18 == v17;
        }
        ++v18;
      }
      while (!v21);
    }

    _Block_object_dispose(&v27, 8);
  }
  uint64_t v14 = __p;
  if (__p)
  {
LABEL_17:
    BOOL v32 = v14;
    operator delete(v14);
  }
LABEL_18:

LABEL_19:
  return v13;
}

uint64_t __54__GEOGloriaDB_enumerateDataAtLocation_radius_visitor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke(void *a1, uint64_t a2)
{
  return 1;
}

@end