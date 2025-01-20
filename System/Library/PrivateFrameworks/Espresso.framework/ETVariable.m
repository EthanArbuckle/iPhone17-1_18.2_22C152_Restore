@interface ETVariable
- (ETModelDef)model;
- (ETVariable)initWithModelDef:(id)a3;
- (NSString)layerName;
- (NSString)name;
- (float)initializationAlpha;
- (float)initializationBeta;
- (id)copyData;
- (id)getOpaqueCopy;
- (id)swapWithOpaqueCopy:(id)a3;
- (unint64_t)initializationMode;
- (unint64_t)kind;
- (void)setInitializationAlpha:(float)a3;
- (void)setInitializationBeta:(float)a3;
- (void)setInitializationMode:(unint64_t)a3;
- (void)setKind:(unint64_t)a3;
- (void)setLayerName:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation ETVariable

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_layerName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setModel:(id)a3
{
}

- (ETModelDef)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);

  return (ETModelDef *)WeakRetained;
}

- (void)setInitializationBeta:(float)a3
{
  self->_initializationBeta = a3;
}

- (float)initializationBeta
{
  return self->_initializationBeta;
}

- (void)setInitializationAlpha:(float)a3
{
  self->_initializationAlpha = a3;
}

- (float)initializationAlpha
{
  return self->_initializationAlpha;
}

- (void)setInitializationMode:(unint64_t)a3
{
  self->_initializationMode = a3;
}

- (unint64_t)initializationMode
{
  return self->_initializationMode;
}

- (void)setLayerName:(id)a3
{
}

- (NSString)layerName
{
  return self->_layerName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (id)swapWithOpaqueCopy:(id)a3
{
  id v4 = a3;
  v5 = (uint64_t *)[v4 getBlob];
  v6 = (std::__shared_weak_count *)v5[1];
  v18[0] = *v5;
  v18[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v7 = [(ETVariable *)self model];
  v8 = v7;
  if (v7)
  {
    [v7 network];
    uint64_t v9 = v14;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v14 = 0;
    v15 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)self->_name UTF8String]);
  Espresso::net::swap_global(v9, (long long *)__p, v18, &v16);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v15) {
    nitro::nitro_function::nitro_function(v15);
  }

  v10 = [[ETOpaqueCopy alloc] initWithAbstractBlobContainer:&v16];
  if (v17) {
    nitro::nitro_function::nitro_function(v17);
  }
  if (v6) {
    nitro::nitro_function::nitro_function(v6);
  }

  return v10;
}

- (id)getOpaqueCopy
{
  v3 = [(ETVariable *)self model];
  id v4 = v3;
  if (v3)
  {
    [v3 network];
    uint64_t v5 = v11;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v11 = 0;
    v12 = 0;
  }
  id v6 = [(ETVariable *)self name];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  Espresso::net::sync_copy_global(v5, (unsigned __int8 *)__p, &v13);
  if (v10 < 0) {
    operator delete(__p[0]);
  }

  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }

  v7 = [[ETOpaqueCopy alloc] initWithAbstractBlobContainer:&v13];
  if (v14) {
    nitro::nitro_function::nitro_function(v14);
  }

  return v7;
}

- (id)copyData
{
  v3 = [(ETVariable *)self model];
  id v4 = v3;
  if (v3)
  {
    [v3 network];
    uint64_t v5 = v16;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v16 = 0;
    v17 = 0;
  }
  id v6 = [(ETVariable *)self name];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v6 UTF8String]);
  Espresso::net::get_global(&v18, v5, (unsigned __int8 *)&__p);
  if (v15 < 0) {
    operator delete(__p);
  }

  if (v17) {
    nitro::nitro_function::nitro_function(v17);
  }

  __p = 0;
  uint64_t v14 = 0;
  v7 = v19;
  v12[0] = v18;
  v12[1] = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::sync_copy_to_host(v12, (uint64_t)&__p);
  if (v7) {
    nitro::nitro_function::nitro_function(v7);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *((int *)__p + 2);
  do
  {
    v9 *= *(int *)((char *)__p + v8 + 12);
    v8 += 4;
  }
  while (v8 != 12);
  char v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*((void *)__p + 3) length:4 * v9];
  if (v14) {
    nitro::nitro_function::nitro_function(v14);
  }
  if (v7) {
    nitro::nitro_function::nitro_function(v7);
  }
  return v10;
}

- (void)updateWithData:(id)a3
{
  void (***v18)(uint64_t *__return_ptr, void);
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  void *__p[2];
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;

  id v4 = a3;
  uint64_t v5 = [(ETVariable *)self model];
  id v6 = v5;
  if (v5)
  {
    [v5 network];
    uint64_t v7 = v19;
  }
  else
  {
    uint64_t v7 = 0;
    v19 = 0;
    v20 = 0;
  }
  id v8 = [(ETVariable *)self name];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
  Espresso::net::get_global(&v21, v7, (unsigned __int8 *)__p);
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[0]);
  }

  if (v20) {
    nitro::nitro_function::nitro_function(v20);
  }

  uint64_t v9 = v21;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v21 + 56))(&v19, v21);
  char v10 = *(void **)(v19 + 24);
  id v11 = v4;
  v12 = (const void *)[v11 bytes];
  uint64_t v13 = 0;
  uint64_t v14 = *(int *)(v19 + 8);
  do
  {
    v14 *= *(int *)(v19 + 12 + v13);
    v13 += 4;
  }
  while (v13 != 12);
  memcpy(v10, v12, 4 * v14);
  char v15 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v16 = v19;
  v17 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v18 = *(void (****)(uint64_t *__return_ptr, void))(v9 + 72);
  __p[0] = (void *)MEMORY[0x1E4F143A8];
  __p[1] = (void *)3321888768;
  v24 = ___ZN8Espresso19sync_copy_from_hostENSt3__110shared_ptrINS_23abstract_blob_containerEEENS1_INS_4blobIfLi4EEEEE_block_invoke_13442;
  v25 = &__block_descriptor_64_ea8_32c62_ZTSNSt3__110shared_ptrIN8Espresso23abstract_blob_containerEEE48c49_ZTSNSt3__110shared_ptrIN8Espresso4blobIfLi4EEEEE_e10_v16__0r_v8l;
  v26 = v9;
  v27 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v28 = v16;
  v29 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::abstract_context::compute_batch_sync(v18, __p);
  if (v29) {
    nitro::nitro_function::nitro_function(v29);
  }
  if (v27) {
    nitro::nitro_function::nitro_function(v27);
  }
  if (v17) {
    nitro::nitro_function::nitro_function(v17);
  }
  if (v15) {
    nitro::nitro_function::nitro_function(v15);
  }
  if (v20) {
    nitro::nitro_function::nitro_function(v20);
  }
  if (v15) {
    nitro::nitro_function::nitro_function(v15);
  }
}

- (ETVariable)initWithModelDef:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ETVariable;
  uint64_t v5 = [(ETVariable *)&v7 init];
  [(ETVariable *)v5 setModel:v4];
  [(ETVariable *)v5 setInitializationMode:0];

  return v5;
}

@end