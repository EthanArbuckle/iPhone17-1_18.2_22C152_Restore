@interface ETOpaqueCopy
- (ETOpaqueCopy)initWithAbstractBlobContainer:(void *)a3;
- (const)getBlob;
- (id).cxx_construct;
@end

@implementation ETOpaqueCopy

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->blob.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (const)getBlob
{
  return &self->blob;
}

- (ETOpaqueCopy)initWithAbstractBlobContainer:(void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ETOpaqueCopy;
  v4 = [(ETOpaqueCopy *)&v11 init];
  v5 = v4;
  v7 = *(abstract_blob_container **)a3;
  uint64_t v6 = *((void *)a3 + 1);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v4->blob.__cntrl_;
  v5->blob.__ptr_ = v7;
  v5->blob.__cntrl_ = (__shared_weak_count *)v6;
  if (cntrl) {
    nitro::nitro_function::nitro_function(cntrl);
  }
  v9 = (std::__shared_weak_count *)*((void *)a3 + 1);
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  if (v9) {
    nitro::nitro_function::nitro_function(v9);
  }
  return v5;
}

@end