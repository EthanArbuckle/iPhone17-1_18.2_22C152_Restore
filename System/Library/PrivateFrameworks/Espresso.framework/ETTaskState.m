@interface ETTaskState
- (ETTaskState)initWithBlobMap:(void *)a3;
- (ETTaskState)initWithNetwork:(shared_ptr<Espresso::net>)a3;
- (id).cxx_construct;
- (shared_ptr<Espresso::net>)networkPointer;
- (unordered_map<std::string,)blobs;
- (void)setBlobs:()unordered_map<std:()std:()4>> :()std:()std:(std:()std:(4>>>>> *)a3 :shared_ptr<Espresso::blob<float :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> shared_ptr<Espresso::blob<float :string;
- (void)setNetworkPointer:(shared_ptr<Espresso::net>)a3;
@end

@implementation ETTaskState

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::~__hash_table((uint64_t)&self->_blobs);
  cntrl = self->_networkPointer.__cntrl_;
  if (cntrl)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (void)setNetworkPointer:(shared_ptr<Espresso::net>)a3
{
}

- (shared_ptr<Espresso::net>)networkPointer
{
  objc_copyCppObjectAtomic(v2, &self->_networkPointer, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__1);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setBlobs:()unordered_map<std:()std:()4>> :()std:()std:(std:()std:(4>>>>> *)a3 :shared_ptr<Espresso::blob<float :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> shared_ptr<Espresso::blob<float :string
{
}

- (unordered_map<std::string,)blobs
{
  objc_copyCppObjectAtomic(retstr, &self->_blobs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__4790);
  return result;
}

- (ETTaskState)initWithNetwork:(shared_ptr<Espresso::net>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)ETTaskState;
  v4 = [(ETTaskState *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(net **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_networkPointer.__cntrl_;
    v5->_networkPointer.__ptr_ = v7;
    v5->_networkPointer.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      nitro::nitro_function::nitro_function(cntrl);
    }
  }
  return v5;
}

- (ETTaskState)initWithBlobMap:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ETTaskState;
  v4 = [(ETTaskState *)&v8 init];
  p_blobs = &v4->_blobs;
  if (v4) {
    BOOL v6 = p_blobs == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v4->_blobs.__table_.__p3_.__value_ = *((float *)a3 + 8);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,void *> *>>(p_blobs, *((uint64_t **)a3 + 2));
  }
  return v4;
}

@end